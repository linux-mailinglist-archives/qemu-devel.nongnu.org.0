Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 11CBB362B07
	for <lists+qemu-devel@lfdr.de>; Sat, 17 Apr 2021 00:21:56 +0200 (CEST)
Received: from localhost ([::1]:48138 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lXWqZ-0001H4-51
	for lists+qemu-devel@lfdr.de; Fri, 16 Apr 2021 18:21:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45658)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lXVdw-0006q4-Jp
 for qemu-devel@nongnu.org; Fri, 16 Apr 2021 17:04:48 -0400
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631]:38888)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lXVdb-0001pk-Nt
 for qemu-devel@nongnu.org; Fri, 16 Apr 2021 17:04:48 -0400
Received: by mail-pl1-x631.google.com with SMTP id o16so1028419plg.5
 for <qemu-devel@nongnu.org>; Fri, 16 Apr 2021 14:04:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=8Vthia0uCLhbBTsJ1gqUumg4ccjBueHeraGUzoP/hUo=;
 b=mPN6yWUbNavADuJXATWt8nvOEpoCFjFSe56nvdRqQMCUZs8HtfXsi2B9j9qjL5qBVo
 770Y/9yYZwTH+4mP8dAUbg2aWF63UxA1F7K+nzJfX8tF6ELw5kMnHe5KHTfOuRrRUlHd
 jWxCCyrBZ0EoI3zYk+ksBykYVQsrWmJF72Ur5JiJ1lHrFradv0AQGineOWlr7RE6KgeK
 z1OJodYCfloC3mmaQ95YU8AkwJrwNIgdLPI2ZCCikSgeRWUwqDrxnugGvwvECpiooNO9
 o9a3RVyldTq83H1uHYPJ9DfehsuKDDrSX5wfAuc2ClEs834NsUkvA8bUfeGreLE2tnDR
 2Mng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=8Vthia0uCLhbBTsJ1gqUumg4ccjBueHeraGUzoP/hUo=;
 b=Zz4T1CIYarML8HzfU1pRxqPFQ9x7iTvHPzhrVNqmsioQsct1LRtFOKl55936OpZLvs
 W84Gh4aAFBBtcdbUN0SY+f84S8LexSNNdPnHVdOFvyiyfKoF6lr66I0iE20ONaWC2vWM
 TkUTWkSR9bCVDfd8jJ/WyQ+1Ek4o806sWa2oFFeE/VaNYPqnoEPiASTW/IfRho2QlnFK
 1RTgXbUt21O5ubFHzBUS6PIoyABWfHObfbRr/Dqp/KMLL+Pl/+R/8rGy7yOPxIsv2Way
 aG960ufSl5uUb8A0EmOB5HOKn9UU14sTVrlsNwmEvyKmDMAu8moW+T4fgxvN603ZTAs4
 3ztw==
X-Gm-Message-State: AOAM5313V3VxoDgoXyT5Ltn9FZg8VKy2nhlfVytdxOXwe+Ai5/LuhAdS
 G31zwvr/+uSMej1aZP7AhkLRHT0ce1GBfg==
X-Google-Smtp-Source: ABdhPJzu7OsBHRgMpF2dRkY/p81ydCk3EuLmcYvPzAsaT8bPVDbM10iDafLid+TDnqsNEVeaVbTszA==
X-Received: by 2002:a17:90a:fb89:: with SMTP id
 cp9mr11363346pjb.47.1618607066445; 
 Fri, 16 Apr 2021 14:04:26 -0700 (PDT)
Received: from localhost.localdomain ([71.212.131.83])
 by smtp.gmail.com with ESMTPSA id m9sm5766734pgt.65.2021.04.16.14.04.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 16 Apr 2021 14:04:26 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 76/81] target/arm: Remove unused fpst from VDOT_scalar
Date: Fri, 16 Apr 2021 14:02:35 -0700
Message-Id: <20210416210240.1591291-77-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210416210240.1591291-1-richard.henderson@linaro.org>
References: <20210416210240.1591291-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::631;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x631.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

Cut and paste error from another pattern.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/translate-neon.c.inc | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/target/arm/translate-neon.c.inc b/target/arm/translate-neon.c.inc
index 6385d13a7e..c1fbe21ae6 100644
--- a/target/arm/translate-neon.c.inc
+++ b/target/arm/translate-neon.c.inc
@@ -316,7 +316,6 @@ static bool trans_VDOT_scalar(DisasContext *s, arg_VDOT_scalar *a)
 {
     gen_helper_gvec_4 *fn_gvec;
     int opr_sz;
-    TCGv_ptr fpst;
 
     if (!dc_isar_feature(aa32_dp, s)) {
         return false;
@@ -338,13 +337,11 @@ static bool trans_VDOT_scalar(DisasContext *s, arg_VDOT_scalar *a)
 
     fn_gvec = a->u ? gen_helper_gvec_udot_idx_b : gen_helper_gvec_sdot_idx_b;
     opr_sz = (1 + a->q) * 8;
-    fpst = fpstatus_ptr(FPST_STD);
     tcg_gen_gvec_4_ool(vfp_reg_offset(1, a->vd),
                        vfp_reg_offset(1, a->vn),
                        vfp_reg_offset(1, a->rm),
                        vfp_reg_offset(1, a->vd),
                        opr_sz, opr_sz, a->index, fn_gvec);
-    tcg_temp_free_ptr(fpst);
     return true;
 }
 
-- 
2.25.1


