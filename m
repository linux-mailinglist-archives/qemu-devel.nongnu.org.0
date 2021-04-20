Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 27D963652AE
	for <lists+qemu-devel@lfdr.de>; Tue, 20 Apr 2021 08:58:07 +0200 (CEST)
Received: from localhost ([::1]:41068 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lYkKk-0004oK-4p
	for lists+qemu-devel@lfdr.de; Tue, 20 Apr 2021 02:58:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57330)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lYkIg-0003CI-KD
 for qemu-devel@nongnu.org; Tue, 20 Apr 2021 02:55:58 -0400
Received: from indium.canonical.com ([91.189.90.7]:44406)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lYkIY-0005Yc-RD
 for qemu-devel@nongnu.org; Tue, 20 Apr 2021 02:55:58 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1lYkIV-0001v8-Mn
 for <qemu-devel@nongnu.org>; Tue, 20 Apr 2021 06:55:47 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id AB00B2E8052
 for <qemu-devel@nongnu.org>; Tue, 20 Apr 2021 06:55:47 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Tue, 20 Apr 2021 06:50:04 -0000
From: Thomas Huth <1807073@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Incomplete; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: dokbua slesru th-huth zhuhq
X-Launchpad-Bug-Reporter: Hongquan Zhu (zhuhq)
X-Launchpad-Bug-Modifier: Thomas Huth (th-huth)
References: <154406426264.32667.2616897072259419283.malonedeb@chaenomeles.canonical.com>
Message-Id: <161890140473.10441.1961139844013980047.malone@chaenomeles.canonical.com>
Subject: [Bug 1807073] Re: qemu-guest-agent stop work when fsfreeze
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="8932ab84469600dc3d8b3344fb7135c702d5179e"; Instance="production"
X-Launchpad-Hash: 2ce88a17a268f0694988ac1bab7dc4432d228bf4
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
Reply-To: Bug 1807073 <1807073@bugs.launchpad.net>
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
https://bugs.launchpad.net/bugs/1807073

Title:
  qemu-guest-agent stop work when fsfreeze

Status in QEMU:
  Incomplete

Bug description:
  Create a live snapshot, we should first to fsfreeze the file system. We d=
o have only one disk mounted to /:
  Filesystem      Size  Used Avail Use% Mounted on
  udev             48G     0   48G   0% /dev
  tmpfs           9.5G  8.7M  9.5G   1% /run
  /dev/vda1       485G  1.5G  484G   1% /
  tmpfs            48G     0   48G   0% /dev/shm
  tmpfs           5.0M     0  5.0M   0% /run/lock
  tmpfs            48G     0   48G   0% /sys/fs/cgroup
  tmpfs           9.5G     0  9.5G   0% /run/user/0

  snapshot action is OK, when we restore the snapshot, the file system beca=
me read-only, and syslog seems stop writing until we fsck /dev/vda1 and mou=
nt -o rw,remount /:
  Dec  5 00:39:16 systemd[1]: Started Session 180 of user root.
  Dec  5 00:45:05 qemu-ga: info: guest-fsfreeze called
  Dec  5 07:00:45 kernel: [  114.623823] EXT4-fs (vda1): re-mounted. Opts: =
(null)

  So after snapshoting, wo do fsthaw the file system,  maybe the qga
  dose not respond or stop work, this action dose not execute
  successfully and there is no log to show the status of qemu-guest-
  agent.

  Version:
  libvirt 1.2.17
  qemu 2.3.0
  qemu-guest-agent 2.5

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1807073/+subscriptions

