---
layout: single
title: "Categories"
permalink: /categories/
author_profile: false
---

<style>
.category-list {
  list-style: none;
  padding: 0;
}

.category-item {
  margin: 15px 0;
  padding: 15px 20px;
  border: 1px solid #e8e8e8;
  border-radius: 4px;
  background-color: #f9f9f9;
  transition: all 0.2s;
}

.category-item:hover {
  background-color: #f0f0f0;
  border-color: #2e7d32;
  box-shadow: 0 2px 4px rgba(0,0,0,0.1);
}

.category-item a {
  text-decoration: none;
  color: #2e7d32;
  font-size: 1.2em;
  font-weight: 500;
  display: flex;
  justify-content: space-between;
  align-items: center;
}

.category-item a:hover {
  color: #1e5e22;
}

.category-count {
  color: #666;
  font-size: 0.9em;
  font-weight: normal;
}
</style>

<h1>Browse by Category</h1>
<p>Click on a category to see all posts in that category.</p>

<ul class="category-list">
  {% assign categories = site.categories | sort %}
  {% for category in categories %}
    {% assign category_slug = category[0] | downcase | replace: ' ', '-' | replace: '(', '' | replace: ')', '' | replace: '&', 'and' %}
    {% if category[0] == 'Natural Language Processing (NLP)' %}
      {% assign category_slug = 'natural-language-processing' %}
    {% elsif category[0] == 'MLOps and Coding' %}
      {% assign category_slug = 'mlops-and-coding' %}
    {% elsif category[0] == 'Personal Thoughts' %}
      {% assign category_slug = 'personal-thoughts' %}
    {% elsif category[0] == 'Generative AI' %}
      {% assign category_slug = 'generative-ai' %}
    {% elsif category[0] == 'Machine Learning' %}
      {% assign category_slug = 'machine-learning' %}
    {% elsif category[0] == 'Linear Algebra' %}
      {% assign category_slug = 'linear-algebra' %}
    {% elsif category[0] == 'Software Engineering' %}
      {% assign category_slug = 'software-engineering' %}
    {% endif %}
    <li class="category-item">
      <a href="/categories/{{ category_slug }}/">
        {{ category[0] }}
        <span class="category-count">{{ category[1] | size }} posts</span>
      </a>
    </li>
  {% endfor %}
</ul>

