Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AADE714FA42
	for <lists+qemu-devel@lfdr.de>; Sat,  1 Feb 2020 20:34:31 +0100 (CET)
Received: from localhost ([::1]:49302 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ixyXG-0004TL-M0
	for lists+qemu-devel@lfdr.de; Sat, 01 Feb 2020 14:34:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58726)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1ixySd-0007Zk-93
 for qemu-devel@nongnu.org; Sat, 01 Feb 2020 14:29:45 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1ixySa-0006o5-Ur
 for qemu-devel@nongnu.org; Sat, 01 Feb 2020 14:29:43 -0500
Received: from mail-pg1-x542.google.com ([2607:f8b0:4864:20::542]:36603)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1ixySa-0006nZ-Ph
 for qemu-devel@nongnu.org; Sat, 01 Feb 2020 14:29:40 -0500
Received: by mail-pg1-x542.google.com with SMTP id k3so5486125pgc.3
 for <qemu-devel@nongnu.org>; Sat, 01 Feb 2020 11:29:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ZmLVKq5ZCR+ymmuOiYYpLo/dLKBJqCs80mPJBtIPf/g=;
 b=Qtb1YiIL7xV1wTeQvk6PsfbH2NCOGI6S9ZW0BI2Z7zPrFatoYfdhhMl+kZU0Dkeq4B
 4GScZmf7JwkWMzVniCxJJc3LtviZJIM7ORT8KpWT7kWPI7HeHXe1hU7fJ4q7rYhdmIW8
 rK3AiKUYBylRqkHKJl7VFrGVjgvPwp8MTC/44327wYuQ30/0QDIIqLoca0GTwvAAhSTy
 wn0TfGBc0QKvhVq/dArEf+xEZqWtNgf96YFRO1X3+OsUbfANi7O4bP3kT9U62l64LRtU
 Muu1nwq088UnBMlpWX0UYrNEWhtd/OIAOo7FbwF01AYi5yRN27OwOWubcDEQUP9x+PZl
 uQhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ZmLVKq5ZCR+ymmuOiYYpLo/dLKBJqCs80mPJBtIPf/g=;
 b=FBCbLkGP367vHr/AiusqqZQZb0D1bPzDSBW75v1MNf2eQLZK0esJPkfcCrDs8ebtJw
 /wlcOttajRFztYqZ2eEQpNWV4UiAPbPJQTZoIKJPuYCQ5K+0mCAbfAThKrPhe1JGMhK4
 0aVjGTrz+PMVoFrzmMVCvfyxK8oyG5JGJFvuCjDO4Xmi183Zr9pTlqKLnAjdMiBm3PST
 yLVQtCIjBuwDBh3qrAHhISw5yFwLvVLaIdBCqDdq1cKHLf1f4NtGwT3+L82uKlKJTQ9v
 7WYm3B5FGBRuthpA2jfxVA20ywcqGaT7UMIQTOdlL6YDdVnTuu1VfMt1iXjhmQfsTD7u
 zr6g==
X-Gm-Message-State: APjAAAXRR79jlqPi4B948sA3wmYTZ3+y8qQHFonW1eZibMN0dQxaKVFY
 YbT/BSkW7pRKeNV9Qdj9fIa3GhiGa2g=
X-Google-Smtp-Source: APXvYqyJi8oxI62qCXSFxOMrnBMaXbcLO/saFJC0Ev+Rr+iPTAB3LI/oqbzbkB7aYeqKlfcwaGWZYg==
X-Received: by 2002:a63:691:: with SMTP id 139mr1535022pgg.325.1580585379363; 
 Sat, 01 Feb 2020 11:29:39 -0800 (PST)
Received: from localhost.localdomain (97-126-123-70.tukw.qwest.net.
 [97.126.123.70])
 by smtp.gmail.com with ESMTPSA id l7sm3668509pga.27.2020.02.01.11.29.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 01 Feb 2020 11:29:38 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v6 18/41] target/arm: Tidy ARMMMUIdx m-profile definitions
Date: Sat,  1 Feb 2020 11:28:53 -0800
Message-Id: <20200201192916.31796-19-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200201192916.31796-1-richard.henderson@linaro.org>
References: <20200201192916.31796-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::542
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
Cc: peter.maydell@linaro.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Replace the magic numbers with the relevant ARM_MMU_IDX_M_* constants.
Keep the definitions short by referencing previous symbols.

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/cpu.h | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index aa121cd9d0..ad92873943 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -2912,14 +2912,14 @@ typedef enum ARMMMUIdx {
     ARMMMUIdx_SE10_0 = 4 | ARM_MMU_IDX_A,
     ARMMMUIdx_SE10_1 = 5 | ARM_MMU_IDX_A,
     ARMMMUIdx_Stage2 = 6 | ARM_MMU_IDX_A,
-    ARMMMUIdx_MUser = 0 | ARM_MMU_IDX_M,
-    ARMMMUIdx_MPriv = 1 | ARM_MMU_IDX_M,
-    ARMMMUIdx_MUserNegPri = 2 | ARM_MMU_IDX_M,
-    ARMMMUIdx_MPrivNegPri = 3 | ARM_MMU_IDX_M,
-    ARMMMUIdx_MSUser = 4 | ARM_MMU_IDX_M,
-    ARMMMUIdx_MSPriv = 5 | ARM_MMU_IDX_M,
-    ARMMMUIdx_MSUserNegPri = 6 | ARM_MMU_IDX_M,
-    ARMMMUIdx_MSPrivNegPri = 7 | ARM_MMU_IDX_M,
+    ARMMMUIdx_MUser = ARM_MMU_IDX_M,
+    ARMMMUIdx_MPriv = ARM_MMU_IDX_M | ARM_MMU_IDX_M_PRIV,
+    ARMMMUIdx_MUserNegPri = ARMMMUIdx_MUser | ARM_MMU_IDX_M_NEGPRI,
+    ARMMMUIdx_MPrivNegPri = ARMMMUIdx_MPriv | ARM_MMU_IDX_M_NEGPRI,
+    ARMMMUIdx_MSUser = ARMMMUIdx_MUser | ARM_MMU_IDX_M_S,
+    ARMMMUIdx_MSPriv = ARMMMUIdx_MPriv | ARM_MMU_IDX_M_S,
+    ARMMMUIdx_MSUserNegPri = ARMMMUIdx_MUserNegPri | ARM_MMU_IDX_M_S,
+    ARMMMUIdx_MSPrivNegPri = ARMMMUIdx_MPrivNegPri | ARM_MMU_IDX_M_S,
     /* Indexes below here don't have TLBs and are used only for AT system
      * instructions or for the first stage of an S12 page table walk.
      */
-- 
2.20.1


