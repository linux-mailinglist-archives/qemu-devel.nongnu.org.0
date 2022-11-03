Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D241618417
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Nov 2022 17:19:57 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oqcwP-0002up-R2; Thu, 03 Nov 2022 12:19:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1oqcuQ-0000m2-Qu; Thu, 03 Nov 2022 12:17:39 -0400
Received: from mout.kundenserver.de ([212.227.126.133])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1oqcuO-00085V-QS; Thu, 03 Nov 2022 12:17:38 -0400
Received: from quad ([82.142.8.70]) by mrelayeu.kundenserver.de (mreue009
 [212.227.15.167]) with ESMTPSA (Nemesis) id 1MqJuN-1pKRgb1fL1-00nRhV; Thu, 03
 Nov 2022 17:17:34 +0100
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Laurent Vivier <laurent@vivier.eu>
Subject: [PULL 10/10] tests/unit: simpler variable sequence for test-io-channel
Date: Thu,  3 Nov 2022 17:17:27 +0100
Message-Id: <20221103161727.4116147-11-laurent@vivier.eu>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20221103161727.4116147-1-laurent@vivier.eu>
References: <20221103161727.4116147-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:c/GXiQlgCQTRKFlS7hWkhPX2gAqA09KgnpcFLaMdH187e47V6oD
 ZGgXEuGej375hBe7kZ/yI309c1Ja/Y/RYCJY/u+Tujg+uRIhCdnwYOmJ5H2S87aE+Xn5prz
 hVx8a6TVtCbnElour7K0zd+el+Y0Fnl5IpNF9OjZ4H9m0C6f+qbitMf3F9iHdIDceJtYcEw
 ITeatCIQzuVOxf22Mtegg==
X-UI-Out-Filterresults: notjunk:1;V03:K0:T4mLWOp+/RY=:qTX80NiRnnUdDHGm9srG3B
 J03kqOKIRKfQwXOM1YLO4STSS8O8OdveKoOmGwxNwMtdLpetBASX2NMPKUg9bmpbj0XI6erkC
 OVYwNadwV1R4N5kGC7yHFAqQs/xVgYCJB0TygROECijucE55pwvgpfY38Bxb9IebR2vRZj85Z
 6IjtXHmwIgvoq9oN79W0XnK8KHjKkJTRINlCN8fi9GvzwikyBrBNpWt9VF2tFo79FTcrcTX9+
 bQsQZX5kRiSLKfcPdMDy1vJAuEw5KZBSgePSUdtYgKIUSMTJpFNksZdYlyJWwBMd/3laHsjjG
 70z9bCK52ZlIfFIZsD/TbJNjMNoCYf8Z329IyO6yYgG4j3SLuYO8n4rOWXx6SAFKEijPO26L8
 NNY8LSKzv6MThA3Cfj8WfioPJQHfztaIUfFC7XOfMtqXwKEBp4El0ZfbURUL65BpQ+cHHEpnH
 dsm62+aqjrphpsh4neVOFTTtQkAp6jZ6/ZRiu/4nRCg2EfDla4XFxMhIWf1YvKbOJl7BP1447
 a3ZKXzhQ6SbT7yJ7cf/3N/z0FZLgMTcQdYBKX3Lkg+jsB0URDz/Q6LPsr98OZ9W3tUdHGzUhM
 1Ob/KplVvBOWHPtwxMKznfajRruIR3/SRFKyKJY6+ymTg6Mj0TRIUoB3pr9EzpzX1MbE0Wyau
 FUzJpPqoDW0yGW2npDZrEAy5cHAceZNmxunJxDVv/j7d5vh9FGzze9TUmhne19wvI5O7p3ndi
 yBc/SBK8EW/gZgOcpfrQWqKTfLWoZelfzbC+H4fSd1DTlQ0eyllgN7NY646Qxkcv3QAS6ghB6
 FS7fQbQ
Received-SPF: none client-ip=212.227.126.133; envelope-from=laurent@vivier.eu;
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


