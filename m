Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 53B60424167
	for <lists+qemu-devel@lfdr.de>; Wed,  6 Oct 2021 17:33:37 +0200 (CEST)
Received: from localhost ([::1]:54932 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mY8vI-00061f-0V
	for lists+qemu-devel@lfdr.de; Wed, 06 Oct 2021 11:33:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46752)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mY8iU-0002GB-KN
 for qemu-devel@nongnu.org; Wed, 06 Oct 2021 11:20:24 -0400
Received: from mail-pf1-x430.google.com ([2607:f8b0:4864:20::430]:36747)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mY8iP-0007aJ-6B
 for qemu-devel@nongnu.org; Wed, 06 Oct 2021 11:20:22 -0400
Received: by mail-pf1-x430.google.com with SMTP id m26so2663755pff.3
 for <qemu-devel@nongnu.org>; Wed, 06 Oct 2021 08:20:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=0MP9butdVflUHBkLe2mhaMFuxyg3Qrs9vbKHsDiLipI=;
 b=hL+zIuJ9nqbVgJ3V+tSLK4QifYlJ9kd4Wf0G+mPij57VZH84yyIToUEIBbU4QsB1+N
 F2MUtfCke1FU22BXAE0rNofb9b184xu18bidEOmBM9PvBjxdC8HKTMKEiGFLyTYlxtl/
 BCMCBbxobJRmjar6t4dUF1tAzfV0K0lGEl21cNktpfHMFgvNTEkpG87NDXqCYm4perxs
 nRI3PRtrarScLFDSgtAboIbuUqxypC84la3dK1xcMXzQE8nGAgMNZWWd4Qk6n7MCzVSc
 EpFU0QwSoF92XtCv9pEr0VuqqbndfxNvRFM+QUMX0R9h2Ru2sgx+x8tSTHBcprPPcPFt
 2UUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=0MP9butdVflUHBkLe2mhaMFuxyg3Qrs9vbKHsDiLipI=;
 b=Htdp/FrUr09jo5qCYJaLD2U2/jsFFmnMXCWwi18bJITacIpHtPe+R+C3QsIXY7Y3Qr
 2SqLx9guNo8idv3KKeYd98tv++Pzr1Bb9ZIarQGifEZIKIptiQTjcOKcoJ/yBRHq16NA
 KLilvZzspFrrG0BiyF8DTmUjOP6ulsG2/2mjVaW3UYNCvjCZjJxVlBClgdAAZgO8asqv
 rm4qweXLov5hsFR7jiLAXnME6gWbbkDec8SjZmK+svCtiu+zkMGVptFmaTi4stXNYfuB
 ArxWRvIcG5bfI2kX4PgtTDlXoPKVWVya9LKUjRysI2tVPTDm+h+GGOnQT9PryqSWpNtB
 JoIA==
X-Gm-Message-State: AOAM530TcJHEM8sKiZSq3suZ4ppMawTXmfm/1lwI+l4URNBwVJJ5H5vV
 AgjbZVl9mKfSANmVT8di+wWMyncwZLe3Fg==
X-Google-Smtp-Source: ABdhPJx1f06W1KysRDwOLRjrTsygF32KVqUE6fXdKHyGwnR/kfHlX5yG68AYUI/x1l42n8iJ4EeCwQ==
X-Received: by 2002:aa7:80d1:0:b029:399:ce3a:d617 with SMTP id
 a17-20020aa780d10000b0290399ce3ad617mr38286617pfn.16.1633533615343; 
 Wed, 06 Oct 2021 08:20:15 -0700 (PDT)
Received: from localhost.localdomain ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id 130sm22239256pfz.77.2021.10.06.08.20.14
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 06 Oct 2021 08:20:14 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 00/28] tcg patch queue
Date: Wed,  6 Oct 2021 08:19:46 -0700
Message-Id: <20211006152014.741026-1-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::430;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x430.google.com
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

The following changes since commit e3acc2c1961cbe22ca474cd5da4163b7bbf7cea3:

  tests/docker/dockerfiles: Bump fedora-i386-cross to fedora 34 (2021-10-05 16:40:39 -0700)

are available in the Git repository at:

  https://gitlab.com/rth7680/qemu.git tags/pull-tcg-20211006

for you to fetch changes up to ea3f2af8f1b87d7bced9b75ef2e788b66ec49961:

  tcg/s390x: Implement TCG_TARGET_HAS_cmpsel_vec (2021-10-05 16:53:17 -0700)

----------------------------------------------------------------
More fixes for fedora-i386-cross
Add dup_const_tl
Expand MemOp MO_SIZE
Move MemOpIdx out of tcg.h
Vector support for tcg/s390x

----------------------------------------------------------------
Philipp Tomsich (1):
      tcg: add dup_const_tl wrapper

Richard Henderson (27):
      tests/docker: Remove fedora-i386-cross from DOCKER_PARTIAL_IMAGES
      tests/docker: Fix fedora-i386-cross cross-compilation
      accel/tcg: Drop signness in tracing in cputlb.c
      tcg: Expand MO_SIZE to 3 bits
      tcg: Rename TCGMemOpIdx to MemOpIdx
      tcg: Split out MemOpIdx to exec/memopidx.h
      trace/mem: Pass MemOpIdx to trace_mem_get_info
      accel/tcg: Pass MemOpIdx to atomic_trace_*_post
      plugins: Reorg arguments to qemu_plugin_vcpu_mem_cb
      trace: Split guest_mem_before
      hw/core/cpu: Re-sort the non-pointers to the end of CPUClass
      tcg: Expand usadd/ussub with umin/umax
      tcg/s390x: Rename from tcg/s390
      tcg/s390x: Change FACILITY representation
      tcg/s390x: Merge TCG_AREG0 and TCG_REG_CALL_STACK into TCGReg
      tcg/s390x: Add host vector framework
      tcg/s390x: Implement tcg_out_ld/st for vector types
      tcg/s390x: Implement tcg_out_mov for vector types
      tcg/s390x: Implement tcg_out_dup*_vec
      tcg/s390x: Implement minimal vector operations
      tcg/s390x: Implement andc, orc, abs, neg, not vector operations
      tcg/s390x: Implement TCG_TARGET_HAS_mul_vec
      tcg/s390x: Implement vector shift operations
      tcg/s390x: Implement TCG_TARGET_HAS_minmax_vec
      tcg/s390x: Implement TCG_TARGET_HAS_sat_vec
      tcg/s390x: Implement TCG_TARGET_HAS_bitsel_vec
      tcg/s390x: Implement TCG_TARGET_HAS_cmpsel_vec

 meson.build                                       |   2 -
 accel/tcg/atomic_template.h                       |  73 +-
 include/exec/memop.h                              |  14 +-
 include/exec/memopidx.h                           |  55 ++
 include/hw/core/cpu.h                             |  11 +-
 include/qemu/plugin.h                             |  26 +-
 include/tcg/tcg.h                                 | 117 ++-
 tcg/{s390 => s390x}/tcg-target-con-set.h          |   7 +
 tcg/{s390 => s390x}/tcg-target-con-str.h          |   1 +
 tcg/{s390 => s390x}/tcg-target.h                  |  91 ++-
 tcg/s390x/tcg-target.opc.h                        |  15 +
 trace/mem.h                                       |  63 --
 accel/tcg/cputlb.c                                | 103 ++-
 accel/tcg/plugin-gen.c                            |   5 +-
 accel/tcg/user-exec.c                             | 133 ++-
 plugins/api.c                                     |  19 +-
 plugins/core.c                                    |  10 +-
 target/arm/helper-a64.c                           |  16 +-
 target/arm/m_helper.c                             |   2 +-
 target/arm/translate-a64.c                        |   2 +-
 target/i386/tcg/mem_helper.c                      |   4 +-
 target/m68k/op_helper.c                           |   2 +-
 target/mips/tcg/msa_helper.c                      |   6 +-
 target/s390x/tcg/mem_helper.c                     |  20 +-
 target/sparc/ldst_helper.c                        |   2 +-
 tcg/optimize.c                                    |   2 +-
 tcg/tcg-op-vec.c                                  |  37 +-
 tcg/tcg-op.c                                      |  60 +-
 tcg/tcg.c                                         |   2 +-
 tcg/tci.c                                         |  14 +-
 accel/tcg/atomic_common.c.inc                     |  43 +-
 target/s390x/tcg/translate_vx.c.inc               |   2 +-
 tcg/aarch64/tcg-target.c.inc                      |  18 +-
 tcg/arm/tcg-target.c.inc                          |  14 +-
 tcg/i386/tcg-target.c.inc                         |  14 +-
 tcg/mips/tcg-target.c.inc                         |  16 +-
 tcg/ppc/tcg-target.c.inc                          |  18 +-
 tcg/riscv/tcg-target.c.inc                        |  20 +-
 tcg/{s390 => s390x}/tcg-target.c.inc              | 949 ++++++++++++++++++++--
 tcg/sparc/tcg-target.c.inc                        |  20 +-
 tcg/tcg-ldst.c.inc                                |   2 +-
 tests/docker/Makefile.include                     |   2 +-
 tests/docker/dockerfiles/fedora-i386-cross.docker |   5 +-
 trace-events                                      |  18 +-
 44 files changed, 1445 insertions(+), 610 deletions(-)
 create mode 100644 include/exec/memopidx.h
 rename tcg/{s390 => s390x}/tcg-target-con-set.h (86%)
 rename tcg/{s390 => s390x}/tcg-target-con-str.h (96%)
 rename tcg/{s390 => s390x}/tcg-target.h (66%)
 create mode 100644 tcg/s390x/tcg-target.opc.h
 delete mode 100644 trace/mem.h
 rename tcg/{s390 => s390x}/tcg-target.c.inc (73%)

