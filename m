Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D8510324721
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Feb 2021 23:49:00 +0100 (CET)
Received: from localhost ([::1]:58512 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lF2xn-0006KH-OC
	for lists+qemu-devel@lfdr.de; Wed, 24 Feb 2021 17:48:59 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40696)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lF2vt-0004g0-LL
 for qemu-devel@nongnu.org; Wed, 24 Feb 2021 17:47:02 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:33595)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lF2vr-00061p-8h
 for qemu-devel@nongnu.org; Wed, 24 Feb 2021 17:47:01 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614206818;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=EVnue42BrttlBCQCGj0TZzTKP7+Zxi1Gm+4446lormI=;
 b=B1hB2tYmOvtiyaoTjqSPJvrDafiWKPFsoSS+jIwTvUbqBMjGKP4acwpsgw3h87/lvlgGUe
 gHih3nM5ba9hnG7R9SBZqlhD9RseQGj3uvvdp3QoEQ2GUo+Nu3RehsaYKntB9rGzT4HTzD
 mrQrvpUQ4512/FM6jUanA4EGhfHTeKc=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-362-YkL-rHf_PDipWWGX_1vYug-1; Wed, 24 Feb 2021 17:46:56 -0500
X-MC-Unique: YkL-rHf_PDipWWGX_1vYug-1
Received: by mail-wr1-f72.google.com with SMTP id u15so1679035wrn.3
 for <qemu-devel@nongnu.org>; Wed, 24 Feb 2021 14:46:56 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=EVnue42BrttlBCQCGj0TZzTKP7+Zxi1Gm+4446lormI=;
 b=nqyllAVNd6VRzSwJNdMuKOBlbPfgNMPrmT7bxZgmXblMJmgfEskpXAUm7LBHLPJLhy
 6CfogRi/20+Bkv9zkUMtNsLOnlbpTB56CpeVIJBmR4qEB8GLZkCP43m194pzjhsxl8C3
 nicXDn0Yt2pySooeB+aUnzV9x9YiyjUEjlxqtpgZuc4cNKSmTsKGZEcujV7MU5vclGcw
 TDk6jcrzmmYFN9ZK4zN9sX2zSBGAzsIm5suJBThWI+qZaw2u+3URNaD6kDk2vhUT/OXB
 EXnEt926pDlzhIu02Ghr9fyIT4qQnDh18AATkLH9j8IWBzw2ZNEpO2AJbzoDf3HTyRwr
 Km+g==
X-Gm-Message-State: AOAM533TJmlGqMwQbleizpNEA9I/T+GD+XOjr0uTKblfpZHB3IlKJ2Sq
 cdphNsMA6kDeUd9CLQe/6NknG/+urtA3u6Xb952/GYI2sOjg0w/wYWTZER167RaQGdTwPNrNAQ6
 W1SH/3Z/O+8hFy+0tfHZGzTSRxpEUNty6ZqUjaC//nU7eFzI7prHLOfKyVSOOLTFl
X-Received: by 2002:a1c:65d6:: with SMTP id z205mr278842wmb.88.1614206815253; 
 Wed, 24 Feb 2021 14:46:55 -0800 (PST)
X-Google-Smtp-Source: ABdhPJy1uPTEQliKMX3O/FOW4JYYaofFyYjKURWoqSHU31T+txdc51Rk/0Y43hyBTLMML56sBzmwng==
X-Received: by 2002:a1c:65d6:: with SMTP id z205mr278821wmb.88.1614206814986; 
 Wed, 24 Feb 2021 14:46:54 -0800 (PST)
Received: from x1w.redhat.com (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id i8sm6364961wry.90.2021.02.24.14.46.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 24 Feb 2021 14:46:54 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 2/4] target/i386/cpu: Restrict x86_cpu_get_feature_words to
 sysemu
Date: Wed, 24 Feb 2021 23:46:41 +0100
Message-Id: <20210224224643.3369940-3-philmd@redhat.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210224224643.3369940-1-philmd@redhat.com>
References: <20210224224643.3369940-1-philmd@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Laurent Vivier <laurent@vivier.eu>, Markus Armbruster <armbru@redhat.com>,
 Claudio Fontana <cfontana@suse.de>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Only qemu-system-FOO and qemu-storage-daemon provide QMP
monitors, therefore such declarations and definitions are
irrelevant for user-mode emulation.

Restricting the x86-specific commands to machine-target.json
pulls less QAPI-generated code into user-mode.

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 target/i386/cpu-internal.h |  3 +++
 target/i386/cpu-softmmu.c  | 36 ++++++++++++++++++++++++++++++++++
 target/i386/cpu.c          | 40 +++-----------------------------------
 3 files changed, 42 insertions(+), 37 deletions(-)

diff --git a/target/i386/cpu-internal.h b/target/i386/cpu-internal.h
index 9df24c482ea..9355f86f6e1 100644
--- a/target/i386/cpu-internal.h
+++ b/target/i386/cpu-internal.h
@@ -69,6 +69,9 @@ void x86_cpu_get_crash_info_qom(Object *obj, Visitor *v,
 void x86_cpu_apic_create(X86CPU *cpu, Error **errp);
 void x86_cpu_apic_realize(X86CPU *cpu, Error **errp);
 void x86_cpu_machine_reset_cb(void *opaque);
+void x86_cpu_get_feature_words(Object *obj, Visitor *v,
+                               const char *name, void *opaque,
+                               Error **errp);
 #endif /* CONFIG_USER_ONLY */
 
 #endif /* CPU_INTERNAL_H */
diff --git a/target/i386/cpu-softmmu.c b/target/i386/cpu-softmmu.c
index c824408e8eb..34fd7b0de02 100644
--- a/target/i386/cpu-softmmu.c
+++ b/target/i386/cpu-softmmu.c
@@ -23,6 +23,7 @@
 #include "sysemu/whpx.h"
 #include "kvm/kvm_i386.h"
 #include "qapi/error.h"
+#include "qapi/qapi-visit-machine.h"
 #include "qapi/qapi-visit-run-state.h"
 #include "qapi/qmp/qdict.h"
 #include "qom/qom-qobject.h"
@@ -350,3 +351,38 @@ void x86_cpu_get_crash_info_qom(Object *obj, Visitor *v,
     qapi_free_GuestPanicInformation(panic_info);
 }
 
+/* Generic getter for "feature-words" and "filtered-features" properties */
+void x86_cpu_get_feature_words(Object *obj, Visitor *v,
+                               const char *name, void *opaque,
+                               Error **errp)
+{
+    uint64_t *array = (uint64_t *)opaque;
+    FeatureWord w;
+    X86CPUFeatureWordInfo word_infos[FEATURE_WORDS] = { };
+    X86CPUFeatureWordInfoList list_entries[FEATURE_WORDS] = { };
+    X86CPUFeatureWordInfoList *list = NULL;
+
+    for (w = 0; w < FEATURE_WORDS; w++) {
+        FeatureWordInfo *wi = &feature_word_info[w];
+        /*
+         * We didn't have MSR features when "feature-words" was
+         *  introduced. Therefore skipped other type entries.
+         */
+        if (wi->type != CPUID_FEATURE_WORD) {
+            continue;
+        }
+        X86CPUFeatureWordInfo *qwi = &word_infos[w];
+        qwi->cpuid_input_eax = wi->cpuid.eax;
+        qwi->has_cpuid_input_ecx = wi->cpuid.needs_ecx;
+        qwi->cpuid_input_ecx = wi->cpuid.ecx;
+        qwi->cpuid_register = get_register_enum_32(w);
+        qwi->features = array[w];
+
+        /* List will be in reverse order, but order shouldn't matter */
+        list_entries[w].next = list;
+        list_entries[w].value = &word_infos[w];
+        list = &list_entries[w];
+    }
+
+    visit_type_X86CPUFeatureWordInfoList(v, "feature-words", &list, errp);
+}
diff --git a/target/i386/cpu.c b/target/i386/cpu.c
index ffa342171ba..c088bcf3113 100644
--- a/target/i386/cpu.c
+++ b/target/i386/cpu.c
@@ -27,7 +27,7 @@
 #include "sysemu/hvf.h"
 #include "kvm/kvm_i386.h"
 #include "sev_i386.h"
-#include "qapi/qapi-visit-machine.h"
+#include "qapi/qapi-builtin-visit.h"
 #include "qapi/qmp/qerror.h"
 #include "qapi/qapi-commands-machine-target.h"
 #include "standard-headers/asm-x86/kvm_para.h"
@@ -4529,42 +4529,6 @@ static void x86_cpuid_set_tsc_freq(Object *obj, Visitor *v, const char *name,
     cpu->env.tsc_khz = cpu->env.user_tsc_khz = value / 1000;
 }
 
-/* Generic getter for "feature-words" and "filtered-features" properties */
-static void x86_cpu_get_feature_words(Object *obj, Visitor *v,
-                                      const char *name, void *opaque,
-                                      Error **errp)
-{
-    uint64_t *array = (uint64_t *)opaque;
-    FeatureWord w;
-    X86CPUFeatureWordInfo word_infos[FEATURE_WORDS] = { };
-    X86CPUFeatureWordInfoList list_entries[FEATURE_WORDS] = { };
-    X86CPUFeatureWordInfoList *list = NULL;
-
-    for (w = 0; w < FEATURE_WORDS; w++) {
-        FeatureWordInfo *wi = &feature_word_info[w];
-        /*
-                * We didn't have MSR features when "feature-words" was
-                *  introduced. Therefore skipped other type entries.
-                */
-        if (wi->type != CPUID_FEATURE_WORD) {
-            continue;
-        }
-        X86CPUFeatureWordInfo *qwi = &word_infos[w];
-        qwi->cpuid_input_eax = wi->cpuid.eax;
-        qwi->has_cpuid_input_ecx = wi->cpuid.needs_ecx;
-        qwi->cpuid_input_ecx = wi->cpuid.ecx;
-        qwi->cpuid_register = get_register_enum_32(w);
-        qwi->features = array[w];
-
-        /* List will be in reverse order, but order shouldn't matter */
-        list_entries[w].next = list;
-        list_entries[w].value = &word_infos[w];
-        list = &list_entries[w];
-    }
-
-    visit_type_X86CPUFeatureWordInfoList(v, "feature-words", &list, errp);
-}
-
 /* Convert all '_' in a feature string option name to '-', to make feature
  * name conform to QOM property naming rule, which uses '-' instead of '_'.
  */
@@ -6422,12 +6386,14 @@ static void x86_cpu_initfn(Object *obj)
     env->nr_dies = 1;
     cpu_set_cpustate_pointers(cpu);
 
+#if !defined(CONFIG_USER_ONLY)
     object_property_add(obj, "feature-words", "X86CPUFeatureWordInfo",
                         x86_cpu_get_feature_words,
                         NULL, NULL, (void *)env->features);
     object_property_add(obj, "filtered-features", "X86CPUFeatureWordInfo",
                         x86_cpu_get_feature_words,
                         NULL, NULL, (void *)cpu->filtered_features);
+#endif  /* !CONFIG_USER_ONLY */
 
     object_property_add_alias(obj, "sse3", obj, "pni");
     object_property_add_alias(obj, "pclmuldq", obj, "pclmulqdq");
-- 
2.26.2


