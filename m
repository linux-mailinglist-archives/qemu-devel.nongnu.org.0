Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CA5FD37D389
	for <lists+qemu-devel@lfdr.de>; Wed, 12 May 2021 20:25:36 +0200 (CEST)
Received: from localhost ([::1]:43142 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lgtY7-0005Or-Sc
	for lists+qemu-devel@lfdr.de; Wed, 12 May 2021 14:25:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44430)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lgtOW-0001bl-M2
 for qemu-devel@nongnu.org; Wed, 12 May 2021 14:15:40 -0400
Received: from indium.canonical.com ([91.189.90.7]:34432)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lgtOT-0001Es-Ca
 for qemu-devel@nongnu.org; Wed, 12 May 2021 14:15:40 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.93 #5 (Debian))
 id 1lgtOS-0001ig-2k
 for <qemu-devel@nongnu.org>; Wed, 12 May 2021 18:15:36 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id E4CCF2E8186
 for <qemu-devel@nongnu.org>; Wed, 12 May 2021 18:15:35 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Wed, 12 May 2021 18:06:23 -0000
From: Thomas Huth <1913926@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Incomplete; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Tags: linux-user
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: th-huth thebrokenrail
X-Launchpad-Bug-Reporter: Connor Nolan (thebrokenrail)
X-Launchpad-Bug-Modifier: Thomas Huth (th-huth)
References: <161206914438.15196.14441299741082258468.malonedeb@wampee.canonical.com>
Message-Id: <162084278344.7369.10243986983005599326.malone@gac.canonical.com>
Subject: [Bug 1913926] Re: [QEMU User-Mode] Mesa Fails To Load RadeonSI Driver
 When In Docker Image
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="6b3403d85f09252210977b936e821c0b00dbe016"; Instance="production"
X-Launchpad-Hash: 2654c5d80fec74cd26178a3a1c3f607713671d22
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
Reply-To: Bug 1913926 <1913926@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

I think you definitely need to provide more information ... how do you
run QEMU? Which QEMU version? etc. ... Anyway:

The QEMU project is currently moving its bug tracking to another system.
For this we need to know which bugs are still valid and which could be
closed already. Thus we are setting the bug state to "Incomplete" now.

If the bug has already been fixed in the latest upstream version of QEMU,
then please close this ticket as "Fix released".

If it is not fixed yet and you think that this bug report here is still
valid, then you have two options:

1) If you already have an account on gitlab.com, please open a new ticket
for this problem in our new tracker here:

    https://gitlab.com/qemu-project/qemu/-/issues

and then close this ticket here on Launchpad (or let it expire auto-
matically after 60 days). Please mention the URL of this bug ticket on
Launchpad in the new ticket on GitLab.

2) If you don't have an account on gitlab.com and don't intend to get
one, but still would like to keep this ticket opened, then please switch
the state back to "New" or "Confirmed" within the next 60 days (other-
wise it will get closed as "Expired"). We will then eventually migrate
the ticket automatically to the new system (but you won't be the reporter
of the bug in the new system and thus you won't get notified on changes
anymore).

Thank you and sorry for the inconvenience.


** Changed in: qemu
       Status: New =3D> Incomplete

** Tags added: linux-user

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1913926

Title:
  [QEMU User-Mode] Mesa Fails To Load RadeonSI Driver When In Docker
  Image

Status in QEMU:
  Incomplete

Bug description:
  # System Details
  AMD Ryzen 7 3700U
  Ubuntu 20.04 Focal Focus

  # Dockerfile

  FROM arm32v7/debian:bullseye

  RUN apt-get update && apt-get install -y mesa-utils

  ENTRYPOINT glxgears

  # Instructions For Reproduction
  1. Install Docker
  2. Build Docker Image: docker build --tag mesa-arm-test .
  3. Run: docker run -v /tmp/.X11-unix:/tmp/.X11-unix --device /dev/dri:/de=
v/dri -e "DISPLAY=3D${DISPLAY}" mesa-arm-test

  The Output Is:

  amdgpu_device_initialize: amdgpu_query_info(ACCEL_WORKING) failed (-38)
  amdgpu: amdgpu_device_initialize failed.
  libGL error: failed to create dri screen
  libGL error: failed to load driver: radeonsi
  libGL error: failed to get magic
  libGL error: failed to load driver: radeonsi

  It then appears to run using software rendering.

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1913926/+subscriptions

