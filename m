Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FE6C5FCB35
	for <lists+qemu-devel@lfdr.de>; Wed, 12 Oct 2022 20:59:52 +0200 (CEST)
Received: from localhost ([::1]:47588 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oigxK-0007GH-J7
	for lists+qemu-devel@lfdr.de; Wed, 12 Oct 2022 14:59:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41148)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wlosh@bsdimp.com>) id 1oigv5-0005RS-R8
 for qemu-devel@nongnu.org; Wed, 12 Oct 2022 14:57:33 -0400
Received: from mail-ej1-x62e.google.com ([2a00:1450:4864:20::62e]:33490)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <wlosh@bsdimp.com>) id 1oigv4-0007HU-5t
 for qemu-devel@nongnu.org; Wed, 12 Oct 2022 14:57:31 -0400
Received: by mail-ej1-x62e.google.com with SMTP id q9so35391635ejd.0
 for <qemu-devel@nongnu.org>; Wed, 12 Oct 2022 11:57:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20210112.gappssmtp.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=lTYXB1oyHkvanGgnmedRC1aEkxFtOzddVtCrZ9sBanA=;
 b=rjnKE6EAINE2GZ5bxryZwiphdwWbwnIYFI5Ygb9XP7/SXrR9dE9gpT6E66VoQ98fFB
 mrIizWEfRopU67UdlCYzZVxtgy7tj/C7CfCPYq3wOG9yvjOc3xVfkAoLiuyNDjA553ig
 Mg9Sytxjw+hq9RS9IGXm+9khmygSnlWOkQRVR4x4i+Q44qMe28dSG3ABF8MfG/totAGa
 YzWHGTCBvOAV3INJDa6nuzyxlKoo0xKdJNGmA+bBy4Q303VyzPS4uJ8qqIZDqY6s/v4n
 AGULbrRV+fWRNaASB8iHXnXCc8/tx1XmqRXCGLJpEDHCMWN/B/cBGWNF+t3VKCtorMd9
 83PQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=lTYXB1oyHkvanGgnmedRC1aEkxFtOzddVtCrZ9sBanA=;
 b=3t/HoQO/ibSkHhevAEMxomfqDMC7kjNJsux0GD81k2FAIBGaG3h/hnxAW5X/EHqy3e
 MBNBvYUdws/U29Z5m3eIbtw5Hzjfs6lpi9TsthOFgX4g859AIhNrQbdOC1ebgB4wJb3b
 DvK9nW+dDrL4I9qAXNPfdeNDmmAYZ6jJwuTncnkMbK5uL9ax4jKurHcqoIkYSTmGNcLT
 xtuWs2Og47SRTgJttxZUWQGW1hEMfe0lOxg4ddu7hDo6hC9PJVWf1GG/TaVK5iCjHUBq
 X15ClY/GMZkR08JvM7/13McxOcoWdgOx0hDD+ZIAPNMAcagINVIjBM9/9PxGmjuNM76g
 fwYw==
X-Gm-Message-State: ACrzQf3wJ8JM1tmice6eXtlB/YR0+EIYe+Oe5F5OS8B3Wcb0oIchv3NU
 IFyuzVxXTFGMURmHzpS6MjRgR6Z1tw0SWAMlMntiiPWtAkc=
X-Google-Smtp-Source: AMsMyM43yk2IbYAjcd89AzlLXMuXRqwGfAA70BdAf4MdzpLCK2Qe03yzPgD60+CY3v9ZXLvnAyPObUF9nVAF3xRMzxE=
X-Received: by 2002:a17:907:1689:b0:78d:e460:1d98 with SMTP id
 hc9-20020a170907168900b0078de4601d98mr6562883ejc.451.1665601047776; Wed, 12
 Oct 2022 11:57:27 -0700 (PDT)
MIME-Version: 1.0
References: <20221012185631.89617-1-imp@bsdimp.com>
In-Reply-To: <20221012185631.89617-1-imp@bsdimp.com>
From: Warner Losh <imp@bsdimp.com>
Date: Wed, 12 Oct 2022 12:57:16 -0600
Message-ID: <CANCZdfpUVhe3i97bZ6VPqnsGQrRxq3jqpt3ufX7T2pOQSiYi=A@mail.gmail.com>
Subject: Re: [PATCH] bsd-user: Catch up with sys/param.h requirement for
 machine/pmap.h
To: qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>,
 John Baldwin <jhb@freebsd.org>, 
 Kyle Evans <kevans@freebsd.org>, Muhammad Moinur Rahman <bofh@freebsd.org>
Content-Type: multipart/alternative; boundary="000000000000ca69eb05eadaf6e9"
Received-SPF: none client-ip=2a00:1450:4864:20::62e;
 envelope-from=wlosh@bsdimp.com; helo=mail-ej1-x62e.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--000000000000ca69eb05eadaf6e9
Content-Type: text/plain; charset="UTF-8"

Note: This is my first patch that someone else wrote that I'm trying to
accept
and land as the bsd-user maintainer unrelated to the other upstreaming work.
Please be let me know if I'm doing something wrong. I'll queue it to this
month's
bsd-user pull request (which likely will only include this patch).

Thanks!

On Wed, Oct 12, 2022 at 12:54 PM Warner Losh <imp@bsdimp.com> wrote:

> From: Muhammad Moinur Rahman <bofh@FreeBSD.org>
>
> Some versions of FreeBSD now require sys/param.h for machine/pmap.h on
> x86. Include them here to meet that requirement. It does no harm on
> older versions, so there's no need to #ifdef it.
>
> Signed-off-by:  Muhammad Moinur Rahman <bofh@FreeBSD.org>
> Reviewed-by:    John Baldwin <jhb@FreeBSD.org>
> Signed-off-by:  Warner Losh <imp@bsdimp.com>
> ---
>  bsd-user/host/i386/host-signal.h   | 1 +
>  bsd-user/host/x86_64/host-signal.h | 1 +
>  2 files changed, 2 insertions(+)
>
> diff --git a/bsd-user/host/i386/host-signal.h
> b/bsd-user/host/i386/host-signal.h
> index 169e61b154c..ffdfaba534a 100644
> --- a/bsd-user/host/i386/host-signal.h
> +++ b/bsd-user/host/i386/host-signal.h
> @@ -9,6 +9,7 @@
>  #ifndef I386_HOST_SIGNAL_H
>  #define I386_HOST_SIGNAL_H
>
> +#include <sys/param.h>
>  #include <sys/ucontext.h>
>  #include <machine/trap.h>
>  #include <vm/pmap.h>
> diff --git a/bsd-user/host/x86_64/host-signal.h
> b/bsd-user/host/x86_64/host-signal.h
> index 47ca19f8814..32ac4e41803 100644
> --- a/bsd-user/host/x86_64/host-signal.h
> +++ b/bsd-user/host/x86_64/host-signal.h
> @@ -9,6 +9,7 @@
>  #ifndef X86_64_HOST_SIGNAL_H
>  #define X86_64_HOST_SIGNAL_H
>
> +#include <sys/param.h>
>  #include <sys/ucontext.h>
>  #include <machine/trap.h>
>  #include <vm/pmap.h>
> --
> 2.33.1
>
>

--000000000000ca69eb05eadaf6e9
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Note: This is my first patch that someone else wrote that =
I&#39;m trying to accept<div>and land as the bsd-user maintainer unrelated =
to the other upstreaming work.</div><div>Please be let me know if I&#39;m d=
oing=C2=A0something wrong. I&#39;ll queue it to this month&#39;s</div><div>=
bsd-user pull request (which likely will only include this patch).</div><di=
v><br></div><div>Thanks!</div></div><br><div class=3D"gmail_quote"><div dir=
=3D"ltr" class=3D"gmail_attr">On Wed, Oct 12, 2022 at 12:54 PM Warner Losh =
&lt;<a href=3D"mailto:imp@bsdimp.com">imp@bsdimp.com</a>&gt; wrote:<br></di=
v><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;borde=
r-left:1px solid rgb(204,204,204);padding-left:1ex">From: Muhammad Moinur R=
ahman &lt;bofh@FreeBSD.org&gt;<br>
<br>
Some versions of FreeBSD now require sys/param.h for machine/pmap.h on<br>
x86. Include them here to meet that requirement. It does no harm on<br>
older versions, so there&#39;s no need to #ifdef it.<br>
<br>
Signed-off-by:=C2=A0 Muhammad Moinur Rahman &lt;bofh@FreeBSD.org&gt;<br>
Reviewed-by:=C2=A0 =C2=A0 John Baldwin &lt;jhb@FreeBSD.org&gt;<br>
Signed-off-by:=C2=A0 Warner Losh &lt;<a href=3D"mailto:imp@bsdimp.com" targ=
et=3D"_blank">imp@bsdimp.com</a>&gt;<br>
---<br>
=C2=A0bsd-user/host/i386/host-signal.h=C2=A0 =C2=A0| 1 +<br>
=C2=A0bsd-user/host/x86_64/host-signal.h | 1 +<br>
=C2=A02 files changed, 2 insertions(+)<br>
<br>
diff --git a/bsd-user/host/i386/host-signal.h b/bsd-user/host/i386/host-sig=
nal.h<br>
index 169e61b154c..ffdfaba534a 100644<br>
--- a/bsd-user/host/i386/host-signal.h<br>
+++ b/bsd-user/host/i386/host-signal.h<br>
@@ -9,6 +9,7 @@<br>
=C2=A0#ifndef I386_HOST_SIGNAL_H<br>
=C2=A0#define I386_HOST_SIGNAL_H<br>
<br>
+#include &lt;sys/param.h&gt;<br>
=C2=A0#include &lt;sys/ucontext.h&gt;<br>
=C2=A0#include &lt;machine/trap.h&gt;<br>
=C2=A0#include &lt;vm/pmap.h&gt;<br>
diff --git a/bsd-user/host/x86_64/host-signal.h b/bsd-user/host/x86_64/host=
-signal.h<br>
index 47ca19f8814..32ac4e41803 100644<br>
--- a/bsd-user/host/x86_64/host-signal.h<br>
+++ b/bsd-user/host/x86_64/host-signal.h<br>
@@ -9,6 +9,7 @@<br>
=C2=A0#ifndef X86_64_HOST_SIGNAL_H<br>
=C2=A0#define X86_64_HOST_SIGNAL_H<br>
<br>
+#include &lt;sys/param.h&gt;<br>
=C2=A0#include &lt;sys/ucontext.h&gt;<br>
=C2=A0#include &lt;machine/trap.h&gt;<br>
=C2=A0#include &lt;vm/pmap.h&gt;<br>
-- <br>
2.33.1<br>
<br>
</blockquote></div>

--000000000000ca69eb05eadaf6e9--

