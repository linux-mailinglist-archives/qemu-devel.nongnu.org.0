Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A1B4F36AAC8
	for <lists+qemu-devel@lfdr.de>; Mon, 26 Apr 2021 04:51:43 +0200 (CEST)
Received: from localhost ([::1]:49846 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1larLa-00074L-87
	for lists+qemu-devel@lfdr.de; Sun, 25 Apr 2021 22:51:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59562)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1larKb-0006et-MK
 for qemu-devel@nongnu.org; Sun, 25 Apr 2021 22:50:41 -0400
Received: from indium.canonical.com ([91.189.90.7]:60374)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1larKZ-0005Ci-Kc
 for qemu-devel@nongnu.org; Sun, 25 Apr 2021 22:50:41 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1larKX-000129-UQ
 for <qemu-devel@nongnu.org>; Mon, 26 Apr 2021 02:50:37 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id E383B2E8060
 for <qemu-devel@nongnu.org>; Mon, 26 Apr 2021 02:50:37 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Mon, 26 Apr 2021 02:45:32 -0000
From: ZhiQiang Yan <1926052@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Invalid; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: davhau
X-Launchpad-Bug-Reporter: David Hauer (davhau)
X-Launchpad-Bug-Modifier: ZhiQiang Yan (v1nke)
References: <161932389728.4719.8630751722997987791.malonedeb@gac.canonical.com>
Message-Id: <161940513299.17328.849177151953395434.launchpad@chaenomeles.canonical.com>
Subject: [Bug 1926052] Re: qemu freezes during grub on arch cloudimg 
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="f9f562f07f129de414c16be22a405ff0964e0018"; Instance="production"
X-Launchpad-Hash: 6a4b330781cdc1c3321633450a7307bd2e0a3ec0
Received-SPF: none client-ip=91.189.90.7; envelope-from=bounces@canonical.com;
 helo=indium.canonical.com
X-Spam_score_int: -66
X-Spam_score: -6.7
X-Spam_bar: ------
X-Spam_report: (-6.7 / 5.0 requ) BAYES_00=-1.9,
 HEADER_FROM_DIFFERENT_DOMAINS=0.25, RCVD_IN_DNSWL_HI=-5,
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
Reply-To: Bug 1926052 <1926052@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

** Changed in: qemu
       Status: New =3D> Invalid

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1926052

Title:
  qemu freezes during grub on arch cloudimg

Status in QEMU:
  Invalid

Bug description:
  When booting the Arch Linux cloud image and setting `-nographic`, qemu wi=
ll freeze during the grub bootloader.
  Tested with qemu 5.1 and 5.2.

  Reproduce:
  ```
  wget https://gitlab.archlinux.org/archlinux/arch-boxes/-/jobs/20342/artif=
acts/raw/output/Arch-Linux-x86_64-basic-20210420.20342.qcow2

  qemu-system-x86_64 -hda Arch-Linux-x86_64-basic-20210420.20342.qcow2
  -nographic

  ```

  It will get stuck while displaying `Welcome to GRUB!`
  If -nographic is omitted, it will continue to boot (without any keyboard =
interaction)

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1926052/+subscriptions

