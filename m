Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E840585AE0
	for <lists+qemu-devel@lfdr.de>; Sat, 30 Jul 2022 16:54:41 +0200 (CEST)
Received: from localhost ([::1]:49218 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oHnrU-0001jZ-Fx
	for lists+qemu-devel@lfdr.de; Sat, 30 Jul 2022 10:54:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49234)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1oHnnl-0004al-8b
 for qemu-devel@nongnu.org; Sat, 30 Jul 2022 10:50:49 -0400
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d]:41792)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1oHnnj-0007Zc-Fs
 for qemu-devel@nongnu.org; Sat, 30 Jul 2022 10:50:49 -0400
Received: by mail-pl1-x62d.google.com with SMTP id v18so6897210plo.8
 for <qemu-devel@nongnu.org>; Sat, 30 Jul 2022 07:50:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=UnQVL1Npd4eART+kRniE+KeFyZ5asD3O80TNp+3P8+k=;
 b=poW0SWzKb47IRlxMH+pwikJRcSVlv+Rw9jUVwcL92qUIy4UEDFmhBvbR6ZpPGwjEVW
 mDLV4ayBNVO1F88f0q8UM8M7OR8+Xah9CKX03iHNFN02hzYOdbnPvvtLYZ/glPjRyU4s
 ZYmYyipJ8+WcuAChD+noX9L7EzY8JangKkwasoBuVyzSAz8AeMY2BTQJAJvtsfWPGGRr
 Oj65Os/Zl1kE7ai5fbIgdbEo5s2GAALVlVyuuTkd8Alwb8/gCvfvi7G2U2o9PGTRNzU/
 Uc5AaoiNP3I4t2e7UmrgtAV11q7W6oZXlSo4LIbn2YFLmpWxTjvN+LYWqryxmkPWZHX7
 CpyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=UnQVL1Npd4eART+kRniE+KeFyZ5asD3O80TNp+3P8+k=;
 b=7gZG3p9wyVE/rwWjmRBvpxtuQAxNQ2G7hbLrJIbIkSIUuUhS/NewrfFFJaut0zaXJi
 mFeRKEp5G/6TyDZsntwwv8Xwqli76j1Q19xa50JxN+rh5Ox8XE7emWPCDQh6NbWgB2mT
 XXhP1K9GrNt5CofTUkyf8Mujr3938TD9aCfIhq27zL2e6NOebikmu397cYEhjGjiKZEt
 da7Y/KjF+fQI8KiJV7gOQszCssUmOUDPMtaiixYsW6qomoR3MlIVl5/s4aeLMM0xL7HK
 lsbi+Ff56x9G8daEtMS9K2BAs8Hb9u64yaOWUV19UOSfjJx4+BJTUF73SiKrP2+WkboF
 9T3w==
X-Gm-Message-State: ACgBeo2C02brKJ7MlVM8X4Dj4mYdTdZ1C8ANFmetu022lkPO0aW5MYY9
 zbbMkAfuvIw6h8QN83GfJsEOBGSC7WQ=
X-Google-Smtp-Source: AA6agR7F/+6VJuLT6azsym0RxxlGrToIIrDq4GBZHv4uziQlsC6XarJLMSRvWaVF0fFXpIIfL2KM/g==
X-Received: by 2002:a17:902:d711:b0:16d:1665:1162 with SMTP id
 w17-20020a170902d71100b0016d16651162mr8681809ply.5.1659192645962; 
 Sat, 30 Jul 2022 07:50:45 -0700 (PDT)
Received: from ubuntu.. (144.168.56.201.16clouds.com. [144.168.56.201])
 by smtp.gmail.com with ESMTPSA id
 x11-20020aa78f0b000000b00525343b5047sm4882499pfr.76.2022.07.30.07.50.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 30 Jul 2022 07:50:45 -0700 (PDT)
From: Bin Meng <bmeng.cn@gmail.com>
To: qemu-devel@nongnu.org
Cc: Bin Meng <bin.meng@windriver.com>,
 Xuzhou Cheng <xuzhou.cheng@windriver.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Stefan Weil <sw@weilnetz.de>
Subject: [PATCH v3 2/4] util/qemu-sockets: Enable unix socket support on
 Windows
Date: Sat, 30 Jul 2022 22:50:34 +0800
Message-Id: <20220730145036.865854-3-bmeng.cn@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220730145036.865854-1-bmeng.cn@gmail.com>
References: <20220730145036.865854-1-bmeng.cn@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62d;
 envelope-from=bmeng.cn@gmail.com; helo=mail-pl1-x62d.google.com
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

From: Bin Meng <bin.meng@windriver.com>

Support for the unix socket has existed both in BSD and Linux for the
longest time, but not on Windows. Since Windows 10 build 17063 [1],
the native support for the unix socket has come to Windows. Starting
this build, two Win32 processes can use the AF_UNIX address family
over Winsock API to communicate with each other.

[1] https://devblogs.microsoft.com/commandline/af_unix-comes-to-windows/

Signed-off-by: Xuzhou Cheng <xuzhou.cheng@windriver.com>
Signed-off-by: Bin Meng <bin.meng@windriver.com>
---

Changes in v3:
- drop the run-time check afunix_available()

Changes in v2:
- move #include <afunix.h> to os-win32.h
- define WIN_BUILD_AF_UNIX only when CONFIG_WIN32

 meson.build               |  6 ++++++
 include/sysemu/os-win32.h |  4 ++++
 util/qemu-sockets.c       | 14 +++++++-------
 3 files changed, 17 insertions(+), 7 deletions(-)

diff --git a/meson.build b/meson.build
index 294e9a8f32..3663b925d4 100644
--- a/meson.build
+++ b/meson.build
@@ -2327,6 +2327,12 @@ have_afalg = get_option('crypto_afalg') \
   '''), error_message: 'AF_ALG requested but could not be detected').allowed()
 config_host_data.set('CONFIG_AF_ALG', have_afalg)
 
+if targetos != 'windows'
+  config_host_data.set('CONFIG_AF_UNIX', true)
+else
+  config_host_data.set('CONFIG_AF_UNIX', cc.has_header('afunix.h'))
+endif
+
 config_host_data.set('CONFIG_AF_VSOCK', cc.has_header_symbol(
   'linux/vm_sockets.h', 'AF_VSOCK',
   prefix: '#include <sys/socket.h>',
diff --git a/include/sysemu/os-win32.h b/include/sysemu/os-win32.h
index edc3b38a57..cebf260694 100644
--- a/include/sysemu/os-win32.h
+++ b/include/sysemu/os-win32.h
@@ -30,6 +30,10 @@
 #include <windows.h>
 #include <ws2tcpip.h>
 
+#ifdef CONFIG_AF_UNIX
+# include <afunix.h>
+#endif
+
 #ifdef __cplusplus
 extern "C" {
 #endif
diff --git a/util/qemu-sockets.c b/util/qemu-sockets.c
index 0e2298278f..f9892506de 100644
--- a/util/qemu-sockets.c
+++ b/util/qemu-sockets.c
@@ -880,7 +880,7 @@ static int vsock_parse(VsockSocketAddress *addr, const char *str,
 }
 #endif /* CONFIG_AF_VSOCK */
 
-#ifndef _WIN32
+#ifdef CONFIG_AF_UNIX
 
 static bool saddr_is_abstract(UnixSocketAddress *saddr)
 {
@@ -1060,14 +1060,14 @@ static int unix_listen_saddr(UnixSocketAddress *saddr,
                              int num,
                              Error **errp)
 {
-    error_setg(errp, "unix sockets are not available on windows");
+    error_setg(errp, "unix sockets are not available on your host");
     errno = ENOTSUP;
     return -1;
 }
 
 static int unix_connect_saddr(UnixSocketAddress *saddr, Error **errp)
 {
-    error_setg(errp, "unix sockets are not available on windows");
+    error_setg(errp, "unix sockets are not available on your host");
     errno = ENOTSUP;
     return -1;
 }
@@ -1335,7 +1335,7 @@ socket_sockaddr_to_address_inet(struct sockaddr_storage *sa,
 }
 
 
-#ifndef WIN32
+#ifdef CONFIG_AF_UNIX
 static SocketAddress *
 socket_sockaddr_to_address_unix(struct sockaddr_storage *sa,
                                 socklen_t salen,
@@ -1362,7 +1362,7 @@ socket_sockaddr_to_address_unix(struct sockaddr_storage *sa,
     addr->u.q_unix.path = g_strndup(su->sun_path, salen);
     return addr;
 }
-#endif /* WIN32 */
+#endif /* CONFIG_AF_UNIX */
 
 #ifdef CONFIG_AF_VSOCK
 static SocketAddress *
@@ -1394,10 +1394,10 @@ socket_sockaddr_to_address(struct sockaddr_storage *sa,
     case AF_INET6:
         return socket_sockaddr_to_address_inet(sa, salen, errp);
 
-#ifndef WIN32
+#ifdef CONFIG_AF_UNIX
     case AF_UNIX:
         return socket_sockaddr_to_address_unix(sa, salen, errp);
-#endif /* WIN32 */
+#endif
 
 #ifdef CONFIG_AF_VSOCK
     case AF_VSOCK:
-- 
2.34.1


