Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 104A94E6055
	for <lists+qemu-devel@lfdr.de>; Thu, 24 Mar 2022 09:28:58 +0100 (CET)
Received: from localhost ([::1]:41076 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nXIq1-000667-2c
	for lists+qemu-devel@lfdr.de; Thu, 24 Mar 2022 04:28:57 -0400
Received: from eggs.gnu.org ([209.51.188.92]:52152)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1nXIhl-0005wI-8j
 for qemu-devel@nongnu.org; Thu, 24 Mar 2022 04:20:26 -0400
Received: from mout.kundenserver.de ([212.227.126.135]:33155)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1nXIhi-0003MC-Uc
 for qemu-devel@nongnu.org; Thu, 24 Mar 2022 04:20:24 -0400
Received: from quad ([82.142.12.150]) by mrelayeu.kundenserver.de (mreue011
 [212.227.15.167]) with ESMTPSA (Nemesis) id 1MkHd3-1nvrpK0SDJ-00kewd; Thu, 24
 Mar 2022 09:20:19 +0100
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Subject: [PULL 00/10] Linux user for 7.0 patches
Date: Thu, 24 Mar 2022 09:20:06 +0100
Message-Id: <20220324082016.3463521-1-laurent@vivier.eu>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:SpwYUK+BoUZYy1poxdDSau6tVGfYh2ndpVTX33IYbOJwOSlQu4Z
 TS6H/PZS5rwFVJKMhZsETz4vI/GIwPu1z6LwAPlZFgu9XqohFZ205Xn6Ky678Hj38yucODD
 u0y+acm4wy9znJNAVcSr9C2qjxM2WjuXAP6kM6j0cP2k63kOWXIaPUl9J3szHFjKSHCvucQ
 EGq5jUcz35akk6K/N6odA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:m55+vPNvbMc=:8n0VtI55vrHrrqEx0dmczi
 x+5xRFAbg1mhOuvN6tWldlPo2ATlcDvsMoCfIGG4aW6aZLwFeaJ8O5v19pFGP0+QYiPcwf5/+
 Aa7q5fQmkSqLxab8ElvtjD/fAns2LwkXgX83CUspYhDdb2Ia90m1IUxgAbewbVPurJxJGWnEh
 djFmiz039zncUjrqQpONuBzhqAOJkT4sA+Zmr++EUD+F0w/jpxl5mtdTp2vML34ueQ7HYFAYr
 tR7gqwrPGe1FW5jmnZMUu5htmKf7rQC6DIYbt1pOzyqR1shFGZ9stBsd/igqPwo4S3NQzScEc
 s7cdIGcKZbeaXlWFlp7Tfcgtk0LoX+NCeuryvtdHyBqC9mvDz2dPFOnBH3QWYOPr4u2k//xPM
 63PbeMdzJ4wwMfwgXlfeHGVyEZhGmkpMciUhZ/lb+9+M2fwYjE26TwSsC82PVed8QZLlueAbg
 ijxT92a2tDQoS/HksjGhC+irLBN27zkggFHtTZlULVdjrnr0QNTkNg0pTLWIMSVfwGRv9Hxvv
 WDDogvyHjEBEKzUnWjmk8GmCx3ylMPLBPSkbzGLSNCL9Lc4UaWaHLR3CmmG9frEf0cBZsc6uS
 7E9xyTD12IKmW0pHaKk+2GJocaR0RDpwVbF5CkoDaMUK+osJvQFbW3NJi739RJBBYlhiMaEdj
 3dClG38S+meiJcGNlvZHGmishhRMC1LQrgbbjVcI24O+apoCONEjTDWslpFumsqi+ebQ=
Received-SPF: none client-ip=212.227.126.135; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The following changes since commit 48fb0a826eea2e7b0135f49e7fa63e7efe2b7677=
:=0D
=0D
  Merge tag 'for-upstream' of https://gitlab.com/bonzini/qemu into staging =
(2022-03-21 21:27:14 +0000)=0D
=0D
are available in the Git repository at:=0D
=0D
  https://gitlab.com/laurent_vivier/qemu.git tags/linux-user-for-7.0-pull-r=
equest=0D
=0D
for you to fetch changes up to 330ea9d1d819680ac7501457220b8cd1c29f9d2f:=0D
=0D
  linux-user/arm: Implement __kernel_cmpxchg64 with host atomics (2022-03-2=
3 16:53:17 +0100)=0D
=0D
----------------------------------------------------------------=0D
linux-user pull request 20220324=0D
=0D
Fix MIPS n32=0D
Fix ppoll, epoll_wait, pselect=0D
Fix error message in elfload.c=0D
Implement ARM __kernel_memory_barrier/__kernel_cmpxchg/__kernel_cmpxchg64=0D
=0D
----------------------------------------------------------------=0D
=0D
Fergus Henderson (1):=0D
  linux-user: Fix missing space in error message=0D
=0D
Richard Henderson (8):=0D
  linux-user/alpha: Fix sigsuspend for big-endian hosts=0D
  linux-user: Split out helpers for sigsuspend=0D
  linux-user: Properly handle sigset arg to pselect=0D
  linux-user: Properly handle sigset arg to epoll_pwait=0D
  linux-user: Properly handle sigset arg to ppoll=0D
  linux-user/arm: Implement __kernel_memory_barrier=0D
  linux-user/arm: Implement __kernel_cmpxchg with host atomics=0D
  linux-user/arm: Implement __kernel_cmpxchg64 with host atomics=0D
=0D
WANG Xuerui (1):=0D
  linux-user: Fix syscall parameter handling for MIPS n32=0D
=0D
 linux-user/arm/cpu_loop.c   | 164 ++++++++++++++++++++++--------------=0D
 linux-user/elfload.c        |   2 +-=0D
 linux-user/signal-common.h  |  26 ++++++=0D
 linux-user/signal.c         |  23 +++++=0D
 linux-user/syscall.c        | 119 ++++++++++----------------=0D
 linux-user/user-internals.h |   6 +-=0D
 6 files changed, 195 insertions(+), 145 deletions(-)=0D
=0D
-- =0D
2.35.1=0D
=0D

