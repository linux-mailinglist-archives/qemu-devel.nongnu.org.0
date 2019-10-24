Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D371E38E6
	for <lists+qemu-devel@lfdr.de>; Thu, 24 Oct 2019 18:53:24 +0200 (CEST)
Received: from localhost ([::1]:48024 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iNgMU-0002hH-RC
	for lists+qemu-devel@lfdr.de; Thu, 24 Oct 2019 12:53:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57934)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1iNfxs-0007Uw-9v
 for qemu-devel@nongnu.org; Thu, 24 Oct 2019 12:27:57 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1iNfxq-0000pk-4Q
 for qemu-devel@nongnu.org; Thu, 24 Oct 2019 12:27:55 -0400
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432]:38853)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1iNfxp-0000pV-UR
 for qemu-devel@nongnu.org; Thu, 24 Oct 2019 12:27:54 -0400
Received: by mail-wr1-x432.google.com with SMTP id v9so15523861wrq.5
 for <qemu-devel@nongnu.org>; Thu, 24 Oct 2019 09:27:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=XZeplV9UvaCL/Xmc97dVbloX+PjjbYg7Xk7yU5JEklc=;
 b=UmIp1ToZEDwVtWzTJOSPTNLb+Z5nrTM6M1pAOtvCibwT9pJQM6Ryv1okjYldM91zVU
 f8ustqD+3hpZUUBFrWcq41tDtExND40iPOx0O1BFkt4LqJIike9s6/TyVzCW14hdbBug
 lC/uf0qRSs0+7CsScrwHlx0T/Zj+3JnhGtSTJTX43h3b+Vkv9VYvIdgo1uOSW5qmlvXz
 f2cmuMW0yDjV8WSKY8l0OJaYJ9bITJLaSVWkcjq7eiqMlgkA+0DVaJwtaHl8gM6a6okJ
 k7Ds9JHrorgdjiHfTSeCTRojXurBT3uDPI1CGyrRIcefTnkv604nD75zEjmW/nUY9qmr
 AvEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=XZeplV9UvaCL/Xmc97dVbloX+PjjbYg7Xk7yU5JEklc=;
 b=P6eB5KV+/0q8YvEErS29s4936rNKJmpos8V3FBPoq0mXdBRIwZNg0pb2IzYK29JNpd
 03UICbXHfyWJ5ZQMOsKg77aWm6a0hLSMvZVjEWyjHpitC1iIjMfO0khfD/6HswwbT53g
 HvABMBmOSNcROaDJPAkGPK0sYOJnTiGk5IGVvzp7RnrPq9peUu3l9qPpph+amregPVF+
 cE/N5tsrFbk5pUsadZfDskyhobHYexepCctH8rhF9LS0Ikm1ktccEetYkGR+MjsYVacL
 S1ycuUa1xfKHjrPvqsvnXG000t/tbg2Pi3vgQcDasdzqViS7gVRInCMyBNF0b2NNXDUk
 kLog==
X-Gm-Message-State: APjAAAXRsz+Ih7gXLqjU2+B4QZcDL/z9OAPceCscQss7d+sA/RtYToYl
 3dvlpzGsDBZIJbJYceM/TpPgMZS+Fnw=
X-Google-Smtp-Source: APXvYqxT7AP6OK4/viRjpw4ldwh0bsHYWUSvYpj0yJtf/12T3huupLBfmZAcGgEjfIS9702jX9Pt0w==
X-Received: by 2002:a5d:464f:: with SMTP id j15mr4658132wrs.366.1571934472678; 
 Thu, 24 Oct 2019 09:27:52 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id r27sm42606124wrc.55.2019.10.24.09.27.50
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 24 Oct 2019 09:27:51 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 20/51] target/arm: Rebuild hflags at CPSR writes
Date: Thu, 24 Oct 2019 17:26:53 +0100
Message-Id: <20191024162724.31675-21-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191024162724.31675-1-peter.maydell@linaro.org>
References: <20191024162724.31675-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::432
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Richard Henderson <richard.henderson@linaro.org>

Continue setting, but not relying upon, env->hflags.

Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Message-id: 20191023150057.25731-19-richard.henderson@linaro.org
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/op_helper.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/target/arm/op_helper.c b/target/arm/op_helper.c
index ccc2cecb467..b529d6c1bf7 100644
--- a/target/arm/op_helper.c
+++ b/target/arm/op_helper.c
@@ -224,6 +224,7 @@ uint32_t HELPER(usat16)(CPUARMState *env, uint32_t x, uint32_t shift)
 void HELPER(setend)(CPUARMState *env)
 {
     env->uncached_cpsr ^= CPSR_E;
+    arm_rebuild_hflags(env);
 }
 
 /* Function checks whether WFx (WFI/WFE) instructions are set up to be trapped.
@@ -387,6 +388,8 @@ uint32_t HELPER(cpsr_read)(CPUARMState *env)
 void HELPER(cpsr_write)(CPUARMState *env, uint32_t val, uint32_t mask)
 {
     cpsr_write(env, val, mask, CPSRWriteByInstr);
+    /* TODO: Not all cpsr bits are relevant to hflags.  */
+    arm_rebuild_hflags(env);
 }
 
 /* Write the CPSR for a 32-bit exception return */
-- 
2.20.1


