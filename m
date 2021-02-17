Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EFA2031E336
	for <lists+qemu-devel@lfdr.de>; Thu, 18 Feb 2021 00:48:24 +0100 (CET)
Received: from localhost ([::1]:54620 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lCWYS-00087d-05
	for lists+qemu-devel@lfdr.de; Wed, 17 Feb 2021 18:48:24 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50606)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lCWR8-0008AF-Sn
 for qemu-devel@nongnu.org; Wed, 17 Feb 2021 18:40:50 -0500
Received: from mail-pg1-x536.google.com ([2607:f8b0:4864:20::536]:43521)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lCWR7-0004cb-1x
 for qemu-devel@nongnu.org; Wed, 17 Feb 2021 18:40:50 -0500
Received: by mail-pg1-x536.google.com with SMTP id n10so9499995pgl.10
 for <qemu-devel@nongnu.org>; Wed, 17 Feb 2021 15:40:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=EINIkezDIaTxIfm6JRFuokpw0tpVlajjKW14u+Tuwr4=;
 b=UL22G+uacbAQZiYrod/7HHWTsT22Ws2mjoKpLd07TptLmWHFkmU4gy7utxmVBLAUnG
 7J20Ut/bIYQzVL8GWsAPqqF+haFz9RMewl2N4ehaqmJtKNyr1jgmASit8BFTBCDIwQQC
 FAoiNv1nAjFLzvOhR1wOmJdqY6fjN/SxKXMuL6rGWz4o8FPF1qh140zFn2pN0TVyZOjj
 zmxHl6WHV45pUVjjYYBkFwQM4SWpkOvavFQQMXgJobj25wnJlklM158oeMWzGkDaz7Ex
 /zZJlwFIYI+RCgiuvN7k0IjvQOsKfqO9AoGjC+o8vDXshL/dWE/ucUjZV4pYxTYz6+3X
 crhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=EINIkezDIaTxIfm6JRFuokpw0tpVlajjKW14u+Tuwr4=;
 b=JygTV9ciJa8WyQWFtFUO02XX89kwTwt+FMYY74zLORaDUjHdREY7GgQ2N1R+B9c8g+
 kmDNPfGzQgl9qaWzyMr18SovtDzNNcmn2i+o1QWQASPtE9GUcIAjdDg0afG169ZYiE3J
 Tn5B4siVoEKSiZ9YrP5cAISqZe8zitgjSUF8ASKek/YDF428PKeJf0WLx5JIkoZ4rFbj
 TZnw8Zk8qLC9Gh6tuXyuNUpORAgwC8GmWcB83ARf3bxlR/+y84oj9vZqynfie9hHAuGQ
 +oIZsFR0TCjPVJO9i2QJuG6WV6JXykeAtetSZf/gdqEgsTowlVUCgqrLDnn743Pjp0/N
 2+zQ==
X-Gm-Message-State: AOAM533nrdl7PgEzACNyCp/P9Q/k50W909B0oIZsgKv/JkVdeUpQ1rkY
 rFVkEvPthMbEqpzkSm50tRyE2Sw4j2VH7g==
X-Google-Smtp-Source: ABdhPJydeU8YMk3Qu7Kk4wuaQCoKMVUWrsLqVKWZ/eGqoEEFDpPyiaEPJaI201sB41f4UCDlBKMOTw==
X-Received: by 2002:a05:6a00:15cc:b029:1ba:5282:3ab8 with SMTP id
 o12-20020a056a0015ccb02901ba52823ab8mr1515610pfu.77.1613605241572; 
 Wed, 17 Feb 2021 15:40:41 -0800 (PST)
Received: from localhost.localdomain (047-051-160-125.biz.spectrum.com.
 [47.51.160.125])
 by smtp.gmail.com with ESMTPSA id c21sm3950355pgh.0.2021.02.17.15.40.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 17 Feb 2021 15:40:41 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 07/35] Hexagon (target/hexagon) register names
Date: Wed, 17 Feb 2021 15:39:55 -0800
Message-Id: <20210217234023.1742406-8-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210217234023.1742406-1-richard.henderson@linaro.org>
References: <20210217234023.1742406-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::536;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x536.google.com
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
Cc: peter.maydell@linaro.org, Taylor Simpson <tsimpson@quicinc.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Taylor Simpson <tsimpson@quicinc.com>

Signed-off-by: Taylor Simpson <tsimpson@quicinc.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Message-Id: <1612763186-18161-7-git-send-email-tsimpson@quicinc.com>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/hexagon/hex_regs.h | 83 +++++++++++++++++++++++++++++++++++++++
 1 file changed, 83 insertions(+)
 create mode 100644 target/hexagon/hex_regs.h

diff --git a/target/hexagon/hex_regs.h b/target/hexagon/hex_regs.h
new file mode 100644
index 0000000000..f291911eef
--- /dev/null
+++ b/target/hexagon/hex_regs.h
@@ -0,0 +1,83 @@
+/*
+ *  Copyright(c) 2019-2021 Qualcomm Innovation Center, Inc. All Rights Reserved.
+ *
+ *  This program is free software; you can redistribute it and/or modify
+ *  it under the terms of the GNU General Public License as published by
+ *  the Free Software Foundation; either version 2 of the License, or
+ *  (at your option) any later version.
+ *
+ *  This program is distributed in the hope that it will be useful,
+ *  but WITHOUT ANY WARRANTY; without even the implied warranty of
+ *  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+ *  GNU General Public License for more details.
+ *
+ *  You should have received a copy of the GNU General Public License
+ *  along with this program; if not, see <http://www.gnu.org/licenses/>.
+ */
+
+#ifndef HEXAGON_REGS_H
+#define HEXAGON_REGS_H
+
+enum {
+    HEX_REG_R00              = 0,
+    HEX_REG_R01              = 1,
+    HEX_REG_R02              = 2,
+    HEX_REG_R03              = 3,
+    HEX_REG_R04              = 4,
+    HEX_REG_R05              = 5,
+    HEX_REG_R06              = 6,
+    HEX_REG_R07              = 7,
+    HEX_REG_R08              = 8,
+    HEX_REG_R09              = 9,
+    HEX_REG_R10              = 10,
+    HEX_REG_R11              = 11,
+    HEX_REG_R12              = 12,
+    HEX_REG_R13              = 13,
+    HEX_REG_R14              = 14,
+    HEX_REG_R15              = 15,
+    HEX_REG_R16              = 16,
+    HEX_REG_R17              = 17,
+    HEX_REG_R18              = 18,
+    HEX_REG_R19              = 19,
+    HEX_REG_R20              = 20,
+    HEX_REG_R21              = 21,
+    HEX_REG_R22              = 22,
+    HEX_REG_R23              = 23,
+    HEX_REG_R24              = 24,
+    HEX_REG_R25              = 25,
+    HEX_REG_R26              = 26,
+    HEX_REG_R27              = 27,
+    HEX_REG_R28              = 28,
+    HEX_REG_R29              = 29,
+    HEX_REG_SP               = 29,
+    HEX_REG_FP               = 30,
+    HEX_REG_R30              = 30,
+    HEX_REG_LR               = 31,
+    HEX_REG_R31              = 31,
+    HEX_REG_SA0              = 32,
+    HEX_REG_LC0              = 33,
+    HEX_REG_SA1              = 34,
+    HEX_REG_LC1              = 35,
+    HEX_REG_P3_0             = 36,
+    HEX_REG_M0               = 38,
+    HEX_REG_M1               = 39,
+    HEX_REG_USR              = 40,
+    HEX_REG_PC               = 41,
+    HEX_REG_UGP              = 42,
+    HEX_REG_GP               = 43,
+    HEX_REG_CS0              = 44,
+    HEX_REG_CS1              = 45,
+    HEX_REG_UPCYCLELO        = 46,
+    HEX_REG_UPCYCLEHI        = 47,
+    HEX_REG_FRAMELIMIT       = 48,
+    HEX_REG_FRAMEKEY         = 49,
+    HEX_REG_PKTCNTLO         = 50,
+    HEX_REG_PKTCNTHI         = 51,
+    /* Use reserved control registers for qemu execution counts */
+    HEX_REG_QEMU_PKT_CNT      = 52,
+    HEX_REG_QEMU_INSN_CNT     = 53,
+    HEX_REG_UTIMERLO          = 62,
+    HEX_REG_UTIMERHI          = 63,
+};
+
+#endif
-- 
2.25.1


