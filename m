Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 89847355A96
	for <lists+qemu-devel@lfdr.de>; Tue,  6 Apr 2021 19:42:32 +0200 (CEST)
Received: from localhost ([::1]:47984 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lTpih-0003Lx-Gt
	for lists+qemu-devel@lfdr.de; Tue, 06 Apr 2021 13:42:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45626)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lTpgr-0001Yl-LK
 for qemu-devel@nongnu.org; Tue, 06 Apr 2021 13:40:37 -0400
Received: from mail-pf1-x435.google.com ([2607:f8b0:4864:20::435]:36429)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lTpgo-0006HZ-Vk
 for qemu-devel@nongnu.org; Tue, 06 Apr 2021 13:40:37 -0400
Received: by mail-pf1-x435.google.com with SMTP id g15so10965142pfq.3
 for <qemu-devel@nongnu.org>; Tue, 06 Apr 2021 10:40:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=sKk73qUHSFNSDZq2+y4JQIWdiK15wkPN1fPW2vJPnP0=;
 b=HsQVOWdwW1HuzpU7ldowYPinKfP+e6RBzG8OIcrmL0TJ9er3r/AAxGGC1aXRnJWOxu
 NU7BucZj7d3KQOxw0IJqZ2uGhE1G2coYTKcuRxoGE2rfrZGrhscS1Z87NFozqyOCB7E4
 m/IbIM232ltno2dESrRdJ4DV9s36zvzpf4n0i3M8yVdTeZw38tQDMd31I9yZ9h1mXdCp
 XAOpuznHkR0fQ+OuUMA/WpPj1gR1f5GiV0aWcdEI49CQBbMjMQGCQZa+buyNY7sx7L0S
 odvMmTI5dtrEspiLfg2JSicH4ENcdNngWNj8H5q7awrwGR8kmlj1VLflDZXItVkpNx1x
 s05Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=sKk73qUHSFNSDZq2+y4JQIWdiK15wkPN1fPW2vJPnP0=;
 b=f+kwFAyRTDfQFq8UbtBp2YvlJvtKTRY1VJQYA9tAZSKor9k329i16tCuP0WUfFJ2qW
 WXxaWJShi6LW1ijC7DEvwf27r7k4gS3b4SNKZeOGL9eFAEwa27czRAyk0xbNeZkApWf6
 IBUvu5RGe9oOP2JFfjClNDEEY5x8fdeBgO4igycOaCQZGFIeBOs+TjwgB+6IKQ+zzheL
 MmPogIbtHSth4/WRr6DKEEsbGeOtEKYizOWmmelquOdn6aXY2hn07cBinzr3lKjNEwK+
 FTeiM33A75k0Vihkxh0z5S0iXR3UJLOmYRRja+ajiAs8Ly6yOq1CxUTXhmyWEpYEpXAt
 vIwg==
X-Gm-Message-State: AOAM530tL1Cs/fCH+ZnK6KKFcXaaCmUQEonuqTfqccT0CrjfjU8T+5XR
 VP/Zx7varJeMwBNMZ7a0nmP1vRsdgjTlAg==
X-Google-Smtp-Source: ABdhPJz7FvQHw9dAT2yk7kutg3/vRUbEaR79gGos1UWNJNiwBrpXCruRWwb6J+ZZO1JeEpiVbpNlCg==
X-Received: by 2002:a63:c90c:: with SMTP id o12mr28539223pgg.210.1617730833352; 
 Tue, 06 Apr 2021 10:40:33 -0700 (PDT)
Received: from localhost.localdomain ([71.212.131.83])
 by smtp.gmail.com with ESMTPSA id h15sm19148056pfo.20.2021.04.06.10.40.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 06 Apr 2021 10:40:32 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 00/12] target/arm mte fixes
Date: Tue,  6 Apr 2021 10:40:19 -0700
Message-Id: <20210406174031.64299-1-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::435;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x435.google.com
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
Cc: qemu-arm@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Changes for v4:
  * Fix tag count computation error in mte_checkN, which when used
    by mte_check1 in patch 5, caused all sorts of KASAN failures.
  * Fix PAGE_ANON / PAGE_TARGET_1 overlap.


r~


Richard Henderson (12):
  accel/tcg: Preserve PAGE_ANON when changing page permissions
  target/arm: Check PAGE_WRITE_ORG for MTE writeability
  target/arm: Fix mte_checkN
  target/arm: Split out mte_probe_int
  target/arm: Fix unaligned checks for mte_check1, mte_probe1
  test/tcg/aarch64: Add mte-5
  target/arm: Replace MTEDESC ESIZE+TSIZE with SIZEM1
  target/arm: Merge mte_check1, mte_checkN
  target/arm: Rename mte_probe1 to mte_probe
  target/arm: Simplify sve mte checking
  target/arm: Remove log2_esize parameter to gen_mte_checkN
  exec: Fix overlap of PAGE_ANON and PAGE_TARGET_1

 include/exec/cpu-all.h            |   4 +-
 target/arm/helper-a64.h           |   3 +-
 target/arm/internals.h            |  11 +-
 target/arm/translate-a64.h        |   2 +-
 tests/tcg/aarch64/mte.h           |   3 +-
 accel/tcg/translate-all.c         |   9 +-
 target/arm/mte_helper.c           | 185 ++++++++++++------------------
 target/arm/sve_helper.c           | 100 ++++++----------
 target/arm/translate-a64.c        |  22 ++--
 target/arm/translate-sve.c        |   9 +-
 tests/tcg/aarch64/mte-5.c         |  44 +++++++
 tests/tcg/aarch64/mte-6.c         |  43 +++++++
 tests/tcg/aarch64/Makefile.target |   2 +-
 13 files changed, 227 insertions(+), 210 deletions(-)
 create mode 100644 tests/tcg/aarch64/mte-5.c
 create mode 100644 tests/tcg/aarch64/mte-6.c

-- 
2.25.1


