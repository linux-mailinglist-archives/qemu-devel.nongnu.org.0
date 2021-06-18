Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DA12C3AD2F2
	for <lists+qemu-devel@lfdr.de>; Fri, 18 Jun 2021 21:36:31 +0200 (CEST)
Received: from localhost ([::1]:44430 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1luKI2-0004U7-Tu
	for lists+qemu-devel@lfdr.de; Fri, 18 Jun 2021 15:36:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58284)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1luKBn-0001ZN-Tr
 for qemu-devel@nongnu.org; Fri, 18 Jun 2021 15:30:04 -0400
Received: from mail-pf1-x42a.google.com ([2607:f8b0:4864:20::42a]:38639)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1luKBi-0001Sj-MV
 for qemu-devel@nongnu.org; Fri, 18 Jun 2021 15:30:03 -0400
Received: by mail-pf1-x42a.google.com with SMTP id z26so8438737pfj.5
 for <qemu-devel@nongnu.org>; Fri, 18 Jun 2021 12:29:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=9uDmWChPs4lp5UI8b6weWaZXX8zbdz4czXb1drnckGg=;
 b=ulS4pyoB01ZaWpSAAqvb0/v1/U+/UDZcRnwG2IUgbYQ1Eio4F3ASbQIWDQxCNN1bAG
 T15drD+tdC5b9aUjLpyHwPLvxuvhq4wWb+CkRbYn0J6eirmNDkXHnxGOJvwPdYHao1wT
 kz+L1qMSdJN4EAYlwP4iHUvMsUWKKnoDUGvpSb4Coj1pEL8LsOEuIGgIp+rFPbpa3Mh+
 NzGaiNAvbouQ4qnA53fWdQXq7ypBewhgc2Zcbvrin1pdWmhv5PlRg5qpQGsnofsjpL9e
 jAU9GuLbNcoqhsanq1KFLkli8lVDbJf3GlEZmrDh1df7FyXsGBL2IKaem4qGDFeKRv5f
 8GYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=9uDmWChPs4lp5UI8b6weWaZXX8zbdz4czXb1drnckGg=;
 b=RgNqvpDfMdbI2E5fedY1LdmV6QMI0FeSYyvzRf75AbKxX+cr1YbMecdnMO45XqO7N2
 EubrtylsquodzvmU40n2x4JE0eKAzbUsXNj73cdMcKs22iP99ksgRjd8CXFN7hvSAa6W
 Nlyt5Z/tOFFs5LV/3dDlSZxG4aD1IGT/xxCyaq6Djklznemtvyiy4sTorG13nURXqy7B
 qM/rXxsg87q0GuSXDpVKzWpNXidCTS7oKdZC34Ph5igbsHIX24Pd9rU29wsN57Vw4o3W
 b4wQoHN7lKIsxFWqYyY32EQrhCZJ1j6VVEMQwrc5Bo7t9xAYBneOdlm/VXldASS7p7YQ
 76hw==
X-Gm-Message-State: AOAM533k6fY7NBNlKkariZc4uyPUs+P5rtm1SBtk1ib+p9KG9jUG8weU
 eypVsdBJPnLfGnodkjkR9CB0mH9k89rW6w==
X-Google-Smtp-Source: ABdhPJyXQO6912kWASFYxVohBqw2UV3HyIKM0oAZmDDnIiVAd+P7mexJq8KamP4RJdDrQLWv7U9wSQ==
X-Received: by 2002:a65:6a12:: with SMTP id m18mr11450996pgu.229.1624044597375; 
 Fri, 18 Jun 2021 12:29:57 -0700 (PDT)
Received: from localhost.localdomain ([71.212.149.176])
 by smtp.gmail.com with ESMTPSA id 92sm11938234pjv.29.2021.06.18.12.29.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 18 Jun 2021 12:29:57 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 09/23] linux-user/hppa: Document non-use of setup_sigtramp
Date: Fri, 18 Jun 2021 12:29:37 -0700
Message-Id: <20210618192951.125651-10-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210618192951.125651-1-richard.henderson@linaro.org>
References: <20210618192951.125651-1-richard.henderson@linaro.org>
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
Cc: alex.bennee@linaro.org, laurent@vivier.eu,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

We cannot use a raw sigtramp page for hppa,
but must wait for full vdso support.

Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 linux-user/hppa/target_signal.h | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/linux-user/hppa/target_signal.h b/linux-user/hppa/target_signal.h
index 7f525362e9..d558119ee7 100644
--- a/linux-user/hppa/target_signal.h
+++ b/linux-user/hppa/target_signal.h
@@ -71,4 +71,18 @@ typedef struct target_sigaltstack {
 /* mask for all SS_xxx flags */
 #define TARGET_SS_FLAG_BITS  TARGET_SS_AUTODISARM
 
+/*
+ * We cannot use a bare sigtramp page for hppa-linux.
+ *
+ * Unlike other guests where we use the instructions at PC to validate
+ * an offset from SP, the hppa libgcc signal frame fallback unwinding uses
+ * the PC address itself to find the frame.  This is due to the fact that
+ * the hppa grows the stack upward, and the frame is of unknown size.
+ *
+ * TODO: We should be able to use a VDSO to address this, by providing
+ * proper unwind info for the sigtramp code, at which point the fallback
+ * unwinder will not be used.
+ */
+#define TARGET_ARCH_HAS_SIGTRAMP_PAGE 0
+
 #endif /* HPPA_TARGET_SIGNAL_H */
-- 
2.25.1


