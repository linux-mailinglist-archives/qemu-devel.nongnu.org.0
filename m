Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AD047559D81
	for <lists+qemu-devel@lfdr.de>; Fri, 24 Jun 2022 17:42:53 +0200 (CEST)
Received: from localhost ([::1]:38764 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o4lSO-00080e-Om
	for lists+qemu-devel@lfdr.de; Fri, 24 Jun 2022 11:42:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40830)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@gmail.com>)
 id 1o4lQX-0005Fu-NU
 for qemu-devel@nongnu.org; Fri, 24 Jun 2022 11:40:57 -0400
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c]:45013)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@gmail.com>)
 id 1o4lQV-0000l0-Rg
 for qemu-devel@nongnu.org; Fri, 24 Jun 2022 11:40:57 -0400
Received: by mail-pl1-x62c.google.com with SMTP id l6so2420682plg.11
 for <qemu-devel@nongnu.org>; Fri, 24 Jun 2022 08:40:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=UrYp6BtTmV01k+BVuCbUQLaqB0tJ0DIjyqxHmDWKB3o=;
 b=Qv29mOP9nNTNG3zTgvmQxmkqiODhAL/0ZcpzblKPLlthmbWLE45CNFNgbehriMi+hH
 klJX0ONbkQHcIUrZYOFoSJeRAhJNYdyxvROpTfQ98jSmuvij26HRbcgRb9BP91dMqINd
 3jtxzX67RswVddhfvTD3etFOY5hljjme5z+1ZENKsxAFKt+MlMyXV+uDt03XFNtfRkb5
 iwLWY1oqHExVlbeJBxzoQ2jDh5eglSrleNjy5lfBuNHAyQ36Z6ufVYplUSXes6/vGP75
 qseIuGGeui8HlNlunJTyhDnqieorQBAyTli7fyW2LPX2fyO7PjxXkU8KeH+A5Xn5MSuR
 SKvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=UrYp6BtTmV01k+BVuCbUQLaqB0tJ0DIjyqxHmDWKB3o=;
 b=lb7v2urYAUGBfAgpzB76hc7nhD9p1DrqqYeE9LFGL/AhbDEty6imFBr2bFBUPEUySK
 BcsrlbFOwAm6zla3LzU3ebAQVa3ops3Na8sBhyzXQ89XL9ENlWIBcqYvzIWAZwTCasz7
 2Fq0xF/ijbwvaM9ASb6iSTay3huZLk3seNllFOxNJFioFDftBW6JZ3chodUA7zACFBaZ
 UzYXHdKDm7IVsQoRpjxqUPR2gMZ3Mg+u9Yjs1h9N7nnDVEZ/CIDhPg+SywwJL6NqOBaF
 MEApzMtBfYbgU16yjhDRNo1IEVvQfzzfFElUQYeC7Yqx+740V3csOIaXcDy3oWbtd9L9
 WZow==
X-Gm-Message-State: AJIora8hq9wDYZB+stbvKB2vxqaVImJ6f3//9/khFuGHbmpff4PTI4QW
 ueRDEnZaS0X7UhFzRihrSe8=
X-Google-Smtp-Source: AGRyM1twv41n7YWKUpvZ2rgHjiwlwzyFqwRPtqeAzjT5a5/xacqt2YrXy/53gSduaw+mfOlBiUh70A==
X-Received: by 2002:a17:902:ce8b:b0:16a:4a3e:4fa1 with SMTP id
 f11-20020a170902ce8b00b0016a4a3e4fa1mr13232069plg.167.1656085254224; 
 Fri, 24 Jun 2022 08:40:54 -0700 (PDT)
Received: from localhost.localdomain
 ([2400:4050:c360:8200:80ba:2fd0:a1d1:c891])
 by smtp.gmail.com with ESMTPSA id
 t6-20020a170902b20600b0016a1e2d148csm1993785plr.32.2022.06.24.08.40.51
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Fri, 24 Jun 2022 08:40:53 -0700 (PDT)
From: Akihiko Odaki <akihiko.odaki@gmail.com>
To: 
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Thomas Huth <thuth@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>,
 "Daniel P . Berrange" <berrange@redhat.com>, John Snow <jsnow@redhat.com>,
 Cleber Rosa <crosa@redhat.com>, qemu-devel@nongnu.org,
 Akihiko Odaki <akihiko.odaki@gmail.com>
Subject: [PATCH] meson: Prefix each element of firmware path
Date: Sat, 25 Jun 2022 00:40:42 +0900
Message-Id: <20220624154042.51512-1-akihiko.odaki@gmail.com>
X-Mailer: git-send-email 2.32.1 (Apple Git-133)
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62c;
 envelope-from=akihiko.odaki@gmail.com; helo=mail-pl1-x62c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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

Signed-off-by: Akihiko Odaki <akihiko.odaki@gmail.com>
---
 configure                     | 23 +++++++++++++++++++++++
 meson.build                   | 10 ++++++++--
 meson_options.txt             |  2 +-
 scripts/meson-buildoptions.py |  7 +++++--
 scripts/meson-buildoptions.sh |  6 +++---
 softmmu/datadir.c             |  8 +++++---
 6 files changed, 45 insertions(+), 11 deletions(-)

diff --git a/configure b/configure
index 4b12a8094ca..ab952e7ce3b 100755
--- a/configure
+++ b/configure
@@ -675,6 +675,29 @@ fi
 
 werror=""
 
+meson_option_build_array() {
+  local a
+  local ifs
+
+  if test "$targetos" == windows; then
+    ifs=\;
+  else
+    ifs=:
+  fi
+
+  echo -n "["
+
+  while IFS="$ifs" read -ra a; do
+    for e in "${a[@]}"; do
+      echo -n '"""'
+      echo -n "$e" | sed 's/\\/\\\\/g; s/"/\\"/g'
+      echo -n '"""',
+    done
+  done <<< "$1"
+
+  echo "]"
+}
+
 . $source_path/scripts/meson-buildoptions.sh
 
 meson_options=
diff --git a/meson.build b/meson.build
index 0c2e11ff071..40111ce4053 100644
--- a/meson.build
+++ b/meson.build
@@ -1684,7 +1684,13 @@ config_host_data.set_quoted('CONFIG_PREFIX', get_option('prefix'))
 config_host_data.set_quoted('CONFIG_QEMU_CONFDIR', get_option('prefix') / qemu_confdir)
 config_host_data.set_quoted('CONFIG_QEMU_DATADIR', get_option('prefix') / qemu_datadir)
 config_host_data.set_quoted('CONFIG_QEMU_DESKTOPDIR', get_option('prefix') / qemu_desktopdir)
-config_host_data.set_quoted('CONFIG_QEMU_FIRMWAREPATH', get_option('prefix') / get_option('qemu_firmwarepath'))
+
+qemu_firmwarepath = ''
+foreach k : get_option('qemu_firmwarepath')
+  qemu_firmwarepath += '"' + get_option('prefix') / k + '", '
+endforeach
+config_host_data.set('CONFIG_QEMU_FIRMWAREPATH', qemu_firmwarepath)
+
 config_host_data.set_quoted('CONFIG_QEMU_HELPERDIR', get_option('prefix') / get_option('libexecdir'))
 config_host_data.set_quoted('CONFIG_QEMU_ICONDIR', get_option('prefix') / qemu_icondir)
 config_host_data.set_quoted('CONFIG_QEMU_LOCALEDIR', get_option('prefix') / get_option('localedir'))
@@ -3622,7 +3628,7 @@ endif
 summary_info = {}
 summary_info += {'Install prefix':    get_option('prefix')}
 summary_info += {'BIOS directory':    qemu_datadir}
-summary_info += {'firmware path':     get_option('prefix') / get_option('qemu_firmwarepath')}
+summary_info += {'firmware path':     qemu_firmwarepath}
 summary_info += {'binary directory':  get_option('prefix') / get_option('bindir')}
 summary_info += {'library directory': get_option('prefix') / get_option('libdir')}
 summary_info += {'module directory':  qemu_moddir}
diff --git a/meson_options.txt b/meson_options.txt
index 0e8197386b9..8ad5cd73819 100644
--- a/meson_options.txt
+++ b/meson_options.txt
@@ -6,7 +6,7 @@ option('qemu_suffix', type : 'string', value: 'qemu',
        description: 'Suffix for QEMU data/modules/config directories (can be empty)')
 option('docdir', type : 'string', value : 'share/doc',
        description: 'Base directory for documentation installation (can be empty)')
-option('qemu_firmwarepath', type : 'string', value : 'qemu-firmware',
+option('qemu_firmwarepath', type : 'array', value : ['qemu-firmware'],
        description: 'search PATH for firmware files')
 option('pkgversion', type : 'string', value : '',
        description: 'use specified string as sub-version of the package')
diff --git a/scripts/meson-buildoptions.py b/scripts/meson-buildoptions.py
index e624c16b01a..3e2b4785388 100755
--- a/scripts/meson-buildoptions.py
+++ b/scripts/meson-buildoptions.py
@@ -156,7 +156,7 @@ def cli_metavar(opt):
     if opt["type"] == "string":
         return "VALUE"
     if opt["type"] == "array":
-        return "CHOICES"
+        return "CHOICES" if "choices" in opt else "VALUES"
     return "CHOICE"
 
 
@@ -199,7 +199,10 @@ def print_parse(options):
         key = cli_option(opt)
         name = opt["name"]
         if require_arg(opt):
-            print(f'    --{key}=*) quote_sh "-D{name}=$2" ;;')
+            if opt["type"] == "array" and not "choices" in opt:
+                print(f'    --{key}=*) quote_sh "-D{name}=$(meson_option_build_array $2)" ;;')
+            else:
+                print(f'    --{key}=*) quote_sh "-D{name}=$2" ;;')
         elif opt["type"] == "boolean":
             print(f'    --enable-{key}) printf "%s" -D{name}=true ;;')
             print(f'    --disable-{key}) printf "%s" -D{name}=false ;;')
diff --git a/scripts/meson-buildoptions.sh b/scripts/meson-buildoptions.sh
index 1fc1d2e2c36..238bab162bd 100644
--- a/scripts/meson-buildoptions.sh
+++ b/scripts/meson-buildoptions.sh
@@ -42,12 +42,12 @@ meson_options_help() {
   printf "%s\n" '  --enable-trace-backends=CHOICES'
   printf "%s\n" '                           Set available tracing backends [log] (choices:'
   printf "%s\n" '                           dtrace/ftrace/log/nop/simple/syslog/ust)'
-  printf "%s\n" '  --firmwarepath=VALUE     search PATH for firmware files [qemu-firmware]'
+  printf "%s\n" '  --firmwarepath=VALUES    search PATH for firmware files [qemu-firmware]'
   printf "%s\n" '  --iasl=VALUE             Path to ACPI disassembler'
   printf "%s\n" '  --includedir=VALUE       Header file directory [include]'
   printf "%s\n" '  --interp-prefix=VALUE    where to find shared libraries etc., use %M for'
   printf "%s\n" '                           cpu name [/usr/gnemul/qemu-%M]'
-  printf "%s\n" '  --libdir=VALUE           Library directory [lib64]'
+  printf "%s\n" '  --libdir=VALUE           Library directory [lib]'
   printf "%s\n" '  --libexecdir=VALUE       Library executable directory [libexec]'
   printf "%s\n" '  --localedir=VALUE        Locale data directory [share/locale]'
   printf "%s\n" '  --localstatedir=VALUE    Localstate data directory [/var/local]'
@@ -356,7 +356,7 @@ _meson_option_parse() {
     --disable-qcow1) printf "%s" -Dqcow1=disabled ;;
     --enable-qed) printf "%s" -Dqed=enabled ;;
     --disable-qed) printf "%s" -Dqed=disabled ;;
-    --firmwarepath=*) quote_sh "-Dqemu_firmwarepath=$2" ;;
+    --firmwarepath=*) quote_sh "-Dqemu_firmwarepath=$(meson_option_build_array $2)" ;;
     --enable-qga-vss) printf "%s" -Dqga_vss=enabled ;;
     --disable-qga-vss) printf "%s" -Dqga_vss=disabled ;;
     --enable-qom-cast-debug) printf "%s" -Dqom_cast_debug=true ;;
diff --git a/softmmu/datadir.c b/softmmu/datadir.c
index 160cac999a6..fd24629c543 100644
--- a/softmmu/datadir.c
+++ b/softmmu/datadir.c
@@ -105,15 +105,17 @@ static char *find_datadir(void)
 
 void qemu_add_default_firmwarepath(void)
 {
-    char **dirs;
+    static const char * const dirs[] = {
+        CONFIG_QEMU_FIRMWAREPATH
+        NULL
+    };
+
     size_t i;
 
     /* add configured firmware directories */
-    dirs = g_strsplit(CONFIG_QEMU_FIRMWAREPATH, G_SEARCHPATH_SEPARATOR_S, 0);
     for (i = 0; dirs[i] != NULL; i++) {
         qemu_add_data_dir(get_relocated_path(dirs[i]));
     }
-    g_strfreev(dirs);
 
     /* try to find datadir relative to the executable path */
     qemu_add_data_dir(find_datadir());
-- 
2.32.1 (Apple Git-133)


