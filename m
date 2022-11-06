Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8667261E236
	for <lists+qemu-devel@lfdr.de>; Sun,  6 Nov 2022 13:51:56 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1orf6Z-0004ae-DJ; Sun, 06 Nov 2022 07:50:27 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <noreply@launchpad.net>)
 id 1orf6S-0004a8-Lc
 for qemu-devel@nongnu.org; Sun, 06 Nov 2022 07:50:20 -0500
Received: from smtp-relay-services-0.canonical.com ([185.125.188.250])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <noreply@launchpad.net>)
 id 1orf6P-0000hN-NP
 for qemu-devel@nongnu.org; Sun, 06 Nov 2022 07:50:20 -0500
Received: from scripts-1.lp.internal (scripts.lp.internal [10.131.66.196])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by smtp-relay-services-0.canonical.com (Postfix) with ESMTPSA id C65B94141C
 for <qemu-devel@nongnu.org>; Sun,  6 Nov 2022 12:50:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=launchpad.net;
 s=20210803; t=1667739013;
 bh=AnH7oEg4wpjQhOpUYy4Dso17b2TX/25bvNELEn4fT1I=;
 h=MIME-Version:Content-Type:Date:From:To:Reply-To:References:
 Message-Id:Subject;
 b=WqVk/H+KHEv9UDRYeU2qOwB62kJzwC1EH87eTiI8m+XTFoH4noG13VeqHPApb88O0
 kz1q9gFlYWT44cLDma7+eajsjAuDo/LU/PPRjOAKe1XnSDFXa8GfsEb+6SyFVQ1nZV
 sPZJHOlQtyi0a4auC5F7E5yuprUbRr/2OcR78d2OneKtRL3+f8w6Wli8HNEdN7e9Yk
 PvHKTW7w68FjyTYUajU22aUAjnvWIPl3vRX0dGOwkKXT8v1qit1JYjxVyv+HSuQxIW
 7hT3nDhSrN6HrPnOdUz2i+9keAh3h/GAmRv9JuxYb7ZyV2/CX0hi92WjJcukggc2Ih
 glR0DH8EjJcnQ==
Received: from
 juju-4112d9-prod-launchpad-manual-servers-36.openstack.prodstack5.lan
 (localhost [127.0.0.1])
 by scripts-1.lp.internal (Postfix) with ESMTP id 841B040C88
 for <qemu-devel@nongnu.org>; Sun,  6 Nov 2022 12:50:12 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Sun, 06 Nov 2022 12:41:39 -0000
From: Eric Levy <1034423@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Expired; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: 8mabmzqcnyc1g4i7tjyvuprzli-contact-clubl5mz6ldresgvtiayqw6wzb janitor owentuz
 th-huth
X-Launchpad-Bug-Reporter: Owen Tuz (owentuz)
X-Launchpad-Bug-Modifier: Eric Levy
 (8mabmzqcnyc1g4i7tjyvuprzli-contact-clubl5mz6ldresgvtiayqw6wzb)
References: <20120808150403.6400.41896.malonedeb@chaenomeles.canonical.com>
Message-Id: <166773850006.3925.7634084771341522604.malone@gac.canonical.com>
Subject: [Bug 1034423] Re: Guests running OpenIndiana (and relatives) fail to
 boot on AMD hardware
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="83f7123b02a2b50a64bc29e7e35197179a885279"; Instance="production"
X-Launchpad-Hash: c7039530c3c394a6d0e70e2ebc9c60d4886f4d98
Received-SPF: pass client-ip=185.125.188.250;
 envelope-from=noreply@launchpad.net; helo=smtp-relay-services-0.canonical.com
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Reply-To: Bug 1034423 <1034423@bugs.launchpad.net>
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Despite the age of the report, I am also reproducing the issue.

I am using Qemu 6.2.0 with KVM on Linux kernel 6.0.5 under Linux Mint
21.

The guest is OpenIndiana Hipster 2021.10.

A guest console capture is attached.

The guest is managed using libvirt 8.0.0

The dump of the libvirt domain configuration is as follows:

<domain type=3D'kvm' id=3D'62'>
  <name>openindiana</name>
  <uuid>7a7adcc0-889c-4daf-a73b-21a3fac3d8e7</uuid>
  <metadata>
    <libosinfo:libosinfo xmlns:libosinfo=3D"http://libosinfo.org/xmlns/libv=
irt/domain/1.0">
      <libosinfo:os id=3D"http://libosinfo.org/linux/2020"/>
    </libosinfo:libosinfo>
  </metadata>
  <memory unit=3D'KiB'>2097152</memory>
  <currentMemory unit=3D'KiB'>2097152</currentMemory>
  <vcpu placement=3D'static'>4</vcpu>
  <resource>
    <partition>/machine</partition>
  </resource>
  <os>
    <type arch=3D'x86_64' machine=3D'pc-i440fx-jammy'>hvm</type>
    <loader readonly=3D'yes' type=3D'pflash'>/usr/share/OVMF/OVMF_CODE_4M.f=
d</loader>
    <nvram template=3D'/usr/share/OVMF/OVMF_VARS_4M.fd'>/var/lib/libvirt/qe=
mu/nvram/openindiana_VARS.fd</nvram>
  </os>
  <features>
    <acpi/>
    <apic/>
    <vmport state=3D'off'/>
  </features>
  <cpu mode=3D'host-passthrough' check=3D'none' migratable=3D'on'/>
  <clock offset=3D'utc'>
    <timer name=3D'rtc' tickpolicy=3D'catchup'/>
    <timer name=3D'pit' tickpolicy=3D'delay'/>
    <timer name=3D'hpet' present=3D'no'/>
  </clock>
  <on_poweroff>destroy</on_poweroff>
  <on_reboot>restart</on_reboot>
  <on_crash>destroy</on_crash>
  <pm>
    <suspend-to-mem enabled=3D'no'/>
    <suspend-to-disk enabled=3D'no'/>
  </pm>
  <devices>
    <emulator>/usr/bin/qemu-system-x86_64</emulator>
    <disk type=3D'file' device=3D'disk'>
      <driver name=3D'qemu' type=3D'qcow2'/>
      <source file=3D'/srv/vhd/openindiana.qcow2' index=3D'2'/>
      <backingStore/>
      <target dev=3D'sda' bus=3D'sata'/>
      <alias name=3D'sata0-0-0'/>
      <address type=3D'drive' controller=3D'0' bus=3D'0' target=3D'0' unit=
=3D'0'/>
    </disk>
    <disk type=3D'file' device=3D'cdrom'>
      <driver name=3D'qemu' type=3D'raw'/>
      <source file=3D'/srv/img/OI-hipster-minimal-20211031.iso' index=3D'1'=
/>
      <backingStore/>
      <target dev=3D'sdb' bus=3D'sata'/>
      <readonly/>
      <boot order=3D'1'/>
      <alias name=3D'sata0-0-1'/>
      <address type=3D'drive' controller=3D'0' bus=3D'0' target=3D'0' unit=
=3D'1'/>
    </disk>
    <controller type=3D'usb' index=3D'0' model=3D'ich9-ehci1'>
      <alias name=3D'usb'/>
      <address type=3D'pci' domain=3D'0x0000' bus=3D'0x00' slot=3D'0x05' fu=
nction=3D'0x7'/>
    </controller>
    <controller type=3D'usb' index=3D'0' model=3D'ich9-uhci1'>
      <alias name=3D'usb'/>
      <master startport=3D'0'/>
      <address type=3D'pci' domain=3D'0x0000' bus=3D'0x00' slot=3D'0x05' fu=
nction=3D'0x0' multifunction=3D'on'/>
    </controller>
    <controller type=3D'usb' index=3D'0' model=3D'ich9-uhci2'>
      <alias name=3D'usb'/>
      <master startport=3D'2'/>
      <address type=3D'pci' domain=3D'0x0000' bus=3D'0x00' slot=3D'0x05' fu=
nction=3D'0x1'/>
    </controller>
    <controller type=3D'usb' index=3D'0' model=3D'ich9-uhci3'>
      <alias name=3D'usb'/>
      <master startport=3D'4'/>
      <address type=3D'pci' domain=3D'0x0000' bus=3D'0x00' slot=3D'0x05' fu=
nction=3D'0x2'/>
    </controller>
    <controller type=3D'pci' index=3D'0' model=3D'pci-root'>
      <alias name=3D'pci.0'/>
    </controller>
    <controller type=3D'ide' index=3D'0'>
      <alias name=3D'ide'/>
      <address type=3D'pci' domain=3D'0x0000' bus=3D'0x00' slot=3D'0x01' fu=
nction=3D'0x1'/>
    </controller>
    <controller type=3D'virtio-serial' index=3D'0'>
      <alias name=3D'virtio-serial0'/>
      <address type=3D'pci' domain=3D'0x0000' bus=3D'0x00' slot=3D'0x06' fu=
nction=3D'0x0'/>
    </controller>
    <controller type=3D'sata' index=3D'0'>
      <alias name=3D'sata0'/>
      <address type=3D'pci' domain=3D'0x0000' bus=3D'0x00' slot=3D'0x08' fu=
nction=3D'0x0'/>
    </controller>
    <interface type=3D'network'>
      <mac address=3D'52:54:00:20:40:9c'/>
      <source network=3D'default' portid=3D'77a38fbb-c35e-4f78-b377-e823963=
eb30e' bridge=3D'virbr0'/>
      <target dev=3D'vnet61'/>
      <model type=3D'e1000'/>
      <alias name=3D'net0'/>
      <address type=3D'pci' domain=3D'0x0000' bus=3D'0x00' slot=3D'0x03' fu=
nction=3D'0x0'/>
    </interface>
    <serial type=3D'pty'>
      <source path=3D'/dev/pts/3'/>
      <target type=3D'isa-serial' port=3D'0'>
        <model name=3D'isa-serial'/>
      </target>
      <alias name=3D'serial0'/>
    </serial>
    <console type=3D'pty' tty=3D'/dev/pts/3'>
      <source path=3D'/dev/pts/3'/>
      <target type=3D'serial' port=3D'0'/>
      <alias name=3D'serial0'/>
    </console>
    <channel type=3D'spicevmc'>
      <target type=3D'virtio' name=3D'com.redhat.spice.0' state=3D'disconne=
cted'/>
      <alias name=3D'channel0'/>
      <address type=3D'virtio-serial' controller=3D'0' bus=3D'0' port=3D'1'=
/>
    </channel>
    <input type=3D'tablet' bus=3D'usb'>
      <alias name=3D'input0'/>
      <address type=3D'usb' bus=3D'0' port=3D'1'/>
    </input>
    <input type=3D'mouse' bus=3D'ps2'>
      <alias name=3D'input1'/>
    </input>
    <input type=3D'keyboard' bus=3D'ps2'>
      <alias name=3D'input2'/>
    </input>
    <graphics type=3D'spice'>
      <listen type=3D'none'/>
      <image compression=3D'off'/>
    </graphics>
    <sound model=3D'ac97'>
      <alias name=3D'sound0'/>
      <address type=3D'pci' domain=3D'0x0000' bus=3D'0x00' slot=3D'0x04' fu=
nction=3D'0x0'/>
    </sound>
    <audio id=3D'1' type=3D'spice'/>
    <video>
      <model type=3D'vga' vram=3D'16384' heads=3D'1' primary=3D'yes'/>
      <alias name=3D'video0'/>
      <address type=3D'pci' domain=3D'0x0000' bus=3D'0x00' slot=3D'0x02' fu=
nction=3D'0x0'/>
    </video>
    <redirdev bus=3D'usb' type=3D'spicevmc'>
      <alias name=3D'redir0'/>
      <address type=3D'usb' bus=3D'0' port=3D'2'/>
    </redirdev>
    <redirdev bus=3D'usb' type=3D'spicevmc'>
      <alias name=3D'redir1'/>
      <address type=3D'usb' bus=3D'0' port=3D'3'/>
    </redirdev>
    <memballoon model=3D'virtio'>
      <alias name=3D'balloon0'/>
      <address type=3D'pci' domain=3D'0x0000' bus=3D'0x00' slot=3D'0x07' fu=
nction=3D'0x0'/>
    </memballoon>
  </devices>
  <seclabel type=3D'dynamic' model=3D'apparmor' relabel=3D'yes'>
    <label>libvirt-7a7adcc0-889c-4daf-a73b-21a3fac3d8e7</label>
    <imagelabel>libvirt-7a7adcc0-889c-4daf-a73b-21a3fac3d8e7</imagelabel>
  </seclabel>
  <seclabel type=3D'dynamic' model=3D'dac' relabel=3D'yes'>
    <label>+64055:+130</label>
    <imagelabel>+64055:+130</imagelabel>
  </seclabel>
</domain>


** Attachment added: "Screenshot_openindiana_2022-11-06_07:30:05.png"
   https://bugs.launchpad.net/qemu/+bug/1034423/+attachment/5629412/+files/=
Screenshot_openindiana_2022-11-06_07%3A30%3A05.png

--=20
You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1034423

Title:
  Guests running OpenIndiana (and relatives) fail to boot on AMD
  hardware

Status in QEMU:
  Expired

Bug description:
  First observed with OpenSolaris 2009.06, and also applies to the
  latest OpenIndiana release.

  Version: qemu-kvm 1.1.1

  Hardware:

  2 x AMD Opteron 6128 8-core processors, 64GB RAM.

  These guests boot on equivalent Intel hardware.

  To reproduce:

  qemu-kvm -nodefaults -m 512 -cpu host -vga cirrus -usbdevice tablet
  -vnc :99 -monitor stdio -hda drive.img -cdrom oi-
  dev-151a5-live-x86.iso -boot order=3Ddc

  I've tested with "-vga std" and various different emulated CPU types,
  to no effect.

  What happens:

  GRUB loads, and offers multiple boot options, but none work. Some kind
  of kernel panic flies by very fast before restarting the VM, and
  careful use of the screenshot button reveals that it reads as follows:

  panic[cpu0]/thread=3Dfec22de0: BAD TRAP: type=3D8 (#df Double fault)
  rp=3Dfec2b48c add r=3D0

  #df Double fault
  pid=3D0, pc=3D0xault
  pid=3D0, pc=3D0xfe800377, sp=3D0xfec40090, eflags=3D0x202
  cr0: 80050011<pg,wp,et,pe> cr4:b8<pge,pae,pse,de>
  cr2: 0cr3: ae2f000
                gs:            1b0    fs:              0   es:         160 =
  ds:          160
               edi:                0  esi:              0 ebp:             =
0 esp: fec2b4c4
               ebx: c0010015 edx:              0 ecx:             0 eax: fe=
c40400
               trp:                 8  err:              0 eip: fe800377  c=
s:           158
               efl:             202 usp: fec40090  ss:           160
  tss.tss_link:     0x0
  tss.tss_esp0:   0x0
  tss.tss_ss0:     0x160
  tss.tss_esp1:   0x0
  tss.tss_ss1:      0x0
  tss.tss esp2:     0x0
  tss.tss_ss2:      0x0
  tss.tss_cr3:       0xae2f000
  tss.tss_eip:       0xfec40400
  tss.tss_eflags:  0x202
  tss.tss_eax:      0xfec40400
  tss.tss_ebx:      0xc0010015
  tss.tss_ecx:      0xc0010000
  tss.tss_edx:      0x0
  tss.tss_esp:      0xfec40090

  Warning - stack not written to the dumpbuf
  fec2b3c8 unix:due+e4 (8, fec2b48c, 0, 0)
  fec2b478 unix:trap+12fa (fec2b48c, 0, 0)
  fec2b48c unix:_cmntrap+7c (1b0, 0, 160, 160, 0)

  If there's any more, I haven't managed to catch it.

  Solaris 11 does not seem to suffer from the same issue, although the
  first message that appears at boot (after the version info) is "trap:
  Unkown trap type 8 in user mode". Could be related?

  As always, thanks in advance and please let me know if I can help to
  test, or provide any more information.

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1034423/+subscriptions


