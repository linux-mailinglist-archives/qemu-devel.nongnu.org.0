Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0100F367CEF
	for <lists+qemu-devel@lfdr.de>; Thu, 22 Apr 2021 10:52:55 +0200 (CEST)
Received: from localhost ([::1]:59416 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lZV4w-0005gb-23
	for lists+qemu-devel@lfdr.de; Thu, 22 Apr 2021 04:52:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55020)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lZV3Q-0004oD-8y
 for qemu-devel@nongnu.org; Thu, 22 Apr 2021 04:51:20 -0400
Received: from indium.canonical.com ([91.189.90.7]:53380)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lZV3M-0003eA-KO
 for qemu-devel@nongnu.org; Thu, 22 Apr 2021 04:51:19 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1lZV3J-0001lf-JK
 for <qemu-devel@nongnu.org>; Thu, 22 Apr 2021 08:51:13 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 8E6982E8050
 for <qemu-devel@nongnu.org>; Thu, 22 Apr 2021 08:51:13 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Thu, 22 Apr 2021 08:45:28 -0000
From: Thomas Huth <1849894@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Incomplete; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: baryluk th-huth
X-Launchpad-Bug-Reporter: Witold Baryluk (baryluk)
X-Launchpad-Bug-Modifier: Thomas Huth (th-huth)
References: <157203451253.3372.9480827920211406597.malonedeb@gac.canonical.com>
Message-Id: <161908112889.31919.3605805015603484769.malone@soybean.canonical.com>
Subject: [Bug 1849894] Re: hw/scsi/scsi-disk.c line 2554 allocation overflow
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="1552fceb1603b3da6cfa437575d9c9fc4b2e683a"; Instance="production"
X-Launchpad-Hash: 603cc1508d8cad5e7b223a870e5e8dc726abd006
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
Reply-To: Bug 1849894 <1849894@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The QEMU project is currently considering to move its bug tracking to
another system. For this we need to know which bugs are still valid
and which could be closed already. Thus we are setting older bugs to
"Incomplete" now.

If you still think this bug report here is valid, then please switch
the state back to "New" within the next 60 days, otherwise this report
will be marked as "Expired". Or please mark it as "Fix Released" if
the problem has been solved with a newer version of QEMU already.

Thank you and sorry for the inconvenience.


** Changed in: qemu
       Status: New =3D> Incomplete

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1849894

Title:
  hw/scsi/scsi-disk.c line 2554 allocation overflow

Status in QEMU:
  Incomplete

Bug description:
  When compiling qemu from git master (at commit
  03bf012e523ecdf047ac56b2057950247256064d ) on Linux amd64, with gcc-9
  9.2.1 , and using `-march=3Dnative -flto`, during linking of most target
  binaries, compiler does detect an issue with allocation in
  scsi_disk_new_request_dump and aborts compilation.

  =

  make[1]: Entering directory '/home/user/qemu/slirp'
  make[1]: Nothing to be done for 'all'.
  make[1]: Leaving directory '/home/user/qemu/slirp'
  nm: stats64.o: no symbols
    LINK    aarch64-softmmu/qemu-system-aarch64
  In function =E2=80=98scsi_disk_new_request_dump=E2=80=99,
      inlined from =E2=80=98scsi_new_request=E2=80=99 at hw/scsi/scsi-disk.=
c:2580:9,
      inlined from =E2=80=98scsi_new_request=E2=80=99 at hw/scsi/scsi-disk.=
c:2564:21:
  hw/scsi/scsi-disk.c:2554:19: error: argument 1 value =E2=80=9818446744073=
709551612=E2=80=99 exceeds maximum object size 9223372036854775807 [-Werror=
=3Dalloc-size-larger-than=3D]
  hw/scsi/scsi-disk.c: In function =E2=80=98scsi_new_request=E2=80=99:
  /usr/include/glib-2.0/glib/gmem.h:78:10: note: in a call to allocation fu=
nction =E2=80=98g_malloc=E2=80=99 declared here
     78 | gpointer g_malloc         (gsize  n_bytes) G_GNUC_MALLOC G_GNUC_A=
LLOC_SIZE(1);
        |          ^
  lto1: all warnings being treated as errors
  lto-wrapper: fatal error: c++ returned 1 exit status
  compilation terminated.
  /usr/bin/ld: error: lto-wrapper failed
  collect2: error: ld returned 1 exit status


  same happens for most other targets: alpha-softmmu/qemu-system-alpha
  arm-softmmu/qemu-system-arm hppa-softmmu/qemu-system-hppa i386-softmmu
  /qemu-system-i386 lm32-softmmu/qemu-system-lm32 mips-softmmu/qemu-
  system-mips mips64-softmmu/qemu-system-mips64 mips64el-softmmu/qemu-
  system-mips64el mipsel-softmmu/qemu-system-mipsel ppc-softmmu/qemu-
  system-ppc ppc64-softmmu/qemu-system-ppc64 riscv32-softmmu/qemu-
  system-riscv32 riscv64-softmmu/qemu-system-riscv64 s390x-softmmu/qemu-
  system-s390x sh4-softmmu/qemu-system-sh4 sh4eb-softmmu/qemu-system-
  sh4eb sparc-softmmu/qemu-system-sparc sparc64-softmmu/qemu-system-
  sparc64 x86_64-softmmu/qemu-system-x86_64 xtensa-softmmu/qemu-system-
  xtensa xtensaeb-softmmu/qemu-system-xtensaeb

  Notice -softmmu being a common factor here.


  The size of the allocation for the temporary buffer for dumping using
  snprintf is determined based on the size of the buffer via call to
  scsi_cdb_length. I believe the heavy inlining and constant propagation
  makes scsi_cdb_length return -1, so len =3D -1. Then allocation size is
  5*len + 1, or -4. Which overflows to 2^64 - 4 or so.

  The case of len=3D=3D-1 from scsi_cdb_length happens if the (buf[0] >> 5)
  is not 0, 1, 2, 4 or 5.

  However, I can't find out how gcc figures out that buf[0] is not one
  of these variables. To me looking at this function, compiler should
  not know anything about buf[0].

  I tried following the chain of calls back, including devirtualize
  alloc_req, and I found scsi_device_alloc_req calling these alloc_req
  callbacks, but it is itself called from scsi_req_new, which is called
  in  get_scsi_requests , just after buf is filled from QEMUFile using
  qemu_get_buffer, which ultimately goes even further into read paths,
  which there might be many AFAIK.


  =

  glib2 version 2.62.1-1

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1849894/+subscriptions

