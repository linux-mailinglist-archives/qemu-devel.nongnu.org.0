Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CD61371CED
	for <lists+qemu-devel@lfdr.de>; Mon,  3 May 2021 18:56:55 +0200 (CEST)
Received: from localhost ([::1]:39366 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ldbsM-0002xt-93
	for lists+qemu-devel@lfdr.de; Mon, 03 May 2021 12:56:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44286)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1ldbq9-0001Ob-Ky
 for qemu-devel@nongnu.org; Mon, 03 May 2021 12:54:39 -0400
Received: from indium.canonical.com ([91.189.90.7]:35644)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1ldbq5-0003Z4-IF
 for qemu-devel@nongnu.org; Mon, 03 May 2021 12:54:37 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1ldbq2-0004fC-9e
 for <qemu-devel@nongnu.org>; Mon, 03 May 2021 16:54:30 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id A17412E8194
 for <qemu-devel@nongnu.org>; Mon,  3 May 2021 16:54:29 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Mon, 03 May 2021 16:40:40 -0000
From: Thomas Huth <1338591@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Expired; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: b7-10110111 th-huth
X-Launchpad-Bug-Reporter: Ruslan (b7-10110111)
X-Launchpad-Bug-Modifier: Thomas Huth (th-huth)
References: <20140707141907.27349.18846.malonedeb@gac.canonical.com>
Message-Id: <162006004062.14699.3170815902052959133.malone@wampee.canonical.com>
Subject: [Bug 1338591] Re: Cursor jumps on shape change with vmware vga
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="02afa4875ac52c169f5cddf0d1bcdd6e149a3754"; Instance="production"
X-Launchpad-Hash: 522ed6e2ad8953b80d5d7018aa6c0c468bda69ad
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
Reply-To: Bug 1338591 <1338591@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This is an automated cleanup. This bug report has been moved to QEMU's
new bug tracker on gitlab.com and thus gets marked as 'expired' now.
Please continue with the discussion here:

 https://gitlab.com/qemu-project/qemu/-/issues/104


** Changed in: qemu
       Status: Triaged =3D> Expired

** Bug watch added: gitlab.com/qemu-project/qemu/-/issues #104
   https://gitlab.com/qemu-project/qemu/-/issues/104

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1338591

Title:
  Cursor jumps on shape change with vmware vga

Status in QEMU:
  Expired

Bug description:
  I launch QEMU with the following command line:

  qemu-system-i386 /home/ruslan/iso/Windoze/qemuxp.img -m 512 -display
  sdl -vga vmware -enable-kvm

  The guest OS is Windows XP. To reproduce the problem, do this:

  0. Make sure guest is WinXP (don't know if it's really necessary), use vm=
ware VGA
  1. Set mouse cursor theme to default black&white theme, i.e. that without=
 any translucency etc.
  2. Open a text editor, e.g. built-in notepad
  3. Move the cursor inside text entry widget
  4. See the cursor jumping away. You basically can't enter the cursor ther=
e.

  This also reproduces with MS Word 2003 even with oxy-white cursor
  theme (i.e. that with translucency) =E2=80=94 seems Word uses its plain
  black&transparent cursor for I-beam cursor.

  This doesn't happen with other VGAs, i.e. cirrus and std.

  I used qemu git master to test this. qemu-system-i386 --version
  reports version 2.0.90, git describe says v2.1.0-rc0-1-g9d9de25. This
  also happened in earlier QEMU versions, like 1.5.x and older.

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1338591/+subscriptions

