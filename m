Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FAA284C6E
	for <lists+qemu-devel@lfdr.de>; Wed,  7 Aug 2019 15:08:29 +0200 (CEST)
Received: from localhost ([::1]:41072 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hvLg4-0001dD-Nh
	for lists+qemu-devel@lfdr.de; Wed, 07 Aug 2019 09:08:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54284)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <bounces@canonical.com>) id 1hvI7k-000582-O6
 for qemu-devel@nongnu.org; Wed, 07 Aug 2019 05:20:49 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <bounces@canonical.com>) id 1hvI7i-0000j3-ET
 for qemu-devel@nongnu.org; Wed, 07 Aug 2019 05:20:47 -0400
Received: from indium.canonical.com ([91.189.90.7]:36270)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <bounces@canonical.com>)
 id 1hvI7g-0000fC-Rk
 for qemu-devel@nongnu.org; Wed, 07 Aug 2019 05:20:45 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1hvI7b-0000P9-U0
 for <qemu-devel@nongnu.org>; Wed, 07 Aug 2019 09:20:39 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id D50442E80C8
 for <qemu-devel@nongnu.org>; Wed,  7 Aug 2019 09:20:39 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Wed, 07 Aug 2019 09:09:29 -0000
From: Koganinja89 <baw.mls@gmail.com>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=New; importance=Undecided; assignee=None;
X-Launchpad-Bug-Tags: windows
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: baw-mls
X-Launchpad-Bug-Reporter: Koganinja89 (baw-mls)
X-Launchpad-Bug-Modifier: Koganinja89 (baw-mls)
Message-Id: <156516896995.16228.929773034443965895.malonedeb@soybean.canonical.com>
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com); Revision="19015";
 Instance="launchpad-lazr.conf"
X-Launchpad-Hash: 78f22ddf1b7516bc00fbf74891d45b98d0fee995
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 91.189.90.7
X-Mailman-Approved-At: Wed, 07 Aug 2019 09:05:12 -0400
Subject: [Qemu-devel] [Bug 1839294] [NEW] Latest Installer
 (qemu-w64-setup-20190807.exe) for windows immediately deletes installed
 files at the very end of the installation
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
Reply-To: Bug 1839294 <1839294@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Public bug reported:

This happens on Windows 10 with the latest installer for 64 bit Windows:
qemu-w64-setup-20190807.exe

On install it will create the files and go through all the typical
functions of installing the software, at the very end step it will then
delete all files the installer created.

I looked for logs to see when was going on so I ran the installation in
Sandboxie and was able to retain all the installed files but I couldn't
find a log for the installer.

Here is a screenshot of it deleting all the files at the end of the
process.

https://imgur.com/BWiTA38

If goes too fast for me to see what is written in the text console
otherwise I would post more information but this is all I have. It does
not give any error or any other information at completion.

This error does not occur in the earlier release:
qemu-w64-setup-20190731.exe

** Affects: qemu
     Importance: Undecided
         Status: New


** Tags: windows

** Attachment added: "Screenshot of it deleting the files at the end of the=
 installation"
   https://bugs.launchpad.net/bugs/1839294/+attachment/5281367/+files/2019-=
08-07.png

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1839294

Title:
  Latest Installer (qemu-w64-setup-20190807.exe) for windows immediately
  deletes installed files at the very end of the installation

Status in QEMU:
  New

Bug description:
  This happens on Windows 10 with the latest installer for 64 bit
  Windows: qemu-w64-setup-20190807.exe

  On install it will create the files and go through all the typical
  functions of installing the software, at the very end step it will
  then delete all files the installer created.

  I looked for logs to see when was going on so I ran the installation
  in Sandboxie and was able to retain all the installed files but I
  couldn't find a log for the installer.

  Here is a screenshot of it deleting all the files at the end of the
  process.

  https://imgur.com/BWiTA38

  If goes too fast for me to see what is written in the text console
  otherwise I would post more information but this is all I have. It
  does not give any error or any other information at completion.

  This error does not occur in the earlier release:
  qemu-w64-setup-20190731.exe

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1839294/+subscriptions

