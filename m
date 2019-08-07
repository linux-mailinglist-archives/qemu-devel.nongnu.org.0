Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7749A84A31
	for <lists+qemu-devel@lfdr.de>; Wed,  7 Aug 2019 12:56:10 +0200 (CEST)
Received: from localhost ([::1]:39712 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hvJc1-0006ld-Nu
	for lists+qemu-devel@lfdr.de; Wed, 07 Aug 2019 06:56:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48693)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <bounces@canonical.com>) id 1hvJbZ-0006Jr-36
 for qemu-devel@nongnu.org; Wed, 07 Aug 2019 06:55:41 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <bounces@canonical.com>) id 1hvJbY-00031b-07
 for qemu-devel@nongnu.org; Wed, 07 Aug 2019 06:55:41 -0400
Received: from indium.canonical.com ([91.189.90.7]:57782)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <bounces@canonical.com>)
 id 1hvJbX-00031I-Qs
 for qemu-devel@nongnu.org; Wed, 07 Aug 2019 06:55:39 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1hvJbW-00052E-PF
 for <qemu-devel@nongnu.org>; Wed, 07 Aug 2019 10:55:38 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id BCEAF2E804E
 for <qemu-devel@nongnu.org>; Wed,  7 Aug 2019 10:55:38 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Wed, 07 Aug 2019 10:47:36 -0000
From: =?utf-8?q?Philippe_Mathieu-Daud=C3=A9?= <1838763@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Confirmed; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: ausername philmd
X-Launchpad-Bug-Reporter: =?utf-8?b?5ZGo5paH6Z2SIChhdXNlcm5hbWUp?=
X-Launchpad-Bug-Modifier: =?utf-8?q?Philippe_Mathieu-Daud=C3=A9_=28philmd?=
 =?utf-8?q?=29?=
References: <156474593196.25727.15962542236379825575.malonedeb@soybean.canonical.com>
Message-Id: <156517485698.25618.18312808989987345187.malone@gac.canonical.com>
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com); Revision="19015";
 Instance="launchpad-lazr.conf"
X-Launchpad-Hash: d97aab826de3144e1db6b73f5e531e50b3200259
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 91.189.90.7
Subject: [Qemu-devel] [Bug 1838763] Re: Bugs in SSH module (ssh.c)
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
Reply-To: Bug 1838763 <1838763@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

May be related to https://www.redhat.com/archives/libvir-
list/2018-May/msg00597.html

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1838763

Title:
  Bugs in SSH module (ssh.c)

Status in QEMU:
  Confirmed

Bug description:
  I installed gcc-8&libssh* on my Ubuntu 18.04 arm64.When I was
  compiling any version of qemu like 3.1.0 4.0.0or 4.1.0 with SSH
  support,the GCC went wrong.It said some vars undeclared
  like'SSH_KNOWN_HOSTS_OTHER','SSH_KNOWN_HOST_UNKNOWN',etc.

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1838763/+subscriptions

