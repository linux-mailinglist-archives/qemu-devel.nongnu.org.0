Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AE42B2BBFE0
	for <lists+qemu-devel@lfdr.de>; Sat, 21 Nov 2020 15:23:21 +0100 (CET)
Received: from localhost ([::1]:58810 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kgTnM-0004v1-PC
	for lists+qemu-devel@lfdr.de; Sat, 21 Nov 2020 09:23:20 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:45632)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1kgTkq-0003Tu-1m
 for qemu-devel@nongnu.org; Sat, 21 Nov 2020 09:20:44 -0500
Received: from indium.canonical.com ([91.189.90.7]:55680)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1kgTkm-0002vl-9J
 for qemu-devel@nongnu.org; Sat, 21 Nov 2020 09:20:43 -0500
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1kgTkj-0003ku-Bh
 for <qemu-devel@nongnu.org>; Sat, 21 Nov 2020 14:20:37 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 5748F2E813E
 for <qemu-devel@nongnu.org>; Sat, 21 Nov 2020 14:20:37 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Sat, 21 Nov 2020 14:13:54 -0000
From: Thomas Huth <1757323@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Incomplete; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: piersh th-huth
X-Launchpad-Bug-Reporter: piersh (piersh)
X-Launchpad-Bug-Modifier: Thomas Huth (th-huth)
References: <152160343164.22698.3488159788073699285.malonedeb@soybean.canonical.com>
Message-Id: <160596803474.15953.16592812046032584152.malone@chaenomeles.canonical.com>
Subject: [Bug 1757323] Re: blue screen running windows 10 install DVD on qemu
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="c35ff22711d15549e2303ae18ae521fd91f6bf00"; Instance="production"
X-Launchpad-Hash: 7f74d6705e14cd9f5ab1871744bdafb590ad978c
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
Reply-To: Bug 1757323 <1757323@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The QEMU project is currently considering to move its bug tracking to anoth=
er system. For this we need to know which bugs are still valid and which co=
uld be closed already. Thus we are setting older bugs to "Incomplete" now.
If you still think this bug report here is valid, then please switch the st=
ate back to "New" within the next 60 days, otherwise this report will be ma=
rked as "Expired". Or mark it as "Fix Released" if the problem has been sol=
ved with a newer version of QEMU already. Thank you and sorry for the incon=
venience.

** Changed in: qemu
       Status: New =3D> Incomplete

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1757323

Title:
  blue screen running windows 10 install DVD on qemu

Status in QEMU:
  Incomplete

Bug description:
  i get a blue screen at the first screen of the windows 10 DVD setup
  (Win10_1709_English_x64.iso, available from MS).

  The DVD boots fine, and gets to the first dialog: http://codewithoutborde=
rs.com/posted/qemu1.png
  and then if i just wait a minute of so it blue screen's.
  either DRIVER IRQL NOT LESS OR EQUAL: http://codewithoutborders.com/poste=
d/qemu2.png
  or KMODE EXCEPTION NOT HANDLED: http://codewithoutborders.com/posted/qemu=
3.png


  =

  the qemu command-line is:

  /usr/bin/qemu-system-x87_64 \
   -boot strict=3Don \
   -chardev socket,id=3Dcharmonitor,path=3D/var/lib/libvirt/qemu/domain-gen=
eric/monitor.sock,server,nowait \
   -chardev spicevmc,id=3Dcharchannel0,name=3Dvdagent \
   -cpu core2duo,+lahf_lm,+pdcm,+xtpr,+cx16,+tm2,+est,+vmx,+ds_cpl,+dtes64,=
+pbe,+tm,+ht,+ss,+acpi,+ds,kvm=3Doff \
   -device ich9-usb-ehci1,id=3Dusb,bus=3Dpci.0,addr=3D0x6.0x7 \
   -device ich9-usb-uhci1,masterbus=3Dusb.0,firstport=3D0,bus=3Dpci.0,multi=
function=3Don,addr=3D0x6 \
   -device ich9-usb-uhci2,masterbus=3Dusb.0,firstport=3D2,bus=3Dpci.0,addr=
=3D0x6.0x1 \
   -device ich9-usb-uhci3,masterbus=3Dusb.0,firstport=3D4,bus=3Dpci.0,addr=
=3D0x6.0x2 \
   -device ide-cd,bus=3Dide.0,unit=3D1,drive=3Ddrive-ide0-0-1,id=3Dide0-0-1=
,bootindex=3D1 \
   -device qxl-vga,id=3Dvideo0,ram_size=3D67108864,vram_size=3D67108864,vga=
mem_mb=3D16,bus=3Dpci.0,addr=3D0x2 \
   -device virtio-balloon-pci,id=3Dballoon0,bus=3Dpci.0,addr=3D0x7 \
   -device virtio-serial-pci,id=3Dvirtio-serial0,bus=3Dpci.0,addr=3D0x5 \
   -device virtserialport,bus=3Dvirtio-serial0.0,nr=3D1,chardev=3Dcharchann=
el0,id=3Dchannel0,name=3Dcom.redhat.spice.0 \
   -drive file=3D/mnt/ISOs/Win10_1709_English_x64.iso,format=3Draw,if=3Dnon=
e,id=3Ddrive-ide0-0-1,readonly=3Don \
   -global kvm-pit.lost_tick_policy=3Ddiscard \
   -global PIIX4_PM.disable_s3=3D1 \
   -global PIIX4_PM.disable_s4=3D1 \
   -m 4096 \
   -machine pc-i440fx-xenial,accel=3Dtcg,usb=3Doff \
   -mon chardev=3Dcharmonitor,id=3Dmonitor,mode=3Dcontrol \
   -msg timestamp=3Don \
   -name generic \
   -nodefaults \
   -no-hpet \
   -no-shutdown \
   -no-user-config \
   -realtime mlock=3Doff \
   -rtc base=3Dutc,driftfix=3Dslew \
   -S \
   -smp 2,sockets=3D2,cores=3D1,threads=3D1 \
   -spice port=3D5900,addr=3D127.0.0.1,disable-ticketing,image-compression=
=3Doff,seamless-migration=3Don \
   -uuid 3902a801-42dd-4bf2-8f3a-cbc68f4f8564

  =

  $ /usr/bin/qemu-system-x87_64 --version
  QEMU emulator version 2.5.0 (Debian 1:2.5+dfsg-5ubuntu10.24), Copyright (=
c) 2003-2008 Fabrice Bellard

  $ uname -a
  Linux host 4.13.0-37-generic #42~16.04.1-Ubuntu SMP Wed Mar 7 16:03:28 UT=
C 2018 x86_64 x86_64 x86_64 GNU/Linux

  $ cat /proc/cpuinfo =

  processor	: 0
  vendor_id	: GenuineIntel
  cpu family	: 6
  model		: 15
  model name	: Intel(R) Core(TM)2 Quad CPU           @ 2.66GHz
  stepping	: 7
  microcode	: 0x66
  cpu MHz		: 2671.406
  cache size	: 4096 KB
  physical id	: 0
  siblings	: 4
  core id		: 0
  cpu cores	: 4
  apicid		: 0
  initial apicid	: 0
  fpu		: yes
  fpu_exception	: yes
  cpuid level	: 10
  wp		: yes
  flags		: fpu vme de pse tsc msr pae mce cx8 apic sep mtrr pge mca cmov pa=
t pse36 clflush dts acpi mmx fxsr sse sse2 ss ht tm pbe syscall nx lm const=
ant_tsc arch_perfmon pebs bts rep_good nopl cpuid aperfmperf pni dtes64 mon=
itor ds_cpl vmx est tm2 ssse3 cx16 xtpr pdcm lahf_lm pti retpoline tpr_shad=
ow dtherm
  bugs		: cpu_meltdown spectre_v1 spectre_v2
  bogomips	: 5342.81
  clflush size	: 64
  cache_alignment	: 64
  address sizes	: 36 bits physical, 48 bits virtual
  power management:

  ... 3 more times

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1757323/+subscriptions

