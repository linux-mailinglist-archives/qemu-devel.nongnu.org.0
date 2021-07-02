Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D15833B9B82
	for <lists+qemu-devel@lfdr.de>; Fri,  2 Jul 2021 06:31:33 +0200 (CEST)
Received: from localhost ([::1]:38774 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lzApw-00086v-Qz
	for lists+qemu-devel@lfdr.de; Fri, 02 Jul 2021 00:31:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49454)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lzAkV-00088c-Ms
 for qemu-devel@nongnu.org; Fri, 02 Jul 2021 00:25:55 -0400
Received: from indium.canonical.com ([91.189.90.7]:42576)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lzAkT-0002Oq-U2
 for qemu-devel@nongnu.org; Fri, 02 Jul 2021 00:25:55 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.93 #5 (Debian))
 id 1lzAkN-00053b-Qu
 for <qemu-devel@nongnu.org>; Fri, 02 Jul 2021 04:25:48 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 62AFF2E81AC
 for <qemu-devel@nongnu.org>; Fri,  2 Jul 2021 04:25:46 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Fri, 02 Jul 2021 04:17:29 -0000
From: Launchpad Bug Tracker <1859081@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Expired; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: janitor programmingkidx roemeeeer th-huth
X-Launchpad-Bug-Reporter: =?utf-8?q?Roman_B=C3=A4riswyl_=28roemeeeer=29?=
X-Launchpad-Bug-Modifier: Launchpad Janitor (janitor)
References: <157860451191.3344.46185682085252095.malonedeb@soybean.canonical.com>
Message-Id: <162519944983.31921.2774938209645966004.malone@loganberry.canonical.com>
Subject: [Bug 1859081] Re: Mouse way too fast when Qemu is on a Windows VM
 with a OS 9 Guest
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="c7d3f30bfe7d7b488c7f9d3c8d7880184b1d065e"; Instance="production"
X-Launchpad-Hash: 07adcf08a89480f399f936136e29f3ca9a86c215
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
Reply-To: Bug 1859081 <1859081@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

[Expired for QEMU because there has been no activity for 60 days.]

** Changed in: qemu
       Status: Incomplete =3D> Expired

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1859081

Title:
  Mouse way too fast when Qemu is on a Windows VM with a OS 9 Guest

Status in QEMU:
  Expired

Bug description:
  On a server, I have a Windows 10 VM with Qemu 4.1.0 (latest) from https:/=
/qemu.weilnetz.de/w64/ installed.
  There I have a Mac OS 9.2.2 machine.
  Now if I connect to the Windows VM with VNC or RDP or even VMWare console=
, the Mouse in the Mac OS Guest inside Qemu is waaaay to fast. Even when lo=
wering the mouse speed in the Mac OS mouse setting, one pixel in the Host (=
Windows 10 VM) still moves the mouse by 10 pixels inside the Qemu machine.
  I tried different resolutions but that does not help.
  Is there any way to fix this or any way how I can provide more informatio=
n?
  Thanks

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1859081/+subscriptions

