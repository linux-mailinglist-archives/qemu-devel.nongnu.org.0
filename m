Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C629E35774D
	for <lists+qemu-devel@lfdr.de>; Thu,  8 Apr 2021 00:02:06 +0200 (CEST)
Received: from localhost ([::1]:54604 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lUGFR-0007rX-BW
	for lists+qemu-devel@lfdr.de; Wed, 07 Apr 2021 18:02:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52104)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lUGEV-0007Qm-RI
 for qemu-devel@nongnu.org; Wed, 07 Apr 2021 18:01:07 -0400
Received: from indium.canonical.com ([91.189.90.7]:36762)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lUGEI-0006AE-JD
 for qemu-devel@nongnu.org; Wed, 07 Apr 2021 18:01:07 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1lUGEF-0000sf-DT
 for <qemu-devel@nongnu.org>; Wed, 07 Apr 2021 22:00:51 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 4C1C62E8165
 for <qemu-devel@nongnu.org>; Wed,  7 Apr 2021 22:00:51 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Wed, 07 Apr 2021 21:54:05 -0000
From: Igor <1915063@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=New; importance=Undecided; assignee=None;
X-Launchpad-Bug: distribution=ubuntu; sourcepackage=qemu; component=main;
 status=Confirmed; importance=Undecided; assignee=None; 
X-Launchpad-Bug-Tags: apport-collected focal
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: dober60 imammedo markrhpearson paelzer sergiodj
 ubuntu-kernel-bot
X-Launchpad-Bug-Reporter: David Ober (dober60)
X-Launchpad-Bug-Modifier: Igor (imammedo)
References: <161281335451.16853.7070328699645987751.malonedeb@wampee.canonical.com>
 <161780042380.29247.4415481924442945799.malone@gac.canonical.com>
Message-Id: <20210407235405.584ec68e@redhat.com>
Subject: Re: [Bug 1915063] Re: Windows 10 wil not install using
 qemu-system-x86_64
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="57f1f603f707b9cfa764cae8dd0f3999026b4763"; Instance="production"
X-Launchpad-Hash: 4c8c47cc2013c8e3a378ace66509b4c5837b005d
Received-SPF: none client-ip=91.189.90.7; envelope-from=bounces@canonical.com;
 helo=indium.canonical.com
X-Spam_score_int: -65
X-Spam_score: -6.6
X-Spam_bar: ------
X-Spam_report: (-6.6 / 5.0 requ) BAYES_00=-1.9,
 HEADER_FROM_DIFFERENT_DOMAINS=0.249, RCVD_IN_DNSWL_HI=-5,
 RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=unavailable autolearn_force=no
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
Reply-To: Bug 1915063 <1915063@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, 07 Apr 2021 13:00:23 -0000
David Ober <1915063@bugs.launchpad.net> wrote:

> I have not done any of what you are asking so not exactly sure how to
> change those values, been looking and reading but not finding what I
> want so thought it might be better to just ask how to do what yo are
> asking.

see https://libvirt.org/formatdomain.html#cpu-model-and-topology
for the way to describe topology in domain xml.
Pick a real AMD CPU for cpu model you're are having problem with,
and use its config to define topology.

> I did try CPU type EPYC and that did get past the error I am
> seeing on install
So it works with EPYC but not with ECPY-Rome, then probably topology
is not issue.

CCing Babu,
who added EPYC-Rome cpu model, maybe he can help

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1915063

Title:
  Windows 10 wil not install using qemu-system-x86_64

Status in QEMU:
  New
Status in qemu package in Ubuntu:
  Confirmed

Bug description:
  Steps to reproduce
  install virt-manager and ovmf if nopt already there
  copy windows and virtio iso files to /var/lib/libvirt/images

  Use virt-manager from local machine to create your VMs with the disk, CPU=
s and memory required
      Select customize configuration then select OVMF(UEFI) instead of seab=
ios
      set first CDROM to the windows installation iso (enable in boot optio=
ns)
      add a second CDROM and load with the virtio iso
  	change spice display to VNC

    Always get a security error from windows and it fails to launch the ins=
taller (works on RHEL and Fedora)
  I tried updating the qemu version from Focals 4.2 to Groovy 5.0 which was=
 of no help
  --- =

  ProblemType: Bug
  ApportVersion: 2.20.11-0ubuntu27.14
  Architecture: amd64
  CasperMD5CheckResult: skip
  CurrentDesktop: ubuntu:GNOME
  DistributionChannelDescriptor:
   # This is the distribution channel descriptor for the OEM CDs
   # For more information see http://wiki.ubuntu.com/DistributionChannelDes=
criptor
   canonical-oem-sutton-focal-amd64-20201030-422+pc-sutton-bachman-focal-am=
d64+X00
  DistroRelease: Ubuntu 20.04
  InstallationDate: Installed on 2021-01-20 (19 days ago)
  InstallationMedia: Ubuntu 20.04 "Focal" - Build amd64 LIVE Binary 2020103=
0-14:39
  MachineType: LENOVO 30E102Z
  NonfreeKernelModules: nvidia_modeset nvidia
  Package: linux (not installed)
  ProcEnviron:
   TERM=3Dxterm-256color
   PATH=3D(custom, no user)
   XDG_RUNTIME_DIR=3D<set>
   LANG=3Den_US.UTF-8
   SHELL=3D/bin/bash
  ProcFB: 0 EFI VGA
  ProcKernelCmdLine: BOOT_IMAGE=3D/boot/vmlinuz-5.6.0-1042-oem root=3DUUID=
=3D389cd165-fc52-4814-b837-a1090b9c2387 ro locale=3Den_US quiet splash vt.h=
andoff=3D7
  ProcVersionSignature: Ubuntu 5.6.0-1042.46-oem 5.6.19
  RelatedPackageVersions:
   linux-restricted-modules-5.6.0-1042-oem N/A
   linux-backports-modules-5.6.0-1042-oem  N/A
   linux-firmware                          1.187.8
  RfKill:
   =

  Tags:  focal
  Uname: Linux 5.6.0-1042-oem x86_64
  UpgradeStatus: No upgrade log present (probably fresh install)
  UserGroups: adm cdrom dip docker kvm libvirt lpadmin plugdev sambashare s=
udo
  _MarkForUpload: True
  dmi.bios.date: 07/29/2020
  dmi.bios.vendor: LENOVO
  dmi.bios.version: S07KT08A
  dmi.board.name: 1046
  dmi.board.vendor: LENOVO
  dmi.board.version: Not Defined
  dmi.chassis.type: 3
  dmi.chassis.vendor: LENOVO
  dmi.chassis.version: None
  dmi.modalias: dmi:bvnLENOVO:bvrS07KT08A:bd07/29/2020:svnLENOVO:pn30E102Z:=
pvrThinkStationP620:rvnLENOVO:rn1046:rvrNotDefined:cvnLENOVO:ct3:cvrNone:
  dmi.product.family: INVALID
  dmi.product.name: 30E102Z
  dmi.product.sku: LENOVO_MT_30E1_BU_Think_FM_ThinkStation P620
  dmi.product.version: ThinkStation P620
  dmi.sys.vendor: LENOVO

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1915063/+subscriptions

