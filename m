Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7ADFB24DEF4
	for <lists+qemu-devel@lfdr.de>; Fri, 21 Aug 2020 19:55:24 +0200 (CEST)
Received: from localhost ([::1]:40948 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1k9BG7-0003rc-Fv
	for lists+qemu-devel@lfdr.de; Fri, 21 Aug 2020 13:55:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60360)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1k9B20-0005Xf-Hb
 for qemu-devel@nongnu.org; Fri, 21 Aug 2020 13:40:48 -0400
Received: from indium.canonical.com ([91.189.90.7]:46532)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1k9B1y-0002p1-FW
 for qemu-devel@nongnu.org; Fri, 21 Aug 2020 13:40:48 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1k9B1w-0001FC-Ph
 for <qemu-devel@nongnu.org>; Fri, 21 Aug 2020 17:40:44 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id A731D2E80E8
 for <qemu-devel@nongnu.org>; Fri, 21 Aug 2020 17:40:44 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Fri, 21 Aug 2020 17:35:13 -0000
From: Xavier Claessens <1892533@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=New; importance=Undecided; assignee=None;
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: zdra
X-Launchpad-Bug-Reporter: Xavier Claessens (zdra)
X-Launchpad-Bug-Modifier: Xavier Claessens (zdra)
References: <159803097267.15754.2795655095121321664.malonedeb@soybean.canonical.com>
Message-Id: <159803131361.16102.761847810402575379.malone@soybean.canonical.com>
Subject: [Bug 1892533] Re: Meson: Missing config-host.mak
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="99c2d833c8d727fd05148486920aca032e908071"; Instance="production"
X-Launchpad-Hash: 175eb345d743cda5483b0250689f6d4df1f8b01d
Received-SPF: none client-ip=91.189.90.7; envelope-from=bounces@canonical.com;
 helo=indium.canonical.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/08/21 13:35:28
X-ACL-Warn: Detected OS   = Linux 3.11 and newer [fuzzy]
X-Spam_score_int: -58
X-Spam_score: -5.9
X-Spam_bar: -----
X-Spam_report: (-5.9 / 5.0 requ) BAYES_00=-1.9, HEADER_FROM_DIFFERENT_DOMAINS=1,
 RCVD_IN_DNSWL_HI=-5, RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Reply-To: Bug 1892533 <1892533@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

configure does not seems to work better:

build$ ../configure =

../configure: 232: shift: can't shift that many

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1892533

Title:
  Meson: Missing config-host.mak

Status in QEMU:
  New

Bug description:
  Wanted to give a try to the new build system, but a simple "meson
  build" gives that error:

  meson.build:15:0: ERROR: Failed to load
  /home/xclaesse/programmation/qemu/build/config-host.mak: [Errno 2] No
  such file or directory: '/home/xclaesse/programmation/qemu/build
  /config-host.mak'

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1892533/+subscriptions

