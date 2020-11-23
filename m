Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 125BD2C0EC0
	for <lists+qemu-devel@lfdr.de>; Mon, 23 Nov 2020 16:27:43 +0100 (CET)
Received: from localhost ([::1]:36218 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1khDkj-0003DN-N5
	for lists+qemu-devel@lfdr.de; Mon, 23 Nov 2020 10:27:41 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:54226)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1khDjF-0002gO-IJ
 for qemu-devel@nongnu.org; Mon, 23 Nov 2020 10:26:09 -0500
Received: from indium.canonical.com ([91.189.90.7]:51378)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1khDjC-0000ik-86
 for qemu-devel@nongnu.org; Mon, 23 Nov 2020 10:26:09 -0500
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1khDj8-0007XW-G8
 for <qemu-devel@nongnu.org>; Mon, 23 Nov 2020 15:26:02 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 1B8192E817F
 for <qemu-devel@nongnu.org>; Mon, 23 Nov 2020 15:26:01 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Mon, 23 Nov 2020 15:17:15 -0000
From: Balazs Gibizer <1761798@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=nova; status=Confirmed; importance=Medium;
 assignee=None; 
X-Launchpad-Bug: product=qemu; status=New; importance=Undecided; assignee=None;
X-Launchpad-Bug-Tags: libvirt live-migration
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: balazs-gibizer dgilbert-h dsutyagin kashyapc
 melwitt mriedem
X-Launchpad-Bug-Reporter: Matt Riedemann (mriedem)
X-Launchpad-Bug-Modifier: Balazs Gibizer (balazs-gibizer)
References: <152303245198.3233.1033096993665779324.malonedeb@wampee.canonical.com>
Message-Id: <160614463567.17452.15089013146657407327.malone@wampee.canonical.com>
Subject: [Bug 1761798] Re: live migration intermittently fails in CI with "VQ
 0 size 0x80 Guest index 0x12c inconsistent with Host index 0x134:
 delta 0xfff8"
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="c35ff22711d15549e2303ae18ae521fd91f6bf00"; Instance="production"
X-Launchpad-Hash: 275cbeb108d24aac6b03fdb63bc09a90a2c25f94
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
Reply-To: Bug 1761798 <1761798@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Source node =

https://zuul.opendev.org/t/openstack/build/d50877ae15db4022b82f4bb1d1d52cea=
/log/logs/subnode-2/libvirt/qemu/instance-0000001a.txt

2020-11-20 14:25:24.887+0000: starting up libvirt version: 6.0.0,
package: 0ubuntu8.4~cloud0 (Openstack Ubuntu Testing Bot <openstack-
testing-bot@ubuntu.com> Tue, 15 Sep 2020 20:36:28 +0000), qemu version:
4.2.1Debian 1:4.2-3ubuntu6.7~cloud0, kernel: 4.15.0-124-generic,
hostname: ubuntu-bionic-ovh-bhs1-0021872195

LC_ALL=3DC \

PATH=3D/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin \

HOME=3D/var/lib/libvirt/qemu/domain-19-instance-0000001a \

XDG_DATA_HOME=3D/var/lib/libvirt/qemu/domain-19-instance-
0000001a/.local/share \

XDG_CACHE_HOME=3D/var/lib/libvirt/qemu/domain-19-instance-0000001a/.cache
\

XDG_CONFIG_HOME=3D/var/lib/libvirt/qemu/domain-19-instance-
0000001a/.config \

QEMU_AUDIO_DRV=3Dnone \

/usr/bin/qemu-system-x86_64 \

-name guest=3Dinstance-0000001a,debug-threads=3Don \

-S \

-object
secret,id=3DmasterKey0,format=3Draw,file=3D/var/lib/libvirt/qemu/domain-19
-instance-0000001a/master-key.aes \

-machine pc-i440fx-4.2,accel=3Dtcg,usb=3Doff,dump-guest-core=3Doff \

-cpu qemu64,hypervisor=3Don,lahf-lm=3Don \

-m 128 \

-overcommit mem-lock=3Doff \

-smp 1,sockets=3D1,cores=3D1,threads=3D1 \

-uuid 2c468d92-4b19-426a-8c25-16b4624c21a4 \

-smbios 'type=3D1,manufacturer=3DOpenStack Foundation,product=3DOpenStack
Nova,version=3D22.1.0,serial=3D2c468d92-4b19-426a-
8c25-16b4624c21a4,uuid=3D2c468d92-4b19-426a-
8c25-16b4624c21a4,family=3DVirtual Machine' \

-no-user-config \

-nodefaults \

-chardev socket,id=3Dcharmonitor,fd=3D35,server,nowait \

-mon chardev=3Dcharmonitor,id=3Dmonitor,mode=3Dcontrol \

-rtc base=3Dutc \

-no-shutdown \

-boot strict=3Don \

-device piix3-usb-uhci,id=3Dusb,bus=3Dpci.0,addr=3D0x1.0x2 \

-blockdev
'{"driver":"file","filename":"/opt/stack/data/nova/instances/_base/61bd5e53=
1ab4c82456aa5300ede7266b3610be79
","node-name":"libvirt-2-storage","cache":{"direct":true,"no-
flush":false},"auto-read-only":true,"discard":"unmap"}' \

-blockdev '{"node-name":"libvirt-2-format","read-
only":true,"cache":{"direct":true,"no-
flush":false},"driver":"raw","file":"libvirt-2-storage"}' \

-blockdev
'{"driver":"file","filename":"/opt/stack/data/nova/instances/2c468d92-4b19
-426a-8c25-16b4624c21a4/disk","node-
name":"libvirt-1-storage","cache":{"direct":true,"no-flush":false
},"auto-read-only":true,"discard":"unmap"}' \

-blockdev '{"node-name":"libvirt-1-format","read-
only":false,"cache":{"direct":true,"no-
flush":false},"driver":"qcow2","file":"libvirt-1-storage","backing":"libvir=
t-2-format"}'
\

-device virtio-blk-
pci,scsi=3Doff,bus=3Dpci.0,addr=3D0x4,drive=3Dlibvirt-1-format,id=3Dvirtio-
disk0,bootindex=3D1,write-cache=3Don \

-netdev tap,fd=3D37,id=3Dhostnet0 \

-device virtio-net-
pci,host_mtu=3D1400,netdev=3Dhostnet0,id=3Dnet0,mac=3Dfa:16:3e:43:11:f4,bus=
=3Dpci.0,addr=3D0x3
\

-add-fd set=3D2,fd=3D39 \

-chardev pty,id=3Dcharserial0,logfile=3D/dev/fdset/2,logappend=3Don \

-device isa-serial,chardev=3Dcharserial0,id=3Dserial0 \

-vnc 127.0.0.1:0 \

-device cirrus-vga,id=3Dvideo0,bus=3Dpci.0,addr=3D0x2 \

-incoming defer \

-device virtio-balloon-pci,id=3Dballoon0,bus=3Dpci.0,addr=3D0x5 \

-object rng-random,id=3Dobjrng0,filename=3D/dev/urandom \

-device virtio-rng-pci,rng=3Dobjrng0,id=3Drng0,bus=3Dpci.0,addr=3D0x6 \

-sandbox
on,obsolete=3Ddeny,elevateprivileges=3Ddeny,spawn=3Ddeny,resourcecontrol=3D=
deny
\

-msg timestamp=3Don

char device redirected to /dev/pts/2 (label charserial0)

virtio: bogus descriptor or out of resources

2020-11-20 14:25:39.911+0000: initiating migration

2020-11-20T14:26:21.409517Z qemu-system-x86_64: terminating on signal 15
from pid 17395 (/usr/sbin/libvirtd)

2020-11-20 14:26:21.610+0000: shutting down, reason=3Ddestroyed


Target node
https://zuul.opendev.org/t/openstack/build/d50877ae15db4022b82f4bb1d1d52cea=
/log/logs/libvir
t/qemu/instance-0000001a.txt

2020-11-20 14:25:11.589+0000: starting up libvirt version: 6.0.0,
package: 0ubuntu8.4~cloud0 (Openstack Ubuntu Testing Bot <openstack-
testing-bot@ubuntu.com> Tue, 15 Sep 2020 20:36:28 +0000), qemu version:
4.2.1Debian 1:4.2-3ubuntu6.7~cloud0, kernel: 4.15.0-124-generic,
hostname: ubuntu-bionic-ovh-bhs1-0021872194

LC_ALL=3DC \

PATH=3D/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin \

HOME=3D/var/lib/libvirt/qemu/domain-10-instance-0000001a \

XDG_DATA_HOME=3D/var/lib/libvirt/qemu/domain-10-instance-
0000001a/.local/share \

XDG_CACHE_HOME=3D/var/lib/libvirt/qemu/domain-10-instance-0000001a/.cache
\

XDG_CONFIG_HOME=3D/var/lib/libvirt/qemu/domain-10-instance-
0000001a/.config \

QEMU_AUDIO_DRV=3Dnone \

/usr/bin/qemu-system-x86_64 \

-name guest=3Dinstance-0000001a,debug-threads=3Don \

-S \

-object
secret,id=3DmasterKey0,format=3Draw,file=3D/var/lib/libvirt/qemu/domain-10
-instance-0000001a/master-key.aes \

-machine pc-i440fx-4.2,accel=3Dtcg,usb=3Doff,dump-guest-core=3Doff \

-cpu qemu64 \

-m 128 \

-overcommit mem-lock=3Doff \

-smp 1,sockets=3D1,cores=3D1,threads=3D1 \

-uuid 2c468d92-4b19-426a-8c25-16b4624c21a4 \

-smbios 'type=3D1,manufacturer=3DOpenStack Foundation,product=3DOpenStack
Nova,version=3D22.1.0,serial=3D2c468d92-4b19-426a-
8c25-16b4624c21a4,uuid=3D2c468d92-4b19-426a-
8c25-16b4624c21a4,family=3DVirtual Machine' \

-no-user-config \

-nodefaults \

-chardev socket,id=3Dcharmonitor,fd=3D32,server,nowait \

-mon chardev=3Dcharmonitor,id=3Dmonitor,mode=3Dcontrol \

-rtc base=3Dutc \

-no-shutdown \

-boot strict=3Don \

-device piix3-usb-uhci,id=3Dusb,bus=3Dpci.0,addr=3D0x1.0x2 \

-blockdev
'{"driver":"file","filename":"/opt/stack/data/nova/instances/_base/61bd5e53=
1ab4c82456aa5300ede7266b3610be79
","node-name":"libvirt-2-storage","cache":{"direct":true,"no-
flush":false},"auto-read-only":true,"discard":"unmap"}' \

-blockdev '{"node-name":"libvirt-2-format","read-
only":true,"cache":{"direct":true,"no-
flush":false},"driver":"raw","file":"libvirt-2-storage"}' \

-blockdev
'{"driver":"file","filename":"/opt/stack/data/nova/instances/2c468d92-4b19
-426a-8c25-16b4624c21a4/disk","node-
name":"libvirt-1-storage","cache":{"direct":true,"no-flush":false
},"auto-read-only":true,"discard":"unmap"}' \

-blockdev '{"node-name":"libvirt-1-format","read-
only":false,"cache":{"direct":true,"no-
flush":false},"driver":"qcow2","file":"libvirt-1-storage","backing":"libvir=
t-2-format"}'
\

-device virtio-blk-
pci,scsi=3Doff,bus=3Dpci.0,addr=3D0x4,drive=3Dlibvirt-1-format,id=3Dvirtio-
disk0,bootindex=3D1,write-cache=3Don \

-netdev tap,fd=3D34,id=3Dhostnet0 \

-device virtio-net-
pci,host_mtu=3D1400,netdev=3Dhostnet0,id=3Dnet0,mac=3Dfa:16:3e:43:11:f4,bus=
=3Dpci.0,addr=3D0x3
\

-add-fd set=3D2,fd=3D36 \

-chardev pty,id=3Dcharserial0,logfile=3D/dev/fdset/2,logappend=3Don \

-device isa-serial,chardev=3Dcharserial0,id=3Dserial0 \

-vnc 0.0.0.0:0 \

-device cirrus-vga,id=3Dvideo0,bus=3Dpci.0,addr=3D0x2 \

-device virtio-balloon-pci,id=3Dballoon0,bus=3Dpci.0,addr=3D0x5 \

-object rng-random,id=3Dobjrng0,filename=3D/dev/urandom \

-device virtio-rng-pci,rng=3Dobjrng0,id=3Drng0,bus=3Dpci.0,addr=3D0x6 \

-sandbox
on,obsolete=3Ddeny,elevateprivileges=3Ddeny,spawn=3Ddeny,resourcecontrol=3D=
deny
\

-msg timestamp=3Don

char device redirected to /dev/pts/0 (label charserial0)

2020-11-20 14:25:25.637+0000: initiating migration

2020-11-20 14:25:26.776+0000: shutting down, reason=3Dmigrated

2020-11-20T14:25:26.777394Z qemu-system-x86_64: terminating on signal 15
from pid 31113 (/usr/sbin/libvirtd)

2020-11-20 14:25:38.909+0000: starting up libvirt version: 6.0.0,
package: 0ubuntu8.4~cloud0 (Openstack Ubuntu Testing Bot <openstack-
testing-bot@ubuntu.com> Tue, 15 Sep 2020 20:36:28 +0000), qemu version:
4.2.1Debian 1:4.2-3ubuntu6.7~cloud0, kernel: 4.15.0-124-generic,
hostname: ubuntu-bionic-ovh-bhs1-0021872194

LC_ALL=3DC \

PATH=3D/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin \

HOME=3D/var/lib/libvirt/qemu/domain-13-instance-0000001a \

XDG_DATA_HOME=3D/var/lib/libvirt/qemu/domain-13-instance-
0000001a/.local/share \

XDG_CACHE_HOME=3D/var/lib/libvirt/qemu/domain-13-instance-0000001a/.cache
\

XDG_CONFIG_HOME=3D/var/lib/libvirt/qemu/domain-13-instance-
0000001a/.config \

QEMU_AUDIO_DRV=3Dnone \

/usr/bin/qemu-system-x86_64 \

-name guest=3Dinstance-0000001a,debug-threads=3Don \

-S \

-object
secret,id=3DmasterKey0,format=3Draw,file=3D/var/lib/libvirt/qemu/domain-13
-instance-0000001a/master-key.aes \

-machine pc-i440fx-4.2,accel=3Dtcg,usb=3Doff,dump-guest-core=3Doff \

-cpu qemu64,hypervisor=3Don,lahf-lm=3Don \

-m 128 \

-overcommit mem-lock=3Doff \

-smp 1,sockets=3D1,cores=3D1,threads=3D1 \

-uuid 2c468d92-4b19-426a-8c25-16b4624c21a4 \

-smbios 'type=3D1,manufacturer=3DOpenStack Foundation,product=3DOpenStack
Nova,version=3D22.1.0,serial=3D2c468d92-4b19-426a-
8c25-16b4624c21a4,uuid=3D2c468d92-4b19-426a-
8c25-16b4624c21a4,family=3DVirtual Machine' \

-no-user-config \

-nodefaults \

-chardev socket,id=3Dcharmonitor,fd=3D34,server,nowait \

-mon chardev=3Dcharmonitor,id=3Dmonitor,mode=3Dcontrol \

-rtc base=3Dutc \

-no-shutdown \

-boot strict=3Don \

-device piix3-usb-uhci,id=3Dusb,bus=3Dpci.0,addr=3D0x1.0x2 \

-blockdev
'{"driver":"file","filename":"/opt/stack/data/nova/instances/_base/61bd5e53=
1ab4c82456aa5300ede7266b3610be79
","node-name":"libvirt-2-storage","cache":{"direct":true,"no-
flush":false},"auto-read-only":true,"discard":"unmap"}' \

-blockdev '{"node-name":"libvirt-2-format","read-
only":true,"cache":{"direct":true,"no-
flush":false},"driver":"raw","file":"libvirt-2-storage"}' \

-blockdev
'{"driver":"file","filename":"/opt/stack/data/nova/instances/2c468d92-4b19
-426a-8c25-16b4624c21a4/disk","node-
name":"libvirt-1-storage","cache":{"direct":true,"no-flush":false
},"auto-read-only":true,"discard":"unmap"}' \

-blockdev '{"node-name":"libvirt-1-format","read-
only":false,"cache":{"direct":true,"no-
flush":false},"driver":"qcow2","file":"libvirt-1-storage","backing":"libvir=
t-2-format"}'
\

-device virtio-blk-
pci,scsi=3Doff,bus=3Dpci.0,addr=3D0x4,drive=3Dlibvirt-1-format,id=3Dvirtio-
disk0,bootindex=3D1,write-cache=3Don \

-netdev tap,fd=3D36,id=3Dhostnet0 \

-device virtio-net-
pci,host_mtu=3D1400,netdev=3Dhostnet0,id=3Dnet0,mac=3Dfa:16:3e:43:11:f4,bus=
=3Dpci.0,addr=3D0x3
\

-add-fd set=3D2,fd=3D38 \

-chardev pty,id=3Dcharserial0,logfile=3D/dev/fdset/2,logappend=3Don \

-device isa-serial,chardev=3Dcharserial0,id=3Dserial0 \

-vnc 0.0.0.0:0 \

-device cirrus-vga,id=3Dvideo0,bus=3Dpci.0,addr=3D0x2 \

-incoming defer \

-device virtio-balloon-pci,id=3Dballoon0,bus=3Dpci.0,addr=3D0x5 \

-object rng-random,id=3Dobjrng0,filename=3D/dev/urandom \

-device virtio-rng-pci,rng=3Dobjrng0,id=3Drng0,bus=3Dpci.0,addr=3D0x6 \

-sandbox
on,obsolete=3Ddeny,elevateprivileges=3Ddeny,spawn=3Ddeny,resourcecontrol=3D=
deny
\

-msg timestamp=3Don

char device redirected to /dev/pts/1 (label charserial0)

2020-11-20T14:25:40.720757Z qemu-system-x86_64: VQ 0 size 0x80 Guest
index 0xb8 inconsistent with Host index 0xe0: delta 0xffd8

2020-11-20T14:25:40.720785Z qemu-system-x86_64: Failed to load virtio-
blk:virtio

2020-11-20T14:25:40.720790Z qemu-system-x86_64: error while loading
state for instance 0x0 of device '0000:00:04.0/virtio-blk'

2020-11-20T14:25:40.720824Z qemu-system-x86_64: load of migration
failed: Operation not permitted

2020-11-20 14:25:40.778+0000: shutting down, reason=3Dfailed



** Also affects: qemu
   Importance: Undecided
       Status: New

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1761798

Title:
  live migration intermittently fails in CI with "VQ 0 size 0x80 Guest
  index 0x12c inconsistent with Host index 0x134: delta 0xfff8"

Status in OpenStack Compute (nova):
  Confirmed
Status in QEMU:
  New

Bug description:
  Seen here:

  http://logs.openstack.org/37/522537/20/check/legacy-tempest-dsvm-
  multinode-live-
  migration/8de6e74/logs/subnode-2/libvirt/qemu/instance-00000002.txt.gz

  2018-04-05T21:48:38.205752Z qemu-system-x86_64: -chardev pty,id=3Dcharser=
ial0,logfile=3D/dev/fdset/1,logappend=3Don: char device redirected to /dev/=
pts/0 (label charserial0)
  warning: TCG doesn't support requested feature: CPUID.01H:ECX.vmx [bit 5]
  2018-04-05T21:48:43.153268Z qemu-system-x86_64: VQ 0 size 0x80 Guest inde=
x 0x12c inconsistent with Host index 0x134: delta 0xfff8
  2018-04-05T21:48:43.153288Z qemu-system-x86_64: Failed to load virtio-blk=
:virtio
  2018-04-05T21:48:43.153292Z qemu-system-x86_64: error while loading state=
 for instance 0x0 of device '0000:00:04.0/virtio-blk'
  2018-04-05T21:48:43.153347Z qemu-system-x86_64: load of migration failed:=
 Operation not permitted
  2018-04-05 21:48:43.198+0000: shutting down, reason=3Dcrashed

  And in the n-cpu logs on the other host:

  http://logs.openstack.org/37/522537/20/check/legacy-tempest-dsvm-
  multinode-live-
  migration/8de6e74/logs/screen-n-cpu.txt.gz#_Apr_05_21_48_43_257541

  There is a related Red Hat bug:

  https://bugzilla.redhat.com/show_bug.cgi?id=3D1450524

  The CI job failures are at present using the Pike UCA:

  ii  libvirt-bin                         3.6.0-1ubuntu6.2~cloud0

  ii  qemu-system-x86                     1:2.10+dfsg-0ubuntu3.5~cloud0

To manage notifications about this bug go to:
https://bugs.launchpad.net/nova/+bug/1761798/+subscriptions

