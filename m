Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A2036475DE4
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Dec 2021 17:52:54 +0100 (CET)
Received: from localhost ([::1]:42658 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mxXWP-0007du-Gr
	for lists+qemu-devel@lfdr.de; Wed, 15 Dec 2021 11:52:53 -0500
Received: from eggs.gnu.org ([209.51.188.92]:34152)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mxXSx-0004TW-Qz
 for qemu-devel@nongnu.org; Wed, 15 Dec 2021 11:49:21 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:40138)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mxXSw-0001yu-Ce
 for qemu-devel@nongnu.org; Wed, 15 Dec 2021 11:49:19 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1639586957;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=GXx7W8UBpOZBRJ+rhAKMv79kybQ7cCiq3Z9AZnQ5faU=;
 b=VMHFT7AB4LY5hijKf6MQXsHezajteBCFui7IpTIzsHEM3G6kx2qu7p9tP6PYMG/KVuELkM
 2GkZlayL5xmjNwbx4Unzy4woGL9WUYdSxpWVrvpmRvwgTJU+zYYSIPGDBxB8Vfy24waQKz
 i9iqu36GOnfQACgZT9oDlXrV8g/9xHY=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-115-W9rqMpFlPRerC_zfuP-sYw-1; Wed, 15 Dec 2021 11:49:16 -0500
X-MC-Unique: W9rqMpFlPRerC_zfuP-sYw-1
Received: by mail-wm1-f69.google.com with SMTP id
 j25-20020a05600c1c1900b00332372c252dso9266535wms.1
 for <qemu-devel@nongnu.org>; Wed, 15 Dec 2021 08:49:16 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=GXx7W8UBpOZBRJ+rhAKMv79kybQ7cCiq3Z9AZnQ5faU=;
 b=0WAmafu+i0oJghrkLKkIiI5WyRTRKzPDhXuyqnEEeh6f0Un6wKuDGuphX+O4K3Q8mC
 QDAvlmyivzBMkC2vKbruZ4vwKUkxp7Cc6bnLTtNHYNFtxppeSKaPEJMZf/05fOu6A+AL
 mIRxn8x/Bj9XIcA5eWQjuqsGbMyDesz6fW0kzMPtgRZmseDyrdrbG6QMYfg8FMK3KfGS
 dSonWBJBzqmUeWcx7CkzkKaFvbqP+lkDIhpB4KKMF6yyTD23VL46UTTQL6A7jgczOWZd
 jcadeKdGZzYX0FF67NbhiObeziIuu5BNrlLINm9iMg1JU/oJYVt2nfkV5KDWErpRLpkV
 x2WA==
X-Gm-Message-State: AOAM533WV09VVcQ4glbfCBX9EH58hXllpIpOwzWYYh8Kte9meAa2LWlt
 HORh7sgTQgcX3T8I83FRtfq+R0cNyEJvyqzMv3204zeZcYkan8M1OK+9izfUNlPy7n8sFEPVzhd
 wfiI7zSTjVxgbCLI1erXZejjGU2xRR6xRO7/sW/hv8rMEzcPo0eHkCOb7ebYgDMLp
X-Received: by 2002:a05:6000:cd:: with SMTP id
 q13mr5327583wrx.488.1639586955214; 
 Wed, 15 Dec 2021 08:49:15 -0800 (PST)
X-Google-Smtp-Source: ABdhPJySnjyTdiPcc1h3etCGx8TgmtMe9GuGO1/2cJhrkebD7KlCmVh0OejZtO4Wolw7jo0abvs02g==
X-Received: by 2002:a05:6000:cd:: with SMTP id
 q13mr5327551wrx.488.1639586954864; 
 Wed, 15 Dec 2021 08:49:14 -0800 (PST)
Received: from localhost.localdomain
 (174.red-83-50-185.dynamicip.rima-tde.net. [83.50.185.174])
 by smtp.gmail.com with ESMTPSA id w15sm2428449wrk.77.2021.12.15.08.49.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 15 Dec 2021 08:49:14 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 2/8] tests/unit/test-smp-parse: Split the 'generic' test in
 valid / invalid
Date: Wed, 15 Dec 2021 17:48:50 +0100
Message-Id: <20211215164856.381990-3-philmd@redhat.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211215164856.381990-1-philmd@redhat.com>
References: <20211215164856.381990-1-philmd@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.719,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

Split the 'generic' test in two tests: 'valid' and 'invalid'.
This will allow us to remove the hack which modifies the
MachineClass internal state.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Yanan Wang <wangyanan55@huawei.com>
Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 tests/unit/test-smp-parse.c | 21 ++++++++++++++++++---
 1 file changed, 18 insertions(+), 3 deletions(-)

diff --git a/tests/unit/test-smp-parse.c b/tests/unit/test-smp-parse.c
index 37c6b4981db..425ed6b6b92 100644
--- a/tests/unit/test-smp-parse.c
+++ b/tests/unit/test-smp-parse.c
@@ -487,7 +487,7 @@ static void machine_base_class_init(ObjectClass *oc, void *data)
     mc->name = g_strdup(SMP_MACHINE_NAME);
 }
 
-static void test_generic(const void *opaque)
+static void test_generic_valid(const void *opaque)
 {
     const char *machine_type = opaque;
     Object *obj = object_new(machine_type);
@@ -508,6 +508,18 @@ static void test_generic(const void *opaque)
         smp_parse_test(ms, data, true);
     }
 
+    object_unref(obj);
+}
+
+static void test_generic_invalid(const void *opaque)
+{
+    const char *machine_type = opaque;
+    Object *obj = object_new(machine_type);
+    MachineState *ms = MACHINE(obj);
+    MachineClass *mc = MACHINE_GET_CLASS(obj);
+    SMPTestData *data = &(SMPTestData){};
+    int i;
+
     /* Force invalid min CPUs and max CPUs */
     mc->min_cpus = 2;
     mc->max_cpus = 511;
@@ -601,9 +613,12 @@ int main(int argc, char *argv[])
 
     g_test_init(&argc, &argv, NULL);
 
-    g_test_add_data_func("/test-smp-parse/generic",
+    g_test_add_data_func("/test-smp-parse/generic/valid",
                          TYPE_MACHINE,
-                         test_generic);
+                         test_generic_valid);
+    g_test_add_data_func("/test-smp-parse/generic/invalid",
+                         TYPE_MACHINE,
+                         test_generic_invalid);
     g_test_add_data_func("/test-smp-parse/with_dies",
                          TYPE_MACHINE,
                          test_with_dies);
-- 
2.33.1


