Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C98A6D89AB
	for <lists+qemu-devel@lfdr.de>; Wed,  5 Apr 2023 23:37:48 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pkAoD-0005Ja-KS; Wed, 05 Apr 2023 17:36:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1pkAnv-0005HM-JE
 for qemu-devel@nongnu.org; Wed, 05 Apr 2023 17:36:32 -0400
Received: from mail-il1-x12d.google.com ([2607:f8b0:4864:20::12d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1pkAnt-0005Zx-7q
 for qemu-devel@nongnu.org; Wed, 05 Apr 2023 17:36:31 -0400
Received: by mail-il1-x12d.google.com with SMTP id q8so4884142ilo.1
 for <qemu-devel@nongnu.org>; Wed, 05 Apr 2023 14:36:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20210112.gappssmtp.com; s=20210112; t=1680730586;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=T6JI4BjleIS5hRl6ushawP+HuvKR9hsFrJwqEUow0ME=;
 b=4jU7R0fdLnEZ+/BSc+FGJlXBdIuCMdsiXeHWebcA0yMoXoIojtrXBSiP+cLHa89+Ol
 xhtTDaIhnVMzqVsO0rAFpvmX57rOH6uD14J1fvkpajuNnD+MMD45ocsCbNyDyIdMoAHx
 WSpkt2tKFYRc6LeXwM/YUgaQKYZftOZ1SRxXQOBkehxvXYMs+fcpdKEngFVXjAO6xv/p
 0RpItb9dVuF9qtmhTWHX3hI2YJdUP0sHQLzRaztvis9bTfGgp+Qt0ZeMRrmOP0INAiWw
 6RoOdnexuaR/wubzBkznkTwb9nqdFOS0C1DvyyKq16vGd+2ycBbBGcmMNB8aQIkhfAu4
 9pZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680730586;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=T6JI4BjleIS5hRl6ushawP+HuvKR9hsFrJwqEUow0ME=;
 b=kZ4w/tmJjVJlsOtdQUSElgHwOmzzKbx1IUpBBK6emoxmNBlJXK/Fod4hfaBzEVHjBp
 iYq6CMrSZcctaeOzfilW2/ECCUm2J7MxJuwoxBDARv/SdmfMFjCrE9Ru9nx776JHqR1U
 hXF52XhV6lFT21+YHqOeSKwUxWEoLOnCTh3pSM7kF8Y+lwmE0J7ZwW8Xg+/5cHbT/M1X
 PcWsmxHXv/EjgeCnFJO1tlcDZGXjMNon48HQ/6PFLXtiDYOwdBTw1hUoYXJP4h1DmA5W
 Bj4dA5KUPiK0gQo+HOWICUVsHuhYxm1W9F28pMu3gq8/369sVcvOancWTM9sTY15ZXDy
 20Aw==
X-Gm-Message-State: AAQBX9cbB2bn9VnuemwrNSaixgMutLV252gaIqdZuPuIWRUQqaCMdzUW
 8vVBzxNFc1buVyGFG/O4fk6f5iDpRhcgO0n08Jw=
X-Google-Smtp-Source: AKy350ZP3E+zQ8vZgDyEZkG66YDVuBbk5Ajw2s1hbFV8XHWX7sydFCF0FKtN9nu8yLBKfIRKvFKllQ==
X-Received: by 2002:a92:c086:0:b0:317:9945:6059 with SMTP id
 h6-20020a92c086000000b0031799456059mr5390273ile.23.1680730586550; 
 Wed, 05 Apr 2023 14:36:26 -0700 (PDT)
Received: from dune.bsdimp.com (c-71-237-47-177.hsd1.co.comcast.net.
 [71.237.47.177]) by smtp.gmail.com with ESMTPSA id
 i18-20020a926d12000000b003261b6acc8asm4110473ilc.79.2023.04.05.14.36.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 05 Apr 2023 14:36:26 -0700 (PDT)
From: Warner Losh <imp@bsdimp.com>
To: qemu-devel@nongnu.org
Cc: reinoud@netbsd.org, riastradh@netbsd.org, ryoon@netbsd.org,
 jrtc27@jrtc27.com, Warner Losh <imp@bsdimp.com>, kevans@freebsd.org,
 Brad Smith <brad@comstyle.com>
Subject: [PATCH 00/16] bsd-user 2023 Q2 first batch
Date: Wed,  5 Apr 2023 15:35:56 -0600
Message-Id: <20230405213612.15942-1-imp@bsdimp.com>
X-Mailer: git-send-email 2.40.0
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::12d;
 envelope-from=imp@bsdimp.com; helo=mail-il1-x12d.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

This series is a number of misc cleanups.

First, this replaces my plans to remove netbsd and openbsd code entirely. I've
been in contact with the NetBSD folks that would like to make things work. The
plan is that I'll not remove it in qemu-project, and restore them in bsd-user
fork. These changes clean up some of the mess that's here: I've moved the bits
that make sense here, and removed the ones that don't (but upstream I've moved
them when it makes sense). My intention is to work with the NetBSD folks (and
OpenBSD too if they want) to cope with the structural issues I'm aware of in
bsd-user fork. Future contributions should go via that route at a rate of
contributions (I have little time to do the work, but will commit to finding
time to do the coordination and review work).

Next I've #ifdef'd some mmap handling based on certain flags being defined or
not. This was something I'd removed before, and were in what Taylor sent me, so
I've restored the relevant ones. The rest of the patch that Taylor sent me
conflicts with bsd-user and needs some work to get it in upstream. I removed a
few unused mmap defines as well. And I cleanup mmap.c to remove gratuitous
differences and pass checkpatch.pl.

Next, I've made unimplmeneted system calls generate SIGSYS. For the moment, this
is the best we should do since so much is unimplemented and as things get
implemented this will allow controlled testing of code to ensure it doesn't
silently succeed, giving the impression things are working when they aren't. I
also add SIGSYS to the uncaught coredump signal list, to match FreeBSD's
behavior. I only do this on arm, though, because the signal implementation on
x86 is incomplete (even upstream) and I didn't want to take chances.

Finally, I've included the core dump code. There's about 600 lines of sysctl
support that I've included as separate commits of ~150 lines each (and
incidentlaly, added the translation to os-sys.c for those bits). The core dump
code itself is largely copied from linux-user/elfload.c by sson (so he gets the
author credit). I moved it to elfcore.c when I was upstremaing in the past and
upstreamed a stub. One of the patches in this series replaces elfcore.c and is
1300 lines long. It's not easily sliced up into smaller bits that compile, but
I'm open to suggestions. It's known to "work" in the sense that it will generate
core files that gdb can read and intelligently parse.

This patch series is for after 8.0 is done, but before any GSoC projects start,
and will be independent of any GSoC contribution tasks.

Stacey Son (6):
  bsd-user: h2g_rusage
  bsd-user: Implmenet do_sysctl_kern_getprocs
  bsd-user: Implement do_sysctl_kern_proc_filedesc
  bsd-user: Implement do_sysctl_kern_proc_vmmap
  bsd-user: Implement sysctl kern.proc, except kern.proc.full_path
  bsd-user: Implment core dumps

Warner Losh (10):
  bsd-user: Make print_* public
  bsd-user: Ifdef a few MAP_ constants for NetBSD
  bsd-user: Cleanup style.
  bsd-user: Move system FreeBSD call table to freebsd/os-syscall.c
  bsd-user: Remove NetBSD specific syscall printing
  bsd-user: Remove OpenBSD specific syscall printing
  bsd-user: Move system call include to os-syscall.h
  bsd-user: Remove useless mmap definitions
  bsd-user: Add SIGSYS to core dump signals.
  bsd-user: Implement SIGSYS on arm

 bsd-user/arm/target_arch_cpu.h |    8 +
 bsd-user/bsd-proc.c            |   48 ++
 bsd-user/elfcore.c             | 1318 +++++++++++++++++++++++++++++++-
 bsd-user/freebsd/os-sys.c      |  508 +++++++++++-
 bsd-user/freebsd/os-syscall.c  |   19 +
 bsd-user/freebsd/os-syscall.h  |   21 +
 bsd-user/meson.build           |    1 +
 bsd-user/mmap.c                |  101 ++-
 bsd-user/netbsd/os-syscall.h   |   16 +
 bsd-user/openbsd/os-syscall.h  |   16 +
 bsd-user/qemu-bsd.h            |   30 +
 bsd-user/qemu.h                |   44 +-
 bsd-user/signal.c              |   13 +-
 bsd-user/strace.c              |   88 +--
 bsd-user/syscall_defs.h        |   69 +-
 15 files changed, 2106 insertions(+), 194 deletions(-)
 create mode 100644 bsd-user/bsd-proc.c
 create mode 100644 bsd-user/freebsd/os-syscall.h
 create mode 100644 bsd-user/netbsd/os-syscall.h
 create mode 100644 bsd-user/openbsd/os-syscall.h
 create mode 100644 bsd-user/qemu-bsd.h

-- 
2.40.0


