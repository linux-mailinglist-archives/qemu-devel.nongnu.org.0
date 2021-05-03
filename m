Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A4465371D22
	for <lists+qemu-devel@lfdr.de>; Mon,  3 May 2021 18:59:51 +0200 (CEST)
Received: from localhost ([::1]:46590 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ldbvC-0005zb-Nr
	for lists+qemu-devel@lfdr.de; Mon, 03 May 2021 12:59:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44280)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1ldbq9-0001OX-FA
 for qemu-devel@nongnu.org; Mon, 03 May 2021 12:54:37 -0400
Received: from indium.canonical.com ([91.189.90.7]:35502)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1ldbq3-0003Xk-0H
 for qemu-devel@nongnu.org; Mon, 03 May 2021 12:54:37 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1ldbpz-0004fA-Ek
 for <qemu-devel@nongnu.org>; Mon, 03 May 2021 16:54:27 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 5D7E92E8136
 for <qemu-devel@nongnu.org>; Mon,  3 May 2021 16:54:27 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Mon, 03 May 2021 16:41:21 -0000
From: Thomas Huth <1367365@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Expired; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Tags: qemu-img vhd vpc
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: petrutlucian94 th-huth the.netadmin
X-Launchpad-Bug-Reporter: Lucian Petrut (petrutlucian94)
X-Launchpad-Bug-Modifier: Thomas Huth (th-huth)
References: <20140909163714.17873.62405.malonedeb@chaenomeles.canonical.com>
Message-Id: <162006008153.10438.3598345217334540803.malone@gac.canonical.com>
Subject: [Bug 1367365] Re: qemu-img fixed vhd issues
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="02afa4875ac52c169f5cddf0d1bcdd6e149a3754"; Instance="production"
X-Launchpad-Hash: 42819badb70e8919cb2e96902d1869fb6de6d37e
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
Reply-To: Bug 1367365 <1367365@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This is an automated cleanup. This bug report has been moved to QEMU's
new bug tracker on gitlab.com and thus gets marked as 'expired' now.
Please continue with the discussion here:

 https://gitlab.com/qemu-project/qemu/-/issues/107


** Changed in: qemu
       Status: Confirmed =3D> Expired

** Bug watch added: gitlab.com/qemu-project/qemu/-/issues #107
   https://gitlab.com/qemu-project/qemu/-/issues/107

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1367365

Title:
  qemu-img fixed vhd issues

Status in QEMU:
  Expired

Bug description:
  qemu-img returns fixed vhd images file format to be raw.

  This happens because only the header is seeked for image signatures
  when getting the image format. In fact, unlike dynamic vhd images,
  differencing vhds don't have the footer copied in the header.

  An easy fix would be to just search the last 512B for the 'conectix'
  signature.

  Also, the fixed vhds created by qemu-img seem to be corrupted from
  Powershell POV.

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1367365/+subscriptions

