Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A8D2232E419
	for <lists+qemu-devel@lfdr.de>; Fri,  5 Mar 2021 10:02:20 +0100 (CET)
Received: from localhost ([::1]:40268 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lI6Lj-0007y4-7y
	for lists+qemu-devel@lfdr.de; Fri, 05 Mar 2021 04:02:19 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:52852)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lI6KM-0007NG-LS
 for qemu-devel@nongnu.org; Fri, 05 Mar 2021 04:00:54 -0500
Received: from indium.canonical.com ([91.189.90.7]:33856)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lI6KK-0007V3-Hy
 for qemu-devel@nongnu.org; Fri, 05 Mar 2021 04:00:54 -0500
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1lI6KI-0007D4-Nd
 for <qemu-devel@nongnu.org>; Fri, 05 Mar 2021 09:00:50 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id AEE1E2E806D
 for <qemu-devel@nongnu.org>; Fri,  5 Mar 2021 09:00:50 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Fri, 05 Mar 2021 08:54:08 -0000
From: Dantali0n <1916655@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Invalid; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: dantalion jnsnow
X-Launchpad-Bug-Reporter: Dantali0n (dantalion)
X-Launchpad-Bug-Modifier: Dantali0n (dantalion)
References: <161411327241.7209.12340035841972797663.malonedeb@gac.canonical.com>
Message-Id: <161493444841.3879.17625370083131816972.malone@soybean.canonical.com>
Subject: [Bug 1916655] Re: Compilation fails due to zstd qcow2 compression
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="fc09074b06b3b9178bd28175bdab646b3b5abfce"; Instance="production"
X-Launchpad-Hash: f3fdf5d7c00668f922260c8e6e3f79a67118085c
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
Reply-To: Bug 1916655 <1916655@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Seems I had an old version (1.3.5) of zstd floating around in
/usr/local. Consider this issue resolved.

** Changed in: qemu
       Status: New =3D> Invalid

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1916655

Title:
  Compilation fails due to zstd qcow2 compression

Status in QEMU:
  Invalid

Bug description:
  Compilation of QEMU fails when using recent versions of zstd.

  I use the following commands to compile QEMU:
  $ mkdir build
  $ cd build
  $ ../configure --enable-debug --target-list=3Dx86_64-softmmu
  $ make -j $(nproc)

  Here is a paste from the ../configure output:
  https://paste.ubuntu.com/p/dHsWzGV7TH/

  And one from the make output:
  https://paste.ubuntu.com/p/89qKk4NrFz/

  In short the error boils down to:
  ../block/qcow2-threads.c: In function =E2=80=98qcow2_zstd_compress=E2=80=
=99:
  ../block/qcow2-threads.c:225:16: error: implicit declaration of function =
=E2=80=98ZSTD_compressStream2=E2=80=99; did you mean =E2=80=98ZSTD_compress=
Stream=E2=80=99? [-Werror=3Dimplicit-function-declaration]
    225 |     zstd_ret =3D ZSTD_compressStream2(cctx, &output, &input, ZSTD=
_e_end);
        |                ^~~~~~~~~~~~~~~~~~~~
        |                ZSTD_compressStream
  ../block/qcow2-threads.c:225:16: error: nested extern declaration of =E2=
=80=98ZSTD_compressStream2=E2=80=99 [-Werror=3Dnested-externs]
  ../block/qcow2-threads.c:225:60: error: =E2=80=98ZSTD_e_end=E2=80=99 unde=
clared (first use in this function)
    225 |     zstd_ret =3D ZSTD_compressStream2(cctx, &output, &input, ZSTD=
_e_end);
        |

  System info:
  QEMU commit: 7ef8134565dccf9186d5eabd7dbb4ecae6dead87 (from Github)
  Kernel: 5.10.15
  zstd: 1.4.8

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1916655/+subscriptions

