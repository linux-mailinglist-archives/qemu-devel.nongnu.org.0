Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CFC3C3739A7
	for <lists+qemu-devel@lfdr.de>; Wed,  5 May 2021 13:45:58 +0200 (CEST)
Received: from localhost ([::1]:49518 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1leFyX-0003Ni-Un
	for lists+qemu-devel@lfdr.de; Wed, 05 May 2021 07:45:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57512)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1leFuE-0001jK-Mi
 for qemu-devel@nongnu.org; Wed, 05 May 2021 07:41:30 -0400
Received: from indium.canonical.com ([91.189.90.7]:54694)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1leFu5-0002Jc-Da
 for qemu-devel@nongnu.org; Wed, 05 May 2021 07:41:30 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1leFu3-0003TG-Rv
 for <qemu-devel@nongnu.org>; Wed, 05 May 2021 11:41:19 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id CDCF42E818D
 for <qemu-devel@nongnu.org>; Wed,  5 May 2021 11:41:19 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Wed, 05 May 2021 11:27:37 -0000
From: Thomas Huth <1824744@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Expired; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Tags: ppc
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: shawnanastasio th-huth
X-Launchpad-Bug-Reporter: shawn (shawnanastasio)
X-Launchpad-Bug-Modifier: Thomas Huth (th-huth)
References: <155529202334.8409.17401063591999151604.malonedeb@wampee.canonical.com>
Message-Id: <162021405787.5783.15632134332359390114.malone@wampee.canonical.com>
Subject: [Bug 1824744] Re: ivshmem PCI device exposes wrong endianness on
 ppc64le
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="d6ba96cccb3d3e356754af3137c6128a6c17e2a8"; Instance="production"
X-Launchpad-Hash: 1442525d15d1f55a5546055495f99d7e92aa9665
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
Reply-To: Bug 1824744 <1824744@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This is an automated cleanup. This bug report has been moved to QEMU's
new bug tracker on gitlab.com and thus gets marked as 'expired' now.
Please continue with the discussion here:

 https://gitlab.com/qemu-project/qemu/-/issues/168


** Changed in: qemu
       Status: New =3D> Expired

** Bug watch added: gitlab.com/qemu-project/qemu/-/issues #168
   https://gitlab.com/qemu-project/qemu/-/issues/168

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1824744

Title:
  ivshmem PCI device exposes wrong endianness on ppc64le

Status in QEMU:
  Expired

Bug description:
  On a ppc64le host with a ppc64le guest running on QEMU 3.1.0 when an
  ivshmem device is used, the ivshmem device appears to expose the wrong
  endianness for the values in BAR 0.

  For example, when the guest is assigned an ivshmem device ID of 1, the
  IVPosition register (u32, offset 8 in BAR 0) returns 0x1000000 instead
  of 0x1. I tested on an x86_64 machine and the IVPosition reads 0x1 as
  expected.

  It seems possible that there's a ppc64*=3D=3Dbigendian assumption
  somewhere that is erroneously affecting ppc64le.

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1824744/+subscriptions

