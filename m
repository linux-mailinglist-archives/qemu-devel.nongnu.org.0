Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 356BB340456
	for <lists+qemu-devel@lfdr.de>; Thu, 18 Mar 2021 12:14:49 +0100 (CET)
Received: from localhost ([::1]:50342 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lMqc4-0008DD-Ar
	for lists+qemu-devel@lfdr.de; Thu, 18 Mar 2021 07:14:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39840)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lMqbJ-0007TP-4t
 for qemu-devel@nongnu.org; Thu, 18 Mar 2021 07:14:01 -0400
Received: from indium.canonical.com ([91.189.90.7]:43110)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lMqZM-0001eO-2S
 for qemu-devel@nongnu.org; Thu, 18 Mar 2021 07:14:00 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1lMqZJ-0004Dr-98
 for <qemu-devel@nongnu.org>; Thu, 18 Mar 2021 11:11:57 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 203972E8084
 for <qemu-devel@nongnu.org>; Thu, 18 Mar 2021 11:11:57 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Thu, 18 Mar 2021 10:59:28 -0000
From: Nayana <1880518@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Incomplete; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Tags: linux-user
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: laurent-vivier nthorat rajaskakodkar th-huth
X-Launchpad-Bug-Reporter: Rajas Kakodkar (rajaskakodkar)
X-Launchpad-Bug-Modifier: Nayana (nthorat)
References: <159039304634.8018.14704731502559290875.malonedeb@gac.canonical.com>
Message-Id: <161606516890.18172.4816963382658290402.malone@soybean.canonical.com>
Subject: [Bug 1880518] Re: issue while installing docker inside s390x container
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="d4fcb062545ed29d3cd7773e52e43615e042623f"; Instance="production"
X-Launchpad-Hash: 2b946435827ee1d33c0026f218770e7b83ea40d8
Received-SPF: none client-ip=91.189.90.7; envelope-from=bounces@canonical.com;
 helo=indium.canonical.com
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
Reply-To: Bug 1880518 <1880518@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

docker not starting inside s390x container. Log shows:

Error starting daemon: Error initializing network controller: error obtaini=
ng controller instance: failed to create NAT chain DOCKER: iptables failed:=
 iptables -t nat -N DOCKER: iptables v1.6.1: can't initialize iptables tabl=
e `nat': iptables who? (do you need to insmod?)
Perhaps iptables or your kernel needs to be upgraded.
 (exit status 3)

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1880518

Title:
  issue while installing docker inside s390x container

Status in QEMU:
  Incomplete

Bug description:
  This is in reference to https://github.com/multiarch/qemu-user-static/iss=
ues/108.
  I am facing issue while installing docker inside s390x container under qe=
mu on Ubuntu 18.04 host running on amd64.
  Following are the contents of /proc/sys/fs/binfmt_misc/qemu-s390x on Inte=
l host after running =

  docker run --rm --privileged multiarch/qemu-user-static --reset -p yes
  enabled
  interpreter /usr/bin/qemu-s390x-static
  flags: F
  offset 0
  magic 7f454c4602020100000000000000000000020016
  mask ffffffffffffff00fffffffffffffffffffeffff
  I could get docker service up with the following trick. =

  printf '{"iptables": false,"ip-masq": false,"bridge": "none" }' > /etc/do=
cker/daemon.json
  But even though docker service comes up, images are not getting pulled, d=
ocker pull fails with the following error.
  failed to register layer: Error processing tar file(exit status 1):

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1880518/+subscriptions

