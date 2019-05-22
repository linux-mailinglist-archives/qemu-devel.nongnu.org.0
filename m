Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D87C425D7B
	for <lists+qemu-devel@lfdr.de>; Wed, 22 May 2019 07:18:48 +0200 (CEST)
Received: from localhost ([127.0.0.1]:36226 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hTJeK-0005xi-1H
	for lists+qemu-devel@lfdr.de; Wed, 22 May 2019 01:18:48 -0400
Received: from eggs.gnu.org ([209.51.188.92]:47764)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <dgibson@ozlabs.org>) id 1hTJ9L-0003lA-Oe
	for qemu-devel@nongnu.org; Wed, 22 May 2019 00:46:48 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <dgibson@ozlabs.org>) id 1hTJ9K-0006yB-Ct
	for qemu-devel@nongnu.org; Wed, 22 May 2019 00:46:47 -0400
Received: from ozlabs.org ([203.11.71.1]:55725)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <dgibson@ozlabs.org>)
	id 1hTJ9K-0006wX-2P; Wed, 22 May 2019 00:46:46 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
	id 4580T123rxz9sPb; Wed, 22 May 2019 14:46:09 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
	d=gibson.dropbear.id.au; s=201602; t=1558500373;
	bh=RiYF6y127JDdRmGpDivNEvRY1BoNuZWjbpiaLNBb2Kk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=ZgJ2YdYZS7LeTyd2q6xb6+DkWOCacGi92jCfqlCHJ1uWAZtacgqKOjhaNqal8L4IZ
	B3mXqj6si+oQDRvaCqzBbfhJkJIoAzdBDeTgb0K/cSuafuCxiEirk5CXDbkljonVfa
	XJ2HVmbScF1ku1EqXa2ouP13TSWsPEc9+cMx3rV4=
From: David Gibson <david@gibson.dropbear.id.au>
To: peter.maydell@linaro.org
Date: Wed, 22 May 2019 14:45:25 +1000
Message-Id: <20190522044600.16534-4-david@gibson.dropbear.id.au>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190522044600.16534-1-david@gibson.dropbear.id.au>
References: <20190522044600.16534-1-david@gibson.dropbear.id.au>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 203.11.71.1
Subject: [Qemu-devel] [PULL 03/38] configure: Use quotes around uses of
 $CPU_CFLAGS
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: lvivier@redhat.com, Richard Henderson <richard.henderson@linaro.org>,
	qemu-devel@nongnu.org, groug@kaod.org, qemu-ppc@nongnu.org,
	clg@kaod.org, David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Richard Henderson <richard.henderson@linaro.org>

About half of the values to which CPU_CFLAGS is set
have multiple space separated arguments.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20190501223819.8584-3-richard.henderson@linaro.org>
Signed-off-by: David Gibson <david@gibson.dropbear.id.au>
---
 configure | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/configure b/configure
index 69402f18b8..d0050f9afc 100755
--- a/configure
+++ b/configure
@@ -1556,37 +1556,37 @@ case "$cpu" in
            CPU_CFLAGS=3D"-m64"
            LDFLAGS=3D"-m64 $LDFLAGS"
            cross_cc_ppc64=3D$cc
-           cross_cc_cflags_ppc64=3D$CPU_CFLAGS
+           cross_cc_cflags_ppc64=3D"$CPU_CFLAGS"
            ;;
     sparc)
            CPU_CFLAGS=3D"-m32 -mv8plus -mcpu=3Dultrasparc"
            LDFLAGS=3D"-m32 -mv8plus $LDFLAGS"
            cross_cc_sparc=3D$cc
-           cross_cc_cflags_sparc=3D$CPU_CFLAGS
+           cross_cc_cflags_sparc=3D"$CPU_CFLAGS"
            ;;
     sparc64)
            CPU_CFLAGS=3D"-m64 -mcpu=3Dultrasparc"
            LDFLAGS=3D"-m64 $LDFLAGS"
            cross_cc_sparc64=3D$cc
-           cross_cc_cflags_sparc64=3D$CPU_CFLAGS
+           cross_cc_cflags_sparc64=3D"$CPU_CFLAGS"
            ;;
     s390)
            CPU_CFLAGS=3D"-m31"
            LDFLAGS=3D"-m31 $LDFLAGS"
            cross_cc_s390=3D$cc
-           cross_cc_cflags_s390=3D$CPU_CFLAGS
+           cross_cc_cflags_s390=3D"$CPU_CFLAGS"
            ;;
     s390x)
            CPU_CFLAGS=3D"-m64"
            LDFLAGS=3D"-m64 $LDFLAGS"
            cross_cc_s390x=3D$cc
-           cross_cc_cflags_s390x=3D$CPU_CFLAGS
+           cross_cc_cflags_s390x=3D"$CPU_CFLAGS"
            ;;
     i386)
            CPU_CFLAGS=3D"-m32"
            LDFLAGS=3D"-m32 $LDFLAGS"
            cross_cc_i386=3D$cc
-           cross_cc_cflags_i386=3D$CPU_CFLAGS
+           cross_cc_cflags_i386=3D"$CPU_CFLAGS"
            ;;
     x86_64)
            # ??? Only extremely old AMD cpus do not have cmpxchg16b.
@@ -1595,13 +1595,13 @@ case "$cpu" in
            CPU_CFLAGS=3D"-m64 -mcx16"
            LDFLAGS=3D"-m64 $LDFLAGS"
            cross_cc_x86_64=3D$cc
-           cross_cc_cflags_x86_64=3D$CPU_CFLAGS
+           cross_cc_cflags_x86_64=3D"$CPU_CFLAGS"
            ;;
     x32)
            CPU_CFLAGS=3D"-mx32"
            LDFLAGS=3D"-mx32 $LDFLAGS"
            cross_cc_i386=3D$cc
-           cross_cc_cflags_i386=3D$CPU_CFLAGS
+           cross_cc_cflags_i386=3D"$CPU_CFLAGS"
            ;;
     # No special flags required for other host CPUs
 esac
--=20
2.21.0


