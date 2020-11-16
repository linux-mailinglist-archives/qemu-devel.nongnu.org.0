Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AABF2B43BD
	for <lists+qemu-devel@lfdr.de>; Mon, 16 Nov 2020 13:30:05 +0100 (CET)
Received: from localhost ([::1]:39756 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kede0-0008H0-6b
	for lists+qemu-devel@lfdr.de; Mon, 16 Nov 2020 07:30:04 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58080)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1kedYo-0001vg-EI
 for qemu-devel@nongnu.org; Mon, 16 Nov 2020 07:24:42 -0500
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435]:34017)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1kedYm-0003CC-D8
 for qemu-devel@nongnu.org; Mon, 16 Nov 2020 07:24:42 -0500
Received: by mail-wr1-x435.google.com with SMTP id r17so18509407wrw.1
 for <qemu-devel@nongnu.org>; Mon, 16 Nov 2020 04:24:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=OUmMobUpj5JXbp+PLsouZvAX3qQPm1cOEtWl7FIgmgA=;
 b=yJAFf4qqdOvgvwzFs6bvcMu9vnX9hnsmc+UxrpNTIqugeXjRxj2R3b1IAPlTZGxcFL
 Qpf7+RYD0ZghQjwQe4P9s+0M1GFAfpy9LYQZo41QrCCcexPE7uitTHuCVJ/mFSISgO7k
 gTFp/xUuZD6nseUlaanCfsIL5fRvKiGGuYYxAnzOPiL9/uIpN014FrUE38gT9Zxroe1Z
 z6giYXLU5K8OKEuSe9gHCoK4qe1h7eLfo087A9sHPVjiIHFjMXv9dKq1j9YZZm5Vbfxg
 hPKm8gO1Bt+j/ALLuPOnZ2mdST3S08i82bpH4wPZEwK8+Af7oYUp0sEDP9MuaRP2G6jS
 ry+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=OUmMobUpj5JXbp+PLsouZvAX3qQPm1cOEtWl7FIgmgA=;
 b=ZK/bheaMPxQPhpBivovRHXlz738egVry4MAzMRkA+88PL9ncwla7hSS3/QwCBvl73V
 3ioZcMTD9jlgUx2KfucEufjeXlDaN5KVCsC2IyadYbbwoPIYE7Q0t1jKucMRltuKkJTj
 dvVjFFBqFJbg22CR3sNGlxzX/9+j51Zky4URXatBuq6QcNw8EtOoZK610mXxGyF0vAFe
 lCpCZp06eP6NOFO3rTA3CxGho7C2uzrroF3l4Kid4gnPuc15yBCSn2vzmm4JCu5+O/2u
 ZiSb3lNckxuuZBnVbxmNHWafd0XyJYMpFzH0E4HXbzY7ZbA1uvee2afMFw62T7fuqLIs
 xsyw==
X-Gm-Message-State: AOAM531vK8nwpGmbyakcGZ9qFxW8bveRzHd3rm0qsq7OOmjV3Azah1rq
 u1H1kmdRwr6+QwgHeg6vioEXnm2JRiyyDA==
X-Google-Smtp-Source: ABdhPJzr9jQpyYIq2xkNLeR2hKgWRuKgwVI4ytoJB1AHcqbwRFdp9ESOfMJ4QMNiao2XaLb/xaiGdA==
X-Received: by 2002:a5d:6992:: with SMTP id g18mr18880546wru.362.1605529478899; 
 Mon, 16 Nov 2020 04:24:38 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id z3sm21650510wrw.87.2020.11.16.04.24.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 Nov 2020 04:24:27 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 6F1551FF93;
 Mon, 16 Nov 2020 12:24:18 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: peter.maydell@linaro.org
Subject: [PULL 7/9] hw/i386/acpi-build: Fix maybe-uninitialized error when
 ACPI hotplug off
Date: Mon, 16 Nov 2020 12:24:15 +0000
Message-Id: <20201116122417.28346-8-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20201116122417.28346-1-alex.bennee@linaro.org>
References: <20201116122417.28346-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::435;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x435.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
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
Cc: Eduardo Habkost <ehabkost@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 Igor Mammedov <imammedo@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Philippe Mathieu-Daudé <philmd@redhat.com>

GCC 9.3.0 thinks that 'method' can be left uninitialized. This code
is already in the "if (bsel || pcihp_bridge_en)" block statement,
but it isn't smart enough to figure it out.

Restrict the code to be used only in the "if (bsel || pcihp_bridge_en)"
block statement to fix (on Ubuntu):

  ../hw/i386/acpi-build.c: In function 'build_append_pci_bus_devices':
  ../hw/i386/acpi-build.c:496:9: error: 'method' may be used uninitialized
  in this function [-Werror=maybe-uninitialized]
    496 |         aml_append(parent_scope, method);
        |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
  cc1: all warnings being treated as errors

Fixes: df4008c9c59 ("piix4: don't reserve hw resources when hotplug is off globally")
Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Igor Mammedov <imammedo@redhat.com>
Message-Id: <20201108204535.2319870-4-philmd@redhat.com>
Message-Id: <20201110192316.26397-8-alex.bennee@linaro.org>

diff --git a/hw/i386/acpi-build.c b/hw/i386/acpi-build.c
index 4f66642d88..1f5c211245 100644
--- a/hw/i386/acpi-build.c
+++ b/hw/i386/acpi-build.c
@@ -465,34 +465,31 @@ static void build_append_pci_bus_devices(Aml *parent_scope, PCIBus *bus,
      */
     if (bsel || pcihp_bridge_en) {
         method = aml_method("PCNT", 0, AML_NOTSERIALIZED);
-    }
-    /* If bus supports hotplug select it and notify about local events */
-    if (bsel) {
-        uint64_t bsel_val = qnum_get_uint(qobject_to(QNum, bsel));
 
-        aml_append(method, aml_store(aml_int(bsel_val), aml_name("BNUM")));
-        aml_append(method,
-            aml_call2("DVNT", aml_name("PCIU"), aml_int(1) /* Device Check */)
-        );
-        aml_append(method,
-            aml_call2("DVNT", aml_name("PCID"), aml_int(3)/* Eject Request */)
-        );
-    }
+        /* If bus supports hotplug select it and notify about local events */
+        if (bsel) {
+            uint64_t bsel_val = qnum_get_uint(qobject_to(QNum, bsel));
 
-    /* Notify about child bus events in any case */
-    if (pcihp_bridge_en) {
-        QLIST_FOREACH(sec, &bus->child, sibling) {
-            int32_t devfn = sec->parent_dev->devfn;
+            aml_append(method, aml_store(aml_int(bsel_val), aml_name("BNUM")));
+            aml_append(method, aml_call2("DVNT", aml_name("PCIU"),
+                                         aml_int(1))); /* Device Check */
+            aml_append(method, aml_call2("DVNT", aml_name("PCID"),
+                                         aml_int(3))); /* Eject Request */
+        }
 
-            if (pci_bus_is_root(sec) || pci_bus_is_express(sec)) {
-                continue;
-            }
+        /* Notify about child bus events in any case */
+        if (pcihp_bridge_en) {
+            QLIST_FOREACH(sec, &bus->child, sibling) {
+                int32_t devfn = sec->parent_dev->devfn;
+
+                if (pci_bus_is_root(sec) || pci_bus_is_express(sec)) {
+                    continue;
+                }
 
-            aml_append(method, aml_name("^S%.02X.PCNT", devfn));
+                aml_append(method, aml_name("^S%.02X.PCNT", devfn));
+            }
         }
-    }
 
-    if (bsel || pcihp_bridge_en) {
         aml_append(parent_scope, method);
     }
     qobject_unref(bsel);
-- 
2.20.1


