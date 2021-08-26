Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A1C3C3F8F57
	for <lists+qemu-devel@lfdr.de>; Thu, 26 Aug 2021 21:58:21 +0200 (CEST)
Received: from localhost ([::1]:43168 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mJLW0-0003FI-NH
	for lists+qemu-devel@lfdr.de; Thu, 26 Aug 2021 15:58:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49368)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mJLOs-0005t2-MF
 for qemu-devel@nongnu.org; Thu, 26 Aug 2021 15:50:59 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:49494)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mJLOp-0003GC-Uf
 for qemu-devel@nongnu.org; Thu, 26 Aug 2021 15:50:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1630007454;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=umqwksLtXVwt5Q4MQd+KtuQaKYoIZnas6CvSnWhM3q0=;
 b=LiqLerVisI7Ova4SUFOomNRG3E8G+Z8vW70ITiwtUR5A+V9mwNRpp9f2boAIDJXZJe+8ks
 ydrC2t+7pLnXoNxjTHMnBI+CnNoACOmjxiS0RLWCey0ve/p3qbgBAd6hx4oawoecQE9FNz
 PHUpMBYNNc8jNJRZk5N/E318tJP62wE=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-454-xYbmu-ifNMuG9DHjAbeuPw-1; Thu, 26 Aug 2021 15:50:53 -0400
X-MC-Unique: xYbmu-ifNMuG9DHjAbeuPw-1
Received: by mail-wr1-f72.google.com with SMTP id
 o9-20020a5d6849000000b001574518a85aso1201120wrw.11
 for <qemu-devel@nongnu.org>; Thu, 26 Aug 2021 12:50:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=umqwksLtXVwt5Q4MQd+KtuQaKYoIZnas6CvSnWhM3q0=;
 b=KRIOZZZGvQtnKyOcuHc0tgoQF+wEH6TvSkYJ2KJEFIU+KfqttqNPXcRHtIWeLVm/cQ
 yEUaGa5uSH6flVdS14r4J7vXPuYrtwJgTMx9IOlKJGiYya1cxI373fuurG9bQslAF8Rt
 UrcyqPuF/8HIL3VvziyOPjlkWmgC+6FppcUq8QEM0vRiY9VNIpms7faPRLGtpzf8+2G6
 9HNqvtgb5tK0JDLcrH6SJaWsKzS8VA8cbx1n4q+zp8WYHMXnCn+mzKzOjz1mOOZfjLaS
 53nBWRQP1pr5ToiaNW3HFAgIrbGXJERavo57xJRcBqu9+Qp6ZMNDRK988XhDWfIB6Se9
 oM2w==
X-Gm-Message-State: AOAM533kfqSUBODFMA1CYkI63HYnvRfIszkw9sMOd2/0chPWzOO5KohS
 pm7a4XV5zzRYdV5ZpWik1P3uLXVWk/UNtSZ6KIijXDpzgn+OEWTS45qkK1ckzhddkmv2qCTwcyO
 u+ZwEBKTMc5VVTIy4GLeoDJnMVwNeefkCbQ3JwoDo1LAWeYTA6KUWxgDX5ZxdARWd
X-Received: by 2002:a05:600c:4152:: with SMTP id
 h18mr2321105wmm.55.1630007451493; 
 Thu, 26 Aug 2021 12:50:51 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw3kEbnE9dJSGbmrZEg2hRyrvfWdinwbSwV1YuV/Mm/kWH2Qef8qhRXNXF/jlgjLrNCsUKknw==
X-Received: by 2002:a05:600c:4152:: with SMTP id
 h18mr2321087wmm.55.1630007451333; 
 Thu, 26 Aug 2021 12:50:51 -0700 (PDT)
Received: from x1w.. (163.red-83-52-55.dynamicip.rima-tde.net. [83.52.55.163])
 by smtp.gmail.com with ESMTPSA id
 f17sm4740622wrt.63.2021.08.26.12.50.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 26 Aug 2021 12:50:51 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 08/11] util/vfio-helpers: Use error_setg in
 qemu_vfio_find_[fixed/temp]_iova
Date: Thu, 26 Aug 2021 21:50:11 +0200
Message-Id: <20210826195014.2180369-9-philmd@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210826195014.2180369-1-philmd@redhat.com>
References: <20210826195014.2180369-1-philmd@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.742,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>, Fam Zheng <fam@euphon.net>,
 qemu-block@nongnu.org, Klaus Jensen <k.jensen@samsung.com>,
 Auger Eric <eric.auger@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Have qemu_vfio_find_fixed_iova() and qemu_vfio_find_temp_iova()
propagate eventual errors to callers.

Suggested-by: Klaus Jensen <k.jensen@samsung.com>
Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 util/vfio-helpers.c | 14 ++++++++++----
 1 file changed, 10 insertions(+), 4 deletions(-)

diff --git a/util/vfio-helpers.c b/util/vfio-helpers.c
index 306b5a83e48..7de5081dbd3 100644
--- a/util/vfio-helpers.c
+++ b/util/vfio-helpers.c
@@ -678,7 +678,8 @@ static bool qemu_vfio_verify_mappings(QEMUVFIOState *s)
 }
 
 static int
-qemu_vfio_find_fixed_iova(QEMUVFIOState *s, size_t size, uint64_t *iova)
+qemu_vfio_find_fixed_iova(QEMUVFIOState *s, size_t size, uint64_t *iova,
+                          Error **errp)
 {
     int i;
 
@@ -696,11 +697,14 @@ qemu_vfio_find_fixed_iova(QEMUVFIOState *s, size_t size, uint64_t *iova)
             return 0;
         }
     }
+    error_setg(errp, "fixed iova range not found");
+
     return -ENOMEM;
 }
 
 static int
-qemu_vfio_find_temp_iova(QEMUVFIOState *s, size_t size, uint64_t *iova)
+qemu_vfio_find_temp_iova(QEMUVFIOState *s, size_t size, uint64_t *iova,
+                         Error **errp)
 {
     int i;
 
@@ -718,6 +722,8 @@ qemu_vfio_find_temp_iova(QEMUVFIOState *s, size_t size, uint64_t *iova)
             return 0;
         }
     }
+    error_setg(errp, "temporary iova range not found");
+
     return -ENOMEM;
 }
 
@@ -762,7 +768,7 @@ int qemu_vfio_dma_map(QEMUVFIOState *s, void *host, size_t size,
             goto out;
         }
         if (!temporary) {
-            if (qemu_vfio_find_fixed_iova(s, size, &iova0)) {
+            if (qemu_vfio_find_fixed_iova(s, size, &iova0, errp) < 0) {
                 ret = -ENOMEM;
                 goto out;
             }
@@ -776,7 +782,7 @@ int qemu_vfio_dma_map(QEMUVFIOState *s, void *host, size_t size,
             }
             qemu_vfio_dump_mappings(s);
         } else {
-            if (qemu_vfio_find_temp_iova(s, size, &iova0)) {
+            if (qemu_vfio_find_temp_iova(s, size, &iova0, errp)) {
                 ret = -ENOMEM;
                 goto out;
             }
-- 
2.31.1


