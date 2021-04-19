Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4109F363A68
	for <lists+qemu-devel@lfdr.de>; Mon, 19 Apr 2021 06:27:41 +0200 (CEST)
Received: from localhost ([::1]:52118 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lYLVb-0006AZ-Oh
	for lists+qemu-devel@lfdr.de; Mon, 19 Apr 2021 00:27:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54816)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lYLTx-0004zE-6H
 for qemu-devel@nongnu.org; Mon, 19 Apr 2021 00:25:57 -0400
Received: from indium.canonical.com ([91.189.90.7]:41500)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lYLTu-0002Ec-HY
 for qemu-devel@nongnu.org; Mon, 19 Apr 2021 00:25:56 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1lYLTq-0006cm-7v
 for <qemu-devel@nongnu.org>; Mon, 19 Apr 2021 04:25:50 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id BA6F92E8170
 for <qemu-devel@nongnu.org>; Mon, 19 Apr 2021 04:25:49 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Mon, 19 Apr 2021 04:17:13 -0000
From: Launchpad Bug Tracker <1816189@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Expired; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Tags: nest nested nested-virt nesting qemu snap snapshots
 virtulazation
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: janitor larry-j-dewey th-huth
X-Launchpad-Bug-Reporter: Larry Dewey (larry-j-dewey)
X-Launchpad-Bug-Modifier: Launchpad Janitor (janitor)
References: <155026463486.6528.17912471655076346086.malonedeb@soybean.canonical.com>
Message-Id: <161880583463.19855.11378659056121160639.malone@loganberry.canonical.com>
Subject: [Bug 1816189] Re: Unable to create or revert snapshots
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="26785e5a6adccabf68a42300ea7053912615013e"; Instance="production"
X-Launchpad-Hash: 2f243ff87e3504827ba15da45912240a705c6d97
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
Reply-To: Bug 1816189 <1816189@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

[Expired for QEMU because there has been no activity for 60 days.]

** Changed in: qemu
       Status: Incomplete =3D> Expired

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1816189

Title:
  Unable to create or revert snapshots

Status in QEMU:
  Expired

Bug description:
  With an update to Qemu (3.1.x) I am unable to revert snapshots using
  virt-manager or virsh. Virtual Machines existing before the update
  seem to function properly. It is only after creating a new machine
  that snapshots are misbehaving. I tested spinning up vms of
  tumbleweed, leap15, and ubuntu 18.04. Each of them had the following
  issues:

  - With the machine running, live reversions act like they apply, but no c=
hanges are actually made.
  - With the machine paused, reversion also does not apply.
  - With the machine turned off, reversion is not possible. Virsh is unable=
 to find the snapshot, and virt-manager errors out with:

  Error running snapshot 'FreshInstall': internal error: qemu
  unexpectedly closed the monitor: 2019-01-15T19:19:46.020247Z qemu-
  system-x86_64: Device 'drive-virtio-disk0' does not have the requested
  snapshot 'FreshInstall'

  Traceback (most recent call last):
    File "/usr/share/virt-manager/virtManager/asyncjob.py", line 75, in cb_=
wrapper
      callback(asyncjob, *args, **kwargs)
    File "/usr/share/virt-manager/virtManager/asyncjob.py", line 111, in tm=
pcb
      callback(*args, **kwargs)
    File "/usr/share/virt-manager/virtManager/libvirtobject.py", line 66, i=
n newfn
      ret =3D fn(self, *args, **kwargs)
    File "/usr/share/virt-manager/virtManager/domain.py", line 1105, in rev=
ert_to_snapshot
      self._backend.revertToSnapshot(snap.get_backend())
    File "/usr/lib64/python3.6/site-packages/libvirt.py", line 2024, in rev=
ertToSnapshot
      if ret =3D=3D -1: raise libvirtError ('virDomainRevertToSnapshot() fa=
iled', dom=3Dself)

  libvirt.libvirtError: internal error: qemu unexpectedly closed the
  monitor: 2019-01-15T19:19:46.020247Z qemu-system-x86_64: Device
  'drive-virtio-disk0' does not have the requested snapshot
  'FreshInstall'

  After doing some digging, the error occurs because of the following commi=
t:
  d98f26073bebddcd3da0ba1b86c3a34e840c0fb8

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1816189/+subscriptions

