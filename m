Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B9AC5266BD
	for <lists+qemu-devel@lfdr.de>; Fri, 13 May 2022 18:09:44 +0200 (CEST)
Received: from localhost ([::1]:34880 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1npXrK-0004dz-O8
	for lists+qemu-devel@lfdr.de; Fri, 13 May 2022 12:09:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50362)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <afaria@redhat.com>) id 1npXg8-0001dm-By
 for qemu-devel@nongnu.org; Fri, 13 May 2022 11:58:08 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:21953)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <afaria@redhat.com>) id 1npXg3-0002K4-Qm
 for qemu-devel@nongnu.org; Fri, 13 May 2022 11:58:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1652457483;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=04vgAW3zSUgCkAoZ/zalDsggthLXpY/1atnq79b/gK4=;
 b=G/YpIji+sHphwSWP8ErNQ0Wyuze9N3AEL2EZ394pjkSpbcPqp9ZeQ4KSdFf2Qv0fSw0lU2
 aEZCZNct1XemawFqOxahFpKhU3MMS36fl/ENdwmPgy0BU1zNAxF+qZKE0mWpnW1PwDbC8R
 iZoyeAupLxVm3ibuQMYksgpI49Hu3/w=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-41-qp82yJxPNYSK-5geCs0u5Q-1; Fri, 13 May 2022 11:58:01 -0400
X-MC-Unique: qp82yJxPNYSK-5geCs0u5Q-1
Received: by mail-wm1-f70.google.com with SMTP id
 i18-20020a1c5412000000b0039491a8298cso3171474wmb.5
 for <qemu-devel@nongnu.org>; Fri, 13 May 2022 08:58:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=04vgAW3zSUgCkAoZ/zalDsggthLXpY/1atnq79b/gK4=;
 b=ME8UH6XZ/jiEgwFTeOT60xZXM2LfGfgERn8WBU+P1JYdNNlycOulr1JJPrJCvx4bK/
 B0kzzjNqF3gYf3Y730n6bOBA4rftvNf/5+U2Y3Ha79hY/mSy/feD8Q/77IMcjw5xw8NL
 uGB31repV4mKWW5/q+iqulTvQntjWgaUOeTiny4YUJWcPlw9jzspwfrSwOfyPKtweTMb
 i8QSQ5dmKrSZKCRQ9Puibd3yscvczxCi2vDjHTNRLBgvLSkcE793wdaXhr2VtQGA0d/f
 h8uABvrz623yDnZg78iqHNvhXti1XUTcBtRW0UfNZz052rkE4JKe1Zlyf8fyD/0LG8S6
 prAA==
X-Gm-Message-State: AOAM5336F0HXhb5gpJ2tIBN7PbYo6S5ULecOOXzzZpn7nBce7IKS545K
 SLTfRF6DJ2hwt3Sn81h5l/DXdXiPkMYR2VfhI2ZIJzij4Qd5w2hiyiWEM+FDg2TENl2vTHeeSVa
 6QOnm0cha+YlzqXlAuph6wrzwkfTcjrK/uACe7JWJxfEP5LqoB6WE1qryfKHozvqT
X-Received: by 2002:a7b:c3cb:0:b0:394:3533:c712 with SMTP id
 t11-20020a7bc3cb000000b003943533c712mr5305970wmj.141.1652457480548; 
 Fri, 13 May 2022 08:58:00 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyS7WxYqrF3HhjxJh7Gko+iyWsYUulrLRf6kW4vYJm53Gqv9vS8uqweVY75VGln0rIPDWZ9kg==
X-Received: by 2002:a7b:c3cb:0:b0:394:3533:c712 with SMTP id
 t11-20020a7bc3cb000000b003943533c712mr5305950wmj.141.1652457480362; 
 Fri, 13 May 2022 08:58:00 -0700 (PDT)
Received: from DESKTOP-E7ACR7D.lan ([2001:8a0:f4d9:2101:a4fa:5f93:755f:6249])
 by smtp.gmail.com with ESMTPSA id
 l5-20020adfc785000000b0020cdcb0efa2sm2558758wrg.34.2022.05.13.08.57.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 May 2022 08:57:59 -0700 (PDT)
From: Alberto Faria <afaria@redhat.com>
To: qemu-devel@nongnu.org
Cc: qemu-block@nongnu.org, Alberto Faria <afaria@redhat.com>,
 Kevin Wolf <kwolf@redhat.com>, Hanna Reitz <hreitz@redhat.com>
Subject: [PATCH v2 10/10] block/qcow2: Use bdrv_pwrite_sync() in
 qcow2_mark_dirty()
Date: Fri, 13 May 2022 16:57:49 +0100
Message-Id: <20220513155749.2488070-8-afaria@redhat.com>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20220513155418.2486450-1-afaria@redhat.com>
References: <20220513155418.2486450-1-afaria@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=afaria@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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

Use bdrv_pwrite_sync() instead of calling bdrv_pwrite() and bdrv_flush()
separately.

Signed-off-by: Alberto Faria <afaria@redhat.com>
---
 block/qcow2.c | 9 +++------
 1 file changed, 3 insertions(+), 6 deletions(-)

diff --git a/block/qcow2.c b/block/qcow2.c
index f2fb54c51f..90a2dd406b 100644
--- a/block/qcow2.c
+++ b/block/qcow2.c
@@ -516,12 +516,9 @@ int qcow2_mark_dirty(BlockDriverState *bs)
     }
 
     val = cpu_to_be64(s->incompatible_features | QCOW2_INCOMPAT_DIRTY);
-    ret = bdrv_pwrite(bs->file, offsetof(QCowHeader, incompatible_features),
-                      sizeof(val), &val, 0);
-    if (ret < 0) {
-        return ret;
-    }
-    ret = bdrv_flush(bs->file->bs);
+    ret = bdrv_pwrite_sync(bs->file,
+                           offsetof(QCowHeader, incompatible_features),
+                           sizeof(val), &val, 0);
     if (ret < 0) {
         return ret;
     }
-- 
2.35.3


