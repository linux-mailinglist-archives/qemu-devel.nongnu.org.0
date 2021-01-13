Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F8FD2F4334
	for <lists+qemu-devel@lfdr.de>; Wed, 13 Jan 2021 05:35:46 +0100 (CET)
Received: from localhost ([::1]:51392 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kzXsn-0005KT-E4
	for lists+qemu-devel@lfdr.de; Tue, 12 Jan 2021 23:35:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44888)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1kzXoA-0001QY-IY
 for qemu-devel@nongnu.org; Tue, 12 Jan 2021 23:30:58 -0500
Received: from indium.canonical.com ([91.189.90.7]:33682)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1kzXo8-0001Y5-1B
 for qemu-devel@nongnu.org; Tue, 12 Jan 2021 23:30:58 -0500
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1kzXo5-0006c3-FQ
 for <qemu-devel@nongnu.org>; Wed, 13 Jan 2021 04:30:53 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 647422E8144
 for <qemu-devel@nongnu.org>; Wed, 13 Jan 2021 04:30:53 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Wed, 13 Jan 2021 04:17:18 -0000
From: Launchpad Bug Tracker <1788701@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Expired; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: janitor kraxel-redhat metzengerstein th-huth
X-Launchpad-Bug-Reporter: Frederick Metzengerstein (metzengerstein)
X-Launchpad-Bug-Modifier: Launchpad Janitor (janitor)
References: <153505708215.4220.1958982030702670661.malonedeb@gac.canonical.com>
Message-Id: <161051143835.21184.7170887172336229681.malone@loganberry.canonical.com>
Subject: [Bug 1788701] Re: "Zoom to fit" doesn't work with -display gtk -vga
 virtio
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="511b4a3b6512aa3d421c5f7d74f3527e78bff26e"; Instance="production"
X-Launchpad-Hash: 325967a43755889479999c145e898092bc090889
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
Reply-To: Bug 1788701 <1788701@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

[Expired for QEMU because there has been no activity for 60 days.]

** Changed in: qemu
       Status: Incomplete =3D> Expired

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1788701

Title:
  "Zoom to fit" doesn't work  with -display gtk -vga virtio

Status in QEMU:
  Expired

Bug description:
  qemu version: 2.12.1, 3.0.0

  When using -display gtk for all -vga options (std,qxl,vmware,cirrus)
  the option "Zoom To Fit" is unchecked by default and thus auto-
  resizing of the window works well; except for -vga virtio: here "Zoom
  To Fit" is checked and auto-resizing doesn't work.

  Proposal: make "Zoom To Fit" unchecked by default for virtio as well
  Extended proposal: make GTK window options configurable via parameters

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1788701/+subscriptions

