Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 63A0D2698B1
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Sep 2020 00:14:54 +0200 (CEST)
Received: from localhost ([::1]:49818 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kHwkP-0008D3-Fz
	for lists+qemu-devel@lfdr.de; Mon, 14 Sep 2020 18:14:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53748)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1kHwgS-0003cS-7v
 for qemu-devel@nongnu.org; Mon, 14 Sep 2020 18:10:48 -0400
Received: from indium.canonical.com ([91.189.90.7]:58642)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1kHwgP-0000mi-Tz
 for qemu-devel@nongnu.org; Mon, 14 Sep 2020 18:10:47 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1kHwgM-0002k7-MM
 for <qemu-devel@nongnu.org>; Mon, 14 Sep 2020 22:10:42 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id A3E6B2E80DB
 for <qemu-devel@nongnu.org>; Mon, 14 Sep 2020 22:10:42 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Mon, 14 Sep 2020 22:03:02 -0000
From: Petunia <1895053@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=New; importance=Undecided; assignee=None;
X-Launchpad-Bug-Tags: linux-user
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: laurent-vivier petunia2000
X-Launchpad-Bug-Reporter: Petunia (petunia2000)
X-Launchpad-Bug-Modifier: Petunia (petunia2000)
References: <159968542073.11462.1191604929312152807.malonedeb@chaenomeles.canonical.com>
Message-Id: <160012098302.13806.18015836722669860873.malone@gac.canonical.com>
Subject: [Bug 1895053] Re: Cannot nspawn raspbian 10 [FAILED] Failed to start
 Journal Service.
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="83bdf6c8a3a5f87722c8927e54838522f3e57504"; Instance="production"
X-Launchpad-Hash: 5d36483fde73611f4e7fc27764010a3f4ebc245d
Received-SPF: none client-ip=91.189.90.7; envelope-from=bounces@canonical.com;
 helo=indium.canonical.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/09/14 16:10:45
X-ACL-Warn: Detected OS   = Linux 3.11 and newer [fuzzy]
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
Reply-To: Bug 1895053 <1895053@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

for file in /proc/sys/fs/binfmt_misc/* ; do echo "$file"; LANG=3DC cat $fil=
e; done
/proc/sys/fs/binfmt_misc/aarch64
enabled
interpreter /usr/bin/qemu-aarch64-static
flags: OCF
offset 0
magic 7f454c460201010000000000000000000200b7
mask ffffffffffffff00fffffffffffffffffeffff
/proc/sys/fs/binfmt_misc/arm
enabled
interpreter /usr/bin/qemu-arm-static
flags: OCF
offset 0
magic 7f454c4601010100000000000000000002002800
mask ffffffffffffff00fffffffffffffffffeffffff
/proc/sys/fs/binfmt_misc/armeb
enabled
interpreter /usr/bin/qemu-armeb-static
flags: OCF
offset 0
magic 7f454c4601020100000000000000000000020028
mask ffffffffffffff00fffffffffffffffffffeffff
/proc/sys/fs/binfmt_misc/CLR
enabled
interpreter /usr/bin/mono
flags: =

offset 0
magic 4d5a
/proc/sys/fs/binfmt_misc/DOSWin
enabled
interpreter /usr/bin/wine
flags: =

offset 0
magic 4d5a
/proc/sys/fs/binfmt_misc/register
cat: /proc/sys/fs/binfmt_misc/register: Permission denied
/proc/sys/fs/binfmt_misc/status
enabled

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1895053

Title:
  Cannot nspawn raspbian 10 [FAILED] Failed to start Journal Service.

Status in QEMU:
  New

Bug description:
  Hi, I'm using nspawn and asked the question @systemd-devel. They redirect=
ed me to you, guessing that nspawn calls a syscall or ioctl qemu isnt aware=
 of and can't implement properly?
  They were like: "Sorry, that's not my department." ^^

  Maybe you can reproduce the issue or help me investigating whats wrong
  or put the ball right back into their court? :D

  Testscript:
  wget https://downloads.raspberrypi.org/raspios_lite_armhf_latest -o r.zip
  unzip r.zip
  LOOP=3D$(losetup --show -Pf *raspios-buster-armhf-lite.img)
  mount ${LOOP}p2 /mnt
  mount ${LOOP}p1 /mnt/boot
  systemd-nspawn --bind /usr/bin/qemu-arm-static --boot --directory=3D/mnt =
-- systemd.log_level=3Ddebug

  Output:
  see attachment

  System:
  uname -a
  Linux MArch 5.8.7-arch1-1 #1 SMP PREEMPT Sat, 05 Sep 2020 12:31:32 +0000
  x86_64 GNU/Linux

  qemu-arm-static --version
  qemu-arm version 5.1.0

  systemd-nspawn --version
  systemd 246 (246.4-1-arch)
  +PAM +AUDIT -SELINUX -IMA -APPARMOR +SMACK -SYSVINIT +UTMP +LIBCRYPTSETUP
  +GCRYPT +GNUTLS +ACL +XZ +LZ4 +ZSTD +SECCOMP +BLKID +ELFUTILS +KMOD +IDN2=
 -IDN
  +PCRE2 default-hierarchy=3Dhybrid

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1895053/+subscriptions

