Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EE454CEBC6
	for <lists+qemu-devel@lfdr.de>; Sun,  6 Mar 2022 14:37:35 +0100 (CET)
Received: from localhost ([::1]:44708 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nQr4o-0005T8-Dx
	for lists+qemu-devel@lfdr.de; Sun, 06 Mar 2022 08:37:34 -0500
Received: from eggs.gnu.org ([209.51.188.92]:42538)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nQqWo-0002GH-GY
 for qemu-devel@nongnu.org; Sun, 06 Mar 2022 08:02:28 -0500
Received: from [2a00:1450:4864:20::42b] (port=45800
 helo=mail-wr1-x42b.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nQqWn-0004GH-3R
 for qemu-devel@nongnu.org; Sun, 06 Mar 2022 08:02:26 -0500
Received: by mail-wr1-x42b.google.com with SMTP id p9so19316345wra.12
 for <qemu-devel@nongnu.org>; Sun, 06 Mar 2022 05:02:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=FqZUqugwz2Gh+ZwGfqwwxA+LCXKw6T1kyC3gBt3f4v0=;
 b=kzjSa82nAr8ffBTBmIR/vHGrvockHsI7m8SSA0+YF2+ql6vuix4eGotsogUBhIqNpy
 dqRte3C8uhGhte4vOmiundtMAew4f+5K2JfVbK8L4ew0WzOpkGrtU4s++aPNW3hYDSCk
 EHfohG3715J1d0mYNRq7TMlaIcN81MbnYDga3iEwxvgMP1GyCTRSo24lyF7svv7KApXr
 cqpW/AMtDPPW+g/Vxn6TDPyJDFHKSRR+ou972txiOgEase9+3jrNC23eVir6A07bjYKe
 wyaOtomdLbwx0Zg45t54eZqMR4m2vPjisRuHtrLRKVhs+/KLrjZ6RLKFex1JJF5J1je8
 adkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=FqZUqugwz2Gh+ZwGfqwwxA+LCXKw6T1kyC3gBt3f4v0=;
 b=FxmWUWaOVCxqhUmLWphKm2qe8XIGIaBOQhYXq5TdhOFT06dqQy8AsAfuWyvGNQuRvx
 Orn6LOFVMHeWAHyDvJUvCPlupmoOQAdtbsMZRdUv3l6WioUj4vkHSZbaQMQZYeUuR1WM
 b6drXPCJ4vyGlhnwcYzQU7W4vOO+JPGW/EazHrtShUDzKM+PNrJHI/obQKVVb2dCAMF9
 PAUizSvZJKWEH+M5A2tSQcJEbtY71rXYto5IyNN0UYTnoOidvmvhp57Ax/7dbArf8YCj
 FgqsHnEvKFoK+Uees3gty93ODeEPQXPrJp4jK6nl0XRKspTBjYwtuy0csCXnptWIngrx
 1Oww==
X-Gm-Message-State: AOAM530AldAZytHluD7gFPjpQhXjt/euq3IuuADbdSiXrXjj9k+FAbX7
 88FqExcRi/0sNsyUnjalZl/QPUN1kQc=
X-Google-Smtp-Source: ABdhPJxuqXGnjayV8oy+miKDdgOgtuwmP1sG5KvLSJrZpL+RIgIGSbcFNAb0bBnTmJkGf4rXJ6z63w==
X-Received: by 2002:adf:9d93:0:b0:1f0:639f:3bc2 with SMTP id
 p19-20020adf9d93000000b001f0639f3bc2mr4977579wre.203.1646571743720; 
 Sun, 06 Mar 2022 05:02:23 -0800 (PST)
Received: from nuc.lan ([185.126.107.38]) by smtp.gmail.com with ESMTPSA id
 b3-20020a5d4d83000000b001f1d72a6f97sm4726040wru.50.2022.03.06.05.02.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 06 Mar 2022 05:02:23 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?=
 <philippe.mathieu.daude@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PULL 27/33] target/hexagon: Add missing 'hw/core/cpu.h' include
Date: Sun,  6 Mar 2022 13:59:54 +0100
Message-Id: <20220306130000.8104-28-philippe.mathieu.daude@gmail.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220306130000.8104-1-philippe.mathieu.daude@gmail.com>
References: <20220306130000.8104-1-philippe.mathieu.daude@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::42b
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::42b;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42b.google.com
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
Cc: Eduardo Habkost <eduardo@habkost.net>,
 Damien Hedde <damien.hedde@greensocs.com>, Thomas Huth <thuth@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Philippe Mathieu-Daudé <f4bug@amsat.org>

HexagonCPU field parent_class is of type CPUClass, which
is declared in "hw/core/cpu.h".

Reviewed-by: Damien Hedde <damien.hedde@greensocs.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Message-Id: <20220214183144.27402-11-f4bug@amsat.org>
---
 target/hexagon/cpu.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/target/hexagon/cpu.h b/target/hexagon/cpu.h
index 096aa2deb6c..76cd1d50219 100644
--- a/target/hexagon/cpu.h
+++ b/target/hexagon/cpu.h
@@ -27,6 +27,7 @@ typedef struct CPUHexagonState CPUHexagonState;
 #include "hex_regs.h"
 #include "mmvec/mmvec.h"
 #include "qom/object.h"
+#include "hw/core/cpu.h"
 
 #define NUM_PREGS 4
 #define TOTAL_PER_THREAD_REGS 64
-- 
2.35.1


