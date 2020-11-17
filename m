Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EFA92B68D5
	for <lists+qemu-devel@lfdr.de>; Tue, 17 Nov 2020 16:39:48 +0100 (CET)
Received: from localhost ([::1]:35012 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kf359-0001hC-C5
	for lists+qemu-devel@lfdr.de; Tue, 17 Nov 2020 10:39:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53916)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1kf346-00019a-8i; Tue, 17 Nov 2020 10:38:42 -0500
Received: from mail-ej1-x644.google.com ([2a00:1450:4864:20::644]:46108)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1kf343-0006qZ-Un; Tue, 17 Nov 2020 10:38:41 -0500
Received: by mail-ej1-x644.google.com with SMTP id w13so30014322eju.13;
 Tue, 17 Nov 2020 07:38:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=eC54fpRPawFW+AF0/OOwtcdxB0ZrAQe1BBA9CslvFTg=;
 b=R57wOBfUn4Ah/oMWpKlSDZIYX5wwy2k8MmevOoVtUYux90XfLbJqh/lRV7UV0rxMdR
 RrlVXorWLRwfZPh0NFfSDxXYuYeFsYrw3VIp0giJvdqyRjpDjmk++3hy/MLsg4TPTpVq
 O/Gv4hdGE02GagE2UTmIQJ5VQrlx7ohUyNyae6Za9kkA4/BwFf9di9BAWGwuyMabmXBC
 2hA9s9QWJxa2gYYCgxTf9m9gXl4Ck98BDMje9O7+GOZnwnS7U7fNPF3dpdOKT/50puug
 UQv1uTbX3M+4CP6s2GUOpCYnGFpGJSLklKcYVe43wGzJjTN30eMszlAYHGeTbEzTuAz7
 1hyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=eC54fpRPawFW+AF0/OOwtcdxB0ZrAQe1BBA9CslvFTg=;
 b=eM0/zT7kArzT8QNdf871HPmnw6s3DaNXUtmqIFqNGjQCplo1qJknjVUzxrHU5kpsmT
 2cHLLFBT2DsrG6PyQ3qi/RDVY4G+fXYcP9WxbjQc5DWwk4r4WHIwx9bndqgmmbUd9hXy
 bIuVwxZkwa+/2K3unWrOGeHm0N2xTe/9xw2eXHshPtV/MsQZ1dvp4vWDUhAdDwm9I2Pd
 nuL6naOFqMVs7GIWlmWXlTOrb1uPgHnOSmkwDdFZFKmSbGrOb2XLdjgXc0eFDLwmRUUs
 Wg3m4NyX0+J472SsyHWDU8l0KI2nNJBdG2wtU9SNf55ahqPn6foMnRabq3K4uF7lxgVQ
 7qgQ==
X-Gm-Message-State: AOAM530z0jZ4Txw2bBl9bJiMvmfpjhnTgdhFjmMP5Ystxz6UDCcKN0f3
 hoarg9mjsXoXeCxxBlgC9upbsXcHANaOywPDGzA=
X-Google-Smtp-Source: ABdhPJxXeak4SPlbRgziAMFBOXxEKFMYmsTNOYIUUuA2IT6pUbv9WK8KTKLAUvowjx2r4E9UWBxLtoX1A7FfaKh6dIM=
X-Received: by 2002:a17:906:b0f:: with SMTP id
 u15mr20158432ejg.109.1605627518234; 
 Tue, 17 Nov 2020 07:38:38 -0800 (PST)
MIME-Version: 1.0
References: <20201014082209.3712625-1-philmd@redhat.com>
In-Reply-To: <20201014082209.3712625-1-philmd@redhat.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Date: Tue, 17 Nov 2020 19:38:25 +0400
Message-ID: <CAJ+F1CLe3pcSiukmd7hxHdc-U+R7LZ_ODNZgXLteESFmOQ9K0A@mail.gmail.com>
Subject: Re: [PATCH] buildsys: Help git-diff adding .gitattributes config file
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>
Content-Type: multipart/alternative; boundary="000000000000ddb69405b44f491d"
Received-SPF: pass client-ip=2a00:1450:4864:20::644;
 envelope-from=marcandre.lureau@gmail.com; helo=mail-ej1-x644.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
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
Cc: qemu trival <qemu-trivial@nongnu.org>, Paolo Bonzini <pbonzini@redhat.com>,
 QEMU <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--000000000000ddb69405b44f491d
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 14, 2020 at 12:25 PM Philippe Mathieu-Daud=C3=A9 <philmd@redhat=
.com>
wrote:

> Since commits 0979ed017f0 ("meson: rename .inc.h files to .h.inc")
> and 139c1837db7 ("meson: rename included C source files to .c.inc")
> 'git-diff --function-context' stopped displaying C function context
> correctly.
> We can help git-diff by providing attributes to the .[ch].inc path
> names. See:
> https://git-scm.com/docs/gitattributes#_generating_diff_text
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
>

Reviewed-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>


> ---
>  .gitattributes | 2 ++
>  1 file changed, 2 insertions(+)
>  create mode 100644 .gitattributes
>
> diff --git a/.gitattributes b/.gitattributes
> new file mode 100644
> index 00000000000..3d2fe2ecda8
> --- /dev/null
> +++ b/.gitattributes
> @@ -0,0 +1,2 @@
> +*.c.inc         diff=3Dc
> +*.h.inc         diff=3Dc
> --
> 2.26.2
>
>
>

--=20
Marc-Andr=C3=A9 Lureau

--000000000000ddb69405b44f491d
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Wed, Oct 14, 2020 at 12:25 PM Phil=
ippe Mathieu-Daud=C3=A9 &lt;<a href=3D"mailto:philmd@redhat.com">philmd@red=
hat.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"=
margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-lef=
t:1ex">Since commits 0979ed017f0 (&quot;meson: rename .inc.h files to .h.in=
c&quot;)<br>
and 139c1837db7 (&quot;meson: rename included C source files to .c.inc&quot=
;)<br>
&#39;git-diff --function-context&#39; stopped displaying C function context=
<br>
correctly.<br>
We can help git-diff by providing attributes to the .[ch].inc path<br>
names. See:<br>
<a href=3D"https://git-scm.com/docs/gitattributes#_generating_diff_text" re=
l=3D"noreferrer" target=3D"_blank">https://git-scm.com/docs/gitattributes#_=
generating_diff_text</a><br>
<br>
Signed-off-by: Philippe Mathieu-Daud=C3=A9 &lt;<a href=3D"mailto:philmd@red=
hat.com" target=3D"_blank">philmd@redhat.com</a>&gt;<br></blockquote><div><=
br></div><div>Reviewed-by: Marc-Andr=C3=A9 Lureau &lt;<a href=3D"mailto:mar=
candre.lureau@redhat.com">marcandre.lureau@redhat.com</a>&gt; </div><div>=
=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0=
.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
---<br>
=C2=A0.gitattributes | 2 ++<br>
=C2=A01 file changed, 2 insertions(+)<br>
=C2=A0create mode 100644 .gitattributes<br>
<br>
diff --git a/.gitattributes b/.gitattributes<br>
new file mode 100644<br>
index 00000000000..3d2fe2ecda8<br>
--- /dev/null<br>
+++ b/.gitattributes<br>
@@ -0,0 +1,2 @@<br>
+*.c.inc=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0diff=3Dc<br>
+*.h.inc=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0diff=3Dc<br>
-- <br>
2.26.2<br>
<br>
<br>
</blockquote></div><br clear=3D"all"><br>-- <br><div dir=3D"ltr" class=3D"g=
mail_signature">Marc-Andr=C3=A9 Lureau<br></div></div>

--000000000000ddb69405b44f491d--

