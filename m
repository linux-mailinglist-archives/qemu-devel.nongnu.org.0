Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B64E237978E
	for <lists+qemu-devel@lfdr.de>; Mon, 10 May 2021 21:21:46 +0200 (CEST)
Received: from localhost ([::1]:56354 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lgBTN-0008SQ-Qi
	for lists+qemu-devel@lfdr.de; Mon, 10 May 2021 15:21:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37872)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lgBJ4-00027x-3V
 for qemu-devel@nongnu.org; Mon, 10 May 2021 15:11:06 -0400
Received: from indium.canonical.com ([91.189.90.7]:43440)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lgBIu-00065S-A0
 for qemu-devel@nongnu.org; Mon, 10 May 2021 15:11:04 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.93 #5 (Debian))
 id 1lgBIr-0002Jh-Uv
 for <qemu-devel@nongnu.org>; Mon, 10 May 2021 19:10:53 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id E08F32E8136
 for <qemu-devel@nongnu.org>; Mon, 10 May 2021 19:10:53 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Mon, 10 May 2021 19:03:05 -0000
From: Thomas Huth <1906608@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Incomplete; importance=Wishlist;
 assignee=None; 
X-Launchpad-Bug-Tags: feature-request usb
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: ruimeiyan th-huth
X-Launchpad-Bug-Reporter: ruimeiyan (ruimeiyan)
X-Launchpad-Bug-Modifier: Thomas Huth (th-huth)
References: <160697929082.24737.7684799499074231317.malonedeb@gac.canonical.com>
Message-Id: <162067338532.10300.17985067269223094525.malone@chaenomeles.canonical.com>
Subject: [Bug 1906608] Re:  [Feature request]For some ehci controller,
 qemu should implement using portsc[26-27] to detect the speed of
 device.
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="dccd804998035922efb3da0a725ecc923e2255f3"; Instance="production"
X-Launchpad-Hash: 2e94c497b22e4177b4dec6e2100d9bc5729a32d7
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
Reply-To: Bug 1906608 <1906608@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The QEMU project is currently moving its bug tracking to another system.
For this we need to know which bugs are still valid and which could be
closed already. Thus we are setting the bug state to "Incomplete" now.

If the bug has already been fixed in the latest upstream version of QEMU,
then please close this ticket as "Fix released".

If it is not fixed yet and you think that this bug report here is still
valid, then you have two options:

1) If you already have an account on gitlab.com, please open a new ticket
for this problem in our new tracker here:

    https://gitlab.com/qemu-project/qemu/-/issues

and then close this ticket here on Launchpad (or let it expire auto-
matically after 60 days). Please mention the URL of this bug ticket on
Launchpad in the new ticket on GitLab.

2) If you don't have an account on gitlab.com and don't intend to get
one, but still would like to keep this ticket opened, then please switch
the state back to "New" or "Confirmed" within the next 60 days (other-
wise it will get closed as "Expired"). We will then eventually migrate
the ticket automatically to the new system (but you won't be the reporter
of the bug in the new system and thus you won't get notified on changes
anymore).

Thank you and sorry for the inconvenience.


** Tags added: feature-request usb

** Changed in: qemu
   Importance: Undecided =3D> Wishlist

** Changed in: qemu
       Status: New =3D> Incomplete

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1906608

Title:
   [Feature request]For some ehci controller, qemu should implement
  using portsc[26-27]  to detect the speed of device.

Status in QEMU:
  Incomplete

Bug description:
  for some ehci controller ,for example ehci controller on fsl_imx6,it
  using portsc[26-27] to decide a full speed device or high speed device
  was connected, hub-ehci.c should set the portsc[26-27] to return the
  right speed.

  line:1001 in hub-ehci.c
          if (dev && dev->attached && (dev->speedmask & USB_SPEED_MASK_HIGH=
)) {
              val |=3D PORTSC_PED;
          }

  below is the spec for fsl_imx6 USB PART.
  PORTSC:27=E2=80=9326 :PSPD
  Port Speed - Read Only.
  This register field indicates the speed at which the port is operating.
  00 Full Speed
  01 Low Speed
  10 High Speed
  11 Undefined

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1906608/+subscriptions

