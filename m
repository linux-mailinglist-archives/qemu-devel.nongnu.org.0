Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F3C39475E0C
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Dec 2021 17:59:08 +0100 (CET)
Received: from localhost ([::1]:60924 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mxXcS-0003Df-31
	for lists+qemu-devel@lfdr.de; Wed, 15 Dec 2021 11:59:08 -0500
Received: from eggs.gnu.org ([209.51.188.92]:34256)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mxXTE-0004ZB-9d
 for qemu-devel@nongnu.org; Wed, 15 Dec 2021 11:49:36 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:29486)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mxXTB-0001zs-MS
 for qemu-devel@nongnu.org; Wed, 15 Dec 2021 11:49:36 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1639586970;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=TZ3gZVz3PQYnFV6233ldFCcy6QtI3ljXwdYY5S65e7Q=;
 b=LHFGUYHiX0aQU74tuIiNTNx1U6hOvOHv/5Cy9WVhUl6n95TzvkQyp5Du+WW2a0q1EhVcm7
 EyaXaCfqfzeX37vF4I+MVVzqndF+ROh5GvpFjGlTejpO+9NvGADMTlTu6iAw7fDMQ16niN
 lOYyA31rb6HMh2p7X6QK1DTlYSh1eEs=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-335-kO-ZbPsQNNmiUlWftBI0pA-1; Wed, 15 Dec 2021 11:49:29 -0500
X-MC-Unique: kO-ZbPsQNNmiUlWftBI0pA-1
Received: by mail-wm1-f72.google.com with SMTP id
 ay34-20020a05600c1e2200b00337fd217772so9263246wmb.4
 for <qemu-devel@nongnu.org>; Wed, 15 Dec 2021 08:49:29 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=TZ3gZVz3PQYnFV6233ldFCcy6QtI3ljXwdYY5S65e7Q=;
 b=J+QkVnqruN2EnrThLOjZEuAy/A9MQ+C57xOkQlwWtiKdtAstxQ9u943UZaKFPTzJjT
 qavN+sH0lOw6sIMNPxgo6o26FRczVxYBj8YJJp2Fzbf1cb9A6CKBWHl7GRVP2LwwywJI
 XpPifoVNpx9eHN53LFYTR3NyiT5uqldR+ELR2w4JlXbzAfZTDGXDLEU95txMUa218yrg
 SnPRFBN4Hu9o5bTaJcizXRDZ562waYK1RCTgGzmTxpdhW//mLdfXXwdhq4qmDjpK9Q2K
 OFCbLEd/PXbeVOHCODISA0cvuOF15aekQLa51yNVQJcOBObzIIUil3UP5XwTZOQKRq78
 i5eg==
X-Gm-Message-State: AOAM532OWu6U6ywhLR86LxZj5kgl1Pd0TNulQPDX6tXEbjGT5FtXih5M
 aJoRL2AVTXnpNnfLL2DK0G3RTE2SSCZLtQhQeKK/6/I28LpQI921ahTROBjFsSpzPAwemKN0M0x
 J8OgWQ95hFJMOXZ89jB5cTGGUeHdmS8w/pb4Llx53Z6wmX3vu83C91gaxntlHw6IT
X-Received: by 2002:adf:8b0e:: with SMTP id n14mr5006025wra.281.1639586968251; 
 Wed, 15 Dec 2021 08:49:28 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyLZRNl/QXAWmtQyPA9iurspmt/Cty8dTXKkBrflwruYnS/bfbzLrk4O0fEL1keu3xvvP4sWQ==
X-Received: by 2002:adf:8b0e:: with SMTP id n14mr5006013wra.281.1639586968057; 
 Wed, 15 Dec 2021 08:49:28 -0800 (PST)
Received: from localhost.localdomain
 (174.red-83-50-185.dynamicip.rima-tde.net. [83.50.185.174])
 by smtp.gmail.com with ESMTPSA id g7sm2096280wrx.104.2021.12.15.08.49.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 15 Dec 2021 08:49:27 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 5/8] tests/unit/test-smp-parse: Add 'smp-generic-valid'
 machine type
Date: Wed, 15 Dec 2021 17:48:53 +0100
Message-Id: <20211215164856.381990-6-philmd@redhat.com>
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
index 72e7236afd9..5349ae14824 100644
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
+static void machine_without_dies_valid_class_init(ObjectClass *oc, void *data)
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
 
 static void machine_without_dies_invalid_class_init(ObjectClass *oc, void *data)
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
+        .class_init     = machine_without_dies_valid_class_init,
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


