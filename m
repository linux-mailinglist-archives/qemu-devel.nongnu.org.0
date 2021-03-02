Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 161C332A8AD
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Mar 2021 19:01:57 +0100 (CET)
Received: from localhost ([::1]:36158 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lH9LI-0006i5-3E
	for lists+qemu-devel@lfdr.de; Tue, 02 Mar 2021 13:01:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59084)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lH9HH-0002Gw-7i
 for qemu-devel@nongnu.org; Tue, 02 Mar 2021 12:57:47 -0500
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e]:44445)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lH9HE-0007Vy-Vc
 for qemu-devel@nongnu.org; Tue, 02 Mar 2021 12:57:46 -0500
Received: by mail-pl1-x62e.google.com with SMTP id a24so12449468plm.11
 for <qemu-devel@nongnu.org>; Tue, 02 Mar 2021 09:57:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=zDASf8p/eBjd0f8aBbOjr7ESZUyWpkVJF8rrOidqvGA=;
 b=loGEpozVNYM3WbDIxBp9vXpElDtpQboqcxaIhrdKnoLJL0vV204DqTd1ZvobWUpIHL
 zomn3bMQoLb5AFzr8ctnOo8enQ41HikM4OiBwUZ/KmTrKO3Qi5Sonilk2NxRYdctkoeQ
 Bmno9Wy2ExyWpR5ADvTfu1oJdZshYhhd+Qe7hkN3x/7R5huOiQi/0gCVpNE//Xz1Btci
 TseSmWFQQZ7JPzlHaL0i0OMNU4md6aTTt2SpzFh3nvaxSKe3cB+MPdFqoUSs6eYkmon6
 +A7kzXddpnA1/lQi5rpxhOoDzGjpBi56eY/SkVsChxiGHplQq4cDfrm7Vrt66yimyuY1
 IGnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=zDASf8p/eBjd0f8aBbOjr7ESZUyWpkVJF8rrOidqvGA=;
 b=JJdCsUoIn/tVBMm4VM3k+c4pafmOoI+oy72pTPcE+obVGWpVCOjc/NuCfcRdpVwBUW
 /6WegnjDUoaQLVJp+r/0aB/PgiyUv7xGOyVZn6fZzLdtI2uFlcJa5ogQe0JQt2bg210s
 lJZLImmDPxzCBEvP3e5ElcgpN5efaUPCWzj3FJz4bots9tN3vLmDANJk6Sam9MjghsHx
 qZerKZOVMTKNxqJbiYrYDJitk40yYsdFLSUTOj/Uh2CIeO/yLNQgrALiFklAjmZIHY0t
 GJ5kQKCS1uvHuShvGOfb9jjPr+nimzwa4o4hc0qOmtWf326q/taax7ACdKT+eBzkow1e
 f40g==
X-Gm-Message-State: AOAM531mInLK48nId5dEyWM2rtk3B/baYCIw9/+fDxAefTHnifXRWTdX
 cEnwJRLhe1nBzR9652GZV+UYwsGqUD0aFw==
X-Google-Smtp-Source: ABdhPJy+AuTFV8Rw+tMYogX5A2+klmL4h9L0RXPCLCwmrFlohDF1FiTSl8HL8M04rWOMWR5o6/hcaQ==
X-Received: by 2002:a17:902:9b91:b029:e2:898c:d721 with SMTP id
 y17-20020a1709029b91b02900e2898cd721mr4461427plp.32.1614707863210; 
 Tue, 02 Mar 2021 09:57:43 -0800 (PST)
Received: from localhost.localdomain (174-21-84-25.tukw.qwest.net.
 [174.21.84.25])
 by smtp.gmail.com with ESMTPSA id gf20sm4232234pjb.39.2021.03.02.09.57.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Mar 2021 09:57:42 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 00/27] tcg patch queue
Date: Tue,  2 Mar 2021 09:57:14 -0800
Message-Id: <20210302175741.1079851-1-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62e.google.com
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
Cc: alex.bennee@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Pulling together some cleanups, fixes, and prepatory tci stuff.
Most of this has been reviewed, but not all.

Those lacking review:

01-tcg-aarch64-Fix-constant-subtraction-in-tcg_out_adds.patch
02-tcg-aarch64-Fix-I3617_CMLE0.patch
03-tcg-aarch64-Fix-generation-of-scalar-vector-operatio.patch
04-tcg-tci-Use-exec-cpu_ldst.h-interfaces.patch
06-tcg-Manage-splitwx-in-tc_ptr_to_region_tree-by-hand.patch
23-accel-tcg-rename-tb_lookup__cpu_state-and-hoist-stat.patch
24-accel-tcg-move-CF_CLUSTER-calculation-to-curr_cflags.patch
25-accel-tcg-drop-the-use-of-CF_HASH_MASK-and-rename-pa.patch
26-include-exec-lightly-re-arrange-TranslationBlock.patch
27-accel-tcg-Precompute-curr_cflags-into-cpu-tcg_cflags.patch

Alex, the last patch is a re-write and extension of one that
you did review.


r~


Alex Bennée (4):
  accel/tcg: rename tb_lookup__cpu_state and hoist state extraction
  accel/tcg: move CF_CLUSTER calculation to curr_cflags
  accel/tcg: drop the use of CF_HASH_MASK and rename params
  include/exec: lightly re-arrange TranslationBlock

Richard Henderson (23):
  tcg/aarch64: Fix constant subtraction in tcg_out_addsub2
  tcg/aarch64: Fix I3617_CMLE0
  tcg/aarch64: Fix generation of "scalar" vector operations
  tcg/tci: Use exec/cpu_ldst.h interfaces
  tcg: Split out tcg_raise_tb_overflow
  tcg: Manage splitwx in tc_ptr_to_region_tree by hand
  tcg/tci: Merge identical cases in generation (arithmetic opcodes)
  tcg/tci: Merge identical cases in generation (exchange opcodes)
  tcg/tci: Merge identical cases in generation (deposit opcode)
  tcg/tci: Merge identical cases in generation (conditional opcodes)
  tcg/tci: Merge identical cases in generation (load/store opcodes)
  tcg/tci: Remove tci_read_r8
  tcg/tci: Remove tci_read_r8s
  tcg/tci: Remove tci_read_r16
  tcg/tci: Remove tci_read_r16s
  tcg/tci: Remove tci_read_r32
  tcg/tci: Remove tci_read_r32s
  tcg/tci: Reduce use of tci_read_r64
  tcg/tci: Merge basic arithmetic operations
  tcg/tci: Merge extension operations
  tcg/tci: Merge bswap operations
  tcg/tci: Merge mov, not and neg operations
  accel/tcg: Precompute curr_cflags into cpu->tcg_cflags

 accel/tcg/tcg-accel-ops.h       |   1 +
 include/exec/exec-all.h         |  19 +-
 include/exec/tb-lookup.h        |  26 +-
 include/hw/core/cpu.h           |   2 +
 accel/tcg/cpu-exec.c            |  34 ++-
 accel/tcg/tcg-accel-ops-mttcg.c |   3 +-
 accel/tcg/tcg-accel-ops-rr.c    |   2 +-
 accel/tcg/tcg-accel-ops.c       |   8 +
 accel/tcg/tcg-runtime.c         |   6 +-
 accel/tcg/translate-all.c       |  18 +-
 linux-user/main.c               |   1 +
 linux-user/sh4/signal.c         |   8 +-
 linux-user/syscall.c            |  18 +-
 softmmu/physmem.c               |   2 +-
 tcg/tcg.c                       |  29 +-
 tcg/tci.c                       | 526 ++++++++++----------------------
 tcg/aarch64/tcg-target.c.inc    | 229 +++++++++++---
 tcg/tci/tcg-target.c.inc        | 204 +++++--------
 18 files changed, 526 insertions(+), 610 deletions(-)

-- 
2.25.1


