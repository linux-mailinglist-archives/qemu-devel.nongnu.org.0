Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 118192D60D4
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Dec 2020 17:03:22 +0100 (CET)
Received: from localhost ([::1]:42190 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1knOPZ-0001PQ-0d
	for lists+qemu-devel@lfdr.de; Thu, 10 Dec 2020 11:03:21 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59108)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1knOKx-00086M-S6
 for qemu-devel@nongnu.org; Thu, 10 Dec 2020 10:58:36 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:54741)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1knOKv-0004yh-Vh
 for qemu-devel@nongnu.org; Thu, 10 Dec 2020 10:58:35 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1607615913;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=5/6X1Q0Vn+1CyF4/TCkAOIvTcfz9+jq1y6vKssndBYU=;
 b=Lipx5TgV31Ags8V0zBy4dEoqOW5P30us5fMpg3xKGTKtJ+5715dN8VEU5ZQRzOsjTX6a+q
 AZDUhf113iRx6eHNCYZ4/TNRcVl+YhNrH7doHzDaEcY0htJF0o/j4Q+EYpbL27jo5vucHj
 8b8InZtXxf3MxH9JlRnB5JEP1LW0vdI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-293-aiut_sd2MJm7-ZtL65YvPg-1; Thu, 10 Dec 2020 10:58:31 -0500
X-MC-Unique: aiut_sd2MJm7-ZtL65YvPg-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6FDC119251A0
 for <qemu-devel@nongnu.org>; Thu, 10 Dec 2020 15:58:30 +0000 (UTC)
Received: from thuth.com (ovpn-112-62.ams2.redhat.com [10.36.112.62])
 by smtp.corp.redhat.com (Postfix) with ESMTP id CC27B6F987;
 Thu, 10 Dec 2020 15:58:28 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org,
	Paolo Bonzini <pbonzini@redhat.com>
Subject: [PATCH 3/4] Remove the deprecated -realtime option
Date: Thu, 10 Dec 2020 16:58:07 +0100
Message-Id: <20201210155808.233895-4-thuth@redhat.com>
In-Reply-To: <20201210155808.233895-1-thuth@redhat.com>
References: <20201210155808.233895-1-thuth@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: libvir-list@redhat.com,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 kraxel@redhat.com, mst@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

It has been marked as deprecated since QEMU v4.2, replaced by
the -overcommit option. Time to remove it now.

Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 docs/system/deprecated.rst          |  6 ------
 docs/system/removed-features.rst    |  6 ++++++
 qemu-options.hx                     | 14 +-------------
 softmmu/vl.c                        | 29 +----------------------------
 tests/migration/guestperf/engine.py |  2 +-
 5 files changed, 9 insertions(+), 48 deletions(-)

diff --git a/docs/system/deprecated.rst b/docs/system/deprecated.rst
index fa1ecf0958..307b83ea60 100644
--- a/docs/system/deprecated.rst
+++ b/docs/system/deprecated.rst
@@ -75,12 +75,6 @@ The ``pretty=on|off`` switch has no effect for HMP monitors, but is
 silently ignored. Using the switch with HMP monitors will become an
 error in the future.
 
-``-realtime`` (since 4.1)
-'''''''''''''''''''''''''
-
-The ``-realtime mlock=on|off`` argument has been replaced by the
-``-overcommit mem-lock=on|off`` argument.
-
 RISC-V ``-bios`` (since 5.1)
 ''''''''''''''''''''''''''''
 
diff --git a/docs/system/removed-features.rst b/docs/system/removed-features.rst
index 8f0578f1eb..63046d5c24 100644
--- a/docs/system/removed-features.rst
+++ b/docs/system/removed-features.rst
@@ -20,6 +20,12 @@ for the ``id`` parameter, which should now be used instead.
 
 The ``-no-kvm`` argument was a synonym for setting ``-machine accel=tcg``.
 
+``-realtime`` (removed in 6.0)
+''''''''''''''''''''''''''''''
+
+The ``-realtime mlock=on|off`` argument has been replaced by the
+``-overcommit mem-lock=on|off`` argument.
+
 ``-tb-size`` option (removed in 6.0)
 '''''''''''''''''''''''''''''''
 
diff --git a/qemu-options.hx b/qemu-options.hx
index 7ce06290b6..79a4c35b49 100644
--- a/qemu-options.hx
+++ b/qemu-options.hx
@@ -3713,17 +3713,6 @@ SRST
     Do not start CPU at startup (you must type 'c' in the monitor).
 ERST
 
-DEF("realtime", HAS_ARG, QEMU_OPTION_realtime,
-    "-realtime [mlock=on|off]\n"
-    "                run qemu with realtime features\n"
-    "                mlock=on|off controls mlock support (default: on)\n",
-    QEMU_ARCH_ALL)
-SRST
-``-realtime mlock=on|off``
-    Run qemu with realtime features. mlocking qemu and guest memory can
-    be enabled via ``mlock=on`` (enabled by default).
-ERST
-
 DEF("overcommit", HAS_ARG, QEMU_OPTION_overcommit,
     "-overcommit [mem-lock=on|off][cpu-pm=on|off]\n"
     "                run qemu with overcommit hints\n"
@@ -3739,8 +3728,7 @@ SRST
 
     Locking qemu and guest memory can be enabled via ``mem-lock=on``
     (disabled by default). This works when host memory is not
-    overcommitted and reduces the worst-case latency for guest. This is
-    equivalent to ``realtime``.
+    overcommitted and reduces the worst-case latency for guest.
 
     Guest ability to manage power state of host cpus (increasing latency
     for other processes on the same host cpu, but decreasing latency for
diff --git a/softmmu/vl.c b/softmmu/vl.c
index 3f052849d8..9f4c228c0e 100644
--- a/softmmu/vl.c
+++ b/softmmu/vl.c
@@ -354,18 +354,6 @@ static QemuOptsList qemu_tpmdev_opts = {
     },
 };
 
-static QemuOptsList qemu_realtime_opts = {
-    .name = "realtime",
-    .head = QTAILQ_HEAD_INITIALIZER(qemu_realtime_opts.head),
-    .desc = {
-        {
-            .name = "mlock",
-            .type = QEMU_OPT_BOOL,
-        },
-        { /* end of list */ }
-    },
-};
-
 static QemuOptsList qemu_overcommit_opts = {
     .name = "overcommit",
     .head = QTAILQ_HEAD_INITIALIZER(qemu_overcommit_opts.head),
@@ -2940,7 +2928,6 @@ void qemu_init(int argc, char **argv, char **envp)
     qemu_add_opts(&qemu_add_fd_opts);
     qemu_add_opts(&qemu_object_opts);
     qemu_add_opts(&qemu_tpmdev_opts);
-    qemu_add_opts(&qemu_realtime_opts);
     qemu_add_opts(&qemu_overcommit_opts);
     qemu_add_opts(&qemu_msg_opts);
     qemu_add_opts(&qemu_name_opts);
@@ -3771,27 +3758,13 @@ void qemu_init(int argc, char **argv, char **envp)
                     exit(1);
                 }
                 break;
-            case QEMU_OPTION_realtime:
-                warn_report("'-realtime mlock=...' is deprecated, please use "
-                             "'-overcommit mem-lock=...' instead");
-                opts = qemu_opts_parse_noisily(qemu_find_opts("realtime"),
-                                               optarg, false);
-                if (!opts) {
-                    exit(1);
-                }
-                /* Don't override the -overcommit option if set */
-                enable_mlock = enable_mlock ||
-                    qemu_opt_get_bool(opts, "mlock", true);
-                break;
             case QEMU_OPTION_overcommit:
                 opts = qemu_opts_parse_noisily(qemu_find_opts("overcommit"),
                                                optarg, false);
                 if (!opts) {
                     exit(1);
                 }
-                /* Don't override the -realtime option if set */
-                enable_mlock = enable_mlock ||
-                    qemu_opt_get_bool(opts, "mem-lock", false);
+                enable_mlock = qemu_opt_get_bool(opts, "mem-lock", false);
                 enable_cpu_pm = qemu_opt_get_bool(opts, "cpu-pm", false);
                 break;
             case QEMU_OPTION_msg:
diff --git a/tests/migration/guestperf/engine.py b/tests/migration/guestperf/engine.py
index e2a214bdab..83bfc3b6bb 100644
--- a/tests/migration/guestperf/engine.py
+++ b/tests/migration/guestperf/engine.py
@@ -304,7 +304,7 @@ class Engine(object):
             argv_source += ["-mem-path", "/dev/shm",
                             "-mem-prealloc"]
         if hardware._locked_pages:
-            argv_source += ["-realtime", "mlock=on"]
+            argv_source += ["-overcommit", "mem-lock=on"]
         if hardware._huge_pages:
             pass
 
-- 
2.27.0


