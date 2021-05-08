Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 28C2E377009
	for <lists+qemu-devel@lfdr.de>; Sat,  8 May 2021 08:20:01 +0200 (CEST)
Received: from localhost ([::1]:48446 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lfGJk-0002Hb-5e
	for lists+qemu-devel@lfdr.de; Sat, 08 May 2021 02:20:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52698)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lfGFb-0005LZ-8X
 for qemu-devel@nongnu.org; Sat, 08 May 2021 02:15:43 -0400
Received: from indium.canonical.com ([91.189.90.7]:54578)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lfGFX-0004li-B4
 for qemu-devel@nongnu.org; Sat, 08 May 2021 02:15:43 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.93 #5 (Debian))
 id 1lfGFW-0007Nu-2v
 for <qemu-devel@nongnu.org>; Sat, 08 May 2021 06:15:38 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 0B1AE2E800F
 for <qemu-devel@nongnu.org>; Sat,  8 May 2021 06:15:38 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Sat, 08 May 2021 06:07:42 -0000
From: Thomas Huth <1894818@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Incomplete; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: dereksu lukey3332 th-huth
X-Launchpad-Bug-Reporter: Derek Su (dereksu)
X-Launchpad-Bug-Modifier: Thomas Huth (th-huth)
References: <159955977855.17769.18273034994411209537.malonedeb@soybean.canonical.com>
Message-Id: <162045406209.9822.11316473257667164462.malone@chaenomeles.canonical.com>
Subject: [Bug 1894818] Re: COLO's guest VNC client hang after failover
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="dccd804998035922efb3da0a725ecc923e2255f3"; Instance="production"
X-Launchpad-Hash: 771b1a4032e24dba2318446068def0ba45be744e
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
Reply-To: Bug 1894818 <1894818@bugs.launchpad.net>
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


** Changed in: qemu
       Status: New =3D> Incomplete

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1894818

Title:
  COLO's guest VNC client hang after failover

Status in QEMU:
  Incomplete

Bug description:
  Hello,

  After setting up COLO's primary and secondary VMs,
  I installed the vncserver and xrdp (apt install tightvncserver xrdp) insi=
de the VM.

  I access the VM from another PC via VNC/RDP client, and everything is OK.
  Then, kill the primary VM and issue the failover commands.

  The expected result is that the VNC/RDP client can reconnect and
  resume automatically after failover. (I've confirmed the VNC/RDP
  client can reconnect automatically.)

  But in my test, the VNC client's screen hangs and cannot be recovered
  no longer. I need to restart VNC client by myself.

  BTW, it works well after killing SVM.

  Here is my QEMU networking device
  ```
  -device virtio-net-pci,id=3De0,netdev=3Dhn0 \
  -netdev tap,id=3Dhn0,br=3Dbr0,vhost=3Doff,helper=3D/usr/local/libexec/qem=
u-bridge-helper \
  ```

  Thanks.

  Regards,
  Derek

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1894818/+subscriptions

