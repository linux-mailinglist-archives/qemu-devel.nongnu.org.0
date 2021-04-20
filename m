Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 987C1365426
	for <lists+qemu-devel@lfdr.de>; Tue, 20 Apr 2021 10:30:42 +0200 (CEST)
Received: from localhost ([::1]:34484 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lYlmL-0000x4-IV
	for lists+qemu-devel@lfdr.de; Tue, 20 Apr 2021 04:30:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48420)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lYlj7-00055q-Iv
 for qemu-devel@nongnu.org; Tue, 20 Apr 2021 04:27:21 -0400
Received: from indium.canonical.com ([91.189.90.7]:59154)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lYliz-0002cg-JV
 for qemu-devel@nongnu.org; Tue, 20 Apr 2021 04:27:21 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1lYlim-000282-Vq
 for <qemu-devel@nongnu.org>; Tue, 20 Apr 2021 08:27:01 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 46CDF2E8183
 for <qemu-devel@nongnu.org>; Tue, 20 Apr 2021 08:27:00 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Tue, 20 Apr 2021 08:11:53 -0000
From: Thomas Huth <1806040@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Incomplete; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: bondey bonzini th-huth
X-Launchpad-Bug-Reporter: Bondey (bondey)
X-Launchpad-Bug-Modifier: Thomas Huth (th-huth)
References: <154358384987.15321.7664021717575522872.malonedeb@soybean.canonical.com>
Message-Id: <161890631360.9505.6800333809547963931.malone@chaenomeles.canonical.com>
Subject: [Bug 1806040] Re: Nested VMX virtualization error on last Qemu
 versions
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="8932ab84469600dc3d8b3344fb7135c702d5179e"; Instance="production"
X-Launchpad-Hash: ee84808823445ca4e75104f2cf7852131aaf5b40
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
Reply-To: Bug 1806040 <1806040@bugs.launchpad.net>
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
https://bugs.launchpad.net/bugs/1806040

Title:
  Nested VMX virtualization error on last Qemu versions

Status in QEMU:
  Incomplete

Bug description:
  Recently updated Qemu on a Sony VAIO sve14ag18m with Ubuntu Bionic
  4.15.0-38 from Git

  After launching a few VMs, noticed that i could not create Snapshot due t=
o this error:
  "Nested VMX virtualization does not support live migration yet"

  I've created a new Windows 7 X64 machine with this compilation of Qemu
  and the problem persisted, so it's not because of the old machines.

  I launch Qemu with this params (I use them for malware analisys adn re...=
):
  qemu-system-x86_64 -monitor stdio -display none -m 4096 -smp cpus=3D4 -us=
bdevice tablet -drive file=3DVM.img,index=3D0,media=3Ddisk,format=3Dqcow2,c=
ache=3Dunsafe -net nic,macaddr=3D"...." -net bridge,br=3Dbr0 -cpu host,-hyp=
ervisor,kvm=3Doff -vnc 127.0.0.1:0 -enable-kvm =


  =

  Deleting the changes made on this commit solved the problem, but I dont h=
ave idea what is this for, so... xDD =

  https://github.com/qemu/qemu/commit/d98f26073bebddcd3da0ba1b86c3a34e840c0=
fb8

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1806040/+subscriptions

