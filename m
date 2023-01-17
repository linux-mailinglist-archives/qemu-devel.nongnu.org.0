Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CC36466D796
	for <lists+qemu-devel@lfdr.de>; Tue, 17 Jan 2023 09:09:46 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pHh1H-0002pS-Ul; Tue, 17 Jan 2023 03:08:35 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1pHh0g-0002nw-Ir
 for qemu-devel@nongnu.org; Tue, 17 Jan 2023 03:07:58 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1pHh0e-0000Rt-Dq
 for qemu-devel@nongnu.org; Tue, 17 Jan 2023 03:07:58 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1673942875;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=4Nf/qoa+K7HjuYdhLWL8wXyrH53Imqw+8MLAETNKXus=;
 b=IVxZAatXCiy9b19fH5pwgfVyLHpJQeY4vjuggmZsXGlBoJdhshS4K61Dru/GBHLNCp27Yq
 gXv1uI5TJgRuqJSBhdnMZ0eNEHuf7ytncwvu0Bxcxj4hwi9d6BDPZ7zTw2dRBAbf4sV64d
 oT7MCLuZW0RuruVvD8sl5FdIgArnnI4=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-489-UylCSCe7NxSnwAOpNjEp8g-1; Tue, 17 Jan 2023 03:07:54 -0500
X-MC-Unique: UylCSCe7NxSnwAOpNjEp8g-1
Received: by mail-ed1-f72.google.com with SMTP id
 w18-20020a05640234d200b0048cc3aa4993so20557824edc.7
 for <qemu-devel@nongnu.org>; Tue, 17 Jan 2023 00:07:54 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=4Nf/qoa+K7HjuYdhLWL8wXyrH53Imqw+8MLAETNKXus=;
 b=5Kfja4N44xe2scRuDEH24VA4bjP+Hrly2BHV5f0aP6Dmwu2iiOpK2U9nfaMXeRYWW7
 S3vsfS9sWDhKhLj7QlK7QHwcTk/uSxJZMx1dYJDnqcN3+ZrCdxH9XYoz+TIHySNjHWEz
 jtL9pELNihjV7BhjJ7FlDqgfGy1ApThbwB2CORdJ2wDj1ynTn7DMh6Wljd0gNCOQMyU+
 XpZ50HIN0+mrwJf8gF/auFIjlvfA3Qi8Nb0J8gziTlI82Q6InKuhlqbyzbJVA/1UJ5aE
 Y21OyBEj0p9zFbi4u270uh/Kw1QqpYCh4u05jQXaP6ti3csQ+0IDeI79OFuvDe+l3mFY
 +9dQ==
X-Gm-Message-State: AFqh2ko2DIypg0Rxa7J02qCzPAFCc+hoy0aTRZpHTbNL23ZAE2QvIFk6
 unYbgbMQVn7HzeBgKmOZJ3ptuR19UaZUZ4pB4RK7CBGucMAJhr6WgEesxJTpaPe/Jes2EMEx08B
 pWC+pT6AWBMorGyUZwubT2GnoJtatqBj6OqMESF+CvG+aooembK5BK7yFVnjHNR26bUU=
X-Received: by 2002:a17:906:57da:b0:872:5222:9024 with SMTP id
 u26-20020a17090657da00b0087252229024mr1758248ejr.67.1673942873073; 
 Tue, 17 Jan 2023 00:07:53 -0800 (PST)
X-Google-Smtp-Source: AMrXdXsiViovqGnWGXtQdPJq3BZ5P3rhpuU0XXf53cjHSRMh0qG+Vt/PiBMxV+NAnYx4QgyqX1Vv7w==
X-Received: by 2002:a17:906:57da:b0:872:5222:9024 with SMTP id
 u26-20020a17090657da00b0087252229024mr1758229ejr.67.1673942872734; 
 Tue, 17 Jan 2023 00:07:52 -0800 (PST)
Received: from avogadro.local ([2001:b07:6468:f312:5e2c:eb9a:a8b6:fd3e])
 by smtp.gmail.com with ESMTPSA id
 p5-20020a17090653c500b007ae32daf4b9sm12834223ejo.106.2023.01.17.00.07.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 17 Jan 2023 00:07:52 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: thuth@redhat.com
Subject: [PATCH 2/4] libqtest: split qtest_spawn_qemu function
Date: Tue, 17 Jan 2023 09:07:43 +0100
Message-Id: <20230117080745.43247-3-pbonzini@redhat.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230117080745.43247-1-pbonzini@redhat.com>
References: <20230117080745.43247-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

In order to create a function that allows testing of invalid command
lines, extract the parts of qtest_init_without_qmp_handshake that do
not require any successful set up of sockets.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 tests/qtest/libqtest.c | 103 ++++++++++++++++++++++-------------------
 1 file changed, 55 insertions(+), 48 deletions(-)

diff --git a/tests/qtest/libqtest.c b/tests/qtest/libqtest.c
index 5cb38f90da19..4d9cf919b2f7 100644
--- a/tests/qtest/libqtest.c
+++ b/tests/qtest/libqtest.c
@@ -342,60 +342,25 @@ static pid_t qtest_create_process(char *cmd)
 }
 #endif /* _WIN32 */
 
-QTestState *qtest_init_without_qmp_handshake(const char *extra_args)
+static QTestState *G_GNUC_PRINTF(1, 0) qtest_spawn_qemu(const char *fmt, ...)
 {
-    QTestState *s;
-    int sock, qmpsock, i;
-    gchar *socket_path;
-    gchar *qmp_socket_path;
-    gchar *command;
-    const char *qemu_binary = qtest_qemu_binary();
+    va_list ap;
+    QTestState *s = g_new0(QTestState, 1);
     const char *trace = g_getenv("QTEST_TRACE");
     g_autofree char *tracearg = trace ?
         g_strdup_printf("-trace %s ", trace) : g_strdup("");
+    g_autoptr(GString) command = g_string_new("");
 
-    s = g_new(QTestState, 1);
-
-    socket_path = g_strdup_printf("%s/qtest-%d.sock",
-                                  g_get_tmp_dir(), getpid());
-    qmp_socket_path = g_strdup_printf("%s/qtest-%d.qmp",
-                                      g_get_tmp_dir(), getpid());
-
-    /* It's possible that if an earlier test run crashed it might
-     * have left a stale unix socket lying around. Delete any
-     * stale old socket to avoid spurious test failures with
-     * tests/libqtest.c:70:init_socket: assertion failed (ret != -1): (-1 != -1)
-     */
-    unlink(socket_path);
-    unlink(qmp_socket_path);
-
-    socket_init();
-    sock = init_socket(socket_path);
-    qmpsock = init_socket(qmp_socket_path);
-
-    qtest_client_set_rx_handler(s, qtest_client_socket_recv_line);
-    qtest_client_set_tx_handler(s, qtest_client_socket_send);
+    va_start(ap, fmt);
+    g_string_append_printf(command, CMD_EXEC "%s %s",
+                           qtest_qemu_binary(), tracearg);
+    g_string_append_vprintf(command, fmt, ap);
+    va_end(ap);
 
     qtest_add_abrt_handler(kill_qemu_hook_func, s);
 
-    command = g_strdup_printf(CMD_EXEC "%s %s"
-                              "-qtest unix:%s "
-                              "-qtest-log %s "
-                              "-chardev socket,path=%s,id=char0 "
-                              "-mon chardev=char0,mode=control "
-                              "-display none "
-                              "%s"
-                              " -accel qtest",
-                              qemu_binary, tracearg, socket_path,
-                              getenv("QTEST_LOG") ? DEV_STDERR : DEV_NULL,
-                              qmp_socket_path,
-                              extra_args ?: "");
+    g_test_message("starting QEMU: %s", command->str);
 
-    g_test_message("starting QEMU: %s", command);
-
-    s->pending_events = NULL;
-    s->wstatus = 0;
-    s->expected_status = 0;
 #ifndef _WIN32
     s->qemu_pid = fork();
     if (s->qemu_pid == 0) {
@@ -416,14 +381,56 @@ QTestState *qtest_init_without_qmp_handshake(const char *extra_args)
         if (!g_setenv("QEMU_AUDIO_DRV", "none", true)) {
             exit(1);
         }
-        execlp("/bin/sh", "sh", "-c", command, NULL);
+        execlp("/bin/sh", "sh", "-c", command->str, NULL);
         exit(1);
     }
 #else
-    s->qemu_pid = qtest_create_process(command);
+    s->qemu_pid = qtest_create_process(command->str);
 #endif /* _WIN32 */
 
-    g_free(command);
+    return s;
+}
+
+QTestState *qtest_init_without_qmp_handshake(const char *extra_args)
+{
+    QTestState *s;
+    int sock, qmpsock, i;
+    gchar *socket_path;
+    gchar *qmp_socket_path;
+
+    socket_path = g_strdup_printf("%s/qtest-%d.sock",
+                                  g_get_tmp_dir(), getpid());
+    qmp_socket_path = g_strdup_printf("%s/qtest-%d.qmp",
+                                      g_get_tmp_dir(), getpid());
+
+    /*
+     * It's possible that if an earlier test run crashed it might
+     * have left a stale unix socket lying around. Delete any
+     * stale old socket to avoid spurious test failures with
+     * tests/libqtest.c:70:init_socket: assertion failed (ret != -1): (-1 != -1)
+     */
+    unlink(socket_path);
+    unlink(qmp_socket_path);
+
+    socket_init();
+    sock = init_socket(socket_path);
+    qmpsock = init_socket(qmp_socket_path);
+
+    s = qtest_spawn_qemu("-qtest unix:%s "
+                         "-qtest-log %s "
+                         "-chardev socket,path=%s,id=char0 "
+                         "-mon chardev=char0,mode=control "
+                         "-display none "
+                         "%s"
+                         " -accel qtest",
+                         socket_path,
+                         getenv("QTEST_LOG") ? DEV_STDERR : DEV_NULL,
+                         qmp_socket_path,
+                         extra_args ?: "");
+
+    qtest_client_set_rx_handler(s, qtest_client_socket_recv_line);
+    qtest_client_set_tx_handler(s, qtest_client_socket_send);
+
     s->fd = socket_accept(sock);
     if (s->fd >= 0) {
         s->qmp_fd = socket_accept(qmpsock);
-- 
2.38.1


