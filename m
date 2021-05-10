Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E7642377D7B
	for <lists+qemu-devel@lfdr.de>; Mon, 10 May 2021 09:52:09 +0200 (CEST)
Received: from localhost ([::1]:56168 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lg0i0-00025X-WF
	for lists+qemu-devel@lfdr.de; Mon, 10 May 2021 03:52:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42900)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lg0gZ-0007xc-3l
 for qemu-devel@nongnu.org; Mon, 10 May 2021 03:50:39 -0400
Received: from indium.canonical.com ([91.189.90.7]:50266)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lg0gX-0004ra-Bg
 for qemu-devel@nongnu.org; Mon, 10 May 2021 03:50:38 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.93 #5 (Debian))
 id 1lg0gW-0001MQ-1U
 for <qemu-devel@nongnu.org>; Mon, 10 May 2021 07:50:36 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 079AA2E813A
 for <qemu-devel@nongnu.org>; Mon, 10 May 2021 07:50:36 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Mon, 10 May 2021 07:44:30 -0000
From: Thomas Huth <1870039@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Expired; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Tags: qemu-img windows
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: rafael.rivera th-huth
X-Launchpad-Bug-Reporter: Rafael Rivera (rafael.rivera)
X-Launchpad-Bug-Modifier: Thomas Huth (th-huth)
References: <158572796276.11754.15285888952629544503.malonedeb@chaenomeles.canonical.com>
Message-Id: <162063267051.9948.12117383937367678475.malone@chaenomeles.canonical.com>
Subject: [Bug 1870039] Re: windows qemu-img fails to convert vhdx,
 assertion failure
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="dccd804998035922efb3da0a725ecc923e2255f3"; Instance="production"
X-Launchpad-Hash: 365ac286b3eec6f3db21af8b6211f6654324142c
Received-SPF: none client-ip=91.189.90.7; envelope-from=bounces@canonical.com;
 helo=indium.canonical.com
X-Spam_score_int: -65
X-Spam_score: -6.6
X-Spam_bar: ------
X-Spam_report: (-6.6 / 5.0 requ) BAYES_00=-1.9,
 HEADER_FROM_DIFFERENT_DOMAINS=0.249, RCVD_IN_DNSWL_HI=-5,
 RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01, SPF_HELO_NONE=0.001,
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

This is an automated cleanup. This bug report has been moved to QEMU's
new bug tracker on gitlab.com and thus gets marked as 'expired' now.
Please continue with the discussion here:

 https://gitlab.com/qemu-project/qemu/-/issues/250


** Changed in: qemu
       Status: New =3D> Expired

** Bug watch added: gitlab.com/qemu-project/qemu/-/issues #250
   https://gitlab.com/qemu-project/qemu/-/issues/250

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1870039

Title:
  windows qemu-img fails to convert vhdx, assertion failure

Status in QEMU:
  Expired

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

