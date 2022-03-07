Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 38DB64CFC3A
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Mar 2022 12:06:35 +0100 (CET)
Received: from localhost ([::1]:46334 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nRBCE-0003Ng-AC
	for lists+qemu-devel@lfdr.de; Mon, 07 Mar 2022 06:06:34 -0500
Received: from eggs.gnu.org ([209.51.188.92]:37520)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nRAMT-0004Gz-7q
 for qemu-devel@nongnu.org; Mon, 07 Mar 2022 05:13:05 -0500
Received: from [2a00:1450:4864:20::429] (port=35499
 helo=mail-wr1-x429.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nRAMR-0004Mq-Qu
 for qemu-devel@nongnu.org; Mon, 07 Mar 2022 05:13:04 -0500
Received: by mail-wr1-x429.google.com with SMTP id b5so22399059wrr.2
 for <qemu-devel@nongnu.org>; Mon, 07 Mar 2022 02:13:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=uOlBtYjfRkygbNbkO0nMqqr60G0oqcOJiqgel0P1B+U=;
 b=KG1XNh24sGZyE36kUKRiPCwR1n2TbDJCRhkEbxuqcFX1Kq2HX0XWvRKVZClwgLb7uB
 GaRf6PTTVHXfJ3JQ1Ei6hkfm7Fjt1k/onltvzWDRUwvpp4gvLXQc89jnKdsdLZqjUhl/
 lHC0KeV5vHUJHjpr/xsFBpHMv0wAzJbG1oJ42lgOGg64JmEPJHofZxilPXve9Arfyq1w
 QJniHXjXVDYHKX8o/K7CuQ95KKKpBFnKSWcYHK0DxbLyU0k4xjtkah7YImFq7hnezmlL
 ntMMTQEwdmKhmTuh0X6eixBUA/lUF4ebWLwNUmpTa80iFurnHJiN2zbmjDRagBHSordd
 A6BA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=uOlBtYjfRkygbNbkO0nMqqr60G0oqcOJiqgel0P1B+U=;
 b=8FHflcsAhlcmaaVfLR34hlB0kOwTvk1pHc2xE1fjrOPEkxvD44cb/2SM74x9Q1/PMv
 aPnktpS8/wGeRAXplrfhMg58aYnnyriEMj2mUrDh3R+BytuYQ04ba98uAJluxcqJwfEJ
 Rk22wVdnHHfvMSArE/zvF8HlksiW3L2P/kde5okRfxopeO+4uPKldfiKontZqeW95omV
 Bd3zFY6CACaU4Pq3zZrLmElFtGObTXoW9w6wcVu21hTScpP5UfGeTLGw/UHabEE8A0eX
 xnZJlHQAqxWJ/2B/EWr0NRDDAdiw6kX08IEcyPhBNlXbDTKWKXmJw8P2GAOiL3mfJG27
 Wp6w==
X-Gm-Message-State: AOAM530Bmj5xvlPbRjZRIH4FWEhySmox5KzsasDiM39kOwq2+YR6txSX
 aNA8Ym2Lza/npq/6d4h9wCuA9OwK/e0=
X-Google-Smtp-Source: ABdhPJyNADngVxqrM5ZMqcIAU0BfVhPfY/n2HCLFZB96s0IK36Po+O4hHsp+5/T8dkv+XsIfDS1K/A==
X-Received: by 2002:adf:ed0c:0:b0:1f0:63a5:36aa with SMTP id
 a12-20020adfed0c000000b001f063a536aamr7699378wro.588.1646647982101; 
 Mon, 07 Mar 2022 02:13:02 -0800 (PST)
Received: from localhost.localdomain ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 i4-20020a05600c354400b003899f5a8195sm4839033wmq.32.2022.03.07.02.13.01
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 07 Mar 2022 02:13:01 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?=
 <philippe.mathieu.daude@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PULL 11/16] hw/rtc/m48t59-isa: QOM'ify IRQ number
Date: Mon,  7 Mar 2022 11:12:02 +0100
Message-Id: <20220307101207.90369-12-philippe.mathieu.daude@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220307101207.90369-1-philippe.mathieu.daude@gmail.com>
References: <20220307101207.90369-1-philippe.mathieu.daude@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::429
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::429;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x429.google.com
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
Cc: Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Bernhard Beschow <shentey@gmail.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Bernhard Beschow <shentey@gmail.com>

Exposing the IRQ number as a QOM property not only allows it to be
configurable but also to be printed by standard QOM mechanisms. This allows
isabus_dev_print() to be retired eventually.

Signed-off-by: Bernhard Beschow <shentey@gmail.com>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Message-Id: <20220301220037.76555-3-shentey@gmail.com>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/rtc/m48t59-isa.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/hw/rtc/m48t59-isa.c b/hw/rtc/m48t59-isa.c
index dc21fb10a5..e9086eada4 100644
--- a/hw/rtc/m48t59-isa.c
+++ b/hw/rtc/m48t59-isa.c
@@ -42,6 +42,7 @@ struct M48txxISAState {
     ISADevice parent_obj;
     M48t59State state;
     uint32_t io_base;
+    uint8_t isairq;
     MemoryRegion io;
 };
 
@@ -79,6 +80,7 @@ static void m48txx_isa_toggle_lock(Nvram *obj, int lock)
 static Property m48t59_isa_properties[] = {
     DEFINE_PROP_INT32("base-year", M48txxISAState, state.base_year, 0),
     DEFINE_PROP_UINT32("iobase", M48txxISAState, io_base, 0x74),
+    DEFINE_PROP_UINT8("irq", M48txxISAState, isairq, 8),
     DEFINE_PROP_END_OF_LIST(),
 };
 
@@ -97,9 +99,14 @@ static void m48t59_isa_realize(DeviceState *dev, Error **errp)
     M48txxISAState *d = M48TXX_ISA(dev);
     M48t59State *s = &d->state;
 
+    if (d->isairq >= ISA_NUM_IRQS) {
+        error_setg(errp, "Maximum value for \"irq\" is: %u", ISA_NUM_IRQS - 1);
+        return;
+    }
+
     s->model = u->info.model;
     s->size = u->info.size;
-    isa_init_irq(isadev, &s->IRQ, 8);
+    isa_init_irq(isadev, &s->IRQ, d->isairq);
     m48t59_realize_common(s, errp);
     memory_region_init_io(&d->io, OBJECT(dev), &m48t59_io_ops, s, "m48t59", 4);
     if (d->io_base != 0) {
-- 
2.34.1


