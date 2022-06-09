Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 851195449BE
	for <lists+qemu-devel@lfdr.de>; Thu,  9 Jun 2022 13:08:02 +0200 (CEST)
Received: from localhost ([::1]:59620 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nzG1B-00070o-Eo
	for lists+qemu-devel@lfdr.de; Thu, 09 Jun 2022 07:08:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41500)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1nzEGY-0006Em-D3
 for qemu-devel@nongnu.org; Thu, 09 Jun 2022 05:15:46 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:50693)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1nzEGW-0007O6-4Z
 for qemu-devel@nongnu.org; Thu, 09 Jun 2022 05:15:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1654766143;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=orF3KM0omWlWJzl4+7wtwgGFsa07cv/TcVHHvRE/e/c=;
 b=B+6kpnDDOVLvNwBuNGDvEHTN1AGnmre/0mEZMR+cFAayngRxwshh2xd4Ua2vEbJ/pXJrhQ
 YIGwRi6BR3RrV8g8ohEZYXC/CeGUGRhupzhlb2WivOz7sc8ntDonUa9DW5DENrlzsOU+mD
 R9LkAAE/TlAGHCUW1V9yNERWiPYR56E=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-663-6poY1KRlNOWhs6Njgd4oQQ-1; Thu, 09 Jun 2022 05:15:41 -0400
X-MC-Unique: 6poY1KRlNOWhs6Njgd4oQQ-1
Received: by mail-ej1-f71.google.com with SMTP id
 l2-20020a170906078200b006fed42bfeacso10677053ejc.16
 for <qemu-devel@nongnu.org>; Thu, 09 Jun 2022 02:15:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=orF3KM0omWlWJzl4+7wtwgGFsa07cv/TcVHHvRE/e/c=;
 b=orkDEZeDKcPc2WIppOlRgZZZ+QtpSBDPuvXEFL/kjlgYtqTbvR4hlNXeupJk2uBx+v
 HnPYl4i1vnpMgLmD52q+JCot/GM+c9Dr3XHOocFdGMDofz2OlIOAbSVTGUX6WtLnzx1Z
 qqp+4I2gQ+onY3o2Xr0OSGPJU+sI5FdVCJWJQRQHnxzapWqaG/heP+HeZafhnIoQuKhA
 si1RYTYid5iHWKPCr2G9MsN3F//SLjUlafUJI8fLpUgbfUTvfV8Njb/JnQlpScT75u8c
 HomoUmyEozaLV9FRC1/QbDuajhQXQXMmflWCwbO9qH4jvCyB+pR+mhLag/kz6UCM92or
 Y6vA==
X-Gm-Message-State: AOAM531bh06wp09JJpcj/UOwozh26wR6FKmub1uBBmtE/YbCyOlQtago
 b12uRUzND+tHuGxgEyhpo1LNy7+/S0j7FHbkvXgeooL79plVFlwRv0vAiBYlc33Qph59HQ91qA5
 LCD8KUayp1yQvIBcbtexyiUbQSDuWgrqZbYWCukdY/d+yq0LnubpQleFebHMzaljmlOw=
X-Received: by 2002:a05:6402:56:b0:431:6f7b:533 with SMTP id
 f22-20020a056402005600b004316f7b0533mr19201399edu.333.1654766140195; 
 Thu, 09 Jun 2022 02:15:40 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz+DvukQnT1gb1SuO3TABJU2qqmabGzCgSrJWJp6Xr6efK7izbTL7K5+QLzGjAI4Vb5EOTGvw==
X-Received: by 2002:a05:6402:56:b0:431:6f7b:533 with SMTP id
 f22-20020a056402005600b004316f7b0533mr19201375edu.333.1654766139875; 
 Thu, 09 Jun 2022 02:15:39 -0700 (PDT)
Received: from goa-sendmail ([2001:b07:6468:f312:9af8:e5f5:7516:fa89])
 by smtp.gmail.com with ESMTPSA id
 r7-20020aa7d147000000b0042dd792b3e8sm14023219edo.50.2022.06.09.02.15.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Jun 2022 02:15:39 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: mst@redhat.com,
	thuth@redhat.com
Subject: [PATCH 2/4] virtio-mmio: stop ioeventfd on legacy reset
Date: Thu,  9 Jun 2022 11:15:32 +0200
Message-Id: <20220609091534.1416909-3-pbonzini@redhat.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220609091534.1416909-1-pbonzini@redhat.com>
References: <20220609091534.1416909-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

If the queue PFN is set to zero on a virtio-mmio device, the device is reset.
In that case however the virtio_bus_stop_ioeventfd function was not
called; add it so that the behavior is similar to when status is set to 0.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 hw/virtio/virtio-mmio.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/hw/virtio/virtio-mmio.c b/hw/virtio/virtio-mmio.c
index 688eccda94..41a35d31c8 100644
--- a/hw/virtio/virtio-mmio.c
+++ b/hw/virtio/virtio-mmio.c
@@ -376,6 +376,7 @@ static void virtio_mmio_write(void *opaque, hwaddr offset, uint64_t value,
             return;
         }
         if (value == 0) {
+            virtio_mmio_stop_ioeventfd(proxy);
             virtio_reset(vdev);
         } else {
             virtio_queue_set_addr(vdev, vdev->queue_sel,
-- 
2.36.1



