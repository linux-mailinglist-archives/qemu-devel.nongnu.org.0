Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 36BD83AFC60
	for <lists+qemu-devel@lfdr.de>; Tue, 22 Jun 2021 07:04:02 +0200 (CEST)
Received: from localhost ([::1]:52130 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lvYZt-0001vs-64
	for lists+qemu-devel@lfdr.de; Tue, 22 Jun 2021 01:04:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58346)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lvY4C-0002su-JS
 for qemu-devel@nongnu.org; Tue, 22 Jun 2021 00:31:16 -0400
Received: from indium.canonical.com ([91.189.90.7]:58502)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lvY47-0000P0-4D
 for qemu-devel@nongnu.org; Tue, 22 Jun 2021 00:31:16 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.93 #5 (Debian))
 id 1lvY45-0003kW-10
 for <qemu-devel@nongnu.org>; Tue, 22 Jun 2021 04:31:09 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 05F182E8088
 for <qemu-devel@nongnu.org>; Tue, 22 Jun 2021 04:31:09 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Tue, 22 Jun 2021 04:17:45 -0000
From: Launchpad Bug Tracker <1612908@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Expired; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Tags: python qom qom-list qom-tree scripts
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: caxl janitor th-huth
X-Launchpad-Bug-Reporter: Carl Allendorph (caxl)
X-Launchpad-Bug-Modifier: Launchpad Janitor (janitor)
References: <20160813061515.22562.11521.malonedeb@soybean.canonical.com>
Message-Id: <162433546554.20423.6077846870634232134.malone@loganberry.canonical.com>
Subject: [Bug 1612908] Re: qom-[list, tree, get,
 set] don't accept tcp endpoint arg
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="3619498b5524a71696f3dd612f4d11bd63449bb1"; Instance="production"
X-Launchpad-Hash: 5a614904a9537507d7c3666af34b2abc5be29bac
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
Reply-To: Bug 1612908 <1612908@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

[Expired for QEMU because there has been no activity for 60 days.]

** Changed in: qemu
       Status: Incomplete =3D> Expired

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1612908

Title:
  qom-[list,tree,get,set] don't accept tcp endpoint arg

Status in QEMU:
  Expired

Bug description:
  Hi,

  I'm using origin/master [6bbbb0ac13...]. When I run any of the
  commands in 'qemu/scripts/qmp/qom-[list,tree,get,set]', the help text
  says that it can connect to a QEMU instance by passing either a path
  to a unix socket or a tcp endpoint in the format "host:port". The unix
  socket variant works but the tcp endpoint variant does not.
  QEMUMonitorProtocol accepts either a string (unix socket) or a tuple
  (host,port). None of the qom-* scripts actually massage the '-s'
  argument into a tuple.

  I have a patch to fix this issue that I can submit to the developer
  list.

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1612908/+subscriptions

