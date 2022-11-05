Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E37F61DDEB
	for <lists+qemu-devel@lfdr.de>; Sat,  5 Nov 2022 20:54:18 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1orPDc-0008EF-BK; Sat, 05 Nov 2022 15:52:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1orPDZ-0008Bg-Ir; Sat, 05 Nov 2022 15:52:37 -0400
Received: from mout.kundenserver.de ([212.227.17.10])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1orPDX-0003aD-Tt; Sat, 05 Nov 2022 15:52:37 -0400
Received: from quad ([82.142.8.70]) by mrelayeu.kundenserver.de (mreue107
 [212.227.15.183]) with ESMTPSA (Nemesis) id 1Mrggc-1pKuYf323A-00niqp; Sat, 05
 Nov 2022 20:52:33 +0100
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Laurent Vivier <laurent@vivier.eu>
Subject: [PULL 7/7] tests/unit: simpler variable sequence for test-io-channel
Date: Sat,  5 Nov 2022 20:52:27 +0100
Message-Id: <20221105195227.354769-8-laurent@vivier.eu>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20221105195227.354769-1-laurent@vivier.eu>
References: <20221105195227.354769-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:idn9M6w809Wg0kzBDRVKIgdKyAQZl8yRNnohGPOT3bZ8wB2D+Tj
 59UHgvUOKM1J99pNc7Jft31BH0W584DHj4A1OhIHktv/9ZichgK3/NlVlE18d/LihG1iEHu
 wnI47fZTP/vSf1iOByTurVGxfqLz3kK/KMES15S3tiykv8/annIApX/iwqxSgfabytFqJYL
 bGcBlbOq1S75nMfOZEAZA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:pdIXSVdsuio=:HfKm1WmNnl4jFUYsHPF+1w
 LpS6eNISJg7qhj8o8W55RTiSt3kVaUg4025Ii63CpJtdr/IZhYCEPfAQeNm0iBBJcIweOK/4C
 J9f6Hoknr24yl668j1RJHQ9FpqSBLDyv8ckHQ2ToCiaeyuw8NGc4Z/JdokKkZGu+PBYKkWdzs
 t7s8VA1C2Eksy1GCc7b10eW0a8JK/8E8cQVPZe+CxAYtkqqTbWyhGmxfHgX74s52iex8SCmqE
 J5ivpV1StuASh9HmyVH/pm7YOOBnLQGe+Keo53oGoTCZMixyaUGYqUAeloLv65t09yyHmMk6i
 OV04LRrVYhaljGgFV2Shg/7kv0WXyIwmZTsRUYDtcckcPFvmgMik4jQ1okD1eu5L2K/zTKTCW
 4E4ZTxCXHXAWKu6bpfZnYmUt61BAl7aquxpwpoENiVUoeOj3XYxueSuNfiUdLJMRbVAINBLGn
 3q5lLLHxpDUYpfK6CM/lOQvfrnan2f8q6cs2p/gsn5qS1trfZsFu6Ve78C6A2XM6NLx8JrHht
 ulavEWCTmJS7sg3KxgjfsWmgLXn8ommlJE81MVZbeHnL/NXY+RLFb3mFYT0yjaLY92XoywAiO
 oRV78bGv2SO8gNxsDQmI4jKXmy/7NvS22Z10gT+vqE6Yi07HOSwdXQlKgBevTv5i+uhT+iiHn
 OKp7aNmEZta222iLwbN/Yhm+Bl2uZKkk22LLAWoH/puGOu8zE+RKSh57UQnFMuGNMShxruZbw
 PvlMxiuv1pRq7fI1dWcwIbiO4mfxxLpNJoxxRTE1S+dNe+PGfbeDw2oQpoAlW9/4dwsBoqtMK
 i80+zr0
Received-SPF: none client-ip=212.227.17.10; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

From: Alex Bennée <alex.bennee@linaro.org>

This avoids some compilers complaining about a potentially
un-initialised [src|dst]argv. In retrospect using GString was overkill
for what we are constructing.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Laurent Vivier <laurent@vivier.eu>
Message-Id: <20221103102329.2581508-1-alex.bennee@linaro.org>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 tests/unit/test-io-channel-command.c | 14 ++++----------
 1 file changed, 4 insertions(+), 10 deletions(-)

diff --git a/tests/unit/test-io-channel-command.c b/tests/unit/test-io-channel-command.c
index 43e29c8cfbf4..19f72eab961d 100644
--- a/tests/unit/test-io-channel-command.c
+++ b/tests/unit/test-io-channel-command.c
@@ -33,19 +33,13 @@ static void test_io_channel_command_fifo(bool async)
 {
     g_autofree gchar *tmpdir = g_dir_make_tmp("qemu-test-io-channel.XXXXXX", NULL);
     g_autofree gchar *fifo = g_strdup_printf("%s/%s", tmpdir, TEST_FIFO);
-    g_autoptr(GString) srcargs = g_string_new(socat);
-    g_autoptr(GString) dstargs = g_string_new(socat);
-    g_auto(GStrv) srcargv;
-    g_auto(GStrv) dstargv;
+    g_autofree gchar *srcargs = g_strdup_printf("%s - PIPE:%s,wronly", socat, fifo);
+    g_autofree gchar *dstargs = g_strdup_printf("%s PIPE:%s,rdonly -", socat, fifo);
+    g_auto(GStrv) srcargv = g_strsplit(srcargs, " ", -1);
+    g_auto(GStrv) dstargv = g_strsplit(dstargs, " ", -1);
     QIOChannel *src, *dst;
     QIOChannelTest *test;
 
-    g_string_append_printf(srcargs, " - PIPE:%s,wronly", fifo);
-    g_string_append_printf(dstargs, " PIPE:%s,rdonly -", fifo);
-
-    srcargv = g_strsplit(srcargs->str, " ", -1);
-    dstargv = g_strsplit(dstargs->str, " ", -1);
-
     src = QIO_CHANNEL(qio_channel_command_new_spawn((const char **) srcargv,
                                                     O_WRONLY,
                                                     &error_abort));
-- 
2.37.3


