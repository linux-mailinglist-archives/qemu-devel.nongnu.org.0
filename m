Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BADEA2B8F13
	for <lists+qemu-devel@lfdr.de>; Thu, 19 Nov 2020 10:36:50 +0100 (CET)
Received: from localhost ([::1]:47130 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kfgMz-0005VZ-SM
	for lists+qemu-devel@lfdr.de; Thu, 19 Nov 2020 04:36:49 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36260)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1kfgLp-0004uk-AD
 for qemu-devel@nongnu.org; Thu, 19 Nov 2020 04:35:37 -0500
Received: from indium.canonical.com ([91.189.90.7]:60462)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1kfgLm-0003eH-UJ
 for qemu-devel@nongnu.org; Thu, 19 Nov 2020 04:35:37 -0500
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1kfgLl-0000Ub-3q
 for <qemu-devel@nongnu.org>; Thu, 19 Nov 2020 09:35:33 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id E71072E813F
 for <qemu-devel@nongnu.org>; Thu, 19 Nov 2020 09:35:32 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Thu, 19 Nov 2020 09:23:47 -0000
From: Thomas Huth <393569@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Incomplete; importance=Wishlist;
 assignee=None; 
X-Launchpad-Bug-Tags: initramfs initrd
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: agraf anthony-codemonkey naesten th-huth
X-Launchpad-Bug-Reporter: Samuel Bronson (naesten)
X-Launchpad-Bug-Modifier: Thomas Huth (th-huth)
References: <20090629184316.11916.86030.malonedeb@potassium.ubuntu.com>
Message-Id: <160577782766.32716.16431421119292324296.malone@soybean.canonical.com>
Subject: [Bug 393569] Re: qemu cannot load multiple initramfs archives
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="c35ff22711d15549e2303ae18ae521fd91f6bf00"; Instance="production"
X-Launchpad-Hash: a7f602085b2e572c14b369268d4722e93718db32
Received-SPF: none client-ip=91.189.90.7; envelope-from=bounces@canonical.com;
 helo=indium.canonical.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/19 04:35:33
X-ACL-Warn: Detected OS   = Linux 3.11 and newer [fuzzy]
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
Reply-To: Bug 393569 <393569@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Looking through old bug tickets... If I've got that right, there is
multiboot support in QEMU nowadays, and we also have the possibility to
load multiple files with the "loader" device ... is that enough, or is
still something to be done here?

** Changed in: qemu
       Status: Confirmed =3D> Incomplete

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/393569

Title:
  qemu cannot load multiple initramfs archives

Status in QEMU:
  Incomplete

Bug description:
  According to Documentation/early-userspace/buffer-format.txt, an
  initramfs can be populated from multiple cpio archives, which seems
  like it could be a really useful feature when using QEMU to boot Linux
  kernels directly, without installing them on the disk image.

  Unfortunately, QEMU does not support actually loading multiple files
  into the initrd space (which is also where initramfs archives go). It
  would be really nice if it did.

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/393569/+subscriptions

