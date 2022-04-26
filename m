Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 67D8B5101AF
	for <lists+qemu-devel@lfdr.de>; Tue, 26 Apr 2022 17:15:18 +0200 (CEST)
Received: from localhost ([::1]:36576 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1njMuL-0004LK-7G
	for lists+qemu-devel@lfdr.de; Tue, 26 Apr 2022 11:15:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53202)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1njMsg-0002Ii-Tx
 for qemu-devel@nongnu.org; Tue, 26 Apr 2022 11:13:34 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:60547)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1njMse-0006r8-TQ
 for qemu-devel@nongnu.org; Tue, 26 Apr 2022 11:13:34 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1650986012;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=MRHKpHMoZyunJVgdf0sK2L+N/pvQJaovJ/JE9ZmLhDo=;
 b=gwv1vJXKU8zEv0GSRuGVyAx7ilf4CLoJqTkVu1aQEYxpeePUmttdLJ9nFaYKSYoN/Zl+ew
 7M48PKgP8+6A+a8v6FsJQmgPs4HBXWAPY1mtfzAF+cE3KiDwM8F7EF0HXu9s1PdAUh0nCA
 Ce+n/qDoUnI/Ar1rvvOh0sQi3Gn8gcE=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-103-jaDJMM-QNlOE8inhFc3L_w-1; Tue, 26 Apr 2022 11:13:29 -0400
X-MC-Unique: jaDJMM-QNlOE8inhFc3L_w-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id A7403811E78;
 Tue, 26 Apr 2022 15:13:28 +0000 (UTC)
Received: from localhost.localdomain.com (unknown [10.33.36.156])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 0BB4454ECF5;
 Tue, 26 Apr 2022 15:13:26 +0000 (UTC)
From: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 1/3] softmmu: remove deprecated --enable-fips option
Date: Tue, 26 Apr 2022 16:13:21 +0100
Message-Id: <20220426151323.729982-2-berrange@redhat.com>
In-Reply-To: <20220426151323.729982-1-berrange@redhat.com>
References: <20220426151323.729982-1-berrange@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.9
Received-SPF: pass client-ip=170.10.129.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Beraldo Leal <bleal@redhat.com>, libvir-list@redhat.com,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Users requiring FIPS support must build QEMU with either the libgcrypt
or gnutls libraries as the crytography backend.

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
---
 docs/about/deprecated.rst       | 12 ------------
 docs/about/removed-features.rst | 11 +++++++++++
 include/qemu/osdep.h            |  3 ---
 os-posix.c                      |  8 --------
 qemu-options.hx                 | 10 ----------
 ui/vnc.c                        |  7 -------
 util/osdep.c                    | 28 ----------------------------
 7 files changed, 11 insertions(+), 68 deletions(-)

diff --git a/docs/about/deprecated.rst b/docs/about/deprecated.rst
index cf02ef6821..257cc15f82 100644
--- a/docs/about/deprecated.rst
+++ b/docs/about/deprecated.rst
@@ -67,18 +67,6 @@ and will cause a warning.
 The replacement for the ``nodelay`` short-form boolean option is ``nodelay=on``
 rather than ``delay=off``.
 
-``--enable-fips`` (since 6.0)
-'''''''''''''''''''''''''''''
-
-This option restricts usage of certain cryptographic algorithms when
-the host is operating in FIPS mode.
-
-If FIPS compliance is required, QEMU should be built with the ``libgcrypt``
-library enabled as a cryptography provider.
-
-Neither the ``nettle`` library, or the built-in cryptography provider are
-supported on FIPS enabled hosts.
-
 ``-writeconfig`` (since 6.0)
 '''''''''''''''''''''''''''''
 
diff --git a/docs/about/removed-features.rst b/docs/about/removed-features.rst
index 4b831ea291..a66f4b73b2 100644
--- a/docs/about/removed-features.rst
+++ b/docs/about/removed-features.rst
@@ -336,6 +336,17 @@ for the RISC-V ``virt`` machine and ``sifive_u`` machine.
 The ``-no-quit`` was a synonym for ``-display ...,window-close=off`` which
 should be used instead.
 
+``--enable-fips`` (removed in 7.1)
+''''''''''''''''''''''''''''''''''
+
+This option restricted usage of certain cryptographic algorithms when
+the host is operating in FIPS mode.
+
+If FIPS compliance is required, QEMU should be built with the ``libgcrypt``
+or ``gnutls`` library enabled as a cryptography provider.
+
+Neither the ``nettle`` library, or the built-in cryptography provider are
+supported on FIPS enabled hosts.
 
 QEMU Machine Protocol (QMP) commands
 ------------------------------------
diff --git a/include/qemu/osdep.h b/include/qemu/osdep.h
index baaa23c156..52d81c027b 100644
--- a/include/qemu/osdep.h
+++ b/include/qemu/osdep.h
@@ -553,9 +553,6 @@ int qemu_pipe(int pipefd[2]);
 
 void qemu_set_cloexec(int fd);
 
-void fips_set_state(bool requested);
-bool fips_get_state(void);
-
 /* Return a dynamically allocated directory path that is appropriate for storing
  * local state.
  *
diff --git a/os-posix.c b/os-posix.c
index faf6e6978b..1b746dba97 100644
--- a/os-posix.c
+++ b/os-posix.c
@@ -150,14 +150,6 @@ int os_parse_cmd_args(int index, const char *optarg)
     case QEMU_OPTION_daemonize:
         daemonize = 1;
         break;
-#if defined(CONFIG_LINUX)
-    case QEMU_OPTION_enablefips:
-        warn_report("-enable-fips is deprecated, please build QEMU with "
-                    "the `libgcrypt` library as the cryptography provider "
-                    "to enable FIPS compliance");
-        fips_set_state(true);
-        break;
-#endif
     default:
         return -1;
     }
diff --git a/qemu-options.hx b/qemu-options.hx
index 34e9b32a5c..1764eebfaf 100644
--- a/qemu-options.hx
+++ b/qemu-options.hx
@@ -4673,16 +4673,6 @@ HXCOMM Internal use
 DEF("qtest", HAS_ARG, QEMU_OPTION_qtest, "", QEMU_ARCH_ALL)
 DEF("qtest-log", HAS_ARG, QEMU_OPTION_qtest_log, "", QEMU_ARCH_ALL)
 
-#ifdef __linux__
-DEF("enable-fips", 0, QEMU_OPTION_enablefips,
-    "-enable-fips    enable FIPS 140-2 compliance\n",
-    QEMU_ARCH_ALL)
-#endif
-SRST
-``-enable-fips``
-    Enable FIPS 140-2 compliance mode.
-ERST
-
 DEF("msg", HAS_ARG, QEMU_OPTION_msg,
     "-msg [timestamp[=on|off]][,guest-name=[on|off]]\n"
     "                control error message format\n"
diff --git a/ui/vnc.c b/ui/vnc.c
index badf1d7664..1347e27b5b 100644
--- a/ui/vnc.c
+++ b/ui/vnc.c
@@ -4059,13 +4059,6 @@ void vnc_display_open(const char *id, Error **errp)
         password = qemu_opt_get_bool(opts, "password", false);
     }
     if (password) {
-        if (fips_get_state()) {
-            error_setg(errp,
-                       "VNC password auth disabled due to FIPS mode, "
-                       "consider using the VeNCrypt or SASL authentication "
-                       "methods as an alternative");
-            goto fail;
-        }
         if (!qcrypto_cipher_supports(
                 QCRYPTO_CIPHER_ALG_DES, QCRYPTO_CIPHER_MODE_ECB)) {
             error_setg(errp,
diff --git a/util/osdep.c b/util/osdep.c
index c7aec36f22..60fcbbaebe 100644
--- a/util/osdep.c
+++ b/util/osdep.c
@@ -31,8 +31,6 @@
 #include "qemu/hw-version.h"
 #include "monitor/monitor.h"
 
-static bool fips_enabled = false;
-
 static const char *hw_version = QEMU_HW_VERSION;
 
 int socket_set_cork(int fd, int v)
@@ -514,32 +512,6 @@ const char *qemu_hw_version(void)
     return hw_version;
 }
 
-void fips_set_state(bool requested)
-{
-#ifdef __linux__
-    if (requested) {
-        FILE *fds = fopen("/proc/sys/crypto/fips_enabled", "r");
-        if (fds != NULL) {
-            fips_enabled = (fgetc(fds) == '1');
-            fclose(fds);
-        }
-    }
-#else
-    fips_enabled = false;
-#endif /* __linux__ */
-
-#ifdef _FIPS_DEBUG
-    fprintf(stderr, "FIPS mode %s (requested %s)\n",
-            (fips_enabled ? "enabled" : "disabled"),
-            (requested ? "enabled" : "disabled"));
-#endif
-}
-
-bool fips_get_state(void)
-{
-    return fips_enabled;
-}
-
 #ifdef _WIN32
 static void socket_cleanup(void)
 {
-- 
2.35.1


