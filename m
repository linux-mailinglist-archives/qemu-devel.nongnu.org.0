Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C0FF3AE27E
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Jun 2021 06:40:32 +0200 (CEST)
Received: from localhost ([::1]:43218 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lvBjb-0003U4-FV
	for lists+qemu-devel@lfdr.de; Mon, 21 Jun 2021 00:40:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60860)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lvBZO-0008Mr-5H
 for qemu-devel@nongnu.org; Mon, 21 Jun 2021 00:29:58 -0400
Received: from indium.canonical.com ([91.189.90.7]:38350)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lvBZM-0001fb-9H
 for qemu-devel@nongnu.org; Mon, 21 Jun 2021 00:29:57 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.93 #5 (Debian))
 id 1lvBZK-0003Yj-8F
 for <qemu-devel@nongnu.org>; Mon, 21 Jun 2021 04:29:54 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 3863B2E80AD
 for <qemu-devel@nongnu.org>; Mon, 21 Jun 2021 04:29:54 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Mon, 21 Jun 2021 04:17:32 -0000
From: Launchpad Bug Tracker <717929@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Expired; importance=Wishlist;
 assignee=None; 
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: janitor jiribb th-huth
X-Launchpad-Bug-Reporter: jiribb (jiribb)
X-Launchpad-Bug-Modifier: Launchpad Janitor (janitor)
References: <20110212234034.2762.77476.malonedeb@wampee.canonical.com>
Message-Id: <162424905240.11837.12752395415846285033.malone@loganberry.canonical.com>
Subject: [Bug 717929] Re: Serial communication between VMs problematic
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="ed184eb8c3e03c8a0c3f47e69a5c546619a1af7c"; Instance="production"
X-Launchpad-Hash: 2889533ed5e21738067cf401891a3bd82c4de0a9
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
Reply-To: Bug 717929 <717929@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

[Expired for QEMU because there has been no activity for 60 days.]

** Changed in: qemu
       Status: Incomplete =3D> Expired

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/717929

Title:
  Serial communication between VMs problematic

Status in QEMU:
  Expired

Bug description:
  Hello,

  I want to setup serial communication between VM hosts but I have found
  it quite difficult...:

  ...because when trying unix sockets:

  - host A has serial device as unix socket (bind)
  - host B has serial device as client of unix socket
  - host A is down thus not unix socket does exist
  - host B can't be started because cannot read the socket:

  error: Failed to start domain opd1s02
  error: internal error Process exited while reading console log output: ch=
ar device redirected to /dev/pts/0
  connect(unix:/tmp/test.sock): Connection refused
  chardev: opening backend "socket" failed

  Can that work like the cable is not plugged in? So host B can start
  and when the socket would exist it would connect to it?

  ...and when using pty and host device combination one cannot predict
  pty device under /dev/pts, it would be nice if would be possible to
  define exact device name.

  Tested on Fedora 14.

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/717929/+subscriptions

