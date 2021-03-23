Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2615D345C64
	for <lists+qemu-devel@lfdr.de>; Tue, 23 Mar 2021 12:03:19 +0100 (CET)
Received: from localhost ([::1]:44492 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lOeof-0003rc-Ua
	for lists+qemu-devel@lfdr.de; Tue, 23 Mar 2021 07:03:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48402)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lOemN-0002dI-IL
 for qemu-devel@nongnu.org; Tue, 23 Mar 2021 07:00:55 -0400
Received: from indium.canonical.com ([91.189.90.7]:33630)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lOemJ-0007gc-S1
 for qemu-devel@nongnu.org; Tue, 23 Mar 2021 07:00:55 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1lOemH-0004YE-JU
 for <qemu-devel@nongnu.org>; Tue, 23 Mar 2021 11:00:49 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 650032E8165
 for <qemu-devel@nongnu.org>; Tue, 23 Mar 2021 11:00:49 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Tue, 23 Mar 2021 10:53:02 -0000
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
Message-Id: <161649678225.27419.14580548048272178659.malone@gac.canonical.com>
Subject: [Bug 1880518] Re: issue while installing docker inside s390x container
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="4446feb642ca86be4f6eceb855b408397dad6a50"; Instance="production"
X-Launchpad-Hash: e3011ff846c4d8550cfe6e0cc32c416655dfec3d
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
Reply-To: Bug 1880518 <1880518@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

As we are facing issue with service docker start ( for docker in docker
s390x container under qemu)

time=3D"2021-03-23T07:29:07.645278866Z" level=3Dwarning msg=3D"Running modp=
robe nf_nat failed with message: ``, error: exec: \"modprobe\": executable =
file not found in $PATH"
time=3D"2021-03-23T07:29:07.645535879Z" level=3Dwarning msg=3D"Running modp=
robe xt_conntrack failed with message: ``, error: exec: \"modprobe\": execu=
table file not found in $PATH"
Error starting daemon: Error initializing network controller: error obtaini=
ng controller instance: failed to create NAT chain DOCKER: iptables failed:=
 iptables -t nat -N DOCKER: iptables v1.6.1: can't initialize iptables tabl=
e `nat': iptables who? (do you need to insmod?)
Perhaps iptables or your kernel needs to be upgraded.
 (exit status 3)

Does it mean that qemu doesn't support/have enabled related modules?
modprobe?

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

