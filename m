Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 723283BADDC
	for <lists+qemu-devel@lfdr.de>; Sun,  4 Jul 2021 18:44:05 +0200 (CEST)
Received: from localhost ([::1]:58794 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m05Dw-0003Mu-IP
	for lists+qemu-devel@lfdr.de; Sun, 04 Jul 2021 12:44:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54230)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.j.zak@gmail.com>)
 id 1m05D4-0002hJ-PT
 for qemu-devel@nongnu.org; Sun, 04 Jul 2021 12:43:10 -0400
Received: from mail-vk1-xa31.google.com ([2607:f8b0:4864:20::a31]:38400)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.j.zak@gmail.com>)
 id 1m05D3-00087V-3g
 for qemu-devel@nongnu.org; Sun, 04 Jul 2021 12:43:10 -0400
Received: by mail-vk1-xa31.google.com with SMTP id x20so1939893vkd.5
 for <qemu-devel@nongnu.org>; Sun, 04 Jul 2021 09:43:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to:cc;
 bh=1vBklQbrUZOo5vt/zBzB/ko9pB5rIKlOYKrTl1LEnAY=;
 b=PSwNv9XwA63k+WEB6TLhi1FpzFooK+spxPetVj3odZzYs8ix0GOCyv76gK5j2f97CF
 zK/f+JZG9ILAUKl0t3p0/wQ+aZLbmIxwZ/sF7T65UVnOEk8BpeyW+ehLRCd0TEwTjDMB
 Aw4GvJPox+GaixODV4kOee5QfWl0qKriVX61nLUGNwiGlbRP099raVn2GEKohnahGlpQ
 r9YHKN1PKBQnuWtimNLfawt9Z6iCB06qKg+S4JWbwauOix9U8A11jnqNSJpbby9HjAR2
 QrITfSs+sM/gNuhZlBrN3LF3gYSI2mpOOZzjC72ofrvvBO7+FdVekJqyXH6D1cvvKaeR
 UdcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
 bh=1vBklQbrUZOo5vt/zBzB/ko9pB5rIKlOYKrTl1LEnAY=;
 b=mMaFpmDNI77v2UpY+s68y38v3jykrSuowzoeBAKe8B1FAsH4dxQxuE2dS+dNP6LFay
 iucDGY58R/wz4p3cDx6zIC0YqMEgjc5gtf1PDAF4KPitkF8EZDwIfZb1YvNAWvK3yQEY
 PopUbwG/DgAK5g5WG4ercd0W45OC4l1Jzeyhd9hZBhdW4q785jrB5St7mBiIX3Pl0mjr
 DYZmpBGMIOvj3cSIz8MdL7KBRYS05q82ffnHnNfJeHw2TGpDTdTe7vsC8zp+l/W5jlDR
 J44KmQSSCCvY7SKWNe9s+q8YpdiWYttaxjQv5K1jwbYEQ8rp3xE8/qQagv7+ye/g97YA
 96eg==
X-Gm-Message-State: AOAM533BfShwAEmluI9QACp7zZgNrijKYcWFaRu8CLFiWgB6f8ZC07vs
 gtn3x5pWZ9JM8zgHcJ1vd5rN8XlU9MORTC0oPxOLLDTVddc=
X-Google-Smtp-Source: ABdhPJxCVg/RPaOdUjuB3RtMPjzKJEnGUQvlSAWsRIpeuolWgYGSL0ufM7ifZ5XsFzbRArBqlwgOgTVQfYhkkxnN4g8=
X-Received: by 2002:a1f:cbc1:: with SMTP id b184mr6589979vkg.16.1625416987643; 
 Sun, 04 Jul 2021 09:43:07 -0700 (PDT)
MIME-Version: 1.0
From: Richard Zak <richard.j.zak@gmail.com>
Date: Sun, 4 Jul 2021 12:42:56 -0400
Message-ID: <CAOakUfO=C+pgcwopdTCrsH3vtFuFWo8QQBU8kEjnE=_3q-mMYg@mail.gmail.com>
Subject: [PATCH 1/2 v3] Configure script for Haiku
To: QEMU Developers <qemu-devel@nongnu.org>
Content-Type: multipart/alternative; boundary="0000000000002912af05c64ee25b"
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
Cc: Thomas Huth <thuth@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--0000000000002912af05c64ee25b
Content-Type: text/plain; charset="UTF-8"

Use system capstone, for which a port is maintained by Haiku. Disable TPM
which isn't supported.

Signed-off-by: Richard Zak <richard.j.zak@gmail.com>
---
 configure | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/configure b/configure
index e799d908a3..c928071f69 100755
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
@@ -769,6 +770,8 @@ SunOS)
 ;;
 Haiku)
   haiku="yes"
+  tpm="no"
+  capstone="system"
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

--0000000000002912af05c64ee25b
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Use system capstone, for which a port is maintained b=
y Haiku. Disable TPM which isn&#39;t supported.<br></div><div><br></div><di=
v>Signed-off-by: Richard Zak &lt;<a href=3D"mailto:richard.j.zak@gmail.com"=
>richard.j.zak@gmail.com</a>&gt;</div>---<br>=C2=A0configure | 3 +++<br>=C2=
=A01 file changed, 3 insertions(+)<br><br>diff --git a/configure b/configur=
e<br>index e799d908a3..c928071f69 100755<br>--- a/configure<br>+++ b/config=
ure<br>@@ -358,6 +358,7 @@ oss_lib=3D&quot;&quot;<br>=C2=A0bsd=3D&quot;no&q=
uot;<br>=C2=A0linux=3D&quot;no&quot;<br>=C2=A0solaris=3D&quot;no&quot;<br>+=
haiku=3D&quot;no&quot;<br>=C2=A0profiler=3D&quot;no&quot;<br>=C2=A0cocoa=3D=
&quot;auto&quot;<br>=C2=A0softmmu=3D&quot;yes&quot;<br>@@ -769,6 +770,8 @@ =
SunOS)<br>=C2=A0;;<br>=C2=A0Haiku)<br>=C2=A0 =C2=A0haiku=3D&quot;yes&quot;<=
br>+ =C2=A0tpm=3D&quot;no&quot;<br>+ =C2=A0capstone=3D&quot;system&quot;<br=
>=C2=A0 =C2=A0QEMU_CFLAGS=3D&quot;-DB_USE_POSITIVE_POSIX_ERRORS -D_BSD_SOUR=
CE $QEMU_CFLAGS&quot;<br>=C2=A0;;<br>=C2=A0Linux)<br>-- <br>2.25.1<br clear=
=3D"all"><br>-- <br><div dir=3D"ltr" class=3D"gmail_signature" data-smartma=
il=3D"gmail_signature"><div dir=3D"ltr"><div><div dir=3D"ltr"><div><div dir=
=3D"ltr"><div>Regards,<br><br>Richard J. Zak<br>Professional Genius</div><d=
iv>PGP Key:=C2=A0<a href=3D"https://keybase.io/rjzak/key.asc" target=3D"_bl=
ank">https://keybase.io/rjzak/key.asc</a></div></div></div></div></div></di=
v></div></div>

--0000000000002912af05c64ee25b--

