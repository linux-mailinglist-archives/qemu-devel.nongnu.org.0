Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 23E992B39F1
	for <lists+qemu-devel@lfdr.de>; Sun, 15 Nov 2020 23:38:34 +0100 (CET)
Received: from localhost ([::1]:49420 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1keQfJ-0001OA-5H
	for lists+qemu-devel@lfdr.de; Sun, 15 Nov 2020 17:38:33 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:52986)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1keQUr-0000QI-E7
 for qemu-devel@nongnu.org; Sun, 15 Nov 2020 17:27:46 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:57960)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1keQUn-0001Yv-2G
 for qemu-devel@nongnu.org; Sun, 15 Nov 2020 17:27:45 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1605479259;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=4+w2ArNp2PrP72MUGD7pF5zA08i1iTOBucY2T4SXC6I=;
 b=O6uawHO4z/dcPjGP8jdPAIaPw9mFjhlQn5brEkIF3B+MPaIYAlhXrCKvas1bMvTZnNU438
 N5m4OGzPyfN0Xu/ICkbvXMhl4qCm0m2LN6FgzIHQaoFuutaa4qaMx1gPAXlalzdho7NeJ/
 MhdRcgNQ1kaSvUA7M+dd3dfVb0sAhdI=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-473-_GrPjuX5PCKjcEKsSMofdw-1; Sun, 15 Nov 2020 17:27:37 -0500
X-MC-Unique: _GrPjuX5PCKjcEKsSMofdw-1
Received: by mail-wm1-f72.google.com with SMTP id 8so7774726wmg.6
 for <qemu-devel@nongnu.org>; Sun, 15 Nov 2020 14:27:37 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=4+w2ArNp2PrP72MUGD7pF5zA08i1iTOBucY2T4SXC6I=;
 b=M0y3EkcKwiOrcj9JBa+G0uaHxMMIf9NN29KlyInoIB+5jkcgobSOt9Ri/N2BaL+nP5
 iZiXJ6gRxWo9lDAit+3gH1lLoqtJe9X3GvGrV8dNV4m1hNNg2jB6tvBJA+6p69Ydr5W9
 9OwawX5b6GhczdkQv0e7oF7cvuWxBbLwJaB4UZvA9Wk16Ptu2XidDrumMvI5ue2HIWPy
 dQFDd490+k6ImtwC2M6xCkEnFuYe78KLWaYvT5frGT5puvyyWyfXo/MB8m2FHVRhXy+3
 pIVoQ9BlyuJ/8Qc8ndB1i7W0v+GSMjlJfDkcK5UqZmyQ6FFE+CoVRStgYfWxkK8s4Y2M
 ewcw==
X-Gm-Message-State: AOAM531SvAr3/CaRGPx8qmCZEMAZ5EMbOUEQSBDEUs65yBRiZSfHVFKe
 r/xvMq+ihiGxlxiKJ1K6iUe2UO6AdNa9IwM+1vn0zrDJjHF8z3oBtFPBrvIk6OSAUNAZ0VN4Wj9
 TLj8ERYVjCZGybuhpjCatR2GdSutBrB/sdkncNvfJs6oJ2KJk1jbM1JDKlw0w
X-Received: by 2002:adf:fec6:: with SMTP id q6mr16205988wrs.168.1605479256148; 
 Sun, 15 Nov 2020 14:27:36 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxcBn6Agy7lvOTzZeTkZt0jSJaWxalUhhg6qUG+vhF7I0pVs+MUCMDglOebxMO/tLOPMbaPYg==
X-Received: by 2002:adf:fec6:: with SMTP id q6mr16205972wrs.168.1605479255928; 
 Sun, 15 Nov 2020 14:27:35 -0800 (PST)
Received: from redhat.com (bzq-79-176-118-93.red.bezeqint.net. [79.176.118.93])
 by smtp.gmail.com with ESMTPSA id e5sm18480404wrs.84.2020.11.15.14.27.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 15 Nov 2020 14:27:35 -0800 (PST)
Date: Sun, 15 Nov 2020 17:27:33 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 09/17] vhost-user-blk-test: rename destroy_drive() to
 destroy_file()
Message-ID: <20201115220740.488850-10-mst@redhat.com>
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

The function is used not just for image files but also for UNIX domain
sockets (QMP monitor and vhost-user-blk). Reflect that in the name.

Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
Message-Id: <20201111124331.1393747-5-stefanha@redhat.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 tests/qtest/vhost-user-blk-test.c | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/tests/qtest/vhost-user-blk-test.c b/tests/qtest/vhost-user-blk-test.c
index 31f2335f97..f05f14c192 100644
--- a/tests/qtest/vhost-user-blk-test.c
+++ b/tests/qtest/vhost-user-blk-test.c
@@ -658,7 +658,8 @@ static const char *qtest_qemu_storage_daemon_binary(void)
     return qemu_storage_daemon_bin;
 }
 
-static void drive_destroy(void *path)
+/* g_test_queue_destroy() cleanup function for files */
+static void destroy_file(void *path)
 {
     unlink(path);
     g_free(path);
@@ -678,7 +679,7 @@ static char *drive_create(void)
     g_assert_cmpint(ret, ==, 0);
     close(fd);
 
-    g_test_queue_destroy(drive_destroy, t_path);
+    g_test_queue_destroy(destroy_file, t_path);
     return t_path;
 }
 
@@ -717,7 +718,7 @@ static char *start_vhost_user_blk(GString *cmd_line, int vus_instances,
 
     qmp_fd = mkstemp(qmp_sock_path);
     g_assert_cmpint(qmp_fd, >=, 0);
-    g_test_queue_destroy(drive_destroy, qmp_sock_path);
+    g_test_queue_destroy(destroy_file, qmp_sock_path);
 
     g_string_append_printf(storage_daemon_command,
             "exec %s "
@@ -731,7 +732,7 @@ static char *start_vhost_user_blk(GString *cmd_line, int vus_instances,
         sock_path = g_strdup(sock_path_tempate);
         fd = mkstemp(sock_path);
         g_assert_cmpint(fd, >=, 0);
-        g_test_queue_destroy(drive_destroy, sock_path);
+        g_test_queue_destroy(drive_file, sock_path);
         /* create image file */
         img_path = drive_create();
         g_string_append_printf(storage_daemon_command,
-- 
MST


