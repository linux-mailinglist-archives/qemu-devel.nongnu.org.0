Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DB71345BE1
	for <lists+qemu-devel@lfdr.de>; Tue, 23 Mar 2021 11:28:26 +0100 (CET)
Received: from localhost ([::1]:53352 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lOeGu-0005nA-PW
	for lists+qemu-devel@lfdr.de; Tue, 23 Mar 2021 06:28:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41818)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1lOeG2-0005MH-6r
 for qemu-devel@nongnu.org; Tue, 23 Mar 2021 06:27:30 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:34735)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1lOeFy-0003nT-0a
 for qemu-devel@nongnu.org; Tue, 23 Mar 2021 06:27:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1616495244;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=QVMtBttGsyhvNVUCivb3DO1phzQ2tZeqwUqaPGraTyo=;
 b=BP7P6biNSaQjuUYFvHDZ+lkPj1SwE5F7aK2exb1DqCrhU0NoZhk1vIXGE1hp5BIAhecZsf
 9rW2s4eb0L5Pecxg7H7K5nFYyxu/bHMKo9xhCnj6guB2rpKW7Aeopz9StcrALi++TnWG6s
 +d45hGonBFX9X8c1WPXVGbIZhpyjGek=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-94-wNyxgy5NPweM5u67Yx1mcw-1; Tue, 23 Mar 2021 06:27:18 -0400
X-MC-Unique: wNyxgy5NPweM5u67Yx1mcw-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D5600800D53;
 Tue, 23 Mar 2021 10:27:17 +0000 (UTC)
Received: from redhat.com (ovpn-113-223.ams2.redhat.com [10.36.113.223])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 482566E6F5;
 Tue, 23 Mar 2021 10:27:13 +0000 (UTC)
Date: Tue, 23 Mar 2021 10:27:10 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: marcandre.lureau@redhat.com
Subject: Re: [PATCH v4] sphinx: adopt kernel readthedoc theme
Message-ID: <YFnCfhiaixbn7lMy@redhat.com>
References: <20210322105234.3932691-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210322105234.3932691-1-marcandre.lureau@redhat.com>
User-Agent: Mutt/2.0.5 (2021-01-21)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Cc: peter.maydell@linaro.org, bmeng.cn@gmail.com, jsnow@redhat.com,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Mar 22, 2021 at 02:52:34PM +0400, marcandre.lureau@redhat.com wrote:
> From: Marc-André Lureau <marcandre.lureau@redhat.com>
> 
> The default "alabaster" sphinx theme has a couple shortcomings:
> - the navbar moves along the page
> - the search bar is not always at the same place
> - it lacks some contrast and colours
> 
> The "rtd" theme from readthedocs.org is a popular third party theme used
> notably by the kernel, with a custom style sheet. I like it better,
> perhaps others do too. It also simplify "Edit on Gitlab" links.

s/simplify/simplifies the/

> 
> Tweak a bit the custom theme to match qemu.org style, use the
> QEMU logo, and favicon etc.
> 
> Screenshot:
> https://i.ibb.co/XWwG1bZ/Screenshot-2021-01-20-Welcome-to-QEMU-s-documentation-QEMU-documentation.png

I'd drop this from the commit message unless you're confident
this link will remain alive indefinitely.

> 
> Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
> Tested-by: Bin Meng <bmeng.cn@gmail.com>
> ---
> v4:
>  - resend (with Bin T-b, and with minor style fixes)
> 
>  docs/_templates/editpage.html              |   5 -
>  docs/conf.py                               |  50 ++++---
>  docs/devel/_templates/editpage.html        |   5 -
>  docs/interop/_templates/editpage.html      |   5 -
>  docs/specs/_templates/editpage.html        |   5 -
>  docs/sphinx-static/theme_overrides.css     | 161 +++++++++++++++++++++
>  docs/system/_templates/editpage.html       |   5 -
>  docs/tools/_templates/editpage.html        |   5 -
>  docs/user/_templates/editpage.html         |   5 -
>  tests/docker/dockerfiles/debian10.docker   |   1 +
>  tests/docker/dockerfiles/fedora.docker     |   1 +
>  tests/docker/dockerfiles/ubuntu.docker     |   1 +
>  tests/docker/dockerfiles/ubuntu1804.docker |   1 +
>  tests/docker/dockerfiles/ubuntu2004.docker |   1 +
>  14 files changed, 196 insertions(+), 55 deletions(-)
>  delete mode 100644 docs/_templates/editpage.html
>  delete mode 100644 docs/devel/_templates/editpage.html
>  delete mode 100644 docs/interop/_templates/editpage.html
>  delete mode 100644 docs/specs/_templates/editpage.html
>  create mode 100644 docs/sphinx-static/theme_overrides.css
>  delete mode 100644 docs/system/_templates/editpage.html
>  delete mode 100644 docs/tools/_templates/editpage.html
>  delete mode 100644 docs/user/_templates/editpage.html
> 
> diff --git a/docs/_templates/editpage.html b/docs/_templates/editpage.html
> deleted file mode 100644
> index 4319b0f5ac..0000000000
> --- a/docs/_templates/editpage.html
> +++ /dev/null
> @@ -1,5 +0,0 @@
> -<div id="editpage">
> -  <ul>
> -    <li><a href="https://gitlab.com/qemu-project/qemu/-/blob/master/docs/{{pagename}}.rst">Page source</a></li>
> -  </ul>
> -</div>
> diff --git a/docs/conf.py b/docs/conf.py
> index 2ee6111872..17e0319d69 100644
> --- a/docs/conf.py
> +++ b/docs/conf.py
> @@ -151,37 +151,47 @@
>  # a list of builtin themes.
>  #
>  html_theme = 'alabaster'
> +try:
> +    import sphinx_rtd_theme
> +    html_theme = 'sphinx_rtd_theme'
> +except ImportError:
> +    sys.stderr.write(
> +        'Warning: The Sphinx \'sphinx_rtd_theme\' HTML theme was not found. '
> +        'Make sure you have the theme installed to produce pretty HTML '
> +        'output. Falling back to the default theme.\n')
>  
>  # Theme options are theme-specific and customize the look and feel of a theme
>  # further.  For a list of options available for each theme, see the
>  # documentation.
> -# We initialize this to empty here, so the per-manual conf.py can just
> -# add individual key/value entries.
> -html_theme_options = {
> -}
> +if html_theme == 'sphinx_rtd_theme':
> +    html_theme_options = {
> +        "style_nav_header_background": "#802400",
> +    }
> +
> +html_logo = os.path.join(qemu_docdir, "../ui/icons/qemu_128x128.png")
> +
> +html_favicon = os.path.join(qemu_docdir, "../ui/icons/qemu_32x32.png")
>  
>  # Add any paths that contain custom static files (such as style sheets) here,
>  # relative to this directory. They are copied after the builtin static files,
>  # so a file named "default.css" will overwrite the builtin "default.css".
> -# QEMU doesn't yet have any static files, so comment this out so we don't
> -# get a warning about a missing directory.
> -# If we do ever add this then it would probably be better to call the
> -# subdirectory sphinx_static, as the Linux kernel does.
> -# html_static_path = ['_static']
> +html_static_path = [os.path.join(qemu_docdir, "sphinx-static")]
> +
> +html_css_files = [
> +    'theme_overrides.css',
> +]

Does this still have a good result in the case where we fall back
to alabaster theme ?

> +
> +html_context = {
> +    "display_gitlab": True,
> +    "gitlab_user": "qemu-project",
> +    "gitlab_repo": "qemu",
> +    "gitlab_version": "master",
> +    "conf_py_path": "/docs/", # Path in the checkout to the docs root
> +}
>  
>  # Custom sidebar templates, must be a dictionary that maps document names
>  # to template names.
> -#
> -# This is required for the alabaster theme
> -# refs: http://alabaster.readthedocs.io/en/latest/installation.html#sidebars
> -html_sidebars = {
> -    '**': [
> -        'about.html',
> -        'editpage.html',
> -        'navigation.html',
> -        'searchbox.html',
> -    ]
> -}

Aren't these still needed when we fall back to the alabaster theme ?

Well the editpage.html can be dropped without real harm, but the
navigation.html looks pretty important to me.

> +#html_sidebars = {}
>  
>  # Don't copy the rST source files to the HTML output directory,
>  # and don't put links to the sources into the output HTML.




Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


