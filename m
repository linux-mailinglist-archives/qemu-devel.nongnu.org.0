Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E7512FAF8A
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Jan 2021 05:42:02 +0100 (CET)
Received: from localhost ([::1]:59584 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l1iq9-0004AD-4j
	for lists+qemu-devel@lfdr.de; Mon, 18 Jan 2021 23:42:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44382)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1l1ifr-0000Yy-09
 for qemu-devel@nongnu.org; Mon, 18 Jan 2021 23:31:23 -0500
Received: from indium.canonical.com ([91.189.90.7]:57674)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1l1ifo-0004yV-VS
 for qemu-devel@nongnu.org; Mon, 18 Jan 2021 23:31:22 -0500
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1l1ifl-00047S-Mh
 for <qemu-devel@nongnu.org>; Tue, 19 Jan 2021 04:31:17 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 7ED0F2E8148
 for <qemu-devel@nongnu.org>; Tue, 19 Jan 2021 04:31:17 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Tue, 19 Jan 2021 04:17:30 -0000
From: Launchpad Bug Tracker <1554451@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Expired; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: janitor satheesaran th-huth
X-Launchpad-Bug-Reporter: SATHEESARAN (satheesaran)
X-Launchpad-Bug-Modifier: Launchpad Janitor (janitor)
References: <20160308100806.13254.85964.malonedeb@wampee.canonical.com>
Message-Id: <161102985047.12094.16714865806983401224.malone@loganberry.canonical.com>
Subject: [Bug 1554451] Re: unable to create preallocated image with gluster
 network protocol
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="44709f752aec466e4fba4ac588c69193e99da5ce"; Instance="production"
X-Launchpad-Hash: 419066a9ca60fc1419e7cf52f4816d991957464b
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
Reply-To: Bug 1554451 <1554451@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

[Expired for QEMU because there has been no activity for 60 days.]

** Changed in: qemu
       Status: Incomplete =3D> Expired

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1554451

Title:
  unable to create preallocated image with gluster network protocol

Status in QEMU:
  Expired

Bug description:
  Unable to create preallocated image with gluster protocol

  Version: qemu-img-0.12.1.2-2.479.el6.x86_64
  Platform: RHEL 6
  I have tried creating preallocated image as follows :

  qemu-img create -f qcow2 -o preallocation=3Dfull
  gluster://localhost/vol1/vm1.img 10G

  I see error a follows :
  [root@ ]# qemu-img create -f qcow2 -o preallocation=3Dfull gluster://loca=
lhost/rep3vol/vm1.img 5G
  Formatting 'gluster://dhcp37-61.lab.eng.blr.redhat.com/rep3vol/newvm3.img=
', fmt=3Dqcow2 size=3D3221225472 encryption=3Doff cluster_size=3D65536 prea=
llocation=3D'full'
  Unknown option 'preallocation'

  I could inspect the image using qemu-img info, but still its not
  preallocated,

  [root@ ]# qemu-img info newvm3.img =

  image: newvm3.img
  file format: qcow2
  virtual size: 3.0G (3221225472 bytes)
  disk size: 588K
  cluster_size: 65536

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1554451/+subscriptions

