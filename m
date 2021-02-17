Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 31B5D31E334
	for <lists+qemu-devel@lfdr.de>; Thu, 18 Feb 2021 00:46:51 +0100 (CET)
Received: from localhost ([::1]:49572 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lCWWv-0005yO-UP
	for lists+qemu-devel@lfdr.de; Wed, 17 Feb 2021 18:46:49 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50668)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lCWRE-0008Nx-Pq
 for qemu-devel@nongnu.org; Wed, 17 Feb 2021 18:40:56 -0500
Received: from mail-pj1-x1033.google.com ([2607:f8b0:4864:20::1033]:51012)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lCWRC-0004eT-On
 for qemu-devel@nongnu.org; Wed, 17 Feb 2021 18:40:56 -0500
Received: by mail-pj1-x1033.google.com with SMTP id cl8so249558pjb.0
 for <qemu-devel@nongnu.org>; Wed, 17 Feb 2021 15:40:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=dDaFLG04fKZppE97at5lCyqt8weiRL0OebuqOGVUCiE=;
 b=OvOchk+JWy/S88KPT9Fqh8rmCYvV/QrRulm5sTiKU7R1vZPPniI73/Els63WyPFGtS
 HYeLVT6LdhaBZrQqQsyjz22dX3FsvVdG0kpNExnR7FaxDoQQIRNEI2GJ7iT8H8ezcshg
 VuZpZ+1nmwpfrQOg/905osUbb8RPf1O3HKnxmBkDrGbL25wcZzj8qY9cp4fz847EHZ2o
 hClC3nG1QF3jmcV0UyGSA6n0WdluJ1JRJzNl4afE57rgbSgTbGYt/ikMeVT8BI9bQWmU
 4ZQ1FP4rAdH1oKBPL5xpDVV22TfKMC+KwRWL0sSWS9FhPRfCc1GcQWW4o8JZEF5MIi4i
 xcCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=dDaFLG04fKZppE97at5lCyqt8weiRL0OebuqOGVUCiE=;
 b=pSVO04t33jsm0/FF1TFCjYBmlkpV2A1hMZXUXkCpVDURR6aEjS0jyNplriXOV93IRI
 zu56kilBXcowVYOhkM+72+Bp03+dxkTVZh0IpXhoXj8z8UIb9kKRf5jeOig1FncZ78ph
 oE69LfpQIxK9LA7Pp6rQogAHZxaZ4zwi1dUfihqiJ5fNiYGIbHJFhkZTksIjXCkaGGpK
 MsqOqJuoHUNSDM6Ia9QacD0lFZh4Qa56D9EH/+z2Ec3AqyuiuQZykHTEZrNwlPX3LS4B
 rArQ9DC13K5VsnVVXg3/3aFa93n79L7jZOUBbICveZCT0bIOjzOKlL0mjiEn/EClXEOV
 uU7g==
X-Gm-Message-State: AOAM533qS82Tep7TDvuR1wXmiVudIwqFUpsdCYdT7loLmSm0L2+CpI7O
 9gDgQHEzeWAmk8BWAZXIvylxX90qTz73tQ==
X-Google-Smtp-Source: ABdhPJywve46N470X3mzGYxl87kr65gb2KEiy/IaaTSTpsN4onrV8YouNO6Rt2lu8yR9tgCm0cSlvA==
X-Received: by 2002:a17:90b:e94:: with SMTP id
 fv20mr1156416pjb.207.1613605253370; 
 Wed, 17 Feb 2021 15:40:53 -0800 (PST)
Received: from localhost.localdomain (047-051-160-125.biz.spectrum.com.
 [47.51.160.125])
 by smtp.gmail.com with ESMTPSA id c21sm3950355pgh.0.2021.02.17.15.40.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 17 Feb 2021 15:40:52 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 12/35] Hexagon (target/hexagon) register fields
Date: Wed, 17 Feb 2021 15:40:00 -0800
Message-Id: <20210217234023.1742406-13-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210217234023.1742406-1-richard.henderson@linaro.org>
References: <20210217234023.1742406-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1033;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1033.google.com
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
Cc: peter.maydell@linaro.org, Taylor Simpson <tsimpson@quicinc.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Taylor Simpson <tsimpson@quicinc.com>

Declare bitfields within registers such as user status register (USR)

Signed-off-by: Taylor Simpson <tsimpson@quicinc.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <1612763186-18161-12-git-send-email-tsimpson@quicinc.com>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/hexagon/reg_fields.h         | 36 +++++++++++++++++++++++++
 target/hexagon/reg_fields_def.h.inc | 41 +++++++++++++++++++++++++++++
 target/hexagon/reg_fields.c         | 27 +++++++++++++++++++
 3 files changed, 104 insertions(+)
 create mode 100644 target/hexagon/reg_fields.h
 create mode 100644 target/hexagon/reg_fields_def.h.inc
 create mode 100644 target/hexagon/reg_fields.c

diff --git a/target/hexagon/reg_fields.h b/target/hexagon/reg_fields.h
new file mode 100644
index 0000000000..d3c86c942f
--- /dev/null
+++ b/target/hexagon/reg_fields.h
@@ -0,0 +1,36 @@
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
+#ifndef HEXAGON_REG_FIELDS_H
+#define HEXAGON_REG_FIELDS_H
+
+typedef struct {
+    int offset;
+    int width;
+} RegField;
+
+extern const RegField reg_field_info[];
+
+enum {
+#define DEF_REG_FIELD(TAG, START, WIDTH) \
+    TAG,
+#include "reg_fields_def.h.inc"
+    NUM_REG_FIELDS
+#undef DEF_REG_FIELD
+};
+
+#endif
diff --git a/target/hexagon/reg_fields_def.h.inc b/target/hexagon/reg_fields_def.h.inc
new file mode 100644
index 0000000000..f2a58d486c
--- /dev/null
+++ b/target/hexagon/reg_fields_def.h.inc
@@ -0,0 +1,41 @@
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
+/*
+ * For registers that have individual fields, explain them here
+ *   DEF_REG_FIELD(tag,
+ *                 bit start offset,
+ *                 width
+ */
+
+/* USR fields */
+DEF_REG_FIELD(USR_OVF,            0, 1)
+DEF_REG_FIELD(USR_FPINVF,         1, 1)
+DEF_REG_FIELD(USR_FPDBZF,         2, 1)
+DEF_REG_FIELD(USR_FPOVFF,         3, 1)
+DEF_REG_FIELD(USR_FPUNFF,         4, 1)
+DEF_REG_FIELD(USR_FPINPF,         5, 1)
+
+DEF_REG_FIELD(USR_LPCFG,          8, 2)
+
+DEF_REG_FIELD(USR_FPRND,         22, 2)
+
+DEF_REG_FIELD(USR_FPINVE,        25, 1)
+DEF_REG_FIELD(USR_FPDBZE,        26, 1)
+DEF_REG_FIELD(USR_FPOVFE,        27, 1)
+DEF_REG_FIELD(USR_FPUNFE,        28, 1)
+DEF_REG_FIELD(USR_FPINPE,        29, 1)
diff --git a/target/hexagon/reg_fields.c b/target/hexagon/reg_fields.c
new file mode 100644
index 0000000000..bdcab79428
--- /dev/null
+++ b/target/hexagon/reg_fields.c
@@ -0,0 +1,27 @@
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
+#include "qemu/osdep.h"
+#include "reg_fields.h"
+
+const RegField reg_field_info[] = {
+#define DEF_REG_FIELD(TAG, START, WIDTH)    \
+      { START, WIDTH },
+#include "reg_fields_def.h.inc"
+      { 0, 0 }
+#undef DEF_REG_FIELD
+};
-- 
2.25.1


