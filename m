Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 79A4A36A478
	for <lists+qemu-devel@lfdr.de>; Sun, 25 Apr 2021 06:21:53 +0200 (CEST)
Received: from localhost ([::1]:44098 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1laWHH-0000ON-L7
	for lists+qemu-devel@lfdr.de; Sun, 25 Apr 2021 00:21:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39666)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1laWG9-0008No-QI
 for qemu-devel@nongnu.org; Sun, 25 Apr 2021 00:20:41 -0400
Received: from indium.canonical.com ([91.189.90.7]:54854)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1laWG7-0001Zl-JP
 for qemu-devel@nongnu.org; Sun, 25 Apr 2021 00:20:41 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1laWG5-0004QL-Ax
 for <qemu-devel@nongnu.org>; Sun, 25 Apr 2021 04:20:37 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 4D2EB2E8144
 for <qemu-devel@nongnu.org>; Sun, 25 Apr 2021 04:20:37 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Sun, 25 Apr 2021 04:11:37 -0000
From: David Hauer <1926052@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=New; importance=Undecided; assignee=None;
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: davhau
X-Launchpad-Bug-Reporter: David Hauer (davhau)
X-Launchpad-Bug-Modifier: David Hauer (davhau)
Message-Id: <161932389728.4719.8630751722997987791.malonedeb@gac.canonical.com>
Subject: [Bug 1926052] [NEW] qemu freezes during grub on arch cloudimg 
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="f9f562f07f129de414c16be22a405ff0964e0018"; Instance="production"
X-Launchpad-Hash: d65d8ab4effdd440e512ebfdcfd102c52b7073ef
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
Reply-To: Bug 1926052 <1926052@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Public bug reported:

When booting the Arch Linux cloud image and setting `-nographic`, qemu will=
 freeze during the grub bootloader.
Tested with qemu 5.1 and 5.2.

Reproduce:
```
wget https://gitlab.archlinux.org/archlinux/arch-boxes/-/jobs/20342/artifac=
ts/raw/output/Arch-Linux-x86_64-basic-20210420.20342.qcow2

qemu-system-x86_64 -hda Arch-Linux-x86_64-basic-20210420.20342.qcow2
-nographic

```

It will get stuck while displaying `Welcome to GRUB!`
If -nographic is omitted, it will continue to boot (without any keyboard in=
teraction)

** Affects: qemu
     Importance: Undecided
         Status: New

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1926052

Title:
  qemu freezes during grub on arch cloudimg

Status in QEMU:
  New

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

