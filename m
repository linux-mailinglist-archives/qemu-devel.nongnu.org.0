Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E02A58216F
	for <lists+qemu-devel@lfdr.de>; Wed, 27 Jul 2022 09:45:25 +0200 (CEST)
Received: from localhost ([::1]:38406 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oGbjQ-00079N-EA
	for lists+qemu-devel@lfdr.de; Wed, 27 Jul 2022 03:45:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46938)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1oGbaQ-00065x-LM
 for qemu-devel@nongnu.org; Wed, 27 Jul 2022 03:36:06 -0400
Received: from mail-pj1-x1033.google.com ([2607:f8b0:4864:20::1033]:35434)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1oGbaP-0002J7-2R
 for qemu-devel@nongnu.org; Wed, 27 Jul 2022 03:36:06 -0400
Received: by mail-pj1-x1033.google.com with SMTP id
 o20-20020a17090aac1400b001f2da729979so1370409pjq.0
 for <qemu-devel@nongnu.org>; Wed, 27 Jul 2022 00:36:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=5hG4N7Ezu98rJmTsW2Ab18WDLpLbgofhoWTD2kC/llU=;
 b=kzDIkmvZSCsxA+Nzz+/bo/gXdr8UDlpdOdoJWL/zbhM7tczoVwxQspjNJlPQPycZ82
 Z1Xa0Q30/FKZZFGwIGeRNS+2SPlYrWW057hxrkENqAxaKPLQpFKSJpJ8sR+ZNF4h87zD
 5UPYXh3zAzXDAeRXDefc/AQ/oKISpPHYj1htTVvPGQl/O8AoOc+1397Fkr/z1E6A76id
 lTK5u38TU1q5acO+IraWQwFkBonq+pdMWypawa2xusnG+qppICyuXk1WdNKdeMEio7Xi
 sdK2+RkWdQp7glO2I7eUbT7+iHsZqnmwpZ6078wI2bzcduAdsU1O0tWnVaxe1U913A8o
 9r6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=5hG4N7Ezu98rJmTsW2Ab18WDLpLbgofhoWTD2kC/llU=;
 b=5O3WfHMpjeoThD7qT30PS6azawiHO/D1l4CbEAJw67FvjpmxY1jAixcv9xcx6OYBDn
 XhabBb9/49u4vfvqPwLZfghTK2uu4tcTEtncA+1aBq75SH4wDh0VPuE5jebjiG2P5UFv
 58WhDhP6RmrA9usdA80DG0KpdOA+ghkFpjzoRj2ZUnlTpcsM92XyoDZ45Yr40ynIcMwu
 Oue9Zfyj234OH+aAOdot9tLFTaV6q8SQEsts1nBq3Otg3NCQkT9hk166rfBDDBHS4OwK
 sEhMp5oKy6CVGa0MDBPpaNyCuGEkY5f/66SXlQqFAWEbcUGqq74diPqlypt3G5KIbTzf
 iNXQ==
X-Gm-Message-State: AJIora+FO3njZiiRhq54+NYqLF9HsKr9DLSynxpzj0OIwPKNr00joCTW
 7T7xGRC1WCklJI9muH1CdbFj06PdUVY=
X-Google-Smtp-Source: AGRyM1tp27dTYYxAUvDLjKfUAR91d67gWbn3t3UH954P+yuPYfPHK4lYpHkScjnly5b+QXIMCnOTjQ==
X-Received: by 2002:a17:902:cf4b:b0:16c:4634:72 with SMTP id
 e11-20020a170902cf4b00b0016c46340072mr20123630plg.15.1658907362900; 
 Wed, 27 Jul 2022 00:36:02 -0700 (PDT)
Received: from ubuntu.. (144.168.56.201.16clouds.com. [144.168.56.201])
 by smtp.gmail.com with ESMTPSA id
 z7-20020a170902ccc700b0016c09a0ef87sm10533834ple.255.2022.07.27.00.36.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 27 Jul 2022 00:36:01 -0700 (PDT)
From: Bin Meng <bmeng.cn@gmail.com>
To: qemu-devel@nongnu.org
Cc: Bin Meng <bin.meng@windriver.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Subject: [PATCH 5/5] chardev/char-socket: Update AF_UNIX for Windows
Date: Wed, 27 Jul 2022 15:35:42 +0800
Message-Id: <20220727073542.811420-6-bmeng.cn@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220727073542.811420-1-bmeng.cn@gmail.com>
References: <20220727073542.811420-1-bmeng.cn@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1033;
 envelope-from=bmeng.cn@gmail.com; helo=mail-pj1-x1033.google.com
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

Now that AF_UNIX has come to Windows, update the existing logic in
qemu_chr_compute_filename() and qmp_chardev_open_socket() for Windows.

Signed-off-by: Bin Meng <bin.meng@windriver.com>
---

 chardev/char-socket.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/chardev/char-socket.c b/chardev/char-socket.c
index dc4e218eeb..5a1fa0db33 100644
--- a/chardev/char-socket.c
+++ b/chardev/char-socket.c
@@ -37,6 +37,10 @@
 #include "chardev/char-io.h"
 #include "chardev/char-socket.h"
 
+#if defined(CONFIG_WIN32) && defined(CONFIG_AF_UNIX)
+# include <afunix.h>
+#endif /* CONFIG_WIN32 && CONFIG_AF_UNIX */
+
 static gboolean socket_reconnect_timeout(gpointer opaque);
 static void tcp_chr_telnet_init(Chardev *chr);
 
@@ -557,7 +561,7 @@ static char *qemu_chr_compute_filename(SocketChardev *s)
     const char *left = "", *right = "";
 
     switch (ss->ss_family) {
-#ifndef _WIN32
+#ifdef CONFIG_AF_UNIX
     case AF_UNIX:
         return g_strdup_printf("unix:%s%s",
                                ((struct sockaddr_un *)(ss))->sun_path,
@@ -1372,10 +1376,12 @@ static void qmp_chardev_open_socket(Chardev *chr,
     }
 
     qemu_chr_set_feature(chr, QEMU_CHAR_FEATURE_RECONNECTABLE);
+#ifndef _WIN32
     /* TODO SOCKET_ADDRESS_FD where fd has AF_UNIX */
     if (addr->type == SOCKET_ADDRESS_TYPE_UNIX) {
         qemu_chr_set_feature(chr, QEMU_CHAR_FEATURE_FD_PASS);
     }
+#endif
 
     /*
      * In the chardev-change special-case, we shouldn't register a new yank
-- 
2.34.1


