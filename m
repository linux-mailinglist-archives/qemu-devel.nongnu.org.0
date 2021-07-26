Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 053F93D6380
	for <lists+qemu-devel@lfdr.de>; Mon, 26 Jul 2021 18:36:13 +0200 (CEST)
Received: from localhost ([::1]:54394 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m83aO-0004Ws-3m
	for lists+qemu-devel@lfdr.de; Mon, 26 Jul 2021 12:36:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41400)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1m83Yt-0003Bu-4b
 for qemu-devel@nongnu.org; Mon, 26 Jul 2021 12:34:40 -0400
Received: from mail-ed1-x52a.google.com ([2a00:1450:4864:20::52a]:36704)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1m83Yq-0005da-Oi
 for qemu-devel@nongnu.org; Mon, 26 Jul 2021 12:34:38 -0400
Received: by mail-ed1-x52a.google.com with SMTP id b7so11412675edu.3
 for <qemu-devel@nongnu.org>; Mon, 26 Jul 2021 09:34:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=LI4MIKIrXobAvcOjaEFEW9fX3wqLTr3kgXCgQ2vuxmo=;
 b=ZyxET+Kn9xyaFy81cRsRSXnJCIc4J/JyZpH+63QbixhNAKA79h5+FTzdP0/dfHGjuK
 OvcJ9X2vt4Uokwxkfaa+J3E8eCpDin0BQOf9sGJh5IHq+hwnAOxb5tncZl+nDov16WTe
 UYyBWEztgZDwiXg+IA/cxjMLgJAEF8LG/+oe5Zyr7CiuSE/Av20dxLDzIyshaxiP771U
 wnLDn3ui0ASUEb2QNaSUrvOkKC9YPEPzAwPsg8Wj5mxCER03EZBrmya/8ycl/qs9jFlQ
 Y53rFSZjDN3Ksh4kDWH8siogcyXcZbOI4PKnT1X5QTOncG6y7p2ITH0P9K0/kT0A1K83
 XEWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=LI4MIKIrXobAvcOjaEFEW9fX3wqLTr3kgXCgQ2vuxmo=;
 b=FqfNY2X0KY+l2YSXCugDzgkGF73qW+HiaABqnItZceiXBSc3VpwH/cdcO0jHfN6rD8
 POs+Eh41ZFBU9EXEG7dovZ8/PJRcjIKa6EaufJ2JdMUtpF2vX4EZamJIkZv8ZAvUpLcV
 WYjRZ5V7IBRqqYqaexdX0nLt5O2slmHKi+c4yZoWXo5w0EjPxn1iJGlm9lrRhzLTum5K
 Ne3Le5hVNjht+ETeUC37lIr1mkFV1a93LVrJhWMkQet/Gf74xHOiW6kxi3XehkHbWwmG
 AdIHIeEVKJJ1iU+rfKNAMVP1dSp7sjIHoXcMzPTeDk+aUoVbVOJvN1Da3E4NUIC/Lcae
 VJDw==
X-Gm-Message-State: AOAM530LzlZW7gWGzGQeHVUhQujJ/FMF2pcGOCm8tanImINt9EUw6nAc
 atfrkWpDYIfyBI8YujRtDDbYSrRhEQtcYyPynf4=
X-Google-Smtp-Source: ABdhPJzqCsvV33+fZWN6zPFRMUJ4V7Le+N3Ag7cXVJSDsb7doYq2WxXXTY6I6J+BF7rr2hZkOGcPZcNcYQqB6u5w8JY=
X-Received: by 2002:a05:6402:b79:: with SMTP id
 cb25mr22410506edb.164.1627317274721; 
 Mon, 26 Jul 2021 09:34:34 -0700 (PDT)
MIME-Version: 1.0
References: <20210726155235.2249878-1-kraxel@redhat.com>
 <20210726155235.2249878-4-kraxel@redhat.com>
In-Reply-To: <20210726155235.2249878-4-kraxel@redhat.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Date: Mon, 26 Jul 2021 20:34:22 +0400
Message-ID: <CAJ+F1CKaXPoQUNRtAqSPpJS+YEiHK0tvFNf4NAP390M=tKaUiQ@mail.gmail.com>
Subject: Re: [PATCH v2 3/3] qemu-ga/msi: fix w32 libgcc name
To: Gerd Hoffmann <kraxel@redhat.com>
Content-Type: multipart/alternative; boundary="00000000000018c0eb05c8095497"
Received-SPF: pass client-ip=2a00:1450:4864:20::52a;
 envelope-from=marcandre.lureau@gmail.com; helo=mail-ed1-x52a.google.com
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
Cc: Thomas Huth <thuth@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
 Michael Roth <michael.roth@amd.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 QEMU <qemu-devel@nongnu.org>, Willian Rampazzo <willianr@redhat.com>,
 Cleber Rosa <crosa@redhat.com>,
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--00000000000018c0eb05c8095497
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi

On Mon, Jul 26, 2021 at 7:56 PM Gerd Hoffmann <kraxel@redhat.com> wrote:

> This is what I find on my Fedora 34 mingw install.
>
> Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
> ---
>  qga/installer/qemu-ga.wxs | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/qga/installer/qemu-ga.wxs b/qga/installer/qemu-ga.wxs
> index 9cb4c3d73302..ce7b25b5e16f 100644
> --- a/qga/installer/qemu-ga.wxs
> +++ b/qga/installer/qemu-ga.wxs
> @@ -31,7 +31,7 @@
>    <?endif?>
>
>    <?if $(var.Arch) =3D "32"?>
> -    <?define ArchLib=3Dlibgcc_s_sjlj-1.dll?>
> +    <?define ArchLib=3Dlibgcc_s_dw2-1.dll?>
>      <?define GaProgramFilesFolder=3D"ProgramFilesFolder" ?>
>    <?endif?>
>
>
msitools/wixl has Fedora WXI (wxs includes files) for that
https://gitlab.gnome.org/GNOME/msitools/-/blob/master/data/wixl/gcc.wxi

In theory, all you need is: "<?require $DEP.wxi?>" at the top level, and
reference the component group "<ComponentGroupRef Id=3D"CG.$DEP"/>"

That's how we handle the dozens for dependencies in virt-viewer/spice.

--=20
Marc-Andr=C3=A9 Lureau

--00000000000018c0eb05c8095497
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">Hi<br></div><br><div class=3D"gmail_quote=
"><div dir=3D"ltr" class=3D"gmail_attr">On Mon, Jul 26, 2021 at 7:56 PM Ger=
d Hoffmann &lt;<a href=3D"mailto:kraxel@redhat.com">kraxel@redhat.com</a>&g=
t; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0p=
x 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">This i=
s what I find on my Fedora 34 mingw install.<br>
<br>
Signed-off-by: Gerd Hoffmann &lt;<a href=3D"mailto:kraxel@redhat.com" targe=
t=3D"_blank">kraxel@redhat.com</a>&gt;<br>
---<br>
=C2=A0qga/installer/qemu-ga.wxs | 2 +-<br>
=C2=A01 file changed, 1 insertion(+), 1 deletion(-)<br>
<br>
diff --git a/qga/installer/qemu-ga.wxs b/qga/installer/qemu-ga.wxs<br>
index 9cb4c3d73302..ce7b25b5e16f 100644<br>
--- a/qga/installer/qemu-ga.wxs<br>
+++ b/qga/installer/qemu-ga.wxs<br>
@@ -31,7 +31,7 @@<br>
=C2=A0 =C2=A0&lt;?endif?&gt;<br>
<br>
=C2=A0 =C2=A0&lt;?if $(var.Arch) =3D &quot;32&quot;?&gt;<br>
-=C2=A0 =C2=A0 &lt;?define ArchLib=3Dlibgcc_s_sjlj-1.dll?&gt;<br>
+=C2=A0 =C2=A0 &lt;?define ArchLib=3Dlibgcc_s_dw2-1.dll?&gt;<br>
=C2=A0 =C2=A0 =C2=A0&lt;?define GaProgramFilesFolder=3D&quot;ProgramFilesFo=
lder&quot; ?&gt;<br>
=C2=A0 =C2=A0&lt;?endif?&gt;<br>
<br></blockquote><div><br></div><div>msitools/wixl has Fedora WXI (wxs incl=
udes files) for that</div><div><a href=3D"https://gitlab.gnome.org/GNOME/ms=
itools/-/blob/master/data/wixl/gcc.wxi">https://gitlab.gnome.org/GNOME/msit=
ools/-/blob/master/data/wixl/gcc.wxi</a></div><div><br></div>In theory, all=
 you need is: &quot;&lt;?require $DEP.wxi?&gt;&quot; at the top level, and =
reference the component group &quot;&lt;ComponentGroupRef Id=3D&quot;CG.$DE=
P&quot;/&gt;&quot;</div><div class=3D"gmail_quote"><br></div><div class=3D"=
gmail_quote">That&#39;s how we handle the dozens for dependencies in virt-v=
iewer/spice.</div><div class=3D"gmail_quote"><br></div>-- <br><div dir=3D"l=
tr" class=3D"gmail_signature">Marc-Andr=C3=A9 Lureau<br></div></div>

--00000000000018c0eb05c8095497--

