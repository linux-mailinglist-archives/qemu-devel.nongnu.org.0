Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AAFA336ED1A
	for <lists+qemu-devel@lfdr.de>; Thu, 29 Apr 2021 17:08:15 +0200 (CEST)
Received: from localhost ([::1]:35204 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lc8H0-0002jS-Qx
	for lists+qemu-devel@lfdr.de; Thu, 29 Apr 2021 11:08:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56306)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lc8Et-0000dm-7g
 for qemu-devel@nongnu.org; Thu, 29 Apr 2021 11:06:03 -0400
Received: from indium.canonical.com ([91.189.90.7]:37536)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lc8Eq-0002YX-Sw
 for qemu-devel@nongnu.org; Thu, 29 Apr 2021 11:06:02 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1lc8En-0001GY-9a
 for <qemu-devel@nongnu.org>; Thu, 29 Apr 2021 15:05:57 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id ED95D2E8160
 for <qemu-devel@nongnu.org>; Thu, 29 Apr 2021 15:05:56 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Thu, 29 Apr 2021 14:59:18 -0000
From: Nayana <1880518@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=New; importance=Undecided; assignee=None;
X-Launchpad-Bug-Tags: linux-user
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: laurent-vivier nthorat rajaskakodkar th-huth
X-Launchpad-Bug-Reporter: Rajas Kakodkar (rajaskakodkar)
X-Launchpad-Bug-Modifier: Nayana (nthorat)
References: <159039304634.8018.14704731502559290875.malonedeb@gac.canonical.com>
Message-Id: <161970835828.9618.14787031881262979462.malone@gac.canonical.com>
Subject: [Bug 1880518] Re: issue while installing docker inside s390x container
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="02afa4875ac52c169f5cddf0d1bcdd6e149a3754"; Instance="production"
X-Launchpad-Hash: 6c2a177aa7bed63abc47a6f057651fd010dfc2d0
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
Reply-To: Bug 1880518 <1880518@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Looks like docker in docker for cross architectures is not yet supported in=
 qemu. =

can be closed

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1880518

Title:
  issue while installing docker inside s390x container

Status in QEMU:
  New

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

