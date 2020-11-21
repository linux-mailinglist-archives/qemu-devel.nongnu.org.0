Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 82B782BBFDF
	for <lists+qemu-devel@lfdr.de>; Sat, 21 Nov 2020 15:23:21 +0100 (CET)
Received: from localhost ([::1]:58690 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kgTnM-0004sD-HN
	for lists+qemu-devel@lfdr.de; Sat, 21 Nov 2020 09:23:20 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:45610)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1kgTkp-0003Tj-2f
 for qemu-devel@nongnu.org; Sat, 21 Nov 2020 09:20:43 -0500
Received: from indium.canonical.com ([91.189.90.7]:55660)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1kgTkk-0002vN-RM
 for qemu-devel@nongnu.org; Sat, 21 Nov 2020 09:20:42 -0500
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1kgTki-0003kz-W3
 for <qemu-devel@nongnu.org>; Sat, 21 Nov 2020 14:20:36 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id F127C2E813D
 for <qemu-devel@nongnu.org>; Sat, 21 Nov 2020 14:20:36 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Sat, 21 Nov 2020 14:12:16 -0000
From: Thomas Huth <1843073@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Incomplete; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: th-huth vladimir-umnov
X-Launchpad-Bug-Reporter: uvi (vladimir-umnov)
X-Launchpad-Bug-Modifier: Thomas Huth (th-huth)
References: <156778642501.17347.17557426994205173349.malonedeb@gac.canonical.com>
Message-Id: <160596793678.32076.6599994938077245385.malone@soybean.canonical.com>
Subject: [Bug 1843073] Re: Network loose connection for long time under light
 load guest winxp64 with virtio on i5-8350U
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="c35ff22711d15549e2303ae18ae521fd91f6bf00"; Instance="production"
X-Launchpad-Hash: d96cc0af72b6077a03bbab02f5815b3b292a25c3
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
Reply-To: Bug 1843073 <1843073@bugs.launchpad.net>
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
https://bugs.launchpad.net/bugs/1843073

Title:
  Network loose connection for long time under light load guest winxp64
  with virtio on i5-8350U

Status in QEMU:
  Incomplete

Bug description:
  I have issue with qemu and winxp guest on i5-8350U.

  First of all, if i run same vm with same config on i5 9660k i do not see =
such issue.
  Both pc have ubuntu 19.04 x86_64.

  Guest is winxp64, tried:
  1) stable guest drivers, latest drivers
  2) all virtio, only network r18169, bridge to host eth0, just default vir=
br0.
  3) qemu from ubuntu 19.04, and tried latest libvirt and qeumu compiled fr=
om sources.
  4) tried zram as block device

  I need really lightweight win to run only one app, so win7 and win10
  is not an option.

  =

  <!--
  WARNING: THIS IS AN AUTO-GENERATED FILE. CHANGES TO IT ARE LIKELY TO BE
  OVERWRITTEN AND LOST. Changes to this xml configuration should be made us=
ing:
    virsh edit winxp
  or other application using the libvirt API.
  -->

  <domain type=3D'kvm'>
    <name>winxp</name>
    <uuid>93921ab3-222a-4e5f-89c4-36703fc65cb4</uuid>
    <metadata>
      <libosinfo:libosinfo xmlns:libosinfo=3D"http://libosinfo.org/xmlns/li=
bvirt/domain/1.0">
        <libosinfo:os id=3D"http://microsoft.com/win/xp"/>
      </libosinfo:libosinfo>
    </metadata>
    <memory unit=3D'KiB'>8388608</memory>
    <currentMemory unit=3D'KiB'>8388608</currentMemory>
    <vcpu placement=3D'static'>4</vcpu>
    <cputune>
      <vcpupin vcpu=3D'0' cpuset=3D'2'/>
      <vcpupin vcpu=3D'1' cpuset=3D'3'/>
      <vcpupin vcpu=3D'2' cpuset=3D'6'/>
      <vcpupin vcpu=3D'3' cpuset=3D'7'/>
    </cputune>
    <os>
      <type arch=3D'x86_64' machine=3D'pc-i440fx-4.1'>hvm</type>
    </os>
    <features>
      <acpi/>
      <apic/>
      <hyperv>
        <relaxed state=3D'on'/>
        <vapic state=3D'on'/>
        <spinlocks state=3D'on' retries=3D'8191'/>
        <vpindex state=3D'on'/>
        <synic state=3D'on'/>
        <stimer state=3D'on'/>
      </hyperv>
      <vmport state=3D'off'/>
    </features>
    <cpu mode=3D'host-model' check=3D'partial'>
      <model fallback=3D'allow'/>
    </cpu>
    <clock offset=3D'localtime'>
      <timer name=3D'rtc' tickpolicy=3D'catchup'/>
      <timer name=3D'pit' tickpolicy=3D'delay'/>
      <timer name=3D'hpet' present=3D'no'/>
      <timer name=3D'hypervclock' present=3D'yes'/>
    </clock>
    <on_poweroff>destroy</on_poweroff>
    <on_reboot>restart</on_reboot>
    <on_crash>destroy</on_crash>
    <pm>
      <suspend-to-mem enabled=3D'no'/>
      <suspend-to-disk enabled=3D'no'/>
    </pm>
    <devices>
      <emulator>/usr/local/bin/qemu-system-x86_64</emulator>
      <disk type=3D'block' device=3D'disk'>
        <driver name=3D'qemu' type=3D'raw' cache=3D'none' io=3D'native'/>
        <source dev=3D'/dev/zram0'/>
        <target dev=3D'vdb' bus=3D'virtio'/>
        <shareable/>
        <boot order=3D'1'/>
        <address type=3D'pci' domain=3D'0x0000' bus=3D'0x00' slot=3D'0x08' =
function=3D'0x0'/>
      </disk>
      <disk type=3D'file' device=3D'cdrom'>
        <driver name=3D'qemu' type=3D'raw'/>
        <source file=3D'/var/lib/libvirt/images/virtio-win.iso'/>
        <target dev=3D'hdb' bus=3D'ide'/>
        <readonly/>
        <address type=3D'drive' controller=3D'0' bus=3D'0' target=3D'0' uni=
t=3D'1'/>
      </disk>
      <controller type=3D'usb' index=3D'0' model=3D'ich9-ehci1'>
        <address type=3D'pci' domain=3D'0x0000' bus=3D'0x00' slot=3D'0x05' =
function=3D'0x7'/>
      </controller>
      <controller type=3D'usb' index=3D'0' model=3D'ich9-uhci1'>
        <master startport=3D'0'/>
        <address type=3D'pci' domain=3D'0x0000' bus=3D'0x00' slot=3D'0x05' =
function=3D'0x0' multifunction=3D'on'/>
      </controller>
      <controller type=3D'usb' index=3D'0' model=3D'ich9-uhci2'>
        <master startport=3D'2'/>
        <address type=3D'pci' domain=3D'0x0000' bus=3D'0x00' slot=3D'0x05' =
function=3D'0x1'/>
      </controller>
      <controller type=3D'usb' index=3D'0' model=3D'ich9-uhci3'>
        <master startport=3D'4'/>
        <address type=3D'pci' domain=3D'0x0000' bus=3D'0x00' slot=3D'0x05' =
function=3D'0x2'/>
      </controller>
      <controller type=3D'pci' index=3D'0' model=3D'pci-root'/>
      <controller type=3D'ide' index=3D'0'>
        <address type=3D'pci' domain=3D'0x0000' bus=3D'0x00' slot=3D'0x01' =
function=3D'0x1'/>
      </controller>
      <controller type=3D'virtio-serial' index=3D'0'>
        <address type=3D'pci' domain=3D'0x0000' bus=3D'0x00' slot=3D'0x07' =
function=3D'0x0'/>
      </controller>
      <interface type=3D'network'>
        <mac address=3D'52:54:00:d1:b3:87'/>
        <source network=3D'default'/>
        <model type=3D'virtio'/>
        <address type=3D'pci' domain=3D'0x0000' bus=3D'0x00' slot=3D'0x03' =
function=3D'0x0'/>
      </interface>
      <serial type=3D'pty'>
        <target type=3D'isa-serial' port=3D'0'>
          <model name=3D'isa-serial'/>
        </target>
      </serial>
      <console type=3D'pty'>
        <target type=3D'serial' port=3D'0'/>
      </console>
      <input type=3D'tablet' bus=3D'usb'>
        <address type=3D'usb' bus=3D'0' port=3D'1'/>
      </input>
      <input type=3D'mouse' bus=3D'ps2'/>
      <input type=3D'keyboard' bus=3D'ps2'/>
      <graphics type=3D'spice' port=3D'5900' autoport=3D'no' listen=3D'0.0.=
0.0'>
        <listen type=3D'address' address=3D'0.0.0.0'/>
        <image compression=3D'auto_glz'/>
        <jpeg compression=3D'auto'/>
        <zlib compression=3D'auto'/>
        <playback compression=3D'off'/>
        <streaming mode=3D'off'/>
      </graphics>
      <sound model=3D'ich6'>
        <address type=3D'pci' domain=3D'0x0000' bus=3D'0x00' slot=3D'0x04' =
function=3D'0x0'/>
      </sound>
      <video>
        <model type=3D'vga' vram=3D'16384' heads=3D'1' primary=3D'yes'/>
        <address type=3D'pci' domain=3D'0x0000' bus=3D'0x00' slot=3D'0x02' =
function=3D'0x0'/>
      </video>
      <memballoon model=3D'virtio'>
        <address type=3D'pci' domain=3D'0x0000' bus=3D'0x00' slot=3D'0x06' =
function=3D'0x0'/>
      </memballoon>
    </devices>
  </domain>

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1843073/+subscriptions

