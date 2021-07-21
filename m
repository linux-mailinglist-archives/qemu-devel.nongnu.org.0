Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DF2D73D0C89
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Jul 2021 12:47:41 +0200 (CEST)
Received: from localhost ([::1]:52206 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m69lM-0008Af-VY
	for lists+qemu-devel@lfdr.de; Wed, 21 Jul 2021 06:47:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55448)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1m69hA-0000pr-QF
 for qemu-devel@nongnu.org; Wed, 21 Jul 2021 06:43:20 -0400
Received: from mail-ed1-x52b.google.com ([2a00:1450:4864:20::52b]:37490)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1m69h8-0000k8-Su
 for qemu-devel@nongnu.org; Wed, 21 Jul 2021 06:43:20 -0400
Received: by mail-ed1-x52b.google.com with SMTP id h8so1809845eds.4
 for <qemu-devel@nongnu.org>; Wed, 21 Jul 2021 03:43:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=0qL/X9ml1pkLHfawjtoVzGpIuBaruQyUXaq537U4fQ4=;
 b=hxIVyMe2msfLG0Gmu0fmw3Tbg3ITEpENKztfw81yAsC5IUWgyBIL9cb+qWD2A3bKbL
 OOS6RL9gexq/bkrkjNJ8me94VWNly7uUAX7/ndu9J93pamVdqfFnxw7u19B8/uXyq2EQ
 ilz6Pa6JygWKPaZn3rsrmhjTp/gTeGmwQuxoqV15NepCrcd5eUdTqr3NiDwYQI3D6fxw
 2TxZhbQBRKboELkOk/AVTVFzt7Hxtt8Im2Obaeanpt8165yfeahqs9YBfComBZmr6mgj
 WeYHKHjnoQcgfc7I9fnhWGI/bCzl316IszNvoQtVGzL14gqrDTEG9Ao3dKmkTUWuY93T
 XgBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=0qL/X9ml1pkLHfawjtoVzGpIuBaruQyUXaq537U4fQ4=;
 b=qNBiJn6pl7EW6imZQos64FmoKGHAtXFkukI8WAPn5IxU4i+wALk5kANBZhQsY0iWp2
 wpMQy59YUvb6tUTRvAWg7SnzqO5HpLdp/d0yvl2RLEpmu0j5HwdZ3c7yVpyOrUpnxP0I
 L7ljv6m3gJJCPg3BqB7uYimL+2IGckJMuNyqlfb2w0Uh1R0/ZR3z30fGFVdJD9GVfxOM
 /TvWZX5u8FBL5mVbb88/0KE9mMfkvIFcoI8XqHMujNkNyKP6daYAFkt/3Q7f2fbjwfl5
 f6TsoQqL8dYZTZMo6P0DUUCNyliZNJVj4+VxeGj0mGY6c/qoNHnC1gdcAHZ9Q0QC8Iew
 ugTg==
X-Gm-Message-State: AOAM5321pS8OIqd1otXCpbD7WFOcSeXOms0pf460etiRkZraphXbISYn
 NWr6TteGkhgvbH7BeA2+WN+Gf6hK0uNkf+HkU8w=
X-Google-Smtp-Source: ABdhPJwFCvViaw2RaRV6t1OGxq/0Xgvdkzmd9kc8xAVnG4KFXqXZXC6bNs4vynQP1Yf+BQqxvVLPPF6oYf2eUMzJZF4=
X-Received: by 2002:aa7:c808:: with SMTP id a8mr47851454edt.245.1626864197231; 
 Wed, 21 Jul 2021 03:43:17 -0700 (PDT)
MIME-Version: 1.0
References: <20210721093347.338536-1-kraxel@redhat.com>
 <20210721093347.338536-2-kraxel@redhat.com>
In-Reply-To: <20210721093347.338536-2-kraxel@redhat.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Date: Wed, 21 Jul 2021 14:43:05 +0400
Message-ID: <CAJ+F1CJd1fEo8v9DbOLK4e9Vq=yL5wPTZZm5PL5UhxRwyLAtSg@mail.gmail.com>
Subject: Re: [PATCH 1/2] qxl: remove assert in qxl_pre_save.
To: Gerd Hoffmann <kraxel@redhat.com>
Content-Type: multipart/alternative; boundary="00000000000092e98905c79fd695"
Received-SPF: pass client-ip=2a00:1450:4864:20::52b;
 envelope-from=marcandre.lureau@gmail.com; helo=mail-ed1-x52b.google.com
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
Cc: QEMU <qemu-devel@nongnu.org>, Markus Armbruster <armbru@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--00000000000092e98905c79fd695
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 21, 2021 at 1:41 PM Gerd Hoffmann <kraxel@redhat.com> wrote:

> Since commit 551dbd0846d2 ("migration: check pre_save return in
> vmstate_save_state") the pre_save hook can fail.  So lets finally
> use that to drop the guest-triggerable assert in qxl_pre_save().
>
> Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
>

Reviewed-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>

---
>  hw/display/qxl.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
>
> diff --git a/hw/display/qxl.c b/hw/display/qxl.c
> index 84f99088e0a0..3867b94fe236 100644
> --- a/hw/display/qxl.c
> +++ b/hw/display/qxl.c
> @@ -2283,7 +2283,9 @@ static int qxl_pre_save(void *opaque)
>      } else {
>          d->last_release_offset =3D (uint8_t *)d->last_release - ram_star=
t;
>      }
> -    assert(d->last_release_offset < d->vga.vram_size);
> +    if (d->last_release_offset < d->vga.vram_size) {
> +        return 1;
> +    }
>
>      return 0;
>  }
> --
> 2.31.1
>
>
>

--=20
Marc-Andr=C3=A9 Lureau

--00000000000092e98905c79fd695
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Wed, Jul 21, 2021 at 1:41 PM Gerd =
Hoffmann &lt;<a href=3D"mailto:kraxel@redhat.com">kraxel@redhat.com</a>&gt;=
 wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px =
0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">Since co=
mmit 551dbd0846d2 (&quot;migration: check pre_save return in<br>
vmstate_save_state&quot;) the pre_save hook can fail.=C2=A0 So lets finally=
<br>
use that to drop the guest-triggerable assert in qxl_pre_save().<br>
<br>
Signed-off-by: Gerd Hoffmann &lt;<a href=3D"mailto:kraxel@redhat.com" targe=
t=3D"_blank">kraxel@redhat.com</a>&gt;<br></blockquote><div><br></div><div>=
Reviewed-by: Marc-Andr=C3=A9 Lureau &lt;<a href=3D"mailto:marcandre.lureau@=
redhat.com">marcandre.lureau@redhat.com</a>&gt;</div><div> <br></div><block=
quote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1=
px solid rgb(204,204,204);padding-left:1ex">
---<br>
=C2=A0hw/display/qxl.c | 4 +++-<br>
=C2=A01 file changed, 3 insertions(+), 1 deletion(-)<br>
<br>
diff --git a/hw/display/qxl.c b/hw/display/qxl.c<br>
index 84f99088e0a0..3867b94fe236 100644<br>
--- a/hw/display/qxl.c<br>
+++ b/hw/display/qxl.c<br>
@@ -2283,7 +2283,9 @@ static int qxl_pre_save(void *opaque)<br>
=C2=A0 =C2=A0 =C2=A0} else {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0d-&gt;last_release_offset =3D (uint8_t *)=
d-&gt;last_release - ram_start;<br>
=C2=A0 =C2=A0 =C2=A0}<br>
-=C2=A0 =C2=A0 assert(d-&gt;last_release_offset &lt; d-&gt;vga.vram_size);<=
br>
+=C2=A0 =C2=A0 if (d-&gt;last_release_offset &lt; d-&gt;vga.vram_size) {<br=
>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return 1;<br>
+=C2=A0 =C2=A0 }<br>
<br>
=C2=A0 =C2=A0 =C2=A0return 0;<br>
=C2=A0}<br>
-- <br>
2.31.1<br>
<br>
<br>
</blockquote></div><br clear=3D"all"><br>-- <br><div dir=3D"ltr" class=3D"g=
mail_signature">Marc-Andr=C3=A9 Lureau<br></div></div>

--00000000000092e98905c79fd695--

