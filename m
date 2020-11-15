Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 146652B39E1
	for <lists+qemu-devel@lfdr.de>; Sun, 15 Nov 2020 23:29:38 +0100 (CET)
Received: from localhost ([::1]:60318 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1keQWf-00029L-3n
	for lists+qemu-devel@lfdr.de; Sun, 15 Nov 2020 17:29:37 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:52974)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1keQUn-0000No-C1
 for qemu-devel@nongnu.org; Sun, 15 Nov 2020 17:27:41 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:46905)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1keQUj-0001Yj-7P
 for qemu-devel@nongnu.org; Sun, 15 Nov 2020 17:27:41 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1605479256;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=It/XdS4d9zKSvjqJB30A2ix7VujguCEuPG80WbLkr+Y=;
 b=V+CgqreJVcn1bRp2pjVmhOAR3NHBGJmkB7z7DISOHHSs/RT3/mXMVklhB078aMLEB7WhS3
 8+ub7LzqNf9LBeF6rh8zS78pVJLYohMoIkNDLItmipRQh8lzpKgo509BRjf/HHBF6MuULi
 U0w5CkGpFHYurXh6XsKNUNCfHf+eu9s=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-569-IIfDG8tTNnGkgjGOSJUhhA-1; Sun, 15 Nov 2020 17:27:34 -0500
X-MC-Unique: IIfDG8tTNnGkgjGOSJUhhA-1
Received: by mail-wr1-f69.google.com with SMTP id h11so9778911wrq.20
 for <qemu-devel@nongnu.org>; Sun, 15 Nov 2020 14:27:34 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=It/XdS4d9zKSvjqJB30A2ix7VujguCEuPG80WbLkr+Y=;
 b=l2D8uGYYr/MbY0tIAMoZLDwCGY0Ix6h7ltD4Zc8iVBu5T3LXnHdns8OywF5Z1KkaAe
 /ws857c43Fbz4BPk90gnKtfz8TSD1x3J5MrTogJ2NYCJ/J+MrPa2Cmcc0thPHlkICvfv
 46vAawmR5JTmuUMijiu1LawAqJxLhlZtgIew4y4ht+GcLt/HN2k2jBd/wtypZC17SfL1
 XIkSAsgp8Y2RVohjWwCymMa7R1maoC2Hwy1tl1yNuRQGibaNpLswgbNMlPjU5cXJWUeN
 Zndp2xkv4lKfPYCzYJ/lhdjpTMOE8H+WiKMy6UQd2BvuQctKpqvBFcHN1cucJCJQgKY4
 dvcA==
X-Gm-Message-State: AOAM533kWGHpSx9T7bzPjbZ3dBC9PIcQBtMwxjAzx0hohc7kRuqRuoRQ
 IaZ00IfRRMOWvz95zwgtJdwhWrvi7PTo8T6L/kXoyEmLZJ8Y0tATN22t2vgfZxgreAk6Y/4TjXX
 JAFTpEhbBMn5GqJ6nPKIk20IehBSZ0zBIPHa9HsRujWZ6AwiBBPkISBtpUjAc
X-Received: by 2002:a5d:4e46:: with SMTP id r6mr15862343wrt.218.1605479253413; 
 Sun, 15 Nov 2020 14:27:33 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwvM5iSh1i+Pga6+bpRn/yhF08GgnnUNQl489H1cP51V7usAPCG8kCfhoCioE148oU2HWBlDQ==
X-Received: by 2002:a5d:4e46:: with SMTP id r6mr15862331wrt.218.1605479253184; 
 Sun, 15 Nov 2020 14:27:33 -0800 (PST)
Received: from redhat.com (bzq-79-176-118-93.red.bezeqint.net. [79.176.118.93])
 by smtp.gmail.com with ESMTPSA id t74sm17809883wmt.8.2020.11.15.14.27.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 15 Nov 2020 14:27:32 -0800 (PST)
Date: Sun, 15 Nov 2020 17:27:30 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 08/17] libqtest: add qtest_socket_server()
Message-ID: <20201115220740.488850-9-mst@redhat.com>
References: <20201115220740.488850-1-mst@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20201115220740.488850-1-mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/15 16:39:49
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
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
Cc: Laurent Vivier <lvivier@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Stefan Hajnoczi <stefanha@redhat.com>

There is a qtest_socket_client() API. Add an equivalent
qtest_socket_server() API that returns a new UNIX domain socket in the
listen state. The code for this was already there but only used
internally in init_socket().

Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
Message-Id: <20201111124331.1393747-4-stefanha@redhat.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 tests/qtest/libqos/libqtest.h |  8 +++++++
 tests/qtest/libqtest.c        | 40 ++++++++++++++++++++---------------
 2 files changed, 31 insertions(+), 17 deletions(-)

diff --git a/tests/qtest/libqos/libqtest.h b/tests/qtest/libqos/libqtest.h
index d6236ea7a0..8792c09398 100644
--- a/tests/qtest/libqos/libqtest.h
+++ b/tests/qtest/libqos/libqtest.h
@@ -132,6 +132,14 @@ void qtest_qmp_send(QTestState *s, const char *fmt, ...)
 void qtest_qmp_send_raw(QTestState *s, const char *fmt, ...)
     GCC_FMT_ATTR(2, 3);
 
+/**
+ * qtest_socket_server:
+ * @socket_path: the UNIX domain socket path
+ *
+ * Create and return a listen socket file descriptor, or abort on failure.
+ */
+int qtest_socket_server(const char *socket_path);
+
 /**
  * qtest_socket_client:
  * @server_socket_path: the socket server's path
diff --git a/tests/qtest/libqtest.c b/tests/qtest/libqtest.c
index ff563cbaba..50a30f8e1f 100644
--- a/tests/qtest/libqtest.c
+++ b/tests/qtest/libqtest.c
@@ -82,24 +82,8 @@ static void qtest_client_set_rx_handler(QTestState *s, QTestRecvFn recv);
 
 static int init_socket(const char *socket_path)
 {
-    struct sockaddr_un addr;
-    int sock;
-    int ret;
-
-    sock = socket(PF_UNIX, SOCK_STREAM, 0);
-    g_assert_cmpint(sock, !=, -1);
-
-    addr.sun_family = AF_UNIX;
-    snprintf(addr.sun_path, sizeof(addr.sun_path), "%s", socket_path);
+    int sock = qtest_socket_server(socket_path);
     qemu_set_cloexec(sock);
-
-    do {
-        ret = bind(sock, (struct sockaddr *)&addr, sizeof(addr));
-    } while (ret == -1 && errno == EINTR);
-    g_assert_cmpint(ret, !=, -1);
-    ret = listen(sock, 1);
-    g_assert_cmpint(ret, !=, -1);
-
     return sock;
 }
 
@@ -643,6 +627,28 @@ QTestState *qtest_create_state_with_qmp_fd(int fd)
     return qmp_test_state;
 }
 
+int qtest_socket_server(const char *socket_path)
+{
+    struct sockaddr_un addr;
+    int sock;
+    int ret;
+
+    sock = socket(PF_UNIX, SOCK_STREAM, 0);
+    g_assert_cmpint(sock, !=, -1);
+
+    addr.sun_family = AF_UNIX;
+    snprintf(addr.sun_path, sizeof(addr.sun_path), "%s", socket_path);
+
+    do {
+        ret = bind(sock, (struct sockaddr *)&addr, sizeof(addr));
+    } while (ret == -1 && errno == EINTR);
+    g_assert_cmpint(ret, !=, -1);
+    ret = listen(sock, 1);
+    g_assert_cmpint(ret, !=, -1);
+
+    return sock;
+}
+
 int qtest_socket_client(char *server_socket_path)
 {
     struct sockaddr_un serv_addr;
-- 
MST


