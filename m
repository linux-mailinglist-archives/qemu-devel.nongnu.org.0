Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EB6B1F1575
	for <lists+qemu-devel@lfdr.de>; Mon,  8 Jun 2020 11:32:29 +0200 (CEST)
Received: from localhost ([::1]:33172 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jiE8q-0002XQ-Bz
	for lists+qemu-devel@lfdr.de; Mon, 08 Jun 2020 05:32:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48982)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1jiE7S-0001k3-4j
 for qemu-devel@nongnu.org; Mon, 08 Jun 2020 05:31:02 -0400
Received: from indium.canonical.com ([91.189.90.7]:37058)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1jiE7Q-0000hg-TS
 for qemu-devel@nongnu.org; Mon, 08 Jun 2020 05:31:01 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1jiE7O-000185-AD
 for <qemu-devel@nongnu.org>; Mon, 08 Jun 2020 09:30:58 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 234072E810A
 for <qemu-devel@nongnu.org>; Mon,  8 Jun 2020 09:30:58 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Mon, 08 Jun 2020 09:21:53 -0000
From: Daniel Berrange <1659267@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=New; importance=Wishlist; assignee=None; 
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: berrange tim-tree-of-life uqbar
X-Launchpad-Bug-Reporter: Uqbar (uqbar)
X-Launchpad-Bug-Modifier: Daniel Berrange (berrange)
References: <20170125113730.12494.46970.malonedeb@gac.canonical.com>
Message-Id: <159160811377.31406.15781999925012732811.malone@gac.canonical.com>
Subject: [Bug 1659267] Re: It's not possible to start a VM with a network
 cable unplugged
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="ef9fc486e875d54078fa61cf91e898b895125d89";
 Instance="production-secrets-lazr.conf"
X-Launchpad-Hash: 2e742ae1289def3b49b67b26bd2d7af174e657d1
Received-SPF: none client-ip=91.189.90.7; envelope-from=bounces@canonical.com;
 helo=indium.canonical.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/06/08 02:30:56
X-ACL-Warn: Detected OS   = Linux 3.11 and newer [fuzzy]
X-Spam_score_int: -65
X-Spam_score: -6.6
X-Spam_bar: ------
X-Spam_report: (-6.6 / 5.0 requ) BAYES_00=-1.9,
 HEADER_FROM_DIFFERENT_DOMAINS=0.249, RCVD_IN_DNSWL_HI=-5,
 RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
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
Reply-To: Bug 1659267 <1659267@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Note that you can start QEMU with the "-S" flag which means CPUS are
paused. This gives you ability to run the "set_link" monitor command
above, and then run "cont" to actually start the VM. Less convenient
that a CLI flag, but functionally it is eqivalent.

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1659267

Title:
  It's not possible to start a VM with a network cable unplugged

Status in QEMU:
  New

Bug description:
  There should be a command line (sub)option to unplug a network cable.
  While from the monitor interface I can issue:

  set_link virtio-net-pci.0 off

  There's no way to fire a VM from command line with that cable already unp=
lugged.
  As an example, virtualbox can do it.

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1659267/+subscriptions

