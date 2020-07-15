Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BC324220CAF
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Jul 2020 14:12:07 +0200 (CEST)
Received: from localhost ([::1]:42178 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jvgGc-00047E-7S
	for lists+qemu-devel@lfdr.de; Wed, 15 Jul 2020 08:12:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58070)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1jvgFa-0003dO-8m
 for qemu-devel@nongnu.org; Wed, 15 Jul 2020 08:11:02 -0400
Received: from indium.canonical.com ([91.189.90.7]:52728)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1jvgFY-0007lf-7Y
 for qemu-devel@nongnu.org; Wed, 15 Jul 2020 08:11:01 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1jvgFV-0006Xv-U8
 for <qemu-devel@nongnu.org>; Wed, 15 Jul 2020 12:10:57 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id E14532E8052
 for <qemu-devel@nongnu.org>; Wed, 15 Jul 2020 12:10:57 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Wed, 15 Jul 2020 12:00:10 -0000
From: Laurent Vivier <1887641@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Invalid; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: balaton-4 david-vantyghem
X-Launchpad-Bug-Reporter: InfoLibre (david-vantyghem)
X-Launchpad-Bug-Modifier: Laurent Vivier (laurent-vivier)
References: <159480389351.19763.4894026633511253778.malonedeb@chaenomeles.canonical.com>
Message-Id: <159481441110.19487.12020557669290779550.launchpad@chaenomeles.canonical.com>
Subject: [Bug 1887641] Re: PCI bus not available for hda
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="4809fcb62f445aaa3ae919f7f6c3cc7d156ea57a";
 Instance="production-secrets-lazr.conf"
X-Launchpad-Hash: 4d899328a151e29c2e1ddae32a3f551ab5f19b15
Received-SPF: none client-ip=91.189.90.7; envelope-from=bounces@canonical.com;
 helo=indium.canonical.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/07/15 02:50:56
X-ACL-Warn: Detected OS   = Linux 3.11 and newer [fuzzy]
X-Spam_score_int: -58
X-Spam_score: -5.9
X-Spam_bar: -----
X-Spam_report: (-5.9 / 5.0 requ) BAYES_00=-1.9, HEADER_FROM_DIFFERENT_DOMAINS=1,
 RCVD_IN_DNSWL_HI=-5, RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Reply-To: Bug 1887641 <1887641@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

** Changed in: qemu
       Status: New =3D> Invalid

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1887641

Title:
  PCI bus not available for hda

Status in QEMU:
  Invalid

Bug description:
  I'm trying to boot Mac OS 9.2.2 image in order to install it on a qcow
  disk image. I'm using Linux Mint MATE 20 and QEMU emulator version
  4.2.0 (Debian 1:4.2-3ubuntu6.3). When I boot, I've got this error
  message and boot fails :

  $ /usr/bin/qemu-system-ppc -monitor stdio -soundhw hda -k fr -machine acc=
el=3Dtcg -m 512 -cdrom /home/david/Bureau/debian-10.0.0-powerpc-NETINST-1.i=
so -drive file=3D"/home/david/.aqemu/iMacG3_hard_disk_HDA.img",if=3Dide,ind=
ex=3D0 -virtfs local,id=3Dshared_folder_dev_0,path=3D/home/david/Bureau,sec=
urity_model=3Dnone,mount_tag=3Dshared0 -boot order=3Ddc,menu=3Don -net nic,=
macaddr=3D00:a2:6d:80:10:8f,model=3Drtl8139 -net user -net user,smb=3D/home=
/david/Bureau -rtc base=3Dlocaltime -name "Debian + LXDE sur iMac G3" -M ma=
c99
  QEMU 4.2.0 monitor - type 'help' for more information
  (qemu) qemu-system-ppc: PCI bus not available for hda

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1887641/+subscriptions

