Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A0233BE213
	for <lists+qemu-devel@lfdr.de>; Wed,  7 Jul 2021 06:27:30 +0200 (CEST)
Received: from localhost ([::1]:52198 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m0z9l-0000OK-9R
	for lists+qemu-devel@lfdr.de; Wed, 07 Jul 2021 00:27:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50064)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1m0z8E-0006qZ-QE
 for qemu-devel@nongnu.org; Wed, 07 Jul 2021 00:25:54 -0400
Received: from indium.canonical.com ([91.189.90.7]:42298)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1m0z8C-0003HJ-8x
 for qemu-devel@nongnu.org; Wed, 07 Jul 2021 00:25:54 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.93 #5 (Debian))
 id 1m0z89-0006km-D0
 for <qemu-devel@nongnu.org>; Wed, 07 Jul 2021 04:25:49 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id EC9F02E8180
 for <qemu-devel@nongnu.org>; Wed,  7 Jul 2021 04:25:48 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Wed, 07 Jul 2021 04:17:19 -0000
From: Launchpad Bug Tracker <1889943@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Expired; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: janitor patmagauran th-huth
X-Launchpad-Bug-Reporter: Patrick Magauran (patmagauran)
X-Launchpad-Bug-Modifier: Launchpad Janitor (janitor)
References: <159622949743.5060.8912306868276612545.malonedeb@soybean.canonical.com>
Message-Id: <162563143989.23671.16775311038903597350.malone@loganberry.canonical.com>
Subject: [Bug 1889943] Re: Improper TCP/IP packet splitting on e1000e/vmxnet3
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="fe01712f453e3d8fdd7cfee725621d71a8ae3628"; Instance="production"
X-Launchpad-Hash: a22f09ab0b93a339dcbc191de2796b118bb38341
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
Reply-To: Bug 1889943 <1889943@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

[Expired for QEMU because there has been no activity for 60 days.]

** Changed in: qemu
       Status: Incomplete =3D> Expired

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1889943

Title:
  Improper TCP/IP packet splitting on e1000e/vmxnet3

Status in QEMU:
  Expired

Bug description:
  Update: The sw implementation of fragmentation also creates malformed
  IPv6 packets when their size is above the MTU. See comment #3

  Problem Description:
  When using a tap interface and the guest sends a TCP packet that would ne=
ed to be segmented, it is fragmented using IP fragmentation. The host does =
not reassemble the IP fragments and forwards them to the next hop. This cau=
ses issues on certain ISPs, which seemingly reject IP fragments(Verizon Fio=
s).
  This issue occurs on the e1000e and vmxnet3 NIC models, and possibly othe=
rs. It does not occur on the virtio(which passes the entire packet through =
to the host w/o fragmentation or segmentation) or the e1000 model().

  Test scenario:
  Setup a tap and network bridge using the directions here: https://gist.gi=
thub.com/extremecoders-re/e8fd8a67a515fee0c873dcafc81d811c
  Boot the machine into any modern guest(a Fedora 31 live iso was used for =
testing)
  Begin a wireshark capture on the host machine
  On the host(or another machine on the network) run: npx http-echo-server(=
See https://github.com/watson/http-echo-server)
  On the guest run
  Curl -d =E2=80=9CLorem ipsum dolor sit amet, consectetur adipiscing elit.=
 Maecenas venenatis viverra ipsum, ac tincidunt est rhoncus eu. Suspendisse=
 vehicula congue ante, non rhoncus elit tempus vitae. Duis ac leo massa. Do=
nec rutrum condimentum turpis nec ultricies. Duis laoreet elit eu arcu pulv=
inar, vitae congue neque mattis. Mauris sed ante nunc. Vestibulum vitae urn=
a a tellus maximus sagittis. Vivamus luctus pellentesque neque, vel tempor =
purus porta ut. Phasellus at quam bibendum, fermentum libero sit amet, ulla=
mcorper mauris. In rutrum sit amet dui id maximus. Ut lectus ligula, hendre=
rit nec aliquam non, finibus a turpis. Proin scelerisque convallis ante, et=
 pharetra elit. Donec nunc nisl, viverra vitae dui at, posuere rhoncus nibh=
. Mauris in massa quis neque posuere placerat quis quis massa. Donec quis l=
acus ligula. Donec mollis vel nisi eget elementum. Nam id magna porta nunc =
consectetur efficitur ac quis lorem. Cras faucibus vel ex porttitor mattis.=
 Praesent in mattis tortor. In venenatis convallis quam, in posuere nibh. P=
roin non dignissim massa. Cras at mi ut lorem tristique fringilla. Nulla ac=
 quam condimentum metus tincidunt vulputate ut at leo. Nunc pellentesque, n=
unc vel rhoncus condimentum, arcu sem molestie augue, in suscipit mauris od=
io mollis odio. Integer hendrerit lectus a leo facilisis, in accumsan urna =
maximus. Nam nec odio volutpat, varius est id, tempus libero. Vestibulum lo=
bortis tortor quam, ac scelerisque urna rhoncus in. Etiam tempor, est sit a=
met vulputate molestie, urna neque sodales leo, sit amet blandit risus feli=
s sed est. Nulla eu eros nec tortor dapibus maximus faucibus ut erat. Ut ph=
aretra tempor massa in bibendum. Interdum et malesuada fames ac ante ipsum =
primis in faucibus. Etiam mattis molestie felis eu efficitur. Morbi tincidu=
nt consectetur diam tincidunt feugiat. Morbi euismod ut lorem finibus pelle=
ntesque. Aliquam eu porta ex. Aliquam cursus, orci sit amet volutpat egesta=
s, est est pulvinar erat, sed luctus nisl ligula eget justo vestibulum.=E2=
=80=9D <ECHOSERVERIP:PORT>

  2000 bytes of Lorem Ipsum taken from https://www.lipsum.com/

  Compare results from an e1000, a virtio, and a e1000e card:
  +--------+-----------+---------+------------+
  | Model  | Fragment  | Segment | Wire Size  |
  +--------+-----------+---------+------------+
  | e1000e | Yes       | NO      | 1484 + 621 |
  +--------+-----------+---------+------------+
  | e1000  | No        | Yes     | 1516 + 620 |
  +--------+-----------+---------+------------+
  | Virtio | NO        | NO      | 2068       |
  +--------+-----------+---------+------------+

  Expected Results:
  TCP Segment to proper size OR pass full size to host and let the host spl=
it if necessary.

  Configuration changes that did not work:
  Disable host, guest, router firewalls
  Different Hosts
  Different Physical NICs
  Libvirt based NAT/Routed modes
  Fedora 32 vs 31
  Qemu 4.2.0 vs github commit d74824cf7c8b352f9045e949dc636c7207a41eee

  System Information:
  lsb_release -rd
  Description:	Fedora release 32 (Thirty Two)
  Release:	32

  uname -a
  Linux pats-laptop-linux 5.7.10-201.fc32.x86_64 #1 SMP Thu Jul 23 00:58:39=
 UTC 2020 x86_64 x86_64 x86_64 GNU/Linux

  I can provide additional logs, debug info, etc. if needed.

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1889943/+subscriptions

