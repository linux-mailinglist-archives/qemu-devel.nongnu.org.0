Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 20F9D6A43E8
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Feb 2023 15:13:11 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pWe57-000234-4F; Mon, 27 Feb 2023 09:02:21 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pWe4R-0000pi-2E
 for qemu-devel@nongnu.org; Mon, 27 Feb 2023 09:01:46 -0500
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pWe4O-0007at-PT
 for qemu-devel@nongnu.org; Mon, 27 Feb 2023 09:01:38 -0500
Received: by mail-wm1-x32a.google.com with SMTP id
 j19-20020a05600c1c1300b003e9b564fae9so7244782wms.2
 for <qemu-devel@nongnu.org>; Mon, 27 Feb 2023 06:01:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=ABw6Fx7bvROh29XWw3RjhC64oEfI8tf4qJj38BnQL70=;
 b=IHNhWW1nPJp1x+JsdMTC/DS7cfoXtSfW9EulLFGyKR4XXpZNqI+A93av3I75VEqM3l
 cBQF9j6ph3eYwapXxt8W+X4u6Ssg6aoxklXy+WB6SdVNb3cTYEBNvOEEJrZHyigg7Pwp
 wanz4klSsKLag6vnqE7P7CHw8eAG6I+H9MaiR00i+Wiw9Tu3PWnhqLHJota8b5QNv+eF
 QdTWeu737K8DjQEgqz78kFbfg1e8LxAc/6HBkvaSS6FuuOx6o+pnDHAycgp0T6cBKwHu
 1pYY6akByTti6pA+vXZNPuVOnSwPqcC5euuTq4L0JiXS1zDgjTBTcCdWDUIU79WVNbRk
 xCPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ABw6Fx7bvROh29XWw3RjhC64oEfI8tf4qJj38BnQL70=;
 b=RgEYVgXJJM79NCayFNmsIZ7sYNHwJwxkjDVWbycmsbiTyySyEpdfie7JJEDWhPnVbz
 7Z5VXyIqkmb35YtSQ40jILSjPLGykUOR+dhhde4Bldxi/xVVQgI+rJKwFLlh8RYz1t0K
 hSRICqQ8cROQCNPJnwak8pqeptbI3YuDAfg4ITw2n+PNz0JSu8rvrF6zHycF2oaD56JD
 k9W25yfrzMJX1sJTK0aj9WytgyvxjaL5LPntJaDoQjwWjba63JOCMEsq3TgCd9kOqeau
 Y1yaZ0wkkZejfouXcSkJdc9DnAQGNVoj2WE0i7kKeMns4y+wpR/lcQqGon2ps8esIeWX
 njyg==
X-Gm-Message-State: AO0yUKXeeDVWep1zlHWaF1eS3juWXKE/QSDbSQsPjYH//qsE/HeSuv95
 bcbvSu9oPgOfdzCwoHGPCgxJERisW/BfgorJ
X-Google-Smtp-Source: AK7set+pdo75a2l0qAnuSMecCvVsrjxvW1YpT2f9HtjY0rIjoExpNas/NurZ0lA8sg6dojDDeJxYCA==
X-Received: by 2002:a05:600c:1616:b0:3eb:383c:187d with SMTP id
 m22-20020a05600c161600b003eb383c187dmr5457148wmn.27.1677506495931; 
 Mon, 27 Feb 2023 06:01:35 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 s9-20020a5d4249000000b002c5598c14acsm7158514wrr.6.2023.02.27.06.01.34
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Feb 2023 06:01:34 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 23/25] hw/irq: Declare QOM macros using
 OBJECT_DECLARE_SIMPLE_TYPE()
Date: Mon, 27 Feb 2023 14:01:00 +0000
Message-Id: <20230227140102.3712344-24-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230227140102.3712344-1-peter.maydell@linaro.org>
References: <20230227140102.3712344-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32a;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

From: Philippe Mathieu-Daudé <philmd@linaro.org>

QOM *DECLARE* macros expect a typedef as first argument,
not a structure. Replace 'struct IRQState' by 'IRQState'
to avoid when modifying the macros:

  ../hw/core/irq.c:29:1: error: declaration of anonymous struct must be a definition
  DECLARE_INSTANCE_CHECKER(struct IRQState, IRQ,
  ^

Use OBJECT_DECLARE_SIMPLE_TYPE instead of DECLARE_INSTANCE_CHECKER.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Message-id: 20230113200138.52869-3-philmd@linaro.org
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/core/irq.c | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/hw/core/irq.c b/hw/core/irq.c
index 3623f711fe6..3f14e2dda74 100644
--- a/hw/core/irq.c
+++ b/hw/core/irq.c
@@ -26,8 +26,7 @@
 #include "hw/irq.h"
 #include "qom/object.h"
 
-DECLARE_INSTANCE_CHECKER(struct IRQState, IRQ,
-                         TYPE_IRQ)
+OBJECT_DECLARE_SIMPLE_TYPE(IRQState, IRQ)
 
 struct IRQState {
     Object parent_obj;
@@ -68,7 +67,7 @@ qemu_irq *qemu_allocate_irqs(qemu_irq_handler handler, void *opaque, int n)
 
 qemu_irq qemu_allocate_irq(qemu_irq_handler handler, void *opaque, int n)
 {
-    struct IRQState *irq;
+    IRQState *irq;
 
     irq = IRQ(object_new(TYPE_IRQ));
     irq->handler = handler;
@@ -94,7 +93,7 @@ void qemu_free_irq(qemu_irq irq)
 
 static void qemu_notirq(void *opaque, int line, int level)
 {
-    struct IRQState *irq = opaque;
+    IRQState *irq = opaque;
 
     irq->handler(irq->opaque, irq->n, !level);
 }
@@ -120,7 +119,7 @@ void qemu_irq_intercept_in(qemu_irq *gpio_in, qemu_irq_handler handler, int n)
 static const TypeInfo irq_type_info = {
    .name = TYPE_IRQ,
    .parent = TYPE_OBJECT,
-   .instance_size = sizeof(struct IRQState),
+   .instance_size = sizeof(IRQState),
 };
 
 static void irq_register_types(void)
-- 
2.34.1


