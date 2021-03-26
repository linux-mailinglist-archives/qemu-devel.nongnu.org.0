Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3484B34AF59
	for <lists+qemu-devel@lfdr.de>; Fri, 26 Mar 2021 20:30:00 +0100 (CET)
Received: from localhost ([::1]:60064 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lPs9e-0000If-Nt
	for lists+qemu-devel@lfdr.de; Fri, 26 Mar 2021 15:29:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50066)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1lPs8E-0007vx-79
 for qemu-devel@nongnu.org; Fri, 26 Mar 2021 15:28:30 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:25760)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1lPs8B-0004Am-3N
 for qemu-devel@nongnu.org; Fri, 26 Mar 2021 15:28:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1616786905;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=3/7B02DEWjEtfHXx8HUU/jstcJEG/UcWaZ1UUc5eIrs=;
 b=gIk3AiPCkPmcAmx9ScS0x6XAVKiDj/0McgtY8+VCfiNeRQPbcT53JLeblJ1/a01P3VBx1U
 i9aWPrzVmsJaJl4QZ6nHlU1li5Xrolrvk7Nc/NaniGKLjvdaV9riPLYH6V12w47OmkPxT+
 yz0k71Tdk/EQUVSQj1ytjsp11RsUf1w=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-560-8KpryR9uMna6-ze8FwJblg-1; Fri, 26 Mar 2021 15:28:21 -0400
X-MC-Unique: 8KpryR9uMna6-ze8FwJblg-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5605010A8719;
 Fri, 26 Mar 2021 19:28:10 +0000 (UTC)
Received: from [10.10.117.181] (ovpn-117-181.rdu2.redhat.com [10.10.117.181])
 by smtp.corp.redhat.com (Postfix) with ESMTP id B67005C541;
 Fri, 26 Mar 2021 19:28:09 +0000 (UTC)
Subject: Re: [PATCH v5] sphinx: adopt kernel readthedoc theme
To: marcandre.lureau@redhat.com, qemu-devel@nongnu.org
References: <20210323115328.4146052-1-marcandre.lureau@redhat.com>
From: John Snow <jsnow@redhat.com>
Message-ID: <37fc3214-9979-79d7-bfaa-9a5dea2f2676@redhat.com>
Date: Fri, 26 Mar 2021 15:28:09 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210323115328.4146052-1-marcandre.lureau@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: peter.maydell@linaro.org, berrange@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/23/21 7:53 AM, marcandre.lureau@redhat.com wrote:
> From: Marc-André Lureau <marcandre.lureau@redhat.com>
> 
> The default "alabaster" sphinx theme has a couple shortcomings:
> - the navbar moves along the page
> - the search bar is not always at the same place
> - it lacks some contrast and colours
> 
> The "rtd" theme from readthedocs.org is a popular third party theme used
> notably by the kernel, with a custom style sheet. I like it better,
> perhaps others do too. It also simplifies the "Edit on Gitlab" links.
> 
> Tweak a bit the custom theme to match qemu.org style, use the
> QEMU logo, and favicon etc.
> 
> Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
> Tested-by: Bin Meng <bmeng.cn@gmail.com>

Looks good in my opinion! I think it's definitely simpler to not try and 
maintain two themes to mixed results.

Reviewed-by: John Snow <jsnow@redhat.com>

> ---
> v5:
>   - raise an error if rtd theme is missing (also at configure time)
>   - commit message tweaks
> 
>   docs/_templates/editpage.html              |   5 -
>   docs/conf.py                               |  51 ++++---
>   docs/devel/_templates/editpage.html        |   5 -
>   docs/interop/_templates/editpage.html      |   5 -
>   docs/meson.build                           |   5 +-
>   docs/specs/_templates/editpage.html        |   5 -
>   docs/sphinx-static/theme_overrides.css     | 161 +++++++++++++++++++++
>   docs/system/_templates/editpage.html       |   5 -
>   docs/tools/_templates/editpage.html        |   5 -
>   docs/user/_templates/editpage.html         |   5 -
>   tests/docker/dockerfiles/debian10.docker   |   1 +
>   tests/docker/dockerfiles/fedora.docker     |   1 +
>   tests/docker/dockerfiles/ubuntu.docker     |   1 +
>   tests/docker/dockerfiles/ubuntu1804.docker |   1 +
>   tests/docker/dockerfiles/ubuntu2004.docker |   1 +
>   15 files changed, 198 insertions(+), 59 deletions(-)
>   delete mode 100644 docs/_templates/editpage.html
>   delete mode 100644 docs/devel/_templates/editpage.html
>   delete mode 100644 docs/interop/_templates/editpage.html
>   delete mode 100644 docs/specs/_templates/editpage.html
>   create mode 100644 docs/sphinx-static/theme_overrides.css
>   delete mode 100644 docs/system/_templates/editpage.html
>   delete mode 100644 docs/tools/_templates/editpage.html
>   delete mode 100644 docs/user/_templates/editpage.html
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
> index 2ee6111872..3802b70d62 100644
> --- a/docs/conf.py
> +++ b/docs/conf.py
> @@ -150,38 +150,47 @@
>   # The theme to use for HTML and HTML Help pages.  See the documentation for
>   # a list of builtin themes.
>   #
> -html_theme = 'alabaster'
> +try:
> +    import sphinx_rtd_theme
> +except ImportError:
> +    raise ConfigError(
> +        'The Sphinx \'sphinx_rtd_theme\' HTML theme was not found.\n'
> +    )
> +
> +html_theme = 'sphinx_rtd_theme'
>   

Try using ModuleNotFoundError here, just in case. ImportError will also 
catch stuff like when the module *is* found, but breaks for other 
reasons, and may obscure the underlying reason, depending.

(Don't worry about it if there's no reason to re-spin, though, I think 
it's an extremely minor point. My RB is with or without the change.)

--js


Off-topic: Do you know how we go about enabling the version drop-down on 
the RTD site so we can refer back to older documents?


