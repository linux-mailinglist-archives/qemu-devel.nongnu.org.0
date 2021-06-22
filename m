Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2860F3AFC20
	for <lists+qemu-devel@lfdr.de>; Tue, 22 Jun 2021 06:43:00 +0200 (CEST)
Received: from localhost ([::1]:37830 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lvYFX-00044Q-4S
	for lists+qemu-devel@lfdr.de; Tue, 22 Jun 2021 00:42:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57350)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lvXzf-0007CY-Je
 for qemu-devel@nongnu.org; Tue, 22 Jun 2021 00:26:35 -0400
Received: from indium.canonical.com ([91.189.90.7]:56618)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lvXzd-00054e-4C
 for qemu-devel@nongnu.org; Tue, 22 Jun 2021 00:26:35 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.93 #5 (Debian))
 id 1lvXzP-00014G-41
 for <qemu-devel@nongnu.org>; Tue, 22 Jun 2021 04:26:19 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 1DABC2E8167
 for <qemu-devel@nongnu.org>; Tue, 22 Jun 2021 04:26:16 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Tue, 22 Jun 2021 04:18:29 -0000
From: Launchpad Bug Tracker <1839294@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Expired; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Tags: windows
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: baw-mls janitor phil-opp th-huth
X-Launchpad-Bug-Reporter: Koganinja89 (baw-mls)
X-Launchpad-Bug-Modifier: Launchpad Janitor (janitor)
References: <156516896995.16228.929773034443965895.malonedeb@soybean.canonical.com>
Message-Id: <162433550920.20423.15116506634790250326.malone@loganberry.canonical.com>
Subject: [Bug 1839294] Re: Latest Installer (qemu-w64-setup-20190807.exe) for
 windows immediately deletes installed files at the very end of the
 installation
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="3619498b5524a71696f3dd612f4d11bd63449bb1"; Instance="production"
X-Launchpad-Hash: 2d9d91e7f806b12e348506702f00ddbd5cb3e6be
Received-SPF: none client-ip=91.189.90.7; envelope-from=bounces@canonical.com;
 helo=indium.canonical.com
X-Spam_score_int: -65
X-Spam_score: -6.6
X-Spam_bar: ------
X-Spam_report: (-6.6 / 5.0 requ) BAYES_00=-1.9,
 HEADER_FROM_DIFFERENT_DOMAINS=0.25, RCVD_IN_DNSWL_HI=-5,
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
Reply-To: Bug 1839294 <1839294@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

[Expired for QEMU because there has been no activity for 60 days.]

** Changed in: qemu
       Status: Incomplete =3D> Expired

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1839294

Title:
  Latest Installer (qemu-w64-setup-20190807.exe) for windows immediately
  deletes installed files at the very end of the installation

Status in QEMU:
  Expired

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

