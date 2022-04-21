Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 72DC7509F0C
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Apr 2022 13:53:16 +0200 (CEST)
Received: from localhost ([::1]:41470 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nhVN5-0001u8-I2
	for lists+qemu-devel@lfdr.de; Thu, 21 Apr 2022 07:53:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59712)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nhUqW-0003NC-4L
 for qemu-devel@nongnu.org; Thu, 21 Apr 2022 07:19:37 -0400
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433]:45942)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nhUqR-0003Y6-QB
 for qemu-devel@nongnu.org; Thu, 21 Apr 2022 07:19:35 -0400
Received: by mail-wr1-x433.google.com with SMTP id w4so6176410wrg.12
 for <qemu-devel@nongnu.org>; Thu, 21 Apr 2022 04:19:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=dDB/DivYt5DY6348otTzGl2ix/NfxmzFGVdHPWkVBdI=;
 b=WBgqe8q/1zdY+mVF4a7rEp1dSPgWyTIWKfJ94Ma58bP95zIvbGxEHclaPsq5S+5ru+
 zvnrIbANRoWWYTo2YNq/Px4KX04dRU63qs/v64nC2+rP51HNLfmugyDZg+voTkI4/7Mg
 nhexUze/u6aJr2A38yld+qYoIi3OQ3XuWjBUOLOnoC3BrHobsn9Mofm8yH06A8Q6V3Nl
 4EIu6aVK/ixlDrgTDID2ozy3Ed+G3we1YC5Gp9B3Kywd9J+IWM9t3ZypuwsKT7Rc7F6u
 R83uCfjScjPkmqI8cL7/stkg95ztCAef84spGW19nP9tIVPi0s3SYBSAmU8efnxpQNhl
 DXtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=dDB/DivYt5DY6348otTzGl2ix/NfxmzFGVdHPWkVBdI=;
 b=nEMPNqGFcRSZ4z1UNzFYlLBNnEHAHqBRInPKmq2p9q3PKRD6HELl68NdGiNRW1+Ghw
 WpFWWYYqvPB+Lj8Lw/2ihs92U710mL1SbZTYrXco+6+1lIwbhzgwrsEDRWAi6TAvZI22
 3ykml7B6ntLHKqSva5JYP3b0JxfzEW0Yyx8B/cXTdGB6rRX2rbpW4e4TQsQ9jAjKk1LM
 IkL2jwGJnhvYj/XZUWIaPydQwxuu5ExGFuzt12M9/Rz2YYbrK2+8LUVGd/z0Gb2tg6sZ
 eP7xz+d3GFXSXSn+zA4Mxo6kqDZdTZSWpisqSnT+YOi5qdIwel19TQ09ekDUA81ZAAHf
 M8wA==
X-Gm-Message-State: AOAM530XPyUcvV8Ke/GgIVSwADO9G36tqrcTn45vyfMzlEhhchtraTT4
 cTD5SFkz6onVfZJOgB5s805d7L0Pc8M+ZA==
X-Google-Smtp-Source: ABdhPJxBxxjYQPpAG7pfaMgzw157/giI84DMTD6e1YAO62pVD6+Pq0/5jkOBE+HrfaMU70vfq0wKzg==
X-Received: by 2002:a05:6000:2ac:b0:20a:77c1:c64f with SMTP id
 l12-20020a05600002ac00b0020a77c1c64fmr18914416wry.588.1650539955088; 
 Thu, 21 Apr 2022 04:19:15 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 e4-20020a5d6d04000000b0020a8bbbb72bsm2597694wrq.97.2022.04.21.04.19.14
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 21 Apr 2022 04:19:14 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 28/31] hw/core/irq: remove unused 'qemu_irq_split' function
Date: Thu, 21 Apr 2022 12:18:43 +0100
Message-Id: <20220421111846.2011565-29-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220421111846.2011565-1-peter.maydell@linaro.org>
References: <20220421111846.2011565-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::433;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x433.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Zongyuan Li <zongyuan.li@smartx.com>

Signed-off-by: Zongyuan Li <zongyuan.li@smartx.com>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Message-id: 20220324181557.203805-5-zongyuan.li@smartx.com
Resolves: https://gitlab.com/qemu-project/qemu/-/issues/811
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 include/hw/irq.h |  5 -----
 hw/core/irq.c    | 15 ---------------
 2 files changed, 20 deletions(-)

diff --git a/include/hw/irq.h b/include/hw/irq.h
index dc7abf199e3..645b73d2512 100644
--- a/include/hw/irq.h
+++ b/include/hw/irq.h
@@ -46,11 +46,6 @@ void qemu_free_irq(qemu_irq irq);
 /* Returns a new IRQ with opposite polarity.  */
 qemu_irq qemu_irq_invert(qemu_irq irq);
 
-/* Returns a new IRQ which feeds into both the passed IRQs.
- * It's probably better to use the TYPE_SPLIT_IRQ device instead.
- */
-qemu_irq qemu_irq_split(qemu_irq irq1, qemu_irq irq2);
-
 /* For internal use in qtest.  Similar to qemu_irq_split, but operating
    on an existing vector of qemu_irq.  */
 void qemu_irq_intercept_in(qemu_irq *gpio_in, qemu_irq_handler handler, int n);
diff --git a/hw/core/irq.c b/hw/core/irq.c
index 741219277b1..3623f711fe6 100644
--- a/hw/core/irq.c
+++ b/hw/core/irq.c
@@ -106,21 +106,6 @@ qemu_irq qemu_irq_invert(qemu_irq irq)
     return qemu_allocate_irq(qemu_notirq, irq, 0);
 }
 
-static void qemu_splitirq(void *opaque, int line, int level)
-{
-    struct IRQState **irq = opaque;
-    irq[0]->handler(irq[0]->opaque, irq[0]->n, level);
-    irq[1]->handler(irq[1]->opaque, irq[1]->n, level);
-}
-
-qemu_irq qemu_irq_split(qemu_irq irq1, qemu_irq irq2)
-{
-    qemu_irq *s = g_new0(qemu_irq, 2);
-    s[0] = irq1;
-    s[1] = irq2;
-    return qemu_allocate_irq(qemu_splitirq, s, 0);
-}
-
 void qemu_irq_intercept_in(qemu_irq *gpio_in, qemu_irq_handler handler, int n)
 {
     int i;
-- 
2.25.1


