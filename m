Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1973A427B4E
	for <lists+qemu-devel@lfdr.de>; Sat,  9 Oct 2021 17:25:46 +0200 (CEST)
Received: from localhost ([::1]:51846 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mZEEK-0005WH-8f
	for lists+qemu-devel@lfdr.de; Sat, 09 Oct 2021 11:25:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50364)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1mZECu-0004lA-Qe
 for qemu-devel@nongnu.org; Sat, 09 Oct 2021 11:24:17 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:44532)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1mZECq-0001eC-U2
 for qemu-devel@nongnu.org; Sat, 09 Oct 2021 11:24:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1633793051;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=irRVTQOI2r0AxMwHKoBZ/HNmoWgCTzoTczpTSSIcnrw=;
 b=DJeTmBDwMl4o07YRj64twqLLT/7J4JM9cyPmYdPCv+5Kf+A/SdZPmnpf3WcGYU+lNKLuXw
 NxoCkWXB4f1nJr3lho1t18Nso1sesfc5YkrAFETqILA9DJ6W/UMfirSsAHS0bt5Kz4mupz
 s0VYT+CgpneIDXbe98GSNqJXj3r37Vw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-150-1M5WBmjjPXeKImzhXSmtSg-1; Sat, 09 Oct 2021 11:24:09 -0400
X-MC-Unique: 1M5WBmjjPXeKImzhXSmtSg-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E9780180830E;
 Sat,  9 Oct 2021 15:24:08 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-14.ams2.redhat.com
 [10.36.112.14])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id A981F5D740;
 Sat,  9 Oct 2021 15:24:02 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 2F517113865F; Sat,  9 Oct 2021 17:24:01 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH] Trim some trailing space from human-readable output
Date: Sat,  9 Oct 2021 17:24:01 +0200
Message-Id: <20211009152401.2982862-1-armbru@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.049,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: jcmvbkbc@gmail.com, david@redhat.com, jiri@resnulli.us, ehabkost@redhat.com,
 groug@kaod.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

I noticed -cpu help printing enough trailing spaces to make the output
at least 84 characters wide.  Looks ugly unless the terminal is wider.
Ugly or not, trailing spaces are stupid.

The culprit is this line in x86_cpu_list_entry():

    qemu_printf("x86 %-20s  %-58s\n", name, desc);

This prints a string with minimum field left-justified right before a
newline.  Change it to

    qemu_printf("x86 %-20s  %s\n", name, desc);

which avoids the trailing spaces and is simpler to boot.

A search for the pattern with "git-grep -E '%-[0-9]+s\\n'" found a few
more instances.  Change them similarly.

Signed-off-by: Markus Armbruster <armbru@redhat.com>
---
 monitor/hmp-cmds.c         | 2 +-
 target/i386/cpu-dump.c     | 4 ++--
 target/i386/cpu.c          | 2 +-
 target/ppc/cpu_init.c      | 2 +-
 target/s390x/cpu_models.c  | 4 ++--
 target/xtensa/mmu_helper.c | 2 +-
 6 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/monitor/hmp-cmds.c b/monitor/hmp-cmds.c
index bcaa41350e..9e45a138a5 100644
--- a/monitor/hmp-cmds.c
+++ b/monitor/hmp-cmds.c
@@ -1945,7 +1945,7 @@ void hmp_rocker_ports(Monitor *mon, const QDict *qdict)
     monitor_printf(mon, "      port  link    duplex neg?\n");
 
     for (port = list; port; port = port->next) {
-        monitor_printf(mon, "%10s  %-4s   %-3s  %2s  %-3s\n",
+        monitor_printf(mon, "%10s  %-4s   %-3s  %2s  %s\n",
                        port->value->name,
                        port->value->enabled ? port->value->link_up ?
                        "up" : "down" : "!ena",
diff --git a/target/i386/cpu-dump.c b/target/i386/cpu-dump.c
index 02b635a52c..08ac957e99 100644
--- a/target/i386/cpu-dump.c
+++ b/target/i386/cpu-dump.c
@@ -464,13 +464,13 @@ void x86_cpu_dump_state(CPUState *cs, FILE *f, int flags)
             snprintf(cc_op_name, sizeof(cc_op_name), "[%d]", env->cc_op);
 #ifdef TARGET_X86_64
         if (env->hflags & HF_CS64_MASK) {
-            qemu_fprintf(f, "CCS=%016" PRIx64 " CCD=%016" PRIx64 " CCO=%-8s\n",
+            qemu_fprintf(f, "CCS=%016" PRIx64 " CCD=%016" PRIx64 " CCO=%s\n",
                          env->cc_src, env->cc_dst,
                          cc_op_name);
         } else
 #endif
         {
-            qemu_fprintf(f, "CCS=%08x CCD=%08x CCO=%-8s\n",
+            qemu_fprintf(f, "CCS=%08x CCD=%08x CCO=%s\n",
                          (uint32_t)env->cc_src, (uint32_t)env->cc_dst,
                          cc_op_name);
         }
diff --git a/target/i386/cpu.c b/target/i386/cpu.c
index a7b1b6aa93..8d2c0ded10 100644
--- a/target/i386/cpu.c
+++ b/target/i386/cpu.c
@@ -4876,7 +4876,7 @@ static void x86_cpu_list_entry(gpointer data, gpointer user_data)
         desc = g_strdup_printf("%s", model_id);
     }
 
-    qemu_printf("x86 %-20s  %-58s\n", name, desc);
+    qemu_printf("x86 %-20s  %s\n", name, desc);
 }
 
 /* list available CPU models and flags */
diff --git a/target/ppc/cpu_init.c b/target/ppc/cpu_init.c
index 6aad01d1d3..8ab81dd1ed 100644
--- a/target/ppc/cpu_init.c
+++ b/target/ppc/cpu_init.c
@@ -8734,7 +8734,7 @@ void ppc_cpu_list(void)
 
 #ifdef CONFIG_KVM
     qemu_printf("\n");
-    qemu_printf("PowerPC %-16s\n", "host");
+    qemu_printf("PowerPC %s\n", "host");
 #endif
 }
 
diff --git a/target/s390x/cpu_models.c b/target/s390x/cpu_models.c
index 4e4598cc77..11e06cc51f 100644
--- a/target/s390x/cpu_models.c
+++ b/target/s390x/cpu_models.c
@@ -398,14 +398,14 @@ void s390_cpu_list(void)
     for (feat = 0; feat < S390_FEAT_MAX; feat++) {
         const S390FeatDef *def = s390_feat_def(feat);
 
-        qemu_printf("%-20s %-50s\n", def->name, def->desc);
+        qemu_printf("%-20s %s\n", def->name, def->desc);
     }
 
     qemu_printf("\nRecognized feature groups:\n");
     for (group = 0; group < S390_FEAT_GROUP_MAX; group++) {
         const S390FeatGroupDef *def = s390_feat_group_def(group);
 
-        qemu_printf("%-20s %-50s\n", def->name, def->desc);
+        qemu_printf("%-20s %s\n", def->name, def->desc);
     }
 }
 
diff --git a/target/xtensa/mmu_helper.c b/target/xtensa/mmu_helper.c
index b01ff9399a..57e319a1af 100644
--- a/target/xtensa/mmu_helper.c
+++ b/target/xtensa/mmu_helper.c
@@ -1098,7 +1098,7 @@ static void dump_tlb(CPUXtensaState *env, bool dtlb)
                     qemu_printf("\tVaddr       Paddr       ASID  Attr RWX Cache\n"
                                 "\t----------  ----------  ----  ---- --- -------\n");
                 }
-                qemu_printf("\t0x%08x  0x%08x  0x%02x  0x%02x %c%c%c %-7s\n",
+                qemu_printf("\t0x%08x  0x%08x  0x%02x  0x%02x %c%c%c %s\n",
                             entry->vaddr,
                             entry->paddr,
                             entry->asid,
-- 
2.31.1


