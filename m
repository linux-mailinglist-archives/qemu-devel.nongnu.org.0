Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C8793AAE3F
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Jun 2021 09:58:47 +0200 (CEST)
Received: from localhost ([::1]:52810 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ltmvG-00067r-Fa
	for lists+qemu-devel@lfdr.de; Thu, 17 Jun 2021 03:58:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38028)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1ltmsU-0002ml-3w
 for qemu-devel@nongnu.org; Thu, 17 Jun 2021 03:55:54 -0400
Received: from indium.canonical.com ([91.189.90.7]:45836)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1ltmsQ-0000QM-R9
 for qemu-devel@nongnu.org; Thu, 17 Jun 2021 03:55:53 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.93 #5 (Debian))
 id 1ltmsM-0004DQ-LC
 for <qemu-devel@nongnu.org>; Thu, 17 Jun 2021 07:55:47 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 813172E81B3
 for <qemu-devel@nongnu.org>; Thu, 17 Jun 2021 07:55:45 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Thu, 17 Jun 2021 07:38:28 -0000
From: Thomas Huth <676934@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Expired; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: ajbennee berrange developers-tefnet th-huth
X-Launchpad-Bug-Reporter: Tefnet Developers (developers-tefnet)
X-Launchpad-Bug-Modifier: Thomas Huth (th-huth)
X-Launchpad-Bug-Duplicate: 1903470
References: <20101118110340.18016.73281.malonedeb@palladium.canonical.com>
Message-Id: <162391550829.13571.1865475702478122249.malone@wampee.canonical.com>
Subject: [Bug 676934] Re: Ability to use -net socket with unix sockets
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="ed184eb8c3e03c8a0c3f47e69a5c546619a1af7c"; Instance="production"
X-Launchpad-Hash: 194788a5e76ef9d8ca84db74e0e10b00317064f3
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
Reply-To: Bug 676934 <676934@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

*** This bug is a duplicate of bug 1903470 ***
    https://bugs.launchpad.net/bugs/1903470


This is an automated cleanup. This bug report got closed because it
is a duplicate.


** Changed in: qemu
   Importance: Wishlist =3D> Undecided

** Changed in: qemu
       Status: New =3D> Expired

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/676934

Title:
  Ability to use -net socket with unix sockets

Status in QEMU:
  Expired

Bug description:
  It would be a nice feature (simplifying access control for example) to
  be able to do something like:

  qemu -net socket,listen=3Dunix:/tmp/qemunet
  qemu -net socket,connect=3Dunix:/tmp/qemunet

  For now one has to use TCP connections even for guests running on the
  same host, which involves setting up iptables to restrict access.

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/676934/+subscriptions

