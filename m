Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A600B2FAF8C
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Jan 2021 05:42:06 +0100 (CET)
Received: from localhost ([::1]:59928 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l1iqD-0004JO-Ov
	for lists+qemu-devel@lfdr.de; Mon, 18 Jan 2021 23:42:05 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44522)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1l1ig4-00012s-ED
 for qemu-devel@nongnu.org; Mon, 18 Jan 2021 23:31:36 -0500
Received: from indium.canonical.com ([91.189.90.7]:57878)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1l1ig1-0004zN-Hh
 for qemu-devel@nongnu.org; Mon, 18 Jan 2021 23:31:36 -0500
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1l1ifo-00048D-IC
 for <qemu-devel@nongnu.org>; Tue, 19 Jan 2021 04:31:20 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 3724B2E8141
 for <qemu-devel@nongnu.org>; Tue, 19 Jan 2021 04:31:20 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Tue, 19 Jan 2021 04:17:34 -0000
From: Launchpad Bug Tracker <1530278@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Expired; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: janitor th-huth ztehypervisor
X-Launchpad-Bug-Reporter: Michael liu (ztehypervisor)
X-Launchpad-Bug-Modifier: Launchpad Janitor (janitor)
References: <20151231072636.25694.44329.malonedeb@soybean.canonical.com>
Message-Id: <161102985482.12094.15906698003282132697.malone@loganberry.canonical.com>
Subject: [Bug 1530278] Re: vhost-user: can not detach chardev which is used by
 vhost-user backend
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="44709f752aec466e4fba4ac588c69193e99da5ce"; Instance="production"
X-Launchpad-Hash: 09c9d943258d047ba2e1eaffff227577f6348fbc
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
Reply-To: Bug 1530278 <1530278@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

[Expired for QEMU because there has been no activity for 60 days.]

** Changed in: qemu
       Status: Incomplete =3D> Expired

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1530278

Title:
  vhost-user: can not detach chardev which is used by vhost-user backend

Status in QEMU:
  Expired

Bug description:
  I launch a VM which use vhost-user netdevice as follows.When detach the n=
etdevice in qemu monitor, the chardevice which used by the netdevice also s=
hould be deatched.The netdevice can be detached sucessfully.But the chardev=
ice  failed when it was being detaching.   =

  Full command line :
  qemu-system-x86_64 \
  -cpu host -boot c -hda /home/lining/ubuntu_12_04.img -snapshot -m 2048 -s=
mp 2 \
  --enable-kvm -name "client1" -vnc :1 \
  -object memory-backend-file,id=3Dmem,size=3D2048M,mem-path=3D/dev/hugepag=
es,share=3Don -numa node,memdev=3Dmem \
  -chardev socket,id=3Dchr1,path=3D/opt/network/ovdk/bin/vhost-user \
  -netdev vhost-user,id=3Dnet12,chardev=3Dchr1,ifname=3Dport80, vhostforce \
  -device virtio-net-pci,netdev=3Dnet12,mac=3D00:00:00:00:00:01,\
  csum=3Doff,gso=3Doff,guest_tso4=3Doff,guest_tso6=3Doff,guest_ecn=3Doff,gu=
est_ufo=3Doff,any_layout=3Doff

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1530278/+subscriptions

