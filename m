Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 707174CB0A7
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Mar 2022 22:07:55 +0100 (CET)
Received: from localhost ([::1]:37778 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nPWCQ-0002de-HH
	for lists+qemu-devel@lfdr.de; Wed, 02 Mar 2022 16:07:54 -0500
Received: from eggs.gnu.org ([209.51.188.92]:43368)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nPVxj-0005hh-4x
 for qemu-devel@nongnu.org; Wed, 02 Mar 2022 15:52:43 -0500
Received: from [2a00:1450:4864:20::32b] (port=35554
 helo=mail-wm1-x32b.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nPVxh-00087d-D5
 for qemu-devel@nongnu.org; Wed, 02 Mar 2022 15:52:42 -0500
Received: by mail-wm1-x32b.google.com with SMTP id
 v2-20020a7bcb42000000b0037b9d960079so4166458wmj.0
 for <qemu-devel@nongnu.org>; Wed, 02 Mar 2022 12:52:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=s10c62MdHMg8Tzahwc512pg4LIfqMdV8NVXBcsfmMks=;
 b=D3Gv86Fjq1C6Jdb34hEtiEMS2kbsl+5iqv/CEdhtl9bJ0uz/r+rp8hFjL3uiiQ7MwL
 +uGR66F40Zu3pbNJY35ngDeN8rNsmTxFKvEwuH6v4aU95F7+KPBFkYWWyTGP/BiBz+4i
 xKwO2c9WQqulnOufwq0MK+of73PhOTbNcoYcfiyTsw/84M6g4P/w5FXtw7edveZCtZKz
 5TelJ9FnWhA4AEOuQrbuH1Eu/dEKF9PoPWDpbud/FchkS1Lr5WoIhwdYxH/19wG18Nww
 Po57s2uQO7JQ91NVzcWnJRwD2/2xRzsKNUPz12J0jDu+KTj/DB8y17Oa2Z+MwkXMSbxA
 0R0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=s10c62MdHMg8Tzahwc512pg4LIfqMdV8NVXBcsfmMks=;
 b=WYpw7ErUW8qoswdLMqW+4D1k8bTA/QvIHbr5eBV/+ZFz6432zqoPgiNwXA1ozekvWk
 peZrS/qo+BHssYHDRWYQDt+hoC2ZHU0zq8ilDpYU+z/BWcR2wAHkv3lAv/lKjOlYo1Fu
 vm4Xu5qZiyFIxsnrMkrpqiHoAXRlxvqzC8l6L4yLWqwFmgNWzIeWbSHcpiFnyj9NIRyT
 rZbkSytC+OueyvbAWd6/jSLK3TdVNrCKFGqCxDGF+e+XOLeRpaWIs1uPskz+HNNhKHnZ
 SlPiFBkUSb4L2GmMSx/2dWCheLDB0FhW3xX+tnB22N7Tck+Sl1HdDtgPN4eekukaq33K
 FgwA==
X-Gm-Message-State: AOAM532pdhYq9WdK+po2DpxhHd6UJpeqERP91TIhpYnOFepoR/vexvcO
 7fkzM17S1ALTHPR3/L7BY2TkcGDibfKLnw==
X-Google-Smtp-Source: ABdhPJxVyu8On82TNZnSJ3giJaxJ3UqbYr9z1cOjArFqTKCdYa7uo8EfosfOgT4sBpDrAimt1Fwnjg==
X-Received: by 2002:a7b:c114:0:b0:381:f7ee:e263 with SMTP id
 w20-20020a7bc114000000b00381f7eee263mr1361811wmi.30.1646254360095; 
 Wed, 02 Mar 2022 12:52:40 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 x13-20020adfec0d000000b001e31279cc38sm90801wrn.11.2022.03.02.12.52.39
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Mar 2022 12:52:39 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 08/26] hw/registerfields: Add FIELD_SEX<N> and FIELD_SDP<N>
Date: Wed,  2 Mar 2022 20:52:12 +0000
Message-Id: <20220302205230.2122390-9-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220302205230.2122390-1-peter.maydell@linaro.org>
References: <20220302205230.2122390-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::32b
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::32b;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32b.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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

From: Richard Henderson <richard.henderson@linaro.org>

Add new macros to manipulate signed fields within the register.

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Message-id: 20220301215958.157011-2-richard.henderson@linaro.org
Suggested-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 include/hw/registerfields.h | 48 ++++++++++++++++++++++++++++++++++++-
 1 file changed, 47 insertions(+), 1 deletion(-)

diff --git a/include/hw/registerfields.h b/include/hw/registerfields.h
index f2a3c9c41f7..3a88e135d02 100644
--- a/include/hw/registerfields.h
+++ b/include/hw/registerfields.h
@@ -59,6 +59,19 @@
     extract64((storage), R_ ## reg ## _ ## field ## _SHIFT,               \
               R_ ## reg ## _ ## field ## _LENGTH)
 
+#define FIELD_SEX8(storage, reg, field)                                   \
+    sextract8((storage), R_ ## reg ## _ ## field ## _SHIFT,               \
+              R_ ## reg ## _ ## field ## _LENGTH)
+#define FIELD_SEX16(storage, reg, field)                                  \
+    sextract16((storage), R_ ## reg ## _ ## field ## _SHIFT,              \
+               R_ ## reg ## _ ## field ## _LENGTH)
+#define FIELD_SEX32(storage, reg, field)                                  \
+    sextract32((storage), R_ ## reg ## _ ## field ## _SHIFT,              \
+               R_ ## reg ## _ ## field ## _LENGTH)
+#define FIELD_SEX64(storage, reg, field)                                  \
+    sextract64((storage), R_ ## reg ## _ ## field ## _SHIFT,              \
+               R_ ## reg ## _ ## field ## _LENGTH)
+
 /* Extract a field from an array of registers */
 #define ARRAY_FIELD_EX32(regs, reg, field)                                \
     FIELD_EX32((regs)[R_ ## reg], reg, field)
@@ -95,7 +108,40 @@
     _d; })
 #define FIELD_DP64(storage, reg, field, val) ({                           \
     struct {                                                              \
-        uint64_t v:R_ ## reg ## _ ## field ## _LENGTH;                \
+        uint64_t v:R_ ## reg ## _ ## field ## _LENGTH;                    \
+    } _v = { .v = val };                                                  \
+    uint64_t _d;                                                          \
+    _d = deposit64((storage), R_ ## reg ## _ ## field ## _SHIFT,          \
+                  R_ ## reg ## _ ## field ## _LENGTH, _v.v);              \
+    _d; })
+
+#define FIELD_SDP8(storage, reg, field, val) ({                           \
+    struct {                                                              \
+        signed int v:R_ ## reg ## _ ## field ## _LENGTH;                  \
+    } _v = { .v = val };                                                  \
+    uint8_t _d;                                                           \
+    _d = deposit32((storage), R_ ## reg ## _ ## field ## _SHIFT,          \
+                  R_ ## reg ## _ ## field ## _LENGTH, _v.v);              \
+    _d; })
+#define FIELD_SDP16(storage, reg, field, val) ({                          \
+    struct {                                                              \
+        signed int v:R_ ## reg ## _ ## field ## _LENGTH;                  \
+    } _v = { .v = val };                                                  \
+    uint16_t _d;                                                          \
+    _d = deposit32((storage), R_ ## reg ## _ ## field ## _SHIFT,          \
+                  R_ ## reg ## _ ## field ## _LENGTH, _v.v);              \
+    _d; })
+#define FIELD_SDP32(storage, reg, field, val) ({                          \
+    struct {                                                              \
+        signed int v:R_ ## reg ## _ ## field ## _LENGTH;                  \
+    } _v = { .v = val };                                                  \
+    uint32_t _d;                                                          \
+    _d = deposit32((storage), R_ ## reg ## _ ## field ## _SHIFT,          \
+                  R_ ## reg ## _ ## field ## _LENGTH, _v.v);              \
+    _d; })
+#define FIELD_SDP64(storage, reg, field, val) ({                          \
+    struct {                                                              \
+        int64_t v:R_ ## reg ## _ ## field ## _LENGTH;                     \
     } _v = { .v = val };                                                  \
     uint64_t _d;                                                          \
     _d = deposit64((storage), R_ ## reg ## _ ## field ## _SHIFT,          \
-- 
2.25.1


