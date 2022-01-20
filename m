Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 82F154952C6
	for <lists+qemu-devel@lfdr.de>; Thu, 20 Jan 2022 17:59:26 +0100 (CET)
Received: from localhost ([::1]:54150 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nAamT-0005b7-Jc
	for lists+qemu-devel@lfdr.de; Thu, 20 Jan 2022 11:59:25 -0500
Received: from eggs.gnu.org ([209.51.188.92]:42616)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nAWgJ-00046f-3K
 for qemu-devel@nongnu.org; Thu, 20 Jan 2022 07:36:47 -0500
Received: from [2a00:1450:4864:20::32b] (port=41708
 helo=mail-wm1-x32b.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nAWgC-00038f-Ni
 for qemu-devel@nongnu.org; Thu, 20 Jan 2022 07:36:42 -0500
Received: by mail-wm1-x32b.google.com with SMTP id
 q141-20020a1ca793000000b00347b48dfb53so13505020wme.0
 for <qemu-devel@nongnu.org>; Thu, 20 Jan 2022 04:36:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=aYyrCyUkvFeYJNDYKY3Y73qNgJoUZMVv0zBi4zhjr0E=;
 b=LJlG9+PaCnGOr3YZMOKyV6xzrusgbLz0K8+cAGT6y5E452WtxoF7YGFP0/vFAnesd6
 qKgPOZDX3qBnbz+d9sHOY3y1pwEhZeMtcZ0kI8iNDPJvXSPiNkDeA2GUE24N/JBfHORJ
 GfwiLmbJjpeVuTCm9HnQ3MP54m16GTMWveXW1MD4Zv6DGa8WSwBrL8DQkS1hp67RSNCF
 lcr7DYVQyKjX837smf9yhKN0PaGt/jnakYQDadnLNg67fqS3uc3LK6cwN0w3t92PzUQj
 AE+tmC8h5U/4FLvCYSvXSzALpGyQFYYZdvHjqOINsQ6ajDcKFBdusqRmH+16y6g2AypT
 Esxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=aYyrCyUkvFeYJNDYKY3Y73qNgJoUZMVv0zBi4zhjr0E=;
 b=PKCsbscSW8iiw6MfASqQMh/7NxagWn1EkIjwfwDZav33z+YFxNpXZvCOl3Ay71EGGh
 mDa/VFI6l/+k6doiZpk+NJ3f8XIblGHiEBdM7zeZTarA6zq8I4B/NGMYe8cbLsIUcmI9
 5qtUsawUP1E1YHxo7XjsjlzADJ3hH2CcgZ/jt5ukITZh92v/c0bJNCAVq9hor5dgp+CJ
 a9dcf4GTwHkDlyRNSas7B7AohRyVdlLcKU3wJE+cJPQw2G4tCeQgnRzZfS1lIPaHm2nS
 66MAEHzzF3u5NxvOQJCgLrMFaCzyq5iI9nwPULGf1BV5Xz/HknW7vBayXrp0TrJFStTW
 aR6Q==
X-Gm-Message-State: AOAM5332WJzT0KWb4mlalOCJbU3AYPoYoKzYyLNt5IcxO658I/WOSQRM
 aq1L4qDLQu3nz8bxQRVi96pVmeqClCVVJw==
X-Google-Smtp-Source: ABdhPJydkctM5t0x6HN3J4v+SoEqEnYGwA7QFKZ2syhErzom2O9bjmA1wNk+vUJNXjBgzqSBSGq2gA==
X-Received: by 2002:adf:fbcd:: with SMTP id d13mr33604251wrs.170.1642682199009; 
 Thu, 20 Jan 2022 04:36:39 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id t8sm7993324wmq.43.2022.01.20.04.36.38
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 Jan 2022 04:36:38 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 07/38] hw/acpi/aml-build: Improve scalability of PPTT generation
Date: Thu, 20 Jan 2022 12:35:59 +0000
Message-Id: <20220120123630.267975-8-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220120123630.267975-1-peter.maydell@linaro.org>
References: <20220120123630.267975-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::32b
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::32b;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32b.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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

From: Yanan Wang <wangyanan55@huawei.com>

Use g_queue APIs to reduce the nested loops and code indentation
with the processor hierarchy levels increasing. Consenquently,
it's more scalable to add new topology level to build_pptt.

No functional change intended.

Signed-off-by: Yanan Wang <wangyanan55@huawei.com>
Reviewed-by: Andrew Jones <drjones@redhat.com>
Message-id: 20220107083232.16256-4-wangyanan55@huawei.com
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/acpi/aml-build.c | 50 +++++++++++++++++++++++++++++----------------
 1 file changed, 32 insertions(+), 18 deletions(-)

diff --git a/hw/acpi/aml-build.c b/hw/acpi/aml-build.c
index b3b3310df32..6aaedca2e56 100644
--- a/hw/acpi/aml-build.c
+++ b/hw/acpi/aml-build.c
@@ -2001,7 +2001,10 @@ static void build_processor_hierarchy_node(GArray *tbl, uint32_t flags,
 void build_pptt(GArray *table_data, BIOSLinker *linker, MachineState *ms,
                 const char *oem_id, const char *oem_table_id)
 {
-    int pptt_start = table_data->len;
+    GQueue *list = g_queue_new();
+    guint pptt_start = table_data->len;
+    guint parent_offset;
+    guint length, i;
     int uid = 0;
     int socket;
     AcpiTable table = { .sig = "PPTT", .rev = 2,
@@ -2010,9 +2013,8 @@ void build_pptt(GArray *table_data, BIOSLinker *linker, MachineState *ms,
     acpi_table_begin(&table, table_data);
 
     for (socket = 0; socket < ms->smp.sockets; socket++) {
-        uint32_t socket_offset = table_data->len - pptt_start;
-        int core;
-
+        g_queue_push_tail(list,
+            GUINT_TO_POINTER(table_data->len - pptt_start));
         build_processor_hierarchy_node(
             table_data,
             /*
@@ -2021,35 +2023,47 @@ void build_pptt(GArray *table_data, BIOSLinker *linker, MachineState *ms,
              */
             (1 << 0),
             0, socket, NULL, 0);
+    }
 
+    length = g_queue_get_length(list);
+    for (i = 0; i < length; i++) {
+        int core;
+
+        parent_offset = GPOINTER_TO_UINT(g_queue_pop_head(list));
         for (core = 0; core < ms->smp.cores; core++) {
-            uint32_t core_offset = table_data->len - pptt_start;
-            int thread;
-
             if (ms->smp.threads > 1) {
+                g_queue_push_tail(list,
+                    GUINT_TO_POINTER(table_data->len - pptt_start));
                 build_processor_hierarchy_node(
                     table_data,
                     (0 << 0), /* not a physical package */
-                    socket_offset, core, NULL, 0);
-
-                for (thread = 0; thread < ms->smp.threads; thread++) {
-                    build_processor_hierarchy_node(
-                        table_data,
-                        (1 << 1) | /* ACPI Processor ID valid */
-                        (1 << 2) | /* Processor is a Thread */
-                        (1 << 3),  /* Node is a Leaf */
-                        core_offset, uid++, NULL, 0);
-                }
+                    parent_offset, core, NULL, 0);
             } else {
                 build_processor_hierarchy_node(
                     table_data,
                     (1 << 1) | /* ACPI Processor ID valid */
                     (1 << 3),  /* Node is a Leaf */
-                    socket_offset, uid++, NULL, 0);
+                    parent_offset, uid++, NULL, 0);
             }
         }
     }
 
+    length = g_queue_get_length(list);
+    for (i = 0; i < length; i++) {
+        int thread;
+
+        parent_offset = GPOINTER_TO_UINT(g_queue_pop_head(list));
+        for (thread = 0; thread < ms->smp.threads; thread++) {
+            build_processor_hierarchy_node(
+                table_data,
+                (1 << 1) | /* ACPI Processor ID valid */
+                (1 << 2) | /* Processor is a Thread */
+                (1 << 3),  /* Node is a Leaf */
+                parent_offset, uid++, NULL, 0);
+        }
+    }
+
+    g_queue_free(list);
     acpi_table_end(linker, &table);
 }
 
-- 
2.25.1


