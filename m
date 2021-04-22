Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D9723678B6
	for <lists+qemu-devel@lfdr.de>; Thu, 22 Apr 2021 06:29:54 +0200 (CEST)
Received: from localhost ([::1]:54036 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lZQyP-0003wt-GJ
	for lists+qemu-devel@lfdr.de; Thu, 22 Apr 2021 00:29:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42290)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lZQuS-0005uC-D7
 for qemu-devel@nongnu.org; Thu, 22 Apr 2021 00:25:51 -0400
Received: from indium.canonical.com ([91.189.90.7]:44114)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lZQuP-0002OK-Lr
 for qemu-devel@nongnu.org; Thu, 22 Apr 2021 00:25:48 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1lZQuO-0006aY-B9
 for <qemu-devel@nongnu.org>; Thu, 22 Apr 2021 04:25:44 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 52D772E8060
 for <qemu-devel@nongnu.org>; Thu, 22 Apr 2021 04:25:44 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Thu, 22 Apr 2021 04:19:14 -0000
From: Thomas Huth <1840249@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Incomplete; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Tags: docker
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: philmd th-huth
X-Launchpad-Bug-Reporter: =?utf-8?q?Philippe_Mathieu-Daud=C3=A9_=28philmd?=
 =?utf-8?q?=29?=
X-Launchpad-Bug-Modifier: Thomas Huth (th-huth)
References: <156587194288.26490.13000707858275373489.malonedeb@gac.canonical.com>
Message-Id: <161906515466.32357.14254967731446961822.malone@soybean.canonical.com>
Subject: [Bug 1840249] Re: Cancelling 'make docker-test-build' does not cancel
 running containers
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="1552fceb1603b3da6cfa437575d9c9fc4b2e683a"; Instance="production"
X-Launchpad-Hash: 89f0e619935512e2296ca2a49315f96399dbd5a1
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
Reply-To: Bug 1840249 <1840249@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The QEMU project is currently considering to move its bug tracking to anoth=
er system. For this we need to know which bugs are still valid and which co=
uld be closed already. Thus we are setting older bugs to "Incomplete" now.
If you still think this bug report here is valid, then please switch the st=
ate back to "New" within the next 60 days, otherwise this report will be ma=
rked as "Expired". Or mark it as "Fix Released" if the problem has been sol=
ved with a newer version of QEMU already. Thank you and sorry for the incon=
venience.

** Changed in: qemu
       Status: New =3D> Incomplete

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1840249

Title:
  Cancelling 'make docker-test-build' does not cancel running containers

Status in QEMU:
  Incomplete

Bug description:
  version: v4.1.0-rc5

  Run 'make -k docker-test-build', wait a few, cancel with ^C:

  $ make -k docker-test-build 2>&1 > /dev/null
  ^C

  $ docker ps
  CONTAINER ID        IMAGE                            COMMAND             =
     CREATED             STATUS
  62264a2d777a        qemu:debian-mips-cross           "/var/tmp/qemu/run t=
=E2=80=A6"   10 minutes ago      Up 10 minutes
  80807c47d0df        qemu:debian-armel-cross          "/var/tmp/qemu/run t=
=E2=80=A6"   10 minutes ago      Up 10 minutes
  06027b5dfd4a        qemu:debian-amd64                "/var/tmp/qemu/run t=
=E2=80=A6"   10 minutes ago      Up 10 minutes

  The docker containers are still up building QEMU.

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1840249/+subscriptions

