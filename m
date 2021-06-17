Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E63E83AAE34
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Jun 2021 09:57:23 +0200 (CEST)
Received: from localhost ([::1]:50230 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ltmtu-0004QG-Uo
	for lists+qemu-devel@lfdr.de; Thu, 17 Jun 2021 03:57:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38030)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1ltmsU-0002n3-Hh
 for qemu-devel@nongnu.org; Thu, 17 Jun 2021 03:55:54 -0400
Received: from indium.canonical.com ([91.189.90.7]:45814)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1ltmsR-0000QB-24
 for qemu-devel@nongnu.org; Thu, 17 Jun 2021 03:55:54 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.93 #5 (Debian))
 id 1ltmsL-0004EJ-Rt
 for <qemu-devel@nongnu.org>; Thu, 17 Jun 2021 07:55:46 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 451DB2E81A3
 for <qemu-devel@nongnu.org>; Thu, 17 Jun 2021 07:55:44 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Thu, 17 Jun 2021 07:41:04 -0000
From: Thomas Huth <1054558@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Expired; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug: distribution=debian; sourcepackage=None; component=None;
 status=Confirmed; importance=Unknown; assignee=None; 
X-Launchpad-Bug-Tags: display resolution vga
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: bozhan-abv javibarroso m13253 th-huth
X-Launchpad-Bug-Reporter: StarBrilliant (m13253)
X-Launchpad-Bug-Modifier: Thomas Huth (th-huth)
X-Launchpad-Bug-Duplicate: 1022023
References: <20120922120346.32541.66809.malonedeb@wampee.canonical.com>
Message-Id: <162391566488.17261.14607309488114899348.malone@gac.canonical.com>
Subject: [Bug 1054558] Re: 1366x768 resolution missing
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="ed184eb8c3e03c8a0c3f47e69a5c546619a1af7c"; Instance="production"
X-Launchpad-Hash: 16bde756a4fa145b66a600d86a7652d27bc439d5
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
Reply-To: Bug 1054558 <1054558@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

*** This bug is a duplicate of bug 1022023 ***
    https://bugs.launchpad.net/bugs/1022023


This is an automated cleanup. This bug report got closed because it
is a duplicate.


** Changed in: qemu
   Importance: Wishlist =3D> Undecided

** Changed in: qemu
       Status: New =3D> Expired

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1054558

Title:
  1366x768 resolution missing

Status in QEMU:
  Expired
Status in Debian:
  Confirmed

Bug description:
  I use ArchLinux with QEMU 1.2.0.
  I found that 1366x768 resolution is missing, even if I use -vga std or -v=
ga vmware.
  I think that it is necessary to patch it into the source.
  Also, why not add a command-line option to specify custom resolutions wit=
hout patching the source? (I know that VirtualBox has a hidden option to ad=
d any resolution.)

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1054558/+subscriptions

