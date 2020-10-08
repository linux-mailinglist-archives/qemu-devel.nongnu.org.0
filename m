Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E36CE2874A5
	for <lists+qemu-devel@lfdr.de>; Thu,  8 Oct 2020 14:59:53 +0200 (CEST)
Received: from localhost ([::1]:44788 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kQVWS-00052v-M6
	for lists+qemu-devel@lfdr.de; Thu, 08 Oct 2020 08:59:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45240)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kQVTm-0003R9-UZ
 for qemu-devel@nongnu.org; Thu, 08 Oct 2020 08:57:06 -0400
Received: from mail-ot1-x336.google.com ([2607:f8b0:4864:20::336]:36073)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kQVTk-0001wR-IA
 for qemu-devel@nongnu.org; Thu, 08 Oct 2020 08:57:06 -0400
Received: by mail-ot1-x336.google.com with SMTP id 60so5384108otw.3
 for <qemu-devel@nongnu.org>; Thu, 08 Oct 2020 05:57:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=mPIyfTm041fTvU3FUvByVd+GgdIdYXOlVkaF050SeRQ=;
 b=LyCKhUK+MEI20OsEtd8GP+HLX47qwexhjbROdWCqxoAfUQyVr9MqlO2vrzct9gw6ZO
 Y2gQT22yMEaFwjb0MOK5blbXAadT2tps1gRNOapA6/XjFjJlsQJe7w7FrzD9myp+D1Wc
 iqCP2UW8cM9ofAAaL6WnWVOgw8iLJnwSLWx3bpctPATR87NMCYK/8lFB4a/s1g7N0fEN
 vfor+MMTYvRILEU/Hfxbn5qK1vNIGRlY5hAWQm8buBENwuztiJT3RQRb1+cUiJeK+T3Y
 nMgjPM4Rj542Mt/iYVWZ36PUvNbQ2Y2Xu1TpnwsHHUK7ux58J/oRIQlh4mU7uJvE+h4k
 5qJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=mPIyfTm041fTvU3FUvByVd+GgdIdYXOlVkaF050SeRQ=;
 b=GlemayijJP6MlRuGWfkOTVsG8Y/qHXuIOeQm99cSyTVHq1sLSx5FvV6Ztd5/l5FUyO
 HhWvkItQceGX78jbvR6XR84+EPhpaR1hPcNagvWopZ3ittBZaTPeFtIiAwYXL2LuRIRa
 ASVlO/8ph7nRyC+WYxrOyZYJRgs09Eh6rgdNJzn7uuAvntDP0WRYp/hqEwKDarG3OMbW
 b7lyAgKnUYKR3ns0kPtPc73SVX1N0YSzBWHF6QFUfbZdeD6oSODFG2evuqQ5aFycqyU1
 qRAeG2ka/1raSyi7C5rYodcsDSNbKBXl8fMD3kvxHLP5GKq3t2dniymEqsYWRBCkA2vV
 8wPw==
X-Gm-Message-State: AOAM532lEt6EDGafeGe7Zzt6JUljrlrpBhnGamgy80fGSm3eIYhpUIt0
 rJ4I5V8lBgGBAg9iXQk1+SHmFX2d8ZYeg/7h
X-Google-Smtp-Source: ABdhPJyPfLvuDx6AG0ovz4tx/JDHEs4MJEPzeWPXlMX3fnYwAgbOjCANjXf2z8lcaeaEuVSwJjZzkw==
X-Received: by 2002:a9d:4b10:: with SMTP id q16mr4961618otf.274.1602161822621; 
 Thu, 08 Oct 2020 05:57:02 -0700 (PDT)
Received: from localhost.localdomain (168.189-204-159.bestelclientes.com.mx.
 [189.204.159.168])
 by smtp.gmail.com with ESMTPSA id w64sm4701933oig.31.2020.10.08.05.57.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 08 Oct 2020 05:57:01 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 00/11] tcg patch queue
Date: Thu,  8 Oct 2020 07:56:48 -0500
Message-Id: <20201008125659.49857-1-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::336;
 envelope-from=richard.henderson@linaro.org; helo=mail-ot1-x336.google.com
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

The following changes since commit 6eeea6725a70e6fcb5abba0764496bdab07ddfb3:

  Merge remote-tracking branch 'remotes/huth-gitlab/tags/pull-request-2020-10-06' into staging (2020-10-06 21:13:34 +0100)

are available in the Git repository at:

  https://github.com/rth7680/qemu.git tags/pull-tcg-20201008

for you to fetch changes up to 62475e9d007d83db4d0a6ccebcda8914f392e9c9:

  accel/tcg: Fix computing of is_write for MIPS (2020-10-08 05:57:32 -0500)

----------------------------------------------------------------
Extend maximum gvec vector size
Fix i386 avx2 dupi
Fix mips host user-only write detection
Misc cleanups.

----------------------------------------------------------------
Kele Huang (1):
      accel/tcg: Fix computing of is_write for MIPS

Richard Henderson (10):
      tcg: Adjust simd_desc size encoding
      tcg: Drop union from TCGArgConstraint
      tcg: Move sorted_args into TCGArgConstraint.sort_index
      tcg: Remove TCG_CT_REG
      tcg: Move some TCG_CT_* bits to TCGArgConstraint bitfields
      tcg: Remove TCGOpDef.used
      tcg/i386: Fix dupi for avx2 32-bit hosts
      tcg: Fix generation of dupi_vec for 32-bit host
      tcg/optimize: Fold dup2_vec
      tcg: Remove TCG_TARGET_HAS_cmp_vec

 include/tcg/tcg-gvec-desc.h  | 38 ++++++++++++------
 include/tcg/tcg.h            | 22 ++++------
 tcg/aarch64/tcg-target.h     |  1 -
 tcg/i386/tcg-target.h        |  1 -
 tcg/ppc/tcg-target.h         |  1 -
 accel/tcg/user-exec.c        | 43 ++++++++++++++++++--
 tcg/optimize.c               | 15 +++++++
 tcg/tcg-op-gvec.c            | 35 ++++++++++++----
 tcg/tcg-op-vec.c             | 12 ++++--
 tcg/tcg.c                    | 96 +++++++++++++++++++-------------------------
 tcg/aarch64/tcg-target.c.inc | 17 ++++----
 tcg/arm/tcg-target.c.inc     | 29 ++++++-------
 tcg/i386/tcg-target.c.inc    | 39 +++++++-----------
 tcg/mips/tcg-target.c.inc    | 21 +++++-----
 tcg/ppc/tcg-target.c.inc     | 29 ++++++-------
 tcg/riscv/tcg-target.c.inc   | 16 ++++----
 tcg/s390/tcg-target.c.inc    | 22 +++++-----
 tcg/sparc/tcg-target.c.inc   | 21 ++++------
 tcg/tci/tcg-target.c.inc     |  3 +-
 19 files changed, 244 insertions(+), 217 deletions(-)

