Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EEAC17CC25
	for <lists+qemu-devel@lfdr.de>; Wed, 31 Jul 2019 20:41:40 +0200 (CEST)
Received: from localhost ([::1]:43680 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hstXf-0003Jg-RL
	for lists+qemu-devel@lfdr.de; Wed, 31 Jul 2019 14:41:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54955)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <bounces@canonical.com>) id 1hstX6-0002iS-RI
 for qemu-devel@nongnu.org; Wed, 31 Jul 2019 14:41:05 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <bounces@canonical.com>) id 1hstX5-00028G-MW
 for qemu-devel@nongnu.org; Wed, 31 Jul 2019 14:41:04 -0400
Received: from indium.canonical.com ([91.189.90.7]:51934)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <bounces@canonical.com>)
 id 1hstX5-00027v-H8
 for qemu-devel@nongnu.org; Wed, 31 Jul 2019 14:41:03 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1hstX3-0003Mf-SN
 for <qemu-devel@nongnu.org>; Wed, 31 Jul 2019 18:41:01 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id D5B3A2E802D
 for <qemu-devel@nongnu.org>; Wed, 31 Jul 2019 18:41:01 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Wed, 31 Jul 2019 18:28:13 -0000
From: David S <1821006@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Fix Released; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: daveman1010220 le9i0nx pmaydell
X-Launchpad-Bug-Reporter: Alexey Gavrilov (le9i0nx)
X-Launchpad-Bug-Modifier: David S (daveman1010220)
References: <155308985966.18692.6863438395642692981.malonedeb@chaenomeles.canonical.com>
Message-Id: <156459769334.17606.18161437898826009509.malone@chaenomeles.canonical.com>
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com); Revision="19012";
 Instance="launchpad-lazr.conf"
X-Launchpad-Hash: 40f776946facf62db8f4ad3db6ec9e7f6b25d9cf
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 91.189.90.7
Subject: [Qemu-devel] [Bug 1821006] Re: qemu: Unsupported syscall: 382
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
Reply-To: Bug 1821006 <1821006@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hello.

As far as I can tell, this is still an issue with the latest available
ubuntu, 18.04.2, which has: version 2.11.1(Debian 1:2.11+dfsg-
1ubuntu7.15)

Anyone know where I could get a newer version that would be compatible
with Ubuntu?

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1821006

Title:
  qemu: Unsupported syscall: 382

Status in QEMU:
  Fix Released

Bug description:
  I used

  qemu-user-static/stable,stable,now 1:2.8+dfsg-6+deb9u5 amd64
  [installed]

  When I try to build an image of a docker for an arm, an error occurs.

  This affects the operation of applications.

  =

  Dockerfile

  ARG ARCH
  FROM ${ARCH}/debian:buster-slim

  RUN \
      printf "Install dependencies...\n" && \
      apt-get update && \
      apt-get install -y --no-install-recommends ca-certificates curl

  RUN curl https://google.com

  EOF

  The command that I run

  docker build --build-arg ARCH=3Darm32v7 --file ./Dockerfile -t test .

  =

  root@unit6:/lib/binfmt.d# cat qemu-arm-static.conf =

  :qemu-arm:M::\x7fELF\x01\x01\x01\x00\x00\x00\x00\x00\x00\x00\x00\x00\x02\=
x00\x28\x00:\xff\xff\xff\xff\xff\xff\xff\x00\x00\x00\x00\x00\x00\x00\x00\x0=
0\xfe\xff\xff\xff:/usr/bin/qemu-arm-static:F

  Here is a related discussion.
  https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=3D923479

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1821006/+subscriptions

