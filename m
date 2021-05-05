Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D3B237357C
	for <lists+qemu-devel@lfdr.de>; Wed,  5 May 2021 09:19:17 +0200 (CEST)
Received: from localhost ([::1]:57840 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1leBoS-00038Y-9d
	for lists+qemu-devel@lfdr.de; Wed, 05 May 2021 03:19:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46672)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1leBbt-00064d-Bb
 for qemu-devel@nongnu.org; Wed, 05 May 2021 03:06:17 -0400
Received: from indium.canonical.com ([91.189.90.7]:53266)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1leBbr-0000gT-KX
 for qemu-devel@nongnu.org; Wed, 05 May 2021 03:06:17 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1leBbq-0004Bh-Em
 for <qemu-devel@nongnu.org>; Wed, 05 May 2021 07:06:14 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 6758B2E80F9
 for <qemu-devel@nongnu.org>; Wed,  5 May 2021 07:06:14 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Wed, 05 May 2021 06:55:37 -0000
From: Thomas Huth <1652459@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Expired; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: socketpair th-huth
X-Launchpad-Bug-Reporter: =?utf-8?b?0JrQvtGA0LXQvdCx0LXRgNCzINCc0LDRgNC6?=
 =?utf-8?q?_=28socketpair=29?=
X-Launchpad-Bug-Modifier: Thomas Huth (th-huth)
References: <20161224192528.14563.19329.malonedeb@wampee.canonical.com>
Message-Id: <162019773753.3870.6497877645207524662.malone@gac.canonical.com>
Subject: [Bug 1652459] Re: kvm rbd driver (and maybe others, i.e. qcow2,
 qed and so on)  does not report DISCARD-ZERO flag
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="d6ba96cccb3d3e356754af3137c6128a6c17e2a8"; Instance="production"
X-Launchpad-Hash: 60fd33d6ebc05932b1b4dbc8c6b5104829df684e
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
Reply-To: Bug 1652459 <1652459@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This is an automated cleanup. This bug report has been moved to QEMU's
new bug tracker on gitlab.com and thus gets marked as 'expired' now.
Please continue with the discussion here:

 https://gitlab.com/qemu-project/qemu/-/issues/139


** Changed in: qemu
       Status: New =3D> Expired

** Bug watch added: gitlab.com/qemu-project/qemu/-/issues #139
   https://gitlab.com/qemu-project/qemu/-/issues/139

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1652459

Title:
  kvm rbd driver (and maybe others, i.e. qcow2, qed and so on)  does not
  report DISCARD-ZERO flag

Status in QEMU:
  Expired

Bug description:
  # lsblk -D
  NAME   DISC-ALN DISC-GRAN DISC-MAX DISC-ZERO
  sda           0        4K       1G         0
  =E2=94=9C=E2=94=80sda1        0        4K       1G         0
  =E2=94=9C=E2=94=80sda2     1024        4K       1G         0
  =E2=94=94=E2=94=80sda5        0        4K       1G         0

  Last column should be `1` at least for "RBD+discard=3Dunmap" since
  reading from discarded regions in RBD MUST return zeroes. The same
  with QCOW2, QED and sparse raw images. KVM should copy value of this
  flag when real raw device (i.e. real SSD) with discard capability is
  used as virtual disk.

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1652459/+subscriptions

