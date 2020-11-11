Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1089D2AF4A2
	for <lists+qemu-devel@lfdr.de>; Wed, 11 Nov 2020 16:22:13 +0100 (CET)
Received: from localhost ([::1]:57372 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kcrwp-0006tv-SV
	for lists+qemu-devel@lfdr.de; Wed, 11 Nov 2020 10:22:12 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:49996)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1kcrvY-00064A-Vw
 for qemu-devel@nongnu.org; Wed, 11 Nov 2020 10:20:53 -0500
Received: from indium.canonical.com ([91.189.90.7]:43008)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1kcrvV-0004Gq-Gi
 for qemu-devel@nongnu.org; Wed, 11 Nov 2020 10:20:52 -0500
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1kcrvT-0006hi-Qk
 for <qemu-devel@nongnu.org>; Wed, 11 Nov 2020 15:20:47 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id C95BC2E80AB
 for <qemu-devel@nongnu.org>; Wed, 11 Nov 2020 15:20:47 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Wed, 11 Nov 2020 15:09:44 -0000
From: Thomas Huth <1778473@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Incomplete; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: naresh-kamboju th-huth
X-Launchpad-Bug-Reporter: Naresh Kamboju (naresh-kamboju)
X-Launchpad-Bug-Modifier: Thomas Huth (th-huth)
References: <152991322806.7059.5607302246363918755.malonedeb@wampee.canonical.com>
Message-Id: <160510738507.23842.7467160796995898696.malone@chaenomeles.canonical.com>
Subject: [Bug 1778473] Re: [Crash] qemu-system-x86_64: mov_ss_trap_64 PANIC:
 double fault, error_code: 0x0
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="c11d702c7d7f4a497cdcc277027f1662d395603f"; Instance="production"
X-Launchpad-Hash: a65c927d71461881b365dcbc6d3fd678ca716269
Received-SPF: none client-ip=91.189.90.7; envelope-from=bounces@canonical.com;
 helo=indium.canonical.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/11 10:11:47
X-ACL-Warn: Detected OS   = Linux 3.11 and newer [fuzzy]
X-Spam_score_int: -65
X-Spam_score: -6.6
X-Spam_bar: ------
X-Spam_report: (-6.6 / 5.0 requ) BAYES_00=-1.9,
 HEADER_FROM_DIFFERENT_DOMAINS=0.249, RCVD_IN_DNSWL_HI=-5,
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
Reply-To: Bug 1778473 <1778473@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The QEMU project is currently considering to move its bug tracking to anoth=
er system. For this we need to know which bugs are still valid and which co=
uld be closed already. Thus we are setting older bugs to "Incomplete" now.
If you still think this bug report here is valid, then please switch the st=
ate back to "New" within the next 60 days, otherwise this report will be ma=
rked as "Expired". Or mark it as "Fix Released" if the problem has been sol=
ved with a newer version of QEMU already. Thank you and sorry for the incon=
venience.

** Changed in: qemu
       Status: New =3D> Incomplete

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1778473

Title:
  [Crash] qemu-system-x86_64: mov_ss_trap_64 PANIC: double fault,
  error_code: 0x0

Status in QEMU:
  Incomplete

Bug description:
  Kselftest test case mov_ss_trap_64 is causing kernel panic on
  qemu-system-x86_64 and PASS on real x86_64 hardware.

  qemu-system-x86_64 version is 2.12.0
  host architecture: amd64

  Test failed on recent stable rc kernel,
  4.17.3-rc1, 4.16.18-rc1 and 4.14.52-rc1.

  =

  Test code snippet,
  main() {
  <>
        printf("[RUN]\tMOV SS; CS CS INT3\n");
        asm volatile ("mov %[ss], %%ss; .byte 0x2e, 0x2e; int3" :: [ss] "m"=
 (ss));
  <>
  }

  Kerel crash log,
  # cd /opt/kselftests/mainline/x86
  # ./mov_ss_trap_64
  	SS =3D 0x2b, &SS =3D 0x0x604188
  	Set up a watchpoint
  	DR0 =3D 604188, DR1 =3D 400a19, DR7 =3D 7000a
  [RUN]	Read from watched memory (should get SIGTRAP)
  	Got SIGTRAP with RIP=3D4008ea, EFLAGS.RF=3D0
  [RUN]	MOV SS; INT3
  	Got SIGTRAP with RIP=3D4008fb, EFLAGS.RF=3D0
  [RUN]	MOV SS; INT 3
  	Got SIGTRAP with RIP=3D40090d, EFLAGS.RF=3D0
  [RUN]	M[   20.305426] PANIC: double fault, error_code: 0x0
  OV SS; CS CS INT3
  	Got SIGTRAP with RIP=3D400920,[   20.308317] CPU: 3 PID: 2471 Comm: mov_=
ss_trap_64 Not tainted 4.17.3-rc1 #1
   EFLAGS.RF=3D0
  [RUN]	MOV SS; CSx14 INT3
  [   20.311664] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIO=
S 1.10.2-1 04/01/2014
  [   20.314738] RIP: 0010:error_entry+0x32/0x100
  [   20.316198] RSP: 0000:fffffe0000086000 EFLAGS: 00010046
  [   20.317911] RAX: 0000000092400a87 RBX: 0000000000000000 RCX: 000000000=
0000000
  [   20.320168] RDX: 0000000000000000 RSI: ffffffff92400f18 RDI: ffffffff9=
2401146
  [   20.322405] RBP: 0000000000000000 R08: 0000000000000000 R09: 000000000=
0000000
  [   20.324320] R10: 0000000000000000 R11: 0000000000000000 R12: 000000000=
0000000
  [   20.326073] R13: 0000000000000000 R14: 0000000000000000 R15: 000000000=
0000000
  [   20.327869] FS:  00007f3174aefe80(0000) GS:ffff9f447fd80000(0000) knlG=
S:0000000000000000
  [   20.329850] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
  [   20.331343] CR2: fffffe0000085ff8 CR3: 0000000136d2e000 CR4: 000000000=
00006e0
  [   20.333150] DR0: 0000000000604188 DR1: 0000000000400a19 DR2: 000000000=
0000000
  [   20.334893] DR3: 0000000000000000 DR6: 00000000ffff0ff0 DR7: 000000000=
007060a
  [   20.336649] Call Trace:
  [   20.337523]  <ENTRY_TRAMPOLINE>
  [   20.338507]  ? native_iret+0x7/0x7
  [   20.339611]  ? page_fault+0x8/0x30
  [   20.340693]  ? error_entry+0x86/0x100
  [   20.341871]  ? trace_hardirqs_off_caller+0x7/0xa0
  [   20.343212]  ? trace_hardirqs_off_thunk+0x1a/0x1c
  [   20.344554]  ? native_iret+0x7/0x7
  [   20.345647]  ? page_fault+0x8/0x30
  [   20.346716]  ? error_entry+0x86/0x100
  [   20.347853]  ? page_fault+0x8/0x30
  [   20.348920]  ? ist_enter+0x6/0xa0
  [   20.349961]  ? do_int3+0x34/0x120
  [   20.351095]  ? int3+0x14/0x20
  [   20.352047]  </ENTRY_TRAMPOLINE>
  [   20.353060] Code: 48 89 7c 24 08 52 31 d2 51 31 c9 50 41 50 45 31 c0 4=
1 51 45 31 c9 41 52 45 31 d2 41 53 45 31 db 53 31 db 55 31 ed 41 54 45 31 e=
4 <41> 55 45 31 ed 41 56 45 31 f6 41 57 45 31 ff 56 48 8d 6c 24 09 =

  [   20.357895] Kernel panic - not syncing: Machine halted.
  [   20.359385] CPU: 3 PID: 2471 Comm: mov_ss_trap_64 Not tainted 4.17.3-r=
c1 #1
  [   20.361271] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIO=
S 1.10.2-1 04/01/2014
  [   20.363513] Call Trace:
  [   20.364367]  <#DF>
  [   20.365109]  dump_stack+0x68/0x95
  [   20.366131]  panic+0xe3/0x22a
  [   20.367207]  df_debug+0x2d/0x30
  [   20.368254]  do_double_fault+0x9f/0x120
  [   20.369387]  double_fault+0x23/0x30
  [   20.370444] RIP: 0010:error_entry+0x32/0x100
  [   20.371791] RSP: 0000:fffffe0000086000 EFLAGS: 00010046
  [   20.373246] RAX: 0000000092400a87 RBX: 0000000000000000 RCX: 000000000=
0000000
  [   20.375250] RDX: 0000000000000000 RSI: ffffffff92400f18 RDI: ffffffff9=
2401146
  [   20.377103] RBP: 0000000000000000 R08: 0000000000000000 R09: 000000000=
0000000
  [   20.378958] R10: 0000000000000000 R11: 0000000000000000 R12: 000000000=
0000000
  [   20.380808] R13: 0000000000000000 R14: 0000000000000000 R15: 000000000=
0000000
  [   20.382744]  ? page_fault+0x8/0x30
  [   20.383925]  ? error_entry+0x86/0x100
  [   20.385037]  </#DF>
  [   20.385793]  <ENTRY_TRAMPOLINE>
  [   20.386774]  ? native_iret+0x7/0x7
  [   20.387839]  ? page_fault+0x8/0x30
  [   20.388901]  ? error_entry+0x86/0x100
  [   20.389997]  ? trace_hardirqs_off_caller+0x7/0xa0
  [   20.391464]  ? trace_hardirqs_off_thunk+0x1a/0x1c
  [   20.392850]  ? native_iret+0x7/0x7
  [   20.393886]  ? page_fault+0x8/0x30
  [   20.394984]  ? error_entry+0x86/0x100
  [   20.396092]  ? page_fault+0x8/0x30
  [   20.397145]  ? ist_enter+0x6/0xa0
  [   20.398167]  ? do_int3+0x34/0x120
  [   20.399213]  ? int3+0x14/0x20
  [   20.400226]  </ENTRY_TRAMPOLINE>
  [   20.401574] Kernel Offset: 0x10800000 from 0xffffffff81000000 (relocat=
ion range: 0xffffffff80000000-0xffffffffbfffffff)
  [   20.404788] ---[ end Kernel panic - not syncing: Machine halted. ]---

  Full crash log can be found at,
  https://lkft.validation.linaro.org/scheduler/job/303760

  Download this image.
  http://snapshots.linaro.org/openembedded/lkft/morty/intel-core2-32/rpb/li=
nux-stable-rc-4.17/7/rpb-console-image-intel-core2-32-20180624171508-7.hddi=
mg.xz =


  Boot command:
  qemu-system-x86_64
   -cpu host
   -enable-kvm
   -nographic
   -net nic,model=3Dvirtio,macaddr=3DDE:AD:BE:EF:66:01
   -net tap -m 1024
   -monitor none
   -drive format=3Draw,file=3Drpb-console-image-intel-core2-32-201806241715=
08-7.hddimg,if=3Dvirtio
   -m 4096
   -smp 4
   -drive format=3Dqcow2,file=3D/lava-guest.qcow2,media=3Ddisk,if=3Dvirtio

  =

  After successfull boot,
  login as root

  Run the in-built test,
  cd /opt/kselftests/mainline/x86
  ./mov_ss_trap_64

  Test case link,
  https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable.git/t=
ree/tools/testing/selftests/x86/mov_ss_trap.c?h=3Dlinux-4.17.y

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1778473/+subscriptions

