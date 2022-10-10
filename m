Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E3E05FA311
	for <lists+qemu-devel@lfdr.de>; Mon, 10 Oct 2022 19:59:29 +0200 (CEST)
Received: from localhost ([::1]:46168 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ohx3o-00047o-J2
	for lists+qemu-devel@lfdr.de; Mon, 10 Oct 2022 13:59:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43008)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1ohwb9-0001Ys-Vo
 for qemu-devel@nongnu.org; Mon, 10 Oct 2022 13:29:51 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:60138)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1ohwb0-0006b5-Ag
 for qemu-devel@nongnu.org; Mon, 10 Oct 2022 13:29:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1665422981;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=7npCfBPJ3SU6f/b3cEDN5Cf+Lw7VA1jtIVngNbIXD3s=;
 b=DkOFXOGLhGjKPS7FJLoVRtnf16aeARBM/W3VTy7opniRB1PYCX4US/Ji+YnvJ4S/O3IXHY
 YaQMkS8vfCls8jbmF9ZCA29NXX4k0u95zD/ZVwX33WyDxLesoCGIWpDayZusgwtz5GwaPx
 89Tjn/BGWGqVMQrGCWYm+icbQxeF5SU=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-471-4TC5cJ_xNJaDYz2lcjLRGA-1; Mon, 10 Oct 2022 13:29:40 -0400
X-MC-Unique: 4TC5cJ_xNJaDYz2lcjLRGA-1
Received: by mail-wm1-f70.google.com with SMTP id
 f26-20020a7bcc1a000000b003c03db14864so3261411wmh.6
 for <qemu-devel@nongnu.org>; Mon, 10 Oct 2022 10:29:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=7npCfBPJ3SU6f/b3cEDN5Cf+Lw7VA1jtIVngNbIXD3s=;
 b=78Fo7r06OJHlTj/2fLihdFSwYSsDb6/sUWo5mXi+L4zGQr6J2BY6BvaFx+RA3xd3wU
 nc0ECxTRk6GY4IW5FvTcKgl+BoQvGxS4hnxCMy/D7wVlik8XpGgndjjZIz9ExYde3jZa
 /EUGMaTPU2i7cKx4ZqY2VMkZDfxJWnrKzvi/e8aoiZQisdVEHhS+K4p6PaOhfmaP0JCl
 9serqI6a9zGq4K91DTiqFfjUkv1qDID57eOMFYmuy/weSRiWrL9lA6Lzx2vLI/mvk3Yr
 3kGJU6upVJu+5bTqyc/JnYRwnEfFRWVUAdZ7t1NFWTrgUagqKTArZmanec2hwdK5WqeN
 ykfA==
X-Gm-Message-State: ACrzQf1j9Cjim3zhrxj/DYh9gXJHpaX7I9Rck7TU9qkrKRefgzcizCom
 gilFFXW6Gyy8oNS52KM/5+sfEXVwiKD1zWED97oOwGQ5IQaD1vGLITM47jPkJOTJKkUR+QWamVn
 1rAptoQ1A2UyEtlW8o7aSuSqVjYlwhD0RbxjYXLtVmoYAwOiUF5ubxoiiUAss
X-Received: by 2002:adf:d1ec:0:b0:22e:3341:a8cb with SMTP id
 g12-20020adfd1ec000000b0022e3341a8cbmr11952006wrd.151.1665422978932; 
 Mon, 10 Oct 2022 10:29:38 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM4wqqVUCk9+Hi+zHaBbJw5rdEzajJJk0uL6fkhqMZe6r5B4PtuMbpmFhS3beZUvRqRbE0Fb+A==
X-Received: by 2002:adf:d1ec:0:b0:22e:3341:a8cb with SMTP id
 g12-20020adfd1ec000000b0022e3341a8cbmr11951984wrd.151.1665422978556; 
 Mon, 10 Oct 2022 10:29:38 -0700 (PDT)
Received: from redhat.com ([2.55.183.131]) by smtp.gmail.com with ESMTPSA id
 u16-20020adfdd50000000b002238ea5750csm11850269wrm.72.2022.10.10.10.29.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 10 Oct 2022 10:29:38 -0700 (PDT)
Date: Mon, 10 Oct 2022 13:29:34 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Thomas Huth <thuth@redhat.com>, Laurent Vivier <lvivier@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Subject: [PULL 13/55] tests/qtest: use qos_printf instead of g_test_message
Message-ID: <20221010172813.204597-14-mst@redhat.com>
References: <20221010172813.204597-1-mst@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20221010172813.204597-1-mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9, DKIM_INVALID=0.1,
 DKIM_SIGNED=0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_PASS=-0.001,
 T_SPF_HELO_TEMPERROR=0.01 autolearn=no autolearn_force=no
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

From: Alex Bennée <alex.bennee@linaro.org>

The vhost-user tests respawn qos-test as a standalone process. As a
result the gtester framework squashes all messages coming out of it
which make it hard to debug. As the test does not care about asserting
certain messages just convert the tests to use the direct qos_printf.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Message-Id: <20220802095010.3330793-17-alex.bennee@linaro.org>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 tests/qtest/qos-test.c        |  5 +++++
 tests/qtest/vhost-user-test.c | 13 +++++++------
 2 files changed, 12 insertions(+), 6 deletions(-)

diff --git a/tests/qtest/qos-test.c b/tests/qtest/qos-test.c
index 566cb3b00b..5da4091ec3 100644
--- a/tests/qtest/qos-test.c
+++ b/tests/qtest/qos-test.c
@@ -321,6 +321,11 @@ static void walk_path(QOSGraphNode *orig_path, int len)
 int main(int argc, char **argv, char** envp)
 {
     g_test_init(&argc, &argv, NULL);
+
+    if (g_test_subprocess()) {
+        qos_printf("qos_test running single test in subprocess\n");
+    }
+
     if (g_test_verbose()) {
         qos_printf("ENVIRONMENT VARIABLES: {\n");
         for (char **env = envp; *env != 0; env++) {
diff --git a/tests/qtest/vhost-user-test.c b/tests/qtest/vhost-user-test.c
index 84498941a6..99dc6080e5 100644
--- a/tests/qtest/vhost-user-test.c
+++ b/tests/qtest/vhost-user-test.c
@@ -26,6 +26,7 @@
 #include "libqos/virtio-pci.h"
 
 #include "libqos/malloc-pc.h"
+#include "libqos/qgraph_internal.h"
 #include "hw/virtio/virtio-net.h"
 
 #include "standard-headers/linux/vhost_types.h"
@@ -316,7 +317,7 @@ static void chr_read(void *opaque, const uint8_t *buf, int size)
     }
 
     if (size != VHOST_USER_HDR_SIZE) {
-        g_test_message("Wrong message size received %d", size);
+        qos_printf("%s: Wrong message size received %d\n", __func__, size);
         return;
     }
 
@@ -327,8 +328,8 @@ static void chr_read(void *opaque, const uint8_t *buf, int size)
         p += VHOST_USER_HDR_SIZE;
         size = qemu_chr_fe_read_all(chr, p, msg.size);
         if (size != msg.size) {
-            g_test_message("Wrong message size received %d != %d",
-                           size, msg.size);
+            qos_printf("%s: Wrong message size received %d != %d\n",
+                       __func__, size, msg.size);
             return;
         }
     }
@@ -450,7 +451,7 @@ static const char *init_hugepagefs(void)
     }
 
     if (access(path, R_OK | W_OK | X_OK)) {
-        g_test_message("access on path (%s): %s", path, strerror(errno));
+        qos_printf("access on path (%s): %s", path, strerror(errno));
         g_test_fail();
         return NULL;
     }
@@ -460,13 +461,13 @@ static const char *init_hugepagefs(void)
     } while (ret != 0 && errno == EINTR);
 
     if (ret != 0) {
-        g_test_message("statfs on path (%s): %s", path, strerror(errno));
+        qos_printf("statfs on path (%s): %s", path, strerror(errno));
         g_test_fail();
         return NULL;
     }
 
     if (fs.f_type != HUGETLBFS_MAGIC) {
-        g_test_message("Warning: path not on HugeTLBFS: %s", path);
+        qos_printf("Warning: path not on HugeTLBFS: %s", path);
         g_test_fail();
         return NULL;
     }
-- 
MST


