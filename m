Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C0A22EEC83
	for <lists+qemu-devel@lfdr.de>; Fri,  8 Jan 2021 05:33:15 +0100 (CET)
Received: from localhost ([::1]:38966 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kxjSc-00027N-64
	for lists+qemu-devel@lfdr.de; Thu, 07 Jan 2021 23:33:14 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51464)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1kxjLr-0001LX-I4
 for qemu-devel@nongnu.org; Thu, 07 Jan 2021 23:26:15 -0500
Received: from indium.canonical.com ([91.189.90.7]:56086)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1kxjLc-0003ek-39
 for qemu-devel@nongnu.org; Thu, 07 Jan 2021 23:26:15 -0500
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1kxjLY-00048b-MV
 for <qemu-devel@nongnu.org>; Fri, 08 Jan 2021 04:25:56 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 0C5452E8162
 for <qemu-devel@nongnu.org>; Fri,  8 Jan 2021 04:25:56 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Fri, 08 Jan 2021 04:17:18 -0000
From: Launchpad Bug Tracker <1653419@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Expired; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Tags: svm
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: anandj91 janitor th-huth
X-Launchpad-Bug-Reporter: Anand J (anandj91)
X-Launchpad-Bug-Modifier: Launchpad Janitor (janitor)
References: <20170101121115.14908.69350.malonedeb@wampee.canonical.com>
Message-Id: <161007943814.27824.15847374267034506417.malone@loganberry.canonical.com>
Subject: [Bug 1653419] Re: SVM emulation fails due to EIP and FLAG register
 update optimization
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="9b8a7e9b05b0918031670be47aedac0f241cb913"; Instance="production"
X-Launchpad-Hash: e9172fa96fcba46902b7dd1d89920922cc5f52dd
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
Reply-To: Bug 1653419 <1653419@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

[Expired for QEMU because there has been no activity for 60 days.]

** Changed in: qemu
       Status: Incomplete =3D> Expired

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1653419

Title:
  SVM emulation fails due to EIP and FLAG register update optimization

Status in QEMU:
  Expired

Bug description:
  SVM emulation support has a bug due to which causes KVM emulation
  error when qemu-kvm is run over KVM installed on top of QEmu in
  software mode.

  Steps to reproduce
  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
  1. Run KVM inside QEmu(software mode with SVM emulation support). Make su=
re kvm_amd is running.
  2. Run any guest OS on top of the KVM using qemu-kvm.
  3. Following KVM emulation error is thrown immediately.

  KVM internal error. Suberror: 1
  emulation failure
  EAX=3Dffffffff EBX=3D4000004b ECX=3D00000000 EDX=3D000f5ea0
  ESI=3D00000000 EDI=3D00000000 EBP=3D00000000 ESP=3D00006fd0
  EIP=3D40000000 EFL=3D00000086 [--S--P-] CPL=3D0 II=3D0 A20=3D1 SMM=3D0 HL=
T=3D0
  ES =3D0010 00000000 ffffffff 00c09300 DPL=3D0 DS   [-WA]
  CS =3D0008 00000000 ffffffff 00c09b00 DPL=3D0 CS32 [-RA]
  SS =3D0010 00000000 ffffffff 00c09300 DPL=3D0 DS   [-WA]
  DS =3D0010 00000000 ffffffff 00c09300 DPL=3D0 DS   [-WA]
  FS =3D0010 00000000 ffffffff 00c09300 DPL=3D0 DS   [-WA]
  GS =3D0010 00000000 ffffffff 00c09300 DPL=3D0 DS   [-WA]
  LDT=3D0000 00000000 0000ffff 00008200 DPL=3D0 LDT
  TR =3D0000 00000000 0000ffff 00008b00 DPL=3D0 TSS32-busy
  GDT=3D     000f7180 00000037
  IDT=3D     000f71be 00000000
  CR0=3D00000011 CR2=3D00000000 CR3=3D00000000 CR4=3D00000000
  DR0=3D0000000000000000 DR1=3D0000000000000000 DR2=3D0000000000000000 DR3=
=3D0000000000000000
  DR6=3D00000000ffff0ff0 DR7=3D0000000000000400
  EFER=3D0000000000000000
  Code=3D00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 <00> 0=
0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 0=
0 00 00 00

  Reason for the error
  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
  Due to performance reasons, EIP and FLAG registers are not updated after =
executing every guest instructions. There are optimizations done to update =
these registers intelligently, for eg: EIP is updated at the end of transla=
tion block. This means EIP remains the address of the first instruction in =
the TB throughout the execution.

  In case of a VMEXIT because of a page fault happened after executing
  an instruction in the middle of the TB, the VMCB is updated with the
  wrong guest EIP and jumps to the address where host has left off. On
  the subsequent VMRUN by the host QEmu start executing some of the
  instructions that has already been executed. This can cause wrong
  execution flow.

  Following is the instruction execution trace of the above scenario.

  0x00000000000f368f: callq 0xeecc4
  vmexit(00000060, 0000000000000000, 0000000000000000, 00000000000eecc4)!
  vmsave! 00000000b72e9000
  vmload! 00000000b72e9000
  vmrun! 00000000b72e9000
  0x00000000000eecc4: push %rbx
  0x00000000000eecc5: xor %ecx,%ecx
  0x00000000000eecc7: mov (%rax,%rcx,1),%bl
  0x00000000000eecca: cmp (%rdx,%rcx,1),%bl
  vmexit(0000004e, 0000000000000000, 00000000000f5ea0, 00000000000eecc4)!

  Page fault happens at 0x00000000000eecca which triggers a VMEXIT.
  vmcb->save->rip is updated with 0x00000000000eecc4 instead of
  0x00000000000eecca.

  vmsave! 00000000b72e9000
  vmload! 00000000b72e9000
  vmrun! 00000000b72e9000
  0x00000000000eecc4: push %rbx
  0x00000000000eecc5: xor %ecx,%ecx
  0x00000000000eecc7: mov (%rax,%rcx,1),%bl
  0x00000000000eecca: cmp (%rdx,%rcx,1),%bl
  0x00000000000eeccd: je 0xeecdc
  0x00000000000eeccf: setl %al
  0x00000000000eecd2: movzbl %al,%eax
  0x00000000000eecd5: neg %eax
  0x00000000000eecd7: or $0x1,%eax
  0x00000000000eecda: jmp 0xeece3
  0x00000000000eece3: pop %rbx
  0x00000000000eece4: retq
  vmexit(0000004e, 0000000000000000, 0000000040000000, 0000000040000000)!

  The subsequent VMRUN again starts executing from 0x00000000000eecc4
  which causes %rbx being pushed to the stack for the second time. The
  retq instruction picks wrong return address and jumps to an illegal
  location.

  Similar issue is there with updating FLAG register as well.

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1653419/+subscriptions

