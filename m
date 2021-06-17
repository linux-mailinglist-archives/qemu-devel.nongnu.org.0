Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 93B4F3AACF8
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Jun 2021 09:06:35 +0200 (CEST)
Received: from localhost ([::1]:47850 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ltm6j-0006kV-Rc
	for lists+qemu-devel@lfdr.de; Thu, 17 Jun 2021 03:06:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55240)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1ltm5K-00064b-Qa
 for qemu-devel@nongnu.org; Thu, 17 Jun 2021 03:05:06 -0400
Received: from indium.canonical.com ([91.189.90.7]:36694)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1ltm5I-0003AD-Op
 for qemu-devel@nongnu.org; Thu, 17 Jun 2021 03:05:06 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.93 #5 (Debian))
 id 1ltm5F-00049G-4E
 for <qemu-devel@nongnu.org>; Thu, 17 Jun 2021 07:05:01 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 1906F2E80AD
 for <qemu-devel@nongnu.org>; Thu, 17 Jun 2021 07:05:01 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Thu, 17 Jun 2021 06:55:27 -0000
From: Thomas Huth <1452742@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Expired; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Tags: patch
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: hramrach th-huth
X-Launchpad-Bug-Reporter: Michal Suchanek (hramrach)
X-Launchpad-Bug-Modifier: Thomas Huth (th-huth)
References: <20150507141247.29425.7775.malonedeb@soybean.canonical.com>
Message-Id: <162391292721.11028.12986477358513036020.malone@soybean.canonical.com>
Subject: [Bug 1452742] Re: the option for vdagent communication needed for qxl
 scren resizing is not documented
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="ed184eb8c3e03c8a0c3f47e69a5c546619a1af7c"; Instance="production"
X-Launchpad-Hash: 1a294fda77e2cf0308950c312ad2b7f083494ad4
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
Reply-To: Bug 1452742 <1452742@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This is an automated cleanup. This bug report has been moved to QEMU's
new bug tracker on gitlab.com and thus gets marked as 'expired' now.
Please continue with the discussion here:

 https://gitlab.com/qemu-project/qemu/-/issues/424


** Changed in: qemu
       Status: Incomplete =3D> Expired

** Bug watch added: gitlab.com/qemu-project/qemu/-/issues #424
   https://gitlab.com/qemu-project/qemu/-/issues/424

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1452742

Title:
  the option for vdagent communication needed for qxl scren resizing is
  not documented

Status in QEMU:
  Expired

Bug description:
  Hello,

  I tried running a guest with vdagent which is supposed to resize the
  guest screen to match client window size.

  However, a special serial port needs to be created for the vdagent to
  communicate with the client.

  This patch adds a short note to the vga qxl option.

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1452742/+subscriptions

