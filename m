Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 75767371355
	for <lists+qemu-devel@lfdr.de>; Mon,  3 May 2021 12:06:52 +0200 (CEST)
Received: from localhost ([::1]:38912 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ldVTX-0008Ix-HO
	for lists+qemu-devel@lfdr.de; Mon, 03 May 2021 06:06:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42284)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1ldVRg-0006vL-IG
 for qemu-devel@nongnu.org; Mon, 03 May 2021 06:04:56 -0400
Received: from indium.canonical.com ([91.189.90.7]:37704)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1ldVRd-0002sL-Ug
 for qemu-devel@nongnu.org; Mon, 03 May 2021 06:04:56 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1ldVRb-0005a0-8K
 for <qemu-devel@nongnu.org>; Mon, 03 May 2021 10:04:51 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 3B0D32E805D
 for <qemu-devel@nongnu.org>; Mon,  3 May 2021 10:04:51 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Mon, 03 May 2021 09:51:40 -0000
From: Thomas Huth <925405@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Expired; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug: distribution=ubuntu; sourcepackage=None; component=None;
 status=Invalid; importance=Undecided; assignee=None; 
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: 78luphr0rnk2nuqimstywepozxn9kl19tqh0tx66b5dki1xxsh5mkz9gl21a5rlwfnr8jn6ln0m3jxne2k9x1ohg85w3jabxlrqbgszpjpwcmvkbcvq9spp6z3w5j1m33k06tlsfszeuscyt-0d4ws2xj9-a811i2i3ytqlsztthjth0svbccw8inm65tmkqp9sarr553jq53in4xm1m8wn3o4rlwaer06ogwvqwv9mrqoku2x334n7di44o65qze67n1wneepmidnuwnde1rqcbpgdf70gtqq2x9thj5tl
 de0u rcarmo+launchpad revol th-huth
X-Launchpad-Bug-Reporter: Rui Carmo (rcarmo+launchpad)
X-Launchpad-Bug-Modifier: Thomas Huth (th-huth)
References: <20120202110843.18662.48430.malonedeb@wampee.canonical.com>
Message-Id: <162003550030.11353.11701042680684681029.malone@soybean.canonical.com>
Subject: [Bug 925405] Re: VNC server does not work with Mac Screen Sharing
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="02afa4875ac52c169f5cddf0d1bcdd6e149a3754"; Instance="production"
X-Launchpad-Hash: 6467b6f793888b8e582c901a3636861f076228a1
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
Reply-To: Bug 925405 <925405@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This is an automated cleanup. This bug report has been moved to QEMU's
new bug tracker on gitlab.com and thus gets marked as 'expired' now.
Please continue with the discussion here:

 https://gitlab.com/qemu-project/qemu/-/issues/88


** Changed in: qemu
       Status: Confirmed =3D> Expired

** Bug watch added: gitlab.com/qemu-project/qemu/-/issues #88
   https://gitlab.com/qemu-project/qemu/-/issues/88

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/925405

Title:
  VNC server does not work with Mac Screen Sharing

Status in QEMU:
  Expired
Status in Ubuntu:
  Invalid

Bug description:
  When connecting to a QEMU instance from a Mac using any VNC settings
  on the QEMU CLI and any target arch (ARM, Intel, etc.), the connection
  is attempted but the negotiation never finishes.

  I've verified this when building QEMU from source (1.0 and HEAD) on
  Ubuntu, Fedora and Debian or when using Ubuntu (Oneiric) and Debian
  (Lenny) packages.

  It does not matter whether I specify authentication (or anything else)
  on QEMU's side, the behavior is always the same - I see the connection
  being established using netstat and tcpdump, but QEMU does not seem to
  send back any pixmap data after the connection setup.

  Best guess as to why this happens is that the VNC negotiation on QEMU
  does not like the protocol version and VNC encoding sent by the Mac's
  built-in VNC client, or that its negotiation logic is subtly broken. I
  appreciate that it's not meant to be a full VNC server, but it
  prevents me from using it remotely until a stable Mac build is
  feasible.

  Background info:

  Mac OS X includes a VNC client called Screen Sharing that you can
  invoke in two different ways:

  * At a terminal, by typing "open vnc://hostname:tcp_port"
  * From any URI-enabled field (such as the Safari URI field), where you ca=
n just type the URI as vnc://hostname:tcp_port

  Please do not confuse the enhanced VNC protocol Apple Remote Desktop
  uses with Screen Sharing - they are not mutually exclusive, but they
  are not incompatible either, since what Apple does is to negotiate
  extra pixmap encoding and authentication options - I use Screen
  Sharing to access many VNC servers such as vnc4server, tightvncserver,
  vino, etc. without any issues whatsoever, so the issue I'm reporting
  is not an issue with Apple's implementation.

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/925405/+subscriptions

