Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 84EA08E2EC
	for <lists+qemu-devel@lfdr.de>; Thu, 15 Aug 2019 04:54:23 +0200 (CEST)
Received: from localhost ([::1]:37886 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hy5uA-0002HG-Hk
	for lists+qemu-devel@lfdr.de; Wed, 14 Aug 2019 22:54:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48576)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <vandersonmr2@gmail.com>) id 1hy5MI-0000NM-2r
 for qemu-devel@nongnu.org; Wed, 14 Aug 2019 22:19:23 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <vandersonmr2@gmail.com>) id 1hy5MG-0001Wj-Oo
 for qemu-devel@nongnu.org; Wed, 14 Aug 2019 22:19:21 -0400
Received: from mail-qk1-x744.google.com ([2607:f8b0:4864:20::744]:40203)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <vandersonmr2@gmail.com>)
 id 1hy5MG-0001Vo-FM
 for qemu-devel@nongnu.org; Wed, 14 Aug 2019 22:19:20 -0400
Received: by mail-qk1-x744.google.com with SMTP id s145so756908qke.7
 for <qemu-devel@nongnu.org>; Wed, 14 Aug 2019 19:19:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=q5IwxFI6U3eIeJIU6dOTm2X8gX2OECsbQj5QIEGwyS8=;
 b=e/QmptFW+8drXwGm++NLduq7qm6VQzPIqG9wxCvYREj5QUTCG+PX4TWskvoQ1QiJd7
 1bn1KQFB+4tIzGzXk8lGCKI0pDf6aG3ZEKF1BTNvQIOU6yPBn2XrDorsQ4/0iGfNEdO7
 hzngrDhXvT+Ox9x8xf1FoKA5b5mVzD9ZgW9UeXXRspL/UQF2jXiZkDhuf3X+AhZsRquw
 IhIAF/aYyxMeRqkoBPeGaXyPEsE8z9R9KOT3COnq3wFh/q9g67FDnjVit2uP4ZTZLy7v
 F7EmZA0sTGe5oYfPTttWVgrcUzz5OTQv2FDBWP4vDOsbhvELxXQDMr91CQovzFIuq7yz
 1VMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=q5IwxFI6U3eIeJIU6dOTm2X8gX2OECsbQj5QIEGwyS8=;
 b=C4B/1LXUjn0FQ6ymMKU9MzpyiEYucFOB1JHHs5RHsnjE8CKjohQdKSWHomtEdGbK6V
 d0J+ak7yMulessBo6LGp07JFBblsC/6jiHlXyvvfeWAZRwhlV5pBUFlqY/xY3Dm+oK9U
 0d5YT0FqBIUePFsZNKpC4BYSh9a2gO+il6WHODjELYEyiGh/QGY6wEe4U+4y6dBWymWH
 Cd3IlXdOB/e/n04ttQXDXiWTc/5A/iQVazQjq5j+fdDWEzDUEGFHy7gDNOhTVomgkU8H
 mzcrvHb12NAyc0WEe5QaXbc8jG8oSY4dCXFcgTAtsTqF3diLv4BH+o65XrIv6ZaMJTRV
 Hcjw==
X-Gm-Message-State: APjAAAXN8fhXquhbrYhzGW4x/1K5dRTS/UqGAnVXT4/fYH5jp4TO3Gj3
 4M0q/KSJ38ENfmJyHdjppX0fp51y++g=
X-Google-Smtp-Source: APXvYqycX5VO8PN6CslgtjHJjUZPmQDKmaJ1LfoY1UW1+zmWBRB7yI62zWyH1DsIgjQwC4Z+Y+lu5w==
X-Received: by 2002:a37:dc45:: with SMTP id v66mr2126808qki.24.1565835558682; 
 Wed, 14 Aug 2019 19:19:18 -0700 (PDT)
Received: from localhost.localdomain ([2804:14c:482:121::1])
 by smtp.googlemail.com with ESMTPSA id o5sm757943qkf.10.2019.08.14.19.19.17
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Wed, 14 Aug 2019 19:19:18 -0700 (PDT)
From: vandersonmr <vandersonmr2@gmail.com>
To: qemu-devel@nongnu.org
Date: Wed, 14 Aug 2019 23:18:47 -0300
Message-Id: <20190815021857.19526-1-vandersonmr2@gmail.com>
X-Mailer: git-send-email 2.22.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::744
Subject: [Qemu-devel] [PATCH v5 00/10] Measure Tiny Code Generation Quality
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
Cc: vandersonmr <vandersonmr2@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This patch is part of Google Summer of Code (GSoC) 2019.
More about the project can be found in:
https://wiki.qemu.org/Internships/ProjectIdeas/TCGCodeQuality

The goal of this patch is to add infrastructure to collect
execution and JIT statistics during the emulation with accel/TCG.
The statistics are stored in TBStatistic structures (TBStats)
with each TB having its respective TBStats.

We added -d tb_stats and HMP tb_stats commands to allow the control
of this statistics collection. And info tb, tbs, and coverset commands
were also added to allow dumping and exploring all this information
while emulating.

Collecting these statistics and information is useful to understand
qemu performance and to help to add the support for traces to QEMU. 

v5:
 - full replacement of CONFIG_PROFILER
 - several fixes
 - adds "info cfg"
 - adds TB's targets to dump

vandersonmr (10):
  accel: introducing TBStatistics structure
  accel: collecting TB execution count
  accel: collecting JIT statistics
  accel: replacing part of CONFIG_PROFILER with TBStats
  accel: adding TB_JIT_TIME and full replacing CONFIG_PROFILER
  log: adding -d tb_stats to control tbstats
  monitor: adding tb_stats hmp command
  Adding info [tbs|tb|coverset] commands to HMP. These commands allow
    the exploration of TBs generated by the TCG. Understand which one
    hotter, with more guest/host instructions... and examine their
    guest, host and IR code.
  monitor: adding new info cfg command
  linux-user: dumping hot TBs at the end of the execution

 accel/tcg/Makefile.objs      |   2 +-
 accel/tcg/cpu-exec.c         |   4 +
 accel/tcg/perf/Makefile.objs |   1 +
 accel/tcg/tb-stats.c         | 865 +++++++++++++++++++++++++++++++++++
 accel/tcg/tcg-runtime.c      |   7 +
 accel/tcg/tcg-runtime.h      |   2 +
 accel/tcg/translate-all.c    | 133 ++++--
 accel/tcg/translator.c       |   6 +
 configure                    |   3 -
 cpus.c                       |  14 +-
 disas.c                      |  31 +-
 hmp-commands-info.hx         |  31 ++
 hmp-commands.hx              |  17 +
 include/exec/exec-all.h      |  15 +-
 include/exec/gen-icount.h    |  10 +
 include/exec/tb-context.h    |  12 +
 include/exec/tb-hash.h       |   7 +
 include/exec/tb-stats.h      | 142 ++++++
 include/qemu-common.h        |  16 +
 include/qemu/log-for-trace.h |   4 +
 include/qemu/log.h           |   3 +
 include/qemu/timer.h         |   5 +-
 linux-user/exit.c            |   4 +
 monitor/misc.c               | 171 ++++++-
 tcg/tcg.c                    | 231 +++-------
 tcg/tcg.h                    |  22 +-
 util/log.c                   |  90 +++-
 vl.c                         |   8 +-
 28 files changed, 1572 insertions(+), 284 deletions(-)
 create mode 100644 accel/tcg/perf/Makefile.objs
 create mode 100644 accel/tcg/tb-stats.c
 create mode 100644 include/exec/tb-stats.h

-- 
2.22.0


