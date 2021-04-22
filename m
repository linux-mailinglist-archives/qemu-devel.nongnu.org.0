Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D0B736786E
	for <lists+qemu-devel@lfdr.de>; Thu, 22 Apr 2021 06:18:56 +0200 (CEST)
Received: from localhost ([::1]:41376 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lZQnn-0003wL-FA
	for lists+qemu-devel@lfdr.de; Thu, 22 Apr 2021 00:18:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39384)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lZQju-00083K-Hl
 for qemu-devel@nongnu.org; Thu, 22 Apr 2021 00:14:54 -0400
Received: from indium.canonical.com ([91.189.90.7]:42800)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lZQjs-00048u-53
 for qemu-devel@nongnu.org; Thu, 22 Apr 2021 00:14:54 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1lZQjq-0005s7-BQ
 for <qemu-devel@nongnu.org>; Thu, 22 Apr 2021 04:14:50 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 467DF2E815D
 for <qemu-devel@nongnu.org>; Thu, 22 Apr 2021 04:14:50 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Thu, 22 Apr 2021 04:03:14 -0000
From: Thomas Huth <1502884@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Incomplete; importance=Wishlist;
 assignee=None; 
X-Launchpad-Bug-Tags: extension keyboard kvm norepeat repeat server vnc
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: berrange empee584 mikael-trash th-huth
X-Launchpad-Bug-Reporter: Mikael (mikael-trash)
X-Launchpad-Bug-Modifier: Thomas Huth (th-huth)
References: <20151005123157.4012.27683.malonedeb@soybean.canonical.com>
Message-Id: <161906419474.6464.17809360461715014917.malone@chaenomeles.canonical.com>
Subject: [Bug 1502884] Re: Super important feature req: QEMU VNC server:
 Introduce a keyboard "norepeat" option!
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="1552fceb1603b3da6cfa437575d9c9fc4b2e683a"; Instance="production"
X-Launchpad-Hash: f7f6be81a3dee10f3362252cf69a3862b95dc23f
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
Reply-To: Bug 1502884 <1502884@bugs.launchpad.net>
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
https://bugs.launchpad.net/bugs/1502884

Title:
  Super important feature req: QEMU VNC server: Introduce a keyboard
  "norepeat" option!

Status in QEMU:
  Incomplete

Bug description:
  Hi,

  A big issue when using QEMU's VNC server (VNC KVM) is that, when
  there's a network lag, unintended keypresses go through to the QEMU
  guest VM.

  This is frequently "enter" keypresses, causing all kinds of unintended
  consequences in the VM. So basically it's extremely dangerous.

  This is because the VNC protocol's keyboard interaction is implemented
  in terms of key down - key up events, making the server's keyboard
  autorepeat kick in when it should not.

  =

  For this reason, it would be great if QEMU's VNC server part would be enh=
anced with an option such that when a VNC protocol key down is received, th=
en locally that is treated as one single keypress only (I don't know how th=
at should be implemented but I guess either as an immediate key down - key =
up sequence locally, or key down + key up after say 0.05 seconds), instead =
of waiting for the key up event from the VNC client.

  Thanks!

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1502884/+subscriptions

