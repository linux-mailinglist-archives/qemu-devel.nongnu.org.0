Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 569E64951C8
	for <lists+qemu-devel@lfdr.de>; Thu, 20 Jan 2022 16:49:26 +0100 (CET)
Received: from localhost ([::1]:55472 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nAZgi-0005bc-Po
	for lists+qemu-devel@lfdr.de; Thu, 20 Jan 2022 10:49:24 -0500
Received: from eggs.gnu.org ([209.51.188.92]:55984)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ilg@livius.net>) id 1nAVk1-0007X3-7h
 for qemu-devel@nongnu.org; Thu, 20 Jan 2022 06:36:33 -0500
Received: from [2a00:1450:4864:20::52d] (port=33772
 helo=mail-ed1-x52d.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ilg@livius.net>) id 1nAVjy-0002YP-4o
 for qemu-devel@nongnu.org; Thu, 20 Jan 2022 06:36:32 -0500
Received: by mail-ed1-x52d.google.com with SMTP id b13so27609040edn.0
 for <qemu-devel@nongnu.org>; Thu, 20 Jan 2022 03:36:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=livius-net.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=iwa0QiMM09QiGRtM8OJblJuEzGH+8VDB6vPus4TXTRg=;
 b=YO+aA31ilg85rJTzkM0TwO0RGsaClBtcYzcZ91s3qLi3bpCtKrkOW098Q84FqqeXgs
 PJvqERhvnQZottjX4cqVqRiUqUQRpTCRwmQ9HFjqHKy9SI//OaURqQqv/WUfFhweyFHt
 XNOIuOJf/4AoZnxNGx8lNJYWmSQ2+Ovw/7RFVhCmGNHWXtz7DwVEh1khMUFwyjnTEchW
 of2lDzVhJEsj/7dN1JTXxTLEZRhpDVFIbYDJy73MNKW827vkjYZjS0ufDbrKxSzmtluo
 3iHJ9u6del38mAorw0LPZIfJeOWo7olMBv2gVioiR3ePFF0a2NDzzytoPr3A9D7pisc4
 g4Vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=iwa0QiMM09QiGRtM8OJblJuEzGH+8VDB6vPus4TXTRg=;
 b=R39KlPStgd8B2AIsb1kdzSpAmnU9QMw3kqBfCmAPVUV5srhHrMUbIiDcn+KyEdfDdg
 CRHhcPf9XrVV82CwsPCm0tTlqhGvtGrRXAwwRf9M6T9F02XoJqP/4HNR/psbPLKW8FkH
 ej0OA3YKZuNf19SCekXvirE5JxyA8LMaKaj85qYv9g+9nPS8lqdeSBgearIyQBeNdNsI
 vlog7UZ4iroTjirU9v883CqQB5EB0wiN4iASfOccfPDVnb1Xt1Z5cvHZrL9iVgyuTxsK
 JgsXn+qW0dwR184vXFzdFUEJnhBh9SU3yCXJ69tljSKHC/bWsCfCh2V5eCwRdUmscdW/
 rZLw==
X-Gm-Message-State: AOAM5306eycHPmagGp83tfXrze0kB1v5lSFxV1Ctn2wav4dV/8JwXgDo
 RgAHP16DwqlwC7DnzESPE3nbaIihGbs5NFIV
X-Google-Smtp-Source: ABdhPJzRKS1PvDFvlvqWlRM/UB5UWKmb/YOvdTKmsuJSivNqlBWfd3bh0fTS15ItlYwi6jqlBAfuyg==
X-Received: by 2002:a17:906:9f16:: with SMTP id
 fy22mr360892ejc.464.1642678587957; 
 Thu, 20 Jan 2022 03:36:27 -0800 (PST)
Received: from localhost.localdomain ([188.25.251.197])
 by smtp.gmail.com with ESMTPSA id e12sm20652eje.18.2022.01.20.03.36.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 Jan 2022 03:36:27 -0800 (PST)
From: Liviu Ionescu <ilg@livius.net>
To: qemu-devel@nongnu.org
Subject: [PATCH] Add --with-branding-prefix and QEMU_BRANDING_PREFIX
Date: Thu, 20 Jan 2022 13:35:45 +0200
Message-Id: <20220120113545.55820-1-ilg@livius.net>
X-Mailer: git-send-email 2.32.0 (Apple Git-132)
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::52d
 (failed)
Received-SPF: none client-ip=2a00:1450:4864:20::52d;
 envelope-from=ilg@livius.net; helo=mail-ed1-x52d.google.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=no autolearn_force=no
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
Cc: peter.maydell@linaro.org, Liviu Ionescu <ilg@livius.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

It is usual for various distributions to identify themselves by
prepending a string to the greeting message, for example
'xPack QEMU emulator version 6.2.0 (v6.2.0-2-xpack-arm)'.

To achieve this, a new configuration option (--with-branding-prefix=)
was added, which, if not empty, adds a string preprocessor macro
(QEMU_BRANDING_PREFIX) to 'config-host.h'.

If this macro is defined, in QEMU and various tools, the string
is displayed before the existing greeting messages.
---
 bsd-user/main.c                      |  3 +++
 configure                            |  5 +++++
 linux-user/main.c                    |  3 +++
 meson.build                          |  5 +++++
 meson_options.txt                    |  3 +++
 qemu-img.c                           | 10 ++++++++--
 qemu-io.c                            |  3 +++
 qemu-nbd.c                           |  3 +++
 qga/main.c                           |  5 ++++-
 scsi/qemu-pr-helper.c                |  3 +++
 softmmu/vl.c                         |  3 +++
 storage-daemon/qemu-storage-daemon.c |  3 +++
 tools/virtiofsd/passthrough_ll.c     |  3 +++
 ui/cocoa.m                           |  5 +++++
 14 files changed, 54 insertions(+), 3 deletions(-)

diff --git a/bsd-user/main.c b/bsd-user/main.c
index cb5ea40236..a4eab8feef 100644
--- a/bsd-user/main.c
+++ b/bsd-user/main.c
@@ -149,6 +149,9 @@ void cpu_loop(CPUArchState *env)
 
 static void usage(void)
 {
+#if defined(QEMU_BRANDING_PREFIX)
+    printf("%s ", QEMU_BRANDING_PREFIX);
+#endif
     printf("qemu-" TARGET_NAME " version " QEMU_FULL_VERSION
            "\n" QEMU_COPYRIGHT "\n"
            "usage: qemu-" TARGET_NAME " [options] program [arguments...]\n"
diff --git a/configure b/configure
index e1a31fb332..579a8cf55d 100755
--- a/configure
+++ b/configure
@@ -356,6 +356,7 @@ ninja=""
 gio="$default_feature"
 skip_meson=no
 slirp_smbd="$default_feature"
+branding_prefix=""
 
 # The following Meson options are handled manually (still they
 # are included in the automatically generated help message)
@@ -1179,6 +1180,8 @@ for opt do
   # everything else has the same name in configure and meson
   --enable-* | --disable-*) meson_option_parse "$opt" "$optarg"
   ;;
+  --with-branding-prefix=*) branding_prefix="$optarg"
+  ;;
   *)
       echo "ERROR: unknown option $opt"
       echo "Try '$0 --help' for more information"
@@ -1352,6 +1355,7 @@ Advanced options (experts only):
   --firmwarepath=PATH      search PATH for firmware files
   --efi-aarch64=PATH       PATH of efi file to use for aarch64 VMs.
   --with-suffix=SUFFIX     suffix for QEMU data inside datadir/libdir/sysconfdir/docdir [$qemu_suffix]
+  --with-branding-prefix=STRING prepend string to greeting messages
   --with-pkgversion=VERS   use specified string as sub-version of the package
   --without-default-features default all --enable-* options to "disabled"
   --without-default-devices  do not include any device that is not needed to
@@ -3810,6 +3814,7 @@ if test "$skip_meson" = no; then
         -Db_coverage=$(if test "$gcov" = yes; then echo true; else echo false; fi) \
         -Db_lto=$lto -Dcfi=$cfi -Dtcg=$tcg -Dxen=$xen \
         -Dcapstone=$capstone -Dfdt=$fdt -Dslirp=$slirp \
+        -Dbranding_prefix="$branding_prefix" \
         $(test -n "${LIB_FUZZING_ENGINE+xxx}" && echo "-Dfuzzing_engine=$LIB_FUZZING_ENGINE") \
         $(if test "$default_feature" = no; then echo "-Dauto_features=disabled"; fi) \
         "$@" $cross_arg "$PWD" "$source_path"
diff --git a/linux-user/main.c b/linux-user/main.c
index 16def5215d..19abd1436f 100644
--- a/linux-user/main.c
+++ b/linux-user/main.c
@@ -382,6 +382,9 @@ static void handle_arg_strace(const char *arg)
 
 static void handle_arg_version(const char *arg)
 {
+#if defined(QEMU_BRANDING_PREFIX)
+    printf("%s ", QEMU_BRANDING_PREFIX);
+#endif
     printf("qemu-" TARGET_NAME " version " QEMU_FULL_VERSION
            "\n" QEMU_COPYRIGHT "\n");
     exit(EXIT_SUCCESS);
diff --git a/meson.build b/meson.build
index 762d7cee85..80807a771d 100644
--- a/meson.build
+++ b/meson.build
@@ -1455,6 +1455,10 @@ config_host_data.set_quoted('CONFIG_QEMU_LOCALSTATEDIR', get_option('prefix') /
 config_host_data.set_quoted('CONFIG_QEMU_MODDIR', get_option('prefix') / qemu_moddir)
 config_host_data.set_quoted('CONFIG_SYSCONFDIR', get_option('prefix') / get_option('sysconfdir'))
 
+if get_option('branding_prefix') != ''
+  config_host_data.set_quoted('QEMU_BRANDING_PREFIX', get_option('branding_prefix'))
+endif
+
 config_host_data.set('HOST_' + host_arch.to_upper(), 1)
 
 config_host_data.set('CONFIG_ATTR', libattr.found())
@@ -3320,6 +3324,7 @@ endif
 summary_info += {'strip binaries':    get_option('strip')}
 summary_info += {'sparse':            sparse}
 summary_info += {'mingw32 support':   targetos == 'windows'}
+summary_info += {'branding prefix':   get_option('branding_prefix')}
 
 # snarf the cross-compilation information for tests
 foreach target: target_dirs
diff --git a/meson_options.txt b/meson_options.txt
index 921967eddb..be044cc1e6 100644
--- a/meson_options.txt
+++ b/meson_options.txt
@@ -208,3 +208,6 @@ option('fdt', type: 'combo', value: 'auto',
 
 option('selinux', type: 'feature', value: 'auto',
        description: 'SELinux support in qemu-nbd')
+
+option('branding_prefix', type: 'string', value: '',
+       description: 'String to prepend to greeting messages')
diff --git a/qemu-img.c b/qemu-img.c
index 6fe2466032..c10c0066e5 100644
--- a/qemu-img.c
+++ b/qemu-img.c
@@ -52,8 +52,14 @@
 #include "qemu/throttle.h"
 #include "block/throttle-groups.h"
 
+#if defined(QEMU_BRANDING_PREFIX)
+#define QEMU_IMG_VERSION QEMU_BRANDING_PREFIX " qemu-img version " \
+                         QEMU_FULL_VERSION \
+                         "\n" QEMU_COPYRIGHT "\n"
+#else
 #define QEMU_IMG_VERSION "qemu-img version " QEMU_FULL_VERSION \
-                          "\n" QEMU_COPYRIGHT "\n"
+                         "\n" QEMU_COPYRIGHT "\n"
+#endif
 
 typedef struct img_cmd_t {
     const char *name;
@@ -235,7 +241,7 @@ static void QEMU_NORETURN help(void)
  * an odd number of ',' (or else a separating ',' following it gets
  * escaped), or be empty (or else a separating ',' preceding it can
  * escape a separating ',' following it).
- * 
+ *
  */
 static bool is_valid_option_list(const char *optarg)
 {
diff --git a/qemu-io.c b/qemu-io.c
index 3924639b92..ec880dc49e 100644
--- a/qemu-io.c
+++ b/qemu-io.c
@@ -597,6 +597,9 @@ int main(int argc, char **argv)
             trace_opt_parse(optarg);
             break;
         case 'V':
+#if defined(QEMU_BRANDING_PREFIX)
+            printf("%s ", QEMU_BRANDING_PREFIX);
+#endif
             printf("%s version " QEMU_FULL_VERSION "\n"
                    QEMU_COPYRIGHT "\n", error_get_progname());
             exit(0);
diff --git a/qemu-nbd.c b/qemu-nbd.c
index c6c20df68a..7b3667626c 100644
--- a/qemu-nbd.c
+++ b/qemu-nbd.c
@@ -157,6 +157,9 @@ QEMU_HELP_BOTTOM "\n"
 
 static void version(const char *name)
 {
+#if defined(QEMU_BRANDING_PREFIX)
+    printf("%s ", QEMU_BRANDING_PREFIX);
+#endif
     printf(
 "%s " QEMU_FULL_VERSION "\n"
 "Written by Anthony Liguori.\n"
diff --git a/qga/main.c b/qga/main.c
index 15fd3a4149..c66b87f72c 100644
--- a/qga/main.c
+++ b/qga/main.c
@@ -224,8 +224,11 @@ void reopen_fd_to_null(int fd)
 
 static void usage(const char *cmd)
 {
+    printf("Usage: %s [-m <method> -p <path>] [<options>]\n");
+#if defined(QEMU_BRANDING_PREFIX)
+    printf("%s ", QEMU_BRANDING_PREFIX);
+#endif
     printf(
-"Usage: %s [-m <method> -p <path>] [<options>]\n"
 "QEMU Guest Agent " QEMU_FULL_VERSION "\n"
 QEMU_COPYRIGHT "\n"
 "\n"
diff --git a/scsi/qemu-pr-helper.c b/scsi/qemu-pr-helper.c
index f281daeced..d7fcdb8216 100644
--- a/scsi/qemu-pr-helper.c
+++ b/scsi/qemu-pr-helper.c
@@ -108,6 +108,9 @@ QEMU_HELP_BOTTOM "\n"
 
 static void version(const char *name)
 {
+#if defined(QEMU_BRANDING_PREFIX)
+    printf("%s ", QEMU_BRANDING_PREFIX);
+#endif
     printf(
 "%s " QEMU_FULL_VERSION "\n"
 "Written by Paolo Bonzini.\n"
diff --git a/softmmu/vl.c b/softmmu/vl.c
index 5e1b35ba48..d83118d939 100644
--- a/softmmu/vl.c
+++ b/softmmu/vl.c
@@ -826,6 +826,9 @@ static MachineClass *find_default_machine(GSList *machines)
 
 static void version(void)
 {
+#if defined(QEMU_BRANDING_PREFIX)
+    printf("%s ", QEMU_BRANDING_PREFIX);
+#endif
     printf("QEMU emulator version " QEMU_FULL_VERSION "\n"
            QEMU_COPYRIGHT "\n");
 }
diff --git a/storage-daemon/qemu-storage-daemon.c b/storage-daemon/qemu-storage-daemon.c
index 9d76d1114d..1a8de7c59d 100644
--- a/storage-daemon/qemu-storage-daemon.c
+++ b/storage-daemon/qemu-storage-daemon.c
@@ -212,6 +212,9 @@ static void process_options(int argc, char *argv[])
             trace_init_file();
             break;
         case 'V':
+#if defined(QEMU_BRANDING_PREFIX)
+            printf("%s ", QEMU_BRANDING_PREFIX);
+#endif
             printf("qemu-storage-daemon version "
                    QEMU_FULL_VERSION "\n" QEMU_COPYRIGHT "\n");
             exit(EXIT_SUCCESS);
diff --git a/tools/virtiofsd/passthrough_ll.c b/tools/virtiofsd/passthrough_ll.c
index 64b5b4fbb1..2179a502d6 100644
--- a/tools/virtiofsd/passthrough_ll.c
+++ b/tools/virtiofsd/passthrough_ll.c
@@ -3896,6 +3896,9 @@ static void fuse_lo_data_cleanup(struct lo_data *lo)
 
 static void qemu_version(void)
 {
+#if defined(QEMU_BRANDING_PREFIX)
+    printf("%s ", QEMU_BRANDING_PREFIX);
+#endif
     printf("virtiofsd version " QEMU_FULL_VERSION "\n" QEMU_COPYRIGHT "\n");
 }
 
diff --git a/ui/cocoa.m b/ui/cocoa.m
index ac18e14ce0..5a1e56ac46 100644
--- a/ui/cocoa.m
+++ b/ui/cocoa.m
@@ -1524,8 +1524,13 @@ - (void)make_about_window
 
     /* Create the version string*/
     NSString *version_string;
+#if defined(QEMU_BRANDING_PREFIX)
+    version_string = [[NSString alloc] initWithFormat:
+    @"%s QEMU emulator version %s", QEMU_BRANDING_PREFIX, QEMU_FULL_VERSION];
+#else
     version_string = [[NSString alloc] initWithFormat:
     @"QEMU emulator version %s", QEMU_FULL_VERSION];
+#endif
     [version_label setStringValue: version_string];
     [superView addSubview: version_label];
 
-- 
2.32.0 (Apple Git-132)


