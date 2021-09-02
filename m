Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CF5773FF80B
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Sep 2021 01:51:02 +0200 (CEST)
Received: from localhost ([::1]:44534 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mLwU1-0000dJ-7C
	for lists+qemu-devel@lfdr.de; Thu, 02 Sep 2021 19:51:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58496)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1mLwQu-0006Mp-BH
 for qemu-devel@nongnu.org; Thu, 02 Sep 2021 19:47:48 -0400
Received: from mail-io1-xd36.google.com ([2607:f8b0:4864:20::d36]:39582)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1mLwQr-0002nr-Kw
 for qemu-devel@nongnu.org; Thu, 02 Sep 2021 19:47:48 -0400
Received: by mail-io1-xd36.google.com with SMTP id m11so4721587ioo.6
 for <qemu-devel@nongnu.org>; Thu, 02 Sep 2021 16:47:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=wq5bFd+X1Ny61RgVjbDXx8QTirvbYGi7rnP/4rwxW2I=;
 b=ttew/Hlz+nzGxlsxw6YjmBfCNxyJvqYDS+Ozprq2cQnZ2gznu5UfEm4/D4t2EqVeJc
 9KHdO/IEWXSALOpg87SA7FBEOUljbMlnP/TTFw0R8k6thpZd6RvxRo2mzfRDm2y7+Gi/
 xnQJTwMKMrDsOc2UUflv62tIPRQ8GxjNkgTns4PUFFy3/MnsSfF0R2Fzny4tbzqODfo8
 zV0QYfp4V/7CAyjrqDBdIyN/lOXV0W2PjMu4F2slr4YxeBVFWDP6Vzb+halCSM1zCKFb
 qtLIGsLXFGxCk4dhLMtcK/+rwp2N7jro77JRjT5yGTIH7cg9Sg8IJPinG0766Tt88sFV
 h0tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=wq5bFd+X1Ny61RgVjbDXx8QTirvbYGi7rnP/4rwxW2I=;
 b=EgkfgZetw4OomtMo9rjm505EZLucMA7E0uUyQxE5dZOtbI1WozQaDzCxociIo8vLT7
 jLmvId400qqbKy37m3IhUIBLEg4aVd4Utl4Mg6mpPlhsaHU3cSnGYidCSol5NUIuGT65
 ftRtHstZWswT4fja9ewmGxkZZR6RZGm3jfLy9AbdAbfIRvDKAwlON4k/ybSlvGqHuKf4
 wKjnlXgdCMxdF0v81aDQdAmRY823BNX4v9+sPDhX951XQXqJJ8gEBr0Eegkyij6IltaS
 Xqyo5f+LxH2zh9QFtF1lNsVZ4HhVxfIIwIXrsZv28QM6fCO5/G/BqoNtgp4Cl+3MPJqI
 foXA==
X-Gm-Message-State: AOAM531GLCOGqRQFHqIye0s02c5TJnlqbjOP6C46OzZxpoDg1aPcA3B1
 vQQKES4VeP4ViDCOjntdac7DSrueTH+UKA==
X-Google-Smtp-Source: ABdhPJxBrcpTKB0Pm2FE99hmS7z2dU5+IiJbjus0+NS6fBA5NO70DEUFWZyOtkC4n21Q3PTOnX339A==
X-Received: by 2002:a5e:8e4c:: with SMTP id r12mr734418ioo.73.1630626463267;
 Thu, 02 Sep 2021 16:47:43 -0700 (PDT)
Received: from dune.bsdimp.com (50-253-99-174-static.hfc.comcastbusiness.net.
 [50.253.99.174])
 by smtp.gmail.com with ESMTPSA id u10sm1740502ilg.15.2021.09.02.16.47.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Sep 2021 16:47:41 -0700 (PDT)
From: imp@bsdimp.com
To: qemu-devel@nongnu.org
Subject: [PATCH v3 00/43] bsd-user updates to run hello world
Date: Thu,  2 Sep 2021 17:46:46 -0600
Message-Id: <20210902234729.76141-1-imp@bsdimp.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::d36;
 envelope-from=imp@bsdimp.com; helo=mail-io1-xd36.google.com
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

From: Warner Losh <imp@bsdimp.com>

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

v2: rejected patches dropped
    Use suggested glibc routines
    Updated to be closer to qemu style
    Disable bsd-user on netbsd and openbsd since they don't compile
    fold together a couple of related changes
    [[ tagged the review-by and acked-by from last series, but by hand...
      I think I got them all... ]]

v3: Fix a bug in refactoring load_elf_sections and is_target_elf_binary
    Fix spelling errors in commit messages
    drop copy_cpu() patch until we use that function
    reword a few commit messages to make them clearer
    fix return value of setup_sigtramp to be 0 after #ifdef elimination
    Add patch to initialize random state and implement --seed
    Fix a boatload of style issues.
    Rebase to tip of master

NOTE: checkpatch.pl will have several warning about line length > 80 and
admonishment to not use architecture specific defines. The slightly long lines
look a lot better than wrapping and the arch specific defines are basically
required (one could wrap them, and I plan to in the future once I've pruned the
obsolete ones in a future patch set: there's so many that errors would crop up
if I were to do it now).

Warner

Colin Percival (1):
  bsd-user: Add '-0 argv0' option to bsd-user/main.c

Warner Losh (42):
  bsd-user: remove sparc and sparc64
  bsd-user: add copyright header to elfload.c
  bsd-user: Add Stacey's copyright to main.c
  bsd-user: add license to bsdload.c
  bsd-user: style nits: bsdload.c whitespace to qemu standard
  bsd-user: Remove all non-x86 code from elfload.c
  bsd-user: move arch specific defines out of elfload.c
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
  bsd-user: save the path to the qemu emulator
  bsd-user: start to move target CPU functions to target_arch*
  bsd-user: Move per-cpu code into target_arch_cpu.h
  bsd-user: pull in target_arch_thread.h update target_arch_elf.h
  bsd-user: Include more things in qemu.h
  bsd-user: define max args in terms of pages
  bsd-user: Create target specific vmparam.h
  bsd-user: Add system independent stack, data and text limiting
  bsd-user: *BSD specific siginfo defintions
  bsd-user: Implement --seed and initialize random state
  bsd-user: Move stack initializtion into a per-os file.
  bsd-user: Add architecture specific signal tramp code
  bsd-user: elf cleanup
  bsd-user: Remove dead #ifdefs from elfload.c
  bsd-user: Rewrite target system call definintion glue
  bsd-user: Make cpu_model and cpu_type visible to all of main.c
  bsd-user: update debugging in mmap.c
  bsd-user: Add target_arch_reg to describe a target's register set
  bsd-user: Add target_os_user.h to capture the user/kernel structures
  bsd-user: add stubbed out core dump support
  bsd-user: elfload.c style catch up patch
  bsd-user: Refactor load_elf_sections and is_target_elf_binary
  bsd-user: move qemu_log to later in the file
  bsd-user: Implement interlock for atomic operations
  bsd-user: Update mapping to handle reserved and starting conditions

 bsd-user/bsd-mman.h                           |  121 --
 bsd-user/bsdload.c                            |  104 +-
 bsd-user/elfcore.c                            |   10 +
 bsd-user/elfload.c                            | 1469 +++++------------
 bsd-user/freebsd/host-os.h                    |   25 +
 bsd-user/freebsd/target_os_elf.h              |  137 ++
 bsd-user/freebsd/target_os_siginfo.h          |  145 ++
 bsd-user/freebsd/target_os_signal.h           |   78 +
 bsd-user/freebsd/target_os_stack.h            |  181 ++
 bsd-user/freebsd/target_os_thread.h           |   25 +
 bsd-user/freebsd/target_os_user.h             |  427 +++++
 bsd-user/freebsd/target_os_vmparam.h          |   38 +
 .../target_syscall.h => i386/target_arch.h}   |   27 +-
 bsd-user/i386/target_arch_cpu.c               |   76 +
 bsd-user/i386/target_arch_cpu.h               |  209 +++
 bsd-user/i386/target_arch_elf.h               |   35 +
 bsd-user/i386/target_arch_reg.h               |   82 +
 bsd-user/i386/target_arch_signal.h            |   94 ++
 bsd-user/i386/target_arch_sigtramp.h          |   29 +
 bsd-user/i386/target_arch_thread.h            |   47 +
 bsd-user/i386/target_arch_vmparam.h           |   46 +
 bsd-user/main.c                               |  836 ++--------
 bsd-user/mmap.c                               |  472 +++++-
 bsd-user/netbsd/host-os.h                     |   25 +
 bsd-user/netbsd/target_os_elf.h               |  146 ++
 bsd-user/netbsd/target_os_siginfo.h           |   82 +
 bsd-user/netbsd/target_os_signal.h            |   69 +
 bsd-user/netbsd/target_os_stack.h             |   56 +
 bsd-user/netbsd/target_os_thread.h            |   25 +
 bsd-user/openbsd/host-os.h                    |   25 +
 bsd-user/openbsd/target_os_elf.h              |  146 ++
 bsd-user/openbsd/target_os_siginfo.h          |   82 +
 bsd-user/openbsd/target_os_signal.h           |   69 +
 bsd-user/openbsd/target_os_stack.h            |   56 +
 bsd-user/openbsd/target_os_thread.h           |   25 +
 bsd-user/qemu.h                               |   63 +-
 bsd-user/sparc/target_arch_sysarch.h          |   52 -
 bsd-user/sparc64/target_arch_sysarch.h        |   52 -
 bsd-user/syscall.c                            |   11 -
 bsd-user/syscall_defs.h                       |  255 +--
 .../target_syscall.h => x86_64/target_arch.h} |   28 +-
 bsd-user/x86_64/target_arch_cpu.c             |   76 +
 bsd-user/x86_64/target_arch_cpu.h             |  247 +++
 bsd-user/x86_64/target_arch_elf.h             |   35 +
 bsd-user/x86_64/target_arch_reg.h             |   92 ++
 bsd-user/x86_64/target_arch_signal.h          |   94 ++
 bsd-user/x86_64/target_arch_sigtramp.h        |   29 +
 bsd-user/x86_64/target_arch_thread.h          |   40 +
 bsd-user/x86_64/target_arch_vmparam.h         |   46 +
 configure                                     |    7 +-
 meson.build                                   |    7 +-
 slirp                                         |    2 +-
 52 files changed, 4389 insertions(+), 2266 deletions(-)
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
 create mode 100644 bsd-user/i386/target_arch_elf.h
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
 rename bsd-user/{sparc64/target_syscall.h => x86_64/target_arch.h} (59%)
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


