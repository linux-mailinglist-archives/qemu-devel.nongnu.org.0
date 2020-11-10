Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8463D2ADF97
	for <lists+qemu-devel@lfdr.de>; Tue, 10 Nov 2020 20:32:56 +0100 (CET)
Received: from localhost ([::1]:55390 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kcZNv-0007KN-0h
	for lists+qemu-devel@lfdr.de; Tue, 10 Nov 2020 14:32:55 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50178)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1kcZEy-0002Vd-Oi
 for qemu-devel@nongnu.org; Tue, 10 Nov 2020 14:23:40 -0500
Received: from mail-wm1-x342.google.com ([2a00:1450:4864:20::342]:34118)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1kcZEr-0007bB-VC
 for qemu-devel@nongnu.org; Tue, 10 Nov 2020 14:23:40 -0500
Received: by mail-wm1-x342.google.com with SMTP id 23so2640745wmg.1
 for <qemu-devel@nongnu.org>; Tue, 10 Nov 2020 11:23:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=NZGUFpHc6p1UXjjAZYXBSVeb29gQwXoQ3S3CSsvSPdw=;
 b=kwUSvW+tKKQKyQL48r4FCx8pLtKb6SgdfQyEd0PQtdc5nQEO+inke66g02nz6lsjm2
 /TKXK1MKbKAn/7FqwMiBVpz33PKYSU0WEa6Kb+I91M/4ZAmavD5o1JmEyUtRyIJipp+q
 HGKeS9G14IfusMx9s7jC7su1IlVwgs5LomCLt6qlYKagDQsXbODnth4ykGbcfKPiMgLy
 dlHdevkwUtBwO4dRUIMKweYTUEcl1iPCHEHwkrG4fGBnrJlxOU2X+Cf6NjMDgiNktp97
 1Z4omdGzaDJopRFXfazzGfaBuWJjiI24Wee1UiDk91ZkAhY98eSGHfr9JqppuPv/stvf
 a2kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=NZGUFpHc6p1UXjjAZYXBSVeb29gQwXoQ3S3CSsvSPdw=;
 b=g+kgho93cjGQxPg4WYDGfOfwscAolz7Ia9ZtvCKqACFKrjKzQDfMtnGNtqJT3xkOjI
 se90CgMuORhyTllYXFGkplz9otKm0tc1/VIjP6wt2QI5vhYSbzqOD6TFYb1qlp7kQ/ns
 UHzdpDvim74TQSCPLJnEeRlXdZdiXuR7+rWdlrDBXD1UacJy/gEKK6buX8bHaRCTO78r
 hvyVSgfW3cAfgj+J407T8pfnPp4Nr22D3Me/qun7Nj69UHDZGdk3ydABa3IdHjsZH1xP
 ybivu//VQmijo+SDeir0hYTWdmNfzIXxt2939FoTXn94QllvNlR5VWc9Idhby04iukXj
 RwCA==
X-Gm-Message-State: AOAM531oVkdJmJhhVxswfdcUAtd0CG2tFPiogaDivrek+Io+Yev3GIUU
 8A4fT+V5VPqD8uxVocYIMzDmyA==
X-Google-Smtp-Source: ABdhPJxRuwcwx6f08ZteIQpj1mo35k3WHS7u8kv+roCQkkiN4iGIYzSGHaB06HcD6YiY0yFq4LksdQ==
X-Received: by 2002:a1c:bbc4:: with SMTP id l187mr703460wmf.133.1605036212593; 
 Tue, 10 Nov 2020 11:23:32 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id o197sm3917557wme.17.2020.11.10.11.23.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 Nov 2020 11:23:24 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id E76D51FF93;
 Tue, 10 Nov 2020 19:23:16 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v1 07/10] hw/i386/acpi-build: Fix maybe-uninitialized error
 when ACPI hotplug off
Date: Tue, 10 Nov 2020 19:23:13 +0000
Message-Id: <20201110192316.26397-8-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20201110192316.26397-1-alex.bennee@linaro.org>
References: <20201110192316.26397-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::342;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x342.google.com
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
Cc: peter.maydell@linaro.org, Eduardo Habkost <ehabkost@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Igor Mammedov <imammedo@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Richard Henderson <rth@twiddle.net>
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
Message-Id: <20201108204535.2319870-4-philmd@redhat.com>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 hw/i386/acpi-build.c | 41 +++++++++++++++++++----------------------
 1 file changed, 19 insertions(+), 22 deletions(-)

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


