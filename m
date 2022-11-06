Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6581F61E116
	for <lists+qemu-devel@lfdr.de>; Sun,  6 Nov 2022 09:54:20 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1orbPi-0001fp-QJ; Sun, 06 Nov 2022 03:53:58 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1orbPe-0001c4-93
 for qemu-devel@nongnu.org; Sun, 06 Nov 2022 03:53:54 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1orbPc-0002xo-KN
 for qemu-devel@nongnu.org; Sun, 06 Nov 2022 03:53:54 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1667724832;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version: content-type:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=6YN9VuoQnWngTr5LDd1j1pDzSm6hSEAcVP/4chtuv4A=;
 b=brGYVyub1l/AbUHkBpxNAy7akw857pfsscvhbGC86+xG9DOoDZJTT9g/xAGP+TR3S1rgdp
 hp1Oit5prIKhtnCbBBqAPNXk5Uv2LAj1k/N03ej+6LyfACRDuOuXriBIFmytMMk5dJeMei
 9KCuWEORoK6oY9xv0PE4xtpN24wLxAE=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-256-4oK2c6M9Oum_nMR_9vgeQA-1; Sun, 06 Nov 2022 03:53:51 -0500
X-MC-Unique: 4oK2c6M9Oum_nMR_9vgeQA-1
Received: by mail-wr1-f70.google.com with SMTP id
 m24-20020adfa3d8000000b00236774fd74aso1997203wrb.8
 for <qemu-devel@nongnu.org>; Sun, 06 Nov 2022 01:53:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=6YN9VuoQnWngTr5LDd1j1pDzSm6hSEAcVP/4chtuv4A=;
 b=Ea+CmXy6AM56KsWE2l2xOBikojCzv/WlDD5iWPaNS8NyTJJUBqVNd+rMRUkHI3w+d1
 196ohu7Z/XUPLk+GBnEr8LlG0MUq5cm5gsu/bgCZCZ65SdCm9pPjgGSykslNcTJ593cr
 t8f4kpR/1IrKXNA0UtcIy/5N9Hrx4Xfxdm/Qh2LRMq9D9Q2sSMIgPcgvkWJJZRR4rRO9
 CmtaTNUgyRwbdqy5gTsaejfwMdBQfgeQp/iG8tyyyAaifw9GJY4ZPUWhD1ci/LLapRWj
 +8hdYbOgrGiJPsKavx10DGanApSuep8xmI90cogh6pes7KwNS+tQZoCovmbEaalJEJSH
 77Ng==
X-Gm-Message-State: ACrzQf3rbdw4oLZUCVFgBZa0iJW9e6T6I3Bk2LCJHjoIAZUg/CmTabNK
 Is9x5li/oUX+O/aUmJrv54h1cGIAJXo0Asj4rvZuECBCILul/I0U2+m98XQjE5lW0xD+lsq0Gv/
 viQ0Niwo4J1WoVwfLWKkAlek8Q4GPbJlU8n+yzkJIRoDNzQZK0BU1TEBA1jkUICOgnyQ=
X-Received: by 2002:a05:600c:1f17:b0:3ce:1f81:d9fa with SMTP id
 bd23-20020a05600c1f1700b003ce1f81d9famr29706899wmb.138.1667724829628; 
 Sun, 06 Nov 2022 01:53:49 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM7m2fhQ8ZB3hyWc/+IxnW2QYHHyleq111zrTzLQk4a7ecHeXQz5+gfdma/kzjL9phfxPjvX6Q==
X-Received: by 2002:a05:600c:1f17:b0:3ce:1f81:d9fa with SMTP id
 bd23-20020a05600c1f1700b003ce1f81d9famr29706887wmb.138.1667724829341; 
 Sun, 06 Nov 2022 01:53:49 -0700 (PDT)
Received: from avogadro.local ([2001:b07:6468:f312:e3ec:5559:7c5c:1928])
 by smtp.gmail.com with ESMTPSA id
 o13-20020adfeacd000000b002366a624bd4sm4185141wrn.28.2022.11.06.01.53.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 06 Nov 2022 01:53:48 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: Claudio Fontana <cfontana@suse.de>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: [PULL 08/12] module: removed unused function argument "mayfail"
Date: Sun,  6 Nov 2022 09:51:11 +0100
Message-Id: <20221106085115.257018-9-pbonzini@redhat.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221106085115.257018-1-pbonzini@redhat.com>
References: <20221106085115.257018-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Type: text/plain
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.045,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PP_MIME_FAKE_ASCII_TEXT=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

From: Claudio Fontana <cfontana@suse.de>

mayfail is always passed as false for every invocation throughout the program.
It controls whether to printf or not to printf an error on
g_module_open failure.

Remove this unused argument.

Signed-off-by: Claudio Fontana <cfontana@suse.de>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Message-Id: <20220929093035.4231-2-cfontana@suse.de>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 include/qemu/module.h |  8 ++++----
 softmmu/qtest.c       |  2 +-
 util/module.c         | 20 +++++++++-----------
 3 files changed, 14 insertions(+), 16 deletions(-)

diff --git a/include/qemu/module.h b/include/qemu/module.h
index bd73607104c9..8c012bbe038d 100644
--- a/include/qemu/module.h
+++ b/include/qemu/module.h
@@ -61,15 +61,15 @@ typedef enum {
 #define fuzz_target_init(function) module_init(function, \
                                                MODULE_INIT_FUZZ_TARGET)
 #define migration_init(function) module_init(function, MODULE_INIT_MIGRATION)
-#define block_module_load_one(lib) module_load_one("block-", lib, false)
-#define ui_module_load_one(lib) module_load_one("ui-", lib, false)
-#define audio_module_load_one(lib) module_load_one("audio-", lib, false)
+#define block_module_load_one(lib) module_load_one("block-", lib)
+#define ui_module_load_one(lib) module_load_one("ui-", lib)
+#define audio_module_load_one(lib) module_load_one("audio-", lib)
 
 void register_module_init(void (*fn)(void), module_init_type type);
 void register_dso_module_init(void (*fn)(void), module_init_type type);
 
 void module_call_init(module_init_type type);
-bool module_load_one(const char *prefix, const char *lib_name, bool mayfail);
+bool module_load_one(const char *prefix, const char *lib_name);
 void module_load_qom_one(const char *type);
 void module_load_qom_all(void);
 void module_allow_arch(const char *arch);
diff --git a/softmmu/qtest.c b/softmmu/qtest.c
index afea7693d0cd..ff74c5d7092e 100644
--- a/softmmu/qtest.c
+++ b/softmmu/qtest.c
@@ -756,7 +756,7 @@ static void qtest_process_command(CharBackend *chr, gchar **words)
         g_assert(words[1] && words[2]);
 
         qtest_send_prefix(chr);
-        if (module_load_one(words[1], words[2], false)) {
+        if (module_load_one(words[1], words[2])) {
             qtest_sendf(chr, "OK\n");
         } else {
             qtest_sendf(chr, "FAIL\n");
diff --git a/util/module.c b/util/module.c
index 8ddb0e18f517..8563edd6267c 100644
--- a/util/module.c
+++ b/util/module.c
@@ -144,7 +144,7 @@ static bool module_check_arch(const QemuModinfo *modinfo)
     return true;
 }
 
-static int module_load_file(const char *fname, bool mayfail, bool export_symbols)
+static int module_load_file(const char *fname, bool export_symbols)
 {
     GModule *g_module;
     void (*sym)(void);
@@ -172,10 +172,8 @@ static int module_load_file(const char *fname, bool mayfail, bool export_symbols
     }
     g_module = g_module_open(fname, flags);
     if (!g_module) {
-        if (!mayfail) {
-            fprintf(stderr, "Failed to open module: %s\n",
-                    g_module_error());
-        }
+        fprintf(stderr, "Failed to open module: %s\n",
+                g_module_error());
         ret = -EINVAL;
         goto out;
     }
@@ -208,7 +206,7 @@ out:
 }
 #endif
 
-bool module_load_one(const char *prefix, const char *lib_name, bool mayfail)
+bool module_load_one(const char *prefix, const char *lib_name)
 {
     bool success = false;
 
@@ -256,7 +254,7 @@ bool module_load_one(const char *prefix, const char *lib_name, bool mayfail)
             if (strcmp(modinfo->name, module_name) == 0) {
                 /* we depend on other module(s) */
                 for (sl = modinfo->deps; *sl != NULL; sl++) {
-                    module_load_one("", *sl, false);
+                    module_load_one("", *sl);
                 }
             } else {
                 for (sl = modinfo->deps; *sl != NULL; sl++) {
@@ -287,7 +285,7 @@ bool module_load_one(const char *prefix, const char *lib_name, bool mayfail)
     for (i = 0; i < n_dirs; i++) {
         fname = g_strdup_printf("%s/%s%s",
                 dirs[i], module_name, CONFIG_HOST_DSOSUF);
-        ret = module_load_file(fname, mayfail, export_symbols);
+        ret = module_load_file(fname, export_symbols);
         g_free(fname);
         fname = NULL;
         /* Try loading until loaded a module file */
@@ -333,7 +331,7 @@ void module_load_qom_one(const char *type)
         }
         for (sl = modinfo->objs; *sl != NULL; sl++) {
             if (strcmp(type, *sl) == 0) {
-                module_load_one("", modinfo->name, false);
+                module_load_one("", modinfo->name);
             }
         }
     }
@@ -354,7 +352,7 @@ void module_load_qom_all(void)
         if (!module_check_arch(modinfo)) {
             continue;
         }
-        module_load_one("", modinfo->name, false);
+        module_load_one("", modinfo->name);
     }
     module_loaded_qom_all = true;
 }
@@ -370,7 +368,7 @@ void qemu_load_module_for_opts(const char *group)
         }
         for (sl = modinfo->opts; *sl != NULL; sl++) {
             if (strcmp(group, *sl) == 0) {
-                module_load_one("", modinfo->name, false);
+                module_load_one("", modinfo->name);
             }
         }
     }
-- 
2.38.1


