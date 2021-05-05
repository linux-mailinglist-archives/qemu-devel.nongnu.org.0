Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C4DA373DC9
	for <lists+qemu-devel@lfdr.de>; Wed,  5 May 2021 16:37:57 +0200 (CEST)
Received: from localhost ([::1]:49436 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1leIey-0007Ri-65
	for lists+qemu-devel@lfdr.de; Wed, 05 May 2021 10:37:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49068)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1leId6-00066I-IN
 for qemu-devel@nongnu.org; Wed, 05 May 2021 10:36:02 -0400
Received: from indium.canonical.com ([91.189.90.7]:36500)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1leId4-0002Ij-E0
 for qemu-devel@nongnu.org; Wed, 05 May 2021 10:36:00 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.93 #5 (Debian))
 id 1leIcz-0004Fg-AD
 for <qemu-devel@nongnu.org>; Wed, 05 May 2021 14:35:53 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 808A82E8205
 for <qemu-devel@nongnu.org>; Wed,  5 May 2021 14:35:49 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Wed, 05 May 2021 14:28:52 -0000
From: Thomas Huth <1843711@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Expired; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Tags: feature-request
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: anisse th-huth
X-Launchpad-Bug-Reporter: Anisse Astier (anisse)
X-Launchpad-Bug-Modifier: Thomas Huth (th-huth)
References: <156829271040.1120.16860411935336460779.malonedeb@wampee.canonical.com>
Message-Id: <162022493225.3221.11931049616339645983.malone@gac.canonical.com>
Subject: [Bug 1843711] Re: qemu-xhci device should detect if libusb host
 supports streams
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="d6ba96cccb3d3e356754af3137c6128a6c17e2a8"; Instance="production"
X-Launchpad-Hash: 0af6e677e5d3f37b8e7dc0a4c4789448556c3fb3
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

This is an automated cleanup. This bug report has been moved to QEMU's
new bug tracker on gitlab.com and thus gets marked as 'expired' now.
Please continue with the discussion here:

 https://gitlab.com/qemu-project/qemu/-/issues/182


** Changed in: qemu
       Status: New =3D> Expired

** Bug watch added: gitlab.com/qemu-project/qemu/-/issues #182
   https://gitlab.com/qemu-project/qemu/-/issues/182

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1843711

Title:
  qemu-xhci device should detect if libusb host supports streams

Status in QEMU:
  Expired

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

