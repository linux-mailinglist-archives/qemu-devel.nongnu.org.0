Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CB828393179
	for <lists+qemu-devel@lfdr.de>; Thu, 27 May 2021 16:52:02 +0200 (CEST)
Received: from localhost ([::1]:44230 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lmHMf-0003fs-RU
	for lists+qemu-devel@lfdr.de; Thu, 27 May 2021 10:52:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40054)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lmHGw-0006SY-0x
 for qemu-devel@nongnu.org; Thu, 27 May 2021 10:46:06 -0400
Received: from indium.canonical.com ([91.189.90.7]:57652)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lmHGj-0000X5-I5
 for qemu-devel@nongnu.org; Thu, 27 May 2021 10:46:05 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.93 #5 (Debian))
 id 1lmHGh-00046l-6U
 for <qemu-devel@nongnu.org>; Thu, 27 May 2021 14:45:51 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 1A9ED2E8135
 for <qemu-devel@nongnu.org>; Thu, 27 May 2021 14:45:51 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Thu, 27 May 2021 14:38:51 -0000
From: Alexander Bulekov <1892978@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Incomplete; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: a1xndr th-huth
X-Launchpad-Bug-Reporter: Alexander Bulekov (a1xndr)
X-Launchpad-Bug-Modifier: Alexander Bulekov (a1xndr)
References: <159841449798.5559.12227136103734642723.malonedeb@gac.canonical.com>
 <162212530582.25607.209369231055203508.malone@gac.canonical.com>
Message-Id: <20210527143813.3htcp6fdhhqyptq2@mozz.bu.edu>
Subject: Re: [Bug 1892978] Re: Heap-use-after-free in
 e1000e_write_packet_to_guesty
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="325c8b1be58d11b29d8346f2c6d59878e7a2e6ff"; Instance="production"
X-Launchpad-Hash: cda5229e631c643e5b14299c4ff8dd4016da8613
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
Reply-To: Bug 1892978 <1892978@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

I'm this was fixed by Jason's qemu_receive_packet patches. OSS-Fuzz
hasn't seen it in many months

On 210527 1421, Thomas Huth wrote:
> This problem does not reproduce for me with the latest version of QEMU
> anymore. I assume it has been fixed sometime during the past months?
> Could you please check whether you can still reproduce it with the
> current version of QEMU?
> =

> ** Changed in: qemu
>        Status: New =3D> Incomplete
> =

> -- =

> You received this bug notification because you are subscribed to the bug
> report.
> https://bugs.launchpad.net/bugs/1892978
> =

> Title:
>   Heap-use-after-free in e1000e_write_packet_to_guest
> =

> Status in QEMU:
>   Incomplete
> =

> Bug description:
>   Hello,
>   Reproducer:
>   cat << EOF | ./qemu-system-i386 \
>   -display none -m 64 -netdev user,id=3Dqtest-bn0 \
>   -device e1000e,netdev=3Dqtest-bn0 -display none \
>   -nodefaults -accel qtest -qtest stdio
>   outl 0xcf8 0x80001004
>   outl 0xcfc 0x3b2e84ce
>   outl 0xcf8 0x80001013
>   outw 0xcfc 0x2499
>   writew 0x990000ff 0x5ea2
>   writeq 0x99000429 0x133a940000188101
>   outl 0xcfc 0x9b890e04
>   writeq 0x4000119 0x5000055ec751c0d
>   write 0x10707 0x1 0x07
>   write 0x51 0x1 0x04
>   write 0x53 0x1 0x04
>   write 0x140 0x1 0x07
>   write 0x141 0x1 0x07
>   write 0x142 0x1 0x01
>   write 0x148 0x1 0x40
>   write 0x14a 0x1 0x7d
>   write 0x14b 0x1 0xff
>   writeq 0x4000401 0x413001600027d
>   EOF
> =

>   =

>   The stacktrace:
> =

>   [S +0.090759] OK
>   [R +0.090767] writeq 0x4000401 0x413001600027d
>   =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>   =3D=3D935641=3D=3DERROR: AddressSanitizer: heap-use-after-free on addre=
ss 0x61900006cc88 at pc 0x555613393d45 bp 0x7fff92f8b7f0 sp 0x7fff92f8b7e8
>   READ of size 8 at 0x61900006cc88 thread T0
>       #0 0x555613393d44 in e1000e_write_packet_to_guest /home/alxndr/Deve=
lopment/qemu/general-fuzz/build/../hw/net/e1000e_core.c:1587:41
>       #1 0x55561338e419 in e1000e_receive_iov /home/alxndr/Development/qe=
mu/general-fuzz/build/../hw/net/e1000e_core.c:1709:9
>       #2 0x55561319680b in e1000e_nc_receive_iov /home/alxndr/Development=
/qemu/general-fuzz/build/../hw/net/e1000e.c:213:12
>       #3 0x555612812581 in net_tx_pkt_sendv /home/alxndr/Development/qemu=
/general-fuzz/build/../hw/net/net_tx_pkt.c:556:9
>       #4 0x55561280fbc8 in net_tx_pkt_send /home/alxndr/Development/qemu/=
general-fuzz/build/../hw/net/net_tx_pkt.c:633:9
>       #5 0x555612813f38 in net_tx_pkt_send_loopback /home/alxndr/Developm=
ent/qemu/general-fuzz/build/../hw/net/net_tx_pkt.c:646:11
>       #6 0x5556133f8c07 in e1000e_tx_pkt_send /home/alxndr/Development/qe=
mu/general-fuzz/build/../hw/net/e1000e_core.c:664:16
>       #7 0x5556133f5359 in e1000e_process_tx_desc /home/alxndr/Developmen=
t/qemu/general-fuzz/build/../hw/net/e1000e_core.c:743:17
>       #8 0x5556133f302f in e1000e_start_xmit /home/alxndr/Development/qem=
u/general-fuzz/build/../hw/net/e1000e_core.c:934:9
>       #9 0x5556133daba8 in e1000e_set_tctl /home/alxndr/Development/qemu/=
general-fuzz/build/../hw/net/e1000e_core.c:2431:9
>       #10 0x55561339901b in e1000e_core_write /home/alxndr/Development/qe=
mu/general-fuzz/build/../hw/net/e1000e_core.c:3265:9
>       #11 0x555613190f26 in e1000e_mmio_write /home/alxndr/Development/qe=
mu/general-fuzz/build/../hw/net/e1000e.c:109:5
>       #12 0x55561508ade0 in memory_region_write_accessor /home/alxndr/Dev=
elopment/qemu/general-fuzz/build/../softmmu/memory.c:483:5
>       #13 0x55561508a2bd in access_with_adjusted_size /home/alxndr/Develo=
pment/qemu/general-fuzz/build/../softmmu/memory.c:544:18
>       #14 0x555615087f70 in memory_region_dispatch_write /home/alxndr/Dev=
elopment/qemu/general-fuzz/build/../softmmu/memory.c:1466:16
>       #15 0x555614ce68a6 in flatview_write_continue /home/alxndr/Developm=
ent/qemu/general-fuzz/build/../exec.c:3176:23
>       #16 0x555614ccf878 in flatview_write /home/alxndr/Development/qemu/=
general-fuzz/build/../exec.c:3216:14
>       #17 0x555614ccf3a8 in address_space_write /home/alxndr/Development/=
qemu/general-fuzz/build/../exec.c:3308:18
>       #18 0x555614ccfc40 in address_space_rw /home/alxndr/Development/qem=
u/general-fuzz/build/../exec.c:3318:16
>       #19 0x5556133b76c7 in dma_memory_rw_relaxed /home/alxndr/Developmen=
t/qemu/general-fuzz/include/sysemu/dma.h:87:18
>       #20 0x5556133b6ff5 in dma_memory_rw /home/alxndr/Development/qemu/g=
eneral-fuzz/include/sysemu/dma.h:110:12
>       #21 0x5556133b6f3d in pci_dma_rw /home/alxndr/Development/qemu/gene=
ral-fuzz/include/hw/pci/pci.h:790:5
>       #22 0x5556133b526a in pci_dma_write /home/alxndr/Development/qemu/g=
eneral-fuzz/include/hw/pci/pci.h:803:12
>       #23 0x5556133b403f in e1000e_write_to_rx_buffers /home/alxndr/Devel=
opment/qemu/general-fuzz/build/../hw/net/e1000e_core.c:1412:9
>       #24 0x555613393bae in e1000e_write_packet_to_guest /home/alxndr/Dev=
elopment/qemu/general-fuzz/build/../hw/net/e1000e_core.c:1582:21
>       #25 0x55561338e419 in e1000e_receive_iov /home/alxndr/Development/q=
emu/general-fuzz/build/../hw/net/e1000e_core.c:1709:9
>       #26 0x55561319680b in e1000e_nc_receive_iov /home/alxndr/Developmen=
t/qemu/general-fuzz/build/../hw/net/e1000e.c:213:12
>       #27 0x555612812581 in net_tx_pkt_sendv /home/alxndr/Development/qem=
u/general-fuzz/build/../hw/net/net_tx_pkt.c:556:9
>       #28 0x55561280fbc8 in net_tx_pkt_send /home/alxndr/Development/qemu=
/general-fuzz/build/../hw/net/net_tx_pkt.c:633:9
>       #29 0x555612813f38 in net_tx_pkt_send_loopback /home/alxndr/Develop=
ment/qemu/general-fuzz/build/../hw/net/net_tx_pkt.c:646:11
>       #30 0x5556133f8c07 in e1000e_tx_pkt_send /home/alxndr/Development/q=
emu/general-fuzz/build/../hw/net/e1000e_core.c:664:16
>       #31 0x5556133f5359 in e1000e_process_tx_desc /home/alxndr/Developme=
nt/qemu/general-fuzz/build/../hw/net/e1000e_core.c:743:17
>       #32 0x5556133f302f in e1000e_start_xmit /home/alxndr/Development/qe=
mu/general-fuzz/build/../hw/net/e1000e_core.c:934:9
>       #33 0x5556133daba8 in e1000e_set_tctl /home/alxndr/Development/qemu=
/general-fuzz/build/../hw/net/e1000e_core.c:2431:9
>       #34 0x55561339901b in e1000e_core_write /home/alxndr/Development/qe=
mu/general-fuzz/build/../hw/net/e1000e_core.c:3265:9
>       #35 0x555613190f26 in e1000e_mmio_write /home/alxndr/Development/qe=
mu/general-fuzz/build/../hw/net/e1000e.c:109:5
>       #36 0x55561508ade0 in memory_region_write_accessor /home/alxndr/Dev=
elopment/qemu/general-fuzz/build/../softmmu/memory.c:483:5
>       #37 0x55561508a2bd in access_with_adjusted_size /home/alxndr/Develo=
pment/qemu/general-fuzz/build/../softmmu/memory.c:544:18
>       #38 0x555615087f70 in memory_region_dispatch_write /home/alxndr/Dev=
elopment/qemu/general-fuzz/build/../softmmu/memory.c:1466:16
>       #39 0x555614ce68a6 in flatview_write_continue /home/alxndr/Developm=
ent/qemu/general-fuzz/build/../exec.c:3176:23
>       #40 0x555614ccf878 in flatview_write /home/alxndr/Development/qemu/=
general-fuzz/build/../exec.c:3216:14
>       #41 0x555614ccf3a8 in address_space_write /home/alxndr/Development/=
qemu/general-fuzz/build/../exec.c:3308:18
>       #42 0x555614ccfc40 in address_space_rw /home/alxndr/Development/qem=
u/general-fuzz/build/../exec.c:3318:16
>       #43 0x5556133b76c7 in dma_memory_rw_relaxed /home/alxndr/Developmen=
t/qemu/general-fuzz/include/sysemu/dma.h:87:18
>       #44 0x5556133b6ff5 in dma_memory_rw /home/alxndr/Development/qemu/g=
eneral-fuzz/include/sysemu/dma.h:110:12
>       #45 0x5556133b6f3d in pci_dma_rw /home/alxndr/Development/qemu/gene=
ral-fuzz/include/hw/pci/pci.h:790:5
>       #46 0x5556133b526a in pci_dma_write /home/alxndr/Development/qemu/g=
eneral-fuzz/include/hw/pci/pci.h:803:12
>       #47 0x5556133b403f in e1000e_write_to_rx_buffers /home/alxndr/Devel=
opment/qemu/general-fuzz/build/../hw/net/e1000e_core.c:1412:9
>       #48 0x555613393bae in e1000e_write_packet_to_guest /home/alxndr/Dev=
elopment/qemu/general-fuzz/build/../hw/net/e1000e_core.c:1582:21
>       #49 0x55561338e419 in e1000e_receive_iov /home/alxndr/Development/q=
emu/general-fuzz/build/../hw/net/e1000e_core.c:1709:9
>       #50 0x55561319680b in e1000e_nc_receive_iov /home/alxndr/Developmen=
t/qemu/general-fuzz/build/../hw/net/e1000e.c:213:12
>       #51 0x555612812581 in net_tx_pkt_sendv /home/alxndr/Development/qem=
u/general-fuzz/build/../hw/net/net_tx_pkt.c:556:9
>       #52 0x55561280fbc8 in net_tx_pkt_send /home/alxndr/Development/qemu=
/general-fuzz/build/../hw/net/net_tx_pkt.c:633:9
>       #53 0x555612813f38 in net_tx_pkt_send_loopback /home/alxndr/Develop=
ment/qemu/general-fuzz/build/../hw/net/net_tx_pkt.c:646:11
>       #54 0x5556133f8c07 in e1000e_tx_pkt_send /home/alxndr/Development/q=
emu/general-fuzz/build/../hw/net/e1000e_core.c:664:16
>       #55 0x5556133f5359 in e1000e_process_tx_desc /home/alxndr/Developme=
nt/qemu/general-fuzz/build/../hw/net/e1000e_core.c:743:17
>       #56 0x5556133f302f in e1000e_start_xmit /home/alxndr/Development/qe=
mu/general-fuzz/build/../hw/net/e1000e_core.c:934:9
>       #57 0x5556133daba8 in e1000e_set_tctl /home/alxndr/Development/qemu=
/general-fuzz/build/../hw/net/e1000e_core.c:2431:9
>       #58 0x55561339901b in e1000e_core_write /home/alxndr/Development/qe=
mu/general-fuzz/build/../hw/net/e1000e_core.c:3265:9
>       #59 0x555613190f26 in e1000e_mmio_write /home/alxndr/Development/qe=
mu/general-fuzz/build/../hw/net/e1000e.c:109:5
>       #60 0x55561508ade0 in memory_region_write_accessor /home/alxndr/Dev=
elopment/qemu/general-fuzz/build/../softmmu/memory.c:483:5
>       #61 0x55561508a2bd in access_with_adjusted_size /home/alxndr/Develo=
pment/qemu/general-fuzz/build/../softmmu/memory.c:544:18
>       #62 0x555615087f70 in memory_region_dispatch_write /home/alxndr/Dev=
elopment/qemu/general-fuzz/build/../softmmu/memory.c:1466:16
>       #63 0x555614ce68a6 in flatview_write_continue /home/alxndr/Developm=
ent/qemu/general-fuzz/build/../exec.c:3176:23
>       #64 0x555614ccf878 in flatview_write /home/alxndr/Development/qemu/=
general-fuzz/build/../exec.c:3216:14
>       #65 0x555614ccf3a8 in address_space_write /home/alxndr/Development/=
qemu/general-fuzz/build/../exec.c:3308:18
>       #66 0x555614ccfc40 in address_space_rw /home/alxndr/Development/qem=
u/general-fuzz/build/../exec.c:3318:16
>       #67 0x5556133b76c7 in dma_memory_rw_relaxed /home/alxndr/Developmen=
t/qemu/general-fuzz/include/sysemu/dma.h:87:18
>       #68 0x5556133b6ff5 in dma_memory_rw /home/alxndr/Development/qemu/g=
eneral-fuzz/include/sysemu/dma.h:110:12
>       #69 0x5556133b6f3d in pci_dma_rw /home/alxndr/Development/qemu/gene=
ral-fuzz/include/hw/pci/pci.h:790:5
>       #70 0x5556133b526a in pci_dma_write /home/alxndr/Development/qemu/g=
eneral-fuzz/include/hw/pci/pci.h:803:12
>       #71 0x5556133b403f in e1000e_write_to_rx_buffers /home/alxndr/Devel=
opment/qemu/general-fuzz/build/../hw/net/e1000e_core.c:1412:9
>       #72 0x555613393bae in e1000e_write_packet_to_guest /home/alxndr/Dev=
elopment/qemu/general-fuzz/build/../hw/net/e1000e_core.c:1582:21
>       #73 0x55561338e419 in e1000e_receive_iov /home/alxndr/Development/q=
emu/general-fuzz/build/../hw/net/e1000e_core.c:1709:9
>       #74 0x55561319680b in e1000e_nc_receive_iov /home/alxndr/Developmen=
t/qemu/general-fuzz/build/../hw/net/e1000e.c:213:12
>       #75 0x555612812581 in net_tx_pkt_sendv /home/alxndr/Development/qem=
u/general-fuzz/build/../hw/net/net_tx_pkt.c:556:9
>       #76 0x55561280fbc8 in net_tx_pkt_send /home/alxndr/Development/qemu=
/general-fuzz/build/../hw/net/net_tx_pkt.c:633:9
>       #77 0x555612813f38 in net_tx_pkt_send_loopback /home/alxndr/Develop=
ment/qemu/general-fuzz/build/../hw/net/net_tx_pkt.c:646:11
>       #78 0x5556133f8c07 in e1000e_tx_pkt_send /home/alxndr/Development/q=
emu/general-fuzz/build/../hw/net/e1000e_core.c:664:16
>       #79 0x5556133f5359 in e1000e_process_tx_desc /home/alxndr/Developme=
nt/qemu/general-fuzz/build/../hw/net/e1000e_core.c:743:17
>       #80 0x5556133f302f in e1000e_start_xmit /home/alxndr/Development/qe=
mu/general-fuzz/build/../hw/net/e1000e_core.c:934:9
>       #81 0x5556133daba8 in e1000e_set_tctl /home/alxndr/Development/qemu=
/general-fuzz/build/../hw/net/e1000e_core.c:2431:9
>       #82 0x55561339901b in e1000e_core_write /home/alxndr/Development/qe=
mu/general-fuzz/build/../hw/net/e1000e_core.c:3265:9
>       #83 0x555613190f26 in e1000e_mmio_write /home/alxndr/Development/qe=
mu/general-fuzz/build/../hw/net/e1000e.c:109:5
>       #84 0x55561508ade0 in memory_region_write_accessor /home/alxndr/Dev=
elopment/qemu/general-fuzz/build/../softmmu/memory.c:483:5
>       #85 0x55561508a2bd in access_with_adjusted_size /home/alxndr/Develo=
pment/qemu/general-fuzz/build/../softmmu/memory.c:544:18
>       #86 0x555615087f70 in memory_region_dispatch_write /home/alxndr/Dev=
elopment/qemu/general-fuzz/build/../softmmu/memory.c:1466:16
>       #87 0x555614ce68a6 in flatview_write_continue /home/alxndr/Developm=
ent/qemu/general-fuzz/build/../exec.c:3176:23
>       #88 0x555614ccf878 in flatview_write /home/alxndr/Development/qemu/=
general-fuzz/build/../exec.c:3216:14
>       #89 0x555614ccf3a8 in address_space_write /home/alxndr/Development/=
qemu/general-fuzz/build/../exec.c:3308:18
>       #90 0x555614ccfc40 in address_space_rw /home/alxndr/Development/qem=
u/general-fuzz/build/../exec.c:3318:16
>       #91 0x5556133b76c7 in dma_memory_rw_relaxed /home/alxndr/Developmen=
t/qemu/general-fuzz/include/sysemu/dma.h:87:18
>       #92 0x5556133b6ff5 in dma_memory_rw /home/alxndr/Development/qemu/g=
eneral-fuzz/include/sysemu/dma.h:110:12
>       #93 0x5556133b6f3d in pci_dma_rw /home/alxndr/Development/qemu/gene=
ral-fuzz/include/hw/pci/pci.h:790:5
>       #94 0x5556133b526a in pci_dma_write /home/alxndr/Development/qemu/g=
eneral-fuzz/include/hw/pci/pci.h:803:12
>       #95 0x5556133b403f in e1000e_write_to_rx_buffers /home/alxndr/Devel=
opment/qemu/general-fuzz/build/../hw/net/e1000e_core.c:1412:9
>       #96 0x555613393bae in e1000e_write_packet_to_guest /home/alxndr/Dev=
elopment/qemu/general-fuzz/build/../hw/net/e1000e_core.c:1582:21
>       #97 0x55561338e419 in e1000e_receive_iov /home/alxndr/Development/q=
emu/general-fuzz/build/../hw/net/e1000e_core.c:1709:9
>       #98 0x55561319680b in e1000e_nc_receive_iov /home/alxndr/Developmen=
t/qemu/general-fuzz/build/../hw/net/e1000e.c:213:12
>       #99 0x555612812581 in net_tx_pkt_sendv /home/alxndr/Development/qem=
u/general-fuzz/build/../hw/net/net_tx_pkt.c:556:9
>       #100 0x55561280fbc8 in net_tx_pkt_send /home/alxndr/Development/qem=
u/general-fuzz/build/../hw/net/net_tx_pkt.c:633:9
>       #101 0x555612813f38 in net_tx_pkt_send_loopback /home/alxndr/Develo=
pment/qemu/general-fuzz/build/../hw/net/net_tx_pkt.c:646:11
>       #102 0x5556133f8c07 in e1000e_tx_pkt_send /home/alxndr/Development/=
qemu/general-fuzz/build/../hw/net/e1000e_core.c:664:16
>       #103 0x5556133f5359 in e1000e_process_tx_desc /home/alxndr/Developm=
ent/qemu/general-fuzz/build/../hw/net/e1000e_core.c:743:17
>       #104 0x5556133f302f in e1000e_start_xmit /home/alxndr/Development/q=
emu/general-fuzz/build/../hw/net/e1000e_core.c:934:9
>       #105 0x5556133daba8 in e1000e_set_tctl /home/alxndr/Development/qem=
u/general-fuzz/build/../hw/net/e1000e_core.c:2431:9
>       #106 0x55561339901b in e1000e_core_write /home/alxndr/Development/q=
emu/general-fuzz/build/../hw/net/e1000e_core.c:3265:9
>       #107 0x555613190f26 in e1000e_mmio_write /home/alxndr/Development/q=
emu/general-fuzz/build/../hw/net/e1000e.c:109:5
>       #108 0x55561508ade0 in memory_region_write_accessor /home/alxndr/De=
velopment/qemu/general-fuzz/build/../softmmu/memory.c:483:5
>       #109 0x55561508a2bd in access_with_adjusted_size /home/alxndr/Devel=
opment/qemu/general-fuzz/build/../softmmu/memory.c:544:18
>       #110 0x555615087f70 in memory_region_dispatch_write /home/alxndr/De=
velopment/qemu/general-fuzz/build/../softmmu/memory.c:1466:16
>       #111 0x555614ce68a6 in flatview_write_continue /home/alxndr/Develop=
ment/qemu/general-fuzz/build/../exec.c:3176:23
>       #112 0x555614ccf878 in flatview_write /home/alxndr/Development/qemu=
/general-fuzz/build/../exec.c:3216:14
>       #113 0x555614ccf3a8 in address_space_write /home/alxndr/Development=
/qemu/general-fuzz/build/../exec.c:3308:18
>       #114 0x555614ccfc40 in address_space_rw /home/alxndr/Development/qe=
mu/general-fuzz/build/../exec.c:3318:16
>       #115 0x5556133b76c7 in dma_memory_rw_relaxed /home/alxndr/Developme=
nt/qemu/general-fuzz/include/sysemu/dma.h:87:18
>       #116 0x5556133b6ff5 in dma_memory_rw /home/alxndr/Development/qemu/=
general-fuzz/include/sysemu/dma.h:110:12
>       #117 0x5556133b6f3d in pci_dma_rw /home/alxndr/Development/qemu/gen=
eral-fuzz/include/hw/pci/pci.h:790:5
>       #118 0x5556133b526a in pci_dma_write /home/alxndr/Development/qemu/=
general-fuzz/include/hw/pci/pci.h:803:12
>       #119 0x5556133b403f in e1000e_write_to_rx_buffers /home/alxndr/Deve=
lopment/qemu/general-fuzz/build/../hw/net/e1000e_core.c:1412:9
>       #120 0x555613393bae in e1000e_write_packet_to_guest /home/alxndr/De=
velopment/qemu/general-fuzz/build/../hw/net/e1000e_core.c:1582:21
>       #121 0x55561338e419 in e1000e_receive_iov /home/alxndr/Development/=
qemu/general-fuzz/build/../hw/net/e1000e_core.c:1709:9
>       #122 0x55561319680b in e1000e_nc_receive_iov /home/alxndr/Developme=
nt/qemu/general-fuzz/build/../hw/net/e1000e.c:213:12
>       #123 0x555612812581 in net_tx_pkt_sendv /home/alxndr/Development/qe=
mu/general-fuzz/build/../hw/net/net_tx_pkt.c:556:9
>       #124 0x55561280fbc8 in net_tx_pkt_send /home/alxndr/Development/qem=
u/general-fuzz/build/../hw/net/net_tx_pkt.c:633:9
>       #125 0x555612813f38 in net_tx_pkt_send_loopback /home/alxndr/Develo=
pment/qemu/general-fuzz/build/../hw/net/net_tx_pkt.c:646:11
>       #126 0x5556133f8c07 in e1000e_tx_pkt_send /home/alxndr/Development/=
qemu/general-fuzz/build/../hw/net/e1000e_core.c:664:16
>       #127 0x5556133f5359 in e1000e_process_tx_desc /home/alxndr/Developm=
ent/qemu/general-fuzz/build/../hw/net/e1000e_core.c:743:17
>       #128 0x5556133f302f in e1000e_start_xmit /home/alxndr/Development/q=
emu/general-fuzz/build/../hw/net/e1000e_core.c:934:9
>       #129 0x5556133daba8 in e1000e_set_tctl /home/alxndr/Development/qem=
u/general-fuzz/build/../hw/net/e1000e_core.c:2431:9
>       #130 0x55561339901b in e1000e_core_write /home/alxndr/Development/q=
emu/general-fuzz/build/../hw/net/e1000e_core.c:3265:9
>       #131 0x555613190f26 in e1000e_mmio_write /home/alxndr/Development/q=
emu/general-fuzz/build/../hw/net/e1000e.c:109:5
>       #132 0x55561508ade0 in memory_region_write_accessor /home/alxndr/De=
velopment/qemu/general-fuzz/build/../softmmu/memory.c:483:5
>       #133 0x55561508a2bd in access_with_adjusted_size /home/alxndr/Devel=
opment/qemu/general-fuzz/build/../softmmu/memory.c:544:18
>       #134 0x555615087f70 in memory_region_dispatch_write /home/alxndr/De=
velopment/qemu/general-fuzz/build/../softmmu/memory.c:1466:16
>       #135 0x555614ce68a6 in flatview_write_continue /home/alxndr/Develop=
ment/qemu/general-fuzz/build/../exec.c:3176:23
>       #136 0x555614ccf878 in flatview_write /home/alxndr/Development/qemu=
/general-fuzz/build/../exec.c:3216:14
>       #137 0x555614ccf3a8 in address_space_write /home/alxndr/Development=
/qemu/general-fuzz/build/../exec.c:3308:18
>       #138 0x555614ccfc40 in address_space_rw /home/alxndr/Development/qe=
mu/general-fuzz/build/../exec.c:3318:16
>       #139 0x5556133b76c7 in dma_memory_rw_relaxed /home/alxndr/Developme=
nt/qemu/general-fuzz/include/sysemu/dma.h:87:18
>       #140 0x5556133b6ff5 in dma_memory_rw /home/alxndr/Development/qemu/=
general-fuzz/include/sysemu/dma.h:110:12
>       #141 0x5556133b6f3d in pci_dma_rw /home/alxndr/Development/qemu/gen=
eral-fuzz/include/hw/pci/pci.h:790:5
>       #142 0x5556133b526a in pci_dma_write /home/alxndr/Development/qemu/=
general-fuzz/include/hw/pci/pci.h:803:12
>       #143 0x5556133b403f in e1000e_write_to_rx_buffers /home/alxndr/Deve=
lopment/qemu/general-fuzz/build/../hw/net/e1000e_core.c:1412:9
>       #144 0x555613393bae in e1000e_write_packet_to_guest /home/alxndr/De=
velopment/qemu/general-fuzz/build/../hw/net/e1000e_core.c:1582:21
>       #145 0x55561338e419 in e1000e_receive_iov /home/alxndr/Development/=
qemu/general-fuzz/build/../hw/net/e1000e_core.c:1709:9
>       #146 0x55561319680b in e1000e_nc_receive_iov /home/alxndr/Developme=
nt/qemu/general-fuzz/build/../hw/net/e1000e.c:213:12
>       #147 0x555612812581 in net_tx_pkt_sendv /home/alxndr/Development/qe=
mu/general-fuzz/build/../hw/net/net_tx_pkt.c:556:9
>       #148 0x55561280fbc8 in net_tx_pkt_send /home/alxndr/Development/qem=
u/general-fuzz/build/../hw/net/net_tx_pkt.c:633:9
>       #149 0x555612813f38 in net_tx_pkt_send_loopback /home/alxndr/Develo=
pment/qemu/general-fuzz/build/../hw/net/net_tx_pkt.c:646:11
>       #150 0x5556133f8c07 in e1000e_tx_pkt_send /home/alxndr/Development/=
qemu/general-fuzz/build/../hw/net/e1000e_core.c:664:16
>       #151 0x5556133f5359 in e1000e_process_tx_desc /home/alxndr/Developm=
ent/qemu/general-fuzz/build/../hw/net/e1000e_core.c:743:17
>       #152 0x5556133f302f in e1000e_start_xmit /home/alxndr/Development/q=
emu/general-fuzz/build/../hw/net/e1000e_core.c:934:9
>       #153 0x5556133daba8 in e1000e_set_tctl /home/alxndr/Development/qem=
u/general-fuzz/build/../hw/net/e1000e_core.c:2431:9
>       #154 0x55561339901b in e1000e_core_write /home/alxndr/Development/q=
emu/general-fuzz/build/../hw/net/e1000e_core.c:3265:9
>       #155 0x555613190f26 in e1000e_mmio_write /home/alxndr/Development/q=
emu/general-fuzz/build/../hw/net/e1000e.c:109:5
>       #156 0x55561508ade0 in memory_region_write_accessor /home/alxndr/De=
velopment/qemu/general-fuzz/build/../softmmu/memory.c:483:5
>       #157 0x55561508a2bd in access_with_adjusted_size /home/alxndr/Devel=
opment/qemu/general-fuzz/build/../softmmu/memory.c:544:18
>       #158 0x555615087f70 in memory_region_dispatch_write /home/alxndr/De=
velopment/qemu/general-fuzz/build/../softmmu/memory.c:1466:16
>       #159 0x555614ce68a6 in flatview_write_continue /home/alxndr/Develop=
ment/qemu/general-fuzz/build/../exec.c:3176:23
>       #160 0x555614ccf878 in flatview_write /home/alxndr/Development/qemu=
/general-fuzz/build/../exec.c:3216:14
>       #161 0x555614ccf3a8 in address_space_write /home/alxndr/Development=
/qemu/general-fuzz/build/../exec.c:3308:18
>       #162 0x555614ccfc40 in address_space_rw /home/alxndr/Development/qe=
mu/general-fuzz/build/../exec.c:3318:16
>       #163 0x5556133b76c7 in dma_memory_rw_relaxed /home/alxndr/Developme=
nt/qemu/general-fuzz/include/sysemu/dma.h:87:18
>       #164 0x5556133b6ff5 in dma_memory_rw /home/alxndr/Development/qemu/=
general-fuzz/include/sysemu/dma.h:110:12
>       #165 0x5556133b6f3d in pci_dma_rw /home/alxndr/Development/qemu/gen=
eral-fuzz/include/hw/pci/pci.h:790:5
>       #166 0x5556133b526a in pci_dma_write /home/alxndr/Development/qemu/=
general-fuzz/include/hw/pci/pci.h:803:12
>       #167 0x5556133b403f in e1000e_write_to_rx_buffers /home/alxndr/Deve=
lopment/qemu/general-fuzz/build/../hw/net/e1000e_core.c:1412:9
>       #168 0x555613393bae in e1000e_write_packet_to_guest /home/alxndr/De=
velopment/qemu/general-fuzz/build/../hw/net/e1000e_core.c:1582:21
>       #169 0x55561338e419 in e1000e_receive_iov /home/alxndr/Development/=
qemu/general-fuzz/build/../hw/net/e1000e_core.c:1709:9
>       #170 0x55561319680b in e1000e_nc_receive_iov /home/alxndr/Developme=
nt/qemu/general-fuzz/build/../hw/net/e1000e.c:213:12
>       #171 0x555612812581 in net_tx_pkt_sendv /home/alxndr/Development/qe=
mu/general-fuzz/build/../hw/net/net_tx_pkt.c:556:9
>       #172 0x55561280fbc8 in net_tx_pkt_send /home/alxndr/Development/qem=
u/general-fuzz/build/../hw/net/net_tx_pkt.c:633:9
>       #173 0x555612813f38 in net_tx_pkt_send_loopback /home/alxndr/Develo=
pment/qemu/general-fuzz/build/../hw/net/net_tx_pkt.c:646:11
>       #174 0x5556133f8c07 in e1000e_tx_pkt_send /home/alxndr/Development/=
qemu/general-fuzz/build/../hw/net/e1000e_core.c:664:16
>       #175 0x5556133f5359 in e1000e_process_tx_desc /home/alxndr/Developm=
ent/qemu/general-fuzz/build/../hw/net/e1000e_core.c:743:17
>       #176 0x5556133f302f in e1000e_start_xmit /home/alxndr/Development/q=
emu/general-fuzz/build/../hw/net/e1000e_core.c:934:9
>       #177 0x5556133daba8 in e1000e_set_tctl /home/alxndr/Development/qem=
u/general-fuzz/build/../hw/net/e1000e_core.c:2431:9
>       #178 0x55561339901b in e1000e_core_write /home/alxndr/Development/q=
emu/general-fuzz/build/../hw/net/e1000e_core.c:3265:9
>       #179 0x555613190f26 in e1000e_mmio_write /home/alxndr/Development/q=
emu/general-fuzz/build/../hw/net/e1000e.c:109:5
>       #180 0x55561508ade0 in memory_region_write_accessor /home/alxndr/De=
velopment/qemu/general-fuzz/build/../softmmu/memory.c:483:5
>       #181 0x55561508a2bd in access_with_adjusted_size /home/alxndr/Devel=
opment/qemu/general-fuzz/build/../softmmu/memory.c:544:18
>       #182 0x555615087f70 in memory_region_dispatch_write /home/alxndr/De=
velopment/qemu/general-fuzz/build/../softmmu/memory.c:1466:16
>       #183 0x555614ce68a6 in flatview_write_continue /home/alxndr/Develop=
ment/qemu/general-fuzz/build/../exec.c:3176:23
>       #184 0x555614ccf878 in flatview_write /home/alxndr/Development/qemu=
/general-fuzz/build/../exec.c:3216:14
>       #185 0x555614ccf3a8 in address_space_write /home/alxndr/Development=
/qemu/general-fuzz/build/../exec.c:3308:18
>       #186 0x555614ccfc40 in address_space_rw /home/alxndr/Development/qe=
mu/general-fuzz/build/../exec.c:3318:16
>       #187 0x5556133b76c7 in dma_memory_rw_relaxed /home/alxndr/Developme=
nt/qemu/general-fuzz/include/sysemu/dma.h:87:18
>       #188 0x5556133b6ff5 in dma_memory_rw /home/alxndr/Development/qemu/=
general-fuzz/include/sysemu/dma.h:110:12
>       #189 0x5556133b6f3d in pci_dma_rw /home/alxndr/Development/qemu/gen=
eral-fuzz/include/hw/pci/pci.h:790:5
>       #190 0x5556133b526a in pci_dma_write /home/alxndr/Development/qemu/=
general-fuzz/include/hw/pci/pci.h:803:12
>       #191 0x5556133b403f in e1000e_write_to_rx_buffers /home/alxndr/Deve=
lopment/qemu/general-fuzz/build/../hw/net/e1000e_core.c:1412:9
>       #192 0x555613393bae in e1000e_write_packet_to_guest /home/alxndr/De=
velopment/qemu/general-fuzz/build/../hw/net/e1000e_core.c:1582:21
>       #193 0x55561338e419 in e1000e_receive_iov /home/alxndr/Development/=
qemu/general-fuzz/build/../hw/net/e1000e_core.c:1709:9
>       #194 0x55561319680b in e1000e_nc_receive_iov /home/alxndr/Developme=
nt/qemu/general-fuzz/build/../hw/net/e1000e.c:213:12
>       #195 0x555612812581 in net_tx_pkt_sendv /home/alxndr/Development/qe=
mu/general-fuzz/build/../hw/net/net_tx_pkt.c:556:9
>       #196 0x55561280fbc8 in net_tx_pkt_send /home/alxndr/Development/qem=
u/general-fuzz/build/../hw/net/net_tx_pkt.c:633:9
>       #197 0x555612813f38 in net_tx_pkt_send_loopback /home/alxndr/Develo=
pment/qemu/general-fuzz/build/../hw/net/net_tx_pkt.c:646:11
>       #198 0x5556133f8c07 in e1000e_tx_pkt_send /home/alxndr/Development/=
qemu/general-fuzz/build/../hw/net/e1000e_core.c:664:16
>       #199 0x5556133f5359 in e1000e_process_tx_desc /home/alxndr/Developm=
ent/qemu/general-fuzz/build/../hw/net/e1000e_core.c:743:17
>       #200 0x5556133f302f in e1000e_start_xmit /home/alxndr/Development/q=
emu/general-fuzz/build/../hw/net/e1000e_core.c:934:9
>       #201 0x5556133daba8 in e1000e_set_tctl /home/alxndr/Development/qem=
u/general-fuzz/build/../hw/net/e1000e_core.c:2431:9
>       #202 0x55561339901b in e1000e_core_write /home/alxndr/Development/q=
emu/general-fuzz/build/../hw/net/e1000e_core.c:3265:9
>       #203 0x555613190f26 in e1000e_mmio_write /home/alxndr/Development/q=
emu/general-fuzz/build/../hw/net/e1000e.c:109:5
>       #204 0x55561508ade0 in memory_region_write_accessor /home/alxndr/De=
velopment/qemu/general-fuzz/build/../softmmu/memory.c:483:5
>       #205 0x55561508a2bd in access_with_adjusted_size /home/alxndr/Devel=
opment/qemu/general-fuzz/build/../softmmu/memory.c:544:18
>       #206 0x555615087f70 in memory_region_dispatch_write /home/alxndr/De=
velopment/qemu/general-fuzz/build/../softmmu/memory.c:1466:16
>       #207 0x555614ce68a6 in flatview_write_continue /home/alxndr/Develop=
ment/qemu/general-fuzz/build/../exec.c:3176:23
>       #208 0x555614ccf878 in flatview_write /home/alxndr/Development/qemu=
/general-fuzz/build/../exec.c:3216:14
>       #209 0x555614ccf3a8 in address_space_write /home/alxndr/Development=
/qemu/general-fuzz/build/../exec.c:3308:18
>       #210 0x555614ccfc40 in address_space_rw /home/alxndr/Development/qe=
mu/general-fuzz/build/../exec.c:3318:16
>       #211 0x5556133b76c7 in dma_memory_rw_relaxed /home/alxndr/Developme=
nt/qemu/general-fuzz/include/sysemu/dma.h:87:18
>       #212 0x5556133b6ff5 in dma_memory_rw /home/alxndr/Development/qemu/=
general-fuzz/include/sysemu/dma.h:110:12
>       #213 0x5556133b6f3d in pci_dma_rw /home/alxndr/Development/qemu/gen=
eral-fuzz/include/hw/pci/pci.h:790:5
>       #214 0x5556133b526a in pci_dma_write /home/alxndr/Development/qemu/=
general-fuzz/include/hw/pci/pci.h:803:12
>       #215 0x5556133b403f in e1000e_write_to_rx_buffers /home/alxndr/Deve=
lopment/qemu/general-fuzz/build/../hw/net/e1000e_core.c:1412:9
>       #216 0x555613393bae in e1000e_write_packet_to_guest /home/alxndr/De=
velopment/qemu/general-fuzz/build/../hw/net/e1000e_core.c:1582:21
>       #217 0x55561338e419 in e1000e_receive_iov /home/alxndr/Development/=
qemu/general-fuzz/build/../hw/net/e1000e_core.c:1709:9
>       #218 0x55561319680b in e1000e_nc_receive_iov /home/alxndr/Developme=
nt/qemu/general-fuzz/build/../hw/net/e1000e.c:213:12
>       #219 0x555612812581 in net_tx_pkt_sendv /home/alxndr/Development/qe=
mu/general-fuzz/build/../hw/net/net_tx_pkt.c:556:9
>       #220 0x55561280fbc8 in net_tx_pkt_send /home/alxndr/Development/qem=
u/general-fuzz/build/../hw/net/net_tx_pkt.c:633:9
>       #221 0x555612813f38 in net_tx_pkt_send_loopback /home/alxndr/Develo=
pment/qemu/general-fuzz/build/../hw/net/net_tx_pkt.c:646:11
>       #222 0x5556133f8c07 in e1000e_tx_pkt_send /home/alxndr/Development/=
qemu/general-fuzz/build/../hw/net/e1000e_core.c:664:16
>       #223 0x5556133f5359 in e1000e_process_tx_desc /home/alxndr/Developm=
ent/qemu/general-fuzz/build/../hw/net/e1000e_core.c:743:17
>       #224 0x5556133f302f in e1000e_start_xmit /home/alxndr/Development/q=
emu/general-fuzz/build/../hw/net/e1000e_core.c:934:9
>       #225 0x5556133daba8 in e1000e_set_tctl /home/alxndr/Development/qem=
u/general-fuzz/build/../hw/net/e1000e_core.c:2431:9
>       #226 0x55561339901b in e1000e_core_write /home/alxndr/Development/q=
emu/general-fuzz/build/../hw/net/e1000e_core.c:3265:9
>       #227 0x555613190f26 in e1000e_mmio_write /home/alxndr/Development/q=
emu/general-fuzz/build/../hw/net/e1000e.c:109:5
>       #228 0x55561508ade0 in memory_region_write_accessor /home/alxndr/De=
velopment/qemu/general-fuzz/build/../softmmu/memory.c:483:5
>       #229 0x55561508a2bd in access_with_adjusted_size /home/alxndr/Devel=
opment/qemu/general-fuzz/build/../softmmu/memory.c:544:18
>       #230 0x555615087f70 in memory_region_dispatch_write /home/alxndr/De=
velopment/qemu/general-fuzz/build/../softmmu/memory.c:1466:16
>       #231 0x555614ce68a6 in flatview_write_continue /home/alxndr/Develop=
ment/qemu/general-fuzz/build/../exec.c:3176:23
>       #232 0x555614ccf878 in flatview_write /home/alxndr/Development/qemu=
/general-fuzz/build/../exec.c:3216:14
>       #233 0x555614ccf3a8 in address_space_write /home/alxndr/Development=
/qemu/general-fuzz/build/../exec.c:3308:18
>       #234 0x555614ccfc40 in address_space_rw /home/alxndr/Development/qe=
mu/general-fuzz/build/../exec.c:3318:16
>       #235 0x5556133b76c7 in dma_memory_rw_relaxed /home/alxndr/Developme=
nt/qemu/general-fuzz/include/sysemu/dma.h:87:18
>       #236 0x5556133b6ff5 in dma_memory_rw /home/alxndr/Development/qemu/=
general-fuzz/include/sysemu/dma.h:110:12
>       #237 0x5556133b6f3d in pci_dma_rw /home/alxndr/Development/qemu/gen=
eral-fuzz/include/hw/pci/pci.h:790:5
>       #238 0x5556133b526a in pci_dma_write /home/alxndr/Development/qemu/=
general-fuzz/include/hw/pci/pci.h:803:12
>       #239 0x5556133b403f in e1000e_write_to_rx_buffers /home/alxndr/Deve=
lopment/qemu/general-fuzz/build/../hw/net/e1000e_core.c:1412:9
>       #240 0x555613393bae in e1000e_write_packet_to_guest /home/alxndr/De=
velopment/qemu/general-fuzz/build/../hw/net/e1000e_core.c:1582:21
>       #241 0x55561338e419 in e1000e_receive_iov /home/alxndr/Development/=
qemu/general-fuzz/build/../hw/net/e1000e_core.c:1709:9
>       #242 0x55561319680b in e1000e_nc_receive_iov /home/alxndr/Developme=
nt/qemu/general-fuzz/build/../hw/net/e1000e.c:213:12
>       #243 0x555612812581 in net_tx_pkt_sendv /home/alxndr/Development/qe=
mu/general-fuzz/build/../hw/net/net_tx_pkt.c:556:9
>       #244 0x55561280fbc8 in net_tx_pkt_send /home/alxndr/Development/qem=
u/general-fuzz/build/../hw/net/net_tx_pkt.c:633:9
>       #245 0x555612813f38 in net_tx_pkt_send_loopback /home/alxndr/Develo=
pment/qemu/general-fuzz/build/../hw/net/net_tx_pkt.c:646:11
>       #246 0x5556133f8c07 in e1000e_tx_pkt_send /home/alxndr/Development/=
qemu/general-fuzz/build/../hw/net/e1000e_core.c:664:16
>       #247 0x5556133f5359 in e1000e_process_tx_desc /home/alxndr/Developm=
ent/qemu/general-fuzz/build/../hw/net/e1000e_core.c:743:17
>       #248 0x5556133f302f in e1000e_start_xmit /home/alxndr/Development/q=
emu/general-fuzz/build/../hw/net/e1000e_core.c:934:9
>       #249 0x5556133daba8 in e1000e_set_tctl /home/alxndr/Development/qem=
u/general-fuzz/build/../hw/net/e1000e_core.c:2431:9
> =

>   0x61900006cc88 is located 8 bytes inside of 1056-byte region [0x6190000=
6cc80,0x61900006d0a0)
>   freed by thread T0 here:
>       #0 0x5556126ce1bd in free (/home/alxndr/Development/qemu/general-fu=
zz/build/qemu-system-i386+0x2d291bd)
>       #1 0x555613e2af31 in net_rx_pkt_iovec_realloc /home/alxndr/Developm=
ent/qemu/general-fuzz/build/../hw/net/net_rx_pkt.c:80:9
>       #2 0x555613e18eaa in net_rx_pkt_pull_data /home/alxndr/Development/=
qemu/general-fuzz/build/../hw/net/net_rx_pkt.c:103:9
>       #3 0x555613e1b5cd in net_rx_pkt_attach_iovec_ex /home/alxndr/Develo=
pment/qemu/general-fuzz/build/../hw/net/net_rx_pkt.c:158:5
>       #4 0x55561338da6e in e1000e_receive_iov /home/alxndr/Development/qe=
mu/general-fuzz/build/../hw/net/e1000e_core.c:1695:5
>       #5 0x55561319680b in e1000e_nc_receive_iov /home/alxndr/Development=
/qemu/general-fuzz/build/../hw/net/e1000e.c:213:12
>       #6 0x555612812581 in net_tx_pkt_sendv /home/alxndr/Development/qemu=
/general-fuzz/build/../hw/net/net_tx_pkt.c:556:9
>       #7 0x55561280fbc8 in net_tx_pkt_send /home/alxndr/Development/qemu/=
general-fuzz/build/../hw/net/net_tx_pkt.c:633:9
>       #8 0x555612813f38 in net_tx_pkt_send_loopback /home/alxndr/Developm=
ent/qemu/general-fuzz/build/../hw/net/net_tx_pkt.c:646:11
>       #9 0x5556133f8c07 in e1000e_tx_pkt_send /home/alxndr/Development/qe=
mu/general-fuzz/build/../hw/net/e1000e_core.c:664:16
>       #10 0x5556133f5359 in e1000e_process_tx_desc /home/alxndr/Developme=
nt/qemu/general-fuzz/build/../hw/net/e1000e_core.c:743:17
>       #11 0x5556133f302f in e1000e_start_xmit /home/alxndr/Development/qe=
mu/general-fuzz/build/../hw/net/e1000e_core.c:934:9
>       #12 0x5556133daba8 in e1000e_set_tctl /home/alxndr/Development/qemu=
/general-fuzz/build/../hw/net/e1000e_core.c:2431:9
>       #13 0x55561339901b in e1000e_core_write /home/alxndr/Development/qe=
mu/general-fuzz/build/../hw/net/e1000e_core.c:3265:9
>       #14 0x555613190f26 in e1000e_mmio_write /home/alxndr/Development/qe=
mu/general-fuzz/build/../hw/net/e1000e.c:109:5
>       #15 0x55561508ade0 in memory_region_write_accessor /home/alxndr/Dev=
elopment/qemu/general-fuzz/build/../softmmu/memory.c:483:5
>       #16 0x55561508a2bd in access_with_adjusted_size /home/alxndr/Develo=
pment/qemu/general-fuzz/build/../softmmu/memory.c:544:18
>       #17 0x555615087f70 in memory_region_dispatch_write /home/alxndr/Dev=
elopment/qemu/general-fuzz/build/../softmmu/memory.c:1466:16
>       #18 0x555614ce68a6 in flatview_write_continue /home/alxndr/Developm=
ent/qemu/general-fuzz/build/../exec.c:3176:23
>       #19 0x555614ccf878 in flatview_write /home/alxndr/Development/qemu/=
general-fuzz/build/../exec.c:3216:14
>       #20 0x555614ccf3a8 in address_space_write /home/alxndr/Development/=
qemu/general-fuzz/build/../exec.c:3308:18
>       #21 0x555614ccfc40 in address_space_rw /home/alxndr/Development/qem=
u/general-fuzz/build/../exec.c:3318:16
>       #22 0x5556133b76c7 in dma_memory_rw_relaxed /home/alxndr/Developmen=
t/qemu/general-fuzz/include/sysemu/dma.h:87:18
>       #23 0x5556133b6ff5 in dma_memory_rw /home/alxndr/Development/qemu/g=
eneral-fuzz/include/sysemu/dma.h:110:12
>       #24 0x5556133b6f3d in pci_dma_rw /home/alxndr/Development/qemu/gene=
ral-fuzz/include/hw/pci/pci.h:790:5
>       #25 0x5556133b526a in pci_dma_write /home/alxndr/Development/qemu/g=
eneral-fuzz/include/hw/pci/pci.h:803:12
>       #26 0x5556133b403f in e1000e_write_to_rx_buffers /home/alxndr/Devel=
opment/qemu/general-fuzz/build/../hw/net/e1000e_core.c:1412:9
>       #27 0x555613393bae in e1000e_write_packet_to_guest /home/alxndr/Dev=
elopment/qemu/general-fuzz/build/../hw/net/e1000e_core.c:1582:21
>       #28 0x55561338e419 in e1000e_receive_iov /home/alxndr/Development/q=
emu/general-fuzz/build/../hw/net/e1000e_core.c:1709:9
>       #29 0x55561319680b in e1000e_nc_receive_iov /home/alxndr/Developmen=
t/qemu/general-fuzz/build/../hw/net/e1000e.c:213:12
> =

>   previously allocated by thread T0 here:
>       #0 0x5556126ce43d in malloc (/home/alxndr/Development/qemu/general-=
fuzz/build/qemu-system-i386+0x2d2943d)
>       #1 0x7fc45f5171b8 in g_malloc (/usr/lib/x86_64-linux-gnu/libglib-2.=
0.so.0+0x561b8)
>       #2 0x555613e18eaa in net_rx_pkt_pull_data /home/alxndr/Development/=
qemu/general-fuzz/build/../hw/net/net_rx_pkt.c:103:9
>       #3 0x555613e1b5cd in net_rx_pkt_attach_iovec_ex /home/alxndr/Develo=
pment/qemu/general-fuzz/build/../hw/net/net_rx_pkt.c:158:5
>       #4 0x55561338da6e in e1000e_receive_iov /home/alxndr/Development/qe=
mu/general-fuzz/build/../hw/net/e1000e_core.c:1695:5
>       #5 0x55561319680b in e1000e_nc_receive_iov /home/alxndr/Development=
/qemu/general-fuzz/build/../hw/net/e1000e.c:213:12
>       #6 0x555612812581 in net_tx_pkt_sendv /home/alxndr/Development/qemu=
/general-fuzz/build/../hw/net/net_tx_pkt.c:556:9
>       #7 0x55561280fbc8 in net_tx_pkt_send /home/alxndr/Development/qemu/=
general-fuzz/build/../hw/net/net_tx_pkt.c:633:9
>       #8 0x555612813f38 in net_tx_pkt_send_loopback /home/alxndr/Developm=
ent/qemu/general-fuzz/build/../hw/net/net_tx_pkt.c:646:11
>       #9 0x5556133f8c07 in e1000e_tx_pkt_send /home/alxndr/Development/qe=
mu/general-fuzz/build/../hw/net/e1000e_core.c:664:16
>       #10 0x5556133f5359 in e1000e_process_tx_desc /home/alxndr/Developme=
nt/qemu/general-fuzz/build/../hw/net/e1000e_core.c:743:17
>       #11 0x5556133f302f in e1000e_start_xmit /home/alxndr/Development/qe=
mu/general-fuzz/build/../hw/net/e1000e_core.c:934:9
>       #12 0x5556133daba8 in e1000e_set_tctl /home/alxndr/Development/qemu=
/general-fuzz/build/../hw/net/e1000e_core.c:2431:9
>       #13 0x55561339901b in e1000e_core_write /home/alxndr/Development/qe=
mu/general-fuzz/build/../hw/net/e1000e_core.c:3265:9
>       #14 0x555613190f26 in e1000e_mmio_write /home/alxndr/Development/qe=
mu/general-fuzz/build/../hw/net/e1000e.c:109:5
>       #15 0x55561508ade0 in memory_region_write_accessor /home/alxndr/Dev=
elopment/qemu/general-fuzz/build/../softmmu/memory.c:483:5
>       #16 0x55561508a2bd in access_with_adjusted_size /home/alxndr/Develo=
pment/qemu/general-fuzz/build/../softmmu/memory.c:544:18
>       #17 0x555615087f70 in memory_region_dispatch_write /home/alxndr/Dev=
elopment/qemu/general-fuzz/build/../softmmu/memory.c:1466:16
>       #18 0x555614ce68a6 in flatview_write_continue /home/alxndr/Developm=
ent/qemu/general-fuzz/build/../exec.c:3176:23
>       #19 0x555614ccf878 in flatview_write /home/alxndr/Development/qemu/=
general-fuzz/build/../exec.c:3216:14
>       #20 0x555614ccf3a8 in address_space_write /home/alxndr/Development/=
qemu/general-fuzz/build/../exec.c:3308:18
>       #21 0x555614ccfc40 in address_space_rw /home/alxndr/Development/qem=
u/general-fuzz/build/../exec.c:3318:16
>       #22 0x5556133b76c7 in dma_memory_rw_relaxed /home/alxndr/Developmen=
t/qemu/general-fuzz/include/sysemu/dma.h:87:18
>       #23 0x5556133b6ff5 in dma_memory_rw /home/alxndr/Development/qemu/g=
eneral-fuzz/include/sysemu/dma.h:110:12
>       #24 0x5556133b6f3d in pci_dma_rw /home/alxndr/Development/qemu/gene=
ral-fuzz/include/hw/pci/pci.h:790:5
>       #25 0x5556133b526a in pci_dma_write /home/alxndr/Development/qemu/g=
eneral-fuzz/include/hw/pci/pci.h:803:12
>       #26 0x5556133b403f in e1000e_write_to_rx_buffers /home/alxndr/Devel=
opment/qemu/general-fuzz/build/../hw/net/e1000e_core.c:1412:9
>       #27 0x555613393bae in e1000e_write_packet_to_guest /home/alxndr/Dev=
elopment/qemu/general-fuzz/build/../hw/net/e1000e_core.c:1582:21
>       #28 0x55561338e419 in e1000e_receive_iov /home/alxndr/Development/q=
emu/general-fuzz/build/../hw/net/e1000e_core.c:1709:9
>       #29 0x55561319680b in e1000e_nc_receive_iov /home/alxndr/Developmen=
t/qemu/general-fuzz/build/../hw/net/e1000e.c:213:12
> =

>   SUMMARY: AddressSanitizer: heap-use-after-free /home/alxndr/Development=
/qemu/general-fuzz/build/../hw/net/e1000e_core.c:1587:41 in e1000e_write_pa=
cket_to_guest
>   Shadow bytes around the buggy address:
>     0x0c3280005940: fd fd fd fd fd fd fd fd fd fd fd fd fd fd fd fd
>     0x0c3280005950: fd fd fd fd fd fd fd fd fd fd fd fd fd fd fd fd
>     0x0c3280005960: fd fd fd fd fd fd fd fd fd fd fd fd fd fd fd fd
>     0x0c3280005970: fd fd fa fa fa fa fa fa fa fa fa fa fa fa fa fa
>     0x0c3280005980: fa fa fa fa fa fa fa fa fa fa fa fa fa fa fa fa
>   =3D>0x0c3280005990: fd[fd]fd fd fd fd fd fd fd fd fd fd fd fd fd fd
>     0x0c32800059a0: fd fd fd fd fd fd fd fd fd fd fd fd fd fd fd fd
>     0x0c32800059b0: fd fd fd fd fd fd fd fd fd fd fd fd fd fd fd fd
>     0x0c32800059c0: fd fd fd fd fd fd fd fd fd fd fd fd fd fd fd fd
>     0x0c32800059d0: fd fd fd fd fd fd fd fd fd fd fd fd fd fd fd fd
>     0x0c32800059e0: fd fd fd fd fd fd fd fd fd fd fd fd fd fd fd fd
>   Shadow byte legend (one shadow byte represents 8 application bytes):
>     Addressable:           00
>     Partially addressable: 01 02 03 04 05 06 07 =

>     Heap left redzone:       fa
>     Freed heap region:       fd
>     Stack left redzone:      f1
>     Stack mid redzone:       f2
>     Stack right redzone:     f3
>     Stack after return:      f5
>     Stack use after scope:   f8
>     Global redzone:          f9
>     Global init order:       f6
>     Poisoned by user:        f7
>     Container overflow:      fc
>     Array cookie:            ac
>     Intra object redzone:    bb
>     ASan internal:           fe
>     Left alloca redzone:     ca
>     Right alloca redzone:    cb
>     Shadow gap:              cc
>   =3D=3D935641=3D=3DABORTING
> =

>   -Alex
> =

> To manage notifications about this bug go to:
> https://bugs.launchpad.net/qemu/+bug/1892978/+subscriptions

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1892978

Title:
  Heap-use-after-free in e1000e_write_packet_to_guest

Status in QEMU:
  Incomplete

Bug description:
  Hello,
  Reproducer:
  cat << EOF | ./qemu-system-i386 \
  -display none -m 64 -netdev user,id=3Dqtest-bn0 \
  -device e1000e,netdev=3Dqtest-bn0 -display none \
  -nodefaults -accel qtest -qtest stdio
  outl 0xcf8 0x80001004
  outl 0xcfc 0x3b2e84ce
  outl 0xcf8 0x80001013
  outw 0xcfc 0x2499
  writew 0x990000ff 0x5ea2
  writeq 0x99000429 0x133a940000188101
  outl 0xcfc 0x9b890e04
  writeq 0x4000119 0x5000055ec751c0d
  write 0x10707 0x1 0x07
  write 0x51 0x1 0x04
  write 0x53 0x1 0x04
  write 0x140 0x1 0x07
  write 0x141 0x1 0x07
  write 0x142 0x1 0x01
  write 0x148 0x1 0x40
  write 0x14a 0x1 0x7d
  write 0x14b 0x1 0xff
  writeq 0x4000401 0x413001600027d
  EOF

  =

  The stacktrace:

  [S +0.090759] OK
  [R +0.090767] writeq 0x4000401 0x413001600027d
  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
  =3D=3D935641=3D=3DERROR: AddressSanitizer: heap-use-after-free on address=
 0x61900006cc88 at pc 0x555613393d45 bp 0x7fff92f8b7f0 sp 0x7fff92f8b7e8
  READ of size 8 at 0x61900006cc88 thread T0
      #0 0x555613393d44 in e1000e_write_packet_to_guest /home/alxndr/Develo=
pment/qemu/general-fuzz/build/../hw/net/e1000e_core.c:1587:41
      #1 0x55561338e419 in e1000e_receive_iov /home/alxndr/Development/qemu=
/general-fuzz/build/../hw/net/e1000e_core.c:1709:9
      #2 0x55561319680b in e1000e_nc_receive_iov /home/alxndr/Development/q=
emu/general-fuzz/build/../hw/net/e1000e.c:213:12
      #3 0x555612812581 in net_tx_pkt_sendv /home/alxndr/Development/qemu/g=
eneral-fuzz/build/../hw/net/net_tx_pkt.c:556:9
      #4 0x55561280fbc8 in net_tx_pkt_send /home/alxndr/Development/qemu/ge=
neral-fuzz/build/../hw/net/net_tx_pkt.c:633:9
      #5 0x555612813f38 in net_tx_pkt_send_loopback /home/alxndr/Developmen=
t/qemu/general-fuzz/build/../hw/net/net_tx_pkt.c:646:11
      #6 0x5556133f8c07 in e1000e_tx_pkt_send /home/alxndr/Development/qemu=
/general-fuzz/build/../hw/net/e1000e_core.c:664:16
      #7 0x5556133f5359 in e1000e_process_tx_desc /home/alxndr/Development/=
qemu/general-fuzz/build/../hw/net/e1000e_core.c:743:17
      #8 0x5556133f302f in e1000e_start_xmit /home/alxndr/Development/qemu/=
general-fuzz/build/../hw/net/e1000e_core.c:934:9
      #9 0x5556133daba8 in e1000e_set_tctl /home/alxndr/Development/qemu/ge=
neral-fuzz/build/../hw/net/e1000e_core.c:2431:9
      #10 0x55561339901b in e1000e_core_write /home/alxndr/Development/qemu=
/general-fuzz/build/../hw/net/e1000e_core.c:3265:9
      #11 0x555613190f26 in e1000e_mmio_write /home/alxndr/Development/qemu=
/general-fuzz/build/../hw/net/e1000e.c:109:5
      #12 0x55561508ade0 in memory_region_write_accessor /home/alxndr/Devel=
opment/qemu/general-fuzz/build/../softmmu/memory.c:483:5
      #13 0x55561508a2bd in access_with_adjusted_size /home/alxndr/Developm=
ent/qemu/general-fuzz/build/../softmmu/memory.c:544:18
      #14 0x555615087f70 in memory_region_dispatch_write /home/alxndr/Devel=
opment/qemu/general-fuzz/build/../softmmu/memory.c:1466:16
      #15 0x555614ce68a6 in flatview_write_continue /home/alxndr/Developmen=
t/qemu/general-fuzz/build/../exec.c:3176:23
      #16 0x555614ccf878 in flatview_write /home/alxndr/Development/qemu/ge=
neral-fuzz/build/../exec.c:3216:14
      #17 0x555614ccf3a8 in address_space_write /home/alxndr/Development/qe=
mu/general-fuzz/build/../exec.c:3308:18
      #18 0x555614ccfc40 in address_space_rw /home/alxndr/Development/qemu/=
general-fuzz/build/../exec.c:3318:16
      #19 0x5556133b76c7 in dma_memory_rw_relaxed /home/alxndr/Development/=
qemu/general-fuzz/include/sysemu/dma.h:87:18
      #20 0x5556133b6ff5 in dma_memory_rw /home/alxndr/Development/qemu/gen=
eral-fuzz/include/sysemu/dma.h:110:12
      #21 0x5556133b6f3d in pci_dma_rw /home/alxndr/Development/qemu/genera=
l-fuzz/include/hw/pci/pci.h:790:5
      #22 0x5556133b526a in pci_dma_write /home/alxndr/Development/qemu/gen=
eral-fuzz/include/hw/pci/pci.h:803:12
      #23 0x5556133b403f in e1000e_write_to_rx_buffers /home/alxndr/Develop=
ment/qemu/general-fuzz/build/../hw/net/e1000e_core.c:1412:9
      #24 0x555613393bae in e1000e_write_packet_to_guest /home/alxndr/Devel=
opment/qemu/general-fuzz/build/../hw/net/e1000e_core.c:1582:21
      #25 0x55561338e419 in e1000e_receive_iov /home/alxndr/Development/qem=
u/general-fuzz/build/../hw/net/e1000e_core.c:1709:9
      #26 0x55561319680b in e1000e_nc_receive_iov /home/alxndr/Development/=
qemu/general-fuzz/build/../hw/net/e1000e.c:213:12
      #27 0x555612812581 in net_tx_pkt_sendv /home/alxndr/Development/qemu/=
general-fuzz/build/../hw/net/net_tx_pkt.c:556:9
      #28 0x55561280fbc8 in net_tx_pkt_send /home/alxndr/Development/qemu/g=
eneral-fuzz/build/../hw/net/net_tx_pkt.c:633:9
      #29 0x555612813f38 in net_tx_pkt_send_loopback /home/alxndr/Developme=
nt/qemu/general-fuzz/build/../hw/net/net_tx_pkt.c:646:11
      #30 0x5556133f8c07 in e1000e_tx_pkt_send /home/alxndr/Development/qem=
u/general-fuzz/build/../hw/net/e1000e_core.c:664:16
      #31 0x5556133f5359 in e1000e_process_tx_desc /home/alxndr/Development=
/qemu/general-fuzz/build/../hw/net/e1000e_core.c:743:17
      #32 0x5556133f302f in e1000e_start_xmit /home/alxndr/Development/qemu=
/general-fuzz/build/../hw/net/e1000e_core.c:934:9
      #33 0x5556133daba8 in e1000e_set_tctl /home/alxndr/Development/qemu/g=
eneral-fuzz/build/../hw/net/e1000e_core.c:2431:9
      #34 0x55561339901b in e1000e_core_write /home/alxndr/Development/qemu=
/general-fuzz/build/../hw/net/e1000e_core.c:3265:9
      #35 0x555613190f26 in e1000e_mmio_write /home/alxndr/Development/qemu=
/general-fuzz/build/../hw/net/e1000e.c:109:5
      #36 0x55561508ade0 in memory_region_write_accessor /home/alxndr/Devel=
opment/qemu/general-fuzz/build/../softmmu/memory.c:483:5
      #37 0x55561508a2bd in access_with_adjusted_size /home/alxndr/Developm=
ent/qemu/general-fuzz/build/../softmmu/memory.c:544:18
      #38 0x555615087f70 in memory_region_dispatch_write /home/alxndr/Devel=
opment/qemu/general-fuzz/build/../softmmu/memory.c:1466:16
      #39 0x555614ce68a6 in flatview_write_continue /home/alxndr/Developmen=
t/qemu/general-fuzz/build/../exec.c:3176:23
      #40 0x555614ccf878 in flatview_write /home/alxndr/Development/qemu/ge=
neral-fuzz/build/../exec.c:3216:14
      #41 0x555614ccf3a8 in address_space_write /home/alxndr/Development/qe=
mu/general-fuzz/build/../exec.c:3308:18
      #42 0x555614ccfc40 in address_space_rw /home/alxndr/Development/qemu/=
general-fuzz/build/../exec.c:3318:16
      #43 0x5556133b76c7 in dma_memory_rw_relaxed /home/alxndr/Development/=
qemu/general-fuzz/include/sysemu/dma.h:87:18
      #44 0x5556133b6ff5 in dma_memory_rw /home/alxndr/Development/qemu/gen=
eral-fuzz/include/sysemu/dma.h:110:12
      #45 0x5556133b6f3d in pci_dma_rw /home/alxndr/Development/qemu/genera=
l-fuzz/include/hw/pci/pci.h:790:5
      #46 0x5556133b526a in pci_dma_write /home/alxndr/Development/qemu/gen=
eral-fuzz/include/hw/pci/pci.h:803:12
      #47 0x5556133b403f in e1000e_write_to_rx_buffers /home/alxndr/Develop=
ment/qemu/general-fuzz/build/../hw/net/e1000e_core.c:1412:9
      #48 0x555613393bae in e1000e_write_packet_to_guest /home/alxndr/Devel=
opment/qemu/general-fuzz/build/../hw/net/e1000e_core.c:1582:21
      #49 0x55561338e419 in e1000e_receive_iov /home/alxndr/Development/qem=
u/general-fuzz/build/../hw/net/e1000e_core.c:1709:9
      #50 0x55561319680b in e1000e_nc_receive_iov /home/alxndr/Development/=
qemu/general-fuzz/build/../hw/net/e1000e.c:213:12
      #51 0x555612812581 in net_tx_pkt_sendv /home/alxndr/Development/qemu/=
general-fuzz/build/../hw/net/net_tx_pkt.c:556:9
      #52 0x55561280fbc8 in net_tx_pkt_send /home/alxndr/Development/qemu/g=
eneral-fuzz/build/../hw/net/net_tx_pkt.c:633:9
      #53 0x555612813f38 in net_tx_pkt_send_loopback /home/alxndr/Developme=
nt/qemu/general-fuzz/build/../hw/net/net_tx_pkt.c:646:11
      #54 0x5556133f8c07 in e1000e_tx_pkt_send /home/alxndr/Development/qem=
u/general-fuzz/build/../hw/net/e1000e_core.c:664:16
      #55 0x5556133f5359 in e1000e_process_tx_desc /home/alxndr/Development=
/qemu/general-fuzz/build/../hw/net/e1000e_core.c:743:17
      #56 0x5556133f302f in e1000e_start_xmit /home/alxndr/Development/qemu=
/general-fuzz/build/../hw/net/e1000e_core.c:934:9
      #57 0x5556133daba8 in e1000e_set_tctl /home/alxndr/Development/qemu/g=
eneral-fuzz/build/../hw/net/e1000e_core.c:2431:9
      #58 0x55561339901b in e1000e_core_write /home/alxndr/Development/qemu=
/general-fuzz/build/../hw/net/e1000e_core.c:3265:9
      #59 0x555613190f26 in e1000e_mmio_write /home/alxndr/Development/qemu=
/general-fuzz/build/../hw/net/e1000e.c:109:5
      #60 0x55561508ade0 in memory_region_write_accessor /home/alxndr/Devel=
opment/qemu/general-fuzz/build/../softmmu/memory.c:483:5
      #61 0x55561508a2bd in access_with_adjusted_size /home/alxndr/Developm=
ent/qemu/general-fuzz/build/../softmmu/memory.c:544:18
      #62 0x555615087f70 in memory_region_dispatch_write /home/alxndr/Devel=
opment/qemu/general-fuzz/build/../softmmu/memory.c:1466:16
      #63 0x555614ce68a6 in flatview_write_continue /home/alxndr/Developmen=
t/qemu/general-fuzz/build/../exec.c:3176:23
      #64 0x555614ccf878 in flatview_write /home/alxndr/Development/qemu/ge=
neral-fuzz/build/../exec.c:3216:14
      #65 0x555614ccf3a8 in address_space_write /home/alxndr/Development/qe=
mu/general-fuzz/build/../exec.c:3308:18
      #66 0x555614ccfc40 in address_space_rw /home/alxndr/Development/qemu/=
general-fuzz/build/../exec.c:3318:16
      #67 0x5556133b76c7 in dma_memory_rw_relaxed /home/alxndr/Development/=
qemu/general-fuzz/include/sysemu/dma.h:87:18
      #68 0x5556133b6ff5 in dma_memory_rw /home/alxndr/Development/qemu/gen=
eral-fuzz/include/sysemu/dma.h:110:12
      #69 0x5556133b6f3d in pci_dma_rw /home/alxndr/Development/qemu/genera=
l-fuzz/include/hw/pci/pci.h:790:5
      #70 0x5556133b526a in pci_dma_write /home/alxndr/Development/qemu/gen=
eral-fuzz/include/hw/pci/pci.h:803:12
      #71 0x5556133b403f in e1000e_write_to_rx_buffers /home/alxndr/Develop=
ment/qemu/general-fuzz/build/../hw/net/e1000e_core.c:1412:9
      #72 0x555613393bae in e1000e_write_packet_to_guest /home/alxndr/Devel=
opment/qemu/general-fuzz/build/../hw/net/e1000e_core.c:1582:21
      #73 0x55561338e419 in e1000e_receive_iov /home/alxndr/Development/qem=
u/general-fuzz/build/../hw/net/e1000e_core.c:1709:9
      #74 0x55561319680b in e1000e_nc_receive_iov /home/alxndr/Development/=
qemu/general-fuzz/build/../hw/net/e1000e.c:213:12
      #75 0x555612812581 in net_tx_pkt_sendv /home/alxndr/Development/qemu/=
general-fuzz/build/../hw/net/net_tx_pkt.c:556:9
      #76 0x55561280fbc8 in net_tx_pkt_send /home/alxndr/Development/qemu/g=
eneral-fuzz/build/../hw/net/net_tx_pkt.c:633:9
      #77 0x555612813f38 in net_tx_pkt_send_loopback /home/alxndr/Developme=
nt/qemu/general-fuzz/build/../hw/net/net_tx_pkt.c:646:11
      #78 0x5556133f8c07 in e1000e_tx_pkt_send /home/alxndr/Development/qem=
u/general-fuzz/build/../hw/net/e1000e_core.c:664:16
      #79 0x5556133f5359 in e1000e_process_tx_desc /home/alxndr/Development=
/qemu/general-fuzz/build/../hw/net/e1000e_core.c:743:17
      #80 0x5556133f302f in e1000e_start_xmit /home/alxndr/Development/qemu=
/general-fuzz/build/../hw/net/e1000e_core.c:934:9
      #81 0x5556133daba8 in e1000e_set_tctl /home/alxndr/Development/qemu/g=
eneral-fuzz/build/../hw/net/e1000e_core.c:2431:9
      #82 0x55561339901b in e1000e_core_write /home/alxndr/Development/qemu=
/general-fuzz/build/../hw/net/e1000e_core.c:3265:9
      #83 0x555613190f26 in e1000e_mmio_write /home/alxndr/Development/qemu=
/general-fuzz/build/../hw/net/e1000e.c:109:5
      #84 0x55561508ade0 in memory_region_write_accessor /home/alxndr/Devel=
opment/qemu/general-fuzz/build/../softmmu/memory.c:483:5
      #85 0x55561508a2bd in access_with_adjusted_size /home/alxndr/Developm=
ent/qemu/general-fuzz/build/../softmmu/memory.c:544:18
      #86 0x555615087f70 in memory_region_dispatch_write /home/alxndr/Devel=
opment/qemu/general-fuzz/build/../softmmu/memory.c:1466:16
      #87 0x555614ce68a6 in flatview_write_continue /home/alxndr/Developmen=
t/qemu/general-fuzz/build/../exec.c:3176:23
      #88 0x555614ccf878 in flatview_write /home/alxndr/Development/qemu/ge=
neral-fuzz/build/../exec.c:3216:14
      #89 0x555614ccf3a8 in address_space_write /home/alxndr/Development/qe=
mu/general-fuzz/build/../exec.c:3308:18
      #90 0x555614ccfc40 in address_space_rw /home/alxndr/Development/qemu/=
general-fuzz/build/../exec.c:3318:16
      #91 0x5556133b76c7 in dma_memory_rw_relaxed /home/alxndr/Development/=
qemu/general-fuzz/include/sysemu/dma.h:87:18
      #92 0x5556133b6ff5 in dma_memory_rw /home/alxndr/Development/qemu/gen=
eral-fuzz/include/sysemu/dma.h:110:12
      #93 0x5556133b6f3d in pci_dma_rw /home/alxndr/Development/qemu/genera=
l-fuzz/include/hw/pci/pci.h:790:5
      #94 0x5556133b526a in pci_dma_write /home/alxndr/Development/qemu/gen=
eral-fuzz/include/hw/pci/pci.h:803:12
      #95 0x5556133b403f in e1000e_write_to_rx_buffers /home/alxndr/Develop=
ment/qemu/general-fuzz/build/../hw/net/e1000e_core.c:1412:9
      #96 0x555613393bae in e1000e_write_packet_to_guest /home/alxndr/Devel=
opment/qemu/general-fuzz/build/../hw/net/e1000e_core.c:1582:21
      #97 0x55561338e419 in e1000e_receive_iov /home/alxndr/Development/qem=
u/general-fuzz/build/../hw/net/e1000e_core.c:1709:9
      #98 0x55561319680b in e1000e_nc_receive_iov /home/alxndr/Development/=
qemu/general-fuzz/build/../hw/net/e1000e.c:213:12
      #99 0x555612812581 in net_tx_pkt_sendv /home/alxndr/Development/qemu/=
general-fuzz/build/../hw/net/net_tx_pkt.c:556:9
      #100 0x55561280fbc8 in net_tx_pkt_send /home/alxndr/Development/qemu/=
general-fuzz/build/../hw/net/net_tx_pkt.c:633:9
      #101 0x555612813f38 in net_tx_pkt_send_loopback /home/alxndr/Developm=
ent/qemu/general-fuzz/build/../hw/net/net_tx_pkt.c:646:11
      #102 0x5556133f8c07 in e1000e_tx_pkt_send /home/alxndr/Development/qe=
mu/general-fuzz/build/../hw/net/e1000e_core.c:664:16
      #103 0x5556133f5359 in e1000e_process_tx_desc /home/alxndr/Developmen=
t/qemu/general-fuzz/build/../hw/net/e1000e_core.c:743:17
      #104 0x5556133f302f in e1000e_start_xmit /home/alxndr/Development/qem=
u/general-fuzz/build/../hw/net/e1000e_core.c:934:9
      #105 0x5556133daba8 in e1000e_set_tctl /home/alxndr/Development/qemu/=
general-fuzz/build/../hw/net/e1000e_core.c:2431:9
      #106 0x55561339901b in e1000e_core_write /home/alxndr/Development/qem=
u/general-fuzz/build/../hw/net/e1000e_core.c:3265:9
      #107 0x555613190f26 in e1000e_mmio_write /home/alxndr/Development/qem=
u/general-fuzz/build/../hw/net/e1000e.c:109:5
      #108 0x55561508ade0 in memory_region_write_accessor /home/alxndr/Deve=
lopment/qemu/general-fuzz/build/../softmmu/memory.c:483:5
      #109 0x55561508a2bd in access_with_adjusted_size /home/alxndr/Develop=
ment/qemu/general-fuzz/build/../softmmu/memory.c:544:18
      #110 0x555615087f70 in memory_region_dispatch_write /home/alxndr/Deve=
lopment/qemu/general-fuzz/build/../softmmu/memory.c:1466:16
      #111 0x555614ce68a6 in flatview_write_continue /home/alxndr/Developme=
nt/qemu/general-fuzz/build/../exec.c:3176:23
      #112 0x555614ccf878 in flatview_write /home/alxndr/Development/qemu/g=
eneral-fuzz/build/../exec.c:3216:14
      #113 0x555614ccf3a8 in address_space_write /home/alxndr/Development/q=
emu/general-fuzz/build/../exec.c:3308:18
      #114 0x555614ccfc40 in address_space_rw /home/alxndr/Development/qemu=
/general-fuzz/build/../exec.c:3318:16
      #115 0x5556133b76c7 in dma_memory_rw_relaxed /home/alxndr/Development=
/qemu/general-fuzz/include/sysemu/dma.h:87:18
      #116 0x5556133b6ff5 in dma_memory_rw /home/alxndr/Development/qemu/ge=
neral-fuzz/include/sysemu/dma.h:110:12
      #117 0x5556133b6f3d in pci_dma_rw /home/alxndr/Development/qemu/gener=
al-fuzz/include/hw/pci/pci.h:790:5
      #118 0x5556133b526a in pci_dma_write /home/alxndr/Development/qemu/ge=
neral-fuzz/include/hw/pci/pci.h:803:12
      #119 0x5556133b403f in e1000e_write_to_rx_buffers /home/alxndr/Develo=
pment/qemu/general-fuzz/build/../hw/net/e1000e_core.c:1412:9
      #120 0x555613393bae in e1000e_write_packet_to_guest /home/alxndr/Deve=
lopment/qemu/general-fuzz/build/../hw/net/e1000e_core.c:1582:21
      #121 0x55561338e419 in e1000e_receive_iov /home/alxndr/Development/qe=
mu/general-fuzz/build/../hw/net/e1000e_core.c:1709:9
      #122 0x55561319680b in e1000e_nc_receive_iov /home/alxndr/Development=
/qemu/general-fuzz/build/../hw/net/e1000e.c:213:12
      #123 0x555612812581 in net_tx_pkt_sendv /home/alxndr/Development/qemu=
/general-fuzz/build/../hw/net/net_tx_pkt.c:556:9
      #124 0x55561280fbc8 in net_tx_pkt_send /home/alxndr/Development/qemu/=
general-fuzz/build/../hw/net/net_tx_pkt.c:633:9
      #125 0x555612813f38 in net_tx_pkt_send_loopback /home/alxndr/Developm=
ent/qemu/general-fuzz/build/../hw/net/net_tx_pkt.c:646:11
      #126 0x5556133f8c07 in e1000e_tx_pkt_send /home/alxndr/Development/qe=
mu/general-fuzz/build/../hw/net/e1000e_core.c:664:16
      #127 0x5556133f5359 in e1000e_process_tx_desc /home/alxndr/Developmen=
t/qemu/general-fuzz/build/../hw/net/e1000e_core.c:743:17
      #128 0x5556133f302f in e1000e_start_xmit /home/alxndr/Development/qem=
u/general-fuzz/build/../hw/net/e1000e_core.c:934:9
      #129 0x5556133daba8 in e1000e_set_tctl /home/alxndr/Development/qemu/=
general-fuzz/build/../hw/net/e1000e_core.c:2431:9
      #130 0x55561339901b in e1000e_core_write /home/alxndr/Development/qem=
u/general-fuzz/build/../hw/net/e1000e_core.c:3265:9
      #131 0x555613190f26 in e1000e_mmio_write /home/alxndr/Development/qem=
u/general-fuzz/build/../hw/net/e1000e.c:109:5
      #132 0x55561508ade0 in memory_region_write_accessor /home/alxndr/Deve=
lopment/qemu/general-fuzz/build/../softmmu/memory.c:483:5
      #133 0x55561508a2bd in access_with_adjusted_size /home/alxndr/Develop=
ment/qemu/general-fuzz/build/../softmmu/memory.c:544:18
      #134 0x555615087f70 in memory_region_dispatch_write /home/alxndr/Deve=
lopment/qemu/general-fuzz/build/../softmmu/memory.c:1466:16
      #135 0x555614ce68a6 in flatview_write_continue /home/alxndr/Developme=
nt/qemu/general-fuzz/build/../exec.c:3176:23
      #136 0x555614ccf878 in flatview_write /home/alxndr/Development/qemu/g=
eneral-fuzz/build/../exec.c:3216:14
      #137 0x555614ccf3a8 in address_space_write /home/alxndr/Development/q=
emu/general-fuzz/build/../exec.c:3308:18
      #138 0x555614ccfc40 in address_space_rw /home/alxndr/Development/qemu=
/general-fuzz/build/../exec.c:3318:16
      #139 0x5556133b76c7 in dma_memory_rw_relaxed /home/alxndr/Development=
/qemu/general-fuzz/include/sysemu/dma.h:87:18
      #140 0x5556133b6ff5 in dma_memory_rw /home/alxndr/Development/qemu/ge=
neral-fuzz/include/sysemu/dma.h:110:12
      #141 0x5556133b6f3d in pci_dma_rw /home/alxndr/Development/qemu/gener=
al-fuzz/include/hw/pci/pci.h:790:5
      #142 0x5556133b526a in pci_dma_write /home/alxndr/Development/qemu/ge=
neral-fuzz/include/hw/pci/pci.h:803:12
      #143 0x5556133b403f in e1000e_write_to_rx_buffers /home/alxndr/Develo=
pment/qemu/general-fuzz/build/../hw/net/e1000e_core.c:1412:9
      #144 0x555613393bae in e1000e_write_packet_to_guest /home/alxndr/Deve=
lopment/qemu/general-fuzz/build/../hw/net/e1000e_core.c:1582:21
      #145 0x55561338e419 in e1000e_receive_iov /home/alxndr/Development/qe=
mu/general-fuzz/build/../hw/net/e1000e_core.c:1709:9
      #146 0x55561319680b in e1000e_nc_receive_iov /home/alxndr/Development=
/qemu/general-fuzz/build/../hw/net/e1000e.c:213:12
      #147 0x555612812581 in net_tx_pkt_sendv /home/alxndr/Development/qemu=
/general-fuzz/build/../hw/net/net_tx_pkt.c:556:9
      #148 0x55561280fbc8 in net_tx_pkt_send /home/alxndr/Development/qemu/=
general-fuzz/build/../hw/net/net_tx_pkt.c:633:9
      #149 0x555612813f38 in net_tx_pkt_send_loopback /home/alxndr/Developm=
ent/qemu/general-fuzz/build/../hw/net/net_tx_pkt.c:646:11
      #150 0x5556133f8c07 in e1000e_tx_pkt_send /home/alxndr/Development/qe=
mu/general-fuzz/build/../hw/net/e1000e_core.c:664:16
      #151 0x5556133f5359 in e1000e_process_tx_desc /home/alxndr/Developmen=
t/qemu/general-fuzz/build/../hw/net/e1000e_core.c:743:17
      #152 0x5556133f302f in e1000e_start_xmit /home/alxndr/Development/qem=
u/general-fuzz/build/../hw/net/e1000e_core.c:934:9
      #153 0x5556133daba8 in e1000e_set_tctl /home/alxndr/Development/qemu/=
general-fuzz/build/../hw/net/e1000e_core.c:2431:9
      #154 0x55561339901b in e1000e_core_write /home/alxndr/Development/qem=
u/general-fuzz/build/../hw/net/e1000e_core.c:3265:9
      #155 0x555613190f26 in e1000e_mmio_write /home/alxndr/Development/qem=
u/general-fuzz/build/../hw/net/e1000e.c:109:5
      #156 0x55561508ade0 in memory_region_write_accessor /home/alxndr/Deve=
lopment/qemu/general-fuzz/build/../softmmu/memory.c:483:5
      #157 0x55561508a2bd in access_with_adjusted_size /home/alxndr/Develop=
ment/qemu/general-fuzz/build/../softmmu/memory.c:544:18
      #158 0x555615087f70 in memory_region_dispatch_write /home/alxndr/Deve=
lopment/qemu/general-fuzz/build/../softmmu/memory.c:1466:16
      #159 0x555614ce68a6 in flatview_write_continue /home/alxndr/Developme=
nt/qemu/general-fuzz/build/../exec.c:3176:23
      #160 0x555614ccf878 in flatview_write /home/alxndr/Development/qemu/g=
eneral-fuzz/build/../exec.c:3216:14
      #161 0x555614ccf3a8 in address_space_write /home/alxndr/Development/q=
emu/general-fuzz/build/../exec.c:3308:18
      #162 0x555614ccfc40 in address_space_rw /home/alxndr/Development/qemu=
/general-fuzz/build/../exec.c:3318:16
      #163 0x5556133b76c7 in dma_memory_rw_relaxed /home/alxndr/Development=
/qemu/general-fuzz/include/sysemu/dma.h:87:18
      #164 0x5556133b6ff5 in dma_memory_rw /home/alxndr/Development/qemu/ge=
neral-fuzz/include/sysemu/dma.h:110:12
      #165 0x5556133b6f3d in pci_dma_rw /home/alxndr/Development/qemu/gener=
al-fuzz/include/hw/pci/pci.h:790:5
      #166 0x5556133b526a in pci_dma_write /home/alxndr/Development/qemu/ge=
neral-fuzz/include/hw/pci/pci.h:803:12
      #167 0x5556133b403f in e1000e_write_to_rx_buffers /home/alxndr/Develo=
pment/qemu/general-fuzz/build/../hw/net/e1000e_core.c:1412:9
      #168 0x555613393bae in e1000e_write_packet_to_guest /home/alxndr/Deve=
lopment/qemu/general-fuzz/build/../hw/net/e1000e_core.c:1582:21
      #169 0x55561338e419 in e1000e_receive_iov /home/alxndr/Development/qe=
mu/general-fuzz/build/../hw/net/e1000e_core.c:1709:9
      #170 0x55561319680b in e1000e_nc_receive_iov /home/alxndr/Development=
/qemu/general-fuzz/build/../hw/net/e1000e.c:213:12
      #171 0x555612812581 in net_tx_pkt_sendv /home/alxndr/Development/qemu=
/general-fuzz/build/../hw/net/net_tx_pkt.c:556:9
      #172 0x55561280fbc8 in net_tx_pkt_send /home/alxndr/Development/qemu/=
general-fuzz/build/../hw/net/net_tx_pkt.c:633:9
      #173 0x555612813f38 in net_tx_pkt_send_loopback /home/alxndr/Developm=
ent/qemu/general-fuzz/build/../hw/net/net_tx_pkt.c:646:11
      #174 0x5556133f8c07 in e1000e_tx_pkt_send /home/alxndr/Development/qe=
mu/general-fuzz/build/../hw/net/e1000e_core.c:664:16
      #175 0x5556133f5359 in e1000e_process_tx_desc /home/alxndr/Developmen=
t/qemu/general-fuzz/build/../hw/net/e1000e_core.c:743:17
      #176 0x5556133f302f in e1000e_start_xmit /home/alxndr/Development/qem=
u/general-fuzz/build/../hw/net/e1000e_core.c:934:9
      #177 0x5556133daba8 in e1000e_set_tctl /home/alxndr/Development/qemu/=
general-fuzz/build/../hw/net/e1000e_core.c:2431:9
      #178 0x55561339901b in e1000e_core_write /home/alxndr/Development/qem=
u/general-fuzz/build/../hw/net/e1000e_core.c:3265:9
      #179 0x555613190f26 in e1000e_mmio_write /home/alxndr/Development/qem=
u/general-fuzz/build/../hw/net/e1000e.c:109:5
      #180 0x55561508ade0 in memory_region_write_accessor /home/alxndr/Deve=
lopment/qemu/general-fuzz/build/../softmmu/memory.c:483:5
      #181 0x55561508a2bd in access_with_adjusted_size /home/alxndr/Develop=
ment/qemu/general-fuzz/build/../softmmu/memory.c:544:18
      #182 0x555615087f70 in memory_region_dispatch_write /home/alxndr/Deve=
lopment/qemu/general-fuzz/build/../softmmu/memory.c:1466:16
      #183 0x555614ce68a6 in flatview_write_continue /home/alxndr/Developme=
nt/qemu/general-fuzz/build/../exec.c:3176:23
      #184 0x555614ccf878 in flatview_write /home/alxndr/Development/qemu/g=
eneral-fuzz/build/../exec.c:3216:14
      #185 0x555614ccf3a8 in address_space_write /home/alxndr/Development/q=
emu/general-fuzz/build/../exec.c:3308:18
      #186 0x555614ccfc40 in address_space_rw /home/alxndr/Development/qemu=
/general-fuzz/build/../exec.c:3318:16
      #187 0x5556133b76c7 in dma_memory_rw_relaxed /home/alxndr/Development=
/qemu/general-fuzz/include/sysemu/dma.h:87:18
      #188 0x5556133b6ff5 in dma_memory_rw /home/alxndr/Development/qemu/ge=
neral-fuzz/include/sysemu/dma.h:110:12
      #189 0x5556133b6f3d in pci_dma_rw /home/alxndr/Development/qemu/gener=
al-fuzz/include/hw/pci/pci.h:790:5
      #190 0x5556133b526a in pci_dma_write /home/alxndr/Development/qemu/ge=
neral-fuzz/include/hw/pci/pci.h:803:12
      #191 0x5556133b403f in e1000e_write_to_rx_buffers /home/alxndr/Develo=
pment/qemu/general-fuzz/build/../hw/net/e1000e_core.c:1412:9
      #192 0x555613393bae in e1000e_write_packet_to_guest /home/alxndr/Deve=
lopment/qemu/general-fuzz/build/../hw/net/e1000e_core.c:1582:21
      #193 0x55561338e419 in e1000e_receive_iov /home/alxndr/Development/qe=
mu/general-fuzz/build/../hw/net/e1000e_core.c:1709:9
      #194 0x55561319680b in e1000e_nc_receive_iov /home/alxndr/Development=
/qemu/general-fuzz/build/../hw/net/e1000e.c:213:12
      #195 0x555612812581 in net_tx_pkt_sendv /home/alxndr/Development/qemu=
/general-fuzz/build/../hw/net/net_tx_pkt.c:556:9
      #196 0x55561280fbc8 in net_tx_pkt_send /home/alxndr/Development/qemu/=
general-fuzz/build/../hw/net/net_tx_pkt.c:633:9
      #197 0x555612813f38 in net_tx_pkt_send_loopback /home/alxndr/Developm=
ent/qemu/general-fuzz/build/../hw/net/net_tx_pkt.c:646:11
      #198 0x5556133f8c07 in e1000e_tx_pkt_send /home/alxndr/Development/qe=
mu/general-fuzz/build/../hw/net/e1000e_core.c:664:16
      #199 0x5556133f5359 in e1000e_process_tx_desc /home/alxndr/Developmen=
t/qemu/general-fuzz/build/../hw/net/e1000e_core.c:743:17
      #200 0x5556133f302f in e1000e_start_xmit /home/alxndr/Development/qem=
u/general-fuzz/build/../hw/net/e1000e_core.c:934:9
      #201 0x5556133daba8 in e1000e_set_tctl /home/alxndr/Development/qemu/=
general-fuzz/build/../hw/net/e1000e_core.c:2431:9
      #202 0x55561339901b in e1000e_core_write /home/alxndr/Development/qem=
u/general-fuzz/build/../hw/net/e1000e_core.c:3265:9
      #203 0x555613190f26 in e1000e_mmio_write /home/alxndr/Development/qem=
u/general-fuzz/build/../hw/net/e1000e.c:109:5
      #204 0x55561508ade0 in memory_region_write_accessor /home/alxndr/Deve=
lopment/qemu/general-fuzz/build/../softmmu/memory.c:483:5
      #205 0x55561508a2bd in access_with_adjusted_size /home/alxndr/Develop=
ment/qemu/general-fuzz/build/../softmmu/memory.c:544:18
      #206 0x555615087f70 in memory_region_dispatch_write /home/alxndr/Deve=
lopment/qemu/general-fuzz/build/../softmmu/memory.c:1466:16
      #207 0x555614ce68a6 in flatview_write_continue /home/alxndr/Developme=
nt/qemu/general-fuzz/build/../exec.c:3176:23
      #208 0x555614ccf878 in flatview_write /home/alxndr/Development/qemu/g=
eneral-fuzz/build/../exec.c:3216:14
      #209 0x555614ccf3a8 in address_space_write /home/alxndr/Development/q=
emu/general-fuzz/build/../exec.c:3308:18
      #210 0x555614ccfc40 in address_space_rw /home/alxndr/Development/qemu=
/general-fuzz/build/../exec.c:3318:16
      #211 0x5556133b76c7 in dma_memory_rw_relaxed /home/alxndr/Development=
/qemu/general-fuzz/include/sysemu/dma.h:87:18
      #212 0x5556133b6ff5 in dma_memory_rw /home/alxndr/Development/qemu/ge=
neral-fuzz/include/sysemu/dma.h:110:12
      #213 0x5556133b6f3d in pci_dma_rw /home/alxndr/Development/qemu/gener=
al-fuzz/include/hw/pci/pci.h:790:5
      #214 0x5556133b526a in pci_dma_write /home/alxndr/Development/qemu/ge=
neral-fuzz/include/hw/pci/pci.h:803:12
      #215 0x5556133b403f in e1000e_write_to_rx_buffers /home/alxndr/Develo=
pment/qemu/general-fuzz/build/../hw/net/e1000e_core.c:1412:9
      #216 0x555613393bae in e1000e_write_packet_to_guest /home/alxndr/Deve=
lopment/qemu/general-fuzz/build/../hw/net/e1000e_core.c:1582:21
      #217 0x55561338e419 in e1000e_receive_iov /home/alxndr/Development/qe=
mu/general-fuzz/build/../hw/net/e1000e_core.c:1709:9
      #218 0x55561319680b in e1000e_nc_receive_iov /home/alxndr/Development=
/qemu/general-fuzz/build/../hw/net/e1000e.c:213:12
      #219 0x555612812581 in net_tx_pkt_sendv /home/alxndr/Development/qemu=
/general-fuzz/build/../hw/net/net_tx_pkt.c:556:9
      #220 0x55561280fbc8 in net_tx_pkt_send /home/alxndr/Development/qemu/=
general-fuzz/build/../hw/net/net_tx_pkt.c:633:9
      #221 0x555612813f38 in net_tx_pkt_send_loopback /home/alxndr/Developm=
ent/qemu/general-fuzz/build/../hw/net/net_tx_pkt.c:646:11
      #222 0x5556133f8c07 in e1000e_tx_pkt_send /home/alxndr/Development/qe=
mu/general-fuzz/build/../hw/net/e1000e_core.c:664:16
      #223 0x5556133f5359 in e1000e_process_tx_desc /home/alxndr/Developmen=
t/qemu/general-fuzz/build/../hw/net/e1000e_core.c:743:17
      #224 0x5556133f302f in e1000e_start_xmit /home/alxndr/Development/qem=
u/general-fuzz/build/../hw/net/e1000e_core.c:934:9
      #225 0x5556133daba8 in e1000e_set_tctl /home/alxndr/Development/qemu/=
general-fuzz/build/../hw/net/e1000e_core.c:2431:9
      #226 0x55561339901b in e1000e_core_write /home/alxndr/Development/qem=
u/general-fuzz/build/../hw/net/e1000e_core.c:3265:9
      #227 0x555613190f26 in e1000e_mmio_write /home/alxndr/Development/qem=
u/general-fuzz/build/../hw/net/e1000e.c:109:5
      #228 0x55561508ade0 in memory_region_write_accessor /home/alxndr/Deve=
lopment/qemu/general-fuzz/build/../softmmu/memory.c:483:5
      #229 0x55561508a2bd in access_with_adjusted_size /home/alxndr/Develop=
ment/qemu/general-fuzz/build/../softmmu/memory.c:544:18
      #230 0x555615087f70 in memory_region_dispatch_write /home/alxndr/Deve=
lopment/qemu/general-fuzz/build/../softmmu/memory.c:1466:16
      #231 0x555614ce68a6 in flatview_write_continue /home/alxndr/Developme=
nt/qemu/general-fuzz/build/../exec.c:3176:23
      #232 0x555614ccf878 in flatview_write /home/alxndr/Development/qemu/g=
eneral-fuzz/build/../exec.c:3216:14
      #233 0x555614ccf3a8 in address_space_write /home/alxndr/Development/q=
emu/general-fuzz/build/../exec.c:3308:18
      #234 0x555614ccfc40 in address_space_rw /home/alxndr/Development/qemu=
/general-fuzz/build/../exec.c:3318:16
      #235 0x5556133b76c7 in dma_memory_rw_relaxed /home/alxndr/Development=
/qemu/general-fuzz/include/sysemu/dma.h:87:18
      #236 0x5556133b6ff5 in dma_memory_rw /home/alxndr/Development/qemu/ge=
neral-fuzz/include/sysemu/dma.h:110:12
      #237 0x5556133b6f3d in pci_dma_rw /home/alxndr/Development/qemu/gener=
al-fuzz/include/hw/pci/pci.h:790:5
      #238 0x5556133b526a in pci_dma_write /home/alxndr/Development/qemu/ge=
neral-fuzz/include/hw/pci/pci.h:803:12
      #239 0x5556133b403f in e1000e_write_to_rx_buffers /home/alxndr/Develo=
pment/qemu/general-fuzz/build/../hw/net/e1000e_core.c:1412:9
      #240 0x555613393bae in e1000e_write_packet_to_guest /home/alxndr/Deve=
lopment/qemu/general-fuzz/build/../hw/net/e1000e_core.c:1582:21
      #241 0x55561338e419 in e1000e_receive_iov /home/alxndr/Development/qe=
mu/general-fuzz/build/../hw/net/e1000e_core.c:1709:9
      #242 0x55561319680b in e1000e_nc_receive_iov /home/alxndr/Development=
/qemu/general-fuzz/build/../hw/net/e1000e.c:213:12
      #243 0x555612812581 in net_tx_pkt_sendv /home/alxndr/Development/qemu=
/general-fuzz/build/../hw/net/net_tx_pkt.c:556:9
      #244 0x55561280fbc8 in net_tx_pkt_send /home/alxndr/Development/qemu/=
general-fuzz/build/../hw/net/net_tx_pkt.c:633:9
      #245 0x555612813f38 in net_tx_pkt_send_loopback /home/alxndr/Developm=
ent/qemu/general-fuzz/build/../hw/net/net_tx_pkt.c:646:11
      #246 0x5556133f8c07 in e1000e_tx_pkt_send /home/alxndr/Development/qe=
mu/general-fuzz/build/../hw/net/e1000e_core.c:664:16
      #247 0x5556133f5359 in e1000e_process_tx_desc /home/alxndr/Developmen=
t/qemu/general-fuzz/build/../hw/net/e1000e_core.c:743:17
      #248 0x5556133f302f in e1000e_start_xmit /home/alxndr/Development/qem=
u/general-fuzz/build/../hw/net/e1000e_core.c:934:9
      #249 0x5556133daba8 in e1000e_set_tctl /home/alxndr/Development/qemu/=
general-fuzz/build/../hw/net/e1000e_core.c:2431:9

  0x61900006cc88 is located 8 bytes inside of 1056-byte region [0x61900006c=
c80,0x61900006d0a0)
  freed by thread T0 here:
      #0 0x5556126ce1bd in free (/home/alxndr/Development/qemu/general-fuzz=
/build/qemu-system-i386+0x2d291bd)
      #1 0x555613e2af31 in net_rx_pkt_iovec_realloc /home/alxndr/Developmen=
t/qemu/general-fuzz/build/../hw/net/net_rx_pkt.c:80:9
      #2 0x555613e18eaa in net_rx_pkt_pull_data /home/alxndr/Development/qe=
mu/general-fuzz/build/../hw/net/net_rx_pkt.c:103:9
      #3 0x555613e1b5cd in net_rx_pkt_attach_iovec_ex /home/alxndr/Developm=
ent/qemu/general-fuzz/build/../hw/net/net_rx_pkt.c:158:5
      #4 0x55561338da6e in e1000e_receive_iov /home/alxndr/Development/qemu=
/general-fuzz/build/../hw/net/e1000e_core.c:1695:5
      #5 0x55561319680b in e1000e_nc_receive_iov /home/alxndr/Development/q=
emu/general-fuzz/build/../hw/net/e1000e.c:213:12
      #6 0x555612812581 in net_tx_pkt_sendv /home/alxndr/Development/qemu/g=
eneral-fuzz/build/../hw/net/net_tx_pkt.c:556:9
      #7 0x55561280fbc8 in net_tx_pkt_send /home/alxndr/Development/qemu/ge=
neral-fuzz/build/../hw/net/net_tx_pkt.c:633:9
      #8 0x555612813f38 in net_tx_pkt_send_loopback /home/alxndr/Developmen=
t/qemu/general-fuzz/build/../hw/net/net_tx_pkt.c:646:11
      #9 0x5556133f8c07 in e1000e_tx_pkt_send /home/alxndr/Development/qemu=
/general-fuzz/build/../hw/net/e1000e_core.c:664:16
      #10 0x5556133f5359 in e1000e_process_tx_desc /home/alxndr/Development=
/qemu/general-fuzz/build/../hw/net/e1000e_core.c:743:17
      #11 0x5556133f302f in e1000e_start_xmit /home/alxndr/Development/qemu=
/general-fuzz/build/../hw/net/e1000e_core.c:934:9
      #12 0x5556133daba8 in e1000e_set_tctl /home/alxndr/Development/qemu/g=
eneral-fuzz/build/../hw/net/e1000e_core.c:2431:9
      #13 0x55561339901b in e1000e_core_write /home/alxndr/Development/qemu=
/general-fuzz/build/../hw/net/e1000e_core.c:3265:9
      #14 0x555613190f26 in e1000e_mmio_write /home/alxndr/Development/qemu=
/general-fuzz/build/../hw/net/e1000e.c:109:5
      #15 0x55561508ade0 in memory_region_write_accessor /home/alxndr/Devel=
opment/qemu/general-fuzz/build/../softmmu/memory.c:483:5
      #16 0x55561508a2bd in access_with_adjusted_size /home/alxndr/Developm=
ent/qemu/general-fuzz/build/../softmmu/memory.c:544:18
      #17 0x555615087f70 in memory_region_dispatch_write /home/alxndr/Devel=
opment/qemu/general-fuzz/build/../softmmu/memory.c:1466:16
      #18 0x555614ce68a6 in flatview_write_continue /home/alxndr/Developmen=
t/qemu/general-fuzz/build/../exec.c:3176:23
      #19 0x555614ccf878 in flatview_write /home/alxndr/Development/qemu/ge=
neral-fuzz/build/../exec.c:3216:14
      #20 0x555614ccf3a8 in address_space_write /home/alxndr/Development/qe=
mu/general-fuzz/build/../exec.c:3308:18
      #21 0x555614ccfc40 in address_space_rw /home/alxndr/Development/qemu/=
general-fuzz/build/../exec.c:3318:16
      #22 0x5556133b76c7 in dma_memory_rw_relaxed /home/alxndr/Development/=
qemu/general-fuzz/include/sysemu/dma.h:87:18
      #23 0x5556133b6ff5 in dma_memory_rw /home/alxndr/Development/qemu/gen=
eral-fuzz/include/sysemu/dma.h:110:12
      #24 0x5556133b6f3d in pci_dma_rw /home/alxndr/Development/qemu/genera=
l-fuzz/include/hw/pci/pci.h:790:5
      #25 0x5556133b526a in pci_dma_write /home/alxndr/Development/qemu/gen=
eral-fuzz/include/hw/pci/pci.h:803:12
      #26 0x5556133b403f in e1000e_write_to_rx_buffers /home/alxndr/Develop=
ment/qemu/general-fuzz/build/../hw/net/e1000e_core.c:1412:9
      #27 0x555613393bae in e1000e_write_packet_to_guest /home/alxndr/Devel=
opment/qemu/general-fuzz/build/../hw/net/e1000e_core.c:1582:21
      #28 0x55561338e419 in e1000e_receive_iov /home/alxndr/Development/qem=
u/general-fuzz/build/../hw/net/e1000e_core.c:1709:9
      #29 0x55561319680b in e1000e_nc_receive_iov /home/alxndr/Development/=
qemu/general-fuzz/build/../hw/net/e1000e.c:213:12

  previously allocated by thread T0 here:
      #0 0x5556126ce43d in malloc (/home/alxndr/Development/qemu/general-fu=
zz/build/qemu-system-i386+0x2d2943d)
      #1 0x7fc45f5171b8 in g_malloc (/usr/lib/x86_64-linux-gnu/libglib-2.0.=
so.0+0x561b8)
      #2 0x555613e18eaa in net_rx_pkt_pull_data /home/alxndr/Development/qe=
mu/general-fuzz/build/../hw/net/net_rx_pkt.c:103:9
      #3 0x555613e1b5cd in net_rx_pkt_attach_iovec_ex /home/alxndr/Developm=
ent/qemu/general-fuzz/build/../hw/net/net_rx_pkt.c:158:5
      #4 0x55561338da6e in e1000e_receive_iov /home/alxndr/Development/qemu=
/general-fuzz/build/../hw/net/e1000e_core.c:1695:5
      #5 0x55561319680b in e1000e_nc_receive_iov /home/alxndr/Development/q=
emu/general-fuzz/build/../hw/net/e1000e.c:213:12
      #6 0x555612812581 in net_tx_pkt_sendv /home/alxndr/Development/qemu/g=
eneral-fuzz/build/../hw/net/net_tx_pkt.c:556:9
      #7 0x55561280fbc8 in net_tx_pkt_send /home/alxndr/Development/qemu/ge=
neral-fuzz/build/../hw/net/net_tx_pkt.c:633:9
      #8 0x555612813f38 in net_tx_pkt_send_loopback /home/alxndr/Developmen=
t/qemu/general-fuzz/build/../hw/net/net_tx_pkt.c:646:11
      #9 0x5556133f8c07 in e1000e_tx_pkt_send /home/alxndr/Development/qemu=
/general-fuzz/build/../hw/net/e1000e_core.c:664:16
      #10 0x5556133f5359 in e1000e_process_tx_desc /home/alxndr/Development=
/qemu/general-fuzz/build/../hw/net/e1000e_core.c:743:17
      #11 0x5556133f302f in e1000e_start_xmit /home/alxndr/Development/qemu=
/general-fuzz/build/../hw/net/e1000e_core.c:934:9
      #12 0x5556133daba8 in e1000e_set_tctl /home/alxndr/Development/qemu/g=
eneral-fuzz/build/../hw/net/e1000e_core.c:2431:9
      #13 0x55561339901b in e1000e_core_write /home/alxndr/Development/qemu=
/general-fuzz/build/../hw/net/e1000e_core.c:3265:9
      #14 0x555613190f26 in e1000e_mmio_write /home/alxndr/Development/qemu=
/general-fuzz/build/../hw/net/e1000e.c:109:5
      #15 0x55561508ade0 in memory_region_write_accessor /home/alxndr/Devel=
opment/qemu/general-fuzz/build/../softmmu/memory.c:483:5
      #16 0x55561508a2bd in access_with_adjusted_size /home/alxndr/Developm=
ent/qemu/general-fuzz/build/../softmmu/memory.c:544:18
      #17 0x555615087f70 in memory_region_dispatch_write /home/alxndr/Devel=
opment/qemu/general-fuzz/build/../softmmu/memory.c:1466:16
      #18 0x555614ce68a6 in flatview_write_continue /home/alxndr/Developmen=
t/qemu/general-fuzz/build/../exec.c:3176:23
      #19 0x555614ccf878 in flatview_write /home/alxndr/Development/qemu/ge=
neral-fuzz/build/../exec.c:3216:14
      #20 0x555614ccf3a8 in address_space_write /home/alxndr/Development/qe=
mu/general-fuzz/build/../exec.c:3308:18
      #21 0x555614ccfc40 in address_space_rw /home/alxndr/Development/qemu/=
general-fuzz/build/../exec.c:3318:16
      #22 0x5556133b76c7 in dma_memory_rw_relaxed /home/alxndr/Development/=
qemu/general-fuzz/include/sysemu/dma.h:87:18
      #23 0x5556133b6ff5 in dma_memory_rw /home/alxndr/Development/qemu/gen=
eral-fuzz/include/sysemu/dma.h:110:12
      #24 0x5556133b6f3d in pci_dma_rw /home/alxndr/Development/qemu/genera=
l-fuzz/include/hw/pci/pci.h:790:5
      #25 0x5556133b526a in pci_dma_write /home/alxndr/Development/qemu/gen=
eral-fuzz/include/hw/pci/pci.h:803:12
      #26 0x5556133b403f in e1000e_write_to_rx_buffers /home/alxndr/Develop=
ment/qemu/general-fuzz/build/../hw/net/e1000e_core.c:1412:9
      #27 0x555613393bae in e1000e_write_packet_to_guest /home/alxndr/Devel=
opment/qemu/general-fuzz/build/../hw/net/e1000e_core.c:1582:21
      #28 0x55561338e419 in e1000e_receive_iov /home/alxndr/Development/qem=
u/general-fuzz/build/../hw/net/e1000e_core.c:1709:9
      #29 0x55561319680b in e1000e_nc_receive_iov /home/alxndr/Development/=
qemu/general-fuzz/build/../hw/net/e1000e.c:213:12

  SUMMARY: AddressSanitizer: heap-use-after-free /home/alxndr/Development/q=
emu/general-fuzz/build/../hw/net/e1000e_core.c:1587:41 in e1000e_write_pack=
et_to_guest
  Shadow bytes around the buggy address:
    0x0c3280005940: fd fd fd fd fd fd fd fd fd fd fd fd fd fd fd fd
    0x0c3280005950: fd fd fd fd fd fd fd fd fd fd fd fd fd fd fd fd
    0x0c3280005960: fd fd fd fd fd fd fd fd fd fd fd fd fd fd fd fd
    0x0c3280005970: fd fd fa fa fa fa fa fa fa fa fa fa fa fa fa fa
    0x0c3280005980: fa fa fa fa fa fa fa fa fa fa fa fa fa fa fa fa
  =3D>0x0c3280005990: fd[fd]fd fd fd fd fd fd fd fd fd fd fd fd fd fd
    0x0c32800059a0: fd fd fd fd fd fd fd fd fd fd fd fd fd fd fd fd
    0x0c32800059b0: fd fd fd fd fd fd fd fd fd fd fd fd fd fd fd fd
    0x0c32800059c0: fd fd fd fd fd fd fd fd fd fd fd fd fd fd fd fd
    0x0c32800059d0: fd fd fd fd fd fd fd fd fd fd fd fd fd fd fd fd
    0x0c32800059e0: fd fd fd fd fd fd fd fd fd fd fd fd fd fd fd fd
  Shadow byte legend (one shadow byte represents 8 application bytes):
    Addressable:           00
    Partially addressable: 01 02 03 04 05 06 07 =

    Heap left redzone:       fa
    Freed heap region:       fd
    Stack left redzone:      f1
    Stack mid redzone:       f2
    Stack right redzone:     f3
    Stack after return:      f5
    Stack use after scope:   f8
    Global redzone:          f9
    Global init order:       f6
    Poisoned by user:        f7
    Container overflow:      fc
    Array cookie:            ac
    Intra object redzone:    bb
    ASan internal:           fe
    Left alloca redzone:     ca
    Right alloca redzone:    cb
    Shadow gap:              cc
  =3D=3D935641=3D=3DABORTING

  -Alex

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1892978/+subscriptions

