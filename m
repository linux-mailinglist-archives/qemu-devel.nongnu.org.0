Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 26A942AF481
	for <lists+qemu-devel@lfdr.de>; Wed, 11 Nov 2020 16:13:27 +0100 (CET)
Received: from localhost ([::1]:47150 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kcroM-0002Ev-8L
	for lists+qemu-devel@lfdr.de; Wed, 11 Nov 2020 10:13:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47454)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1kcrmp-0001PM-Ky
 for qemu-devel@nongnu.org; Wed, 11 Nov 2020 10:11:51 -0500
Received: from indium.canonical.com ([91.189.90.7]:41190)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1kcrmo-0000zI-0k
 for qemu-devel@nongnu.org; Wed, 11 Nov 2020 10:11:51 -0500
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1kcrmj-000564-RF
 for <qemu-devel@nongnu.org>; Wed, 11 Nov 2020 15:11:46 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id EECF02E8148
 for <qemu-devel@nongnu.org>; Wed, 11 Nov 2020 15:11:37 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Wed, 11 Nov 2020 15:03:53 -0000
From: Thomas Huth <1777232@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Incomplete; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: gersner th-huth
X-Launchpad-Bug-Reporter: Shimi Gersner (gersner)
X-Launchpad-Bug-Modifier: Thomas Huth (th-huth)
References: <152914728124.2335.1880022102353250655.malonedeb@chaenomeles.canonical.com>
Message-Id: <160510703367.8163.16205222380585755888.malone@wampee.canonical.com>
Subject: [Bug 1777232] Re: NVME fails on big writes
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="c11d702c7d7f4a497cdcc277027f1662d395603f"; Instance="production"
X-Launchpad-Hash: 4acce999fce8db5cdd22c60819e9893fe8067a55
Received-SPF: none client-ip=91.189.90.7; envelope-from=bounces@canonical.com;
 helo=indium.canonical.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/11 10:11:47
X-ACL-Warn: Detected OS   = Linux 3.11 and newer [fuzzy]
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
Reply-To: Bug 1777232 <1777232@bugs.launchpad.net>
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
https://bugs.launchpad.net/bugs/1777232

Title:
  NVME fails on big writes

Status in QEMU:
  Incomplete

Bug description:
  NVME Compliance test 8:3.3.0 tries to write and read back big chunks
  of pages. Currently, on the latest QEMU operation of size 1024 blocks
  will fail when device is backed by a file.

  NVME specification has several types of data transfers from guests,
  one of the is the PRP list (Physical Region Page List). PRP is a list
  of entries pointing to pages to be written. The list it self resides
  in a single or multiple pages.

  NVME device maps the PRP list into QEMUSGList which will be me mapped
  into linux IO vectors. Finally, when the file driver will write the
  changes, it uses the posix pwritev, which fails if the number of
  vectors exceeds the maximum.

  =

  NVME Compliance - https://github.com/nvmecompliance/tnvme/wiki

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1777232/+subscriptions

