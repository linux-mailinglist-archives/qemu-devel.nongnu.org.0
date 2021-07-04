Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CA0D3BAAD3
	for <lists+qemu-devel@lfdr.de>; Sun,  4 Jul 2021 03:32:33 +0200 (CEST)
Received: from localhost ([::1]:40098 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lzqzo-0001DN-Gp
	for lists+qemu-devel@lfdr.de; Sat, 03 Jul 2021 21:32:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51740)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.j.zak@gmail.com>)
 id 1lzqz3-0000XA-Od
 for qemu-devel@nongnu.org; Sat, 03 Jul 2021 21:31:45 -0400
Received: from mail-vk1-xa34.google.com ([2607:f8b0:4864:20::a34]:39470)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.j.zak@gmail.com>)
 id 1lzqz2-0006tF-2u
 for qemu-devel@nongnu.org; Sat, 03 Jul 2021 21:31:45 -0400
Received: by mail-vk1-xa34.google.com with SMTP id k140so2991952vkk.6
 for <qemu-devel@nongnu.org>; Sat, 03 Jul 2021 18:31:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=oWhzx3E4a1d8zebHMz5eI4vnzLwldaXVlfYNB8mjReI=;
 b=LKsqTphYvUyPl45KL6zZqZwDEzPCHP1mzsXSVec6YDspa7GDrPK8uDZR0JHdq3/uFe
 tF+8XWHAe4lZ9JMp+J6D7mU7MksBRQ2O16DnOT7c4toSbAUbn87vpJDaH5/mll/DNaw4
 x3IWoj70IhXhJj7eZVY5R2s0RtsnOC/FIlUjfWsOUePRDEZgqGhexSxkiU3RL+JEqLRz
 Lytt7vdVkmFFNSAS7o5VagpT8nl2LFBE5XnqlhcmuxKs4SkktpnQpht+qpRvbDs7geql
 2RxhJvu8DzVWewElLFqA8tTXKLo8WOjKesvetgRybfjeuu5gNbYtLfnxCjf745P2YFNG
 E3VA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=oWhzx3E4a1d8zebHMz5eI4vnzLwldaXVlfYNB8mjReI=;
 b=M4UbgwEm2tAoOhn7UBNEidPghKP6CGA82lqf3qBG5xGID2sCvCHbi3Wz6GGQ4sIz1s
 JF6nhvXA/1QE2tnnBFAmGuTZ2y7sDA6WoK8y/llQW8TuSBrvZSfGAklLISAZBYptBz5f
 rivEbU/WRhFNpQ+yjRjrpo6+A+jCwKo2KNvkYK6WfkT680x1kX1b54wNKxgeQ8ela9Ww
 g8Z9lQHTbF551gKbuXrOgcjtQK1xsGcrmRVIj/s1M1ZpHfsLET4ME14RbkEclsrC7UAH
 QU/hTaSMOHwnSo/XX8UWMHSy/deZmk2aDTYg7DH0689MpLs5FXviaXmG5GT0gikUNrL+
 vC4g==
X-Gm-Message-State: AOAM532+2ROSuTOw4XW1k8dvUXkWhMUGXYrL/VvvVSpQobF0yCGzlQ4D
 i4fTZe/BAXowv38QoU2vKfrBHIED+QcpAH1qjAMDQ7+55T0=
X-Google-Smtp-Source: ABdhPJxdnh3FoEVi6mZr5iiAm+SVUlwj05AIqTymOsmgD6UzhwzWDvoxsrxl2m2vrjJ2ZxijwuTCXxtTMZs3r9WmOTc=
X-Received: by 2002:ac5:cca3:: with SMTP id p3mr5159260vkm.25.1625362302788;
 Sat, 03 Jul 2021 18:31:42 -0700 (PDT)
MIME-Version: 1.0
From: Richard Zak <richard.j.zak@gmail.com>
Date: Sat, 3 Jul 2021 21:31:32 -0400
Message-ID: <CAOakUfPecE4r8vXvH5L72awSy=aoMBgQxTJDoskswfZC6cVyzw@mail.gmail.com>
Subject: [Patch 1/2 v2] Fix for Haiku
To: QEMU Developers <qemu-devel@nongnu.org>,
 Peter Maydell <peter.maydell@linaro.org>
Content-Type: multipart/alternative; boundary="000000000000b068d105c6422616"
Received-SPF: pass client-ip=2607:f8b0:4864:20::a34;
 envelope-from=richard.j.zak@gmail.com; helo=mail-vk1-xa34.google.com
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

--000000000000b068d105c6422616
Content-Type: text/plain; charset="UTF-8"

Based on feedback from prior email

Signed-off-by: Richard Zak <richard.j.zak@gmail.com>
---
 configure | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/configure b/configure
index e799d908a3..8384e22ba3 100755
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
@@ -769,6 +770,9 @@ SunOS)
 ;;
 Haiku)
   haiku="yes"
+  tpm="no"
+  capstone="system"
+  target_list_exclude="mips-softmmu mipsel-softmmu mips64-softmmu
mips64el-softmmu xtensa-softmmu xtensaeb-softmmu"
   QEMU_CFLAGS="-DB_USE_POSITIVE_POSIX_ERRORS -D_BSD_SOURCE $QEMU_CFLAGS"
 ;;
 Linux)
-- 
2.25.1


-- 
Regards,

Richard J. Zak
Professional Genius
PGP Key: https://keybase.io/rjzak/key.asc

--000000000000b068d105c6422616
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Based on feedback from prior email<br></div><div><br>=
</div><div>Signed-off-by: Richard Zak &lt;<a href=3D"mailto:richard.j.zak@g=
mail.com">richard.j.zak@gmail.com</a>&gt;</div>---<br>=C2=A0configure | 4 +=
+++<br>=C2=A01 file changed, 4 insertions(+)<br><br>diff --git a/configure =
b/configure<br>index e799d908a3..8384e22ba3 100755<br>--- a/configure<br>++=
+ b/configure<br>@@ -358,6 +358,7 @@ oss_lib=3D&quot;&quot;<br>=C2=A0bsd=3D=
&quot;no&quot;<br>=C2=A0linux=3D&quot;no&quot;<br>=C2=A0solaris=3D&quot;no&=
quot;<br>+haiku=3D&quot;no&quot;<br>=C2=A0profiler=3D&quot;no&quot;<br>=C2=
=A0cocoa=3D&quot;auto&quot;<br>=C2=A0softmmu=3D&quot;yes&quot;<br>@@ -769,6=
 +770,9 @@ SunOS)<br>=C2=A0;;<br>=C2=A0Haiku)<br>=C2=A0 =C2=A0haiku=3D&quot=
;yes&quot;<br>+ =C2=A0tpm=3D&quot;no&quot;<br>+ =C2=A0capstone=3D&quot;syst=
em&quot;<br>+ =C2=A0target_list_exclude=3D&quot;mips-softmmu mipsel-softmmu=
 mips64-softmmu mips64el-softmmu xtensa-softmmu xtensaeb-softmmu&quot;<br>=
=C2=A0 =C2=A0QEMU_CFLAGS=3D&quot;-DB_USE_POSITIVE_POSIX_ERRORS -D_BSD_SOURC=
E $QEMU_CFLAGS&quot;<br>=C2=A0;;<br>=C2=A0Linux)<br>-- <br>2.25.1<br><br cl=
ear=3D"all"><br>-- <br><div dir=3D"ltr" class=3D"gmail_signature" data-smar=
tmail=3D"gmail_signature"><div dir=3D"ltr"><div><div dir=3D"ltr"><div><div =
dir=3D"ltr"><div>Regards,<br><br>Richard J. Zak<br>Professional Genius</div=
><div>PGP Key:=C2=A0<a href=3D"https://keybase.io/rjzak/key.asc" target=3D"=
_blank">https://keybase.io/rjzak/key.asc</a></div></div></div></div></div><=
/div></div></div>

--000000000000b068d105c6422616--

