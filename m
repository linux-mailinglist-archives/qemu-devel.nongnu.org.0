Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A12A2EEC7A
	for <lists+qemu-devel@lfdr.de>; Fri,  8 Jan 2021 05:28:28 +0100 (CET)
Received: from localhost ([::1]:49930 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kxjNz-00033V-G8
	for lists+qemu-devel@lfdr.de; Thu, 07 Jan 2021 23:28:27 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51356)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1kxjLe-0001HG-7R
 for qemu-devel@nongnu.org; Thu, 07 Jan 2021 23:26:02 -0500
Received: from indium.canonical.com ([91.189.90.7]:55776)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1kxjLY-0003d8-Gt
 for qemu-devel@nongnu.org; Thu, 07 Jan 2021 23:26:02 -0500
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1kxjLU-00045h-UA
 for <qemu-devel@nongnu.org>; Fri, 08 Jan 2021 04:25:53 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 7CC3F2E815B
 for <qemu-devel@nongnu.org>; Fri,  8 Jan 2021 04:25:52 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Fri, 08 Jan 2021 04:17:22 -0000
From: Launchpad Bug Tracker <1662600@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Expired; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: janitor kozkey th-huth
X-Launchpad-Bug-Reporter: Corey Olson (kozkey)
X-Launchpad-Bug-Modifier: Launchpad Janitor (janitor)
References: <20170207172049.29850.43816.malonedeb@gac.canonical.com>
Message-Id: <161007944269.27824.2426672862916288730.malone@loganberry.canonical.com>
Subject: [Bug 1662600] Re: error while building from source on Ubuntu 16.04
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="9b8a7e9b05b0918031670be47aedac0f241cb913"; Instance="production"
X-Launchpad-Hash: c6e7a818ccf97a48ef92d89e57ffa14901380d24
Received-SPF: none client-ip=91.189.90.7; envelope-from=bounces@canonical.com;
 helo=indium.canonical.com
X-Spam_score_int: -65
X-Spam_score: -6.6
X-Spam_bar: ------
X-Spam_report: (-6.6 / 5.0 requ) BAYES_00=-1.9,
 HEADER_FROM_DIFFERENT_DOMAINS=0.248, RCVD_IN_DNSWL_HI=-5,
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
Reply-To: Bug 1662600 <1662600@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

[Expired for QEMU because there has been no activity for 60 days.]

** Changed in: qemu
       Status: Incomplete =3D> Expired

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1662600

Title:
  error while building from source on Ubuntu 16.04

Status in QEMU:
  Expired

Bug description:
  I'm trying to build Qemu from source (from git) as specified here:
  http://www.qemu-project.org/download/#source

  Here is the git commit hash for the source:
  7d2c6c95511e42dffe2b263275e09957723d0ff4

  During the 'make' step, I get the following error:

  migration/rdma.c: In function =E2=80=98qemu_rdma_dump_id=E2=80=99:
  migration/rdma.c:749:21: error: =E2=80=98struct ibv_port_attr=E2=80=99 ha=
s no member named =E2=80=98link_layer=E2=80=99
  migration/rdma.c:750:22: error: =E2=80=98struct ibv_port_attr=E2=80=99 ha=
s no member named =E2=80=98link_layer=E2=80=99
  migration/rdma.c:750:37: error: =E2=80=98IBV_LINK_LAYER_INFINIBAND=E2=80=
=99 undeclared (first use in this function)
  migration/rdma.c:750:37: note: each undeclared identifier is reported onl=
y once for each function it appears in
  migration/rdma.c:751:24: error: =E2=80=98struct ibv_port_attr=E2=80=99 ha=
s no member named =E2=80=98link_layer=E2=80=99
  migration/rdma.c:751:39: error: =E2=80=98IBV_LINK_LAYER_ETHERNET=E2=80=99=
 undeclared (first use in this function)
  migration/rdma.c: In function =E2=80=98qemu_rdma_broken_ipv6_kernel=E2=80=
=99:
  migration/rdma.c:850:26: error: =E2=80=98struct ibv_port_attr=E2=80=99 ha=
s no member named =E2=80=98link_layer=E2=80=99
  migration/rdma.c:850:41: error: =E2=80=98IBV_LINK_LAYER_INFINIBAND=E2=80=
=99 undeclared (first use in this function)
  migration/rdma.c:852:33: error: =E2=80=98struct ibv_port_attr=E2=80=99 ha=
s no member named =E2=80=98link_layer=E2=80=99
  migration/rdma.c:852:48: error: =E2=80=98IBV_LINK_LAYER_ETHERNET=E2=80=99=
 undeclared (first use in this function)
  migration/rdma.c:891:18: error: =E2=80=98struct ibv_port_attr=E2=80=99 ha=
s no member named =E2=80=98link_layer=E2=80=99
  make: *** [migration/rdma.o] Error 1

  I searched around a bit, my problem seems related to this:
  https://patchwork.kernel.org/patch/992952/

  That issue makes me think my libibverbs may be out of date, but I
  checked and I have libibverbs-dev installed.  Is that the correct
  version?

  FYI, I installed libibverbs-dev as suggested here: http://wiki.qemu-
  project.org/index.php/Hosts/Linux#Recommended_additional_packages

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1662600/+subscriptions

