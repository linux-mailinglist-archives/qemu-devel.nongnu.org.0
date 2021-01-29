Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BCA07308805
	for <lists+qemu-devel@lfdr.de>; Fri, 29 Jan 2021 12:03:01 +0100 (CET)
Received: from localhost ([::1]:34298 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l5RYK-0006B0-MI
	for lists+qemu-devel@lfdr.de; Fri, 29 Jan 2021 06:03:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59590)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l5RW0-0004Gs-OX
 for qemu-devel@nongnu.org; Fri, 29 Jan 2021 06:00:36 -0500
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436]:40612)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l5RVl-0006sC-Vh
 for qemu-devel@nongnu.org; Fri, 29 Jan 2021 06:00:36 -0500
Received: by mail-wr1-x436.google.com with SMTP id c12so8391099wrc.7
 for <qemu-devel@nongnu.org>; Fri, 29 Jan 2021 03:00:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=wDUBdfIHH7cKXu56ARpiTqgmJioSyQdGeUB4RSV9/9U=;
 b=Rf43R94jIXwH0uoGNRMDQyX1v/mNvwpHRqR/WpZtb80nEede3NC+LbUw/EAufXP8Ll
 IYn70HZ6TRQfBERdqUZGx1csHbxuAhDarpg7GTVLm54CFxw5/RkGqEvtfl2QLAD5TWRJ
 mlH3DkkZlrASaQWJlFdrGiviJZbob29BugYNAyIeBRieiQyoetNWE1pemRC+GomZMYmW
 05tSGopMxwB0HY5Ey2L8CeHTmZPxjuaJhmcV8t9nCE71jZqmVYXO17wF9+tQUMh4i/os
 vf4NG93q92vWofN7p4BG7kh3t44xDnEleoMb5u1qD3eJdZ+dBT8hYNyaRqp4MLzST3tH
 N6ZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=wDUBdfIHH7cKXu56ARpiTqgmJioSyQdGeUB4RSV9/9U=;
 b=YZFqi9EsvGYibPJovMtmja+7N/J9XYB4wib2ZvSQ69UsIK6GjyHLa8zxEudxrqSPUE
 9miEtCzVLiXp9SPogeW+263C+8AkOs+vnQRJcj5CaebuFIfwzDOrXi8rX2RdtNn3MhIG
 8ZZ22v2AOyJksniO2RohzzYxqS8TWE0HsP1x0nvRuWq/sm48ErCIRBLHkFlvag2z4duK
 /27/pkMtZSbOww0nD5m7J3nhzNly/0n3k0v3ht+TOdw4Zpg+2vwXcmMmvX3Wa78uK5bI
 bCJ+tryST2wPm7VRsyqwleI9c/U3fgiicj2BJ+FoXmzmxwXAbMPTd1xdODlg4lDv6M6D
 m2cg==
X-Gm-Message-State: AOAM531IXtf6GpMHADYyL1gwmPZJ3UgEx5aTNulDY8yXl1FDVESmK/8Y
 1CbtnkaTe75T3cmvgdkIbYJvYgRlNkA+Ww==
X-Google-Smtp-Source: ABdhPJyv2bb09xbQfDx/rdkwac2NpRiO1iJ2yP3HAfB8ZcSHpA9YpVN1wJZCUeQuKcnV2Vr5iWOnIQ==
X-Received: by 2002:a5d:524a:: with SMTP id k10mr3905875wrc.394.1611918017881; 
 Fri, 29 Jan 2021 03:00:17 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id w20sm9268761wmm.12.2021.01.29.03.00.17
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 29 Jan 2021 03:00:17 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 03/46] arm: rename xlnx-zcu102.canbusN properties
Date: Fri, 29 Jan 2021 10:59:29 +0000
Message-Id: <20210129110012.8660-4-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210129110012.8660-1-peter.maydell@linaro.org>
References: <20210129110012.8660-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::436;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x436.google.com
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

From: Paolo Bonzini <pbonzini@redhat.com>

The properties to attach a CANBUS object to the xlnx-zcu102 machine have
a period in them.  We want to use periods in properties for compound QAPI types,
and besides the "xlnx-zcu102." prefix is both unnecessary and different
from any other machine property name.  Remove it.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
Message-id: 20210118162537.779542-1-pbonzini@redhat.com
Reviewed-by: Vikram Garhwal <fnu.vikram@xilinx.com>
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/arm/xlnx-zcu102.c        |  4 ++--
 tests/qtest/xlnx-can-test.c | 30 +++++++++++++++---------------
 2 files changed, 17 insertions(+), 17 deletions(-)

diff --git a/hw/arm/xlnx-zcu102.c b/hw/arm/xlnx-zcu102.c
index 4ef0c516bfd..c9713638c5b 100644
--- a/hw/arm/xlnx-zcu102.c
+++ b/hw/arm/xlnx-zcu102.c
@@ -219,12 +219,12 @@ static void xlnx_zcu102_machine_instance_init(Object *obj)
     s->secure = false;
     /* Default to virt (EL2) being disabled */
     s->virt = false;
-    object_property_add_link(obj, "xlnx-zcu102.canbus0", TYPE_CAN_BUS,
+    object_property_add_link(obj, "canbus0", TYPE_CAN_BUS,
                              (Object **)&s->canbus[0],
                              object_property_allow_set_link,
                              0);
 
-    object_property_add_link(obj, "xlnx-zcu102.canbus1", TYPE_CAN_BUS,
+    object_property_add_link(obj, "canbus1", TYPE_CAN_BUS,
                              (Object **)&s->canbus[1],
                              object_property_allow_set_link,
                              0);
diff --git a/tests/qtest/xlnx-can-test.c b/tests/qtest/xlnx-can-test.c
index 3d1120005b6..54de71a6864 100644
--- a/tests/qtest/xlnx-can-test.c
+++ b/tests/qtest/xlnx-can-test.c
@@ -138,9 +138,9 @@ static void test_can_bus(void)
     uint8_t can_timestamp = 1;
 
     QTestState *qts = qtest_init("-machine xlnx-zcu102"
-                " -object can-bus,id=canbus0"
-                " -machine xlnx-zcu102.canbus0=canbus0"
-                " -machine xlnx-zcu102.canbus1=canbus0"
+                " -object can-bus,id=canbus"
+                " -machine canbus0=canbus"
+                " -machine canbus1=canbus"
                 );
 
     /* Configure the CAN0 and CAN1. */
@@ -175,9 +175,9 @@ static void test_can_loopback(void)
     uint32_t status = 0;
 
     QTestState *qts = qtest_init("-machine xlnx-zcu102"
-                " -object can-bus,id=canbus0"
-                " -machine xlnx-zcu102.canbus0=canbus0"
-                " -machine xlnx-zcu102.canbus1=canbus0"
+                " -object can-bus,id=canbus"
+                " -machine canbus0=canbus"
+                " -machine canbus1=canbus"
                 );
 
     /* Configure the CAN0 in loopback mode. */
@@ -223,9 +223,9 @@ static void test_can_filter(void)
     uint8_t can_timestamp = 1;
 
     QTestState *qts = qtest_init("-machine xlnx-zcu102"
-                " -object can-bus,id=canbus0"
-                " -machine xlnx-zcu102.canbus0=canbus0"
-                " -machine xlnx-zcu102.canbus1=canbus0"
+                " -object can-bus,id=canbus"
+                " -machine canbus0=canbus"
+                " -machine canbus1=canbus"
                 );
 
     /* Configure the CAN0 and CAN1. */
@@ -271,9 +271,9 @@ static void test_can_sleepmode(void)
     uint8_t can_timestamp = 1;
 
     QTestState *qts = qtest_init("-machine xlnx-zcu102"
-                " -object can-bus,id=canbus0"
-                " -machine xlnx-zcu102.canbus0=canbus0"
-                " -machine xlnx-zcu102.canbus1=canbus0"
+                " -object can-bus,id=canbus"
+                " -machine canbus0=canbus"
+                " -machine canbus1=canbus"
                 );
 
     /* Configure the CAN0. */
@@ -317,9 +317,9 @@ static void test_can_snoopmode(void)
     uint8_t can_timestamp = 1;
 
     QTestState *qts = qtest_init("-machine xlnx-zcu102"
-                " -object can-bus,id=canbus0"
-                " -machine xlnx-zcu102.canbus0=canbus0"
-                " -machine xlnx-zcu102.canbus1=canbus0"
+                " -object can-bus,id=canbus"
+                " -machine canbus0=canbus"
+                " -machine canbus1=canbus"
                 );
 
     /* Configure the CAN0. */
-- 
2.20.1


