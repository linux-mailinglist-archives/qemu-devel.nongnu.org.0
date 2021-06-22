Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 45AB93AFBF8
	for <lists+qemu-devel@lfdr.de>; Tue, 22 Jun 2021 06:32:20 +0200 (CEST)
Received: from localhost ([::1]:56612 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lvY5D-0003Hm-92
	for lists+qemu-devel@lfdr.de; Tue, 22 Jun 2021 00:32:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57082)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lvXzG-0005lV-6l
 for qemu-devel@nongnu.org; Tue, 22 Jun 2021 00:26:10 -0400
Received: from indium.canonical.com ([91.189.90.7]:55376)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lvXz9-0004fj-RY
 for qemu-devel@nongnu.org; Tue, 22 Jun 2021 00:26:09 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.93 #5 (Debian))
 id 1lvXz3-00014v-Ew
 for <qemu-devel@nongnu.org>; Tue, 22 Jun 2021 04:25:57 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 3EACE2E80BA
 for <qemu-devel@nongnu.org>; Tue, 22 Jun 2021 04:25:55 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Tue, 22 Jun 2021 04:18:48 -0000
From: Launchpad Bug Tracker <1855535@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Expired; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Tags: aix fwd port
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: janitor leohori th-huth
X-Launchpad-Bug-Reporter: Leonardo (leohori)
X-Launchpad-Bug-Modifier: Launchpad Janitor (janitor)
References: <157572308250.7047.10873331100308147678.malonedeb@gac.canonical.com>
Message-Id: <162433552888.20423.9208696493132304578.malone@loganberry.canonical.com>
Subject: [Bug 1855535] Re: Connection reset by peer when using port fwd
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="3619498b5524a71696f3dd612f4d11bd63449bb1"; Instance="production"
X-Launchpad-Hash: a13391471056f8f7eb07e26e7294d0c118b2314b
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
Reply-To: Bug 1855535 <1855535@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

[Expired for QEMU because there has been no activity for 60 days.]

** Changed in: qemu
       Status: Incomplete =3D> Expired

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1855535

Title:
  Connection reset by peer when using port fwd

Status in QEMU:
  Expired

Bug description:
  $ qemu-system-ppc64 -cpu POWER8,compat=3Dpower7 -machine pseries -m 8G -s=
mp cores=3D8 -serial mon:stdio -nographic \
  -drive file=3D/qemu/aix72.img,if=3Dnone,id=3Ddrive-virtio-disk0 \
  -device virtio-scsi-pci,id=3Dscsi -device scsi-hd,drive=3Ddrive-virtio-di=
sk0 \
  -cdrom /qemu/aix72.iso \
  -prom-env boot-command=3D'boot disk:' \
  -name ctsprod -k es \
  -netdev user,id=3Dnetdev0,hostfwd=3Dtcp:127.0.0.1:2222-:22 \
  -device virtio-net-pci,netdev=3Dnetdev0 \
  -netdev bridge,id=3Dhostnet0,br=3Dvirbr0 \
  -device virtio-net-pci,netdev=3Dhostnet0,id=3Dnet0,mac=3D52:54:00:96:2f:7=
a \
  -device virtio-net,netdev=3Dvmnic -netdev tap,id=3Dvmnic,ifname=3Dvnet0,s=
cript=3Dno,downscript=3Dno \
  -monitor telnet:127.0.0.1:5801,server,nowait,nodelay

  =

  $ ssh -p 2222 root@127.0.0.1 -v

  OpenSSH_7.6p1 Ubuntu-4ubuntu0.3, OpenSSL 1.0.2n  7 Dec 2017
  debug1: Reading configuration data /etc/ssh/ssh_config
  debug1: /etc/ssh/ssh_config line 19: Applying options for *
  debug1: Connecting to 127.0.0.1 [127.0.0.1] port 2222.
  debug1: Connection established.
  debug1: permanently_set_uid: 0/0
  debug1: key_load_public: No such file or directory
  debug1: identity file /root/.ssh/id_rsa type -1
  debug1: key_load_public: No such file or directory
  debug1: identity file /root/.ssh/id_rsa-cert type -1
  debug1: key_load_public: No such file or directory
  debug1: identity file /root/.ssh/id_dsa type -1
  debug1: key_load_public: No such file or directory
  debug1: identity file /root/.ssh/id_dsa-cert type -1
  debug1: key_load_public: No such file or directory
  debug1: identity file /root/.ssh/id_ecdsa type -1
  debug1: key_load_public: No such file or directory
  debug1: identity file /root/.ssh/id_ecdsa-cert type -1
  debug1: key_load_public: No such file or directory
  debug1: identity file /root/.ssh/id_ed25519 type -1
  debug1: key_load_public: No such file or directory
  debug1: identity file /root/.ssh/id_ed25519-cert type -1
  debug1: Local version string SSH-2.0-OpenSSH_7.6p1 Ubuntu-4ubuntu0.3
  ssh_exchange_identification: read: Connection reset by peer

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1855535/+subscriptions

