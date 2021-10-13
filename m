Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 65C1D42C8A3
	for <lists+qemu-devel@lfdr.de>; Wed, 13 Oct 2021 20:25:43 +0200 (CEST)
Received: from localhost ([::1]:47404 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1maiwg-0006NT-Ge
	for lists+qemu-devel@lfdr.de; Wed, 13 Oct 2021 14:25:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36676)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1maitq-0003cr-UL
 for qemu-devel@nongnu.org; Wed, 13 Oct 2021 14:22:46 -0400
Received: from mail-pg1-x533.google.com ([2607:f8b0:4864:20::533]:33543)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1maito-0002xe-Ev
 for qemu-devel@nongnu.org; Wed, 13 Oct 2021 14:22:46 -0400
Received: by mail-pg1-x533.google.com with SMTP id a73so3182219pge.0
 for <qemu-devel@nongnu.org>; Wed, 13 Oct 2021 11:22:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=b4rrpcdc4Lh4aTSwmuJ3m73tilR54GXwK7KQ0j+3pQs=;
 b=h7Ltl5TniVNYH6JUxuf0/S7etZ50iPGNkBEBdQNagXht9q3oAEJuFPx0FCCZ26OAv1
 1ZvQ4dEoYuYZIycQQBuJSxgwQBYTMTeLetgonjuciXt2kabmG7enJVYm0JzEV3OojZmz
 QxkRpBePm+yYma+OdW1W2m9DG7WbRxgRnK7J1ncCcakYaPCqieX3L4z1WsF668NnfkLm
 I+GN4xP8vylA6/GLqNPB3IUV2Mq7Mlv0y5tiz/O7ZA+98b2SwiA+cyYLHgvUIfWgpepe
 NOnY1Kbo4Ns4336GaHWpHw59P5I/sztUz5NwynHIdN2WkFI9faNO219FKwJqB01obM6A
 CCcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=b4rrpcdc4Lh4aTSwmuJ3m73tilR54GXwK7KQ0j+3pQs=;
 b=hZePBfgqhEST/JJXpBxZkKgVMECUnsO5K9WiNb7BrLLTBGjr6zj4wI7mp/uQjNJyRT
 QFJSehv9oCq0GOr1/6uoNviSN6ncS5E8qQ/a9IM9a6LXKqWjFh55IooEqasjmAi5lAmu
 L1iYcXDqm+blRM/vqMy5IBU2dWYMutDXl1sozOmFecq96zqAbxITRV8OHIgSpGB96AjJ
 TeT06gKy6ytUMNKKa8bkoRm4CxhuqBafPkYdi1yRQo4H28UCBX9w7wvytkFEXt9ajRT0
 eWWdBgoIz9kwliEmDLIuGhV2hWIEwfIoRpDi2SFKT3+D8+jbxJPtILtA5j0J/Tk4VeLd
 1zlw==
X-Gm-Message-State: AOAM532CmtaVoUZffXcxeWdkgsVsW2+rT0OLeSy8WdSK5MH4gvf/d43m
 bJ43gSzNaA4e4YyV8IntT8+8XQv4ohItMg==
X-Google-Smtp-Source: ABdhPJzin+DpIU+3kjyoali/PJpAIWxw05z72yENJYGqbIc8ESUf6NjuLzyFHHSJZ2dhf/w9+pOWeA==
X-Received: by 2002:a05:6a00:2b1:b0:44d:b18:8192 with SMTP id
 q17-20020a056a0002b100b0044d0b188192mr551208pfs.35.1634149361863; 
 Wed, 13 Oct 2021 11:22:41 -0700 (PDT)
Received: from localhost.localdomain ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id z2sm177140pfe.210.2021.10.13.11.22.40
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 13 Oct 2021 11:22:41 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 00/15] tcg patch queue
Date: Wed, 13 Oct 2021 11:22:24 -0700
Message-Id: <20211013182239.991127-1-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::533;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x533.google.com
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

The following changes since commit ee26ce674a93c824713542cec3b6a9ca85459165:

  Merge remote-tracking branch 'remotes/jsnow/tags/python-pull-request' into staging (2021-10-12 16:08:33 -0700)

are available in the Git repository at:

  https://gitlab.com/rth7680/qemu.git tags/pull-tcg-20211013

for you to fetch changes up to 76e366e728549b3324cc2dee6745d6a4f1af18e6:

  tcg: Canonicalize alignment flags in MemOp (2021-10-13 09:14:35 -0700)

----------------------------------------------------------------
Use MO_128 for 16-byte atomic memory operations.
Add cpu_ld/st_mmu memory primitives.
Move helper_ld/st memory helpers out of tcg.h.
Canonicalize alignment flags in MemOp.

----------------------------------------------------------------
BALATON Zoltan (1):
      memory: Log access direction for invalid accesses

Richard Henderson (14):
      target/arm: Use MO_128 for 16 byte atomics
      target/i386: Use MO_128 for 16 byte atomics
      target/ppc: Use MO_128 for 16 byte atomics
      target/s390x: Use MO_128 for 16 byte atomics
      target/hexagon: Implement cpu_mmu_index
      accel/tcg: Add cpu_{ld,st}*_mmu interfaces
      accel/tcg: Move cpu_atomic decls to exec/cpu_ldst.h
      target/mips: Use cpu_*_data_ra for msa load/store
      target/mips: Use 8-byte memory ops for msa load/store
      target/s390x: Use cpu_*_mmu instead of helper_*_mmu
      target/sparc: Use cpu_*_mmu instead of helper_*_mmu
      target/arm: Use cpu_*_mmu instead of helper_*_mmu
      tcg: Move helper_*_mmu decls to tcg/tcg-ldst.h
      tcg: Canonicalize alignment flags in MemOp

 docs/devel/loads-stores.rst   |  52 +++++-
 include/exec/cpu_ldst.h       | 332 ++++++++++++++++++-----------------
 include/tcg/tcg-ldst.h        |  74 ++++++++
 include/tcg/tcg.h             | 158 -----------------
 target/hexagon/cpu.h          |   9 +
 accel/tcg/cputlb.c            | 393 ++++++++++++++----------------------------
 accel/tcg/user-exec.c         | 385 +++++++++++++++++------------------------
 softmmu/memory.c              |  20 +--
 target/arm/helper-a64.c       |  61 ++-----
 target/arm/m_helper.c         |   6 +-
 target/i386/tcg/mem_helper.c  |   2 +-
 target/m68k/op_helper.c       |   1 -
 target/mips/tcg/msa_helper.c  | 389 ++++++++++-------------------------------
 target/ppc/mem_helper.c       |   1 -
 target/ppc/translate.c        |  12 +-
 target/s390x/tcg/mem_helper.c |  13 +-
 target/sparc/ldst_helper.c    |  14 +-
 tcg/tcg-op.c                  |   7 +-
 tcg/tcg.c                     |   1 +
 tcg/tci.c                     |   1 +
 accel/tcg/ldst_common.c.inc   | 307 +++++++++++++++++++++++++++++++++
 21 files changed, 1032 insertions(+), 1206 deletions(-)
 create mode 100644 include/tcg/tcg-ldst.h
 create mode 100644 accel/tcg/ldst_common.c.inc

