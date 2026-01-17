---
layout: archive
title: "Software Engineering"
permalink: /categories/software-engineering/
author_profile: false
---

{% assign posts = site.categories['Software Engineering'] %}
{% for post in posts %}
  {% include archive-single.html %}
{% endfor %}

