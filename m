Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 99F7C3C9772
	for <lists+qemu-devel@lfdr.de>; Thu, 15 Jul 2021 06:29:52 +0200 (CEST)
Received: from localhost ([::1]:49744 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m3t0R-0004kF-LQ
	for lists+qemu-devel@lfdr.de; Thu, 15 Jul 2021 00:29:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36534)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1m3swX-0004wM-2o
 for qemu-devel@nongnu.org; Thu, 15 Jul 2021 00:25:49 -0400
Received: from indium.canonical.com ([91.189.90.7]:37900)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1m3swV-0000IQ-Bz
 for qemu-devel@nongnu.org; Thu, 15 Jul 2021 00:25:48 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.93 #5 (Debian))
 id 1m3swS-0007Us-S5
 for <qemu-devel@nongnu.org>; Thu, 15 Jul 2021 04:25:44 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id D32D72E8169
 for <qemu-devel@nongnu.org>; Thu, 15 Jul 2021 04:25:44 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Thu, 15 Jul 2021 04:17:22 -0000
From: Launchpad Bug Tracker <1926231@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Expired; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: janitor mslade th-huth
X-Launchpad-Bug-Reporter: Michael Slade (mslade)
X-Launchpad-Bug-Modifier: Launchpad Janitor (janitor)
References: <161948395808.4012.2859419220100718976.malonedeb@gac.canonical.com>
Message-Id: <162632264261.31721.14813883401889263556.malone@loganberry.canonical.com>
Subject: [Bug 1926231] Re: SCSI passthrough of SATA cdrom -> errors &
 performance issues
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="4fbbc20799edd34b40f59a0c81c360f947903b2a"; Instance="production"
X-Launchpad-Hash: cabbbe80c5f3cec1f575f446d75156338f1c3dad
Received-SPF: pass client-ip=91.189.90.7; envelope-from=bounces@canonical.com;
 helo=indium.canonical.com
X-Spam_score_int: -65
X-Spam_score: -6.6
X-Spam_bar: ------
X-Spam_report: (-6.6 / 5.0 requ) BAYES_00=-1.9,
 HEADER_FROM_DIFFERENT_DOMAINS=0.249, RCVD_IN_DNSWL_HI=-5,
 RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Reply-To: Bug 1926231 <1926231@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

[Expired for QEMU because there has been no activity for 60 days.]

** Changed in: qemu
       Status: Incomplete =3D> Expired

--=20
You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1926231

Title:
  SCSI passthrough of SATA cdrom -> errors & performance issues

Status in QEMU:
  Expired

Bug description:
  qemu 5.0, compiled from git

  I am passing through a SATA cdrom via SCSI passthrough, with this
  libvirt XML:

      <hostdev mode=3D'subsystem' type=3D'scsi' managed=3D'no' sgio=3D'unfi=
ltered' rawio=3D'yes'>
        <source>
          <adapter name=3D'scsi_host3'/>
          <address bus=3D'0' target=3D'0' unit=3D'0'/>
        </source>
        <alias name=3D'hostdev0'/>
        <address type=3D'drive' controller=3D'0' bus=3D'0' target=3D'0' uni=
t=3D'0'/>
      </hostdev>

  It seems to mostly work, I have written discs with it, except I am
  getting errors that cause reads to take about 5x as long as they
  should, under certain circumstances.  It appears to be based on the
  guest's read block size.

  I found that if on the guest I run, say `dd if=3D$some_large_file
  bs=3D262144|pv > /dev/null`, `iostat` and `pv` disagree about how much
  is being read by a factor of about 2.  Also many kernel messages like
  this happen on the guest:

  [  190.919684] sr 0:0:0:0: [sr0] tag#160 FAILED Result: hostbyte=3DDID_OK=
 driverbyte=3DDRIVER_SENSE cmd_age=3D0s
  [  190.919687] sr 0:0:0:0: [sr0] tag#160 Sense Key : Aborted Command [cur=
rent]=20
  [  190.919689] sr 0:0:0:0: [sr0] tag#160 Add. Sense: I/O process terminat=
ed
  [  190.919691] sr 0:0:0:0: [sr0] tag#160 CDB: Read(10) 28 00 00 18 a5 5a =
00 00 80 00
  [  190.919694] blk_update_request: I/O error, dev sr0, sector 6460776 op =
0x0:(READ) flags 0x80700 phys_seg 5 prio class 0

  If I change to bs=3D131072 the errors stop and performance is normal.

  (262144 happens to be the block size ultimately used by md5sum, which
  is how I got here)

  I also ran strace on the qemu process while it was happening, and
  noticed SG_IO calls like this:

  21748 10:06:29.330910 ioctl(22, SG_IO, {interface_id=3D'S', dxfer_directi=
on=3DSG_DXFER_FROM_DEV, cmd_len=3D10, cmdp=3D"\x28\x00\x00\x12\x95\x5a\x00\=
x00\x80\x00", mx_sb_len=3D252, iovec_count=3D0, dxfer_len=3D262144, timeout=
=3D4294967295, flags=3DSG_FLAG_DIRECT_IO <unfinished ...>
  21751 10:06:29.330976 ioctl(22, SG_IO, {interface_id=3D'S', dxfer_directi=
on=3DSG_DXFER_FROM_DEV, cmd_len=3D10, cmdp=3D"\x28\x00\x00\x12\x94\xda\x00\=
x00\x02\x00", mx_sb_len=3D252, iovec_count=3D0, dxfer_len=3D4096, timeout=
=3D4294967295, flags=3DSG_FLAG_DIRECT_IO <unfinished ...>
  21749 10:06:29.331586 ioctl(22, SG_IO, {interface_id=3D'S', dxfer_directi=
on=3DSG_DXFER_FROM_DEV, cmd_len=3D10, cmdp=3D"\x28\x00\x00\x12\x94\xdc\x00\=
x00\x02\x00", mx_sb_len=3D252, iovec_count=3D0, dxfer_len=3D4096, timeout=
=3D4294967295, flags=3DSG_FLAG_DIRECT_IO <unfinished ...>
  [etc]

  I suspect qemu is the culprit because I have tried a 4.19 guest kernel
  as well as a 5.9 one, with the same result.

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1926231/+subscriptions


