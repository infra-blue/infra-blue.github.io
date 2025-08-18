---
title: "Played CTFs"
intro:
layout: pages
classes: wide
entries_layout: grid
author_profile: true

permalink: /ctf/

pagination:
  enabled: true
  collection: 'posts'
  per_page: 8
  sort_field: 'date'
  sort_reverse: true
  category: ctf
  permalink: '/ctf/:num/'
  title: ':title - page :num'
  trail:
    before: 3
    after: 3
sidebar:
  nav: site
---
{% include feature_row id="intro" %}