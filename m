Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 78ABF518E60
	for <lists+qemu-devel@lfdr.de>; Tue,  3 May 2022 22:11:53 +0200 (CEST)
Received: from localhost ([::1]:35244 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nlysC-0003Bi-G4
	for lists+qemu-devel@lfdr.de; Tue, 03 May 2022 16:11:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39114)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nlyW9-0001XX-CQ
 for qemu-devel@nongnu.org; Tue, 03 May 2022 15:49:05 -0400
Received: from mail-pj1-x102e.google.com ([2607:f8b0:4864:20::102e]:33898)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nlyW6-0003Vy-0i
 for qemu-devel@nongnu.org; Tue, 03 May 2022 15:49:05 -0400
Received: by mail-pj1-x102e.google.com with SMTP id
 qe3-20020a17090b4f8300b001dc24e4da73so2280378pjb.1
 for <qemu-devel@nongnu.org>; Tue, 03 May 2022 12:49:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=mB9/XCqnXEyOKhpBk6W2/uLe4X0aD05IrrxcgIYWBfg=;
 b=noZ8esmczgDpg05wd663WFFXffzdEMFM03mebaYYoO2B8ohfDLWdle9XrHCNzxNF60
 ZZtbyP/3hJ9BeskBpt5SvfmuguviJyXbwJOUfDftSNbKoA3Ewt/EL2RBoAjire9N9Zvq
 BbtCnBLeHIPOwYz4LvCF4nNlvV/cazD4xSb0WbSCldZn8k4iHkz9i4TktRnl+iG/+7Dc
 N6AwKogbVNIcbj5fO/oZCbe1PDcneRLliwyPjncE+vsNx0TDxFyvAqVcEfzVDhH5oWtc
 aFOH+SG82ArnghrIoF6Nqcsh7XB/rCgG4m2oJGEZZIKFJ7Gup00P/9dmODP27cnUKciK
 61kQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=mB9/XCqnXEyOKhpBk6W2/uLe4X0aD05IrrxcgIYWBfg=;
 b=SMawwPQFgGtYA6EYEeGBmc+4F8MTVnNcB6T+FV36Swv5NrzNVl8iQvqVqjPZ5IyhOG
 WNkyoQc3Bu3Ez9qNjA2zDagQpXS+RPwgXOnXaLFeCW+FHMTv8W2BoMcZIREYgHrNGQAe
 giqiouSb5yFjXtLzlwRuvqn5xhTJtAAV8HHgA1XP7Cwyf8IafsGgZnT6EdNjLf6eLqCl
 PAUSBtsoBx4i0TmZQDoxrClkri/yQ2dQ4wslA1f+nhqz0YYhBpjikvaP/3VSZr/lPQ9a
 +nbbMoGRMmgLOOwSy/LJt+m0ZP+I9nQtxlQlTIW+OYRrxQdXyuQ0H+d7QEDQ+y4kSY9y
 drbA==
X-Gm-Message-State: AOAM530T9tx6yNid3YHzFbLp+Y3YXh/rA5aO6D2rmd4PriU7oDNxVC8n
 a9OL8teIBnexiMC14X0uOPoSspERVsc6PQ==
X-Google-Smtp-Source: ABdhPJzu+aKeW8SYgCnoXotnYMq53toy2jxlxVI8LHCXiG1VLw652GFsDwu5iPavubvMG1L+nuQe2Q==
X-Received: by 2002:a17:902:f24c:b0:15c:b564:e4cc with SMTP id
 j12-20020a170902f24c00b0015cb564e4ccmr17935919plc.137.1651607341128; 
 Tue, 03 May 2022 12:49:01 -0700 (PDT)
Received: from stoup.. ([71.212.142.129]) by smtp.gmail.com with ESMTPSA id
 p11-20020a17090ad30b00b001cd4989fed3sm1712383pju.31.2022.05.03.12.48.59
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 May 2022 12:49:00 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 15/74] semihosting: Use struct gdb_stat in
 common_semi_flen_cb
Date: Tue,  3 May 2022 12:47:44 -0700
Message-Id: <20220503194843.1379101-16-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220503194843.1379101-1-richard.henderson@linaro.org>
References: <20220503194843.1379101-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102e.google.com
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

Use offsetof instead of an integer constant.
Load the entire 64-bit size while we're at it.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 semihosting/arm-compat-semi.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/semihosting/arm-compat-semi.c b/semihosting/arm-compat-semi.c
index a1fc4ea039..a6c6e5baf6 100644
--- a/semihosting/arm-compat-semi.c
+++ b/semihosting/arm-compat-semi.c
@@ -324,12 +324,12 @@ static target_ulong common_semi_flen_buf(CPUState *cs)
 static void
 common_semi_flen_cb(CPUState *cs, target_ulong ret, target_ulong err)
 {
-    /* The size is always stored in big-endian order, extract
-       the value. We assume the size always fit in 32 bits.  */
-    uint32_t size;
-    cpu_memory_rw_debug(cs, common_semi_flen_buf(cs) + 32,
-                        (uint8_t *)&size, 4, 0);
-    size = be32_to_cpu(size);
+    /* The size is always stored in big-endian order, extract the value. */
+    uint64_t size;
+    cpu_memory_rw_debug(cs, common_semi_flen_buf(cs) +
+                        offsetof(struct gdb_stat, gdb_st_size),
+                        &size, 8, 0);
+    size = be64_to_cpu(size);
     common_semi_cb(cs, -1, err);
     common_semi_set_ret(cs, size);
 }
-- 
2.34.1


