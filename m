Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 501703515BA
	for <lists+qemu-devel@lfdr.de>; Thu,  1 Apr 2021 16:48:45 +0200 (CEST)
Received: from localhost ([::1]:40836 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lRycm-0004Bw-D4
	for lists+qemu-devel@lfdr.de; Thu, 01 Apr 2021 10:48:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35388)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lRyZp-0002Yn-24
 for qemu-devel@nongnu.org; Thu, 01 Apr 2021 10:45:41 -0400
Received: from indium.canonical.com ([91.189.90.7]:60102)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lRyZm-0000Mw-Tp
 for qemu-devel@nongnu.org; Thu, 01 Apr 2021 10:45:40 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1lRyZl-00062B-0f
 for <qemu-devel@nongnu.org>; Thu, 01 Apr 2021 14:45:37 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 0024E2E8026
 for <qemu-devel@nongnu.org>; Thu,  1 Apr 2021 14:45:37 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Thu, 01 Apr 2021 14:38:54 -0000
From: promeneur <1922252@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=New; importance=Undecided; assignee=None;
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: epistemepromeneur
X-Launchpad-Bug-Reporter: promeneur (epistemepromeneur)
X-Launchpad-Bug-Modifier: promeneur (epistemepromeneur)
Message-Id: <161728793506.2853.10643750068702561801.malonedeb@chaenomeles.canonical.com>
Subject: [Bug 1922252] [NEW] [feature request] webcam support
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="9e82532c6e5a6687a86981ab67050d022605c32d"; Instance="production"
X-Launchpad-Hash: b2d8f0e2864fe2e1137cbeece6a89f7c76f7aae8
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
Reply-To: Bug 1922252 <1922252@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Public bug reported:

Please

I am impatient to get something as "-device usb-webcam" to share
dynamically the webcam between host and guest.

Thanks

** Affects: qemu
     Importance: Undecided
         Status: New

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1922252

Title:
  [feature request] webcam support

Status in QEMU:
  New

Bug description:
  Please

  I am impatient to get something as "-device usb-webcam" to share
  dynamically the webcam between host and guest.

  Thanks

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1922252/+subscriptions

