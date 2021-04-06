Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B79F355456
	for <lists+qemu-devel@lfdr.de>; Tue,  6 Apr 2021 14:57:28 +0200 (CEST)
Received: from localhost ([::1]:47596 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lTlGo-0008ID-M7
	for lists+qemu-devel@lfdr.de; Tue, 06 Apr 2021 08:57:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43814)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lTlFK-0007qK-8Z
 for qemu-devel@nongnu.org; Tue, 06 Apr 2021 08:55:54 -0400
Received: from indium.canonical.com ([91.189.90.7]:44640)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lTlFH-0005pz-KU
 for qemu-devel@nongnu.org; Tue, 06 Apr 2021 08:55:54 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1lTlFF-0000CR-Of
 for <qemu-devel@nongnu.org>; Tue, 06 Apr 2021 12:55:49 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id AA38C2E8157
 for <qemu-devel@nongnu.org>; Tue,  6 Apr 2021 12:55:49 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Tue, 06 Apr 2021 12:48:09 -0000
From: David Ober <1915063@bugs.launchpad.net>
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
X-Launchpad-Bug-Modifier: David Ober (dober60)
References: <161281335451.16853.7070328699645987751.malonedeb@wampee.canonical.com>
Message-Id: <161771328949.29047.13256635077127695950.malone@gac.canonical.com>
Subject: [Bug 1915063] Re: Windows 10 wil not install using qemu-system-x86_64
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="57f1f603f707b9cfa764cae8dd0f3999026b4763"; Instance="production"
X-Launchpad-Hash: b5397c5d827614aa2f11b535109ebbcff9140aa5
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

<domainCapabilities>
  <path>/usr/bin/qemu-system-x86_64</path>
  <domain>kvm</domain>
  <machine>pc-i440fx-hirsute</machine>
  <arch>x86_64</arch>
  <vcpu max=3D'255'/>
  <iothreads supported=3D'yes'/>
  <os supported=3D'yes'>
    <enum name=3D'firmware'>
      <value>efi</value>
    </enum>
    <loader supported=3D'yes'>
      <value>/usr/share/OVMF/OVMF_CODE_4M.fd</value>
      <enum name=3D'type'>
        <value>rom</value>
        <value>pflash</value>
      </enum>
      <enum name=3D'readonly'>
        <value>yes</value>
        <value>no</value>
      </enum>
      <enum name=3D'secure'>
        <value>no</value>
      </enum>
    </loader>
  </os>
  <cpu>
    <mode name=3D'host-passthrough' supported=3D'yes'/>
    <mode name=3D'host-model' supported=3D'yes'>
      <model fallback=3D'forbid'>EPYC-Rome</model>
      <vendor>AMD</vendor>
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
    </mode>
    <mode name=3D'custom' supported=3D'yes'>
      <model usable=3D'yes'>qemu64</model>
      <model usable=3D'yes'>qemu32</model>
      <model usable=3D'no'>phenom</model>
      <model usable=3D'yes'>pentium3</model>
      <model usable=3D'yes'>pentium2</model>
      <model usable=3D'yes'>pentium</model>
      <model usable=3D'no'>n270</model>
      <model usable=3D'yes'>kvm64</model>
      <model usable=3D'yes'>kvm32</model>
      <model usable=3D'no'>coreduo</model>
      <model usable=3D'no'>core2duo</model>
      <model usable=3D'no'>athlon</model>
      <model usable=3D'no'>Westmere-IBRS</model>
      <model usable=3D'yes'>Westmere</model>
      <model usable=3D'no'>Skylake-Server-noTSX-IBRS</model>
      <model usable=3D'no'>Skylake-Server-IBRS</model>
      <model usable=3D'no'>Skylake-Server</model>
      <model usable=3D'no'>Skylake-Client-noTSX-IBRS</model>
      <model usable=3D'no'>Skylake-Client-IBRS</model>
      <model usable=3D'no'>Skylake-Client</model>
      <model usable=3D'no'>SandyBridge-IBRS</model>
      <model usable=3D'yes'>SandyBridge</model>
      <model usable=3D'yes'>Penryn</model>
      <model usable=3D'no'>Opteron_G5</model>
      <model usable=3D'no'>Opteron_G4</model>
      <model usable=3D'yes'>Opteron_G3</model>
      <model usable=3D'yes'>Opteron_G2</model>
      <model usable=3D'yes'>Opteron_G1</model>
      <model usable=3D'no'>Nehalem-IBRS</model>
      <model usable=3D'yes'>Nehalem</model>
      <model usable=3D'no'>IvyBridge-IBRS</model>
      <model usable=3D'no'>IvyBridge</model>
      <model usable=3D'no'>Icelake-Server-noTSX</model>
      <model usable=3D'no'>Icelake-Server</model>
      <model usable=3D'no'>Icelake-Client-noTSX</model>
      <model usable=3D'no'>Icelake-Client</model>
      <model usable=3D'no'>Haswell-noTSX-IBRS</model>
      <model usable=3D'no'>Haswell-noTSX</model>
      <model usable=3D'no'>Haswell-IBRS</model>
      <model usable=3D'no'>Haswell</model>
      <model usable=3D'yes'>EPYC-Rome</model>
      <model usable=3D'yes'>EPYC-IBPB</model>
      <model usable=3D'yes'>EPYC</model>
      <model usable=3D'yes'>Dhyana</model>
      <model usable=3D'yes'>Conroe</model>
      <model usable=3D'no'>Cascadelake-Server-noTSX</model>
      <model usable=3D'no'>Cascadelake-Server</model>
      <model usable=3D'no'>Broadwell-noTSX-IBRS</model>
      <model usable=3D'no'>Broadwell-noTSX</model>
      <model usable=3D'no'>Broadwell-IBRS</model>
      <model usable=3D'no'>Broadwell</model>
      <model usable=3D'yes'>486</model>
    </mode>
  </cpu>
  <devices>
    <disk supported=3D'yes'>
      <enum name=3D'diskDevice'>
        <value>disk</value>
        <value>cdrom</value>
        <value>floppy</value>
        <value>lun</value>
      </enum>
      <enum name=3D'bus'>
        <value>ide</value>
        <value>fdc</value>
        <value>scsi</value>
        <value>virtio</value>
        <value>usb</value>
        <value>sata</value>
      </enum>
      <enum name=3D'model'>
        <value>virtio</value>
        <value>virtio-transitional</value>
        <value>virtio-non-transitional</value>
      </enum>
    </disk>
    <graphics supported=3D'yes'>
      <enum name=3D'type'>
        <value>sdl</value>
        <value>vnc</value>
        <value>spice</value>
      </enum>
    </graphics>
    <video supported=3D'yes'>
      <enum name=3D'modelType'>
        <value>vga</value>
        <value>cirrus</value>
        <value>vmvga</value>
        <value>qxl</value>
        <value>virtio</value>
        <value>none</value>
        <value>bochs</value>
        <value>ramfb</value>
      </enum>
    </video>
    <hostdev supported=3D'yes'>
      <enum name=3D'mode'>
        <value>subsystem</value>
      </enum>
      <enum name=3D'startupPolicy'>
        <value>default</value>
        <value>mandatory</value>
        <value>requisite</value>
        <value>optional</value>
      </enum>
      <enum name=3D'subsysType'>
        <value>usb</value>
        <value>pci</value>
        <value>scsi</value>
      </enum>
      <enum name=3D'capsType'/>
      <enum name=3D'pciBackend'>
        <value>default</value>
        <value>vfio</value>
      </enum>
    </hostdev>
    <rng supported=3D'yes'>
      <enum name=3D'model'>
        <value>virtio</value>
        <value>virtio-transitional</value>
        <value>virtio-non-transitional</value>
      </enum>
      <enum name=3D'backendModel'>
        <value>random</value>
        <value>egd</value>
      </enum>
    </rng>
  </devices>
  <features>
    <gic supported=3D'no'/>
    <vmcoreinfo supported=3D'yes'/>
    <genid supported=3D'yes'/>
    <backingStoreInput supported=3D'yes'/>
    <backup supported=3D'no'/>
    <sev supported=3D'no'/>
  </features>
</domainCapabilities>

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

