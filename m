Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C01B4BD8B2
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Feb 2022 10:52:58 +0100 (CET)
Received: from localhost ([::1]:49510 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nM5NI-0000z5-W7
	for lists+qemu-devel@lfdr.de; Mon, 21 Feb 2022 04:52:57 -0500
Received: from eggs.gnu.org ([209.51.188.92]:44024)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nM4zZ-0008Je-FW
 for qemu-devel@nongnu.org; Mon, 21 Feb 2022 04:28:25 -0500
Received: from [2a00:1450:4864:20::331] (port=38468
 helo=mail-wm1-x331.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nM4zQ-00012B-01
 for qemu-devel@nongnu.org; Mon, 21 Feb 2022 04:28:17 -0500
Received: by mail-wm1-x331.google.com with SMTP id
 k127-20020a1ca185000000b0037bc4be8713so13069410wme.3
 for <qemu-devel@nongnu.org>; Mon, 21 Feb 2022 01:28:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=aSTeDwPaqQEtMzC2ib6lB1DqSTk7wFZjV/NwlrctUvU=;
 b=VwvD+e6YYlNpw7aZujS0iO3BOQzbcwCDe5Aaml85cHtOgwFtIttgcVySu1SykLUWvD
 8Vs0YfiRQHBpvoPN7XJx8cpDx0OCmwUMLrecuovnfSmNBsr50wu2IvGqEn8W2pjmKEWr
 z/blQGsgiGnBcnAnmh8dKPvIKR1xvPfZdzc+zdh0zUo/q76baGsPCF2L9lb0LXuDhz/I
 tGfUUxRk9pe/1NesHb7EOiz1792Y23TXW9xIycoijLByEH6xcAmRMOL8yZ+tuJPQLVOu
 vZTohJtD6NybYDwCq9yaEd7ZK3Mhgzpxs/VdEYL6h7PkJWe4CreG+6HQ9nBadC5E+0dY
 uFGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=aSTeDwPaqQEtMzC2ib6lB1DqSTk7wFZjV/NwlrctUvU=;
 b=kBkj3mxp7bK8xkCD1M3VQNdwf6QAotx8Jlc6SsgSMgnHmUzQjeZDyEgfnihflsKO9O
 IFvdZpVnu3cpFppwXrwdUwfk76GOHa3R8A5/pZUoId/FXOIcNMAfHs06tu0iimFgG4oC
 8XoSk5zvriOF9U2o72zzWHyLVE/XiJdmbg34HUmpqIZfrAK5gDxPa5FGIZQnTHB6R+SP
 Coj5ZMSSOs7gRi1R5yk9vwayYfo/ycxkGi+QEa+kNdjBxBX/ucODT5KDKDcotYhimxzm
 3FN2pxqZES5WCheXVbeeKJL56s+XTI17ItkEIGCSmYz5E5eT6qrFXLjtnN/ODSTyZKC7
 CaXQ==
X-Gm-Message-State: AOAM532zO65Ls9uoa9YPs776rZh1loDxz+5xsHK8tx9JNOX5KySl+A3j
 /31DbTKQiVH2uVEcy42Ct9OHTgj1nUv6Cg==
X-Google-Smtp-Source: ABdhPJz4/M9OisADGbvP2CUPJ4xrKUqCEJoD0a+i6xCisZY944Nom6tDfJt9Eg3ZXtpgmRCS7RYubQ==
X-Received: by 2002:a05:600c:3d13:b0:37b:b8e5:ed80 with SMTP id
 bh19-20020a05600c3d1300b0037bb8e5ed80mr20136491wmb.183.1645435694690; 
 Mon, 21 Feb 2022 01:28:14 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id q76sm7555778wme.1.2022.02.21.01.28.14
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 21 Feb 2022 01:28:14 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 15/26] hw/arm/armv7m: Handle disconnected clock inputs
Date: Mon, 21 Feb 2022 09:27:49 +0000
Message-Id: <20220221092800.404870-16-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220221092800.404870-1-peter.maydell@linaro.org>
References: <20220221092800.404870-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::331
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::331;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x331.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

In the armv7m object, handle clock inputs that aren't connected.
This is always an error for 'cpuclk'. For 'refclk' it is OK for this
to be disconnected, but we need to handle it by not trying to connect
a sourceless-clock to the systick device.

This fixes a bug where on the mps2-an521 and similar boards (which
do not have a refclk) the systick device incorrectly reset with
SYST_CSR.CLKSOURCE 0 ("use refclk") rather than 1 ("use CPU clock").

Cc: qemu-stable@nongnu.org
Reported-by: Richard Petri <git@rpls.de>
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-id: 20220208171643.3486277-1-peter.maydell@linaro.org
---
 hw/arm/armv7m.c | 26 ++++++++++++++++++++++----
 1 file changed, 22 insertions(+), 4 deletions(-)

diff --git a/hw/arm/armv7m.c b/hw/arm/armv7m.c
index ceb76df3cd4..41cfca0f223 100644
--- a/hw/arm/armv7m.c
+++ b/hw/arm/armv7m.c
@@ -284,6 +284,12 @@ static void armv7m_realize(DeviceState *dev, Error **errp)
         return;
     }
 
+    /* cpuclk must be connected; refclk is optional */
+    if (!clock_has_source(s->cpuclk)) {
+        error_setg(errp, "armv7m: cpuclk must be connected");
+        return;
+    }
+
     memory_region_add_subregion_overlap(&s->container, 0, s->board_memory, -1);
 
     s->cpu = ARM_CPU(object_new_with_props(s->cpu_type, OBJECT(s), "cpu",
@@ -420,8 +426,18 @@ static void armv7m_realize(DeviceState *dev, Error **errp)
                                     &s->sysreg_ns_mem);
     }
 
-    /* Create and map the systick devices */
-    qdev_connect_clock_in(DEVICE(&s->systick[M_REG_NS]), "refclk", s->refclk);
+    /*
+     * Create and map the systick devices. Note that we only connect
+     * refclk if it has been connected to us; otherwise the systick
+     * device gets the wrong answer for clock_has_source(refclk), because
+     * it has an immediate source (the ARMv7M's clock object) but not
+     * an ultimate source, and then it won't correctly auto-select the
+     * CPU clock as its only possible clock source.
+     */
+    if (clock_has_source(s->refclk)) {
+        qdev_connect_clock_in(DEVICE(&s->systick[M_REG_NS]), "refclk",
+                              s->refclk);
+    }
     qdev_connect_clock_in(DEVICE(&s->systick[M_REG_NS]), "cpuclk", s->cpuclk);
     if (!sysbus_realize(SYS_BUS_DEVICE(&s->systick[M_REG_NS]), errp)) {
         return;
@@ -438,8 +454,10 @@ static void armv7m_realize(DeviceState *dev, Error **errp)
          */
         object_initialize_child(OBJECT(dev), "systick-reg-s",
                                 &s->systick[M_REG_S], TYPE_SYSTICK);
-        qdev_connect_clock_in(DEVICE(&s->systick[M_REG_S]), "refclk",
-                              s->refclk);
+        if (clock_has_source(s->refclk)) {
+            qdev_connect_clock_in(DEVICE(&s->systick[M_REG_S]), "refclk",
+                                  s->refclk);
+        }
         qdev_connect_clock_in(DEVICE(&s->systick[M_REG_S]), "cpuclk",
                               s->cpuclk);
 
-- 
2.25.1


