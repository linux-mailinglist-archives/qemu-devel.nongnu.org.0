Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DA41A3A4B61
	for <lists+qemu-devel@lfdr.de>; Sat, 12 Jun 2021 01:47:15 +0200 (CEST)
Received: from localhost ([::1]:33432 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lrqrq-000385-U3
	for lists+qemu-devel@lfdr.de; Fri, 11 Jun 2021 19:47:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47006)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lrqmc-0002Gf-30
 for qemu-devel@nongnu.org; Fri, 11 Jun 2021 19:41:50 -0400
Received: from mail-pj1-x1033.google.com ([2607:f8b0:4864:20::1033]:38766)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lrqmZ-0002Wu-4R
 for qemu-devel@nongnu.org; Fri, 11 Jun 2021 19:41:49 -0400
Received: by mail-pj1-x1033.google.com with SMTP id
 m13-20020a17090b068db02901656cc93a75so6716951pjz.3
 for <qemu-devel@nongnu.org>; Fri, 11 Jun 2021 16:41:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=eues2fGVOKBvzu565cI9EabFLOLH2on1dIrf6NF/Yos=;
 b=tQEB+zxnYAe6P1fP0Gax29wBt2keo1E6bI7iem2d218eakw1BrjVojbzU0qagMALlf
 NkdpbXhYLT55UGEgzeDmiAHiTSoxSb150ADY2lYPjZefbasAkVeogNhjHHJilOtfbblo
 SOqcnsvx6rpYRCwCYEOJ2RZfBF1AbTEgWtoDMcP7ExLny7ajhCNKEkP5gurs7n03/QQE
 kcqx6SXx4OXO2LEhSwCr99R6/cziV1dXi1z+IaRJLJ2BOjmxVWi/pGKsB2TiXuOnTF+H
 aoCj3mY2mNaNJC4V1SOMgbI5zwy84wkZUXsFLFi1hNeZkziGJvNHktykv2CrRveTq2d7
 pF7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=eues2fGVOKBvzu565cI9EabFLOLH2on1dIrf6NF/Yos=;
 b=PEhogTWcU55E8pUNMUD1uSW7RcEBq7pSATeFbKb+u6c3ugZWPm1o823Q3WkZAtQh5M
 MPs+6W++7h0jPsW2ejAa/NXcH/WK97tdp9tPtXMH6kF3edhzaDqwF3+saeEhc3ia4W1P
 mL4e0AVfgiJ638ww4C3C7+XnL43gjO4hZLZfNvr0VOPjNgB3tR3/M8pRj6G+bsLLawGN
 emJnkXYyVKbGZOcRI/BJJVS5VReFwt1Sxb7lmgxsk/iBm15dbCDqRGapr35yTw952Edi
 puhjDpL5PxAn9xbssgBnt52rLqE0rA2LDLJ1QeL0oKk4wc4STmzfUExes77J0vmBOVxJ
 O4lw==
X-Gm-Message-State: AOAM531TKkextABV1y/LUz8xx+EI4aKwPPVb/Jy7AaAt9UHT7XH94fz0
 3eWNv5wLDwFHilQGZVsSsSj9gTDXS2A2WQ==
X-Google-Smtp-Source: ABdhPJyyu9VtExn9gNESev6rVo0I0XEfLl/oh52Kr0wvwOwfiEtSwK1i0V4MSM/8M3qlZg5llopSOg==
X-Received: by 2002:a17:90b:f07:: with SMTP id
 br7mr7013045pjb.141.1623454905304; 
 Fri, 11 Jun 2021 16:41:45 -0700 (PDT)
Received: from localhost.localdomain (174-21-70-228.tukw.qwest.net.
 [174.21.70.228])
 by smtp.gmail.com with ESMTPSA id q23sm6139829pgm.31.2021.06.11.16.41.44
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 11 Jun 2021 16:41:45 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 00/34] tcg patch queue
Date: Fri, 11 Jun 2021 16:41:10 -0700
Message-Id: <20210611234144.653682-1-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1033;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1033.google.com
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

This is mostly my code_gen_buffer cleanup, plus a few other random
changes thrown in.  Including a fix for a recent float32_exp2 bug.


r~


The following changes since commit 894fc4fd670aaf04a67dc7507739f914ff4bacf2:

  Merge remote-tracking branch 'remotes/jasowang/tags/net-pull-request' into staging (2021-06-11 09:21:48 +0100)

are available in the Git repository at:

  https://gitlab.com/rth7680/qemu.git tags/pull-tcg-20210611

for you to fetch changes up to 60afaddc208d34f6dc86dd974f6e02724fba6eb6:

  docs/devel: Explain in more detail the TB chaining mechanisms (2021-06-11 09:41:25 -0700)

----------------------------------------------------------------
Clean up code_gen_buffer allocation.
Add tcg_remove_ops_after.
Fix tcg_constant_* documentation.
Improve TB chaining documentation.
Fix float32_exp2.

----------------------------------------------------------------
Jose R. Ziviani (1):
      tcg/arm: Fix tcg_out_op function signature

Luis Pires (1):
      docs/devel: Explain in more detail the TB chaining mechanisms

Richard Henderson (32):
      meson: Split out tcg/meson.build
      meson: Split out fpu/meson.build
      tcg: Re-order tcg_region_init vs tcg_prologue_init
      tcg: Remove error return from tcg_region_initial_alloc__locked
      tcg: Split out tcg_region_initial_alloc
      tcg: Split out tcg_region_prologue_set
      tcg: Split out region.c
      accel/tcg: Inline cpu_gen_init
      accel/tcg: Move alloc_code_gen_buffer to tcg/region.c
      accel/tcg: Rename tcg_init to tcg_init_machine
      tcg: Create tcg_init
      accel/tcg: Merge tcg_exec_init into tcg_init_machine
      accel/tcg: Use MiB in tcg_init_machine
      accel/tcg: Pass down max_cpus to tcg_init
      tcg: Introduce tcg_max_ctxs
      tcg: Move MAX_CODE_GEN_BUFFER_SIZE to tcg-target.h
      tcg: Replace region.end with region.total_size
      tcg: Rename region.start to region.after_prologue
      tcg: Tidy tcg_n_regions
      tcg: Tidy split_cross_256mb
      tcg: Move in_code_gen_buffer and tests to region.c
      tcg: Allocate code_gen_buffer into struct tcg_region_state
      tcg: Return the map protection from alloc_code_gen_buffer
      tcg: Sink qemu_madvise call to common code
      util/osdep: Add qemu_mprotect_rw
      tcg: Round the tb_size default from qemu_get_host_physmem
      tcg: Merge buffer protection and guard page protection
      tcg: When allocating for !splitwx, begin with PROT_NONE
      tcg: Move tcg_init_ctx and tcg_ctx from accel/tcg/
      tcg: Introduce tcg_remove_ops_after
      tcg: Fix documentation for tcg_constant_* vs tcg_temp_free_*
      softfloat: Fix tp init in float32_exp2

 docs/devel/tcg.rst        | 101 ++++-
 meson.build               |  12 +-
 accel/tcg/internal.h      |   2 +
 include/qemu/osdep.h      |   1 +
 include/sysemu/tcg.h      |   2 -
 include/tcg/tcg.h         |  28 +-
 tcg/aarch64/tcg-target.h  |   1 +
 tcg/arm/tcg-target.h      |   1 +
 tcg/i386/tcg-target.h     |   2 +
 tcg/mips/tcg-target.h     |   6 +
 tcg/ppc/tcg-target.h      |   2 +
 tcg/riscv/tcg-target.h    |   1 +
 tcg/s390/tcg-target.h     |   3 +
 tcg/sparc/tcg-target.h    |   1 +
 tcg/tcg-internal.h        |  40 ++
 tcg/tci/tcg-target.h      |   1 +
 accel/tcg/tcg-all.c       |  32 +-
 accel/tcg/translate-all.c | 439 +-------------------
 bsd-user/main.c           |   3 +-
 fpu/softfloat.c           |   2 +-
 linux-user/main.c         |   1 -
 tcg/region.c              | 999 ++++++++++++++++++++++++++++++++++++++++++++++
 tcg/tcg.c                 | 649 +++---------------------------
 util/osdep.c              |   9 +
 tcg/arm/tcg-target.c.inc  |   3 +-
 fpu/meson.build           |   1 +
 tcg/meson.build           |  14 +
 27 files changed, 1266 insertions(+), 1090 deletions(-)
 create mode 100644 tcg/tcg-internal.h
 create mode 100644 tcg/region.c
 create mode 100644 fpu/meson.build
 create mode 100644 tcg/meson.build

