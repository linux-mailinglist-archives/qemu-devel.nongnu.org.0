Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 33DD62B7B3C
	for <lists+qemu-devel@lfdr.de>; Wed, 18 Nov 2020 11:27:02 +0100 (CET)
Received: from localhost ([::1]:47556 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kfKg1-0001BX-7u
	for lists+qemu-devel@lfdr.de; Wed, 18 Nov 2020 05:27:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51854)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1kfKe2-0007jS-VD
 for qemu-devel@nongnu.org; Wed, 18 Nov 2020 05:24:58 -0500
Received: from indium.canonical.com ([91.189.90.7]:36162)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1kfKe0-0004RF-UL
 for qemu-devel@nongnu.org; Wed, 18 Nov 2020 05:24:58 -0500
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1kfKdy-0000Lp-1V
 for <qemu-devel@nongnu.org>; Wed, 18 Nov 2020 10:24:54 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id E41A12E8141
 for <qemu-devel@nongnu.org>; Wed, 18 Nov 2020 10:24:53 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Wed, 18 Nov 2020 10:12:20 -0000
From: Thomas Huth <1163034@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Confirmed; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug: distribution=ubuntu; sourcepackage=qemu; component=main;
 status=Confirmed; importance=Wishlist; assignee=None; 
X-Launchpad-Bug-Tags: linux-user
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: costamagnagianfranco pmaydell serge-hallyn th-huth
 wgrant
X-Launchpad-Bug-Reporter: Gianfranco Costamagna (costamagnagianfranco)
X-Launchpad-Bug-Modifier: Thomas Huth (th-huth)
References: <20130401223319.8572.52647.malonedeb@gac.canonical.com>
Message-Id: <160569434067.27184.12160937236106567389.malone@chaenomeles.canonical.com>
Subject: [Bug 1163034] Re: linux-user mode can't handle guest setting a very
 small RLIMIT_AS (hangs running gnutls28, coreutils configure check code)
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="a2ee2035671f86427804714f331b9ff7fecaef7e"; Instance="production"
X-Launchpad-Hash: aa9a52edb51a5455595fe03144b9455560efe205
Received-SPF: none client-ip=91.189.90.7; envelope-from=bounces@canonical.com;
 helo=indium.canonical.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/18 04:01:19
X-ACL-Warn: Detected OS   = Linux 3.11 and newer [fuzzy]
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
Reply-To: Bug 1163034 <1163034@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

It's been a while since the last change to this ticket ... Has this ever
been implemented?

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1163034

Title:
  linux-user mode can't handle guest setting a very small RLIMIT_AS
  (hangs running gnutls28, coreutils configure check code)

Status in QEMU:
  Confirmed
Status in qemu package in Ubuntu:
  Confirmed

Bug description:
  Please look at
  https://code.launchpad.net/~costamagnagianfranco/+archive/costamagnagianf=
ranco-ppa/+packages
  and
  https://code.launchpad.net/~costamagnagianfranco/+archive/costamagnagianf=
ranco-ppa/+build/4457434

  I cannot make gnutls28 build on armhf, I suspect a builder problem

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1163034/+subscriptions

