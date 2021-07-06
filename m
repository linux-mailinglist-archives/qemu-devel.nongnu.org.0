Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 492793BC5C1
	for <lists+qemu-devel@lfdr.de>; Tue,  6 Jul 2021 06:49:37 +0200 (CEST)
Received: from localhost ([::1]:46710 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m0d1c-00057O-BV
	for lists+qemu-devel@lfdr.de; Tue, 06 Jul 2021 00:49:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46782)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1m0cfn-0000pj-Gj
 for qemu-devel@nongnu.org; Tue, 06 Jul 2021 00:27:03 -0400
Received: from indium.canonical.com ([91.189.90.7]:53184)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1m0cfl-0003YO-Q8
 for qemu-devel@nongnu.org; Tue, 06 Jul 2021 00:27:03 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.93 #5 (Debian))
 id 1m0cfX-0004wp-W0
 for <qemu-devel@nongnu.org>; Tue, 06 Jul 2021 04:26:48 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 556EE2E8383
 for <qemu-devel@nongnu.org>; Tue,  6 Jul 2021 04:26:25 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Tue, 06 Jul 2021 04:17:21 -0000
From: Launchpad Bug Tracker <1865348@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Expired; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: f1outsourcing janitor th-huth
X-Launchpad-Bug-Reporter: f1outsourcing (f1outsourcing)
X-Launchpad-Bug-Modifier: Launchpad Janitor (janitor)
References: <158307448781.11876.11413888488198775469.malonedeb@soybean.canonical.com>
Message-Id: <162554504128.7821.6511079625513205704.malone@loganberry.canonical.com>
Subject: [Bug 1865348] Re: virsh domfsinfo testdom crashes the guest agent
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="fe01712f453e3d8fdd7cfee725621d71a8ae3628"; Instance="production"
X-Launchpad-Hash: eb6290b433c0feae8603d754d09ea4a73d0dc828
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
Reply-To: Bug 1865348 <1865348@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

[Expired for QEMU because there has been no activity for 60 days.]

** Changed in: qemu
       Status: Incomplete =3D> Expired

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1865348

Title:
  virsh domfsinfo testdom crashes the guest agent

Status in QEMU:
  Expired

Bug description:

  [@ ~]# virsh qemu-agent-command vps-01 '{"execute":"guest-get-
  fsinfo"}'

  =

  error: Guest agent is not responding: Guest agent disappeared while execu=
ting command

  [@ ~]# virsh domfsinfo vps-01
  error: Unable to get filesystem information
  error: Guest agent is not responding: Guest agent disappeared while execu=
ting command

  =

  Fault bucket , type 0
  Event Name: APPCRASH
  Response: Not available
  Cab Id: 0

  Problem signature:
  P1: qemu-ga.exe
  P2: 100.0.0.0
  P3: 5c473543
  P4: KERNELBASE.dll
  P5: 6.1.7601.24545
  P6: 5e0eb6bd
  P7: c0000005
  P8: 000000000000c4d2
  P9: =

  P10: =


  Attached files:

  These files may be available here:
  C:\ProgramData\Microsoft\Windows\WER\ReportQueue\AppCrash_qemu-ga.exe_bd2=
e6535bdb93328680e0285e89e08f2866db83_49df29e2

  Analysis symbol: =

  Rechecking for solution: 0
  Report Id: 2ad29522-5bcc-11ea-bca6-525400e83365
  Report Status: 0

  =

  guest os: windows server std 2008r2

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1865348/+subscriptions

