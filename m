Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B1243E3726
	for <lists+qemu-devel@lfdr.de>; Sat,  7 Aug 2021 23:44:31 +0200 (CEST)
Received: from localhost ([::1]:36940 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mCU7K-0000XA-6Y
	for lists+qemu-devel@lfdr.de; Sat, 07 Aug 2021 17:44:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43192)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1mCU5o-00067W-1N
 for qemu-devel@nongnu.org; Sat, 07 Aug 2021 17:42:56 -0400
Received: from mail-io1-xd44.google.com ([2607:f8b0:4864:20::d44]:36538)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1mCU5l-0004ek-RQ
 for qemu-devel@nongnu.org; Sat, 07 Aug 2021 17:42:55 -0400
Received: by mail-io1-xd44.google.com with SMTP id f11so19874886ioj.3
 for <qemu-devel@nongnu.org>; Sat, 07 Aug 2021 14:42:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=HfSrMOSAlm6PC+pJOK99NMBH0lGweuKhjvd+Gw/FOg0=;
 b=wGfMTbnOIjzJRZ/wpP9NWDvoNQ2R/7ARB+Cz6zcKYC8L/W2OOJLs8MoG/7YRhjrdwf
 Bs0vNdJ1qm1faffVCiUlayMpPOUyjkGOAW9ZLniddJT1eQN8wHB9nS9XuO75WmPCVBSp
 sgzwNUmumxKv0+YNALjQfGs71IxhiYAYKCKfC2ewZP7wB1LUWGPMplfOL3KnM4Hr3LjX
 1Lt/SuFX33GbxTB7afVQUzaPlGta/eDeOMYM+NJI31FsQeYwFLQdF9W8C8mVNVJLYvkI
 T5OIMymial79qXEFBk03ylhMoUhJFa54JGqpv1WBzyDKJDQoRk4oxeyZUr0Z4tBn1cPz
 fvHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=HfSrMOSAlm6PC+pJOK99NMBH0lGweuKhjvd+Gw/FOg0=;
 b=gW56bfb/HZPnQ3VNuULmxQyPF+zWV28DZG1IxdBar/+n3xehZmB06f1TfHKd0uNb10
 tjWwD8+8VLB7IRBkRXRiuqI6Ptwdx13a7RZvY+FfxTnps0bxpjCCYadHTVuG1f2hpPDv
 Hj/zL1pYEC7YgC5q7eh6BXNUuu1K1oyJdsSbDjLjTSC9o08HP0KK1hcTqXpDv3pbzvFF
 wxTGtLgxZoYG6qLjI6YNV62trcVpAzAcfGVnrEFoGshTTjLdIInoszRLEM0RBbXtxFwd
 KcNCx9IDzoC34CvCwGasGzGc/BiMpHgjEsn3jdw140RNghQ/9ojPLDQ+yE+GWFTkkxny
 z5dw==
X-Gm-Message-State: AOAM532IUQU78U9c5E0KmsRCm+WqakEocaImVxSDlx5sp48DKTWJc2FC
 js51xSbQ1B9NN8eC0aFrZDnl067YwJf5BH8A
X-Google-Smtp-Source: ABdhPJyVRqoYzLEK6dn+95aPX6qSL6YOhIQC26z3WmBh6RwYb6EYKo+kQ6QkcMJBQIgcB26YUFvyGg==
X-Received: by 2002:a05:6e02:2147:: with SMTP id
 d7mr90365ilv.179.1628372571484; 
 Sat, 07 Aug 2021 14:42:51 -0700 (PDT)
Received: from dune.bsdimp.com (50-253-99-174-static.hfc.comcastbusiness.net.
 [50.253.99.174])
 by smtp.gmail.com with ESMTPSA id a17sm8062827ios.36.2021.08.07.14.42.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 07 Aug 2021 14:42:51 -0700 (PDT)
From: Warner Losh <imp@bsdimp.com>
To: qemu-devel@nongnu.org
Subject: [PATCH for 6.2 00/49] bsd-user updates to run hello world
Date: Sat,  7 Aug 2021 15:41:53 -0600
Message-Id: <20210807214242.82385-1-imp@bsdimp.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::d44;
 envelope-from=imp@bsdimp.com; helo=mail-io1-xd44.google.com
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
Cc: kevans@freebsd.org, Warner Losh <imp@bsdimp.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This series of patches gets me to the point that I can run "Hello World" on i386
and x86_64. This is for static binaries only, that are relatively small, but
it's better than the 100% instant mmap failre that is the current state of all
things bsd-user in upstream qemu. Future patch sets will refine this, add
the missing system calls, fix bugs preventing more sophisticated programms
from running and add a bunch of new architecture support.

There's three large themes in these patches, though the changes that
represent them are interrelated making it hard to separate out further.
1. Reorganization to support multiple OS and architectures (though I've only
   tested FreeBSD, other BSDs might not even compile yet).
2. Diff reduction with the bsd-user fork for several files. These diffs include
   changes that borrowed from linux-user as well as changes to make things work
   on FreeBSD. The records keeping when this was done, however, was poor at
   best, so many of the specific borrowings are going unacknowledged here, apart
   from this general ack. These diffs also include some minor code shuffling.
   Some of the changes are done specifically to make it easier to rebase
   the bsd-user fork's changes when these land in the tree (a number of changes
   have been pushed there to make this more possible).
3. Filling in the missing pieces to make things work. There's many changes to
   elfload to make it load things in the right places, to find the interpreter
   better, etc. There's changes to mmap.c to make the mappings work better and
   there's changes to main.c that were inspired, at least, by now-ancient changes
   to linux-user's main.c.

I ran checkpatch.pl on this, and there's 350-odd errors it identifies (the vast
majoirty come from BSD's fetish for tabs), so there will need to be a V2 to fix
this at the very least. In addition, the change set is big (about +~4.5k/-~2.5k
lines), so I anticipate some iteration as well just based on its sheer
size. I've tried to keep each set small to make it easy to review in isolation,
but I've also allowed some interrelated ones to get a little bigger than I'd
normally like. I've not done the customary documentation of the expected
checkpatch.pl output because it is large, and because I wanted to get review
of the other parts rolling to get this project unstuck. Future versions of the
patch will document the expected output.

In addition, I noticed a number of places where I could modernize to make the
code match things like linux-user better. I've resisted the urge to do these at
this time, since it would complicate merging the other ~30k lines of diff that
remains after this batch. Future batches should generally be smaller once this
one has landed since they are, by and large, either a bunch of new files to
support armv7, aarch64, riscv64, mips, mipsel, mips64, ppc, ppc64 and ppc64le,
or are adding system calls, which can be done individually or small groups. I've
removed sparc and sparc64 support as they've been removed from FreeBSD and
have been near totally busted for years.

Stacey Son did the bulk of this work originally, but since I had to move things
around so much and/or retool that work in non-trivial ways, I've kept myself as
author, and added his signed-off-by line. I'm unsure of the qemu standard
practice for this, but am happy to learn if this is too far outside its current
mainstream. For a while Sean Bruno did the merges from upstream, and he's
credited using his signed-off-by in appropriate places, though for this patch
set there's only a few. I've tried to ensure that others who have work in
individual patches that I've aggregated together also are reflected in their
signed-off-by. Given the chaotic stat of the upstream repo for its early
history, this may be the best that can be reconstructed at this late date. Most
of these files are 'foundational' so have existed from the earliest days when
record keeping wasn't quite what I'd wish for in hindsight. There was only
really one change that I could easily cherry-pick (Colin's), so I did that.

Colin Percival (1):
  bsd-user: Add '-0 argv0' option to bsd-user/main.c

Warner Losh (48):
  bsd-user: remove sparc and sparc64
  bsd-user: add copyright header to elfload.c
  bsd-user: Add Stacey's copyright to main.c
  bsd-user: Remove all non-x86 code from elfload.c
  bsd-user: move arch specific defines out of elfload.c
  bsd-user: merge comments and guards from bsd-user fork
  bsd-user: style nits: apply qemu style to these files
  bsd-user: style nits: fix whitespace issues to be qemu standard
  bsd-user: add license
  bsd-user: pass the bsd_param into loader_exec
  bsd-user: Fix calculation of size to allocate
  bsd-user: implement path searching
  bsd-user: Eliminate elf personality
  bsd-user: remove a.out support
  bsd-user: TARGET_NGROUPS unused in this file, remove
  bsd-user: elfload: simplify bswap a bit.
  bsd-user: assume pthreads and support of __thread
  bsd-user: add host-os.h
  bsd-user: Include host-os.h from main
  bsd-user: save the path the qemu emulator
  bsd-user: start to move target CPU functions to target_arch*
  bsd-user: Move per-cpu code into target_arch_cpu.h
  bsd-user: pull in target_arch_thread.h update target_arch_elf.h
  bsd-user: Include more things in qemu.h
  bsd-user: define max args in terms of pages
  bsd-user: Create target specific vmparam.h
  bsd-user: Add architecture specific signal tramp code
  bsd-user: Move stack initializtion into a per-os file.
  bsd-user: Add system independent stack, data and text limiting
  bsd-user: elf cleanup
  bsd-user: Remove dead #ifdefs from elfload.c
  bsd-user: *BSD specific siginfo defintions
  bsd-user: Rewrite target system call definintion glue
  bsd-user: Fix initializtion of task state
  bsd-user: remove error_init
  bsd-user: Make cpu_model and cpu_type visible to all of main.c
  bsd-user: update debugging in mmap.c
  bsd-user: Update mapping to handle reserved and starting conditions
  bsd-user: Need to reset CPU after creation.
  bsd-user: Add target_arch_reg to describe a target's register set
  bsd-user: Add target_os_user.h to capture the user/kernel structures
  bsd-user: add stubbed out core dump support
  bsd-user: elfload.c style catch up patch
  bsd-user: Refactor load_elf_sections and is_target_elf_binary
  bsd-user: Make guest_base an unsigned long
  bsd-user: move qemu_log to later in the file
  bsd-user: Implement interlock for atomic operations
  bsd-user: Implement cpu_copy() helper routine

 bsd-user/bsd-mman.h                           |  121 --
 bsd-user/bsdload.c                            |  141 +-
 bsd-user/elfcore.c                            |   10 +
 bsd-user/elfload.c                            | 1464 +++++------------
 bsd-user/freebsd/host-os.h                    |   25 +
 bsd-user/freebsd/target_os_elf.h              |  149 ++
 bsd-user/freebsd/target_os_siginfo.h          |  145 ++
 bsd-user/freebsd/target_os_signal.h           |   78 +
 bsd-user/freebsd/target_os_stack.h            |  181 ++
 bsd-user/freebsd/target_os_thread.h           |   25 +
 bsd-user/freebsd/target_os_user.h             |  429 +++++
 bsd-user/freebsd/target_os_vmparam.h          |   38 +
 .../target_syscall.h => i386/target_arch.h}   |   27 +-
 bsd-user/i386/target_arch_cpu.c               |   76 +
 bsd-user/i386/target_arch_cpu.h               |  306 ++++
 .../target_arch_elf.h}                        |   30 +-
 bsd-user/i386/target_arch_reg.h               |   82 +
 bsd-user/i386/target_arch_signal.h            |   94 ++
 bsd-user/i386/target_arch_sigtramp.h          |   29 +
 bsd-user/i386/target_arch_thread.h            |   47 +
 bsd-user/i386/target_arch_vmparam.h           |   46 +
 bsd-user/main.c                               |  831 ++--------
 bsd-user/mmap.c                               |  421 ++++-
 bsd-user/netbsd/host-os.h                     |   25 +
 bsd-user/netbsd/target_os_elf.h               |  143 ++
 bsd-user/netbsd/target_os_siginfo.h           |   82 +
 bsd-user/netbsd/target_os_signal.h            |   70 +
 bsd-user/netbsd/target_os_stack.h             |   56 +
 bsd-user/netbsd/target_os_thread.h            |   25 +
 bsd-user/openbsd/host-os.h                    |   25 +
 bsd-user/openbsd/target_os_elf.h              |  143 ++
 bsd-user/openbsd/target_os_siginfo.h          |   82 +
 bsd-user/openbsd/target_os_signal.h           |   70 +
 bsd-user/openbsd/target_os_stack.h            |   56 +
 bsd-user/openbsd/target_os_thread.h           |   25 +
 bsd-user/qemu.h                               |   62 +-
 bsd-user/sparc/target_arch_sysarch.h          |   52 -
 bsd-user/sparc64/target_arch_sysarch.h        |   52 -
 bsd-user/syscall.c                            |   11 -
 bsd-user/syscall_defs.h                       |  255 +--
 bsd-user/x86_64/target_arch.h                 |   31 +
 bsd-user/x86_64/target_arch_cpu.c             |   76 +
 bsd-user/x86_64/target_arch_cpu.h             |  328 ++++
 bsd-user/x86_64/target_arch_elf.h             |   33 +
 bsd-user/x86_64/target_arch_reg.h             |   92 ++
 bsd-user/x86_64/target_arch_signal.h          |   94 ++
 bsd-user/x86_64/target_arch_sigtramp.h        |   29 +
 bsd-user/x86_64/target_arch_thread.h          |   40 +
 bsd-user/x86_64/target_arch_vmparam.h         |   46 +
 meson.build                                   |    8 +-
 50 files changed, 4555 insertions(+), 2251 deletions(-)
 delete mode 100644 bsd-user/bsd-mman.h
 create mode 100644 bsd-user/elfcore.c
 create mode 100644 bsd-user/freebsd/host-os.h
 create mode 100644 bsd-user/freebsd/target_os_elf.h
 create mode 100644 bsd-user/freebsd/target_os_siginfo.h
 create mode 100644 bsd-user/freebsd/target_os_signal.h
 create mode 100644 bsd-user/freebsd/target_os_stack.h
 create mode 100644 bsd-user/freebsd/target_os_thread.h
 create mode 100644 bsd-user/freebsd/target_os_user.h
 create mode 100644 bsd-user/freebsd/target_os_vmparam.h
 rename bsd-user/{sparc/target_syscall.h => i386/target_arch.h} (60%)
 create mode 100644 bsd-user/i386/target_arch_cpu.c
 create mode 100644 bsd-user/i386/target_arch_cpu.h
 rename bsd-user/{sparc64/target_syscall.h => i386/target_arch_elf.h} (59%)
 create mode 100644 bsd-user/i386/target_arch_reg.h
 create mode 100644 bsd-user/i386/target_arch_signal.h
 create mode 100644 bsd-user/i386/target_arch_sigtramp.h
 create mode 100644 bsd-user/i386/target_arch_thread.h
 create mode 100644 bsd-user/i386/target_arch_vmparam.h
 create mode 100644 bsd-user/netbsd/host-os.h
 create mode 100644 bsd-user/netbsd/target_os_elf.h
 create mode 100644 bsd-user/netbsd/target_os_siginfo.h
 create mode 100644 bsd-user/netbsd/target_os_signal.h
 create mode 100644 bsd-user/netbsd/target_os_stack.h
 create mode 100644 bsd-user/netbsd/target_os_thread.h
 create mode 100644 bsd-user/openbsd/host-os.h
 create mode 100644 bsd-user/openbsd/target_os_elf.h
 create mode 100644 bsd-user/openbsd/target_os_siginfo.h
 create mode 100644 bsd-user/openbsd/target_os_signal.h
 create mode 100644 bsd-user/openbsd/target_os_stack.h
 create mode 100644 bsd-user/openbsd/target_os_thread.h
 delete mode 100644 bsd-user/sparc/target_arch_sysarch.h
 delete mode 100644 bsd-user/sparc64/target_arch_sysarch.h
 create mode 100644 bsd-user/x86_64/target_arch.h
 create mode 100644 bsd-user/x86_64/target_arch_cpu.c
 create mode 100644 bsd-user/x86_64/target_arch_cpu.h
 create mode 100644 bsd-user/x86_64/target_arch_elf.h
 create mode 100644 bsd-user/x86_64/target_arch_reg.h
 create mode 100644 bsd-user/x86_64/target_arch_signal.h
 create mode 100644 bsd-user/x86_64/target_arch_sigtramp.h
 create mode 100644 bsd-user/x86_64/target_arch_thread.h
 create mode 100644 bsd-user/x86_64/target_arch_vmparam.h

-- 
2.32.0


