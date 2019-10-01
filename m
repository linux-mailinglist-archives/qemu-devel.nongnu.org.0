Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6444CC3AD6
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Oct 2019 18:40:29 +0200 (CEST)
Received: from localhost ([::1]:44684 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iFLCN-00043E-KB
	for lists+qemu-devel@lfdr.de; Tue, 01 Oct 2019 12:40:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52899)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <bounces@canonical.com>) id 1iFKk3-0002JS-HM
 for qemu-devel@nongnu.org; Tue, 01 Oct 2019 12:11:12 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <bounces@canonical.com>) id 1iFKk2-0000w3-D1
 for qemu-devel@nongnu.org; Tue, 01 Oct 2019 12:11:11 -0400
Received: from indium.canonical.com ([91.189.90.7]:43952)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <bounces@canonical.com>)
 id 1iFKk2-0000vP-7y
 for qemu-devel@nongnu.org; Tue, 01 Oct 2019 12:11:10 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1iFKk1-0002TR-0J
 for <qemu-devel@nongnu.org>; Tue, 01 Oct 2019 16:11:09 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id E11472E80CB
 for <qemu-devel@nongnu.org>; Tue,  1 Oct 2019 16:11:08 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Tue, 01 Oct 2019 15:56:04 -0000
From: Thomas Huth <1010484@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=In Progress; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: jan-kiszka janitor marcandre-lureau th-huth zoup
X-Launchpad-Bug-Reporter: Armin ranjbar (zoup)
X-Launchpad-Bug-Modifier: Thomas Huth (th-huth)
References: <20120608135400.14469.39467.malonedeb@gac.canonical.com>
Message-Id: <156994536494.21544.16617017204419129423.malone@chaenomeles.canonical.com>
Subject: [Bug 1010484] Re: slirp to accept non-local dns server
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com); Revision="19066";
 Instance="production-secrets-lazr.conf"
X-Launchpad-Hash: 45ac22179e0f59fc748f508ddaa265f7a47b26e9
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 91.189.90.7
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
Reply-To: Bug 1010484 <1010484@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

A patch has been sent to the list now:
https://lists.gnu.org/archive/html/qemu-devel/2019-10/msg00180.html

** Changed in: qemu
       Status: Expired =3D> In Progress

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1010484

Title:
  slirp to accept non-local dns server

Status in QEMU:
  In Progress

Bug description:
  current version of slirp doesn't allow feeded dns address to be outside o=
f given network.
  in many scenarios you need to provide dns server that isn't local.

  this simple patch removes checking for if dns server isn't in local
  subnet.

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1010484/+subscriptions

