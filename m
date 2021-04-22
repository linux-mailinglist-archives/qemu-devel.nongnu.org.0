Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A615F367B49
	for <lists+qemu-devel@lfdr.de>; Thu, 22 Apr 2021 09:43:06 +0200 (CEST)
Received: from localhost ([::1]:60614 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lZTzN-0000zV-7U
	for lists+qemu-devel@lfdr.de; Thu, 22 Apr 2021 03:43:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33584)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lZTxn-000059-OO
 for qemu-devel@nongnu.org; Thu, 22 Apr 2021 03:41:27 -0400
Received: from indium.canonical.com ([91.189.90.7]:42388)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lZTxl-0002lb-Ir
 for qemu-devel@nongnu.org; Thu, 22 Apr 2021 03:41:27 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1lZTxi-0007wJ-Hn
 for <qemu-devel@nongnu.org>; Thu, 22 Apr 2021 07:41:22 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 848CD2E8165
 for <qemu-devel@nongnu.org>; Thu, 22 Apr 2021 07:41:22 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Thu, 22 Apr 2021 07:32:28 -0000
From: Thomas Huth <1843711@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Incomplete; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Tags: feature-request
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: anisse th-huth
X-Launchpad-Bug-Reporter: Anisse Astier (anisse)
X-Launchpad-Bug-Modifier: Thomas Huth (th-huth)
References: <156829271040.1120.16860411935336460779.malonedeb@wampee.canonical.com>
Message-Id: <161907674856.31716.16102252375806179342.malone@soybean.canonical.com>
Subject: [Bug 1843711] Re: qemu-xhci device should detect if libusb host
 supports streams
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="1552fceb1603b3da6cfa437575d9c9fc4b2e683a"; Instance="production"
X-Launchpad-Hash: 04e327b15a3461e4af82a8703c6ca6f7a34c2777
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
Reply-To: Bug 1843711 <1843711@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The QEMU project is currently considering to move its bug tracking to
another system. For this we need to know which bugs are still valid
and which could be closed already. Thus we are setting older bugs to
"Incomplete" now.

If you still think this bug report here is valid, then please switch
the state back to "New" within the next 60 days, otherwise this report
will be marked as "Expired". Or please mark it as "Fix Released" if
the problem has been solved with a newer version of QEMU already.

Thank you and sorry for the inconvenience.


** Changed in: qemu
       Status: New =3D> Incomplete

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1843711

Title:
  qemu-xhci device should detect if libusb host supports streams

Status in QEMU:
  Incomplete

Bug description:
  When using USB=C2=A0passthrough with the qemu-xhci (and nec-usb-xhci),
  streams are enabled by default, but if the host xHCI controller
  doesn't support them, it will trigger hard-to-debug UAS guest errors.

  This should be possible to detect since the kernel returns ENOSYS (errno =
38) when xhci host controller does not support streams:
              libusb: error [do_streams_ioctl] streams-ioctl failed error -=
1 errno 38
              qemu: libusb_alloc_streams: -99 [OTHER]

  Maybe libusb should return a dedicated error instead of
  LIBUSB_ERROR_OTHER in this case, but qemu does not handle any other
  error code anyway.

  Just trying to enable streams before enabling them in qemu should do
  it. I don't know if it should be done in hcd-xhci.c, host-libusb.c or
  elsewhere, but this would be detectable at launch instead of a static
  option true/false, maybe a ternary with auto would be better.

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1843711/+subscriptions

