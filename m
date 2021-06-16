Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 29C433A8E57
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Jun 2021 03:26:34 +0200 (CEST)
Received: from localhost ([::1]:48528 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ltKK9-000195-6W
	for lists+qemu-devel@lfdr.de; Tue, 15 Jun 2021 21:26:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52222)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ltK6U-0005a1-LO
 for qemu-devel@nongnu.org; Tue, 15 Jun 2021 21:12:26 -0400
Received: from mail-pf1-x433.google.com ([2607:f8b0:4864:20::433]:35447)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ltK6O-0008RM-Al
 for qemu-devel@nongnu.org; Tue, 15 Jun 2021 21:12:26 -0400
Received: by mail-pf1-x433.google.com with SMTP id h12so853373pfe.2
 for <qemu-devel@nongnu.org>; Tue, 15 Jun 2021 18:12:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ZrJxA2097dXMmX/dlQGDy3yrhTNOTODlU+a5YheuYl4=;
 b=whuPN/gxnPpK8Xg/Pfy3idA0ly0cbX4Ah8ZmduHy8Ic2BDj/+P7Uqr+4tW3WgGDYzs
 HOPFj5uspoBZMLlpAjh3vlC1vs4mlz+UycH3h4Cx9ObwKviVfP3LeQrHRtSztN5KVq3a
 65/Q7DV2DVyAvF86Hq81QkbYdbzuXGOEg9FT15cTxxR4b7HrmwPXSOA9IwSOoCIthe0D
 ft6ELlZU6Y75/42k/liyn0s+QA4yXaf6cVIimVlbW864gLWUb/3Avr59SxfGxa3XvlDe
 51PWaeR/trhPcRykstCJnbvpHHmzd67o3YeUrG6Y4XQ0bfN3Ac6p91ZfJzY1/ah4wz/p
 KqHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ZrJxA2097dXMmX/dlQGDy3yrhTNOTODlU+a5YheuYl4=;
 b=TQ1ywvFfwZS8IgqrVvYAKj6nWwFDXHuigf7NsS4aejalgwOlvmTCtozJ/0spHxc5oF
 qeo5vtnxZX/2DCy2r7MVuwCrRaIPGKRiqW/wXAMJThksaDHLg7HSg+X3ZG8cvanxg15g
 NoKUtgbvMom/Y3D89waV8n8sZSe57f1KoG2GGQ80ubs2bGPjvbMZk51+JTBdhM2fnjTj
 OTzye9PpCkwPHtM7jTV2oP/WIsJvxW/RbRV3h6cTVkvAB19CHBekAPDZooJmmo9/scse
 418qOWPV5+zH4q2wk6/FGhKnubPY9EPyJ/cvJ7x25tFxDml53UFEZhD+V8ik1WQZi8lm
 olgw==
X-Gm-Message-State: AOAM532UDc/Zf0lfw3Erv6fNhyDdY5A8zjYgxj7+HPGjQLf6Nu2RYX0X
 MOApXLOYxz9IFi2Yo3WPGMX0Z0IZF8uUEA==
X-Google-Smtp-Source: ABdhPJzkB4WrH3eBtK3/4PjzDSSFFlyj4FJ0Z0jmmO3LYCrhf+5aIjh/9QgJeqvzc3wH7eGjhES5Gw==
X-Received: by 2002:a63:ef4c:: with SMTP id c12mr2338905pgk.441.1623805939065; 
 Tue, 15 Jun 2021 18:12:19 -0700 (PDT)
Received: from localhost.localdomain (174-21-70-228.tukw.qwest.net.
 [174.21.70.228])
 by smtp.gmail.com with ESMTPSA id y18sm305297pgk.53.2021.06.15.18.12.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Jun 2021 18:12:18 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 13/21] linux-user/nios2: Document non-use of setup_sigtramp
Date: Tue, 15 Jun 2021 18:12:01 -0700
Message-Id: <20210616011209.1446045-14-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210616011209.1446045-1-richard.henderson@linaro.org>
References: <20210616011209.1446045-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::433;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x433.google.com
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
Cc: Marek Vasut <marex@denx.de>, Chris Wulff <crwulff@gmail.com>,
 alex.bennee@linaro.org, laurent@vivier.eu
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Cc: Chris Wulff <crwulff@gmail.com>
Cc: Marek Vasut <marex@denx.de>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 linux-user/nios2/target_signal.h | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/linux-user/nios2/target_signal.h b/linux-user/nios2/target_signal.h
index aebf749f12..fe266c4c51 100644
--- a/linux-user/nios2/target_signal.h
+++ b/linux-user/nios2/target_signal.h
@@ -19,4 +19,7 @@ typedef struct target_sigaltstack {
 
 #include "../generic/signal.h"
 
+/* Nios2 uses a fixed address on the kuser page for sigreturn. */
+#define TARGET_ARCH_HAS_SIGTRAMP_PAGE 0
+
 #endif /* NIOS2_TARGET_SIGNAL_H */
-- 
2.25.1


