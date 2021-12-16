Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 13BED477239
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Dec 2021 13:51:16 +0100 (CET)
Received: from localhost ([::1]:50052 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mxqE5-000214-VV
	for lists+qemu-devel@lfdr.de; Thu, 16 Dec 2021 07:51:14 -0500
Received: from eggs.gnu.org ([209.51.188.92]:48896)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mxpzf-0001T7-ML
 for qemu-devel@nongnu.org; Thu, 16 Dec 2021 07:36:20 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:26229)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mxpzb-0004RE-LH
 for qemu-devel@nongnu.org; Thu, 16 Dec 2021 07:36:18 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1639658175;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=OjX8CYLaX4R3RIAI7ku1YNlJqt9CA9792fVcfHD3DXE=;
 b=Nh5JAJtmvi4VYN46SFfyWlgdWLG7L4CD1sd1pTSDxrEEgPOcC4jA0JWokqCzXSu8goHw27
 mI8RBT9wJ7FlYOWaOZkQ9Pd4zuj9bLlj1t8oDSaPATtM3tql0XPtqCpaqFT6O2uhKBFX7x
 PpFsvd/pjePH7i1rEMpTpwiXN7sATLE=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-86-W6j6MWRrP-aTnodghcrcNw-1; Thu, 16 Dec 2021 07:36:14 -0500
X-MC-Unique: W6j6MWRrP-aTnodghcrcNw-1
Received: by mail-wm1-f70.google.com with SMTP id
 o17-20020a05600c511100b00343141e2a16so7730761wms.5
 for <qemu-devel@nongnu.org>; Thu, 16 Dec 2021 04:36:14 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=OjX8CYLaX4R3RIAI7ku1YNlJqt9CA9792fVcfHD3DXE=;
 b=tyo1nhYaJKlgn/xeGO0VmxU/CjeoqOLxHbncgoNWwmaQ0E1qjxhTbCnFfddKljQ1xn
 vPBZjoOWg6ceNvo5AE6T09UfIWCOIyTDhQw3OX4dPRacAE8uHdOIfOd+COqUdyV0/Pkz
 90biS9z5fYhNX4m9FSCFzQtI6WSomofHhOdCvDH/t5T6R/I0Iu4SylUMkKIcIHoiUcjw
 475q+7NUdEzWqaevhbh2bVhN7B3HfK/TLwcDbMFoh/Rm/ENy6EQ8BNXSlHX5LSIDWimF
 RQ7224vCFGYfnavVZuX1gIwNpKaRhKLqqxCWS28IKppRCTtekD9QjVcOmq3d70iO/72H
 Awcg==
X-Gm-Message-State: AOAM530oAxghKoGTj9/pFBsiCnptVDVkU4Vulsho9zp8U9knOgojNJ5v
 +WLZjSybBbql3ZkyXR+6ZsUuaKmBGlLAlgEI2AZyNIfzpLKwIGi2uju1Lli21FkQZVGrCF0Ihx1
 8jqqgP0eOx8X/sXha0bYwHFrvbrj1hcxmiKUibA9jwFZc0W+04PXDJFiuPrOx4RHH
X-Received: by 2002:a5d:66cb:: with SMTP id k11mr9233293wrw.253.1639658172879; 
 Thu, 16 Dec 2021 04:36:12 -0800 (PST)
X-Google-Smtp-Source: ABdhPJz2kn9WZBr5BRR9aX7rH7oWfDlQQBLIJSj9XP+aC0UFvSZ8A6EAhCUwTwi39z/SeU3tS1RolQ==
X-Received: by 2002:a5d:66cb:: with SMTP id k11mr9233254wrw.253.1639658172653; 
 Thu, 16 Dec 2021 04:36:12 -0800 (PST)
Received: from localhost.localdomain
 (174.red-83-50-185.dynamicip.rima-tde.net. [83.50.185.174])
 by smtp.gmail.com with ESMTPSA id o12sm6105798wrc.85.2021.12.16.04.36.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Dec 2021 04:36:12 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 1/8] dma: Have dma_buf_rw() take a void pointer
Date: Thu, 16 Dec 2021 13:35:51 +0100
Message-Id: <20211216123558.799425-2-philmd@redhat.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211216123558.799425-1-philmd@redhat.com>
References: <20211216123558.799425-1-philmd@redhat.com>
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
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.718,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: Fam Zheng <fam@euphon.net>, Hannes Reinecke <hare@suse.com>,
 qemu-block@nongnu.org, David Hildenbrand <david@redhat.com>,
 John Snow <jsnow@redhat.com>, Jason Wang <jasowang@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Li Qiang <liq3ea@gmail.com>,
 Qiuhao Li <Qiuhao.Li@outlook.com>, Peter Xu <peterx@redhat.com>,
 Keith Busch <kbusch@kernel.org>, Alexander Bulekov <alxndr@bu.edu>,
 Gerd Hoffmann <kraxel@redhat.com>, Klaus Jensen <its@irrelevant.dk>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

DMA operations are run on any kind of buffer, not arrays of
uint8_t. Convert dma_buf_rw() to take a void pointer argument
to save us pointless casts to uint8_t *.

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 softmmu/dma-helpers.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/softmmu/dma-helpers.c b/softmmu/dma-helpers.c
index 3c06a2feddd..09e29997ee5 100644
--- a/softmmu/dma-helpers.c
+++ b/softmmu/dma-helpers.c
@@ -294,9 +294,10 @@ BlockAIOCB *dma_blk_write(BlockBackend *blk,
 }
 
 
-static uint64_t dma_buf_rw(uint8_t *ptr, int32_t len, QEMUSGList *sg,
+static uint64_t dma_buf_rw(void *buf, int32_t len, QEMUSGList *sg,
                            DMADirection dir)
 {
+    uint8_t *ptr = buf;
     uint64_t resid;
     int sg_cur_index;
 
-- 
2.33.1


