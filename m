Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 983D23BAA4C
	for <lists+qemu-devel@lfdr.de>; Sat,  3 Jul 2021 23:11:40 +0200 (CEST)
Received: from localhost ([::1]:51686 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lzmvL-0006E2-41
	for lists+qemu-devel@lfdr.de; Sat, 03 Jul 2021 17:11:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54128)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.j.zak@gmail.com>)
 id 1lzmuc-0005Z6-0D
 for qemu-devel@nongnu.org; Sat, 03 Jul 2021 17:10:54 -0400
Received: from mail-vs1-xe35.google.com ([2607:f8b0:4864:20::e35]:43894)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.j.zak@gmail.com>)
 id 1lzmua-0005J1-5a
 for qemu-devel@nongnu.org; Sat, 03 Jul 2021 17:10:53 -0400
Received: by mail-vs1-xe35.google.com with SMTP id g24so476983vsa.10
 for <qemu-devel@nongnu.org>; Sat, 03 Jul 2021 14:10:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to:cc;
 bh=6unthoky4q1OcrqHqorWs3OzoNY+NZOm+a4+y/Ez1Go=;
 b=gOTBBvItCI2qns4/loIlaqWxlQjyAJ1jGQJk/ljxDu5yIoAbEjKiCnMK5iRSlwnC9Q
 W1sx2E0PKSrYvslxOUTEbqouAd7yQWKvkzGy4QOAaIgM6xFBPQF87twHNUobNVJJ1lvq
 47Ut1dqqHoFswn+k5//rSw7PUR7d71FPrKXxJafYfZbEDNmoktu/T91AVyPXj+RNHb4C
 aTjewOa14arivbGinjr9mWs4adxQPMTEnMMB1rQgvhH5i8Tlsma1rnHwXiuVPfzM2xG5
 8nbvUDM7oFwtzLAGxgbqYeHRYG94bV89G0FWu1FxerYRCiLPN85J3AdH7RuCkh0MzHcK
 Knng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
 bh=6unthoky4q1OcrqHqorWs3OzoNY+NZOm+a4+y/Ez1Go=;
 b=RrAPuWeTifsPELM4WB5K07XZfKhE6prTXT7mNeMQnwq5Rj5Ed/AaERe6t8o9HoRaz5
 UYaIb1eeUal8eA0rynJvM4q8sRvxWYcKyjJZIK7zMl9oI73l06C8ePsmt1jMe1E/+FBY
 OlacHmWqrg2cAwvs5GbnkBKMfwKYsTq3a34ZZIU0StaahUqeHqv/2ea7hPp2+O6/7gL3
 /btRiSwVGN7cPY1EU+V6Sls8YT5pynteH/k/jURdkNHuXv/urn5MWuQqnFASJtf/eeNo
 QtUGUGHci2yba16skDysCFgHWqlZspLNna5urecZIfEEet9AJShHrYyOQGbOFeRORNCl
 EIjA==
X-Gm-Message-State: AOAM531PPCHDij8nHm+6db8BFX68DL8XjrvJ0RczdTfaWzErdW26bwey
 nX3krifL1pnFOV1LSKHiPkAV2sFSej8JFlq3LjFRuZQI+Tk=
X-Google-Smtp-Source: ABdhPJywLalP0XAnRK50fx0Zcl+su4vFfnSl2oeOfOfBeOdUBW5xN7bl8qFCvGrYjuLUGGlIVzhEiK7D/1EIYWFtW/4=
X-Received: by 2002:a67:7142:: with SMTP id m63mr2826938vsc.59.1625346650934; 
 Sat, 03 Jul 2021 14:10:50 -0700 (PDT)
MIME-Version: 1.0
From: Richard Zak <richard.j.zak@gmail.com>
Date: Sat, 3 Jul 2021 17:10:40 -0400
Message-ID: <CAOakUfOhn43BUUGoJPahxmxxTk8vcPeyrgsX0GDmzt46ZriNeA@mail.gmail.com>
Subject: [PATCH 1/2] Fix for Haiku
To: QEMU Developers <qemu-devel@nongnu.org>
Content-Type: multipart/alternative; boundary="000000000000c410c805c63e8129"
Received-SPF: pass client-ip=2607:f8b0:4864:20::e35;
 envelope-from=richard.j.zak@gmail.com; helo=mail-vs1-xe35.google.com
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--000000000000c410c805c63e8129
Content-Type: text/plain; charset="UTF-8"

For Haiku: turn off TPM, disable mips & xtensa emulators as they won't
compile on Haiku, use Haiku's capstone. I'm resending this as I previously
sent to the wrong address. This should resolve the memory issue with "make
vm-build-haiku.x86_64"

Signed-off-by: Richard Zak <richard.j.zak@gmail.com>
---
 configure | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/configure b/configure
index e799d908a3..a965c6c72e 100755
--- a/configure
+++ b/configure
@@ -358,6 +358,7 @@ oss_lib=""
 bsd="no"
 linux="no"
 solaris="no"
+haiku="no"
 profiler="no"
 cocoa="auto"
 softmmu="yes"
@@ -769,7 +770,10 @@ SunOS)
 ;;
 Haiku)
   haiku="yes"
-  QEMU_CFLAGS="-DB_USE_POSITIVE_POSIX_ERRORS -D_BSD_SOURCE $QEMU_CFLAGS"
+  tpm="no"
+  capstone="system"
+  target_list_exclude="mips-softmmu mipsel-softmmu mips64-softmmu
mips64el-softmmu xtensa-softmmu xtensaeb-softmmu"
+  QEMU_CFLAGS="-DB_USE_POSITIVE_POSIX_ERRORS -D_BSD_SOURCE -I`finddir
B_SYSTEM_HEADERS_DIRECTORY`/capstone $QEMU_CFLAGS"
 ;;
 Linux)
   audio_drv_list="try-pa oss"
-- 
2.25.1


-- 
Regards,

Richard J. Zak
Professional Genius
PGP Key: https://keybase.io/rjzak/key.asc

--000000000000c410c805c63e8129
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>For Haiku: turn off TPM, disable mips &amp; xtensa em=
ulators as they won&#39;t compile on Haiku, use Haiku&#39;s capstone. I&#39=
;m resending this as I previously sent to the wrong address. This should re=
solve the memory issue with &quot;make vm-build-haiku.x86_64&quot;<br></div=
><div><br></div><div>Signed-off-by: Richard Zak &lt;<a href=3D"mailto:richa=
rd.j.zak@gmail.com">richard.j.zak@gmail.com</a>&gt;</div>---<br>=C2=A0confi=
gure | 6 +++++-<br>=C2=A01 file changed, 5 insertions(+), 1 deletion(-)<br>=
<br>diff --git a/configure b/configure<br>index e799d908a3..a965c6c72e 1007=
55<br>--- a/configure<br>+++ b/configure<br>@@ -358,6 +358,7 @@ oss_lib=3D&=
quot;&quot;<br>=C2=A0bsd=3D&quot;no&quot;<br>=C2=A0linux=3D&quot;no&quot;<b=
r>=C2=A0solaris=3D&quot;no&quot;<br>+haiku=3D&quot;no&quot;<br>=C2=A0profil=
er=3D&quot;no&quot;<br>=C2=A0cocoa=3D&quot;auto&quot;<br>=C2=A0softmmu=3D&q=
uot;yes&quot;<br>@@ -769,7 +770,10 @@ SunOS)<br>=C2=A0;;<br>=C2=A0Haiku)<br=
>=C2=A0 =C2=A0haiku=3D&quot;yes&quot;<br>- =C2=A0QEMU_CFLAGS=3D&quot;-DB_US=
E_POSITIVE_POSIX_ERRORS -D_BSD_SOURCE $QEMU_CFLAGS&quot;<br>+ =C2=A0tpm=3D&=
quot;no&quot;<br>+ =C2=A0capstone=3D&quot;system&quot;<br>+ =C2=A0target_li=
st_exclude=3D&quot;mips-softmmu mipsel-softmmu mips64-softmmu mips64el-soft=
mmu xtensa-softmmu xtensaeb-softmmu&quot;<br>+ =C2=A0QEMU_CFLAGS=3D&quot;-D=
B_USE_POSITIVE_POSIX_ERRORS -D_BSD_SOURCE -I`finddir B_SYSTEM_HEADERS_DIREC=
TORY`/capstone $QEMU_CFLAGS&quot;<br>=C2=A0;;<br>=C2=A0Linux)<br>=C2=A0 =C2=
=A0audio_drv_list=3D&quot;try-pa oss&quot;<br>-- <br>2.25.1<br><br clear=3D=
"all"><br>-- <br><div dir=3D"ltr" class=3D"gmail_signature" data-smartmail=
=3D"gmail_signature"><div dir=3D"ltr"><div><div dir=3D"ltr"><div><div dir=
=3D"ltr"><div>Regards,<br><br>Richard J. Zak<br>Professional Genius</div><d=
iv>PGP Key:=C2=A0<a href=3D"https://keybase.io/rjzak/key.asc" target=3D"_bl=
ank">https://keybase.io/rjzak/key.asc</a></div></div></div></div></div></di=
v></div></div>

--000000000000c410c805c63e8129--

