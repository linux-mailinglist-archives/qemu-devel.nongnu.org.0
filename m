Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E31B0379F22
	for <lists+qemu-devel@lfdr.de>; Tue, 11 May 2021 07:27:50 +0200 (CEST)
Received: from localhost ([::1]:50628 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lgKvu-0001c5-0h
	for lists+qemu-devel@lfdr.de; Tue, 11 May 2021 01:27:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58972)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lgKu3-00081S-Lu
 for qemu-devel@nongnu.org; Tue, 11 May 2021 01:25:56 -0400
Received: from indium.canonical.com ([91.189.90.7]:59072)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lgKtu-0003Du-Sr
 for qemu-devel@nongnu.org; Tue, 11 May 2021 01:25:53 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.93 #5 (Debian))
 id 1lgKts-0002Is-OZ
 for <qemu-devel@nongnu.org>; Tue, 11 May 2021 05:25:44 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 8E9422E8186
 for <qemu-devel@nongnu.org>; Tue, 11 May 2021 05:25:44 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Tue, 11 May 2021 05:17:31 -0000
From: Thomas Huth <1873769@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Incomplete; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: aperamak markostamcar th-huth vvaltchev
X-Launchpad-Bug-Reporter: =?utf-8?q?Marko_=C5=A0tamcar_=28markostamcar=29?=
X-Launchpad-Bug-Modifier: Thomas Huth (th-huth)
References: <158737489336.27883.11672421823937229418.malonedeb@gac.canonical.com>
Message-Id: <162071025149.10558.7901133411889141545.malone@chaenomeles.canonical.com>
Subject: [Bug 1873769] Re: SB16 audio playback freezes emulation in Windows 95
 guest
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="dccd804998035922efb3da0a725ecc923e2255f3"; Instance="production"
X-Launchpad-Hash: bce10db6cbb61a36a7c4721514896fd45edf9f9e
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
Reply-To: Bug 1873769 <1873769@bugs.launchpad.net>
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
https://bugs.launchpad.net/bugs/1873769

Title:
  SB16 audio playback freezes emulation in Windows 95 guest

Status in QEMU:
  Incomplete

Bug description:
  - QEMU 4.2.93 (v5.0.0-rc3) built from latest git master
  20038cd7a8412feeb49c01f6ede89e36c8995472 using MSYS2 on Windows 10 and
  launched on same Windows 10

  - Launched using "qemu-system-i386.exe -drive format=3Draw,file=3Dhdd-
  2gb.img -soundhw pcspk,sb16 -m 16 -cpu pentium -vga std -cdrom
  Windows_95.iso -boot c"

  - I have attached video screen capture of the issue

  ---

  I decided to make my first ever QEMU build after encountering the
  dsound issues using the latest 4.2.0 binary from
  https://qemu.weilnetz.de/w64/. In my 5.0.0-rc3 build the sound
  playback is working correctly, however the whole Windows 95 UI freezes
  while sound is playing.

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1873769/+subscriptions

