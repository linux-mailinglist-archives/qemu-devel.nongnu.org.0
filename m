Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A6AEB375529
	for <lists+qemu-devel@lfdr.de>; Thu,  6 May 2021 15:52:46 +0200 (CEST)
Received: from localhost ([::1]:33310 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1leeQn-0007ML-Hc
	for lists+qemu-devel@lfdr.de; Thu, 06 May 2021 09:52:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60186)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1leeP1-0006BC-I3
 for qemu-devel@nongnu.org; Thu, 06 May 2021 09:50:55 -0400
Received: from indium.canonical.com ([91.189.90.7]:43144)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1leeOx-00074I-Kb
 for qemu-devel@nongnu.org; Thu, 06 May 2021 09:50:55 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.93 #5 (Debian))
 id 1leeOv-0002xE-NF
 for <qemu-devel@nongnu.org>; Thu, 06 May 2021 13:50:49 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 870D82E8187
 for <qemu-devel@nongnu.org>; Thu,  6 May 2021 13:50:49 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Thu, 06 May 2021 13:36:52 -0000
From: Thomas Huth <1874486@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Incomplete; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Tags: qemu-img
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: edwittmann th-huth
X-Launchpad-Bug-Reporter: Ed Wittmann (edwittmann)
X-Launchpad-Bug-Modifier: Thomas Huth (th-huth)
References: <158765987293.9065.3835957221037707778.malonedeb@gac.canonical.com>
Message-Id: <162030821239.3420.16504885078680887737.malone@gac.canonical.com>
Subject: [Bug 1874486] Re: Bug in qemu-img when converting to streamOptimized
 vmdk images
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="d6ba96cccb3d3e356754af3137c6128a6c17e2a8"; Instance="production"
X-Launchpad-Hash: 6ea29cc5448918b4a0a8180b624e1801e0e16810
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
Reply-To: Bug 1874486 <1874486@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The QEMU project is currently moving its bug tracking to another system.
For this we need to know which bugs are still valid and which could be
closed already. Thus we are setting older bugs to "Incomplete" now.

If you still think this bug report here is valid, then please switch
the state back to "New" within the next 60 days, otherwise this report
will be marked as "Expired". Or please mark it as "Fix Released" if
the problem has been solved with a newer version of QEMU already.

Thank you and sorry for the inconvenience.


** Tags added: qemu-img

** Changed in: qemu
       Status: New =3D> Incomplete

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1874486

Title:
  Bug in qemu-img when converting to streamOptimized vmdk images

Status in QEMU:
  Incomplete

Bug description:
  I reviewed #1006655, and I think I'm already on a newer version, so
  this is either a regression or a new bug.

  I have been recently attempting to convert images from raw and qcow2
  formats to vmdk. It appears that the option
  "subformat=3DstreamOptimized" produces a broken or corrupted disk image.

  Current versions, running on Devuan testing:

  ii  ipxe-qemu                                 1.0.0+git-20190125.36a4c85-=
1                all          PXE boot firmware - ROM images for qemu
  ii  qemu                                      1:3.1+dfsg-8+deb10u4       =
                 amd64        fast processor emulator, dummy package
  ii  qemu-efi-aarch64                          0~20181115.85588389-3      =
                 all          UEFI firmware for 64-bit ARM virtual machines
  ii  qemu-efi-arm                              0~20181115.85588389-3      =
                 all          UEFI firmware for 32-bit ARM virtual machines
  ii  qemu-kvm                                  1:3.1+dfsg-8+deb10u4       =
                 amd64        QEMU Full virtualization on x86 hardware
  ii  qemu-slof                                 20180702+dfsg-1            =
                 all          Slimline Open Firmware -- QEMU PowerPC version
  ii  qemu-system                               1:3.1+dfsg-8+deb10u4       =
                 amd64        QEMU full system emulation binaries
  ii  qemu-system-arm                           1:3.1+dfsg-8+deb10u4       =
                 amd64        QEMU full system emulation binaries (arm)
  ii  qemu-system-common                        1:3.1+dfsg-8+deb10u4       =
                 amd64        QEMU full system emulation binaries (common f=
iles)
  ii  qemu-system-data                          1:3.1+dfsg-8+deb10u4       =
                 all          QEMU full system emulation (data files)
  ii  qemu-system-gui                           1:3.1+dfsg-8+deb10u4       =
                 amd64        QEMU full system emulation binaries (user int=
erface and audio support)
  ii  qemu-system-mips                          1:3.1+dfsg-8+deb10u4       =
                 amd64        QEMU full system emulation binaries (mips)
  ii  qemu-system-misc                          1:3.1+dfsg-8+deb10u4       =
                 amd64        QEMU full system emulation binaries (miscella=
neous)
  ii  qemu-system-ppc                           1:3.1+dfsg-8+deb10u4       =
                 amd64        QEMU full system emulation binaries (ppc)
  ii  qemu-system-sparc                         1:3.1+dfsg-8+deb10u4       =
                 amd64        QEMU full system emulation binaries (sparc)
  ii  qemu-system-x86                           1:3.1+dfsg-8+deb10u4       =
                 amd64        QEMU full system emulation binaries (x86)
  ii  qemu-utils                                1:3.1+dfsg-8+deb10u4       =
                 amd64        QEMU utilities

  Current uname -a:
  Linux laptop-dev 5.4.0-0.bpo.3-amd64 #1 SMP Debian 5.4.13-1~bpo10+1 (2020=
-02-07) x86_64 GNU/Linux

  Current CPU info:
  $ cat /proc/cpuinfo
  processor       : 0
  vendor_id       : GenuineIntel
  cpu family      : 6
  model           : 158
  model name      : Intel(R) Core(TM) i7-8750H CPU @ 2.20GHz
  stepping        : 10
  microcode       : 0xca
  cpu MHz         : 800.109
  cache size      : 9216 KB
  physical id     : 0
  siblings        : 12
  core id         : 0
  cpu cores       : 6
  apicid          : 0
  initial apicid  : 0
  fpu             : yes
  fpu_exception   : yes
  cpuid level     : 22
  wp              : yes
  flags           : fpu vme de pse tsc msr pae mce cx8 apic sep mtrr pge mc=
a cmov pat pse36 clflush dts acpi mmx fxsr sse sse2 ss ht tm pbe syscall nx=
 pdpe1gb rdtscp lm constant_tsc art arch_perfmon pebs bts rep_good nopl xto=
pology nonstop_tsc cpuid aperfmperf pni pclmulqdq dtes64 monitor ds_cpl vmx=
 est tm2 ssse3 sdbg fma cx16 xtpr pdcm pcid sse4_1 sse4_2 x2apic movbe popc=
nt tsc_deadline_timer aes xsave avx f16c rdrand lahf_lm abm 3dnowprefetch c=
puid_fault epb invpcid_single pti ssbd ibrs ibpb stibp tpr_shadow vnmi flex=
priority ept vpid ept_ad fsgsbase tsc_adjust bmi1 avx2 smep bmi2 erms invpc=
id mpx rdseed adx smap clflushopt intel_pt xsaveopt xsavec xgetbv1 xsaves d=
therm ida arat pln pts hwp hwp_notify hwp_act_window hwp_epp md_clear flush=
_l1d
  bugs            : cpu_meltdown spectre_v1 spectre_v2 spec_store_bypass l1=
tf mds swapgs itlb_multihit
  bogomips        : 4399.99
  clflush size    : 64
  cache_alignment : 64
  address sizes   : 39 bits physical, 48 bits virtual
  power management:

  $ cat /proc/meminfo
  MemTotal:       16098356 kB
  MemFree:         2292720 kB
  MemAvailable:   12323616 kB

  =

  Steps to reproduce:
  1) Create a base o/s image in .qcow2 or raw format. I am using a Debian 1=
0 (buster) image, and my images are created using packer 1.5.5.
  2) Verify that the base image in .qcow2 format boots correctly in virt-ma=
nager when attached to a new VM.
  3) Convert the image to vmdk using the following command:
  qemu-img convert -f qcow2 -O vmdk -o adapter_type=3Dlsilogic,subformat=3D=
streamOptimized,hwversion=3D6 <image name>.qcow2 <image name>.vmdk
  4) Create a new VM using the newly-created .vmdk, being sure to make the =
storage adapter SCSI
  Result: The image, on boot, will display many disk read errors. It will b=
oot, but will start in read-only mode.

  This same image will also not boot correctly in ESXi or VirtualBox. In
  any of the three hypervisor environments, the bootloader menu (grub2)
  shows up correctly, but the machine will fail to boot correctly.

  =

  I reviewed the vmdk header, and the output is here:

  dd if=3Dbase.vmdk of=3Doutput-vm-disk1.descriptor bs=3D1 skip=3D512 count=
=3D1024

  $ cat output-vm-disk1.descriptor =

  # Disk DescriptorFile
  version=3D1
  CID=3D2120740c
  parentCID=3Dffffffff
  createType=3D"streamOptimized"

  # Extent description
  RW 61440000 SPARSE "base.vmdk"

  # The Disk Data Base
  #DDB

  ddb.virtualHWVersion =3D "6"
  ddb.geometry.cylinders =3D "3824"
  ddb.geometry.heads =3D "255"
  ddb.geometry.sectors =3D "63"
  ddb.adapterType =3D "lsilogic"

  Removing the "subformat=3DstreamOptimized" argument from the qemu-img
  conversion command results in a working, albeit much larger image,
  with no disk read errors.

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1874486/+subscriptions

