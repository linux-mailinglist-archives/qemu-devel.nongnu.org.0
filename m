Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BBD4143F62F
	for <lists+qemu-devel@lfdr.de>; Fri, 29 Oct 2021 06:35:56 +0200 (CEST)
Received: from localhost ([::1]:45842 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mgJcR-0006Ke-Ig
	for lists+qemu-devel@lfdr.de; Fri, 29 Oct 2021 00:35:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50964)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mgJaB-0003XS-Om
 for qemu-devel@nongnu.org; Fri, 29 Oct 2021 00:33:35 -0400
Received: from mail-pg1-x530.google.com ([2607:f8b0:4864:20::530]:40506)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mgJa9-0007sS-ON
 for qemu-devel@nongnu.org; Fri, 29 Oct 2021 00:33:35 -0400
Received: by mail-pg1-x530.google.com with SMTP id l186so8682480pge.7
 for <qemu-devel@nongnu.org>; Thu, 28 Oct 2021 21:33:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=klLu8DXr4xRs2kB8pTbcoMAtcnu80jrmaZ2/P1Kdops=;
 b=rNodbgck1sSZAvH2EFjelEyrpRzwdUcnaz4gCkkVWy8Ven0/tJqEQONqp455hhPv47
 rEt/na4ii06D9iQIHL9PZGQXWnT8L3mRtqEJQ0ImPm0wL8qdiYBIujABGxXtxEb1iW+4
 0LItcmqH6e9r0sxvPzA/l2kp0eGd6SX4Y/uf3HATOZugd1vW6tOAJffPBS59Mf94Iz6Q
 hjbX0CqnMnBHzsgiypqM8hQdZOKezVOme+pDWJZZkDm6knNQMisBzPlHqfGREYjWH1il
 bCG6uvQDk0vW0SUKbSHx+DBvuvGqk7YqC04mYizgW4WTsE9PtTpB0oAANKOUk9tMjM8Y
 kTng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=klLu8DXr4xRs2kB8pTbcoMAtcnu80jrmaZ2/P1Kdops=;
 b=ijoPSO0uB8G97sgoQVpSC5z7UeCdCBrikdP4+c3Iuc6h8jk+jRpKX2qp/WFrM7ds6c
 r3tK3YNHD8wtwNGLJ/V3hW5djNCuU0Rd1oqVz9xIYuQC6rRslFn/iF6u1BpJxWmOEJYs
 rAwTsPyvR4PzEce0V0nBOHsyLD7OyuF0qcgNh05jpDrGZQwefOx9lC1+vUuro7WZFbGQ
 DBKnHsFoXWYhJjmh8c+syAbZkfqP5QZSCrhQS4+ZnHgclrWecmNH33F5IiKH692twVXk
 zwwvkGs68SDJPSDSdaa6jUr/fpkxt0CegmaZv9keyXduBw92k21b7YLaD9BE5q2P5f7N
 UAyw==
X-Gm-Message-State: AOAM530Y4ZYR8TxJzPZ/wKoLvMdPmIz7Ez6IZaIaqqkPs+ttiK/+0xZL
 OoDzEvOA6y9cjD5EFW0MTXWzK9nuen+TiA==
X-Google-Smtp-Source: ABdhPJwVdeUmG7DxEdvNyGvGbXDYxYLRiVNUAzDbDzxKC/MPChrFywoD7g/gkNVBmHTcS4p40ImBDw==
X-Received: by 2002:a63:3fcd:: with SMTP id m196mr6417355pga.417.1635482011015; 
 Thu, 28 Oct 2021 21:33:31 -0700 (PDT)
Received: from localhost.localdomain (174-21-75-75.tukw.qwest.net.
 [174.21.75.75])
 by smtp.gmail.com with ESMTPSA id i11sm4120257pgp.18.2021.10.28.21.33.29
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 28 Oct 2021 21:33:30 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL v2 00/60] tcg patch queue
Date: Thu, 28 Oct 2021 21:32:29 -0700
Message-Id: <20211029043329.1518029-1-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::530;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x530.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The following changes since commit c52d69e7dbaaed0ffdef8125e79218672c30161d:

  Merge remote-tracking branch 'remotes/cschoenebeck/tags/pull-9p-20211027' into staging (2021-10-27 11:45:18 -0700)

are available in the Git repository at:

  https://gitlab.com/rth7680/qemu.git tags/pull-tcg-20211028

for you to fetch changes up to efd629fb21e2ff6a8f62642d9ed7a23dfee4d320:

  softmmu: fix for "after access" watchpoints (2021-10-28 20:55:07 -0700)

----------------------------------------------------------------
Improvements to qemu/int128
Fixes for 128/64 division.
Cleanup tcg/optimize.c
Optimize redundant sign extensions

----------------------------------------------------------------
Frédéric Pétrot (1):
      qemu/int128: Add int128_{not,xor}

Luis Pires (4):
      host-utils: move checks out of divu128/divs128
      host-utils: move udiv_qrnnd() to host-utils
      host-utils: add 128-bit quotient support to divu128/divs128
      host-utils: add unit tests for divu128/divs128

Pavel Dovgalyuk (3):
      softmmu: fix watchpoint processing in icount mode
      softmmu: remove useless condition in watchpoint check
      softmmu: fix for "after access" watchpoints

Richard Henderson (52):
      tcg/optimize: Rename "mask" to "z_mask"
      tcg/optimize: Split out OptContext
      tcg/optimize: Remove do_default label
      tcg/optimize: Change tcg_opt_gen_{mov,movi} interface
      tcg/optimize: Move prev_mb into OptContext
      tcg/optimize: Split out init_arguments
      tcg/optimize: Split out copy_propagate
      tcg/optimize: Split out fold_call
      tcg/optimize: Drop nb_oargs, nb_iargs locals
      tcg/optimize: Change fail return for do_constant_folding_cond*
      tcg/optimize: Return true from tcg_opt_gen_{mov,movi}
      tcg/optimize: Split out finish_folding
      tcg/optimize: Use a boolean to avoid a mass of continues
      tcg/optimize: Split out fold_mb, fold_qemu_{ld,st}
      tcg/optimize: Split out fold_const{1,2}
      tcg/optimize: Split out fold_setcond2
      tcg/optimize: Split out fold_brcond2
      tcg/optimize: Split out fold_brcond
      tcg/optimize: Split out fold_setcond
      tcg/optimize: Split out fold_mulu2_i32
      tcg/optimize: Split out fold_addsub2_i32
      tcg/optimize: Split out fold_movcond
      tcg/optimize: Split out fold_extract2
      tcg/optimize: Split out fold_extract, fold_sextract
      tcg/optimize: Split out fold_deposit
      tcg/optimize: Split out fold_count_zeros
      tcg/optimize: Split out fold_bswap
      tcg/optimize: Split out fold_dup, fold_dup2
      tcg/optimize: Split out fold_mov
      tcg/optimize: Split out fold_xx_to_i
      tcg/optimize: Split out fold_xx_to_x
      tcg/optimize: Split out fold_xi_to_i
      tcg/optimize: Add type to OptContext
      tcg/optimize: Split out fold_to_not
      tcg/optimize: Split out fold_sub_to_neg
      tcg/optimize: Split out fold_xi_to_x
      tcg/optimize: Split out fold_ix_to_i
      tcg/optimize: Split out fold_masks
      tcg/optimize: Expand fold_mulu2_i32 to all 4-arg multiplies
      tcg/optimize: Expand fold_addsub2_i32 to 64-bit ops
      tcg/optimize: Sink commutative operand swapping into fold functions
      tcg: Extend call args using the correct opcodes
      tcg/optimize: Stop forcing z_mask to "garbage" for 32-bit values
      tcg/optimize: Use fold_xx_to_i for orc
      tcg/optimize: Use fold_xi_to_x for mul
      tcg/optimize: Use fold_xi_to_x for div
      tcg/optimize: Use fold_xx_to_i for rem
      tcg/optimize: Optimize sign extensions
      tcg/optimize: Propagate sign info for logical operations
      tcg/optimize: Propagate sign info for setcond
      tcg/optimize: Propagate sign info for bit counting
      tcg/optimize: Propagate sign info for shifting

 include/fpu/softfloat-macros.h |   82 --
 include/hw/clock.h             |    5 +-
 include/qemu/host-utils.h      |  121 +-
 include/qemu/int128.h          |   20 +
 softmmu/physmem.c              |   41 +-
 target/ppc/int_helper.c        |   23 +-
 tcg/optimize.c                 | 2644 ++++++++++++++++++++++++----------------
 tcg/tcg.c                      |    6 +-
 tests/unit/test-div128.c       |  197 +++
 util/host-utils.c              |  147 ++-
 tests/unit/meson.build         |    1 +
 11 files changed, 2075 insertions(+), 1212 deletions(-)
 create mode 100644 tests/unit/test-div128.c

