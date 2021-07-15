Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5127C3C9787
	for <lists+qemu-devel@lfdr.de>; Thu, 15 Jul 2021 06:34:07 +0200 (CEST)
Received: from localhost ([::1]:35050 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m3t4Y-0005T3-Dg
	for lists+qemu-devel@lfdr.de; Thu, 15 Jul 2021 00:34:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36628)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1m3swe-0005LY-0t
 for qemu-devel@nongnu.org; Thu, 15 Jul 2021 00:25:56 -0400
Received: from indium.canonical.com ([91.189.90.7]:38354)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1m3swc-0000P2-Ed
 for qemu-devel@nongnu.org; Thu, 15 Jul 2021 00:25:55 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.93 #5 (Debian))
 id 1m3swZ-0007vX-Cs
 for <qemu-devel@nongnu.org>; Thu, 15 Jul 2021 04:25:51 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 5B4BE2E817C
 for <qemu-devel@nongnu.org>; Thu, 15 Jul 2021 04:25:51 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Thu, 15 Jul 2021 04:17:26 -0000
From: Launchpad Bug Tracker <1924987@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Expired; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Tags: storage
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: janitor th-huth tigg
X-Launchpad-Bug-Reporter: Ricky Tigg (tigg)
X-Launchpad-Bug-Modifier: Launchpad Janitor (janitor)
References: <161882313513.2580.5040892945774329423.malonedeb@gac.canonical.com>
Message-Id: <162632264685.31721.1961343964698619995.malone@loganberry.canonical.com>
Subject: [Bug 1924987] Re: Storage | Two decimal digits precision
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="4fbbc20799edd34b40f59a0c81c360f947903b2a"; Instance="production"
X-Launchpad-Hash: ca63b19e3d91788054e97c3249eefdcc423267c8
Received-SPF: pass client-ip=91.189.90.7; envelope-from=bounces@canonical.com;
 helo=indium.canonical.com
X-Spam_score_int: -65
X-Spam_score: -6.6
X-Spam_bar: ------
X-Spam_report: (-6.6 / 5.0 requ) BAYES_00=-1.9,
 HEADER_FROM_DIFFERENT_DOMAINS=0.249, RCVD_IN_DNSWL_HI=-5,
 RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Reply-To: Bug 1924987 <1924987@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

[Expired for QEMU because there has been no activity for 60 days.]

** Changed in: qemu
       Status: Incomplete =3D> Expired

--=20
You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1924987

Title:
  Storage | Two decimal digits precision

Status in QEMU:
  Expired

Bug description:
  Tested on: Fedora 34; Component: qemu-img-5.2.0-5.fc34.1.x86_64

  Hello. A two decimal digits precision is most appropriated on systems
  whose storage capacities have to be saved. That is one of the reason
  why such precision is supported in the context of creation of virtual
  machines in several Unix/Linux virtualization platforms; virt-manager
  is one of them. That last exhibits virtual disks size values with such
  precision =E2=80=93 128.00 GiB =E2=80=93 nevertheless it lacks yet a ment=
ion
  illustrating physical disks size values.

  Storage values exhibited in qemu-img and virt-manager are already
  according to a clear format; thus, values are not attached to their
  measure units (#value# #units#).

  $ qemu-img info ~/.local/share/libvirt/images/fedora_default.img | sed -n=
 '2,4p'
  file format: qcow2
  virtual size: 128 GiB (137438953472 bytes)
  disk size: 147 MiB

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1924987/+subscriptions


