Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E51442F5728
	for <lists+qemu-devel@lfdr.de>; Thu, 14 Jan 2021 03:19:11 +0100 (CET)
Received: from localhost ([::1]:37542 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kzsEA-0004vk-Eo
	for lists+qemu-devel@lfdr.de; Wed, 13 Jan 2021 21:19:10 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:60068)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kzsCA-0003IS-Ii
 for qemu-devel@nongnu.org; Wed, 13 Jan 2021 21:17:06 -0500
Received: from mail-pf1-x42a.google.com ([2607:f8b0:4864:20::42a]:42922)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kzsC3-0003Mv-Vb
 for qemu-devel@nongnu.org; Wed, 13 Jan 2021 21:17:06 -0500
Received: by mail-pf1-x42a.google.com with SMTP id h10so2448083pfo.9
 for <qemu-devel@nongnu.org>; Wed, 13 Jan 2021 18:16:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Fn9gKC/VK3ogLcFskOqLXg01CtO+YLDhHJ1+m0Gofrw=;
 b=T2aRdZ7T02YbitbI8DLL3+cz6S9ehky+5lHTGzkjeUeNz3hsPEZNR/QT+u0uJsDXsc
 ffIa8OqGJHvGSu6nS6M3CUOgjRmlcseE0m3dp58bWppyfKxF3t2lwDB+xtZjOrP2HmU7
 y/TlClu/6hkQrdI2bgiWmuyWZzKRicX2CUwGsLXD6hLCeB2ApkI/Ytb7B/0T4YJI+raC
 xLVx9NTVgfcmNguFmqtr+G+lQDXJaC9y3OKy/s/1nnSfR38j/fEXlfONB7Xt1EdYGyfx
 J8BVjhNXyYrDgD5tJzDKOBbEpVUMPb0rbdlhkgwTpPuPv8MzhHP1I0uxfZrG35DymRVn
 f7JQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Fn9gKC/VK3ogLcFskOqLXg01CtO+YLDhHJ1+m0Gofrw=;
 b=unOV8f4Bf/KE0MW2BrBZ6O+TFaQnH7wwFIk9Ol78XwbxLEhdddpUtXZEkfWJ9b4+Ol
 nA43w9XQavuNFYXcc/b9rKTW++YVS3GhnfO5m7n/0t4GmMMn7TF5ZjEL/WcMUfNAVyz3
 rvmwnHsMONhcuoVC926LWfQs/S7fUxPA7j1r9H114zoX5Ll7DYIdVKWtgTDlsgEjN5T4
 i5DvBzxJQ1OOMFgu5Siyv71d4jkHLtH4K7cqJNALRr7jBpDhBYBQD16Ry0u95X8Nv1M2
 aKFa5PfaBtBCE4vAlvr11KnNuiE/HJecbnWpqC8JoTFB0Z3WxM3EesJzr13Re5gs4Nfb
 VcBQ==
X-Gm-Message-State: AOAM531+CFcYApL0K+s5ThDTsT8mngdfYMU2Lr80r98DWHC6rpYmJErZ
 4oMlsn3ZQvkYJNMJC0I5yNpePlD/4tM9Lw==
X-Google-Smtp-Source: ABdhPJy0De5uqgS2lcj9OwKfGw2JyAdsWl+eR+NBk/kjjRHNcq/tWpusXjmS44h8+RKSuaHAs0yj3g==
X-Received: by 2002:a63:1f21:: with SMTP id f33mr5040391pgf.31.1610590617981; 
 Wed, 13 Jan 2021 18:16:57 -0800 (PST)
Received: from localhost.localdomain (rrcs-173-197-107-21.west.biz.rr.com.
 [173.197.107.21])
 by smtp.gmail.com with ESMTPSA id i7sm3771687pfc.50.2021.01.13.18.16.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 13 Jan 2021 18:16:57 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 00/24] tcg patch queue
Date: Wed, 13 Jan 2021 16:16:30 -1000
Message-Id: <20210114021654.647242-1-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42a.google.com
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

The following changes since commit 45240eed4f064576d589ea60ebadf3c11d7ab891:

  Merge remote-tracking branch 'remotes/armbru/tags/pull-yank-2021-01-13' into staging (2021-01-13 14:19:24 +0000)

are available in the Git repository at:

  https://gitlab.com/rth7680/qemu.git tags/pull-tcg-20210113

for you to fetch changes up to 4cacecaaa2bbf8af0967bd3eee43297fada475a9:

  decodetree: Open files with encoding='utf-8' (2021-01-13 08:39:08 -1000)

----------------------------------------------------------------
Improvements to tcg constant handling.
Force utf8 for decodetree.

----------------------------------------------------------------
Philippe Mathieu-Daudé (1):
      decodetree: Open files with encoding='utf-8'

Richard Henderson (23):
      tcg: Use tcg_out_dupi_vec from temp_load
      tcg: Increase tcg_out_dupi_vec immediate to int64_t
      tcg: Consolidate 3 bits into enum TCGTempKind
      tcg: Add temp_readonly
      tcg: Expand TCGTemp.val to 64-bits
      tcg: Rename struct tcg_temp_info to TempOptInfo
      tcg: Expand TempOptInfo to 64-bits
      tcg: Introduce TYPE_CONST temporaries
      tcg/optimize: Improve find_better_copy
      tcg/optimize: Adjust TempOptInfo allocation
      tcg/optimize: Use tcg_constant_internal with constant folding
      tcg: Convert tcg_gen_dupi_vec to TCG_CONST
      tcg: Use tcg_constant_i32 with icount expander
      tcg: Use tcg_constant_{i32,i64} with tcg int expanders
      tcg: Use tcg_constant_{i32,i64} with tcg plugins
      tcg: Use tcg_constant_{i32,i64,vec} with gvec expanders
      tcg/tci: Add special tci_movi_{i32,i64} opcodes
      tcg: Remove movi and dupi opcodes
      tcg: Add tcg_reg_alloc_dup2
      tcg/i386: Use tcg_constant_vec with tcg vec expanders
      tcg: Remove tcg_gen_dup{8,16,32,64}i_vec
      tcg/ppc: Use tcg_constant_vec with tcg vec expanders
      tcg/aarch64: Use tcg_constant_vec with tcg vec expanders

 include/exec/gen-icount.h    |  25 +--
 include/tcg/tcg-op.h         |  17 +-
 include/tcg/tcg-opc.h        |  11 +-
 include/tcg/tcg.h            |  50 ++++-
 accel/tcg/plugin-gen.c       |  49 ++---
 tcg/optimize.c               | 249 +++++++++++-----------
 tcg/tcg-op-gvec.c            | 129 +++++-------
 tcg/tcg-op-vec.c             |  52 +----
 tcg/tcg-op.c                 | 227 ++++++++++----------
 tcg/tcg.c                    | 488 +++++++++++++++++++++++++++++++++----------
 tcg/tci.c                    |   4 +-
 tcg/aarch64/tcg-target.c.inc |  32 +--
 tcg/arm/tcg-target.c.inc     |   1 -
 tcg/i386/tcg-target.c.inc    | 112 ++++++----
 tcg/mips/tcg-target.c.inc    |   2 -
 tcg/ppc/tcg-target.c.inc     |  90 ++++----
 tcg/riscv/tcg-target.c.inc   |   2 -
 tcg/s390/tcg-target.c.inc    |   2 -
 tcg/sparc/tcg-target.c.inc   |   2 -
 tcg/tci/tcg-target.c.inc     |   6 +-
 scripts/decodetree.py        |   9 +-
 21 files changed, 890 insertions(+), 669 deletions(-)

