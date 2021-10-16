Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 724DC430421
	for <lists+qemu-devel@lfdr.de>; Sat, 16 Oct 2021 20:19:01 +0200 (CEST)
Received: from localhost ([::1]:56936 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mboGq-0004La-Ho
	for lists+qemu-devel@lfdr.de; Sat, 16 Oct 2021 14:19:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40794)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mboDJ-0008IV-Bo
 for qemu-devel@nongnu.org; Sat, 16 Oct 2021 14:15:22 -0400
Received: from mail-pj1-x1031.google.com ([2607:f8b0:4864:20::1031]:51799)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mboDG-0001nM-9Y
 for qemu-devel@nongnu.org; Sat, 16 Oct 2021 14:15:20 -0400
Received: by mail-pj1-x1031.google.com with SMTP id kk10so9497855pjb.1
 for <qemu-devel@nongnu.org>; Sat, 16 Oct 2021 11:15:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ZXgErN7FWEdb2nVD2KaoD0MRMD5i9n59j0b7dHEuajY=;
 b=kZTeTJuAx+lQZqE+V4RWO7crthH6xZbFf/d4P71lJaToBPuH/V/XofqOHOGWmwo5/i
 F48VVQYU76OW6My9YbmEDhAt4t/6br/x7TG2/kAz2bprknOFiieI+p9+39XDUL41ZT2H
 19gPGBGZ7MFb9RsEzlhVH5gC2jnD2JkpunOpWGCjfa2ypWeouZf/Oi0tH15/R/b+kHNU
 faYCJZLuW3gFax3U8Q4sZFrWPLC1Fu4dsSkIEOiN1jJ3ijBgUVkgFxatTQnEeGddHQqE
 DVxLyLBVyN+1fh165pzcFG7/1gZPAiTFgg2xvh2v/cBUZZS+jv+AaI88RqfTssAyp/fA
 If5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ZXgErN7FWEdb2nVD2KaoD0MRMD5i9n59j0b7dHEuajY=;
 b=WiBKfnMKNB+tjSC9iqDQADyCjYeq5OJaq5vHV10mzMrXK9mf0/q/B10Yx0pNSm6BQD
 U5ajqwEHxBBgDr4HemwqjezD/m6B48ab7EhttFia+rrUxPP0R05r2UmTSRWCRguRT8hK
 1ldnsGAfIR4EROxUhX09551eLprja4bcUF5tbqCkgwH9NJFEUqdfuLjwv4kCyPWog5El
 MEVCTe7Kk2TqXJkSBFh/DhQdlgtHWbOx4FY2UbICRfNHGTl/OvNJMABAIC8LZuGkdBXG
 nobGt2vToC9Q4qiuQHvedhuX+gGpprAVsVo9RO1mp/+QnCdnByYQT0Cbm9bqcGoNrnCx
 1JMA==
X-Gm-Message-State: AOAM531WUs67XrD0B2AdE0Aa4V0ZfWH3///qO/vQf6Nytf9QO2ZEGl4m
 6M1SrXYHZp5yhuX/nttip1/VbNc+r3FXPw==
X-Google-Smtp-Source: ABdhPJyxV4GJlmbIOz/F2vLeWT3XhV2HmeW/Lbxz2Zsp3NbfJEmQVyYuekzKORRFymeokbJpFRxEkQ==
X-Received: by 2002:a17:902:654b:b0:13d:c967:9cbd with SMTP id
 d11-20020a170902654b00b0013dc9679cbdmr17652908pln.88.1634408115956; 
 Sat, 16 Oct 2021 11:15:15 -0700 (PDT)
Received: from localhost.localdomain ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id ob5sm5075097pjb.2.2021.10.16.11.15.15
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 16 Oct 2021 11:15:15 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 00/24] tcg patch queue
Date: Sat, 16 Oct 2021 11:14:50 -0700
Message-Id: <20211016181514.3165661-1-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1031;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1031.google.com
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

The following changes since commit 6587b0c1331d427b0939c37e763842550ed581db:

  Merge remote-tracking branch 'remotes/ericb/tags/pull-nbd-2021-10-15' into staging (2021-10-15 14:16:28 -0700)

are available in the Git repository at:

  https://gitlab.com/rth7680/qemu.git tags/pull-tcg-20211016

for you to fetch changes up to 995b87dedc78b0467f5f18bbc3546072ba97516a:

  Revert "cpu: Move cpu_common_props to hw/core/cpu.c" (2021-10-15 16:39:15 -0700)

----------------------------------------------------------------
Move gdb singlestep to generic code
Fix cpu_common_props

----------------------------------------------------------------
Richard Henderson (24):
      accel/tcg: Handle gdb singlestep in cpu_tb_exec
      target/alpha: Drop checks for singlestep_enabled
      target/avr: Drop checks for singlestep_enabled
      target/cris: Drop checks for singlestep_enabled
      target/hexagon: Drop checks for singlestep_enabled
      target/arm: Drop checks for singlestep_enabled
      target/hppa: Drop checks for singlestep_enabled
      target/i386: Check CF_NO_GOTO_TB for dc->jmp_opt
      target/i386: Drop check for singlestep_enabled
      target/m68k: Drop checks for singlestep_enabled
      target/microblaze: Check CF_NO_GOTO_TB for DISAS_JUMP
      target/microblaze: Drop checks for singlestep_enabled
      target/mips: Fix single stepping
      target/mips: Drop exit checks for singlestep_enabled
      target/openrisc: Drop checks for singlestep_enabled
      target/ppc: Drop exit checks for singlestep_enabled
      target/riscv: Remove dead code after exception
      target/riscv: Remove exit_tb and lookup_and_goto_ptr
      target/rx: Drop checks for singlestep_enabled
      target/s390x: Drop check for singlestep_enabled
      target/sh4: Drop check for singlestep_enabled
      target/tricore: Drop check for singlestep_enabled
      target/xtensa: Drop check for singlestep_enabled
      Revert "cpu: Move cpu_common_props to hw/core/cpu.c"

 include/hw/core/cpu.h                          |  1 +
 target/i386/helper.h                           |  1 -
 target/rx/helper.h                             |  1 -
 target/sh4/helper.h                            |  1 -
 target/tricore/helper.h                        |  1 -
 accel/tcg/cpu-exec.c                           | 11 ++++
 cpu.c                                          | 21 ++++++++
 hw/core/cpu-common.c                           | 17 +-----
 target/alpha/translate.c                       | 13 ++---
 target/arm/translate-a64.c                     | 10 +---
 target/arm/translate.c                         | 36 +++----------
 target/avr/translate.c                         | 19 ++-----
 target/cris/translate.c                        | 16 ------
 target/hexagon/translate.c                     | 12 +----
 target/hppa/translate.c                        | 17 ++----
 target/i386/tcg/misc_helper.c                  |  8 ---
 target/i386/tcg/translate.c                    |  9 ++--
 target/m68k/translate.c                        | 44 ++++-----------
 target/microblaze/translate.c                  | 18 ++-----
 target/mips/tcg/translate.c                    | 75 ++++++++++++--------------
 target/openrisc/translate.c                    | 18 ++-----
 target/ppc/translate.c                         | 38 +++----------
 target/riscv/translate.c                       | 27 +---------
 target/rx/op_helper.c                          |  8 ---
 target/rx/translate.c                          | 12 +----
 target/s390x/tcg/translate.c                   |  8 +--
 target/sh4/op_helper.c                         |  5 --
 target/sh4/translate.c                         | 14 ++---
 target/tricore/op_helper.c                     |  7 ---
 target/tricore/translate.c                     | 14 +----
 target/xtensa/translate.c                      | 25 +++------
 target/riscv/insn_trans/trans_privileged.c.inc | 10 ++--
 target/riscv/insn_trans/trans_rvi.c.inc        |  8 ++-
 target/riscv/insn_trans/trans_rvv.c.inc        |  2 +-
 34 files changed, 141 insertions(+), 386 deletions(-)

