Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 346C02FAF93
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Jan 2021 05:46:39 +0100 (CET)
Received: from localhost ([::1]:45192 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l1iuc-0001ez-6S
	for lists+qemu-devel@lfdr.de; Mon, 18 Jan 2021 23:46:38 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44572)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1l1ig6-00014E-JJ
 for qemu-devel@nongnu.org; Mon, 18 Jan 2021 23:31:40 -0500
Received: from indium.canonical.com ([91.189.90.7]:58142)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1l1ig4-00051K-Se
 for qemu-devel@nongnu.org; Mon, 18 Jan 2021 23:31:38 -0500
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1l1ift-000486-82
 for <qemu-devel@nongnu.org>; Tue, 19 Jan 2021 04:31:25 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 08BC82E8145
 for <qemu-devel@nongnu.org>; Tue, 19 Jan 2021 04:31:25 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Tue, 19 Jan 2021 04:17:49 -0000
From: Launchpad Bug Tracker <1377163@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Expired; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: janitor lekensteyn manday th-huth
X-Launchpad-Bug-Reporter: ManDay (manday)
X-Launchpad-Bug-Modifier: Launchpad Janitor (janitor)
References: <20141003134119.17973.5491.malonedeb@chaenomeles.canonical.com>
Message-Id: <161102986959.12094.15595896683008836297.malone@loganberry.canonical.com>
Subject: [Bug 1377163] Re: Does not add usb-host devices as they are hotplugged
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="44709f752aec466e4fba4ac588c69193e99da5ce"; Instance="production"
X-Launchpad-Hash: 611fc3524d2bea1db82831353ab9db86c452d558
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
Reply-To: Bug 1377163 <1377163@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

[Expired for QEMU because there has been no activity for 60 days.]

** Changed in: qemu
       Status: Incomplete =3D> Expired

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1377163

Title:
  Does not add usb-host devices as they are hotplugged

Status in QEMU:
  Expired

Bug description:
  A commandline such as

  qemu-kvm -device usb-ehci,id=3DUSBCtrl -device host-
  usb,bus=3DUSBCtrl.0,hostbus=3D3

  should automatically add all devices on the given bus (here: 3) not
  only initially, but also when new devices appear on that bus while
  Qemu runs. Currently, all devices on the bus are added initially, but
  new devices which are added to the (host) usb while Qemu runs have to
  be added manually.

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1377163/+subscriptions

