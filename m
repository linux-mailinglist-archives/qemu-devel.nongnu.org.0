Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E3F2743238E
	for <lists+qemu-devel@lfdr.de>; Mon, 18 Oct 2021 18:13:47 +0200 (CEST)
Received: from localhost ([::1]:52748 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mcVGl-0005Sv-18
	for lists+qemu-devel@lfdr.de; Mon, 18 Oct 2021 12:13:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58036)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1mcV8r-0007h5-K9
 for qemu-devel@nongnu.org; Mon, 18 Oct 2021 12:05:40 -0400
Received: from mail-il1-x12a.google.com ([2607:f8b0:4864:20::12a]:46663)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1mcV8b-0007oZ-Ap
 for qemu-devel@nongnu.org; Mon, 18 Oct 2021 12:05:36 -0400
Received: by mail-il1-x12a.google.com with SMTP id w10so15397712ilc.13
 for <qemu-devel@nongnu.org>; Mon, 18 Oct 2021 09:05:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=slfr4V5a4t9/ywn5snHLJ2W89KDL0wWiWw5n6uByQlE=;
 b=Fdm69mDrzod3UBfplnbD/C12oJ2hc0ONgmnkIHb11VhcYmdtVT4PZn2OBLN1XSHXHG
 jXekmdvYTgpD0IVR3pYYLT70n+UUAl3nmuJqrnZjAlMx/kWvGkJvWonGDJTdDRZm6X5y
 5rXgZj4VQiCboomA7illvQ8aBvHgkrqQ9Sw+vs4DpOvA3lAw0ISk/PTaaIR0hB3QhUJk
 wdW3a1DcSewNXZOjNuhEslEbAMP8gd+xXUvTx30WnkQu9hUR615jnHIa23AVgmp/PZgr
 5HAZwmtClk+T+p8cifvGk0QG2ixJgo8QAHfiRIA9zoq10pZqM/09P4sJA0RnJD0AIpIl
 jkzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=slfr4V5a4t9/ywn5snHLJ2W89KDL0wWiWw5n6uByQlE=;
 b=1DuZScG4ReVMYFa/3BdH9LI1xOQHV6vpdBzNHKlOSKXDQ49PBawYEgWV2Ax/80m8+h
 n84vabRmTDk4CXXJFiGUSfO4NuHjWPMzZXrn15wULDsVq7sAxMSGXCZJMUlG1nAfg0Of
 8Zxxv+DDycdRdF0z4y5x6dLVNAYIX91KD9T40g5q9NnAE6x6dz6i30sN6o9kGowN6Rvz
 vCoHoZ2UuIDGpCcN9+j9H9Mkr9hNumusSe4icyygoFm9j8sNLXK5qv486DJRKTkVov04
 79fRPfRM4d5uqokEyizpq8/M+0hwv8Zi7u77eqgcT1rDM6GwTIUiDKRHj976619dt6Pt
 ExfA==
X-Gm-Message-State: AOAM5316H4FdwbVQGwThpJj2ZyAVddE3Ex7V4OSF8rWWE/QrsKpyYOwX
 yfrL3XvvGLXIJjjwU2XpHzZG/KVZi+C/yA==
X-Google-Smtp-Source: ABdhPJxXZE/rltn+31o40vz05evka1qICJXj4wUZk+xPXBIpC06VyF2r0h0NcUNLvDeXP5h8ucL2sQ==
X-Received: by 2002:a05:6e02:17cf:: with SMTP id
 z15mr14818538ilu.161.1634573115142; 
 Mon, 18 Oct 2021 09:05:15 -0700 (PDT)
Received: from dune.bsdimp.com (50-253-99-174-static.hfc.comcastbusiness.net.
 [50.253.99.174])
 by smtp.gmail.com with ESMTPSA id a4sm7240936ild.52.2021.10.18.09.05.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 Oct 2021 09:05:14 -0700 (PDT)
From: Warner Losh <imp@bsdimp.com>
To: qemu-devel@nongnu.org
Subject: [PULL 00/23] Pull bsd user 20211018 patches
Date: Mon, 18 Oct 2021 10:04:35 -0600
Message-Id: <20211018160458.1976-1-imp@bsdimp.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::12a;
 envelope-from=imp@bsdimp.com; helo=mail-il1-x12a.google.com
X-Spam_score_int: 0
X-Spam_score: 0.0
X-Spam_bar: /
X-Spam_report: (0.0 / 5.0 requ) DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Cc: kevans@freebsd.org, Laurent Vivier <laurent@vivier.eu>,
 Warner Losh <imp@bsdimp.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The following changes since commit c148a0572130ff485cd2249fbdd1a3260d5e10a4:

  Merge remote-tracking branch 'remotes/rth/tags/pull-tcg-20211016' into staging (2021-10-16 11:16:28 -0700)

are available in the Git repository at:

  git@gitlab.com:bsdimp/qemu.git tags/pull-bsd-user-20211018-pull-request

for you to fetch changes up to c2c72da45c2ab0c76af8d4bf27bf90824bc521af:

  bsd-user/signal: Create a dummy signal queueing function (2021-10-18 07:55:33 -0600)

----------------------------------------------------------------
bsd-user pull request: merge dependencies for next architectures

Merge the dependencies for arm, aarch64, and riscv64 architectures. This joins
together two patch series:

[PATCH v2 00/15] bsd-user: misc cleanup for aarch64 import

Prepare for aarch64 support (the next architecture to be upstreamed). As the
aarch64 emulation is more complete, it relies on a number of different items.
In some cases, I've pulled in the full support from bsd-user fork. In other
cases I've created a simple stub (as is the case for signals, which have
independent changes pending, so I wanted to be as minimal as possible.  Since
all pre-12.2 support was purged from the bsd-user fork, go ahead and remove it
here. FreeBSD 11.x goes ouft of support at the end of the month. Remove what
little multi-version support that's in upstream.

and

[PATCH v3 0/9] bsd-user mmap fixes
This series synchronizes mmap.c with the bsd-user fork. This is a mix of old bug
fixes pulled in from linux-user, as well as some newer fixes to adress bugs
found in check-tcg and recent FreeBSD developments. There are also a couple of
style commits. Updated to migrate debugging to qemu_log.

as well as a couple of minor rebase tweaks. In addition, the next two
architectures I plan on upstreaming (arm and riscv64) also have their prereqs
satisfied with this request.

----------------------------------------------------------------

Guy Yur (1):
  bsd-user/mmap.c: Don't mmap fd == -1 independently from MAP_ANON flag

Kyle Evans (1):
  bsd-user/mmap.c: Implement MAP_EXCL, required by jemalloc in head

Mikaël Urankar (2):
  bsd-user/mmap.c: Always zero MAP_ANONYMOUS memory in mmap_frag()
  bsd-user/mmap.c: check pread's return value to fix warnings with
    _FORTIFY_SOURCE

Stacey Son (1):
  bsd-user/errno_defs.h: Add internal error numbers

Warner Losh (18):
  bsd-user/mmap.c: MAP_ symbols are defined, so no need for ifdefs
  bsd-user/mmap.c: mmap return ENOMEM on overflow
  bsd-user/mmap.c: mmap prefer MAP_ANON for BSD
  bsd-user/mmap.c: Convert to qemu_log logging for mmap debugging
  bsd-user/mmap.c: assert that target_mprotect cannot fail
  meson: *-user: only descend into *-user when configured
  bsd-user/target_os-user.h: Remove support for FreeBSD older than 12.0
  bsd-user/strace.list: Remove support for FreeBSD versions older than
    12.0
  bsd-user: TARGET_RESET define is unused, remove it
  bsd-user: export get_errno and is_error from syscall.c
  bsd-user: move TARGET_MC_GET_CLEAR_RET to target_os_signal.h
  bsd-user/target_os_elf.h: Remove fallback ELF_HWCAP and reorder
  bsd-user/target_os_elf: If ELF_HWCAP2 is defined, publish it
  bsd-user: Remove used from TaskState
  bsd-user: Add stop_all_tasks
  bsd-user/sysarch: Move to using do_freebsd_arch_sysarch interface
  bsd-user: Rename sigqueue to qemu_sigqueue
  bsd-user/signal: Create a dummy signal queueing function

 bsd-user/errno_defs.h                |  13 ++-
 bsd-user/freebsd/meson.build         |   3 +
 bsd-user/freebsd/os-sys.c            |  27 +++++
 bsd-user/freebsd/strace.list         |  11 --
 bsd-user/freebsd/target_os_elf.h     |  12 +--
 bsd-user/freebsd/target_os_signal.h  |   3 +
 bsd-user/freebsd/target_os_user.h    | 100 +------------------
 bsd-user/i386/target_arch_cpu.h      |   2 -
 bsd-user/i386/target_arch_signal.h   |   2 -
 bsd-user/main.c                      |  10 +-
 bsd-user/meson.build                 |   7 ++
 bsd-user/mmap.c                      | 144 +++++++++++++++------------
 bsd-user/qemu.h                      |  25 +++--
 bsd-user/signal.c                    |  11 +-
 bsd-user/syscall.c                   |  60 +----------
 bsd-user/x86_64/target_arch_cpu.h    |   2 -
 bsd-user/x86_64/target_arch_signal.h |   2 -
 linux-user/meson.build               |   4 +
 meson.build                          |  12 ++-
 roms/seabios-hppa                    |   2 +-
 20 files changed, 188 insertions(+), 264 deletions(-)
 create mode 100644 bsd-user/freebsd/meson.build
 create mode 100644 bsd-user/freebsd/os-sys.c

-- 
2.32.0


