Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3690C29C73F
	for <lists+qemu-devel@lfdr.de>; Tue, 27 Oct 2020 19:31:56 +0100 (CET)
Received: from localhost ([::1]:47582 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kXTlD-0007FN-7t
	for lists+qemu-devel@lfdr.de; Tue, 27 Oct 2020 14:31:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57882)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kXTbm-0004Cx-Ud
 for qemu-devel@nongnu.org; Tue, 27 Oct 2020 14:22:11 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:41376)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kXTbe-0002zU-LY
 for qemu-devel@nongnu.org; Tue, 27 Oct 2020 14:22:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1603822921;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=pOwJHLGRkiMtQvzDFgDwv0cdCduz70oqqdNicrrk+Wg=;
 b=hLOx8mBJvomhSEgSyLYqAaG4diWY3KYAMCLWhqVcNmSxYTSOG/9DNHgHAFH1l4T+CAUvib
 /Vx51LuGwElcrkYFVlqUybyEBn5hDH2Ead+r4mU95ArkQPln/6jPZ1sBnM1xfvfVS2lazj
 Drf0M5so9F11ucJDu1Ve8YJNh7Mpmgk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-278-N-83c5SbMpqEigNh1UaI5A-1; Tue, 27 Oct 2020 14:21:58 -0400
X-MC-Unique: N-83c5SbMpqEigNh1UaI5A-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2183F1010BA6
 for <qemu-devel@nongnu.org>; Tue, 27 Oct 2020 18:21:45 +0000 (UTC)
Received: from virtlab701.virt.lab.eng.bos.redhat.com
 (virtlab701.virt.lab.eng.bos.redhat.com [10.19.152.228])
 by smtp.corp.redhat.com (Postfix) with ESMTP id D81C660C11
 for <qemu-devel@nongnu.org>; Tue, 27 Oct 2020 18:21:44 +0000 (UTC)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 01/29] trace: remove argument from trace_init_file
Date: Tue, 27 Oct 2020 14:21:16 -0400
Message-Id: <20201027182144.3315885-2-pbonzini@redhat.com>
In-Reply-To: <20201027182144.3315885-1-pbonzini@redhat.com>
References: <20201027182144.3315885-1-pbonzini@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=63.128.21.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/10/27 01:06:07
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

It is not needed, all the callers are just saving what was
retrieved from -trace and trace_init_file can retrieve it
on its own.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 bsd-user/main.c                      |  6 ++----
 linux-user/main.c                    |  6 ++----
 qemu-img.c                           |  6 ++----
 qemu-io.c                            |  6 ++----
 qemu-nbd.c                           |  6 ++----
 scsi/qemu-pr-helper.c                |  6 ++----
 softmmu/vl.c                         |  6 ++----
 storage-daemon/qemu-storage-daemon.c |  9 +++------
 trace/control.c                      | 10 ++++------
 trace/control.h                      | 12 +++---------
 10 files changed, 24 insertions(+), 49 deletions(-)

diff --git a/bsd-user/main.c b/bsd-user/main.c
index ac40d79bfa..0a918e8f74 100644
--- a/bsd-user/main.c
+++ b/bsd-user/main.c
@@ -745,7 +745,6 @@ int main(int argc, char **argv)
     const char *gdbstub = NULL;
     char **target_environ, **wrk;
     envlist_t *envlist = NULL;
-    char *trace_file = NULL;
     bsd_type = target_openbsd;
 
     if (argc <= 1)
@@ -851,8 +850,7 @@ int main(int argc, char **argv)
         } else if (!strcmp(r, "strace")) {
             do_strace = 1;
         } else if (!strcmp(r, "trace")) {
-            g_free(trace_file);
-            trace_file = trace_opt_parse(optarg);
+            trace_opt_parse(optarg);
         } else {
             usage();
         }
@@ -880,7 +878,7 @@ int main(int argc, char **argv)
     if (!trace_init_backends()) {
         exit(1);
     }
-    trace_init_file(trace_file);
+    trace_init_file();
 
     /* Zero out regs */
     memset(regs, 0, sizeof(struct target_pt_regs));
diff --git a/linux-user/main.c b/linux-user/main.c
index 75c9785157..24d1eb73ad 100644
--- a/linux-user/main.c
+++ b/linux-user/main.c
@@ -386,11 +386,9 @@ static void handle_arg_version(const char *arg)
     exit(EXIT_SUCCESS);
 }
 
-static char *trace_file;
 static void handle_arg_trace(const char *arg)
 {
-    g_free(trace_file);
-    trace_file = trace_opt_parse(arg);
+    trace_opt_parse(arg);
 }
 
 #if defined(TARGET_XTENSA)
@@ -672,7 +670,7 @@ int main(int argc, char **argv, char **envp)
     if (!trace_init_backends()) {
         exit(1);
     }
-    trace_init_file(trace_file);
+    trace_init_file();
     if (qemu_plugin_load_list(&plugins)) {
         exit(1);
     }
diff --git a/qemu-img.c b/qemu-img.c
index 2103507936..ccfdf1f48d 100644
--- a/qemu-img.c
+++ b/qemu-img.c
@@ -5434,7 +5434,6 @@ int main(int argc, char **argv)
     const img_cmd_t *cmd;
     const char *cmdname;
     Error *local_error = NULL;
-    char *trace_file = NULL;
     int c;
     static const struct option long_options[] = {
         {"help", no_argument, 0, 'h'},
@@ -5484,8 +5483,7 @@ int main(int argc, char **argv)
             printf(QEMU_IMG_VERSION);
             return 0;
         case 'T':
-            g_free(trace_file);
-            trace_file = trace_opt_parse(optarg);
+            trace_opt_parse(optarg);
             break;
         }
     }
@@ -5503,7 +5501,7 @@ int main(int argc, char **argv)
     if (!trace_init_backends()) {
         exit(1);
     }
-    trace_init_file(trace_file);
+    trace_init_file();
     qemu_set_log(LOG_TRACE);
 
     /* find the command */
diff --git a/qemu-io.c b/qemu-io.c
index 7cc832b3d6..ac88d8bd40 100644
--- a/qemu-io.c
+++ b/qemu-io.c
@@ -536,7 +536,6 @@ int main(int argc, char **argv)
     Error *local_error = NULL;
     QDict *opts = NULL;
     const char *format = NULL;
-    char *trace_file = NULL;
     bool force_share = false;
 
 #ifdef CONFIG_POSIX
@@ -601,8 +600,7 @@ int main(int argc, char **argv)
             }
             break;
         case 'T':
-            g_free(trace_file);
-            trace_file = trace_opt_parse(optarg);
+            trace_opt_parse(optarg);
             break;
         case 'V':
             printf("%s version " QEMU_FULL_VERSION "\n"
@@ -653,7 +651,7 @@ int main(int argc, char **argv)
     if (!trace_init_backends()) {
         exit(1);
     }
-    trace_init_file(trace_file);
+    trace_init_file();
     qemu_set_log(LOG_TRACE);
 
     /* initialize commands */
diff --git a/qemu-nbd.c b/qemu-nbd.c
index a0701cdf36..e2ae822012 100644
--- a/qemu-nbd.c
+++ b/qemu-nbd.c
@@ -578,7 +578,6 @@ int main(int argc, char **argv)
     const char *tlscredsid = NULL;
     bool imageOpts = false;
     bool writethrough = true;
-    char *trace_file = NULL;
     bool fork_process = false;
     bool list = false;
     int old_stderr = -1;
@@ -762,8 +761,7 @@ int main(int argc, char **argv)
             imageOpts = true;
             break;
         case 'T':
-            g_free(trace_file);
-            trace_file = trace_opt_parse(optarg);
+            trace_opt_parse(optarg);
             break;
         case QEMU_NBD_OPT_TLSAUTHZ:
             tlsauthz = optarg;
@@ -810,7 +808,7 @@ int main(int argc, char **argv)
     if (!trace_init_backends()) {
         exit(1);
     }
-    trace_init_file(trace_file);
+    trace_init_file();
     qemu_set_log(LOG_TRACE);
 
     socket_activation = check_socket_activation();
diff --git a/scsi/qemu-pr-helper.c b/scsi/qemu-pr-helper.c
index d26faaf91e..2733d92f2d 100644
--- a/scsi/qemu-pr-helper.c
+++ b/scsi/qemu-pr-helper.c
@@ -884,7 +884,6 @@ int main(int argc, char **argv)
     int quiet = 0;
     int ch;
     Error *local_err = NULL;
-    char *trace_file = NULL;
     bool daemonize = false;
     bool pidfile_specified = false;
     bool socket_path_specified = false;
@@ -968,8 +967,7 @@ int main(int argc, char **argv)
             ++loglevel;
             break;
         case 'T':
-            g_free(trace_file);
-            trace_file = trace_opt_parse(optarg);
+            trace_opt_parse(optarg);
             break;
         case 'V':
             version(argv[0]);
@@ -992,7 +990,7 @@ int main(int argc, char **argv)
     if (!trace_init_backends()) {
         exit(EXIT_FAILURE);
     }
-    trace_init_file(trace_file);
+    trace_init_file();
     qemu_set_log(LOG_TRACE);
 
 #ifdef CONFIG_MPATH
diff --git a/softmmu/vl.c b/softmmu/vl.c
index d5a21ebcf4..d39d914dd0 100644
--- a/softmmu/vl.c
+++ b/softmmu/vl.c
@@ -2886,7 +2886,6 @@ void qemu_init(int argc, char **argv, char **envp)
     int display_remote = 0;
     const char *log_mask = NULL;
     const char *log_file = NULL;
-    char *trace_file = NULL;
     ram_addr_t maxram_size;
     uint64_t ram_slots = 0;
     FILE *vmstate_dump_file = NULL;
@@ -3687,8 +3686,7 @@ void qemu_init(int argc, char **argv, char **envp)
                 xen_domid_restrict = true;
                 break;
             case QEMU_OPTION_trace:
-                g_free(trace_file);
-                trace_file = trace_opt_parse(optarg);
+                trace_opt_parse(optarg);
                 break;
             case QEMU_OPTION_plugin:
                 qemu_plugin_opt_parse(optarg, &plugin_list);
@@ -3938,7 +3936,7 @@ void qemu_init(int argc, char **argv, char **envp)
     if (!trace_init_backends()) {
         exit(1);
     }
-    trace_init_file(trace_file);
+    trace_init_file();
 
     /* Open the logfile at this point and set the log mask if necessary.
      */
diff --git a/storage-daemon/qemu-storage-daemon.c b/storage-daemon/qemu-storage-daemon.c
index e419ba9f19..7c914b0dc1 100644
--- a/storage-daemon/qemu-storage-daemon.c
+++ b/storage-daemon/qemu-storage-daemon.c
@@ -180,12 +180,9 @@ static void process_options(int argc, char *argv[])
             help();
             exit(EXIT_SUCCESS);
         case 'T':
-            {
-                char *trace_file = trace_opt_parse(optarg);
-                trace_init_file(trace_file);
-                g_free(trace_file);
-                break;
-            }
+            trace_opt_parse(optarg);
+            trace_init_file();
+            break;
         case 'V':
             printf("qemu-storage-daemon version "
                    QEMU_FULL_VERSION "\n" QEMU_COPYRIGHT "\n");
diff --git a/trace/control.c b/trace/control.c
index b35e512dce..7a57fa7dd5 100644
--- a/trace/control.c
+++ b/trace/control.c
@@ -221,8 +221,10 @@ static void trace_init_events(const char *fname)
     loc_pop(&loc);
 }
 
-void trace_init_file(const char *file)
+void trace_init_file(void)
 {
+    QemuOpts *opts = qemu_find_opts_singleton("trace");
+    const char *file = qemu_opt_get(opts, "file");
 #ifdef CONFIG_TRACE_SIMPLE
     st_set_trace_file(file);
     st_set_trace_file_enabled(true);
@@ -286,9 +288,8 @@ bool trace_init_backends(void)
     return true;
 }
 
-char *trace_opt_parse(const char *optarg)
+void trace_opt_parse(const char *optarg)
 {
-    char *trace_file;
     QemuOpts *opts = qemu_opts_parse_noisily(qemu_find_opts("trace"),
                                              optarg, true);
     if (!opts) {
@@ -298,10 +299,7 @@ char *trace_opt_parse(const char *optarg)
         trace_enable_events(qemu_opt_get(opts, "enable"));
     }
     trace_init_events(qemu_opt_get(opts, "events"));
-    trace_file = g_strdup(qemu_opt_get(opts, "file"));
     qemu_opts_del(opts);
-
-    return trace_file;
 }
 
 uint32_t trace_get_vcpu_event_count(void)
diff --git a/trace/control.h b/trace/control.h
index 1f81c491b6..05b95ea453 100644
--- a/trace/control.h
+++ b/trace/control.h
@@ -167,8 +167,6 @@ void trace_event_set_vcpu_state_dynamic(CPUState *vcpu,
 
 /**
  * trace_init_backends:
- * @file:   Name of trace output file; may be NULL.
- *          Corresponds to commandline option "--trace file=...".
  *
  * Initialize the tracing backend.
  *
@@ -178,14 +176,12 @@ bool trace_init_backends(void);
 
 /**
  * trace_init_file:
- * @file:   Name of trace output file; may be NULL.
- *          Corresponds to commandline option "--trace file=...".
  *
  * Record the name of the output file for the tracing backend.
  * Exits if no selected backend does not support specifying the
- * output file, and a non-NULL file was passed.
+ * output file, and a file was specified with "-trace file=...".
  */
-void trace_init_file(const char *file);
+void trace_init_file(void);
 
 /**
  * trace_init_vcpu:
@@ -229,10 +225,8 @@ extern QemuOptsList qemu_trace_opts;
  * @optarg: A string argument of --trace command line argument
  *
  * Initialize tracing subsystem.
- *
- * Returns the filename to save trace to.  It must be freed with g_free().
  */
-char *trace_opt_parse(const char *optarg);
+void trace_opt_parse(const char *optarg);
 
 /**
  * trace_get_vcpu_event_count:
-- 
2.26.2



