Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 729BE3AFC4E
	for <lists+qemu-devel@lfdr.de>; Tue, 22 Jun 2021 07:00:49 +0200 (CEST)
Received: from localhost ([::1]:44756 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lvYWl-0005DV-W6
	for lists+qemu-devel@lfdr.de; Tue, 22 Jun 2021 01:00:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57568)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lvXzt-00086S-3F
 for qemu-devel@nongnu.org; Tue, 22 Jun 2021 00:26:49 -0400
Received: from indium.canonical.com ([91.189.90.7]:57544)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lvXzr-0005Lr-5d
 for qemu-devel@nongnu.org; Tue, 22 Jun 2021 00:26:48 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.93 #5 (Debian))
 id 1lvXze-00014I-3p
 for <qemu-devel@nongnu.org>; Tue, 22 Jun 2021 04:26:34 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 6B89D2E81A8
 for <qemu-devel@nongnu.org>; Tue, 22 Jun 2021 04:26:30 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Tue, 22 Jun 2021 04:18:00 -0000
From: Launchpad Bug Tracker <1828508@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Expired; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: alpha76 janitor stefanha th-huth
X-Launchpad-Bug-Reporter: Jake Mikelson (alpha76)
X-Launchpad-Bug-Modifier: Launchpad Janitor (janitor)
References: <155746839267.15002.8138674450166661929.malonedeb@wampee.canonical.com>
Message-Id: <162433548017.20423.4717810284242558316.malone@loganberry.canonical.com>
Subject: [Bug 1828508] Re: qemu-img created VMDK files lead to "Unsupported or
 invalid disk type 7"
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="3619498b5524a71696f3dd612f4d11bd63449bb1"; Instance="production"
X-Launchpad-Hash: a4863bf2acca9c8623620892f6ad5e13ac116dd9
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
Reply-To: Bug 1828508 <1828508@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

[Expired for QEMU because there has been no activity for 60 days.]

** Changed in: qemu
       Status: Incomplete =3D> Expired

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1828508

Title:
  qemu-img created VMDK files lead to "Unsupported or invalid disk type
  7"

Status in QEMU:
  Expired

Bug description:
  Using qemu-img version 3.1.50 (v3.1.0-13607-geb2db0f7ba-dirty) on a
  Windows 10 machine.

  Converting a VHD to VMDK.
  qemu-img.exe convert "c:\test\AppD-VM01.vhd" -O vmdk -o adapter_type=3Dbu=
slogic -p "c:\test\AppD-VM01.vmdk"

  I have also tried:
  qemu-img.exe convert "c:\test\AppD-VM01.vhd" -O vmdk -o adapter_type=3Dbu=
slogic,hwversion=3D6 -p "c:\test\AppD-VM01.vmdk"

  Attaching the VMDK to a VM in VMware produces the following error when
  powering on.

  Power On virtual machine:Failed to open disk scsi0:1: Unsupported or inva=
lid disk type 7. Ensure that the disk has been imported.
  Target: MyVM1
  vCenter Server: VCENTER
  Error Stack
  An error was received from the ESX host while powering on VM MyVM1.
  Failed to start the virtual machine.
  Module DevicePowerOn power on failed. =

  Unable to create virtual SCSI device for scsi0:1, '/vmfs/volumes/5cca0155=
-bdddf31d-2714-00215acbeb1e/AppD-VM01/AppDdisk1-VM01.vmdk' =

  Failed to open disk scsi0:1: Unsupported or invalid disk type 7. Ensure t=
hat the disk has been imported.

  =

  If I do not specify the adapter type, it creates an IDE VMDK which works =
perfectly.

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1828508/+subscriptions

