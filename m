Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 239266AC86
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Jul 2019 18:11:08 +0200 (CEST)
Received: from localhost ([::1]:50898 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hnQ2l-0006TN-AQ
	for lists+qemu-devel@lfdr.de; Tue, 16 Jul 2019 12:11:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46554)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <bounces@canonical.com>) id 1hnQ2Y-000655-7a
 for qemu-devel@nongnu.org; Tue, 16 Jul 2019 12:10:55 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <bounces@canonical.com>) id 1hnQ2X-0005r6-5D
 for qemu-devel@nongnu.org; Tue, 16 Jul 2019 12:10:54 -0400
Received: from indium.canonical.com ([91.189.90.7]:41950)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <bounces@canonical.com>)
 id 1hnQ2W-0005qV-W1
 for qemu-devel@nongnu.org; Tue, 16 Jul 2019 12:10:53 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1hnQ2V-0004SL-E2
 for <qemu-devel@nongnu.org>; Tue, 16 Jul 2019 16:10:51 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 5F8D62E80C8
 for <qemu-devel@nongnu.org>; Tue, 16 Jul 2019 16:10:51 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Tue, 16 Jul 2019 15:55:53 -0000
From: =?utf-8?q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Incomplete; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Tags: installer windows
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: ajbennee karrq
X-Launchpad-Bug-Reporter: Francesco Dainese (karrq)
X-Launchpad-Bug-Modifier: =?utf-8?q?Alex_Benn=C3=A9e_=28ajbennee=29?=
References: <156297657458.27697.12325008509748748159.malonedeb@wampee.canonical.com>
Message-Id: <156329255387.27814.1217717693541609454.malone@wampee.canonical.com>
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com); Revision="19007";
 Instance="launchpad-lazr.conf"
X-Launchpad-Hash: a01b4b563d757be577e015ed47d38e308942aaf9
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 91.189.90.7
Subject: [Qemu-devel] [Bug 1836430] Re: Can't install on Windows 10
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
Reply-To: Bug 1836430 <1836430@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

I just ran the installer from: =

 =

  https://qemu.weilnetz.de/w64/qemu-w64-setup-20190713.exe
  =

on a Win10 VM and it successfully installed and I checked for the files in =
Program Files and they were all there. Can you re-test with the latest inst=
aller please?

** Tags added: installer windows

** Changed in: qemu
       Status: New =3D> Incomplete

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1836430

Title:
  Can't install on Windows 10

Status in QEMU:
  Incomplete

Bug description:
  Latest release (20190712) 64-bit doesn't install:

  The setup seems to work fine at first and actually extract all the files =
needed for qemu in the correct location, but after it has done that, it pro=
ceeds to delete every file and leaves no trace of qemu except the installat=
ion folder.
  The setup then finishes and notifies the user that it has been installed =
succesfully.

  I downloaded the previous release and it installs correctly.

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1836430/+subscriptions

