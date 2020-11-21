Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D4B252BC1FB
	for <lists+qemu-devel@lfdr.de>; Sat, 21 Nov 2020 21:12:30 +0100 (CET)
Received: from localhost ([::1]:57708 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kgZFF-0006aW-Td
	for lists+qemu-devel@lfdr.de; Sat, 21 Nov 2020 15:12:29 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40370)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1kgZDe-0005Fx-HD
 for qemu-devel@nongnu.org; Sat, 21 Nov 2020 15:10:50 -0500
Received: from indium.canonical.com ([91.189.90.7]:46258)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1kgZDZ-0005I8-7D
 for qemu-devel@nongnu.org; Sat, 21 Nov 2020 15:10:50 -0500
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1kgZDU-0003TJ-NG
 for <qemu-devel@nongnu.org>; Sat, 21 Nov 2020 20:10:40 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 9ECC22E813C
 for <qemu-devel@nongnu.org>; Sat, 21 Nov 2020 20:10:40 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Sat, 21 Nov 2020 20:01:21 -0000
From: Justin Cichra <1880066@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=New; importance=Undecided; assignee=None;
X-Launchpad-Bug: distribution=fedora; sourcepackage=qemu; component=None;
 status=New; importance=Undecided; assignee=None; 
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: csl-ubuntuone jrcichra
X-Launchpad-Bug-Reporter: Justin Cichra (jrcichra)
X-Launchpad-Bug-Modifier: Justin Cichra (jrcichra)
References: <159011868752.31342.14577516157927235828.malonedeb@wampee.canonical.com>
Message-Id: <160598888157.23550.9646665329874906602.malone@chaenomeles.canonical.com>
Subject: [Bug 1880066] Re: Microphone input dies in guest when switching evdev
 input
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="c35ff22711d15549e2303ae18ae521fd91f6bf00"; Instance="production"
X-Launchpad-Hash: 117ec269abef298c292695da606571eceda61fc6
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

I upgraded to Ubuntu 20.10 (Groovy Gorilla) and the issue was resolved.

Here's a list of relevant package versions:

root@justin-3900x:/home/justin# apt list --installed | grep virt
(etc...)

WARNING: apt does not have a stable CLI interface. Use with caution in
scripts.

gir1.2-libvirt-glib-1.0/groovy,now 3.0.0-1 amd64 [installed,automatic]
libgovirt-common/groovy,groovy,now 0.3.7-1 all [installed,automatic]
libgovirt2/groovy,now 0.3.7-1 amd64 [installed,automatic]
libqt5virtualkeyboard5/groovy,now 5.14.2+dfsg-2 amd64 [installed,automatic]
libsys-virt-perl/groovy,now 6.3.0-1 amd64 [installed,automatic]
libvirt-clients/groovy-updates,now 6.6.0-1ubuntu3.1 amd64 [installed,automa=
tic]
libvirt-daemon-driver-qemu/groovy-updates,now 6.6.0-1ubuntu3.1 amd64 [insta=
lled,automatic]
libvirt-daemon-driver-storage-zfs/groovy-updates,now 6.6.0-1ubuntu3.1 amd64=
 [installed]
libvirt-daemon-system-systemd/groovy-updates,now 6.6.0-1ubuntu3.1 amd64 [in=
stalled,automatic]
libvirt-daemon-system/groovy-updates,now 6.6.0-1ubuntu3.1 amd64 [installed,=
automatic]
libvirt-daemon/groovy-updates,now 6.6.0-1ubuntu3.1 amd64 [installed,automat=
ic]
libvirt-glib-1.0-0/groovy,now 3.0.0-1 amd64 [installed,automatic]
libvirt0/groovy-updates,now 6.6.0-1ubuntu3.1 amd64 [installed,automatic]
python3-libvirt/groovy,now 6.1.0-1 amd64 [installed,automatic]
qml-module-qtquick-virtualkeyboard/groovy,now 5.14.2+dfsg-2 amd64 [installe=
d,automatic]
qtvirtualkeyboard-plugin/groovy,now 5.14.2+dfsg-2 amd64 [installed,automati=
c]
ruby-fog-libvirt/groovy,groovy,now 0.6.0-1 all [installed,automatic]
ruby-libvirt/groovy,now 0.7.1-1build1 amd64 [installed,automatic]
vagrant-libvirt/groovy,groovy,now 0.1.2-1 all [installed,automatic]
virt-manager/groovy,groovy,now 1:2.2.1-4ubuntu2 all [installed]
virt-p2v/groovy,now 1.42.0-2 amd64 [installed,automatic]
virt-viewer/groovy,now 7.0-2build1 amd64 [installed,automatic]
virtinst/groovy,groovy,now 1:2.2.1-4ubuntu2 all [installed,automatic]
qemu-kvm/groovy,now 1:5.0-5ubuntu9 amd64 [installed]
ipxe-qemu-256k-compat-efi-roms/groovy,groovy,now 1.0.0+git-20150424.a25a16d=
-0ubuntu4 all [installed,automatic]
ipxe-qemu/groovy,groovy,now 1.0.0+git-20190125.36a4c85-5ubuntu3 all [instal=
led,automatic]
libvirt-daemon-driver-qemu/groovy-updates,now 6.6.0-1ubuntu3.1 amd64 [insta=
lled,automatic]
qemu-block-extra/groovy,now 1:5.0-5ubuntu9 amd64 [installed,automatic]
qemu-efi-aarch64/groovy,groovy,now 2020.05-5 all [installed,automatic]
qemu-efi-arm/groovy,groovy,now 2020.05-5 all [installed,automatic]
qemu-kvm/groovy,now 1:5.0-5ubuntu9 amd64 [installed]
qemu-system-arm/groovy,now 1:5.0-5ubuntu9 amd64 [installed]
qemu-system-common/groovy,now 1:5.0-5ubuntu9 amd64 [installed,automatic]
qemu-system-data/groovy,groovy,now 1:5.0-5ubuntu9 all [installed,automatic]
qemu-system-gui/groovy,now 1:5.0-5ubuntu9 amd64 [installed,automatic]
qemu-system-x86/groovy,now 1:5.0-5ubuntu9 amd64 [installed]
qemu-user-static/groovy,now 1:5.0-5ubuntu9 amd64 [installed]
qemu-utils/groovy,now 1:5.0-5ubuntu9 amd64 [installed,automatic]
qemu/groovy,now 1:5.0-5ubuntu9 amd64 [installed]

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1880066

Title:
  Microphone input dies in guest when switching evdev input

Status in QEMU:
  New
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

