Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 43DD05E9308
	for <lists+qemu-devel@lfdr.de>; Sun, 25 Sep 2022 14:21:52 +0200 (CEST)
Received: from localhost ([::1]:33682 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ocQdr-0002cy-AK
	for lists+qemu-devel@lfdr.de; Sun, 25 Sep 2022 08:21:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56626)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1ocPsK-0003e5-Bj
 for qemu-devel@nongnu.org; Sun, 25 Sep 2022 07:32:44 -0400
Received: from mail-pf1-x435.google.com ([2607:f8b0:4864:20::435]:44811)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1ocPsI-0006UY-Qn
 for qemu-devel@nongnu.org; Sun, 25 Sep 2022 07:32:44 -0400
Received: by mail-pf1-x435.google.com with SMTP id v186so4155010pfv.11
 for <qemu-devel@nongnu.org>; Sun, 25 Sep 2022 04:32:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=0TjyjmagWil3MltuTF+3LjPFTwhOERwy0g28RMKJdOI=;
 b=nhZBHOeN1xd8kMcx7wpmo7uQ8IGD2Wf32D8BF4BsAmvMNHojPaaw4d2f8VCKIM6WRs
 VXNlqFfpfIapimaOQB2DiEoLy/BswhkfxRMSsueDJkBcfxA99zyvMjCVypH+rrgwp5r0
 8JPthJ0GAmxuqrkIf7Y6FRwXhXc76Gw8+rA5EMxxJzWMrPx+f6mLlp2dQjoAk0baT54a
 bMZBm164H0Fpz+CaqDqMhJd4ZmgOW9vSzrXbQFeAX2guacNvZrdYp9o+HroJw1zr7qti
 2HQQ8yLImkzivRrVWJiaNJAgF4QCIyxaMrJTqc4BamsVVBlAMoYHSWFixF1nsIlgUckA
 5Gfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=0TjyjmagWil3MltuTF+3LjPFTwhOERwy0g28RMKJdOI=;
 b=2S+TsvFjnCNFE7kPiDfNe9FJSTs2v/ZsKrgB6Ebco75yfi6WqatV5lmEbRQOqYNMv3
 iWLuxvNO551mhUHoDhAhQEoe0BzMk0IK0F39MGsalpj+Lf0TC+FY+aJNl34dVr9XU6zL
 eVXu+ia4747gjPGhcYB8YarE/MUyqMdLCdN3vC1Px7QjWL/rMeezGEC+CmgTWH1YhoYT
 7euzUiDMIth0BsXB0OXuR+wo5F2CdLB+OFSggE/08LRiWa5BS/+CIypoEhNTM0UbfZsl
 Sa/Bl2gZWPspqj/BTbGr59386lBAzNnFEYAvb+YdQFSIZlFrG2nr5fLPATWOWN7nKlTv
 viKQ==
X-Gm-Message-State: ACrzQf3ykEjYWKbuvkI8/EoXI8OaZfqZH3epx4I2EqmI6WN2+WGs0+2a
 yJrSXYDmSOnqIzT0vhcENJNW8nD60ug=
X-Google-Smtp-Source: AMsMyM6+3QjmY4Kf6hTuo0xwKAB1GvxZ3TYSGfpBeRKmE5FiisqW+EIyIWrOP0SRKyOZ+XC8DOV/Xw==
X-Received: by 2002:a63:141:0:b0:43a:3851:b2ba with SMTP id
 62-20020a630141000000b0043a3851b2bamr16035199pgb.90.1664105560155; 
 Sun, 25 Sep 2022 04:32:40 -0700 (PDT)
Received: from ubuntu.. (144.168.56.201.16clouds.com. [144.168.56.201])
 by smtp.gmail.com with ESMTPSA id
 z4-20020a1709027e8400b00176c6738d13sm9187760pla.169.2022.09.25.04.32.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 25 Sep 2022 04:32:39 -0700 (PDT)
From: Bin Meng <bmeng.cn@gmail.com>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Bin Meng <bin.meng@windriver.com>, Laurent Vivier <lvivier@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Thomas Huth <thuth@redhat.com>
Subject: [PATCH v3 46/54] tests/qtest: libqtest: Correct the timeout unit of
 blocking receive calls for win32
Date: Sun, 25 Sep 2022 19:30:24 +0800
Message-Id: <20220925113032.1949844-47-bmeng.cn@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220925113032.1949844-1-bmeng.cn@gmail.com>
References: <20220925113032.1949844-1-bmeng.cn@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::435;
 envelope-from=bmeng.cn@gmail.com; helo=mail-pf1-x435.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

Some qtest cases don't get response from the QEMU executable under
test in time on Windows. It turns out that the socket receive call
got timeout before it receive the complete response.

The timeout value is supposed to be set to 50 seconds via the
setsockopt() call, but there is a difference among platforms.
The timeout unit of blocking receive calls is measured in
seconds on non-Windows platforms but milliseconds on Windows.

Signed-off-by: Bin Meng <bin.meng@windriver.com>
Reviewed-by: Marc-André Lureau <marcandre.lureau@redhat.com>
---

(no changes since v1)

 tests/qtest/libqtest.c | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/tests/qtest/libqtest.c b/tests/qtest/libqtest.c
index 1ae58624d9..e3360338de 100644
--- a/tests/qtest/libqtest.c
+++ b/tests/qtest/libqtest.c
@@ -36,13 +36,14 @@
 #include "qapi/qmp/qstring.h"
 
 #define MAX_IRQ 256
-#define SOCKET_TIMEOUT 50
 
 #ifndef _WIN32
+# define SOCKET_TIMEOUT 50
 # define CMD_EXEC   "exec "
 # define DEV_STDERR "/dev/fd/2"
 # define DEV_NULL   "/dev/null"
 #else
+# define SOCKET_TIMEOUT 50000
 # define CMD_EXEC   ""
 # define DEV_STDERR "2"
 # define DEV_NULL   "nul"
@@ -106,8 +107,16 @@ static int socket_accept(int sock)
     struct sockaddr_un addr;
     socklen_t addrlen;
     int ret;
+    /*
+     * timeout unit of blocking receive calls is different among platfoms.
+     * It's in seconds on non-Windows platforms but milliseconds on Windows.
+     */
+#ifndef _WIN32
     struct timeval timeout = { .tv_sec = SOCKET_TIMEOUT,
                                .tv_usec = 0 };
+#else
+    DWORD timeout = SOCKET_TIMEOUT;
+#endif
 
     if (setsockopt(sock, SOL_SOCKET, SO_RCVTIMEO,
                    (void *)&timeout, sizeof(timeout))) {
-- 
2.34.1


