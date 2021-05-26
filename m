Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 00B3E391C9F
	for <lists+qemu-devel@lfdr.de>; Wed, 26 May 2021 18:03:26 +0200 (CEST)
Received: from localhost ([::1]:59762 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1llw0C-0001JM-Ig
	for lists+qemu-devel@lfdr.de; Wed, 26 May 2021 12:03:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60044)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1llvwb-0007Bw-98
 for qemu-devel@nongnu.org; Wed, 26 May 2021 11:59:41 -0400
Received: from indium.canonical.com ([91.189.90.7]:58392)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1llvwZ-00075I-8E
 for qemu-devel@nongnu.org; Wed, 26 May 2021 11:59:41 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.93 #5 (Debian))
 id 1llvwX-0003Nr-09
 for <qemu-devel@nongnu.org>; Wed, 26 May 2021 15:59:37 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id F2A8F2E818D
 for <qemu-devel@nongnu.org>; Wed, 26 May 2021 15:59:36 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Wed, 26 May 2021 15:49:14 -0000
From: Thomas Huth <761469@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Won't Fix; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug: distribution=fedora; sourcepackage=None; component=None;
 status=Won't Fix; importance=High; assignee=None; 
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: bug-redhat-bugs cole-redhat-bugs
 daniel-redhat-bugs david-redhat-bugs fedora-redhat-bugs jan-redhat-bugs
 need-redhat-bugs neil-aldur neil-redhat-bugs th-huth
X-Launchpad-Bug-Reporter: Neil Wilson (neil-aldur)
X-Launchpad-Bug-Modifier: Thomas Huth (th-huth)
References: <20110415072945.23093.78774.malonedeb@wampee.canonical.com>
Message-Id: <162204415470.21753.17601510070167330066.malone@chaenomeles.canonical.com>
Subject: [Bug 761469] Re: multicast VPN breaks IPv6 Duplicate Address Detection
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="802ed26817d1cdd050553dbe99cc8a3cad1a3bc7"; Instance="production"
X-Launchpad-Hash: ad4fbea7c7ab4a990d8eee40af0af02b3fabca63
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
Reply-To: Bug 761469 <761469@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Since there hasn't been a reply within the last months, I'm closing this
now.

** Changed in: qemu
       Status: Incomplete =3D> Won't Fix

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/761469

Title:
  multicast VPN breaks IPv6 Duplicate Address Detection

Status in QEMU:
  Won't Fix
Status in Fedora:
  Won't Fix

Bug description:
  The multicast VPN facility in Qemu uses Multicast Loopback to make
  sure that other Qemu processes on the Host server receive the
  transmission. The side effect of this is that the process sending the
  packet also gets the packet back on its receive channel and currently
  this is not filtered but passed directly to the Virtual Machine.

  You can see this effect by running tcpdump in the virtual machine.
  Every packet sent appears to be duplicated.

  For IPv4 it doesn't appear to cause much of a problem, however with
  IPv6 the duplicate neighbor solicitation packet is precisely what the
  system uses to detect duplicate addresses. So IPv6 addresses fail to
  establish.

  If you run 'ip addr' on a virtual Linux machine with IPv6 enabled you
  will see 'dadfailed' next to the link local address. 'ping6' will then
  not work.

  Checked against 0.12.1.

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/761469/+subscriptions

