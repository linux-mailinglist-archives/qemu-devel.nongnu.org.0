Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BB6136664F
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Apr 2021 09:37:10 +0200 (CEST)
Received: from localhost ([::1]:48148 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lZ7Q4-0000vu-QE
	for lists+qemu-devel@lfdr.de; Wed, 21 Apr 2021 03:37:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45590)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lZ7Oh-0000Ul-U5
 for qemu-devel@nongnu.org; Wed, 21 Apr 2021 03:35:43 -0400
Received: from indium.canonical.com ([91.189.90.7]:55020)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lZ7Of-0000Y2-Fw
 for qemu-devel@nongnu.org; Wed, 21 Apr 2021 03:35:43 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1lZ7Oc-0006tx-JJ
 for <qemu-devel@nongnu.org>; Wed, 21 Apr 2021 07:35:38 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 8D4292E800F
 for <qemu-devel@nongnu.org>; Wed, 21 Apr 2021 07:35:38 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Wed, 21 Apr 2021 07:29:33 -0000
From: Klaus Jensen <1747393@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Fix Released; importance=Undecided;
 assignee=its@irrelevant.dk; 
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: birkelund th-huth toomas-soome
X-Launchpad-Bug-Reporter: Toomas Soome (toomas-soome)
X-Launchpad-Bug-Modifier: Klaus Jensen (birkelund)
References: <151782642980.10198.17726074601611845094.malonedeb@wampee.canonical.com>
Message-Id: <161899017347.6248.18239670601735973994.malone@chaenomeles.canonical.com>
Subject: [Bug 1747393] Re: nvme is missing support for
 NVME_ADM_CMD_ASYNC_EV_REQ
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="1552fceb1603b3da6cfa437575d9c9fc4b2e683a"; Instance="production"
X-Launchpad-Hash: dc5101266b007881520d0b7b0eafda304e07fafb
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
Reply-To: Bug 1747393 <1747393@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This was fixed in 5.2.0.

** Changed in: qemu
       Status: Incomplete =3D> Fix Released

** Changed in: qemu
     Assignee: (unassigned) =3D> Klaus Jensen (birkelund)

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1747393

Title:
  nvme is missing support for NVME_ADM_CMD_ASYNC_EV_REQ

Status in QEMU:
  Fix Released

Bug description:
  NVME_ADM_CMD_ASYNC_EV_REQ is required by specification but apparently
  we will be responded by error when this command is used.

  The Asynchronous Event Request is a mandatory opcode required by
  specification (Figure 40, Section 5 in NVMe 1.2; Figure 41, Section 5
  in NVMe 1.3). A simple way to deal with this in an emulator that
  doesn't really want to use async events is to queue up the requests
  and not do anything with them, and only complete them when the driver
  aborts the command.

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1747393/+subscriptions

