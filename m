Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DA98D477312
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Dec 2021 14:24:17 +0100 (CET)
Received: from localhost ([::1]:38320 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mxqk4-0000eh-PP
	for lists+qemu-devel@lfdr.de; Thu, 16 Dec 2021 08:24:16 -0500
Received: from eggs.gnu.org ([209.51.188.92]:37126)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mxqgl-0006kx-Mz
 for qemu-devel@nongnu.org; Thu, 16 Dec 2021 08:20:51 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:25670)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mxqgk-0008Mx-AW
 for qemu-devel@nongnu.org; Thu, 16 Dec 2021 08:20:51 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1639660849;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=HqXPiCt79z3PGUD6iKjmKupwIGk6gXPKMLdUw9UGyco=;
 b=OV8BX+MG6muGqbBNUaGIrtii6URCrsNFVfdHRbY8T4IOn4GBfK3ZVs1ROMtNbjXHJtjPnW
 stvqnpIcCIKYhvxLhFDYffBBktw0uZ9xVwWFi8vvO4H+FLm4hCpIC0akKuoBrgeAlgZA3e
 e3QSU5QfQwKHBTKBRXIQ/sHL/ZEssr8=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-626-9a_N-uKkN0aLJz0BZ5S37A-1; Thu, 16 Dec 2021 08:20:48 -0500
X-MC-Unique: 9a_N-uKkN0aLJz0BZ5S37A-1
Received: by mail-wm1-f69.google.com with SMTP id
 m14-20020a05600c3b0e00b0033308dcc933so10277909wms.7
 for <qemu-devel@nongnu.org>; Thu, 16 Dec 2021 05:20:48 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=HqXPiCt79z3PGUD6iKjmKupwIGk6gXPKMLdUw9UGyco=;
 b=dKTKIeDlxiZ0Q0BksyDfgbtXVsL/Xo1PN18MaDYtpR0lOVLQxuT5oRgPwCHz0vOcr9
 H3LxpeLH1+xLsaDFaOba2VR2DZIPUHppcgyFMxAsB+1nMqH2X24/TaCRY6lhLtiMkn9s
 i1jsfuIAu2d6kGQjsXFkKAPzpUKqzFwpI8admfV+OHwhCmwN1jsMf4pj9lLgAW5mtmGI
 ug5O8cyOZbLnwthAJyZziS79XLWBa6gMCSobg9shzMzcV6LpOQnwMlskciw8wfXBS1Si
 ERnA1Ievnadkcy5VhJNn3ZhxZKnOvZ9MC7Wrw5HCW9RteMuqzN3TOzKihVKKqkFJVplV
 I9Ng==
X-Gm-Message-State: AOAM532qP8v0ihVCxTUpyX5Akpjh2n+izkMAxdRgJCP4OCgNVR5fnoNE
 7eIwwPWxHfbpzHTYARHoE5d0skVThyYNrSRVjnRG/LeibV2KiJpGMlKnSDyvwsQ6baOawqUbekZ
 qTk/FEzmuScINLVLvETfoLyA2BWSrDP/X9WyOq+mtqphAakRA1I1S5H3SoNvyud/D
X-Received: by 2002:a1c:e915:: with SMTP id q21mr5156156wmc.94.1639660847241; 
 Thu, 16 Dec 2021 05:20:47 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzTfBEZYFWlOjEVkuNxIRychZ9SzNiZ9yOpxrRedeLrrvVnM2qwi8cxU9rFC8MNaw+Ay9QUcg==
X-Received: by 2002:a1c:e915:: with SMTP id q21mr5156131wmc.94.1639660846988; 
 Thu, 16 Dec 2021 05:20:46 -0800 (PST)
Received: from localhost.localdomain
 (174.red-83-50-185.dynamicip.rima-tde.net. [83.50.185.174])
 by smtp.gmail.com with ESMTPSA id f18sm4663357wre.7.2021.12.16.05.20.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Dec 2021 05:20:46 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v6 5/8] tests/unit/test-smp-parse: Add 'smp-generic-valid'
 machine type
Date: Thu, 16 Dec 2021 14:20:12 +0100
Message-Id: <20211216132015.815493-6-philmd@redhat.com>
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
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Keep the common TYPE_MACHINE class initialization in
machine_base_class_init(), make it abstract, and move
the non-common code to a new class: "smp-generic-valid".

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 tests/unit/test-smp-parse.c | 19 +++++++++++++++----
 1 file changed, 15 insertions(+), 4 deletions(-)

diff --git a/tests/unit/test-smp-parse.c b/tests/unit/test-smp-parse.c
index 47e11089e22..b20bf2c2359 100644
--- a/tests/unit/test-smp-parse.c
+++ b/tests/unit/test-smp-parse.c
@@ -478,13 +478,19 @@ static void machine_base_class_init(ObjectClass *oc, void *data)
 {
     MachineClass *mc = MACHINE_CLASS(oc);
 
+    mc->smp_props.prefer_sockets = true;
+
+    mc->name = g_strdup(SMP_MACHINE_NAME);
+}
+
+static void machine_generic_valid_class_init(ObjectClass *oc, void *data)
+{
+    MachineClass *mc = MACHINE_CLASS(oc);
+
     mc->min_cpus = MIN_CPUS;
     mc->max_cpus = MAX_CPUS;
 
-    mc->smp_props.prefer_sockets = true;
     mc->smp_props.dies_supported = false;
-
-    mc->name = g_strdup(SMP_MACHINE_NAME);
 }
 
 static void machine_generic_invalid_class_init(ObjectClass *oc, void *data)
@@ -606,9 +612,14 @@ static const TypeInfo smp_machine_types[] = {
     {
         .name           = TYPE_MACHINE,
         .parent         = TYPE_OBJECT,
+        .abstract       = true,
         .class_init     = machine_base_class_init,
         .class_size     = sizeof(MachineClass),
         .instance_size  = sizeof(MachineState),
+    }, {
+        .name           = MACHINE_TYPE_NAME("smp-generic-valid"),
+        .parent         = TYPE_MACHINE,
+        .class_init     = machine_generic_valid_class_init,
     }, {
         .name           = MACHINE_TYPE_NAME("smp-generic-invalid"),
         .parent         = TYPE_MACHINE,
@@ -629,7 +640,7 @@ int main(int argc, char *argv[])
     g_test_init(&argc, &argv, NULL);
 
     g_test_add_data_func("/test-smp-parse/generic/valid",
-                         TYPE_MACHINE,
+                         MACHINE_TYPE_NAME("smp-generic-valid"),
                          test_generic_valid);
     g_test_add_data_func("/test-smp-parse/generic/invalid",
                          MACHINE_TYPE_NAME("smp-generic-invalid"),
-- 
2.33.1


