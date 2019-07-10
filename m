Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 33B7861961
	for <lists+qemu-devel@lfdr.de>; Mon,  8 Jul 2019 05:03:25 +0200 (CEST)
Received: from localhost ([::1]:38314 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hkJw4-0003ly-DR
	for lists+qemu-devel@lfdr.de; Sun, 07 Jul 2019 23:03:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48621)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <bounces@canonical.com>) id 1hkJtb-0003Bd-LQ
 for qemu-devel@nongnu.org; Sun, 07 Jul 2019 23:00:54 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <bounces@canonical.com>) id 1hkJtZ-00083o-Jt
 for qemu-devel@nongnu.org; Sun, 07 Jul 2019 23:00:51 -0400
Received: from indium.canonical.com ([91.189.90.7]:33852)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <bounces@canonical.com>)
 id 1hkJtY-000824-3G
 for qemu-devel@nongnu.org; Sun, 07 Jul 2019 23:00:49 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1hkJtV-0003n6-9J
 for <qemu-devel@nongnu.org>; Mon, 08 Jul 2019 03:00:45 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 048F62E80D3
 for <qemu-devel@nongnu.org>; Mon,  8 Jul 2019 03:00:45 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Mon, 08 Jul 2019 02:51:58 -0000
From: mcandre <andrew.pennebaker@gmail.com>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=New; importance=Undecided; assignee=None;
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: andrew-pennebaker
X-Launchpad-Bug-Reporter: mcandre (andrew-pennebaker)
X-Launchpad-Bug-Modifier: mcandre (andrew-pennebaker)
Message-Id: <156255431905.20694.13331706865581257211.malonedeb@gac.canonical.com>
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com); Revision="19007";
 Instance="launchpad-lazr.conf"
X-Launchpad-Hash: 4467f7f0e12db8ea73d5867e663c63d372a515df
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 91.189.90.7
Subject: [Qemu-devel] [Bug 1835693] [NEW] s390x binaries segfault
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

Public bug reported:

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

** Affects: qemu
     Importance: Undecided
         Status: New

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1835693

Title:
  s390x binaries segfault

Status in QEMU:
  New

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

