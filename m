Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DCDBD34A312
	for <lists+qemu-devel@lfdr.de>; Fri, 26 Mar 2021 09:17:34 +0100 (CET)
Received: from localhost ([::1]:50132 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lPhev-0002b5-WE
	for lists+qemu-devel@lfdr.de; Fri, 26 Mar 2021 04:17:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59264)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lPhdU-0001mj-Vk
 for qemu-devel@nongnu.org; Fri, 26 Mar 2021 04:16:04 -0400
Received: from indium.canonical.com ([91.189.90.7]:50010)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lPhdS-0001j4-BZ
 for qemu-devel@nongnu.org; Fri, 26 Mar 2021 04:16:04 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1lPhdP-0007pZ-6D
 for <qemu-devel@nongnu.org>; Fri, 26 Mar 2021 08:15:59 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id E104B2E8162
 for <qemu-devel@nongnu.org>; Fri, 26 Mar 2021 08:15:58 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Fri, 26 Mar 2021 08:02:07 -0000
From: Frank Heimes <1921468@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=ubuntu-z-systems; status=New; importance=Medium;
 assignee=skipper-screen-team; 
X-Launchpad-Bug: distribution=ubuntu; sourcepackage=qemu; component=main;
 status=New; importance=Medium; assignee=canonical-server; 
X-Launchpad-Bug-Tags: architecture-s39064 bugnameltc-192200 severity-medium
 targetmilestone-inin20042
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: bugproxy
X-Launchpad-Bug-Reporter: bugproxy (bugproxy)
X-Launchpad-Bug-Modifier: Frank Heimes (fheimes)
References: <161674556672.2057.41866461498404333.malonedeb@chaenomeles.canonical.com>
Message-Id: <161674572792.19042.14927547035209879463.launchpad@gac.canonical.com>
Subject: [Bug 1921468] Re: [UBUNTU 20.04] KVM guest fails to find zipl boot
 menu index
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="21fefc602783aa4ba863a4a6c29d38d788ce04ad"; Instance="production"
X-Launchpad-Hash: 8d16941ec8f523b05de5e8673de23f7f4c3fd7eb
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
Reply-To: Bug 1921468 <1921468@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

** Also affects: qemu
   Importance: Undecided
       Status: New

** No longer affects: qemu

** Also affects: ubuntu-z-systems
   Importance: Undecided
       Status: New

** Changed in: ubuntu-z-systems
     Assignee: (unassigned) =3D> Skipper Bug Screeners (skipper-screen-team)

** Changed in: qemu (Ubuntu)
     Assignee: Skipper Bug Screeners (skipper-screen-team) =3D> Canonical S=
erver Team (canonical-server)

** Changed in: ubuntu-z-systems
   Importance: Undecided =3D> Medium

** Changed in: qemu (Ubuntu)
   Importance: Undecided =3D> Medium

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1921468

Title:
  [UBUNTU 20.04] KVM guest fails to find zipl boot menu index

Status in Ubuntu on IBM z Systems:
  New
Status in qemu package in Ubuntu:
  New

Bug description:
  ---Problem Description---
  A KVM guest fails to find the zipl boot menu index if the "zIPL" magic va=
lue is listed at the end of a disk block. =

   =

  ---System Hang---
  System sits in disabled wait, last console display
  LOADPARM=3D[        ]
  Using virtio-blk.
  Using ECKD scheme (block size  4096), CDL
  VOLSER=3D[0X0067]
   =

   =

  ---Steps to Reproduce---
  1. Install Distro KVM guest from ISO on a DASD, e.g. using virt-install, =
my invocation was =

  $ virt-install --name secguest2 --memory 2048 --disk path=3D/dev/disk/by-=
path/ccw-0.0.af6a --cdrom /var/lib/libvirt/images/xxxxxx.iso

  2. Select DHCP networking and ASCII console, and accept all defaults
  of the installer

  3. Let the installer reboot after the installation completes

  It is possible to recover by editing the domain XML with an explicit load=
parm to select a boot menu entry. E.g. I changed the disk definition to
     <disk type=3D'block' device=3D'disk'>
        <driver name=3D'qemu' type=3D'raw' cache=3D'none' io=3D'native'/>
        <source dev=3D'/dev/disk/by-path/ccw-0.0.af6a'/>
        <target dev=3D'vda' bus=3D'virtio'/>
        <boot order=3D'1' loadparm=3D'1'/>
        <address type=3D'ccw' cssid=3D'0xfe' ssid=3D'0x0' devno=3D'0xaf6a'/>
      </disk>

  The patches are now upstream:
  5f97ba0c74cc ("pc-bios/s390-ccw: fix off-by-one error")
  468184ec9024 ("pc-bios/s390-ccw: break loop if a null block number is rea=
ched")

  Current versions of qemu within Ubuntu

  focal (20.04LTS) 1:4.2-3ubuntu6 [ports]: arm64 armhf ppc64el s390x
  focal-updates (metapackages): 1:4.2-3ubuntu6.14: amd64 arm64 armhf ppc64e=
l s390x

  groovy (20.10) (metapackages): 1:5.0-5ubuntu9 [ports]: arm64 armhf ppc64e=
l s390x
  groovy-updates (metapackages): 1:5.0-5ubuntu9.6: amd64 arm64 armhf ppc64e=
l s390x

  hirsute (metapackages): 1:5.2+dfsg-9ubuntu1: amd64 arm64 armhf ppc64el
  s390x

  =

  git-commits will apply seamlessley for the requested levels if not alread=
y integrated

To manage notifications about this bug go to:
https://bugs.launchpad.net/ubuntu-z-systems/+bug/1921468/+subscriptions

