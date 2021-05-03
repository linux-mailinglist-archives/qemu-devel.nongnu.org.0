Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DC03A371BC7
	for <lists+qemu-devel@lfdr.de>; Mon,  3 May 2021 18:48:37 +0200 (CEST)
Received: from localhost ([::1]:46660 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ldbkK-0002HR-Kx
	for lists+qemu-devel@lfdr.de; Mon, 03 May 2021 12:48:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41750)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1ldbhD-0000au-Ur
 for qemu-devel@nongnu.org; Mon, 03 May 2021 12:45:24 -0400
Received: from indium.canonical.com ([91.189.90.7]:34798)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1ldbhA-0007M9-Cs
 for qemu-devel@nongnu.org; Mon, 03 May 2021 12:45:23 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1ldbh5-00040E-6O
 for <qemu-devel@nongnu.org>; Mon, 03 May 2021 16:45:15 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 253FC2E8188
 for <qemu-devel@nongnu.org>; Mon,  3 May 2021 16:45:15 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Mon, 03 May 2021 16:34:47 -0000
From: Thomas Huth <1323758@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Expired; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug: distribution=ubuntu; sourcepackage=qemu; component=main;
 status=Confirmed; importance=Low; assignee=None; 
X-Launchpad-Bug-Tags: upstream
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: janitor lucaskanashiro maarten256 phalen
 rubenportier serge-hallyn th-huth
X-Launchpad-Bug-Reporter: Ruben Portier (rubenportier)
X-Launchpad-Bug-Modifier: Thomas Huth (th-huth)
References: <20140527170942.25223.59558.malonedeb@chaenomeles.canonical.com>
Message-Id: <162005968711.13393.3112005866428748006.malone@wampee.canonical.com>
Subject: [Bug 1323758] Re: Mouse stops working when connected
 usb-storage-device
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="02afa4875ac52c169f5cddf0d1bcdd6e149a3754"; Instance="production"
X-Launchpad-Hash: 3ca814942c9aad8be23f57f22925b96942a1b011
Received-SPF: none client-ip=91.189.90.7; envelope-from=bounces@canonical.com;
 helo=indium.canonical.com
X-Spam_score_int: -65
X-Spam_score: -6.6
X-Spam_bar: ------
X-Spam_report: (-6.6 / 5.0 requ) BAYES_00=-1.9,
 HEADER_FROM_DIFFERENT_DOMAINS=0.25, RCVD_IN_DNSWL_HI=-5,
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
Reply-To: Bug 1323758 <1323758@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This is an automated cleanup. This bug report has been moved to QEMU's
new bug tracker on gitlab.com and thus gets marked as 'expired' now.
Please continue with the discussion here:

 https://gitlab.com/qemu-project/qemu/-/issues/102


** Changed in: qemu
       Status: Confirmed =3D> Expired

** Bug watch added: gitlab.com/qemu-project/qemu/-/issues #102
   https://gitlab.com/qemu-project/qemu/-/issues/102

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1323758

Title:
  Mouse stops working when connected usb-storage-device

Status in QEMU:
  Expired
Status in qemu package in Ubuntu:
  Confirmed

Bug description:
  I'm running a guest that has Windows 8 Pro (x64) installed. Every time
  I pass through a usb storage device from the host to the guest, the
  mouse stops working in the vnc client. When I remove the usb-device
  the mouse works again.

  The mouse only stops working when I pass through a usb storage device
  and then make the vlc viewer (client) inactive by clicking on another
  program on the local computer (where I'm running the vnc viewer
  (client)). As long as I keep the vnc viewer active, the mouse works
  without any problems. But as soon as I make the vnc viewer inactive
  and then active again, the mouse will no longer work. I have to reboot
  the guest or remove the usb storage device.

  I can't find any related problems on the internet, so it may be just
  me?

  I hope someone can help me with this.

  EDIT: I posted the extra/new information in comments. But as I know
  see it might be wrong and maybe I should've posted them in this bug
  description container (by editing)? Please tell me if I did it wrong
  and I will change it. Sorry for this misunderstanding.

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1323758/+subscriptions

