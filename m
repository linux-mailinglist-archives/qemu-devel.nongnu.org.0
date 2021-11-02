Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D9E3444399F
	for <lists+qemu-devel@lfdr.de>; Wed,  3 Nov 2021 00:26:08 +0100 (CET)
Received: from localhost ([::1]:53602 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mi3AN-0003z5-WF
	for lists+qemu-devel@lfdr.de; Tue, 02 Nov 2021 19:26:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51046)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1mi36l-000651-OV; Tue, 02 Nov 2021 19:22:24 -0400
Received: from mout.kundenserver.de ([212.227.126.134]:45709)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1mi36j-0006LW-4e; Tue, 02 Nov 2021 19:22:23 -0400
Received: from quad ([82.142.14.190]) by mrelayeu.kundenserver.de (mreue012
 [212.227.15.167]) with ESMTPSA (Nemesis) id 1MNfgZ-1n6Sx31jRb-00P2is; Wed, 03
 Nov 2021 00:22:14 +0100
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Subject: [PULL 1/4] monitor: Trim some trailing space from human-readable
 output
Date: Wed,  3 Nov 2021 00:22:09 +0100
Message-Id: <20211102232212.2911638-2-laurent@vivier.eu>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211102232212.2911638-1-laurent@vivier.eu>
References: <20211102232212.2911638-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1://SXqXViTJ4iA5UKvOINnm6kPvhrBXQ390ll20Jg0y1fYvenOJQ
 sbGMFg+4WZM5nvgwfjNlFJP60VAWh29LvYBsd6MnR93plJJsRyvBnyYqBRczC1AKnJvrEp5
 36okjyy8sa4nESALSA5hfuNHBStsEQAzMM3xWBQWDIcOfaX9JBwli5GCLizuRF6N58ojIem
 pBM6VEmYwDlTG7K7oz3PA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:d7PDms3bwBM=:wnOsjs467ldhQpBMbx7RJY
 lhZKoMaQ+Jv8/l4GboCeQYJb4zxf/OJbZACMnsA5DXV9LmElSQKUPFksL0YkFTjsTI0qVz/sJ
 tLPkiHt/89sFWiVDEhgQ+OoxAGBEuch/qEMFzMVp0hrUrzGRSMoSNhN3thoIkhNiZILESQ/yb
 2bQD8pd2H+D5RSH2n2/4MhM/ubJMrlciFncWFW8XqwmuA9PHJt9ihGKYLH9Z9qXxNDkm+/zYn
 d9CnD1pUrp5tPjPjQXmtXO4Eus+PVXy25Tw42WLMqK2+rUY7pMD3Mx9hLroHEPaAGzxd2/yni
 3hC6v4LZcANCDaHiVLAgQHzhrKdAiXNGR54uuVz606yOohja6DkRsnANds9IU/nsdiYx8/UcT
 JqczhOW7NG6EZ+51kTtXP/JNdWyVqAFzcZN8SV2i2h5p6scV3NeqnV6JJHcwBgCHCBxXdpabE
 kOGk7LrvZvm1SwPqICn+15l9b5XtnDi0T1I66ZWGnooJYJAvi7n+xy/Ut7WBwZthwN/xIdI9S
 R4f56xk27Mm7rEAnmxWFeoQRsrweGSZilMRHlMYshcJgPWEORZFDhM5WChqTZwGpcCOTPKcyy
 bgJ3l+mHvz/MEB6YByu0THcnCtEp1DEBT0fSGbH/uftfRLInuunAjzd6ZLA4DMNfElwVK0egF
 Z+2OoAnWeu0kVkxsIWdgYwJD78HDQYyImNb+HdJstTJnQwNxf5Xdo3iUPaf4jjs0LuEY=
Received-SPF: none client-ip=212.227.126.134; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Cc: qemu-trivial@nongnu.org, Richard Henderson <richard.henderson@linaro.org>,
 Markus Armbruster <armbru@redhat.com>, Greg Kurz <groug@kaod.org>,
 Max Filippov <jcmvbkbc@gmail.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Markus Armbruster <armbru@redhat.com>

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
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Acked-by: Greg Kurz <groug@kaod.org>
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Acked-by: Max Filippov <jcmvbkbc@gmail.com>
Message-Id: <20211009152401.2982862-1-armbru@redhat.com>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 monitor/hmp-cmds.c         | 2 +-
 target/i386/cpu-dump.c     | 4 ++--
 target/i386/cpu.c          | 2 +-
 target/ppc/cpu_init.c      | 2 +-
 target/s390x/cpu_models.c  | 4 ++--
 target/xtensa/mmu_helper.c | 2 +-
 6 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/monitor/hmp-cmds.c b/monitor/hmp-cmds.c
index bcaa41350e9a..9e45a138a505 100644
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
index 02b635a52cff..08ac957e99cf 100644
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
index 598d451dcf04..c5744ce08cf9 100644
--- a/target/i386/cpu.c
+++ b/target/i386/cpu.c
@@ -4878,7 +4878,7 @@ static void x86_cpu_list_entry(gpointer data, gpointer user_data)
         desc = g_strdup_printf("%s", model_id);
     }
 
-    qemu_printf("x86 %-20s  %-58s\n", name, desc);
+    qemu_printf("x86 %-20s  %s\n", name, desc);
 }
 
 /* list available CPU models and flags */
diff --git a/target/ppc/cpu_init.c b/target/ppc/cpu_init.c
index 65545ba9ca8d..ba384a592bc1 100644
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
index 4e4598cc774c..11e06cc51fab 100644
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
index b01ff9399ae6..57e319a1af3a 100644
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


