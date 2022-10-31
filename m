Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 76F7461376E
	for <lists+qemu-devel@lfdr.de>; Mon, 31 Oct 2022 14:08:56 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1opUHN-0003hR-Ib; Mon, 31 Oct 2022 08:52:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1opUGj-0002M9-VE
 for qemu-devel@nongnu.org; Mon, 31 Oct 2022 08:51:58 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1opUGc-0002V6-7h
 for qemu-devel@nongnu.org; Mon, 31 Oct 2022 08:51:55 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1667220709;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=o13JY5YCx8gj9VljHcIBP5/cdaG4cm7x8QO0SOJPY3M=;
 b=GFwhX70djEmQIRXoCRCNQzdG69xeuAYgKpe/JdzQsGgRYzG+vkQZ+1pd4HIF9s8okqYAF3
 6e6S6i5dwMbDZRen6ZHD0/Th6GQrRfgtb8kdWBGHjAex4mF/vBdx9+k4WCHVqJ32sqfeee
 8k9/s8+a+mrUO7SJaZwdkdYh5u9MqDk=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-277-geLbPnsJOfaB7Tt4vX03cw-1; Mon, 31 Oct 2022 08:51:48 -0400
X-MC-Unique: geLbPnsJOfaB7Tt4vX03cw-1
Received: by mail-wm1-f72.google.com with SMTP id
 x10-20020a05600c420a00b003cf4dbff2e4so5767508wmh.8
 for <qemu-devel@nongnu.org>; Mon, 31 Oct 2022 05:51:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=o13JY5YCx8gj9VljHcIBP5/cdaG4cm7x8QO0SOJPY3M=;
 b=sDlDz6GsLiyMmUNGzTxwv2qLsfyCV7wbzubaZaVMD+b8f/KDXOH4BwxbwImnTrrUGa
 l5H/W9Yk5m+4Cp9loVY5fP6dI5fNLleDl1EJ5TLMcNlkbdPokW0icEhCpmMo6SpTv+55
 TXQrcXgBntlIz5UX9F7qz+mSvkVzBN4aXU1gV0NtAsg6xKr/NSAgcHpMOlpkFrcQ7BuI
 SdR8zveKv4GlCwId2Thv9hBeVOieyRyhgcQRPssoN5egs7r95YcKHJjynZiU5KpoUdDA
 9hbeDaxWQWS/MegMBc2R29KNKWiU6KTO9IAmToKRcaFOitwM313RY09v8P+2YHEwdbSm
 M+/A==
X-Gm-Message-State: ACrzQf2OPuyweTCOeZDG9P8x6BPxwk7rRPIove68TnevnO9MbmsmwKkJ
 eNhmaCDnhq/FkHB9iITXfvJriy+U8Yzat7+v7bPAOy3+m28KibM7P7O8toalajsp5c9Irw8Hxgq
 mMuWqcN4EF8VWdk8dYDhcYJnMSUdJgV1t1PATD7iUXQdxNAuo/jNlUzKUKr9A
X-Received: by 2002:a05:600c:6008:b0:3c6:c3fa:c173 with SMTP id
 az8-20020a05600c600800b003c6c3fac173mr8380481wmb.190.1667220707048; 
 Mon, 31 Oct 2022 05:51:47 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM6QJROF3E4VApWLWvmUQ3Ry+uAk9oR7W/El+IuYxYnxQ7V56Fwq61nVjnM4L04uxgazalGP9A==
X-Received: by 2002:a05:600c:6008:b0:3c6:c3fa:c173 with SMTP id
 az8-20020a05600c600800b003c6c3fac173mr8380458wmb.190.1667220706720; 
 Mon, 31 Oct 2022 05:51:46 -0700 (PDT)
Received: from redhat.com ([2.52.15.189]) by smtp.gmail.com with ESMTPSA id
 x3-20020a5d4443000000b0023659925b2asm7039945wrr.51.2022.10.31.05.51.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 31 Oct 2022 05:51:46 -0700 (PDT)
Date: Mon, 31 Oct 2022 08:51:44 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Julia Suvorova <jusual@redhat.com>,
 Igor Mammedov <imammedo@redhat.com>, Ani Sinha <ani@anisinha.ca>
Subject: [PULL 21/86] bios-tables-test: add test for number of cores > 255
Message-ID: <20221031124928.128475-22-mst@redhat.com>
References: <20221031124928.128475-1-mst@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221031124928.128475-1-mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.048,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de+lists+qemu-devel=lfdr.de@nongnu.org

From: Julia Suvorova <jusual@redhat.com>

The new test is run with a large number of cpus and checks if the
core_count field in smbios_cpu_test (structure type 4) is correct.

Choose q35 as it allows to run with -smp > 255.

Signed-off-by: Julia Suvorova <jusual@redhat.com>
Message-Id: <20220731162141.178443-5-jusual@redhat.com>
Message-Id: <20221011111731.101412-5-jusual@redhat.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
Reviewed-by: Igor Mammedov <imammedo@redhat.com>
---
 tests/qtest/bios-tables-test.c | 58 ++++++++++++++++++++++++++--------
 1 file changed, 45 insertions(+), 13 deletions(-)

diff --git a/tests/qtest/bios-tables-test.c b/tests/qtest/bios-tables-test.c
index d4fbe6791d..e402b57d46 100644
--- a/tests/qtest/bios-tables-test.c
+++ b/tests/qtest/bios-tables-test.c
@@ -92,6 +92,8 @@ typedef struct {
     SmbiosEntryPoint smbios_ep_table;
     uint16_t smbios_cpu_max_speed;
     uint16_t smbios_cpu_curr_speed;
+    uint8_t smbios_core_count;
+    uint16_t smbios_core_count2;
     uint8_t *required_struct_types;
     int required_struct_types_len;
     QTestState *qts;
@@ -631,29 +633,42 @@ static inline bool smbios_single_instance(uint8_t type)
     }
 }
 
-static bool smbios_cpu_test(test_data *data, uint32_t addr)
+static void smbios_cpu_test(test_data *data, uint32_t addr,
+                            SmbiosEntryPointType ep_type)
 {
-    uint16_t expect_speed[2];
-    uint16_t real;
+    uint8_t core_count, expected_core_count = data->smbios_core_count;
+    uint16_t speed, expected_speed[2];
+    uint16_t core_count2, expected_core_count2 = data->smbios_core_count2;
     int offset[2];
     int i;
 
     /* Check CPU speed for backward compatibility */
     offset[0] = offsetof(struct smbios_type_4, max_speed);
     offset[1] = offsetof(struct smbios_type_4, current_speed);
-    expect_speed[0] = data->smbios_cpu_max_speed ? : 2000;
-    expect_speed[1] = data->smbios_cpu_curr_speed ? : 2000;
+    expected_speed[0] = data->smbios_cpu_max_speed ? : 2000;
+    expected_speed[1] = data->smbios_cpu_curr_speed ? : 2000;
 
     for (i = 0; i < 2; i++) {
-        real = qtest_readw(data->qts, addr + offset[i]);
-        if (real != expect_speed[i]) {
-            fprintf(stderr, "Unexpected SMBIOS CPU speed: real %u expect %u\n",
-                    real, expect_speed[i]);
-            return false;
-        }
+        speed = qtest_readw(data->qts, addr + offset[i]);
+        g_assert_cmpuint(speed, ==, expected_speed[i]);
     }
 
-    return true;
+    core_count = qtest_readb(data->qts,
+                    addr + offsetof(struct smbios_type_4, core_count));
+
+    if (expected_core_count) {
+        g_assert_cmpuint(core_count, ==, expected_core_count);
+    }
+
+    if (ep_type == SMBIOS_ENTRY_POINT_TYPE_64) {
+        core_count2 = qtest_readw(data->qts,
+                          addr + offsetof(struct smbios_type_4, core_count2));
+
+        /* Core Count has reached its limit, checking Core Count 2 */
+        if (expected_core_count == 0xFF && expected_core_count2) {
+            g_assert_cmpuint(core_count2, ==, expected_core_count2);
+        }
+    }
 }
 
 static void test_smbios_structs(test_data *data, SmbiosEntryPointType ep_type)
@@ -686,7 +701,7 @@ static void test_smbios_structs(test_data *data, SmbiosEntryPointType ep_type)
         set_bit(type, struct_bitmap);
 
         if (type == 4) {
-            g_assert(smbios_cpu_test(data, addr));
+            smbios_cpu_test(data, addr, ep_type);
         }
 
         /* seek to end of unformatted string area of this struct ("\0\0") */
@@ -908,6 +923,21 @@ static void test_acpi_q35_tcg(void)
     free_test_data(&data);
 }
 
+static void test_acpi_q35_tcg_core_count2(void)
+{
+    test_data data = {
+        .machine = MACHINE_Q35,
+        .variant = ".core-count2",
+        .required_struct_types = base_required_struct_types,
+        .required_struct_types_len = ARRAY_SIZE(base_required_struct_types),
+        .smbios_core_count = 0xFF,
+        .smbios_core_count2 = 275,
+    };
+
+    test_acpi_one("-machine smbios-entry-point-type=64 -smp 275", &data);
+    free_test_data(&data);
+}
+
 static void test_acpi_q35_tcg_bridge(void)
 {
     test_data data;
@@ -1859,6 +1889,8 @@ int main(int argc, char *argv[])
                 qtest_add_func("acpi/q35/tpm12-tis",
                                test_acpi_q35_tcg_tpm12_tis);
             }
+            qtest_add_func("acpi/q35/core-count2",
+                           test_acpi_q35_tcg_core_count2);
             qtest_add_func("acpi/q35/bridge", test_acpi_q35_tcg_bridge);
             qtest_add_func("acpi/q35/multif-bridge",
                            test_acpi_q35_multif_bridge);
-- 
MST


