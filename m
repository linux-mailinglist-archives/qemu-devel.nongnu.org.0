Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D9D53477311
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Dec 2021 14:24:17 +0100 (CET)
Received: from localhost ([::1]:38208 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mxqk2-0000aC-QC
	for lists+qemu-devel@lfdr.de; Thu, 16 Dec 2021 08:24:16 -0500
Received: from eggs.gnu.org ([209.51.188.92]:37084)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mxqgj-0006kH-Km
 for qemu-devel@nongnu.org; Thu, 16 Dec 2021 08:20:49 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:40725)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mxqgi-0008H8-5E
 for qemu-devel@nongnu.org; Thu, 16 Dec 2021 08:20:49 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1639660836;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=GXx7W8UBpOZBRJ+rhAKMv79kybQ7cCiq3Z9AZnQ5faU=;
 b=dt7P8QgxZGdQgPZCwqvjTcUp41vxBh+lTps0r1tLOUxr7i41TrWDv544FHo0nO2gq0/xQp
 OX1ah0QSApB0DuFxMWc9JpobBct20lxkdyVKIT/C1JaCuk1IqZ1YtP/FuHBlcgjCCYJRem
 rriuffGlUWVgfc3n2SnNRxJtpARXmNc=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-416-LUlLDJtkPeag5jDX-2XWtw-1; Thu, 16 Dec 2021 08:20:35 -0500
X-MC-Unique: LUlLDJtkPeag5jDX-2XWtw-1
Received: by mail-wm1-f69.google.com with SMTP id
 i15-20020a05600c354f00b0034566ac865bso2054940wmq.6
 for <qemu-devel@nongnu.org>; Thu, 16 Dec 2021 05:20:35 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=GXx7W8UBpOZBRJ+rhAKMv79kybQ7cCiq3Z9AZnQ5faU=;
 b=e/7x6mO9GcN8OkoqwsU3zZcGyBRvtoJMy48ksRPWpeBlG+C0Thr23M04DlyQhAhGtI
 s1cQxL3TaS/cF1L9PwmEnDqImwffpp5GIJ4Th83vLpaju0SG1ofzAPhwBE3/pYz1Va1P
 5Xn0vjLJu5lHcBrAc+aNAlt9n76wjCPdAwSIjkTeDLS1MF/mUIpi1DzLWqwBiqCod719
 DBRRMamcl1MrPIsvwNWiadxSS3VAw+KxBxfndxjCIZIeFk/ExrOzPsaNWbWb4LPDbEBZ
 7NRd3fcdDFLJges9txfrYgP8RpInjD+rq2VkBk0qDBBXCIOlIH0nDwf3oQgFmJ5Y18e9
 ATmw==
X-Gm-Message-State: AOAM530mbaNY62KkCxWCXsEgXqZI2RAgO0/q3If4zZ9l8I8wE2hi4uZk
 kcBcFKmWK/u7TGe7vbD9uWIlqMHrVtuP/WwL4yePeqt4JI6beZW38N0jLsHrmQY8iEeixN1BUMb
 UDJWLojXfap2UZyyfzL/CHiLKqpc9uf3E2gZ0eat5pz1HuKFwIDecOa1EjkrU9/Ae
X-Received: by 2002:adf:f40b:: with SMTP id g11mr2246648wro.645.1639660834244; 
 Thu, 16 Dec 2021 05:20:34 -0800 (PST)
X-Google-Smtp-Source: ABdhPJw0ivJJuE7YYVPPtmTmDxTvvNMxH4jY1xs7qs0KFisPeXoVwTJUJVCYOIyMABEJ5KhM1mUpvg==
X-Received: by 2002:adf:f40b:: with SMTP id g11mr2246626wro.645.1639660834009; 
 Thu, 16 Dec 2021 05:20:34 -0800 (PST)
Received: from localhost.localdomain
 (174.red-83-50-185.dynamicip.rima-tde.net. [83.50.185.174])
 by smtp.gmail.com with ESMTPSA id b13sm4913829wrh.32.2021.12.16.05.20.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Dec 2021 05:20:33 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v6 2/8] tests/unit/test-smp-parse: Split the 'generic' test in
 valid / invalid
Date: Thu, 16 Dec 2021 14:20:09 +0100
Message-Id: <20211216132015.815493-3-philmd@redhat.com>
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


