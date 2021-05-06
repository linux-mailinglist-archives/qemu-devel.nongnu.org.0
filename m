Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 403DE374FE8
	for <lists+qemu-devel@lfdr.de>; Thu,  6 May 2021 09:18:10 +0200 (CEST)
Received: from localhost ([::1]:49288 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1leYGu-0002fu-PH
	for lists+qemu-devel@lfdr.de; Thu, 06 May 2021 03:18:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59572)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1leYFM-0001OY-8Z
 for qemu-devel@nongnu.org; Thu, 06 May 2021 03:16:32 -0400
Received: from indium.canonical.com ([91.189.90.7]:53388)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1leYFK-0000cH-1z
 for qemu-devel@nongnu.org; Thu, 06 May 2021 03:16:31 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.93 #5 (Debian))
 id 1leYFH-0007BD-NJ
 for <qemu-devel@nongnu.org>; Thu, 06 May 2021 07:16:27 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id A7E512E8187
 for <qemu-devel@nongnu.org>; Thu,  6 May 2021 07:16:27 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Thu, 06 May 2021 07:03:06 -0000
From: Thomas Huth <1865626@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Incomplete; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Tags: s390x
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: liangy th-huth
X-Launchpad-Bug-Reporter: liang yan (liangy)
X-Launchpad-Bug-Modifier: Thomas Huth (th-huth)
References: <158319312084.12323.11221527653494995336.malonedeb@soybean.canonical.com>
Message-Id: <162028458698.14201.1189992320183890238.malone@soybean.canonical.com>
Subject: [Bug 1865626] Re: qemu hang when ipl boot from a mdev dasd
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="d6ba96cccb3d3e356754af3137c6128a6c17e2a8"; Instance="production"
X-Launchpad-Hash: 6f1b48a48c366078aa33129aa643bd824fac2404
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
Reply-To: Bug 1865626 <1865626@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Can you still reproduce this issue with the latest version of QEMU?
Which kind of guest did you install?

** Tags added: s390x

** Changed in: qemu
       Status: New =3D> Incomplete

** Summary changed:

- qemu hang when ipl boot from a mdev dasd
+ s390x guest hang when ipl boot from a mdev dasd

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1865626

Title:
  s390x guest hang when ipl boot from a mdev dasd

Status in QEMU:
  Incomplete

Bug description:
  qemu latest
  kernel 5.3.18

  I am using a passthrough dasd as boot device, the installment looks
  fine and gets into reboot process. However VM could not boot and just
  hang as below after that. I have been checking on "s390: vfio-ccw dasd
  ipl support" series right now but no clue yet. Could anyone take a
  look for it? Thanks.


  s390vsw188:~ # bash test.sh
  LOADPARM=3D[        ]
  executing ccw chain at : 0x0000000000000018
  executing ccw chain at : 0x000000000000e000

  2020-03-01T06:24:56.879314Z qemu-system-s390x: warning: vfio-ccw
  (devno fe.0.0000): PFCH flag forced


  s390zp12:~ # cat test.sh
  /root/qemu/s390x-softmmu/qemu-system-s390x \
  -machine s390-ccw-virtio,accel=3Dkvm \
  -nographic \
  -bios /root/qemu/pc-bios/s390-ccw/s390-ccw.img \
  -device vfio-ccw,id=3Dhostdev0,sysfsdev=3D/sys/bus/mdev/devices/08e8c006-=
146d-48d3-b21a-c005f9d3a04b,,devno=3Dfe.0.0000,bootindex=3D1 \
  -global vfio-ccw.force-orb-pfch=3Dyes \

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1865626/+subscriptions

