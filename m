Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CE40F368708
	for <lists+qemu-devel@lfdr.de>; Thu, 22 Apr 2021 21:17:28 +0200 (CEST)
Received: from localhost ([::1]:57024 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lZepF-0004j2-G3
	for lists+qemu-devel@lfdr.de; Thu, 22 Apr 2021 15:17:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50432)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lZelv-00030F-7W
 for qemu-devel@nongnu.org; Thu, 22 Apr 2021 15:13:55 -0400
Received: from indium.canonical.com ([91.189.90.7]:47846)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lZels-0007Ka-AP
 for qemu-devel@nongnu.org; Thu, 22 Apr 2021 15:13:55 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1lZelq-0002ri-71
 for <qemu-devel@nongnu.org>; Thu, 22 Apr 2021 19:13:50 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 78E6C2E8161
 for <qemu-devel@nongnu.org>; Thu, 22 Apr 2021 19:13:49 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Thu, 22 Apr 2021 17:25:29 -0000
From: Thomas Huth <1395217@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Incomplete; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: a357823044 bonzini crobinso ehabkost jan-vlug
 muenk tadawson th-huth
X-Launchpad-Bug-Reporter: Tim Dawson (tadawson)
X-Launchpad-Bug-Modifier: Thomas Huth (th-huth)
References: <20141121223040.7362.48987.malonedeb@gac.canonical.com>
Message-Id: <161911232999.6350.11464813063863265190.launchpad@chaenomeles.canonical.com>
Subject: [Bug 1395217] Re: Networking in qemu 2.0.0 and beyond is not
 compatible with Open Solaris (Illumos) 5.11
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="1552fceb1603b3da6cfa437575d9c9fc4b2e683a"; Instance="production"
X-Launchpad-Hash: 218f67b98dcafedca07a629d885a7a5fbaff49f3
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
Reply-To: Bug 1395217 <1395217@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

** Bug watch removed: Red Hat Bugzilla #1040500
   https://bugzilla.redhat.com/show_bug.cgi?id=3D1040500

** Bug watch removed: Red Hat Bugzilla #1262093
   https://bugzilla.redhat.com/show_bug.cgi?id=3D1262093

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1395217

Title:
  Networking in qemu 2.0.0 and beyond is not compatible with Open
  Solaris (Illumos) 5.11

Status in QEMU:
  Incomplete

Bug description:
  The networking code in qemu in versions 2.0.0 and beyond is non-
  functional with Solaris/Illumos 5.11 images.

  Building 1.7.1, 2.0.0, 2.0.2, 2.1.2,and 2.2.0rc1with the following
  standard Slackware config:

  # From Slackware build tree . . . =

  ./configure \
    --prefix=3D/usr \
    --libdir=3D/usr/lib64 \
    --sysconfdir=3D/etc \
    --localstatedir=3D/var \
    --enable-gtk \
    --enable-system \
    --enable-kvm \
    --disable-debug-info \
    --enable-virtfs \
    --enable-sdl \
    --audio-drv-list=3Dalsa,oss,sdl,esd \
    --enable-libusb \
    --disable-vnc \
    --target-list=3Dx86_64-linux-user,i386-linux-user,x86_64-softmmu,i386-s=
oftmmu \
    --enable-spice \
    --enable-usb-redir =


  =

  And attempting to run the same VM image with the following command (or vi=
a virt-manager):

  macaddress=3D"DE:AD:BE:EF:3F:A4"

  qemu-system-x86_64 nex4x -cdrom /dev/cdrom -name "Nex41" -cpu Westmere
  -machine accel=3Dkvm -smp 2 -m 4000 -net nic,macaddr=3D$macaddress  -net =
bridge,br=3Db
  r0 -net dump,file=3D/usr1/tmp/<FILENAME> -drive file=3Dnex4x_d1 -drive fi=
le=3Dnex4x_d2
   -enable-kvm

  Gives success on 1.7.1, and a deaf VM on all subsequent versions.

  Notable in validating my config, is that a Windows 7 image runs
  cleanly with networking on *all* builds, so my configuration appears
  to be good - qemu just hates Solaris at this point.

  Watching with wireshark (as well as pulling network traces from qemu
  as noted above) it appears that the notable difference in the two
  configs is that for some reason, Solaris gets stuck arping for it's
  own interface on startup, and never really comes on line on the
  network.  If other hosts attempt to ping the Solaris instance, they
  can successfully arp the bad VM, but not the other way around.

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1395217/+subscriptions

