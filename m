Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 73CE22CED1B
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Dec 2020 12:34:34 +0100 (CET)
Received: from localhost ([::1]:56198 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kl9M9-0008LI-HM
	for lists+qemu-devel@lfdr.de; Fri, 04 Dec 2020 06:34:33 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43854)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1kl9K5-0007VM-7O
 for qemu-devel@nongnu.org; Fri, 04 Dec 2020 06:32:25 -0500
Received: from mail-ed1-x541.google.com ([2a00:1450:4864:20::541]:44998)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1kl9K3-0002Yu-K4
 for qemu-devel@nongnu.org; Fri, 04 Dec 2020 06:32:24 -0500
Received: by mail-ed1-x541.google.com with SMTP id l5so5435039edq.11
 for <qemu-devel@nongnu.org>; Fri, 04 Dec 2020 03:32:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=C5FcHhdOMZ/JBFh0uSeD7/vGNZYnNIdGc2Cgq8H/zGU=;
 b=AsWQWlvJxWpCS9gSK5WK7LzuAUdiGQGKXdS9A3fjETqXBdag400FxUnZspJR2JIJOa
 tA1RHkTV9q06jLqnSdzvBNvU10W8HW9t+WDKV4C3Y9qaxdnhfhLcwxb92XORJBae9OJy
 YeBv1DeTDbSYWxwPqGwLqa/7+h0qAhXZw5WstDcMdxCWFh4/k2cMtM13DlJWcKHP3KfQ
 jBB2oTgIKozItOF/vW1RnW2hbk64oHRPI1L2R3SkIMJkBs6frrWobD/xVMZcxRvK3xQM
 rMabWhxQWDWVGMCIDDlbe/iNKRAqxIq9YuFWl9sR8gj8DvR2IMgy6O9xtwxfubzqBShx
 zXGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=C5FcHhdOMZ/JBFh0uSeD7/vGNZYnNIdGc2Cgq8H/zGU=;
 b=fk3c2jWcBh/jkYRGlgcf+ZsTKqTbLsLSvNQM1iMIr6Jt36nURUv423kuMEWsHaSZ5J
 VBKevb2HipXS/rNZr4VAdJDeuJSgiaZLwa5l1hyXON0Z32nMxlZvKv6I5aNKVwWLxtye
 HMwV9JIShSHZSRDk3Pcx5Nto3aFwmc3HsnqxQk9B6U5ix1V3zLl2zwbqNP9u85DrxImR
 Pu6vFE0IHRq1kfI/yoRPTHhpsnN7Fx+O856d/fFraQpX3FXvl6n+bWdRlohyWAjoXzmn
 trsJxpYEVELskqY4PIVqGJtDYOGurbx9isV+pk8aaGnBphromt9mjRAn7jC6VShHNwht
 sesQ==
X-Gm-Message-State: AOAM531ZA5EVsrsXbdpi4UABeyJP5/qdULLZkEP13KkJvxdT0gJseiWq
 dLc1m1p1N4lXu3k2fL+xpF6fdpxBwKj5xbE4oSs=
X-Google-Smtp-Source: ABdhPJzuAv845CrViCMIrCyEl0mpAJyWiN4iyKn2DgYFUBHs93DML4F3nD4sJaZGY93WrjQfw4Ss5An8C/WS4yQUlc8=
X-Received: by 2002:a50:e846:: with SMTP id k6mr7182377edn.245.1607081539349; 
 Fri, 04 Dec 2020 03:32:19 -0800 (PST)
MIME-Version: 1.0
References: <20201203110806.13556-1-kraxel@redhat.com>
 <20201203110806.13556-3-kraxel@redhat.com>
In-Reply-To: <20201203110806.13556-3-kraxel@redhat.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Date: Fri, 4 Dec 2020 15:32:06 +0400
Message-ID: <CAJ+F1CLW8pVGS5UDDcvFtwfTZo+C1d=t+ubamNR-ZMwrC0fgmw@mail.gmail.com>
Subject: Re: [PATCH 2/9] console: add check for ui_info pointer
To: Gerd Hoffmann <kraxel@redhat.com>
Content-Type: multipart/alternative; boundary="00000000000047324505b5a1d41a"
Received-SPF: pass client-ip=2a00:1450:4864:20::541;
 envelope-from=marcandre.lureau@gmail.com; helo=mail-ed1-x541.google.com
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
Cc: QEMU <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--00000000000047324505b5a1d41a
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Dec 3, 2020 at 3:08 PM Gerd Hoffmann <kraxel@redhat.com> wrote:

> Verify the hw_ops->ui_info function pointer is non-zero before
> calling it.  Can be triggered by qxl which changes hw_ops when
> switching between qxl-native and vga-compat modes.
>
> Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
> ---
>  ui/console.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
>
> diff --git a/ui/console.c b/ui/console.c
> index 16b326854080..8930808d0b6d 100644
> --- a/ui/console.c
> +++ b/ui/console.c
> @@ -1539,7 +1539,9 @@ static void dpy_set_ui_info_timer(void *opaque)
>  {
>      QemuConsole *con =3D opaque;
>
> -    con->hw_ops->ui_info(con->hw, con->head, &con->ui_info);
> +    if (con->hw_ops->ui_info) {
> +        con->hw_ops->ui_info(con->hw, con->head, &con->ui_info);
> +    }
>

That would ignore the last UI info change, right? Is there a place where it
is actually taken care off later? If yes, perhaps worth a comment. If not,
should it reschedule the timer or should there be a warning on the console?

 }
>
>  bool dpy_ui_info_supported(QemuConsole *con)
> --
> 2.27.0
>
>
>

--=20
Marc-Andr=C3=A9 Lureau

--00000000000047324505b5a1d41a
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Thu, Dec 3, 2020 at 3:08 PM Gerd H=
offmann &lt;<a href=3D"mailto:kraxel@redhat.com">kraxel@redhat.com</a>&gt; =
wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0=
px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">Verify th=
e hw_ops-&gt;ui_info function pointer is non-zero before<br>
calling it.=C2=A0 Can be triggered by qxl which changes hw_ops when<br>
switching between qxl-native and vga-compat modes.<br>
<br>
Signed-off-by: Gerd Hoffmann &lt;<a href=3D"mailto:kraxel@redhat.com" targe=
t=3D"_blank">kraxel@redhat.com</a>&gt;<br>
---<br>
=C2=A0ui/console.c | 4 +++-<br>
=C2=A01 file changed, 3 insertions(+), 1 deletion(-)<br>
<br>
diff --git a/ui/console.c b/ui/console.c<br>
index 16b326854080..8930808d0b6d 100644<br>
--- a/ui/console.c<br>
+++ b/ui/console.c<br>
@@ -1539,7 +1539,9 @@ static void dpy_set_ui_info_timer(void *opaque)<br>
=C2=A0{<br>
=C2=A0 =C2=A0 =C2=A0QemuConsole *con =3D opaque;<br>
<br>
-=C2=A0 =C2=A0 con-&gt;hw_ops-&gt;ui_info(con-&gt;hw, con-&gt;head, &amp;co=
n-&gt;ui_info);<br>
+=C2=A0 =C2=A0 if (con-&gt;hw_ops-&gt;ui_info) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 con-&gt;hw_ops-&gt;ui_info(con-&gt;hw, con-&gt=
;head, &amp;con-&gt;ui_info);<br>
+=C2=A0 =C2=A0 }<br></blockquote><div><br></div><div>That would ignore the =
last UI info change, right? Is there a place where it is actually taken car=
e off later? If yes, perhaps worth a comment. If not, should it reschedule =
the timer or should there be a warning on the console?<br></div><div> <br><=
/div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;bo=
rder-left:1px solid rgb(204,204,204);padding-left:1ex">
=C2=A0}<br>
<br>
=C2=A0bool dpy_ui_info_supported(QemuConsole *con)<br>
-- <br>
2.27.0<br>
<br>
<br>
</blockquote></div><br clear=3D"all"><br>-- <br><div dir=3D"ltr" class=3D"g=
mail_signature">Marc-Andr=C3=A9 Lureau<br></div></div>

--00000000000047324505b5a1d41a--

