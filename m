Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A785E371783
	for <lists+qemu-devel@lfdr.de>; Mon,  3 May 2021 17:06:42 +0200 (CEST)
Received: from localhost ([::1]:43046 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lda9h-0008Bb-NV
	for lists+qemu-devel@lfdr.de; Mon, 03 May 2021 11:06:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41764)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lda80-00075p-Tc
 for qemu-devel@nongnu.org; Mon, 03 May 2021 11:04:56 -0400
Received: from indium.canonical.com ([91.189.90.7]:39472)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lda7y-0001iB-KJ
 for qemu-devel@nongnu.org; Mon, 03 May 2021 11:04:56 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1lda7v-0007Mr-Qf
 for <qemu-devel@nongnu.org>; Mon, 03 May 2021 15:04:51 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id BD0D62E815A
 for <qemu-devel@nongnu.org>; Mon,  3 May 2021 15:04:51 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Mon, 03 May 2021 14:51:15 -0000
From: Thomas Huth <1269628@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Expired; importance=Wishlist;
 assignee=None; 
X-Launchpad-Bug-Tags: feature-request
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: aarcane-s janitor th-huth
X-Launchpad-Bug-Reporter: Christ Schlacta (aarcane-s)
X-Launchpad-Bug-Modifier: Thomas Huth (th-huth)
References: <20140115225230.25222.33088.malonedeb@wampee.canonical.com>
Message-Id: <162005347577.14164.16911005019537069941.malone@wampee.canonical.com>
Subject: [Bug 1269628] Re: Feature Request: Please add TCG OPAL 2 emulation
 support to the virtio disk emulation
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="02afa4875ac52c169f5cddf0d1bcdd6e149a3754"; Instance="production"
X-Launchpad-Hash: c81f7d2eb0387cbe787fc5c2821ba72cce9e810c
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
Reply-To: Bug 1269628 <1269628@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This is an automated cleanup. This bug report has been moved to QEMU's
new bug tracker on gitlab.com and thus gets marked as 'expired' now.
Please continue with the discussion here:

 https://gitlab.com/qemu-project/qemu/-/issues/99


** Changed in: qemu
       Status: New =3D> Expired

** Bug watch added: gitlab.com/qemu-project/qemu/-/issues #99
   https://gitlab.com/qemu-project/qemu/-/issues/99

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1269628

Title:
  Feature Request:  Please add TCG OPAL 2 emulation support to the
  virtio disk emulation

Status in QEMU:
  Expired

Bug description:
  In order to allow windows guests (and soon, linux guests) which are
  TCG OPAL 2 aware to perform disk encryption in a native fashion with
  hardware acceleration, please add TCG OPAL 2 emulation to the VIRTIO
  driver.

  Encryption should occur at the host level using any cryptographic
  facilities available to the host, for example AES-NI, Cryptography
  Hardware, underlying block device cryptography support where available
  or any other cryptography facility that may be developed and
  implemented in the future.

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1269628/+subscriptions

