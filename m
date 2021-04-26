Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CC03136B329
	for <lists+qemu-devel@lfdr.de>; Mon, 26 Apr 2021 14:37:19 +0200 (CEST)
Received: from localhost ([::1]:53120 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lb0UI-0008Uy-Ti
	for lists+qemu-devel@lfdr.de; Mon, 26 Apr 2021 08:37:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50238)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lb0S9-0007ZE-4h
 for qemu-devel@nongnu.org; Mon, 26 Apr 2021 08:35:05 -0400
Received: from indium.canonical.com ([91.189.90.7]:36758)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lb0S7-0000j8-0H
 for qemu-devel@nongnu.org; Mon, 26 Apr 2021 08:35:04 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1lb0S4-0007AG-NX
 for <qemu-devel@nongnu.org>; Mon, 26 Apr 2021 12:35:00 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id B0AF62E8166
 for <qemu-devel@nongnu.org>; Mon, 26 Apr 2021 12:35:00 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Mon, 26 Apr 2021 12:22:08 -0000
From: Lucas Kanashiro <1323758@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Confirmed; importance=Undecided;
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
X-Launchpad-Bug-Modifier: Lucas Kanashiro (lucaskanashiro)
References: <20140527170942.25223.59558.malonedeb@chaenomeles.canonical.com>
Message-Id: <161943972818.4012.13271337070527507840.malone@gac.canonical.com>
Subject: [Bug 1323758] Re: Mouse stops working when connected
 usb-storage-device
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="f9f562f07f129de414c16be22a405ff0964e0018"; Instance="production"
X-Launchpad-Hash: 3bc94c189ad4ce722d44c08cc538006d4fcff628
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
Reply-To: Bug 1323758 <1323758@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

@Kendrick could you please tell us which version of Ubuntu and qemu you
are using?

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1323758

Title:
  Mouse stops working when connected usb-storage-device

Status in QEMU:
  Confirmed
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

