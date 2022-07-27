Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9569858214D
	for <lists+qemu-devel@lfdr.de>; Wed, 27 Jul 2022 09:40:07 +0200 (CEST)
Received: from localhost ([::1]:60092 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oGbeI-0002XG-KE
	for lists+qemu-devel@lfdr.de; Wed, 27 Jul 2022 03:40:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46864)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1oGbaE-0005wF-9X
 for qemu-devel@nongnu.org; Wed, 27 Jul 2022 03:35:54 -0400
Received: from mail-pf1-x42a.google.com ([2607:f8b0:4864:20::42a]:45908)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1oGbaC-0002I0-NS
 for qemu-devel@nongnu.org; Wed, 27 Jul 2022 03:35:53 -0400
Received: by mail-pf1-x42a.google.com with SMTP id y9so15368121pff.12
 for <qemu-devel@nongnu.org>; Wed, 27 Jul 2022 00:35:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=kS/P/+A+ljy2bYx4PLr8f8hnFjz0iV4LBw7/6hnHSmQ=;
 b=UY0ItBBbOL8xRO2BSV8SGeB6FVlk8IGwc+ATRPN4yWIZJCzU+W/hKufHkpx+BEMuK6
 x3O2G0LspxjG3iFZiqvqUJYComjQmR3TlBE7p6qRcBfgikyIbPuRwKUAk5M4GMc54m52
 RJOdd1L909kjgIsGZXJIFDC/Kxw07y0PNqMkMUVUI0fct9EDxP8XJFEYExrjaZrnT/R2
 qAXUcTkNvWHd27au0wMo5OQQYjKjovl2FmmkZtI1itgPhBNy0s31WITJ/E0VpghSScHS
 8S8wRPE0aH8TXS/fMVArgvPdojvrKlGBmtodXZNq2tDwm6L752ZUyhaDjowNY0sLkfB4
 lTPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=kS/P/+A+ljy2bYx4PLr8f8hnFjz0iV4LBw7/6hnHSmQ=;
 b=jdPH4yALaAHTyy6NasgF+RjmfwuTWB/LdfE2IFAN/6yifWQ+9u/oo3uE20HS2NZoS6
 QSaL1olhjSH2Ukmh3PLbUGpj6c2tZfCQvzdnLG2WXlgKtnG0TmQiMhH3Agbc9oqrfmkD
 A0vGGFHL6/9yqFudotVQyPvQbP3g5vxsCyf5C71eE5nNy1G6j7LTU7PnA9GRfAzdN3Q4
 t50v9MMPBRScZvdXqW8R2M9jOvZPldnYP2atImDXdHDMRBKgIjwBwgO3Q+xCDbmQuddW
 Bej1LRlVxvMIc02DEHPwmQf64A81gHMQM+yi3GVFpuu8mXd4nbhzzmkcoXqHVvTmVTzr
 THqQ==
X-Gm-Message-State: AJIora8mhT0ytyJqGr6lJkn8b+B+O+alwcCoOTm3PiWW/7NTniADrkKi
 h99YDzcSujLxiLOFifDL9/UGyZ8/SQg=
X-Google-Smtp-Source: AGRyM1u8D9/jn+uhWgVK4yvcTpDFDLnLQwmfnB2Xbxh40ZNHCmSIUQxZHrb+Nr1aFKIJkkptl5t0eA==
X-Received: by 2002:a65:460b:0:b0:41a:6637:6544 with SMTP id
 v11-20020a65460b000000b0041a66376544mr17832655pgq.511.1658907351057; 
 Wed, 27 Jul 2022 00:35:51 -0700 (PDT)
Received: from ubuntu.. (144.168.56.201.16clouds.com. [144.168.56.201])
 by smtp.gmail.com with ESMTPSA id
 z7-20020a170902ccc700b0016c09a0ef87sm10533834ple.255.2022.07.27.00.35.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 27 Jul 2022 00:35:50 -0700 (PDT)
From: Bin Meng <bmeng.cn@gmail.com>
To: qemu-devel@nongnu.org
Cc: Bin Meng <bin.meng@windriver.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
Subject: [PATCH 1/5] util/qemu-sockets: Replace the call to close a socket
 with closesocket()
Date: Wed, 27 Jul 2022 15:35:38 +0800
Message-Id: <20220727073542.811420-2-bmeng.cn@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220727073542.811420-1-bmeng.cn@gmail.com>
References: <20220727073542.811420-1-bmeng.cn@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42a;
 envelope-from=bmeng.cn@gmail.com; helo=mail-pf1-x42a.google.com
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

close() is a *nix function. It works on any file descriptor, and
sockets in *nix are an example of a file descriptor.

closesocket() is a Windows-specific function, which works only
specifically with sockets. Sockets on Windows do not use *nix-style
file descriptors, and socket() returns a handle to a kernel object
instead, so it must be closed with closesocket().

In QEMU there is already a logic to handle such platform difference
in os-posix.h and os-win32.h, that:

  * closesocket maps to close on POSIX
  * closesocket maps to a wrapper that calls the real closesocket()
    on Windows

Replace the call to close a socket with closesocket() instead.

Signed-off-by: Bin Meng <bin.meng@windriver.com>
---

 util/qemu-sockets.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/util/qemu-sockets.c b/util/qemu-sockets.c
index 13b5b197f9..0e2298278f 100644
--- a/util/qemu-sockets.c
+++ b/util/qemu-sockets.c
@@ -487,7 +487,7 @@ int inet_connect_saddr(InetSocketAddress *saddr, Error **errp)
 
         if (ret < 0) {
             error_setg_errno(errp, errno, "Unable to set KEEPALIVE");
-            close(sock);
+            closesocket(sock);
             return -1;
         }
     }
@@ -1050,7 +1050,7 @@ static int unix_connect_saddr(UnixSocketAddress *saddr, Error **errp)
     return sock;
 
  err:
-    close(sock);
+    closesocket(sock);
     return -1;
 }
 
-- 
2.34.1


