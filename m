Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DDE2D477342
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Dec 2021 14:36:37 +0100 (CET)
Received: from localhost ([::1]:53940 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mxqw0-0003Nm-51
	for lists+qemu-devel@lfdr.de; Thu, 16 Dec 2021 08:36:36 -0500
Received: from eggs.gnu.org ([209.51.188.92]:37300)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mxqgz-0006vT-SD
 for qemu-devel@nongnu.org; Thu, 16 Dec 2021 08:21:05 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:35368)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mxqgx-0008PK-6W
 for qemu-devel@nongnu.org; Thu, 16 Dec 2021 08:21:05 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1639660862;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=qjhf+bvQNgSb5Piftj9ZwUSggj/6sIcVgFV+K5PRUr0=;
 b=GZT7q4MSqCtokuJTVS4lrCvAeG66Yif1rTX7bRKQyqZZMjHr6Wa4bVmEfTvV88vDo5AVzQ
 3zlLJbuLDpCcpVuy4bOM0eUji1kr2OXeu14o8jcJm8Hsz8w2LKzZXM6P6G7NXJI++K/RIX
 MayYYASXGCDY+scNkbv2anfOtlkdiq4=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-208-OUpFXy-LMreEO-7kd1aEUQ-1; Thu, 16 Dec 2021 08:21:01 -0500
X-MC-Unique: OUpFXy-LMreEO-7kd1aEUQ-1
Received: by mail-wm1-f71.google.com with SMTP id
 b83-20020a1c1b56000000b0033283ea5facso962837wmb.1
 for <qemu-devel@nongnu.org>; Thu, 16 Dec 2021 05:21:01 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=qjhf+bvQNgSb5Piftj9ZwUSggj/6sIcVgFV+K5PRUr0=;
 b=KX7RY/d4MkvxOWFZOqH7W3otFY1vgc0TA0WGihlh0OIcAyWw6cyS7RFgJW0cIOtekV
 E7guZUI5JVWm+/o3XsX0sx95DE+GgII9MbKWTi0232Kb/ClnKtPHYvMTzKAKUkoe0pGF
 xl1KQbDEWIYxJfSIQJzqsnUUPjzuYhPynBL9rcXBrNDn3i47bwEKHneQyNpJ6aQS817j
 Mtn7qeT+Umnm6e0ijNDlVQTyV1Kx6PvqX5mQblSJonSw/JEQRTWapfTj+TSMZ6G9WC7m
 DDvWxLwvgorAxVNopuNajPDxvmB1wVK78f5QitLu+T8z3i/gJqLdqXouYNgf1OiBnCoq
 ugOA==
X-Gm-Message-State: AOAM5316sMibK/3R0+ekJeoZ4gY1vI/K61q4pbMESERrOTCMIwAFrD6Z
 26FO55GmLKrzZUYYuYyECEHUkSh/FUKHcK25IxpJwgT4v0nefTko82hfR0LlMzBpUO+F8f3CvgL
 AGsppT91XYgckZ6/BpEz+HeJo59ohC8EKt1PKL0Ex3vFD/+ksLxdCf+vWNzCfZOlA
X-Received: by 2002:a05:6000:1541:: with SMTP id
 1mr8843909wry.347.1639660860290; 
 Thu, 16 Dec 2021 05:21:00 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxF6mqbnnOOH3WtFObppwPWGxmCzxXXciFV6QUOHqi4+4GvdHf1nWm8z4QCZxFjkTYfPtVJ3g==
X-Received: by 2002:a05:6000:1541:: with SMTP id
 1mr8843884wry.347.1639660860004; 
 Thu, 16 Dec 2021 05:21:00 -0800 (PST)
Received: from localhost.localdomain
 (174.red-83-50-185.dynamicip.rima-tde.net. [83.50.185.174])
 by smtp.gmail.com with ESMTPSA id g18sm4785470wrv.42.2021.12.16.05.20.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Dec 2021 05:20:59 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v6 8/8] hw/core: Rename smp_parse() ->
 machine_parse_smp_config()
Date: Thu, 16 Dec 2021 14:20:15 +0100
Message-Id: <20211216132015.815493-9-philmd@redhat.com>
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
 Andrew Jones <drjones@redhat.com>, Yanan Wang <wangyanan55@huawei.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

All methods related to MachineState are prefixed with "machine_".
smp_parse() does not need to be an exception. Rename it and
const'ify the SMPConfiguration argument, since it doesn't need
to be modified.

Reviewed-by: Andrew Jones <drjones@redhat.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Yanan Wang <wangyanan55@huawei.com>
Tested-by: Yanan Wang <wangyanan55@huawei.com>
Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 include/hw/boards.h         | 3 ++-
 hw/core/machine-smp.c       | 6 ++++--
 hw/core/machine.c           | 2 +-
 tests/unit/test-smp-parse.c | 8 ++++----
 4 files changed, 11 insertions(+), 8 deletions(-)

diff --git a/include/hw/boards.h b/include/hw/boards.h
index 9c1c1901046..7597cec4400 100644
--- a/include/hw/boards.h
+++ b/include/hw/boards.h
@@ -34,7 +34,8 @@ HotpluggableCPUList *machine_query_hotpluggable_cpus(MachineState *machine);
 void machine_set_cpu_numa_node(MachineState *machine,
                                const CpuInstanceProperties *props,
                                Error **errp);
-void smp_parse(MachineState *ms, SMPConfiguration *config, Error **errp);
+void machine_parse_smp_config(MachineState *ms,
+                              const SMPConfiguration *config, Error **errp);
 
 /**
  * machine_class_allow_dynamic_sysbus_dev: Add type to list of valid devices
diff --git a/hw/core/machine-smp.c b/hw/core/machine-smp.c
index 116a0cbbfab..2cbfd574293 100644
--- a/hw/core/machine-smp.c
+++ b/hw/core/machine-smp.c
@@ -44,7 +44,8 @@ static char *cpu_hierarchy_to_string(MachineState *ms)
 }
 
 /*
- * smp_parse - Generic function used to parse the given SMP configuration
+ * machine_parse_smp_config: Generic function used to parse the given
+ *                           SMP configuration
  *
  * Any missing parameter in "cpus/maxcpus/sockets/cores/threads" will be
  * automatically computed based on the provided ones.
@@ -63,7 +64,8 @@ static char *cpu_hierarchy_to_string(MachineState *ms)
  * introduced topology members which are likely to be target specific should
  * be directly set as 1 if they are omitted (e.g. dies for PC since 4.1).
  */
-void smp_parse(MachineState *ms, SMPConfiguration *config, Error **errp)
+void machine_parse_smp_config(MachineState *ms,
+                              const SMPConfiguration *config, Error **errp)
 {
     MachineClass *mc = MACHINE_GET_CLASS(ms);
     unsigned cpus    = config->has_cpus ? config->cpus : 0;
diff --git a/hw/core/machine.c b/hw/core/machine.c
index 53a99abc560..3993c534b90 100644
--- a/hw/core/machine.c
+++ b/hw/core/machine.c
@@ -761,7 +761,7 @@ static void machine_set_smp(Object *obj, Visitor *v, const char *name,
         return;
     }
 
-    smp_parse(ms, config, errp);
+    machine_parse_smp_config(ms, config, errp);
 }
 
 static void machine_class_init(ObjectClass *oc, void *data)
diff --git a/tests/unit/test-smp-parse.c b/tests/unit/test-smp-parse.c
index 0f98c9509ee..b6df8137fcc 100644
--- a/tests/unit/test-smp-parse.c
+++ b/tests/unit/test-smp-parse.c
@@ -337,7 +337,7 @@ static const struct SMPTestData data_with_dies_invalid[] = {
     },
 };
 
-static char *smp_config_to_string(SMPConfiguration *config)
+static char *smp_config_to_string(const SMPConfiguration *config)
 {
     return g_strdup_printf(
         "(SMPConfiguration) {\n"
@@ -371,7 +371,7 @@ static char *cpu_topology_to_string(const CpuTopology *topo)
         topo->cores, topo->threads, topo->max_cpus);
 }
 
-static void check_parse(MachineState *ms, SMPConfiguration *config,
+static void check_parse(MachineState *ms, const SMPConfiguration *config,
                         const CpuTopology *expect_topo, const char *expect_err,
                         bool is_valid)
 {
@@ -380,8 +380,8 @@ static void check_parse(MachineState *ms, SMPConfiguration *config,
     g_autofree char *output_topo_str = NULL;
     Error *err = NULL;
 
-    /* call the generic parser smp_parse() */
-    smp_parse(ms, config, &err);
+    /* call the generic parser */
+    machine_parse_smp_config(ms, config, &err);
 
     output_topo_str = cpu_topology_to_string(&ms->smp);
 
-- 
2.33.1


