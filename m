Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 279D3377D83
	for <lists+qemu-devel@lfdr.de>; Mon, 10 May 2021 09:53:33 +0200 (CEST)
Received: from localhost ([::1]:33920 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lg0jM-00062P-8i
	for lists+qemu-devel@lfdr.de; Mon, 10 May 2021 03:53:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42928)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lg0gb-0007zV-9w
 for qemu-devel@nongnu.org; Mon, 10 May 2021 03:50:41 -0400
Received: from indium.canonical.com ([91.189.90.7]:50344)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lg0gZ-0004rs-Bn
 for qemu-devel@nongnu.org; Mon, 10 May 2021 03:50:41 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.93 #5 (Debian))
 id 1lg0gX-0001MQ-7n
 for <qemu-devel@nongnu.org>; Mon, 10 May 2021 07:50:37 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 24DC92E818A
 for <qemu-devel@nongnu.org>; Mon, 10 May 2021 07:50:37 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Mon, 10 May 2021 07:44:18 -0000
From: Thomas Huth <1866892@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Expired; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: mhodog pmaydell rth th-huth
X-Launchpad-Bug-Reporter: Robert Henry (mhodog)
X-Launchpad-Bug-Modifier: Thomas Huth (th-huth)
References: <158386917575.11737.1131406657888792626.malonedeb@soybean.canonical.com>
Message-Id: <162063265813.16269.2268870645117383726.malone@soybean.canonical.com>
Subject: [Bug 1866892] Re: guest OS catches a page fault bug when running
 dotnet
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="dccd804998035922efb3da0a725ecc923e2255f3"; Instance="production"
X-Launchpad-Hash: d390dc28211f8d48646b9c51f7211d4cc6b9527b
Received-SPF: none client-ip=91.189.90.7; envelope-from=bounces@canonical.com;
 helo=indium.canonical.com
X-Spam_score_int: -66
X-Spam_score: -6.7
X-Spam_bar: ------
X-Spam_report: (-6.7 / 5.0 requ) BAYES_00=-1.9,
 HEADER_FROM_DIFFERENT_DOMAINS=0.249, RCVD_IN_DNSWL_HI=-5,
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
Reply-To: Bug 1866892 <1866892@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This is an automated cleanup. This bug report has been moved to QEMU's
new bug tracker on gitlab.com and thus gets marked as 'expired' now.
Please continue with the discussion here:

 https://gitlab.com/qemu-project/qemu/-/issues/249


** Changed in: qemu
       Status: Confirmed =3D> Expired

** Bug watch added: gitlab.com/qemu-project/qemu/-/issues #249
   https://gitlab.com/qemu-project/qemu/-/issues/249

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1866892

Title:
  guest OS catches a page  fault bug when running dotnet

Status in QEMU:
  Expired

Bug description:
  The linux guest OS catches a page fault bug when running the dotnet
  application.

  host =3D metal =3D x86_64
  host OS =3D ubuntu 19.10
  qemu emulation, without KVM, with "tiny code generator" tcg; no plugins; =
built from head/master
  guest emulation =3D x86_64
  guest OS =3D ubuntu 19.10
  guest app =3D dotnet, running any program

  qemu sha=3D7bc4d1980f95387c4cc921d7a066217ff4e42b70 (head/master Mar 10,
  2020)

  qemu invocation is:

  qemu/build/x86_64-softmmu/qemu-system-x86_64 \
    -m size=3D4096 \
    -smp cpus=3D1 \
    -machine type=3Dpc-i440fx-5.0,accel=3Dtcg \
    -cpu Skylake-Server-v1 \
    -nographic \
    -bios OVMF-pure-efi.fd \
    -drive if=3Dnone,id=3Dhd0,file=3Dubuntu-19.10-server-cloudimg-amd64.img=
 \
    -device virtio-blk,drive=3Dhd0 \
    -drive if=3Dnone,id=3Dcloud,file=3Dlinux_cloud_config.img \
    -device virtio-blk,drive=3Dcloud \
    -netdev user,id=3Duser0,hostfwd=3Dtcp::2223-:22 \
    -device virtio-net,netdev=3Duser0

  =

  Here's the guest kernel console output:

  =

  [ 2834.005449] BUG: unable to handle page fault for address: 00007fffffff=
c2c0
  [ 2834.009895] #PF: supervisor read access in user mode
  [ 2834.013872] #PF: error_code(0x0001) - permissions violation
  [ 2834.018025] IDT: 0xfffffe0000000000 (limit=3D0xfff) GDT: 0xfffffe00000=
01000 (limit=3D0x7f)
  [ 2834.022242] LDTR: NULL
  [ 2834.026306] TR: 0x40 -- base=3D0xfffffe0000003000 limit=3D0x206f
  [ 2834.030395] PGD 80000000360d0067 P4D 80000000360d0067 PUD 36105067 PMD=
 36193067 PTE 8000000076d8e867
  [ 2834.038672] Oops: 0001 [#4] SMP PTI
  [ 2834.042707] CPU: 0 PID: 13537 Comm: dotnet Tainted: G      D          =
 5.3.0-29-generic #31-Ubuntu
  [ 2834.050591] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIO=
S 0.0.0 02/06/2015
  [ 2834.054785] RIP: 0033:0x1555547eaeda
  [ 2834.059017] Code: d0 00 00 00 4c 8b a7 d8 00 00 00 4c 8b af e0 00 00 0=
0 4c 8b b7 e8 00 00 00 4c 8b bf f0 00 00 00 48 8b bf b0 00 00 00 9d 74 02 <=
48> cf 48 8d 64 24 30 5d c3 90 cc c3 66 90 55 4c 8b a7 d8 00 00 00
  [ 2834.072103] RSP: 002b:00007fffffffc2c0 EFLAGS: 00000202
  [ 2834.076507] RAX: 0000000000000000 RBX: 00001554b401af38 RCX: 000000000=
0000001
  [ 2834.080832] RDX: 0000000000000000 RSI: 0000000000000000 RDI: 00007ffff=
fffcfb0
  [ 2834.085010] RBP: 00007fffffffd730 R08: 0000000000000000 R09: 00007ffff=
fffd1b0
  [ 2834.089184] R10: 0000155555331dd5 R11: 00001555553ad8d0 R12: 000000000=
0000002
  [ 2834.093350] R13: 0000000000000001 R14: 0000000000000001 R15: 00001554b=
401d388
  [ 2834.097309] FS:  0000155554fa5740 GS:  0000000000000000
  [ 2834.101131] Modules linked in: isofs nls_iso8859_1 dm_multipath scsi_d=
h_rdac scsi_dh_emc scsi_dh_alua ppdev input_leds serio_raw parport_pc parpo=
rt sch_fq_codel ip_tables x_tables autofs4 btrfs zstd_compress raid10 raid4=
56 async_raid6_recov async_memcpy async_pq async_xor async_tx xor raid6_pq =
libcrc32c raid1 raid0 multipath linear crct10dif_pclmul crc32_pclmul ghash_=
clmulni_intel aesni_intel aes_x86_64 crypto_simd cryptd glue_helper virtio_=
net psmouse net_failover failover virtio_blk floppy
  [ 2834.122539] CR2: 00007fffffffc2c0
  [ 2834.126867] ---[ end trace dfae51f1d9432708 ]---
  [ 2834.131239] RIP: 0033:0x14d793262eda
  [ 2834.135715] Code: Bad RIP value.
  [ 2834.140243] RSP: 002b:00007ffddb4e2980 EFLAGS: 00000202
  [ 2834.144615] RAX: 0000000000000000 RBX: 000014d6f402acb8 RCX: 000000000=
0000002
  [ 2834.148943] RDX: 0000000001cd6950 RSI: 0000000000000000 RDI: 00007ffdd=
b4e3670
  [ 2834.153335] RBP: 00007ffddb4e3df0 R08: 0000000000000001 R09: 00007ffdd=
b4e3870
  [ 2834.157774] R10: 000014d793da9dd5 R11: 000014d793e258d0 R12: 000000000=
0000002
  [ 2834.162132] R13: 0000000000000001 R14: 0000000000000001 R15: 000014d6f=
402d040
  [ 2834.166239] FS:  0000155554fa5740(0000) GS:ffff97213ba00000(0000) knlG=
S:0000000000000000
  [ 2834.170529] CS:  0033 DS: 0000 ES: 0000 CR0: 0000000080050033
  [ 2834.174751] CR2: 000014d793262eb0 CR3: 0000000036130000 CR4: 000000000=
07406f0
  [ 2834.178892] PKRU: 55555554

  I run the application from a shell with `ulimit -s unlimited`
  (unlimited stack to size).

  The application creates a number of threads, and those threads make a
  lot of calls to sigaltstack() and mprotect(); see the relevant source
  for dotnet here
  https://github.com/dotnet/runtime/blob/15ec69e47b4dc56098e6058a11ccb6ae4d=
5d4fa1/src/coreclr/src/pal/src/thread/thread.cpp#L2467

  using strace -f on the app shows that no alt stacks come anywhere near
  the failing address; all alt stacks are in the heap, as expected.
  None of the mmap/mprotect/munmap syscalls were given arguments in the
  high memory 0x7fffffff0000 and up.

  gdb (with default signal stop/print/pass semantics) does not report
  any signals prior to the kernel bug being tripped, so I doubt the
  alternate signal stack is actually used.

  When I run the same dotnet binary on the host (eg, on "bare metal"),
  the host kernel seems happy and dotnet runs as expected.

  I have not tried different qemu or guest or host O/S.

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1866892/+subscriptions

