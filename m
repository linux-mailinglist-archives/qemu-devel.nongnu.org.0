Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 94971375927
	for <lists+qemu-devel@lfdr.de>; Thu,  6 May 2021 19:23:27 +0200 (CEST)
Received: from localhost ([::1]:46212 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lehig-00049x-Oq
	for lists+qemu-devel@lfdr.de; Thu, 06 May 2021 13:23:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34782)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lehg6-0002qP-0f
 for qemu-devel@nongnu.org; Thu, 06 May 2021 13:20:46 -0400
Received: from indium.canonical.com ([91.189.90.7]:36914)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lehg1-0005IP-Ie
 for qemu-devel@nongnu.org; Thu, 06 May 2021 13:20:45 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.93 #5 (Debian))
 id 1lehfz-0006s7-Gk
 for <qemu-devel@nongnu.org>; Thu, 06 May 2021 17:20:39 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 7CA752E804B
 for <qemu-devel@nongnu.org>; Thu,  6 May 2021 17:20:39 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Thu, 06 May 2021 17:11:17 -0000
From: Thomas Huth <1880066@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Incomplete; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug: distribution=fedora; sourcepackage=qemu; component=None;
 status=New; importance=Undecided; assignee=None; 
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: csl-ubuntuone jrcichra th-huth
X-Launchpad-Bug-Reporter: Justin Cichra (jrcichra)
X-Launchpad-Bug-Modifier: Thomas Huth (th-huth)
References: <159011868752.31342.14577516157927235828.malonedeb@wampee.canonical.com>
Message-Id: <162032107732.14591.3185783527139237951.malone@soybean.canonical.com>
Subject: [Bug 1880066] Re: Microphone input dies in guest when switching evdev
 input
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="d6ba96cccb3d3e356754af3137c6128a6c17e2a8"; Instance="production"
X-Launchpad-Hash: b3c4f7f4beb072fcc376a68c1c6eb4d3d64b59a5
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
Reply-To: Bug 1880066 <1880066@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The QEMU project is currently moving its bug tracking to another system.
For this we need to know which bugs are still valid and which could be
closed already. Thus we are setting older bugs to "Incomplete" now.

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
matically to the new system.

Thank you and sorry for the inconvenience.


** Changed in: qemu
       Status: New =3D> Incomplete

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1880066

Title:
  Microphone input dies in guest when switching evdev input

Status in QEMU:
  Incomplete
Status in qemu package in Fedora:
  New

Bug description:
  justin@justin-3900x:~$ lsb_release -a
  No LSB modules are available.
  Distributor ID:	Ubuntu
  Description:	Ubuntu 20.04 LTS
  Release:	20.04
  Codename:	focal


  justin@justin-3900x:~$ apt list --installed | egrep '*qemu*|*kvm*'

  WARNING: apt does not have a stable CLI interface. Use with caution in
  scripts.

  ipxe-qemu-256k-compat-efi-roms/focal,focal,now 1.0.0+git-20150424.a25a16d=
-0ubuntu4 all [installed,automatic]
  ipxe-qemu/focal,focal,now 1.0.0+git-20190109.133f4c4-0ubuntu3 all [instal=
led,automatic]
  libvirt-daemon-driver-qemu/focal,now 6.0.0-0ubuntu8 amd64 [installed,auto=
matic]
  qemu-block-extra/focal-updates,focal-security,now 1:4.2-3ubuntu6.1 amd64 =
[installed,automatic]
  qemu-kvm/focal-updates,focal-security,now 1:4.2-3ubuntu6.1 amd64 [install=
ed]
  qemu-system-common/focal-updates,focal-security,now 1:4.2-3ubuntu6.1 amd6=
4 [installed,automatic]
  qemu-system-data/focal-updates,focal-updates,focal-security,focal-securit=
y,now 1:4.2-3ubuntu6.1 all [installed,automatic]
  qemu-system-gui/focal-updates,focal-security,now 1:4.2-3ubuntu6.1 amd64 [=
installed,automatic]
  qemu-system-x86/focal-updates,focal-security,now 1:4.2-3ubuntu6.1 amd64 [=
installed]
  qemu-utils/focal-updates,focal-security,now 1:4.2-3ubuntu6.1 amd64 [insta=
lled,automatic]
  qemu/focal-updates,focal-security,now 1:4.2-3ubuntu6.1 amd64 [installed]
  justin@justin-3900x:~$ =


  This did not happen in Eoan (qemu 4.0.0). I was able to switch in/out
  of a VM with my audio coming through fine. I enabled Eoan in my
  sources.list, downgraded all my qemu packages, and the issue was
  resolved.

  This happens on the latest Windows 10 guest when a sound device is
  listening for the microphone.

  /var/log/libvirt/qemu/<vmname>.log spews this error out when I switch
  with evdev (which is just the keyboard and mouse, the audio is passed
  through I assume spice):

  =

  audio: live=3D228193 hw->conv_buf->size=3D1920
  A bug was just triggered in audio_get_avail
  Context:
  audio: live=3D228675 sw->hw->conv_buf->size=3D1920
  A bug was just triggered in audio_pcm_hw_get_live_in
  Context:
  audio: live=3D228675 hw->conv_buf->size=3D1920
  A bug was just triggered in audio_get_avail
  Context:
  audio: live=3D229156 sw->hw->conv_buf->size=3D1920
  A bug was just triggered in audio_pcm_hw_get_live_in
  Context:
  audio: live=3D229156 hw->conv_buf->size=3D1920
  A bug was just triggered in audio_get_avail
  Context:
  audio: live=3D229638 sw->hw->conv_buf->size=3D1920
  A bug was just triggered in audio_pcm_hw_get_live_in
  Context:
  audio: live=3D229638 hw->conv_buf->size=3D1920
  A bug was just triggered in audio_get_avail
  Context:
  audio: live=3D230119 sw->hw->conv_buf->size=3D1920
  A bug was just triggered in audio_pcm_hw_get_live_in
  Context:
  audio: live=3D230119 hw->conv_buf->size=3D1920
  A bug was just triggered in audio_get_avail
  Context:
  audio: live=3D230600 sw->hw->conv_buf->size=3D1920
  A bug was just triggered in audio_pcm_hw_get_live_in
  Context:
  audio: live=3D230600 hw->conv_buf->size=3D1920
  A bug was just triggered in audio_get_avail
  Context:
  audio: live=3D231081 sw->hw->conv_buf->size=3D1920

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1880066/+subscriptions

