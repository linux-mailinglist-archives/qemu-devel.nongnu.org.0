Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B25B5B50AE
	for <lists+qemu-devel@lfdr.de>; Sun, 11 Sep 2022 20:41:09 +0200 (CEST)
Received: from localhost ([::1]:50208 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oXRtD-0005nG-1D
	for lists+qemu-devel@lfdr.de; Sun, 11 Sep 2022 14:41:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33168)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <deller@gmx.de>) id 1oXRXW-0002Ry-9L
 for qemu-devel@nongnu.org; Sun, 11 Sep 2022 14:18:43 -0400
Received: from mout.gmx.net ([212.227.15.15]:36243)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <deller@gmx.de>) id 1oXRXU-0002lD-7t
 for qemu-devel@nongnu.org; Sun, 11 Sep 2022 14:18:41 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1662920313;
 bh=loeDl/2mZnUDga515rEsZmw+joKNGkTHOEj5nvdr85U=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date;
 b=RdW8Ty6pjNtFKUpkEivjs/SjRcpO8B6RzRlcdHe+YqmP09ss4pm+7Qmf7dNdi86fg
 tJwCYkDG+kCGyI3DLpRsvappp+sa9yugH/8PDMYCdXb/px0KEGgOyYLJkcD+0ddVTp
 XcZO4TcK4r/HKlfYd/svp6p8QUEaG9pNpZkkaOMI=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from p100.fritz.box ([92.116.178.88]) by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MKbkM-1oloaj1c7A-00L1UX; Sun, 11
 Sep 2022 20:18:33 +0200
From: Helge Deller <deller@gmx.de>
To: qemu-devel@nongnu.org,
	Laurent Vivier <laurent@vivier.eu>
Cc: deller@gmx.de,
	Richard Henderson <richard.henderson@linaro.org>
Subject: [PATCH v2 00/12] linux-user: Add more syscalls,
 enhance tracing & logging enhancements
Date: Sun, 11 Sep 2022 20:18:18 +0200
Message-Id: <20220911181830.15851-1-deller@gmx.de>
X-Mailer: git-send-email 2.37.2
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:6JOFDJ6eTKdBUkfk3yhGdUwGAN5LANsePtkXtl4LoB7dCfo6RWm
 Bs9COHQt/Vc+H2fL8tYflXDNLmPEGKgueYcuBpFZt1BFZAoEYQ8wIt6ZLVrJIjqDGdHb1I2
 2bdeqdr6NfUUO1ghLNeVuyUH5Z30J4emuijVt7q5sdau+R8YJkJRNWri/Ediy5bHo99xQvh
 pAQ5CC6m4SeUIxBjM8Eaw==
X-UI-Out-Filterresults: notjunk:1;V03:K0:FjDmhDM/p5c=:5J49AIIBEUSqBcSZsYYLhN
 CUMXreTZWpS4wI0Wytus6TIuIlpx7/4Tj4BO18Z2O7drIz2gzykhiS8Q68nBWUvDW88e9GL6A
 /LyYG8o7lNix+00CC3GdDlY5qE8l6g2DgNJVjee1D4fOlO42vvGBCQTL4+kRUrW8Carmh4msz
 egi4fOmkjNNpL+pzwAghCXHxgdKj36F3sMdjtbYRqalmFmj2qGxdBVkG1HAKa1smD2WXYOq1k
 SxP0wkWKsphwAEq0rPJd6NXdsDIkod/JmdTiayOBbcNScJtzUVh5V52FViLwJJHE3YBdlqewn
 S+sOzp8w8N9xhlIwLgF2mA2QUkAHksnNWKbsWjEI1D4dMAWIpt5xoBG4wklFaIlGoq2mXOde0
 KCITkEeh9N3GzQTMZZWl8WsCFpRHqMrsdzTVmNJFe5/hKpMAOPI6crnIjzVP7FwG4N2/vz5tD
 LhR70TmB5NY3iQ27NFFuxN7g/WryrfF9oQmMBieG3ksrI88DJxJQA4W0mWbLz6HeG4Mth5e0I
 2nGofghqvz3tVZW2be3N6BA67+owT5yFSrioUUs38GM6AYJIwgJFUqBIT7esVBC2Gj9DkXBKy
 vvRPXf6Pdawxor++KFp3Kj1SLqqYFpGHN/6/K+35Gt1yprYu38lrewOiAtS6n5tRi3IC6/wKW
 3/UJ99yJwVeuPz2SpagqmbPiEME3ngqyGBOLGnUmTI3RHKWh4QgMcV4upNHbglK+17qoJ99uP
 rTM/gUKFyWqhryFwpUrTpR6209+/FnFWWgSLHGouhCgqmgkZpBhE//e660vQmfjrRaXRJguQE
 Q9MKB2NDv2MOR/Nz3/5fdHyrI7QFJcqxAZKpA3Jle281Lm86AsgSrXHgY4Zf4LhNGgONHCgry
 Mhok2SAQZE1VqHPEgghlxGbgnH/SbmseCDY9Kw2PHho69U7N2KHTA2IV7sRhpZMpm07treRxN
 3miQpj8+ZvGFYI4L+O5x+fTCS0MgRnJw2bmARKUZqvFdYuUEfMIZ/mP0GlafykXPxmHUdDkPn
 q2MwReZjINajSvo7sYhmMN6QrsjLhD9laStgo1lNi6Ua7OvQ277gGKpv2mW06vctoV9Gl83sT
 fQ3AUmNxBI8EYW7A2RlAQ9jT1iMC7jQdRivN6vpYuGZMA6ZEmJ2GhEJm0cMIMO17yJp30Unf7
 2rlc4=
Received-SPF: pass client-ip=212.227.15.15; envelope-from=deller@gmx.de;
 helo=mout.gmx.net
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, FREEMAIL_FROM=0.001, RCVD_IN_DNSWL_LOW=-0.7,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Here is a bunch of patches for linux-user.

Most of them add missing syscalls and enhance the tracing/logging.
Some of the patches are target-hppa specific.
I've tested those on productive hppa debian buildd servers (running qemu-u=
ser).

Thanks!
Helge

Changes to v1:
- Dropped the faccessat2() syscall patch in favour of Richard's patch
- Various changes to the "missing signals in strace output" patch based on
  Richard's feedback, e.g. static arrays, fixed usage of _NSIG, fix build =
when
  TARGET_SIGIOT does not exist
- Use FUTEX_CMD_MASK in "Show timespec on strace for futex" patch
  unconditionally and turn into a switch statement - as suggested by Richa=
rd

Helge Deller (12):
  linux-user: Add missing signals in strace output
  linux-user: Add missing clock_gettime64() syscall strace
  linux-user: Add pidfd_open(), pidfd_send_signal() and pidfd_getfd()
    syscalls
  linux-user: Log failing executable in EXCP_DUMP()
  linux-user/hppa: Use EXCP_DUMP() to show enhanced debug info
  linux-user/hppa: Dump IIR on register dump
  linux-user: Fix strace of chmod() if mode =3D=3D 0
  linux-user/hppa: Set TASK_UNMAPPED_BASE to 0xfa000000 for hppa arch
  linux-user: Add strace for clock_nanosleep()
  linux-user: Show timespec on strace for futex()
  linux-user: Add close_range() syscall
  linux-user: Add parameters of getrandom() syscall for strace

 linux-user/cpu_loop-common.h |   2 +
 linux-user/hppa/cpu_loop.c   |   6 +-
 linux-user/mmap.c            |   4 +
 linux-user/signal-common.h   |  46 ++++++++++++
 linux-user/signal.c          |  37 +--------
 linux-user/strace.c          | 142 ++++++++++++++++++++++++++++++-----
 linux-user/strace.list       |  21 +++++-
 linux-user/syscall.c         |  46 ++++++++++++
 target/hppa/helper.c         |   6 +-
 9 files changed, 251 insertions(+), 59 deletions(-)

=2D-
2.37.2


