Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 67C802F432A
	for <lists+qemu-devel@lfdr.de>; Wed, 13 Jan 2021 05:33:11 +0100 (CET)
Received: from localhost ([::1]:44882 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kzXqH-0002g5-VA
	for lists+qemu-devel@lfdr.de; Tue, 12 Jan 2021 23:33:09 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44842)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1kzXo9-0001QC-2w
 for qemu-devel@nongnu.org; Tue, 12 Jan 2021 23:30:57 -0500
Received: from indium.canonical.com ([91.189.90.7]:33536)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1kzXo7-0001Wl-2Q
 for qemu-devel@nongnu.org; Tue, 12 Jan 2021 23:30:56 -0500
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1kzXo3-0006n8-Ft
 for <qemu-devel@nongnu.org>; Wed, 13 Jan 2021 04:30:51 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 7725F2E8143
 for <qemu-devel@nongnu.org>; Wed, 13 Jan 2021 04:30:51 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Wed, 13 Jan 2021 04:17:19 -0000
From: Launchpad Bug Tracker <1800088@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Expired; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: janitor th-huth yueyihua
X-Launchpad-Bug-Reporter: yueyihua (yueyihua)
X-Launchpad-Bug-Modifier: Launchpad Janitor (janitor)
References: <154053534939.13909.2595594313857584610.malonedeb@chaenomeles.canonical.com>
Message-Id: <161051143988.21184.891068742489839490.malone@loganberry.canonical.com>
Subject: [Bug 1800088] Re: Assertion fail while usb camera redirect
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="511b4a3b6512aa3d421c5f7d74f3527e78bff26e"; Instance="production"
X-Launchpad-Hash: bcd4184c7e63071039495c27a57ef14fae11b0ae
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
Reply-To: Bug 1800088 <1800088@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

[Expired for QEMU because there has been no activity for 60 days.]

** Changed in: qemu
       Status: Incomplete =3D> Expired

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1800088

Title:
  Assertion fail while usb camera redirect

Status in QEMU:
  Expired

Bug description:
  This may happen during usb camera redirect. But if i move the camera
  lens from left to right or up to down, this always happen. My qemu-
  version is 2.10.0 and following is the error information:

  2018-10-26T03:37:54.925231Z qemu-kvm: usbredirparser: error unexpected ex=
tra data ep 00
  qemu-kvm: hw/usb/redirect.c:1313: usbredir_chardev_read: Assertion `dev->=
read_buf =3D=3D ((void *)0)' failed.
  2018-10-26 03:37:57.120+0000: shutting down, reason=3Dcrashed

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1800088/+subscriptions

