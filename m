Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AD6A65CF15
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Jul 2019 14:06:14 +0200 (CEST)
Received: from localhost ([::1]:52038 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hiHY5-000384-SM
	for lists+qemu-devel@lfdr.de; Tue, 02 Jul 2019 08:06:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35934)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <aleksandar.markovic@rt-rk.com>) id 1hiHKD-00016K-CO
 for qemu-devel@nongnu.org; Tue, 02 Jul 2019 07:51:55 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <aleksandar.markovic@rt-rk.com>) id 1hiHKB-0006nL-4n
 for qemu-devel@nongnu.org; Tue, 02 Jul 2019 07:51:53 -0400
Received: from mx2.rt-rk.com ([89.216.37.149]:41061 helo=mail.rt-rk.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <aleksandar.markovic@rt-rk.com>)
 id 1hiHKA-0005Kg-MN
 for qemu-devel@nongnu.org; Tue, 02 Jul 2019 07:51:51 -0400
Received: from localhost (localhost [127.0.0.1])
 by mail.rt-rk.com (Postfix) with ESMTP id 19ADA1A21EC;
 Tue,  2 Jul 2019 13:50:45 +0200 (CEST)
X-Virus-Scanned: amavisd-new at rt-rk.com
Received: from rtrkw774-lin.domain.local (rtrkw774-lin.domain.local
 [10.10.13.43])
 by mail.rt-rk.com (Postfix) with ESMTPSA id 8F6C71A2429;
 Tue,  2 Jul 2019 13:50:33 +0200 (CEST)
From: Aleksandar Markovic <aleksandar.markovic@rt-rk.com>
To: qemu-devel@nongnu.org,
	arikalo@wavecomp.com
Date: Tue,  2 Jul 2019 13:50:09 +0200
Message-Id: <1562068213-11307-4-git-send-email-aleksandar.markovic@rt-rk.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1562068213-11307-1-git-send-email-aleksandar.markovic@rt-rk.com>
References: <1562068213-11307-1-git-send-email-aleksandar.markovic@rt-rk.com>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 89.216.37.149
Subject: [Qemu-devel] [PATCH v2 3/7] tcg/tests: target/mips: Correct MSA
 test compilation and execution order
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
Cc: amarkovic@wavecomp.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Aleksandar Markovic <amarkovic@wavecomp.com>

Correct MSA test compilation and execution order, for the sake of
consistence.

Signed-off-by: Aleksandar Markovic <amarkovic@wavecomp.com>
Reviewed-by: Aleksandar Rikalo <arikalo@wavecomp.com>
---
 tests/tcg/mips/user/ase/msa/test_msa_compile_32r6eb.sh | 16 ++++++++--------
 tests/tcg/mips/user/ase/msa/test_msa_compile_32r6el.sh | 16 ++++++++--------
 tests/tcg/mips/user/ase/msa/test_msa_compile_64r6eb.sh | 16 ++++++++--------
 tests/tcg/mips/user/ase/msa/test_msa_compile_64r6el.sh | 16 ++++++++--------
 tests/tcg/mips/user/ase/msa/test_msa_run_32r6eb.sh     |  8 ++++----
 tests/tcg/mips/user/ase/msa/test_msa_run_32r6el.sh     |  8 ++++----
 tests/tcg/mips/user/ase/msa/test_msa_run_64r6eb.sh     |  8 ++++----
 tests/tcg/mips/user/ase/msa/test_msa_run_64r6el.sh     |  8 ++++----
 8 files changed, 48 insertions(+), 48 deletions(-)

diff --git a/tests/tcg/mips/user/ase/msa/test_msa_compile_32r6eb.sh b/tests/tcg/mips/user/ase/msa/test_msa_compile_32r6eb.sh
index 537267c..2519213 100755
--- a/tests/tcg/mips/user/ase/msa/test_msa_compile_32r6eb.sh
+++ b/tests/tcg/mips/user/ase/msa/test_msa_compile_32r6eb.sh
@@ -486,14 +486,6 @@
 -EB -static -mabi=32 -march=mips32r6 -mmsa -o  /tmp/test_msa_subs_u_w_32r6eb
 /opt/img/bin/mips-img-linux-gnu-gcc    int-subtract/test_msa_subs_u_d.c        \
 -EB -static -mabi=32 -march=mips32r6 -mmsa -o  /tmp/test_msa_subs_u_d_32r6eb
-/opt/img/bin/mips-img-linux-gnu-gcc    int-subtract/test_msa_subsuu_s_b.c      \
--EB -static -mabi=32 -march=mips32r6 -mmsa -o  /tmp/test_msa_subsuu_s_b_32r6eb
-/opt/img/bin/mips-img-linux-gnu-gcc    int-subtract/test_msa_subsuu_s_h.c      \
--EB -static -mabi=32 -march=mips32r6 -mmsa -o  /tmp/test_msa_subsuu_s_h_32r6eb
-/opt/img/bin/mips-img-linux-gnu-gcc    int-subtract/test_msa_subsuu_s_w.c      \
--EB -static -mabi=32 -march=mips32r6 -mmsa -o  /tmp/test_msa_subsuu_s_w_32r6eb
-/opt/img/bin/mips-img-linux-gnu-gcc    int-subtract/test_msa_subsuu_s_d.c      \
--EB -static -mabi=32 -march=mips32r6 -mmsa -o  /tmp/test_msa_subsuu_s_d_32r6eb
 /opt/img/bin/mips-img-linux-gnu-gcc    int-subtract/test_msa_subsus_u_b.c      \
 -EB -static -mabi=32 -march=mips32r6 -mmsa -o  /tmp/test_msa_subsus_u_b_32r6eb
 /opt/img/bin/mips-img-linux-gnu-gcc    int-subtract/test_msa_subsus_u_h.c      \
@@ -502,6 +494,14 @@
 -EB -static -mabi=32 -march=mips32r6 -mmsa -o  /tmp/test_msa_subsus_u_w_32r6eb
 /opt/img/bin/mips-img-linux-gnu-gcc    int-subtract/test_msa_subsus_u_d.c      \
 -EB -static -mabi=32 -march=mips32r6 -mmsa -o  /tmp/test_msa_subsus_u_d_32r6eb
+/opt/img/bin/mips-img-linux-gnu-gcc    int-subtract/test_msa_subsuu_s_b.c      \
+-EB -static -mabi=32 -march=mips32r6 -mmsa -o  /tmp/test_msa_subsuu_s_b_32r6eb
+/opt/img/bin/mips-img-linux-gnu-gcc    int-subtract/test_msa_subsuu_s_h.c      \
+-EB -static -mabi=32 -march=mips32r6 -mmsa -o  /tmp/test_msa_subsuu_s_h_32r6eb
+/opt/img/bin/mips-img-linux-gnu-gcc    int-subtract/test_msa_subsuu_s_w.c      \
+-EB -static -mabi=32 -march=mips32r6 -mmsa -o  /tmp/test_msa_subsuu_s_w_32r6eb
+/opt/img/bin/mips-img-linux-gnu-gcc    int-subtract/test_msa_subsuu_s_d.c      \
+-EB -static -mabi=32 -march=mips32r6 -mmsa -o  /tmp/test_msa_subsuu_s_d_32r6eb
 /opt/img/bin/mips-img-linux-gnu-gcc    int-subtract/test_msa_subv_b.c          \
 -EB -static -mabi=32 -march=mips32r6 -mmsa -o  /tmp/test_msa_subv_b_32r6eb
 /opt/img/bin/mips-img-linux-gnu-gcc    int-subtract/test_msa_subv_h.c          \
diff --git a/tests/tcg/mips/user/ase/msa/test_msa_compile_32r6el.sh b/tests/tcg/mips/user/ase/msa/test_msa_compile_32r6el.sh
index 49f8aa0..1e10ff7 100755
--- a/tests/tcg/mips/user/ase/msa/test_msa_compile_32r6el.sh
+++ b/tests/tcg/mips/user/ase/msa/test_msa_compile_32r6el.sh
@@ -486,14 +486,6 @@
 -EL -static -mabi=32 -march=mips32r6 -mmsa -o  /tmp/test_msa_subs_u_w_32r6el
 /opt/img/bin/mips-img-linux-gnu-gcc    int-subtract/test_msa_subs_u_d.c        \
 -EL -static -mabi=32 -march=mips32r6 -mmsa -o  /tmp/test_msa_subs_u_d_32r6el
-/opt/img/bin/mips-img-linux-gnu-gcc    int-subtract/test_msa_subsuu_s_b.c      \
--EL -static -mabi=32 -march=mips32r6 -mmsa -o  /tmp/test_msa_subsuu_s_b_32r6el
-/opt/img/bin/mips-img-linux-gnu-gcc    int-subtract/test_msa_subsuu_s_h.c      \
--EL -static -mabi=32 -march=mips32r6 -mmsa -o  /tmp/test_msa_subsuu_s_h_32r6el
-/opt/img/bin/mips-img-linux-gnu-gcc    int-subtract/test_msa_subsuu_s_w.c      \
--EL -static -mabi=32 -march=mips32r6 -mmsa -o  /tmp/test_msa_subsuu_s_w_32r6el
-/opt/img/bin/mips-img-linux-gnu-gcc    int-subtract/test_msa_subsuu_s_d.c      \
--EL -static -mabi=32 -march=mips32r6 -mmsa -o  /tmp/test_msa_subsuu_s_d_32r6el
 /opt/img/bin/mips-img-linux-gnu-gcc    int-subtract/test_msa_subsus_u_b.c      \
 -EL -static -mabi=32 -march=mips32r6 -mmsa -o  /tmp/test_msa_subsus_u_b_32r6el
 /opt/img/bin/mips-img-linux-gnu-gcc    int-subtract/test_msa_subsus_u_h.c      \
@@ -502,6 +494,14 @@
 -EL -static -mabi=32 -march=mips32r6 -mmsa -o  /tmp/test_msa_subsus_u_w_32r6el
 /opt/img/bin/mips-img-linux-gnu-gcc    int-subtract/test_msa_subsus_u_d.c      \
 -EL -static -mabi=32 -march=mips32r6 -mmsa -o  /tmp/test_msa_subsus_u_d_32r6el
+/opt/img/bin/mips-img-linux-gnu-gcc    int-subtract/test_msa_subsuu_s_b.c      \
+-EL -static -mabi=32 -march=mips32r6 -mmsa -o  /tmp/test_msa_subsuu_s_b_32r6el
+/opt/img/bin/mips-img-linux-gnu-gcc    int-subtract/test_msa_subsuu_s_h.c      \
+-EL -static -mabi=32 -march=mips32r6 -mmsa -o  /tmp/test_msa_subsuu_s_h_32r6el
+/opt/img/bin/mips-img-linux-gnu-gcc    int-subtract/test_msa_subsuu_s_w.c      \
+-EL -static -mabi=32 -march=mips32r6 -mmsa -o  /tmp/test_msa_subsuu_s_w_32r6el
+/opt/img/bin/mips-img-linux-gnu-gcc    int-subtract/test_msa_subsuu_s_d.c      \
+-EL -static -mabi=32 -march=mips32r6 -mmsa -o  /tmp/test_msa_subsuu_s_d_32r6el
 /opt/img/bin/mips-img-linux-gnu-gcc    int-subtract/test_msa_subv_b.c          \
 -EL -static -mabi=32 -march=mips32r6 -mmsa -o  /tmp/test_msa_subv_b_32r6el
 /opt/img/bin/mips-img-linux-gnu-gcc    int-subtract/test_msa_subv_h.c          \
diff --git a/tests/tcg/mips/user/ase/msa/test_msa_compile_64r6eb.sh b/tests/tcg/mips/user/ase/msa/test_msa_compile_64r6eb.sh
index f4346d6..6bc8907 100755
--- a/tests/tcg/mips/user/ase/msa/test_msa_compile_64r6eb.sh
+++ b/tests/tcg/mips/user/ase/msa/test_msa_compile_64r6eb.sh
@@ -486,14 +486,6 @@
 -EB -static -mabi=64 -march=mips64r6 -mmsa -o  /tmp/test_msa_subs_u_w_64r6eb
 /opt/img/bin/mips-img-linux-gnu-gcc    int-subtract/test_msa_subs_u_d.c        \
 -EB -static -mabi=64 -march=mips64r6 -mmsa -o  /tmp/test_msa_subs_u_d_64r6eb
-/opt/img/bin/mips-img-linux-gnu-gcc    int-subtract/test_msa_subsuu_s_b.c      \
--EB -static -mabi=64 -march=mips64r6 -mmsa -o  /tmp/test_msa_subsuu_s_b_64r6eb
-/opt/img/bin/mips-img-linux-gnu-gcc    int-subtract/test_msa_subsuu_s_h.c      \
--EB -static -mabi=64 -march=mips64r6 -mmsa -o  /tmp/test_msa_subsuu_s_h_64r6eb
-/opt/img/bin/mips-img-linux-gnu-gcc    int-subtract/test_msa_subsuu_s_w.c      \
--EB -static -mabi=64 -march=mips64r6 -mmsa -o  /tmp/test_msa_subsuu_s_w_64r6eb
-/opt/img/bin/mips-img-linux-gnu-gcc    int-subtract/test_msa_subsuu_s_d.c      \
--EB -static -mabi=64 -march=mips64r6 -mmsa -o  /tmp/test_msa_subsuu_s_d_64r6eb
 /opt/img/bin/mips-img-linux-gnu-gcc    int-subtract/test_msa_subsus_u_b.c      \
 -EB -static -mabi=64 -march=mips64r6 -mmsa -o  /tmp/test_msa_subsus_u_b_64r6eb
 /opt/img/bin/mips-img-linux-gnu-gcc    int-subtract/test_msa_subsus_u_h.c      \
@@ -502,6 +494,14 @@
 -EB -static -mabi=64 -march=mips64r6 -mmsa -o  /tmp/test_msa_subsus_u_w_64r6eb
 /opt/img/bin/mips-img-linux-gnu-gcc    int-subtract/test_msa_subsus_u_d.c      \
 -EB -static -mabi=64 -march=mips64r6 -mmsa -o  /tmp/test_msa_subsus_u_d_64r6eb
+/opt/img/bin/mips-img-linux-gnu-gcc    int-subtract/test_msa_subsuu_s_b.c      \
+-EB -static -mabi=64 -march=mips64r6 -mmsa -o  /tmp/test_msa_subsuu_s_b_64r6eb
+/opt/img/bin/mips-img-linux-gnu-gcc    int-subtract/test_msa_subsuu_s_h.c      \
+-EB -static -mabi=64 -march=mips64r6 -mmsa -o  /tmp/test_msa_subsuu_s_h_64r6eb
+/opt/img/bin/mips-img-linux-gnu-gcc    int-subtract/test_msa_subsuu_s_w.c      \
+-EB -static -mabi=64 -march=mips64r6 -mmsa -o  /tmp/test_msa_subsuu_s_w_64r6eb
+/opt/img/bin/mips-img-linux-gnu-gcc    int-subtract/test_msa_subsuu_s_d.c      \
+-EB -static -mabi=64 -march=mips64r6 -mmsa -o  /tmp/test_msa_subsuu_s_d_64r6eb
 /opt/img/bin/mips-img-linux-gnu-gcc    int-subtract/test_msa_subv_b.c          \
 -EB -static -mabi=64 -march=mips64r6 -mmsa -o  /tmp/test_msa_subv_b_64r6eb
 /opt/img/bin/mips-img-linux-gnu-gcc    int-subtract/test_msa_subv_h.c          \
diff --git a/tests/tcg/mips/user/ase/msa/test_msa_compile_64r6el.sh b/tests/tcg/mips/user/ase/msa/test_msa_compile_64r6el.sh
index 2912b17..4a92c55 100755
--- a/tests/tcg/mips/user/ase/msa/test_msa_compile_64r6el.sh
+++ b/tests/tcg/mips/user/ase/msa/test_msa_compile_64r6el.sh
@@ -486,14 +486,6 @@
 -EL -static -mabi=64 -march=mips64r6 -mmsa -o  /tmp/test_msa_subs_u_w_64r6el
 /opt/img/bin/mips-img-linux-gnu-gcc    int-subtract/test_msa_subs_u_d.c        \
 -EL -static -mabi=64 -march=mips64r6 -mmsa -o  /tmp/test_msa_subs_u_d_64r6el
-/opt/img/bin/mips-img-linux-gnu-gcc    int-subtract/test_msa_subsuu_s_b.c      \
--EL -static -mabi=64 -march=mips64r6 -mmsa -o  /tmp/test_msa_subsuu_s_b_64r6el
-/opt/img/bin/mips-img-linux-gnu-gcc    int-subtract/test_msa_subsuu_s_h.c      \
--EL -static -mabi=64 -march=mips64r6 -mmsa -o  /tmp/test_msa_subsuu_s_h_64r6el
-/opt/img/bin/mips-img-linux-gnu-gcc    int-subtract/test_msa_subsuu_s_w.c      \
--EL -static -mabi=64 -march=mips64r6 -mmsa -o  /tmp/test_msa_subsuu_s_w_64r6el
-/opt/img/bin/mips-img-linux-gnu-gcc    int-subtract/test_msa_subsuu_s_d.c      \
--EL -static -mabi=64 -march=mips64r6 -mmsa -o  /tmp/test_msa_subsuu_s_d_64r6el
 /opt/img/bin/mips-img-linux-gnu-gcc    int-subtract/test_msa_subsus_u_b.c      \
 -EL -static -mabi=64 -march=mips64r6 -mmsa -o  /tmp/test_msa_subsus_u_b_64r6el
 /opt/img/bin/mips-img-linux-gnu-gcc    int-subtract/test_msa_subsus_u_h.c      \
@@ -502,6 +494,14 @@
 -EL -static -mabi=64 -march=mips64r6 -mmsa -o  /tmp/test_msa_subsus_u_w_64r6el
 /opt/img/bin/mips-img-linux-gnu-gcc    int-subtract/test_msa_subsus_u_d.c      \
 -EL -static -mabi=64 -march=mips64r6 -mmsa -o  /tmp/test_msa_subsus_u_d_64r6el
+/opt/img/bin/mips-img-linux-gnu-gcc    int-subtract/test_msa_subsuu_s_b.c      \
+-EL -static -mabi=64 -march=mips64r6 -mmsa -o  /tmp/test_msa_subsuu_s_b_64r6el
+/opt/img/bin/mips-img-linux-gnu-gcc    int-subtract/test_msa_subsuu_s_h.c      \
+-EL -static -mabi=64 -march=mips64r6 -mmsa -o  /tmp/test_msa_subsuu_s_h_64r6el
+/opt/img/bin/mips-img-linux-gnu-gcc    int-subtract/test_msa_subsuu_s_w.c      \
+-EL -static -mabi=64 -march=mips64r6 -mmsa -o  /tmp/test_msa_subsuu_s_w_64r6el
+/opt/img/bin/mips-img-linux-gnu-gcc    int-subtract/test_msa_subsuu_s_d.c      \
+-EL -static -mabi=64 -march=mips64r6 -mmsa -o  /tmp/test_msa_subsuu_s_d_64r6el
 /opt/img/bin/mips-img-linux-gnu-gcc    int-subtract/test_msa_subv_b.c          \
 -EL -static -mabi=64 -march=mips64r6 -mmsa -o  /tmp/test_msa_subv_b_64r6el
 /opt/img/bin/mips-img-linux-gnu-gcc    int-subtract/test_msa_subv_h.c          \
diff --git a/tests/tcg/mips/user/ase/msa/test_msa_run_32r6eb.sh b/tests/tcg/mips/user/ase/msa/test_msa_run_32r6eb.sh
index e979762..6c95e45 100644
--- a/tests/tcg/mips/user/ase/msa/test_msa_run_32r6eb.sh
+++ b/tests/tcg/mips/user/ase/msa/test_msa_run_32r6eb.sh
@@ -279,14 +279,14 @@ $PATH_TO_QEMU -cpu I6400  /tmp/test_msa_subs_u_b_32r6eb
 $PATH_TO_QEMU -cpu I6400  /tmp/test_msa_subs_u_h_32r6eb
 $PATH_TO_QEMU -cpu I6400  /tmp/test_msa_subs_u_w_32r6eb
 $PATH_TO_QEMU -cpu I6400  /tmp/test_msa_subs_u_d_32r6eb
-$PATH_TO_QEMU -cpu I6400  /tmp/test_msa_subsuu_s_b_32r6eb
-$PATH_TO_QEMU -cpu I6400  /tmp/test_msa_subsuu_s_h_32r6eb
-$PATH_TO_QEMU -cpu I6400  /tmp/test_msa_subsuu_s_w_32r6eb
-$PATH_TO_QEMU -cpu I6400  /tmp/test_msa_subsuu_s_d_32r6eb
 $PATH_TO_QEMU -cpu I6400  /tmp/test_msa_subsus_u_b_32r6eb
 $PATH_TO_QEMU -cpu I6400  /tmp/test_msa_subsus_u_h_32r6eb
 $PATH_TO_QEMU -cpu I6400  /tmp/test_msa_subsus_u_w_32r6eb
 $PATH_TO_QEMU -cpu I6400  /tmp/test_msa_subsus_u_d_32r6eb
+$PATH_TO_QEMU -cpu I6400  /tmp/test_msa_subsuu_s_b_32r6eb
+$PATH_TO_QEMU -cpu I6400  /tmp/test_msa_subsuu_s_h_32r6eb
+$PATH_TO_QEMU -cpu I6400  /tmp/test_msa_subsuu_s_w_32r6eb
+$PATH_TO_QEMU -cpu I6400  /tmp/test_msa_subsuu_s_d_32r6eb
 $PATH_TO_QEMU -cpu I6400  /tmp/test_msa_subv_b_32r6eb
 $PATH_TO_QEMU -cpu I6400  /tmp/test_msa_subv_h_32r6eb
 $PATH_TO_QEMU -cpu I6400  /tmp/test_msa_subv_w_32r6eb
diff --git a/tests/tcg/mips/user/ase/msa/test_msa_run_32r6el.sh b/tests/tcg/mips/user/ase/msa/test_msa_run_32r6el.sh
index 0e3e0e2..d4945da 100755
--- a/tests/tcg/mips/user/ase/msa/test_msa_run_32r6el.sh
+++ b/tests/tcg/mips/user/ase/msa/test_msa_run_32r6el.sh
@@ -279,14 +279,14 @@ $PATH_TO_QEMU -cpu I6400  /tmp/test_msa_subs_u_b_32r6el
 $PATH_TO_QEMU -cpu I6400  /tmp/test_msa_subs_u_h_32r6el
 $PATH_TO_QEMU -cpu I6400  /tmp/test_msa_subs_u_w_32r6el
 $PATH_TO_QEMU -cpu I6400  /tmp/test_msa_subs_u_d_32r6el
-$PATH_TO_QEMU -cpu I6400  /tmp/test_msa_subsuu_s_b_32r6el
-$PATH_TO_QEMU -cpu I6400  /tmp/test_msa_subsuu_s_h_32r6el
-$PATH_TO_QEMU -cpu I6400  /tmp/test_msa_subsuu_s_w_32r6el
-$PATH_TO_QEMU -cpu I6400  /tmp/test_msa_subsuu_s_d_32r6el
 $PATH_TO_QEMU -cpu I6400  /tmp/test_msa_subsus_u_b_32r6el
 $PATH_TO_QEMU -cpu I6400  /tmp/test_msa_subsus_u_h_32r6el
 $PATH_TO_QEMU -cpu I6400  /tmp/test_msa_subsus_u_w_32r6el
 $PATH_TO_QEMU -cpu I6400  /tmp/test_msa_subsus_u_d_32r6el
+$PATH_TO_QEMU -cpu I6400  /tmp/test_msa_subsuu_s_b_32r6el
+$PATH_TO_QEMU -cpu I6400  /tmp/test_msa_subsuu_s_h_32r6el
+$PATH_TO_QEMU -cpu I6400  /tmp/test_msa_subsuu_s_w_32r6el
+$PATH_TO_QEMU -cpu I6400  /tmp/test_msa_subsuu_s_d_32r6el
 $PATH_TO_QEMU -cpu I6400  /tmp/test_msa_subv_b_32r6el
 $PATH_TO_QEMU -cpu I6400  /tmp/test_msa_subv_h_32r6el
 $PATH_TO_QEMU -cpu I6400  /tmp/test_msa_subv_w_32r6el
diff --git a/tests/tcg/mips/user/ase/msa/test_msa_run_64r6eb.sh b/tests/tcg/mips/user/ase/msa/test_msa_run_64r6eb.sh
index e58f177..6de6d7c 100755
--- a/tests/tcg/mips/user/ase/msa/test_msa_run_64r6eb.sh
+++ b/tests/tcg/mips/user/ase/msa/test_msa_run_64r6eb.sh
@@ -279,14 +279,14 @@ $PATH_TO_QEMU -cpu I6400  /tmp/test_msa_subs_u_b_64r6eb
 $PATH_TO_QEMU -cpu I6400  /tmp/test_msa_subs_u_h_64r6eb
 $PATH_TO_QEMU -cpu I6400  /tmp/test_msa_subs_u_w_64r6eb
 $PATH_TO_QEMU -cpu I6400  /tmp/test_msa_subs_u_d_64r6eb
-$PATH_TO_QEMU -cpu I6400  /tmp/test_msa_subsuu_s_b_64r6eb
-$PATH_TO_QEMU -cpu I6400  /tmp/test_msa_subsuu_s_h_64r6eb
-$PATH_TO_QEMU -cpu I6400  /tmp/test_msa_subsuu_s_w_64r6eb
-$PATH_TO_QEMU -cpu I6400  /tmp/test_msa_subsuu_s_d_64r6eb
 $PATH_TO_QEMU -cpu I6400  /tmp/test_msa_subsus_u_b_64r6eb
 $PATH_TO_QEMU -cpu I6400  /tmp/test_msa_subsus_u_h_64r6eb
 $PATH_TO_QEMU -cpu I6400  /tmp/test_msa_subsus_u_w_64r6eb
 $PATH_TO_QEMU -cpu I6400  /tmp/test_msa_subsus_u_d_64r6eb
+$PATH_TO_QEMU -cpu I6400  /tmp/test_msa_subsuu_s_b_64r6eb
+$PATH_TO_QEMU -cpu I6400  /tmp/test_msa_subsuu_s_h_64r6eb
+$PATH_TO_QEMU -cpu I6400  /tmp/test_msa_subsuu_s_w_64r6eb
+$PATH_TO_QEMU -cpu I6400  /tmp/test_msa_subsuu_s_d_64r6eb
 $PATH_TO_QEMU -cpu I6400  /tmp/test_msa_subv_b_64r6eb
 $PATH_TO_QEMU -cpu I6400  /tmp/test_msa_subv_h_64r6eb
 $PATH_TO_QEMU -cpu I6400  /tmp/test_msa_subv_w_64r6eb
diff --git a/tests/tcg/mips/user/ase/msa/test_msa_run_64r6el.sh b/tests/tcg/mips/user/ase/msa/test_msa_run_64r6el.sh
index 7a89bd6..979057d 100755
--- a/tests/tcg/mips/user/ase/msa/test_msa_run_64r6el.sh
+++ b/tests/tcg/mips/user/ase/msa/test_msa_run_64r6el.sh
@@ -279,14 +279,14 @@ $PATH_TO_QEMU -cpu I6400  /tmp/test_msa_subs_u_b_64r6el
 $PATH_TO_QEMU -cpu I6400  /tmp/test_msa_subs_u_h_64r6el
 $PATH_TO_QEMU -cpu I6400  /tmp/test_msa_subs_u_w_64r6el
 $PATH_TO_QEMU -cpu I6400  /tmp/test_msa_subs_u_d_64r6el
-$PATH_TO_QEMU -cpu I6400  /tmp/test_msa_subsuu_s_b_64r6el
-$PATH_TO_QEMU -cpu I6400  /tmp/test_msa_subsuu_s_h_64r6el
-$PATH_TO_QEMU -cpu I6400  /tmp/test_msa_subsuu_s_w_64r6el
-$PATH_TO_QEMU -cpu I6400  /tmp/test_msa_subsuu_s_d_64r6el
 $PATH_TO_QEMU -cpu I6400  /tmp/test_msa_subsus_u_b_64r6el
 $PATH_TO_QEMU -cpu I6400  /tmp/test_msa_subsus_u_h_64r6el
 $PATH_TO_QEMU -cpu I6400  /tmp/test_msa_subsus_u_w_64r6el
 $PATH_TO_QEMU -cpu I6400  /tmp/test_msa_subsus_u_d_64r6el
+$PATH_TO_QEMU -cpu I6400  /tmp/test_msa_subsuu_s_b_64r6el
+$PATH_TO_QEMU -cpu I6400  /tmp/test_msa_subsuu_s_h_64r6el
+$PATH_TO_QEMU -cpu I6400  /tmp/test_msa_subsuu_s_w_64r6el
+$PATH_TO_QEMU -cpu I6400  /tmp/test_msa_subsuu_s_d_64r6el
 $PATH_TO_QEMU -cpu I6400  /tmp/test_msa_subv_b_64r6el
 $PATH_TO_QEMU -cpu I6400  /tmp/test_msa_subv_h_64r6el
 $PATH_TO_QEMU -cpu I6400  /tmp/test_msa_subv_w_64r6el
-- 
2.7.4


