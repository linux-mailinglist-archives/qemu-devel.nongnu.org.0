Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 86CD831E337
	for <lists+qemu-devel@lfdr.de>; Thu, 18 Feb 2021 00:48:26 +0100 (CET)
Received: from localhost ([::1]:54808 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lCWYT-0008Cl-IV
	for lists+qemu-devel@lfdr.de; Wed, 17 Feb 2021 18:48:25 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50644)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lCWRB-0008HF-MW
 for qemu-devel@nongnu.org; Wed, 17 Feb 2021 18:40:53 -0500
Received: from mail-pf1-x42a.google.com ([2607:f8b0:4864:20::42a]:42136)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lCWR9-0004dQ-5c
 for qemu-devel@nongnu.org; Wed, 17 Feb 2021 18:40:53 -0500
Received: by mail-pf1-x42a.google.com with SMTP id w18so23604pfu.9
 for <qemu-devel@nongnu.org>; Wed, 17 Feb 2021 15:40:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=syEff87HhmL4pp5l8qJFx/wNBs45tn+PDuAIuUBTe6o=;
 b=wVf25JmoVmwPwxn2dbzD53J63oqAeHHh1HjMCoM2wOTomO5v9e0npCxFvtGqbet/vg
 8FepejFrfpD6rSajKOCDchLI56yQTZlnqIHJkb435N4inXclmlYSm1qqvCqyl0AVW+7M
 ZfE8drTY93SVQJQwAzgwMltNrxpWSnXKl6pr/3zy59fnUUUUsFnbtUQYUhArtPyGuqeJ
 V3PUxO59KlQbFboVD7+oy+m0dFi/cabngjdSHvRIW9GxbXKL4uqkHosnPhruFhK8+nfU
 0j2Oc1HayuBU22L5VgGvvZjR50coJMwOjsFUmchufSWz6Ycw1QAqBy3K1nNjOVSaYZWF
 qrgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=syEff87HhmL4pp5l8qJFx/wNBs45tn+PDuAIuUBTe6o=;
 b=oMzw2j9gUaBOdB/nNMDSdyJ3onS+9jkgoqvMLu2XfftMPjAfGtNPn24x5bDGAdtM+T
 R1hV8ze+i6u3TigfKDeoiE9hkFCxw3WMoW3D21XQeJtarV22/MON7V4fRiTgqd68lLSj
 FHzuUwXu83mRmjttNS1hUu7D6yw1OZ1MXi7NxJ8gUl7cUzCPSNSKQWmq8z+g6156dlnO
 yqeKFEcdleVFNLsi1wwEWlPiRX9+hQjA4PmS98Sgono2hyhRf/+LjlMav4qJSvZVM0gX
 Yf588prCGu8/lV95d5vzNNdIsd1SbLYqemfHKPTzMd2RQtoR2Ky3EY7cphjAb5rJefm8
 RR1w==
X-Gm-Message-State: AOAM532cDxG8tLRiIwzF6D3hbgZKLh3pr9bzjITaJdTLamP5bKvy6Pjh
 x3/vaauxnC75QszOEtqiybHW25jXDSluEQ==
X-Google-Smtp-Source: ABdhPJwddW8bv1DNnWmUoXt8nkHFwKa+QSE//yf0s0tmMWkVE7IAqvTh9x8N6TsSIW2TM6b8FgY4SA==
X-Received: by 2002:a62:bd05:0:b029:1ab:6d2:5edf with SMTP id
 a5-20020a62bd050000b02901ab06d25edfmr1467574pff.32.1613605249782; 
 Wed, 17 Feb 2021 15:40:49 -0800 (PST)
Received: from localhost.localdomain (047-051-160-125.biz.spectrum.com.
 [47.51.160.125])
 by smtp.gmail.com with ESMTPSA id c21sm3950355pgh.0.2021.02.17.15.40.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 17 Feb 2021 15:40:49 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 10/35] Hexagon (target/hexagon) architecture types
Date: Wed, 17 Feb 2021 15:39:58 -0800
Message-Id: <20210217234023.1742406-11-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210217234023.1742406-1-richard.henderson@linaro.org>
References: <20210217234023.1742406-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42a.google.com
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

Define types used in files imported from the Hexagon architecture library

Signed-off-by: Taylor Simpson <tsimpson@quicinc.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Message-Id: <1612763186-18161-10-git-send-email-tsimpson@quicinc.com>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/hexagon/hex_arch_types.h | 38 +++++++++++++++++++++++++++++++++
 1 file changed, 38 insertions(+)
 create mode 100644 target/hexagon/hex_arch_types.h

diff --git a/target/hexagon/hex_arch_types.h b/target/hexagon/hex_arch_types.h
new file mode 100644
index 0000000000..d721e1f934
--- /dev/null
+++ b/target/hexagon/hex_arch_types.h
@@ -0,0 +1,38 @@
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
+#ifndef HEXAGON_ARCH_TYPES_H
+#define HEXAGON_ARCH_TYPES_H
+
+#include "qemu/osdep.h"
+#include "qemu/int128.h"
+
+/*
+ * These types are used by the code imported from the Hexagon
+ * architecture library.
+ */
+typedef uint8_t     size1u_t;
+typedef int8_t      size1s_t;
+typedef uint16_t    size2u_t;
+typedef int16_t     size2s_t;
+typedef uint32_t    size4u_t;
+typedef int32_t     size4s_t;
+typedef uint64_t    size8u_t;
+typedef int64_t     size8s_t;
+typedef Int128      size16s_t;
+
+#endif
-- 
2.25.1


