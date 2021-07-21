Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D6A913D0681
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Jul 2021 03:42:01 +0200 (CEST)
Received: from localhost ([::1]:32858 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m61FI-00088Y-Gh
	for lists+qemu-devel@lfdr.de; Tue, 20 Jul 2021 21:42:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36928)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.j.zak@gmail.com>)
 id 1m61De-0007NX-LQ
 for qemu-devel@nongnu.org; Tue, 20 Jul 2021 21:40:18 -0400
Received: from mail-vk1-xa31.google.com ([2607:f8b0:4864:20::a31]:45624)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.j.zak@gmail.com>)
 id 1m61Dc-0007R0-Tc
 for qemu-devel@nongnu.org; Tue, 20 Jul 2021 21:40:18 -0400
Received: by mail-vk1-xa31.google.com with SMTP id t5so209283vkm.12
 for <qemu-devel@nongnu.org>; Tue, 20 Jul 2021 18:40:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=gIWSH3xm8AK7WYl7lAlEZZkzE39wsiptD/RtcPbccfc=;
 b=Cy7XW1X+GpeLpq+5ZqHDeVaL/2Elzfx81s4Y00shuFi1DwojLrTVtlWtfZJB7sqDmL
 e+47BnhkrAsKwSqVFO6hU/sF61FdTHVUg86V22UMPWTu88s8eK0uLSLFSehUUvSjEE6V
 qKTAYkHIjgK3ThVA48vnbxXvadtEqNxPEEsfZWokJOeRTqZNxMNJq2oWvUhOpT9N+pjK
 qkcNZ8JgXNy/reOiupNejmmZne/SQCaipUvdKJJmpJ8UOhjTK5KYOxofjZaEpn5tjRKe
 xkpPuN9OLg/zIZwHRLE4gTnNCCzRmbfGc2svSe3b7pizw1rwpqU3qmpCEHKXqc1uEy/f
 PNhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=gIWSH3xm8AK7WYl7lAlEZZkzE39wsiptD/RtcPbccfc=;
 b=f6E8xYEEosCMOdDGM9TMCw4D5Sf9DRnAyiKxrEUt0QtUFvKo6P1B4KPhEuYBVCd1xK
 7RpWMGsqo0wNCBvBY8Lujg2nfMJVKs359KJJK8NqyEPsUJBj6eaOU1M7CzM0Yo0oat2s
 /uz/M+ZkZy5o67JRg91OyhChIhM1ZdQYJ44AreUPCpHXtjvHjztX1GYTbCB5dBwQ3+AF
 sJ1KrlYJeM609WRRO4Ov0xlCiyb5wegdSDlRUfwUzHquo8iJLfoWAiSSKo4wOYvywoy0
 To5gcPEww4R9gQX7aiQ04h8G2lSdEmDkTzuZ/bTmFF1mLCJa3EyR/9cDDifK3e2NACb1
 OhcQ==
X-Gm-Message-State: AOAM5331KGV/oC8r5NxUgLQvk8EnG1NMiFxkHpzD8umtu23ybpYSLVvl
 joKf+vUiud5mXE8ch4RsBm14I0Kc94xhbtf9cpcSXKrBCBI=
X-Google-Smtp-Source: ABdhPJxwxoIXbKLbFbml1FrwL5L+v/H/3x+QyTAU48MDsnODgoXMJU0U8Qu4RpB/xWrq7/wEMt8C+ThmdLc+732rOjI=
X-Received: by 2002:a05:6122:17a7:: with SMTP id
 o39mr30053273vkf.25.1626831614770; 
 Tue, 20 Jul 2021 18:40:14 -0700 (PDT)
MIME-Version: 1.0
From: Richard Zak <richard.j.zak@gmail.com>
Date: Tue, 20 Jul 2021 21:40:04 -0400
Message-ID: <CAOakUfM8zMpYiAEn-_f9s1DHdVB-Bq9fGMM=Hfr8hJW9ra6aWw@mail.gmail.com>
Subject: [PATCH 1/2 v5] Configure script for Haiku
To: QEMU Developers <qemu-devel@nongnu.org>, Thomas Huth <thuth@redhat.com>
Content-Type: multipart/alternative; boundary="0000000000008209d905c7984013"
Received-SPF: pass client-ip=2607:f8b0:4864:20::a31;
 envelope-from=richard.j.zak@gmail.com; helo=mail-vk1-xa31.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--0000000000008209d905c7984013
Content-Type: text/plain; charset="UTF-8"

Signed-off-by: Richard Zak <richard.j.zak@gmail.com>
---
 configure | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/configure b/configure
index 232c54dcc1..163af793e9 100755
--- a/configure
+++ b/configure
@@ -768,7 +768,8 @@ SunOS)
 ;;
 Haiku)
   haiku="yes"
-  QEMU_CFLAGS="-DB_USE_POSITIVE_POSIX_ERRORS -D_BSD_SOURCE $QEMU_CFLAGS"
+  pie="no"
+  QEMU_CFLAGS="-DB_USE_POSITIVE_POSIX_ERRORS -D_BSD_SOURCE -fPIC
$QEMU_CFLAGS"
 ;;
 Linux)
   audio_drv_list="try-pa oss"
-- 
2.25.1

v5: Proper formatting for patch (sorry)
v4:
This refers to the email from a few weeks ago, regarding TPM & Haiku. It
seems the assertion failure isn't really about the TPM, but about disabling
PIE and adding -fPIC. There's discussion on the Haiku forum[1] about the
incompatibility with PIE, and this fixes the assertion failure without
altering the TPM configuration variable.
[1] https://discuss.haiku-os.org/t/qemu-on-haiku-sdl-issue/10961/6?u=rjzak

Previously, the TPM option was causing an assertion error at
util/async.c:669 qemu_set_current_aio_context() !my_aiocontext. I suspect
it was because the TPM option may have implied PIE. This patch ensures PIE
doesn't get used, but -fPIC is used instead.



-- 
Regards,

Richard J. Zak
Professional Genius
PGP Key: https://keybase.io/rjzak/key.asc

--0000000000008209d905c7984013
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Signed-off-by: Richard Zak &lt;<a href=3D"mailto:richard.j=
.zak@gmail.com">richard.j.zak@gmail.com</a>&gt;<br>---<br>=C2=A0configure |=
 3 ++-<br>=C2=A01 file changed, 2 insertions(+), 1 deletion(-)<br><br>diff =
--git a/configure b/configure<br>index 232c54dcc1..163af793e9 100755<br>---=
 a/configure<br>+++ b/configure<br>@@ -768,7 +768,8 @@ SunOS)<br>=C2=A0;;<b=
r>=C2=A0Haiku)<br>=C2=A0 =C2=A0haiku=3D&quot;yes&quot;<br>- =C2=A0QEMU_CFLA=
GS=3D&quot;-DB_USE_POSITIVE_POSIX_ERRORS -D_BSD_SOURCE $QEMU_CFLAGS&quot;<b=
r>+ =C2=A0pie=3D&quot;no&quot;<br>+ =C2=A0QEMU_CFLAGS=3D&quot;-DB_USE_POSIT=
IVE_POSIX_ERRORS -D_BSD_SOURCE -fPIC $QEMU_CFLAGS&quot;<br>=C2=A0;;<br>=C2=
=A0Linux)<br>=C2=A0 =C2=A0audio_drv_list=3D&quot;try-pa oss&quot;<br>-- <br=
>2.25.1<br><div><br></div><div>v5: Proper formatting for patch (sorry)<br><=
/div><div>v4:<br></div><div><div>This refers to the email from a few weeks =
ago, regarding TPM &amp;=20
Haiku. It seems the assertion failure isn&#39;t really about the TPM, but=
=20
about disabling PIE and adding -fPIC. There&#39;s discussion on the Haiku=
=20
forum[1] about the incompatibility with PIE, and this fixes the=20
assertion failure without altering the TPM configuration variable.</div><di=
v>[1] <a href=3D"https://discuss.haiku-os.org/t/qemu-on-haiku-sdl-issue/109=
61/6?u=3Drjzak" target=3D"_blank">https://discuss.haiku-os.org/t/qemu-on-ha=
iku-sdl-issue/10961/6?u=3Drjzak</a></div><div><br></div><div>Previously,
 the TPM option was causing an assertion error at util/async.c:669=20
qemu_set_current_aio_context() !my_aiocontext. I suspect it was because=20
the TPM option may have implied PIE. This patch ensures PIE doesn&#39;t get=
=20
used, but -fPIC is used instead.<br></div><div><br><br></div></div><br>-- <=
br><div dir=3D"ltr" class=3D"gmail_signature" data-smartmail=3D"gmail_signa=
ture"><div dir=3D"ltr"><div><div dir=3D"ltr"><div><div dir=3D"ltr"><div>Reg=
ards,<br><br>Richard J. Zak<br>Professional Genius</div><div>PGP Key:=C2=A0=
<a href=3D"https://keybase.io/rjzak/key.asc" target=3D"_blank">https://keyb=
ase.io/rjzak/key.asc</a></div></div></div></div></div></div></div></div>

--0000000000008209d905c7984013--

