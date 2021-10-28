Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 109F543D971
	for <lists+qemu-devel@lfdr.de>; Thu, 28 Oct 2021 04:44:20 +0200 (CEST)
Received: from localhost ([::1]:46824 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mfvOr-0006st-J9
	for lists+qemu-devel@lfdr.de; Wed, 27 Oct 2021 22:44:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58688)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mfvMG-0004Sf-Oe
 for qemu-devel@nongnu.org; Wed, 27 Oct 2021 22:41:36 -0400
Received: from mail-pf1-x431.google.com ([2607:f8b0:4864:20::431]:44565)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mfvME-00033q-Oc
 for qemu-devel@nongnu.org; Wed, 27 Oct 2021 22:41:36 -0400
Received: by mail-pf1-x431.google.com with SMTP id a26so4536434pfr.11
 for <qemu-devel@nongnu.org>; Wed, 27 Oct 2021 19:41:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=dGRNCMjvtd1bD20wXCwpdK3GqXtBebnBL3I8gqIdPuE=;
 b=N7ZCOHbxFf4T5B91Od6gLrAiRX1jbFPZy6B9tqztZvhyy05W6cWb3IUAsj28eIiK8W
 UXSiWE4QRexN3Bhl8j2uo/qML3efxBc35PHeetInEXeFGIj5rGWwaEX0tIVdDeQdyIDO
 UBOIO3RrCJYHk6pYrbF3JULfG9A3RY2xWdT+w5NPQ7GXDDZRY4UZhHiSHTIC29zQKwrl
 FAS7j3TjaAYCKtIZmSM0cxAs1U6PLmsu2bmkP3619ZJAKocaIB4rjENbmZe6I5c8MKm0
 7utUL17ZWp7fA1vj7532rtEDFNL5GwOTYyH2Jebg6YlOeNaAFvgJ/IdihWy6y+nsxxsI
 xArA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=dGRNCMjvtd1bD20wXCwpdK3GqXtBebnBL3I8gqIdPuE=;
 b=MkA88X0d9o6bN77jZX2IzSNsSoDtppGC+eFu/Bs31mLlo8z72EDiPI6M6D4Kw5QAn+
 Dh2OejWXgS4zK3oJb4EE7vdL8ELmnFVS2tvLaEicNJRGmY+JX88Y/8XTKrnmYsf0WYYN
 4vYO5vBN8VyQrTZtVG1osEW8DnvYGtWx5yaJakQZlJKh7CfMTJB81DnxJ+WOtXdR+VOn
 CnkY19Lc+bPshAxVtU1T7Uib0BXQIibh0yqvkRsnUusg46LI+HlylyF22xaxSAFOToFK
 CXMgkU0PHrzkJMBKfq1eTPfbZ6jjjQ7s5theH2eqPB3ouTa2N5/PKNGff4/LTKYDyu/P
 KJmg==
X-Gm-Message-State: AOAM533OapI/qxhAmL9f3XKWbqxiNI6lCUOzn5tDPckcup1xdCfmGdpe
 19IpTnnpm2vRyZncnJX3kocZw0xC3ukl2w==
X-Google-Smtp-Source: ABdhPJyZrnYYIc1nZUztLe87l0GaVrLyjMAx2R3mQL8lIJoWY7gTEv4LNi+k6qbYd+g02L/oZetDbg==
X-Received: by 2002:a63:9348:: with SMTP id w8mr1183763pgm.325.1635388892514; 
 Wed, 27 Oct 2021 19:41:32 -0700 (PDT)
Received: from localhost.localdomain ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id c25sm1218824pfn.159.2021.10.27.19.41.31
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 27 Oct 2021 19:41:32 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 00/56] tcg patch queue
Date: Wed, 27 Oct 2021 19:40:35 -0700
Message-Id: <20211028024131.1492790-1-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::431;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x431.google.com
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

  https://gitlab.com/rth7680/qemu.git tags/pull-tcg-20211027

for you to fetch changes up to 820c025f0dcacf2f3c12735b1f162893fbfa7bc6:

  tcg/optimize: Propagate sign info for shifting (2021-10-27 17:11:23 -0700)

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

Richard Henderson (51):
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
 target/ppc/int_helper.c        |   23 +-
 tcg/optimize.c                 | 2644 ++++++++++++++++++++++++----------------
 tests/unit/test-div128.c       |  197 +++
 util/host-utils.c              |  147 ++-
 tests/unit/meson.build         |    1 +
 9 files changed, 2053 insertions(+), 1187 deletions(-)
 create mode 100644 tests/unit/test-div128.c

