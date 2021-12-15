Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A6A4475E07
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Dec 2021 17:58:48 +0100 (CET)
Received: from localhost ([::1]:59134 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mxXc7-00023H-Mh
	for lists+qemu-devel@lfdr.de; Wed, 15 Dec 2021 11:58:47 -0500
Received: from eggs.gnu.org ([209.51.188.92]:34132)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mxXSv-0004TR-G3
 for qemu-devel@nongnu.org; Wed, 15 Dec 2021 11:49:19 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:52408)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mxXSu-0001yl-3v
 for qemu-devel@nongnu.org; Wed, 15 Dec 2021 11:49:17 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1639586953;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=t0HaJa5hL0xbci94VgrhNJFI3KFO8etTJC6TchOuXSE=;
 b=D6KApL2/N+DpfHszngJAjObY8/+QiSRXh7xt8FJsJU32/i2RoHSDmZ/YYqZZqjlPPYDT8w
 rY3Kj7zIRi1v9cTLz7Of4MRpq6Mc5VqaslEu+fVS6atXATLJyhDgwj6TaguyR3qhBe6N5Y
 1DaFQ21cI8ywmy29aKc2u4x1otrFY60=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-110-NJbcAciCORqZhH_EL14tRw-1; Wed, 15 Dec 2021 11:49:12 -0500
X-MC-Unique: NJbcAciCORqZhH_EL14tRw-1
Received: by mail-wm1-f69.google.com with SMTP id
 k25-20020a05600c1c9900b00332f798ba1dso14892898wms.4
 for <qemu-devel@nongnu.org>; Wed, 15 Dec 2021 08:49:11 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=t0HaJa5hL0xbci94VgrhNJFI3KFO8etTJC6TchOuXSE=;
 b=2u5j7VxewWzQJcp5v/fcfu7jGZq3/09rV3xTBbpK/mHxvdCXidWMIN8ect4v+zWdgw
 fqIQJakDEZ7TRKM3+ViU9qpRfEm12xTy7YUeobkXxQt9zT1EjgVyNDpViYvKD8Nu5lTz
 ByPmfRiwMLHrRYFqZSgTeC+tepBfj5wu1gKRAcS+Bau+YdDOllBiWXqU9PgactaY5JDY
 eWkdM8QKgh91LJ4ytrfjIQO17MAU3Mp4Q5qD7kjNshX2OUDS/EErMjcij+6IyCSBl5n4
 +MvnbV31qo8V0m9qvsxeDjDTcP2lxxozgvywOvLpm0AJycvmvC4sUStalP/ygIsPgXHd
 MphQ==
X-Gm-Message-State: AOAM5312j3xd1LTgFTxUnoT2GSbECF4uiB32+lRV8iXd4EPxuBnNtfVR
 vtzjiEzipA+ZuHdAZVNBdVwV8TJDsHzCY5eajbobCjJbdF+DL+FbFctC3fouUfPQUEBj0bCLZLr
 YZuvGyyGMiCAHlcMHxBE3qLPQ8Wp9YWjS9W5/YKD9QkMhzmJyxj66xdBHt4z13ino
X-Received: by 2002:adf:ce08:: with SMTP id p8mr5261319wrn.154.1639586950615; 
 Wed, 15 Dec 2021 08:49:10 -0800 (PST)
X-Google-Smtp-Source: ABdhPJy4BJQagz8bKCSuYyL0rib/QaODn0P2WzfvKuta6q12qVha+fVsACKfLrpg4NpukFFKeJht0w==
X-Received: by 2002:adf:ce08:: with SMTP id p8mr5261299wrn.154.1639586950448; 
 Wed, 15 Dec 2021 08:49:10 -0800 (PST)
Received: from localhost.localdomain
 (174.red-83-50-185.dynamicip.rima-tde.net. [83.50.185.174])
 by smtp.gmail.com with ESMTPSA id w17sm2604355wmc.14.2021.12.15.08.49.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 15 Dec 2021 08:49:10 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 1/8] tests/unit/test-smp-parse: Pass machine type as
 argument to tests
Date: Wed, 15 Dec 2021 17:48:49 +0100
Message-Id: <20211215164856.381990-2-philmd@redhat.com>
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
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.719,
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

Use g_test_add_data_func() instead of g_test_add_func() so we can
pass the machine type to the tests (we will soon have different
machine types).

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Yanan Wang <wangyanan55@huawei.com>
Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 tests/unit/test-smp-parse.c | 18 ++++++++++++------
 1 file changed, 12 insertions(+), 6 deletions(-)

diff --git a/tests/unit/test-smp-parse.c b/tests/unit/test-smp-parse.c
index b02450e25a3..37c6b4981db 100644
--- a/tests/unit/test-smp-parse.c
+++ b/tests/unit/test-smp-parse.c
@@ -487,9 +487,10 @@ static void machine_base_class_init(ObjectClass *oc, void *data)
     mc->name = g_strdup(SMP_MACHINE_NAME);
 }
 
-static void test_generic(void)
+static void test_generic(const void *opaque)
 {
-    Object *obj = object_new(TYPE_MACHINE);
+    const char *machine_type = opaque;
+    Object *obj = object_new(machine_type);
     MachineState *ms = MACHINE(obj);
     MachineClass *mc = MACHINE_GET_CLASS(obj);
     SMPTestData *data = &(SMPTestData){{ }};
@@ -525,9 +526,10 @@ static void test_generic(void)
     object_unref(obj);
 }
 
-static void test_with_dies(void)
+static void test_with_dies(const void *opaque)
 {
-    Object *obj = object_new(TYPE_MACHINE);
+    const char *machine_type = opaque;
+    Object *obj = object_new(machine_type);
     MachineState *ms = MACHINE(obj);
     MachineClass *mc = MACHINE_GET_CLASS(obj);
     SMPTestData *data = &(SMPTestData){{ }};
@@ -599,8 +601,12 @@ int main(int argc, char *argv[])
 
     g_test_init(&argc, &argv, NULL);
 
-    g_test_add_func("/test-smp-parse/generic", test_generic);
-    g_test_add_func("/test-smp-parse/with_dies", test_with_dies);
+    g_test_add_data_func("/test-smp-parse/generic",
+                         TYPE_MACHINE,
+                         test_generic);
+    g_test_add_data_func("/test-smp-parse/with_dies",
+                         TYPE_MACHINE,
+                         test_with_dies);
 
     g_test_run();
 
-- 
2.33.1


