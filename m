Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A6505747D2
	for <lists+qemu-devel@lfdr.de>; Thu, 14 Jul 2022 11:09:29 +0200 (CEST)
Received: from localhost ([::1]:55372 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oBuqe-0002PJ-CN
	for lists+qemu-devel@lfdr.de; Thu, 14 Jul 2022 05:09:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40582)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oBujx-00057R-1k
 for qemu-devel@nongnu.org; Thu, 14 Jul 2022 05:02:36 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:42299)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oBujr-0005x5-IH
 for qemu-devel@nongnu.org; Thu, 14 Jul 2022 05:02:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1657789347;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=W4D+E27LSCP3Js26+3lx8p9n1wgkYhKViXdqLLM1POA=;
 b=CKKf3/X3ZDldgNbWwebWEqw+kt7w4wEEq7EnvGVJn6RrjXpcyPq+W14I/uKaGysQIjcU+W
 iVNhF850C7qS42gwQqx1CfOXgnV/tov6jWGb5KfHTbD9PkfWBn3T1QPACo+AdSypF9LkBt
 wlILnBABraQiMaqYmb9dpsfKe2dv8a0=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-487-wMpRXltfNfWah_NmA4Rgfg-1; Thu, 14 Jul 2022 05:02:25 -0400
X-MC-Unique: wMpRXltfNfWah_NmA4Rgfg-1
Received: by mail-ed1-f69.google.com with SMTP id
 v19-20020a056402349300b0043b0f690cbaso1101708edc.11
 for <qemu-devel@nongnu.org>; Thu, 14 Jul 2022 02:02:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=W4D+E27LSCP3Js26+3lx8p9n1wgkYhKViXdqLLM1POA=;
 b=67rDbV213eF7hXAOFaiqm297TG7s5zR05+pDNPaXPSgm6j+1xVNVakDuO27zFeUERu
 hY5J0FofvlxXcjZwUOjoittkFencF5HhivowyimLOT007jCVbTKq1Nm8Y25kML5q+WhW
 ztRke9vhCF7LL6efJ16InF2fYdaJ4K3f93PDaqs7sblQEk76ucYs+SXph80ZcezP4hNK
 ph+mQHH7/ERO3uRsP82+L23UGtb7Y3LO4C+wesh9FxwtVgJZ8XMKak7GvEL/jmPl5xNS
 YLAG5s9gfUhABTo4Q1CMPajXEtT22fEjBFP5iaLG+GMeS5YUOL4hevM9feGQ5sPHOW1i
 AiRw==
X-Gm-Message-State: AJIora9xeP/lbQJr/HkoZGpfn8vwS+P+XcgHeDCe/AlgdRfpB8KzFI2Q
 RFgVuhYKkIIcC9N1DJGM9moqzBo30fm74KiZ5cg0/gd8iBpR+R9EeR+TGZmhHE04nCO15lsDKcB
 jgV61m7IqTTOh2xTUlFDJIEkTZ7dWstuEzeqdPWrVipRUgtCUS1yGy7OKI4+1g1hfli0=
X-Received: by 2002:a17:906:5a51:b0:72b:5cdf:ed77 with SMTP id
 my17-20020a1709065a5100b0072b5cdfed77mr7453477ejc.505.1657789343397; 
 Thu, 14 Jul 2022 02:02:23 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1uIAWY6UtTBQtdPjgV+uh1UXDKv+1LdFPFAW1BtwGEoVO9PUZgwphmp6SqYOBQ93TtSvFgNdw==
X-Received: by 2002:a17:906:5a51:b0:72b:5cdf:ed77 with SMTP id
 my17-20020a1709065a5100b0072b5cdfed77mr7453450ejc.505.1657789343088; 
 Thu, 14 Jul 2022 02:02:23 -0700 (PDT)
Received: from goa-sendmail ([2001:b07:6468:f312:5e2c:eb9a:a8b6:fd3e])
 by smtp.gmail.com with ESMTPSA id
 v18-20020a170906293200b007052b183d51sm447904ejd.132.2022.07.14.02.02.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 14 Jul 2022 02:02:22 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: Akihiko Odaki <akihiko.odaki@gmail.com>
Subject: [PULL 05/20] meson: Prefix each element of firmware path
Date: Thu, 14 Jul 2022 11:01:56 +0200
Message-Id: <20220714090211.304305-6-pbonzini@redhat.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220714090211.304305-1-pbonzini@redhat.com>
References: <20220714090211.304305-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01,
 WEIRD_QUOTING=0.001 autolearn=ham autolearn_force=no
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

From: Akihiko Odaki <akihiko.odaki@gmail.com>

Signed-off-by: Akihiko Odaki <akihiko.odaki@gmail.com>
Message-Id: <20220624154042.51512-1-akihiko.odaki@gmail.com>
[Rewrite shell function without using Bash extensions. - Paolo]
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 configure                     | 15 +++++++++++++++
 meson.build                   | 11 +++++++++--
 meson_options.txt             |  2 +-
 scripts/meson-buildoptions.py |  7 +++++--
 scripts/meson-buildoptions.sh |  4 ++--
 softmmu/datadir.c             |  8 +++++---
 6 files changed, 37 insertions(+), 10 deletions(-)

diff --git a/configure b/configure
index e8cc850727..f02635b087 100755
--- a/configure
+++ b/configure
@@ -676,6 +676,21 @@ fi
 
 werror=""
 
+meson_option_build_array() {
+  printf '['
+  (if test "$targetos" == windows; then
+    IFS=\;
+  else
+    IFS=:
+  fi
+  for e in $1; do
+    e=${e/'\'/'\\'}
+    e=${e/\"/'\"'}
+    printf '"""%s""",' "$e"
+  done)
+  printf ']\n'
+}
+
 . $source_path/scripts/meson-buildoptions.sh
 
 meson_options=
diff --git a/meson.build b/meson.build
index da76edc7c7..ad16fc1aa8 100644
--- a/meson.build
+++ b/meson.build
@@ -1718,7 +1718,13 @@ config_host_data.set_quoted('CONFIG_PREFIX', get_option('prefix'))
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
@@ -3683,7 +3689,8 @@ endif
 summary_info = {}
 summary_info += {'Install prefix':    get_option('prefix')}
 summary_info += {'BIOS directory':    qemu_datadir}
-summary_info += {'firmware path':     get_option('prefix') / get_option('qemu_firmwarepath')}
+pathsep = targetos == 'windows' ? ';' : ':'
+summary_info += {'firmware path':     pathsep.join(get_option('qemu_firmwarepath'))}
 summary_info += {'binary directory':  get_option('prefix') / get_option('bindir')}
 summary_info += {'library directory': get_option('prefix') / get_option('libdir')}
 summary_info += {'module directory':  qemu_moddir}
diff --git a/meson_options.txt b/meson_options.txt
index 9a034f875b..e58e158396 100644
--- a/meson_options.txt
+++ b/meson_options.txt
@@ -6,7 +6,7 @@ option('qemu_suffix', type : 'string', value: 'qemu',
        description: 'Suffix for QEMU data/modules/config directories (can be empty)')
 option('docdir', type : 'string', value : 'share/doc',
        description: 'Base directory for documentation installation (can be empty)')
-option('qemu_firmwarepath', type : 'string', value : 'share/qemu-firmware',
+option('qemu_firmwarepath', type : 'array', value : ['share/qemu-firmware'],
        description: 'search PATH for firmware files')
 option('pkgversion', type : 'string', value : '',
        description: 'use specified string as sub-version of the package')
diff --git a/scripts/meson-buildoptions.py b/scripts/meson-buildoptions.py
index e624c16b01..3e2b478538 100755
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
index 4b7b8ffaa2..359b04e0e6 100644
--- a/scripts/meson-buildoptions.sh
+++ b/scripts/meson-buildoptions.sh
@@ -42,7 +42,7 @@ meson_options_help() {
   printf "%s\n" '  --enable-trace-backends=CHOICES'
   printf "%s\n" '                           Set available tracing backends [log] (choices:'
   printf "%s\n" '                           dtrace/ftrace/log/nop/simple/syslog/ust)'
-  printf "%s\n" '  --firmwarepath=VALUE     search PATH for firmware files [share/qemu-firmware]'
+  printf "%s\n" '  --firmwarepath=VALUES    search PATH for firmware files [share/qemu-firmware]'
   printf "%s\n" '  --iasl=VALUE             Path to ACPI disassembler'
   printf "%s\n" '  --includedir=VALUE       Header file directory [include]'
   printf "%s\n" '  --interp-prefix=VALUE    where to find shared libraries etc., use %M for'
@@ -363,7 +363,7 @@ _meson_option_parse() {
     --disable-qcow1) printf "%s" -Dqcow1=disabled ;;
     --enable-qed) printf "%s" -Dqed=enabled ;;
     --disable-qed) printf "%s" -Dqed=disabled ;;
-    --firmwarepath=*) quote_sh "-Dqemu_firmwarepath=$2" ;;
+    --firmwarepath=*) quote_sh "-Dqemu_firmwarepath=$(meson_option_build_array $2)" ;;
     --enable-qga-vss) printf "%s" -Dqga_vss=enabled ;;
     --disable-qga-vss) printf "%s" -Dqga_vss=disabled ;;
     --enable-qom-cast-debug) printf "%s" -Dqom_cast_debug=true ;;
diff --git a/softmmu/datadir.c b/softmmu/datadir.c
index 697cffea93..c9237cb5d4 100644
--- a/softmmu/datadir.c
+++ b/softmmu/datadir.c
@@ -85,15 +85,17 @@ void qemu_add_data_dir(char *path)
 
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
     qemu_add_data_dir(get_relocated_path(CONFIG_QEMU_DATADIR));
-- 
2.36.1



