Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F320A36795F
	for <lists+qemu-devel@lfdr.de>; Thu, 22 Apr 2021 07:41:07 +0200 (CEST)
Received: from localhost ([::1]:51588 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lZS5L-0001Jz-3U
	for lists+qemu-devel@lfdr.de; Thu, 22 Apr 2021 01:41:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33208)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lZRzF-0006aY-2M
 for qemu-devel@nongnu.org; Thu, 22 Apr 2021 01:34:49 -0400
Received: from indium.canonical.com ([91.189.90.7]:51158)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lZRzC-0004lA-NQ
 for qemu-devel@nongnu.org; Thu, 22 Apr 2021 01:34:48 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1lZRzB-0003KS-Jl
 for <qemu-devel@nongnu.org>; Thu, 22 Apr 2021 05:34:45 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 887912E815F
 for <qemu-devel@nongnu.org>; Thu, 22 Apr 2021 05:34:45 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Thu, 22 Apr 2021 05:20:40 -0000
From: Thomas Huth <1612908@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Incomplete; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Tags: python qom qom-list qom-tree scripts
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: caxl th-huth
X-Launchpad-Bug-Reporter: Carl Allendorph (caxl)
X-Launchpad-Bug-Modifier: Thomas Huth (th-huth)
References: <20160813061515.22562.11521.malonedeb@soybean.canonical.com>
Message-Id: <161906884063.9125.10607581766642497916.malone@wampee.canonical.com>
Subject: [Bug 1612908] Re: qom-[list, tree, get,
 set] don't accept tcp endpoint arg
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="1552fceb1603b3da6cfa437575d9c9fc4b2e683a"; Instance="production"
X-Launchpad-Hash: 3bc40aee0f785368f81ad53e426efd0f236f8027
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
Reply-To: Bug 1612908 <1612908@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi! Triaging old bug tickets ... is this still an issue with the latest
version of QEMU? If you've got a patch for this ready, please send it to
the qemu-devel mailing list!

** Changed in: qemu
       Status: New =3D> Incomplete

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1612908

Title:
  qom-[list,tree,get,set] don't accept tcp endpoint arg

Status in QEMU:
  Incomplete

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

