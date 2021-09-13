Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C9EB8408572
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Sep 2021 09:37:08 +0200 (CEST)
Received: from localhost ([::1]:50106 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mPgWZ-0001xu-Uu
	for lists+qemu-devel@lfdr.de; Mon, 13 Sep 2021 03:37:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43956)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hsp.cat7@gmail.com>)
 id 1mPgVd-0001IO-Mq
 for qemu-devel@nongnu.org; Mon, 13 Sep 2021 03:36:09 -0400
Received: from mail-ot1-x32f.google.com ([2607:f8b0:4864:20::32f]:46914)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <hsp.cat7@gmail.com>)
 id 1mPgVa-0001jX-ML
 for qemu-devel@nongnu.org; Mon, 13 Sep 2021 03:36:09 -0400
Received: by mail-ot1-x32f.google.com with SMTP id
 c8-20020a9d6c88000000b00517cd06302dso12072998otr.13
 for <qemu-devel@nongnu.org>; Mon, 13 Sep 2021 00:36:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=dmC5Vaz9ux0pL4L+hI3GzYLC4jN+0IT2lDDoMOesOLY=;
 b=LJUM2zpAAByYjtWXwpaHkTT4htw7l2CwYLSlrOzUgr/p3WZR/2+WDMalf/TdCGz+U5
 QgvvNI/WmjwKqE8oTM8AUOqtlPHbSiSeX9ZQPG9pF9xaeGld1jCKvw93NUdnJ28lOxxL
 JO0sKWBNtZLw28pwJ6496jcTY6fJnpA5+707PgsQTeyo75RwEuy1ygZ2kX664AaCcK14
 BTPytYMQR0CB3zOUyy8xIFGj974IoLggWVWlM8R738FfOln6TdQ2vbnR35D27QFNPdp2
 87thhQ6sDumfeQht+6+6wJ2VO8jQzxWC5HPOxigVkC4+i8xb5wZjPm32fhI9s/Ivi0JL
 93HQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=dmC5Vaz9ux0pL4L+hI3GzYLC4jN+0IT2lDDoMOesOLY=;
 b=b995Ld+468cOmIz7DReN0CfIOWr/M0c1PKTKJPFmBCItbkSSz9wJTPzWXwzpxrhWFx
 PAYvlA7nRjLyZuuYfdy4KAjFiXan6iR/FUJERoHGG4CfZD1mqUcB+ZtRnAGcmh8BZScx
 P+CzNe3dhnXrW+biSJp6Op7k6jPRE9OSDbLS3V7NZnRGJLz6a59SOlyKUnfdgK6PaO6S
 V9iZUENEdGl6hzbqm7CwDUMLXfp616N2W/HQTKCmlsv9W2c+BU02NIHC97OtTRVtNOhR
 UUfddAnHDei0vTazPgg+yD8wGOtLQefzNTYOC3+R4lCMnpzgIBGmFScv0un60dy4ex8D
 MZcw==
X-Gm-Message-State: AOAM532j1T3DSwwi2XbLuagbwo9b4NnCwDoWQjP/rjnA3zdR+qj5hl1t
 WcLz0yEi90haOJnYudzIvnfMbO9UIT0YBxdjkOE=
X-Google-Smtp-Source: ABdhPJxpBu9Y0f+ItXWO6uBbZz8kHxNalpSC8Yx67clxwHMimi36Xhd24DCerbMVk+nD1Rbf6Y5MkzrhuDfWbUCLI+4=
X-Received: by 2002:a05:6830:9:: with SMTP id c9mr9147639otp.122.1631518564651; 
 Mon, 13 Sep 2021 00:36:04 -0700 (PDT)
MIME-Version: 1.0
References: <20210913062126.16946-1-thuth@redhat.com>
In-Reply-To: <20210913062126.16946-1-thuth@redhat.com>
From: Howard Spoelstra <hsp.cat7@gmail.com>
Date: Mon, 13 Sep 2021 09:35:52 +0200
Message-ID: <CABLmASGBZs_pxFBx8cW3uVF_gaUuaLE7hMhAy71hN+OZZPqw2A@mail.gmail.com>
Subject: Re: [qemu-web v2 PATCH] Update the information about the required
 version of macOS
To: Thomas Huth <thuth@redhat.com>
Content-Type: multipart/alternative; boundary="0000000000007d950e05cbdb84e7"
Received-SPF: pass client-ip=2607:f8b0:4864:20::32f;
 envelope-from=hsp.cat7@gmail.com; helo=mail-ot1-x32f.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, HTML_MESSAGE=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 qemu-devel qemu-devel <qemu-devel@nongnu.org>,
 Peter Maydell <peter.maydell@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--0000000000007d950e05cbdb84e7
Content-Type: text/plain; charset="UTF-8"

On Mon, Sep 13, 2021 at 8:21 AM Thomas Huth <thuth@redhat.com> wrote:

> The versions that we specify for macOS are way too old already. Let's
> rephrase this without specific version numbers, pointing the users
> to the latest version instead.
>
> Signed-off-by: Thomas Huth <thuth@redhat.com>
> ---
>  v2: Rephrased to be more in sync with docs/about/build-platforms.rst
>
>  _download/macos.md | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
>
> diff --git a/_download/macos.md b/_download/macos.md
> index 06aa811..c55438a 100644
> --- a/_download/macos.md
> +++ b/_download/macos.md
> @@ -6,5 +6,7 @@ QEMU can be installed from <strong>MacPorts</strong>:
>
>  <pre>sudo port install qemu</pre>
>
> -QEMU requires Mac OS X 10.5 or later, but it is recommended
> -to use Mac OS X 10.7 or later.
> +QEMU requires the the most recent macOS version that is currently
> available.
> +Support for the previous version will be dropped two years after the
> current
> +version has been released or when Apple drops support for it, whatever
> comes
> +first.
> --
> 2.27.0
>

Hi,

Nice to see this clarified.
I guess a small typo crept in: "QEMU requires the the most recent macOS
version that is currently available."
Also, is this statement correct when the 2 year previous version(s) are
also supported?
Might I also suggest "version(s)" instead of "version"?

Best,
Howard

--0000000000007d950e05cbdb84e7
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Mon, Sep 13, 2021 at 8:21 AM Thoma=
s Huth &lt;<a href=3D"mailto:thuth@redhat.com">thuth@redhat.com</a>&gt; wro=
te:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px =
0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">The versions=
 that we specify for macOS are way too old already. Let&#39;s<br>
rephrase this without specific version numbers, pointing the users<br>
to the latest version instead.<br>
<br>
Signed-off-by: Thomas Huth &lt;<a href=3D"mailto:thuth@redhat.com" target=
=3D"_blank">thuth@redhat.com</a>&gt;<br>
---<br>
=C2=A0v2: Rephrased to be more in sync with docs/about/build-platforms.rst<=
br>
<br>
=C2=A0_download/macos.md | 6 ++++--<br>
=C2=A01 file changed, 4 insertions(+), 2 deletions(-)<br>
<br>
diff --git a/_download/macos.md b/_download/macos.md<br>
index 06aa811..c55438a 100644<br>
--- a/_download/macos.md<br>
+++ b/_download/macos.md<br>
@@ -6,5 +6,7 @@ QEMU can be installed from &lt;strong&gt;MacPorts&lt;/stron=
g&gt;:<br>
<br>
=C2=A0&lt;pre&gt;sudo port install qemu&lt;/pre&gt;<br>
<br>
-QEMU requires Mac OS X 10.5 or later, but it is recommended<br>
-to use Mac OS X 10.7 or later.<br>
+QEMU requires the the most recent macOS version that is currently availabl=
e.<br>
+Support for the previous version will be dropped two years after the curre=
nt<br>
+version has been released or when Apple drops support for it, whatever com=
es<br>
+first.<br>
-- <br>
2.27.0<br></blockquote><div><br></div><div>Hi, <br></div><div><br></div><di=
v>Nice to see this clarified.<br></div><div>I guess a small typo crept in: =
&quot;QEMU requires the the most recent macOS version that is currently ava=
ilable.&quot;</div><div>Also, is this statement correct when the 2 year pre=
vious version(s) are also supported?<br></div><div>Might I also suggest &qu=
ot;version(s)&quot; instead of &quot;version&quot;?</div><div><br></div><di=
v>Best,</div><div>Howard<br></div></div></div>

--0000000000007d950e05cbdb84e7--

