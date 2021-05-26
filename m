Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6091739103D
	for <lists+qemu-devel@lfdr.de>; Wed, 26 May 2021 07:57:06 +0200 (CEST)
Received: from localhost ([::1]:48090 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1llmXR-0001KB-Fi
	for lists+qemu-devel@lfdr.de; Wed, 26 May 2021 01:57:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46120)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1llmWC-0008P1-RV
 for qemu-devel@nongnu.org; Wed, 26 May 2021 01:55:48 -0400
Received: from indium.canonical.com ([91.189.90.7]:59140)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1llmW9-0001ox-1j
 for qemu-devel@nongnu.org; Wed, 26 May 2021 01:55:48 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.93 #5 (Debian))
 id 1llmW6-0002hk-Ak
 for <qemu-devel@nongnu.org>; Wed, 26 May 2021 05:55:42 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 26D342E8195
 for <qemu-devel@nongnu.org>; Wed, 26 May 2021 05:55:42 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Wed, 26 May 2021 05:50:16 -0000
From: Thomas Huth <1878067@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Fix Released; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: a1xndr philmd th-huth
X-Launchpad-Bug-Reporter: Alexander Bulekov (a1xndr)
X-Launchpad-Bug-Modifier: Thomas Huth (th-huth)
References: <158922026261.5250.13637087242622903872.malonedeb@chaenomeles.canonical.com>
Message-Id: <162200821634.30006.9892135992121009635.malone@gac.canonical.com>
Subject: [Bug 1878067] Re: Assertion failure in eth_get_gso_type through the
 e1000e
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="30919b71da718d7d3f6b69e715e9fe95f7c3c5de"; Instance="production"
X-Launchpad-Hash: 9ff137f539cf814008ef5e42817e620d9b8bfbaf
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
Reply-To: Bug 1878067 <1878067@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Ok, thanks for checking! So let's close this ticket now.

** Changed in: qemu
       Status: Incomplete =3D> Fix Released

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1878067

Title:
  Assertion failure in eth_get_gso_type through the e1000e

Status in QEMU:
  Fix Released

Bug description:
  Hello,
  While fuzzing, I found an input that triggers an assertion failure in
  eth_get_gso_type through the e1000e:

  #1  0x00007ffff685755b in __GI_abort () at abort.c:79
  #2  0x00007ffff7c75dc3 in  () at /usr/lib/x86_64-linux-gnu/libglib-2.0.so=
.0
  #3  0x00007ffff7cd0b0a in g_assertion_message_expr () at /usr/lib/x86_64-=
linux-gnu/libglib-2.0.so.0
  #4  0x0000555556875f33 in eth_get_gso_type (l3_proto=3D<optimized out>, l=
3_hdr=3D<optimized out>, l4proto=3D<optimized out>) at /home/alxndr/Develop=
ment/qemu/net/eth.c:76
  #5  0x00005555565e09ac in net_tx_pkt_get_gso_type (pkt=3D0x631000014800, =
tso_enable=3D0x1) at /home/alxndr/Development/qemu/hw/net/net_tx_pkt.c:300
  #6  0x00005555565e09ac in net_tx_pkt_build_vheader (pkt=3D0x631000014800,=
 tso_enable=3D<optimized out>, csum_enable=3D<optimized out>, gso_size=3D<o=
ptimized out>) at /home/alxndr/Development/qemu/hw/net/net_tx_pkt.c:316
  #7  0x000055555660bdb1 in e1000e_setup_tx_offloads (core=3D0x7fffeeb754e0=
, tx=3D0x7fffeeb95748) at /home/alxndr/Development/qemu/hw/net/e1000e_core.=
c:637
  #8  0x000055555660bdb1 in e1000e_tx_pkt_send (core=3D0x7fffeeb754e0, tx=
=3D0x7fffeeb95748, queue_index=3D<optimized out>) at /home/alxndr/Developme=
nt/qemu/hw/net/e1000e_core.c:658
  #9  0x000055555660bdb1 in e1000e_process_tx_desc (core=3D0x7fffeeb754e0, =
tx=3D0x7fffeeb95748, dp=3D<optimized out>, queue_index=3D<optimized out>) a=
t /home/alxndr/Development/qemu/hw/net/e1000e_core.c:743
  #10 0x000055555660bdb1 in e1000e_start_xmit (core=3Dcore@entry=3D0x7fffee=
b754e0, txr=3D<optimized out>, txr@entry=3D0x7fffffffbe60) at /home/alxndr/=
Development/qemu/hw/net/e1000e_core.c:934
  #11 0x0000555556607e2e in e1000e_set_tctl (core=3D0x7fffeeb754e0, index=
=3D<optimized out>, val=3D<optimized out>) at /home/alxndr/Development/qemu=
/hw/net/e1000e_core.c:2431
  #12 0x00005555565f90fd in e1000e_core_write (core=3D<optimized out>, addr=
=3D<optimized out>, val=3D<optimized out>, size=3D<optimized out>) at /home=
/alxndr/Development/qemu/hw/net/e1000e_core.c:3261
  #13 0x0000555555ff4337 in memory_region_write_accessor (mr=3D<optimized o=
ut>, addr=3D<optimized out>, value=3D<optimized out>, size=3D<optimized out=
>, shift=3D<optimized out>, mask=3D<optimized out>, attrs=3D...) at /home/a=
lxndr/Development/qemu/memory.c:483
  #14 0x0000555555ff3ce0 in access_with_adjusted_size (addr=3D<optimized ou=
t>, value=3D<optimized out>, size=3D<optimized out>, access_size_min=3D<opt=
imized out>, access_size_max=3D<optimized out>, access_fn=3D<optimized out>=
, mr=3D0x7fffeeb75110, attrs=3D...) at /home/alxndr/Development/qemu/memory=
.c:544
  #15 0x0000555555ff3ce0 in memory_region_dispatch_write (mr=3D<optimized o=
ut>, addr=3D<optimized out>, data=3D0x2b, op=3D<optimized out>, attrs=3D...=
) at /home/alxndr/Development/qemu/memory.c:1476

  I can reproduce it in qemu 5.0 built with using:
  cat << EOF | ~/Development/qemu/build/i386-softmmu/qemu-system-i386 -M pc=
-q35-5.0 -netdev user,id=3Dqtest-bn0 -device e1000e,netdev=3Dqtest-bn0 -dis=
play none -nodefaults -nographic -qtest stdio -monitor none -serial none
  outl 0xcf8 0x80000810
  outl 0xcfc 0xe0000000
  outl 0xcf8 0x80000814
  outl 0xcf8 0x80000804
  outw 0xcfc 0x7
  outl 0xcf8 0x800008a2
  write 0xe0000420 0x1fc 0x3ff9ffdf00000000002467ff272d2f3ff9ffdf0000000000=
246fff272d2f3ff9ffdf00000000002477ff272d2f3ff9ffdf0000000000247fff272d2f3ff=
9ffdf00000000002487ff272d2f3ff9ffdf0000000000248fff272d2f3ff9ffdf0000000000=
2497ff272d2f3ff9ffdf0000000000249fff272d2f3ff9ffdf000000000024a7ff272d2f3ff=
9ffdf000000000024afff272d2f3ff9ffdf000000000024b7ff272d2f3ff9ffdf0000000000=
24bfff272d2f3ff9ffdf000000000024c7ff272d2f3ff9ffdf000000000024cfff272d2f3ff=
9ffdf000000000024d7ff272d2f3ff9ffdf000000000024dfff272d2f3ff9ffdf0000000000=
24e7ff272d2f3ff9ffdf000000000024efff272d2f3ff9ffdf000000000024f7ff272d2f3ff=
9ffdf000000000024ffff272d2f3ff9ffdf00000000002407ff272d2f3ff9ffdf0000000000=
240fff272d2f3ff9ffdf00000000002417ff272d2f3ff9ffdf0000000000241fff272d2f3ff=
9ffdf00000000002427ff272d2f3ff9ffdf0000000000242fff272d2f3ff9ffdf0000000000=
2437ff272d2f3ff9ffdf0000000000243fff272d2f3ff9ffdf00000000002447ff272d2f3ff=
9ffdf0000000000244fff272d2f3ff9ffdf00000000002457ff272d2f3ff9ffdf0000000000=
245fff272d2f3ff9ffdf00000000002467ff272d2f3ff9ffdf0000000000246fff27
  write 0xe00000b8 0x349 0xa300f52bff003100ffa300f52bff003100ffa300f52bff00=
3100ffa300f52bff003100ffa300f52bff003100ffa300f52bff003100ffa300f52bff00310=
0ffa300f52bff003100ffa300f52bff003100ffa300f52bff003100ffa300f52bff003100ff=
a300f52bff003100ffa300f52bff003100ffa300f52bff003100ffa300f52bff003100ffa30=
0f52bff003100ffa300f52bff003100ffa300f52bff003100ffa300f52bff003100ffa300f5=
2bff003100ffa300f52bff003100ffa300f52bff003100ffa300f52bff003100ffa300f52bf=
f003100ffa300f52bff003100ffa300f52bff003100ffa300f52bff003100ffa300f52bff00=
3100ffa300f52bff003100ffa300f52bff003100ffa300f52bff003100ffa300f52bff00310=
0ffa300f52bff003100ffa300f52bff003100ffa300f52bff003100ffa300f52bff003100ff=
a300f52bff003100ffa300f52bff003100ffa300f52bff003100ffa300f52bff003100ffa30=
0f52bff003100ffa300f52bff003100ffa300f52bff003100ffa300f52bff003100ffa300f5=
2bff003100ffa300f52bff003100ffa300f52bff003100ffa300f52bff003100ffa300f52bf=
f003100ffa300f52bff003100ffa300f52bff003100ffa300f52bff003100ffa300f52bff00=
3100ffa300f52bff003100ffa300f52bff003100ffa300f52bff003100ffa300f52bff00310=
0ffa300f52bff003100ffa300f52bff003100ffa300f52bff003100ffa300f52bff003100ff=
a300f52bff003100ffa300f52bff003100ffa300f52bff003100ffa300f52bff003100ffa30=
0f52bff003100ffa300f52bff003100ffa300f52bff003100ffa300f52bff003100ffa300f5=
2bff003100ffa300f52bff003100ffa300f52bff003100ffa300f52bff003100ffa300f52bf=
f003100ffa300f52bff003100ffa300f52bff003100ffa300f52bff003100ffa300f52bff00=
3100ffa300f52bff003100ffa300f52bff003100ffa300f52bff003100ffa300f52bff00310=
0ffa300f52bff003100ffa300f52bff003100ffa300f52bff003100ffa300f52bff003100ff=
a300f52bff003100ffa300f52bff003100ffa300f52bff003100ffa300f52bff003100ffa30=
0f52bff003100ffa300f52bff003100ffa300f52bff003100ffa300f52b
  EOF

  I also attached the trace to this launchpad report, in case the
  formatting is broken:

  qemu-system-i386 -M pc-q35-5.0 -netdev user,id=3Dqtest-bn0 -device
  e1000e,netdev=3Dqtest-bn0 -display none -nodefaults -nographic -qtest
  stdio -monitor none -serial none < attachment

  Please let me know if I can provide any further info.
  -Alex

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1878067/+subscriptions

