Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7560259BC13
	for <lists+qemu-devel@lfdr.de>; Mon, 22 Aug 2022 10:53:05 +0200 (CEST)
Received: from localhost ([::1]:39282 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oQ3BA-00061z-Lg
	for lists+qemu-devel@lfdr.de; Mon, 22 Aug 2022 04:53:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50328)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <drapas86@gmail.com>)
 id 1oQ39O-0004Pd-TC
 for qemu-devel@nongnu.org; Mon, 22 Aug 2022 04:51:15 -0400
Received: from mail-lj1-x229.google.com ([2a00:1450:4864:20::229]:44592)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <drapas86@gmail.com>)
 id 1oQ39L-0004Vk-2X
 for qemu-devel@nongnu.org; Mon, 22 Aug 2022 04:51:13 -0400
Received: by mail-lj1-x229.google.com with SMTP id by6so9911566ljb.11
 for <qemu-devel@nongnu.org>; Mon, 22 Aug 2022 01:51:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc;
 bh=m1B+SddJ/ty7Xm2+XD7xiGxSWCvpPTM7soXFi1MlzIA=;
 b=q6zmP616pdYdds/ncRhQk80meCHXqu18qthuVYN5we58oWekd1cazNxPKnBZ8D5SAm
 zV/2z9v/CY1SL6GVLdk66GKFkAy1F4tG/mQo/9CsH3B0ThdeEuYHwYf5hFUe52Hla4IW
 rx9P/eY8KVr7L+PMxYLalCuYa+9yI5pCmaRjp67NpXL0EYu34+2/PqrFW/GFBAVehOfD
 S8Bqro7z1ccb2z+rj3vZt5MHVaDQt1Wb7MJPU9FvIraO3yAFrT76RI/SjdJM2uADDfMa
 6A/dcGLooGqZu3L8z4VnXwfxhVIuBFrUTUQCS49XbwwPgResnK1XtuEKnZxhNvsNys5g
 zMjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc;
 bh=m1B+SddJ/ty7Xm2+XD7xiGxSWCvpPTM7soXFi1MlzIA=;
 b=PJF+JJnG3lNuaGqYCAMgntzpV4ia+16o1ic5n0tAmn38p4iQKtTJz1tDDDrRH5aR7b
 AWuZzv8a4b/cmtJpqfcbNiLdw7Q9YE9c9bIpt6O+zrffYD7MbXhTrcOtcCBcKnxOHgnW
 GhFLstzWQx+pBBgckbN4GEUTXcPj6QYu0ICW3UIuo22xVd2a1lcwFydBOr+zC5Lwt/ye
 MCFpl3TflnZJxkGTTbH+AtoAPMVK6+fhdbctaKzXpGJYfa/vRtP5bRqHXeuc+emsI2xx
 0RiKX1vVwMGwDJtMJJ0yCTSIKi9w6zjFet8iqMRWy3lBOAwQYBk9tJVMXEuwf24dnNNR
 vXwA==
X-Gm-Message-State: ACgBeo3g9TMvz5wE6mpvDrNEI2JeWo2lLUZmqlYoMRXS84EKQy7b0ttg
 a/Wj9ISe654XnMMvP9UvUMt/m9bZ2pI=
X-Google-Smtp-Source: AA6agR7GliaCAUgjcyc5l2uXo89Q7jICK7NUfX3M8CCIPl75FdguEjXJgsNO3XTuD7wjdhAZ07jmXA==
X-Received: by 2002:a2e:8515:0:b0:261:cf74:a0c8 with SMTP id
 j21-20020a2e8515000000b00261cf74a0c8mr732707lji.24.1661158268336; 
 Mon, 22 Aug 2022 01:51:08 -0700 (PDT)
Received: from drapas-VirtualBox.office.auriga.msk ([77.222.111.229])
 by smtp.gmail.com with ESMTPSA id
 b9-20020ac25e89000000b0048b08f0c4ddsm1827176lfq.253.2022.08.22.01.51.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Aug 2022 01:51:07 -0700 (PDT)
From: Drap Anton <drapas86@gmail.com>
X-Google-Original-From: Drap Anton <anton.drap@auriga.com>
To: qemu-devel@nongnu.org
Cc: vladimir.sebelev@auriga.com,
	"Drap, Anton" <anton.drap@auriga.com>
Subject: [PATCH v3] Loading new machines and devices from external modules
Date: Mon, 22 Aug 2022 13:50:41 +0500
Message-Id: <20220822085041.127776-1-anton.drap@auriga.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

    Current QEMU politics is to have all the supported
platforms inside QEMU source tree, but actually simulator core
development, development of the devices standard library and
development of virtual platforms are three different tasks.
    Moreover different people interested in different parts of QEMU.
QEMU core developers not interested in supporting and maintaining
tons of platforms available on the market. Virtual platform developers
not interested and usually don’t have resources to merge their changes
upstream. So we have a lots of abandoned QEMU forks for different
platforms.
    For example we’re now working on Raspberry Pi 4b implementation for our
internal needs and we’re planning to merge it upstream. It’s based on some
QEMU fork author of which wasn’t able to complete it and commit upstream.
And it can’t be used with later QEMU without some efforts to port it
to newer QEMU version. Nobody supports and maintaining it since constant
efforts necessary to be in sync with QEMU mainline. So my opinion is that
core development, core device library and virtual platform development
should be divided to make life easier for everybody. And this changes is
first step to it.
    About legal reasons and GPL violations. Possibility to make .so
with machine separately and load it without providing sources is
a legal risk and can’t be completely solved with technical actions.
Ban on external modules just makes it more difficult for everybody
to use not upstream code (including GPL violators, but not only for them)
and doesn’t block ability to distribute full QEMU fork with closed models
without providing sources. So I don’t see any reason to make technical
limitations which actually can’t solve legal problem.
    This patch is to add two parameters `add_machine` and `add_modinfo`.
`add_machine` is to add machines from external modules.
`add_modinfo` is to add devices from external modules, needed for a new
machine, for example.
Additional, 'arch' parameter of QemuModinfo is changed to a list.

Signed-off-by: Drap Anton <anton.drap@auriga.com>
---
v2: subject is changed
v3: 
    - description is changed
    - rebased on last master
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
index 3f23a42fa8..4913fdd775 100644
--- a/qemu-options.hx
+++ b/qemu-options.hx
@@ -5540,6 +5540,44 @@ SRST
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
index 706bd7cff7..9081d5bd8b 100644
--- a/softmmu/vl.c
+++ b/softmmu/vl.c
@@ -3460,6 +3460,20 @@ void qemu_init(int argc, char **argv, char **envp)
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


