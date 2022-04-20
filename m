Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 23D79508D26
	for <lists+qemu-devel@lfdr.de>; Wed, 20 Apr 2022 18:23:17 +0200 (CEST)
Received: from localhost ([::1]:55754 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nhD6q-0002im-6e
	for lists+qemu-devel@lfdr.de; Wed, 20 Apr 2022 12:23:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50460)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1nhCpo-0000y9-VT
 for qemu-devel@nongnu.org; Wed, 20 Apr 2022 12:05:41 -0400
Received: from mail-qk1-x729.google.com ([2607:f8b0:4864:20::729]:44701)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1nhCpl-0005pl-CZ
 for qemu-devel@nongnu.org; Wed, 20 Apr 2022 12:05:39 -0400
Received: by mail-qk1-x729.google.com with SMTP id b189so1531885qkf.11
 for <qemu-devel@nongnu.org>; Wed, 20 Apr 2022 09:05:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=9YWOEod/Q7sLX8hQoZxzht2hFf08KErnVaEQC90s8c4=;
 b=o8QTAEjXi3xfKtXnDQicJ1Fl3D0i3EM90SEY51BUemLVFdC+x4sVwBDMaTKsGZ2iNr
 MIEzXHnKdcQhq1lw0LEvSV9+nxzcWC2oCKaPsZzLa/IRwTuM75jhTXdPEd8q+jtIIPUd
 etVf0UlZ0AGCulgHPYY1QViYA2R0VNvLtK+VI947ZiYG6TyEilv+sCr0sr/fXqCwqBCs
 uxQ6qqWgwa3vooucNrZ6yRL+NXvXQTZ3EQ2XNqUG0YnmS6WHoxeiuzrToI9lS8T3DzZE
 Jji6mNhthlQlOqCFtEFQSG978yIa2s11GrbM2luJVv+8a35Ijjep7HlELZ8F50pUFnVu
 v3Ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=9YWOEod/Q7sLX8hQoZxzht2hFf08KErnVaEQC90s8c4=;
 b=2X+u0+YlJuevhs3s8t7FSdqyaz8YSzAtTQi5BvyiKF5E4G3GnfmEpbvA3e0X5lpXeu
 JrRJ40wUzds4lVglC+jGKTk2wPYoz2rna47EWv4j2l/LLP0mrBlZeZDHMPw2WZeTQ84S
 Wu/K/kI+b2asC0vIdrm0uslpcR2GSxfLeGcDlZ1zgOnnAZxw0SgmKAPqdjSLw7VNdAvX
 AnTZY0SQawkeOkGuekwic8dbVXiY/f9reh4x/9N+lVtZYXDIgZt5kSFNkb+dRfzgvIzV
 vC3UyPxiBw2Lw8KGPtWWM1PvOlr3wgkX88ktZl3OJjqOocaJpoqRnvcxORtFHSFAHsgs
 lD/A==
X-Gm-Message-State: AOAM531X210Cghh3MRpczk3OZB6xolPdoK4CjBTbyRuEsz9D0UavRVdW
 UzPWEeEdjAdsMZ0yPlWdeLdaS0ALcOCwTILJZXedKzGXI9PaBg==
X-Google-Smtp-Source: ABdhPJxi/HSjcJsX/COJ2mYbAdcUFit2Aq2z3FGz8uEv7LG/suKMghqTnK9v9oJASGlJCRSZFfZhDDuqjY+t0ht7hwA=
X-Received: by 2002:a05:620a:2415:b0:69e:784d:3a4c with SMTP id
 d21-20020a05620a241500b0069e784d3a4cmr12184635qkn.14.1650470736476; Wed, 20
 Apr 2022 09:05:36 -0700 (PDT)
MIME-Version: 1.0
References: <20220420153407.73926-1-pbonzini@redhat.com>
 <20220420153407.73926-5-pbonzini@redhat.com>
In-Reply-To: <20220420153407.73926-5-pbonzini@redhat.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Date: Wed, 20 Apr 2022 20:05:24 +0400
Message-ID: <CAJ+F1CJqW=a2JWBNG+extRdsSjZVEBHWcX=uDo0k+WWuqkxh7A@mail.gmail.com>
Subject: Re: [PATCH 04/34] configure: pc-bios/qemu-icon.bmp does not exist
To: Paolo Bonzini <pbonzini@redhat.com>
Content-Type: multipart/alternative; boundary="000000000000f5bfe605dd18297b"
Received-SPF: pass client-ip=2607:f8b0:4864:20::729;
 envelope-from=marcandre.lureau@gmail.com; helo=mail-qk1-x729.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: QEMU <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--000000000000f5bfe605dd18297b
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 20, 2022 at 7:44 PM Paolo Bonzini <pbonzini@redhat.com> wrote:

> The file has been removed in commit a8260d3876 ("ui: install logo icons t=
o
> $prefix/share/icons", 2019-01-21), do not try to symlink it in the build
> tree.
>
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
>

Reviewed-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>


> ---
>  configure | 1 -
>  1 file changed, 1 deletion(-)
>
> diff --git a/configure b/configure
> index 2bc5a0b84f..7a89cb4123 100755
> --- a/configure
> +++ b/configure
> @@ -3020,7 +3020,6 @@ LINKS=3D"Makefile"
>  LINKS=3D"$LINKS tests/tcg/Makefile.target"
>  LINKS=3D"$LINKS pc-bios/optionrom/Makefile"
>  LINKS=3D"$LINKS pc-bios/s390-ccw/Makefile"
> -LINKS=3D"$LINKS pc-bios/qemu-icon.bmp"
>  LINKS=3D"$LINKS .gdbinit scripts" # scripts needed by relative path in
> .gdbinit
>  LINKS=3D"$LINKS tests/avocado tests/data"
>  LINKS=3D"$LINKS tests/qemu-iotests/check"
> --
> 2.35.1
>
>
>
>

--=20
Marc-Andr=C3=A9 Lureau

--000000000000f5bfe605dd18297b
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Wed, Apr 20, 2022 at 7:44 PM Paolo=
 Bonzini &lt;<a href=3D"mailto:pbonzini@redhat.com">pbonzini@redhat.com</a>=
&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px =
0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">The =
file has been removed in commit a8260d3876 (&quot;ui: install logo icons to=
<br>
$prefix/share/icons&quot;, 2019-01-21), do not try to symlink it in the bui=
ld tree.<br>
<br>
Signed-off-by: Paolo Bonzini &lt;<a href=3D"mailto:pbonzini@redhat.com" tar=
get=3D"_blank">pbonzini@redhat.com</a>&gt;<br></blockquote><div><br></div><=
div><div>Reviewed-by: Marc-Andr=C3=A9 Lureau &lt;<a href=3D"mailto:marcandr=
e.lureau@redhat.com" target=3D"_blank">marcandre.lureau@redhat.com</a>&gt;<=
/div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px =
0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
---<br>
=C2=A0configure | 1 -<br>
=C2=A01 file changed, 1 deletion(-)<br>
<br>
diff --git a/configure b/configure<br>
index 2bc5a0b84f..7a89cb4123 100755<br>
--- a/configure<br>
+++ b/configure<br>
@@ -3020,7 +3020,6 @@ LINKS=3D&quot;Makefile&quot;<br>
=C2=A0LINKS=3D&quot;$LINKS tests/tcg/Makefile.target&quot;<br>
=C2=A0LINKS=3D&quot;$LINKS pc-bios/optionrom/Makefile&quot;<br>
=C2=A0LINKS=3D&quot;$LINKS pc-bios/s390-ccw/Makefile&quot;<br>
-LINKS=3D&quot;$LINKS pc-bios/qemu-icon.bmp&quot;<br>
=C2=A0LINKS=3D&quot;$LINKS .gdbinit scripts&quot; # scripts needed by relat=
ive path in .gdbinit<br>
=C2=A0LINKS=3D&quot;$LINKS tests/avocado tests/data&quot;<br>
=C2=A0LINKS=3D&quot;$LINKS tests/qemu-iotests/check&quot;<br>
-- <br>
2.35.1<br>
<br>
<br>
<br>
</blockquote></div><br clear=3D"all"><br>-- <br><div dir=3D"ltr" class=3D"g=
mail_signature">Marc-Andr=C3=A9 Lureau<br></div></div>

--000000000000f5bfe605dd18297b--

