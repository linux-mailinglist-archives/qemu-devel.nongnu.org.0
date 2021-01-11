Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 830922F0C06
	for <lists+qemu-devel@lfdr.de>; Mon, 11 Jan 2021 06:02:49 +0100 (CET)
Received: from localhost ([::1]:55848 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kypLs-0000Ob-2E
	for lists+qemu-devel@lfdr.de; Mon, 11 Jan 2021 00:02:48 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59254)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1kypK1-00083k-C6
 for qemu-devel@nongnu.org; Mon, 11 Jan 2021 00:00:54 -0500
Received: from indium.canonical.com ([91.189.90.7]:42618)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1kypJy-0003DR-78
 for qemu-devel@nongnu.org; Mon, 11 Jan 2021 00:00:53 -0500
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1kypJw-00010r-1W
 for <qemu-devel@nongnu.org>; Mon, 11 Jan 2021 05:00:48 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 027852E813A
 for <qemu-devel@nongnu.org>; Mon, 11 Jan 2021 05:00:47 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Mon, 11 Jan 2021 04:52:24 -0000
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
References: <161009834109.3567.5030676858811031897.malonedeb@wampee.canonical.com>
Message-Id: <161034074506.22048.1826305187892509282.malone@wampee.canonical.com>
Subject: [Bug 1910696] Re: Qemu fails to start with error " There is no option
 group 'spice'"
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="fd9c5a87183d01004404fa6027cd262eaa7f6fcf"; Instance="production"
X-Launchpad-Hash: 879745b999364b3d1f3177f9579704af72f7d675
Received-SPF: none client-ip=91.189.90.7; envelope-from=bounces@canonical.com;
 helo=indium.canonical.com
X-Spam_score_int: -66
X-Spam_score: -6.7
X-Spam_bar: ------
X-Spam_report: (-6.7 / 5.0 requ) BAYES_00=-1.9,
 HEADER_FROM_DIFFERENT_DOMAINS=0.249, RCVD_IN_DNSWL_HI=-5,
 RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01, SPF_HELO_NONE=0.001,
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

Additional information: This error occurs only if spice is compiled as
module (`--enable-modules`) and spice parameters are supplied from file
with `-readconfig /path/to/file` . If spice parameters are supplied from
the command line (`-spice param1=3Da,param2=3Db`) , an error does not occur.

Possible workaround: Build most modules statically
(https://salsa.debian.org/qemu-team/qemu/-/blob/master/debian/patches
/build-most-modules-statically-hack.diff) or disable modules entirely
(`--disable-modules`)

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

