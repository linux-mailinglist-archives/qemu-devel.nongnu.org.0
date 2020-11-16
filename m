Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 53A552B502E
	for <lists+qemu-devel@lfdr.de>; Mon, 16 Nov 2020 19:51:35 +0100 (CET)
Received: from localhost ([::1]:37312 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kejbC-0006Lv-9N
	for lists+qemu-devel@lfdr.de; Mon, 16 Nov 2020 13:51:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35748)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1kej7n-0007yK-Ne
 for qemu-devel@nongnu.org; Mon, 16 Nov 2020 13:21:11 -0500
Received: from indium.canonical.com ([91.189.90.7]:41966)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1kej7h-0002tC-B5
 for qemu-devel@nongnu.org; Mon, 16 Nov 2020 13:21:11 -0500
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1kej7e-0001E3-Bs
 for <qemu-devel@nongnu.org>; Mon, 16 Nov 2020 18:21:02 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 4F15F2E8148
 for <qemu-devel@nongnu.org>; Mon, 16 Nov 2020 18:20:59 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Mon, 16 Nov 2020 18:12:02 -0000
From: Thomas Huth <1731957@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Invalid; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: dmsimard th-huth vlad-belogrudov
X-Launchpad-Bug-Reporter: Vladislav Belogrudov (vlad-belogrudov)
X-Launchpad-Bug-Modifier: Thomas Huth (th-huth)
References: <151058776720.8536.5546556835888911638.malonedeb@wampee.canonical.com>
Message-Id: <160555032302.27921.17940026771514047386.malone@chaenomeles.canonical.com>
Subject: [Bug 1731957] Re: qemu-kvm exits with console permission problems
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="a2ee2035671f86427804714f331b9ff7fecaef7e"; Instance="production"
X-Launchpad-Hash: a57366dfec806e3082ecd4859843c5e0cc095ec1
Received-SPF: none client-ip=91.189.90.7; envelope-from=bounces@canonical.com;
 helo=indium.canonical.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/16 13:11:09
X-ACL-Warn: Detected OS   = Linux 3.11 and newer [fuzzy]
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
Reply-To: Bug 1731957 <1731957@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Sounds like this is/was rather an issue with libvirt or openstack, but
certainly not qemu. If the problem still persists, please report it to
those projects first. Thanks!

** Changed in: qemu
       Status: New =3D> Invalid

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1731957

Title:
  qemu-kvm exits with console permission problems

Status in QEMU:
  Invalid

Bug description:
  # rpm -qa | grep qemu
  qemu-img-ev-2.9.0-16.el7_4.8.1.x86_64
  qemu-kvm-ev-2.9.0-16.el7_4.8.1.x86_64
  ipxe-roms-qemu-20170123-1.git4e85b27.el7_4.1.noarch
  libvirt-daemon-driver-qemu-3.2.0-14.el7_4.3.x86_64
  qemu-kvm-common-ev-2.9.0-16.el7_4.8.1.x86_64

  qemu.conf:
  stdio_handler =3D "file"

  libvirtd runs as root with '/usr/sbin/libvirtd --listen'

  we run openstack, it creates an instance like this:

  2017-11-13 15:17:14.143+0000: starting up libvirt version: 3.2.0, package=
: 14.el7_4.3 (Unknown, 2017-09-05-02:55:29, x86-ol7-builder
  -02.us.oracle.com), qemu version: 2.9.0(qemu-kvm-ev-2.9.0-16.el7_4.8.1), =
hostname: compute6
  LC_ALL=3DC PATH=3D/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin=
:/bin HOME=3D/root QEMU_AUDIO_DRV=3Dnone /usr/libexec/qemu-kvm -name guest=
=3Dinstance-00000016,debug-threads=3Don -S -object secret,id=3DmasterKey0,f=
ormat=3Draw,file=3D/var/lib/libvirt/qemu/domain-1-instance-00000016/master-=
key.aes -machine pc-i440fx-rhel7.4.0,accel=3Dkvm,usb=3Doff,dump-guest-core=
=3Doff -cpu Haswell-noTSX,vme=3Don,ss=3Don,f16c=3Don,rdrand=3Don,hypervisor=
=3Don,arat=3Don,tsc_adjust=3Don,xsaveopt=3Don,abm=3Don,invpcid=3Doff -m 64 =
-realtime mlock=3Doff -smp 1,sockets=3D1,cores=3D1,threads=3D1 -uuid 48ea95=
7f-6fbc-4b43-83c8-8c5e83a2ffdf -smbios 'type=3D1,manufacturer=3DOpenStack F=
oundation,product=3DOpenStack Nova,version=3D13.0.0,serial=3Dde115ee2-a86f-=
432d-96fe-bec91b0a5748,uuid=3D48ea957f-6fbc-4b43-83c8-8c5e83a2ffdf,family=
=3DVirtual Machine' -no-user-config -nodefaults -chardev socket,id=3Dcharmo=
nitor,path=3D/var/lib/libvirt/qemu/domain-1-instance-00000016/monitor.sock,=
server,nowait -mon chardev=3Dcharmonitor,id=3Dmonitor,mode=3Dcontrol -rtc b=
ase=3Dutc,driftfix=3Dslew -global kvm-pit.lost_tick_policy=3Ddelay -no-hpet=
 -no-shutdown -boot
   strict=3Don -device piix3-usb-uhci,id=3Dusb,bus=3Dpci.0,addr=3D0x1.0x2 -=
drive file=3D/var/lib/nova/instances/48ea957f-6fbc-4b43-83c8-8c5e83a2ffdf/d=
isk,format=3Dqcow2,if=3Dnone,id=3Ddrive-virtio-disk0,cache=3Dnone -device v=
irtio-blk-pci,scsi=3Doff,bus=3Dpci.0,addr=3D0x4,drive=3Ddrive-virtio-disk0,=
id=3Dvirtio-disk0,bootindex=3D1 -netdev tap,fd=3D26,id=3Dhostnet0,vhost=3Do=
n,vhostfd=3D27 -device virtio-net-pci,netdev=3Dhostnet0,id=3Dnet0,mac=3Dfa:=
16:3e:bf:f5:40,bus=3Dpci.0,addr=3D0x3 -chardev pty,id=3Dcharserial0,logfile=
=3D/var/lib/nova/instances/48ea957f-6fbc-4b43-83c8-8c5e83
  a2ffdf/console.log,logappend=3Doff -device isa-serial,chardev=3Dcharseria=
l0,id=3Dserial0 -device usb-tablet,id=3Dinput0,bus=3Dusb.0,port=3D1 -vnc 0.=
0.0.0:1 -k en-us -device cirrus-vga,id=3Dvideo0,bus=3Dpci.0,addr=3D0x2 -dev=
ice virtio-balloon-pci,id=3Dballoon0,bus=3Dpci.0,addr=3D0x5 -msg =

  timestamp=3Don

  With older qemu like 2.5 or 2.6 console log belongs to qemu:qemu and the =
process starts successfully.
  With 2.9 it fails and console.log is left root:root :

  2017-11-13 15:17:14.173+0000: 26010: debug : qemuProcessHook:2738 : Hook =
complete ret=3D0
  2017-11-13 15:17:14.173+0000: 26010: debug : virExec:699 : Done hook 0
  2017-11-13 15:17:14.173+0000: 26010: debug : virExec:736 : Setting child =
uid:gid to 42427:42427 with caps 0
  2017-11-13 15:17:14.173+0000: 26010: debug : virCommandHandshakeChild:435=
 : Notifying parent for handshake start on 29
  2017-11-13 15:17:14.173+0000: 26010: debug : virCommandHandshakeChild:443=
 : Waiting on parent for handshake complete on 30
  2017-11-13 15:17:14.192+0000: 26010: debug : virFileClose:110 : Closed fd=
 29
  2017-11-13 15:17:14.192+0000: 26010: debug : virFileClose:110 : Closed fd=
 30
  2017-11-13 15:17:14.192+0000: 26010: debug : virCommandHandshakeChild:463=
 : Handshake with parent is done
  2017-11-13T15:17:14.232713Z qemu-kvm: -chardev pty,id=3Dcharserial0,logfi=
le=3D/var/lib/nova/instances/48ea957f-6fbc-4b43-83c8-8c5e83a2ffdf/console.l=
og,logappend=3Doff: Unable to open logfile /var/lib/nova/instances/48ea957f=
-6fbc-4b43-83c8-8c5e83a2ffdf/console.log: Permission denied
  2017-11-13 15:17:14.321+0000: shutting down, reason=3Dfailed

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1731957/+subscriptions

