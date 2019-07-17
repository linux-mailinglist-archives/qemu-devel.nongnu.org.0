Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 57F4C6BED8
	for <lists+qemu-devel@lfdr.de>; Wed, 17 Jul 2019 17:11:27 +0200 (CEST)
Received: from localhost ([::1]:58344 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hnlaY-0002V7-7r
	for lists+qemu-devel@lfdr.de; Wed, 17 Jul 2019 11:11:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54632)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <bounces@canonical.com>) id 1hnla9-0001Ph-EC
 for qemu-devel@nongnu.org; Wed, 17 Jul 2019 11:11:02 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <bounces@canonical.com>) id 1hnla8-0001zQ-Az
 for qemu-devel@nongnu.org; Wed, 17 Jul 2019 11:11:01 -0400
Received: from indium.canonical.com ([91.189.90.7]:60650)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <bounces@canonical.com>)
 id 1hnla8-0001ye-4d
 for qemu-devel@nongnu.org; Wed, 17 Jul 2019 11:11:00 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1hnla6-0006jA-Lw
 for <qemu-devel@nongnu.org>; Wed, 17 Jul 2019 15:10:58 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id A52292E80CC
 for <qemu-devel@nongnu.org>; Wed, 17 Jul 2019 15:10:58 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Wed, 17 Jul 2019 15:00:34 -0000
From: =?utf-8?q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Incomplete; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Tags: linux-user s390x tcg
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: ajbennee andrew-pennebaker
X-Launchpad-Bug-Reporter: mcandre (andrew-pennebaker)
X-Launchpad-Bug-Modifier: =?utf-8?q?Alex_Benn=C3=A9e_=28ajbennee=29?=
References: <156255431905.20694.13331706865581257211.malonedeb@gac.canonical.com>
Message-Id: <156337563435.26646.16077539307438159366.malone@wampee.canonical.com>
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com); Revision="19009";
 Instance="launchpad-lazr.conf"
X-Launchpad-Hash: 18536ebeaeb3e1009cc13a92ea98f8f92da4a883
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 91.189.90.7
Subject: [Qemu-devel] [Bug 1835693] Re: s390x binaries segfault
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
Reply-To: Bug 1835693 <1835693@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Does "make check-tcg" work in this case? It works for me here.

** Changed in: qemu
       Status: New =3D> Incomplete

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1835693

Title:
  s390x binaries segfault

Status in QEMU:
  Incomplete

Bug description:
  Hello World appears to segfault with qemu s390x, on a Debian 10.0.0
  Buster amd64 host.

  $ cat hello.cpp =

  #include <iostream>
  using std::cout;

  int main() {
      cout << "Hello World!\n";
      return 0;
  }

  $ s390x-linux-gnu-g++ -o hello hello.cpp

  $ qemu-s390x-static hello
  Segmentation fault

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1835693/+subscriptions

