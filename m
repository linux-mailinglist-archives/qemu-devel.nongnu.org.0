Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 71B37372718
	for <lists+qemu-devel@lfdr.de>; Tue,  4 May 2021 10:21:36 +0200 (CEST)
Received: from localhost ([::1]:42610 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ldqJD-0003MM-Av
	for lists+qemu-devel@lfdr.de; Tue, 04 May 2021 04:21:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60896)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1ldqHl-0001qx-H5
 for qemu-devel@nongnu.org; Tue, 04 May 2021 04:20:07 -0400
Received: from indium.canonical.com ([91.189.90.7]:46790)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1ldqHh-0003T1-4C
 for qemu-devel@nongnu.org; Tue, 04 May 2021 04:20:05 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1ldqHf-0001CW-Tw
 for <qemu-devel@nongnu.org>; Tue, 04 May 2021 08:19:59 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id E19682E8136
 for <qemu-devel@nongnu.org>; Tue,  4 May 2021 08:19:59 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Tue, 04 May 2021 08:05:44 -0000
From: Thomas Huth <1619896@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Expired; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Tags: arm linux-user teamspeak
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: gabboxl pmaydell th-huth tobias-quintern
X-Launchpad-Bug-Reporter: Tobias Quintern (tobias-quintern)
X-Launchpad-Bug-Modifier: Thomas Huth (th-huth)
References: <20160903112421.26727.12298.malonedeb@gac.canonical.com>
Message-Id: <162011554486.4255.16697184142088266362.malone@chaenomeles.canonical.com>
Subject: [Bug 1619896] Re: linux-user missing cmsg IP_PKTINFO support
 ("Unsupported ancillary data: 0/8")
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="02afa4875ac52c169f5cddf0d1bcdd6e149a3754"; Instance="production"
X-Launchpad-Hash: 329af50f1e761fddc8d4a4c5a26d76b3f9a70b13
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
Reply-To: Bug 1619896 <1619896@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This is an automated cleanup. This bug report has been moved to QEMU's
new bug tracker on gitlab.com and thus gets marked as 'expired' now.
Please continue with the discussion here:

 https://gitlab.com/qemu-project/qemu/-/issues/127


** Changed in: qemu
       Status: Confirmed =3D> Expired

** Bug watch added: gitlab.com/qemu-project/qemu/-/issues #127
   https://gitlab.com/qemu-project/qemu/-/issues/127

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1619896

Title:
  linux-user missing cmsg IP_PKTINFO support ("Unsupported ancillary
  data: 0/8")

Status in QEMU:
  Expired

Bug description:
  Hello,

  I have the following issue when launching the Teamspeak Server x86
  binary on an arm host.

  Host:
   Linux 4.6.2 (vanilla)
   Ubuntu 14.04.5 LTS
   HW: Cubietruck board, armv7l

  =

  Used SW: Release archive qemu-2.7.0.tar.bz2 and git commit 1dc33ed90bf1fe=
1c2014dffa0d9e863c520d953a
  Configure options:
    ../configure --target-list=3Di386-linux-user =

  I attached the output of the configure script as configure.log

  Testcase:

  1. Download and extract TeamSpeak 3 Server 3.0.13.3 (x86)
    Souce: http://dl.4players.de/ts/releases/3.0.13.3/teamspeak3-server_lin=
ux_x86-3.0.13.3.tar.bz2

  2. Modifiy ts3server_minimal_runscript.sh for ease of use
    - ./ts3server $@
    + /usr/local/bin/qemu-i386 ./ts3server $@

  3. Execute ./ts3server_minimal_runscript.sh

  Wait for 6 Minutes until teamspeak server started. QEMU saturates the
  cpu while Teamspeak is precomputing a puzzle. (Whatever that means)

  After that Teamspeak settles with the following output:
    2016-09-03 10:50:59.555582|INFO    |Query         |   |listening on 0.0=
.0.0:10011, :::10011

  The Qemu process is now idling with ~2% cpu load. This is actually the
  first time for me that QEMU is able to successfully launch the
  Teamspeak server. Kudos!

  4. Connect client 1

  TS Clients can connect, but the following line is printed pretty often:
    Unsupported ancillary data: 0/8

  The line seems to come from qemu (linux-user/syscall.c)

  =

  5. Connect client 2
  When a second client is connected the audio transmission is successful fo=
r a few seconds, but the server drops the connection after that and refuses=
 to take new connections.

  Please let me know, if you need more information. I'll gladly provide
  strace or valgrind logs.

  Best regards,
  Tobias

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1619896/+subscriptions

