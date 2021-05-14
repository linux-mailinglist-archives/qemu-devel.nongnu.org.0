Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AFCDB3810B9
	for <lists+qemu-devel@lfdr.de>; Fri, 14 May 2021 21:27:42 +0200 (CEST)
Received: from localhost ([::1]:47648 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lhdTJ-0002Ac-Re
	for lists+qemu-devel@lfdr.de; Fri, 14 May 2021 15:27:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58614)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lhdRP-0008Kr-Ns
 for qemu-devel@nongnu.org; Fri, 14 May 2021 15:25:43 -0400
Received: from indium.canonical.com ([91.189.90.7]:42292)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lhdRM-0002rF-P2
 for qemu-devel@nongnu.org; Fri, 14 May 2021 15:25:43 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.93 #5 (Debian))
 id 1lhdRK-0001It-HJ
 for <qemu-devel@nongnu.org>; Fri, 14 May 2021 19:25:38 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 80DA52E813A
 for <qemu-devel@nongnu.org>; Fri, 14 May 2021 19:25:38 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Fri, 14 May 2021 19:18:30 -0000
From: Thomas Huth <1913510@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Expired; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Tags: fuzzer
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: qiuhao th-huth
X-Launchpad-Bug-Reporter: Qiuhao Li (qiuhao)
X-Launchpad-Bug-Modifier: Thomas Huth (th-huth)
References: <161180638809.32681.10582727151927636988.malonedeb@chaenomeles.canonical.com>
Message-Id: <162101991058.7463.28967420846725675.malone@gac.canonical.com>
Subject: [Bug 1913510] Re: [Fuzz] qemu-system-i386 virtio-mouse: Assertion in
 address_space_lduw_le_cached failed
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="5321c3f40fa4d4b847f4e47fb766e7b95ed5036c"; Instance="production"
X-Launchpad-Hash: 55c29c58767acb20188b17c612f9066533d0f917
Received-SPF: none client-ip=91.189.90.7; envelope-from=bounces@canonical.com;
 helo=indium.canonical.com
X-Spam_score_int: -65
X-Spam_score: -6.6
X-Spam_bar: ------
X-Spam_report: (-6.6 / 5.0 requ) BAYES_00=-1.9,
 HEADER_FROM_DIFFERENT_DOMAINS=0.248, RCVD_IN_DNSWL_HI=-5,
 RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Reply-To: Bug 1913510 <1913510@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This is an automated cleanup. This bug report has been moved to QEMU's
new bug tracker on gitlab.com and thus gets marked as 'expired' now.
Please continue with the discussion here:

 https://gitlab.com/qemu-project/qemu/-/issues/302


** Changed in: qemu
       Status: New =3D> Expired

** Bug watch added: gitlab.com/qemu-project/qemu/-/issues #302
   https://gitlab.com/qemu-project/qemu/-/issues/302

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1913510

Title:
  [Fuzz] qemu-system-i386 virtio-mouse: Assertion in
  address_space_lduw_le_cached failed

Status in QEMU:
  Expired

Bug description:
  --[ Reproducer

  cat << EOF | ./build/qemu-system-i386 -machine q35,accel=3Dqtest -nodefau=
lts \
  -device virtio-mouse -display none -qtest stdio
  outl 0xcf8 0x80000820
  outl 0xcfc 0xe0004000
  outl 0xcf8 0x80000804
  outb 0xcfc 0x02
  write 0xe000400c 0x4 0x003fe62e
  write 0xe0004016 0x1 0x01
  write 0xe0004024 0x1 0x01
  write 0xe000401c 0x1 0x01
  write 0xe0007007 0x1 0x00
  write 0xe0004018 0x1 0x41
  write 0xe0007007 0x1 0x00
  EOF

  =

  --[ Output

  [I 1611805425.711054] OPENED
  [R +0.040080] outl 0xcf8 0x80000820
  OK
  [S +0.040117] OK
  [R +0.040136] outl 0xcfc 0xe0004000
  OK
  [S +0.040155] OK
  [R +0.040165] outl 0xcf8 0x80000804
  OK
  [S +0.040172] OK
  [R +0.040184] outb 0xcfc 0x02
  OK
  [S +0.040683] OK
  [R +0.040702] write 0xe000400c 0x4 0x003fe62e
  OK
  [S +0.040735] OK
  [R +0.040743] write 0xe0004016 0x1 0x01
  OK
  [S +0.040748] OK
  [R +0.040755] write 0xe0004024 0x1 0x01
  OK
  [S +0.040760] OK
  [R +0.040767] write 0xe000401c 0x1 0x01
  OK
  [S +0.040785] OK
  [R +0.040792] write 0xe0007007 0x1 0x00
  OK
  [S +0.040810] OK
  [R +0.040817] write 0xe0004018 0x1 0x41
  OK
  [S +0.040822] OK
  [R +0.040839] write 0xe0007007 0x1 0x00
  qemu-system-i386: /home/ubuntu/qemu/include/exec/memory_ldst_cached.h.inc=
:54: uint32_t address_space_lduw_le_cached(MemoryRegionCache *, hwaddr, Mem=
TxAttrs, MemTxResult *): Assertion `addr < cache->len && 2 <=3D cache->len =
- addr' failed.

  =

  -- [ Original ASAN report

  qemu-fuzz-i386: /home/ubuntu/qemu/include/exec/memory_ldst_cached.h.inc:5=
4: uint32_t address_space_lduw_le_cached(MemoryRegionCache *, hwaddr, MemTx=
Attrs, MemTxResult *): Assertion `addr < cache->len && 2 <=3D cache->len - =
addr' failed.
  =3D=3D3406167=3D=3D ERROR: libFuzzer: deadly signal
      #0 0x5644e4ae0f21 in __sanitizer_print_stack_trace (/home/ubuntu/qemu=
/build/qemu-fuzz-i386+0x2a47f21)
      #1 0x5644e4a29fe8 in fuzzer::PrintStackTrace() (/home/ubuntu/qemu/bui=
ld/qemu-fuzz-i386+0x2990fe8)
      #2 0x5644e4a10023 in fuzzer::Fuzzer::CrashCallback() (/home/ubuntu/qe=
mu/build/qemu-fuzz-i386+0x2977023)
      #3 0x7f77e2a4b3bf  (/lib/x86_64-linux-gnu/libpthread.so.0+0x153bf)
      #4 0x7f77e285c18a in raise (/lib/x86_64-linux-gnu/libc.so.6+0x4618a)
      #5 0x7f77e283b858 in abort (/lib/x86_64-linux-gnu/libc.so.6+0x25858)
      #6 0x7f77e283b728  (/lib/x86_64-linux-gnu/libc.so.6+0x25728)
      #7 0x7f77e284cf35 in __assert_fail (/lib/x86_64-linux-gnu/libc.so.6+0=
x36f35)
      #8 0x5644e60051b2 in address_space_lduw_le_cached /home/ubuntu/qemu/i=
nclude/exec/memory_ldst_cached.h.inc:54:5
      #9 0x5644e60051b2 in lduw_le_phys_cached /home/ubuntu/qemu/include/ex=
ec/memory_ldst_phys.h.inc:91:12
      #10 0x5644e60051b2 in virtio_lduw_phys_cached /home/ubuntu/qemu/inclu=
de/hw/virtio/virtio-access.h:166:12
      #11 0x5644e5ff476d in vring_avail_ring /home/ubuntu/qemu/build/../hw/=
virtio/virtio.c:327:12
      #12 0x5644e5ff476d in vring_get_used_event /home/ubuntu/qemu/build/..=
/hw/virtio/virtio.c:333:12
      #13 0x5644e5ff476d in virtio_split_should_notify /home/ubuntu/qemu/bu=
ild/../hw/virtio/virtio.c:2473:35
      #14 0x5644e5ff476d in virtio_should_notify /home/ubuntu/qemu/build/..=
/hw/virtio/virtio.c:2524:16
      #15 0x5644e5ff5556 in virtio_notify /home/ubuntu/qemu/build/../hw/vir=
tio/virtio.c:2566:14
      #16 0x5644e5571d2a in virtio_input_handle_sts /home/ubuntu/qemu/build=
/../hw/input/virtio-input.c:100:5
      #17 0x5644e5ff20ec in virtio_queue_notify /home/ubuntu/qemu/build/../=
hw/virtio/virtio.c:2366:9
      #18 0x5644e60908fb in memory_region_write_accessor /home/ubuntu/qemu/=
build/../softmmu/memory.c:491:5
      #19 0x5644e6090363 in access_with_adjusted_size /home/ubuntu/qemu/bui=
ld/../softmmu/memory.c:552:18
      #20 0x5644e608fbc0 in memory_region_dispatch_write /home/ubuntu/qemu/=
build/../softmmu/memory.c
      #21 0x5644e5b97bc6 in flatview_write_continue /home/ubuntu/qemu/build=
/../softmmu/physmem.c:2759:23
      #22 0x5644e5b8d328 in flatview_write /home/ubuntu/qemu/build/../softm=
mu/physmem.c:2799:14
      #23 0x5644e5b8d328 in address_space_write /home/ubuntu/qemu/build/../=
softmmu/physmem.c:2891:18
      #24 0x5644e6018906 in qtest_process_command /home/ubuntu/qemu/build/.=
./softmmu/qtest.c:539:13
      #25 0x5644e60159df in qtest_process_inbuf /home/ubuntu/qemu/build/../=
softmmu/qtest.c:797:9
      #26 0x5644e6015735 in qtest_server_inproc_recv /home/ubuntu/qemu/buil=
d/../softmmu/qtest.c:904:9
      #27 0x5644e667cf68 in qtest_sendf /home/ubuntu/qemu/build/../tests/qt=
est/libqtest.c:438:5
      #28 0x5644e667e54e in qtest_write /home/ubuntu/qemu/build/../tests/qt=
est/libqtest.c:1002:5
      #29 0x5644e667e54e in qtest_writeq /home/ubuntu/qemu/build/../tests/q=
test/libqtest.c:1023:5
      #30 0x5644e4b1037e in __wrap_qtest_writeq /home/ubuntu/qemu/build/../=
tests/qtest/fuzz/qtest_wrappers.c:190:9
      #31 0x5644e4b1c33d in op_write /home/ubuntu/qemu/build/../tests/qtest=
/fuzz/generic_fuzz.c:479:13
      #32 0x5644e4b1a259 in generic_fuzz /home/ubuntu/qemu/build/../tests/q=
test/fuzz/generic_fuzz.c:681:17
      #33 0x5644e4b0b333 in LLVMFuzzerTestOneInput /home/ubuntu/qemu/build/=
../tests/qtest/fuzz/fuzz.c:151:5
      #34 0x5644e4a11581 in fuzzer::Fuzzer::ExecuteCallback(unsigned char c=
onst*, unsigned long) (/home/ubuntu/qemu/build/qemu-fuzz-i386+0x2978581)
      #35 0x5644e49fcc92 in fuzzer::RunOneTest(fuzzer::Fuzzer*, char const*=
, unsigned long) (/home/ubuntu/qemu/build/qemu-fuzz-i386+0x2963c92)
      #36 0x5644e4a02cfe in fuzzer::FuzzerDriver(int*, char***, int (*)(uns=
igned char const*, unsigned long)) (/home/ubuntu/qemu/build/qemu-fuzz-i386+=
0x2969cfe)
      #37 0x5644e4a2a7c2 in main (/home/ubuntu/qemu/build/qemu-fuzz-i386+0x=
29917c2)
      #38 0x7f77e283d0b2 in __libc_start_main (/lib/x86_64-linux-gnu/libc.s=
o.6+0x270b2)
      #39 0x5644e49d739d in _start (/home/ubuntu/qemu/build/qemu-fuzz-i386+=
0x293e39d)

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1913510/+subscriptions

