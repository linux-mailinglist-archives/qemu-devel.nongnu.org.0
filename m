Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F05B400D31
	for <lists+qemu-devel@lfdr.de>; Sat,  4 Sep 2021 23:48:41 +0200 (CEST)
Received: from localhost ([::1]:49074 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mMdWi-0001Yj-4O
	for lists+qemu-devel@lfdr.de; Sat, 04 Sep 2021 17:48:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35446)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1mMdLX-0005tO-79
 for qemu-devel@nongnu.org; Sat, 04 Sep 2021 17:37:07 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:33522)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1mMdLV-0001NA-Q5
 for qemu-devel@nongnu.org; Sat, 04 Sep 2021 17:37:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1630791425;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=DKUyiG5ulvlN8bn9hYjVPeiz0laMQTjL5M3rAODT118=;
 b=dl8JpKL4mE5h/M5doK4y4NGDXT3WbXkX+nuXrH/YJ7Zo/yWIzu0PkD5no7gqEYEtSH4EdV
 TME5hgvo6lgQSuPKzITFmSQbppu5oiP60axF9FlzNGqiMsie1UcNagwy4eNHd+EAg3Wj0D
 NaSUklycur3lso/g27e3CGvPkndkC38=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-232-MeWG8XIMNWSR_znHPDjJLA-1; Sat, 04 Sep 2021 17:37:04 -0400
X-MC-Unique: MeWG8XIMNWSR_znHPDjJLA-1
Received: by mail-ed1-f70.google.com with SMTP id
 j13-20020aa7ca4d000000b003c44c679d73so1501771edt.8
 for <qemu-devel@nongnu.org>; Sat, 04 Sep 2021 14:37:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=DKUyiG5ulvlN8bn9hYjVPeiz0laMQTjL5M3rAODT118=;
 b=FTJkVwav7jbH6OB+87VUFOltDtyTn/+qbPLrub5nCUYe51VUP+4QdKw2+J+hCM7t8I
 vncshvOQOoFybDQA/1tjBi+8nGvtxtjmqfu0J+B/9sY4EdIbqPwOFw4PIqKPwfQF8Bkt
 5VtiWrI5bQmR9vtLR7DT+7rgGurxcx1u4GTOTlzzxsuYzu7Gy63pgPXJkNICvVkeC/97
 6TWNtZJrG5PSA6VBcUvkLh92+D0KxcEKz0SEUDi0erUDkXsvCWsMw5EW4/sR6SzlFIFy
 ArDeY/94Sdm/4sQp8WLY60FiVbYD50KInhOZmat4WIhM9PnmPLWGWrYjqOzGY3x3DTVS
 Rqqw==
X-Gm-Message-State: AOAM530KUV6YiTinPTGuhgkR5lKyTe0pD3SlooocZuGLLWCzdcSuGdXX
 BxqJVHdkZvC/NqTjGoQ8SiMLduxdx3tilrxpR58dwznHD7iUAc9qIG0KXupdyyZs1KWXMThhCKx
 gMt0kxPibyFlAjy0TVlDQmLYKHQHyNguV5+aeHxxUsZbWCPrTtx07nSTOZXQt
X-Received: by 2002:a17:906:9ac5:: with SMTP id
 ah5mr6005557ejc.224.1630791422654; 
 Sat, 04 Sep 2021 14:37:02 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzZs/laeXpFr0DvoDT3/miKSIDRJomlYg+fsr4RJXQCglVMqwYI3lt9JvRkPTYVZvEDt9WeGw==
X-Received: by 2002:a17:906:9ac5:: with SMTP id
 ah5mr6005540ejc.224.1630791422469; 
 Sat, 04 Sep 2021 14:37:02 -0700 (PDT)
Received: from redhat.com ([2.55.150.176])
 by smtp.gmail.com with ESMTPSA id b18sm1518651ejl.90.2021.09.04.14.37.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 04 Sep 2021 14:37:02 -0700 (PDT)
Date: Sat, 4 Sep 2021 17:37:00 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 21/35] hw/virtio: Remove NULL check in
 virtio_free_region_cache()
Message-ID: <20210904213506.486886-22-mst@redhat.com>
References: <20210904213506.486886-1-mst@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210904213506.486886-1-mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.391,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>,
 Stefano Garzarella <sgarzare@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Philippe Mathieu-Daudé <philmd@redhat.com>

virtio_free_region_cache() is called within call_rcu(),
always with a non-NULL argument. Ensure new code keep it
that way by replacing the NULL check by an assertion.
Add a comment this function is called within call_rcu().

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Message-Id: <20210826172658.2116840-3-philmd@redhat.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
Reviewed-by: Stefano Garzarella <sgarzare@redhat.com>
Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
---
 hw/virtio/virtio.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/hw/virtio/virtio.c b/hw/virtio/virtio.c
index a5214bca61..3a1f6c520c 100644
--- a/hw/virtio/virtio.c
+++ b/hw/virtio/virtio.c
@@ -133,12 +133,10 @@ struct VirtQueue
     QLIST_ENTRY(VirtQueue) node;
 };
 
+/* Called within call_rcu().  */
 static void virtio_free_region_cache(VRingMemoryRegionCaches *caches)
 {
-    if (!caches) {
-        return;
-    }
-
+    assert(caches != NULL);
     address_space_cache_destroy(&caches->desc);
     address_space_cache_destroy(&caches->avail);
     address_space_cache_destroy(&caches->used);
-- 
MST


