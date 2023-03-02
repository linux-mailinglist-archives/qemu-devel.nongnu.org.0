Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D2B606A8295
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Mar 2023 13:48:46 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pXiA0-0005jU-E0; Thu, 02 Mar 2023 07:35:53 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1pXi8H-0003Kd-Fh
 for qemu-devel@nongnu.org; Thu, 02 Mar 2023 07:34:01 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1pXi7q-0003zR-Bq
 for qemu-devel@nongnu.org; Thu, 02 Mar 2023 07:33:35 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1677760413;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=VwEA1SKGSZ+qVi7NXmaUzW9NGYsub5ZiAUDkM1xzZs0=;
 b=EWNWnLx1eCjOwiagO2n02uIzhQhpAfkGb3y7RWTUOXqu3ukS5p0wp0v5MbIr/i/8qDlg2a
 FpL1H8oYCr5wCn1IwMYWEatjT0QWYiC74fY9QJJiL/+V++/77OTKtCVxN404G8tycZyb5p
 nU8CL1qHtoXfXfT91cY8W7l6ajiiMHk=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-631-EWV3l9UiP7678_B8yiCBrA-1; Thu, 02 Mar 2023 07:33:32 -0500
X-MC-Unique: EWV3l9UiP7678_B8yiCBrA-1
Received: by mail-wr1-f71.google.com with SMTP id
 d14-20020adfa34e000000b002bfc062eaa8so3215214wrb.20
 for <qemu-devel@nongnu.org>; Thu, 02 Mar 2023 04:33:32 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=VwEA1SKGSZ+qVi7NXmaUzW9NGYsub5ZiAUDkM1xzZs0=;
 b=yjWZTp2msyZ/OGx9DxGpouX8EihfwG/m98ahmj669xKz3+CyfIqD9RERM09s3p+2vJ
 ZGOzZLVApsZK9dPPTtt2Lxlqn6l6nx6O6hkA5Bge7m3GEGdtOr9t1FuapmkZJHCoQuQz
 aQAxmskvu/FxuQay1YH7xDo9oA3ADsfPZPSOGy9KtXZ0Pp4vRms6lxVpDSPnILWhCZjN
 WKAzojpZ435jNTJKadr/TeMFjlVq3t75sJFP4SFKNOtzBA3I4IV9/Rvz9c4hBv0ubEsy
 CeuJFNQ6Ao/Yg51pOUo7U1Q2gI53tXn4sY0EwNWSy0Ftu2OVhclOjW1c4kikTQZuWAKr
 cA+w==
X-Gm-Message-State: AO0yUKXACSY3DDgvkxcZyfxhGQ9ipAIBGDT4JlT2MbFRchlyxWVLvVtg
 /BhPP3056zC4Yd7+5KBkojUiXOm+0PuGNC/U/ueTDOUXq+t90vkSTFahZOktF10bM+7gEX8TEbF
 HA7wHyKvZWELQVq83kpezeTCMPPWxlDVgC7vBrUYMOeGnApT2E4NlPpZyDTrw4ljyQuBFjzqD4x
 8=
X-Received: by 2002:a5d:45c4:0:b0:2c7:6ce2:bb37 with SMTP id
 b4-20020a5d45c4000000b002c76ce2bb37mr7930811wrs.29.1677760411148; 
 Thu, 02 Mar 2023 04:33:31 -0800 (PST)
X-Google-Smtp-Source: AK7set85u+MmkAQLLOl4onPv1bpVBAYQHB1tJE/rWmELFN2cky7vZ9Az6Xk4Txh9GWwLqZONzNd4hQ==
X-Received: by 2002:a5d:45c4:0:b0:2c7:6ce2:bb37 with SMTP id
 b4-20020a5d45c4000000b002c76ce2bb37mr7930792wrs.29.1677760410778; 
 Thu, 02 Mar 2023 04:33:30 -0800 (PST)
Received: from avogadro.local ([2001:b07:6468:f312:1c09:f536:3de6:228c])
 by smtp.gmail.com with ESMTPSA id
 t11-20020a05600c450b00b003dc47d458cdsm3149254wmo.15.2023.03.02.04.33.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Mar 2023 04:33:30 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: Peter Krempa <pkrempa@redhat.com>,
	Markus Armbruster <armbru@redhat.com>
Subject: [PULL 61/62] qapi: Add 'acpi' field to 'query-machines' output
Date: Thu,  2 Mar 2023 13:30:28 +0100
Message-Id: <20230302123029.153265-62-pbonzini@redhat.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230302123029.153265-1-pbonzini@redhat.com>
References: <20230302123029.153265-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

From: Peter Krempa <pkrempa@redhat.com>

Report which machine types support ACPI so that management applications
can properly use the 'acpi' property even on platforms such as ARM where
support for ACPI depends on the machine type and thus checking presence
of '-machine acpi=' in 'query-command-line-options' is insufficient.

Signed-off-by: Peter Krempa <pkrempa@redhat.com>
Acked-by: Markus Armbruster <armbru@redhat.com>
Message-Id: <537625d3e25d345052322c42ca19812b98b4f49a.1677571792.git.pkrempa@redhat.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 hw/core/machine-qmp-cmds.c | 1 +
 qapi/machine.json          | 4 +++-
 2 files changed, 4 insertions(+), 1 deletion(-)

diff --git a/hw/core/machine-qmp-cmds.c b/hw/core/machine-qmp-cmds.c
index 2d904747c080..b98ff15089a7 100644
--- a/hw/core/machine-qmp-cmds.c
+++ b/hw/core/machine-qmp-cmds.c
@@ -102,6 +102,7 @@ MachineInfoList *qmp_query_machines(Error **errp)
         info->hotpluggable_cpus = mc->has_hotpluggable_cpus;
         info->numa_mem_supported = mc->numa_mem_supported;
         info->deprecated = !!mc->deprecation_reason;
+        info->acpi = !!object_class_property_find(OBJECT_CLASS(mc), "acpi");
         if (mc->default_cpu_type) {
             info->default_cpu_type = g_strdup(mc->default_cpu_type);
         }
diff --git a/qapi/machine.json b/qapi/machine.json
index b9228a5e4616..604b686e59f2 100644
--- a/qapi/machine.json
+++ b/qapi/machine.json
@@ -155,6 +155,8 @@
 #
 # @default-ram-id: the default ID of initial RAM memory backend (since 5.2)
 #
+# @acpi: machine type supports ACPI (since 8.0)
+#
 # Since: 1.2
 ##
 { 'struct': 'MachineInfo',
@@ -162,7 +164,7 @@
             '*is-default': 'bool', 'cpu-max': 'int',
             'hotpluggable-cpus': 'bool',  'numa-mem-supported': 'bool',
             'deprecated': 'bool', '*default-cpu-type': 'str',
-            '*default-ram-id': 'str' } }
+            '*default-ram-id': 'str', 'acpi': 'bool' } }
 
 ##
 # @query-machines:
-- 
2.39.1


