Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AA286003E0
	for <lists+qemu-devel@lfdr.de>; Mon, 17 Oct 2022 00:20:09 +0200 (CEST)
Received: from localhost ([::1]:36074 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1okBzL-0002UV-GG
	for lists+qemu-devel@lfdr.de; Sun, 16 Oct 2022 18:20:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39632)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1okBpm-00025l-2G
 for qemu-devel@nongnu.org; Sun, 16 Oct 2022 18:10:14 -0400
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631]:38534)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1okBpk-0007fN-Dq
 for qemu-devel@nongnu.org; Sun, 16 Oct 2022 18:10:13 -0400
Received: by mail-pl1-x631.google.com with SMTP id o21so6797222ple.5
 for <qemu-devel@nongnu.org>; Sun, 16 Oct 2022 15:10:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=zNSasT6g5lPXdmGKCoc3ZqupAp2gRn+LqJW9jUoXEIo=;
 b=QQi4JHn5/5RqthQ9NF+BboZ7C5kJH7t+bGYe2OKEBgtaAzjn4g3PvajZigdLZyeLmP
 vzg+RG7+OWt2T6jqQxGovF6nIL+NB7X99x6VDKFVdTDoD2IKVgIRl/eHLo6xcU5VhcJx
 CwvjvspQ3XqJ6VayMJGdCh0UnrhcIdfzv1oe98ZTxdAoUF2DUIV0wbJmMS6wxfc+WFw1
 PBkZKfpmklbrZF6nf3QmJEILwDF+UifI8GdHtmRmAgbrhfwaWc1MlhOmbdjROTtPg7gx
 ALrq0NVnml0VloNNNqchYbPRDpcD3Tp3ONb+ab/1B3utAHkWer5P3CbdH/HuV57jmqNo
 FfAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=zNSasT6g5lPXdmGKCoc3ZqupAp2gRn+LqJW9jUoXEIo=;
 b=WV/TlWPFFyrBGLT9wE1Cd4Woh9mmvzpo5Mgu8jriqJeZlsKn9AnPSlResecBY79EWl
 R4QqyFiBG3BlpcYnDu0dd2OJ5z5oXPLQCv0GlkiZkQ5qU9qbJDeiwSWWyrFaa8fKfJRT
 y/jdlZ5hyHCLA0b/xk3mTkBqfncv0Qh+EeOzzqjpEZUZhXaH6lMeycOzPAV5Mty2jLND
 s+s+eSL3CSjQTtwWzM14HF+TA7A9zPaeaBva4l78LdiKFH+gWeH6wqyoK0ZYJrFpsS5f
 zCm0AEmJXC/gsFrSpqAMXUgAuBjgEgLuDyehAKbSU+7c3eFxPWQfAwKfhTz4PPs2Kkub
 PyNw==
X-Gm-Message-State: ACrzQf00pQewwEtMwfQvPO4Og3U6vLWUcUkD7OmQBVQROIGzbs88+pDH
 NFm+5wbI83jZmnyDthLgoR0wrrqNJ5l7MMYQ
X-Google-Smtp-Source: AMsMyM76fAPi9Y+nN8LSzQk8bFdQ7NY+NAqa2LxGdy0FggBc/alw/794hAhsYFWX4mEBzG6PV2VQSw==
X-Received: by 2002:a17:902:7c11:b0:178:a6ca:4850 with SMTP id
 x17-20020a1709027c1100b00178a6ca4850mr9118678pll.111.1665958210656; 
 Sun, 16 Oct 2022 15:10:10 -0700 (PDT)
Received: from localhost.localdomain ([149.135.10.35])
 by smtp.gmail.com with ESMTPSA id
 z18-20020aa79592000000b0053e2b61b714sm5454751pfj.114.2022.10.16.15.10.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 16 Oct 2022 15:10:09 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH v7 0/9] target/arm: pc-relative translation blocks
Date: Mon, 17 Oct 2022 08:09:23 +1000
Message-Id: <20221016220932.274260-1-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::631;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x631.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This is the Arm specific changes required to reduce the
amount of translation for address space randomization.

Changes for v7:
  * Remove read_pc in patch 8.
  * Add DisasLabel and inlines to generate/emit,
    cleaning up the management of pc_save.
  * Restore pc_save after tcg_remove_ops_after.


r~


Richard Henderson (9):
  target/arm: Introduce curr_insn_len
  target/arm: Change gen_goto_tb to work on displacements
  target/arm: Change gen_*set_pc_im to gen_*update_pc
  target/arm: Change gen_exception_insn* to work on displacements
  target/arm: Remove gen_exception_internal_insn pc argument
  target/arm: Change gen_jmp* to work on displacements
  target/arm: Introduce gen_pc_plus_diff for aarch64
  target/arm: Introduce gen_pc_plus_diff for aarch32
  target/arm: Enable TARGET_TB_PCREL

 target/arm/cpu-param.h        |   1 +
 target/arm/translate-a32.h    |   2 +-
 target/arm/translate.h        |  66 +++++++-
 target/arm/cpu.c              |  23 +--
 target/arm/translate-a64.c    | 191 +++++++++++++----------
 target/arm/translate-m-nocp.c |   8 +-
 target/arm/translate-mve.c    |   2 +-
 target/arm/translate-vfp.c    |  10 +-
 target/arm/translate.c        | 276 ++++++++++++++++++++--------------
 9 files changed, 351 insertions(+), 228 deletions(-)

-- 
2.34.1


