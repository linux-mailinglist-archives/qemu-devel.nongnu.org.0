Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B697129152
	for <lists+qemu-devel@lfdr.de>; Mon, 23 Dec 2019 05:32:31 +0100 (CET)
Received: from localhost ([::1]:53270 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ijFOP-0004Aw-GR
	for lists+qemu-devel@lfdr.de; Sun, 22 Dec 2019 23:32:29 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42332)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <bounces@canonical.com>) id 1ijFM3-0002Nj-7Y
 for qemu-devel@nongnu.org; Sun, 22 Dec 2019 23:30:06 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <bounces@canonical.com>) id 1ijFM0-0000ym-Fl
 for qemu-devel@nongnu.org; Sun, 22 Dec 2019 23:30:02 -0500
Received: from indium.canonical.com ([91.189.90.7]:45524)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <bounces@canonical.com>)
 id 1ijFLz-0000u8-8D
 for qemu-devel@nongnu.org; Sun, 22 Dec 2019 23:29:59 -0500
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1ijFLw-0006ln-TG
 for <qemu-devel@nongnu.org>; Mon, 23 Dec 2019 04:29:56 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id D2EC82E80C3
 for <qemu-devel@nongnu.org>; Mon, 23 Dec 2019 04:29:56 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Mon, 23 Dec 2019 04:17:31 -0000
From: Launchpad Bug Tracker <1605506@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Expired; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Tags: qemu
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: janitor justcaca th-huth
X-Launchpad-Bug-Reporter: lisiheng (justcaca)
X-Launchpad-Bug-Modifier: Launchpad Janitor (janitor)
References: <20160722071222.4694.55918.malonedeb@wampee.canonical.com>
Message-Id: <157707465149.29966.6155556800251106417.malone@loganberry.canonical.com>
Subject: [Bug 1605506] Re: qemu driver_mirror error "Operation not permitted"
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="bceb5ef013b87ef7aafe0755545ceb689ca7ac60";
 Instance="production-secrets-lazr.conf"
X-Launchpad-Hash: 7fd668f2568d64a514929ed950f85495dd129e73
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 91.189.90.7
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
Reply-To: Bug 1605506 <1605506@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

[Expired for QEMU because there has been no activity for 60 days.]

** Changed in: qemu
       Status: Incomplete =3D> Expired

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1605506

Title:
  qemu driver_mirror error "Operation not permitted"

Status in QEMU:
  Expired

Bug description:
  I use libvirtd to call qemu drive_mirror return error message "Operation =
not permitted", But directly run qemu and call drive_mirror is OK;
  when drive_mirror target is logic device return error message "Operation =
not permitted",But the file is OK;

  Operating Environment=EF=BC=9A
  OS:ubuntu 14.04
  kernel:3.16.0-28-generic
  libvirt-bin version: 1.2.2-0ubuntu13.1.17
  qemu:2.5.0 or 2.6.0
  run vm user: root
  =EF=BC=88retry in redhat7.2 have the same problem=EF=BC=81=EF=BC=89

  Here is my running process:
  libvirtd call
  prepare libvirt xml   libvirt.xml
  <?xml version=3D"1.0"?><domain type=3D"kvm">
      <name>i-745F35DC</name>
      <memory>65536</memory>
      <vcpu>1</vcpu>
      <cpu mode=3D"host-model"><model fallback=3D"allow"/><topology sockets=
=3D"1" threads=3D"1" cores=3D"1"/></cpu>
      <os><type>hvm</type><boot dev=3D"cdrom"/><boot dev=3D"hd"/></os>
      <features><acpi/><apic/><pae/></features>
      <on_poweroff>destroy</on_poweroff>
      <on_reboot>restart</on_reboot>
      <on_crash>destroy</on_crash>
      <devices>
          <emulator>/usr/local/qemu-2.5.0-20160720/bin/qemu-system-x86_64</=
emulator>
          <graphics type=3D"vnc" passwd=3D"" autoport=3D"yes" keymap=3D"en-=
us" listen=3D"0.0.0.0"/>
          <disk type=3D"file" device=3D"disk">
              <driver name=3D"qemu" type=3D"raw" cache=3D"none"/>
              <source file=3D"/tmp/image.raw"/>
              <target dev=3D"hda" bus=3D"ide"/>
              <serial>bc-system</serial>
          </disk>
      </devices>
      <clock offset=3D"localtime"/>
  </domain>

  virsh create libvirt.xml
  root@test:/opt/run/instance/i-745F35DC# virsh list
   Id    Name                           State
  ----------------------------------------------------
   2     i-745F35DC                     running
  call drive_mirror:
  virsh qemu-monitor-command --hmp i-745F35DC 'drive_mirror -n -f drive-ide=
0-0-0 /dev/vg_bc_local/test raw'
  Could not open '/dev/vg_bc_local/test': Operation not permitted

  directly run qemu and call drive_mirror:
  /usr/local/qemu-2.5.0-20160720/bin/qemu-system-x86_64 -hda /tmp/image.raw=
 -m 64 --enable-kvm -vnc :51 -monitor stdio
  QEMU 2.5.0 monitor - type 'help' for more information
  (qemu) info block
  ide0-hd0 (#block135): /tmp/image.raw (raw)
      Cache mode:       writeback
  (qemu) drive_mirror -n -f ide0-hd0 /dev/vg_bc_local/test raw
  (qemu) info block-jobs
  Type mirror, device ide0-hd0: Completed 41126400 of 41126400 bytes, speed=
 limit 0 bytes/s
  (qemu) block_job_cancel ide0-hd0
  (qemu) info block-jobs
  No active jobs

  It is OK!!!

  =

  Here is my debugging process:
  Recompile qemu-2.5.0 to  enable debug
  ../configure --prefix=3D/usr/local/qemu-2.5.0-20160720 --enable-trace-bac=
kend=3Dsimple --enable-werror --disable-xen --disable-virtfs --enable-kvm -=
-enable-seccomp --enable-docs --enable-debug-tcg --enable-vnc-sasl --enable=
-linux-aio --enable-lzo --enable-snappy --enable-usb-redir --enable-vnc-png=
 --disable-vnc-jpeg --enable-uuid --disable-vhost-scsi --enable-rbd --block=
-drv-rw-whitelist=3Dqcow2,raw,file,host_device,blkdebug,nbd,iscsi,rbd,cdp -=
-block-drv-ro-whitelist=3Dvmdk,vhdx,vpc --target-list=3Dx86_64-softmmu CFLA=
GS=3D-O0

  Use libvirtd to Re-run VM and debug by gdb
  VM process info:
  root      7804     1  0 10:45 ?        00:00:10 /usr/local/qemu-2.5.0-201=
60720/bin/qemu-system-x86_64 -name i-745F35DC -S -machine pc-i440fx-2.5,acc=
el=3Dkvm,usb=3Doff -cpu Westmere,+invpcid,+erms,+bmi2,+smep,+avx2,+bmi1,+fs=
gsbase,+abm,+rdtscp,+pdpe1gb,+rdrand,+f16c,+avx,+osxsave,+xsave,+tsc-deadli=
ne,+movbe,+pcid,+pdcm,+xtpr,+fma,+tm2,+est,+vmx,+ds_cpl,+monitor,+dtes64,+p=
clmuldq,+pbe,+tm,+ht,+ss,+acpi,+ds,+vme -m 64 -realtime mlock=3Doff -smp 1,=
sockets=3D1,cores=3D1,threads=3D1 -uuid ef55dfa6-b82e-488d-a7fc-4c882f8091a=
b -no-user-config -nodefaults -chardev socket,id=3Dcharmonitor,path=3D/var/=
lib/libvirt/qemu/i-745F35DC.monitor,server,nowait -mon chardev=3Dcharmonito=
r,id=3Dmonitor,mode=3Dcontrol -rtc base=3Dlocaltime -no-shutdown -boot stri=
ct=3Don -device piix3-usb-uhci,id=3Dusb,bus=3Dpci.0,addr=3D0x1.0x2 -drive f=
ile=3D/tmp/image.raw,if=3Dnone,id=3Ddrive-ide0-0-0,format=3Draw,serial=3Dbc=
-system,cache=3Dnone -device ide-hd,bus=3Dide.0,unit=3D0,drive=3Ddrive-ide0=
-0-0,id=3Dide0-0-0,bootindex=3D2 -vnc 0.0.0.0:0,password -k en-us -device c=
irrus-vga,id=3Dvideo0,bus=3Dpci.0,addr=3D0x2 -device virtio-balloon-pci,id=
=3Dballoon0,bus=3Dpci.0,addr=3D0x3

  gdb -p  7804
  set breakpoint
  (gdb) i b
  Num     Type           Disp Enb Address            What
  1       breakpoint     keep y   0x00007f51d9e92cb1 in qmp_drive_mirror at=
 /opt/qemu/qemu-2.5.0/blockdev.c:3310
  2       breakpoint     keep y   0x00007f51da1252f2 in raw_open_common at =
/opt/qemu/qemu-2.5.0/block/raw-posix.c:457
  3       breakpoint     keep y   0x00007f51da12500f in raw_parse_flags at =
/opt/qemu/qemu-2.5.0/block/raw-posix.c:358
  (gdb)

  call drive_mirror and debug:

  (gdb)
  raw_open_common (bs=3D0x7f4b27259ab0, options=3D0x7f4b27480290, bdrv_flag=
s=3D24674, open_flags=3D0, errp=3D0x7fff4a19f548)
      at /opt/qemu/qemu-2.5.0/block/raw-posix.c:484
  484        s->fd =3D -1;
  (gdb) n
  485        fd =3D qemu_open(filename, s->open_flags, 0644);
  (gdb) s
  qemu_open (name=3D0x7f4b2642b5c0 "/dev/vg_bc_local/test", flags=3D2) at /=
opt/qemu/qemu-2.5.0/util/osdep.c:177
  177        int mode =3D 0;
  (gdb) n
  183        if (strstart(name, "/dev/fdset/", &fdset_id_str)) {
  (gdb)
  214        if (flags & O_CREAT) {
  (gdb)
  223    char arg[1000] =3D {0};
  (gdb)
  227        ret =3D open(name, flags , mode);
  (gdb) p name
  $1 =3D 0x7f4b2642b5c0 "/dev/vg_bc_local/test"
  (gdb) p flags
  $2 =3D 2
  (gdb) p mode
  $3 =3D 0
  (gdb) n
  (gdb) p ret
  $4 =3D -1

  get system erroron is :Operation not permitted  =

  !!!!!!!!!!!!!!

  =

  Re-run VM Directly  and debug by gdb
  /usr/local/qemu-2.5.0-20160720/bin/qemu-system-x86_64 -hda /tmp/image.raw=
 -m 64 --enable-kvm -vnc :51 -monitor stdio
  (qemu) info block
  ide0-hd0 (#block135): /tmp/image.raw (raw)
      Cache mode:       writeback
  (qemu) drive_mirror -n -f ide0-hd0 /dev/vg_bc_local/test raw

  gdb debug:
  (gdb) i b
  Num     Type           Disp Enb Address            What
  1       breakpoint     keep y   0x00007f51d9e92cb1 in qmp_drive_mirror at=
 /opt/qemu/qemu-2.5.0/blockdev.c:3310
  2       breakpoint     keep y   0x00007f51da1252f2 in raw_open_common at =
/opt/qemu/qemu-2.5.0/block/raw-posix.c:457
  3       breakpoint     keep y   0x00007f51da12500f in raw_parse_flags at =
/opt/qemu/qemu-2.5.0/block/raw-posix.c:358
  (gdb)
  raw_open_common (bs=3D0x7f51dc15d350, options=3D0x7f51dc083110, bdrv_flag=
s=3D24642, open_flags=3D0, errp=3D0x7fff5aaa9738)
      at /opt/qemu/qemu-2.5.0/block/raw-posix.c:484
  484        s->fd =3D -1;
  (gdb) n
  485        fd =3D qemu_open(filename, s->open_flags, 0644);
  (gdb) s
  qemu_open (name=3D0x7f51dca09230 "/dev/vg_bc_local/test", flags=3D2) at /=
opt/qemu/qemu-2.5.0/util/osdep.c:177
  177        int mode =3D 0;
  (gdb) n
  183        if (strstart(name, "/dev/fdset/", &fdset_id_str)) {
  (gdb)
  214        if (flags & O_CREAT) {
  (gdb)
  223    char arg[1000] =3D {0};
  (gdb)
  227        ret =3D open(name, flags , mode);
  (gdb) p name
  $1 =3D 0x7f51dca09230 "/dev/vg_bc_local/test"
  (gdb) p flags
  $2 =3D 2
  (gdb) p mode
  $3 =3D 0
  (gdb) n
  (gdb) p ret
  $4 =3D 16
  (gdb)

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1605506/+subscriptions

