Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BD97620CF2F
	for <lists+qemu-devel@lfdr.de>; Mon, 29 Jun 2020 16:37:06 +0200 (CEST)
Received: from localhost ([::1]:45114 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jpuu9-0007sp-Pe
	for lists+qemu-devel@lfdr.de; Mon, 29 Jun 2020 10:37:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46730)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1jpusq-0006gf-Im
 for qemu-devel@nongnu.org; Mon, 29 Jun 2020 10:35:44 -0400
Received: from indium.canonical.com ([91.189.90.7]:56598)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1jpusn-0000L0-LL
 for qemu-devel@nongnu.org; Mon, 29 Jun 2020 10:35:44 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1jpusm-0001dv-F5
 for <qemu-devel@nongnu.org>; Mon, 29 Jun 2020 14:35:40 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 713022E80E7
 for <qemu-devel@nongnu.org>; Mon, 29 Jun 2020 14:35:40 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Mon, 29 Jun 2020 14:29:19 -0000
From: =?utf-8?q?Philippe_Mathieu-Daud=C3=A9?= <1884693@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Confirmed; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: a1xndr
X-Launchpad-Bug-Reporter: Alexander Bulekov (a1xndr)
X-Launchpad-Bug-Modifier: =?utf-8?q?Philippe_Mathieu-Daud=C3=A9_=28philmd?=
 =?utf-8?q?=29?=
References: <159287602229.13953.9997472132144071395.malonedeb@wampee.canonical.com>
Message-Id: <159344096048.2499.6314663958374278572.launchpad@wampee.canonical.com>
Subject: [Bug 1884693] Re: Assertion failure in address_space_unmap through
 ahci_map_clb_address
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="1cbd0aa39df153c901321817f9b57cf3f232b507";
 Instance="production-secrets-lazr.conf"
X-Launchpad-Hash: f5a08cc8494615c7eb68c9e734a7d42994f5d670
Received-SPF: none client-ip=91.189.90.7; envelope-from=bounces@canonical.com;
 helo=indium.canonical.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/06/29 06:50:40
X-ACL-Warn: Detected OS   = Linux 3.11 and newer [fuzzy]
X-Spam_score_int: -58
X-Spam_score: -5.9
X-Spam_bar: -----
X-Spam_report: (-5.9 / 5.0 requ) BAYES_00=-1.9, HEADER_FROM_DIFFERENT_DOMAINS=1,
 RCVD_IN_DNSWL_HI=-5, RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001, URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
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
Reply-To: Bug 1884693 <1884693@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

** Changed in: qemu
       Status: New =3D> Confirmed

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1884693

Title:
  Assertion failure in address_space_unmap through ahci_map_clb_address

Status in QEMU:
  Confirmed

Bug description:
  Hello,
  Reproducer:
  cat << EOF | ./i386-softmmu/qemu-system-i386 -qtest stdio -monitor none -=
serial none -M pc-q35-5.0 -nographic
  outl 0xcf8 0x8000fa24
  outl 0xcfc 0xe1068000
  outl 0xcf8 0x8000fa04
  outw 0xcfc 0x7
  outl 0xcf8 0x8000fb20
  write 0xe1068304 0x1 0x21
  write 0xe1068318 0x1 0x21
  write 0xe1068384 0x1 0x21
  write 0xe1068398 0x2 0x21
  EOF

  Stack trace:
  #0 0x55bfabfe9ea0 in __libc_start_main /build/glibc-GwnBeO/glibc-2.30/csu=
/../csu/libc-start.c:308:16
  #1 0x55bfabfc8ef9 in __sanitizer_print_stack_trace (build/i386-softmmu/qe=
mu-fuzz-i386+0x7b7ef9)
  #2 0x55bfabfaf933 in fuzzer::PrintStackTrace() FuzzerUtil.cpp:210:5
  #3 0x7f88df76110f  (/lib/x86_64-linux-gnu/libpthread.so.0+0x1410f)
  #4 0x7f88df5a4760 in __libc_signal_restore_set /build/glibc-GwnBeO/glibc-=
2.30/signal/../sysdeps/unix/sysv/linux/internal-signals.h:84:10
  #5 0x7f88df5a4760 in raise /build/glibc-GwnBeO/glibc-2.30/signal/../sysde=
ps/unix/sysv/linux/raise.c:48:3
  #6 0x7f88df58e55a in abort /build/glibc-GwnBeO/glibc-2.30/stdlib/abort.c:=
79:7
  #7 0x7f88df58e42e in __assert_fail_base /build/glibc-GwnBeO/glibc-2.30/as=
sert/assert.c:92:3
  #8 0x7f88df59d091 in __assert_fail /build/glibc-GwnBeO/glibc-2.30/assert/=
assert.c:101:3
  #9 0x55bfabff7182 in address_space_unmap exec.c:3602:9
  #10 0x55bfac4a452f in dma_memory_unmap include/sysemu/dma.h:148:5
  #11 0x55bfac4a452f in map_page hw/ide/ahci.c:254:9
  #12 0x55bfac4a1f98 in ahci_map_clb_address hw/ide/ahci.c:748:5
  #13 0x55bfac4a1f98 in ahci_cond_start_engines hw/ide/ahci.c:276:14
  #14 0x55bfac4a074e in ahci_port_write hw/ide/ahci.c:339:9
  #15 0x55bfac4a074e in ahci_mem_write hw/ide/ahci.c:513:9
  #16 0x55bfac0e0dc2 in memory_region_write_accessor memory.c:483:5
  #17 0x55bfac0e0bde in access_with_adjusted_size memory.c:544:18
  #18 0x55bfac0e0917 in memory_region_dispatch_write memory.c
  #19 0x55bfabffa4fd in flatview_write_continue exec.c:3146:23
  #20 0x55bfabff569b in flatview_write exec.c:3186:14
  #21 0x55bfabff569b in address_space_write exec.c:3280:18
  #22 0x55bfac8982a9 in op_write_pattern tests/qtest/fuzz/general_fuzz.c:40=
7:5
  #23 0x55bfac897749 in general_fuzz tests/qtest/fuzz/general_fuzz.c:481:17
  #24 0x55bfac8930a2 in LLVMFuzzerTestOneInput tests/qtest/fuzz/fuzz.c:136:5
  #25 0x55bfabfb0e68 in fuzzer::Fuzzer::ExecuteCallback(unsigned char const=
*, unsigned long) FuzzerLoop.cpp:558:15
  #26 0x55bfabfb0485 in fuzzer::Fuzzer::RunOne(unsigned char const*, unsign=
ed long, bool, fuzzer::InputInfo*, bool*) FuzzerLoop.cpp:470:3
  #27 0x55bfabfb18a1 in fuzzer::Fuzzer::MutateAndTestOne() FuzzerLoop.cpp:7=
01:19
  #28 0x55bfabfb2305 in fuzzer::Fuzzer::Loop(std::vector<fuzzer::SizedFile,=
 fuzzer::fuzzer_allocator<fuzzer::SizedFile> >&) FuzzerLoop.cpp:837:5
  #29 0x55bfabfa2018 in fuzzer::FuzzerDriver(int*, char***, int (*)(unsigne=
d char const*, unsigned long)) FuzzerDriver.cpp:846:6
  #30 0x55bfabfb8722 in main FuzzerMain.cpp:19:10
  #31 0x7f88df58fe0a in __libc_start_main /build/glibc-GwnBeO/glibc-2.30/cs=
u/../csu/libc-start.c:308:16
  #32 0x55bfabf97869 in _start (build/i386-softmmu/qemu-fuzz-i386+0x786869)

  The same error can be triggered through  ahci_map_fis_address @ hw/ide/ah=
ci.c:721:5
  Found with generic device fuzzer: https://patchew.org/QEMU/20200611055651=
.13784-1-alxndr@bu.edu/

  Please let me know if I can provide any further info.

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1884693/+subscriptions

