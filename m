Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F3B03AFC7F
	for <lists+qemu-devel@lfdr.de>; Tue, 22 Jun 2021 07:12:23 +0200 (CEST)
Received: from localhost ([::1]:52460 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lvYhy-0004IY-L7
	for lists+qemu-devel@lfdr.de; Tue, 22 Jun 2021 01:12:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58504)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lvY4c-0003Sp-CC
 for qemu-devel@nongnu.org; Tue, 22 Jun 2021 00:31:42 -0400
Received: from indium.canonical.com ([91.189.90.7]:59400)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lvY4X-0000dN-DO
 for qemu-devel@nongnu.org; Tue, 22 Jun 2021 00:31:42 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.93 #5 (Debian))
 id 1lvY4K-0004OR-Fj
 for <qemu-devel@nongnu.org>; Tue, 22 Jun 2021 04:31:24 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 361B42E816E
 for <qemu-devel@nongnu.org>; Tue, 22 Jun 2021 04:31:24 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Tue, 22 Jun 2021 04:17:26 -0000
From: Launchpad Bug Tracker <1396497@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Expired; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug: distribution=ubuntu; sourcepackage=qemu; component=main;
 status=Expired; importance=Low; assignee=None; 
X-Launchpad-Bug-Tags: amd64 apport-bug vivid
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: jamesodhunt janitor serge-hallyn th-huth
X-Launchpad-Bug-Reporter: James Hunt (jamesodhunt)
X-Launchpad-Bug-Modifier: Launchpad Janitor (janitor)
References: <20141126083639.18143.93018.malonedeb@chaenomeles.canonical.com>
Message-Id: <162433544728.20423.17457714074724797867.malone@loganberry.canonical.com>
Subject: [Bug 1396497] Re: 'qemu-img snapshot' allows new snapshot to be
 created with the name of an existing snapshot
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="3619498b5524a71696f3dd612f4d11bd63449bb1"; Instance="production"
X-Launchpad-Hash: 5d192f8668e26f713c09fea646f6a1bf59c68395
Received-SPF: none client-ip=91.189.90.7; envelope-from=bounces@canonical.com;
 helo=indium.canonical.com
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
Reply-To: Bug 1396497 <1396497@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

[Expired for QEMU because there has been no activity for 60 days.]

** Changed in: qemu
       Status: Incomplete =3D> Expired

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1396497

Title:
  'qemu-img snapshot' allows new snapshot to be created with the name of
  an existing snapshot

Status in QEMU:
  Expired
Status in qemu package in Ubuntu:
  Expired

Bug description:
  qemu-img _may_ be working as designed, but it feels like this could be
  a bug. I'd certainly prefer to only allow unique snapshot names
  (unless maybe something like a "--force-non-unique-snapshot-names" was
  also specified).

  If this really is correct behaviour, it should be documented as qemu-
  img(1) currently specifies no details whatsoever regarding expected
  behaviour or valid snapshot names.

  $ qemu-img snapshot -l image.cow =

  $ qemu-img snapshot -c foo image.cow        =

  $ qemu-img snapshot -l image.cow            =

  Snapshot list:
  ID        TAG                 VM SIZE                DATE       VM CLOCK
  1         foo                       0 2014-11-26 08:30:53   00:00:00.000
  $ qemu-img snapshot -c foo image.cow =

  $ qemu-img snapshot -l image.cow            =

  Snapshot list:
  ID        TAG                 VM SIZE                DATE       VM CLOCK
  1         foo                       0 2014-11-26 08:30:53   00:00:00.000
  2         foo                       0 2014-11-26 08:30:58   00:00:00.000
  $ qemu-img snapshot -c foo image.cow =

  $ qemu-img snapshot -l image.cow            =

  Snapshot list:
  ID        TAG                 VM SIZE                DATE       VM CLOCK
  1         foo                       0 2014-11-26 08:30:53   00:00:00.000
  2         foo                       0 2014-11-26 08:30:58   00:00:00.000
  3         foo                       0 2014-11-26 08:31:00   00:00:00.000
  $ qemu-img snapshot -d foo image.cow        =

  $ qemu-img snapshot -l image.cow            =

  Snapshot list:
  ID        TAG                 VM SIZE                DATE       VM CLOCK
  2         foo                       0 2014-11-26 08:30:58   00:00:00.000
  3         foo                       0 2014-11-26 08:31:00   00:00:00.000
  $ qemu-img snapshot -d foo image.cow =

  $ qemu-img snapshot -l image.cow            =

  Snapshot list:
  ID        TAG                 VM SIZE                DATE       VM CLOCK
  3         foo                       0 2014-11-26 08:31:00   00:00:00.000
  $ qemu-img snapshot -d foo image.cow =

  $ qemu-img snapshot -l image.cow =

  $

  Note also how snapshot deletion works in reverse order - the oldest
  snapshot with a given name is deleted first.

  ProblemType: Bug
  DistroRelease: Ubuntu 15.04
  Package: qemu-utils 2.1+dfsg-4ubuntu9
  ProcVersionSignature: Ubuntu 3.16.0-25.33-generic 3.16.7
  Uname: Linux 3.16.0-25-generic x86_64
  ApportVersion: 2.14.7-0ubuntu10
  Architecture: amd64
  CurrentDesktop: Unity
  Date: Wed Nov 26 08:28:16 2014
  InstallationDate: Installed on 2014-04-11 (228 days ago)
  InstallationMedia: Ubuntu 14.04 LTS "Trusty Tahr" - Daily amd64 (20140409)
  KvmCmdLine:
   COMMAND         STAT  EUID  RUID   PID  PPID %CPU COMMAND
   kvm-irqfd-clean S<       0     0   719     2  0.0 [kvm-irqfd-clean]
  MachineType: LENOVO 20AQCTO1WW
  ProcKernelCmdLine: BOOT_IMAGE=3D/vmlinuz-3.16.0-25-generic root=3D/dev/ma=
pper/ubuntu--vg-root ro quiet splash vt.handoff=3D7
  SourcePackage: qemu
  UpgradeStatus: Upgraded to vivid on 2014-05-08 (201 days ago)
  dmi.bios.date: 02/10/2014
  dmi.bios.vendor: LENOVO
  dmi.bios.version: GJET71WW (2.21 )
  dmi.board.asset.tag: Not Available
  dmi.board.name: 20AQCTO1WW
  dmi.board.vendor: LENOVO
  dmi.board.version: 0B98405 STD
  dmi.chassis.asset.tag: No Asset Information
  dmi.chassis.type: 10
  dmi.chassis.vendor: LENOVO
  dmi.chassis.version: Not Available
  dmi.modalias: dmi:bvnLENOVO:bvrGJET71WW(2.21):bd02/10/2014:svnLENOVO:pn20=
AQCTO1WW:pvrThinkPadT440s:rvnLENOVO:rn20AQCTO1WW:rvr0B98405STD:cvnLENOVO:ct=
10:cvrNotAvailable:
  dmi.product.name: 20AQCTO1WW
  dmi.product.version: ThinkPad T440s
  dmi.sys.vendor: LENOVO

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1396497/+subscriptions

