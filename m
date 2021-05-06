Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 44C2137517A
	for <lists+qemu-devel@lfdr.de>; Thu,  6 May 2021 11:24:46 +0200 (CEST)
Received: from localhost ([::1]:58422 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1leaFR-0001KR-BZ
	for lists+qemu-devel@lfdr.de; Thu, 06 May 2021 05:24:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60446)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1leZyh-0002gX-FJ
 for qemu-devel@nongnu.org; Thu, 06 May 2021 05:07:29 -0400
Received: from indium.canonical.com ([91.189.90.7]:58900)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1leZyZ-0003CH-AW
 for qemu-devel@nongnu.org; Thu, 06 May 2021 05:07:27 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.93 #5 (Debian))
 id 1leZyU-0001YW-Qb
 for <qemu-devel@nongnu.org>; Thu, 06 May 2021 09:07:15 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 6863D2E8241
 for <qemu-devel@nongnu.org>; Thu,  6 May 2021 09:07:07 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Thu, 06 May 2021 08:58:29 -0000
From: Thomas Huth <1856399@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Expired; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: simonbrand1992 th-huth
X-Launchpad-Bug-Reporter: Simon Brand (simonbrand1992)
X-Launchpad-Bug-Modifier: Thomas Huth (th-huth)
References: <157634067875.7231.7677894888746798043.malonedeb@soybean.canonical.com>
Message-Id: <162029150939.3737.995458753521707645.malone@gac.canonical.com>
Subject: [Bug 1856399] Re: Intel GVT-g works in X11, segfaults in wayland
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="d6ba96cccb3d3e356754af3137c6128a6c17e2a8"; Instance="production"
X-Launchpad-Hash: f806582248a1d280fb665bd3bb9c2b17166b57e2
Received-SPF: none client-ip=91.189.90.7; envelope-from=bounces@canonical.com;
 helo=indium.canonical.com
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
Reply-To: Bug 1856399 <1856399@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This is an automated cleanup. This bug report has been moved to QEMU's
new bug tracker on gitlab.com and thus gets marked as 'expired' now.
Please continue with the discussion here:

 https://gitlab.com/qemu-project/qemu/-/issues/189


** Changed in: qemu
       Status: New =3D> Expired

** Bug watch added: gitlab.com/qemu-project/qemu/-/issues #189
   https://gitlab.com/qemu-project/qemu/-/issues/189

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1856399

Title:
  Intel GVT-g works in X11, segfaults in wayland

Status in QEMU:
  Expired

Bug description:
  Hello,

  I am using an uptodate Arch Linux 64bit with qemu version 4.2.0, but the =
problem was also present in older versions. The problem occurs with Linux 5=
.4 and 4.19.
  The problem also occurs with Debian as guest. I am running sway.
  If I provide -vga std, then qemu works fine until I use the qemu window t=
o switch to the vfio-pci device. There are no problems under X11/xwayland a=
t all.

  Commandline:
  qemu-system-x86_64
  =C2=A0=C2=A0=C2=A0=C2=A0-enable-kvm
  =C2=A0=C2=A0=C2=A0=C2=A0-cpu host
  =C2=A0=C2=A0=C2=A0=C2=A0-smp 2
  =C2=A0=C2=A0=C2=A0=C2=A0-m 8192
  =C2=A0=C2=A0=C2=A0=C2=A0-display gtk,gl=3Don
  =C2=A0=C2=A0=C2=A0=C2=A0-device vfio-pci,sysfsdev=3D/sys/devices/pci0000:=
00/0000:00:02.0/[ID]/,x-igd-opregion=3Don,display=3Don
  =C2=A0=C2=A0=C2=A0=C2=A0-cdrom archlinux-2019.11.01-x86_64.iso
  =C2=A0=C2=A0=C2=A0=C2=A0-vga none

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1856399/+subscriptions

