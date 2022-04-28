Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 72B56513734
	for <lists+qemu-devel@lfdr.de>; Thu, 28 Apr 2022 16:45:06 +0200 (CEST)
Received: from localhost ([::1]:51560 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nk5OD-0005y6-I7
	for lists+qemu-devel@lfdr.de; Thu, 28 Apr 2022 10:45:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44516)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nk5JN-0004zv-Go
 for qemu-devel@nongnu.org; Thu, 28 Apr 2022 10:40:05 -0400
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c]:34084)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nk5JL-00060B-Ci
 for qemu-devel@nongnu.org; Thu, 28 Apr 2022 10:40:05 -0400
Received: by mail-wm1-x32c.google.com with SMTP id
 l16-20020a05600c1d1000b00394011013e8so2430518wms.1
 for <qemu-devel@nongnu.org>; Thu, 28 Apr 2022 07:40:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=4tFOG42vJeTcOhygWYP7TZ2T5A++MSCGrRscovVEQDk=;
 b=XDSfe5KBi9bnWfTj070Kc3FkRltSPxXoTvXlN4aGVz15Jd7IJV9+cJFOhXuqtJNvHP
 eSa0x+KpLCkqJt6wH6LVO4Jw2Vp6pjS4L74grZnSY6gk5tsRiOq5u0ciUD9hLYwLN0X3
 pWsGDuDTYMdMjD7P7/IVIF0TpdvZlnWFOi8NlqRXwNSRhpCF0WFpdD5D5ZbnLK8+k+M9
 NxC7oJBKee996wxECKMCywCtQzyAIxpF+Xbg7Zy02Yp2gKxQCFvK9Dw7VQHkuWYsNMZC
 u8ha0W4BNxgv/LcBzmBI9XMa6XC9sZy9shNSxs2Arc34LHANKVOGRPrvTZZVQQOX9BRl
 ZGOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=4tFOG42vJeTcOhygWYP7TZ2T5A++MSCGrRscovVEQDk=;
 b=YoIxDL8Kewfe/ETOY/pTcvEkmq0Gv8Mj86dpz4S5YpOHNPDMTRzlQRK3NG97n183lY
 pyv+Lw/hgksXdxfrbqLJmkPgwXTrU/HEL592jDr+dMJZUYLT57SKhVM8Mve/Jd/zWhA2
 FdNDStTiY3OFtY0PWSUsfkGsRrozz2H4kMoOXDwq4JuKDxyMklBis+56fnysJ5ymQl3S
 AjEBS3/aZiWKAcCdUMie1yYymGZYNb/jhscRfxOAy+kQEIVySp1ZO92SAykqLthnMPnJ
 jc+Eug8Bb+9puewjGcsMGTOaCP38EuzqXv94CUZ9y90h5/wfO+Z9cIssaMhMvrZI6ACG
 uiFA==
X-Gm-Message-State: AOAM530+B7IewGg7XDA/Qknhat4SKUgV0cY+JT5cNeB2KTJKKhBOFgYl
 V5Fuq+vh1oW9pyjAkOpzVuNnEPOdgWeMTg==
X-Google-Smtp-Source: ABdhPJwkdsP4Y5GcvHM8DGSQ6S5zaINf35X00FH9v3eX/zy8qAYoiGTFsE8U/9iWADTqXrpo8zbBoA==
X-Received: by 2002:a05:600c:3b27:b0:393:ee55:5682 with SMTP id
 m39-20020a05600c3b2700b00393ee555682mr17096359wms.3.1651156801203; 
 Thu, 28 Apr 2022 07:40:01 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 bh26-20020a05600c3d1a00b003928db85759sm130221wmb.15.2022.04.28.07.39.59
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 28 Apr 2022 07:40:00 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 00/54] target-arm queue
Date: Thu, 28 Apr 2022 15:39:04 +0100
Message-Id: <20220428143958.2451229-1-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32c;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

This is mostly RTH's tcg_constant refactoring work, plus a few
other things.

thanks
-- PMM

The following changes since commit cf6f26d6f9b2015ee12b4604b79359e76784163a:

  Merge tag 'kraxel-20220427-pull-request' of git://git.kraxel.org/qemu into staging (2022-04-27 10:49:28 -0700)

are available in the Git repository at:

  https://git.linaro.org/people/pmaydell/qemu-arm.git tags/pull-target-arm-20220428

for you to fetch changes up to f8e7163d9e6740b5cef02bf73a17a59d0bef8bdb:

  hw/arm/smmuv3: Advertise support for SMMUv3.2-BBML2 (2022-04-28 13:59:23 +0100)

----------------------------------------------------------------
target-arm queue:
 * refactor to use tcg_constant where appropriate
 * Advertise support for FEAT_TTL and FEAT_BBM level 2
 * smmuv3: Cache event fault record
 * smmuv3: Add space in guest error message
 * smmuv3: Advertise support for SMMUv3.2-BBML2

----------------------------------------------------------------
Damien Hedde (1):
      target/arm: Disable cryptographic instructions when neon is disabled

Jean-Philippe Brucker (2):
      hw/arm/smmuv3: Cache event fault record
      hw/arm/smmuv3: Add space in guest error message

Peter Maydell (3):
      target/arm: Advertise support for FEAT_TTL
      target/arm: Advertise support for FEAT_BBM level 2
      hw/arm/smmuv3: Advertise support for SMMUv3.2-BBML2

Richard Henderson (48):
      target/arm: Use tcg_constant in gen_probe_access
      target/arm: Use tcg_constant in gen_mte_check*
      target/arm: Use tcg_constant in gen_exception*
      target/arm: Use tcg_constant in gen_adc_CC
      target/arm: Use tcg_constant in handle_msr_i
      target/arm: Use tcg_constant in handle_sys
      target/arm: Use tcg_constant in disas_exc
      target/arm: Use tcg_constant in gen_compare_and_swap_pair
      target/arm: Use tcg_constant in disas_ld_lit
      target/arm: Use tcg_constant in disas_ldst_*
      target/arm: Use tcg_constant in disas_add_sum_imm*
      target/arm: Use tcg_constant in disas_movw_imm
      target/arm: Use tcg_constant in shift_reg_imm
      target/arm: Use tcg_constant in disas_cond_select
      target/arm: Use tcg_constant in handle_{rev16,crc32}
      target/arm: Use tcg_constant in disas_data_proc_2src
      target/arm: Use tcg_constant in disas_fp*
      target/arm: Use tcg_constant in simd shift expanders
      target/arm: Use tcg_constant in simd fp/int conversion
      target/arm: Use tcg_constant in 2misc expanders
      target/arm: Use tcg_constant in balance of translate-a64.c
      target/arm: Use tcg_constant for aa32 exceptions
      target/arm: Use tcg_constant for disas_iwmmxt_insn
      target/arm: Use tcg_constant for gen_{msr,mrs}
      target/arm: Use tcg_constant for vector shift expanders
      target/arm: Use tcg_constant for do_coproc_insn
      target/arm: Use tcg_constant for gen_srs
      target/arm: Use tcg_constant for op_s_{rri,rxi}_rot
      target/arm: Use tcg_constant for MOVW, UMAAL, CRC32
      target/arm: Use tcg_constant for v7m MRS, MSR
      target/arm: Use tcg_constant for TT, SAT, SMMLA
      target/arm: Use tcg_constant in LDM, STM
      target/arm: Use tcg_constant in CLRM, DLS, WLS, LE
      target/arm: Use tcg_constant in trans_CPS_v7m
      target/arm: Use tcg_constant in trans_CSEL
      target/arm: Use tcg_constant for trans_INDEX_*
      target/arm: Use tcg_constant in SINCDEC, INCDEC
      target/arm: Use tcg_constant in FCPY, CPY
      target/arm: Use tcg_constant in {incr, wrap}_last_active
      target/arm: Use tcg_constant in do_clast_scalar
      target/arm: Use tcg_constant in WHILE
      target/arm: Use tcg_constant in LD1, ST1
      target/arm: Use tcg_constant in SUBR
      target/arm: Use tcg_constant in do_zzi_{sat, ool}, do_fp_imm
      target/arm: Use tcg_constant for predicate descriptors
      target/arm: Use tcg_constant for do_brk{2,3}
      target/arm: Use tcg_constant for vector descriptor
      target/arm: Use field names for accessing DBGWCRn

 docs/system/arm/emulation.rst |   2 +
 hw/arm/smmuv3-internal.h      |   2 +-
 include/hw/arm/smmu-common.h  |   1 +
 target/arm/internals.h        |  12 ++
 hw/arm/smmuv3.c               |  17 +--
 target/arm/cpu.c              |   9 ++
 target/arm/cpu64.c            |   2 +
 target/arm/debug_helper.c     |  10 +-
 target/arm/helper.c           |   8 +-
 target/arm/kvm64.c            |  14 +-
 target/arm/translate-a64.c    | 301 +++++++++++++-----------------------------
 target/arm/translate-sve.c    | 202 ++++++++++------------------
 target/arm/translate.c        | 244 ++++++++++++----------------------
 13 files changed, 293 insertions(+), 531 deletions(-)

