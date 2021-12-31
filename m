Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DD652482413
	for <lists+qemu-devel@lfdr.de>; Fri, 31 Dec 2021 13:58:30 +0100 (CET)
Received: from localhost ([::1]:35416 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n3HUL-0003Pu-Tw
	for lists+qemu-devel@lfdr.de; Fri, 31 Dec 2021 07:58:30 -0500
Received: from eggs.gnu.org ([209.51.188.92]:53692)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1n3HLO-0006pq-C9
 for qemu-devel@nongnu.org; Fri, 31 Dec 2021 07:49:14 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:57287)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1n3HLM-0000oi-Bl
 for qemu-devel@nongnu.org; Fri, 31 Dec 2021 07:49:13 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1640954951;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=bClaEEXntH4eCLk8QgonvKJOvx/K9+KjgTtycd8N1c0=;
 b=QpKQ2b2tbbe7hmy9LYcNgoR8krME+IbtMQHFSIFciafg38NVCilW7o9ToCu6h9jhQlOSoP
 Zh5DcMWGM0nF+RZ28I+mZZi+oxJXmrJdwqffb2oqp0qTZ8PkkKWuR5EEJtyN8qe+SOF3bj
 HpqGskI3zHl7yEkp7gwYCUaitH9hVPA=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-617-KQxj2WK8P3Cnx-zSLd858A-1; Fri, 31 Dec 2021 07:49:11 -0500
X-MC-Unique: KQxj2WK8P3Cnx-zSLd858A-1
Received: by mail-wr1-f72.google.com with SMTP id
 k4-20020adfc704000000b001a32d86a772so4036773wrg.5
 for <qemu-devel@nongnu.org>; Fri, 31 Dec 2021 04:49:10 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=bClaEEXntH4eCLk8QgonvKJOvx/K9+KjgTtycd8N1c0=;
 b=SIJ1x5A/0aUwUKm5tIpc740szJ9USDX0GTQk8zv+pSRxOgC9bEGiVUk6eSD4hNMCQO
 PIZQHXPtYbi1J5ScSfCi8y7503PUbWAtraCZGD61j4G0jkYQDxa1jXwkzMJQJIqbFLt/
 G8cIvvTkTjKlpzq6SSy5qGlzqqe193nPNWoe4V3mRJtsfe42cf/H2xJJ7nHIB3wUDKW7
 QmQwHwcXflX6pgFAjmc6Ar5gTOjJxSXfqThe8njZrIeh9dhhgGEG6x1iN7NVS/QE0A4d
 zG/eaFhIXv/QB2v2bH/2zGmE+5NPf7rpP0vouLMxpFs98PsdV39RUGo6LM4IVpi+EAbs
 +6Wg==
X-Gm-Message-State: AOAM533GfGR86Q/ruDQmNgzu2jX5Ooi0xdD4ts/nB5hCitf0e8kEPvXp
 k9RCacAFWM4UsWGUr8VcnTcgZXGBzuzSR6kUrA3BDrcCpT03ExXWE/Ik8ks8Ilnerz4U6kHGqX+
 ZKvcQyu8l97DdQaei4SUE6ZPu/ZsTPPR1P4TGbwhOtPIWJjsYEU25otGl0dTa/wJC
X-Received: by 2002:a7b:cc90:: with SMTP id p16mr29756341wma.98.1640954949602; 
 Fri, 31 Dec 2021 04:49:09 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwWuCwwlXTyrcrYJKmEn7ys2XzdLsNHWQa3xdMufv+f+nHpUFYJbRjDgnt/SKcBQprZWli78Q==
X-Received: by 2002:a7b:cc90:: with SMTP id p16mr29756326wma.98.1640954949315; 
 Fri, 31 Dec 2021 04:49:09 -0800 (PST)
Received: from x1w.redhat.com (26.red-83-50-86.dynamicip.rima-tde.net.
 [83.50.86.26])
 by smtp.gmail.com with ESMTPSA id b14sm24166561wri.112.2021.12.31.04.49.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 31 Dec 2021 04:49:08 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 17/20] tests/unit/test-smp-parse: Keep default MIN/MAX CPUs in
 machine_base_class_init
Date: Fri, 31 Dec 2021 13:47:51 +0100
Message-Id: <20211231124754.1005747-18-philmd@redhat.com>
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
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Yanan Wang <wangyanan55@huawei.com>

Most machine types in test-smp-parse will be OK to have the default
MIN/MAX CPUs except "smp-generic-invalid", let's keep the default
values in machine_base_class_init which will be inherited. And if
we hope a different value for a specific machine, modify it in its
own initialization function.

Signed-off-by: Yanan Wang <wangyanan55@huawei.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Message-Id: <20211228092221.21068-7-wangyanan55@huawei.com>
Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 tests/unit/test-smp-parse.c | 16 ++--------------
 1 file changed, 2 insertions(+), 14 deletions(-)

diff --git a/tests/unit/test-smp-parse.c b/tests/unit/test-smp-parse.c
index 72d83d1bbc9..fdc39a846ca 100644
--- a/tests/unit/test-smp-parse.c
+++ b/tests/unit/test-smp-parse.c
@@ -523,15 +523,10 @@ static void machine_base_class_init(ObjectClass *oc, void *data)
 {
     MachineClass *mc = MACHINE_CLASS(oc);
 
-    mc->name = g_strdup(SMP_MACHINE_NAME);
-}
-
-static void machine_generic_valid_class_init(ObjectClass *oc, void *data)
-{
-    MachineClass *mc = MACHINE_CLASS(oc);
-
     mc->min_cpus = MIN_CPUS;
     mc->max_cpus = MAX_CPUS;
+
+    mc->name = g_strdup(SMP_MACHINE_NAME);
 }
 
 static void machine_generic_invalid_class_init(ObjectClass *oc, void *data)
@@ -547,9 +542,6 @@ static void machine_with_dies_class_init(ObjectClass *oc, void *data)
 {
     MachineClass *mc = MACHINE_CLASS(oc);
 
-    mc->min_cpus = MIN_CPUS;
-    mc->max_cpus = MAX_CPUS;
-
     mc->smp_props.dies_supported = true;
 }
 
@@ -557,9 +549,6 @@ static void machine_with_clusters_class_init(ObjectClass *oc, void *data)
 {
     MachineClass *mc = MACHINE_CLASS(oc);
 
-    mc->min_cpus = MIN_CPUS;
-    mc->max_cpus = MAX_CPUS;
-
     mc->smp_props.clusters_supported = true;
 }
 
@@ -718,7 +707,6 @@ static const TypeInfo smp_machine_types[] = {
     }, {
         .name           = MACHINE_TYPE_NAME("smp-generic-valid"),
         .parent         = TYPE_MACHINE,
-        .class_init     = machine_generic_valid_class_init,
     }, {
         .name           = MACHINE_TYPE_NAME("smp-generic-invalid"),
         .parent         = TYPE_MACHINE,
-- 
2.33.1


