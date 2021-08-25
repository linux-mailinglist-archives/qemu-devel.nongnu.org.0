Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2098E3F73F9
	for <lists+qemu-devel@lfdr.de>; Wed, 25 Aug 2021 13:03:28 +0200 (CEST)
Received: from localhost ([::1]:60594 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mIqgp-00017S-5i
	for lists+qemu-devel@lfdr.de; Wed, 25 Aug 2021 07:03:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49176)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mIqGZ-00058i-Q5
 for qemu-devel@nongnu.org; Wed, 25 Aug 2021 06:36:19 -0400
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d]:36680)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mIqGS-0005g3-Ul
 for qemu-devel@nongnu.org; Wed, 25 Aug 2021 06:36:19 -0400
Received: by mail-wr1-x42d.google.com with SMTP id q14so1525898wrp.3
 for <qemu-devel@nongnu.org>; Wed, 25 Aug 2021 03:36:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=7aydmPw1AXLOUQd24DIqYVnzOLGoGypnBxuU2CTMgJo=;
 b=hXnomgKW+XHDOdCDQsugbPK1G0YCzi7LfoP1FxGUCumKWMcECQikxJ5N0oJ3k0MCnL
 rEuwxs9mWKnjoWUxKPbbv1/7e/E8rOzXKRKoNsDicDyCF05XEjkejIjd1YARwzQBn991
 ZYMQM6AnEpe2J1NXq1lQNP9aNNreglM2KTho+9v2hHyt0Mrjb4xdoexRMy7Y4Cqrd4Cg
 IpEEl3Ps3jrALbYKzU/6wNZeMma3CbbOwJ8eGfvqa8xq6vajJ5qGgbeONialnYiv7082
 bCIiCh5OwMVVCrRMLTf+GJ1iuXvriwGDVPr/pysEGlyZIlPC+KzAgs8qAvB2jENHycbZ
 gh3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=7aydmPw1AXLOUQd24DIqYVnzOLGoGypnBxuU2CTMgJo=;
 b=kIc51EsQdiDm0HIyzD/CIzUenqtbh4qRv4tVf8i7fAopQHio8mTApg8NwwR1ATcvvK
 +2NBKGKxR4tMzXzf851rY2Soj+QX/WfQHVDdjkv/EdWk2udZ0XC5qhnoqdUpk8IobdMd
 SRBuMW6Lz/TWWe16I6tcVU8pkQ2SWkO5W+zZ/8jArMZSO3GXiYxvMAxcnKMhNw5c1apK
 +8O/BhHdT8NZ8Loadh5RhpfTAN8XHbXngW4fr3+KYReIiiMDKRFJJxVkTBfn5kGWHwAY
 GKWeuTSumVBDfEF2WjVUbKATinc0oYimakvPXa9f1s5v+MXnirsLwOU1fbKEt0v/jlK+
 Czzg==
X-Gm-Message-State: AOAM531TpeR+88hD+c/E401D0bzZNbhPjGhiXHpB8i141XMqHACWEmkN
 8IBfZY9tvQTq/LrFrzNXiLAQKGOjNO7g5A==
X-Google-Smtp-Source: ABdhPJy5z2u9KOQtR6FCA4uAWFhhhcMM+Nfu2vmWldkymsXSqcXlftiOZkD8RxQO17L2LPG7aKRBiA==
X-Received: by 2002:adf:fcc5:: with SMTP id f5mr25048052wrs.114.1629887771514; 
 Wed, 25 Aug 2021 03:36:11 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id m4sm5075931wml.28.2021.08.25.03.36.10
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 25 Aug 2021 03:36:11 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 42/44] sbsa-ref: Rename SBSA_GWDT enum value
Date: Wed, 25 Aug 2021 11:35:32 +0100
Message-Id: <20210825103534.6936-43-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210825103534.6936-1-peter.maydell@linaro.org>
References: <20210825103534.6936-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42d;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42d.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Eduardo Habkost <ehabkost@redhat.com>

The SBSA_GWDT enum value conflicts with the SBSA_GWDT() QOM type
checking helper, preventing us from using a OBJECT_DEFINE* or
DEFINE_INSTANCE_CHECKER macro for the SBSA_GWDT() wrapper.

If I understand the SBSA 6.0 specification correctly, the signal
being connected to IRQ 16 is the WS0 output signal from the
Generic Watchdog.  Rename the enum value to SBSA_GWDT_WS0 to be
more explicit and avoid the name conflict.

Signed-off-by: Eduardo Habkost <ehabkost@redhat.com>
Message-id: 20210806023119.431680-1-ehabkost@redhat.com
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/arm/sbsa-ref.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/hw/arm/sbsa-ref.c b/hw/arm/sbsa-ref.c
index c1629df6031..509c5f09b4e 100644
--- a/hw/arm/sbsa-ref.c
+++ b/hw/arm/sbsa-ref.c
@@ -65,7 +65,7 @@ enum {
     SBSA_GIC_DIST,
     SBSA_GIC_REDIST,
     SBSA_SECURE_EC,
-    SBSA_GWDT,
+    SBSA_GWDT_WS0,
     SBSA_GWDT_REFRESH,
     SBSA_GWDT_CONTROL,
     SBSA_SMMU,
@@ -140,7 +140,7 @@ static const int sbsa_ref_irqmap[] = {
     [SBSA_AHCI] = 10,
     [SBSA_EHCI] = 11,
     [SBSA_SMMU] = 12, /* ... to 15 */
-    [SBSA_GWDT] = 16,
+    [SBSA_GWDT_WS0] = 16,
 };
 
 static const char * const valid_cpus[] = {
@@ -481,7 +481,7 @@ static void create_wdt(const SBSAMachineState *sms)
     hwaddr cbase = sbsa_ref_memmap[SBSA_GWDT_CONTROL].base;
     DeviceState *dev = qdev_new(TYPE_WDT_SBSA);
     SysBusDevice *s = SYS_BUS_DEVICE(dev);
-    int irq = sbsa_ref_irqmap[SBSA_GWDT];
+    int irq = sbsa_ref_irqmap[SBSA_GWDT_WS0];
 
     sysbus_realize_and_unref(s, &error_fatal);
     sysbus_mmio_map(s, 0, rbase);
-- 
2.20.1


