Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C54FF6072AB
	for <lists+qemu-devel@lfdr.de>; Fri, 21 Oct 2022 10:42:59 +0200 (CEST)
Received: from localhost ([::1] helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1olncI-0007QX-Ci
	for lists+qemu-devel@lfdr.de; Fri, 21 Oct 2022 04:42:58 -0400
Received: from [::1] (helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1olmGs-0002zf-Fr
	for lists+qemu-devel@lfdr.de; Fri, 21 Oct 2022 03:16:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1olmGc-0002uv-Fx
 for qemu-devel@nongnu.org; Fri, 21 Oct 2022 03:16:32 -0400
Received: from mail-pf1-x42b.google.com ([2607:f8b0:4864:20::42b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1olmGa-0005az-7X
 for qemu-devel@nongnu.org; Fri, 21 Oct 2022 03:16:30 -0400
Received: by mail-pf1-x42b.google.com with SMTP id w189so355773pfw.4
 for <qemu-devel@nongnu.org>; Fri, 21 Oct 2022 00:16:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:to
 :from:from:to:cc:subject:date:message-id:reply-to;
 bh=f2Ye2akUtboTi2uzQNixomyJN598ADFOycC03liTqaM=;
 b=GCD7COUamUU73LLg5mwf6CjL8RqYGA70oKkzBHwnSpvWOqKyiDpVT+o4RDHR5KuZC8
 hx89ecirESOMarU5tqHezrjlBZtFKk3Wj7dMXAyrtFtISd1DeYRY2dXEwT1F5xH3uecC
 vrnMKkqWYHSAkxD+pB6yDaf02sgCj9ecWnO+Q+0WR7PylsGu67WVFBm4US8LyzoBBgEJ
 9HBiHzR1MePD3FSif5AsaMpaKDVuRCj6D6L1BDUejXjiSDVPPECDIUL33EF7Q4yrxmyB
 UkiEMBHKc+X5vbNIq6eWGx7uXbweNEIb3Dt323teJAtMvGTyxjny4F8Usho7qHv3SF4g
 0VTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=f2Ye2akUtboTi2uzQNixomyJN598ADFOycC03liTqaM=;
 b=pKyNnUHkA6p4K0xEv1z0MVBbmqDePFHIxWWg1oD7MbWpWLV3J7G4MnRPfcXTLq1NQt
 xDq7TVVfHsFr+G943GIt8dWcMv8D8oE8tFmmanG/fF8S8gAcwuQY5MAm9J/8B99LV2z9
 NlBN+swYm+R3NFf9yO4TWEJP/i+jis9QQLf7x782KZuGwSlLCCgTTK6uA8FSjLMvT9z0
 qknn+ec2JOftK+XtrC6IUO1YdtLJQYJl4QG84zlA346Ftl9eMUqCsz2sAszw/EbmxZjo
 U9781CF4HCzDSyUGpQYP6nJNmmgnlIj4CYFo81f87HNRUcsLlbjVCQAhd2QCaD/IN2wK
 PG4w==
X-Gm-Message-State: ACrzQf29rcMrHEhovhchLIm6/WWhzzE4YndQmf14brKALnDxeomCrlJK
 vtqKlKugF7nrNP5qjFkz4ECbjh73j0ZWv7+y
X-Google-Smtp-Source: AMsMyM6qK7/eM4+H6ioaf2IyDb+LS1YjfF98OXTYFnWsg6N83+/g3PhZVe/vxH9l9Q5bjJ2O8e5Sgw==
X-Received: by 2002:a63:4a53:0:b0:439:3c80:e053 with SMTP id
 j19-20020a634a53000000b004393c80e053mr15167616pgl.3.1666336585964; 
 Fri, 21 Oct 2022 00:16:25 -0700 (PDT)
Received: from localhost.localdomain ([149.135.10.35])
 by smtp.gmail.com with ESMTPSA id
 q9-20020a638c49000000b0041cd5ddde6fsm13003327pgn.76.2022.10.21.00.16.23
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 21 Oct 2022 00:16:25 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 00/36] tcg: Support for Int128 with helpers
Date: Fri, 21 Oct 2022 17:15:13 +1000
Message-Id: <20221021071549.2398137-1-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

This is working toward improving atomicity within TCG, especially
with respect to Arm FEAT_LSE2, which guarantees that any operation
that does not cross a 16-byte boundary is treated atomically.

That goal is somewhat down the road.  This patch set contains two
items: paired register allocation and TCGv_i128 usage with helpers.

The next step will be putting these two together to provide atomic
128-bit load/store operations within tcg.  Via, e.g. Arm lse2 ldp,
Power ldq, or S390x lpq -- all of which require allocating a pair
of registers.  (Intel will require that I go through AVX, which is
a bit of a complication, but I'll figure that out.)  And then of
course separately via the helpers used by the slow path.

I have additional patches to target/s390x to test Int128, but that
should be posted separately.  Anyway, this patch set is large enough.

Changes for v2:
  * Fixes and r-b (philmd).
  * Include i386 atomic16 patch, which avoids minor conflicts later.
  * Split a few larger patches.
  * Bug fixes for TCI.


r~


Based-on: 20221017062445.563431-1-richard.henderson@linaro.org
("[PATCH 0/3] tcg/sparc: Remove support for sparc32plus")

Richard Henderson (36):
  include/qemu/atomic128: Support 16-byte atomic read/write for Intel
    AVX
  tcg: Tidy tcg_reg_alloc_op
  tcg: Introduce paired register allocation
  tcg/s390x: Use register pair allocation for div and mulu2
  tcg/arm: Use register pair allocation for qemu_{ld,st}_i64
  meson: Move CONFIG_TCG_INTERPRETER to config_host
  tcg: Remove TCG_TARGET_STACK_GROWSUP
  accel/tcg: Set cflags_next_tb in cpu_common_initfn
  target/sparc: Avoid TCGV_{LOW,HIGH}
  tcg: Move TCG_{LOW,HIGH} to tcg-internal.h
  tcg: Add temp_subindex to TCGTemp
  tcg: Simplify calls to temp_sync vs mem_coherent
  tcg: Allocate TCGTemp pairs in host memory order
  tcg: Move TCG_TYPE_COUNT outside enum
  tcg: Introduce tcg_type_size
  tcg: Introduce TCGCallReturnKind and TCGCallArgumentKind
  tcg: Replace TCG_TARGET_CALL_ALIGN_ARGS with TCG_TARGET_CALL_ARG_I64
  tcg: Replace TCG_TARGET_EXTEND_ARGS with TCG_TARGET_CALL_ARG_I32
  tcg: Use TCG_CALL_ARG_EVEN for TCI special case
  tcg: Reorg function calls
  tcg: Move ffi_cif pointer into TCGHelperInfo
  tcg: Add TCGHelperInfo argument to tcg_out_call
  tcg: Define TCG_TYPE_I128 and related helper macros
  tcg: Add TCG_CALL_{RET,ARG}_NORMAL_4
  tcg: Allocate objects contiguously in temp_allocate_frame
  tcg: Introduce tcg_out_addi_ptr
  tcg: Add TCG_CALL_{RET,ARG}_BY_REF
  tcg: Introduce tcg_target_call_oarg_reg
  tcg: Add TCG_CALL_RET_BY_VEC
  include/qemu/int128: Use Int128 structure for TCI
  tcg/i386: Add TCG_TARGET_CALL_{RET,ARG}_I128
  tcg/tci: Fix big-endian return register ordering
  tcg/tci: Add TCG_TARGET_CALL_{RET,ARG}_I128
  tcg: Add TCG_TARGET_CALL_{RET,ARG}_I128
  tcg: Add temp allocation for TCGv_i128
  tcg: Add tcg_gen_extr_i128_i64, tcg_gen_concat_i64_i128

 meson.build                      |    4 +-
 include/exec/helper-head.h       |    7 +
 include/qemu/atomic128.h         |   74 +-
 include/qemu/int128.h            |   18 +-
 include/tcg/tcg-op.h             |    3 +
 include/tcg/tcg-opc.h            |    4 +
 include/tcg/tcg.h                |   97 +-
 tcg/aarch64/tcg-target.h         |    6 +-
 tcg/arm/tcg-target-con-set.h     |    7 +-
 tcg/arm/tcg-target-con-str.h     |    2 +
 tcg/arm/tcg-target.h             |    6 +-
 tcg/i386/tcg-target.h            |   12 +
 tcg/loongarch64/tcg-target.h     |    5 +-
 tcg/mips/tcg-target.h            |    6 +-
 tcg/riscv/tcg-target.h           |   10 +-
 tcg/s390x/tcg-target-con-set.h   |    4 +-
 tcg/s390x/tcg-target-con-str.h   |    8 +-
 tcg/s390x/tcg-target.h           |    5 +-
 tcg/sparc64/tcg-target.h         |    5 +-
 tcg/tcg-internal.h               |   72 +-
 tcg/tci/tcg-target.h             |   10 +
 hw/core/cpu-common.c             |    1 +
 target/sparc/translate.c         |   21 +-
 tcg/tcg-op.c                     |   45 +-
 tcg/tcg.c                        | 1755 ++++++++++++++++++++++--------
 tcg/tci.c                        |   66 +-
 util/atomic128.c                 |   67 ++
 util/int128.c                    |   42 +
 tcg/aarch64/tcg-target.c.inc     |   36 +-
 tcg/arm/tcg-target.c.inc         |   67 +-
 tcg/i386/tcg-target.c.inc        |   65 +-
 tcg/loongarch64/tcg-target.c.inc |   24 +-
 tcg/mips/tcg-target.c.inc        |   20 +-
 tcg/ppc/tcg-target.c.inc         |   56 +-
 tcg/riscv/tcg-target.c.inc       |   24 +-
 tcg/s390x/tcg-target.c.inc       |   71 +-
 tcg/sparc64/tcg-target.c.inc     |   22 +-
 tcg/tci/tcg-target.c.inc         |   31 +-
 util/meson.build                 |    1 +
 39 files changed, 2084 insertions(+), 695 deletions(-)
 create mode 100644 util/atomic128.c

-- 
2.34.1


