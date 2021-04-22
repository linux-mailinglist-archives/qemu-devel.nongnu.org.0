Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C5937367838
	for <lists+qemu-devel@lfdr.de>; Thu, 22 Apr 2021 06:06:58 +0200 (CEST)
Received: from localhost ([::1]:40478 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lZQcD-00006H-Ri
	for lists+qemu-devel@lfdr.de; Thu, 22 Apr 2021 00:06:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36096)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lZQaJ-0006oh-Ll
 for qemu-devel@nongnu.org; Thu, 22 Apr 2021 00:04:59 -0400
Received: from indium.canonical.com ([91.189.90.7]:42002)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lZQaH-0006ZX-LR
 for qemu-devel@nongnu.org; Thu, 22 Apr 2021 00:04:59 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1lZQaF-0004wI-H0
 for <qemu-devel@nongnu.org>; Thu, 22 Apr 2021 04:04:55 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 66C912E8161
 for <qemu-devel@nongnu.org>; Thu, 22 Apr 2021 04:04:55 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Thu, 22 Apr 2021 03:55:22 -0000
From: Thomas Huth <1090602@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Incomplete; importance=Wishlist;
 assignee=None; 
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: crobinso th-huth
X-Launchpad-Bug-Reporter: Cole Robinson (crobinso)
X-Launchpad-Bug-Modifier: Thomas Huth (th-huth)
References: <20121215000355.23796.95243.malonedeb@soybean.canonical.com>
Message-Id: <161906372254.23416.1424027708100334943.malone@gac.canonical.com>
Subject: [Bug 1090602] Re: RFE: Allow specifying usb-host device by serial
 number
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="1552fceb1603b3da6cfa437575d9c9fc4b2e683a"; Instance="production"
X-Launchpad-Hash: 10a2199f3f6f6be5b26480cb5866607999b600de
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
Reply-To: Bug 1090602 <1090602@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The QEMU project is currently considering to move its bug tracking to anoth=
er system. For this we need to know which bugs are still valid and which co=
uld be closed already. Thus we are setting older bugs to "Incomplete" now.
If you still think this bug report here is valid, then please switch the st=
ate back to "New" within the next 60 days, otherwise this report will be ma=
rked as "Expired". Or mark it as "Fix Released" if the problem has been sol=
ved with a newer version of QEMU already. Thank you and sorry for the incon=
venience.


** Changed in: qemu
       Status: New =3D> Incomplete

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1090602

Title:
  RFE: Allow specifying usb-host device by serial number

Status in QEMU:
  Incomplete

Bug description:
  Currently you can pass through a host USB device to the guest like

    -device usb-host,vendorid=3D0x1234,productid=3D0x5678

  Which is all well and good, but has problems if you are trying to
  assign to identical USB devices to the same guest.

  It would be useful if there was an additional option that allow
  matching against the device's serial number, which should allow
  differentiating between two devices with the same product+vendor.

  This was originally filed at
  https://bugzilla.redhat.com/show_bug.cgi?id=3D640332

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1090602/+subscriptions

