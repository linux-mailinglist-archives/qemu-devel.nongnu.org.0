Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B8AD12B4475
	for <lists+qemu-devel@lfdr.de>; Mon, 16 Nov 2020 14:12:16 +0100 (CET)
Received: from localhost ([::1]:52680 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1keeIp-0005Rk-Ox
	for lists+qemu-devel@lfdr.de; Mon, 16 Nov 2020 08:12:15 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40410)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <r.bolshakov@yadro.com>)
 id 1keeH6-000439-0n
 for qemu-devel@nongnu.org; Mon, 16 Nov 2020 08:10:28 -0500
Received: from mta-02.yadro.com ([89.207.88.252]:35664 helo=mta-01.yadro.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <r.bolshakov@yadro.com>)
 id 1keeH3-0002tJ-GS
 for qemu-devel@nongnu.org; Mon, 16 Nov 2020 08:10:27 -0500
Received: from localhost (unknown [127.0.0.1])
 by mta-01.yadro.com (Postfix) with ESMTP id 21DFA41393;
 Mon, 16 Nov 2020 13:10:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=yadro.com; h=
 content-type:content-type:content-transfer-encoding:mime-version
 :references:in-reply-to:x-mailer:message-id:date:date:subject
 :subject:from:from:received:received:received; s=mta-01; t=
 1605532223; x=1607346624; bh=HXOEmmXiFCxEfEYJZKJlfEYZ/aJK4b/3Mir
 yw9JRH/k=; b=A8vSOKagjZY5Mauu2tft3V5By4/P56PQxMkgO2hIiP7THIuNQY+
 n3EXyTKYLsrljjh9vTTWA6UDJjE6Go+ZJlCpI1i+0/CDZvuRq0gCuhz0+/TJZtHc
 xl4T1ZMq3h/CbDDzmdOIF1ivDOmiDKFx3Zbv74sZGBEVHn0iBECrGMmk=
X-Virus-Scanned: amavisd-new at yadro.com
Received: from mta-01.yadro.com ([127.0.0.1])
 by localhost (mta-01.yadro.com [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 7U67BNag695k; Mon, 16 Nov 2020 16:10:23 +0300 (MSK)
Received: from T-EXCH-04.corp.yadro.com (t-exch-04.corp.yadro.com
 [172.17.100.104])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by mta-01.yadro.com (Postfix) with ESMTPS id 020A141373;
 Mon, 16 Nov 2020 16:10:23 +0300 (MSK)
Received: from localhost (172.17.204.212) by T-EXCH-04.corp.yadro.com
 (172.17.100.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P384) id 15.1.669.32; Mon, 16
 Nov 2020 16:10:22 +0300
From: Roman Bolshakov <r.bolshakov@yadro.com>
To: <qemu-devel@nongnu.org>
Subject: [PATCH for-6.0 2/6] qapi: Rename KvmInfo to AccelInfo
Date: Mon, 16 Nov 2020 16:10:07 +0300
Message-ID: <20201116131011.26607-3-r.bolshakov@yadro.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201116131011.26607-1-r.bolshakov@yadro.com>
References: <20201116131011.26607-1-r.bolshakov@yadro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [172.17.204.212]
X-ClientProxiedBy: T-EXCH-01.corp.yadro.com (172.17.10.101) To
 T-EXCH-04.corp.yadro.com (172.17.100.104)
Received-SPF: pass client-ip=89.207.88.252; envelope-from=r.bolshakov@yadro.com;
 helo=mta-01.yadro.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/16 08:10:19
X-ACL-Warn: Detected OS   = Linux 3.11 and newer [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Eduardo Habkost <ehabkost@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Roman Bolshakov <r.bolshakov@yadro.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

There's nothing specific to KVM in the structure. A more generic name
would be more appropriate.

Signed-off-by: Roman Bolshakov <r.bolshakov@yadro.com>
---
 monitor/hmp-cmds.c |  4 ++--
 monitor/qmp-cmds.c |  8 ++++----
 qapi/machine.json  | 18 +++++++++---------
 3 files changed, 15 insertions(+), 15 deletions(-)

diff --git a/monitor/hmp-cmds.c b/monitor/hmp-cmds.c
index a6a6684df1..ea86289fe8 100644
--- a/monitor/hmp-cmds.c
+++ b/monitor/hmp-cmds.c
@@ -120,7 +120,7 @@ void hmp_info_version(Monitor *mon, const QDict *qdict)
 
 void hmp_info_kvm(Monitor *mon, const QDict *qdict)
 {
-    KvmInfo *info;
+    AccelInfo *info;
 
     info = qmp_query_kvm(NULL);
     monitor_printf(mon, "kvm support: ");
@@ -130,7 +130,7 @@ void hmp_info_kvm(Monitor *mon, const QDict *qdict)
         monitor_printf(mon, "not compiled\n");
     }
 
-    qapi_free_KvmInfo(info);
+    qapi_free_AccelInfo(info);
 }
 
 void hmp_info_status(Monitor *mon, const QDict *qdict)
diff --git a/monitor/qmp-cmds.c b/monitor/qmp-cmds.c
index 0454394e76..f5d50afa9c 100644
--- a/monitor/qmp-cmds.c
+++ b/monitor/qmp-cmds.c
@@ -52,9 +52,9 @@ NameInfo *qmp_query_name(Error **errp)
     return info;
 }
 
-KvmInfo *qmp_query_kvm(Error **errp)
+AccelInfo *qmp_query_kvm(Error **errp)
 {
-    KvmInfo *info = g_malloc0(sizeof(*info));
+    AccelInfo *info = g_malloc0(sizeof(*info));
 
     info->enabled = kvm_enabled();
     info->present = kvm_available();
@@ -62,9 +62,9 @@ KvmInfo *qmp_query_kvm(Error **errp)
     return info;
 }
 
-KvmInfo *qmp_query_accel(const char *name, Error **errp)
+AccelInfo *qmp_query_accel(const char *name, Error **errp)
 {
-    KvmInfo *info = g_malloc0(sizeof(*info));
+    AccelInfo *info = g_malloc0(sizeof(*info));
 
     AccelClass *ac = accel_find(name);
 
diff --git a/qapi/machine.json b/qapi/machine.json
index 11f364fab4..5648d8d24d 100644
--- a/qapi/machine.json
+++ b/qapi/machine.json
@@ -562,24 +562,24 @@
 { 'command': 'inject-nmi' }
 
 ##
-# @KvmInfo:
+# @AccelInfo:
 #
-# Information about support for KVM acceleration
+# Information about support for an acceleration
 #
-# @enabled: true if KVM acceleration is active
+# @enabled: true if an acceleration is active
 #
-# @present: true if KVM acceleration is built into this executable
+# @present: true if an acceleration is built into this executable
 #
 # Since: 0.14.0
 ##
-{ 'struct': 'KvmInfo', 'data': {'enabled': 'bool', 'present': 'bool'} }
+{ 'struct': 'AccelInfo', 'data': {'enabled': 'bool', 'present': 'bool'} }
 
 ##
 # @query-kvm:
 #
 # Returns information about KVM acceleration
 #
-# Returns: @KvmInfo
+# Returns: @AccelInfo
 #
 # Since: 0.14.0
 #
@@ -589,14 +589,14 @@
 # <- { "return": { "enabled": true, "present": true } }
 #
 ##
-{ 'command': 'query-kvm', 'returns': 'KvmInfo' }
+{ 'command': 'query-kvm', 'returns': 'AccelInfo' }
 
 ##
 # @query-accel:
 #
 # Returns information about an accelerator
 #
-# Returns: @KvmInfo
+# Returns: @AccelInfo
 #
 # Since: 6.0.0
 #
@@ -608,7 +608,7 @@
 ##
 { 'command': 'query-accel',
   'data': { 'name': 'str' },
-  'returns': 'KvmInfo' }
+  'returns': 'AccelInfo' }
 
 ##
 # @NumaOptionsType:
-- 
2.29.2


