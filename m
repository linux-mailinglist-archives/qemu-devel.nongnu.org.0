Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D7D392FAF6E
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Jan 2021 05:33:35 +0100 (CET)
Received: from localhost ([::1]:34138 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l1ihy-00022R-U6
	for lists+qemu-devel@lfdr.de; Mon, 18 Jan 2021 23:33:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44238)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1l1ifj-0000Jd-Rd
 for qemu-devel@nongnu.org; Mon, 18 Jan 2021 23:31:15 -0500
Received: from indium.canonical.com ([91.189.90.7]:57130)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1l1ifg-0004uI-Pj
 for qemu-devel@nongnu.org; Mon, 18 Jan 2021 23:31:15 -0500
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1l1ife-0003vl-PJ
 for <qemu-devel@nongnu.org>; Tue, 19 Jan 2021 04:31:10 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id BDF362E813C
 for <qemu-devel@nongnu.org>; Tue, 19 Jan 2021 04:31:10 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Tue, 19 Jan 2021 04:17:57 -0000
From: Launchpad Bug Tracker <1576347@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Expired; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: blagodurov janitor keith-busch meoporter stefanha
 th-huth tom-ty89
X-Launchpad-Bug-Reporter: Tom Yan (tom-ty89)
X-Launchpad-Bug-Modifier: Launchpad Janitor (janitor)
References: <20160428174421.24544.77308.malonedeb@gac.canonical.com>
Message-Id: <161102987742.12094.15782279030129603761.malone@loganberry.canonical.com>
Subject: [Bug 1576347] Re: Only one NVMe device is usable in Windows (10) guest
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="44709f752aec466e4fba4ac588c69193e99da5ce"; Instance="production"
X-Launchpad-Hash: 6e302386f87ee9577bc5495dbcc2da39fa0d02a8
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
Reply-To: Bug 1576347 <1576347@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

[Expired for QEMU because there has been no activity for 60 days.]

** Changed in: qemu
       Status: Incomplete =3D> Expired

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1576347

Title:
  Only one NVMe device is usable in Windows (10) guest

Status in QEMU:
  Expired

Bug description:
  Full command: qemu-system-x86_64 -enable-kvm -cpu host -smp cores=3D4 -m
  4G -net bridge -net nic -full-screen -drive
  file=3Dovmf_x64.bin,format=3Draw,if=3Dpflash -drive
  file=3Ddisks/win16_ide.img,format=3Draw,cache=3Dnone,aio=3Dnative -drive
  file=3Ddisks/one.img,if=3Dnone,format=3Dqcow2,id=3Done -drive
  file=3Ddisks/two.img,if=3Dnone,format=3Dqcow2,id=3Dtwo -device
  nvme,drive=3Done,serial=3DE86C3CFC43518D6F -device
  nvme,drive=3Dtwo,serial=3D2BDAC262CF831698

  QEMU version: 2.5.0

  Kernel: 4.5.1 (Arch Linux)

  When there are two NVMe devices specified, only the second one will be
  usable in Windows. The following error is shown under "Device status"
  of the failed NVMe controller in Device Manager:

  "This device cannot start. (Code 10)

  The I/O device is configured incorrectly or the configuration
  parameters to the driver are incorrect."

  The only thing seems suspicious to me is that the nvme emulation in
  qemu does not have WWN/EUI-64 set for the devices, though I have no
  idea at all whether that is mandatory:

  "C:\Windows\system32>sg_vpd -i PD1
  Device Identification VPD page:
    Addressed logical unit:
      designator type: SCSI name string,  code set: UTF-8
        SCSI name string:
        8086QEMU NVMe Ctrl                          00012BDAC262CF831698

  C:\Windows\system32>sg_vpd -p sn PD1
  Unit serial number VPD page:
    Unit serial number: 0000_0000_0000_0000."

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1576347/+subscriptions

