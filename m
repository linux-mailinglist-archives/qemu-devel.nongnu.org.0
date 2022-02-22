Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CCB234C02C2
	for <lists+qemu-devel@lfdr.de>; Tue, 22 Feb 2022 21:02:00 +0100 (CET)
Received: from localhost ([::1]:55076 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nMbMF-0001bO-Tj
	for lists+qemu-devel@lfdr.de; Tue, 22 Feb 2022 15:01:59 -0500
Received: from eggs.gnu.org ([209.51.188.92]:46944)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1nMawN-0003R1-V7
 for qemu-devel@nongnu.org; Tue, 22 Feb 2022 14:35:17 -0500
Received: from [2a00:1450:4864:20::62c] (port=39823
 helo=mail-ej1-x62c.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1nMawM-00075b-5F
 for qemu-devel@nongnu.org; Tue, 22 Feb 2022 14:35:15 -0500
Received: by mail-ej1-x62c.google.com with SMTP id p9so46083933ejd.6
 for <qemu-devel@nongnu.org>; Tue, 22 Feb 2022 11:35:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=0PkugM/nmdz5ZSPWNwtFAXt+z4ki/4C47OuH3ieIYfs=;
 b=KhwDai9vdDS9RJjORTQz1DQ4dSsWAoXoG5We0FHGklr5NBzgQxpzDD0bHllTdlwyxM
 TDhMHG2WA8Tsm0Wk8YPX2QtPaYOPwFoS91fjkevq5cykcANMtL7JD4YA9eQAhQjSwOEq
 BPXKD/Q/F+uQ0IviIk5vuzQSjAGyC4OQqEvS2h8PiiqX9MBeoq6zoiaHd4MdHx83lVMv
 sm9RGVfwiuoy3C99fBpF4W4T5gef9jAJr9p9S0m6mAwFuClvR0vQghUNBZlKBW4y0AuA
 L+dZyA7oZel4RvHu6ugSoBKLHN36pgKcox7BtnrCjmTPrg3j5QIGaA5IbFKKf/uaR5XV
 51ZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=0PkugM/nmdz5ZSPWNwtFAXt+z4ki/4C47OuH3ieIYfs=;
 b=61/WGtVx+K4lMObYwdw4HUTTMXiw5uOEUd1A0L896Z5WCRVIaRz0SSvEQo3nL86rEC
 PYj/s6e6O5sgcAPtmM9gHR9KLgmzk/xNbOp6hJIdLBFVYFMxK3uboWYqxIP6oN0HE0ub
 YUY26vcSYaU3VC20mBKJ6Uc/0JPPC77KyDmzToMNuSDcs1ng1/+F9ITvwrdIvoKu/J1F
 uo48718/8G6IRXYuvxcwmjqhE6jHQCuw6io9MX4czq4MIzEfwH1xhhy3ev77UG8wcX/4
 izl8pa6U4eVhKxcmSd6SuKMFLhEImahpVhsOlzXL+HEBGvlekbGkqy7QOOdo+oX+wawR
 B0Ig==
X-Gm-Message-State: AOAM530nlJHD0uCnvs3iku68NNCSPi78Mb1Wus9o8AJybtHNn5afwQ6M
 dVBE92R/4QdFpBxqSR9/MaBXji3O1QE=
X-Google-Smtp-Source: ABdhPJxO+t27yi7W6jlmgeN+bikA1EqtYyUHjBQLiPxOYA21dKgH4z5SoisAizzO4JOv1JRRy3dmgg==
X-Received: by 2002:a17:906:c12:b0:6cd:795c:9803 with SMTP id
 s18-20020a1709060c1200b006cd795c9803mr22023651ejf.593.1645558512666; 
 Tue, 22 Feb 2022 11:35:12 -0800 (PST)
Received: from Provence.localdomain
 (dynamic-089-012-227-088.89.12.pool.telefonica.de. [89.12.227.88])
 by smtp.gmail.com with ESMTPSA id i1sm766532edj.84.2022.02.22.11.35.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 22 Feb 2022 11:35:12 -0800 (PST)
From: Bernhard Beschow <shentey@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 22/22] isa: Remove unused isa_init_irq()
Date: Tue, 22 Feb 2022 20:34:46 +0100
Message-Id: <20220222193446.156717-23-shentey@gmail.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220222193446.156717-1-shentey@gmail.com>
References: <20220222193446.156717-1-shentey@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::62c
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::62c;
 envelope-from=shentey@gmail.com; helo=mail-ej1-x62c.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: Bernhard Beschow <shentey@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

isa_init_irq() had become a trivial one-line wrapper for isa_get_irq().
The previous commits resolved all usages in favor of isa_get_irq().
isa_init_irq() can therefore be removed.

Signed-off-by: Bernhard Beschow <shentey@gmail.com>
---
 hw/isa/isa-bus.c     | 5 -----
 include/hw/isa/isa.h | 1 -
 2 files changed, 6 deletions(-)

diff --git a/hw/isa/isa-bus.c b/hw/isa/isa-bus.c
index 1e8c102177..0ad1c5fd65 100644
--- a/hw/isa/isa-bus.c
+++ b/hw/isa/isa-bus.c
@@ -85,11 +85,6 @@ qemu_irq isa_get_irq(ISADevice *dev, unsigned isairq)
     return isabus->irqs[isairq];
 }
 
-void isa_init_irq(ISADevice *dev, qemu_irq *p, unsigned isairq)
-{
-    *p = isa_get_irq(dev, isairq);
-}
-
 void isa_connect_gpio_out(ISADevice *isadev, int gpioirq, unsigned isairq)
 {
     qemu_irq irq = isa_get_irq(isadev, isairq);
diff --git a/include/hw/isa/isa.h b/include/hw/isa/isa.h
index d80cab5b79..034d706ba1 100644
--- a/include/hw/isa/isa.h
+++ b/include/hw/isa/isa.h
@@ -90,7 +90,6 @@ ISABus *isa_bus_new(DeviceState *dev, MemoryRegion *address_space,
                     MemoryRegion *address_space_io, Error **errp);
 void isa_bus_irqs(ISABus *bus, qemu_irq *irqs);
 qemu_irq isa_get_irq(ISADevice *dev, unsigned isairq);
-void isa_init_irq(ISADevice *dev, qemu_irq *p, unsigned isairq);
 void isa_connect_gpio_out(ISADevice *isadev, int gpioirq, unsigned isairq);
 void isa_bus_dma(ISABus *bus, IsaDma *dma8, IsaDma *dma16);
 IsaDma *isa_get_dma(ISABus *bus, int nchan);
-- 
2.35.1


