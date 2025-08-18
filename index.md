---
# Edit theme's home layout instead if you wanna make some changes
# See: https://jekyllrb.com/docs/themes/#overriding-theme-defaults
layout: pages
author_profile: true

header:
  overlay_image: /assets/images/home.jpg
  caption: "Location: **Pantheon**"
excerpt: "You must always act, speak, and think as if that moment were the last of your life."

pagination:
  enabled: true
classes: wide

intro:

feature_row:
  - url: /blog
    image_path: /assets/images/blog.jpg
    title: "BLOG"
    excerpt: "Check out recent blog posts."

feature_row2:
  - url: "resources"
    image_path: /assets/images/resources.jpg
    title: "RESOURCES"
    excerpt: "Learn more about cyber security and technology."

feature_row3:
  - url: "/projects"
    image_path: /assets/images/projects.jpg
    title: "PROJECTS"
    excerpt: "A collection of my projects."

---

{% if paginator.page == 1 %}
  {% include feature_row id="intro"%}

  {% include feature_row id="feature_row" type="right" %}

  {% include feature_row id="feature_row2" type="left" %}

  {% include feature_row id="feature_row3" type="right" %}
{% endif %}