Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3886A301E11
	for <lists+qemu-devel@lfdr.de>; Sun, 24 Jan 2021 19:13:15 +0100 (CET)
Received: from localhost ([::1]:34398 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l3jsv-0005Qk-QB
	for lists+qemu-devel@lfdr.de; Sun, 24 Jan 2021 13:13:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47272)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l3jrG-0003wX-Su
 for qemu-devel@nongnu.org; Sun, 24 Jan 2021 13:11:30 -0500
Received: from mail-pg1-x533.google.com ([2607:f8b0:4864:20::533]:36669)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l3jrD-0003UR-Hc
 for qemu-devel@nongnu.org; Sun, 24 Jan 2021 13:11:30 -0500
Received: by mail-pg1-x533.google.com with SMTP id c132so7400694pga.3
 for <qemu-devel@nongnu.org>; Sun, 24 Jan 2021 10:11:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=A2cucgMAaHCM2Tiv42Za0EMFefDLoffurjsh3p2wyLg=;
 b=B4fTjLEkKMGqlMIrN/gHOMpDxjHTxctmhDnADrekF6dvxirHr/Oyz/t5C1jFwXERh4
 3PCQanbuqXNBpN253D/2484tRjeGVyvtFi1ca/f/ChTy4YDZDzLVV53fuWcbI4XPTzt4
 GqJfapI6d1AkcZXHhV06tAMFxRFHTf7vgufKJ6dlILbFIXBDILdg2+NHW8pY7viNx/xS
 M0xQgu++ESnbN2xHtv3IS2OUr83SdDNs8zA2tKSRERJUO8RNd7Lva0xs4veblV2B31JB
 t408n5hUIYAogU3tZTnyGxA8c/65h2hN68RygRRS6w18QfT7vqHrjX0VhFKGjDGCNM29
 7wsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=A2cucgMAaHCM2Tiv42Za0EMFefDLoffurjsh3p2wyLg=;
 b=gjL0pAGxTQJxDHkyLGcEil8GEGo+DAoMGv8UgYsALeZqdRdk5G1cMS5ojLUWIkL5F+
 2U+pOIQwanPDTWX6sAaWz9Sb6GMofhUOoM2zHJ0HzEMIi+1X7A+6gXsdfJLByrJBecwD
 TCH0jDeDQfuFiCj9m9pK/FxxaIuGbzisxDaeR/ti5M1EBnBk3fBlk3G8/tvHtIRKiYcr
 Hsd/83JnxSzw58Ecqc/T8NN81ta2HPG+qs7PPNNfnhcJrYS4w1Y224IOxAAmJbXbiwoG
 vh0FjJTmWY+SM7p1GKGw32Smx2kdz5eYDz9jD+Ybhvegk1gWpRQP2s3ShiqZHP+5QuVM
 tXlA==
X-Gm-Message-State: AOAM533G/eq2gdc9fV8ZzgUV10Qj2gvDQDT/91dwBgkx2H1JQtqI/RD+
 JNXJ5UUCiQL0TH3OwNxDNpUQ1J+XpDzyQw==
X-Google-Smtp-Source: ABdhPJxnSoeF1ygX4AhvwxS5uSGQUl6zvHyTgTmf1q9mUkGDT9Z5pjFAjHnCu88E6eUWawft1hS2dg==
X-Received: by 2002:a65:6409:: with SMTP id a9mr14449617pgv.171.1611511885882; 
 Sun, 24 Jan 2021 10:11:25 -0800 (PST)
Received: from localhost.localdomain (cpe-66-27-222-29.hawaii.res.rr.com.
 [66.27.222.29])
 by smtp.gmail.com with ESMTPSA id 123sm14547629pgf.38.2021.01.24.10.11.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 24 Jan 2021 10:11:24 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL v2 00/10] tcg patch queue
Date: Sun, 24 Jan 2021 08:11:21 -1000
Message-Id: <20210124181122.5447-1-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::533;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x533.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: peter.maydell@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


V2 replaces the tcg const temp overflow patch.


r~


The following changes since commit 0e32462630687a18039464511bd0447ada5709c3:

  Merge remote-tracking branch 'remotes/vivier2/tags/linux-user-for-6.0-pull-request' into staging (2021-01-22 10:35:55 +0000)

are available in the Git repository at:

  https://gitlab.com/rth7680/qemu.git tags/pull-tcg-20210124

for you to fetch changes up to ae30e86661b0f48562cd95918d37cbeec5d02262:

  tcg: Restart code generation when we run out of temps (2021-01-24 08:03:27 -1000)

----------------------------------------------------------------
Fix tcg constant temp overflow.
Fix running during atomic single-step.
Partial support for apple silicon.
Cleanups for accel/tcg.

----------------------------------------------------------------
Douglas Crosher (1):
      tcg: update the cpu running flag in cpu_exec_step_atomic

Philippe Mathieu-Daudé (4):
      accel/tcg: Make cpu_gen_init() static
      accel/tcg: Restrict tb_gen_code() from other accelerators
      accel/tcg: Declare missing cpu_loop_exit*() stubs
      accel/tcg: Restrict cpu_io_recompile() from other accelerators

Richard Henderson (4):
      qemu/compiler: Split out qemu_build_not_reached_always
      tcg: Optimize inline dup_const for MO_64
      accel/tcg: Move tb_flush_jmp_cache() to cputlb.c
      tcg: Restart code generation when we run out of temps

Roman Bolshakov (1):
      tcg: Toggle page execution for Apple Silicon

 accel/tcg/internal.h      | 20 ++++++++++++++++++++
 include/exec/exec-all.h   | 11 -----------
 include/qemu/compiler.h   |  5 +++--
 include/qemu/osdep.h      | 28 ++++++++++++++++++++++++++++
 include/tcg/tcg.h         |  6 +++++-
 accel/stubs/tcg-stub.c    | 10 ++++++++++
 accel/tcg/cpu-exec.c      |  7 +++++++
 accel/tcg/cputlb.c        | 19 +++++++++++++++++++
 accel/tcg/translate-all.c | 38 +++++++++++++++++++-------------------
 tcg/tcg.c                 | 12 +++++++++---
 10 files changed, 120 insertions(+), 36 deletions(-)
 create mode 100644 accel/tcg/internal.h

