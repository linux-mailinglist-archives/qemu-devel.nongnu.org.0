Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 59DD534C236
	for <lists+qemu-devel@lfdr.de>; Mon, 29 Mar 2021 05:31:48 +0200 (CEST)
Received: from localhost ([::1]:45488 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lQid1-0005hw-1E
	for lists+qemu-devel@lfdr.de; Sun, 28 Mar 2021 23:31:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39880)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lQic7-0005G0-La
 for qemu-devel@nongnu.org; Sun, 28 Mar 2021 23:30:51 -0400
Received: from indium.canonical.com ([91.189.90.7]:47070)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lQic3-0002ou-6c
 for qemu-devel@nongnu.org; Sun, 28 Mar 2021 23:30:51 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1lQic0-0004Tc-Qh
 for <qemu-devel@nongnu.org>; Mon, 29 Mar 2021 03:30:44 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id C07292E8167
 for <qemu-devel@nongnu.org>; Mon, 29 Mar 2021 03:30:44 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Mon, 29 Mar 2021 03:21:42 -0000
From: Alexander Bulekov <1909247@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=New; importance=Undecided; assignee=None;
X-Launchpad-Bug-Tags: cve fuzzer qemu security
X-Launchpad-Bug-Information-Type: Public Security
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: yes
X-Launchpad-Bug-Commenters: a1xndr mark-cave-ayland mauro-cascella philmd pjps
X-Launchpad-Bug-Reporter: Mauro Matteo Cascella (mauro-cascella)
X-Launchpad-Bug-Modifier: Alexander Bulekov (a1xndr)
References: <160882932286.4370.15587232403500958955.malonedeb@wampee.canonical.com>
 <161667857481.32669.15954116519339833776.malone@soybean.canonical.com>
Message-Id: <20210329032142.430539-1-alxndr@bu.edu>
Subject: [Bug 1909247] [PATCH] tests/qtest: add more tests for am53c974 device
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="21fefc602783aa4ba863a4a6c29d38d788ce04ad"; Instance="production"
X-Launchpad-Hash: eb297a688bbf2da4f763e0ba92cc233c9e96242c
Received-SPF: none client-ip=91.189.90.7; envelope-from=bounces@canonical.com;
 helo=indium.canonical.com
X-Spam_score_int: -66
X-Spam_score: -6.7
X-Spam_bar: ------
X-Spam_report: (-6.7 / 5.0 requ) BAYES_00=-1.9,
 HEADER_FROM_DIFFERENT_DOMAINS=0.249, RCVD_IN_DNSWL_HI=-5,
 RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Reply-To: Bug 1909247 <1909247@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Add some more regression tests for the esp device.

(Prasad's Patch)
Based-on: <161657108250.32717.5311086901810004029.malone@soybean.canonical.=
com>
(Mark's v2 Patchset)
Based-on: <20210317230223.24854-1-mark.cave-ayland@ilande.co.uk>
Signed-off-by: Alexander Bulekov <alxndr@bu.edu>
---

Hi Mark,
Hopefully these are useful. I realized that my previous message was
innacurate (I forgot to apply Prasad's patch, or your v2
patchset). The only corruptions that I am continuing to see are
heap-overflows. I am guessing that most of these are due to some mututal
root cause, so the number of tests far-exceeds the actual number of
errors, but I am providing all of the crashes with unique-looking
stack-traces, just in case.
Please let me know if I can provide anything else that would help.
-Alex

 tests/qtest/am53c974-test.c | 1137 +++++++++++++++++++++++++++++++++++
 1 file changed, 1137 insertions(+)

diff --git a/tests/qtest/am53c974-test.c b/tests/qtest/am53c974-test.c
index c90bd4c187..cb2a5646a6 100644
--- a/tests/qtest/am53c974-test.c
+++ b/tests/qtest/am53c974-test.c
@@ -9,6 +9,1125 @@
 =

 #include "libqos/libqtest.h"
 =

+/*
+ * cat << EOF | ./qemu-system-i386 -display none -machine accel=3Dqtest, -=
m \
+ * 512M -device am53c974,id=3Dscsi -device scsi-hd,drive=3Ddisk0 -drive \
+ * id=3Ddisk0,if=3Dnone,file=3Dnull-co://,format=3Draw -nodefaults -qtest =
stdio
+ * outl 0xcf8 0x80001010
+ * outl 0xcfc 0xc000
+ * outl 0xcf8 0x80001004
+ * outw 0xcfc 0x01
+ * outb 0xc000 0x4
+ * outb 0xc008 0xa0
+ * outl 0xc03f 0x0300
+ * outl 0xc00b 0xc300
+ * outw 0xc00b 0x9000
+ * outl 0xc00b 0xc300
+ * outl 0xc00b 0xc300
+ * outl 0xc00b 0xc300
+ * outw 0xc00b 0x9000
+ * outw 0xc00b 0x1000
+ * EOF
+ */
+static void crash_0900379669(void)
+{
+    QTestState *s =3D qtest_init(
+        "-display none -m 512M -device am53c974,id=3Dscsi -device scsi-hd,=
drive=3Ddisk0 "
+        "-drive id=3Ddisk0,if=3Dnone,file=3Dnull-co://,format=3Draw -nodef=
aults");
+    qtest_outl(s, 0xcf8, 0x80001010);
+    qtest_outl(s, 0xcfc, 0xc000);
+    qtest_outl(s, 0xcf8, 0x80001004);
+    qtest_outw(s, 0xcfc, 0x01);
+    qtest_outb(s, 0xc000, 0x4);
+    qtest_outb(s, 0xc008, 0xa0);
+    qtest_outl(s, 0xc03f, 0x0300);
+    qtest_outl(s, 0xc00b, 0xc300);
+    qtest_outw(s, 0xc00b, 0x9000);
+    qtest_outl(s, 0xc00b, 0xc300);
+    qtest_outl(s, 0xc00b, 0xc300);
+    qtest_outl(s, 0xc00b, 0xc300);
+    qtest_outw(s, 0xc00b, 0x9000);
+    qtest_outw(s, 0xc00b, 0x1000);
+    qtest_quit(s);
+}
+/*
+ * cat << EOF | ./qemu-system-i386 -display none -machine accel=3Dqtest, -=
m \
+ * 512M -device am53c974,id=3Dscsi -device scsi-hd,drive=3Ddisk0 -drive \
+ * id=3Ddisk0,if=3Dnone,file=3Dnull-co://,format=3Draw -nodefaults -qtest =
stdio
+ * outl 0xcf8 0x80001010
+ * outl 0xcfc 0xc000
+ * outl 0xcf8 0x80001004
+ * outw 0xcfc 0x01
+ * outl 0xc008 0x20
+ * outw 0xc000 0x1
+ * outb 0xc040 0x03
+ * outl 0xc00b 0xc200
+ * outl 0xc00b 0xc200
+ * outl 0xc00b 0xc200
+ * outl 0xc00b 0xc200
+ * outl 0xc00b 0xc200
+ * outl 0xc00b 0xc200
+ * outl 0xc00b 0xc200
+ * outl 0xc00b 0xc200
+ * outl 0xc00b 0xc200
+ * outl 0xc00b 0xc200
+ * outl 0xc00b 0xc200
+ * outw 0xc00b 0x4200
+ * outl 0xc00a 0x410000
+ * EOF
+ */
+static void crash_094661a91b(void)
+{
+    QTestState *s =3D qtest_init(
+        "-display none -m 512M -device am53c974,id=3Dscsi -device scsi-hd,=
drive=3Ddisk0 "
+        "-drive id=3Ddisk0,if=3Dnone,file=3Dnull-co://,format=3Draw -nodef=
aults");
+    qtest_outl(s, 0xcf8, 0x80001010);
+    qtest_outl(s, 0xcfc, 0xc000);
+    qtest_outl(s, 0xcf8, 0x80001004);
+    qtest_outw(s, 0xcfc, 0x01);
+    qtest_outl(s, 0xc008, 0x20);
+    qtest_outw(s, 0xc000, 0x1);
+    qtest_outb(s, 0xc040, 0x03);
+    qtest_outl(s, 0xc00b, 0xc200);
+    qtest_outl(s, 0xc00b, 0xc200);
+    qtest_outl(s, 0xc00b, 0xc200);
+    qtest_outl(s, 0xc00b, 0xc200);
+    qtest_outl(s, 0xc00b, 0xc200);
+    qtest_outl(s, 0xc00b, 0xc200);
+    qtest_outl(s, 0xc00b, 0xc200);
+    qtest_outl(s, 0xc00b, 0xc200);
+    qtest_outl(s, 0xc00b, 0xc200);
+    qtest_outl(s, 0xc00b, 0xc200);
+    qtest_outl(s, 0xc00b, 0xc200);
+    qtest_outw(s, 0xc00b, 0x4200);
+    qtest_outl(s, 0xc00a, 0x410000);
+    qtest_quit(s);
+}
+/*
+ * cat << EOF | ./qemu-system-i386 -display none -machine accel=3Dqtest, -=
m \
+ * 512M -device am53c974,id=3Dscsi -device scsi-hd,drive=3Ddisk0 -drive \
+ * id=3Ddisk0,if=3Dnone,file=3Dnull-co://,format=3Draw -nodefaults -qtest =
stdio
+ * outl 0xcf8 0x80001010
+ * outl 0xcfc 0xc000
+ * outl 0xcf8 0x80001004
+ * outw 0xcfc 0x01
+ * outb 0xc000 0x4
+ * outl 0xc007 0x8000
+ * outl 0xc03f 0x0300
+ * outl 0xc00b 0x4300
+ * outw 0xc00b 0x9000
+ * outl 0xc00b 0xc300
+ * outl 0xc00b 0xc300
+ * outl 0xc00b 0xc300
+ * outw 0xc00b 0x9000
+ * outw 0xc00b 0x1000
+ * EOF
+ */
+static void crash_0fff2155cb(void)
+{
+    QTestState *s =3D qtest_init(
+        "-display none -m 512M -device am53c974,id=3Dscsi -device scsi-hd,=
drive=3Ddisk0 "
+        "-drive id=3Ddisk0,if=3Dnone,file=3Dnull-co://,format=3Draw -nodef=
aults");
+    qtest_outl(s, 0xcf8, 0x80001010);
+    qtest_outl(s, 0xcfc, 0xc000);
+    qtest_outl(s, 0xcf8, 0x80001004);
+    qtest_outw(s, 0xcfc, 0x01);
+    qtest_outb(s, 0xc000, 0x4);
+    qtest_outl(s, 0xc007, 0x8000);
+    qtest_outl(s, 0xc03f, 0x0300);
+    qtest_outl(s, 0xc00b, 0x4300);
+    qtest_outw(s, 0xc00b, 0x9000);
+    qtest_outl(s, 0xc00b, 0xc300);
+    qtest_outl(s, 0xc00b, 0xc300);
+    qtest_outl(s, 0xc00b, 0xc300);
+    qtest_outw(s, 0xc00b, 0x9000);
+    qtest_outw(s, 0xc00b, 0x1000);
+    qtest_quit(s);
+}
+/*
+ * cat << EOF | ./qemu-system-i386 -display none -machine accel=3Dqtest, -=
m \
+ * 512M -device am53c974,id=3Dscsi -device scsi-hd,drive=3Ddisk0 -drive \
+ * id=3Ddisk0,if=3Dnone,file=3Dnull-co://,format=3Draw -nodefaults -qtest =
stdio
+ * outl 0xcf8 0x80001010
+ * outl 0xcfc 0xc000
+ * outl 0xcf8 0x80001004
+ * outw 0xcfc 0x01
+ * outw 0xc00c 0x41
+ * outw 0xc00a 0x00
+ * outl 0xc00a 0x00
+ * outw 0xc00c 0x43
+ * outw 0xc00b 0x00
+ * outw 0xc00b 0x00
+ * outw 0xc00c 0x00
+ * outl 0xc00a 0x00
+ * outw 0xc00a 0x00
+ * outl 0xc00a 0x00
+ * outw 0xc00c 0x00
+ * outl 0xc00a 0x00
+ * outw 0xc00a 0x00
+ * outl 0xc00a 0x00
+ * outw 0xc00c 0x00
+ * outl 0xc00a 0x00
+ * outw 0xc00a 0x00
+ * outl 0xc00a 0x00
+ * outw 0xc00c 0x00
+ * outl 0xc00a 0x00
+ * outl 0xc006 0x00
+ * outl 0xc00b 0x00
+ * outw 0xc00b 0x0800
+ * outw 0xc00b 0x00
+ * outw 0xc00b 0x00
+ * outl 0xc006 0x00
+ * outl 0xc00b 0x00
+ * outw 0xc00b 0x0800
+ * outw 0xc00b 0x00
+ * outw 0xc00b 0x4100
+ * outw 0xc00a 0x00
+ * outl 0xc00a 0x100000
+ * outl 0xc00a 0x00
+ * outw 0xc00c 0x43
+ * outl 0xc00a 0x100000
+ * outl 0xc00a 0x100000
+ * EOF
+ */
+static void crash_1548bd10e7(void)
+{
+    QTestState *s =3D qtest_init(
+        "-display none -m 512M -device am53c974,id=3Dscsi -device scsi-hd,=
drive=3Ddisk0 "
+        "-drive id=3Ddisk0,if=3Dnone,file=3Dnull-co://,format=3Draw -nodef=
aults");
+    qtest_outl(s, 0xcf8, 0x80001010);
+    qtest_outl(s, 0xcfc, 0xc000);
+    qtest_outl(s, 0xcf8, 0x80001004);
+    qtest_outw(s, 0xcfc, 0x01);
+    qtest_outw(s, 0xc00c, 0x41);
+    qtest_outw(s, 0xc00a, 0x00);
+    qtest_outl(s, 0xc00a, 0x00);
+    qtest_outw(s, 0xc00c, 0x43);
+    qtest_outw(s, 0xc00b, 0x00);
+    qtest_outw(s, 0xc00b, 0x00);
+    qtest_outw(s, 0xc00c, 0x00);
+    qtest_outl(s, 0xc00a, 0x00);
+    qtest_outw(s, 0xc00a, 0x00);
+    qtest_outl(s, 0xc00a, 0x00);
+    qtest_outw(s, 0xc00c, 0x00);
+    qtest_outl(s, 0xc00a, 0x00);
+    qtest_outw(s, 0xc00a, 0x00);
+    qtest_outl(s, 0xc00a, 0x00);
+    qtest_outw(s, 0xc00c, 0x00);
+    qtest_outl(s, 0xc00a, 0x00);
+    qtest_outw(s, 0xc00a, 0x00);
+    qtest_outl(s, 0xc00a, 0x00);
+    qtest_outw(s, 0xc00c, 0x00);
+    qtest_outl(s, 0xc00a, 0x00);
+    qtest_outl(s, 0xc006, 0x00);
+    qtest_outl(s, 0xc00b, 0x00);
+    qtest_outw(s, 0xc00b, 0x0800);
+    qtest_outw(s, 0xc00b, 0x00);
+    qtest_outw(s, 0xc00b, 0x00);
+    qtest_outl(s, 0xc006, 0x00);
+    qtest_outl(s, 0xc00b, 0x00);
+    qtest_outw(s, 0xc00b, 0x0800);
+    qtest_outw(s, 0xc00b, 0x00);
+    qtest_outw(s, 0xc00b, 0x4100);
+    qtest_outw(s, 0xc00a, 0x00);
+    qtest_outl(s, 0xc00a, 0x100000);
+    qtest_outl(s, 0xc00a, 0x00);
+    qtest_outw(s, 0xc00c, 0x43);
+    qtest_outl(s, 0xc00a, 0x100000);
+    qtest_outl(s, 0xc00a, 0x100000);
+    qtest_quit(s);
+}
+/*
+ * cat << EOF | ./qemu-system-i386 -display none -machine accel=3Dqtest, -=
m \
+ * 512M -device am53c974,id=3Dscsi -device scsi-hd,drive=3Ddisk0 -drive \
+ * id=3Ddisk0,if=3Dnone,file=3Dnull-co://,format=3Draw -nodefaults -qtest =
stdio
+ * outl 0xcf8 0x80001010
+ * outl 0xcfc 0xc000
+ * outl 0xcf8 0x80001004
+ * outw 0xcfc 0x01
+ * outl 0xc00a 0x420000
+ * outl 0xc00a 0x430000
+ * outl 0xc00b 0x00
+ * outw 0xc00b 0x00
+ * outw 0xc00b 0x00
+ * outl 0xc00b 0x00
+ * outw 0xc00b 0x00
+ * outl 0xc00b 0x00
+ * outw 0xc00b 0x00
+ * outl 0xc00b 0x00
+ * outb 0xc008 0x00
+ * outw 0xc00b 0x00
+ * outb 0xc008 0xa0
+ * outw 0xc00b 0x00
+ * outw 0xc00b 0x00
+ * outw 0xc00b 0x00
+ * outl 0xc00a 0x00
+ * outw 0xc00b 0x00
+ * outl 0xc00a 0x00
+ * outl 0xc00a 0x00
+ * outl 0xc00b 0x00
+ * outw 0xc00b 0x00
+ * outl 0xc00b 0x1000
+ * outw 0xc00b 0x1000
+ * EOF
+ */
+static void crash_1afe349482(void)
+{
+    QTestState *s =3D qtest_init(
+        "-display none -m 512M -device am53c974,id=3Dscsi -device scsi-hd,=
drive=3Ddisk0 "
+        "-drive id=3Ddisk0,if=3Dnone,file=3Dnull-co://,format=3Draw -nodef=
aults");
+    qtest_outl(s, 0xcf8, 0x80001010);
+    qtest_outl(s, 0xcfc, 0xc000);
+    qtest_outl(s, 0xcf8, 0x80001004);
+    qtest_outw(s, 0xcfc, 0x01);
+    qtest_outl(s, 0xc00a, 0x420000);
+    qtest_outl(s, 0xc00a, 0x430000);
+    qtest_outl(s, 0xc00b, 0x00);
+    qtest_outw(s, 0xc00b, 0x00);
+    qtest_outw(s, 0xc00b, 0x00);
+    qtest_outl(s, 0xc00b, 0x00);
+    qtest_outw(s, 0xc00b, 0x00);
+    qtest_outl(s, 0xc00b, 0x00);
+    qtest_outw(s, 0xc00b, 0x00);
+    qtest_outl(s, 0xc00b, 0x00);
+    qtest_outb(s, 0xc008, 0x00);
+    qtest_outw(s, 0xc00b, 0x00);
+    qtest_outb(s, 0xc008, 0xa0);
+    qtest_outw(s, 0xc00b, 0x00);
+    qtest_outw(s, 0xc00b, 0x00);
+    qtest_outw(s, 0xc00b, 0x00);
+    qtest_outl(s, 0xc00a, 0x00);
+    qtest_outw(s, 0xc00b, 0x00);
+    qtest_outl(s, 0xc00a, 0x00);
+    qtest_outl(s, 0xc00a, 0x00);
+    qtest_outl(s, 0xc00b, 0x00);
+    qtest_outw(s, 0xc00b, 0x00);
+    qtest_outl(s, 0xc00b, 0x1000);
+    qtest_outw(s, 0xc00b, 0x1000);
+    qtest_quit(s);
+}
+/*
+ * cat << EOF | ./qemu-system-i386 -display none -machine accel=3Dqtest, -=
m \
+ * 512M -device am53c974,id=3Dscsi -device scsi-hd,drive=3Ddisk0 -drive \
+ * id=3Ddisk0,if=3Dnone,file=3Dnull-co://,format=3Draw -nodefaults -qtest =
stdio
+ * outl 0xcf8 0x80001010
+ * outl 0xcfc 0xc000
+ * outl 0xcf8 0x80001004
+ * outw 0xcfc 0x01
+ * outl 0xc007 0x2000
+ * outw 0xc00b 0x0100
+ * outw 0xc00c 0x43
+ * outl 0xc00a 0x00
+ * outw 0xc00a 0x00
+ * outl 0xc00a 0x00
+ * outw 0xc00c 0x00
+ * outl 0xc00a 0x00
+ * outw 0xc00a 0x00
+ * outl 0xc00a 0x00
+ * outw 0xc00c 0x00
+ * outl 0xc00a 0x00
+ * outw 0xc00a 0x00
+ * outl 0xc00a 0x00
+ * outw 0xc00c 0x00
+ * outw 0xc00b 0x00
+ * outw 0xc00b 0x00
+ * outw 0xc00c 0x00
+ * outl 0xc00a 0x00
+ * outw 0xc00a 0x00
+ * outl 0xc00a 0x00
+ * outw 0xc00c 0x00
+ * outl 0xc00a 0x00
+ * outl 0xc00a 0x00
+ * outw 0xc00c 0x00
+ * outl 0xc00a 0x00
+ * outw 0xc00c 0x00
+ * outw 0xc00b 0x00
+ * outw 0xc00b 0x00
+ * outw 0xc00c 0x00
+ * outw 0xc00a 0x00
+ * outl 0xc00a 0x100000
+ * outl 0xc00a 0x100000
+ * outl 0xc00a 0x00
+ * outw 0xc00c 0x43
+ * outl 0xc00a 0x100000
+ * outl 0xc00a 0x100000
+ * EOF
+ */
+static void crash_1b42581317(void)
+{
+    QTestState *s =3D qtest_init(
+        "-display none -m 512M -device am53c974,id=3Dscsi -device scsi-hd,=
drive=3Ddisk0 "
+        "-drive id=3Ddisk0,if=3Dnone,file=3Dnull-co://,format=3Draw -nodef=
aults");
+    qtest_outl(s, 0xcf8, 0x80001010);
+    qtest_outl(s, 0xcfc, 0xc000);
+    qtest_outl(s, 0xcf8, 0x80001004);
+    qtest_outw(s, 0xcfc, 0x01);
+    qtest_outl(s, 0xc007, 0x2000);
+    qtest_outw(s, 0xc00b, 0x0100);
+    qtest_outw(s, 0xc00c, 0x43);
+    qtest_outl(s, 0xc00a, 0x00);
+    qtest_outw(s, 0xc00a, 0x00);
+    qtest_outl(s, 0xc00a, 0x00);
+    qtest_outw(s, 0xc00c, 0x00);
+    qtest_outl(s, 0xc00a, 0x00);
+    qtest_outw(s, 0xc00a, 0x00);
+    qtest_outl(s, 0xc00a, 0x00);
+    qtest_outw(s, 0xc00c, 0x00);
+    qtest_outl(s, 0xc00a, 0x00);
+    qtest_outw(s, 0xc00a, 0x00);
+    qtest_outl(s, 0xc00a, 0x00);
+    qtest_outw(s, 0xc00c, 0x00);
+    qtest_outw(s, 0xc00b, 0x00);
+    qtest_outw(s, 0xc00b, 0x00);
+    qtest_outw(s, 0xc00c, 0x00);
+    qtest_outl(s, 0xc00a, 0x00);
+    qtest_outw(s, 0xc00a, 0x00);
+    qtest_outl(s, 0xc00a, 0x00);
+    qtest_outw(s, 0xc00c, 0x00);
+    qtest_outl(s, 0xc00a, 0x00);
+    qtest_outl(s, 0xc00a, 0x00);
+    qtest_outw(s, 0xc00c, 0x00);
+    qtest_outl(s, 0xc00a, 0x00);
+    qtest_outw(s, 0xc00c, 0x00);
+    qtest_outw(s, 0xc00b, 0x00);
+    qtest_outw(s, 0xc00b, 0x00);
+    qtest_outw(s, 0xc00c, 0x00);
+    qtest_outw(s, 0xc00a, 0x00);
+    qtest_outl(s, 0xc00a, 0x100000);
+    qtest_outl(s, 0xc00a, 0x100000);
+    qtest_outl(s, 0xc00a, 0x00);
+    qtest_outw(s, 0xc00c, 0x43);
+    qtest_outl(s, 0xc00a, 0x100000);
+    qtest_outl(s, 0xc00a, 0x100000);
+    qtest_quit(s);
+}
+/*
+ * cat << EOF | ./qemu-system-i386 -display none -machine accel=3Dqtest, -=
m \
+ * 512M -device am53c974,id=3Dscsi -device scsi-hd,drive=3Ddisk0 -drive \
+ * id=3Ddisk0,if=3Dnone,file=3Dnull-co://,format=3Draw -nodefaults -qtest =
stdio
+ * outl 0xcf8 0x80001010
+ * outl 0xcfc 0xc000
+ * outl 0xcf8 0x80001004
+ * outw 0xcfc 0x01
+ * outl 0xc007 0x1500
+ * outw 0xc00b 0x4100
+ * outw 0xc00b 0x4100
+ * outl 0xc00b 0x0300
+ * outl 0xc00b 0x0300
+ * outl 0xc00b 0x0300
+ * outl 0xc00b 0x0300
+ * outl 0xc00b 0x0300
+ * outl 0xc00b 0x0300
+ * outl 0xc00b 0x0300
+ * outl 0xc00b 0x0300
+ * outl 0xc00b 0x0300
+ * outl 0xc00b 0x0300
+ * outl 0xc00b 0x0300
+ * outl 0xc00b 0x0300
+ * outl 0xc00b 0x0300
+ * outl 0xc00b 0x0300
+ * outl 0xc00b 0x00
+ * outw 0xc00b 0x1000
+ * outw 0xc009 0x00
+ * outl 0xc00b 0xc000
+ * outl 0xc00b 0xc000
+ * outl 0xc00b 0xc000
+ * outl 0xc00b 0xc000
+ * outl 0xc00b 0x0
+ * outl 0xc00b 0xc000
+ * outl 0xc00b 0xc000
+ * outl 0xc00b 0xc000
+ * outl 0xc007 0x00
+ * outl 0xc00b 0x0300
+ * outl 0xc00b 0x1000
+ * outl 0xc007 0x00
+ * outw 0xc00b 0x4100
+ * EOF
+ */
+static void crash_30e28cfa86(void)
+{
+    QTestState *s =3D qtest_init(
+        "-display none -m 512M -device am53c974,id=3Dscsi -device scsi-hd,=
drive=3Ddisk0 "
+        "-drive id=3Ddisk0,if=3Dnone,file=3Dnull-co://,format=3Draw -nodef=
aults");
+    qtest_outl(s, 0xcf8, 0x80001010);
+    qtest_outl(s, 0xcfc, 0xc000);
+    qtest_outl(s, 0xcf8, 0x80001004);
+    qtest_outw(s, 0xcfc, 0x01);
+    qtest_outl(s, 0xc007, 0x1500);
+    qtest_outw(s, 0xc00b, 0x4100);
+    qtest_outw(s, 0xc00b, 0x4100);
+    qtest_outl(s, 0xc00b, 0x0300);
+    qtest_outl(s, 0xc00b, 0x0300);
+    qtest_outl(s, 0xc00b, 0x0300);
+    qtest_outl(s, 0xc00b, 0x0300);
+    qtest_outl(s, 0xc00b, 0x0300);
+    qtest_outl(s, 0xc00b, 0x0300);
+    qtest_outl(s, 0xc00b, 0x0300);
+    qtest_outl(s, 0xc00b, 0x0300);
+    qtest_outl(s, 0xc00b, 0x0300);
+    qtest_outl(s, 0xc00b, 0x0300);
+    qtest_outl(s, 0xc00b, 0x0300);
+    qtest_outl(s, 0xc00b, 0x0300);
+    qtest_outl(s, 0xc00b, 0x0300);
+    qtest_outl(s, 0xc00b, 0x0300);
+    qtest_outl(s, 0xc00b, 0x00);
+    qtest_outw(s, 0xc00b, 0x1000);
+    qtest_outw(s, 0xc009, 0x00);
+    qtest_outl(s, 0xc00b, 0xc000);
+    qtest_outl(s, 0xc00b, 0xc000);
+    qtest_outl(s, 0xc00b, 0xc000);
+    qtest_outl(s, 0xc00b, 0xc000);
+    qtest_outl(s, 0xc00b, 0x0);
+    qtest_outl(s, 0xc00b, 0xc000);
+    qtest_outl(s, 0xc00b, 0xc000);
+    qtest_outl(s, 0xc00b, 0xc000);
+    qtest_outl(s, 0xc007, 0x00);
+    qtest_outl(s, 0xc00b, 0x0300);
+    qtest_outl(s, 0xc00b, 0x1000);
+    qtest_outl(s, 0xc007, 0x00);
+    qtest_outw(s, 0xc00b, 0x4100);
+    qtest_quit(s);
+}
+/*
+ * cat << EOF | ./qemu-system-i386 -display none -machine accel=3Dqtest, -=
m \
+ * 512M -device am53c974,id=3Dscsi -device scsi-hd,drive=3Ddisk0 -drive \
+ * id=3Ddisk0,if=3Dnone,file=3Dnull-co://,format=3Draw -nodefaults -qtest =
stdio
+ * outl 0xcf8 0x80001010
+ * outl 0xcfc 0xc000
+ * outl 0xcf8 0x80001004
+ * outw 0xcfc 0x01
+ * outb 0xc008 0x42
+ * outw 0xc00b 0x4100
+ * outw 0xc00b 0x4100
+ * outw 0xc00b 0x00
+ * outw 0xc00b 0x1000
+ * outl 0xc00b 0x0300
+ * outl 0xc00b 0x0300
+ * outl 0xc00b 0x0300
+ * outl 0xc00b 0x0300
+ * outl 0xc00b 0x0300
+ * outl 0xc00b 0x0300
+ * outl 0xc00b 0x0300
+ * outl 0xc00b 0x0300
+ * outl 0xc00b 0x0300
+ * outl 0xc00b 0x0300
+ * outl 0xc00b 0x0300
+ * outl 0xc00b 0x0300
+ * outl 0xc00b 0x0300
+ * outl 0xc00b 0x0300
+ * outw 0xc00b 0x1000
+ * EOF
+ */
+static void crash_34093bfc7c(void)
+{
+    QTestState *s =3D qtest_init(
+        "-display none -m 512M -device am53c974,id=3Dscsi -device scsi-hd,=
drive=3Ddisk0 "
+        "-drive id=3Ddisk0,if=3Dnone,file=3Dnull-co://,format=3Draw -nodef=
aults");
+    qtest_outl(s, 0xcf8, 0x80001010);
+    qtest_outl(s, 0xcfc, 0xc000);
+    qtest_outl(s, 0xcf8, 0x80001004);
+    qtest_outw(s, 0xcfc, 0x01);
+    qtest_outb(s, 0xc008, 0x42);
+    qtest_outw(s, 0xc00b, 0x4100);
+    qtest_outw(s, 0xc00b, 0x4100);
+    qtest_outw(s, 0xc00b, 0x00);
+    qtest_outw(s, 0xc00b, 0x1000);
+    qtest_outl(s, 0xc00b, 0x0300);
+    qtest_outl(s, 0xc00b, 0x0300);
+    qtest_outl(s, 0xc00b, 0x0300);
+    qtest_outl(s, 0xc00b, 0x0300);
+    qtest_outl(s, 0xc00b, 0x0300);
+    qtest_outl(s, 0xc00b, 0x0300);
+    qtest_outl(s, 0xc00b, 0x0300);
+    qtest_outl(s, 0xc00b, 0x0300);
+    qtest_outl(s, 0xc00b, 0x0300);
+    qtest_outl(s, 0xc00b, 0x0300);
+    qtest_outl(s, 0xc00b, 0x0300);
+    qtest_outl(s, 0xc00b, 0x0300);
+    qtest_outl(s, 0xc00b, 0x0300);
+    qtest_outl(s, 0xc00b, 0x0300);
+    qtest_outw(s, 0xc00b, 0x1000);
+    qtest_quit(s);
+}
+/*
+ * cat << EOF | ./qemu-system-i386 -display none -machine accel=3Dqtest, -=
m \
+ * 512M -device am53c974,id=3Dscsi -device scsi-hd,drive=3Ddisk0 -drive \
+ * id=3Ddisk0,if=3Dnone,file=3Dnull-co://,format=3Draw -nodefaults -qtest =
stdio
+ * outl 0xcf8 0x80001010
+ * outl 0xcfc 0xc000
+ * outl 0xcf8 0x80001004
+ * outw 0xcfc 0x01
+ * outw 0xc000 0x1
+ * outb 0xc040 0x03
+ * outl 0xc00b 0xc200
+ * outl 0xc00b 0xc200
+ * outl 0xc00b 0xc200
+ * outl 0xc00b 0xc200
+ * outl 0xc00b 0xc200
+ * outl 0xc00b 0xc200
+ * outl 0xc00b 0xc200
+ * outl 0xc00b 0xc200
+ * outl 0xc00b 0xc200
+ * outl 0xc00b 0xc200
+ * outl 0xc00b 0xc200
+ * outl 0xc00b 0xc200
+ * outw 0xc007 0xa000
+ * outl 0xc00a 0x410000
+ * EOF
+ */
+static void crash_3a05434a1f(void)
+{
+    QTestState *s =3D qtest_init(
+        "-display none -m 512M -device am53c974,id=3Dscsi -device scsi-hd,=
drive=3Ddisk0 "
+        "-drive id=3Ddisk0,if=3Dnone,file=3Dnull-co://,format=3Draw -nodef=
aults");
+    qtest_outl(s, 0xcf8, 0x80001010);
+    qtest_outl(s, 0xcfc, 0xc000);
+    qtest_outl(s, 0xcf8, 0x80001004);
+    qtest_outw(s, 0xcfc, 0x01);
+    qtest_outw(s, 0xc000, 0x1);
+    qtest_outb(s, 0xc040, 0x03);
+    qtest_outl(s, 0xc00b, 0xc200);
+    qtest_outl(s, 0xc00b, 0xc200);
+    qtest_outl(s, 0xc00b, 0xc200);
+    qtest_outl(s, 0xc00b, 0xc200);
+    qtest_outl(s, 0xc00b, 0xc200);
+    qtest_outl(s, 0xc00b, 0xc200);
+    qtest_outl(s, 0xc00b, 0xc200);
+    qtest_outl(s, 0xc00b, 0xc200);
+    qtest_outl(s, 0xc00b, 0xc200);
+    qtest_outl(s, 0xc00b, 0xc200);
+    qtest_outl(s, 0xc00b, 0xc200);
+    qtest_outl(s, 0xc00b, 0xc200);
+    qtest_outw(s, 0xc007, 0xa000);
+    qtest_outl(s, 0xc00a, 0x410000);
+    qtest_quit(s);
+}
+/*
+ * cat << EOF | ./qemu-system-i386 -display none -machine accel=3Dqtest, -=
m \
+ * 512M -device am53c974,id=3Dscsi -device scsi-hd,drive=3Ddisk0 -drive \
+ * id=3Ddisk0,if=3Dnone,file=3Dnull-co://,format=3Draw -nodefaults -qtest =
stdio
+ * outl 0xcf8 0x80001010
+ * outl 0xcfc 0xc000
+ * outl 0xcf8 0x80001004
+ * outw 0xcfc 0x01
+ * outw 0xc000 0x01
+ * outb 0xc040 0x03
+ * outl 0xc00b 0xc200
+ * outl 0xc00b 0xc200
+ * outl 0xc00b 0xc200
+ * outl 0xc00b 0xc200
+ * outl 0xc00b 0xc200
+ * outl 0xc00b 0xc200
+ * outl 0xc00b 0xc200
+ * outl 0xc00b 0xc200
+ * outl 0xc00b 0xc200
+ * outl 0xc00b 0xc200
+ * outl 0xc00b 0xc200
+ * outl 0xc00b 0xc200
+ * outl 0xc00b 0xc200
+ * outl 0xc00b 0x4200
+ * outl 0xc00b 0x4000
+ * outl 0xc00b 0x4000
+ * outl 0xc00b 0x4000
+ * outl 0xc00b 0x4000
+ * outl 0xc00b 0x4000
+ * outl 0xc00b 0x4000
+ * outl 0xc00b 0x4000
+ * outl 0xc00b 0x4000
+ * outl 0xc00b 0x4000
+ * outl 0xc00b 0x4000
+ * outl 0xc00b 0x4000
+ * outl 0xc00b 0x4000
+ * outl 0xc00b 0x4000
+ * outl 0xc00b 0x4000
+ * outl 0xc00b 0x4000
+ * outl 0xc00b 0x4000
+ * outl 0xc00b 0x4000
+ * outl 0xc00b 0x4000
+ * outl 0xc00b 0x4000
+ * outl 0xc00b 0x4000
+ * outl 0xc00b 0x4000
+ * outl 0xc00b 0x4000
+ * outl 0xc00b 0x4000
+ * outl 0xc00b 0x4000
+ * outl 0xc00b 0x4000
+ * outl 0xc00b 0x4000
+ * outl 0xc00b 0x4000
+ * outl 0xc00b 0x4000
+ * outl 0xc00b 0x4000
+ * outl 0xc00b 0x4000
+ * outl 0xc00b 0xc200
+ * outl 0xc00b 0x00
+ * outl 0xc00b 0x00
+ * outl 0xc00b 0x00
+ * outl 0xc00b 0x00
+ * outl 0xc00b 0x00
+ * outl 0xc00b 0x00
+ * outl 0xc00b 0x00
+ * outl 0xc00b 0x00
+ * outl 0xc00b 0x00
+ * outl 0xc00b 0x00
+ * outl 0xc00b 0x00
+ * outl 0xc00b 0x00
+ * outl 0xc00b 0x00
+ * outl 0xc00b 0x00
+ * outl 0xc00b 0x00
+ * outl 0xc00b 0x00
+ * outl 0xc00b 0x00
+ * outw 0xc00b 0x00
+ * EOF
+ */
+static void crash_3ab5744bc3(void)
+{
+    QTestState *s =3D qtest_init(
+        "-display none -m 512M -device am53c974,id=3Dscsi -device scsi-hd,=
drive=3Ddisk0 "
+        "-drive id=3Ddisk0,if=3Dnone,file=3Dnull-co://,format=3Draw -nodef=
aults");
+    qtest_outl(s, 0xcf8, 0x80001010);
+    qtest_outl(s, 0xcfc, 0xc000);
+    qtest_outl(s, 0xcf8, 0x80001004);
+    qtest_outw(s, 0xcfc, 0x01);
+    qtest_outw(s, 0xc000, 0x01);
+    qtest_outb(s, 0xc040, 0x03);
+    qtest_outl(s, 0xc00b, 0xc200);
+    qtest_outl(s, 0xc00b, 0xc200);
+    qtest_outl(s, 0xc00b, 0xc200);
+    qtest_outl(s, 0xc00b, 0xc200);
+    qtest_outl(s, 0xc00b, 0xc200);
+    qtest_outl(s, 0xc00b, 0xc200);
+    qtest_outl(s, 0xc00b, 0xc200);
+    qtest_outl(s, 0xc00b, 0xc200);
+    qtest_outl(s, 0xc00b, 0xc200);
+    qtest_outl(s, 0xc00b, 0xc200);
+    qtest_outl(s, 0xc00b, 0xc200);
+    qtest_outl(s, 0xc00b, 0xc200);
+    qtest_outl(s, 0xc00b, 0xc200);
+    qtest_outl(s, 0xc00b, 0x4200);
+    qtest_outl(s, 0xc00b, 0x4000);
+    qtest_outl(s, 0xc00b, 0x4000);
+    qtest_outl(s, 0xc00b, 0x4000);
+    qtest_outl(s, 0xc00b, 0x4000);
+    qtest_outl(s, 0xc00b, 0x4000);
+    qtest_outl(s, 0xc00b, 0x4000);
+    qtest_outl(s, 0xc00b, 0x4000);
+    qtest_outl(s, 0xc00b, 0x4000);
+    qtest_outl(s, 0xc00b, 0x4000);
+    qtest_outl(s, 0xc00b, 0x4000);
+    qtest_outl(s, 0xc00b, 0x4000);
+    qtest_outl(s, 0xc00b, 0x4000);
+    qtest_outl(s, 0xc00b, 0x4000);
+    qtest_outl(s, 0xc00b, 0x4000);
+    qtest_outl(s, 0xc00b, 0x4000);
+    qtest_outl(s, 0xc00b, 0x4000);
+    qtest_outl(s, 0xc00b, 0x4000);
+    qtest_outl(s, 0xc00b, 0x4000);
+    qtest_outl(s, 0xc00b, 0x4000);
+    qtest_outl(s, 0xc00b, 0x4000);
+    qtest_outl(s, 0xc00b, 0x4000);
+    qtest_outl(s, 0xc00b, 0x4000);
+    qtest_outl(s, 0xc00b, 0x4000);
+    qtest_outl(s, 0xc00b, 0x4000);
+    qtest_outl(s, 0xc00b, 0x4000);
+    qtest_outl(s, 0xc00b, 0x4000);
+    qtest_outl(s, 0xc00b, 0x4000);
+    qtest_outl(s, 0xc00b, 0x4000);
+    qtest_outl(s, 0xc00b, 0x4000);
+    qtest_outl(s, 0xc00b, 0x4000);
+    qtest_outl(s, 0xc00b, 0xc200);
+    qtest_outl(s, 0xc00b, 0x00);
+    qtest_outl(s, 0xc00b, 0x00);
+    qtest_outl(s, 0xc00b, 0x00);
+    qtest_outl(s, 0xc00b, 0x00);
+    qtest_outl(s, 0xc00b, 0x00);
+    qtest_outl(s, 0xc00b, 0x00);
+    qtest_outl(s, 0xc00b, 0x00);
+    qtest_outl(s, 0xc00b, 0x00);
+    qtest_outl(s, 0xc00b, 0x00);
+    qtest_outl(s, 0xc00b, 0x00);
+    qtest_outl(s, 0xc00b, 0x00);
+    qtest_outl(s, 0xc00b, 0x00);
+    qtest_outl(s, 0xc00b, 0x00);
+    qtest_outl(s, 0xc00b, 0x00);
+    qtest_outl(s, 0xc00b, 0x00);
+    qtest_outl(s, 0xc00b, 0x00);
+    qtest_outl(s, 0xc00b, 0x00);
+    qtest_outw(s, 0xc00b, 0x00);
+    qtest_quit(s);
+}
+/*
+ * cat << EOF | ./qemu-system-i386 -display none -machine accel=3Dqtest, -=
m \
+ * 512M -device am53c974,id=3Dscsi -device scsi-hd,drive=3Ddisk0 -drive \
+ * id=3Ddisk0,if=3Dnone,file=3Dnull-co://,format=3Draw -nodefaults -qtest =
stdio
+ * outl 0xcf8 0x80001010
+ * outl 0xcfc 0xc000
+ * outl 0xcf8 0x80001004
+ * outw 0xcfc 0x01
+ * outl 0xc00b 0x4100
+ * outw 0xc00b 0xc200
+ * outl 0xc03f 0x0300
+ * EOF
+ */
+static void crash_530ff2e211(void)
+{
+    QTestState *s =3D qtest_init(
+        "-display none -m 512M -device am53c974,id=3Dscsi -device scsi-hd,=
drive=3Ddisk0 "
+        "-drive id=3Ddisk0,if=3Dnone,file=3Dnull-co://,format=3Draw -nodef=
aults");
+    qtest_outl(s, 0xcf8, 0x80001010);
+    qtest_outl(s, 0xcfc, 0xc000);
+    qtest_outl(s, 0xcf8, 0x80001004);
+    qtest_outw(s, 0xcfc, 0x01);
+    qtest_outl(s, 0xc00b, 0x4100);
+    qtest_outw(s, 0xc00b, 0xc200);
+    qtest_outl(s, 0xc03f, 0x0300);
+    qtest_quit(s);
+}
+/*
+ * cat << EOF | ./qemu-system-i386 -display none -machine accel=3Dqtest, -=
m \
+ * 512M -device am53c974,id=3Dscsi -device scsi-hd,drive=3Ddisk0 -drive \
+ * id=3Ddisk0,if=3Dnone,file=3Dnull-co://,format=3Draw -nodefaults -qtest =
stdio
+ * outl 0xcf8 0x80001010
+ * outl 0xcfc 0xc000
+ * outl 0xcf8 0x80001004
+ * outw 0xcfc 0x01
+ * outl 0xc03f 0x0300
+ * outw 0xc00b 0x4300
+ * outw 0xc000 0x01
+ * outw 0xc009 0x00
+ * outw 0xc00b 0x1000
+ * outl 0xc00d 0x02000000
+ * outw 0xc00c 0xc2
+ * outw 0xc00b 0x4100
+ * outl 0xc00b 0x1000
+ * EOF
+ */
+static void crash_76ab101171(void)
+{
+    QTestState *s =3D qtest_init(
+        "-display none -m 512M -device am53c974,id=3Dscsi -device scsi-hd,=
drive=3Ddisk0 "
+        "-drive id=3Ddisk0,if=3Dnone,file=3Dnull-co://,format=3Draw -nodef=
aults");
+    qtest_outl(s, 0xcf8, 0x80001010);
+    qtest_outl(s, 0xcfc, 0xc000);
+    qtest_outl(s, 0xcf8, 0x80001004);
+    qtest_outw(s, 0xcfc, 0x01);
+    qtest_outl(s, 0xc03f, 0x0300);
+    qtest_outw(s, 0xc00b, 0x4300);
+    qtest_outw(s, 0xc000, 0x01);
+    qtest_outw(s, 0xc009, 0x00);
+    qtest_outw(s, 0xc00b, 0x1000);
+    qtest_outl(s, 0xc00d, 0x02000000);
+    qtest_outw(s, 0xc00c, 0xc2);
+    qtest_outw(s, 0xc00b, 0x4100);
+    qtest_outl(s, 0xc00b, 0x1000);
+    qtest_quit(s);
+}
+/*
+ * cat << EOF | ./qemu-system-i386 -display none -machine accel=3Dqtest, -=
m \
+ * 512M -device am53c974,id=3Dscsi -device scsi-hd,drive=3Ddisk0 -drive \
+ * id=3Ddisk0,if=3Dnone,file=3Dnull-co://,format=3Draw -nodefaults -qtest =
stdio
+ * outl 0xcf8 0x80001010
+ * outl 0xcfc 0xc000
+ * outl 0xcf8 0x80001004
+ * outw 0xcfc 0x01
+ * outb 0xc000 0x4
+ * outw 0xc007 0x4000
+ * outl 0xc03f 0x0300
+ * outl 0xc00b 0xc300
+ * outw 0xc00b 0x9000
+ * outl 0xc00b 0xc300
+ * outw 0xc00b 0x9000
+ * outl 0xc00b 0x00
+ * outl 0xc00b 0xc300
+ * outw 0xc00b 0x9000
+ * outw 0xc00b 0x1000
+ * EOF
+ */
+static void crash_7f743a0082(void)
+{
+    QTestState *s =3D qtest_init(
+        "-display none -m 512M -device am53c974,id=3Dscsi -device scsi-hd,=
drive=3Ddisk0 "
+        "-drive id=3Ddisk0,if=3Dnone,file=3Dnull-co://,format=3Draw -nodef=
aults");
+    qtest_outl(s, 0xcf8, 0x80001010);
+    qtest_outl(s, 0xcfc, 0xc000);
+    qtest_outl(s, 0xcf8, 0x80001004);
+    qtest_outw(s, 0xcfc, 0x01);
+    qtest_outb(s, 0xc000, 0x4);
+    qtest_outw(s, 0xc007, 0x4000);
+    qtest_outl(s, 0xc03f, 0x0300);
+    qtest_outl(s, 0xc00b, 0xc300);
+    qtest_outw(s, 0xc00b, 0x9000);
+    qtest_outl(s, 0xc00b, 0xc300);
+    qtest_outw(s, 0xc00b, 0x9000);
+    qtest_outl(s, 0xc00b, 0x00);
+    qtest_outl(s, 0xc00b, 0xc300);
+    qtest_outw(s, 0xc00b, 0x9000);
+    qtest_outw(s, 0xc00b, 0x1000);
+    qtest_quit(s);
+}
+/*
+ * cat << EOF | ./qemu-system-i386 -display none -machine accel=3Dqtest, -=
m \
+ * 512M -device am53c974,id=3Dscsi -device scsi-hd,drive=3Ddisk0 -drive \
+ * id=3Ddisk0,if=3Dnone,file=3Dnull-co://,format=3Draw -nodefaults -qtest =
stdio
+ * outl 0xcf8 0x80001010
+ * outl 0xcfc 0xc000
+ * outl 0xcf8 0x80001004
+ * outw 0xcfc 0x01
+ * outb 0xc000 0x4
+ * outl 0xc03f 0x0300
+ * outl 0xc00b 0xc300
+ * outw 0xc00b 0x9000
+ * outl 0xc00b 0x00
+ * outl 0xc00b 0xc300
+ * outw 0xc00b 0x9000
+ * outl 0xc00b 0x00
+ * outl 0xc00b 0xc300
+ * outl 0xc00b 0xc300
+ * outw 0xc00b 0x9000
+ * outw 0xc00b 0x1000
+ * EOF
+ */
+static void crash_87744a2e67(void)
+{
+    QTestState *s =3D qtest_init(
+        "-display none -m 512M -device am53c974,id=3Dscsi -device scsi-hd,=
drive=3Ddisk0 "
+        "-drive id=3Ddisk0,if=3Dnone,file=3Dnull-co://,format=3Draw -nodef=
aults");
+    qtest_outl(s, 0xcf8, 0x80001010);
+    qtest_outl(s, 0xcfc, 0xc000);
+    qtest_outl(s, 0xcf8, 0x80001004);
+    qtest_outw(s, 0xcfc, 0x01);
+    qtest_outb(s, 0xc000, 0x4);
+    qtest_outl(s, 0xc03f, 0x0300);
+    qtest_outl(s, 0xc00b, 0xc300);
+    qtest_outw(s, 0xc00b, 0x9000);
+    qtest_outl(s, 0xc00b, 0x00);
+    qtest_outl(s, 0xc00b, 0xc300);
+    qtest_outw(s, 0xc00b, 0x9000);
+    qtest_outl(s, 0xc00b, 0x00);
+    qtest_outl(s, 0xc00b, 0xc300);
+    qtest_outl(s, 0xc00b, 0xc300);
+    qtest_outw(s, 0xc00b, 0x9000);
+    qtest_outw(s, 0xc00b, 0x1000);
+    qtest_quit(s);
+}
+/*
+ * cat << EOF | ./qemu-system-i386 -display none -machine accel=3Dqtest, -=
m \
+ * 512M -device am53c974,id=3Dscsi -device scsi-hd,drive=3Ddisk0 -drive \
+ * id=3Ddisk0,if=3Dnone,file=3Dnull-co://,format=3Draw -nodefaults -qtest =
stdio
+ * outl 0xcf8 0x80001010
+ * outl 0xcfc 0xc000
+ * outl 0xcf8 0x80001004
+ * outw 0xcfc 0x01
+ * outw 0xc00c 0x41
+ * outl 0xc00a 0x00
+ * outw 0xc00c 0x43
+ * outw 0xc00b 0x00
+ * outw 0xc00b 0x00
+ * outw 0xc00c 0x00
+ * outl 0xc00a 0x00
+ * outw 0xc00a 0x00
+ * outl 0xc00a 0x00
+ * outw 0xc00c 0x00
+ * outl 0xc00a 0x00
+ * outw 0xc00a 0x00
+ * outl 0xc00a 0x00
+ * outw 0xc00c 0x00
+ * outl 0xc00a 0x00
+ * outw 0xc00a 0x00
+ * outl 0xc00a 0x00
+ * outw 0xc00c 0x00
+ * outw 0xc00b 0x00
+ * outw 0xc00b 0x00
+ * outw 0xc00c 0x00
+ * outl 0xc00a 0x00
+ * outw 0xc00a 0x00
+ * outl 0xc00a 0x00
+ * outw 0xc00c 0x00
+ * outl 0xc00a 0x00
+ * outl 0xc00a 0x00
+ * outw 0xc00c 0x00
+ * outl 0xc00a 0x00
+ * outw 0xc00c 0x00
+ * outw 0xc00b 0x00
+ * outw 0xc00b 0x00
+ * outw 0xc00c 0x00
+ * outw 0xc00a 0x00
+ * outl 0xc00a 0x100000
+ * outl 0xc00a 0x100000
+ * outl 0xc00a 0x00
+ * outw 0xc00c 0x43
+ * outl 0xc00a 0x100000
+ * outl 0xc00a 0x100000
+ * EOF
+ */
+static void crash_9f92a77bd6(void)
+{
+    QTestState *s =3D qtest_init(
+        "-display none -m 512M -device am53c974,id=3Dscsi -device scsi-hd,=
drive=3Ddisk0 "
+        "-drive id=3Ddisk0,if=3Dnone,file=3Dnull-co://,format=3Draw -nodef=
aults");
+    qtest_outl(s, 0xcf8, 0x80001010);
+    qtest_outl(s, 0xcfc, 0xc000);
+    qtest_outl(s, 0xcf8, 0x80001004);
+    qtest_outw(s, 0xcfc, 0x01);
+    qtest_outw(s, 0xc00c, 0x41);
+    qtest_outl(s, 0xc00a, 0x00);
+    qtest_outw(s, 0xc00c, 0x43);
+    qtest_outw(s, 0xc00b, 0x00);
+    qtest_outw(s, 0xc00b, 0x00);
+    qtest_outw(s, 0xc00c, 0x00);
+    qtest_outl(s, 0xc00a, 0x00);
+    qtest_outw(s, 0xc00a, 0x00);
+    qtest_outl(s, 0xc00a, 0x00);
+    qtest_outw(s, 0xc00c, 0x00);
+    qtest_outl(s, 0xc00a, 0x00);
+    qtest_outw(s, 0xc00a, 0x00);
+    qtest_outl(s, 0xc00a, 0x00);
+    qtest_outw(s, 0xc00c, 0x00);
+    qtest_outl(s, 0xc00a, 0x00);
+    qtest_outw(s, 0xc00a, 0x00);
+    qtest_outl(s, 0xc00a, 0x00);
+    qtest_outw(s, 0xc00c, 0x00);
+    qtest_outw(s, 0xc00b, 0x00);
+    qtest_outw(s, 0xc00b, 0x00);
+    qtest_outw(s, 0xc00c, 0x00);
+    qtest_outl(s, 0xc00a, 0x00);
+    qtest_outw(s, 0xc00a, 0x00);
+    qtest_outl(s, 0xc00a, 0x00);
+    qtest_outw(s, 0xc00c, 0x00);
+    qtest_outl(s, 0xc00a, 0x00);
+    qtest_outl(s, 0xc00a, 0x00);
+    qtest_outw(s, 0xc00c, 0x00);
+    qtest_outl(s, 0xc00a, 0x00);
+    qtest_outw(s, 0xc00c, 0x00);
+    qtest_outw(s, 0xc00b, 0x00);
+    qtest_outw(s, 0xc00b, 0x00);
+    qtest_outw(s, 0xc00c, 0x00);
+    qtest_outw(s, 0xc00a, 0x00);
+    qtest_outl(s, 0xc00a, 0x100000);
+    qtest_outl(s, 0xc00a, 0x100000);
+    qtest_outl(s, 0xc00a, 0x00);
+    qtest_outw(s, 0xc00c, 0x43);
+    qtest_outl(s, 0xc00a, 0x100000);
+    qtest_outl(s, 0xc00a, 0x100000);
+    qtest_quit(s);
+}
+/*
+ * cat << EOF | ./qemu-system-i386 -display none -machine accel=3Dqtest, -=
m \
+ * 512M -device am53c974,id=3Dscsi -device scsi-hd,drive=3Ddisk0 -drive \
+ * id=3Ddisk0,if=3Dnone,file=3Dnull-co://,format=3Draw -nodefaults -qtest =
stdio
+ * outl 0xcf8 0x80001010
+ * outl 0xcfc 0xc000
+ * outl 0xcf8 0x80001004
+ * outw 0xcfc 0x01
+ * outb 0xc008 0xa
+ * outw 0xc00b 0x4100
+ * outw 0xc00b 0x4100
+ * outw 0xc00b 0x1000
+ * outl 0xc00b 0x0800
+ * outl 0xc00b 0x0400
+ * outl 0xc00b 0x0400
+ * outl 0xc00b 0x0400
+ * outl 0xc00b 0x0400
+ * outl 0xc00b 0x0400
+ * outl 0xc00b 0x0400
+ * outl 0xc00b 0x0800
+ * outl 0xc00b 0x0400
+ * outl 0xc00b 0x0400
+ * outl 0xc00b 0x0400
+ * outl 0xc00b 0x0800
+ * outl 0xc00b 0x0400
+ * outl 0xc00b 0x0400
+ * outl 0xc00b 0x0400
+ * outl 0xc00b 0x4200
+ * EOF
+ */
+static void crash_d94dc29565(void)
+{
+    QTestState *s =3D qtest_init(
+        "-display none -m 512M -device am53c974,id=3Dscsi -device scsi-hd,=
drive=3Ddisk0 "
+        "-drive id=3Ddisk0,if=3Dnone,file=3Dnull-co://,format=3Draw -nodef=
aults");
+    qtest_outl(s, 0xcf8, 0x80001010);
+    qtest_outl(s, 0xcfc, 0xc000);
+    qtest_outl(s, 0xcf8, 0x80001004);
+    qtest_outw(s, 0xcfc, 0x01);
+    qtest_outb(s, 0xc008, 0xa);
+    qtest_outw(s, 0xc00b, 0x4100);
+    qtest_outw(s, 0xc00b, 0x4100);
+    qtest_outw(s, 0xc00b, 0x1000);
+    qtest_outl(s, 0xc00b, 0x0800);
+    qtest_outl(s, 0xc00b, 0x0400);
+    qtest_outl(s, 0xc00b, 0x0400);
+    qtest_outl(s, 0xc00b, 0x0400);
+    qtest_outl(s, 0xc00b, 0x0400);
+    qtest_outl(s, 0xc00b, 0x0400);
+    qtest_outl(s, 0xc00b, 0x0400);
+    qtest_outl(s, 0xc00b, 0x0800);
+    qtest_outl(s, 0xc00b, 0x0400);
+    qtest_outl(s, 0xc00b, 0x0400);
+    qtest_outl(s, 0xc00b, 0x0400);
+    qtest_outl(s, 0xc00b, 0x0800);
+    qtest_outl(s, 0xc00b, 0x0400);
+    qtest_outl(s, 0xc00b, 0x0400);
+    qtest_outl(s, 0xc00b, 0x0400);
+    qtest_outl(s, 0xc00b, 0x4200);
+    qtest_quit(s);
+}
+/*
+ * cat << EOF | ./qemu-system-i386 -display none -machine accel=3Dqtest, -=
m \
+ * 512M -device am53c974,id=3Dscsi -device scsi-hd,drive=3Ddisk0 -drive \
+ * id=3Ddisk0,if=3Dnone,file=3Dnull-co://,format=3Draw -nodefaults -qtest =
stdio
+ * outl 0xcf8 0x80001010
+ * outl 0xcfc 0xc000
+ * outl 0xcf8 0x80001004
+ * outw 0xcfc 0x01
+ * outw 0xc00b 0x4100
+ * outl 0xc00b 0x0300
+ * inl 0xc00b
+ * outl 0xc00b 0x0800
+ * outl 0xc00b 0x0800
+ * outl 0xc00b 0x0800
+ * outl 0xc00b 0x0800
+ * outl 0xc00b 0x0800
+ * outl 0xc00b 0x0800
+ * outl 0xc00b 0x0800
+ * outl 0xc00b 0x0800
+ * outl 0xc00b 0x0800
+ * outl 0xc00b 0x0800
+ * outl 0xc00b 0x0800
+ * outl 0xc00b 0x0800
+ * outl 0xc00b 0x0800
+ * outl 0xc00b 0x0800
+ * outl 0xc00b 0x00
+ * outl 0xc00a 0x410000
+ * EOF
+ */
+static void crash_df5a21ccf3(void)
+{
+    QTestState *s =3D qtest_init(
+        "-display none -m 512M -device am53c974,id=3Dscsi -device scsi-hd,=
drive=3Ddisk0 "
+        "-drive id=3Ddisk0,if=3Dnone,file=3Dnull-co://,format=3Draw -nodef=
aults");
+    qtest_outl(s, 0xcf8, 0x80001010);
+    qtest_outl(s, 0xcfc, 0xc000);
+    qtest_outl(s, 0xcf8, 0x80001004);
+    qtest_outw(s, 0xcfc, 0x01);
+    qtest_outw(s, 0xc00b, 0x4100);
+    qtest_outl(s, 0xc00b, 0x0300);
+    qtest_inl(s, 0xc00b);
+    qtest_outl(s, 0xc00b, 0x0800);
+    qtest_outl(s, 0xc00b, 0x0800);
+    qtest_outl(s, 0xc00b, 0x0800);
+    qtest_outl(s, 0xc00b, 0x0800);
+    qtest_outl(s, 0xc00b, 0x0800);
+    qtest_outl(s, 0xc00b, 0x0800);
+    qtest_outl(s, 0xc00b, 0x0800);
+    qtest_outl(s, 0xc00b, 0x0800);
+    qtest_outl(s, 0xc00b, 0x0800);
+    qtest_outl(s, 0xc00b, 0x0800);
+    qtest_outl(s, 0xc00b, 0x0800);
+    qtest_outl(s, 0xc00b, 0x0800);
+    qtest_outl(s, 0xc00b, 0x0800);
+    qtest_outl(s, 0xc00b, 0x0800);
+    qtest_outl(s, 0xc00b, 0x00);
+    qtest_outl(s, 0xc00a, 0x410000);
+    qtest_quit(s);
+}
 =

 static void test_cmdfifo_underflow_ok(void)
 {
@@ -106,6 +1225,24 @@ int main(int argc, char **argv)
     g_test_init(&argc, &argv, NULL);
 =

     if (strcmp(arch, "i386") =3D=3D 0) {
+        qtest_add_func("fuzz/crash_0900379669", crash_0900379669);
+        qtest_add_func("fuzz/crash_094661a91b", crash_094661a91b);
+        qtest_add_func("fuzz/crash_0fff2155cb", crash_0fff2155cb);
+        qtest_add_func("fuzz/crash_1548bd10e7", crash_1548bd10e7);
+        qtest_add_func("fuzz/crash_1afe349482", crash_1afe349482);
+        qtest_add_func("fuzz/crash_1b42581317", crash_1b42581317);
+        qtest_add_func("fuzz/crash_30e28cfa86", crash_30e28cfa86);
+        qtest_add_func("fuzz/crash_34093bfc7c", crash_34093bfc7c);
+        qtest_add_func("fuzz/crash_3a05434a1f", crash_3a05434a1f);
+        qtest_add_func("fuzz/crash_3ab5744bc3", crash_3ab5744bc3);
+        qtest_add_func("fuzz/crash_530ff2e211", crash_530ff2e211);
+        qtest_add_func("fuzz/crash_76ab101171", crash_76ab101171);
+        qtest_add_func("fuzz/crash_7f743a0082", crash_7f743a0082);
+        qtest_add_func("fuzz/crash_87744a2e67", crash_87744a2e67);
+        qtest_add_func("fuzz/crash_9f92a77bd6", crash_9f92a77bd6);
+        qtest_add_func("fuzz/crash_d94dc29565", crash_d94dc29565);
+        qtest_add_func("fuzz/crash_dd24c44f80", crash_dd24c44f80);
+        qtest_add_func("fuzz/crash_df5a21ccf3", crash_df5a21ccf3);
         qtest_add_func("am53c974/test_cmdfifo_underflow_ok",
                        test_cmdfifo_underflow_ok);
         qtest_add_func("am53c974/test_cmdfifo_overflow_ok",
-- =

2.28.0

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1909247

Title:
  QEMU: use after free vulnerability in esp_do_dma() in hw/scsi/esp.c

Status in QEMU:
  New

Bug description:
  A use-after-free vulnerability was found in the am53c974 SCSI host bus
  adapter emulation of QEMU. It could occur in the esp_do_dma() function
  in hw/scsi/esp.c while handling the 'Information Transfer' command
  (CMD_TI). A privileged guest user may abuse this flaw to crash the
  QEMU process on the host, resulting in a denial of service or
  potential code execution with the privileges of the QEMU process.

  This issue was reported by Cheolwoo Myung (Seoul National University).

  Original report:
  Using hypervisor fuzzer, hyfuzz, I found a use-after-free issue in
  am53c974 emulator of QEMU enabled ASan.

  It occurs while transferring information, as it does not check the
  buffer to be transferred.

  A malicious guest user/process could use this flaw to crash the QEMU
  process resulting in DoS scenario.

  To reproduce this issue, please run the QEMU with the following command
  line.

  # To enable ASan option, please set configuration with the following
  $ ./configure --target-list=3Di386-softmmu --disable-werror --enable-sani=
tizers
  $ make

  # To reproduce this issue, please run the QEMU process with the following=
 command line
  $ ./qemu-system-i386 -m 512 -drive file=3D./hyfuzz.img,index=3D0,media=3D=
disk,format=3Draw \
  -device am53c974,id=3Dscsi -device scsi-hd,drive=3DSysDisk \
  -drive id=3DSysDisk,if=3Dnone,file=3D./disk.img

  Please find attached the disk images to reproduce this issue.

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1909247/+subscriptions

