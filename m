Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C4DB3C4313
	for <lists+qemu-devel@lfdr.de>; Mon, 12 Jul 2021 06:33:22 +0200 (CEST)
Received: from localhost ([::1]:48868 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m2ndB-000532-7w
	for lists+qemu-devel@lfdr.de; Mon, 12 Jul 2021 00:33:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35182)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1m2nWj-0008Rl-MF
 for qemu-devel@nongnu.org; Mon, 12 Jul 2021 00:26:41 -0400
Received: from indium.canonical.com ([91.189.90.7]:38940)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1m2nWi-0006Rn-1T
 for qemu-devel@nongnu.org; Mon, 12 Jul 2021 00:26:41 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.93 #5 (Debian))
 id 1m2nWS-0005Ly-1U
 for <qemu-devel@nongnu.org>; Mon, 12 Jul 2021 04:26:24 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 4BA652E8270
 for <qemu-devel@nongnu.org>; Mon, 12 Jul 2021 04:26:16 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Mon, 12 Jul 2021 04:17:19 -0000
From: Launchpad Bug Tracker <1910605@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Expired; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Tags: arm linux-user
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: janitor lthoang th-huth
X-Launchpad-Bug-Reporter: Linh Hoang (lthoang)
X-Launchpad-Bug-Modifier: Launchpad Janitor (janitor)
References: <161005904521.27189.16928489496057445235.malonedeb@soybean.canonical.com>
Message-Id: <162606343931.2726.2287639545115728076.malone@loganberry.canonical.com>
Subject: [Bug 1910605] Re: qemu-arm-static ioctl USBDEVFS_BULK return -1
 (EFAULT) Bad address
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="1b66c075b8638845e61f40eb9036fabeaa01f591"; Instance="production"
X-Launchpad-Hash: c37cf9853be21c38445ac486bac3aef8fdd89de7
Received-SPF: none client-ip=91.189.90.7; envelope-from=bounces@canonical.com;
 helo=indium.canonical.com
X-Spam_score_int: -66
X-Spam_score: -6.7
X-Spam_bar: ------
X-Spam_report: (-6.7 / 5.0 requ) BAYES_00=-1.9,
 HEADER_FROM_DIFFERENT_DOMAINS=0.249, RCVD_IN_DNSWL_HI=-5,
 RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01, SPF_HELO_NONE=0.001,
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
Reply-To: Bug 1910605 <1910605@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

[Expired for QEMU because there has been no activity for 60 days.]

** Changed in: qemu
       Status: Incomplete =3D> Expired

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1910605

Title:
  qemu-arm-static ioctl USBDEVFS_BULK return -1 (EFAULT) Bad address

Status in QEMU:
  Expired

Bug description:

  Snippet of code sample:

  struct usbdevfs_bulktransfer Bulk;
  Bulk.ep =3D hUsb->UsbOut;          =

  Bulk.len =3D Len;          =

  Bulk.data =3D (void *)pData;          =

  Bulk.timeout =3D Timeout;
  Bytes =3D ioctl(hUsb->fd, USBDEVFS_BULK, &Bulk)

  The above code sample return -1 (EFAULT) Bad address when using qemu-
  arm-static but is running ok when on qemu-aarch64-static.

  I use a 64-bit intel laptop

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1910605/+subscriptions

