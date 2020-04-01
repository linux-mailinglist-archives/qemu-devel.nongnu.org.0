Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 012FB19A6FF
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Apr 2020 10:18:26 +0200 (CEST)
Received: from localhost ([::1]:48830 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jJYZt-0005qx-0N
	for lists+qemu-devel@lfdr.de; Wed, 01 Apr 2020 04:18:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35469)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <bounces@canonical.com>) id 1jJYXS-00032G-3D
 for qemu-devel@nongnu.org; Wed, 01 Apr 2020 04:15:55 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <bounces@canonical.com>) id 1jJYXQ-0008NA-L3
 for qemu-devel@nongnu.org; Wed, 01 Apr 2020 04:15:53 -0400
Received: from indium.canonical.com ([91.189.90.7]:60544)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <bounces@canonical.com>)
 id 1jJYXQ-0008MX-Ey
 for qemu-devel@nongnu.org; Wed, 01 Apr 2020 04:15:52 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1jJYXO-0004pN-IQ
 for <qemu-devel@nongnu.org>; Wed, 01 Apr 2020 08:15:50 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 7F5092E8106
 for <qemu-devel@nongnu.org>; Wed,  1 Apr 2020 08:15:50 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Wed, 01 Apr 2020 07:59:22 -0000
From: Rafael Rivera <1870039@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=New; importance=Undecided; assignee=None;
X-Launchpad-Bug-Tags: qemu-img
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: rafael.rivera
X-Launchpad-Bug-Reporter: Rafael Rivera (rafael.rivera)
X-Launchpad-Bug-Modifier: Rafael Rivera (rafael.rivera)
Message-Id: <158572796276.11754.15285888952629544503.malonedeb@chaenomeles.canonical.com>
Subject: [Bug 1870039] [NEW] windows qemu-img fails to convert vhdx,
 assertion failure
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="a296f04231dee355be5db73cc878b9e21689a253";
 Instance="production-secrets-lazr.conf"
X-Launchpad-Hash: fe4a0758f1bd6e51a1d8811b150caaad29a9e4ee
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 91.189.90.7
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

Public bug reported:

When attempting to convert Microsoft's 10X emulator image (19563) vhdx
[1], qemu-img terminates abruptly with an assertion failure. (Newer
versions of the vhdx exhibit the same issue.)

> qemu-img.exe convert flash.vhdx flash.vhd
**
ERROR:util/iov.c:335:qemu_iovec_concat_iov: assertion failed: (soffset =3D=
=3D 0)
Bail out! ERROR:util/iov.c:335:qemu_iovec_concat_iov: assertion failed: (so=
ffset =3D=3D 0)
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

** Affects: qemu
     Importance: Undecided
         Status: New


** Tags: qemu-img

** Description changed:

  When attempting to convert Microsoft's 10X emulator image (19563) vhdx
  [1], qemu-img terminates abruptly with an assertion failure. (Newer
  versions of the vhdx exhibit the same issue.)
+ =

+ > qemu-img.exe convert flash.vhdx flash.vhd
+ **
+ ERROR:util/iov.c:335:qemu_iovec_concat_iov: assertion failed: (soffset =
=3D=3D 0)
+ Bail out! ERROR:util/iov.c:335:qemu_iovec_concat_iov: assertion failed: (=
soffset =3D=3D 0)
+ Exception code=3D0x80000003 flags=3D0x0 at 0x00007FFAFDC59302
  =

  Tested with qemu-img.exe --version
  qemu-img version 4.2.50 (v4.2.0-676-g3a63b24a1b-dirty)
  =

  Possibly related: 1719870
  =

  Partial Powershell cmdlet output:
  =

  PS> Get-Vhd flash.vhdx
  =

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
  =

- =

  [1] https://1drv.ms/u/s!AnjdAnZZcu-GpNFK_-tcNAq_4Aug8w?e=3D5JB6s0

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1870039

Title:
  windows qemu-img fails to convert vhdx, assertion failure

Status in QEMU:
  New

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

