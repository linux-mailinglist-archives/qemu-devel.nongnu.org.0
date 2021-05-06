Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D6B23750A6
	for <lists+qemu-devel@lfdr.de>; Thu,  6 May 2021 10:20:45 +0200 (CEST)
Received: from localhost ([::1]:51708 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1leZFU-0002h1-Fk
	for lists+qemu-devel@lfdr.de; Thu, 06 May 2021 04:20:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48576)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1leZC7-0007UT-6p
 for qemu-devel@nongnu.org; Thu, 06 May 2021 04:17:15 -0400
Received: from indium.canonical.com ([91.189.90.7]:38740)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1leZC2-00062G-3B
 for qemu-devel@nongnu.org; Thu, 06 May 2021 04:17:14 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.93 #5 (Debian))
 id 1leZBy-0007j0-Rm
 for <qemu-devel@nongnu.org>; Thu, 06 May 2021 08:17:07 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 71D502E81C7
 for <qemu-devel@nongnu.org>; Thu,  6 May 2021 08:16:42 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Thu, 06 May 2021 08:02:51 -0000
From: Thomas Huth <1870039@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Incomplete; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Tags: qemu-img windows
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: rafael.rivera th-huth
X-Launchpad-Bug-Reporter: Rafael Rivera (rafael.rivera)
X-Launchpad-Bug-Modifier: Thomas Huth (th-huth)
References: <158572796276.11754.15285888952629544503.malonedeb@chaenomeles.canonical.com>
Message-Id: <162028817195.3082.144723971617656858.malone@gac.canonical.com>
Subject: [Bug 1870039] Re: windows qemu-img fails to convert vhdx,
 assertion failure
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="d6ba96cccb3d3e356754af3137c6128a6c17e2a8"; Instance="production"
X-Launchpad-Hash: 0adbcb85457e94949198b8925cfa67a8a9e1b7fb
Received-SPF: none client-ip=91.189.90.7; envelope-from=bounces@canonical.com;
 helo=indium.canonical.com
X-Spam_score_int: -64
X-Spam_score: -6.5
X-Spam_bar: ------
X-Spam_report: (-6.5 / 5.0 requ) BAYES_00=-1.9,
 HEADER_FROM_DIFFERENT_DOMAINS=0.249, RCVD_IN_DNSWL_HI=-5,
 RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001, URIBL_SBL_A=0.1 autolearn=ham autolearn_force=no
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
Reply-To: Bug 1870039 <1870039@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The QEMU project is currently moving its bug tracking to another system.
For this we need to know which bugs are still valid and which could be
closed already. Thus we are setting older bugs to "Incomplete" now.

If you still think this bug report here is valid, then please switch
the state back to "New" within the next 60 days, otherwise this report
will be marked as "Expired". Or please mark it as "Fix Released" if
the problem has been solved with a newer version of QEMU already.

Thank you and sorry for the inconvenience.


** Tags added: windows

** Changed in: qemu
       Status: New =3D> Incomplete

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1870039

Title:
  windows qemu-img fails to convert vhdx, assertion failure

Status in QEMU:
  Incomplete

Bug description:
  When attempting to convert Microsoft's 10X emulator image (19563) vhdx
  [1], qemu-img terminates abruptly with an assertion failure. (Newer
  versions of the vhdx exhibit the same issue.)

  > qemu-img.exe convert flash.vhdx flash.vhd
  **
  ERROR:util/iov.c:335:qemu_iovec_concat_iov: assertion failed: (soffset =
=3D=3D 0)
  Bail out! ERROR:util/iov.c:335:qemu_iovec_concat_iov: assertion failed: (=
soffset =3D=3D 0)
  Exception code=3D0x80000003 flags=3D0x0 at 0x00007FFAFDC59302

  Tested with qemu-img.exe --version
  qemu-img version 4.2.50 (v4.2.0-676-g3a63b24a1b-dirty)

  Possibly related: 1719870

  Partial Powershell cmdlet output:

  PS> Get-Vhd flash.vhdx

  VhdFormat               : VHDX
  VhdType                 : Dynamic
  FileSize                : 8365539328
  Size                    : 137438953472
  MinimumSize             : 137438953472
  LogicalSectorSize       : 4096
  PhysicalSectorSize      : 4096
  BlockSize               : 1048576
  ParentPath              :
  DiskIdentifier          : 7BE7C459-AE5D-451A-9368-05875120F702
  FragmentationPercentage : 11
  Alignment               : 1
  Attached                : False
  DiskNumber              :
  IsPMEMCompatible        : False
  AddressAbstractionType  : None
  Number                  :

  [1] https://1drv.ms/u/s!AnjdAnZZcu-GpNFK_-tcNAq_4Aug8w?e=3D5JB6s0

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1870039/+subscriptions

