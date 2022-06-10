Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FE8F545B90
	for <lists+qemu-devel@lfdr.de>; Fri, 10 Jun 2022 07:20:25 +0200 (CEST)
Received: from localhost ([::1]:58444 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nzX4K-0006vZ-AI
	for lists+qemu-devel@lfdr.de; Fri, 10 Jun 2022 01:20:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39930)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1nzWxx-0003Lw-RV
 for qemu-devel@nongnu.org; Fri, 10 Jun 2022 01:13:50 -0400
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a]:42887)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1nzWxv-0007bZ-Dm
 for qemu-devel@nongnu.org; Fri, 10 Jun 2022 01:13:49 -0400
Received: by mail-pl1-x62a.google.com with SMTP id f8so2881540plo.9
 for <qemu-devel@nongnu.org>; Thu, 09 Jun 2022 22:13:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=2p8l64Jlaec7udx1XYJ9DFcPbvulXsTX1OpQh2oSmd8=;
 b=kgkU1Innt4ang0oOs+QLfmvaMmiSrLPa5AGFYBqY119YQ2e7Z1TjzFYhHhwO23Drmi
 x5CQrUZ4c+u5MFblcqv96LgDH+CRgElMGt950rINFPCwo1zvv3qMok6K/vRcraDuG3Ri
 ek0WoJqVszmMkV2gTlAD//wQwLq4r9tIQvfKyjjEqYxRAjLpnTaoWmfbVH2DGiO+EZvV
 v54W9vzK19Wttnm2F505uV5rV/O0wn4Towwtls4+14bMc0FC+4CCN2kkKFYROxX0JmMK
 K5bAkO+4ylfGnRywxEFww0SDDG4Jim3wCKU8TOOjEBTo2zuKOMAuGjfUOYBhxz0D+MEQ
 TJ6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=2p8l64Jlaec7udx1XYJ9DFcPbvulXsTX1OpQh2oSmd8=;
 b=WWBsLeGKW3w2lvVpUfFNRKXyOkObOXWW9YlD1IdEFscIrnjyt53JncFfi06f2MXkUo
 WKSessgrAADj9T2KBzMGpfQ9t9QHPW6Cpvc9X1X2Tx90RMr1/WOT1F4fVMcJ66WV+10A
 07qQ9eQHABLIxaff1keMKlv7Uao5+vwguaewcfCglitYvC1VwFGNh26u+VIPfzqisa0E
 JooZglsCe440j04jhK+cMjJ2L2xOwSAWMlmMNlYELsn556UM5Q+3XR6ou0PIJ2EdxKD5
 Cjf0NcVSCEEDpbgbcaj5GwVsVToRagCBk7ddk7i+wDg8MF6n3FoNjxJD9sr47VyGWR/k
 EMzQ==
X-Gm-Message-State: AOAM532PfWwuwFdjILLpQkFLUgq0Mf6KU0RxeRgUnkRzpKNlWMLq2vyi
 igiUfyAvI31G6tAINKTrm+OpC9U2mMkJ9A==
X-Google-Smtp-Source: ABdhPJy+4cSqPZbIh54m+UbdBrsFbDPviY3tXkHvpx7lObb8/JUZiXkBb8vmrYHoNbcv3Sd1jWYlkQ==
X-Received: by 2002:a17:90b:1b07:b0:1e8:41d8:fa2 with SMTP id
 nu7-20020a17090b1b0700b001e841d80fa2mr6924164pjb.204.1654838025942; 
 Thu, 09 Jun 2022 22:13:45 -0700 (PDT)
Received: from hsinchu16.internal.sifive.com
 (59-124-168-89.hinet-ip.hinet.net. [59.124.168.89])
 by smtp.gmail.com with ESMTPSA id
 i13-20020a170902c94d00b0016362da9a03sm17853534pla.245.2022.06.09.22.13.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Jun 2022 22:13:45 -0700 (PDT)
From: frank.chang@sifive.com
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, Frank Chang <frank.chang@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>
Subject: [PATCH 4/9] target/riscv: debug: Restrict the range of tselect value
 can be written
Date: Fri, 10 Jun 2022 13:13:21 +0800
Message-Id: <20220610051328.7078-5-frank.chang@sifive.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220610051328.7078-1-frank.chang@sifive.com>
References: <20220610051328.7078-1-frank.chang@sifive.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62a;
 envelope-from=frank.chang@sifive.com; helo=mail-pl1-x62a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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

From: Frank Chang <frank.chang@sifive.com>

The value of tselect CSR can be written should be limited within the
range of supported triggers number.

Signed-off-by: Frank Chang <frank.chang@sifive.com>
---
 target/riscv/debug.c | 9 +++------
 1 file changed, 3 insertions(+), 6 deletions(-)

diff --git a/target/riscv/debug.c b/target/riscv/debug.c
index 6913682f75..296192ffc4 100644
--- a/target/riscv/debug.c
+++ b/target/riscv/debug.c
@@ -126,10 +126,6 @@ bool tdata_available(CPURISCVState *env, int tdata_index)
         return false;
     }
 
-    if (unlikely(env->trigger_cur >= RV_MAX_TRIGGERS)) {
-        return false;
-    }
-
     return tdata_mapping[trigger_type][tdata_index];
 }
 
@@ -140,8 +136,9 @@ target_ulong tselect_csr_read(CPURISCVState *env)
 
 void tselect_csr_write(CPURISCVState *env, target_ulong val)
 {
-    /* all target_ulong bits of tselect are implemented */
-    env->trigger_cur = val;
+    if (val < RV_MAX_TRIGGERS) {
+        env->trigger_cur = val;
+    }
 }
 
 static target_ulong tdata1_validate(CPURISCVState *env, target_ulong val,
-- 
2.36.1


