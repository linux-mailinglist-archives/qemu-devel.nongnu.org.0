Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DBE2525DC20
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Sep 2020 16:41:52 +0200 (CEST)
Received: from localhost ([::1]:35022 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kECuV-00050e-Vq
	for lists+qemu-devel@lfdr.de; Fri, 04 Sep 2020 10:41:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37262)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1kECtc-0003tl-CB
 for qemu-devel@nongnu.org; Fri, 04 Sep 2020 10:40:56 -0400
Received: from indium.canonical.com ([91.189.90.7]:53872)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1kECta-0005I5-4L
 for qemu-devel@nongnu.org; Fri, 04 Sep 2020 10:40:55 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1kECtX-0004hF-ID
 for <qemu-devel@nongnu.org>; Fri, 04 Sep 2020 14:40:51 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 880212E80DB
 for <qemu-devel@nongnu.org>; Fri,  4 Sep 2020 14:40:51 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Fri, 04 Sep 2020 14:33:00 -0000
From: Laurent Vivier <1894071@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=New; importance=Undecided; assignee=None;
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: bigboy0822 laurent-vivier
X-Launchpad-Bug-Reporter: Tony.LI (bigboy0822)
X-Launchpad-Bug-Modifier: Laurent Vivier (laurent-vivier)
References: <159912571834.28358.2492164063235416189.malonedeb@soybean.canonical.com>
Message-Id: <159922998038.11462.13185688483020440060.malone@chaenomeles.canonical.com>
Subject: [Bug 1894071] Re: qemu-i386-static ioctl return -14 (Bad Address)
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="90a5703803d95539bdb5c0b289b1675630569e1e"; Instance="production"
X-Launchpad-Hash: dcccd72b807342d2ebe2ed469ea7e58a6ed75c36
Received-SPF: none client-ip=91.189.90.7; envelope-from=bounces@canonical.com;
 helo=indium.canonical.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/09/04 10:40:52
X-ACL-Warn: Detected OS   = Linux 3.11 and newer [fuzzy]
X-Spam_score_int: -68
X-Spam_score: -6.9
X-Spam_bar: ------
X-Spam_report: (-6.9 / 5.0 requ) BAYES_00=-1.9,
 HEADER_FROM_DIFFERENT_DOMAINS=0.001, RCVD_IN_DNSWL_HI=-5,
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
Reply-To: Bug 1894071 <1894071@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

You need to use IOCTL_SPECIAL() or STRUCT_SPECIAL() macro to convert the
target address to the host address.

Again, share your patches on the qemu-devel mailing list if you want
help.

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1894071

Title:
  qemu-i386-static ioctl return -14 (Bad Address)

Status in QEMU:
  New

Bug description:
  I use qemu-i386-static on 64 bit ARM.But I don't know how to solve some p=
roblems.
  First I added some ioctl operations.
  Then I tried to do some DRM operations like test.c.
  This is successful when I use qemu-x86_64-static,but it failed when I use=
 qemu-i386-static.
  I can get some strace info like this:

  403 openat(AT_FDCWD,"/dev/dri/card0",O_RDWR|O_LARGEFILE|O_CLOEXEC) =3D 4
  403 ioctl(4,DRM_IOCTL_GET_CAP,{1,0}) =3D 0 ({1,1})
  403 ioctl(4,DRM_IOCTL_MODE_GETRESOURCES,{0,0,0,0,0,0,0,0,0,0,0,0}) =3D 0 =
({0,0,0,0,0,2,2,2,0,16384,0,16384})
  403 brk(NULL) =3D 0x40006000
  403 brk(0x40027000) =3D 0x40027000
  403 brk(0x40028000) =3D 0x40028000
  403 ioctl(4,DRM_IOCTL_MODE_GETRESOURCES,{0,1073766816,1073766832,10737668=
48,0,2,2,2,0,16384,0,16384}) =3D -1 errno=3D14 (Bad address)

  And there are similar errors in other self driven operations.
  I want to know if it is QEMU's problem, so I hope to get some help. =

  Thank you!

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1894071/+subscriptions

