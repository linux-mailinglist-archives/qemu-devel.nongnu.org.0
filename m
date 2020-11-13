Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BABFB2B206A
	for <lists+qemu-devel@lfdr.de>; Fri, 13 Nov 2020 17:28:00 +0100 (CET)
Received: from localhost ([::1]:36484 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kdbvb-00057W-OF
	for lists+qemu-devel@lfdr.de; Fri, 13 Nov 2020 11:27:59 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:45246)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1kdbu7-0003U2-Ik
 for qemu-devel@nongnu.org; Fri, 13 Nov 2020 11:26:29 -0500
Received: from indium.canonical.com ([91.189.90.7]:53436)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1kdbtt-0002jn-A0
 for qemu-devel@nongnu.org; Fri, 13 Nov 2020 11:26:25 -0500
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1kdbtq-0008Hc-EJ
 for <qemu-devel@nongnu.org>; Fri, 13 Nov 2020 16:26:10 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 2F9E92E813D
 for <qemu-devel@nongnu.org>; Fri, 13 Nov 2020 16:26:10 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Fri, 13 Nov 2020 16:10:55 -0000
From: Thomas Huth <1759337@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Incomplete; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: awilliamson th-huth
X-Launchpad-Bug-Reporter: Adam Williamson (awilliamson)
X-Launchpad-Bug-Modifier: Thomas Huth (th-huth)
References: <152217185720.30131.11816005457402548159.malonedeb@gac.canonical.com>
Message-Id: <160528385577.1224.1219881851957822383.malone@gac.canonical.com>
Subject: [Bug 1759337] Re: 'Failed to get "write" lock' error when trying to
 run a VM with disk image file on an SMB share
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="38ebca4a151c7e484f2992f7b90f5a3ede13f97f"; Instance="production"
X-Launchpad-Hash: a3d348522ff9359141f4b79e34a713f9cacedd48
Received-SPF: none client-ip=91.189.90.7; envelope-from=bounces@canonical.com;
 helo=indium.canonical.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/13 09:15:41
X-ACL-Warn: Detected OS   = Linux 3.11 and newer [fuzzy]
X-Spam_score_int: -65
X-Spam_score: -6.6
X-Spam_bar: ------
X-Spam_report: (-6.6 / 5.0 requ) BAYES_00=-1.9,
 HEADER_FROM_DIFFERENT_DOMAINS=0.25, RCVD_IN_DNSWL_HI=-5,
 RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=unavailable autolearn_force=no
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
Reply-To: Bug 1759337 <1759337@bugs.launchpad.net>
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
https://bugs.launchpad.net/bugs/1759337

Title:
  'Failed to get "write" lock' error when trying to run a VM with disk
  image file on an SMB share

Status in QEMU:
  Incomplete

Bug description:
  This has been reported and discussed downstream:

  https://bugzilla.redhat.com/show_bug.cgi?id=3D1484130

  but doesn't seem to be getting a lot of traction there.

  Basically, with qemu since at least 2.10, you cannot use a disk image
  on an SMB share that's mounted with protocol version 3 (I think
  possibly 2 or higher). This is made much more serious because kernel
  4.13 upstream made version 3 the *default* for SMB mounts, because
  version 1 is insecure and should not be used.

  So basically, anyone with a recent qemu and kernel cannot use disk
  images stored on an SMB share. This is a major inconvenience for me
  because, well, an SMB share is exactly where I store my VM disk
  images, usually: I have a big NAS drive where I keep them all, only
  now I can't because of this bug, and I'm manually swapping them in and
  out of the very limited space I have on my system drive (SSD).

  The error you get is:

  qemu-system-x86_64: -drive file=3D/share/data/isos/vms/desktop_test_1.qco=
w2,format=3Dqcow2,if=3Dnone,id=3Ddrive-virtio-disk0: Failed to get "write" =
lock
  Is another process using the image?

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1759337/+subscriptions

