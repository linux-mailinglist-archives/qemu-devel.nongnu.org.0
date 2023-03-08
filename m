Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 17DC86AFBD7
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Mar 2023 02:12:40 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pZiKg-0008CO-R0; Tue, 07 Mar 2023 20:11:06 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1pZiKe-00082Y-A4
 for qemu-devel@nongnu.org; Tue, 07 Mar 2023 20:11:04 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1pZiKc-0001UA-G3
 for qemu-devel@nongnu.org; Tue, 07 Mar 2023 20:11:04 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1678237861;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=K0THZO2ut7vkZDqLfF6bLkw4mZcd8okDWsTM1o8ijpw=;
 b=NOU01km8ee3cu9dJUa+iwe+NzrXRtqxnXjV2hoHk+mf+0D8Hlo6Tcey3bPA3f/xO7pkNVq
 T8WHv2A2EOmhaKCAY4XpvAtB8l/JiQiXkVD1UXJDfx//wkkcM2pUMVsYL1onYmInw+hYAn
 l9WUAz4c92kBqcF/otsKo8sozoXOJ3k=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-265-7jBOmlq4O7OYLmq64ox_cQ-1; Tue, 07 Mar 2023 20:11:00 -0500
X-MC-Unique: 7jBOmlq4O7OYLmq64ox_cQ-1
Received: by mail-wm1-f72.google.com with SMTP id
 t1-20020a7bc3c1000000b003dfe223de49so199731wmj.5
 for <qemu-devel@nongnu.org>; Tue, 07 Mar 2023 17:10:59 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678237858;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=K0THZO2ut7vkZDqLfF6bLkw4mZcd8okDWsTM1o8ijpw=;
 b=0/vMelFPWs+MZj/SzmlQ2zHcqrrbUqMvMD/xDqdxwDXzA/UkWTGGZVJOGpZFH+lVS5
 hcRQG7aoACl2Qe2aISOeBsSwN+BkCHD2gwtMwqciQ+sx2Yx6tT9hIBofLvUaH6atXLv9
 udSQ4pv0gtvN3Jwj7k4Ys1Ry7URT3CDGTjTs5+WJCWdHGuT6yYlISXOZ83qR+BQ220eC
 NW71znrRGEjNZMRJH6682Bjhmzqnj6LWDe0BBA7ECSVrboYHwhLTm25ujO3oaK9kJhMd
 GaNPqTxNEFutGpLeTBSa/KF77HYlmvEdwy24JfWZZTLiT1v8UtsEBEDo+WtWnJJ8HufH
 unng==
X-Gm-Message-State: AO0yUKWHeqRmqZ9XOjycnFg09h+UqUP4+ewgS+RRuCONfmKXDLmjrMeE
 ihtXzOcDhOLbf9mS3ox0rAX4Ho3+/ASn7nMbKee2Y5T8uldjv3Qm1ReDL3IS3/XWOltpixPn6Iw
 X+fGMSbqHE5uWs82aWsRg51GNd1eI7YPjx+doW4991L+fX8JAypWi7o/ZIKlKIZNCKY2K
X-Received: by 2002:a05:600c:1992:b0:3e2:9b4:4303 with SMTP id
 t18-20020a05600c199200b003e209b44303mr14672197wmq.19.1678237858469; 
 Tue, 07 Mar 2023 17:10:58 -0800 (PST)
X-Google-Smtp-Source: AK7set9SOru86d4P+TNx5MzyHjaFTR4fSl3x5kSmR7s7CvrWfPRzuL2NEYU6/bZTbeoYf+8+UcgWSQ==
X-Received: by 2002:a05:600c:1992:b0:3e2:9b4:4303 with SMTP id
 t18-20020a05600c199200b003e209b44303mr14672168wmq.19.1678237857973; 
 Tue, 07 Mar 2023 17:10:57 -0800 (PST)
Received: from redhat.com ([2.52.138.216]) by smtp.gmail.com with ESMTPSA id
 s25-20020a05600c319900b003db03725e86sm14135921wmp.8.2023.03.07.17.10.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Mar 2023 17:10:57 -0800 (PST)
Date: Tue, 7 Mar 2023 20:10:54 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 zhenwei pi <pizhenwei@bytedance.com>,
 Daniel P =?utf-8?B?LiBCZXJyYW5nw6k=?= <berrange@redhat.com>,
 "Gonglei (Arei)" <arei.gonglei@huawei.com>
Subject: [PULL 02/73] cryptodev: Remove 'name' & 'model' fields
Message-ID: <3f478371fde24778ac09b4f7ffa82b00e87a97ec.1678237635.git.mst@redhat.com>
References: <cover.1678237635.git.mst@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <cover.1678237635.git.mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mst@redhat.com;
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

From: zhenwei pi <pizhenwei@bytedance.com>

We have already used qapi to generate crypto device types, this allows
to convert type to a string 'model', so the 'model' field is not
needed.

And the 'name' field is not used by any backend driver, drop it.

Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>
Signed-off-by: zhenwei pi <pizhenwei@bytedance.com>
Message-Id: <20230301105847.253084-3-pizhenwei@bytedance.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 include/sysemu/cryptodev.h      | 12 +++---------
 backends/cryptodev-builtin.c    |  3 +--
 backends/cryptodev-lkcf.c       |  2 +-
 backends/cryptodev-vhost-user.c |  3 +--
 backends/cryptodev.c            | 11 +----------
 5 files changed, 7 insertions(+), 24 deletions(-)

diff --git a/include/sysemu/cryptodev.h b/include/sysemu/cryptodev.h
index 8d2adda974..af152d09db 100644
--- a/include/sysemu/cryptodev.h
+++ b/include/sysemu/cryptodev.h
@@ -218,8 +218,6 @@ struct CryptoDevBackendClass {
 
 struct CryptoDevBackendClient {
     QCryptodevBackendType type;
-    char *model;
-    char *name;
     char *info_str;
     unsigned int queue_index;
     int vring_enable;
@@ -264,11 +262,8 @@ struct CryptoDevBackend {
 
 /**
  * cryptodev_backend_new_client:
- * @model: the cryptodev backend model
- * @name: the cryptodev backend name, can be NULL
  *
- * Creates a new cryptodev backend client object
- * with the @name in the model @model.
+ * Creates a new cryptodev backend client object.
  *
  * The returned object must be released with
  * cryptodev_backend_free_client() when no
@@ -276,9 +271,8 @@ struct CryptoDevBackend {
  *
  * Returns: a new cryptodev backend client object
  */
-CryptoDevBackendClient *
-cryptodev_backend_new_client(const char *model,
-                                    const char *name);
+CryptoDevBackendClient *cryptodev_backend_new_client(void);
+
 /**
  * cryptodev_backend_free_client:
  * @cc: the cryptodev backend client object
diff --git a/backends/cryptodev-builtin.c b/backends/cryptodev-builtin.c
index 8c7c10847d..08895271eb 100644
--- a/backends/cryptodev-builtin.c
+++ b/backends/cryptodev-builtin.c
@@ -72,8 +72,7 @@ static void cryptodev_builtin_init(
         return;
     }
 
-    cc = cryptodev_backend_new_client(
-              "cryptodev-builtin", NULL);
+    cc = cryptodev_backend_new_client();
     cc->info_str = g_strdup_printf("cryptodev-builtin0");
     cc->queue_index = 0;
     cc->type = QCRYPTODEV_BACKEND_TYPE_BUILTIN;
diff --git a/backends/cryptodev-lkcf.c b/backends/cryptodev-lkcf.c
index 91e02c0df9..de3d1867c5 100644
--- a/backends/cryptodev-lkcf.c
+++ b/backends/cryptodev-lkcf.c
@@ -223,7 +223,7 @@ static void cryptodev_lkcf_init(CryptoDevBackend *backend, Error **errp)
         return;
     }
 
-    cc = cryptodev_backend_new_client("cryptodev-lkcf", NULL);
+    cc = cryptodev_backend_new_client();
     cc->info_str = g_strdup_printf("cryptodev-lkcf0");
     cc->queue_index = 0;
     cc->type = QCRYPTODEV_BACKEND_TYPE_LKCF;
diff --git a/backends/cryptodev-vhost-user.c b/backends/cryptodev-vhost-user.c
index c165a1b1d6..580bd1abb0 100644
--- a/backends/cryptodev-vhost-user.c
+++ b/backends/cryptodev-vhost-user.c
@@ -198,8 +198,7 @@ static void cryptodev_vhost_user_init(
     s->opened = true;
 
     for (i = 0; i < queues; i++) {
-        cc = cryptodev_backend_new_client(
-                  "cryptodev-vhost-user", NULL);
+        cc = cryptodev_backend_new_client();
         cc->info_str = g_strdup_printf("cryptodev-vhost-user%zu to %s ",
                                        i, chr->label);
         cc->queue_index = i;
diff --git a/backends/cryptodev.c b/backends/cryptodev.c
index 54ee8c81f5..81941af816 100644
--- a/backends/cryptodev.c
+++ b/backends/cryptodev.c
@@ -34,18 +34,11 @@
 static QTAILQ_HEAD(, CryptoDevBackendClient) crypto_clients;
 
 
-CryptoDevBackendClient *
-cryptodev_backend_new_client(const char *model,
-                                    const char *name)
+CryptoDevBackendClient *cryptodev_backend_new_client(void)
 {
     CryptoDevBackendClient *cc;
 
     cc = g_new0(CryptoDevBackendClient, 1);
-    cc->model = g_strdup(model);
-    if (name) {
-        cc->name = g_strdup(name);
-    }
-
     QTAILQ_INSERT_TAIL(&crypto_clients, cc, next);
 
     return cc;
@@ -55,8 +48,6 @@ void cryptodev_backend_free_client(
                   CryptoDevBackendClient *cc)
 {
     QTAILQ_REMOVE(&crypto_clients, cc, next);
-    g_free(cc->name);
-    g_free(cc->model);
     g_free(cc->info_str);
     g_free(cc);
 }
-- 
MST


