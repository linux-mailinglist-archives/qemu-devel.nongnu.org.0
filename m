Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CE8130A2E8
	for <lists+qemu-devel@lfdr.de>; Mon,  1 Feb 2021 08:57:27 +0100 (CET)
Received: from localhost ([::1]:51374 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l6U5O-0006QA-JO
	for lists+qemu-devel@lfdr.de; Mon, 01 Feb 2021 02:57:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34068)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1l6U4O-0005Wn-62
 for qemu-devel@nongnu.org; Mon, 01 Feb 2021 02:56:24 -0500
Received: from indium.canonical.com ([91.189.90.7]:37396)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1l6U4M-0004Pv-G2
 for qemu-devel@nongnu.org; Mon, 01 Feb 2021 02:56:23 -0500
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1l6U4K-00017x-Ej
 for <qemu-devel@nongnu.org>; Mon, 01 Feb 2021 07:56:20 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 44BEB2E813C
 for <qemu-devel@nongnu.org>; Mon,  1 Feb 2021 07:56:20 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Mon, 01 Feb 2021 07:49:46 -0000
From: =?utf-8?q?Philippe_Mathieu-Daud=C3=A9?= <1890152@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=New; importance=Undecided; assignee=None;
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: a1xndr philmd
X-Launchpad-Bug-Reporter: Alexander Bulekov (a1xndr)
X-Launchpad-Bug-Modifier: =?utf-8?q?Philippe_Mathieu-Daud=C3=A9_=28philmd?=
 =?utf-8?q?=29?=
X-Launchpad-Bug-Duplicate: 1913873
References: <159646379529.16612.17835122305375886153.malonedeb@wampee.canonical.com>
Message-Id: <161216578695.15196.8852474516053795951.malone@wampee.canonical.com>
Subject: [Bug 1890152] Re: malloc 0xff0000030 bytes with vmxnet3
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="e00fb96b2e64b75333d0178ec15cb78e5aadb64d"; Instance="production"
X-Launchpad-Hash: 3b018b9cb5053748d125182ab494ac2e6083ffad
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
Reply-To: Bug 1890152 <1890152@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

*** This bug is a duplicate of bug 1913873 ***
    https://bugs.launchpad.net/bugs/1913873

Chronogically speaking #1913873 is a duplicate of #1890152...

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1890152

Title:
  malloc 0xff0000030 bytes with vmxnet3

Status in QEMU:
  New

Bug description:
  Hello,
  This reproducer causes vmxnet3 to malloc 0xff0000030 bytes

  cat << EOF | ./i386-softmmu/qemu-system-i386 \
  -device vmxnet3 -m 64 -nodefaults -qtest stdio -nographic =

  outl 0xcf8 0x80001014
  outl 0xcfc 0xe0001000
  outl 0xcf8 0x80001018
  outl 0xcf8 0x80001004
  outw 0xcfc 0x7
  write 0x0 0x1 0xe1
  write 0x1 0x1 0xfe
  write 0x2 0x1 0xbe
  write 0x3 0x1 0xba
  write 0x3e 0x1 0x05
  write 0x28 0x1 0xe1
  write 0x29 0x1 0xfe
  write 0x2a 0x1 0xff
  write 0x2b 0x1 0xff
  write 0x2c 0x1 0xff
  write 0x2d 0x1 0xff
  write 0x2e 0x1 0xff
  write 0x2f 0x1 0xff
  write 0x31c 0x1 0xff
  writeq 0xe0001020 0xef0bff5ecafe0000
  EOF


  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
  =3D=3D25727=3D=3DERROR: AddressSanitizer: allocator is out of memory tryi=
ng to allocate 0xff0000030 bytes
      #0 0x56476a43731d in malloc (/home/alxndr/Development/qemu/general-fu=
zz/build/i386-softmmu/qemu-system-i386+0x2bba31d)
      #1 0x7fca345a8500 in g_malloc (/usr/lib/x86_64-linux-gnu/libglib-2.0.=
so.0+0x54500)
      #2 0x56476c616312 in vmxnet3_activate_device /home/alxndr/Development=
/qemu/general-fuzz/hw/net/vmxnet3.c:1504:5
      #3 0x56476c6101ba in vmxnet3_handle_command /home/alxndr/Development/=
qemu/general-fuzz/hw/net/vmxnet3.c:1576:9
      #4 0x56476c60d30f in vmxnet3_io_bar1_write /home/alxndr/Development/q=
emu/general-fuzz/hw/net/vmxnet3.c:1772:9
      #5 0x56476b11d383 in memory_region_write_accessor /home/alxndr/Develo=
pment/qemu/general-fuzz/softmmu/memory.c:483:5
      #6 0x56476b11c827 in access_with_adjusted_size /home/alxndr/Developme=
nt/qemu/general-fuzz/softmmu/memory.c:544:18
      #7 0x56476b11a446 in memory_region_dispatch_write /home/alxndr/Develo=
pment/qemu/general-fuzz/softmmu/memory.c:1466:16
      #8 0x56476a4cb696 in flatview_write_continue /home/alxndr/Development=
/qemu/general-fuzz/exec.c:3176:23
      #9 0x56476a4b3eb6 in flatview_write /home/alxndr/Development/qemu/gen=
eral-fuzz/exec.c:3216:14
      #10 0x56476a4b39d7 in address_space_write /home/alxndr/Development/qe=
mu/general-fuzz/exec.c:3308:18
      #11 0x56476b1c4614 in qtest_process_command /home/alxndr/Development/=
qemu/general-fuzz/softmmu/qtest.c:452:13
      #12 0x56476b1bbc18 in qtest_process_inbuf /home/alxndr/Development/qe=
mu/general-fuzz/softmmu/qtest.c:710:9
      #13 0x56476b1ba8a5 in qtest_read /home/alxndr/Development/qemu/genera=
l-fuzz/softmmu/qtest.c:722:5
      #14 0x56476e063f03 in qemu_chr_be_write_impl /home/alxndr/Development=
/qemu/general-fuzz/chardev/char.c:188:9
      #15 0x56476e064087 in qemu_chr_be_write /home/alxndr/Development/qemu=
/general-fuzz/chardev/char.c:200:9
      #16 0x56476e078373 in fd_chr_read /home/alxndr/Development/qemu/gener=
al-fuzz/chardev/char-fd.c:68:9
      #17 0x56476e1cc734 in qio_channel_fd_source_dispatch /home/alxndr/Dev=
elopment/qemu/general-fuzz/io/channel-watch.c:84:12
      #18 0x7fca345a2897 in g_main_context_dispatch (/usr/lib/x86_64-linux-=
gnu/libglib-2.0.so.0+0x4e897)

  =

  -Alex

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1890152/+subscriptions

