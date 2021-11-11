Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F420544D4BF
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Nov 2021 11:08:26 +0100 (CET)
Received: from localhost ([::1]:47064 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ml70L-0007Fr-SO
	for lists+qemu-devel@lfdr.de; Thu, 11 Nov 2021 05:08:25 -0500
Received: from eggs.gnu.org ([209.51.188.92]:35674)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1ml6wK-000754-9d
 for qemu-devel@nongnu.org; Thu, 11 Nov 2021 05:04:16 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:29848)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1ml6wI-00011W-6L
 for qemu-devel@nongnu.org; Thu, 11 Nov 2021 05:04:16 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1636625053;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Zv98ESowpSBPXuA/RP8hwOuMiWSKWHaIHsyJuURTSP0=;
 b=BGtaNgEyek+9oscbnckHz8eAuOo+TqkAolRGvj/EUpLA5COOSTyql978p2T66gjDBmAdR2
 igTvvM1AMJi2u5qALya2/AQD9xnr+sJrUNxhkBuiJtTjsP+KoFJJ3zx5HO6rDwZWKMyI5u
 Sk0zIARaW7+iyimP5CpHG4KDSUgtquM=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-548-3f8Jsl0pP0uXnVvpsGZbCQ-1; Thu, 11 Nov 2021 05:04:12 -0500
X-MC-Unique: 3f8Jsl0pP0uXnVvpsGZbCQ-1
Received: by mail-wm1-f69.google.com with SMTP id
 m18-20020a05600c3b1200b0033283ea5facso1615532wms.1
 for <qemu-devel@nongnu.org>; Thu, 11 Nov 2021 02:04:12 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Zv98ESowpSBPXuA/RP8hwOuMiWSKWHaIHsyJuURTSP0=;
 b=VFWHPJn2T2w4O5mRkWGDmwYt2kQ8PKrk986Jwf0JgA8De02yo3Cv3ZB48QP1A6e2Im
 APjFb7yq1NGBfTVl9I2uXk8SSl9Spw8dB6Q0xLiRZEf0djUbSwtFoepxmS7EYlOaZEAl
 L8mMH4wkIubgXAQT2pyECZ+aQchlVdsDRZGe0A3MLZNt5+v6UKYE0npAxHSuP9QE1LX2
 msIk+y/8W9kQEP6ywiFbyahRxmB5reCCHUqlPKEh7gnNgHuO4vx58QcmY09MiokdqLO7
 a6m89p6OhkGjPNkvKp6q2qEXOlfLnDC1h3uszQPpIE+LViBi7k1Cak4b7IZJJp6rQraC
 0T0Q==
X-Gm-Message-State: AOAM533bo1c/eqXPoEC4Tw7jT7w1nTewZZED42zOJFAywkovdo7tFUIi
 aim/UNSsHSZZ2OfIXV/dS6GoOSo7bG2QfAAyHFyWAL1/nxtwyAkLiNYLZg8jfiwE6u6dBTPMxwk
 oXSZIKwwMeFiTqmOs5mWSn/FfxJTDvpdciS7tnFZbpA56quka0UIMEJrEYiRglla+
X-Received: by 2002:a05:600c:4108:: with SMTP id
 j8mr6836688wmi.139.1636625050588; 
 Thu, 11 Nov 2021 02:04:10 -0800 (PST)
X-Google-Smtp-Source: ABdhPJy0luYu3xf1hS+4KtALHWN3LTqhBwtMRD6PQCwNB/UpN3JWI0w43AjLo9Ioe0zm7upiSoatXw==
X-Received: by 2002:a05:600c:4108:: with SMTP id
 j8mr6836653wmi.139.1636625050400; 
 Thu, 11 Nov 2021 02:04:10 -0800 (PST)
Received: from x1w.. (62.red-83-57-168.dynamicip.rima-tde.net. [83.57.168.62])
 by smtp.gmail.com with ESMTPSA id
 u2sm2366924wrr.35.2021.11.11.02.04.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 Nov 2021 02:04:10 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH-for-6.2 v3 4/6] tests/unit/test-smp-parse: Simplify pointer to
 compound literal use
Date: Thu, 11 Nov 2021 11:03:49 +0100
Message-Id: <20211111100351.2153662-5-philmd@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211111100351.2153662-1-philmd@redhat.com>
References: <20211111100351.2153662-1-philmd@redhat.com>
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
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
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
Cc: Thomas Huth <thuth@redhat.com>, Andrew Jones <drjones@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 Yanan Wang <wangyanan55@huawei.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

We can simply use a local variable (and pass its pointer) instead
of a pointer to a compound literal.

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 tests/unit/test-smp-parse.c | 64 ++++++++++++++++++-------------------
 1 file changed, 32 insertions(+), 32 deletions(-)

diff --git a/tests/unit/test-smp-parse.c b/tests/unit/test-smp-parse.c
index de6d226b455..83a5b8ffdcf 100644
--- a/tests/unit/test-smp-parse.c
+++ b/tests/unit/test-smp-parse.c
@@ -492,19 +492,19 @@ static void test_generic(void)
     Object *obj = object_new(TYPE_MACHINE);
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
 
     /* Force invalid min CPUs and max CPUs */
@@ -512,10 +512,10 @@ static void test_generic(void)
     mc->max_cpus = 511;
 
     for (i = 0; i < ARRAY_SIZE(data_generic_invalid); i++) {
-        *data = data_generic_invalid[i];
-        unsupported_params_init(mc, data);
+        data = data_generic_invalid[i];
+        unsupported_params_init(mc, &data);
 
-        smp_parse_test(ms, data, false);
+        smp_parse_test(ms, &data, false);
     }
 
     /* Reset the supported min CPUs and max CPUs */
@@ -530,47 +530,47 @@ static void test_with_dies(void)
     Object *obj = object_new(TYPE_MACHINE);
     MachineState *ms = MACHINE(obj);
     MachineClass *mc = MACHINE_GET_CLASS(obj);
-    SMPTestData *data = &(SMPTestData){{ }};
+    SMPTestData data = {};
     unsigned int num_dies = 2;
     int i;
 
     mc->smp_props.dies_supported = true;
 
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
2.31.1


