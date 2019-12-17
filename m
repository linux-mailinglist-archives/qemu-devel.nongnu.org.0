Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F80B122C48
	for <lists+qemu-devel@lfdr.de>; Tue, 17 Dec 2019 13:48:30 +0100 (CET)
Received: from localhost ([::1]:39916 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ihCH7-00074z-CD
	for lists+qemu-devel@lfdr.de; Tue, 17 Dec 2019 07:48:29 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:52526)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <bounces@canonical.com>) id 1ihCEl-0004gA-96
 for qemu-devel@nongnu.org; Tue, 17 Dec 2019 07:46:04 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <bounces@canonical.com>) id 1ihCEj-0008WM-Vu
 for qemu-devel@nongnu.org; Tue, 17 Dec 2019 07:46:03 -0500
Received: from indium.canonical.com ([91.189.90.7]:35806)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <bounces@canonical.com>)
 id 1ihCEj-0008VY-OY
 for qemu-devel@nongnu.org; Tue, 17 Dec 2019 07:46:01 -0500
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1ihCEg-00040G-Au
 for <qemu-devel@nongnu.org>; Tue, 17 Dec 2019 12:45:58 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 80D192E80DD
 for <qemu-devel@nongnu.org>; Tue, 17 Dec 2019 12:45:55 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Tue, 17 Dec 2019 12:38:11 -0000
From: Vasili <1851552@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=cloud-init; status=New; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug: product=networking-calico; status=New; importance=Undecided; 
 assignee=None; 
X-Launchpad-Bug: product=nova; status=New; importance=Undecided; assignee=None;
X-Launchpad-Bug: product=openstack-community; status=New; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug: product=qemu; status=New; importance=Undecided; assignee=None;
X-Launchpad-Bug: product=qemu-kvm; status=New; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug: distribution=ubuntu; sourcepackage=cloud-init; component=main;
 status=Confirmed; importance=Undecided; assignee=None; 
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: daniel-thewatkins janitor legovini raharper smoser
 vasili.namatov
X-Launchpad-Bug-Reporter: Vasili (vasili.namatov)
X-Launchpad-Bug-Modifier: Vasili (vasili.namatov)
References: <157306761727.2702.10828795840242046904.malonedeb@gac.canonical.com>
Message-Id: <157658629127.14566.7589239350219795426.launchpad@wampee.canonical.com>
Subject: [Bug 1851552] Re: since ubuntu 18 bionic release and latest,
 the ubuntu18 cloud image is unable to boot up on openstack instance 
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="bceb5ef013b87ef7aafe0755545ceb689ca7ac60";
 Instance="production-secrets-lazr.conf"
X-Launchpad-Hash: 4469229a7788de35bef6a18d88ff66266283013b
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 91.189.90.7
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
Reply-To: Bug 1851552 <1851552@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

** Also affects: nova
   Importance: Undecided
       Status: New

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1851552

Title:
  since ubuntu 18 bionic release and latest, the ubuntu18 cloud image is
  unable to boot up on openstack instance

Status in cloud-init:
  New
Status in networking-calico:
  New
Status in OpenStack Compute (nova):
  New
Status in OpenStack Community Project:
  New
Status in QEMU:
  New
Status in qemu-kvm:
  New
Status in cloud-init package in Ubuntu:
  Confirmed

Bug description:
  Openstack Queens release which is running on ubuntu 18 LTS Controller and=
 Compute.
  Tried to boot up the instance via horizon dashboard without success.
  Nova flow works perfect.
  When access to console I discovered that the boot process stuck in the mi=
ddle.
  [[0;1;31m TIME [0m] Timed out waiting for device dev-vdb.device.
  [[0;1;33mDEPEND[0m] Dependency failed for /mnt.
  [[0;1;33mDEPEND[0m] Dependency failed for File System Check on /dev/vdb.
  It receives IP but looks like not get configured at time.
  since ubuntu 18 there is netplan feature managing the network interfaces
  please advise.

  more details as follow:
  https://bugs.launchpad.net/networking-calico/+bug/1851548

To manage notifications about this bug go to:
https://bugs.launchpad.net/cloud-init/+bug/1851552/+subscriptions

