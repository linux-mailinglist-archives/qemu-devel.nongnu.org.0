Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A1503678DE
	for <lists+qemu-devel@lfdr.de>; Thu, 22 Apr 2021 06:47:19 +0200 (CEST)
Received: from localhost ([::1]:53610 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lZRFG-0008ES-Kn
	for lists+qemu-devel@lfdr.de; Thu, 22 Apr 2021 00:47:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46852)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lZRCy-0006yI-Ev
 for qemu-devel@nongnu.org; Thu, 22 Apr 2021 00:44:56 -0400
Received: from indium.canonical.com ([91.189.90.7]:45966)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lZRCw-0005IK-Ck
 for qemu-devel@nongnu.org; Thu, 22 Apr 2021 00:44:56 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1lZRCu-00088x-EX
 for <qemu-devel@nongnu.org>; Thu, 22 Apr 2021 04:44:52 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 6A0372E8164
 for <qemu-devel@nongnu.org>; Thu, 22 Apr 2021 04:44:52 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Thu, 22 Apr 2021 04:34:16 -0000
From: Thomas Huth <1396497@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Incomplete; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug: distribution=ubuntu; sourcepackage=qemu; component=main;
 status=Incomplete; importance=Low; assignee=None; 
X-Launchpad-Bug-Tags: amd64 apport-bug vivid
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: jamesodhunt serge-hallyn th-huth
X-Launchpad-Bug-Reporter: James Hunt (jamesodhunt)
X-Launchpad-Bug-Modifier: Thomas Huth (th-huth)
References: <20141126083639.18143.93018.malonedeb@chaenomeles.canonical.com>
Message-Id: <161906605614.6814.10849670678844722593.malone@chaenomeles.canonical.com>
Subject: [Bug 1396497] Re: 'qemu-img snapshot' allows new snapshot to be
 created with the name of an existing snapshot
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="1552fceb1603b3da6cfa437575d9c9fc4b2e683a"; Instance="production"
X-Launchpad-Hash: 960475e2106261301a53bf0067ade95a773b80ce
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
Reply-To: Bug 1396497 <1396497@bugs.launchpad.net>
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

** Changed in: qemu (Ubuntu)
       Status: Triaged =3D> Incomplete

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1396497

Title:
  'qemu-img snapshot' allows new snapshot to be created with the name of
  an existing snapshot

Status in QEMU:
  Incomplete
Status in qemu package in Ubuntu:
  Incomplete

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

