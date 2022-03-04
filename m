Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 549784CDD25
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Mar 2022 20:08:30 +0100 (CET)
Received: from localhost ([::1]:43828 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nQDHx-000402-5X
	for lists+qemu-devel@lfdr.de; Fri, 04 Mar 2022 14:08:29 -0500
Received: from eggs.gnu.org ([209.51.188.92]:51560)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1nQD7U-00023H-11
 for qemu-devel@nongnu.org; Fri, 04 Mar 2022 13:57:40 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:45425)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1nQD7R-0000RS-Sl
 for qemu-devel@nongnu.org; Fri, 04 Mar 2022 13:57:39 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1646420257;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=lP8xSnXkqVDGP0+qLvTBsVs1fEaXU/b/yhmGwxWQ2xM=;
 b=jA8xlnvAgTmuoimzOTKubGQ+X/ZTvUt4a9o6WDxqHFvgtMBGgnlr+U1FBj7MddlJzA4Myw
 rA15MgUCPjD5658iR0Hzz/eVetB52G1qFF9I4N3V0+Mf4klH2DoWqe62TxlUfPzqDuVKWL
 vB5dhRU4Ws/SJnHMTl07CujAozapc7M=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-365-uYnkpX_MO2aOnMd-9lxirg-1; Fri, 04 Mar 2022 13:57:36 -0500
X-MC-Unique: uYnkpX_MO2aOnMd-9lxirg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 38D5D824FA6;
 Fri,  4 Mar 2022 18:57:35 +0000 (UTC)
Received: from localhost.localdomain.com (unknown [10.39.194.222])
 by smtp.corp.redhat.com (Postfix) with ESMTP id E433187B87;
 Fri,  4 Mar 2022 18:56:48 +0000 (UTC)
From: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 1/8] softmmu: remove deprecated --enable-fips option
Date: Fri,  4 Mar 2022 18:56:13 +0000
Message-Id: <20220304185620.3272401-2-berrange@redhat.com>
In-Reply-To: <20220304185620.3272401-1-berrange@redhat.com>
References: <20220304185620.3272401-1-berrange@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 libvir-list@redhat.com, Stefan Weil <sw@weilnetz.de>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Hanna Reitz <hreitz@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Eric Blake <eblake@redhat.com>
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
index 26d00812ba..a458dd453c 100644
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
index cb0575fd49..6ca66f658d 100644
--- a/docs/about/removed-features.rst
+++ b/docs/about/removed-features.rst
@@ -336,6 +336,17 @@ for the RISC-V ``virt`` machine and ``sifive_u`` machine.
 The ``-no-quit`` was a synonym for ``-display ...,window-close=off`` which
 should be used instead.
 
+``--enable-fips`` (removed in 7.0)
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
index 7bcce3bceb..66e70e24ff 100644
--- a/include/qemu/osdep.h
+++ b/include/qemu/osdep.h
@@ -534,9 +534,6 @@ static inline void qemu_timersub(const struct timeval *val1,
 
 void qemu_set_cloexec(int fd);
 
-void fips_set_state(bool requested);
-bool fips_get_state(void);
-
 /* Return a dynamically allocated pathname denoting a file or directory that is
  * appropriate for storing local state.
  *
diff --git a/os-posix.c b/os-posix.c
index ae6c9f2a5e..7cd662098e 100644
--- a/os-posix.c
+++ b/os-posix.c
@@ -151,14 +151,6 @@ int os_parse_cmd_args(int index, const char *optarg)
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
index 094a6c1d7c..cb0c58904b 100644
--- a/qemu-options.hx
+++ b/qemu-options.hx
@@ -4655,16 +4655,6 @@ HXCOMM Internal use
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
index 3ccd33dedc..82b28aec95 100644
--- a/ui/vnc.c
+++ b/ui/vnc.c
@@ -4051,13 +4051,6 @@ void vnc_display_open(const char *id, Error **errp)
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
index 723cdcb004..456df9e81a 100644
--- a/util/osdep.c
+++ b/util/osdep.c
@@ -43,8 +43,6 @@ extern int madvise(char *, size_t, int);
 #include "qemu/hw-version.h"
 #include "monitor/monitor.h"
 
-static bool fips_enabled = false;
-
 static const char *hw_version = QEMU_HW_VERSION;
 
 int socket_set_cork(int fd, int v)
@@ -526,32 +524,6 @@ const char *qemu_hw_version(void)
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
2.34.1


