Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0460C2CA07B
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Dec 2020 11:55:07 +0100 (CET)
Received: from localhost ([::1]:53376 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kk3JK-0004E0-24
	for lists+qemu-devel@lfdr.de; Tue, 01 Dec 2020 05:55:06 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47048)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1kk3FT-0007Sn-9Y
 for qemu-devel@nongnu.org; Tue, 01 Dec 2020 05:51:07 -0500
Received: from indium.canonical.com ([91.189.90.7]:54584)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1kk3FR-0000v8-DK
 for qemu-devel@nongnu.org; Tue, 01 Dec 2020 05:51:07 -0500
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1kk3FN-0000W8-V4
 for <qemu-devel@nongnu.org>; Tue, 01 Dec 2020 10:51:02 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 6B6792E814A
 for <qemu-devel@nongnu.org>; Tue,  1 Dec 2020 10:51:01 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Tue, 01 Dec 2020 10:40:20 -0000
From: Thomas Huth <1747056@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Fix Released; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: berrange th-huth
X-Launchpad-Bug-Reporter: Daniel Berrange (berrange)
X-Launchpad-Bug-Modifier: Thomas Huth (th-huth)
References: <151759534688.10002.1939402860055070584.malonedeb@wampee.canonical.com>
Message-Id: <160681922023.8173.7054486705452215084.malone@soybean.canonical.com>
Subject: [Bug 1747056] Re: FreeDOS / MS-Dos / Windows 3.11 cannot perform
 reboot with 'isapc' machine
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="12d09381f8e8eee3115395875b132e165fa96574"; Instance="production"
X-Launchpad-Hash: 17af8853e6fced2b5baec775fbc3a03c933b53f9
Received-SPF: none client-ip=91.189.90.7; envelope-from=bounces@canonical.com;
 helo=indium.canonical.com
X-Spam_score_int: -65
X-Spam_score: -6.6
X-Spam_bar: ------
X-Spam_report: (-6.6 / 5.0 requ) BAYES_00=-1.9,
 HEADER_FROM_DIFFERENT_DOMAINS=0.248, RCVD_IN_DNSWL_HI=-5,
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
Reply-To: Bug 1747056 <1747056@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The SeaBIOS update mentioned by Daniel has been included here:
https://git.qemu.org/?p=3Dqemu.git;a=3Dcommitdiff;h=3D0b8f74488e50f

So I assume this bug is fixed, thus closing this now. If you still can
reproduce it with the latest version of QEMU, then please complain.

** Changed in: qemu
       Status: New =3D> Fix Released

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1747056

Title:
  FreeDOS / MS-Dos / Windows 3.11 cannot perform reboot with 'isapc'
  machine

Status in QEMU:
  Fix Released

Bug description:
  I was installing MS-Dos 6.22 + Windows 3.11 in preparation for running
  Microsoft Bob, and noticed that when they try to perform a reboot,
  they just get stuck. The console cursor stays flashing on/off, but the
  DOS prompt no longer responds to input.

  It is fairly easy to reproduce, even FreeDOS is impacted - download
  the FreeDOS bootable CDROM image, then

  $ qemu-img create demo.img 100MB

  $ qemu-system-x86_64 -machine isapc -cdrom ~/Downloads/FD12CD.iso
  -hda demo.img  -monitor stdio

  Wait for the installer to startup, and then in the monitor console run

    sendkey ctrl-alt-delete

  It will fail to reboot

  Testing shows this is a regression from QEMU 2.8.0 onwards, and git
  bisect further narrowed it down to a SEABIOS update

  commit 6e99f5741ff1b408ea76e6caf2bd4f76df4060e9 (HEAD, tag: pull-seabios-=
20161027-2, tag: pull-seabios-20161027-1, refs/bisect/bad)
  Author: Gerd Hoffmann <kraxel@redhat.com>
  Date:   Thu Oct 27 16:42:28 2016 +0200

      seabios: update to 1.10.0 release.

  Note that this seems particular to the "isapc" machine type - with the
  "pc" machine type, reboot still works

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1747056/+subscriptions

