Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BE6DF188CA8
	for <lists+qemu-devel@lfdr.de>; Tue, 17 Mar 2020 18:56:47 +0100 (CET)
Received: from localhost ([::1]:38182 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jEGSM-0000hB-RY
	for lists+qemu-devel@lfdr.de; Tue, 17 Mar 2020 13:56:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57122)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <alex.bennee@linaro.org>) id 1jEGN0-0000XL-Le
 for qemu-devel@nongnu.org; Tue, 17 Mar 2020 13:51:15 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <alex.bennee@linaro.org>) id 1jEGMz-00030J-Jr
 for qemu-devel@nongnu.org; Tue, 17 Mar 2020 13:51:14 -0400
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329]:37197)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <alex.bennee@linaro.org>)
 id 1jEGMz-0002nw-Cu
 for qemu-devel@nongnu.org; Tue, 17 Mar 2020 13:51:13 -0400
Received: by mail-wm1-x329.google.com with SMTP id a141so250299wme.2
 for <qemu-devel@nongnu.org>; Tue, 17 Mar 2020 10:51:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=UfXS/oThBLt+JELyaFOgYVQnoWMelkeLl6+REhHpyHg=;
 b=tLBireuqSFAK1uVbwzK2zK6JyKifxUC2wUwrNf0l/NCGUbm+RJZ5LOW1rFrFajTlgN
 zLtPpjHkkzizSSUYWVM1Crgkcdh9bp0uoS5NTuq69Hdn3RWKU3+H/llqTH73IAzEBXQe
 bjixboA7iNUZ59TjUXRXhHtWNSBu6YG5VP7FMyn73m5j63S5WiHylkjfPiHgmw+EoayF
 mpiaY5V3GU6QZBmINELSqIju6F6qG/OWduMLqc9irbCiA62o9Vk3QhkgVRSzEZKMJtKa
 s5pv85zmuZNfiGlH0bnOlTnnJpX/DAGr7dhAsVace8uBBT8cfzMaw9nii0pWWXr7SlG1
 3CIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=UfXS/oThBLt+JELyaFOgYVQnoWMelkeLl6+REhHpyHg=;
 b=FP8jH8eGLRQIkXmLCLexQQTyOU8zZvexQSX0Hapz1rp1clounB4kGuyTJ1/iNcHQ/a
 lIoFu0XKfZr/UQSb9AVT27SQoQCoH8YofVqndsYLLICCHt7blOUsksM4St3XLsOEKuB4
 a4lo3RZFMC56fq0Ol0Y0gJEmRz0cFC8cwBCeUsG2+Fb3Mwitr+5ppBKwd/gGTf0Eq4gg
 sDQ7Sarev7ghKUl2NAO50gIsEuF7CS0z6YPNhnqfExd1a8/PegT7sI4KQrSynOz07nYx
 XxBPVW/LgwLugp2A5lFG7KTO3FJeeXrgm48kzOrMUWe+jlIgTW4UqhBQgW/Jq/Ys/bOE
 CSYw==
X-Gm-Message-State: ANhLgQ18jUGRU3irXzAG/IT0ie/UOv2z7YOES25NJCJoxuznL+8aTIAs
 whLshA/vaKNFFcGasnOqopX15g==
X-Google-Smtp-Source: ADFU+vuJ1PNAVcNGiCOuugLnDvB0OwrNIFtwiw9vskpyNyKi75um8/N6BjWZbmhuP6qMp8hTxbfXpQ==
X-Received: by 2002:a1c:6285:: with SMTP id w127mr170378wmb.133.1584467471746; 
 Tue, 17 Mar 2020 10:51:11 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id 19sm238588wma.3.2020.03.17.10.50.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 17 Mar 2020 10:51:00 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 466D51FF9A;
 Tue, 17 Mar 2020 17:50:54 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: peter.maydell@linaro.org
Subject: [PULL 11/28] target/arm: use gdb_get_reg helpers
Date: Tue, 17 Mar 2020 17:50:36 +0000
Message-Id: <20200317175053.5278-12-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200317175053.5278-1-alex.bennee@linaro.org>
References: <20200317175053.5278-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::329
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
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>, qemu-devel@nongnu.org,
 "open list:ARM TCG CPUs" <qemu-arm@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This is cleaner than poking memory directly and will make later
clean-ups easier.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

Message-Id: <20200316172155.971-12-alex.bennee@linaro.org>

diff --git a/target/arm/helper.c b/target/arm/helper.c
index b61ee73d18a..69104fb351d 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -106,21 +106,17 @@ static int aarch64_fpu_gdb_get_reg(CPUARMState *env, uint8_t *buf, int reg)
 {
     switch (reg) {
     case 0 ... 31:
-        /* 128 bit FP register */
-        {
-            uint64_t *q = aa64_vfp_qreg(env, reg);
-            stq_le_p(buf, q[0]);
-            stq_le_p(buf + 8, q[1]);
-            return 16;
-        }
+    {
+        /* 128 bit FP register - quads are in LE order */
+        uint64_t *q = aa64_vfp_qreg(env, reg);
+        return gdb_get_reg128(buf, q[1], q[0]);
+    }
     case 32:
         /* FPSR */
-        stl_p(buf, vfp_get_fpsr(env));
-        return 4;
+        return gdb_get_reg32(buf, vfp_get_fpsr(env));
     case 33:
         /* FPCR */
-        stl_p(buf, vfp_get_fpcr(env));
-        return 4;
+        return gdb_get_reg32(buf,vfp_get_fpcr(env));
     default:
         return 0;
     }
-- 
2.20.1


