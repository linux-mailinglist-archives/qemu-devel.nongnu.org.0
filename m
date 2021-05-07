Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 24C2F3764E1
	for <lists+qemu-devel@lfdr.de>; Fri,  7 May 2021 14:07:07 +0200 (CEST)
Received: from localhost ([::1]:54164 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lezG5-0003Z0-N8
	for lists+qemu-devel@lfdr.de; Fri, 07 May 2021 08:07:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51422)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lezF1-00037Q-PM
 for qemu-devel@nongnu.org; Fri, 07 May 2021 08:05:59 -0400
Received: from indium.canonical.com ([91.189.90.7]:35002)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lezEz-0004l5-H4
 for qemu-devel@nongnu.org; Fri, 07 May 2021 08:05:59 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.93 #5 (Debian))
 id 1lezEw-0007JI-BI
 for <qemu-devel@nongnu.org>; Fri, 07 May 2021 12:05:54 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id F0D252E8194
 for <qemu-devel@nongnu.org>; Fri,  7 May 2021 12:05:53 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Fri, 07 May 2021 11:55:41 -0000
From: Justin Cichra <1880066@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Fix Released; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug: distribution=fedora; sourcepackage=qemu; component=None;
 status=Fix Released; importance=Undecided; assignee=None; 
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: csl-ubuntuone jrcichra th-huth
X-Launchpad-Bug-Reporter: Justin Cichra (jrcichra)
X-Launchpad-Bug-Modifier: Justin Cichra (jrcichra)
References: <159011868752.31342.14577516157927235828.malonedeb@wampee.canonical.com>
Message-Id: <162038854157.4018.3602861275022990647.malone@gac.canonical.com>
Subject: [Bug 1880066] Re: Microphone input dies in guest when switching evdev
 input
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="d6ba96cccb3d3e356754af3137c6128a6c17e2a8"; Instance="production"
X-Launchpad-Hash: bdc2233692413e1ac840712a18bd60286f184b03
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
Reply-To: Bug 1880066 <1880066@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Was fixed when moving to QEMU 5.x in Ubuntu 20.10.

** Changed in: qemu
       Status: Incomplete =3D> Fix Released

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1880066

Title:
  Microphone input dies in guest when switching evdev input

Status in QEMU:
  Fix Released
Status in qemu package in Fedora:
  Fix Released

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

