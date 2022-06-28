Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CD6D55BF29
	for <lists+qemu-devel@lfdr.de>; Tue, 28 Jun 2022 09:36:16 +0200 (CEST)
Received: from localhost ([::1]:37588 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o65lf-0007w3-GU
	for lists+qemu-devel@lfdr.de; Tue, 28 Jun 2022 03:36:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43362)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o63Fd-0003G8-4r
 for qemu-devel@nongnu.org; Tue, 28 Jun 2022 00:55:03 -0400
Received: from mail-pj1-x102a.google.com ([2607:f8b0:4864:20::102a]:53002)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o63FZ-0008Is-SX
 for qemu-devel@nongnu.org; Tue, 28 Jun 2022 00:54:59 -0400
Received: by mail-pj1-x102a.google.com with SMTP id g7so6378232pjj.2
 for <qemu-devel@nongnu.org>; Mon, 27 Jun 2022 21:54:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=+SUmfyQ28nnP+FCpGEWeUk9jn7QL0Ax1+bQ0aHyUN6Q=;
 b=zpGw/8zCcCCsYwIGhp8OeQD6dM2dXFiG1oNAMKh/bMmyAp7tfZvezrs+eaRHfvV/c4
 m/m6JrQdpawQnGZe9/zM+kAOwqh8Bq4RL6PTuOpvw9xzYRhBIaBX9+7kfNIQoHKTiwm/
 /zHVtUQUX+cuBp1ooh1XEs6BTbPtg53YW4UsIkQaPPKaYysF33cqVdwNKna/7yyGNIWM
 dM4GUSFFrlCt9Ioi27df3MPimbj/pKJf82Z478Vpd8CXBn569mpRgSza3kAQWVpalmD7
 VG9+bq5ovnUwEY9RoFcxkBUtKc2q90/3Fs5BO9E02tlTLGg5de8Wp2ie5p17Td2P5nRw
 LM0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=+SUmfyQ28nnP+FCpGEWeUk9jn7QL0Ax1+bQ0aHyUN6Q=;
 b=5RjA/qlJMbQaHNAWovf3uUnLdFvjaA6ZflAC5dZvAsxJQRL4nmVgqDUNwI5jjWv37N
 t9RTkgI57Lu67HyMGtTGm6nh4w7TooNi5RButRPvhaTdintkZz16R2n9yiwGa/9kwT7v
 IwEav1g2KvMkRh9gRBbuJfMvhOFVW+2aTeB+l8pRItn36lpj0O+8U8o58oWEEiK5TPnX
 BTQ89oXw6sy0s/qIETu04OIXrjC+uoOMtBtwpCIlO1wThsQz4XNc1AzENZ4MbUAsvvQL
 6TIdlJONwTYyPiND+GylMWsg8sx2vEwNUwx5mlEqjTTRdEJ1hB5UklqGqRGgfZoe/e9M
 w6tQ==
X-Gm-Message-State: AJIora+u7XWWuiYfRkJmJ5P4WIdfspfhQMCSaP5ork/RXBrxd/qIxVZI
 KYqiUTn4Xsr2VnF8DQMarAilrxNB7OIQ2A==
X-Google-Smtp-Source: AGRyM1sm3hk5DwcH/eN0kXiuz6Dh1lIHE1ukrpI4S8TjQeev8U4El9wRS9jo1i47Vr/8/XsmdmVmjA==
X-Received: by 2002:a17:90a:8413:b0:1ea:ebf4:7079 with SMTP id
 j19-20020a17090a841300b001eaebf47079mr20506313pjn.48.1656392095753; 
 Mon, 27 Jun 2022 21:54:55 -0700 (PDT)
Received: from stoup.. ([122.255.60.245]) by smtp.gmail.com with ESMTPSA id
 w8-20020a1709026f0800b00168c523032fsm8073735plk.269.2022.06.27.21.54.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Jun 2022 21:54:55 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>
Subject: [PULL 20/60] semihosting: Use struct gdb_stat in common_semi_flen_cb
Date: Tue, 28 Jun 2022 10:23:23 +0530
Message-Id: <20220628045403.508716-21-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220628045403.508716-1-richard.henderson@linaro.org>
References: <20220628045403.508716-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102a.google.com
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

Load the entire 64-bit size value.  While we're at it,
use offsetof instead of an integer constant.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 semihosting/arm-compat-semi.c | 14 ++++++--------
 1 file changed, 6 insertions(+), 8 deletions(-)

diff --git a/semihosting/arm-compat-semi.c b/semihosting/arm-compat-semi.c
index abf543ce91..a9e488886a 100644
--- a/semihosting/arm-compat-semi.c
+++ b/semihosting/arm-compat-semi.c
@@ -325,14 +325,12 @@ static void
 common_semi_flen_cb(CPUState *cs, target_ulong ret, target_ulong err)
 {
     if (!err) {
-        /*
-         * The size is always stored in big-endian order, extract
-         * the value. We assume the size always fit in 32 bits.
-         */
-        uint32_t size;
-        cpu_memory_rw_debug(cs, common_semi_flen_buf(cs) + 32,
-                            (uint8_t *)&size, 4, 0);
-        ret = be32_to_cpu(size);
+        /* The size is always stored in big-endian order, extract the value. */
+        uint64_t size;
+        cpu_memory_rw_debug(cs, common_semi_flen_buf(cs) +
+                            offsetof(struct gdb_stat, gdb_st_size),
+                            &size, 8, 0);
+        ret = be64_to_cpu(size);
     }
     common_semi_cb(cs, ret, err);
 }
-- 
2.34.1


