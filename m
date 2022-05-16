Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5502252816C
	for <lists+qemu-devel@lfdr.de>; Mon, 16 May 2022 12:06:19 +0200 (CEST)
Received: from localhost ([::1]:50664 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nqXcI-0002bN-6c
	for lists+qemu-devel@lfdr.de; Mon, 16 May 2022 06:06:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39790)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sgarzare@redhat.com>)
 id 1nqXZk-0001Uw-0y
 for qemu-devel@nongnu.org; Mon, 16 May 2022 06:03:40 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:31878)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sgarzare@redhat.com>)
 id 1nqXZg-00085E-Tg
 for qemu-devel@nongnu.org; Mon, 16 May 2022 06:03:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1652695412;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=LZK26sGzv/gYmCXov3Qy8P2OtrWViXL3cBIq0sBxKnE=;
 b=RWuRey+sk99ze24u0WkAifiMO9u+N0/4vFC+xBcjtk2aQHfRFYs0G+9Yyde1Op7MdEZzv6
 +20Xje+jp8mkkeS2bxpoSuOKo1WOe2694AeXeBdr3064TxtRTuiF09s9Pd+r1Ph8uF2iv1
 mCcyCySTtLPXhM48fmAIVQQVRzRIH3E=
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-662--xapNdQiN7aOM7Z414gwAw-1; Mon, 16 May 2022 06:03:31 -0400
X-MC-Unique: -xapNdQiN7aOM7Z414gwAw-1
Received: by mail-qk1-f199.google.com with SMTP id
 d186-20020a3768c3000000b0069fcfacbea0so10948488qkc.0
 for <qemu-devel@nongnu.org>; Mon, 16 May 2022 03:03:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=LZK26sGzv/gYmCXov3Qy8P2OtrWViXL3cBIq0sBxKnE=;
 b=d0wrzgPvB3bRFlSw6JE7ahMRLocWHf0P7qS/hd0XDFmPjg/P6dRby7csCZrRuu+cZN
 5jyMdmki1YDjspyA2bHWSJAqKPMsQ0z86NCJZP5cI0WO7jX0YPZ+nf8K1wc1ui8X+J4y
 9QLbKAezfYGjEz83btvRsii7c8h3zI7/p3h+UdIY4LAxMi1ZHpEwOHkzD8XUkqzYTsJe
 g7rs53Nf9bYeN3vkQosU3PRrKMqTIRdJ08wNyG+bK0GszAosaeE1SVPXefcR7xMzT6j7
 TM2a/L/S1xF7EaFAzQVDz4GgbU8+G6FaFniIlLAZAAZZG3DdvErluMhO1Ha88FSspJ5j
 N8AA==
X-Gm-Message-State: AOAM533lFJHFtRZDJcnFAGM1/X07Q+sw0xJKFZe6xmMsoXMZz2xyXII5
 2raAPOKxRVzGbJXvRTtKk3RF0ymOrsP08oOhyEkRFcwbl41DekBvICn/o0YVPscNpzVLy9pGOwA
 sVUsYGwKleFJet8/419L58RSaYum4ZX1SFVUzqIWICEG90IWk7Qk/XMHerH6wzKl7Ges=
X-Received: by 2002:ac8:5e54:0:b0:2f3:f4ee:efbd with SMTP id
 i20-20020ac85e54000000b002f3f4eeefbdmr14406030qtx.295.1652695410699; 
 Mon, 16 May 2022 03:03:30 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxAOB56SQeR+UohK+fw/ZHoAjDSwnCHW+y9zgFlv+YhBbH72znOk01C1KygbehpEvQvY84IUw==
X-Received: by 2002:ac8:5e54:0:b0:2f3:f4ee:efbd with SMTP id
 i20-20020ac85e54000000b002f3f4eeefbdmr14406007qtx.295.1652695410435; 
 Mon, 16 May 2022 03:03:30 -0700 (PDT)
Received: from step1.redhat.com (host-87-11-6-106.retail.telecomitalia.it.
 [87.11.6.106]) by smtp.gmail.com with ESMTPSA id
 c28-20020a05620a201c00b0069fcf7678besm5482554qka.105.2022.05.16.03.03.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 May 2022 03:03:28 -0700 (PDT)
From: Stefano Garzarella <sgarzare@redhat.com>
To: qemu-devel@nongnu.org
Cc: Peter Lieven <pl@kamp.de>, Ilya Dryomov <idryomov@gmail.com>,
 Tingting Mao <timao@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 Kevin Wolf <kwolf@redhat.com>, qemu-block@nongnu.org,
 Stefano Garzarella <sgarzare@redhat.com>
Subject: [PATCH] block/rbd: report a better error when namespace does not exist
Date: Mon, 16 May 2022 12:03:24 +0200
Message-Id: <20220516100324.61122-1-sgarzare@redhat.com>
X-Mailer: git-send-email 2.35.3
MIME-Version: 1.0
Content-type: text/plain
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=sgarzare@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

If the namespace does not exist, rbd_create() fails with -ENOENT and
QEMU reports a generic "error rbd create: No such file or directory":

    $ qemu-img create rbd:rbd/namespace/image 1M
    Formatting 'rbd:rbd/namespace/image', fmt=raw size=1048576
    qemu-img: rbd:rbd/namespace/image: error rbd create: No such file or directory

Unfortunately rados_ioctx_set_namespace() does not fail if the namespace
does not exist, so let's use rbd_namespace_exists() in qemu_rbd_connect()
to check if the namespace exists, reporting a more understandable error:

    $ qemu-img create rbd:rbd/namespace/image 1M
    Formatting 'rbd:rbd/namespace/image', fmt=raw size=1048576
    qemu-img: rbd:rbd/namespace/image: namespace 'namespace' does not exist

Reported-by: Tingting Mao <timao@redhat.com>
Signed-off-by: Stefano Garzarella <sgarzare@redhat.com>
---
 meson.build |  6 ++++++
 block/rbd.c | 24 ++++++++++++++++++++++++
 2 files changed, 30 insertions(+)

diff --git a/meson.build b/meson.build
index 9b20dcd143..e6c0afd62b 100644
--- a/meson.build
+++ b/meson.build
@@ -1828,6 +1828,12 @@ config_host_data.set('HAVE_GETIFADDRS', cc.has_function('getifaddrs'))
 config_host_data.set('HAVE_OPENPTY', cc.has_function('openpty', dependencies: util))
 config_host_data.set('HAVE_STRCHRNUL', cc.has_function('strchrnul'))
 config_host_data.set('HAVE_SYSTEM_FUNCTION', cc.has_function('system', prefix: '#include <stdlib.h>'))
+if rbd.found()
+  config_host_data.set('HAVE_RBD_NAMESPACE_EXISTS',
+                       cc.has_function('rbd_namespace_exists',
+                                       dependencies: rbd,
+                                       prefix: '#include <rbd/librbd.h>'))
+endif
 if rdma.found()
   config_host_data.set('HAVE_IBV_ADVISE_MR',
                        cc.has_function('ibv_advise_mr',
diff --git a/block/rbd.c b/block/rbd.c
index 6caf35cbba..0ff23c5b26 100644
--- a/block/rbd.c
+++ b/block/rbd.c
@@ -831,6 +831,26 @@ static int qemu_rbd_connect(rados_t *cluster, rados_ioctx_t *io_ctx,
         error_setg_errno(errp, -r, "error opening pool %s", opts->pool);
         goto failed_shutdown;
     }
+
+#ifdef HAVE_RBD_NAMESPACE_EXISTS
+    if (opts->has_q_namespace && strlen(opts->q_namespace) > 0) {
+        bool exists;
+
+        r = rbd_namespace_exists(*io_ctx, opts->q_namespace, &exists);
+        if (r != 0) {
+            error_setg_errno(errp, -r, "error checking namespace");
+            goto failed_ioctx_destroy;
+        }
+
+        if (!exists) {
+            error_setg(errp, "namespace '%s' does not exist",
+                       opts->q_namespace);
+            r = -ENOENT;
+            goto failed_ioctx_destroy;
+        }
+    }
+#endif
+
     /*
      * Set the namespace after opening the io context on the pool,
      * if nspace == NULL or if nspace == "", it is just as we did nothing
@@ -840,6 +860,10 @@ static int qemu_rbd_connect(rados_t *cluster, rados_ioctx_t *io_ctx,
     r = 0;
     goto out;
 
+#ifdef HAVE_RBD_NAMESPACE_EXISTS
+failed_ioctx_destroy:
+    rados_ioctx_destroy(*io_ctx);
+#endif
 failed_shutdown:
     rados_shutdown(*cluster);
 out:
-- 
2.35.3


