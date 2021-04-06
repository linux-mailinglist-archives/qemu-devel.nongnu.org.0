Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E385B3556EB
	for <lists+qemu-devel@lfdr.de>; Tue,  6 Apr 2021 16:44:58 +0200 (CEST)
Received: from localhost ([::1]:60234 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lTmwr-000498-VR
	for lists+qemu-devel@lfdr.de; Tue, 06 Apr 2021 10:44:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46286)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lTmvZ-0002rE-Pn
 for qemu-devel@nongnu.org; Tue, 06 Apr 2021 10:43:39 -0400
Received: from indium.canonical.com ([91.189.90.7]:43966)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lTmvQ-0002zJ-76
 for qemu-devel@nongnu.org; Tue, 06 Apr 2021 10:43:35 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1lTmvL-0005xC-Vv
 for <qemu-devel@nongnu.org>; Tue, 06 Apr 2021 14:43:24 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 609132E81BB
 for <qemu-devel@nongnu.org>; Tue,  6 Apr 2021 14:43:18 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Tue, 06 Apr 2021 14:07:59 -0000
From: =?utf-8?q?Christian_Ehrhardt_=EE=83=BF?= <1915063@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=New; importance=Undecided; assignee=None;
X-Launchpad-Bug: distribution=ubuntu; sourcepackage=qemu; component=main;
 status=Confirmed; importance=Undecided; assignee=None; 
X-Launchpad-Bug-Tags: apport-collected focal
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: dober60 markrhpearson paelzer sergiodj
 ubuntu-kernel-bot
X-Launchpad-Bug-Reporter: David Ober (dober60)
X-Launchpad-Bug-Modifier: =?utf-8?q?Christian_Ehrhardt_=EE=83=BF_=28paelzer?=
 =?utf-8?q?=29?=
References: <161281335451.16853.7070328699645987751.malonedeb@wampee.canonical.com>
Message-Id: <161771807940.23668.16574938836562961591.malone@chaenomeles.canonical.com>
Subject: [Bug 1915063] Re: Windows 10 wil not install using qemu-system-x86_64
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="57f1f603f707b9cfa764cae8dd0f3999026b4763"; Instance="production"
X-Launchpad-Hash: d7c52bfb9a22518789f0445c7a9d888507283d65
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
Reply-To: Bug 1915063 <1915063@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Ok, so you should be able to drop these lines one by one:

      <feature policy=3D'require' name=3D'x2apic'/>
      <feature policy=3D'require' name=3D'tsc-deadline'/>
      <feature policy=3D'require' name=3D'hypervisor'/>
      <feature policy=3D'require' name=3D'tsc_adjust'/>
      <feature policy=3D'require' name=3D'stibp'/>
      <feature policy=3D'require' name=3D'arch-capabilities'/>
      <feature policy=3D'require' name=3D'ssbd'/>
      <feature policy=3D'require' name=3D'xsaves'/>
      <feature policy=3D'require' name=3D'cmp_legacy'/>
      <feature policy=3D'require' name=3D'invtsc'/>
      <feature policy=3D'require' name=3D'amd-ssbd'/>
      <feature policy=3D'require' name=3D'virt-ssbd'/>
      <feature policy=3D'require' name=3D'rdctl-no'/>
      <feature policy=3D'require' name=3D'skip-l1dfl-vmentry'/>
      <feature policy=3D'require' name=3D'mds-no'/>
      <feature policy=3D'require' name=3D'pschange-mc-no'/>

If that does not yet make it work, add those one by one (removing the featu=
res of the named type)
    <feature policy=3D'disable' name=3D'3dnowprefetch'/>
    <feature policy=3D'disable' name=3D'abm'/>
    <feature policy=3D'disable' name=3D'adx'/>
    <feature policy=3D'disable' name=3D'aes'/>
    <feature policy=3D'disable' name=3D'amd-stibp'/>
    <feature policy=3D'disable' name=3D'apic'/>
    <feature policy=3D'disable' name=3D'arat'/>
    <feature policy=3D'disable' name=3D'avx'/>
    <feature policy=3D'disable' name=3D'avx2'/>
    <feature policy=3D'disable' name=3D'bmi1'/>
    <feature policy=3D'disable' name=3D'bmi2'/>
    <feature policy=3D'disable' name=3D'clflush'/>
    <feature policy=3D'disable' name=3D'clflushopt'/>
    <feature policy=3D'disable' name=3D'clwb'/>
    <feature policy=3D'disable' name=3D'clzero'/>
    <feature policy=3D'disable' name=3D'cmov'/>
    <feature policy=3D'disable' name=3D'cr8legacy'/>
    <feature policy=3D'disable' name=3D'cx16'/>
    <feature policy=3D'disable' name=3D'cx8'/>
    <feature policy=3D'disable' name=3D'de'/>
    <feature policy=3D'disable' name=3D'f16c'/>
    <feature policy=3D'disable' name=3D'fma'/>
    <feature policy=3D'disable' name=3D'fpu'/>
    <feature policy=3D'disable' name=3D'fsgsbase'/>
    <feature policy=3D'disable' name=3D'fxsr'/>
    <feature policy=3D'disable' name=3D'fxsr_opt'/>
    <feature policy=3D'disable' name=3D'ibpb'/>
    <feature policy=3D'disable' name=3D'lahf_lm'/>
    <feature policy=3D'disable' name=3D'lm'/>
    <feature policy=3D'disable' name=3D'mca'/>
    <feature policy=3D'disable' name=3D'mce'/>
    <feature policy=3D'disable' name=3D'misalignsse'/>
    <feature policy=3D'disable' name=3D'mmx'/>
    <feature policy=3D'disable' name=3D'mmxext'/>
    <feature policy=3D'disable' name=3D'movbe'/>
    <feature policy=3D'disable' name=3D'msr'/>
    <feature policy=3D'disable' name=3D'mtrr'/>
    <feature policy=3D'disable' name=3D'npt'/>
    <feature policy=3D'disable' name=3D'nrip-save'/>
    <feature policy=3D'disable' name=3D'nx'/>
    <feature policy=3D'disable' name=3D'osvw'/>
    <feature policy=3D'disable' name=3D'pae'/>
    <feature policy=3D'disable' name=3D'pat'/>
    <feature policy=3D'disable' name=3D'pclmuldq'/>
    <feature policy=3D'disable' name=3D'pdpe1gb'/>
    <feature policy=3D'disable' name=3D'perfctr_core'/>
    <feature policy=3D'disable' name=3D'pge'/>
    <feature policy=3D'disable' name=3D'pni'/>
    <feature policy=3D'disable' name=3D'popcnt'/>
    <feature policy=3D'disable' name=3D'pse'/>
    <feature policy=3D'disable' name=3D'pse36'/>
    <feature policy=3D'disable' name=3D'rdpid'/>
    <feature policy=3D'disable' name=3D'rdrand'/>
    <feature policy=3D'disable' name=3D'rdseed'/>
    <feature policy=3D'disable' name=3D'rdtscp'/>
    <feature policy=3D'disable' name=3D'sep'/>
    <feature policy=3D'disable' name=3D'sha-ni'/>
    <feature policy=3D'disable' name=3D'smap'/>
    <feature policy=3D'disable' name=3D'smep'/>
    <feature policy=3D'disable' name=3D'sse'/>
    <feature policy=3D'disable' name=3D'sse2'/>
    <feature policy=3D'disable' name=3D'sse4.1'/>
    <feature policy=3D'disable' name=3D'sse4.2'/>
    <feature policy=3D'disable' name=3D'sse4a'/>
    <feature policy=3D'disable' name=3D'ssse3'/>
    <feature policy=3D'disable' name=3D'svm'/>
    <feature policy=3D'disable' name=3D'syscall'/>
    <feature policy=3D'disable' name=3D'tsc'/>
    <feature policy=3D'disable' name=3D'umip'/>
    <feature policy=3D'disable' name=3D'vme'/>
    <feature policy=3D'disable' name=3D'wbnoinvd'/>
    <feature policy=3D'disable' name=3D'xgetbv1'/>
    <feature policy=3D'disable' name=3D'xsave'/>
    <feature policy=3D'disable' name=3D'xsavec'/>
    <feature policy=3D'disable' name=3D'xsaveerptr'/>
    <feature policy=3D'disable' name=3D'xsaveopt'/>

Eventually I'd hope you identify one feature (re add everything but this
to verify) that breaks it. Any chance to do this iterative test? You
could also "bisect" this list if you want to save some time.

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

