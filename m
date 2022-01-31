Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 89C5A4A5047
	for <lists+qemu-devel@lfdr.de>; Mon, 31 Jan 2022 21:39:18 +0100 (CET)
Received: from localhost ([::1]:55710 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nEdSH-0002mZ-Ai
	for lists+qemu-devel@lfdr.de; Mon, 31 Jan 2022 15:39:17 -0500
Received: from eggs.gnu.org ([209.51.188.92]:42718)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1nEcnZ-0004k7-VE
 for qemu-devel@nongnu.org; Mon, 31 Jan 2022 14:57:14 -0500
Received: from [2607:f8b0:4864:20::d31] (port=37490
 helo=mail-io1-xd31.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1nEcmx-0002ai-5E
 for qemu-devel@nongnu.org; Mon, 31 Jan 2022 14:56:38 -0500
Received: by mail-io1-xd31.google.com with SMTP id n17so18416545iod.4
 for <qemu-devel@nongnu.org>; Mon, 31 Jan 2022 11:56:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ATb7RNykB1LqPzJwGi/U11Qfv50YTwsONvrFtGLBqQw=;
 b=DrI7cE6n+ywW9moJS8gNjJrgdQWeepB5H6JWOzpw36N/S5lI9R0xyOv66YkuoFJdcZ
 2qsoaGzPDegS3qkQBqoPC9rvVtPLayjdalHQ3HokdLHRhHL5ZkeI/ymg3SdqDdI4gfgL
 9gXHScG9cK9p5Fl1+4OfIFUMZ3oks3v6RbvAJ0TshEppLNVODFlkVqFcxynAwB6xnxfs
 uCAl32Se20ttOW1AvlbY7JuiAMtRpkM3kG8syh4Kv7TRfP73DOGZVZrsFl489AOepTDL
 qXq79NFMvjl5m0BlXhFm5NG9fhNcWTq61eiAhTxhOjzONugshx/uhHyWH8/r8kkbDUuv
 2K0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ATb7RNykB1LqPzJwGi/U11Qfv50YTwsONvrFtGLBqQw=;
 b=NMVWer+PtWzfehw/OY8WAyB84uu4Mq+psKgp7RC0XK7P8LwyRyW9jvxKWEQmaCAgcG
 w7RhjHxr4l/ym8gbl3vF4KrdcM5CpIquumL24SScWX94CKkZigY0A+3qt58++xnljrlT
 HEC7serzdJ1XOI3rMLFuVtOlthvrUnb709YpGf8zFnpO0aW+wGBgGTzD6uqcmF6cmuIZ
 NrFcoQDl2MzR55TQxfMYvkUiTE9QT7VWkY9itha5PYONliWUN+2r9D5qurUDMSU2xwu1
 UKuh/cSdqMGnNRZARC8f7EWBl8HizXbDvMMAls6zPsUrKjH9vzvGgr3buXP7RCPE6j+w
 LOdQ==
X-Gm-Message-State: AOAM5301xShQ6qe0WCZHlkc5Vjse7FZ0x4YC5m9ef5YEFajADGR2vCCh
 4gFjq4EbloUPsljBrnng62YDMSAT0eOoGg==
X-Google-Smtp-Source: ABdhPJyaByZfHp9d7jRk7/NOIAZtPDSVV25bDZ4V1+S+dVwig2ocpITcIP0cBJsJjG/sQY7ubzn81w==
X-Received: by 2002:a02:6988:: with SMTP id
 e130mr11297313jac.120.1643658990699; 
 Mon, 31 Jan 2022 11:56:30 -0800 (PST)
Received: from dune.bsdimp.com (50-253-99-174-static.hfc.comcastbusiness.net.
 [50.253.99.174])
 by smtp.gmail.com with ESMTPSA id j2sm1972989ilu.82.2022.01.31.11.56.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 31 Jan 2022 11:56:29 -0800 (PST)
From: Warner Losh <imp@bsdimp.com>
To: qemu-devel@nongnu.org
Subject: [PULL 00/40] Bsd user arm 2022q1 patches
Date: Mon, 31 Jan 2022 12:55:56 -0700
Message-Id: <20220131195636.31991-1-imp@bsdimp.com>
X-Mailer: git-send-email 2.33.1
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::d31
 (failed)
Received-SPF: none client-ip=2607:f8b0:4864:20::d31;
 envelope-from=imp@bsdimp.com; helo=mail-io1-xd31.google.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001, SPF_NONE=0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Kyle Evans <kevans@freebsd.org>,
 Richard Henderson <richard.henderson@linaro.org>, def@FreeBSD.org,
 jrtc27@FreeBSD.org, Warner Losh <imp@bsdimp.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The following changes since commit 7a1043cef91739ff4b59812d30f1ed2850d3d34e:

  Merge remote-tracking branch 'remotes/bonzini-gitlab/tags/for-upstream' into staging (2022-01-28 14:04:01 +0000)

are available in the Git repository at:

  git@gitlab.com:bsdimp/qemu.git tags/bsd-user-arm-2022q1-pull-request

for you to fetch changes up to 1103d59caaa82c94b4223a5429c31895d2f05217:

  bsd-user/freebsd/target_os_ucontext.h: Prefer env as arg name for CPUArchState args (2022-01-30 17:13:50 -0700)

----------------------------------------------------------------
bsd-user: upstream signal implementation

Upstream the bsd-user fork signal implementation, for the most part.  This
series of commits represents nearly all of the infrastructure that surround
signals, except the actual system call glue (that was also reworked in the
fork and needs its own series). In addition, this adds the sigsegv and sigbus
code to arm. Even in the fork, we don't have good x86 signal implementation,
so there's little to upstream for that at the moment.

bsd-user's signal implementation is similar to linux-user's. The full context
can be found in the bsd-user's fork's 'blitz branch' at
https://github.com/qemu-bsd-user/qemu-bsd-user/tree/blitz which shows how these
are used to implement various system calls. Since this was built from
linux-user's stack stuff, evolved for BSD with the passage of a few years, it
no-doubt missed some bug fixes from linux-user (though nothing obvious stood out
in the quick comparison I made). After the first round of reviews, many of these
improvements have been incorporated.

Patchew history: https://patchew.org/QEMU/20220125012947.14974-1-imp@bsdimp.com/

----------------------------------------------------------------

Warner Losh (40):
  bsd-user: Complete FreeBSD siginfo
  bsd-user: Create setup_sigframe_arch to setup sigframe context
  bsd-user/arm/signal.c: Implement setup_sigframe_arch for arm
  bsd-user/arm/signal.c: get_mcontext should zero vfp data
  bsd-user: Remove vestiges of signal queueing code
  bsd-user: Bring in docs from linux-user for signal_pending
  bsd-user/arm/target_arch_cpu.h: Move EXCP_ATOMIC to match linux-user
  bsd-user/signal.c: implement force_sig_fault
  bsd-user/signal-common.h: Move signal functions prototypes to here
  bsd-user/signal.c: Implement cpu_loop_exit_sigsegv
  bsd-user/signal.c: implement cpu_loop_exit_sigbus
  bsd-user/arm/arget_arch_cpu.h: Move EXCP_DEBUG and EXCP_BKPT together
  bsd-user/arm/target_arch_cpu.h: Correct code pointer
  bsd-user/arm/target_arch_cpu.h: Use force_sig_fault for EXCP_UDEF
  bsd-user/arm/target_arch_cpu.h: Implement data faults
  bsd-user/signal.c: implement abstract target / host signal translation
  bsd-user/signal.c: Implement signal_init()
  bsd-user/signal.c: Add si_type argument to queue_signal
  bsd-user/host/arm/host-signal.h: Implement host_signal_*
  bsd-user/host/i386/host-signal.h: Implement host_signal_*
  bsd-user/host/x86_64/host-signal.h: Implement host_signal_*
  bsd-user: Add host signals to the build
  bsd-user: Add trace events for bsd-user
  bsd-user/signal.c: host_to_target_siginfo_noswap
  bsd-user/signal.c: Implement rewind_if_in_safe_syscall
  bsd-user/signal.c: Implement host_signal_handler
  bsd-user/strace.c: print_taken_signal
  bsd-user/signal.c: Implement dump_core_and_abort
  bsd-user/signal.c: Fill in queue_signal
  bsd-user/signal.c: sigset manipulation routines.
  bsd-user/signal.c: setup_frame
  bsd-user/signal.c: handle_pending_signal
  bsd-user/signal.c: tswap_siginfo
  bsd-user/signal.c: process_pending_signals
  bsd-user/signal.c: implement do_sigreturn
  bsd-user/signal.c: implement do_sigaction
  bsd-user/signal.c: do_sigaltstack
  MAINTAINERS: Add tests/vm/*bsd to the list to get reviews on
  bsd-user: Rename arg name for target_cpu_reset to env
  bsd-user/freebsd/target_os_ucontext.h: Prefer env as arg name for
    CPUArchState args

 MAINTAINERS                           |    1 +
 bsd-user/arm/signal.c                 |   59 +-
 bsd-user/arm/target_arch_cpu.h        |  101 +--
 bsd-user/freebsd/target_os_siginfo.h  |   15 +-
 bsd-user/freebsd/target_os_signal.h   |    3 +
 bsd-user/freebsd/target_os_ucontext.h |    6 +-
 bsd-user/host/arm/host-signal.h       |   35 +
 bsd-user/host/i386/host-signal.h      |   37 +
 bsd-user/host/x86_64/host-signal.h    |   37 +
 bsd-user/i386/signal.c                |   13 +
 bsd-user/i386/target_arch_cpu.h       |    5 +-
 bsd-user/main.c                       |   14 +-
 bsd-user/qemu.h                       |   66 +-
 bsd-user/signal-common.h              |   70 ++
 bsd-user/signal.c                     | 1008 ++++++++++++++++++++++++-
 bsd-user/strace.c                     |   97 +++
 bsd-user/syscall_defs.h               |    1 +
 bsd-user/trace-events                 |   11 +
 bsd-user/trace.h                      |    1 +
 bsd-user/x86_64/signal.c              |   13 +
 bsd-user/x86_64/target_arch_cpu.h     |    5 +-
 meson.build                           |    6 +-
 22 files changed, 1490 insertions(+), 114 deletions(-)
 create mode 100644 bsd-user/host/arm/host-signal.h
 create mode 100644 bsd-user/host/i386/host-signal.h
 create mode 100644 bsd-user/host/x86_64/host-signal.h
 create mode 100644 bsd-user/signal-common.h
 create mode 100644 bsd-user/trace-events
 create mode 100644 bsd-user/trace.h

-- 
2.33.1


