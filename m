Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 81B6741418E
	for <lists+qemu-devel@lfdr.de>; Wed, 22 Sep 2021 08:17:54 +0200 (CEST)
Received: from localhost ([::1]:39390 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mSvZp-000443-0V
	for lists+qemu-devel@lfdr.de; Wed, 22 Sep 2021 02:17:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52480)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1mSvWn-0001Hn-MR
 for qemu-devel@nongnu.org; Wed, 22 Sep 2021 02:14:46 -0400
Received: from mail-il1-x12d.google.com ([2607:f8b0:4864:20::12d]:42734)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1mSvWl-0007RI-TP
 for qemu-devel@nongnu.org; Wed, 22 Sep 2021 02:14:45 -0400
Received: by mail-il1-x12d.google.com with SMTP id m4so1543589ilj.9
 for <qemu-devel@nongnu.org>; Tue, 21 Sep 2021 23:14:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=D0OlmnHfmBTGvtrpcw2Y/MU7muBhTLcbvOTChL5Pw4o=;
 b=4KWsVBZBxCycVLLAAHIkbSSw/uZsiMjg3TW1JAP5bMepbazSZcomvgRRR1JdyW0snC
 9jBPkCBQgHv06PeFoy8vAhRoRwWoTlDm8YSs0a7yqtWFgPdE4sEGMYaQnj/yUtUu1X//
 nWebRl+0VV4RHZLhiFG7aNMAPzWMhrh5504d12c/6ot+yr4LKfLc+RyzKn1k3phOkYyG
 OGRS8ScbdPd67I541CbzX0XXTKe5Vhes3Nxw01BDlyvn9Epwf5uFH9wGSbe3A+xxu2Sj
 ReTUqHF+Vefk/z7TgwbzfpKp33b1ce6he4HUVYQNi91404FIAIiDlx1XxjmxtPlsfT9U
 fUpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=D0OlmnHfmBTGvtrpcw2Y/MU7muBhTLcbvOTChL5Pw4o=;
 b=fnvVe7KaVqZB4EoV8W7G6uAaj8Wf6jQNFB69YFroP8t2YRz4ZOYbAv0wM5hsRdICsy
 l2vowH62bxVtNAmOcA9Bijv4luA23i0sS2HmmniCmEZkhDo3FRgJeh6mTt3hQoP+1E4r
 C6MrbRbKEmZp2imFSERq/UKpK5nKmJ81HJ8zXdODwo5hBjKedbo/DkeQJWIjYU3KxEuT
 e/nDm6YKm+vxLI0gYV7/yUeZKAxlEyJXxc7H+5LTiuLrLa3KzSNQHOnpRenztlx0JKT1
 b3KCWcmmG1Dl3Jt8H4/uLv/L3BAknecMQIRlhP2sVrwAju3rcAcz3RJ1BrMTPkrOzjD+
 /2MQ==
X-Gm-Message-State: AOAM530DvWctFVLJyzVaz0joaB4t0rOiqGjfdnUx5//Mu55pVVZLrPL7
 5bgMSfo/eXc8LwKdIYVEUVmLP8BU/8jb7oLzIkI=
X-Google-Smtp-Source: ABdhPJybTrJB68E6X97bT9S2IBXfuu74UnZfeQcAZZ5Uqad3ap8TZ/gUxIHVKUmvLybj5u9H8486Wg==
X-Received: by 2002:a05:6e02:d8c:: with SMTP id
 i12mr2334117ilj.190.1632291281663; 
 Tue, 21 Sep 2021 23:14:41 -0700 (PDT)
Received: from dune.bsdimp.com (50-253-99-174-static.hfc.comcastbusiness.net.
 [50.253.99.174])
 by smtp.gmail.com with ESMTPSA id a25sm540817ioq.46.2021.09.21.23.14.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Sep 2021 23:14:41 -0700 (PDT)
From: Warner Losh <imp@bsdimp.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 00/14] bsd-user: misc cleanup for aarch64 import
Date: Wed, 22 Sep 2021 00:14:24 -0600
Message-Id: <20210922061438.27645-1-imp@bsdimp.com>
X-Mailer: git-send-email 2.32.0
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
Cc: Kyle Evans <kevans@freebsd.org>, richard.henderson@linaro.org,
 f4bug@amsat.org, Warner Losh <imp@bsdimp.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Prepare for aarch64 support (the next architecture to be upstreamed). As the
aarch64 emulation is more complete, it relies on a number of different items.
In some cases, I've pulled in the full support from bsd-user fork. In other
cases I've created a simple stub (as is the case for signals, which have
independent changes pending, so I wanted to be as minimal as possible.  Since
all pre-12.2 support was purged from the bsd-user fork, go ahead and remove it
here. FreeBSD 11.x goes ouft of support at the end of the month. Remove what
little multi-version support that's in upstream.

The aarch64 patch set will be published soon after some of the dust settles.

Stacey Son (1):
  bsd-user/errno_defs.h: Add internal error numbers

Warner Losh (13):
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
  bsd-user/sysarch: Provide a per-arch framework for sysarch syscall
  bsd-user: Rename sigqueue to qemu_sigqueue
  bsd-user/signal: Create a dummy signal queueing function

 bsd-user/errno_defs.h                |  14 +++-
 bsd-user/freebsd/meson.build         |   3 +
 bsd-user/freebsd/os-sys.c            |  28 ++++++++
 bsd-user/freebsd/strace.list         |  11 ---
 bsd-user/freebsd/target_os_elf.h     |  12 ++--
 bsd-user/freebsd/target_os_signal.h  |   3 +
 bsd-user/freebsd/target_os_user.h    | 100 +--------------------------
 bsd-user/i386/target_arch_cpu.h      |   2 -
 bsd-user/i386/target_arch_signal.h   |   2 -
 bsd-user/main.c                      |  10 ++-
 bsd-user/meson.build                 |   6 ++
 bsd-user/qemu.h                      |  24 ++++---
 bsd-user/signal.c                    |   8 +++
 bsd-user/syscall.c                   |  60 ++--------------
 bsd-user/x86_64/target_arch_cpu.h    |   2 -
 bsd-user/x86_64/target_arch_signal.h |   2 -
 16 files changed, 96 insertions(+), 191 deletions(-)
 create mode 100644 bsd-user/freebsd/meson.build
 create mode 100644 bsd-user/freebsd/os-sys.c

-- 
2.32.0


