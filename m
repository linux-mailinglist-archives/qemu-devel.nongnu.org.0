Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F1D42EEFCD
	for <lists+qemu-devel@lfdr.de>; Fri,  8 Jan 2021 10:42:21 +0100 (CET)
Received: from localhost ([::1]:58108 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kxoHj-0002Ie-Jy
	for lists+qemu-devel@lfdr.de; Fri, 08 Jan 2021 04:42:19 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50080)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1kxoGL-0001sX-Oz
 for qemu-devel@nongnu.org; Fri, 08 Jan 2021 04:40:54 -0500
Received: from indium.canonical.com ([91.189.90.7]:60886)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1kxoGJ-0007os-M0
 for qemu-devel@nongnu.org; Fri, 08 Jan 2021 04:40:53 -0500
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1kxoGH-00043o-Mr
 for <qemu-devel@nongnu.org>; Fri, 08 Jan 2021 09:40:49 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id A6A452E802B
 for <qemu-devel@nongnu.org>; Fri,  8 Jan 2021 09:40:49 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Fri, 08 Jan 2021 09:32:21 -0000
From: Edvinas Valatka <1910696@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=New; importance=Undecided; assignee=None;
X-Launchpad-Bug-Tags: qemu readconfig spice
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: edacval
X-Launchpad-Bug-Reporter: Edvinas Valatka (edacval)
X-Launchpad-Bug-Modifier: Edvinas Valatka (edacval)
Message-Id: <161009834109.3567.5030676858811031897.malonedeb@wampee.canonical.com>
Subject: [Bug 1910696] [NEW] Qemu fails to start with error " There is no
 option group 'spice'"
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="9b8a7e9b05b0918031670be47aedac0f241cb913"; Instance="production"
X-Launchpad-Hash: 317f33f4e83b725657ae949df14b8f3e7bab6b54
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
Reply-To: Bug 1910696 <1910696@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Public bug reported:

After upgrade from 5.1.0 to 5.2.0, qemu fails on start with error:
`
/usr/bin/qemu-system-x86_64 -S -name trinti -uuid f8ad2ff6-8808-4f42-8f0b-9=
e23acd20f84 -daemonize -cpu host -nographic -serial chardev:console -nodefa=
ults -no-reboot -no-user-config -sandbox on,obsolete=3Ddeny,elevateprivileg=
es=3Dallow,spawn=3Ddeny,resourcecontrol=3Ddeny -readconfig /var/log/lxd/tri=
nti/qemu.conf -pidfile /var/log/lxd/trinti/qemu.pid -D /var/log/lxd/trinti/=
qemu.log -chroot /var/lib/lxd/virtual-machines/trinti -smbios type=3D2,manu=
facturer=3DCanonical Ltd.,product=3DLXD -runas nobody: =

qemu-system-x86_64:/var/log/lxd/trinti/qemu.conf:27: There is no option gro=
up 'spice'
qemu-system-x86_64: -readconfig /var/log/lxd/trinti/qemu.conf: read config =
/var/log/lxd/trinti/qemu.conf: Invalid argument
`
Bisected to first bad commit: https://github.com/qemu/qemu/commit/cbe5fa117=
89035c43fd2108ac6f45848954954b5

** Affects: qemu
     Importance: Undecided
         Status: New


** Tags: qemu readconfig spice

** Attachment added: "qemu.conf"
   https://bugs.launchpad.net/bugs/1910696/+attachment/5450604/+files/qemu.=
conf

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1910696

Title:
  Qemu fails to start with error " There is no option group 'spice'"

Status in QEMU:
  New

Bug description:
  After upgrade from 5.1.0 to 5.2.0, qemu fails on start with error:
  `
  /usr/bin/qemu-system-x86_64 -S -name trinti -uuid f8ad2ff6-8808-4f42-8f0b=
-9e23acd20f84 -daemonize -cpu host -nographic -serial chardev:console -node=
faults -no-reboot -no-user-config -sandbox on,obsolete=3Ddeny,elevateprivil=
eges=3Dallow,spawn=3Ddeny,resourcecontrol=3Ddeny -readconfig /var/log/lxd/t=
rinti/qemu.conf -pidfile /var/log/lxd/trinti/qemu.pid -D /var/log/lxd/trint=
i/qemu.log -chroot /var/lib/lxd/virtual-machines/trinti -smbios type=3D2,ma=
nufacturer=3DCanonical Ltd.,product=3DLXD -runas nobody: =

  qemu-system-x86_64:/var/log/lxd/trinti/qemu.conf:27: There is no option g=
roup 'spice'
  qemu-system-x86_64: -readconfig /var/log/lxd/trinti/qemu.conf: read confi=
g /var/log/lxd/trinti/qemu.conf: Invalid argument
  `
  Bisected to first bad commit: https://github.com/qemu/qemu/commit/cbe5fa1=
1789035c43fd2108ac6f45848954954b5

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1910696/+subscriptions

