Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 162D63952F1
	for <lists+qemu-devel@lfdr.de>; Sun, 30 May 2021 23:10:43 +0200 (CEST)
Received: from localhost ([::1]:49172 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lnShm-0003Rk-6o
	for lists+qemu-devel@lfdr.de; Sun, 30 May 2021 17:10:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59290)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lnSgn-0002mv-Ca
 for qemu-devel@nongnu.org; Sun, 30 May 2021 17:09:41 -0400
Received: from indium.canonical.com ([91.189.90.7]:34936)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lnSgl-0005wj-Jl
 for qemu-devel@nongnu.org; Sun, 30 May 2021 17:09:41 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.93 #5 (Debian))
 id 1lnSgk-0002bP-Bh
 for <qemu-devel@nongnu.org>; Sun, 30 May 2021 21:09:38 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 53EA02E8135
 for <qemu-devel@nongnu.org>; Sun, 30 May 2021 21:09:38 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Sun, 30 May 2021 20:58:22 -0000
From: Apteryx <1414466@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Confirmed; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Tags: hostfwd qemu trusty ubuntu xenial
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: janitor maxco nagaraju-goruganti pconstantine
 piotr.orzechowski sergey-e srinirap88 th-huth
X-Launchpad-Bug-Reporter: Sergey V. Lobanov (sergey-e)
X-Launchpad-Bug-Modifier: Apteryx (maxco)
References: <20150125172405.12316.8764.malonedeb@soybean.canonical.com>
Message-Id: <162240830276.5305.11099957733826832994.malone@soybean.canonical.com>
Subject: [Bug 1414466] Re: -net user,hostfwd=... is not working
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="925b661396f90467a0d31fdfb13d4990b7239925"; Instance="production"
X-Launchpad-Hash: b14fbd54f02436e480abe145e8ff00c0bf7aeff4
Received-SPF: none client-ip=91.189.90.7; envelope-from=bounces@canonical.com;
 helo=indium.canonical.com
X-Spam_score_int: -66
X-Spam_score: -6.7
X-Spam_bar: ------
X-Spam_report: (-6.7 / 5.0 requ) BAYES_00=-1.9,
 HEADER_FROM_DIFFERENT_DOMAINS=0.249, RCVD_IN_DNSWL_HI=-5,
 RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01, SPF_HELO_NONE=0.001,
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
Reply-To: Bug 1414466 <1414466@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hello, I'm also experiencing such a problem, using qemu-system-x86_64
(hence the retitling of this issue).  More information and output is
available at http://issues.guix.gnu.org/48739, but basically with the
following QEMU command used to run a VM:

/gnu/store/vbjfas8smw260r0qw1d5bbnh5hz08haz-qemu-5.2.0/bin/qemu-system-
x86_64 -kernel /gnu/store/0fylx9z8lzyrbdivqa2jzn574gk8lcjv-linux-
libre-5.12.7/bzImage -initrd /gnu/store
/76ikiyg6arhd40pmq6yyi0vgdszfl08w-system/initrd -append "--
root=3D/dev/vda1 --system=3D/gnu/store/76ikiyg6arhd40pmq6yyi0vgdszfl08w-
system --load=3D/gnu/store/76ikiyg6arhd40pmq6yyi0vgdszfl08w-system/boot
modprobe.blacklist=3Dusbmouse,usbkbd quiet" -enable-kvm -no-reboot -object
rng-random,filename=3D/dev/urandom,id=3Dguixsd-vm-rng -device virtio-rng-
pci,rng=3Dguixsd-vm-rng -virtfs
local,path=3D"/gnu/store",security_model=3Dnone,mount_tag=3D"TAGjoptajej2oy=
nju6yvboauz7pl6uj"
-vga std -drive file=3D/gnu/store/gj50g71n2b7xa2s9lgcfijprvr4vj66y-qemu-
image,if=3Dvirtio,cache=3Dwriteback,werror=3Dreport,readonly -m 512 -nic
user,hostfwd=3Dtcp::3333-:22

Trying to connect to the VM which has its sshd_config set to:
Port 22
PermitRootLogin yes
PermitEmptyPasswords yes
PasswordAuthentication yes
PubkeyAuthentication yes
X11Forwarding no
AllowAgentForwarding yes
AllowTcpForwarding yes
GatewayPorts no
PidFile /var/run/sshd.pi
ChallengeResponseAuthentication no
UsePAM yes
PrintLastLog yes
LogLevel DEBUG
AuthorizedKeysFile .ssh/authorized_keys .ssh/authorized_keys2 /etc/ssh/auth=
orized_keys.d/%u
Subsytsem    sftp    internal-sftp

The SSH client would hang with its last debug output being:

debug1: Local version string SSH-2.0-OpenSSH_8.6

Inside the guest, /var/log/secure doesn't show any activity so itd
oesn't seem to be reached.

Ideas?


** Changed in: qemu
       Status: Expired =3D> Confirmed

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1414466

Title:
  -net user,hostfwd=3D... is not working

Status in QEMU:
  Confirmed

Bug description:
  QEMU version: git a46b3aaf6bb038d4f6f192a84df204f10929e75c

   /opt/qemu.git/bin/qemu-system-aarch64 --version
  QEMU emulator version 2.2.50, Copyright (c) 2003-2008 Fabrice Bellard

  Hosts:
  ovs - host machine (Ubuntu 14.04.1, x86_64)
  debian8-arm64 - guest =


  Guest start:
  user@ovs:~$ /opt/qemu.git/bin/qemu-system-aarch64 -machine virt -cpu cort=
ex-a57 -nographic -smp 1 -m 512 -kernel vmlinuz-run -initrd initrd-run.img =
-append "root=3D/dev/sda2 console=3DttyAMA0" -global virtio-blk-device.scsi=
=3Doff -device virtio-scsi-device,id=3Dscsi -drive file=3Ddebian8-arm64.img=
,id=3Drootimg,cache=3Dunsafe,if=3Dnone -device scsi-hd,drive=3Drootimg -net=
dev user,id=3Dunet -device virtio-net-device,netdev=3Dunet -net user,hostfw=
d=3Dtcp:127.0.0.1:1122-:22

  root@debian8-arm64:~# netstat -ntplu | grep ssh
  tcp        0      0 0.0.0.0:22              0.0.0.0:*               LISTE=
N      410/sshd        =

  tcp6       0      0 :::22                   :::*                    LISTE=
N      410/sshd       =


  (no firewall in guest vm)

  user@ovs:~$ netstat -ntplu | grep 1122
  tcp        0      0 127.0.0.1:1122          0.0.0.0:*               LISTE=
N      18722/qemu-system-a

  user@ovs:~$ time ssh user@127.0.0.1 -p 1122
  ssh_exchange_identification: read: Connection reset by peer

  real	1m29.341s
  user	0m0.005s
  sys	0m0.000s

  Inside guest vm sshd works fine:
  root@debian8-arm64:~# ssh user@127.0.0.1 -p 22
  user@127.0.0.1's password: =

  ....
  user@debian8-arm64:~$ exit
  logout
  Connection to 127.0.0.1 closed.

  root@debian8-arm64:~# ssh user@10.0.2.15 -p 22
  user@10.0.2.15's password: =

  ...
  user@debian8-arm64:~$ exit
  logout
  Connection to 10.0.2.15 closed.

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1414466/+subscriptions

