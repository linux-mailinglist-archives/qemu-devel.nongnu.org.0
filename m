Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 158D936543C
	for <lists+qemu-devel@lfdr.de>; Tue, 20 Apr 2021 10:35:58 +0200 (CEST)
Received: from localhost ([::1]:48736 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lYlrR-0006qK-3z
	for lists+qemu-devel@lfdr.de; Tue, 20 Apr 2021 04:35:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48278)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lYlit-0004nC-25
 for qemu-devel@nongnu.org; Tue, 20 Apr 2021 04:27:07 -0400
Received: from indium.canonical.com ([91.189.90.7]:59000)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lYlin-0002a6-Hv
 for qemu-devel@nongnu.org; Tue, 20 Apr 2021 04:27:06 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1lYlik-00028H-Mg
 for <qemu-devel@nongnu.org>; Tue, 20 Apr 2021 08:26:58 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 587862E816D
 for <qemu-devel@nongnu.org>; Tue, 20 Apr 2021 08:26:57 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Tue, 20 Apr 2021 08:04:48 -0000
From: Thomas Huth <1813045@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Incomplete; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: michele.schillaci th-huth
X-Launchpad-Bug-Reporter: Michele Schillaci (michele.schillaci)
X-Launchpad-Bug-Modifier: Thomas Huth (th-huth)
References: <154826325670.29740.8985180444326228276.malonedeb@soybean.canonical.com>
Message-Id: <161890588843.10588.14617999131761737402.malone@chaenomeles.canonical.com>
Subject: [Bug 1813045] Re: qemu-ga fsfreeze crashes the kernel
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="8932ab84469600dc3d8b3344fb7135c702d5179e"; Instance="production"
X-Launchpad-Hash: 9f2b0f0d8b057ccdcba5b75e104ffa03ba4ecdcb
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
Reply-To: Bug 1813045 <1813045@bugs.launchpad.net>
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
https://bugs.launchpad.net/bugs/1813045

Title:
  qemu-ga fsfreeze crashes the kernel

Status in QEMU:
  Incomplete

Bug description:
  We use mainly Cloudlinux, Debian and Centos.
  We experienced many crashes on our qemu instances based on Cloudlinux dur=
ing a snapshot.
  The issue is not related to CloudLinux directly, but to Qemu agent, which=
 does not freeze the file system(s) correctly. What is actually happening:

  When VM backup is invoked, Qemu agent freezes the file systems, so no sin=
gle change will be made during the backup. But Qemu agent does not respect =
the loop* devices in freezing order (we have checked its sources), which le=
ads to the next situation: =

  1) freeze loopback fs
                ---> send async reqs to loopback thread
  2) freeze main fs
  3) loopback thread wakes up and trying to write data to the main fs, whic=
h is still frozen, and this finally leads to the hung task and kernel crash=
. =


  I believe this is the culprit:

  /dev/loop0 /tmp ext3 rw,nosuid,noexec,relatime,data=3Dordered 0 0
  /dev/loop0 /var/tmp ext3 rw,nosuid,noexec,relatime,data=3Dordered 0 0

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1813045/+subscriptions

