Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E319F50CA6A
	for <lists+qemu-devel@lfdr.de>; Sat, 23 Apr 2022 15:12:21 +0200 (CEST)
Received: from localhost ([::1]:55892 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1niFYj-0001BG-0r
	for lists+qemu-devel@lfdr.de; Sat, 23 Apr 2022 09:12:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42766)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1niFFX-0007K3-5C
 for qemu-devel@nongnu.org; Sat, 23 Apr 2022 08:52:36 -0400
Received: from mail-ej1-x62c.google.com ([2a00:1450:4864:20::62c]:37594)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1niFFU-0005Ar-W0
 for qemu-devel@nongnu.org; Sat, 23 Apr 2022 08:52:30 -0400
Received: by mail-ej1-x62c.google.com with SMTP id g13so21194701ejb.4
 for <qemu-devel@nongnu.org>; Sat, 23 Apr 2022 05:52:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=QM4aSryhMOlrXHpZhEssvOA46rFNviioyue6r+UKFeA=;
 b=n8SfamY0nBu8Tuinhcy7Ot/KvdKgnBv7ktrrIYXNZKgmlTouHfM1zfmsvmPdEjQj8d
 Vk8QO68QG3dHQ9b3TYItNwyAl7HZYX5xWYItlOMaJWA0xDOnrLDoiQB1oZFaowvmc1p+
 0j7rcbM3aK72T+wEdMeoAMJrAKlsGTpksialp7NpHi8mriDxvAL29qtH6e4qV4ye3n4O
 ioZ+tB9NOX7vAVsMUYP45N/c7/yJ76d4FVXxgvA8DrDe6kWqqVag8cnmAIzbn5W1DZHi
 N3OTB17wn7MDkyH6/HyoALxGep9bMXXsz3DTlr5jo6muCqfwIjl2DO327JAkkPmdbOIe
 VBcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=QM4aSryhMOlrXHpZhEssvOA46rFNviioyue6r+UKFeA=;
 b=xzVqB/3wZLG6XkB9FVEvtX72/5ZdF8k5bHzHv98mxB+d95tp+vH+m7q27jtwMP1QIK
 JlKz7l/lS/sFxMM2z3uGa8qLiHBV6a9QAWaYrr2+SQEnWtRM5ozZrjkgOWXhvsG9mFvk
 wuD0eyK6t6VXEshqykJHbf1PJQtUTkLp2OyUQcBWeI2hut+Yl7YuK2qfItizHSvWdsBs
 aCSCInGwDbLNvTDheq8byV3UhCg3cP5g0mkieuOeaT8Ei0CZHaiZXSuDETSd59gb7r0S
 PtURkGkEQg+BXouHKziM1pNosMeyH51yuyq8W6zrdWJhTSLdBFjrTORSX+L29Afb3JCx
 /PRA==
X-Gm-Message-State: AOAM532Z4qvYKfZjiZJJw5LRAgifUzaP7Dcf3KOgquPli5T11Mcb2b9m
 /N9gZe46scqPAQRiYIxIFPLoMcFyEZ3F3A==
X-Google-Smtp-Source: ABdhPJwYXgJsFVT7BaTySW8Zt2+3eZVpILs2h/euIJFy1SnJN3sYgM7Gg6UUEdv7NC1kD9/C43CQuw==
X-Received: by 2002:a17:907:72d5:b0:6ec:abf:dc87 with SMTP id
 du21-20020a17090772d500b006ec0abfdc87mr8368280ejc.120.1650718346511; 
 Sat, 23 Apr 2022 05:52:26 -0700 (PDT)
Received: from avogadro.lan ([2001:b07:6468:f312:1c09:f536:3de6:228c])
 by smtp.gmail.com with ESMTPSA id
 bo14-20020a170906d04e00b006ce98d9c3e3sm1655573ejb.194.2022.04.23.05.52.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 23 Apr 2022 05:52:25 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 15/34] meson-buildoptions: add support for string options
Date: Sat, 23 Apr 2022 14:51:32 +0200
Message-Id: <20220423125151.27821-16-pbonzini@redhat.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220423125151.27821-1-pbonzini@redhat.com>
References: <20220423125151.27821-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Type: text/plain
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::62c;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ej1-x62c.google.com
X-Spam_score_int: -4
X-Spam_score: -0.5
X-Spam_bar: /
X-Spam_report: (-0.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 PP_MIME_FAKE_ASCII_TEXT=0.999, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: marcandre.lureau@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Allow using the buildoptions.json file for more options, namely anything
that is not a boolean or multiple-choice.

The mapping between configure and meson is messy for string options,
so allow configure to use to something other than the name in
meson_options.txt.  This will come in handy anyway for builtin
Meson options such as b_lto or b_coverage.

Tested-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 meson_options.txt             |  2 +-
 scripts/meson-buildoptions.py | 65 ++++++++++++++++++++++++++++++-----
 scripts/meson-buildoptions.sh |  6 ++--
 3 files changed, 60 insertions(+), 13 deletions(-)

diff --git a/meson_options.txt b/meson_options.txt
index cf18663833..415fcc448e 100644
--- a/meson_options.txt
+++ b/meson_options.txt
@@ -11,7 +11,7 @@ option('qemu_firmwarepath', type : 'string', value : '',
 option('smbd', type : 'string', value : '',
        description: 'Path to smbd for slirp networking')
 option('sphinx_build', type : 'string', value : '',
-       description: 'Use specified sphinx-build [$sphinx_build] for building document (default to be empty)')
+       description: 'Use specified sphinx-build for building document')
 option('iasl', type : 'string', value : '',
        description: 'Path to ACPI disassembler')
 option('default_devices', type : 'boolean', value : true,
diff --git a/scripts/meson-buildoptions.py b/scripts/meson-buildoptions.py
index 693be7b966..4af8d6e732 100755
--- a/scripts/meson-buildoptions.py
+++ b/scripts/meson-buildoptions.py
@@ -38,6 +38,11 @@
     "trace_file",
 }
 
+OPTION_NAMES = {
+    "malloc": "enable-malloc",
+    "trace_backends": "enable-trace-backends",
+}
+
 BUILTIN_OPTIONS = {
     "strip",
 }
@@ -75,7 +80,7 @@ def help_line(left, opt, indent, long):
     right = f'{opt["description"]}'
     if long:
         value = value_to_help(opt["value"])
-        if value != "auto":
+        if value != "auto" and value != "":
             right += f" [{value}]"
     if "choices" in opt and long:
         choices = "/".join(sorted(opt["choices"]))
@@ -96,6 +101,18 @@ def allow_arg(opt):
     return not (set(opt["choices"]) <= {"auto", "disabled", "enabled"})
 
 
+# Return whether the option (a dictionary) can be used without
+# arguments.  Booleans can only be used without arguments;
+# combos require an argument if they accept neither "enabled"
+# nor "disabled"
+def require_arg(opt):
+    if opt["type"] == "boolean":
+        return False
+    if opt["type"] != "combo":
+        return True
+    return not ({"enabled", "disabled"}.intersection(opt["choices"]))
+
+
 def filter_options(json):
     if ":" in json["name"]:
         return False
@@ -110,20 +127,48 @@ def load_options(json):
     return sorted(json, key=lambda x: x["name"])
 
 
+def cli_option(opt):
+    name = opt["name"]
+    if name in OPTION_NAMES:
+        return OPTION_NAMES[name]
+    return name.replace("_", "-")
+
+
+def cli_help_key(opt):
+    key = cli_option(opt)
+    if require_arg(opt):
+        return key
+    if opt["type"] == "boolean" and opt["value"]:
+        return f"disable-{key}"
+    return f"enable-{key}"
+
+
+def cli_metavar(opt):
+    if opt["type"] == "string":
+        return "VALUE"
+    if opt["type"] == "array":
+        return "CHOICES"
+    return "CHOICE"
+
+
 def print_help(options):
     print("meson_options_help() {")
-    for opt in options:
-        key = opt["name"].replace("_", "-")
+    for opt in sorted(options, key=cli_help_key):
+        key = cli_help_key(opt)
         # The first section includes options that have an arguments,
         # and booleans (i.e., only one of enable/disable makes sense)
-        if opt["type"] == "boolean":
-            left = f"--disable-{key}" if opt["value"] else f"--enable-{key}"
+        if require_arg(opt):
+            metavar = cli_metavar(opt)
+            left = f"--{key}={metavar}"
+            help_line(left, opt, 27, True)
+        elif opt["type"] == "boolean":
+            left = f"--{key}"
             help_line(left, opt, 27, False)
         elif allow_arg(opt):
             if opt["type"] == "combo" and "enabled" in opt["choices"]:
-                left = f"--enable-{key}[=CHOICE]"
+                left = f"--{key}[=CHOICE]"
             else:
-                left = f"--enable-{key}=CHOICE"
+                left = f"--{key}=CHOICE"
             help_line(left, opt, 27, True)
 
     sh_print()
@@ -142,9 +187,11 @@ def print_parse(options):
     print("_meson_option_parse() {")
     print("  case $1 in")
     for opt in options:
-        key = opt["name"].replace("_", "-")
+        key = cli_option(opt)
         name = opt["name"]
-        if opt["type"] == "boolean":
+        if require_arg(opt):
+            print(f'    --{key}=*) quote_sh "-D{name}=$2" ;;')
+        elif opt["type"] == "boolean":
             print(f'    --enable-{key}) printf "%s" -D{name}=true ;;')
             print(f'    --disable-{key}) printf "%s" -D{name}=false ;;')
         else:
diff --git a/scripts/meson-buildoptions.sh b/scripts/meson-buildoptions.sh
index a269534394..5a06b7915c 100644
--- a/scripts/meson-buildoptions.sh
+++ b/scripts/meson-buildoptions.sh
@@ -1,5 +1,7 @@
 # This file is generated by meson-buildoptions.py, do not edit!
 meson_options_help() {
+  printf "%s\n" '  --disable-coroutine-pool coroutine freelist (better performance)'
+  printf "%s\n" '  --disable-install-blobs  install provided firmware blobs'
   printf "%s\n" '  --enable-block-drv-whitelist-in-tools'
   printf "%s\n" '                           use block whitelist also in tools instead of only'
   printf "%s\n" '                           QEMU'
@@ -8,7 +10,6 @@ meson_options_help() {
   printf "%s\n" '                           (choices: auto/disabled/enabled/internal/system)'
   printf "%s\n" '  --enable-cfi             Control-Flow Integrity (CFI)'
   printf "%s\n" '  --enable-cfi-debug       Verbose errors in case of CFI violation'
-  printf "%s\n" '  --disable-coroutine-pool coroutine freelist (better performance)'
   printf "%s\n" '  --enable-debug-mutex     mutex debugging support'
   printf "%s\n" '  --enable-debug-stack-usage'
   printf "%s\n" '                           measure coroutine stack usage'
@@ -16,7 +17,6 @@ meson_options_help() {
   printf "%s\n" '                           (choices: auto/disabled/enabled/internal/system)'
   printf "%s\n" '  --enable-fuzzing         build fuzzing targets'
   printf "%s\n" '  --enable-gprof           QEMU profiling with gprof'
-  printf "%s\n" '  --disable-install-blobs  install provided firmware blobs'
   printf "%s\n" '  --enable-malloc=CHOICE   choose memory allocator to use [system] (choices:'
   printf "%s\n" '                           jemalloc/system/tcmalloc)'
   printf "%s\n" '  --enable-module-upgrades try to load modules from alternate paths for'
@@ -29,7 +29,7 @@ meson_options_help() {
   printf "%s\n" '                           (choices: auto/disabled/enabled/internal/system)'
   printf "%s\n" '  --enable-strip           Strip targets on install'
   printf "%s\n" '  --enable-tcg-interpreter TCG with bytecode interpreter (slow)'
-  printf "%s\n" '  --enable-trace-backends=CHOICE'
+  printf "%s\n" '  --enable-trace-backends=CHOICES'
   printf "%s\n" '                           Set available tracing backends [log] (choices:'
   printf "%s\n" '                           dtrace/ftrace/log/nop/simple/syslog/ust)'
   printf "%s\n" ''
-- 
2.35.1



