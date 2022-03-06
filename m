Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AEAF4CEBBF
	for <lists+qemu-devel@lfdr.de>; Sun,  6 Mar 2022 14:34:10 +0100 (CET)
Received: from localhost ([::1]:38348 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nQr1V-00012G-B7
	for lists+qemu-devel@lfdr.de; Sun, 06 Mar 2022 08:34:09 -0500
Received: from eggs.gnu.org ([209.51.188.92]:42482)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nQqWe-00028h-AZ
 for qemu-devel@nongnu.org; Sun, 06 Mar 2022 08:02:17 -0500
Received: from [2a00:1450:4864:20::42d] (port=46782
 helo=mail-wr1-x42d.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nQqWc-0004Fm-UO
 for qemu-devel@nongnu.org; Sun, 06 Mar 2022 08:02:16 -0500
Received: by mail-wr1-x42d.google.com with SMTP id x15so19305115wru.13
 for <qemu-devel@nongnu.org>; Sun, 06 Mar 2022 05:02:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=7kd7wnXKdwTXaDPJMBrdDRtxGg40G0iOU7ZJxTsD8+s=;
 b=g7LZw0HAxHk/b5HpffbCuHjyxl6BCplXVhpjAlNbEZxYlV24cA1KGelO0b57qk6ksC
 FjIxG/9QqRQ2Kh+KSy8GuD3UFHz/jmEtJ2QWjzkWTtbEJ1ekFTQ+OkLWwdgN0bCkb4nq
 oFSCtz9yGeykyfq6ienh92WitNJuXT3dxWeUrK+devGUPQ0GzXeYaxu6+fEPvsGmOUS1
 huuW27OX926CA7ZqiHKW/HN51M+L0D1R49m2n9kgrAg4kg9apCbRRhnG86QndXlJ+wMG
 fEd1GgCiNel+xD0E8vT0YMz20Bcyz9+Idq72akX8lANoLlCHXrWh343BQdfp0q5Kx1pM
 JFpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=7kd7wnXKdwTXaDPJMBrdDRtxGg40G0iOU7ZJxTsD8+s=;
 b=DGBJsLy3Osw5Wu7P3RzoxjHI+vvshsib1bRQHiBoD9unl2OiR0FfcdFLXjBZS+vmGp
 tZzWJzScMR1yRP4iKd7KP0HPu7hozfD27BLBmCenmEKOLU6Ed4ktLK7eLph/a1ppohj+
 yJ0ut57hR3Q5Dde/wDdYmfGXWCqbXkNVzeZR8/4Y+J99gqTCyk4rsQrwQn/uSdv1ZJh/
 lU+A+m1ocFppdVcIDAMRR07JR5kDUMgNHjpgZuR2WmmPnluKDn4Vzrefz7XlWNAIs1j2
 /c33kZnxg7Dc8OZIqlIK0Vz/9uUOlsJ824JMZckMI/ZlcgLTs+Qea0guL5Y69Lc3oRlV
 fMxA==
X-Gm-Message-State: AOAM532z5sPzoZUCERs0Uq6jytyBTiDekI4ip69SRq+p3nmM2QM1m/6V
 BGX5Axe5DI+A6i1nOiqkdPO0WWfyRA4=
X-Google-Smtp-Source: ABdhPJwNVYX8z2bPoxeRfx7CuYBaqjlc9hRxk0OpFX3IAGXY59w0pgFE2qvUqwcN5Smz9WMrz7ZXIA==
X-Received: by 2002:a5d:6e8e:0:b0:1e6:754b:47de with SMTP id
 k14-20020a5d6e8e000000b001e6754b47demr5150599wrz.208.1646571733401; 
 Sun, 06 Mar 2022 05:02:13 -0800 (PST)
Received: from nuc.lan ([185.126.107.38]) by smtp.gmail.com with ESMTPSA id
 w6-20020adfee46000000b001e4bf01bdfbsm8847362wro.46.2022.03.06.05.02.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 06 Mar 2022 05:02:12 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?=
 <philippe.mathieu.daude@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PULL 25/33] Hexagon (target/hexagon) convert to OBJECT_DECLARE_TYPE
Date: Sun,  6 Mar 2022 13:59:52 +0100
Message-Id: <20220306130000.8104-26-philippe.mathieu.daude@gmail.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220306130000.8104-1-philippe.mathieu.daude@gmail.com>
References: <20220306130000.8104-1-philippe.mathieu.daude@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::42d
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::42d;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42d.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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
Cc: Eduardo Habkost <eduardo@habkost.net>, Thomas Huth <thuth@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Taylor Simpson <tsimpson@quicinc.com>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Taylor Simpson <tsimpson@quicinc.com>

Suggested-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Taylor Simpson <tsimpson@quicinc.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Message-Id: <20220211033034.21107-1-tsimpson@quicinc.com>
[PMD: Add missing "qom/object.h" include]
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 target/hexagon/cpu.h | 10 +++-------
 1 file changed, 3 insertions(+), 7 deletions(-)

diff --git a/target/hexagon/cpu.h b/target/hexagon/cpu.h
index 58a0d3870bb..096aa2deb6c 100644
--- a/target/hexagon/cpu.h
+++ b/target/hexagon/cpu.h
@@ -1,5 +1,5 @@
 /*
- *  Copyright(c) 2019-2021 Qualcomm Innovation Center, Inc. All Rights Reserved.
+ *  Copyright(c) 2019-2022 Qualcomm Innovation Center, Inc. All Rights Reserved.
  *
  *  This program is free software; you can redistribute it and/or modify
  *  it under the terms of the GNU General Public License as published by
@@ -26,6 +26,7 @@ typedef struct CPUHexagonState CPUHexagonState;
 #include "exec/cpu-defs.h"
 #include "hex_regs.h"
 #include "mmvec/mmvec.h"
+#include "qom/object.h"
 
 #define NUM_PREGS 4
 #define TOTAL_PER_THREAD_REGS 64
@@ -131,12 +132,7 @@ struct CPUHexagonState {
     VTCMStoreLog vtcm_log;
 };
 
-#define HEXAGON_CPU_CLASS(klass) \
-    OBJECT_CLASS_CHECK(HexagonCPUClass, (klass), TYPE_HEXAGON_CPU)
-#define HEXAGON_CPU(obj) \
-    OBJECT_CHECK(HexagonCPU, (obj), TYPE_HEXAGON_CPU)
-#define HEXAGON_CPU_GET_CLASS(obj) \
-    OBJECT_GET_CLASS(HexagonCPUClass, (obj), TYPE_HEXAGON_CPU)
+OBJECT_DECLARE_TYPE(HexagonCPU, HexagonCPUClass, HEXAGON_CPU)
 
 typedef struct HexagonCPUClass {
     /*< private >*/
-- 
2.35.1


