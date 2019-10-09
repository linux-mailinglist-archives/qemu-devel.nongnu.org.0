Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BB319D1A28
	for <lists+qemu-devel@lfdr.de>; Wed,  9 Oct 2019 22:56:30 +0200 (CEST)
Received: from localhost ([::1]:57802 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iIJ0X-0005iQ-0k
	for lists+qemu-devel@lfdr.de; Wed, 09 Oct 2019 16:56:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46610)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <bounces@canonical.com>) id 1iIH39-0005NB-EI
 for qemu-devel@nongnu.org; Wed, 09 Oct 2019 14:51:04 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <bounces@canonical.com>) id 1iIH38-00088Y-5f
 for qemu-devel@nongnu.org; Wed, 09 Oct 2019 14:51:03 -0400
Received: from indium.canonical.com ([91.189.90.7]:59570)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <bounces@canonical.com>)
 id 1iIH37-00086u-WC
 for qemu-devel@nongnu.org; Wed, 09 Oct 2019 14:51:02 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1iIH36-0001qK-Lr
 for <qemu-devel@nongnu.org>; Wed, 09 Oct 2019 18:51:00 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 96C822E80CD
 for <qemu-devel@nongnu.org>; Wed,  9 Oct 2019 18:51:00 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Wed, 09 Oct 2019 18:41:57 -0000
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
Message-Id: <157064651803.15332.11815728848648441289.malone@soybean.canonical.com>
Subject: [Bug 1838763] Re: Bugs in SSH module (ssh.c)
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="af2eefe214bd95389a09b7c956720881bab16807";
 Instance="production-secrets-lazr.conf"
X-Launchpad-Hash: 11c8849ecba5e79aaab9cc6319fe95198cd35d47
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
Reply-To: Bug 1838763 <1838763@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

As suggested by Richard in [*], filled a libssh report:

https://bugs.launchpad.net/ubuntu/+source/libssh/+bug/1847514

[*] https://lists.gnu.org/archive/html/qemu-devel/2019-08/msg02506.html

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

