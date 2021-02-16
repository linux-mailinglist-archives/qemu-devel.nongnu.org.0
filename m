Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D10B31D2CB
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Feb 2021 23:48:35 +0100 (CET)
Received: from localhost ([::1]:57072 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lC98z-0002x4-UJ
	for lists+qemu-devel@lfdr.de; Tue, 16 Feb 2021 17:48:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39942)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <rebecca@nuviainc.com>)
 id 1lC96W-0000sf-Ff
 for qemu-devel@nongnu.org; Tue, 16 Feb 2021 17:46:01 -0500
Received: from mail-ot1-x32e.google.com ([2607:f8b0:4864:20::32e]:42780)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <rebecca@nuviainc.com>)
 id 1lC96T-0004sq-3T
 for qemu-devel@nongnu.org; Tue, 16 Feb 2021 17:46:00 -0500
Received: by mail-ot1-x32e.google.com with SMTP id q4so10419499otm.9
 for <qemu-devel@nongnu.org>; Tue, 16 Feb 2021 14:45:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=nuviainc-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=4ZPSLm3yrNAClwWOzT7/VZpNZh4ixX7KNguZeQ0+66w=;
 b=nfOSWq5Xkj4tBIKxivwikGdBpW5vU8aqHCg1EloTco9y5Iw2XrGVoY/s6cOJa7aklH
 unLIHOWXiaLXqBJUZ4mb4etI2UJ7Hw0sNqEFRY2rvzYBQAHl57gFE/hioWbEulO6XtnU
 yxebmgW26qOfmzJSMvJXmSj/xllQUasi8rKRqQfo82OrKtz9i7KLnun2neR5OOkHEieE
 YhBNVostm/nGYhlRf1ron/mqH7Vw3GI2DwRHDtILVLUTVfDG0Fr3azpAtkdmrISh/Ltv
 AYgsZhtGmAcxVUcqA3T44RoSIYKkOW0tig2o5WJyNzEPzTfcWims37s1ERLUW9BbAdQs
 TRJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=4ZPSLm3yrNAClwWOzT7/VZpNZh4ixX7KNguZeQ0+66w=;
 b=gBk8PM3KDUS8tShVJdTLv0m9/s7Z2xMcr16+bl/rA3QNrLMGY6FlBjPuY0xfkVbd76
 mUNK6Jd+o1OYJrEFuE3dtUEUbbP+Ps4eiZ9i2IGGPcrz9s9w9e+sPGCmXVo/4xhsVSj9
 XMCtz4W/l2LnNfhWTi7QaXXDyCtGyTb4IHT/tb/22vhg2JlTSJYZ70G6MyRD6rGKuI3e
 +EXKU60sa0Wr1JJmdx4XOlmNnGXvHUNP+9I/SoXfBBU6NPQMIoqddGdR5f5JEMuh3ol2
 O9v/PKgj8ZuZdSqJUCnLz4H8yRwboowNV4ukh4/Lh/NNCSH2/8dDb56Z8qzRZ/IXeah9
 x/lQ==
X-Gm-Message-State: AOAM531VvbADP1ZXwG/b3GnixQ6kUOYRoCI8ixYs6XnVIwZbF+ixzSbG
 qHs5dKp4quxBZbmYdkKXUSmnPQ==
X-Google-Smtp-Source: ABdhPJzDnOa4SmqKpP51gazeuFV2oxjUOkrqeL9zSMd3edw0hTGvBIS3DvVPEFDTrH9Zz3C8GRCW4g==
X-Received: by 2002:a9d:861:: with SMTP id 88mr16612524oty.27.1613515556196;
 Tue, 16 Feb 2021 14:45:56 -0800 (PST)
Received: from cube.nuviainc.com (c-174-52-16-57.hsd1.ut.comcast.net.
 [174.52.16.57])
 by smtp.gmail.com with ESMTPSA id b12sm32909oti.65.2021.02.16.14.45.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 16 Feb 2021 14:45:55 -0800 (PST)
From: Rebecca Cran <rebecca@nuviainc.com>
To: qemu-arm@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH v2 3/3] target/arm: Set ID_PFR2.SSBS to 1 for "max" 32-bit CPU
Date: Tue, 16 Feb 2021 15:45:43 -0700
Message-Id: <20210216224543.16142-4-rebecca@nuviainc.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210216224543.16142-1-rebecca@nuviainc.com>
References: <20210216224543.16142-1-rebecca@nuviainc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::32e;
 envelope-from=rebecca@nuviainc.com; helo=mail-ot1-x32e.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Cc: Rebecca Cran <rebecca@nuviainc.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Enable FEAT_SSBS for the "max" 32-bit CPU.

Signed-off-by: Rebecca Cran <rebecca@nuviainc.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/cpu.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/target/arm/cpu.c b/target/arm/cpu.c
index 5cf6c056c50f..88a6b183d325 100644
--- a/target/arm/cpu.c
+++ b/target/arm/cpu.c
@@ -2206,6 +2206,10 @@ static void arm_max_initfn(Object *obj)
         t = cpu->isar.id_pfr0;
         t = FIELD_DP32(t, ID_PFR0, DIT, 1);
         cpu->isar.id_pfr0 = t;
+
+        t = cpu->isar.id_pfr2;
+        t = FIELD_DP32(t, ID_PFR2, SSBS, 1);
+        cpu->isar.id_mfr2 = t;
     }
 #endif
 }
-- 
2.26.2


