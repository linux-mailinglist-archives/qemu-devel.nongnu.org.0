Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 92E31655BD5
	for <lists+qemu-devel@lfdr.de>; Sun, 25 Dec 2022 00:59:15 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p9EOQ-0002GC-Dw; Sat, 24 Dec 2022 18:57:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1p9EOL-0002Fv-EF
 for qemu-devel@nongnu.org; Sat, 24 Dec 2022 18:57:28 -0500
Received: from mail-pj1-x102b.google.com ([2607:f8b0:4864:20::102b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1p9EOJ-0006GI-Mz
 for qemu-devel@nongnu.org; Sat, 24 Dec 2022 18:57:25 -0500
Received: by mail-pj1-x102b.google.com with SMTP id p4so7976959pjk.2
 for <qemu-devel@nongnu.org>; Sat, 24 Dec 2022 15:57:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=zmZBta4OA8lDZ/3kYONYuz+WSPAUy4QHgAgO76bZBco=;
 b=L5LxRwGOQG1fVN12UXX2jdX4Eqm13+1PhTLhIjVpVt3WNwawXKKMnL7y4bKXobwA0R
 KMUi3h2W/E+lqHXYtrOxugZBYV/zeqYNn9FayxiYJl7p8cZab7xjc11+KvTgciDHqB37
 uMdhhRdHXl5wBXmc7WmOlc5ANv0x16VM1ef3a4ZyLelenPcX2bIFTGRMDwvYHXftlfRO
 YC1+M02MYgQQ5NWpGx/PhH2oqdtlz3ww10omw+tx3G6NzUP1p1PGLy8AweE9xjG3ZhKa
 /ioM11jnv6GaN5YSqigSDCAKv8yV71dTFDAKR/rMBGrqe/QDRpfxciucOpXChOX0aYhO
 kavA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=zmZBta4OA8lDZ/3kYONYuz+WSPAUy4QHgAgO76bZBco=;
 b=QQ+LioHD3zZ+EtaD9FZayaMaIMZnrLR7hdnAGOxUmB+K6OWBvIbb5f1sAHJCpdXBkM
 oRwFtmk58mhQ2Om3w4kamPM0L6iIMIWksTDMzu5/iso8r97Llz5Xhs2fd24vso7t5URe
 myz6tvb63AbwELMB0wJ5AIREO/8Js6hRtzSo517ay8fgV6k8JgJBBe84CIJOxYawyTgE
 5149JuEcen5Ka+XZV/7rO0DcOBc0Ut6Kh6+mxW+Ku6iTiozq70OJj/Wjd/YbeA+L0MJa
 qWJBCTzmkAKpqOjslz/wQU1FupNBWHrYmbojgy5MvSp9FwIScA4Mcc5rnsZW+DkIrOS1
 GE4Q==
X-Gm-Message-State: AFqh2kqJZ01u9InMASLq0aBaWEOu9+tD3QgXNpTE7zKiAXGI/Ak4iKqt
 DE0hg/xlNiQKjjsotUrHyZADotFOCYR9mur9
X-Google-Smtp-Source: AMrXdXtXg5VRA+kohcQRkRwiG69jBlstbNAA6uANKlK/+ycGc86ABWcK7LaX/pz4JUefyZh9Q80sEg==
X-Received: by 2002:a17:903:200b:b0:189:6453:f455 with SMTP id
 s11-20020a170903200b00b001896453f455mr13611971pla.35.1671926241954; 
 Sat, 24 Dec 2022 15:57:21 -0800 (PST)
Received: from stoup.. (76-14-210-194.or.wavecable.com. [76.14.210.194])
 by smtp.gmail.com with ESMTPSA id
 cp12-20020a170902e78c00b00187022627d7sm4599716plb.36.2022.12.24.15.57.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 24 Dec 2022 15:57:21 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: alex.bennee@linaro.org,
	philmd@linaro.org
Subject: [PATCH v5 00/43] tcg misc patches
Date: Sat, 24 Dec 2022 15:56:37 -0800
Message-Id: <20221224235720.842093-1-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102b.google.com
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

For v5, I've not omitted some of the reviewed patches, as I did for v4.
There are only a couple of patches lacking review:

  15-tcg-Fix-tcg_reg_alloc_dup.patch
  19-tcg-Introduce-paired-register-allocation.patch
  36-tcg-Vary-the-allocation-size-for-TCGOp.patch
  38-tcg-Reorg-function-calls.patch


r~


Mark Cave-Ayland (1):
  tcg: convert tcg/README to rst

Philippe Mathieu-Daudé (5):
  tcg/s390x: Fix coding style
  tcg: Massage process_op_defs()
  tcg: Pass number of arguments to tcg_emit_op() / tcg_op_insert_*()
  tcg: Convert typecode_to_ffi from array to function
  tcg: Factor init_ffi_layouts() out of tcg_context_init()

Richard Henderson (37):
  meson: Move CONFIG_TCG_INTERPRETER to config_host
  tcg: Cleanup trailing whitespace
  qemu/main-loop: Introduce QEMU_IOTHREAD_LOCK_GUARD
  hw/mips: Use QEMU_IOTHREAD_LOCK_GUARD in cpu_mips_irq_request
  target/ppc: Use QEMU_IOTHREAD_LOCK_GUARD in ppc_maybe_interrupt
  target/ppc: Use QEMU_IOTHREAD_LOCK_GUARD in cpu_interrupt_exittb
  target/riscv: Use QEMU_IOTHREAD_LOCK_GUARD in riscv_cpu_update_mip
  hw/ppc: Use QEMU_IOTHREAD_LOCK_GUARD in ppc_set_irq
  accel/tcg: Use QEMU_IOTHREAD_LOCK_GUARD in io_readx/io_writex
  tcg: Tidy tcg_reg_alloc_op
  tcg: Remove TCG_TARGET_STACK_GROWSUP
  tci: MAX_OPC_PARAM_IARGS is no longer used
  tcg: Fix tcg_reg_alloc_dup*
  tcg: Centralize updates to reg_to_temp
  tcg: Remove check_regs
  tcg: Introduce paired register allocation
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
  accel/tcg/plugin: Don't search for the function pointer index
  accel/tcg/plugin: Avoid duplicate copy in copy_call
  accel/tcg/plugin: Use copy_op in append_{udata,mem}_cb
  tcg: Vary the allocation size for TCGOp
  tcg: Use output_pref wrapper function
  tcg: Reorg function calls
  tcg: Move ffi_cif pointer into TCGHelperInfo
  tcg/aarch64: Merge tcg_out_callr into tcg_out_call
  tcg: Add TCGHelperInfo argument to tcg_out_call

 docs/devel/atomics.rst           |    2 +
 docs/devel/index-tcg.rst         |    1 +
 docs/devel/tcg-ops.rst           |  941 +++++++++++++++++
 docs/devel/tcg.rst               |    2 +-
 meson.build                      |    4 +-
 include/exec/helper-head.h       |    2 +-
 include/qemu/main-loop.h         |   29 +
 include/tcg/tcg-op.h             |   35 +-
 include/tcg/tcg.h                |   96 +-
 tcg/aarch64/tcg-target.h         |    4 +-
 tcg/arm/tcg-target.h             |    4 +-
 tcg/i386/tcg-target.h            |    2 +
 tcg/loongarch64/tcg-target.h     |    3 +-
 tcg/mips/tcg-target.h            |    4 +-
 tcg/riscv/tcg-target.h           |    7 +-
 tcg/s390x/tcg-target.h           |    3 +-
 tcg/sparc64/tcg-target.h         |    3 +-
 tcg/tcg-internal.h               |   58 +-
 tcg/tci/tcg-target.h             |    7 +
 accel/tcg/cputlb.c               |   25 +-
 accel/tcg/plugin-gen.c           |   54 +-
 hw/core/cpu-common.c             |    1 +
 hw/mips/mips_int.c               |   11 +-
 hw/ppc/ppc.c                     |   10 +-
 target/ppc/excp_helper.c         |   11 +-
 target/ppc/helper_regs.c         |   14 +-
 target/riscv/cpu_helper.c        |   10 +-
 target/sparc/translate.c         |   21 +-
 tcg/optimize.c                   |   10 +-
 tcg/tcg-op-vec.c                 |   10 +-
 tcg/tcg-op.c                     |   49 +-
 tcg/tcg.c                        | 1655 +++++++++++++++++++-----------
 tcg/tci.c                        |    1 -
 tcg/aarch64/tcg-target.c.inc     |   19 +-
 tcg/arm/tcg-target.c.inc         |   10 +-
 tcg/i386/tcg-target.c.inc        |    5 +-
 tcg/loongarch64/tcg-target.c.inc |    7 +-
 tcg/mips/tcg-target.c.inc        |    3 +-
 tcg/ppc/tcg-target.c.inc         |   36 +-
 tcg/riscv/tcg-target.c.inc       |    7 +-
 tcg/s390x/tcg-target.c.inc       |   32 +-
 tcg/sparc64/tcg-target.c.inc     |    3 +-
 tcg/tci/tcg-target.c.inc         |    7 +-
 tcg/README                       |  784 --------------
 44 files changed, 2304 insertions(+), 1698 deletions(-)
 create mode 100644 docs/devel/tcg-ops.rst
 delete mode 100644 tcg/README

-- 
2.34.1


