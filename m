Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 12F5E477360
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Dec 2021 14:42:20 +0100 (CET)
Received: from localhost ([::1]:38338 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mxr1X-0003o2-6p
	for lists+qemu-devel@lfdr.de; Thu, 16 Dec 2021 08:42:19 -0500
Received: from eggs.gnu.org ([209.51.188.92]:37112)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mxqgk-0006kw-RF
 for qemu-devel@nongnu.org; Thu, 16 Dec 2021 08:20:51 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:51238)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mxqgi-0008KT-8B
 for qemu-devel@nongnu.org; Thu, 16 Dec 2021 08:20:50 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1639660840;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=1chFsAOK0rTvA7TehLOkyqZafZUrvfp4t7SGxNleGGw=;
 b=UKeLArtn1mF4w2MoUm378xRwmxnSMd/SuSSe66zY/2yCyDizXpks/xeLCZvFQQC8YLAnm7
 /Rw3I8iFGoESb/qncik8hxgtxTi9Y1ENAzja0CFd814To3GP0bpv9hEbQD3pRH2GuKalmd
 0YJORsljHTNI7tNRkU3nkq20FkOZMQY=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-516-SMOq3L9vO1eVUALNuFvAYA-1; Thu, 16 Dec 2021 08:20:40 -0500
X-MC-Unique: SMOq3L9vO1eVUALNuFvAYA-1
Received: by mail-wm1-f70.google.com with SMTP id
 ay17-20020a05600c1e1100b0033f27b76819so13809199wmb.4
 for <qemu-devel@nongnu.org>; Thu, 16 Dec 2021 05:20:39 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=1chFsAOK0rTvA7TehLOkyqZafZUrvfp4t7SGxNleGGw=;
 b=K1QDxW945YZgWKBIj/JcpKP8tt2IJ4YKHELj5t/mu1XvRGYQlni9bI/ICuO5wRvH/p
 vYzL4a0nBWnb3tNjOQ2oFhyccDKSJQvjNEpL1C/3Ex9mPMOL5L2cl++HfSSIGsKiIv9W
 9RnGMWVdy56IVc60oT9Et05e4rlluoChUNUQNWaH5iiN4ZsOl82FAdVOKD1Rn/A2IkIR
 CDwL21EjP212ndE8LYaLJbdlTNdWlN0fS+NQA5ZfBkusqZ3qdNb+n9rLgRkUh1wwS8b1
 AOUXt/aElDxscA156mVZVfb/hLxyQ/EMHEHIjro0WiDzaitU/PI+/gcNjqudDDgyscDb
 FYcQ==
X-Gm-Message-State: AOAM532GqlQCH15yMPLcY70QP3Bz9CllfyNDZ/+7D7O+E3XYXzAmQX+R
 wGHQ5os36iSIJfWYNWptwnYlnYArruh06jTcuTkcZfqQz1q9/2VQsr3WKjnhUH8U1zANwopeGV5
 pTH9Fv1UyWuoztX9nDKJpc8M6c1bmereAIlhfCb+JK3rTpAWbVV3m1N6Euxl3+7os
X-Received: by 2002:a05:6000:104c:: with SMTP id
 c12mr8638553wrx.588.1639660838581; 
 Thu, 16 Dec 2021 05:20:38 -0800 (PST)
X-Google-Smtp-Source: ABdhPJz9FyDLN2KLSJxbfwjviG1yY8ZaRuGTvyxYv7cYvz73wWlktpKvitGPeP6AifT0+LQF5uwrZQ==
X-Received: by 2002:a05:6000:104c:: with SMTP id
 c12mr8638525wrx.588.1639660838335; 
 Thu, 16 Dec 2021 05:20:38 -0800 (PST)
Received: from localhost.localdomain
 (174.red-83-50-185.dynamicip.rima-tde.net. [83.50.185.174])
 by smtp.gmail.com with ESMTPSA id t11sm4597752wrz.97.2021.12.16.05.20.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Dec 2021 05:20:37 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v6 3/8] tests/unit/test-smp-parse: Add 'smp-with-dies' machine
 type
Date: Thu, 16 Dec 2021 14:20:10 +0100
Message-Id: <20211216132015.815493-4-philmd@redhat.com>
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
 Yanan Wang <wangyanan55@huawei.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Avoid modifying the MachineClass internals by adding the
'smp-with-dies' machine, which inherits from TYPE_MACHINE.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Yanan Wang <wangyanan55@huawei.com>
Tested-by: Yanan Wang <wangyanan55@huawei.com>
Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 tests/unit/test-smp-parse.c | 22 +++++++++++++++-------
 1 file changed, 15 insertions(+), 7 deletions(-)

diff --git a/tests/unit/test-smp-parse.c b/tests/unit/test-smp-parse.c
index 425ed6b6b92..f66cf7bb598 100644
--- a/tests/unit/test-smp-parse.c
+++ b/tests/unit/test-smp-parse.c
@@ -487,6 +487,16 @@ static void machine_base_class_init(ObjectClass *oc, void *data)
     mc->name = g_strdup(SMP_MACHINE_NAME);
 }
 
+static void machine_with_dies_class_init(ObjectClass *oc, void *data)
+{
+    MachineClass *mc = MACHINE_CLASS(oc);
+
+    mc->min_cpus = MIN_CPUS;
+    mc->max_cpus = MAX_CPUS;
+
+    mc->smp_props.dies_supported = true;
+}
+
 static void test_generic_valid(const void *opaque)
 {
     const char *machine_type = opaque;
@@ -548,9 +558,6 @@ static void test_with_dies(const void *opaque)
     unsigned int num_dies = 2;
     int i;
 
-    /* Force the SMP compat properties */
-    mc->smp_props.dies_supported = true;
-
     for (i = 0; i < ARRAY_SIZE(data_generic_valid); i++) {
         *data = data_generic_valid[i];
         unsupported_params_init(mc, data);
@@ -588,9 +595,6 @@ static void test_with_dies(const void *opaque)
         smp_parse_test(ms, data, false);
     }
 
-    /* Restore the SMP compat properties */
-    mc->smp_props.dies_supported = false;
-
     object_unref(obj);
 }
 
@@ -602,6 +606,10 @@ static const TypeInfo smp_machine_types[] = {
         .class_init     = machine_base_class_init,
         .class_size     = sizeof(MachineClass),
         .instance_size  = sizeof(MachineState),
+    }, {
+        .name           = MACHINE_TYPE_NAME("smp-with-dies"),
+        .parent         = TYPE_MACHINE,
+        .class_init     = machine_with_dies_class_init,
     }
 };
 
@@ -620,7 +628,7 @@ int main(int argc, char *argv[])
                          TYPE_MACHINE,
                          test_generic_invalid);
     g_test_add_data_func("/test-smp-parse/with_dies",
-                         TYPE_MACHINE,
+                         MACHINE_TYPE_NAME("smp-with-dies"),
                          test_with_dies);
 
     g_test_run();
-- 
2.33.1


