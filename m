Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 54840482421
	for <lists+qemu-devel@lfdr.de>; Fri, 31 Dec 2021 14:13:00 +0100 (CET)
Received: from localhost ([::1]:51928 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n3HiM-0006sz-UA
	for lists+qemu-devel@lfdr.de; Fri, 31 Dec 2021 08:12:58 -0500
Received: from eggs.gnu.org ([209.51.188.92]:53504)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1n3HKp-0006Q9-V0
 for qemu-devel@nongnu.org; Fri, 31 Dec 2021 07:48:40 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:44599)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1n3HKo-0000lP-3T
 for qemu-devel@nongnu.org; Fri, 31 Dec 2021 07:48:39 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1640954917;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=nbR8NxQZs7YkrQ3yuCz8vFimELBnb1M3sZi54BOV0WM=;
 b=QPhyGC+E9gq0U4P9wWe78ESIaOr1NcJHaVN3s/Wytb2970bwK64u0WojfzX3mvCr1Snfwn
 MWnCSb1coktiVighL0hKmP3Qi40M2UQjD7V+R+w/gGlk1dKSAr5ztJj+pHX2sNh7pxcCf5
 gUAEHHMvyUOGS1yJ0DIflOnde71ZTDU=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-237-dwRSv64hON-79luu0s5ATw-1; Fri, 31 Dec 2021 07:48:36 -0500
X-MC-Unique: dwRSv64hON-79luu0s5ATw-1
Received: by mail-wr1-f71.google.com with SMTP id
 v18-20020a5d5912000000b001815910d2c0so7547137wrd.1
 for <qemu-devel@nongnu.org>; Fri, 31 Dec 2021 04:48:36 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=nbR8NxQZs7YkrQ3yuCz8vFimELBnb1M3sZi54BOV0WM=;
 b=HVZgzWGrmL8j4Rj8e0ILowxlp6nuOr1CewszuHFYrm+LXWMedn9KXlwFeKstx8yuPp
 b7o6fW4B4uAwD4qgh5Am7UjJOA/bXaPN6ZoNjzlx2q1/7jZAZEiXbEjsSy5WtqgSsRqT
 JZTFsqFw58InT8+mTfrkbZ0HMX78JSnsuQaA5i7b0Ec921BA7qReGXNtVrkI5V2JLYze
 v7UXU4KOcbNoNVMw3JQClzEPLxuaKNQLD1xvfZElwpRy2kpklU19q3QhBCm3BX8C4T4R
 ypCU6n1UPM6LQPzBi/FPTv+WxgFy3KFWoytJMT9TeXtHn8C//PaGV35wcebqoA+qJB1K
 eIKw==
X-Gm-Message-State: AOAM532LGSPe56N7SsmgSTGUrygqn5+QZgx6kln7q0X0sKgVlC1zslop
 WW6pFtar0DotI9o2oSny/rIZFl3oc0d2Eu+IQbjaroBNfNY+xJUDZKZ5FvEsKn+BZS3iw5MxmuN
 0BgU5jkUfO6dFkxhtuoHXmrOMG9I5FmdfkbfnYBQpNo0trg8wEwfP/bmr+/RVDP0M
X-Received: by 2002:a05:6000:184e:: with SMTP id
 c14mr28538590wri.265.1640954915138; 
 Fri, 31 Dec 2021 04:48:35 -0800 (PST)
X-Google-Smtp-Source: ABdhPJy9YE/5NIGr9Y/NjiZIWtunOEs/HjJFI7BIHdtYrVBFQPtZuaY6MJYxcWN73YRQLGbS81iaYQ==
X-Received: by 2002:a05:6000:184e:: with SMTP id
 c14mr28538574wri.265.1640954914805; 
 Fri, 31 Dec 2021 04:48:34 -0800 (PST)
Received: from x1w.redhat.com (26.red-83-50-86.dynamicip.rima-tde.net.
 [83.50.86.26])
 by smtp.gmail.com with ESMTPSA id s1sm28612788wmh.35.2021.12.31.04.48.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 31 Dec 2021 04:48:34 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 09/20] tests/unit/test-smp-parse: Add 'smp-generic-valid'
 machine type
Date: Fri, 31 Dec 2021 13:47:43 +0100
Message-Id: <20211231124754.1005747-10-philmd@redhat.com>
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
Received-SPF: pass client-ip=170.10.129.124; envelope-from=philmd@redhat.com;
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

Keep the common TYPE_MACHINE class initialization in
machine_base_class_init(), make it abstract, and move
the non-common code to a new class: "smp-generic-valid".

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Reviewed-by: Yanan Wang <wangyanan55@huawei.com>
Message-Id: <20211216132015.815493-6-philmd@redhat.com>
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


