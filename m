Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DFE5776A1
	for <lists+qemu-devel@lfdr.de>; Sat, 27 Jul 2019 06:30:59 +0200 (CEST)
Received: from localhost ([::1]:44144 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hrEMD-0005sg-QX
	for lists+qemu-devel@lfdr.de; Sat, 27 Jul 2019 00:30:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58145)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <bounces@canonical.com>) id 1hrEM0-0005QV-5I
 for qemu-devel@nongnu.org; Sat, 27 Jul 2019 00:30:45 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <bounces@canonical.com>) id 1hrELw-0002t7-5d
 for qemu-devel@nongnu.org; Sat, 27 Jul 2019 00:30:42 -0400
Received: from indium.canonical.com ([91.189.90.7]:33450)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <bounces@canonical.com>)
 id 1hrELu-0001vE-2D
 for qemu-devel@nongnu.org; Sat, 27 Jul 2019 00:30:39 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1hrELH-0002Zv-E7
 for <qemu-devel@nongnu.org>; Sat, 27 Jul 2019 04:29:59 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 5CFD92E80D1
 for <qemu-devel@nongnu.org>; Sat, 27 Jul 2019 04:29:59 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Sat, 27 Jul 2019 04:17:26 -0000
From: Launchpad Bug Tracker <1590322@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Expired; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: janitor sayantan-bhowmik94 th-huth
X-Launchpad-Bug-Reporter: sayantan (sayantan-bhowmik94)
X-Launchpad-Bug-Modifier: Launchpad Janitor (janitor)
References: <20160608085308.24358.59591.malonedeb@gac.canonical.com>
Message-Id: <156420104655.24883.17447081818121226307.malone@loganberry.canonical.com>
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com); Revision="19010";
 Instance="launchpad-lazr.conf"
X-Launchpad-Hash: 5d666f744017450699712f53a62ad39d0d5b408c
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 91.189.90.7
Subject: [Qemu-devel] [Bug 1590322] Re: mouse_button 0 takes back to initial
 position
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
Reply-To: Bug 1590322 <1590322@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

[Expired for QEMU because there has been no activity for 60 days.]

** Changed in: qemu
       Status: Incomplete =3D> Expired

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1590322

Title:
  mouse_button 0 takes back to initial position

Status in QEMU:
  Expired

Bug description:
  i wrote a python script to perform some drag function in the Qemu simulat=
or.
  mouse_move x , y
  mouse_button 1
  mouse_move new_x,new_y
  mouse_move 0

  =

  The mouse_move 0 doesn't release the mouse in the position new_x,new_y in=
stead it takes  it back to the point x,y and then releases the mouse

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1590322/+subscriptions

