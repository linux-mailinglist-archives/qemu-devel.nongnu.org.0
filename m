Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B4BC477327
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Dec 2021 14:30:55 +0100 (CET)
Received: from localhost ([::1]:46314 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mxqqU-0006LE-Bb
	for lists+qemu-devel@lfdr.de; Thu, 16 Dec 2021 08:30:54 -0500
Received: from eggs.gnu.org ([209.51.188.92]:37228)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mxqgv-0006rj-38
 for qemu-devel@nongnu.org; Thu, 16 Dec 2021 08:21:02 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:49326)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mxqgp-0008Nv-CG
 for qemu-devel@nongnu.org; Thu, 16 Dec 2021 08:20:56 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1639660854;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Gas95xydnkNBfxR9mpd2N4KEjaivWAJSZ81O3dj9XTI=;
 b=HJF0bG3pd2cGMC8/pL2P20K0oeYVtAfaoK4ZGxO2txC1srlc9cG+Bte1E8QPTU4hSprWpd
 eBEzwvuFI5+b435PYbGp26oKJ9uxb95PoEup1/6Rj7DG/IiXCof9g+aEWRe4jItkjjQVDJ
 V71zS8iI7DnlS+uN4aUihLcM8sFVZgw=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-422-VezprTsuNpSiBEk39gTJmw-1; Thu, 16 Dec 2021 08:20:53 -0500
X-MC-Unique: VezprTsuNpSiBEk39gTJmw-1
Received: by mail-wr1-f71.google.com with SMTP id
 f13-20020adfe90d000000b001a15c110077so2144634wrm.8
 for <qemu-devel@nongnu.org>; Thu, 16 Dec 2021 05:20:53 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Gas95xydnkNBfxR9mpd2N4KEjaivWAJSZ81O3dj9XTI=;
 b=wwvSZnpCyaBYNwoP/R1q2SMUSHjJMeDyM8qJjNAksHvV9+h4Dy5pqt5N5vO7eSmVGc
 BMM0Uh0iWd2u+94t291kAzg83MwlxTS9In2OqprqAASP7dWPYe6kOa1WYA+RrWUMVwjt
 NvKLAzhdJvwP2O3dge81FSmQjFHF0OL7K/3vxwo8BAOXPBSgRrvbWXoKnunkYQUJV5K5
 3qIYy0jL0pxwQeSizPMphBU1hNn32CKwBlEnAdvsmOZ/Nj6SJzIpUDnwFzGpSsRnkhr/
 rh4t9FAtKCPiz6z0bIOXYPbYGHYMATdu1csz8o9uJh8BRV8OZQCp/vOUJfLzeQkBAvFj
 JAoQ==
X-Gm-Message-State: AOAM531pqlIAanhjEftSOo3249YmUKpILI/RZ6LqGl+honxk56SDla9s
 B6o8awfvdCxHkT9GqtILxOZveK2dJk0MJSi0mtLpmbOiBiU48phJD2JiFEfomF1ureDpAmOqsoO
 JLERpaiKWJQR4ym0W7/lJsDpAyMeSQp1rQxF7SGUR4wZugH9903cdZkAIH0rbzE3d
X-Received: by 2002:a05:600c:4ec7:: with SMTP id
 g7mr4971857wmq.138.1639660851587; 
 Thu, 16 Dec 2021 05:20:51 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwdHxlLrzvqG2sxs1BgKH2jaCOPoHWBWJTUcJhPLqj6Cy/ONngWBm8MpXjceFkdkLk5iLgH9Q==
X-Received: by 2002:a05:600c:4ec7:: with SMTP id
 g7mr4971833wmq.138.1639660851318; 
 Thu, 16 Dec 2021 05:20:51 -0800 (PST)
Received: from localhost.localdomain
 (174.red-83-50-185.dynamicip.rima-tde.net. [83.50.185.174])
 by smtp.gmail.com with ESMTPSA id e11sm6018238wrq.28.2021.12.16.05.20.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Dec 2021 05:20:50 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v6 6/8] tests/unit/test-smp-parse: Simplify pointer to
 compound literal use
Date: Thu, 16 Dec 2021 14:20:13 +0100
Message-Id: <20211216132015.815493-7-philmd@redhat.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211216132015.815493-1-philmd@redhat.com>
References: <20211216132015.815493-1-philmd@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.718,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: Eduardo Habkost <eduardo@habkost.net>,
 Richard Henderson <richard.henderson@linaro.org>,
 Andrew Jones <drjones@redhat.com>, Yanan Wang <wangyanan55@huawei.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

We can simply use a local variable (and pass its pointer) instead
of a pointer to a compound literal.

Reviewed-by: Andrew Jones <drjones@redhat.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Yanan Wang <wangyanan55@huawei.com>
Tested-by: Yanan Wang <wangyanan55@huawei.com>
Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 tests/unit/test-smp-parse.c | 66 ++++++++++++++++++-------------------
 1 file changed, 33 insertions(+), 33 deletions(-)

diff --git a/tests/unit/test-smp-parse.c b/tests/unit/test-smp-parse.c
index b20bf2c2359..395929b66cf 100644
--- a/tests/unit/test-smp-parse.c
+++ b/tests/unit/test-smp-parse.c
@@ -520,19 +520,19 @@ static void test_generic_valid(const void *opaque)
     Object *obj = object_new(machine_type);
     MachineState *ms = MACHINE(obj);
     MachineClass *mc = MACHINE_GET_CLASS(obj);
-    SMPTestData *data = &(SMPTestData){{ }};
+    SMPTestData data = {};
     int i;
 
     for (i = 0; i < ARRAY_SIZE(data_generic_valid); i++) {
-        *data = data_generic_valid[i];
-        unsupported_params_init(mc, data);
+        data = data_generic_valid[i];
+        unsupported_params_init(mc, &data);
 
-        smp_parse_test(ms, data, true);
+        smp_parse_test(ms, &data, true);
 
         /* Unsupported parameters can be provided with their values as 1 */
-        data->config.has_dies = true;
-        data->config.dies = 1;
-        smp_parse_test(ms, data, true);
+        data.config.has_dies = true;
+        data.config.dies = 1;
+        smp_parse_test(ms, &data, true);
     }
 
     object_unref(obj);
@@ -544,14 +544,14 @@ static void test_generic_invalid(const void *opaque)
     Object *obj = object_new(machine_type);
     MachineState *ms = MACHINE(obj);
     MachineClass *mc = MACHINE_GET_CLASS(obj);
-    SMPTestData *data = &(SMPTestData){};
+    SMPTestData data = {};
     int i;
 
     for (i = 0; i < ARRAY_SIZE(data_generic_invalid); i++) {
-        *data = data_generic_invalid[i];
-        unsupported_params_init(mc, data);
+        data = data_generic_invalid[i];
+        unsupported_params_init(mc, &data);
 
-        smp_parse_test(ms, data, false);
+        smp_parse_test(ms, &data, false);
     }
 
     object_unref(obj);
@@ -563,45 +563,45 @@ static void test_with_dies(const void *opaque)
     Object *obj = object_new(machine_type);
     MachineState *ms = MACHINE(obj);
     MachineClass *mc = MACHINE_GET_CLASS(obj);
-    SMPTestData *data = &(SMPTestData){{ }};
+    SMPTestData data = {};
     unsigned int num_dies = 2;
     int i;
 
     for (i = 0; i < ARRAY_SIZE(data_generic_valid); i++) {
-        *data = data_generic_valid[i];
-        unsupported_params_init(mc, data);
+        data = data_generic_valid[i];
+        unsupported_params_init(mc, &data);
 
         /* when dies parameter is omitted, it will be set as 1 */
-        data->expect_prefer_sockets.dies = 1;
-        data->expect_prefer_cores.dies = 1;
+        data.expect_prefer_sockets.dies = 1;
+        data.expect_prefer_cores.dies = 1;
 
-        smp_parse_test(ms, data, true);
+        smp_parse_test(ms, &data, true);
 
         /* when dies parameter is specified */
-        data->config.has_dies = true;
-        data->config.dies = num_dies;
-        if (data->config.has_cpus) {
-            data->config.cpus *= num_dies;
+        data.config.has_dies = true;
+        data.config.dies = num_dies;
+        if (data.config.has_cpus) {
+            data.config.cpus *= num_dies;
         }
-        if (data->config.has_maxcpus) {
-            data->config.maxcpus *= num_dies;
+        if (data.config.has_maxcpus) {
+            data.config.maxcpus *= num_dies;
         }
 
-        data->expect_prefer_sockets.dies = num_dies;
-        data->expect_prefer_sockets.cpus *= num_dies;
-        data->expect_prefer_sockets.max_cpus *= num_dies;
-        data->expect_prefer_cores.dies = num_dies;
-        data->expect_prefer_cores.cpus *= num_dies;
-        data->expect_prefer_cores.max_cpus *= num_dies;
+        data.expect_prefer_sockets.dies = num_dies;
+        data.expect_prefer_sockets.cpus *= num_dies;
+        data.expect_prefer_sockets.max_cpus *= num_dies;
+        data.expect_prefer_cores.dies = num_dies;
+        data.expect_prefer_cores.cpus *= num_dies;
+        data.expect_prefer_cores.max_cpus *= num_dies;
 
-        smp_parse_test(ms, data, true);
+        smp_parse_test(ms, &data, true);
     }
 
     for (i = 0; i < ARRAY_SIZE(data_with_dies_invalid); i++) {
-        *data = data_with_dies_invalid[i];
-        unsupported_params_init(mc, data);
+        data = data_with_dies_invalid[i];
+        unsupported_params_init(mc, &data);
 
-        smp_parse_test(ms, data, false);
+        smp_parse_test(ms, &data, false);
     }
 
     object_unref(obj);
-- 
2.33.1


