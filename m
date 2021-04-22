Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F8B6367D81
	for <lists+qemu-devel@lfdr.de>; Thu, 22 Apr 2021 11:15:36 +0200 (CEST)
Received: from localhost ([::1]:34046 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lZVQt-0002vu-Cn
	for lists+qemu-devel@lfdr.de; Thu, 22 Apr 2021 05:15:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59226)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lZVO8-0001Mv-TU
 for qemu-devel@nongnu.org; Thu, 22 Apr 2021 05:12:44 -0400
Received: from indium.canonical.com ([91.189.90.7]:37118)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lZVO6-0000Dv-V9
 for qemu-devel@nongnu.org; Thu, 22 Apr 2021 05:12:44 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1lZVO5-0007ii-4r
 for <qemu-devel@nongnu.org>; Thu, 22 Apr 2021 09:12:41 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 040F72E815F
 for <qemu-devel@nongnu.org>; Thu, 22 Apr 2021 09:12:41 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Thu, 22 Apr 2021 09:05:23 -0000
From: Thomas Huth <1855535@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Incomplete; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Tags: aix fwd port
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: leohori th-huth
X-Launchpad-Bug-Reporter: Leonardo (leohori)
X-Launchpad-Bug-Modifier: Thomas Huth (th-huth)
References: <157572308250.7047.10873331100308147678.malonedeb@gac.canonical.com>
Message-Id: <161908232392.9965.4892616829353137246.malone@wampee.canonical.com>
Subject: [Bug 1855535] Re: Connection reset by peer when using port fwd
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="1552fceb1603b3da6cfa437575d9c9fc4b2e683a"; Instance="production"
X-Launchpad-Hash: b6d9c304c3895157f6ce5032598c4d353a5ab903
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
Reply-To: Bug 1855535 <1855535@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The QEMU project is currently considering to move its bug tracking to
another system. For this we need to know which bugs are still valid
and which could be closed already. Thus we are setting older bugs to
"Incomplete" now.

If you still think this bug report here is valid, then please switch
the state back to "New" within the next 60 days, otherwise this report
will be marked as "Expired". Or please mark it as "Fix Released" if
the problem has been solved with a newer version of QEMU already.

Thank you and sorry for the inconvenience.


** Changed in: qemu
       Status: New =3D> Incomplete

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1855535

Title:
  Connection reset by peer when using port fwd

Status in QEMU:
  Incomplete

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

