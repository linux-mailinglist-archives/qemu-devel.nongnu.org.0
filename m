Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A48A10AACF
	for <lists+qemu-devel@lfdr.de>; Wed, 27 Nov 2019 07:53:28 +0100 (CET)
Received: from localhost ([::1]:35092 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iZrCY-0003xW-EP
	for lists+qemu-devel@lfdr.de; Wed, 27 Nov 2019 01:53:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57037)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <bounces@canonical.com>) id 1iZrA0-000264-1L
 for qemu-devel@nongnu.org; Wed, 27 Nov 2019 01:50:50 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <bounces@canonical.com>) id 1iZr9w-0006CP-JO
 for qemu-devel@nongnu.org; Wed, 27 Nov 2019 01:50:46 -0500
Received: from indium.canonical.com ([91.189.90.7]:40952)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <bounces@canonical.com>)
 id 1iZr9w-0006Bd-Cl
 for qemu-devel@nongnu.org; Wed, 27 Nov 2019 01:50:44 -0500
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1iZr9v-0001Yv-0n
 for <qemu-devel@nongnu.org>; Wed, 27 Nov 2019 06:50:43 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 006DA2E80BA
 for <qemu-devel@nongnu.org>; Wed, 27 Nov 2019 06:50:43 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Wed, 27 Nov 2019 06:35:12 -0000
From: lee <1754542@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Fix Released; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Tags: colo
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: chao.wang lisuiheng zhangckid
X-Launchpad-Bug-Reporter: lee (lisuiheng)
X-Launchpad-Bug-Modifier: lee (lisuiheng)
References: <152056405865.7543.8980677605113063936.malonedeb@wampee.canonical.com>
 <157482230188.6492.6320869898088738043.malone@gac.canonical.com>
 <CAK3tnv+Xi2s2sAmdxDA6ip3YOQUA3St909BF+_LEULCQkeVoNw@mail.gmail.com>
Message-Id: <CAACkWBuALs=XdGhoi2KKSxUrkwqLmDxSeXeUhigLJp5A5m2DHA@mail.gmail.com>
Subject: Re: [Bug 1754542] Re: colo: vm crash with segmentation fault
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="c597c3229eb023b1e626162d5947141bf7befb13";
 Instance="production-secrets-lazr.conf"
X-Launchpad-Hash: 07993692afa30c1de5bba5c4b92eb1e72a1ba3ed
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
Reply-To: Bug 1754542 <1754542@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Zhang Chen
I use sysbench compare Host=E3=80=81Qemu Native VM(virtio-blk)=E3=80=81Qemu=
 Native VM=E3=80=81Qemu
colo disk performance.
The result in below attachment.
Qemu Native VM(virtio-blk) use -device virtio-blk-pci
Qemu colo follow https://wiki.qemu.org/Features/COLO
Thanks
Lee

Zhang Chen <zhangckid@gmail.com> =E4=BA=8E2019=E5=B9=B411=E6=9C=8827=E6=97=
=A5=E5=91=A8=E4=B8=89 =E4=B8=8A=E5=8D=8811:15=E5=86=99=E9=81=93=EF=BC=9A

> Hi Lee,
>
> Can you introduce to me the detail test step about disk performance?
> I want to look into it when I have time.
>
> Thanks
> Zhang Chen
>
> On Wed, Nov 27, 2019 at 10:50 AM lee <1754542@bugs.launchpad.net> wrote:
> >
> > Hi Zhang Chen ,
> >
> > I try colo follow https://wiki.qemu.org/Features/COLO.
> > It work well. But disk performance slow.
> > Only host performance 10%.
> > Can virtio blk supported by current colo?
> > Or is there any other way to improve disk performance.
> >
> > Thanks
> > Zhang Chen
> >
> > --
> > You received this bug notification because you are subscribed to the bug
> > report.
> > https://bugs.launchpad.net/bugs/1754542
> >
> > Title:
> >   colo:  vm crash with segmentation fault
> >
> > Status in QEMU:
> >   Fix Released
> >
> > Bug description:
> >   I use Arch Linux x86_64
> >   Zhang Chen's(https://github.com/zhangckid/qemu/tree/qemu-colo-18mar10)
> >   Following document 'COLO-FT.txt',
> >   I test colo feature on my hosts
> >
> >   I run this command
> >   Primary:
> >   sudo /usr/local/bin/qemu-system-x86_64 -enable-kvm -m 2048 -smp 2 -qmp
> stdio -name primary \
> >   -device piix3-usb-uhci \
> >   -device usb-tablet -netdev tap,id=3Dhn0,vhost=3Doff \
> >   -device virtio-net-pci,id=3Dnet-pci0,netdev=3Dhn0 \
> >   -drive
> if=3Dvirtio,id=3Dprimary-disk0,driver=3Dquorum,read-pattern=3Dfifo,vote-t=
hreshold=3D1,\
> >   children.0.file.filename=3D/var/lib/libvirt/images/1.raw,\
> >   children.0.driver=3Draw -S
> >
> >   Secondary:
> >   sudo /usr/local/bin/qemu-system-x86_64 -enable-kvm -m 2048 -smp 2 -qmp
> stdio -name secondary \
> >   -device piix3-usb-uhci \
> >   -device usb-tablet -netdev tap,id=3Dhn0,vhost=3Doff \
> >   -device virtio-net-pci,id=3Dnet-pci0,netdev=3Dhn0 \
> >   -drive
> if=3Dnone,id=3Dsecondary-disk0,file.filename=3D/var/lib/libvirt/images/2.=
raw,driver=3Draw,node-name=3Dnode0
> \
> >   -drive if=3Dvirtio,id=3Dactive-disk0,driver=3Dreplication,mode=3Dseco=
ndary,\
> >   file.driver=3Dqcow2,top-id=3Dactive-disk0,\
> >   file.file.filename=3D/mnt/ramfs/active_disk.img,\
> >   file.backing.driver=3Dqcow2,\
> >   file.backing.file.filename=3D/mnt/ramfs/hidden_disk.img,\
> >   file.backing.backing=3Dsecondary-disk0 \
> >   -incoming tcp:0:8888
> >
> >   Secondary:
> >   {'execute':'qmp_capabilities'}
> >   { 'execute': 'nbd-server-start',
> >     'arguments': {'addr': {'type': 'inet', 'data': {'host':
> '192.168.0.34', 'port': '8889'} } }
> >   }
> >   {'execute': 'nbd-server-add', 'arguments': {'device':
> 'secondary-disk0', 'writable': true } }
> >
> >   Primary:
> >   {'execute':'qmp_capabilities'}
> >   { 'execute': 'human-monitor-command',
> >     'arguments': {'command-line': 'drive_add -n buddy
> driver=3Dreplication,mode=3Dprimary,file.driver=3Dnbd,file.host=3D192.168=
.0.34,file.port=3D8889,file.export=3Dsecondary-disk0,node-name=3Dnbd_client=
0'}}
> >   { 'execute':'x-blockdev-change', 'arguments':{'parent':
> 'primary-disk0', 'node': 'nbd_client0' } }
> >   { 'execute': 'migrate-set-capabilities',
> >         'arguments': {'capabilities': [ {'capability': 'x-colo',
> 'state': true } ] } }
> >   { 'execute': 'migrate', 'arguments': {'uri': 'tcp:192.168.0.34:8888'
> } }
> >   And two VM with cash
> >   Primary:
> >   {"timestamp": {"seconds": 1520763655, "microseconds": 511415},
> "event": "RESUME"}
> >   [1]    329 segmentation fault  sudo /usr/local/bin/qemu-system-x86_64
> -boot c -enable-kvm -m 2048 -smp 2 -qm
> >
> >   Secondary:
> >   {"timestamp": {"seconds": 1520763655, "microseconds": 510907},
> "event": "RESUME"}
> >   [1]    367 segmentation fault  sudo /usr/local/bin/qemu-system-x86_64
> -boot c -enable-kvm -m 2048 -smp 2 -qm
> >
> > To manage notifications about this bug go to:
> > https://bugs.launchpad.net/qemu/+bug/1754542/+subscriptions
>
> --
> You received this bug notification because you are subscribed to the bug
> report.
> https://bugs.launchpad.net/bugs/1754542
>
> Title:
>   colo:  vm crash with segmentation fault
>
> Status in QEMU:
>   Fix Released
>
> Bug description:
>   I use Arch Linux x86_64
>   Zhang Chen's(https://github.com/zhangckid/qemu/tree/qemu-colo-18mar10)
>   Following document 'COLO-FT.txt',
>   I test colo feature on my hosts
>
>   I run this command
>   Primary:
>   sudo /usr/local/bin/qemu-system-x86_64 -enable-kvm -m 2048 -smp 2 -qmp
> stdio -name primary \
>   -device piix3-usb-uhci \
>   -device usb-tablet -netdev tap,id=3Dhn0,vhost=3Doff \
>   -device virtio-net-pci,id=3Dnet-pci0,netdev=3Dhn0 \
>   -drive
> if=3Dvirtio,id=3Dprimary-disk0,driver=3Dquorum,read-pattern=3Dfifo,vote-t=
hreshold=3D1,\
>   children.0.file.filename=3D/var/lib/libvirt/images/1.raw,\
>   children.0.driver=3Draw -S
>
>   Secondary:
>   sudo /usr/local/bin/qemu-system-x86_64 -enable-kvm -m 2048 -smp 2 -qmp
> stdio -name secondary \
>   -device piix3-usb-uhci \
>   -device usb-tablet -netdev tap,id=3Dhn0,vhost=3Doff \
>   -device virtio-net-pci,id=3Dnet-pci0,netdev=3Dhn0 \
>   -drive
> if=3Dnone,id=3Dsecondary-disk0,file.filename=3D/var/lib/libvirt/images/2.=
raw,driver=3Draw,node-name=3Dnode0
> \
>   -drive if=3Dvirtio,id=3Dactive-disk0,driver=3Dreplication,mode=3Dsecond=
ary,\
>   file.driver=3Dqcow2,top-id=3Dactive-disk0,\
>   file.file.filename=3D/mnt/ramfs/active_disk.img,\
>   file.backing.driver=3Dqcow2,\
>   file.backing.file.filename=3D/mnt/ramfs/hidden_disk.img,\
>   file.backing.backing=3Dsecondary-disk0 \
>   -incoming tcp:0:8888
>
>   Secondary:
>   {'execute':'qmp_capabilities'}
>   { 'execute': 'nbd-server-start',
>     'arguments': {'addr': {'type': 'inet', 'data': {'host':
> '192.168.0.34', 'port': '8889'} } }
>   }
>   {'execute': 'nbd-server-add', 'arguments': {'device': 'secondary-disk0',
> 'writable': true } }
>
>   Primary:
>   {'execute':'qmp_capabilities'}
>   { 'execute': 'human-monitor-command',
>     'arguments': {'command-line': 'drive_add -n buddy
> driver=3Dreplication,mode=3Dprimary,file.driver=3Dnbd,file.host=3D192.168=
.0.34,file.port=3D8889,file.export=3Dsecondary-disk0,node-name=3Dnbd_client=
0'}}
>   { 'execute':'x-blockdev-change', 'arguments':{'parent': 'primary-disk0',
> 'node': 'nbd_client0' } }
>   { 'execute': 'migrate-set-capabilities',
>         'arguments': {'capabilities': [ {'capability': 'x-colo', 'state':
> true } ] } }
>   { 'execute': 'migrate', 'arguments': {'uri': 'tcp:192.168.0.34:8888' } }
>   And two VM with cash
>   Primary:
>   {"timestamp": {"seconds": 1520763655, "microseconds": 511415}, "event":
> "RESUME"}
>   [1]    329 segmentation fault  sudo /usr/local/bin/qemu-system-x86_64
> -boot c -enable-kvm -m 2048 -smp 2 -qm
>
>   Secondary:
>   {"timestamp": {"seconds": 1520763655, "microseconds": 510907}, "event":
> "RESUME"}
>   [1]    367 segmentation fault  sudo /usr/local/bin/qemu-system-x86_64
> -boot c -enable-kvm -m 2048 -smp 2 -qm
>
> To manage notifications about this bug go to:
> https://bugs.launchpad.net/qemu/+bug/1754542/+subscriptions
>


** Attachment added: "Qemu Host vs Qemu Native VM vs Qemu colo.xlsx"
   https://bugs.launchpad.net/bugs/1754542/+attachment/5308083/+files/Qemu%=
20Host%20vs%20Qemu%20Native%20VM%20vs%20Qemu%20colo.xlsx

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1754542

Title:
  colo:  vm crash with segmentation fault

Status in QEMU:
  Fix Released

Bug description:
  I use Arch Linux x86_64
  Zhang Chen's(https://github.com/zhangckid/qemu/tree/qemu-colo-18mar10)
  Following document 'COLO-FT.txt',
  I test colo feature on my hosts

  I run this command
  Primary:
  sudo /usr/local/bin/qemu-system-x86_64 -enable-kvm -m 2048 -smp 2 -qmp st=
dio -name primary \
  -device piix3-usb-uhci \
  -device usb-tablet -netdev tap,id=3Dhn0,vhost=3Doff \
  -device virtio-net-pci,id=3Dnet-pci0,netdev=3Dhn0 \
  -drive if=3Dvirtio,id=3Dprimary-disk0,driver=3Dquorum,read-pattern=3Dfifo=
,vote-threshold=3D1,\
  children.0.file.filename=3D/var/lib/libvirt/images/1.raw,\
  children.0.driver=3Draw -S

  Secondary:
  sudo /usr/local/bin/qemu-system-x86_64 -enable-kvm -m 2048 -smp 2 -qmp st=
dio -name secondary \
  -device piix3-usb-uhci \
  -device usb-tablet -netdev tap,id=3Dhn0,vhost=3Doff \
  -device virtio-net-pci,id=3Dnet-pci0,netdev=3Dhn0 \
  -drive if=3Dnone,id=3Dsecondary-disk0,file.filename=3D/var/lib/libvirt/im=
ages/2.raw,driver=3Draw,node-name=3Dnode0 \
  -drive if=3Dvirtio,id=3Dactive-disk0,driver=3Dreplication,mode=3Dsecondar=
y,\
  file.driver=3Dqcow2,top-id=3Dactive-disk0,\
  file.file.filename=3D/mnt/ramfs/active_disk.img,\
  file.backing.driver=3Dqcow2,\
  file.backing.file.filename=3D/mnt/ramfs/hidden_disk.img,\
  file.backing.backing=3Dsecondary-disk0 \
  -incoming tcp:0:8888

  Secondary:
  {'execute':'qmp_capabilities'}
  { 'execute': 'nbd-server-start',
    'arguments': {'addr': {'type': 'inet', 'data': {'host': '192.168.0.34',=
 'port': '8889'} } }
  }
  {'execute': 'nbd-server-add', 'arguments': {'device': 'secondary-disk0', =
'writable': true } }

  Primary:
  {'execute':'qmp_capabilities'}
  { 'execute': 'human-monitor-command',
    'arguments': {'command-line': 'drive_add -n buddy driver=3Dreplication,=
mode=3Dprimary,file.driver=3Dnbd,file.host=3D192.168.0.34,file.port=3D8889,=
file.export=3Dsecondary-disk0,node-name=3Dnbd_client0'}}
  { 'execute':'x-blockdev-change', 'arguments':{'parent': 'primary-disk0', =
'node': 'nbd_client0' } }
  { 'execute': 'migrate-set-capabilities',
        'arguments': {'capabilities': [ {'capability': 'x-colo', 'state': t=
rue } ] } }
  { 'execute': 'migrate', 'arguments': {'uri': 'tcp:192.168.0.34:8888' } }
  And two VM with cash
  Primary:
  {"timestamp": {"seconds": 1520763655, "microseconds": 511415}, "event": "=
RESUME"}
  [1]    329 segmentation fault  sudo /usr/local/bin/qemu-system-x86_64 -bo=
ot c -enable-kvm -m 2048 -smp 2 -qm

  Secondary:
  {"timestamp": {"seconds": 1520763655, "microseconds": 510907}, "event": "=
RESUME"}
  [1]    367 segmentation fault  sudo /usr/local/bin/qemu-system-x86_64 -bo=
ot c -enable-kvm -m 2048 -smp 2 -qm

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1754542/+subscriptions

