Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C51F3375F92
	for <lists+qemu-devel@lfdr.de>; Fri,  7 May 2021 06:51:31 +0200 (CEST)
Received: from localhost ([::1]:50226 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lesSY-0006Xz-Ju
	for lists+qemu-devel@lfdr.de; Fri, 07 May 2021 00:51:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59948)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lesRg-00062c-U2
 for qemu-devel@nongnu.org; Fri, 07 May 2021 00:50:36 -0400
Received: from indium.canonical.com ([91.189.90.7]:37320)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lesRf-0005LG-7W
 for qemu-devel@nongnu.org; Fri, 07 May 2021 00:50:36 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.93 #5 (Debian))
 id 1lesRd-00057q-Qk
 for <qemu-devel@nongnu.org>; Fri, 07 May 2021 04:50:33 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id A04BB2E8186
 for <qemu-devel@nongnu.org>; Fri,  7 May 2021 04:50:33 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Fri, 07 May 2021 04:40:50 -0000
From: Thomas Huth <1887604@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Incomplete; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Tags: feature-request
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: superflip th-huth
X-Launchpad-Bug-Reporter: Ralph G (superflip)
X-Launchpad-Bug-Modifier: Thomas Huth (th-huth)
References: <159478506417.12547.6442940817184262205.malonedeb@soybean.canonical.com>
Message-Id: <162036245049.404.3838814147814429536.malone@chaenomeles.canonical.com>
Subject: [Bug 1887604] Re: Forward host UNIX socket to guest TCP port
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="d6ba96cccb3d3e356754af3137c6128a6c17e2a8"; Instance="production"
X-Launchpad-Hash: b6cd6c5304ce7db78e3887ac5d6e7853ba95cd92
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
Reply-To: Bug 1887604 <1887604@bugs.launchpad.net>
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
the state back to "New" within the next 60 days (otherwise it will get
closed as "Expired"). We will then eventually migrate the ticket auto-
matically to the new system (but you won't be the reporter of the bug
in the new system and thus won't get notified on changes anymore).

Thank you and sorry for the inconvenience.


** Changed in: qemu
       Status: New =3D> Incomplete

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1887604

Title:
  Forward host UNIX socket to guest TCP port

Status in QEMU:
  Incomplete

Bug description:
  Hello. I've been racking my brain trying to work out if this is
  possible.

  I would like to be able to forward to a guest TCP port, via a host
  UNIX socket to avoid opening a TCP port on the host. For example:

  qemu-system-i386 [...] -nic user,hostfwd=3Dunix:/path/to/socket-:22

  and then connect to the VM like:

  ssh -o "ProxyCommand socat - unix-connect:/path/to/socket"
  user@0.0.0.0

  QEMU, as versatile as it is, doesn't appreciate my intuited syntax
  "hostfwd=3Dunix:...". It is also unhappy with:

  qemu-system-i386 [...] \
      -chardev socket,id=3Dfoo,path=3D/path/to/socket,server,nowait \
      -nic user,hostfwd=3Dchardev:foo-:22

  And:

  qemu-system-i386 [...] \
      -nic user \
      -chardev socket,id=3Dfoo,path=3D/path/to/socket,server,nowait \
      -chardev socket,id=3Dfoo,host=3D10.0.2.15,port=3D22

  I already found out how to connect in the opposite direction, **from**
  guest TCP to host UNIX, via guestfwd -> cmd -> socat. So I feel like
  there ought to be a way.

  If this is not yet a feature I would like to request it, and if it is,
  please tell me how!

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1887604/+subscriptions

