require 'uri'
require 'rocco'
require 'redcarpet'


# expects fname to be in owner/repo/fname # TKTKTK
def github_filepath(fname)
  "http://github.com/TK/#{File.basename fname}"
end


def page_title
  title = site_title #Set site title here

  if data.page.title
    title << " | " + data.page.title
  end

  title
end

def page_description
  description = "A Static Site Generator" # Set site description here

  if data.page.description
    description = data.page.description
  end

  description
end

def page_keywords
  keywords = [] # Set site keywords here

  if data.page.keywords
    keywords.concat(data.page.keywords)
  end

  keywords.uniq.join(", ")
end


def project_filepath(fpath)
  config[:root_project_dir].join fpath
end

def project_rocco_html(fpath)
  f = project_filepath(fpath)
  html = rocco_html(f, [github_filepath(fpath)])

  return html
end

def rocco_html(fname, sources=[], opts={})
  opts[:stylesheet] ||= nil
  opts[:template_file] ||= config[:rocco_template_file]
  r = Rocco.new(fname, sources, opts)

  return r.to_html
end

def ref_link_to(ref_object, link_to_opts = {})
  url = ref_object.url

  if url.present?
    if url =~ %r{github.com/(\w+/\w+)/?$}
      title ||= $1
    else
      title = ref_object.title || url
    end

    begin
      uri = URI.parse(url)      
    rescue => err
      host = url
    else
      host = uri.host
    end

    return "#{link_to(title, url, link_to_opts)} #{ref_object.blurb} [#{link_to(host, url, link_to_opts)}]"
  else
    return ""
  end
end


def site_title
  config[:title]
end


def book_lessons
  sitemap.resources.select{|r| r.path =~ /book\/lessons/}.sort_by{|s| s.path}.
    select{|r| r.data.publish == true }
end


def book_sections
  h = Hash.new{|h,k| h[k] = [] }
  
  book_lessons.inject(h) do |hsh, lesson|
    subdir = lesson.path[%r{(?<=book/lessons/)[\w\-]+?(?=/)}]
    hsh[subdir] << lesson

    hsh
  end
end


def lesson_path(normal_path)
  slug = File.basename(normal_path, '.html').sub(/^\d+-/, '')

  return "/lessons/#{slug}"
end


def make_markdown(str)
  Kramdown::Document.new(str.to_s).to_html
end
