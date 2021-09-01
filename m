Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DCCA13FD7DD
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Sep 2021 12:42:11 +0200 (CEST)
Received: from localhost ([::1]:56840 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mLNh4-0007Ap-VE
	for lists+qemu-devel@lfdr.de; Wed, 01 Sep 2021 06:42:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43178)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mLNc8-0006kO-Ku
 for qemu-devel@nongnu.org; Wed, 01 Sep 2021 06:37:04 -0400
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f]:42871)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mLNc3-0005bo-9b
 for qemu-devel@nongnu.org; Wed, 01 Sep 2021 06:37:04 -0400
Received: by mail-wr1-x42f.google.com with SMTP id q11so3714414wrr.9
 for <qemu-devel@nongnu.org>; Wed, 01 Sep 2021 03:36:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=h50eayBgkaoAxyuO40I1PnRhLt568bidBUOZ4ZiBi7A=;
 b=YhaoXsBZIU/65LnVFS5j1UYR2qIqV6sbbJ/48cZPK2r2Wx4NqhZhAQexVS8mfT7YKa
 7Nk36ofIUA2KwNUvhhVBeNGCc5Hw9/7+YElPZuGeSpj83mcHuwB7dTuw6TVw7hWdQAt/
 AjR/geadvFiS/fxDfofxf4E9yzXhGy+Qyxr1XleCl3Fcy45F5TKr6VSL6fXkmslLgG1n
 gWDpvOdp/1+KBDcv7UqVAihRzQp+uNaQVFwrVQMFQRe+5q6qZLXZ7+CAPJcYXRfFghcP
 iPstm/VZ8zO4A+xmik8X62VEz1HsBMdHb9mfMK9cyS/n5kMFmBDe6CblE+2MiVCoYFDS
 RKRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=h50eayBgkaoAxyuO40I1PnRhLt568bidBUOZ4ZiBi7A=;
 b=FNKQSo8315D0TWYvNRsyD6rX7grJBqNCgznpz6/B8GyBoLIshk0nMEbbG42+sSSunf
 lSEuu83lswR0erdXmExFLH2ZRzRDH2VRHBPIMDiLn2n9hgWBeAXa0XKp8k9h4MCEmri1
 n6ylaxhNlTaz7i0BOflI07jirIf/SHE5BW44XGLYqKJR9jz+paI2vVIr6kfAwJmPpJwd
 J9emLU3xHoiVccPw1cNCQCUzartf0QfncoaRHOS2u2H7BPaHramGFnatv8VOWyTSZL5Q
 sPup0sUp41AxCWCqdgdjqKUIZX5AavRA/DKO7CCtiYuldLuKdbHlv5X5Ko4/H3mXtDAA
 gGPA==
X-Gm-Message-State: AOAM531XrpVrPhruMPk4xwfMHHGDsE03yEo7aAhWR5BzSHe54tN+FmmO
 oMQP8HOy90qSMOrY+C13u7pgcUfb4YuRlw==
X-Google-Smtp-Source: ABdhPJyw+R5mL5M3jU3cU91lluVqkFwxy8Nw2UtKrKyuF0fnCxk5DJJNKPVH1Bl8ZRV/1Q0ZZTFnAg==
X-Received: by 2002:adf:e809:: with SMTP id o9mr36899276wrm.425.1630492618034; 
 Wed, 01 Sep 2021 03:36:58 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id j207sm5494771wmj.40.2021.09.01.03.36.57
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 01 Sep 2021 03:36:57 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 03/51] hw/intc/arm_gicv3_dist: Rename 64-bit accessors with 'q'
 suffix
Date: Wed,  1 Sep 2021 11:36:05 +0100
Message-Id: <20210901103653.13435-4-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210901103653.13435-1-peter.maydell@linaro.org>
References: <20210901103653.13435-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42f;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42f.google.com
X-Spam_score_int: -1
X-Spam_score: -0.2
X-Spam_bar: /
X-Spam_report: (-0.2 / 5.0 requ) DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Philippe Mathieu-Daudé <philmd@redhat.com>

QEMU load/store API (docs/devel/loads-stores.rst) uses the 'q'
suffix for 64-bit accesses. Rename the current 'll' suffix to
have the GIC dist accessors better match the rest of the codebase.

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Message-id: 20210826180704.2131949-2-philmd@redhat.com
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/intc/arm_gicv3_dist.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/hw/intc/arm_gicv3_dist.c b/hw/intc/arm_gicv3_dist.c
index b65f56f9035..7e9b393d9ab 100644
--- a/hw/intc/arm_gicv3_dist.c
+++ b/hw/intc/arm_gicv3_dist.c
@@ -763,8 +763,8 @@ static MemTxResult gicd_writel(GICv3State *s, hwaddr offset,
     }
 }
 
-static MemTxResult gicd_writell(GICv3State *s, hwaddr offset,
-                                uint64_t value, MemTxAttrs attrs)
+static MemTxResult gicd_writeq(GICv3State *s, hwaddr offset,
+                               uint64_t value, MemTxAttrs attrs)
 {
     /* Our only 64-bit registers are GICD_IROUTER<n> */
     int irq;
@@ -779,8 +779,8 @@ static MemTxResult gicd_writell(GICv3State *s, hwaddr offset,
     }
 }
 
-static MemTxResult gicd_readll(GICv3State *s, hwaddr offset,
-                               uint64_t *data, MemTxAttrs attrs)
+static MemTxResult gicd_readq(GICv3State *s, hwaddr offset,
+                              uint64_t *data, MemTxAttrs attrs)
 {
     /* Our only 64-bit registers are GICD_IROUTER<n> */
     int irq;
@@ -812,7 +812,7 @@ MemTxResult gicv3_dist_read(void *opaque, hwaddr offset, uint64_t *data,
         r = gicd_readl(s, offset, data, attrs);
         break;
     case 8:
-        r = gicd_readll(s, offset, data, attrs);
+        r = gicd_readq(s, offset, data, attrs);
         break;
     default:
         r = MEMTX_ERROR;
@@ -854,7 +854,7 @@ MemTxResult gicv3_dist_write(void *opaque, hwaddr offset, uint64_t data,
         r = gicd_writel(s, offset, data, attrs);
         break;
     case 8:
-        r = gicd_writell(s, offset, data, attrs);
+        r = gicd_writeq(s, offset, data, attrs);
         break;
     default:
         r = MEMTX_ERROR;
-- 
2.20.1


