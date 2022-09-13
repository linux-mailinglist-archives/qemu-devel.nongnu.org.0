Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EC7E15B7AB9
	for <lists+qemu-devel@lfdr.de>; Tue, 13 Sep 2022 21:23:03 +0200 (CEST)
Received: from localhost ([::1]:59126 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oYBUt-0003bx-4v
	for lists+qemu-devel@lfdr.de; Tue, 13 Sep 2022 15:23:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48902)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <deller@gmx.de>) id 1oYBLk-0008Cq-AY
 for qemu-devel@nongnu.org; Tue, 13 Sep 2022 15:13:36 -0400
Received: from mout.gmx.net ([212.227.17.20]:48735)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <deller@gmx.de>) id 1oYBLf-0007eZ-TL
 for qemu-devel@nongnu.org; Tue, 13 Sep 2022 15:13:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1663096404;
 bh=STpDxShYn/+awLG73O/p0IthObz/CYahAgxz89CmD3w=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date;
 b=fxodNqIs1IPiyD9tdgj+D1AtpOq5Sze7sz4kU47BFHEGuk/SR/HZd92Nm2arDjwuZ
 +vbgryXR+yn83l2v+WIojH8y3sSAqNe+Ys90nfH3D1gmlBTMm/615vD65qRcnB0/WQ
 4/hGSxUNUZ6/1iCBQYnj6+wUPLuUUFAZxoqdvZIU=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from p100.fritz.box ([92.116.190.164]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MwQXN-1pQ90j02FR-00sR5I; Tue, 13
 Sep 2022 21:13:24 +0200
From: Helge Deller <deller@gmx.de>
To: Richard Henderson <richard.henderson@linaro.org>,
 Laurent Vivier <laurent@vivier.eu>, qemu-devel@nongnu.org
Cc: deller@gmx.de
Subject: [PULL 00/12] linux-user patches
Date: Tue, 13 Sep 2022 21:13:09 +0200
Message-Id: <20220913191321.96747-1-deller@gmx.de>
X-Mailer: git-send-email 2.37.2
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:8M4IPdGJ0m0c93qQE+BnuK3s5/XTi7noFyJN+dSXNoTDTi5oRF5
 vZD5b4Rc/hS1lrhjrjNwhZZ4gMs4IFrfM5siOsnFaEemqXoUNFN8RjpBSr/Oyl8T5+4F6JI
 TZjMgVtflRcamog7Hi5UqX8oOXJ27XByLf1/Y3F/cosMqRu+bzcw+dieOKp0EJcD3tdc2Oa
 7Exg/wkwG0soDkJPXCR8w==
X-UI-Out-Filterresults: notjunk:1;V03:K0:T/ha5FMFjoU=:KWmjkojxVJusHtUZBr2vWy
 JiCKLSQ48n61plQV+GjNr3nuDgfjXFJtwnboU/rx8tdobjuCHWT2X46WnPiOJdQVdqDteNijb
 3zFvL53fhpjm9A8/HalYQkKZ1yMjjrUaJPbm0M7IWq1PEII5tqygOSEBsSJnwzgRXPfqyRYck
 lTM1ihRdVGQzzYOuh2IOCapjJVW+gU+O//8mBwbM1AANoIGVfYRrqPNxp7ABtPFtGllDvdI1O
 35G4l1eot897lDdIKXlrVHPcR5eCi/P/4NLV+C7f9JuZBKl+i9sfRidh7Udf7kOnjZUTKmWQy
 a+NXU/PI7Ow1HHC15hPaRKBltwlLzV35iVc4elUWgjbucMS63zbensi7DzSvWD9uLkPEDs6Vm
 gSXsiaMuiC+J5xgLvtDi8BztCjBPs614LQ8rreuBGfiQ8P7ShcSltnHaGjwi1t7Bx6d1r4+Lk
 q5KZLkepNn/wexAWkCzTpJxXtWgbpWFbJOpnj9NgbK5UWtWxfrCsqyT8TDc3HEwZvZIVuJM2g
 tAhweRCTQ4fJZ4bp3VafBQDr9yDeTDjsSXSzyv1JeRjG/x5zZv5DNGJ8fJbfzaMpHZ+kaWXUi
 UtYCXjwOaoRYc2VAZ9dS8HaTCkIcVqNi13rA7Uga358gM+alvLwIPYaEXql69/FPBSphgwCh6
 aD0BrwPghX5pNGQqD+uedB5t0yyX99Ozj+/R5LcqbbnLqB+mBFUSwGvzW9dAlRbPJvnQiOJcz
 J/MpfIe9PC1Sh+ow034FDkkwe8K+QRtWGQ734/S+W5t7g8xYb87yInc3DZyDlzcU9vEXc8d41
 y+psU6B4djL/diV1aAt9/iEOfNWC0MkjVLKAxPSReANozkZpY30K/cDtKJriIYfzeG38d3jtZ
 UFZl3K3E+xAcQoVcuVEzzr29GUwosedb2JR5nKTPCL3zj8/qWyoPeA/0s2NyPY3sIzmd/Jrfm
 Ohp22oBZUcRpmELGDHqH8zwoAPIVztLyGgNx2GC9LfDJ5gylTHps6lrr3zzalTbU/G6TD7GQM
 0CkQkQPa9ShGSAqz27sN/M0Qgock/l744myJnawBgDc1c408kPTdIcZd/vqCscxXcjB+J9jbe
 YW2uspme6prtdMuouPyftFtbGxBJ2HZ1y2zDS2IjHzg5hLypKZXTxiybMfxpJENsrxQ7C34LE
 q6x4VNhfpeCWGdueXUyz939IOi
Received-SPF: pass client-ip=212.227.17.20; envelope-from=deller@gmx.de;
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

The following changes since commit 621da7789083b80d6f1ff1c0fb499334007b4f5=
1:

  Update version for v7.1.0 release (2022-08-30 09:40:11 -0700)

are available in the Git repository at:

  https://github.com/hdeller/qemu-hppa.git tags/publish1-pull-request

for you to fetch changes up to 192cac33ab6449202d0b44c4d664020b09ce9266:

  linux-user: Add parameters of getrandom() syscall for strace (2022-09-11=
 19:58:07 +0200)

=2D---------------------------------------------------------------
linux-user: Add more syscalls, enhance tracing & logging enhancements

- show missing signals in strace output
- add pidfd_open(), pidfd_send_signal(), pidfd_getfd() and close_range()
  syscalls
- add and enhance strace output for clock_gettime64(), chmod(),
  clock_nanosleep(), futex() and getrandom() syscalls
- show failing executable in EXCP_DUMP()
- increase TASK_UNMAPPED_BASE and dump IIR on register dump (on hppa
  target)

=2D---------------------------------------------------------------

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


