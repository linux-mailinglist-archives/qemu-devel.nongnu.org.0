Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C83BD2FCD94
	for <lists+qemu-devel@lfdr.de>; Wed, 20 Jan 2021 10:56:30 +0100 (CET)
Received: from localhost ([::1]:60392 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l2AE1-0003Pt-U0
	for lists+qemu-devel@lfdr.de; Wed, 20 Jan 2021 04:56:29 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56128)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1l2ACZ-0002hH-6O
 for qemu-devel@nongnu.org; Wed, 20 Jan 2021 04:54:59 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:27005)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1l2ACX-0005lm-72
 for qemu-devel@nongnu.org; Wed, 20 Jan 2021 04:54:58 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1611136496;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=5vTaqPcix3shu6uZ7qgZiWT8fvyv9kylq9HqUwpBXek=;
 b=diVZPxtyqczJdat2q1GOhv8TSEgYN589SUdf5BCXtmmRIrwU1ctpaG8+0DPikRsDyOatgQ
 B8Q9G30Hu1qNQ4ubbl0ZD5k0R+XBuH65v7QgqY1h0JJpvyR7DS+D9JZ2iBj9RCpSp4OpoD
 6p4RaHSnBwUi4xCAiLrPCxupAaxefMU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-21-rPmKijz3MDGIC4fM-rl7iA-1; Wed, 20 Jan 2021 04:54:53 -0500
X-MC-Unique: rPmKijz3MDGIC4fM-rl7iA-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8A3E359;
 Wed, 20 Jan 2021 09:54:52 +0000 (UTC)
Received: from redhat.com (ovpn-115-126.ams2.redhat.com [10.36.115.126])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 59C706F7E9;
 Wed, 20 Jan 2021 09:54:47 +0000 (UTC)
Date: Wed, 20 Jan 2021 09:54:44 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: marcandre.lureau@redhat.com
Subject: Re: [PATCH v2] RFC: sphinx: adopt kernel readthedoc theme
Message-ID: <20210120095444.GE3015589@redhat.com>
References: <20210120074102.51534-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210120074102.51534-1-marcandre.lureau@redhat.com>
User-Agent: Mutt/1.14.6 (2020-07-11)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.195,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
 qemu-devel@nongnu.org, pbonzini@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Jan 20, 2021 at 11:41:02AM +0400, marcandre.lureau@redhat.com wrote:
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
> 
> Tweak a bit the custom theme to match qemu.org style, use the
> QEMU logo, and favicon etc.
> 
> Screenshot:
> https://i.ibb.co/XWwG1bZ/Screenshot-2021-01-20-Welcome-to-QEMU-s-documentation-QEMU-documentation.png
> 
> Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
> ---
>  docs/_templates/editpage.html          |   5 -
>  docs/conf.py                           |  43 ++++---
>  docs/devel/_templates/editpage.html    |   5 -
>  docs/interop/_templates/editpage.html  |   5 -
>  docs/specs/_templates/editpage.html    |   5 -
>  docs/sphinx-static/theme_overrides.css | 157 +++++++++++++++++++++++++
>  docs/system/_templates/editpage.html   |   5 -
>  docs/tools/_templates/editpage.html    |   5 -
>  docs/user/_templates/editpage.html     |   5 -
>  9 files changed, 181 insertions(+), 54 deletions(-)
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
> index 2ee6111872..2d9e8148a9 100644
> --- a/docs/conf.py
> +++ b/docs/conf.py
> @@ -150,38 +150,43 @@ with open(os.path.join(qemu_docdir, 'defs.rst.inc')) as f:
>  # The theme to use for HTML and HTML Help pages.  See the documentation for
>  # a list of builtin themes.
>  #
> -html_theme = 'alabaster'
> +try:
> +    import sphinx_rtd_theme
> +    html_theme = 'sphinx_rtd_theme'
> +except ImportError:
> +    sys.stderr.write('Warning: The Sphinx \'sphinx_rtd_theme\' HTML theme was not found. Make sure you have the theme installed to produce pretty HTML output. Falling back to the default theme.\n')

Shouldn't we be keeping the html_theme = 'alabaster' to setup the
default theme for fallback ?


Also is this 'rtd' theme packaged in the various distros ? We will need it
added to the package lists in the dockerfiles so it is present for people
by default. Also we'll soon be publishing docs from GitLab CI jobs, so
will need the package in the dockerfiles to make it apply to the live
website.

Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


