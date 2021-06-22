Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5849D3AFC49
	for <lists+qemu-devel@lfdr.de>; Tue, 22 Jun 2021 06:58:38 +0200 (CEST)
Received: from localhost ([::1]:37656 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lvYUf-0000TS-Bg
	for lists+qemu-devel@lfdr.de; Tue, 22 Jun 2021 00:58:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58312)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lvY4A-0002li-8a
 for qemu-devel@nongnu.org; Tue, 22 Jun 2021 00:31:14 -0400
Received: from indium.canonical.com ([91.189.90.7]:58566)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lvY47-0000Pm-VD
 for qemu-devel@nongnu.org; Tue, 22 Jun 2021 00:31:13 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.93 #5 (Debian))
 id 1lvY46-0003kl-41
 for <qemu-devel@nongnu.org>; Tue, 22 Jun 2021 04:31:10 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 18E422E805B
 for <qemu-devel@nongnu.org>; Tue, 22 Jun 2021 04:31:10 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Tue, 22 Jun 2021 04:17:44 -0000
From: Launchpad Bug Tracker <1605611@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Expired; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: janitor mathieu-tarral th-huth
X-Launchpad-Bug-Reporter: Mathieu Tarral (mathieu-tarral)
X-Launchpad-Bug-Modifier: Launchpad Janitor (janitor)
References: <20160722121902.333.5320.malonedeb@gac.canonical.com>
Message-Id: <162433546449.20423.15217835328164203194.malone@loganberry.canonical.com>
Subject: [Bug 1605611] Re: memsave returns invalid addr when trying to read a
 64 bits address
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="3619498b5524a71696f3dd612f4d11bd63449bb1"; Instance="production"
X-Launchpad-Hash: 8e54cb1a23509b2a01f7a2e2c291f24b59fcf2e8
Received-SPF: none client-ip=91.189.90.7; envelope-from=bounces@canonical.com;
 helo=indium.canonical.com
X-Spam_score_int: -65
X-Spam_score: -6.6
X-Spam_bar: ------
X-Spam_report: (-6.6 / 5.0 requ) BAYES_00=-1.9,
 HEADER_FROM_DIFFERENT_DOMAINS=0.25, RCVD_IN_DNSWL_HI=-5,
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
Reply-To: Bug 1605611 <1605611@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

[Expired for QEMU because there has been no activity for 60 days.]

** Changed in: qemu
       Status: Incomplete =3D> Expired

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1605611

Title:
  memsave returns invalid addr when trying to read a 64 bits address

Status in QEMU:
  Expired

Bug description:
  I am trying to read the first 16 bytes of the System Process on a
  Windows XP x64 SP2 using the memsave monitor command.

  I cloned the latest release of QEMU, v2.6.0, configured it with =

  ./configure --target-list=3Di386-softmmu,x86_64-softmmu --enable-sdl
  and compiled it.

  I first tried to use memsave against Windows XP SP3 32 bits.
  This is the procedure i used :

  1 - start the VM with :
  ./i386-softmmu/qemu-system-i386 --enable-kvm -monitor stdio -hda ~/vm/win=
xp.qcow2
  and wait for the desktop
  2 - take a physical memory dump with :
  pmemsave 0 134217728 dump.raw
  3 - call rekall on this memory dump to identify running processes :
  rekall -f dump.raw pslist
  _EPROCESS          Name          PID   PPID   Thds    Hnds    Sess  Wow64=
           Start                     Exit          =

  ---------- -------------------- ----- ------ ------ -------- ------ -----=
- ------------------------ ------------------------
  0x80e8fa00 System                   4      0     46      148      - False=
  -                        -                       =

  4 - read the first 16 bytes of the System PROCESS struct :
  memsave 0x80e8fa00 16 system
  5 - check the content with hexdump :
  00000000  03 00 1b 00 00 00 00 00  08 fa e8 80 08 fa e8 80
  you can recognize here the beginning of an EPROCESS struct.

  So on a 32 bits Windows XP OS, it works.

  But when i tried on Windows XP SP2 64 bits, rekall gave me the following =
output :
    _EPROCESS            Name          PID   PPID   Thds    Hnds    Sess  W=
ow64           Start                     Exit          =

  -------------- -------------------- ----- ------ ------ -------- ------ -=
----- ------------------------ ------------------------
  0xfadffd71d040 System                   4      0     51      398      - F=
alse  -                        -                       =

  And when i tried to read the memory with memsave :
  memsave 0xfadffd71d040 16 system

  I had the following error :
  Invalid addr 0x0000fadffd71d040/size 16 specified

  This address is supposed to be valid because I am reading the System EPro=
cess struct, which should not be in the paged pool memory I think.
  Also i disabled the paging file to be sure and the bug is still present.

  Furthermore the bug is reproducible on the latest QEMU
  (01a720125f5e2f0a23d2682b39dead2fcc820066).

  Can you confirm that this is a bug ?
  Should i check something ?

  Thanks !

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1605611/+subscriptions

