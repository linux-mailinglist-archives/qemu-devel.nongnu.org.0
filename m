Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E8C89301979
	for <lists+qemu-devel@lfdr.de>; Sun, 24 Jan 2021 05:28:31 +0100 (CET)
Received: from localhost ([::1]:38416 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l3X0p-0000Ec-08
	for lists+qemu-devel@lfdr.de; Sat, 23 Jan 2021 23:28:31 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34244)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1l3Wym-00071y-Tc
 for qemu-devel@nongnu.org; Sat, 23 Jan 2021 23:26:24 -0500
Received: from indium.canonical.com ([91.189.90.7]:42964)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1l3Wyj-0005gt-Cj
 for qemu-devel@nongnu.org; Sat, 23 Jan 2021 23:26:24 -0500
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1l3Wyg-0008JK-5b
 for <qemu-devel@nongnu.org>; Sun, 24 Jan 2021 04:26:18 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id E04B82E8158
 for <qemu-devel@nongnu.org>; Sun, 24 Jan 2021 04:26:12 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Sun, 24 Jan 2021 04:17:27 -0000
From: Launchpad Bug Tracker <1774853@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Expired; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: alexaltea janitor masonleeback th-huth tsiros
X-Launchpad-Bug-Reporter: tsiros (tsiros)
X-Launchpad-Bug-Modifier: Launchpad Janitor (janitor)
References: <152802310962.26200.2575137842813128178.malonedeb@wampee.canonical.com>
Message-Id: <161146184767.22004.5765955408310884876.malone@loganberry.canonical.com>
Subject: [Bug 1774853] Re: claims temp file is used by another process
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="2d1d5e352f0d063d660df2300e31f66bed027fa5"; Instance="production"
X-Launchpad-Hash: 0ce9666aa895f9f7773bb93e9860a89932e5f59d
Received-SPF: none client-ip=91.189.90.7; envelope-from=bounces@canonical.com;
 helo=indium.canonical.com
X-Spam_score_int: -65
X-Spam_score: -6.6
X-Spam_bar: ------
X-Spam_report: (-6.6 / 5.0 requ) BAYES_00=-1.9,
 HEADER_FROM_DIFFERENT_DOMAINS=0.249, RCVD_IN_DNSWL_HI=-5,
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
Reply-To: Bug 1774853 <1774853@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

[Expired for QEMU because there has been no activity for 60 days.]

** Changed in: qemu
       Status: Incomplete =3D> Expired

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1774853

Title:
  claims temp file is used by another process

Status in QEMU:
  Expired

Bug description:
  QEMU emulator version 2.12.50 (v2.12.0-12378-g99a34dc4d2-dirty)

  "c:\Program Files\qemu\qemu-system-x86_64.exe" -net none -parallel none -=
bios OVMF.fd -L . -hda fat:rw:image
  vvfat image chs 1024,16,63
  c:\Program Files\qemu\qemu-system-x86_64.exe: -hda fat:rw:image: Could no=
t open 'C:\Users\tsiros\AppData\Local\Temp\qem5B92.tmp': The process cannot=
 access the file because it is being used by another process.

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1774853/+subscriptions

