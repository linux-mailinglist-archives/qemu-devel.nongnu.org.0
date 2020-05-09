Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F0E961CC498
	for <lists+qemu-devel@lfdr.de>; Sat,  9 May 2020 22:45:43 +0200 (CEST)
Received: from localhost ([::1]:34610 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jXWLu-0003G7-Fv
	for lists+qemu-devel@lfdr.de; Sat, 09 May 2020 16:45:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46114)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1jXUs0-0004wK-PA
 for qemu-devel@nongnu.org; Sat, 09 May 2020 15:10:44 -0400
Received: from indium.canonical.com ([91.189.90.7]:41754)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1jXUrz-00018p-UM
 for qemu-devel@nongnu.org; Sat, 09 May 2020 15:10:44 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1jXUrx-00034L-T1
 for <qemu-devel@nongnu.org>; Sat, 09 May 2020 19:10:41 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id D290F2E802D
 for <qemu-devel@nongnu.org>; Sat,  9 May 2020 19:10:41 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Sat, 09 May 2020 18:56:40 -0000
From: Dan Cross <crossd@gmail.com>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=New; importance=Undecided; assignee=None;
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: crossd
X-Launchpad-Bug-Reporter: Dan Cross (crossd)
X-Launchpad-Bug-Modifier: Dan Cross (crossd)
Message-Id: <158905060046.6343.9507725476835392793.malonedeb@soybean.canonical.com>
Subject: [Bug 1877781] [NEW] TCG does not support x2APIC emulation
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="fbdff7602bd10fb883bf7e2ddcc7fd5a16f60398";
 Instance="production-secrets-lazr.conf"
X-Launchpad-Hash: c6d51969ca748411cda7b0386498a54bd8c1eb63
Received-SPF: none client-ip=91.189.90.7; envelope-from=bounces@canonical.com;
 helo=indium.canonical.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/05/09 15:10:42
X-ACL-Warn: Detected OS   = Linux 3.11 and newer
X-Spam_score_int: -55
X-Spam_score: -5.6
X-Spam_bar: -----
X-Spam_report: (-5.6 / 5.0 requ) BAYES_00=-1.9, DKIM_ADSP_CUSTOM_MED=0.001,
 FORGED_GMAIL_RCVD=1, FREEMAIL_FORGED_FROMDOMAIN=0.001, FREEMAIL_FROM=0.001,
 HEADER_FROM_DIFFERENT_DOMAINS=0.249, RCVD_IN_DNSWL_HI=-5,
 RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
X-Spam_action: no action
X-Mailman-Approved-At: Sat, 09 May 2020 16:44:19 -0400
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
Reply-To: Bug 1877781 <1877781@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Public bug reported:

This is not a bug so much as a feature request.

It would be great if there was a pure-software emulation of the x2APIC
on x86_64, so that it could be used on systems that don't support such
providing a thing on via a host-based solution (e.g., KVM etc). KVM
provides this, but that doesn't help if you're working on a machine that
doesn't support KVM.

** Affects: qemu
     Importance: Undecided
         Status: New

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1877781

Title:
  TCG does not support x2APIC emulation

Status in QEMU:
  New

Bug description:
  This is not a bug so much as a feature request.

  It would be great if there was a pure-software emulation of the x2APIC
  on x86_64, so that it could be used on systems that don't support such
  providing a thing on via a host-based solution (e.g., KVM etc). KVM
  provides this, but that doesn't help if you're working on a machine
  that doesn't support KVM.

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1877781/+subscriptions

