Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E249557A004
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Jul 2022 15:49:08 +0200 (CEST)
Received: from localhost ([::1]:49986 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oDnaw-0008Oz-EC
	for lists+qemu-devel@lfdr.de; Tue, 19 Jul 2022 09:49:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:32844)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <drapas86@gmail.com>)
 id 1oDkeZ-0003i3-Hf
 for qemu-devel@nongnu.org; Tue, 19 Jul 2022 06:40:35 -0400
Received: from mail-lj1-x229.google.com ([2a00:1450:4864:20::229]:41654)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <drapas86@gmail.com>)
 id 1oDkeX-0004Ab-7V
 for qemu-devel@nongnu.org; Tue, 19 Jul 2022 06:40:35 -0400
Received: by mail-lj1-x229.google.com with SMTP id p6so16869893ljc.8
 for <qemu-devel@nongnu.org>; Tue, 19 Jul 2022 03:40:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=/7P7YPibCAGRUbqdyGkN8T4pNZnFWBSITgmfXIKCm0I=;
 b=jx1UQZhnTjgn/Dkf6qsAQYaKUz8T1vfcNACn5otsUlXyn3myuoiCklTqglj7FzslR+
 HeUO6JzgvsEiSbkbM8RFWnUX8tetFRpI8KGgEcsnVSZl0n80Ow/RU87pZsAmyIKK7I0b
 Q4GfuLjnEaf+kpzpbArggRtrr1KbcVDf5zRmcH6sl5GatkR8ra6HLQ0T9qsg7KdOBsMt
 z0r2ZqPXI8obwYzBSUZWjjVX2BCTHPaRvbfVs7qAXtOa0GiqO1/p0AqlwQ+NrtuypY+t
 JceB8QWYncYgD+7pQkq9JXhGmtkyfkZHy5T59aLZK1D+Re8KZRAkQ6+4b2Z3T9+rboWI
 GNIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=/7P7YPibCAGRUbqdyGkN8T4pNZnFWBSITgmfXIKCm0I=;
 b=JzNiVNM4Anid25W9VAbw1mdRxVYLFzuyuPlVk2dc/RzjvW6ifTYj+VASu+tQ2gnRS0
 1ouflm4w8Gr+X5i0JJoU8XMQTbtn4f7Y5VwmKrgOYsFyzllJx5L0Jio84chPK0LktIN3
 0n2AFTkHlABQPFbm8fLK0hA3N/BmFAPH9Z77UIfe+WD9uU/0QrnCHT0QvqJxvVcuzUsB
 c3JEJzC3z3FUnZgkTJeiPutS4ZvoWQzy/MOM8vmXVtjdbY3NRjsfeF70tn9WkgHHJkRG
 lc2NYjJWLaD+45ODZyOn5fN44FWGKaNQTLQ5YgEHozQthWWwvs7FC9XtHx8VjmxRrJFZ
 QvTQ==
X-Gm-Message-State: AJIora/THTD/QmqDwUXTPOqaKXS6C7sR0fAmCth80sUXLy6M+kP+Qi6X
 K4YiESMcoOGKbPuoqBzMfS/5290rS6v+bA==
X-Google-Smtp-Source: AGRyM1s4Blokxx2IkT/z5koCKEeVyW+Ti4Uv62sStG38I4rDmIHAsFuU8aFdrEr52HacF5vJyY8c5Q==
X-Received: by 2002:a05:651c:b1e:b0:25d:9ec9:4f58 with SMTP id
 b30-20020a05651c0b1e00b0025d9ec94f58mr11283528ljr.75.1658227229853; 
 Tue, 19 Jul 2022 03:40:29 -0700 (PDT)
Received: from drapas-VirtualBox.office.auriga.msk ([77.222.111.229])
 by smtp.gmail.com with ESMTPSA id
 o22-20020a05651205d600b0047f8790085csm2928046lfo.71.2022.07.19.03.40.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 19 Jul 2022 03:40:29 -0700 (PDT)
From: Drap Anton <drapas86@gmail.com>
X-Google-Original-From: Drap Anton <anton.drap@auriga.com>
To: qemu-devel@nongnu.org
Cc: anton.drap@auriga.com
Subject: [PATCH] There is no mechanism to load external machines and classes
 from modules at the moment. This patch is to add two parameters `add_machine`
 and `add_modinfo` for it. `add_machine` is to add machine from external
 modules. `add_modinfo` is to load new types from external modules,
 needed for a new machine,
 for example. Main aim is to have possibility to develop independent models and
 be able to use it with mainline QEMU. It will help to make develop new models
 of proprietary boards,
 simplify to use Qemu by hardware developers and extend number of supporting
 boards and devices in QEMU. It will be easier for small hardware
 manufacturers to use QEMU to develop their own board models and use them to
 shift left of FW/SW development.
Date: Tue, 19 Jul 2022 15:40:18 +0500
Message-Id: <20220719104018.305201-1-anton.drap@auriga.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::229;
 envelope-from=drapas86@gmail.com; helo=mail-lj1-x229.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Tue, 19 Jul 2022 09:21:29 -0400
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: "Drap, Anton" <anton.drap@auriga.com>

Signed-off-by: Drap Anton <anton.drap@auriga.com>
---
 include/qapi/qmp/qjson.h    |   2 +
 include/qemu/module.h       |   4 +-
 qemu-options.hx             |  38 ++++++
 qobject/qjson.c             |  14 ++
 scripts/modinfo-generate.py |   7 +-
 softmmu/vl.c                |  14 ++
 util/module.c               | 249 +++++++++++++++++++++++++++++++++++-
 7 files changed, 320 insertions(+), 8 deletions(-)

diff --git a/include/qapi/qmp/qjson.h b/include/qapi/qmp/qjson.h
index 7bd8d2de1b..bd1a44ce90 100644
--- a/include/qapi/qmp/qjson.h
+++ b/include/qapi/qmp/qjson.h
@@ -25,6 +25,8 @@ QDict *qdict_from_vjsonf_nofail(const char *string, va_list ap)
 QDict *qdict_from_jsonf_nofail(const char *string, ...)
     G_GNUC_PRINTF(1, 2);
 
+QDict *qdict_from_json_nofail_nofmt(const char *string);
+
 GString *qobject_to_json(const QObject *obj);
 GString *qobject_to_json_pretty(const QObject *obj, bool pretty);
 
diff --git a/include/qemu/module.h b/include/qemu/module.h
index bd73607104..cdd3a3ceef 100644
--- a/include/qemu/module.h
+++ b/include/qemu/module.h
@@ -73,6 +73,8 @@ bool module_load_one(const char *prefix, const char *lib_name, bool mayfail);
 void module_load_qom_one(const char *type);
 void module_load_qom_all(void);
 void module_allow_arch(const char *arch);
+bool load_external_modules(const char *mods_list);
+bool add_modinfo(const char *filename);
 
 /**
  * DOC: module info annotation macros
@@ -154,7 +156,7 @@ void module_allow_arch(const char *arch);
 typedef struct QemuModinfo QemuModinfo;
 struct QemuModinfo {
     const char *name;
-    const char *arch;
+    const char **arch;
     const char **objs;
     const char **deps;
     const char **opts;
diff --git a/qemu-options.hx b/qemu-options.hx
index 377d22fbd8..804d15e0f0 100644
--- a/qemu-options.hx
+++ b/qemu-options.hx
@@ -5476,6 +5476,44 @@ SRST
             (qemu) qom-set /objects/iothread1 poll-max-ns 100000
 ERST
 
+DEF("add_machines", HAS_ARG, QEMU_OPTION_add_machines, \
+    "-add_machines libname[,...]\n",
+    QEMU_ARCH_ALL)
+SRST
+``-add_machines libname[,...]``
+    Add machines from external modules.
+    For example:
+
+    ::
+
+        -add_machines custom-arm-machine,custom-arm-machine2
+ERST
+
+DEF("add_modinfo", HAS_ARG, QEMU_OPTION_add_modinfo, \
+    "-add_modinfo filename\n",
+    QEMU_ARCH_ALL)
+SRST
+``-add_modinfo filename``
+    Extend modinfo from file. Used to add devices from external modules.
+    Modinfo extention file is a JSON file with dictionary of modules:
+    {
+    "short name of module": {"name": "module-name",
+                             "arch": ["supported_arch_1", "supported_arch_2",],
+                             "objs": ["object1_description", "object2_description",],
+                             "deps": ["depend_of_module_name1", "depend_of_module_name2",],
+                             "opts": ["option1", "option2",]
+                            }
+    }
+
+    Architectures should be designated as they are printed by ./configure --help in target list
+    without "-softmmu" or "-linux-user" suffixes. e.g.: "arm", "x86_64", "riscv32", etc.
+
+    For example:
+
+    ::
+
+        -add_modinfo modinfo_extention.json
+ERST
 
 HXCOMM This is the last statement. Insert new options before this line!
 
diff --git a/qobject/qjson.c b/qobject/qjson.c
index 167fcb429c..6045264594 100644
--- a/qobject/qjson.c
+++ b/qobject/qjson.c
@@ -148,6 +148,20 @@ QDict *qdict_from_jsonf_nofail(const char *string, ...)
     return qdict;
 }
 
+/*
+ * Parse @string as JSON object without %-escapes interpolated.
+ * Abort on error.  Do not use with untrusted @string.
+ * Return the resulting QDict.  It is never null.
+ */
+QDict *qdict_from_json_nofail_nofmt(const char *string)
+{
+    QDict *qdict;
+    qdict = qobject_to(QDict, qobject_from_json(string, &error_abort));
+    assert(qdict);
+    return qdict;
+}
+
+
 static void to_json(JSONWriter *writer, const char *name,
                     const QObject *obj)
 {
diff --git a/scripts/modinfo-generate.py b/scripts/modinfo-generate.py
index b1538fcced..ddfe444fea 100755
--- a/scripts/modinfo-generate.py
+++ b/scripts/modinfo-generate.py
@@ -33,7 +33,7 @@ def parse_line(line):
     return (kind, data)
 
 def generate(name, lines, enabled):
-    arch = ""
+    arch = []
     objs = []
     deps = []
     opts = []
@@ -47,7 +47,7 @@ def generate(name, lines, enabled):
             elif kind == 'opts':
                 opts.append(data)
             elif kind == 'arch':
-                arch = data;
+                arch.append(data)
             elif kind == 'kconfig':
                 # don't add a module which dependency is not enabled
                 # in kconfig
@@ -61,8 +61,7 @@ def generate(name, lines, enabled):
                 exit(1)
 
     print("    .name = \"%s\"," % name)
-    if arch != "":
-        print("    .arch = %s," % arch)
+    print_array("arch", arch)
     print_array("objs", objs)
     print_array("deps", deps)
     print_array("opts", opts)
diff --git a/softmmu/vl.c b/softmmu/vl.c
index aabd82e09a..17293eeda7 100644
--- a/softmmu/vl.c
+++ b/softmmu/vl.c
@@ -3465,6 +3465,20 @@ void qemu_init(int argc, char **argv, char **envp)
             case QEMU_OPTION_enable_sync_profile:
                 qsp_enable();
                 break;
+            case QEMU_OPTION_add_machines:
+                info_report("External machines loading: %s", optarg);
+                if (!load_external_modules(optarg)) {
+                    error_report("Modules loading error. Modules %s", optarg);
+                    exit(1);
+                }
+                break;
+            case QEMU_OPTION_add_modinfo:
+                info_report("Modinfo parsing: %s", optarg);
+                if (!add_modinfo(optarg)) {
+                    error_report("Modinfo (%s) adding error", optarg);
+                    exit(1);
+                }
+                break;
             case QEMU_OPTION_nouserconfig:
                 /* Nothing to be parsed here. Especially, do not error out below. */
                 break;
diff --git a/util/module.c b/util/module.c
index 8ddb0e18f5..c2eec5d1c3 100644
--- a/util/module.c
+++ b/util/module.c
@@ -21,6 +21,10 @@
 #include "qemu/module.h"
 #include "qemu/cutils.h"
 #include "qemu/config-file.h"
+#include "qapi/qmp/qdict.h"
+#include "qapi/qmp/qjson.h"
+#include "qapi/qmp/qlist.h"
+#include "qapi/qmp/qstring.h"
 #ifdef CONFIG_MODULE_UPGRADES
 #include "qemu-version.h"
 #endif
@@ -124,6 +128,7 @@ void module_init_info(const QemuModinfo *info)
     module_info = info;
 }
 
+
 void module_allow_arch(const char *arch)
 {
     module_arch = arch;
@@ -136,10 +141,20 @@ static bool module_check_arch(const QemuModinfo *modinfo)
             /* no arch set -> ignore all */
             return false;
         }
-        if (strcmp(module_arch, modinfo->arch) != 0) {
-            /* mismatch */
-            return false;
+
+        const char **arch_list = modinfo->arch;
+        const char *arch;
+
+        while ((arch = *(arch_list++))) {
+
+            if (strcmp(module_arch, arch) == 0) {
+                return true;
+            }
         }
+
+        /* modinfo->arch is not empty but no match found */
+        /* current arch is not supported */
+        return false;
     }
     return true;
 }
@@ -314,6 +329,32 @@ bool module_load_one(const char *prefix, const char *lib_name, bool mayfail)
 
 static bool module_loaded_qom_all;
 
+static void modinfo_prepend(QemuModinfo **modinfo, uint32_t mod_count,
+                     const QemuModinfo *modinfo_ext) {
+    const QemuModinfo *pinfo;
+    uint32_t mod_count_new;
+    uint32_t mod_count_ext = 0;
+    uint32_t i;
+
+    for (pinfo = modinfo_ext; pinfo->name != NULL; ++pinfo) {
+        ++mod_count_ext;
+    }
+
+    /* 1 for end of list */
+    mod_count_new = mod_count + mod_count_ext + 1;
+    *modinfo = g_realloc(*modinfo, mod_count_new * sizeof(**modinfo));
+    memmove((*modinfo) + mod_count_ext,
+            *modinfo,
+            mod_count * sizeof(**modinfo));
+    /* last entry with null name treat as end of array */
+    (*modinfo)[mod_count_new - 1].name = NULL;
+
+    for (pinfo = modinfo_ext, i = 0; pinfo->name != NULL; ++pinfo, ++i) {
+        (*modinfo)[i] = *pinfo;
+    }
+}
+
+
 void module_load_qom_one(const char *type)
 {
     const QemuModinfo *modinfo;
@@ -376,11 +417,213 @@ void qemu_load_module_for_opts(const char *group)
     }
 }
 
+bool load_external_modules(const char *mods_list)
+{
+    bool res = false;
+    g_auto(GStrv) mod_names = NULL;
+
+    mod_names = g_strsplit(mods_list, ",", -1);
+    for (int i = 0; mod_names[i]; ++i) {
+        res = module_load_one("", mod_names[i], false);
+        if (!res) {
+            error_report("Module %s not found", mod_names[i]);
+            break;
+        }
+        info_report("Module %s loaded", mod_names[i]);
+    }
+
+    return res;
+}
+
+bool add_modinfo(const char *filename)
+{
+    g_autofree char *buf = NULL;
+    gsize buflen;
+    GError *gerr = NULL;
+    QDict *modinfo_dict;
+    QList *arch;
+    QList *objs;
+    QList *deps;
+    QList *opts;
+    const QDictEntry *entry;
+    uint32_t i = 0;
+    uint32_t mod_count = 0;
+    QemuModinfo *modinfo_ext;
+
+    if (!g_file_get_contents(filename, &buf, &buflen, &gerr)) {
+        fprintf(stderr, "Cannot open modinfo extension file %s: %s\n",
+                filename, gerr->message);
+        g_error_free(gerr);
+        return false;
+    }
+
+    modinfo_dict = qdict_from_json_nofail_nofmt(buf);
+
+    if (!modinfo_dict) {
+        fprintf(stderr, "Invalid modinfo (%s) format: parsing json error\n",
+                filename);
+        g_error_free(gerr);
+        return false;
+    }
+
+    for (entry = qdict_first(modinfo_dict); entry;
+         entry = qdict_next(modinfo_dict, entry)) {
+        mod_count++;
+    }
+    if (mod_count == 0) {
+        return true;
+    }
+
+    modinfo_ext = g_malloc0(sizeof(*modinfo_ext) * (mod_count + 1));
+    /* last entry with null name treat as end of array */
+    modinfo_ext[mod_count].name = NULL;
+
+    for (entry = qdict_first(modinfo_dict), i = 0; entry;
+         entry = qdict_next(modinfo_dict, entry), ++i) {
+
+        QListEntry *qlist_entry;
+        QDict *module_dict;
+        QemuModinfo *modinfo;
+        size_t list_size;
+        uint32_t n = 0;
+
+        if (qobject_type(entry->value) != QTYPE_QDICT) {
+            fprintf(stderr, "Invalid modinfo (%s) format: entry is"
+                    " not dictionary\n", filename);
+            return false;
+        }
+
+        module_dict = qobject_to(QDict, entry->value);
+        modinfo = &modinfo_ext[i];
+
+        modinfo->name = g_strdup(qdict_get_str(module_dict, "name"));
+
+        arch = qdict_get_qlist(module_dict, "arch");
+        if (arch) {
+            n = 0;
+            list_size = qlist_size(arch);
+            modinfo->arch = g_malloc((list_size + 1) * sizeof(*modinfo->arch));
+            modinfo->arch[list_size] = NULL;
+            QLIST_FOREACH_ENTRY(arch, qlist_entry) {
+                if (qobject_type(qlist_entry->value) != QTYPE_QSTRING) {
+                    fprintf(stderr, "Invalid modinfo (%s) format: arch\n\n",
+                            filename);
+                    return false;
+                }
+                QString *qstr = qobject_to(QString, qlist_entry->value);
+                modinfo->arch[n++] = g_strdup(qstring_get_str(qstr));
+            }
+        } else {
+             modinfo->arch = NULL;
+        }
+
+        objs = qdict_get_qlist(module_dict, "objs");
+        if (objs) {
+            n = 0;
+            list_size = qlist_size(objs);
+            modinfo->objs = g_malloc((list_size + 1) * sizeof(*modinfo->objs));
+            modinfo->objs[list_size] = NULL;
+            QLIST_FOREACH_ENTRY(objs, qlist_entry) {
+                if (qobject_type(qlist_entry->value) != QTYPE_QSTRING) {
+                    fprintf(stderr, "Invalid modinfo (%s) format: objs\n\n",
+                            filename);
+                    return false;
+                }
+                QString *qstr = qobject_to(QString, qlist_entry->value);
+                modinfo->objs[n++] = g_strdup(qstring_get_str(qstr));
+            }
+        } else {
+             modinfo->objs = NULL;
+        }
+
+        deps = qdict_get_qlist(module_dict, "deps");
+        if (deps) {
+            n = 0;
+            list_size = qlist_size(deps);
+            modinfo->deps = g_malloc((list_size + 1) * sizeof(*modinfo->deps));
+            modinfo->deps[list_size] = NULL;
+            QLIST_FOREACH_ENTRY(deps, qlist_entry) {
+                if (qobject_type(qlist_entry->value) != QTYPE_QSTRING) {
+                    fprintf(stderr, "Invalid modinfo (%s) format: deps",
+                            filename);
+                    return false;
+                }
+                QString *qstr = qobject_to(QString, qlist_entry->value);
+                modinfo->deps[n++] = g_strdup(qstring_get_str(qstr));
+            }
+        } else {
+             modinfo->deps = NULL;
+        }
+
+        opts = qdict_get_qlist(module_dict, "opts");
+        if (opts) {
+            n = 0;
+            list_size = qlist_size(opts);
+            modinfo->opts = g_malloc((list_size + 1) * sizeof(*modinfo->opts));
+            modinfo->opts[list_size] = NULL;
+            QLIST_FOREACH_ENTRY(opts, qlist_entry) {
+                if (qobject_type(qlist_entry->value) != QTYPE_QSTRING) {
+                    fprintf(stderr, "Invalid modinfo (%s) format: opts\n",
+                            filename);
+                    return false;
+                }
+                QString *qstr = qobject_to(QString, qlist_entry->value);
+                modinfo->opts[n++] = g_strdup(qstring_get_str(qstr));
+            }
+        } else {
+             modinfo->opts = NULL;
+        }
+    }
+
+    qobject_unref(modinfo_dict);
+
+    modinfo_prepend(&modinfo_ext, mod_count, module_info);
+    module_init_info(modinfo_ext);
+    return true;
+}
+
+void modinfo_prepend(QemuModinfo **modinfo, uint32_t mod_count,
+                     const QemuModinfo *modinfo_ext)
+{
+    const QemuModinfo *pinfo;
+    uint32_t mod_count_new;
+    uint32_t mod_count_ext = 0;
+    uint32_t i;
+
+    for (pinfo = modinfo_ext; pinfo->name != NULL; ++pinfo) {
+        ++mod_count_ext;
+    }
+
+    /* 1 for end of list */
+    mod_count_new = mod_count + mod_count_ext + 1;
+    *modinfo = g_realloc(*modinfo, mod_count_new * sizeof(**modinfo));
+    memmove((*modinfo) + mod_count_ext,
+            *modinfo,
+            mod_count * sizeof(**modinfo));
+    /* last entry with null name treat as end of array */
+    (*modinfo)[mod_count_new - 1].name = NULL;
+
+    for (pinfo = modinfo_ext, i = 0; pinfo->name != NULL; ++pinfo, ++i) {
+        (*modinfo)[i] = *pinfo;
+    }
+}
+
+
 #else
 
 void module_allow_arch(const char *arch) {}
 void qemu_load_module_for_opts(const char *group) {}
 void module_load_qom_one(const char *type) {}
 void module_load_qom_all(void) {}
+bool load_external_modules(const char *mods_list)
+{
+    fprintf(stderr, "Modules are not enabled\n");
+    return false;
+}
+bool add_modinfo(const char *filename)
+{
+    fprintf(stderr, "Modules are not enabled\n");
+    return false;
+}
 
 #endif
-- 
2.34.1


