Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AC3C381059
	for <lists+qemu-devel@lfdr.de>; Fri, 14 May 2021 21:14:28 +0200 (CEST)
Received: from localhost ([::1]:55080 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lhdGV-0004U6-Nd
	for lists+qemu-devel@lfdr.de; Fri, 14 May 2021 15:14:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56510)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lhdDB-0006pT-Dz
 for qemu-devel@nongnu.org; Fri, 14 May 2021 15:11:01 -0400
Received: from indium.canonical.com ([91.189.90.7]:39846)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lhdD8-00027u-7P
 for qemu-devel@nongnu.org; Fri, 14 May 2021 15:11:01 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.93 #5 (Debian))
 id 1lhdD5-0007fm-7F
 for <qemu-devel@nongnu.org>; Fri, 14 May 2021 19:10:55 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id E12FB2E818A
 for <qemu-devel@nongnu.org>; Fri, 14 May 2021 19:10:54 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Fri, 14 May 2021 19:02:26 -0000
From: Thomas Huth <1922252@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Incomplete; importance=Wishlist;
 assignee=None; 
X-Launchpad-Bug-Tags: feature-request usb
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: epistemepromeneur th-huth
X-Launchpad-Bug-Reporter: promeneur (epistemepromeneur)
X-Launchpad-Bug-Modifier: Thomas Huth (th-huth)
References: <161728793506.2853.10643750068702561801.malonedeb@chaenomeles.canonical.com>
Message-Id: <162101894656.20719.16657561426266127133.malone@soybean.canonical.com>
Subject: [Bug 1922252] Re: [feature request] webcam support
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="5321c3f40fa4d4b847f4e47fb766e7b95ed5036c"; Instance="production"
X-Launchpad-Hash: 4a58264fce9abd09b7e0281710b986366be83282
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
Reply-To: Bug 1922252 <1922252@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Have you already tried to simply pass the host USB webcam through to the
guest? ... that's likely easier and faster than adding software
emulation...

** Changed in: qemu
       Status: New =3D> Incomplete

** Tags added: feature-request usb

** Changed in: qemu
   Importance: Undecided =3D> Wishlist

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1922252

Title:
  [feature request] webcam support

Status in QEMU:
  Incomplete

Bug description:
  Please

  I am impatient to get something as "-device usb-webcam" to share
  dynamically the webcam between host and guest.

  Thanks

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1922252/+subscriptions

