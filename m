Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 79807363B52
	for <lists+qemu-devel@lfdr.de>; Mon, 19 Apr 2021 08:13:45 +0200 (CEST)
Received: from localhost ([::1]:42184 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lYNAG-00011e-IV
	for lists+qemu-devel@lfdr.de; Mon, 19 Apr 2021 02:13:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42660)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lYN7v-00009R-98
 for qemu-devel@nongnu.org; Mon, 19 Apr 2021 02:11:19 -0400
Received: from indium.canonical.com ([91.189.90.7]:42264)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lYN7s-0001YM-N5
 for qemu-devel@nongnu.org; Mon, 19 Apr 2021 02:11:19 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1lYN7r-0005V7-2y
 for <qemu-devel@nongnu.org>; Mon, 19 Apr 2021 06:11:15 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 143352E8162
 for <qemu-devel@nongnu.org>; Mon, 19 Apr 2021 06:11:15 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Mon, 19 Apr 2021 06:01:46 -0000
From: Thomas Huth <1824616@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Incomplete; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: jo-durchholz th-huth
X-Launchpad-Bug-Reporter: Joachim Durchholz (jo-durchholz)
X-Launchpad-Bug-Modifier: Thomas Huth (th-huth)
References: <155514426371.20376.231958396525560199.malonedeb@soybean.canonical.com>
Message-Id: <161881210701.6477.9652573628190916785.malone@soybean.canonical.com>
Subject: [Bug 1824616] Re: Build succeeds despite flex/bison missing
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="26785e5a6adccabf68a42300ea7053912615013e"; Instance="production"
X-Launchpad-Hash: 960e19707ce433c65036c369c405c571871dc862
Received-SPF: none client-ip=91.189.90.7; envelope-from=bounces@canonical.com;
 helo=indium.canonical.com
X-Spam_score_int: -66
X-Spam_score: -6.7
X-Spam_bar: ------
X-Spam_report: (-6.7 / 5.0 requ) BAYES_00=-1.9,
 HEADER_FROM_DIFFERENT_DOMAINS=0.249, RCVD_IN_DNSWL_HI=-5,
 RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01, SPF_HELO_NONE=0.001,
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
Reply-To: Bug 1824616 <1824616@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

I think we fixed this at one point in time during the past two years ...
can we close this issue now, or could you still reproduce this with the
latest version of QEMU?

** Changed in: qemu
       Status: New =3D> Incomplete

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1824616

Title:
  Build succeeds despite flex/bison missing

Status in QEMU:
  Incomplete

Bug description:
  I just built qemu using a fresh install, and "make" would report
  success despite messages of "flex: command not found" and "bison:
  command not found".

  I didn't notice any errors, but I don't know whether that's because
  there's a workaround in case the tools aren't there, or because I
  didn't exercize the code paths that would fail.

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1824616/+subscriptions

