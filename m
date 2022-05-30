Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 31762538603
	for <lists+qemu-devel@lfdr.de>; Mon, 30 May 2022 18:21:55 +0200 (CEST)
Received: from localhost ([::1]:35054 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nvi9R-00025r-Uh
	for lists+qemu-devel@lfdr.de; Mon, 30 May 2022 12:21:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38456)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nvhvK-0002du-N4
 for qemu-devel@nongnu.org; Mon, 30 May 2022 12:07:21 -0400
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434]:35737)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nvhvF-0007AQ-6M
 for qemu-devel@nongnu.org; Mon, 30 May 2022 12:07:15 -0400
Received: by mail-wr1-x434.google.com with SMTP id q21so4085379wra.2
 for <qemu-devel@nongnu.org>; Mon, 30 May 2022 09:07:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=vwUHipPZ6HUYmRuAIDV7sLl1r+0asCwQkTyUlDxKOOI=;
 b=Ldq+XEkyVb6DsOOHJddofOikjmJzEkNz921wEVXe3+Hiryu2wsi8lk6KbLUhJiYnV+
 Qe/b//CZjMyJm791m6u5pnNzhC61M0velIwrQKWlsMfXuEA4SmORhJ+vsrMOvZqSzcj+
 tQU/uQnX0lIRjTTq6LqHd3lJY+V0bUQyocSfnK1jktKobM9xSxvi4Z88Jbkh/7W8LaL7
 cjhm2epJSkpEq4qdeC44u/6rBnjwypUawtX7lCzkMiQNUsV4olcvYPNWB1JvVhgPbqRS
 2gc30itUgj4rlkLWYwwRNnWzAxbtP3tpvwlh/JUUepLSuG20UU3E4Brap+LglZEU0R1z
 /PCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=vwUHipPZ6HUYmRuAIDV7sLl1r+0asCwQkTyUlDxKOOI=;
 b=sBrweLGwIctgIFsvFEMJkaZdVR/EVsZD4KBG3xVOK9PwDZOxn4c8+E1KR+xcj3hkXq
 PangbWomMMpen9SB+E/VPOQr4Gf0gnz69XhmHNcRXZskVsQCvZHT2R8SWlUWWwjVPCbb
 BNKGDXbj6pN0d5+PGd1N7saMtWs3JgSiCwNEfEPLBDYQ98kBdBCFyht5ipzwd22NoRSi
 scD+BCFT55EpVY4HAkf3DO1C7Cvf5DJEqP2iITquq0jU85G2WiITmcGvpJC0hQzTbPAM
 xE2b4QVYeeocvZ1B2vfZnDm0JdXVRX74tcgH+nmmqBs+H7aFSU3aAG/61eAkAiNpHXum
 sOZw==
X-Gm-Message-State: AOAM532xJJzJ3k86UB85SzRXuHRLo3UMQRXnbH4izmOf2XP7B7U7doIP
 aMxxCHiog/pj3oC8JVBxSU4qswH3oZQmjA==
X-Google-Smtp-Source: ABdhPJxDej+nRQvtn6jA3rM8NSpw6mLikQ2bcFBkrOahf8fG9+SBENbjUXb23hsYu+aCqQLT83epgg==
X-Received: by 2002:a5d:58c2:0:b0:210:2baa:52b8 with SMTP id
 o2-20020a5d58c2000000b002102baa52b8mr8195317wrf.20.1653926830402; 
 Mon, 30 May 2022 09:07:10 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 bi12-20020a05600c3d8c00b003974b95d897sm10232152wmb.37.2022.05.30.09.07.09
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 30 May 2022 09:07:10 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 000/117] target-arm queue
Date: Mon, 30 May 2022 17:05:11 +0100
Message-Id: <20220530160708.726466-1-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::434;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x434.google.com
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

Massive pullreq but almost all of that is RTH's SVE
refactoring patchset. The other interesting thing here is
the fix for compiling on aarch64 macos.

thanks
-- PMM

The following changes since commit f7a1ea403e0282a7f57edd4298c4f65f24165da5:

  Merge tag 'misc-pull-request' of gitlab.com:marcandre.lureau/qemu into staging (2022-05-29 16:34:56 -0700)

are available in the Git repository at:

  https://git.linaro.org/people/pmaydell/qemu-arm.git tags/pull-target-arm-20220530

for you to fetch changes up to b1071174d2a2ab371082b7d4b5f19e98edc61ac6:

  target/arm: Remove aa64_sve check from before disas_sve (2022-05-30 17:05:12 +0100)

----------------------------------------------------------------
target-arm queue:
 * docs/system/arm: Add FEAT_HCX to list of emulated features
 * target/arm/hvf: Include missing "cpregs.h"
 * hw/sd/allwinner-sdhost: report FIFO water level as 1 when data ready
 * SVE: refactor to use TRANS/TRANS_FEAT macros and push
   SVE feature check down to individual insn level

----------------------------------------------------------------
Icenowy Zheng (1):
      hw/sd/allwinner-sdhost: report FIFO water level as 1 when data ready

Peter Maydell (1):
      docs/system/arm: Add FEAT_HCX to list of emulated features

Philippe Mathieu-Daudé (1):
      target/arm/hvf: Include missing "cpregs.h"

Richard Henderson (114):
      target/arm: Introduce TRANS, TRANS_FEAT
      target/arm: Move null function and sve check into gen_gvec_ool_zz
      target/arm: Use TRANS_FEAT for gen_gvec_ool_zz
      target/arm: Move null function and sve check into gen_gvec_ool_zzz
      target/arm: Introduce gen_gvec_ool_arg_zzz
      target/arm: Use TRANS_FEAT for gen_gvec_ool_arg_zzz
      target/arm: Use TRANS_FEAT for do_sve2_zzz_ool
      target/arm: Move null function and sve check into gen_gvec_ool_zzzz
      target/arm: Use TRANS_FEAT for gen_gvec_ool_zzzz
      target/arm: Introduce gen_gvec_ool_arg_zzzz
      target/arm: Use TRANS_FEAT for do_sve2_zzzz_ool
      target/arm: Use TRANS_FEAT for gen_gvec_ool_arg_zzzz
      target/arm: Rename do_zzxz_ool to gen_gvec_ool_arg_zzxz
      target/arm: Use TRANS_FEAT for gen_gvec_ool_arg_zzxz
      target/arm: Use TRANS_FEAT for do_sve2_zzz_data
      target/arm: Use TRANS_FEAT for do_sve2_zzzz_data
      target/arm: Use TRANS_FEAT for do_sve2_zzw_data
      target/arm: Use TRANS_FEAT for USDOT_zzzz
      target/arm: Move null function and sve check into gen_gvec_ool_zzp
      target/arm: Introduce gen_gvec_ool_arg_zpz
      target/arm: Use TRANS_FEAT for gen_gvec_ool_arg_zpz
      target/arm: Use TRANS_FEAT for do_sve2_zpz_data
      target/arm: Rename do_zpzi_ool to gen_gvec_ool_arg_zpzi
      target/arm: Use TRANS_FEAT for gen_gvec_ool_arg_zpzi
      target/arm: Move null function and sve check into gen_gvec_ool_zzzp
      target/arm: Introduce gen_gvec_ool_arg_zpzz
      target/arm: Use TRANS_FEAT for gen_gvec_ool_arg_zpzz
      target/arm: Use TRANS_FEAT for do_sve2_zpzz_ool
      target/arm: Merge gen_gvec_fn_zz into do_mov_z
      target/arm: Move null function and sve check into gen_gvec_fn_zzz
      target/arm: Rename do_zzz_fn to gen_gvec_fn_arg_zzz
      target/arm: More use of gen_gvec_fn_arg_zzz
      target/arm: Use TRANS_FEAT for gen_gvec_fn_arg_zzz
      target/arm: Use TRANS_FEAT for do_sve2_fn_zzz
      target/arm: Use TRANS_FEAT for RAX1
      target/arm: Introduce gen_gvec_fn_arg_zzzz
      target/arm: Use TRANS_FEAT for do_sve2_zzzz_fn
      target/arm: Introduce gen_gvec_fn_zzi
      target/arm: Use TRANS_FEAT for do_zz_dbm
      target/arm: Hoist sve access check through do_sel_z
      target/arm: Introduce gen_gvec_fn_arg_zzi
      target/arm: Use TRANS_FEAT for do_sve2_fn2i
      target/arm: Use TRANS_FEAT for do_vpz_ool
      target/arm: Use TRANS_FEAT for do_shift_imm
      target/arm: Introduce do_shift_zpzi
      target/arm: Use TRANS_FEAT for do_shift_zpzi
      target/arm: Use TRANS_FEAT for do_zpzzz_ool
      target/arm: Move sve check into do_index
      target/arm: Use TRANS_FEAT for do_index
      target/arm: Use TRANS_FEAT for do_adr
      target/arm: Use TRANS_FEAT for do_predset
      target/arm: Use TRANS_FEAT for RDFFR, WRFFR
      target/arm: Use TRANS_FEAT for do_pfirst_pnext
      target/arm: Use TRANS_FEAT for do_EXT
      target/arm: Use TRANS_FEAT for do_perm_pred3
      target/arm: Use TRANS_FEAT for do_perm_pred2
      target/arm: Move sve zip high_ofs into simd_data
      target/arm: Use gen_gvec_ool_arg_zzz for do_zip, do_zip_q
      target/arm: Use TRANS_FEAT for do_zip, do_zip_q
      target/arm: Use TRANS_FEAT for do_clast_vector
      target/arm: Use TRANS_FEAT for do_clast_fp
      target/arm: Use TRANS_FEAT for do_clast_general
      target/arm: Use TRANS_FEAT for do_last_fp
      target/arm: Use TRANS_FEAT for do_last_general
      target/arm: Use TRANS_FEAT for SPLICE
      target/arm: Use TRANS_FEAT for do_ppzz_flags
      target/arm: Use TRANS_FEAT for do_sve2_ppzz_flags
      target/arm: Use TRANS_FEAT for do_ppzi_flags
      target/arm: Use TRANS_FEAT for do_brk2, do_brk3
      target/arm: Use TRANS_FEAT for MUL_zzi
      target/arm: Reject dup_i w/ shifted byte early
      target/arm: Reject add/sub w/ shifted byte early
      target/arm: Reject copy w/ shifted byte early
      target/arm: Use TRANS_FEAT for ADD_zzi
      target/arm: Use TRANS_FEAT for do_zzi_sat
      target/arm: Use TRANS_FEAT for do_zzi_ool
      target/arm: Introduce gen_gvec_{ptr,fpst}_zzzz
      target/arm: Use TRANS_FEAT for FMMLA
      target/arm: Move sve check into gen_gvec_fn_ppp
      target/arm: Implement NOT (prediates) alias
      target/arm: Use TRANS_FEAT for SEL_zpzz
      target/arm: Use TRANS_FEAT for MOVPRFX
      target/arm: Use TRANS_FEAT for FMLA
      target/arm: Use TRANS_FEAT for BFMLA
      target/arm: Rename do_zzz_fp to gen_gvec_ool_fpst_arg_zzz
      target/arm: Use TRANS_FEAT for DO_FP3
      target/arm: Use TRANS_FEAT for FMUL_zzx
      target/arm: Use TRANS_FEAT for FTMAD
      target/arm: Move null function and sve check into do_reduce
      target/arm: Use TRANS_FEAT for do_reduce
      target/arm: Use TRANS_FEAT for FRECPE, FRSQRTE
      target/arm: Expand frint_fns for MO_8
      target/arm: Rename do_zpz_ptr to gen_gvec_ool_fpst_arg_zpz
      target/arm: Move null function and sve check into do_frint_mode
      target/arm: Use TRANS_FEAT for do_frint_mode
      target/arm: Use TRANS_FEAT for FLOGB
      target/arm: Use TRANS_FEAT for do_ppz_fp
      target/arm: Rename do_zpzz_ptr to gen_gvec_fpst_arg_zpzz
      target/arm: Use TRANS_FEAT for gen_gvec_fpst_arg_zpzz
      target/arm: Use TRANS_FEAT for FCADD
      target/arm: Introduce gen_gvec_fpst_zzzzp
      target/arm: Use TRANS_FEAT for gen_gvec_fpst_zzzzp
      target/arm: Move null function and sve check into do_fp_imm
      target/arm: Use TRANS_FEAT for DO_FP_IMM
      target/arm: Use TRANS_FEAT for DO_FPCMP
      target/arm: Remove assert in trans_FCMLA_zzxz
      target/arm: Use TRANS_FEAT for FCMLA_zzxz
      target/arm: Use TRANS_FEAT for do_narrow_extract
      target/arm: Use TRANS_FEAT for do_shll_tb
      target/arm: Use TRANS_FEAT for do_shr_narrow
      target/arm: Use TRANS_FEAT for do_FMLAL_zzzw
      target/arm: Use TRANS_FEAT for do_FMLAL_zzxw
      target/arm: Add sve feature check for remaining trans_* functions
      target/arm: Remove aa64_sve check from before disas_sve

 docs/system/arm/emulation.rst |    1 +
 target/arm/translate.h        |   11 +
 target/arm/sve.decode         |   57 +-
 hw/sd/allwinner-sdhost.c      |    7 +
 target/arm/hvf/hvf.c          |    1 +
 target/arm/sve_helper.c       |    6 +-
 target/arm/translate-a64.c    |    2 +-
 target/arm/translate-sve.c    | 5367 +++++++++++++++--------------------------
 8 files changed, 2067 insertions(+), 3385 deletions(-)

