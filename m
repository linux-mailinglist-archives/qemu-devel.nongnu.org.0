Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 027642B0793
	for <lists+qemu-devel@lfdr.de>; Thu, 12 Nov 2020 15:32:32 +0100 (CET)
Received: from localhost ([::1]:47754 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kdDeJ-000447-7a
	for lists+qemu-devel@lfdr.de; Thu, 12 Nov 2020 09:32:31 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37158)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1kdDd6-0003be-Gl
 for qemu-devel@nongnu.org; Thu, 12 Nov 2020 09:31:16 -0500
Received: from indium.canonical.com ([91.189.90.7]:60606)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1kdDd3-0000RE-Bd
 for qemu-devel@nongnu.org; Thu, 12 Nov 2020 09:31:16 -0500
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1kdDd1-0000OB-2u
 for <qemu-devel@nongnu.org>; Thu, 12 Nov 2020 14:31:11 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 00B1A2E8130
 for <qemu-devel@nongnu.org>; Thu, 12 Nov 2020 14:31:11 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Thu, 12 Nov 2020 14:15:42 -0000
From: Thomas Huth <1779120@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Incomplete; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: lizhengui pluto-wangjie stefanha th-huth
X-Launchpad-Bug-Reporter: =?utf-8?b?6LSe6LS15p2OIChsaXpoZW5ndWkp?=
X-Launchpad-Bug-Modifier: Thomas Huth (th-huth)
References: <153018930547.7042.8204279860342554943.malonedeb@soybean.canonical.com>
Message-Id: <160519054300.4495.3256144508130108923.malone@gac.canonical.com>
Subject: [Bug 1779120] Re: disk missing in the guest contingently when hotplug
 several virtio scsi disks consecutively
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="9218c6cee10bde7201ace93cd659634a9bc6c70a"; Instance="production"
X-Launchpad-Hash: b434c8eb76d889094b840b06fa53c9089d64bf5a
Received-SPF: none client-ip=91.189.90.7; envelope-from=bounces@canonical.com;
 helo=indium.canonical.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/12 08:20:56
X-ACL-Warn: Detected OS   = Linux 3.11 and newer [fuzzy]
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
Reply-To: Bug 1779120 <1779120@bugs.launchpad.net>
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

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1779120

Title:
  disk missing in the guest contingently when hotplug several virtio
  scsi disks consecutively

Status in QEMU:
  Incomplete

Bug description:
  Hi, I found a bug that disk missing (not all disks missing ) in the
  guest contingently when hotplug several virtio scsi disks
  consecutively.  After rebooting the guest,the missing disks appear
  again.

  The guest is centos7.3 running on a centos7.3 host and the scsi
  controllers are configed with iothread.  The scsi controller xml is
  below:

  =C2=A0=C2=A0=C2=A0=C2=A0<controller type=3D'scsi' index=3D'0' model=3D'vi=
rtio-scsi'>
  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0<driver iothread=3D'26'/>
  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0<alias name=3D'scsi0'/>
  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0<address type=3D'pci' domain=3D'0x000=
0' bus=3D'0x00' slot=3D'0x07' function=3D'0x0'/>
  =C2=A0=C2=A0=C2=A0=C2=A0</controller>

  If the scsi controllers are configed without iothread,  disks are all
  can be seen in the guest when hotplug several virtio scsi disks
  consecutively.

  I think the biggest difference between them is that scsi controllers
  with iothread call virtio_notify_irqfd to notify guest and scsi
  controllers without iothread call virtio_notify instead.  What make it
  difference? Will interrupts are lost when call virtio_notify_irqfd
  due to  race condition for some unknow reasons? Maybe guys more
  familiar with scsi dataplane can help. Thanks for your reply!

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1779120/+subscriptions

