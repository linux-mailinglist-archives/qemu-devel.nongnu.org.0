Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 261EB375537
	for <lists+qemu-devel@lfdr.de>; Thu,  6 May 2021 15:57:50 +0200 (CEST)
Received: from localhost ([::1]:45282 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1leeVg-0003wA-4Y
	for lists+qemu-devel@lfdr.de; Thu, 06 May 2021 09:57:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60200)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1leeP3-0006DS-7i
 for qemu-devel@nongnu.org; Thu, 06 May 2021 09:50:57 -0400
Received: from indium.canonical.com ([91.189.90.7]:43182)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1leeOz-00074W-1p
 for qemu-devel@nongnu.org; Thu, 06 May 2021 09:50:57 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.93 #5 (Debian))
 id 1leeOw-00032S-Cs
 for <qemu-devel@nongnu.org>; Thu, 06 May 2021 13:50:50 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 47BC32E8187
 for <qemu-devel@nongnu.org>; Thu,  6 May 2021 13:50:50 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Thu, 06 May 2021 13:36:03 -0000
From: Thomas Huth <1874264@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Incomplete; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Tags: ppc
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: kennethsalerno th-huth
X-Launchpad-Bug-Reporter: Kenneth Salerno (kennethsalerno)
X-Launchpad-Bug-Modifier: Thomas Huth (th-huth)
References: <158756466889.23136.4781024661991862847.malonedeb@chaenomeles.canonical.com>
Message-Id: <162030816361.6014.736563584569591250.malone@wampee.canonical.com>
Subject: [Bug 1874264] Re: AIX 7.2 TL4 SP1 cannot IPL with QEMU >2.11.2
 ppc64-softmmu
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="d6ba96cccb3d3e356754af3137c6128a6c17e2a8"; Instance="production"
X-Launchpad-Hash: 89f766e1a2ade7284da90d3323072dbbf1aabb53
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
Reply-To: Bug 1874264 <1874264@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Did this ever work before? AFAIK AIX was never really running on QEMU...

** Changed in: qemu
       Status: New =3D> Incomplete

** Tags added: ppc

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1874264

Title:
  AIX 7.2 TL4 SP1 cannot IPL with QEMU >2.11.2 ppc64-softmmu

Status in QEMU:
  Incomplete

Bug description:
  kens@LAPTOP-JN77KAC2$ qemu-system-ppc64 -version
  QEMU emulator version 4.2.93 (v5.0.0-rc3-8-g3119154db0-dirty)
  Copyright (c) 2003-2020 Fabrice Bellard and the QEMU Project developers

  qemu-system-ppc64 \
    -name "IBM AIX - IBM POWER9" \
    -M pseries \
    -cpu POWER9 \
    -smp 8 \
    -m 8192 \
    -nodefaults \
    -nographic \
    -prom-env input-device=3D/vdevice/vty@71000000 \
    -prom-env output-device=3D/vdevice/vty@71000000 \
    -serial tcp::9019,server,nowait \
    -monitor tcp::9020,server,nowait \
    -netdev type=3Duser,id=3Dmynet0,hostfwd=3Dtcp:127.0.0.1:9018-10.0.2.18:=
22 \
    -device virtio-net-pci,netdev=3Dmynet0 \
    -drive file=3Dimages/aix-ppc64.img,format=3Dqcow2,if=3Dnone,id=3Dhd,med=
ia=3Ddisk,cache=3Dunsafe \
    -device virtio-scsi-pci,id=3Dscsi -device scsi-hd,drive=3Dhd \
    -drive file=3Dimages/iso/blank-cdrom,format=3Draw,media=3Dcdrom,cache=
=3Dunsafe

  -------------------------------------------------------------------------=
------
                                  Welcome to AIX.
                     boot image timestamp: 14:18:40 03/27/2020
          processor count: 8;  memory size: 8192MB;  kernel size: 45422205
           boot device: /pci@800000020000000/scsi@1/disk@100000000000000
  =0CAIX vm,uuid property contains invalid data
  processing splpar characteristic: MaxEntCap
  processing splpar characteristic: DesMem
  processing splpar characteristic: DesProcs
  processing splpar characteristic: MaxPlatProcs
  processing splpar characteristic: HostThrs

  AKVM: hcall-multi-tce detected but overridden, allow with "multce" boot a=
rgument
  -------------------------------------------------------------------------=
------
  =0CStarqemu-system-ppc64: OS terminated: 888 102 700 C20

  =

  qemu-system-ppc64 \
    -name "IBM AIX - IBM POWER8" \
    -M pseries \
    -cpu POWER8 \
    -smp 8 \
    -m 8192 \
    -nodefaults \
    -nographic \
    -prom-env input-device=3D/vdevice/vty@71000000 \
    -prom-env output-device=3D/vdevice/vty@71000000 \
    -serial tcp::9019,server,nowait \
    -monitor tcp::9020,server,nowait \
    -netdev type=3Duser,id=3Dmynet0,hostfwd=3Dtcp:127.0.0.1:9018-10.0.2.18:=
22 \
    -device virtio-net-pci,netdev=3Dmynet0 \
    -drive file=3Dimages/aix-ppc64.img,format=3Dqcow2,if=3Dnone,id=3Dhd,med=
ia=3Ddisk,cache=3Dunsafe \
    -device virtio-scsi-pci,id=3Dscsi -device scsi-hd,drive=3Dhd \
    -drive file=3Dimages/iso/blank-cdrom,format=3Draw,media=3Dcdrom,cache=
=3Dunsafe

  -------------------------------------------------------------------------=
------
                                  Welcome to AIX.
                     boot image timestamp: 14:18:40 03/27/2020
          processor count: 8;  memory size: 8192MB;  kernel size: 45422205
           boot device: /pci@800000020000000/scsi@1/disk@100000000000000
  =0CAIX vm,uuid property contains invalid data
  processing splpar characteristic: MaxEntCap
  processing splpar characteristic: DesMem
  processing splpar characteristic: DesProcs
  processing splpar characteristic: MaxPlatProcs
  processing splpar characteristic: HostThrs

  AKVM: hcall-multi-tce detected but overridden, allow with "multce" boot a=
rgument
  -------------------------------------------------------------------------=
------
  =0CStar**
  ERROR:/home/kens/tmp/qemu/cpus.c:1727:qemu_tcg_cpu_thread_fn: assertion f=
ailed: (cpu->halted)

  =

  kens@LAPTOP-JN77KAC2$ qemu-system-ppc64 -version
  QEMU emulator version 2.11.2
  Copyright (c) 2003-2017 Fabrice Bellard and the QEMU Project developers

  qemu-system-ppc64 \
    -name "IBM AIX - IBM POWER9" \
    -M pseries,cap-htm=3Doff \
    -cpu POWER9 \
    -smp 8 \
    -m 8192 \
    -nodefaults \
    -nographic \
    -prom-env input-device=3D/vdevice/vty@71000000 \
    -prom-env output-device=3D/vdevice/vty@71000000 \
    -serial tcp::9019,server,nowait \
    -monitor tcp::9020,server,nowait \
    -netdev type=3Duser,id=3Dmynet0,hostfwd=3Dtcp:127.0.0.1:9018-10.0.2.18:=
22 \
    -device virtio-net-pci,netdev=3Dmynet0 \
    -drive file=3Dimages/aix-ppc64.img,format=3Dqcow2,if=3Dnone,id=3Dhd,med=
ia=3Ddisk,cache=3Dunsafe \
    -device virtio-scsi-pci,id=3Dscsi -device scsi-hd,drive=3Dhd \
    -drive file=3Dimages/iso/blank-cdrom,format=3Draw,media=3Dcdrom,cache=
=3Dunsafe

  -------------------------------------------------------------------------=
------
                                  Welcome to AIX.
                     boot image timestamp: 14:18:40 03/27/2020
          processor count: 8;  memory size: 8192MB;  kernel size: 45422205
           boot device: /pci@800000020000000/scsi@1/disk@100000000000000
  =0CAIX vm,uuid property contains invalid data
  processing splpar characteristic: MaxEntCap
  processing splpar characteristic: DesMem
  processing splpar characteristic: DesProcs
  processing splpar characteristic: MaxPlatProcs

  AKVM: hcall-multi-tce detected but overridden, allow with "multce" boot a=
rgument
  -------------------------------------------------------------------------=
------
  =0CStar
  0539
  0811
  0539
  0812
  0708
  0811
  0811
  0811
  0811
  0811
  0811
  0811
  0811
  078c
  25b6
  25b6
  25b6
  25b6
  25b6
  25b6
  25b6
  25b6
  25b6
  25b6
  25b6
  078c
  0539
  2071
  0539
  2073
  0539
  25b3vscsi_send_capabilities: capabilities size mismatch !
  VSCSI: Unknown MAD type 09

  0539
  0538
  0539
  0591
  0539
  0538
  0539
  0538
  0539
  25b0
  0539

  0511
  0551
  0517
  0517
  0517
  0517
  0553
  0517
  0517
  0538
  0539
  0538
  0539
  270b
  0539
  0538
  0539
  2070
  0539
  0538
  0539
  0811
  0539
  0811
  0539
  0812
  0708
  0811
  0811
  0811
  0811
  0811
  0811
  0811
  0811
  078c
  25b6
  25b6
  25b6
  25b6
  25b6
  25b6
  25b6
  25b6
  25b6
  25b6
  25b6
  078c
  04ee
  078c
  0727
  0727
  2071
  2072
  2072
  2071
  0539
  25b3
  0539
  25b5
  0539
  0538
  0539
  0538
  0539
  0538
  0539
  0538
  0539
  0538
  0581
  0539
  0538
  0539
  7000
  0539
  0538
  0539
  0538
  0539
  0538
  0581
  0581
  0539
  0538
  0539
  25b0
  0539
  0538
  0539
  0538
  0539
  0731
  0539
  0538
  0539
  0538
  0539
  0538
  0539
  0538
  0539
  0538
  0539
  0538
  0539
  0538
  0539
  0538
  0539
  0538
  0539
  0538
  0539
  0538
  0539
  0538
  0539
  0538
  0539
  0538
  0539
  0538
  0539
  0538
  0539
  0538
  0539
  0538
  0539
  0538
  0539
  2028
  0539
  0538
  0539

  0c33
  Saving Base Customize Data to boot disk
  Starting the sync daemon
  Starting the error daemon

  System initialization completed.
  TE=3DOFF
  CHKEXEC=3DOFF
  CHKSHLIB=3DOFF
  CHKSCRIPT=3DOFF
  CHKKERNEXT=3DOFF
  STOP_UNTRUSTD=3DOFF
  STOP_ON_CHKFAIL=3DOFF
  LOCK_KERN_POLICIES=3DOFF
  TSD_FILES_LOCK=3DOFF
  TSD_LOCK=3DOFF
  TEP=3DOFF
  TLP=3DOFF
  Successfully updated the Kernel Authorization Table.
  Successfully updated the Kernel Role Table.
  Successfully updated the Kernel Command Table.
  Successfully updated the Kernel Device Table.
  Successfully updated the Kernel Object Domain Table.
  Successfully updated the Kernel Domains Table.
  Successfully updated the Kernel RBAC log level.
  Successfully updated the Kernel RBAC log level.
  OPERATIONAL MODE Security Flags
  ROOT                      :    ENABLED
  TRACEAUTH                 :   DISABLED
  System runtime mode is now OPERATIONAL MODE.
  Setting tunable parameters...complete
  Checking for srcmstr active...complete
  Starting tcpip daemons:
  0513-059 The sendmail Subsystem has been started. Subsystem PID is 445684=
6.
  0513-059 The syslogd Subsystem has been started. Subsystem PID is 4522382.
  0513-059 The portmap Subsystem has been started. Subsystem PID is 4194776.
  0513-059 The inetd Subsystem has been started. Subsystem PID is 4129230.
  0513-059 The snmpmibd Subsystem has been started. Subsystem PID is 432567=
2.
  Finished starting tcpip daemons.

  =

  AIX Version 7
  Copyright IBM Corporation, 1982, 2019.
  Console login: root
  root's Password:

  *************************************************************************=
******
  *                                                                        =
     *
  *                                                                        =
     *
  *  Welcome to AIX Version 7.2!                                           =
     *
  *                                                                        =
     *
  *                                                                        =
     *
  *  Please see the README file in /usr/lpp/bos for information pertinent t=
o    *
  *  this release of the AIX Operating System.                             =
     *
  *                                                                        =
     *
  *                                                                        =
     *
  *************************************************************************=
******
  Last login: Wed Apr 22 07:21:19 EDT 2020 on /dev/vty0

  root@aix-ppc64# oslevel -s
  7200-04-01-1939
  root@aix-ppc64#

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1874264/+subscriptions

