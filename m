Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C4A026055D
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Sep 2020 22:05:23 +0200 (CEST)
Received: from localhost ([::1]:36980 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kFNOE-0004hG-Ck
	for lists+qemu-devel@lfdr.de; Mon, 07 Sep 2020 16:05:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33468)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kFNNL-00045L-T2
 for qemu-devel@nongnu.org; Mon, 07 Sep 2020 16:04:27 -0400
Received: from mail-pj1-x1036.google.com ([2607:f8b0:4864:20::1036]:36949)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kFNNI-0008Iy-TK
 for qemu-devel@nongnu.org; Mon, 07 Sep 2020 16:04:27 -0400
Received: by mail-pj1-x1036.google.com with SMTP id kk9so4505682pjb.2
 for <qemu-devel@nongnu.org>; Mon, 07 Sep 2020 13:04:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Jn1qrCa1Sl8t2XzEGEp7dgjjOnVkAw0OBaar5PPud8s=;
 b=yYBGBHe5Ne1mmGPRLR2871WSud1qlZg6othxoiSJxi1hYiZnlUSiz3EKJxHdeQZKIM
 nWOvHyD6EZYQAuF1MG7F9ROdTbogPLYfcIw1ZWZw0lPe6U79G1b2a3irySM5Gx/IhZD3
 mPTlvXCnKcmBkcUoMO/LsIRLBm2r9qIsCCgwlJYliT9h72HxGD3CkuZe10MkCqVRV3pu
 VIq0uZE7oS3Hl6dyLSO25KoavKQu5x7Z6WuNBhWc1LshH1iBCeIibxs5eYbWmxgSg6RZ
 DMr7pttJB6tPrfxkj3ZD8xFmZW6JeKEYaV1PnLCj+2GCyim4L6bVpmE+gT5a1aye4ZHl
 GuIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Jn1qrCa1Sl8t2XzEGEp7dgjjOnVkAw0OBaar5PPud8s=;
 b=bx3uUDEYuxQJ8jW2KmduOtObxlTmAaysvTmkJD7wNWpKUK9vrCDnM/LSO3a30nOxI3
 +F+JGAhGbcCDPEkxUYGuJQnM9ffSjXwjBRTghVqumK4mx6cn/H++YWOMdrf3gaWoGkdu
 i/gMiqYGE35SPdWr/y3UwSr22udsYyod5TF/Xpwxs3cfqWRIDOyfvGDB5BxPjTKUYO3Q
 ix9wCkX1eNuoFwo9M5IwjY81uFk1bLAH+CJGhmXQcW9pLdbIMH/xrG9+Y6GOpU+FKSg1
 ylykgPh6lXp4B0Z8JU7M7MYTDt83NdF6g3O/yzXpsUU0ZioyPW+1eR5Mi7KaubHw8Wv8
 ykPg==
X-Gm-Message-State: AOAM530Hp8vyEx3OVxCyzUDNYotUNrtPe8moV+NA3jP5iTGDSq/TVjIL
 kgUsBtsf+lfWSGrrxQA3J3/SQk8G2lj7UQ==
X-Google-Smtp-Source: ABdhPJzIK8/szxdskISwwHK0qkoQbr17pMM8mpB8QM1KQzhOjJQ+5ZrZurRHD909YafBtzQKt+rj7A==
X-Received: by 2002:a17:90a:880e:: with SMTP id
 s14mr788243pjn.140.1599509062887; 
 Mon, 07 Sep 2020 13:04:22 -0700 (PDT)
Received: from localhost.localdomain ([71.212.141.89])
 by smtp.gmail.com with ESMTPSA id j26sm7521297pfa.160.2020.09.07.13.04.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Sep 2020 13:04:22 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL v2 00/18] target/microblaze patch queue
Date: Mon,  7 Sep 2020 13:04:21 -0700
Message-Id: <20200907200421.186121-1-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1036;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1036.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
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

Doing the PR on request from Edgar.

Version 1 conflicted with a PR from thuth;
patch 1 has already been merged.


r~


The following changes since commit e11bd71f89649da3cff439c030d2ccac0cc914e3:

  Merge remote-tracking branch 'remotes/huth-gitlab/tags/pull-request-2020-09-07' into staging (2020-09-07 16:51:00 +0100)

are available in the Git repository at:

  https://github.com/rth7680/qemu.git tags/pull-mb-20200907-2

for you to fetch changes up to 7df61837df419740963f020d7ee7b852f6401301:

  configure: Do not set TARGET_ABI32 for microblaze (2020-09-07 12:58:08 -0700)

----------------------------------------------------------------
Use lookup_and_goto_tb.
Cleanup and fill in VMStateDescription.

----------------------------------------------------------------
Richard Henderson (18):
      target/microblaze: Renumber D_FLAG
      target/microblaze: Cleanup mb_cpu_do_interrupt
      target/microblaze: Rename mmu structs
      target/microblaze: Rename DISAS_UPDATE to DISAS_EXIT
      target/microblaze: Introduce DISAS_EXIT_NEXT, DISAS_EXIT_JUMP
      target/microblaze: Replace cpustate_changed with DISAS_EXIT_NEXT
      target/microblaze: Handle DISAS_EXIT_NEXT in delay slot
      target/microblaze: Force rtid, rted, rtbd to exit
      target/microblaze: Use tcg_gen_lookup_and_goto_ptr
      target/microblaze: Diagnose invalid insns in delay slots
      target/microblaze: Split out MicroBlazeCPUConfig
      target/microblaze: Reorg MicroBlazeCPUConfig to minimize holes
      target/microblaze: Move pvr regs to MicroBlazeCPUConfig
      target/microblaze: Treat pvr_regs as constant
      target/microblaze: Move mmu parameters to MicroBlazeCPUConfig
      target/microblaze: Fill in VMStateDescription for cpu
      target/microblaze: Put MicroBlazeCPUConfig into DisasContext
      configure: Do not set TARGET_ABI32 for microblaze

 configure                           |   1 -
 target/microblaze/cpu.h             |  78 +++++++------
 target/microblaze/mmu.h             |  20 +---
 hw/microblaze/petalogix_ml605_mmu.c |   6 +-
 target/microblaze/cpu.c             | 109 +++++++++---------
 target/microblaze/gdbstub.c         |   6 +-
 target/microblaze/helper.c          | 217 ++++++++++++++++--------------------
 target/microblaze/machine.c         | 106 ++++++++++++++++++
 target/microblaze/mmu.c             |  39 ++++---
 target/microblaze/op_helper.c       |   2 +-
 target/microblaze/translate.c       | 194 +++++++++++++++++++++-----------
 target/microblaze/meson.build       |   5 +-
 12 files changed, 463 insertions(+), 320 deletions(-)
 create mode 100644 target/microblaze/machine.c

