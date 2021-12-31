Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B336482418
	for <lists+qemu-devel@lfdr.de>; Fri, 31 Dec 2021 14:05:26 +0100 (CET)
Received: from localhost ([::1]:43648 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n3Hb0-0000ww-5i
	for lists+qemu-devel@lfdr.de; Fri, 31 Dec 2021 08:05:23 -0500
Received: from eggs.gnu.org ([209.51.188.92]:53476)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1n3HKj-0006G3-TW
 for qemu-devel@nongnu.org; Fri, 31 Dec 2021 07:48:34 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:44344)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1n3HKi-0000l1-94
 for qemu-devel@nongnu.org; Fri, 31 Dec 2021 07:48:33 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1640954911;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=LZnXNA41P8rnHQZzG3aZIcc3lAwNKADYkmB/wiXRFOM=;
 b=KBtkP2HNnyDIWwcUW4YQ3CUl0B7aJjSi06LX6CtnhUvuy20OVDxJJf8zcpIjiKmoCCB5ci
 nrM7J1ItAoh1sFg7lzbU9/D3esxXNCQZCPeCytBOo7ru7M0AEoLbinXreFqw4rN1N0j6jY
 5w0jP5OcUanKIjMdwFErYuseMtfLa6M=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-274-7zwrb-K-P-21yXO-YS4Ybg-1; Fri, 31 Dec 2021 07:48:27 -0500
X-MC-Unique: 7zwrb-K-P-21yXO-YS4Ybg-1
Received: by mail-wr1-f70.google.com with SMTP id
 d6-20020adfa346000000b001a262748c6fso7497666wrb.12
 for <qemu-devel@nongnu.org>; Fri, 31 Dec 2021 04:48:27 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=LZnXNA41P8rnHQZzG3aZIcc3lAwNKADYkmB/wiXRFOM=;
 b=WSLSvlqvcUr9jXIhmYlxzL6dFNZgxqTvSLcMDo/X98qnaYS9sx1Kk6+WYKKlK2PoGH
 u63qfhIIHB3fEwnECYRKL56j9N3qvkfv77GceeGPLD8N13xADcaRLB+28tG+EdkZoIRs
 19ef+89ww4N6GZWVtM6Wc4Ec/Ons1Q8XpYNy5VRmhrhn2jlKv/k463Q/1YncqXdIaPIF
 JLcfn/cgo+fJsWs3hMCzd4hjJprUmZe+ie2TBpj3OnqEU9ZqKzL9n80TLocYpyypT3+G
 dGyoHx7TuGZ72YkrX5WmPEDTvgew2CENQFgTFGqe6FVpPqNS/b6di6GpsVR5x3SAt5Wz
 iZ1A==
X-Gm-Message-State: AOAM532ngmYmR8GItk7aNUUyUTrMUWXt2fEIa6bPiL3giQm10G44YLWU
 NMnqzLvVCMJTBdgmOnPgylGAjHAkCKhKule1j3/PLAyR8fUTsZpkbe9a5qEvYgjx299RkVUbYGq
 4c68dIpvrWS4OokX5gl9/Ra+CPsRXqQ3ia2ycPy3pI1TK88a7YmpVdydXyNUHor7w
X-Received: by 2002:a05:600c:1c26:: with SMTP id
 j38mr29484090wms.101.1640954906414; 
 Fri, 31 Dec 2021 04:48:26 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwyKs2Fn/4Ysvytqby1xZZsHJbDEmw2T9jWMcZMHMLmEooeT9Tc58gFht5kTWivmv8ogzCxsw==
X-Received: by 2002:a05:600c:1c26:: with SMTP id
 j38mr29484075wms.101.1640954906190; 
 Fri, 31 Dec 2021 04:48:26 -0800 (PST)
Received: from x1w.redhat.com (26.red-83-50-86.dynamicip.rima-tde.net.
 [83.50.86.26])
 by smtp.gmail.com with ESMTPSA id o12sm26897129wrv.76.2021.12.31.04.48.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 31 Dec 2021 04:48:25 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 07/20] tests/unit/test-smp-parse: Add 'smp-with-dies' machine
 type
Date: Fri, 31 Dec 2021 13:47:41 +0100
Message-Id: <20211231124754.1005747-8-philmd@redhat.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211231124754.1005747-1-philmd@redhat.com>
References: <20211231124754.1005747-1-philmd@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) DKIMWL_WL_HIGH=-0.573, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Yanan Wang <wangyanan55@huawei.com>, Eduardo Habkost <eduardo@habkost.net>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Avoid modifying the MachineClass internals by adding the
'smp-with-dies' machine, which inherits from TYPE_MACHINE.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Yanan Wang <wangyanan55@huawei.com>
Tested-by: Yanan Wang <wangyanan55@huawei.com>
Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Message-Id: <20211216132015.815493-4-philmd@redhat.com>
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


