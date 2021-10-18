Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 25A19432719
	for <lists+qemu-devel@lfdr.de>; Mon, 18 Oct 2021 21:06:57 +0200 (CEST)
Received: from localhost ([::1]:56904 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mcXyK-0005hv-7r
	for lists+qemu-devel@lfdr.de; Mon, 18 Oct 2021 15:06:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43288)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1mcXtE-0007wu-Cf
 for qemu-devel@nongnu.org; Mon, 18 Oct 2021 15:01:40 -0400
Received: from mail-io1-xd33.google.com ([2607:f8b0:4864:20::d33]:43583)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1mcXtB-0001U0-65
 for qemu-devel@nongnu.org; Mon, 18 Oct 2021 15:01:40 -0400
Received: by mail-io1-xd33.google.com with SMTP id y67so17466197iof.10
 for <qemu-devel@nongnu.org>; Mon, 18 Oct 2021 12:01:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=D8dHJEhs9zDJzedL6+h5kKQSgd5PXWSyQQttsCvUSrI=;
 b=tVl9QKwScV2BVN6PIbTAVzDco1l2U0z8OXim0MlQzNP3yqfn6E4iwuje5/wjRsj6B+
 A1w3jS+wvDCqQpj2HD6MOWdYYNZUXcSi+5juNQ5ovUhcXw4avUtAWWsgipPq1pIuXgwj
 y2+a7TA5bbk2g5EYlmo4uDfAAjMWiItiGni6zjVm1iwJ+ojXT6kPV7ESYtu5+LXvLYkZ
 2zM5mkm6QiFdtLni1YKfXfqg5E+iHZ90tpHg9wWinIgIgPntAqkobHrtrZoJZlL3nafN
 ITW9fP182fZMKoEFpwtqrkP1tDMlxNeokJhS5TyDM0CoHOJTsKlSbaO+GegmrdUUoh7W
 UTDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=D8dHJEhs9zDJzedL6+h5kKQSgd5PXWSyQQttsCvUSrI=;
 b=nXP7mD5e4YZ30ySG+6I+AZrfy7KR3IlG81GBLdqGfSuTgtKlUBk6dAWkxIduhWdsqK
 5hSCjdsr71rPhCgUdojFqTA7hHxEhRK17P+hgl9j5cAwGYePOFDLa9AwX0dDPlfY7oKH
 9YWKpyZeOeuf5EUOZLh5EBoj5mOLYJiBvID6Sauav9xk/7Mxmzp5Npfn9/UVxrvzQtUH
 Dc1MgJ9HPXD1LNSJIg/TQSJpDHhdBupS5xiI5TOXf+a2PCjb/yKL5Q2YcXCgfz5BOXC0
 NwQHs8EM+twxp65A+dYtTFakR98227215mg6yHKxlJ4fHnOhOGZr95o/j402jTk6bg8A
 o1Iw==
X-Gm-Message-State: AOAM531Sp13oDZamrSxHyv1UnNDShqzn7NJm/eHqjw47S7/8/hc4p32/
 o+SL82boYG1FCrIOy/JRQOUozDsggUAFEg==
X-Google-Smtp-Source: ABdhPJzdXxog70EKrPPJI4oWzvEtx66SaQtvLSfFfjBxxKZaP/HkEGxNW1nzQpimDO0XIwfIfrZfdw==
X-Received: by 2002:a02:b0cc:: with SMTP id w12mr1063500jah.73.1634583693677; 
 Mon, 18 Oct 2021 12:01:33 -0700 (PDT)
Received: from dune.bsdimp.com (50-253-99-174-static.hfc.comcastbusiness.net.
 [50.253.99.174])
 by smtp.gmail.com with ESMTPSA id a8sm6945151ilh.5.2021.10.18.12.01.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 Oct 2021 12:01:33 -0700 (PDT)
From: Warner Losh <imp@bsdimp.com>
To: qemu-devel@nongnu.org
Subject: [PULL v2 00/23] Pull bsd user 20211018 patches
Date: Mon, 18 Oct 2021 13:00:52 -0600
Message-Id: <20211018190115.5365-1-imp@bsdimp.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::d33;
 envelope-from=imp@bsdimp.com; helo=mail-io1-xd33.google.com
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
Cc: Kyle Evans <kevans@freebsd.org>, Laurent Vivier <laurent@vivier.eu>,
 Warner Losh <imp@bsdimp.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The following changes since commit c148a0572130ff485cd2249fbdd1a3260d5e10a4:

  Merge remote-tracking branch 'remotes/rth/tags/pull-tcg-20211016' into staging (2021-10-16 11:16:28 -0700)

are available in the Git repository at:

  git@gitlab.com:bsdimp/qemu.git tags/pull-bsd-user-20211018-pull-request

for you to fetch changes up to 5abfac277d25feb5f12332422c03ea1cb21c6aa1:

  bsd-user/signal: Create a dummy signal queueing function (2021-10-18 12:51:39 -0600)

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

v2: Remove accidental module regression in patch 7 and try again.

----------------------------------------------------------------

Kyle Evans (1):
  bsd-user/mmap.c: Implement MAP_EXCL, required by jemalloc in head

Mikaël Urankar (2):
  bsd-user/mmap.c: Always zero MAP_ANONYMOUS memory in mmap_frag()
  bsd-user/mmap.c: check pread's return value to fix warnings with
    _FORTIFY_SOURCE

Stacey Son (1):
  bsd-user/errno_defs.h: Add internal error numbers

Warner Losh (19):
  bsd-user/mmap.c: MAP_ symbols are defined, so no need for ifdefs
  bsd-user/mmap.c: mmap return ENOMEM on overflow
  bsd-user/mmap.c: mmap prefer MAP_ANON for BSD
  bsd-user/mmap.c: Convert to qemu_log logging for mmap debugging
  bsd-user/mmap.c: Don't mmap fd == -1 independently from MAP_ANON flag
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
 19 files changed, 187 insertions(+), 263 deletions(-)
 create mode 100644 bsd-user/freebsd/meson.build
 create mode 100644 bsd-user/freebsd/os-sys.c

-- 
2.32.0


