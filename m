Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 782BF367CEE
	for <lists+qemu-devel@lfdr.de>; Thu, 22 Apr 2021 10:52:53 +0200 (CEST)
Received: from localhost ([::1]:59382 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lZV4u-0005fZ-Jx
	for lists+qemu-devel@lfdr.de; Thu, 22 Apr 2021 04:52:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55016)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lZV3P-0004o6-0o
 for qemu-devel@nongnu.org; Thu, 22 Apr 2021 04:51:19 -0400
Received: from indium.canonical.com ([91.189.90.7]:53394)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lZV3M-0003eX-Mf
 for qemu-devel@nongnu.org; Thu, 22 Apr 2021 04:51:18 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1lZV3K-0001l4-H7
 for <qemu-devel@nongnu.org>; Thu, 22 Apr 2021 08:51:14 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 807FF2E8050
 for <qemu-devel@nongnu.org>; Thu, 22 Apr 2021 08:51:14 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Thu, 22 Apr 2021 08:42:45 -0000
From: Thomas Huth <1848901@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Incomplete; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: d33m0n jnsnow th-huth
X-Launchpad-Bug-Reporter: P.O. (d33m0n)
X-Launchpad-Bug-Modifier: Thomas Huth (th-huth)
References: <157153622475.25094.3691269102491613645.malonedeb@chaenomeles.canonical.com>
Message-Id: <161908096594.9315.18431557255751347146.malone@wampee.canonical.com>
Subject: [Bug 1848901] Re: kvm_mem_ioeventfd_add: error adding ioeventfd: No
 space left on device (28)
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="1552fceb1603b3da6cfa437575d9c9fc4b2e683a"; Instance="production"
X-Launchpad-Hash: 1d970209c39e7a07d3d2755c826f267ec5c88a0a
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
Reply-To: Bug 1848901 <1848901@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The QEMU project is currently considering to move its bug tracking to
another system. For this we need to know which bugs are still valid
and which could be closed already. Thus we are setting older bugs to
"Incomplete" now.

If you still think this bug report here is valid, then please switch
the state back to "New" within the next 60 days, otherwise this report
will be marked as "Expired". Or please mark it as "Fix Released" if
the problem has been solved with a newer version of QEMU already.

Thank you and sorry for the inconvenience.


** Changed in: qemu
       Status: New =3D> Incomplete

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1848901

Title:
  kvm_mem_ioeventfd_add: error adding ioeventfd: No space left on device
  (28)

Status in QEMU:
  Incomplete

Bug description:
  =3D> QEMU process has stopped, return code: -6

  Start QEMU with /usr/bin/qemu-system-x86_64 -name CiscoASAv9.8.1-1 -m
  2048M -smp cpus=3D1 -enable-kvm -machine smm=3Doff -boot order=3Dc -drive
  'file=3D/home/deemon/GNS3/projects/ASAv my ass/project-files/qemu
  /7725cdea-5e66-4777-b4dd-
  c3905f258394/hda_disk.qcow2,if=3Dvirtio,index=3D0,media=3Ddisk,id=3Ddrive=
0'
  -uuid 7725cdea-5e66-4777-b4dd-c3905f258394 -serial
  telnet:127.0.0.1:5000,server,nowait -monitor
  tcp:127.0.0.1:44629,server,nowait -net none -device
  e1000,mac=3D0c:7a:1d:83:94:00,netdev=3Dgns3-0 -netdev
  socket,id=3Dgns3-0,udp=3D127.0.0.1:10001,localaddr=3D127.0.0.1:10000 -dev=
ice
  e1000,mac=3D0c:7a:1d:83:94:01,netdev=3Dgns3-1 -netdev
  socket,id=3Dgns3-1,udp=3D127.0.0.1:10003,localaddr=3D127.0.0.1:10002 -dev=
ice
  e1000,mac=3D0c:7a:1d:83:94:02,netdev=3Dgns3-2 -netdev
  socket,id=3Dgns3-2,udp=3D127.0.0.1:10005,localaddr=3D127.0.0.1:10004 -dev=
ice
  e1000,mac=3D0c:7a:1d:83:94:03,netdev=3Dgns3-3 -netdev
  socket,id=3Dgns3-3,udp=3D127.0.0.1:10007,localaddr=3D127.0.0.1:10006 -dev=
ice
  e1000,mac=3D0c:7a:1d:83:94:04,netdev=3Dgns3-4 -netdev
  socket,id=3Dgns3-4,udp=3D127.0.0.1:10009,localaddr=3D127.0.0.1:10008 -dev=
ice
  e1000,mac=3D0c:7a:1d:83:94:05,netdev=3Dgns3-5 -netdev
  socket,id=3Dgns3-5,udp=3D127.0.0.1:10011,localaddr=3D127.0.0.1:10010 -dev=
ice
  e1000,mac=3D0c:7a:1d:83:94:06,netdev=3Dgns3-6 -netdev
  socket,id=3Dgns3-6,udp=3D127.0.0.1:10013,localaddr=3D127.0.0.1:10012 -dev=
ice
  e1000,mac=3D0c:7a:1d:83:94:07,netdev=3Dgns3-7 -netdev
  socket,id=3Dgns3-7,udp=3D127.0.0.1:10015,localaddr=3D127.0.0.1:10014
  -nographic

   =

  Execution log:
  kvm_mem_ioeventfd_add: error adding ioeventfd: No space left on device (2=
8)

  and then it just closes...


  [deemon@Zen ~]$ coredumpctl info 8638
             PID: 8638 (qemu-system-x86)
             UID: 1000 (deemon)
             GID: 1000 (deemon)
          Signal: 6 (ABRT)
       Timestamp: Sun 2019-10-20 04:27:29 EEST (5min ago)
    Command Line: /usr/bin/qemu-system-x86_64 -name CiscoASAv9.8.1-1 -m 204=
8M -smp cpus=3D1 -enable-kvm -machine smm=3Doff -boot order=3Dc -drive file=
=3D/home/deemon/GNS3/projects/ASAv my ass/project-files/qemu>
      Executable: /usr/bin/qemu-system-x86_64
   Control Group: /user.slice/user-1000.slice/session-2.scope
            Unit: session-2.scope
           Slice: user-1000.slice
         Session: 2
       Owner UID: 1000 (deemon)
         Boot ID: cd30f69a8d194359a31889dc7b6b026c
      Machine ID: d0a2d74a5cd9430797d902f5237c448d
        Hostname: Zen
         Storage: /var/lib/systemd/coredump/core.qemu-system-x86.1000.cd30f=
69a8d194359a31889dc7b6b026c.8638.1571534849000000.lz4 (truncated)
         Message: Process 8638 (qemu-system-x86) of user 1000 dumped core.
                  =

                  Stack trace of thread 8642:
                  #0  0x00007f1a33609f25 n/a (n/a)

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1848901/+subscriptions

