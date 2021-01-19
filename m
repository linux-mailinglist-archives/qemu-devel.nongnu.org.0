Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A3752FAF6F
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Jan 2021 05:33:37 +0100 (CET)
Received: from localhost ([::1]:34316 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l1ii0-00026i-DS
	for lists+qemu-devel@lfdr.de; Mon, 18 Jan 2021 23:33:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44246)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1l1ifk-0000Jz-69
 for qemu-devel@nongnu.org; Mon, 18 Jan 2021 23:31:16 -0500
Received: from indium.canonical.com ([91.189.90.7]:57078)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1l1ifg-0004uA-5b
 for qemu-devel@nongnu.org; Mon, 18 Jan 2021 23:31:15 -0500
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1l1ifd-0003xI-Vy
 for <qemu-devel@nongnu.org>; Tue, 19 Jan 2021 04:31:09 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id EA8262E813C
 for <qemu-devel@nongnu.org>; Tue, 19 Jan 2021 04:31:09 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Tue, 19 Jan 2021 04:17:56 -0000
From: Launchpad Bug Tracker <1579306@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Expired; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: ashishgirdhar janitor jscinoz th-huth tom-ty89
X-Launchpad-Bug-Reporter: Tom Yan (tom-ty89)
X-Launchpad-Bug-Modifier: Launchpad Janitor (janitor)
References: <20160507052845.589.63580.malonedeb@chaenomeles.canonical.com>
Message-Id: <161102987660.12094.6729225104340849139.malone@loganberry.canonical.com>
Subject: [Bug 1579306] Re: usb-uas does not work in Windows (10) guest
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="44709f752aec466e4fba4ac588c69193e99da5ce"; Instance="production"
X-Launchpad-Hash: 259df018fc17a950fe6fcda6c77b21b8be7c9c71
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
Reply-To: Bug 1579306 <1579306@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

[Expired for QEMU because there has been no activity for 60 days.]

** Changed in: qemu
       Status: Incomplete =3D> Expired

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1579306

Title:
  usb-uas does not work in Windows (10) guest

Status in QEMU:
  Expired

Bug description:
  When I attach a "-device usb-uas" to a VM with Windows 10 10586, the
  device fail to start with the following error in the guest:

  "The device cannot start. (Code 10)

  {Operation Failed}
  The requested operation was unsuccessful"

  If the host controller is nec-usb-xhci, there will be two of the
  following error on the terminal of the host as well:

  "qemu-system-x86_64: usb_uas_handle_control: unhandled control
  request"

  If it's usb-ehci, ich9-usb-ehci1 or ich9-usb-echi2, this will not show
  up on the host side, but the device stil fails with the same error on
  the guest side.

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1579306/+subscriptions

