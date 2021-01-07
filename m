Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D73D2ECDD2
	for <lists+qemu-devel@lfdr.de>; Thu,  7 Jan 2021 11:31:59 +0100 (CET)
Received: from localhost ([::1]:40716 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kxSaE-00044f-7K
	for lists+qemu-devel@lfdr.de; Thu, 07 Jan 2021 05:31:58 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42104)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1kxSXK-0002nX-AM
 for qemu-devel@nongnu.org; Thu, 07 Jan 2021 05:28:58 -0500
Received: from mail-ej1-x62c.google.com ([2a00:1450:4864:20::62c]:43814)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1kxSXI-0000h5-Fd
 for qemu-devel@nongnu.org; Thu, 07 Jan 2021 05:28:58 -0500
Received: by mail-ej1-x62c.google.com with SMTP id jx16so8921766ejb.10
 for <qemu-devel@nongnu.org>; Thu, 07 Jan 2021 02:28:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=IPTmgu0eFjM8zv6QdX5i7nCQ6o7MFD4tlXneoSbIYKE=;
 b=EPiQbrKSaxaI3w2JKpntWKL09BlBu2DcOBkGd+SwO51MeEwQoxHzXDVXPAJ9BS1bvz
 WkpWumKfqTKcGp+yZxkjobbl8RNS+HPEbw99mNMNUNhkA+lyF3aYuqsXCGw6l4UsDYmv
 9o/bwOyqFvlWmah03drQsR20W7srfyAD8HekgmCHb/muNkoXLpsO5SWX9UZupcTCs3YV
 ogc5C3/ARHcz28xRjcSzlypS7/+99HwCDm1WfOHEoQjpZ4L8URaDyn/tba/hg+Ag0/h6
 M2Ywy3y8SHmOI7FI00I8a3fWzzjCNjj5omIpitTjpWtOhwOm3aAroN/KXYRdaA2Hgo3d
 mgXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=IPTmgu0eFjM8zv6QdX5i7nCQ6o7MFD4tlXneoSbIYKE=;
 b=LniJp/exJ7PPlxEGC3yf5eq5grQSuzXrA2vIxIoeNSpsMl+XiOI8o8zTIQJap17QCP
 0+rC1rFiy2u3+LZwCbjuewSFNbW9SG7Bk8zd4gi+JdznbQ8wtb6r6Msj/pdM7fvwdPik
 QoGH9myHaOdNo2wBw3HeC1zxsycD/exqAqcSwfykIEaLHYU5ONpa4HztRzd5kg+kx96j
 DnWK3eUjTTcRggiBqnZhTiZaZk/WwB408zLcK1AxUt0yojumcFUzsD3JrsTpyPr8teaR
 85AGS52RNPrIB/UM6fhE7XY+IXkpfS8tQaopmoN/zThKoPEVko77p6fsptXjM0mzPEDP
 wmuA==
X-Gm-Message-State: AOAM530qifNvoJ5NMkHt5hNSIRI67GVFsvE/F1VRQ/G5AaLaBT9eCWFB
 kQzZ119SHKpmrpJECJ0JeQC4a/twoxVDaGJloes=
X-Google-Smtp-Source: ABdhPJzR/N3mLtr8kjZbBL9hMubpld7vaz51AmoQ0LCzQXG919dacVg/xY1UwPOPnsOS6Xbv1NjkX8ump/fWnlwgdbg=
X-Received: by 2002:a17:906:17d5:: with SMTP id
 u21mr5793502eje.109.1610015335063; 
 Thu, 07 Jan 2021 02:28:55 -0800 (PST)
MIME-Version: 1.0
References: <20210107101919.80-1-luoyonggang@gmail.com>
 <20210107101919.80-6-luoyonggang@gmail.com>
In-Reply-To: <20210107101919.80-6-luoyonggang@gmail.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Date: Thu, 7 Jan 2021 14:28:43 +0400
Message-ID: <CAJ+F1C+q9e08zX9OqkS4294oCNBAf-Gs7L9AomtYrc7vKyqCEA@mail.gmail.com>
Subject: Re: [PATCH v4 5/5] whpx: move whpx_lapic_state from header to c file
To: Yonggang Luo <luoyonggang@gmail.com>
Content-Type: multipart/alternative; boundary="00000000000021272705b84ce8eb"
Received-SPF: pass client-ip=2a00:1450:4864:20::62c;
 envelope-from=marcandre.lureau@gmail.com; helo=mail-ej1-x62c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
 Sunil Muthuswamy <sunilmut@microsoft.com>, Ed Maste <emaste@freebsd.org>,
 QEMU <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--00000000000021272705b84ce8eb
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi

On Thu, Jan 7, 2021 at 2:26 PM Yonggang Luo <luoyonggang@gmail.com> wrote:

> This struct only used in whpx-apic.c, there is no need
> expose it in whpx.h.
>
> Signed-off-by: Yonggang Luo <luoyonggang@gmail.com>
>

Similar patch pending:
https://patchew.org/QEMU/20201219090637.1700900-1-pbonzini@redhat.com/20201=
219090637.1700900-3-pbonzini@redhat.com/

---
>  include/sysemu/whpx.h        | 7 -------
>  target/i386/whpx/whpx-apic.c | 7 +++++++
>  2 files changed, 7 insertions(+), 7 deletions(-)
>
> diff --git a/include/sysemu/whpx.h b/include/sysemu/whpx.h
> index 4f38784d7e..bfbcaa25d8 100644
> --- a/include/sysemu/whpx.h
> +++ b/include/sysemu/whpx.h
> @@ -25,13 +25,6 @@ struct whpx_state {
>      bool apic_in_platform;
>  };
>
> -struct whpx_lapic_state {
> -    struct {
> -        uint32_t data;
> -        uint32_t padding[3];
> -    } fields[256];
> -};
> -
>  extern struct whpx_state whpx_global;
>  int whpx_enabled(void);
>
> diff --git a/target/i386/whpx/whpx-apic.c b/target/i386/whpx/whpx-apic.c
> index b127a3cb8a..dd60fb0996 100644
> --- a/target/i386/whpx/whpx-apic.c
> +++ b/target/i386/whpx/whpx-apic.c
> @@ -20,6 +20,13 @@
>  #include "sysemu/whpx.h"
>  #include "whp-dispatch.h"
>
> +struct whpx_lapic_state {
> +    struct {
> +        uint32_t data;
> +        uint32_t padding[3];
> +    } fields[256];
> +};
> +
>  static void whpx_put_apic_state(APICCommonState *s,
>                                  struct whpx_lapic_state *kapic)
>  {
> --
> 2.29.2.windows.3
>
>
>

--=20
Marc-Andr=C3=A9 Lureau

--00000000000021272705b84ce8eb
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hi<br></div><br><div class=3D"gmail_quote"><div dir=
=3D"ltr" class=3D"gmail_attr">On Thu, Jan 7, 2021 at 2:26 PM Yonggang Luo &=
lt;<a href=3D"mailto:luoyonggang@gmail.com">luoyonggang@gmail.com</a>&gt; w=
rote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0p=
x 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">This struc=
t only used in whpx-apic.c, there is no need<br>
expose it in whpx.h.<br>
<br>
Signed-off-by: Yonggang Luo &lt;<a href=3D"mailto:luoyonggang@gmail.com" ta=
rget=3D"_blank">luoyonggang@gmail.com</a>&gt;<br></blockquote><div><br></di=
v><div>Similar patch pending:<br></div><div><a href=3D"https://patchew.org/=
QEMU/20201219090637.1700900-1-pbonzini@redhat.com/20201219090637.1700900-3-=
pbonzini@redhat.com/">https://patchew.org/QEMU/20201219090637.1700900-1-pbo=
nzini@redhat.com/20201219090637.1700900-3-pbonzini@redhat.com/</a></div><di=
v> <br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px =
0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
---<br>
=C2=A0include/sysemu/whpx.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 | 7 -------<br>
=C2=A0target/i386/whpx/whpx-apic.c | 7 +++++++<br>
=C2=A02 files changed, 7 insertions(+), 7 deletions(-)<br>
<br>
diff --git a/include/sysemu/whpx.h b/include/sysemu/whpx.h<br>
index 4f38784d7e..bfbcaa25d8 100644<br>
--- a/include/sysemu/whpx.h<br>
+++ b/include/sysemu/whpx.h<br>
@@ -25,13 +25,6 @@ struct whpx_state {<br>
=C2=A0 =C2=A0 =C2=A0bool apic_in_platform;<br>
=C2=A0};<br>
<br>
-struct whpx_lapic_state {<br>
-=C2=A0 =C2=A0 struct {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 uint32_t data;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 uint32_t padding[3];<br>
-=C2=A0 =C2=A0 } fields[256];<br>
-};<br>
-<br>
=C2=A0extern struct whpx_state whpx_global;<br>
=C2=A0int whpx_enabled(void);<br>
<br>
diff --git a/target/i386/whpx/whpx-apic.c b/target/i386/whpx/whpx-apic.c<br=
>
index b127a3cb8a..dd60fb0996 100644<br>
--- a/target/i386/whpx/whpx-apic.c<br>
+++ b/target/i386/whpx/whpx-apic.c<br>
@@ -20,6 +20,13 @@<br>
=C2=A0#include &quot;sysemu/whpx.h&quot;<br>
=C2=A0#include &quot;whp-dispatch.h&quot;<br>
<br>
+struct whpx_lapic_state {<br>
+=C2=A0 =C2=A0 struct {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 uint32_t data;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 uint32_t padding[3];<br>
+=C2=A0 =C2=A0 } fields[256];<br>
+};<br>
+<br>
=C2=A0static void whpx_put_apic_state(APICCommonState *s,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0struct whpx_lapic_state *kapic=
)<br>
=C2=A0{<br>
-- <br>
2.29.2.windows.3<br>
<br>
<br>
</blockquote></div><br clear=3D"all"><br>-- <br><div dir=3D"ltr" class=3D"g=
mail_signature">Marc-Andr=C3=A9 Lureau<br></div></div>

--00000000000021272705b84ce8eb--

