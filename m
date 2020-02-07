Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 206E5155F09
	for <lists+qemu-devel@lfdr.de>; Fri,  7 Feb 2020 21:06:30 +0100 (CET)
Received: from localhost ([::1]:34660 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1j09tT-0006Dy-4H
	for lists+qemu-devel@lfdr.de; Fri, 07 Feb 2020 15:06:27 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51546)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <bounces@canonical.com>) id 1j09sg-0005pG-R1
 for qemu-devel@nongnu.org; Fri, 07 Feb 2020 15:05:40 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <bounces@canonical.com>) id 1j09sf-00015q-2K
 for qemu-devel@nongnu.org; Fri, 07 Feb 2020 15:05:38 -0500
Received: from indium.canonical.com ([91.189.90.7]:44102)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <bounces@canonical.com>)
 id 1j09se-00012y-S9
 for qemu-devel@nongnu.org; Fri, 07 Feb 2020 15:05:37 -0500
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1j09sd-00019i-P0
 for <qemu-devel@nongnu.org>; Fri, 07 Feb 2020 20:05:35 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id B74302E80C7
 for <qemu-devel@nongnu.org>; Fri,  7 Feb 2020 20:05:35 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Fri, 07 Feb 2020 19:59:55 -0000
From: yw662 <1862415@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=New; importance=Undecided; assignee=None;
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: yw662
X-Launchpad-Bug-Reporter: yw662 (yw662)
X-Launchpad-Bug-Modifier: yw662 (yw662)
References: <158110549948.8965.4395096108369482087.malonedeb@chaenomeles.canonical.com>
Message-Id: <158110559565.8770.10768731295664794562.malone@chaenomeles.canonical.com>
Subject: [Bug 1862415] Re: -nic user cannot receive TFTP response from outside
 on windows 10 host
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="0a62c17273454a1313f81a74a2198ec30b44c7b6";
 Instance="production-secrets-lazr.conf"
X-Launchpad-Hash: 8aef46affdfa578ca6e8d57aaa326b7fb41defec
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 91.189.90.7
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
Reply-To: Bug 1862415 <1862415@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

** Attachment added: "dump.dat"
   https://bugs.launchpad.net/qemu/+bug/1862415/+attachment/5326375/+files/=
dump.dat

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1862415

Title:
  -nic user cannot receive TFTP response from outside on windows 10 host

Status in QEMU:
  New

Bug description:
  Configuration:
  qemu is on a windows 10 host, address 192.168.1.24
  A tftp server, which is atftpd, is at address 192.168.1.31
  a guest is started by: =

  ```
  .\qemu-system-x86_64.exe -accel hax \
  -nic user,id=3Dn1,tftp-server-name=3D192.168.1.31,bootfile=3Dtftp://192.1=
68.1.31/grub/i386-pc/core.0 \
  -object filter-dump,id=3Df1,netdev=3Dn1,file=3Ddump.dat
  ```

  qemu v4.2.0-11797-g2890edc853-dirty, from https://qemu.weilnetz.de/w64/
  windows 10 1909 18363.628

  Here is the captured traffic from dump.dat, no filter applied:
  No.	Time	Source	Destination	Protocol	Length	Info
  1	0.000000	0.0.0.0	255.255.255.255	DHCP	439	DHCP Discover - Transaction I=
D 0xdb38340e
  2	0.000081	10.0.2.2	255.255.255.255	DHCP	590	DHCP Offer    - Transaction =
ID 0xdb38340e
  3	1.035670	0.0.0.0	255.255.255.255	DHCP	439	DHCP Discover - Transaction I=
D 0xdb38340e
  4	1.035693	10.0.2.2	255.255.255.255	DHCP	590	DHCP Offer    - Transaction =
ID 0xdb38340e
  5	3.068055	0.0.0.0	255.255.255.255	DHCP	451	DHCP Request  - Transaction I=
D 0xdb38340e
  6	3.068099	10.0.2.2	255.255.255.255	DHCP	590	DHCP ACK      - Transaction =
ID 0xdb38340e
  7	3.068209	RealtekU_12:34:56	Broadcast	ARP	42	ARP Announcement for 10.0.2=
.15
  8	3.148419	RealtekU_12:34:56	Broadcast	ARP	42	Who has 10.0.2.2? Tell 10.0=
.2.15
  9	3.148449	52:55:0a:00:02:02	RealtekU_12:34:56	ARP	64	10.0.2.2 is at 52:5=
5:0a:00:02:02
  10	3.148511	10.0.2.15	192.168.1.31	TFTP	91	Read Request, File: grub/i386-=
pc/core.0, Transfer type: octet, blksize=3D1432, tsize=3D0
  11	3.398093	10.0.2.15	192.168.1.31	TFTP	91	Read Request, File: grub/i386-=
pc/core.0, Transfer type: octet, blksize=3D1432, tsize=3D0
  12	3.946041	10.0.2.15	192.168.1.31	TFTP	91	Read Request, File: grub/i386-=
pc/core.0, Transfer type: octet, blksize=3D1432, tsize=3D0
  13	4.990262	10.0.2.15	192.168.1.31	TFTP	91	Read Request, File: grub/i386-=
pc/core.0, Transfer type: octet, blksize=3D1432, tsize=3D0
  14	7.022839	10.0.2.15	192.168.1.31	TFTP	91	Read Request, File: grub/i386-=
pc/core.0, Transfer type: octet, blksize=3D1432, tsize=3D0
  15	11.087041	10.0.2.15	192.168.1.31	TFTP	91	Read Request, File: grub/i386=
-pc/core.0, Transfer type: octet, blksize=3D1432, tsize=3D0

  =

  Here is the captured traffic at host NIC, filered by from or to 192.168.1=
.31
  No.	Time	Source	Destination	Protocol	Length	Info
  14140	57.729066	192.168.1.24	192.168.1.31	TFTP	91	Read Request, File: gru=
b/i386-pc/core.0, Transfer type: octet, blksize=3D1432, tsize=3D0
  14141	57.732988	192.168.1.31	192.168.1.24	TFTP	69	Option Acknowledgement,=
 tsize=3D45542, blksize=3D1432
  14255	57.977995	192.168.1.24	192.168.1.31	TFTP	91	Read Request, File: gru=
b/i386-pc/core.0, Transfer type: octet, blksize=3D1432, tsize=3D0
  14256	57.979876	192.168.1.31	192.168.1.24	TFTP	69	Option Acknowledgement,=
 tsize=3D45542, blksize=3D1432
  14275	58.525939	192.168.1.24	192.168.1.31	TFTP	91	Read Request, File: gru=
b/i386-pc/core.0, Transfer type: octet, blksize=3D1432, tsize=3D0
  14276	58.527819	192.168.1.31	192.168.1.24	TFTP	69	Option Acknowledgement,=
 tsize=3D45542, blksize=3D1432
  14328	59.570178	192.168.1.24	192.168.1.31	TFTP	91	Read Request, File: gru=
b/i386-pc/core.0, Transfer type: octet, blksize=3D1432, tsize=3D0
  14329	59.581024	192.168.1.31	192.168.1.24	TFTP	69	Option Acknowledgement,=
 tsize=3D45542, blksize=3D1432
  14383	61.602742	192.168.1.24	192.168.1.31	TFTP	91	Read Request, File: gru=
b/i386-pc/core.0, Transfer type: octet, blksize=3D1432, tsize=3D0
  14384	61.605554	192.168.1.31	192.168.1.24	TFTP	69	Option Acknowledgement,=
 tsize=3D45542, blksize=3D1432
  14730	62.736572	192.168.1.31	192.168.1.24	TFTP	69	Option Acknowledgement,=
 tsize=3D45542, blksize=3D1432
  14741	62.987924	192.168.1.31	192.168.1.24	TFTP	69	Option Acknowledgement,=
 tsize=3D45542, blksize=3D1432
  14756	63.533477	192.168.1.31	192.168.1.24	TFTP	69	Option Acknowledgement,=
 tsize=3D45542, blksize=3D1432
  14815	64.577653	192.168.1.31	192.168.1.24	TFTP	69	Option Acknowledgement,=
 tsize=3D45542, blksize=3D1432
  14916	65.666959	192.168.1.24	192.168.1.31	TFTP	91	Read Request, File: gru=
b/i386-pc/core.0, Transfer type: octet, blksize=3D1432, tsize=3D0
  14917	65.668778	192.168.1.31	192.168.1.24	TFTP	69	Option Acknowledgement,=
 tsize=3D45542, blksize=3D1432
  15235	66.615186	192.168.1.31	192.168.1.24	TFTP	69	Option Acknowledgement,=
 tsize=3D45542, blksize=3D1432
  15481	67.745250	192.168.1.31	192.168.1.24	TFTP	69	Option Acknowledgement,=
 tsize=3D45542, blksize=3D1432
  15509	67.991523	192.168.1.31	192.168.1.24	TFTP	69	Option Acknowledgement,=
 tsize=3D45542, blksize=3D1432
  15566	68.539050	192.168.1.31	192.168.1.24	TFTP	69	Option Acknowledgement,=
 tsize=3D45542, blksize=3D1432
  16691	69.583531	192.168.1.31	192.168.1.24	TFTP	69	Option Acknowledgement,=
 tsize=3D45542, blksize=3D1432
  17457	70.675366	192.168.1.31	192.168.1.24	TFTP	69	Option Acknowledgement,=
 tsize=3D45542, blksize=3D1432
  17599	71.615337	192.168.1.31	192.168.1.24	TFTP	69	Option Acknowledgement,=
 tsize=3D45542, blksize=3D1432
  17904	72.747338	192.168.1.31	192.168.1.24	TFTP	69	Option Acknowledgement,=
 tsize=3D45542, blksize=3D1432
  18012	72.995681	192.168.1.31	192.168.1.24	TFTP	69	Option Acknowledgement,=
 tsize=3D45542, blksize=3D1432
  18192	73.544257	192.168.1.31	192.168.1.24	TFTP	69	Option Acknowledgement,=
 tsize=3D45542, blksize=3D1432
  18360	74.588002	192.168.1.31	192.168.1.24	TFTP	69	Option Acknowledgement,=
 tsize=3D45542, blksize=3D1432
  18981	75.679037	192.168.1.31	192.168.1.24	TFTP	69	Option Acknowledgement,=
 tsize=3D45542, blksize=3D1432
  19270	76.620528	192.168.1.31	192.168.1.24	TFTP	69	Option Acknowledgement,=
 tsize=3D45542, blksize=3D1432
  19839	77.752338	192.168.1.31	192.168.1.24	TFTP	69	Option Acknowledgement,=
 tsize=3D45542, blksize=3D1432
  19852	78.001267	192.168.1.31	192.168.1.24	TFTP	69	Option Acknowledgement,=
 tsize=3D45542, blksize=3D1432
  19917	78.548965	192.168.1.31	192.168.1.24	TFTP	69	Option Acknowledgement,=
 tsize=3D45542, blksize=3D1432
  20066	79.593232	192.168.1.31	192.168.1.24	TFTP	69	Option Acknowledgement,=
 tsize=3D45542, blksize=3D1432
  20140	80.684604	192.168.1.31	192.168.1.24	TFTP	69	Option Acknowledgement,=
 tsize=3D45542, blksize=3D1432
  20220	81.625996	192.168.1.31	192.168.1.24	TFTP	69	Option Acknowledgement,=
 tsize=3D45542, blksize=3D1432
  20537	82.824574	192.168.1.31	192.168.1.24	TFTP	69	Option Acknowledgement,=
 tsize=3D45542, blksize=3D1432
  20551	83.033318	192.168.1.31	192.168.1.24	TFTP	69	Option Acknowledgement,=
 tsize=3D45542, blksize=3D1432
  20607	83.555510	192.168.1.31	192.168.1.24	TFTP	69	Option Acknowledgement,=
 tsize=3D45542, blksize=3D1432
  20734	84.598612	192.168.1.31	192.168.1.24	TFTP	69	Option Acknowledgement,=
 tsize=3D45542, blksize=3D1432
  20816	85.691535	192.168.1.31	192.168.1.24	TFTP	69	Option Acknowledgement,=
 tsize=3D45542, blksize=3D1432
  20898	86.631036	192.168.1.31	192.168.1.24	TFTP	69	Option Acknowledgement,=
 tsize=3D45542, blksize=3D1432
  22311	90.695296	192.168.1.31	192.168.1.24	TFTP	69	Option Acknowledgement,=
 tsize=3D45542, blksize=3D1432

  From the traffic, the guest sent the request properly, and it is
  rerouted outside properly, and the server respond to it properly.
  However, the guest never received the response.

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1862415/+subscriptions

