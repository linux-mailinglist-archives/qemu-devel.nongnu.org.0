Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C4BEF25B1CC
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Sep 2020 18:37:37 +0200 (CEST)
Received: from localhost ([::1]:58128 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kDVlQ-0001nd-Qn
	for lists+qemu-devel@lfdr.de; Wed, 02 Sep 2020 12:37:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38606)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kDVjy-00009G-Q6
 for qemu-devel@nongnu.org; Wed, 02 Sep 2020 12:36:06 -0400
Received: from mail-pf1-x442.google.com ([2607:f8b0:4864:20::442]:43653)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kDVjw-000565-IR
 for qemu-devel@nongnu.org; Wed, 02 Sep 2020 12:36:06 -0400
Received: by mail-pf1-x442.google.com with SMTP id f18so3129962pfa.10
 for <qemu-devel@nongnu.org>; Wed, 02 Sep 2020 09:36:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=0p9Kc3SzrY4RgWL3FI+V/3f1wJ4me01PZ3ocxVKK0Vg=;
 b=TEx1ORBKOWvRgpL2eWUYuwj3EC3qmU3gS3EqnyQX032BnKWlYSrEVzTvwmo1zUNRCt
 4yTxsXlBkMObFySx9SmW+TkWH37CXam6P0MKtZJ4Q53IG/FmdMAvFNSuCThQUHoTOgCi
 4pwldTl9QhvGElIkJmzYVerKcnSZyP2DdyFbSYW6GaJ90jM3dqzEYP+wwY7HD8N80Rlp
 Mg5rU7xqApyV9DvILANLRr28QUxvA1qMhrkIyNA/75wPsxAT8rK03vyNsctJbzJn/e9n
 VVN5CD6t3J5QarLeJ+nj9SVWD7fMoP/94vb/rFGs0eymwG73cBRpsdjDVYTYF5CBzfNr
 EQ4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=0p9Kc3SzrY4RgWL3FI+V/3f1wJ4me01PZ3ocxVKK0Vg=;
 b=WzrM1fRkgpIzHKVDT7dY51ra3tcPwGqBI+banYF7kQsO9pYkqTP+B7+1XQIvz4Mv2O
 kzQ7yUEoKWbm6hIPuKw0fR+0cdtOWfN6UTjX4wSypVgEw721H8fq5OE/hTXmdKwzw4Jf
 MOkkShliCFaG/PS17OecfLMgdOywuZX/Tv37yh+aEGKv1JgrJ7caQAgtEeiPW050sCKF
 sorMaQ5HZgtFmbqA9oFXW1FyxervBXCfnwSh4yq3ZZ9f8OHLIwzQggIJ8+6LhWEupq8B
 k4EhnkWrt72GHyEnwN5jS0u39QxRpkjAmwXFF+wij6bjDL3PWKUr8ZzbE85X1zOyQhlc
 PcIA==
X-Gm-Message-State: AOAM5331Ld2NS5KIrhy0N/MWIS6fPgR+oOxwhooN0BHQKJ6PYa5nCkDz
 WllpMRuDcWNp/2YzXUKA52l/PO2Jx3Wclw==
X-Google-Smtp-Source: ABdhPJxLvCLYKH0AmjAAkKAIvkhzXKDSsZ6TC3p4i9u6bq1sMqn70RaXktGr/9rdmGXaqH4daPbOfw==
X-Received: by 2002:a63:cd0b:: with SMTP id i11mr2519116pgg.306.1599064561351; 
 Wed, 02 Sep 2020 09:36:01 -0700 (PDT)
Received: from localhost.localdomain ([71.212.141.89])
 by smtp.gmail.com with ESMTPSA id b6sm4955441pjz.33.2020.09.02.09.36.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Sep 2020 09:36:00 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 0/7] target/microblaze improvements
Date: Wed,  2 Sep 2020 09:35:52 -0700
Message-Id: <20200902163559.1077728-1-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::442;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x442.google.com
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
Cc: edgar.iglesias@xilinx.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The goto_ptr patches, which have been reviewed, and one more
patch to diagnose invalid insns in delay slots.


r~


Richard Henderson (7):
  target/microblaze: Rename DISAS_UPDATE to DISAS_EXIT
  target/microblaze: Introduce DISAS_EXIT_NEXT, DISAS_EXIT_JUMP
  target/microblaze: Replace cpustate_changed with DISAS_EXIT_NEXT
  target/microblaze: Handle DISAS_EXIT_NEXT in delay slot
  target/microblaze: Force rtid, rted, rtbd to exit
  target/microblaze: Use tcg_gen_lookup_and_goto_ptr
  target/microblaze: Diagnose invalid insns in delay slots

 target/microblaze/translate.c | 161 ++++++++++++++++++++++++----------
 1 file changed, 115 insertions(+), 46 deletions(-)

-- 
2.25.1


