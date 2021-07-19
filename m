Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 89F123CD968
	for <lists+qemu-devel@lfdr.de>; Mon, 19 Jul 2021 17:12:03 +0200 (CEST)
Received: from localhost ([::1]:58844 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m5Uw6-000336-Ke
	for lists+qemu-devel@lfdr.de; Mon, 19 Jul 2021 11:12:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41712)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1m5Uv3-0001iv-6K
 for qemu-devel@nongnu.org; Mon, 19 Jul 2021 11:10:58 -0400
Received: from indium.canonical.com ([91.189.90.7]:59488)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1m5Uv0-000464-Mj
 for qemu-devel@nongnu.org; Mon, 19 Jul 2021 11:10:56 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.93 #5 (Debian))
 id 1m5Uuv-0003BL-Pu
 for <qemu-devel@nongnu.org>; Mon, 19 Jul 2021 15:10:49 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id C23042E8139
 for <qemu-devel@nongnu.org>; Mon, 19 Jul 2021 15:10:49 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Mon, 19 Jul 2021 15:03:09 -0000
From: Thomas Huth <1926111@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Fix Committed; importance=Undecided;
 assignee=th.huth@posteo.de; 
X-Launchpad-Bug-Tags: fuzzer
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: a1xndr philmd th-huth
X-Launchpad-Bug-Reporter: Alexander Bulekov (a1xndr)
X-Launchpad-Bug-Modifier: Thomas Huth (th-huth)
References: <161940714680.11021.12941917748278413607.malonedeb@soybean.canonical.com>
Message-Id: <162670698943.18792.18402598011894824328.malone@chaenomeles.canonical.com>
Subject: [Bug 1926111] Re: Assertion `tx_queue_idx <= s->txq_num' failed in
 vmxnet3_io_bar0_write
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="4fbbc20799edd34b40f59a0c81c360f947903b2a"; Instance="production"
X-Launchpad-Hash: cf9e23cb4f3098a9d80978a919f766689baa2968
Received-SPF: pass client-ip=91.189.90.7; envelope-from=bounces@canonical.com;
 helo=indium.canonical.com
X-Spam_score_int: -65
X-Spam_score: -6.6
X-Spam_bar: ------
X-Spam_report: (-6.6 / 5.0 requ) BAYES_00=-1.9,
 HEADER_FROM_DIFFERENT_DOMAINS=0.25, RCVD_IN_DNSWL_HI=-5,
 RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Reply-To: Bug 1926111 <1926111@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Fix has been included here:
https://gitlab.com/qemu-project/qemu/-/commit/6a932c4ed8748b08c58c

** Changed in: qemu
       Status: In Progress =3D> Fix Committed

--=20
You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1926111

Title:
  Assertion `tx_queue_idx <=3D s->txq_num' failed in vmxnet3_io_bar0_write

Status in QEMU:
  Fix Committed

Bug description:
  =3D=3D=3D Stacktrace =3D=3D=3D

  qemu-fuzz-i386: ../hw/net/vmxnet3.c:1096: void vmxnet3_io_bar0_write(void=
 *, hwaddr, uint64_t, unsigned int): Assertion `tx_queue_idx <=3D s->txq_nu=
m' failed.
  =3D=3D602353=3D=3D ERROR: libFuzzer: deadly signal
  #5 0x7fe4b93a7ce0 in raise signal/../sysdeps/unix/sysv/linux/raise.c:48:3
  #6 0x7fe4b9391536 in abort stdlib/abort.c:79:7
  #7 0x7fe4b939140e in __assert_fail_base assert/assert.c:92:3
  #8 0x7fe4b93a0661 in __assert_fail assert/assert.c:101:3
  #9 0x563e6cf5ebb5 in vmxnet3_io_bar0_write  hw/net/vmxnet3.c:1096:9
  #10 0x563e6eefdb00 in memory_region_write_accessor  softmmu/memory.c:491:5
  #11 0x563e6eefcfdd in access_with_adjusted_size  softmmu/memory.c:552:18
  #12 0x563e6eefac90 in memory_region_dispatch_write  softmmu/memory.c:1502=
:16
  #13 0x563e6e834e16 in flatview_write_continue  softmmu/physmem.c:2746:23
  #14 0x563e6e81cd38 in flatview_write  softmmu/physmem.c:2786:14
  #15 0x563e6e81c868 in address_space_write  softmmu/physmem.c:2878:18

  =3D=3D=3D Reproducer =3D=3D=3D
  cat << EOF | ./qemu-system-i386  -display none -machine accel=3Dqtest, -m=
 \
  512M -machine q35 -nodefaults -device vmxnet3,netdev=3Dnet0 -netdev \
  user,id=3Dnet0 -qtest stdio
  outl 0xcf8 0x80000810
  outl 0xcfc 0xe0000000
  outl 0xcf8 0x80000814
  outl 0xcf8 0x80000804
  outw 0xcfc 0x7
  outl 0xcf8 0x80000815
  outl 0xcfc 0xffff00b5
  write 0x0 0x1 0xe1
  write 0x1 0x1 0xfe
  write 0x2 0x1 0xbe
  write 0x3 0x1 0xba
  write 0xff00b020 0x4 0x0000feca
  write 0xe0000630 0x1 0x00
  EOF

 =20
  =3D=3D=3D Testcase =3D=3D=3D

  /*
   * Autogenerated Fuzzer Test Case
   *
   * This work is licensed under the terms of the GNU GPL, version 2 or lat=
er.
   * See the COPYING file in the top-level directory.
   */

  #include "qemu/osdep.h"

  #include "libqos/libqtest.h"

  static void test_fuzz(void) {
      QTestState *s =3D qtest_init(" -display none , -m 512M -machine q35 -=
nodefaults "
                                 "-device vmxnet3,netdev=3Dnet0 -netdev use=
r,id=3Dnet0");
      qtest_outl(s, 0xcf8, 0x80000810);
      qtest_outl(s, 0xcfc, 0xe0000000);
      qtest_outl(s, 0xcf8, 0x80000814);
      qtest_outl(s, 0xcf8, 0x80000804);
      qtest_outw(s, 0xcfc, 0x7);
      qtest_outl(s, 0xcf8, 0x80000815);
      qtest_outl(s, 0xcfc, 0xffff00b5);
      qtest_bufwrite(s, 0x0, "\xe1", 0x1);
      qtest_bufwrite(s, 0x1, "\xfe", 0x1);
      qtest_bufwrite(s, 0x2, "\xbe", 0x1);
      qtest_bufwrite(s, 0x3, "\xba", 0x1);
      qtest_bufwrite(s, 0xff00b020, "\x00\x00\xfe\xca", 0x4);
      qtest_bufwrite(s, 0xe0000630, "\x00", 0x1);
      qtest_quit(s);
  }
  int main(int argc, char **argv) {
      const char *arch =3D qtest_get_arch();

      g_test_init(&argc, &argv, NULL);

      if (strcmp(arch, "i386") =3D=3D 0) {
          qtest_add_func("fuzz/test_fuzz", test_fuzz);
      }

      return g_test_run();
  }

 =20
  =3D=3D=3D OSS-Fuzz Report =3D=3D=3D
  https://bugs.chromium.org/p/oss-fuzz/issues/detail?id=3D33603
  https://oss-fuzz.com/testcase?key=3D6071483232288768

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1926111/+subscriptions


