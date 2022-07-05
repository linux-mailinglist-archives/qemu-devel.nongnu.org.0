Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 69D925668F2
	for <lists+qemu-devel@lfdr.de>; Tue,  5 Jul 2022 13:13:04 +0200 (CEST)
Received: from localhost ([::1]:54150 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o8gUJ-00034v-H7
	for lists+qemu-devel@lfdr.de; Tue, 05 Jul 2022 07:13:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40174)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o8gHp-0006ps-Nr
 for qemu-devel@nongnu.org; Tue, 05 Jul 2022 07:00:09 -0400
Received: from mail-pg1-x52e.google.com ([2607:f8b0:4864:20::52e]:36388)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o8gHj-0000UF-Vq
 for qemu-devel@nongnu.org; Tue, 05 Jul 2022 07:00:09 -0400
Received: by mail-pg1-x52e.google.com with SMTP id s206so11091328pgs.3
 for <qemu-devel@nongnu.org>; Tue, 05 Jul 2022 04:00:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ijD/gkmOqDKVWYseqObh9bIQQFs7cUaZpUHPDTiEahU=;
 b=G0LCJrTn5E3/sPEpGjoBTse5IU9HPWfJIQczoN3K1n4gGMCmrxpGcnxAtLW7Y+csk/
 P4JAiN9BBUG3lIKUYbyemK6yQ3RU+EEePEptKQyMZ7Vnaq4Z5OcZ+i9G5e0hfd0TTD6l
 R1rzLI1CHXOiqh+7X24W8QsMmlA608S3tkK3nPr0dczjTxiMfj3ZLOugTa7XnTYPPn22
 hv959ilOB+hbFra1UPw++Twdt1KEZC+2VMowiR8OIqNvBYCQTJ0f7WAMBd7Lyj3nAdEs
 Rke836G2XhVGQ6TDDnQFM/zExfSYs/3p/kbPLZ8MP4aw2O/8UGHszeeeSHlENQ7PZI99
 3RUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ijD/gkmOqDKVWYseqObh9bIQQFs7cUaZpUHPDTiEahU=;
 b=xkthU4kfj/ryAlAMGQL4DcVJcuOl423Yq0V+E5Pp2dWrmc4wtvtKv0hmYjgP0chKca
 Oug8kw3pT1J6FZNXNqToianeDUiHJsgc367rQjtQLVdBJDsw4js88aOhTrYXDn412PbW
 Xly5uEIC9GJVHOmiM19TmUNzADXUkmsu1qVAbuQ9wwNICwN1SLm4BRAcgF6/l0RCRI5y
 T3+O3PJhClWTNvGfkOTfdvhp+McN/1enQZmRcuM1auZDKYBTyM/q1F/5q70gRNrZll4j
 WflFqa9zGzmZo3dmLMandh1jm00cEtBpT9dys0QYM6+vdUDpSdD4iYS896abUSzMtTX+
 Q/KA==
X-Gm-Message-State: AJIora8SnnFL15tBNeyzMXqzBFVzh9ygJYe3bd3IDzj62KwBV38BeaG4
 RB4VeHGkMaxIeZhm2yd579MfCEQ+wSUkirlu
X-Google-Smtp-Source: AGRyM1uJjtt298Z4SzzBxp5/HM6HMDWgp/1GXxzLYzAKuzVvSp/+qqFYjfeOecDIFo3f7lGktvg4kQ==
X-Received: by 2002:a63:af56:0:b0:40d:2430:8fa3 with SMTP id
 s22-20020a63af56000000b0040d24308fa3mr30048719pgo.376.1657018802156; 
 Tue, 05 Jul 2022 04:00:02 -0700 (PDT)
Received: from stoup.. ([122.255.60.245]) by smtp.gmail.com with ESMTPSA id
 d18-20020a170903231200b0016bf7981d0bsm508454plh.86.2022.07.05.04.00.00
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 05 Jul 2022 04:00:01 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 0/6] loongarch64 patch queue
Date: Tue,  5 Jul 2022 16:29:50 +0530
Message-Id: <20220705105957.1144514-1-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52e.google.com
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

The following changes since commit 1437479e5ee1a49ccd84cad9e7b010fb2ee9d805:

  Merge tag 'pull-la-20220704' of https://gitlab.com/rth7680/qemu into staging (2022-07-04 16:37:13 +0530)

are available in the Git repository at:

  https://gitlab.com/rth7680/qemu.git tags/pull-la-20220705

for you to fetch changes up to bf7ce37f8f40149dfa354bdb74810c8e586a11e4:

  hw/intc/loongarch_ipi: Fix mail send and any send function (2022-07-05 16:25:17 +0530)

----------------------------------------------------------------
Loongarch patch queue:

Build fix for --enable-debug --enable-tcg-interpreter.
Build fix for ls7a_rtc.
Clear tlb on reset.
Fixes for ipi mailboxes.
Minor tweak to scripts/qemu-binfmt-conf.

----------------------------------------------------------------
Richard Henderson (2):
      hw/rtc/ls7a_rtc: Drop unused inline functions
      tcg/tci: Remove CONFIG_DEBUG_TCG_INTERPRETER

Song Gao (2):
      target/loongarch: Clean up tlb when cpu reset
      scripts/qemu-binfmt-conf: Add LoongArch to qemu_get_family()

Xiaojuan Yang (2):
      hw/intc/loongarch_ipi: Fix ipi device access of 64bits
      hw/intc/loongarch_ipi: Fix mail send and any send function

 include/hw/intc/loongarch_ipi.h |  7 ++--
 tcg/tci/tcg-target.h            |  5 ---
 hw/intc/loongarch_ipi.c         | 92 +++++++++++++++++++++++++++--------------
 hw/loongarch/loongson3.c        |  5 ++-
 hw/rtc/ls7a_rtc.c               | 27 +++---------
 target/loongarch/cpu.c          |  1 +
 tcg/tci/tcg-target.c.inc        |  7 ----
 scripts/qemu-binfmt-conf.sh     |  3 ++
 8 files changed, 80 insertions(+), 67 deletions(-)

