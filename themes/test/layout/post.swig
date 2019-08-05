{% extends 'includes/layout.swig' %}

{% block body %}
<header class="blog-post-page-title">
    <h4>{{ page.title }}</h4>
    <time datetime="{{ page.date.toJSON() }}"><i class="fa fa-clock-o"></i>{{ date(page.date) }}</time>
    {# 文章阅读次数 #}
    {% if theme.LeanStatistics_enable==true %}
    <span>
        <i class="fa fa-eye"></i>
        <span id="{{ url_for(page.path) }}" class="views views-post"  title="{{ page.title }}"></span>
    </span>
    {% endif %}
    {# 文章阅读次数 #}
    {# 文章分类 #}
	{% if page.categories and page.categories.length %}
        <span><i class="fa fa-folder-o"></i>
    		{% for categories in page.categories %}
    	       <a href="{{ url_for(categories.path) }}" rel="categories" data-toggle="tooltip" data-placement="top" title="Linux">{{ categories.name }}</a>
    		{% endfor %}
        </span>
	{% endif %}
    {# 文章分类 #}
</header>
<div class="blog-main-post blog-post-page-box">
    <article class="blog-post-block blog-post-page-content">
        <section>
            {% if theme.post_excerpt==true %}
                {{ page.content }}
            {% else %}
                {{ page.more }}
            {% endif %}
        </section>
        <footer class="blog-post-page-tags">
        {# 文章标签 #}
			{% if page.tags and page.tags.length %}
				{% for tag in page.tags %}
			<a href="{{ url_for(tag.path) }}" rel="tag" data-toggle="tooltip" data-placement="top" title="Linux">{{ tag.name }}</a>
				{% endfor %}
			{% endif %}
		{# 文章标签 #}
        </footer>
    </article>
    <article class="blog-post-page-readmore">
    	{# {% include 'includes/pagination.swig' %} #}
    	{# 上一篇 #}
		{% if page.prev_link %}
			<a href="{{ url_for(page.prev_link) }}" class="blog-post-page-readmore-prev" data-toggle="tooltip" data-placement="top" title="{{ page.prev.title }}">上一篇</a>
			{% elif page.prev && page.prev.path %}
			<a href="{{ url_for(page.prev.path) }}" class="blog-post-page-readmore-prev" data-toggle="tooltip" data-placement="top" title="{{ page.prev.title }}">上一篇</a>
		{% endif %}

		{# 下一篇 #}
		{% if page.next_link %}
			<a href="{{ url_for(page.next_link) }}" class="blog-post-page-readmore-next" data-toggle="tooltip" data-placement="top" title="{{ page.next.title }}">下一篇</a>
			{% elif page.next && page.next.path %}
			<a href="{{ url_for(page.next.path) }}" class="blog-post-page-readmore-next" data-toggle="tooltip" data-placement="top" title="{{ page.next.title }}">下一篇</a>
		{% endif %}

        <div style="clear: both;"></div>
    </article>

        {% if theme.gitalk.enable %}
    <%- partial('comment') %>
     {% endif %}

</div>

{% endblock %}
