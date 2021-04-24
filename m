Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F2E736A1EB
	for <lists+qemu-devel@lfdr.de>; Sat, 24 Apr 2021 18:06:11 +0200 (CEST)
Received: from localhost ([::1]:47814 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1laKnK-0001d5-Dp
	for lists+qemu-devel@lfdr.de; Sat, 24 Apr 2021 12:06:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50078)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1laKhu-0005MQ-8K
 for qemu-devel@nongnu.org; Sat, 24 Apr 2021 12:00:34 -0400
Received: from mail-il1-x134.google.com ([2607:f8b0:4864:20::134]:35536)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1laKhp-0004Au-KA
 for qemu-devel@nongnu.org; Sat, 24 Apr 2021 12:00:33 -0400
Received: by mail-il1-x134.google.com with SMTP id r5so2957938ilb.2
 for <qemu-devel@nongnu.org>; Sat, 24 Apr 2021 09:00:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=WOFdatCu8rTpV0lUS8s9Rk7w+tu3WNS0rFTikVeRkr8=;
 b=EZlyWVaU4xjAuKiIMVnAcuNhjU2MlUnKiGGLs8VOdRrFgUaNCiX4NnYZcCYUSJmALj
 n59owoepXrAZ0EiOr3xGEY2dsjIowvd5MXlRKJuDdg6qIIzHClDlWbuM9ongYytDto4J
 VQaffNS34SzCv/ojYSx19JJ7CKsEDOclKGgGr4h5mjV8uDoCNiH0t4uAx4eDLKjzRW4w
 7vNbyczkDXosPoNoXp3Eh4rn5d0HfYJVj26NMqpF5pzgv3m+qBTSGioYnMNhaPve18QU
 AO3dftob92A/wSofreTG2NIH1xsYsa1OxNaTYWJQpuUuXQzn2MjY+v+sJFDcgP0J/ay4
 Z9TQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=WOFdatCu8rTpV0lUS8s9Rk7w+tu3WNS0rFTikVeRkr8=;
 b=KZjYqHencxgwq8BUCrR2K4XQz4k2SZpF7N8k9EmkESx/yBFy4eGfSEQvsnPmj/eOX1
 m3FQp/hdNC/R7KoHEj/iCpAkmdjJ6w4WeZjiuRpPa7Jw0JEmAQMWJ83Snk3nMSJE0lJb
 cGT0QBT9iy9L1GNwiZufiQL3Mom1WAfoYL9daKrmWoe5tvmUAXda3ooZVwNPPjdGo6Cy
 +3qgge91TJGsq1ndB/sO3riMKU8xt6VmvT/M3mtzvgyRnASaKmqHSX90r2vBc6Ya0S32
 83gC5ZbYwg6yt3v88q1W3BrhhApgGGq0X//MJDPTUnTxJtf2S54/s9jEzQnCJ+nzPr8M
 NtHw==
X-Gm-Message-State: AOAM533NZib3qH0tmF0YPeGKoyweIQ4nXrjy8fgLzzNbcPOPv4mB4Gn6
 XAw6GNdMDtW6Akmw2+/kwfVNOgXeN8srnkU2
X-Google-Smtp-Source: ABdhPJzY7TNL6CNRhMjcLFSqFa1AFPUfkvh57vdaHfhnc19lxzC6qCOWjZBlP+TacQh6ptrHXKxxOA==
X-Received: by 2002:a92:1304:: with SMTP id 4mr7027597ilt.126.1619280026779;
 Sat, 24 Apr 2021 09:00:26 -0700 (PDT)
Received: from dune.bsdimp.com (50-253-99-174-static.hfc.comcastbusiness.net.
 [50.253.99.174])
 by smtp.gmail.com with ESMTPSA id h4sm4055901ili.52.2021.04.24.09.00.25
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Sat, 24 Apr 2021 09:00:26 -0700 (PDT)
From: imp@bsdimp.com
To: qemu-devel@nongnu.org
Subject: [PATCH v2 00/48] bsd-user style and reorg patches
Date: Sat, 24 Apr 2021 09:59:28 -0600
Message-Id: <20210424160016.15200-1-imp@bsdimp.com>
X-Mailer: git-send-email 2.22.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::134;
 envelope-from=imp@bsdimp.com; helo=mail-il1-x134.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: kevans@freebsd.org, arichardson@freebsd.org, Warner Losh <imp@bsdimp.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Warner Losh <imp@bsdimp.com>

Version 2:

In version 2 I've fixed all the checkpatch.pl issues for all the files that I
touched. Since files are changed incrementally, some of the individual changes
may not pass checkpatch.pl due to pre-existing problems, but the cumulative
diff passes with just warnings. I've folded the 'if 0 should just be lost'
advice in the relevant hunks, as well as in a few places where things were
commented out.

I've included all the reviews I've got so far, but since this is my first time
with such a complex review here please let me know if I've missed following all
the conventions somehow.

I had to tweak patches 025 and 026, which had been previously reviewed (adding
static in 2 places to fix a warning). So I removed the Reviewed By: line from
it. I hope that's the proper protocol here, but if not I'm keen on suggestions.

Version 1:

This series starts to cleanup bsd-user. The current checkpatch.pl output is on
the order of 4500 lines long. These cleanups don't fix everything (there's still
plenty of errors, even in some of the files the patches touch). I've tried to
make things better in every case, but be advised that checkpatch.pl is unhappy
with many of the files still in the first 15 commits. I do plan on addressing
the issues in the future as I need to make real commits to those files. The
changes were ones that were trivial to do with scripts that I had to do for
main.c anyway. main.c is now completely clean. All the cleanup I've done
myself, and at the end of this patch trail the output is only 3500 lines...

Next, I've started to reorg the bsd-user sources. There's really 4 BSDs in the
wild (FreeBSD, NetBSD, OpenBSD and Dragonfly) that these could, in theory,
target. In the bsd-user branch, we've broken the emulation of these apart. It
largely preserves the other BSD's as is, and greatly expands FreeBSD so that we
can do package builds in user-land emulation. The other BSDs have not been
run-time tested, though the CI tooling builds some of them. It's my belief that
in the current state, even an old-school cat(1) would fail, though I am to fix
that at least for FreeBSD...

We've also added a number of other architectures than sparc and i386. Those
additions, though, are dependent on other things not yet reshuffled and or
merged, so they will be coming along in due time: mips (32 and 64 bit), arm,
aarch64 and riscv willl come in due time. powerpc might, but it's in a frightful
state. I'm open to other BSDs that wish to work along with me as well, though it
may be best to wait until after future patch sets as much is still set to
change. CHERI and related work may also happen, but that's still TBD.

In this installement, after the style stuff, I've created a
target_arch_cpu.h. Here, all the functions related to the cpu loop and similar
things are moved into there on a per-architecture basis to start to tame the
number of #ifdefs in mail. Linux-user did a similar thing years after we had
done it in the repo, and a number of different choices were made. Rather than
redo all the work from the bsd-user repo, I'm recreating / rebasing it on a
current qemu. Future patch series will address other aspects. Once they are
complete, we can look, potentially, at any refactoring between linux-user and
bsd-user. I very much explicitly want to push that to the end because otherwise
I'm completely recreating a lot of the work on the bsd-user branch rather than
just transitioning it forward to a newer qemu. This reorg was started by Stacey
Son and I've redone it with the latest code. I've added his signoff (with his
blanket permission) to those commits. Also, all of these commits pass
checkpatch.pl

Please let me know what you think, and how I might structure future patches if
there's ways I can do them better. I've switched to pull-requests with this series
since it will be easier to keep track of, especially in the future.

Warner

P.S. This has no relevance to 6.0 at all: we're too late and this feature
isn't fully integrated by this patch trail.



Warner Losh (48):
  bsd-user: whitespace changes
  bsd-user: whitespace changes
  bsd-user: whitespace changes
  bsd-user: style tweak: keyword space (
  bsd-user: style tweak: keyword space (
  bsd-user: style tweak: keyword space (
  bsd-user: style tweak: keyword space (
  bsd-user: style tweak: use C not C++ comments
  bsd-user: style tweak: use C not C++ comments
  bsd-user: Remove commented out code
  bsd-user: style tweak: Remove #if 0'd code
  bsd-user: style tweak: Remove #if 0'd code
  bsd-user: style tweak: Remove #if 0'd code
  bsd-user: style tweak: Remove #if 0'd code
  bsd-user: style tweak: return is not a function, eliminate ()
  bsd-user: style tweak: Put {} around all if/else/for statements
  bsd-user: style tweak: Fix commentary issues
  bsd-user: style tweak: Use preferred block comments
  bsd-user: style tweak: move extern to header file
  bsd-user: style tweak: use {} consistently in for / if / else
    statements
  bsd-user: style nits: return is not a function
  bsd-user: use qemu_strtoul in preference to strtol
  bsd-user: introduce host_os.h for bsd-specific code and defaults
  bsd-user: create target_arch_cpu.h
  bsd-user: move x86 (i386 and x86_64) cpu_loop to target_arch_cpu.h
  bsd-user: move sparc cpu_loop into target_arch_cpu.h as
    target_cpu_loop
  bsd-user: style tweak: space pedantry
  bsd-user: style tweak: comments
  bsd-user: style tweak: use {} correctly
  bsd-user: style tweak: fix block comments
  bsd-user: style tweak: use {} for all if statements, format else
    correctly
  bsd-user: style tweak: remove spacing after '*' and add after }
  bsd-user: style tweak: Use preferred block comments
  bsd-user: style tweak: don't assign in if statements
  bsd-user: style tweak: use {} for all if statements, format else
    correctly
  bsd-user: style tweak: Use preferred block comments
  bsd-user: style tweak: don't assign in if statements
  bsd-user: style tweak: use {} for all if statements, format else
    correctly
  bsd-user: style tweak: spaces around =, remove stray space
  bsd-user: style tweak: Use preferred block comments
  bsd-user: style tweak: don't assign in if statements
  bsd-user: style tweak: spaces around operators and commas
  bsd-user: style tweak: fold long lines
  bsd-user: style tweak: use preferred block comments
  bsd-user: style tweak: Use preferred {} in if/else statements.
  bsd-user: style tweak: Return is not a function call.
  bsd-user: style tweak: don't assign in if statement.
  bsd-user: put back a break; that had gone missing...

 bsd-user/arm/target_arch_cpu.h     |  22 +
 bsd-user/bsd-mman.h                |  42 +-
 bsd-user/bsdload.c                 |  55 +--
 bsd-user/elfload.c                 | 677 ++++++++++++++++-------------
 bsd-user/freebsd/host_os.h         |  25 ++
 bsd-user/i386/target_arch_cpu.h    | 197 +++++++++
 bsd-user/main.c                    | 657 +++-------------------------
 bsd-user/mmap.c                    | 185 +++++---
 bsd-user/netbsd/host_os.h          |  25 ++
 bsd-user/openbsd/host_os.h         |  25 ++
 bsd-user/qemu.h                    | 128 +++---
 bsd-user/sparc/target_arch_cpu.h   | 287 ++++++++++++
 bsd-user/sparc64/target_arch_cpu.h |  19 +
 bsd-user/strace.c                  |  21 +-
 bsd-user/syscall.c                 | 222 ++++++----
 bsd-user/uaccess.c                 |  27 +-
 bsd-user/x86_64/target_arch_cpu.h  |  19 +
 bsd-user/x86_64/target_syscall.h   |  15 -
 18 files changed, 1449 insertions(+), 1199 deletions(-)
 create mode 100644 bsd-user/arm/target_arch_cpu.h
 create mode 100644 bsd-user/freebsd/host_os.h
 create mode 100644 bsd-user/i386/target_arch_cpu.h
 create mode 100644 bsd-user/netbsd/host_os.h
 create mode 100644 bsd-user/openbsd/host_os.h
 create mode 100644 bsd-user/sparc/target_arch_cpu.h
 create mode 100644 bsd-user/sparc64/target_arch_cpu.h
 create mode 100644 bsd-user/x86_64/target_arch_cpu.h

-- 
2.22.1


