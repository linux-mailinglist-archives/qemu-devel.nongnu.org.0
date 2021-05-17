Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 26332383CE5
	for <lists+qemu-devel@lfdr.de>; Mon, 17 May 2021 21:06:40 +0200 (CEST)
Received: from localhost ([::1]:59122 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1liiZb-0004oy-5p
	for lists+qemu-devel@lfdr.de; Mon, 17 May 2021 15:06:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40674)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1liiAf-0007Jj-68
 for qemu-devel@nongnu.org; Mon, 17 May 2021 14:40:53 -0400
Received: from indium.canonical.com ([91.189.90.7]:46444)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1liiAc-0002GA-Pw
 for qemu-devel@nongnu.org; Mon, 17 May 2021 14:40:52 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.93 #5 (Debian))
 id 1liiAa-00033M-Nv
 for <qemu-devel@nongnu.org>; Mon, 17 May 2021 18:40:48 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id B335F2E8186
 for <qemu-devel@nongnu.org>; Mon, 17 May 2021 18:40:48 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Mon, 17 May 2021 18:31:34 -0000
From: Thomas Huth <1877781@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Invalid; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: crossd rcfa th-huth
X-Launchpad-Bug-Reporter: Dan Cross (crossd)
X-Launchpad-Bug-Modifier: Thomas Huth (th-huth)
References: <158905060046.6343.9507725476835392793.malonedeb@soybean.canonical.com>
Message-Id: <162127629453.8050.5775528132222633160.malone@gac.canonical.com>
Subject: [Bug 1877781] Re: TCG does not support x2APIC emulation
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="5321c3f40fa4d4b847f4e47fb766e7b95ed5036c"; Instance="production"
X-Launchpad-Hash: 59c5cc4d797d032146ca71c7a12fcff3c1b40797
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
Reply-To: Bug 1877781 <1877781@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This ticket has been moved here (thanks, Dan!):
https://gitlab.com/qemu-project/qemu/-/issues/330
... so I'm closing this on Launchpad now.

** Bug watch added: gitlab.com/qemu-project/qemu/-/issues #330
   https://gitlab.com/qemu-project/qemu/-/issues/330

** Changed in: qemu
       Status: Incomplete =3D> Invalid

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1877781

Title:
  TCG does not support x2APIC emulation

Status in QEMU:
  Invalid

Bug description:
  This is not a bug so much as a feature request.

  It would be great if there was a pure-software emulation of the x2APIC
  on x86_64, so that it could be used on systems that don't support such
  providing a thing on via a host-based solution (e.g., KVM etc). KVM
  provides this, but that doesn't help if you're working on a machine
  that doesn't support KVM.

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1877781/+subscriptions

