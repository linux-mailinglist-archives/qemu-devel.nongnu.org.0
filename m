Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6237239C114
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Jun 2021 22:14:02 +0200 (CEST)
Received: from localhost ([::1]:49970 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lpGCf-0008KS-DK
	for lists+qemu-devel@lfdr.de; Fri, 04 Jun 2021 16:14:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37790)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lpGAx-0005cd-Aq
 for qemu-devel@nongnu.org; Fri, 04 Jun 2021 16:12:15 -0400
Received: from mail-pf1-x42b.google.com ([2607:f8b0:4864:20::42b]:46674)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lpGAu-0005GZ-Ra
 for qemu-devel@nongnu.org; Fri, 04 Jun 2021 16:12:15 -0400
Received: by mail-pf1-x42b.google.com with SMTP id u126so4263261pfu.13
 for <qemu-devel@nongnu.org>; Fri, 04 Jun 2021 13:12:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=pC3rWilLTAroQ7ec9tbQ29ns7RjIEb44YZw0eU2F8AQ=;
 b=gMIuFB0RglgeGN6/e5+F16bWSIOGmRQiK3F2xgAXYqUEM1m0zYnwbWgl/jG2jRs4Do
 wVsBQackEkriqlHp1svHgOi7wKroi0XOzWIFA3nMAbmROgijQSNXNRpq/1is2ciQjlE5
 yvFU5RoPgHo8LarzsuSo8sHrQ2Jffy0B5Ex3nV2neR/YdDA5VvO1QTug0cNCXk9yJGib
 NqCuA7YofnTLWVFN/sCYuzyNj6A5KzBPv6L2HdqlioVbQaoOXAEFI7fqRz2omiqCy2JF
 aoe6uN1epL1YnukFCFntmxKDiG3bzfsypMLot5zQ5qHKdye2+NEdZOFjlnMYVWIhzHfK
 683g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=pC3rWilLTAroQ7ec9tbQ29ns7RjIEb44YZw0eU2F8AQ=;
 b=O9ZnSP3iTjtFx7dd3n4+WkXIsWupiRkiU8iRzuB4d7uDBUbVezKc3hvKNB5gd7A/Zf
 yDMbrCaiCAePNz/Zhxb2GdLYJTPGnJY7icU9tZn9+BHFYLA654NI4t95W8Bf20FaZo+2
 WLvrGsZ+VSzS1t63sQs8JDmTBXVOuuvYGsQ8n+OFz/j21n9dydwDrNy1ALxdedjnPkmq
 9eeOiTwR2BJ5N7gZ6GdKWjOW19LnOT/EGXIygy6ycdZSWKaynrpAmcMmcT7dqTUi6U3e
 1M831WQxBxHmS7wnFrMx8j/5nLKdJV6naNNUhNo7+lAYboRrHlgw37Zw62Tcv5ioY9r5
 Qe+A==
X-Gm-Message-State: AOAM531C795akiUH7UuEwgjMle+OrY4qdQSHAlhEkEDiRibEVXW2Nqzb
 G6+Jmvn7BqC3Sry3zyyiRLnED+p1DX7AXg==
X-Google-Smtp-Source: ABdhPJz80KIi25mXiD4lfdqczrFPiWQvyT+wzzwS04VSszrY+wuBrKXsMFwqfJ+WOpqVyybsVpUw+A==
X-Received: by 2002:a63:545a:: with SMTP id e26mr1987471pgm.282.1622837530966; 
 Fri, 04 Jun 2021 13:12:10 -0700 (PDT)
Received: from localhost.localdomain (174-21-70-228.tukw.qwest.net.
 [174.21.70.228])
 by smtp.gmail.com with ESMTPSA id a129sm2422599pfa.118.2021.06.04.13.12.10
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Jun 2021 13:12:10 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 00/15] tcg patch queue
Date: Fri,  4 Jun 2021 13:11:55 -0700
Message-Id: <20210604201210.920136-1-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
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

The following changes since commit 1cbd2d914939ee6028e9688d4ba859a528c28405:

  Merge remote-tracking branch 'remotes/jasowang/tags/net-pull-request' into staging (2021-06-04 13:38:49 +0100)

are available in the Git repository at:

  https://gitlab.com/rth7680/qemu.git tags/pull-tcg-20210604

for you to fetch changes up to 0006039e29b9e6118beab300146f7c4931f7a217:

  tcg/arm: Implement TCG_TARGET_HAS_rotv_vec (2021-06-04 11:50:11 -0700)

----------------------------------------------------------------
Host vector support for arm neon.

----------------------------------------------------------------
Richard Henderson (15):
      tcg: Change parameters for tcg_target_const_match
      tcg/arm: Add host vector framework
      tcg/arm: Implement tcg_out_ld/st for vector types
      tcg/arm: Implement tcg_out_mov for vector types
      tcg/arm: Implement tcg_out_dup*_vec
      tcg/arm: Implement minimal vector operations
      tcg/arm: Implement andc, orc, abs, neg, not vector operations
      tcg/arm: Implement TCG_TARGET_HAS_shi_vec
      tcg/arm: Implement TCG_TARGET_HAS_mul_vec
      tcg/arm: Implement TCG_TARGET_HAS_sat_vec
      tcg/arm: Implement TCG_TARGET_HAS_minmax_vec
      tcg/arm: Implement TCG_TARGET_HAS_bitsel_vec
      tcg/arm: Implement TCG_TARGET_HAS_shv_vec
      tcg/arm: Implement TCG_TARGET_HAS_roti_vec
      tcg/arm: Implement TCG_TARGET_HAS_rotv_vec

 tcg/arm/tcg-target-con-set.h |  10 +
 tcg/arm/tcg-target-con-str.h |   3 +
 tcg/arm/tcg-target.h         |  52 ++-
 tcg/arm/tcg-target.opc.h     |  16 +
 tcg/tcg.c                    |   5 +-
 tcg/aarch64/tcg-target.c.inc |   5 +-
 tcg/arm/tcg-target.c.inc     | 956 +++++++++++++++++++++++++++++++++++++++++--
 tcg/i386/tcg-target.c.inc    |   4 +-
 tcg/mips/tcg-target.c.inc    |   5 +-
 tcg/ppc/tcg-target.c.inc     |   4 +-
 tcg/riscv/tcg-target.c.inc   |   4 +-
 tcg/s390/tcg-target.c.inc    |   5 +-
 tcg/sparc/tcg-target.c.inc   |   5 +-
 tcg/tci/tcg-target.c.inc     |   6 +-
 14 files changed, 1001 insertions(+), 79 deletions(-)
 create mode 100644 tcg/arm/tcg-target.opc.h

