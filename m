Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D4F47477340
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Dec 2021 14:36:21 +0100 (CET)
Received: from localhost ([::1]:52988 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mxqvk-0002l2-VB
	for lists+qemu-devel@lfdr.de; Thu, 16 Dec 2021 08:36:20 -0500
Received: from eggs.gnu.org ([209.51.188.92]:37028)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mxqgV-0006gf-Be
 for qemu-devel@nongnu.org; Thu, 16 Dec 2021 08:20:35 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:44495)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mxqgS-0008Eu-SB
 for qemu-devel@nongnu.org; Thu, 16 Dec 2021 08:20:34 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1639660832;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=t0HaJa5hL0xbci94VgrhNJFI3KFO8etTJC6TchOuXSE=;
 b=gmOmqOvSyZSblzZDQz6Eb+0mK68ysT95jvjG7pRTNJ/0SlMG68lwULM31dAeeZWsPN8d8D
 IJTiI4IncUvLbsP0S8+fVwUbFDdJK2JYQ+Yqu43nx8IBOJcB468058/MMMvKgFSBZHDbLq
 4NwCTYYxSBNbn+r2GsqQu/wGmM1iheQ=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-605-DTm0DKXRMn2kh8ukrt-9GQ-1; Thu, 16 Dec 2021 08:20:31 -0500
X-MC-Unique: DTm0DKXRMn2kh8ukrt-9GQ-1
Received: by mail-wm1-f70.google.com with SMTP id
 l34-20020a05600c1d2200b00344d34754e4so1255273wms.7
 for <qemu-devel@nongnu.org>; Thu, 16 Dec 2021 05:20:31 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=t0HaJa5hL0xbci94VgrhNJFI3KFO8etTJC6TchOuXSE=;
 b=fdLHo6X9k5oo1uMoXaNJN/jf8hIAJhrsh3gqFE8PeX5nxNK0rF71MIQPFQ+YLe2j0t
 l8b/EjAN3wETy/UltNesbH2rvc/W/dQljw3GMSfin2sgSOCIZO/+nB1dcq8W3E7FqyI5
 JFY2nngHtkxDxkGFuLfsyJEvMoURL9GcFKdsoxNZdQ4jsdSr8Mt5GkcH9GgVREmMWReH
 dSFrd7epiKRMg6nST9/9fYzRb1fu6GDXmwg0K1SIuQB8ZcWHEmuTIXgQ0CumA5S/Md99
 fWTKdllug4c6u2ZyDArdBJ53H6YU/uoA7E/20Y6EEfPl7BZfFMwlakAOTvl6gqC1kL90
 nMnw==
X-Gm-Message-State: AOAM531g2jioZdhdIeQKm6NOH0zgvM8nLkZG98wDrk7js3FChGROZN/H
 cw9H/Tru4KfYx+UBxBfTQycMbqzVAVliQITFHeEAQGoZo04UzoM7HycXTiNZXXmEbA6LPL8mt5z
 skWJRDV23swDRJs0iqD4N8wDE67NQyHHZFdB+qhA+/cDi37IqGRd2Gdk90wdHp8lO
X-Received: by 2002:a5d:4486:: with SMTP id j6mr1263871wrq.160.1639660829932; 
 Thu, 16 Dec 2021 05:20:29 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwQ8DG5F2/GyHtKr4ceY/cv2HsvzJMgdXn0wjTMzUVOvZl4mD4Z+fq+HLBWqw1JPcGEtabUNg==
X-Received: by 2002:a5d:4486:: with SMTP id j6mr1263857wrq.160.1639660829743; 
 Thu, 16 Dec 2021 05:20:29 -0800 (PST)
Received: from localhost.localdomain
 (174.red-83-50-185.dynamicip.rima-tde.net. [83.50.185.174])
 by smtp.gmail.com with ESMTPSA id d13sm622953wru.41.2021.12.16.05.20.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Dec 2021 05:20:29 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v6 1/8] tests/unit/test-smp-parse: Pass machine type as
 argument to tests
Date: Thu, 16 Dec 2021 14:20:08 +0100
Message-Id: <20211216132015.815493-2-philmd@redhat.com>
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
Received-SPF: pass client-ip=170.10.129.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.718,
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


