Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 964EC51BC7B
	for <lists+qemu-devel@lfdr.de>; Thu,  5 May 2022 11:49:54 +0200 (CEST)
Received: from localhost ([::1]:59644 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nmY7N-0007Vy-Hn
	for lists+qemu-devel@lfdr.de; Thu, 05 May 2022 05:49:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38430)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nmXWc-0004mf-R1
 for qemu-devel@nongnu.org; Thu, 05 May 2022 05:11:54 -0400
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432]:36795)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nmXWZ-00039a-S1
 for qemu-devel@nongnu.org; Thu, 05 May 2022 05:11:54 -0400
Received: by mail-wr1-x432.google.com with SMTP id u3so5241629wrg.3
 for <qemu-devel@nongnu.org>; Thu, 05 May 2022 02:11:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=YYZsNTkKcxKQaZCczUmEZTFEfw8mKce6egKgLBzskqM=;
 b=Lcn8iavmQB4bl7NmG6wOm7mHdO8YIPgwYfdkVjcqqUPQ9egu55fi048kr1Gky+SbU2
 4JorIzs+o5+O2cpW7udX0QaCHK33VQXQA2Fge8k5WadvF0GGu/fE+PeFqcv9XZzc6V82
 69H9BCrRWEPVxdtE6fH0UApBjxWQsrNugUFtkmTqe6z06DJKf19al/1aL5oAh4vzkKsf
 b4jpeg8oospOeUhr9u+z//F3CdLz+6A8Npi6EkqFntSXQ5eHFqWTUgaOO8rwClQvKc0I
 Veq4Ia5jeEiAPslKMXGH31sWPCmuIJjmR8zpuOrUKSmVVmaWUsSv+Qufi1ioD7paktog
 5mrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=YYZsNTkKcxKQaZCczUmEZTFEfw8mKce6egKgLBzskqM=;
 b=6XjHQoZNhAI6mObLoXdQsUyNKamxtXn6AUyfQahZoTSeefEQ84NsTmLrIRs0wuyiG5
 CHK6g2+PwaHuZskLnobsLF+EuPsIedUQNwuUPM1huP6YWPof1GlE/MB19N0jvFEfxaHy
 tjtB+EvE5nRUGMjbuDTE+alUMUQXPCzBJbf46W6E2msKaa6F0t9RI2rK55AFbFt7nuLD
 zcFnFtNwKspc5jiBNBeQfDwO0kGoX+rd3BvipzHi2iERf10o60ddqC5rAqjf3XMyyEgZ
 bVthTqgHIXT6ulrRzxZenmz6yvsePM0R3XQWZntsYqIsRKMs9tUNv48FeZsmg8z5y1IX
 YELw==
X-Gm-Message-State: AOAM533ECd8M4sFyPri2J3QYw0MSt/0cuGvuNCCujCXEsq59c3UMvLoS
 qRbXO4yCiGVzRHHXqwrvmgNyx276KqRVbg==
X-Google-Smtp-Source: ABdhPJzrIllvA7UAK1ApC675ccXVaf4pPmYs0sgV2ujwBIqtHkOwtR6pEXCAH9EZoOIQozIiMlrghQ==
X-Received: by 2002:adf:ed86:0:b0:20a:db50:1b1b with SMTP id
 c6-20020adfed86000000b0020adb501b1bmr20127131wro.506.1651741909806; 
 Thu, 05 May 2022 02:11:49 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 j14-20020adfe50e000000b0020c6a524fd5sm841612wrm.99.2022.05.05.02.11.49
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 May 2022 02:11:49 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 00/23] target-arm queue
Date: Thu,  5 May 2022 10:11:24 +0100
Message-Id: <20220505091147.2657652-1-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::432;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x432.google.com
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

Two small bugfixes, plus most of RTH's refactoring of cpregs
handling.

-- PMM

The following changes since commit 1fba9dc71a170b3a05b9d3272dd8ecfe7f26e215:

  Merge tag 'pull-request-2022-05-04' of https://gitlab.com/thuth/qemu into staging (2022-05-04 08:07:02 -0700)

are available in the Git repository at:

  https://git.linaro.org/people/pmaydell/qemu-arm.git tags/pull-target-arm-20220505

for you to fetch changes up to 99a50d1a67c602126fc2b3a4812d3000eba9bf34:

  target/arm: read access to performance counters from EL0 (2022-05-05 09:36:22 +0100)

----------------------------------------------------------------
target-arm queue:
 * Enable read access to performance counters from EL0
 * Enable SCTLR_EL1.BT0 for aarch64-linux-user
 * Refactoring of cpreg handling

----------------------------------------------------------------
Alex Zuepke (1):
      target/arm: read access to performance counters from EL0

Richard Henderson (22):
      target/arm: Enable SCTLR_EL1.BT0 for aarch64-linux-user
      target/arm: Split out cpregs.h
      target/arm: Reorg CPAccessResult and access_check_cp_reg
      target/arm: Replace sentinels with ARRAY_SIZE in cpregs.h
      target/arm: Make some more cpreg data static const
      target/arm: Reorg ARMCPRegInfo type field bits
      target/arm: Avoid bare abort() or assert(0)
      target/arm: Change cpreg access permissions to enum
      target/arm: Name CPState type
      target/arm: Name CPSecureState type
      target/arm: Drop always-true test in define_arm_vh_e2h_redirects_aliases
      target/arm: Store cpregs key in the hash table directly
      target/arm: Merge allocation of the cpreg and its name
      target/arm: Hoist computation of key in add_cpreg_to_hashtable
      target/arm: Consolidate cpreg updates in add_cpreg_to_hashtable
      target/arm: Use bool for is64 and ns in add_cpreg_to_hashtable
      target/arm: Hoist isbanked computation in add_cpreg_to_hashtable
      target/arm: Perform override check early in add_cpreg_to_hashtable
      target/arm: Reformat comments in add_cpreg_to_hashtable
      target/arm: Remove HOST_BIG_ENDIAN ifdef in add_cpreg_to_hashtable
      target/arm: Add isar predicates for FEAT_Debugv8p2
      target/arm: Add isar_feature_{aa64,any}_ras

 target/arm/cpregs.h               | 453 ++++++++++++++++++++++++++++++++++++++
 target/arm/cpu.h                  | 393 +++------------------------------
 hw/arm/pxa2xx.c                   |   2 +-
 hw/arm/pxa2xx_pic.c               |   2 +-
 hw/intc/arm_gicv3_cpuif.c         |   6 +-
 hw/intc/arm_gicv3_kvm.c           |   3 +-
 target/arm/cpu.c                  |  25 +--
 target/arm/cpu64.c                |   2 +-
 target/arm/cpu_tcg.c              |   5 +-
 target/arm/gdbstub.c              |   5 +-
 target/arm/helper.c               | 358 +++++++++++++-----------------
 target/arm/hvf/hvf.c              |   2 +-
 target/arm/kvm-stub.c             |   4 +-
 target/arm/kvm.c                  |   4 +-
 target/arm/machine.c              |   4 +-
 target/arm/op_helper.c            |  57 ++---
 target/arm/translate-a64.c        |  14 +-
 target/arm/translate-neon.c       |   2 +-
 target/arm/translate.c            |  13 +-
 tests/tcg/aarch64/bti-3.c         |  42 ++++
 tests/tcg/aarch64/Makefile.target |   6 +-
 21 files changed, 738 insertions(+), 664 deletions(-)
 create mode 100644 target/arm/cpregs.h
 create mode 100644 tests/tcg/aarch64/bti-3.c

