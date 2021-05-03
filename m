Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CFE22371D24
	for <lists+qemu-devel@lfdr.de>; Mon,  3 May 2021 19:00:01 +0200 (CEST)
Received: from localhost ([::1]:47568 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ldbvM-0006Ps-Qq
	for lists+qemu-devel@lfdr.de; Mon, 03 May 2021 13:00:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44278)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1ldbq9-0001OV-Gj
 for qemu-devel@nongnu.org; Mon, 03 May 2021 12:54:37 -0400
Received: from indium.canonical.com ([91.189.90.7]:35512)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1ldbq2-0003Xl-UJ
 for qemu-devel@nongnu.org; Mon, 03 May 2021 12:54:35 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1ldbq0-0004fF-5q
 for <qemu-devel@nongnu.org>; Mon, 03 May 2021 16:54:28 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 10D402E8193
 for <qemu-devel@nongnu.org>; Mon,  3 May 2021 16:54:28 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Mon, 03 May 2021 16:41:11 -0000
From: Thomas Huth <1366363@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Expired; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: highcheng pandan th-huth
X-Launchpad-Bug-Reporter: Winston Wu (highcheng)
X-Launchpad-Bug-Modifier: Thomas Huth (th-huth)
References: <20140906165232.5566.76013.malonedeb@wampee.canonical.com>
Message-Id: <162006007148.14746.3768769418836461202.malone@wampee.canonical.com>
Subject: [Bug 1366363] Re: qemu-git gravis ultrasound not working
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="02afa4875ac52c169f5cddf0d1bcdd6e149a3754"; Instance="production"
X-Launchpad-Hash: d9dcd786cf5001c3f38e08fde8f3e505fa8a6bec
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
Reply-To: Bug 1366363 <1366363@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This is an automated cleanup. This bug report has been moved to QEMU's
new bug tracker on gitlab.com and thus gets marked as 'expired' now.
Please continue with the discussion here:

 https://gitlab.com/qemu-project/qemu/-/issues/106


** Changed in: qemu
       Status: Triaged =3D> Expired

** Bug watch added: gitlab.com/qemu-project/qemu/-/issues #106
   https://gitlab.com/qemu-project/qemu/-/issues/106

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1366363

Title:
  qemu-git gravis ultrasound not working

Status in QEMU:
  Expired

Bug description:
  Qemu git 2.1.50 with dos622 and windows 3.11.

  Parameter:

  For build: default-configs/sound.mak CONFIG_GUS=3Dy

  Starting parameter: qemu-system-i386 -cpu 486 -m 32M -vga cirrus -hda
  disk1.img -soundhw gus,pcspk -parallel none -net nic,model=3Dne2k_isa
  -net user

  The installer of GUS driver 4.11 does not recognize the card. And
  conscan tells me that ioport 220-240 and not safe for synth base. It
  seems that there is a port conflict.

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1366363/+subscriptions

