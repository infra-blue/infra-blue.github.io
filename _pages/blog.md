---
title: "Blog posts"
intro:
layout: pages
classes: wide
author_profile: true

permalink: /blog/

pagination:
  enabled: true
  collection: 'posts'
  per_page: 5
  sort_field: 'date'
  sort_reverse: true
  category: blog
  permalink: '/blog/:num/'
  title: ':title - page :num'
  trail:
    before: 3
    after: 3
sidebar:
  nav: site
---
{% include feature_row id="intro" %}