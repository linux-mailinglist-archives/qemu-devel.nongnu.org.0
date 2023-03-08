Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F31706AFBE6
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Mar 2023 02:14:46 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pZiLK-00015B-5K; Tue, 07 Mar 2023 20:11:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1pZiLI-00011t-8f
 for qemu-devel@nongnu.org; Tue, 07 Mar 2023 20:11:44 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1pZiLG-0001ZH-T2
 for qemu-devel@nongnu.org; Tue, 07 Mar 2023 20:11:44 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1678237902;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=FyT6N8lDTFKoLVEIvDcV9LdLznYSzYH679P93J0oUXE=;
 b=MPnZg/6YhRBu5nFNbeOgDFjadsWbJ3d7uN3BuLFmVwvghheVwvR3TmzXtKOtE0vxdzJeDq
 4dFmEVef6sF5r79WftLKSW3CLQqYmkEN1n/GzyOdWGx3lc7FE1/q4UmBPZVYpoJS3f5+ir
 8CZGn6aRenjgvnEjFMQc9x0TBOK2fvc=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-303-AfKxDybwPOK7B2Pbx0j5hg-1; Tue, 07 Mar 2023 20:11:40 -0500
X-MC-Unique: AfKxDybwPOK7B2Pbx0j5hg-1
Received: by mail-ed1-f71.google.com with SMTP id
 b7-20020a056402350700b004d2a3d5cd3fso16146416edd.8
 for <qemu-devel@nongnu.org>; Tue, 07 Mar 2023 17:11:40 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678237899;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=FyT6N8lDTFKoLVEIvDcV9LdLznYSzYH679P93J0oUXE=;
 b=xRj7ShBl5grvRZqJuz4i+ykKOoWVM6Dsj5zMDRd4X528tOxUs4Lw4ctd8rNTwjIpOE
 d8BRVIasNJudZQ0chZd00dvxVhNI0hl+XSknlohLc0uHPiXBCAN52VzJQg4Gm514nHcG
 bBwD/Rb+vsOcAylPbirBJuFB2cRWB//QMh1/ISc1E6A+EBZq1LwgEhw/LOpG7AuC1pj9
 CZk+SrS+J9xxDFssXVHdHXI1G86+U9uDdwydFZcAdwzA48bV8l5eiZysyAj51w5rgW7S
 c4a7gk/yn48apPC7bweL/FjS4fOMoP75+inXbNYNCtBP/1SVZ6L2OyP60bV7YRAFceQk
 F8fQ==
X-Gm-Message-State: AO0yUKXCAecIWREHQjbfwajVQn3CUGHqbMxt09y1t32d/dFuqOqZ2LOq
 SSP8YyeXEeNic1JCY4QXWkUcYtSd9HmkhMU9z0yzzQx+QZkNixS5mRYg+WPMXewNX9w1wB5b4Sb
 2MP9lQg4cU4OO9LyxEAKcEpAcNhslJJtvncsnInzD0ICguEeXgYcF+fAahJzxr7vWkerB
X-Received: by 2002:a17:906:3197:b0:8b1:3293:ead2 with SMTP id
 23-20020a170906319700b008b13293ead2mr17389707ejy.25.1678237899020; 
 Tue, 07 Mar 2023 17:11:39 -0800 (PST)
X-Google-Smtp-Source: AK7set83wB0wRh0T5Qkx8fAgsHJ2BDpc/+W7FSTwY1vpXj8Ci8VCbWhKeHMsAn4SQuVvAbFi1FXhAQ==
X-Received: by 2002:a17:906:3197:b0:8b1:3293:ead2 with SMTP id
 23-20020a170906319700b008b13293ead2mr17389693ejy.25.1678237898822; 
 Tue, 07 Mar 2023 17:11:38 -0800 (PST)
Received: from redhat.com ([2.52.138.216]) by smtp.gmail.com with ESMTPSA id
 jy24-20020a170907763800b008d7a8083dffsm6767036ejc.222.2023.03.07.17.11.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Mar 2023 17:11:38 -0800 (PST)
Date: Tue, 7 Mar 2023 20:11:36 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Eugenio =?utf-8?B?UMOpcmV6?= <eperezma@redhat.com>,
 Jason Wang <jasowang@redhat.com>, Lei Yang <leiyang@redhat.com>
Subject: [PULL 15/73] vdpa: Negotiate _F_SUSPEND feature
Message-ID: <d83b4945805d68f47742f70bba2ea4d5c9880dc8.1678237635.git.mst@redhat.com>
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

From: Eugenio Pérez <eperezma@redhat.com>

This is needed for qemu to know it can suspend the device to retrieve
its status and enable SVQ with it, so all the process is transparent to
the guest.

Signed-off-by: Eugenio Pérez <eperezma@redhat.com>
Acked-by: Jason Wang <jasowang@redhat.com>
Message-Id: <20230303172445.1089785-4-eperezma@redhat.com>
Tested-by: Lei Yang <leiyang@redhat.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 hw/virtio/vhost-vdpa.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/hw/virtio/vhost-vdpa.c b/hw/virtio/vhost-vdpa.c
index 108cd63289..5cfa9d5d27 100644
--- a/hw/virtio/vhost-vdpa.c
+++ b/hw/virtio/vhost-vdpa.c
@@ -659,7 +659,8 @@ static int vhost_vdpa_set_backend_cap(struct vhost_dev *dev)
     uint64_t features;
     uint64_t f = 0x1ULL << VHOST_BACKEND_F_IOTLB_MSG_V2 |
         0x1ULL << VHOST_BACKEND_F_IOTLB_BATCH |
-        0x1ULL << VHOST_BACKEND_F_IOTLB_ASID;
+        0x1ULL << VHOST_BACKEND_F_IOTLB_ASID |
+        0x1ULL << VHOST_BACKEND_F_SUSPEND;
     int r;
 
     if (vhost_vdpa_call(dev, VHOST_GET_BACKEND_FEATURES, &features)) {
-- 
MST


