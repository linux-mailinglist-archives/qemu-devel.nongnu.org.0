Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BBAFE366588
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Apr 2021 08:38:41 +0200 (CEST)
Received: from localhost ([::1]:51772 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lZ6VU-0003uW-Rq
	for lists+qemu-devel@lfdr.de; Wed, 21 Apr 2021 02:38:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34836)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lZ6Sf-0002eD-5e
 for qemu-devel@nongnu.org; Wed, 21 Apr 2021 02:35:45 -0400
Received: from indium.canonical.com ([91.189.90.7]:46872)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lZ6SZ-0005Lh-U8
 for qemu-devel@nongnu.org; Wed, 21 Apr 2021 02:35:44 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1lZ6SX-0001VL-Ra
 for <qemu-devel@nongnu.org>; Wed, 21 Apr 2021 06:35:37 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id CC9732E8157
 for <qemu-devel@nongnu.org>; Wed, 21 Apr 2021 06:35:37 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Wed, 21 Apr 2021 06:28:08 -0000
From: Thomas Huth <1751264@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Incomplete; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Tags: qemu-img
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: kyominii th-huth xanclic
X-Launchpad-Bug-Reporter: Teddy VALETTE (kyominii)
X-Launchpad-Bug-Modifier: Thomas Huth (th-huth)
References: <151939024836.30479.4933664010119224710.malonedeb@gac.canonical.com>
Message-Id: <161898648816.10175.2393057152433014327.malone@wampee.canonical.com>
Subject: [Bug 1751264] Re: qemu-img convert issue in a tmpfs partition
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="1552fceb1603b3da6cfa437575d9c9fc4b2e683a"; Instance="production"
X-Launchpad-Hash: 6d2514d112484f47006ca6f170227e91f93af582
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
Reply-To: Bug 1751264 <1751264@bugs.launchpad.net>
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
https://bugs.launchpad.net/bugs/1751264

Title:
  qemu-img convert issue in a tmpfs partition

Status in QEMU:
  Incomplete

Bug description:
  qemu-img convert command is slow when the file to convert is located
  in a tmpfs formatted partition.

  v2.1.0 on debian/jessie x64, ext4: 10m14s
  v2.1.0 on debian/jessie x64, tmpfs: 10m15s

  v2.1.0 on debian/stretch x64, ext4: 11m9s
  v2.1.0 on debian/stretch x64, tmpfs: 10m21.362s

  v2.8.0 on debian/jessie x64, ext4: 10m21s
  v2.8.0 on debian/jessie x64, tmpfs: Too long (50min+)

  v2.8.0 on debian/stretch x64, ext4: 10m42s
  v2.8.0 on debian/stretch x64, tmpfs: Too long (50min+)

  It seems that the issue is caused by this commit :
  https://github.com/qemu/qemu/commit/690c7301600162421b928c7f26fd488fd8fa4=
64e

  In order to reproduce this bug :

  1/ mount a tmpfs partition : mount -t tmpfs tmpfs /tmp
  2/ get a vmdk file (we used a 15GB image) and put it on /tmp
  3/ run the 'qemu-img convert -O qcow2 /tmp/file.vmdk /path/to/destination=
' command

  When we trace the process, we can see that there's a lseek loop which
  is very slow (compare to outside a tmpfs partition).

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1751264/+subscriptions

