Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1441F368709
	for <lists+qemu-devel@lfdr.de>; Thu, 22 Apr 2021 21:18:02 +0200 (CEST)
Received: from localhost ([::1]:57908 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lZepr-00054j-Q1
	for lists+qemu-devel@lfdr.de; Thu, 22 Apr 2021 15:18:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50388)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lZeln-0002wu-Rn
 for qemu-devel@nongnu.org; Thu, 22 Apr 2021 15:13:50 -0400
Received: from indium.canonical.com ([91.189.90.7]:47516)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lZelk-0007FZ-Gj
 for qemu-devel@nongnu.org; Thu, 22 Apr 2021 15:13:47 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1lZeli-0002oA-Fp
 for <qemu-devel@nongnu.org>; Thu, 22 Apr 2021 19:13:42 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 6F61E2E815A
 for <qemu-devel@nongnu.org>; Thu, 22 Apr 2021 19:13:42 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Thu, 22 Apr 2021 17:33:41 -0000
From: Thomas Huth <1615212@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Incomplete; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: bugreport-mailinator crobinso th-huth
X-Launchpad-Bug-Reporter: Bug Report (bugreport-mailinator)
X-Launchpad-Bug-Modifier: Thomas Huth (th-huth)
References: <20160820103944.12682.88967.malonedeb@gac.canonical.com>
Message-Id: <161911282144.31825.10013743845362805720.launchpad@soybean.canonical.com>
Subject: [Bug 1615212] Re: SDL UI switching to monitor half-broken and
 scrolling broken
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="1552fceb1603b3da6cfa437575d9c9fc4b2e683a"; Instance="production"
X-Launchpad-Hash: 1995ad3d54c43d6ef4125f76a842c8a903bfe006
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
Reply-To: Bug 1615212 <1615212@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

** Bug watch removed: bugzilla.libsdl.org/ #3287
   http://bugzilla.libsdl.org/show_bug.cgi?id=3D3287

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1615212

Title:
  SDL UI switching to monitor half-broken and scrolling broken

Status in QEMU:
  Incomplete

Bug description:
  ctrl+alt+2 must be pressed 2 or more times for the monitor console
  window to appear with -sdl, the window flashes and disappears also
  before finally staying open

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1615212/+subscriptions

