Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 772703725F0
	for <lists+qemu-devel@lfdr.de>; Tue,  4 May 2021 08:49:10 +0200 (CEST)
Received: from localhost ([::1]:45644 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ldorl-0004cT-It
	for lists+qemu-devel@lfdr.de; Tue, 04 May 2021 02:49:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60972)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1ldo1A-0006sl-As
 for qemu-devel@nongnu.org; Tue, 04 May 2021 01:54:48 -0400
Received: from indium.canonical.com ([91.189.90.7]:49182)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1ldo16-0005RM-9P
 for qemu-devel@nongnu.org; Tue, 04 May 2021 01:54:48 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1ldo11-0002ZZ-RF
 for <qemu-devel@nongnu.org>; Tue, 04 May 2021 05:54:39 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 948772E81A2
 for <qemu-devel@nongnu.org>; Tue,  4 May 2021 05:54:39 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Tue, 04 May 2021 05:44:38 -0000
From: Thomas Huth <1424237@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Expired; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug: distribution=ubuntu; sourcepackage=qemu; component=main;
 status=Confirmed; importance=Wishlist; assignee=None; 
X-Launchpad-Bug-Tags: amd64 apport-bug third-party-packages utopic
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: krichter722 th-huth
X-Launchpad-Bug-Reporter: Karl-Philipp Richter (krichter722)
X-Launchpad-Bug-Modifier: Thomas Huth (th-huth)
References: <20150221185323.32257.65910.malonedeb@chaenomeles.canonical.com>
Message-Id: <162010707859.4685.882740317773333633.malone@chaenomeles.canonical.com>
Subject: [Bug 1424237] Re: missing manpage for bridge.conf
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="02afa4875ac52c169f5cddf0d1bcdd6e149a3754"; Instance="production"
X-Launchpad-Hash: 7f910580e20e97c35becd5aebc93a21919a5465c
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
Reply-To: Bug 1424237 <1424237@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This is an automated cleanup. This bug report has been moved to QEMU's
new bug tracker on gitlab.com and thus gets marked as 'expired' now.
Please continue with the discussion here:

 https://gitlab.com/qemu-project/qemu/-/issues/113


** Changed in: qemu
       Status: New =3D> Expired

** Bug watch added: gitlab.com/qemu-project/qemu/-/issues #113
   https://gitlab.com/qemu-project/qemu/-/issues/113

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1424237

Title:
  missing manpage for bridge.conf

Status in QEMU:
  Expired
Status in qemu package in Ubuntu:
  Confirmed

Bug description:
  There's currently no (easy) way to figure out the form of content of
  `/etc/qemu/bridge.conf`. Some howtos (e.g.
  https://wiki.archlinux.org/index.php/QEMU
  #Bridged_networking_using_qemu-bridge-helper) mention
  `bridge.conf.sample` which is not available according to `apt-file`
  and the official wiki at wiki.qemu.org doesn't mention the file at
  all, it seems necessary, though, because specification of `-net nic
  -net bridge,br=3Dbridge0` fails with `failed to get mtu of bridge
  `bridge0': No such device` (can't be investigated further because
  setup is completely unclear).

  ProblemType: Bug
  DistroRelease: Ubuntu 14.10
  Package: qemu 2.1+dfsg-4ubuntu6.4
  Uname: Linux 3.19.0-031900-generic x86_64
  ApportVersion: 2.14.7-0ubuntu8.2
  Architecture: amd64
  CurrentDesktop: Unity
  Date: Sat Feb 21 19:39:07 2015
  EcryptfsInUse: Yes
  InstallationDate: Installed on 2015-01-26 (25 days ago)
  InstallationMedia: Ubuntu 14.10 "Utopic Unicorn" - Release amd64 (2014102=
2.1)
  KvmCmdLine:
   COMMAND         STAT  EUID  RUID   PID  PPID %CPU COMMAND
   kvm-irqfd-clean S<       0     0  1026     2  0.0 [kvm-irqfd-clean]
   qemu-system-x86 Sl+      0     0 25905 25904 11.9 qemu-system-x86_64 -bo=
ot c -hda ubuntu.img -m 2048 -smp 16 -enable-kvm -vnc :0,abc -k de -drive f=
ile=3D/dev/sda14,if=3Dide -net nic -net bridge,br=3Dbridge0
   kvm-pit/25905   S        0     0 25948     2  0.0 [kvm-pit/25905]
  MachineType: LENOVO 20221
  ProcEnviron:
   TERM=3Dxterm
   PATH=3D(custom, no user)
   XDG_RUNTIME_DIR=3D<set>
   LANG=3Dde_DE.UTF-8
   SHELL=3D/bin/bash
  ProcKernelCmdLine: BOOT_IMAGE=3D/vmlinuz-3.19.0-031900-generic root=3DUUI=
D=3Dac20c93a-0ec5-445a-98cd-941f0fbc0e50 ro rootflags=3Dsubvol=3D@
  SourcePackage: qemu
  UpgradeStatus: No upgrade log present (probably fresh install)
  dmi.bios.date: 07/12/2013
  dmi.bios.vendor: LENOVO
  dmi.bios.version: 71CN51WW(V1.21)
  dmi.board.asset.tag: No Asset Tag
  dmi.board.name: INVALID
  dmi.board.vendor: LENOVO
  dmi.board.version: 31900003WIN8 STD MLT
  dmi.chassis.asset.tag: No Asset Tag
  dmi.chassis.type: 10
  dmi.chassis.vendor: LENOVO
  dmi.chassis.version: Lenovo IdeaPad Z500 Touch
  dmi.modalias: dmi:bvnLENOVO:bvr71CN51WW(V1.21):bd07/12/2013:svnLENOVO:pn2=
0221:pvrLenovoIdeaPadZ500Touch:rvnLENOVO:rnINVALID:rvr31900003WIN8STDMLT:cv=
nLENOVO:ct10:cvrLenovoIdeaPadZ500Touch:
  dmi.product.name: 20221
  dmi.product.version: Lenovo IdeaPad Z500 Touch
  dmi.sys.vendor: LENOVO

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1424237/+subscriptions

