Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BB2244D4B5
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Nov 2021 11:06:56 +0100 (CET)
Received: from localhost ([::1]:40782 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ml6yt-00035N-5h
	for lists+qemu-devel@lfdr.de; Thu, 11 Nov 2021 05:06:55 -0500
Received: from eggs.gnu.org ([209.51.188.92]:35624)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1ml6wC-0006r8-49
 for qemu-devel@nongnu.org; Thu, 11 Nov 2021 05:04:08 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:31824)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1ml6w9-00010b-9K
 for qemu-devel@nongnu.org; Thu, 11 Nov 2021 05:04:07 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1636625044;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=aQ1GdzcB7LjSoWeOeDhq1zxy9yHw2IVmuuwVgLYpvfQ=;
 b=XAIq3EHgDzhmQRjEhJHA2cYi+G0nt6hL8woFxRyMTEoaZI1miog8dClu96wKGJ5qlsxv2P
 5nG4WjYszFyAG1XmjsUzsP8G1M7hZlZfoOo0pIhlUdFXUE9STEXR5GUHIQocFl0pXHGKPw
 LW+KeyNElj8BDTTSa1TQOpHLBORMVvo=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-395-e6hYlTIfPJ6kkEzTnFfSAw-1; Thu, 11 Nov 2021 05:04:03 -0500
X-MC-Unique: e6hYlTIfPJ6kkEzTnFfSAw-1
Received: by mail-wm1-f72.google.com with SMTP id
 144-20020a1c0496000000b003305ac0e03aso4530974wme.8
 for <qemu-devel@nongnu.org>; Thu, 11 Nov 2021 02:04:03 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=aQ1GdzcB7LjSoWeOeDhq1zxy9yHw2IVmuuwVgLYpvfQ=;
 b=WQN2jlrtnHetncE+h3UvvqraU445ACdg3Q7+3Qio0/s4826vNzLAt4+WOd/BSel8Nh
 Hg/2S0DCZ3x+y+tatGapgofOeVE+FJmb2O9BFZQdopopfrz7G4s9Kps8OLak7NEyd9+j
 7CESBcRJbcePwwRip6vvOsSkzLm6ANjx/f4OiEzKBf6LmFav/+98+qYcLQjLOBC/bPOf
 WG90a4MlGo7B1Qx1+m5OgL4hvuCwdzBaE7L1dLHz1AllGSG1OR0oeU0DCf2mSE5vxVBS
 Cz+qXWBxBlUXOE5g4GEnSOTscNQzxtUWsRyUfQ0qssXNVHvezShIRYRspWqm9risiOVZ
 ZiSQ==
X-Gm-Message-State: AOAM530iT8a8MyJRvcdBq4v7AVBIeYhYrOwd44lXhuCpvwqiBu6N1IDk
 rz2jmC0HSryTTEbjCAPqVED3uziEo5xR+aXPgjXXTmrDVeELXDg6nd7Ri48zgrfuJsp9x3l7mPd
 ZIXFtYn6xE+80ybQWrJAywn9x307DekSrQWSTJQ8x0sYjqhqUIQxUW3eiHgIDfwct
X-Received: by 2002:adf:e682:: with SMTP id r2mr7490328wrm.281.1636625041999; 
 Thu, 11 Nov 2021 02:04:01 -0800 (PST)
X-Google-Smtp-Source: ABdhPJw4ZoFof0DtjTfl/siX1LXfxngQIqc6TrdBbvk7BJRctnx+i3Z5gvgEzJxFsOEux18Qx+gfsA==
X-Received: by 2002:adf:e682:: with SMTP id r2mr7490292wrm.281.1636625041819; 
 Thu, 11 Nov 2021 02:04:01 -0800 (PST)
Received: from x1w.. (62.red-83-57-168.dynamicip.rima-tde.net. [83.57.168.62])
 by smtp.gmail.com with ESMTPSA id
 l124sm8381601wml.8.2021.11.11.02.04.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 Nov 2021 02:04:01 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH-for-6.2 v3 2/6] tests/unit/test-smp-parse: QOM'ify
 smp_machine_class_init()
Date: Thu, 11 Nov 2021 11:03:47 +0100
Message-Id: <20211111100351.2153662-3-philmd@redhat.com>
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
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
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

smp_machine_class_init() is the actual TypeInfo::class_init().
Declare it as such in smp_machine_info, and avoid to call it
manually in each test. Move smp_machine_info definition just
before we register the type to avoid a forward declaration.

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 tests/unit/test-smp-parse.c | 25 ++++++++++++-------------
 1 file changed, 12 insertions(+), 13 deletions(-)

diff --git a/tests/unit/test-smp-parse.c b/tests/unit/test-smp-parse.c
index bd11fbe91de..51670297bf9 100644
--- a/tests/unit/test-smp-parse.c
+++ b/tests/unit/test-smp-parse.c
@@ -75,14 +75,6 @@ typedef struct SMPTestData {
     const char *expect_error;
 } SMPTestData;
 
-/* Type info of the tested machine */
-static const TypeInfo smp_machine_info = {
-    .name = TYPE_MACHINE,
-    .parent = TYPE_OBJECT,
-    .class_size = sizeof(MachineClass),
-    .instance_size = sizeof(MachineState),
-};
-
 /*
  * List all the possible valid sub-collections of the generic 5
  * topology parameters (i.e. cpus/maxcpus/sockets/cores/threads),
@@ -480,9 +472,10 @@ static void unsupported_params_init(MachineClass *mc, SMPTestData *data)
     }
 }
 
-/* Reset the related machine properties before each sub-test */
-static void smp_machine_class_init(MachineClass *mc)
+static void machine_class_init(ObjectClass *oc, void *data)
 {
+    MachineClass *mc = MACHINE_CLASS(oc);
+
     mc->min_cpus = MIN_CPUS;
     mc->max_cpus = MAX_CPUS;
 
@@ -498,8 +491,6 @@ static void test_generic(void)
     SMPTestData *data = &(SMPTestData){{ }};
     int i;
 
-    smp_machine_class_init(mc);
-
     for (i = 0; i < ARRAY_SIZE(data_generic_valid); i++) {
         *data = data_generic_valid[i];
         unsupported_params_init(mc, data);
@@ -539,7 +530,6 @@ static void test_with_dies(void)
     unsigned int num_dies = 2;
     int i;
 
-    smp_machine_class_init(mc);
     mc->smp_props.dies_supported = true;
 
     for (i = 0; i < ARRAY_SIZE(data_generic_valid); i++) {
@@ -582,6 +572,15 @@ static void test_with_dies(void)
     object_unref(obj);
 }
 
+/* Type info of the tested machine */
+static const TypeInfo smp_machine_info = {
+    .name = TYPE_MACHINE,
+    .parent = TYPE_OBJECT,
+    .class_init = machine_class_init,
+    .class_size = sizeof(MachineClass),
+    .instance_size = sizeof(MachineState),
+};
+
 int main(int argc, char *argv[])
 {
     g_test_init(&argc, &argv, NULL);
-- 
2.31.1


