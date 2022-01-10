Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D7B9C489124
	for <lists+qemu-devel@lfdr.de>; Mon, 10 Jan 2022 08:30:25 +0100 (CET)
Received: from localhost ([::1]:37058 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n6p8J-0007hU-4d
	for lists+qemu-devel@lfdr.de; Mon, 10 Jan 2022 02:30:25 -0500
Received: from eggs.gnu.org ([209.51.188.92]:34636)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1n6our-0007aS-Ei
 for qemu-devel@nongnu.org; Mon, 10 Jan 2022 02:16:29 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:40440)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1n6oup-0001oF-Tl
 for qemu-devel@nongnu.org; Mon, 10 Jan 2022 02:16:29 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1641798987;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=PkmPjMFI2QYTF4ymsLQZDYasSzvI4+OcUcmN+JMqJLE=;
 b=fwRybQ7QX4kZvUb9CgYNV9ni+EYp4OQLD4/pJguwmyVOE1LdtQXyA6IGsZcAVRpqkzVXhY
 7cT6usaJYPkA3vkmtkb/uTTfN6QTDr+ZRDhBpazc8HVWyy8WsmKz84TqFhEyJHoKQEWBC2
 BZ9Cpkzlm4DZxiw5DqvWUIcla8n3E2o=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-154-nExww7DSMniRij4oar_O_g-1; Mon, 10 Jan 2022 02:16:26 -0500
X-MC-Unique: nExww7DSMniRij4oar_O_g-1
Received: by mail-wm1-f72.google.com with SMTP id
 s190-20020a1ca9c7000000b00347c6c39d9aso3484502wme.5
 for <qemu-devel@nongnu.org>; Sun, 09 Jan 2022 23:16:25 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=PkmPjMFI2QYTF4ymsLQZDYasSzvI4+OcUcmN+JMqJLE=;
 b=Ewk2NnYCpGTXNazClrBBLUe7dk/d4QD6vjVsKdeo7ehONjHOlQp6tOGgiSmhPMgEz3
 SWOkyKkrQoQjCLUiuB5r07Fbl/1Ro1oZn/s+mC5MSmeBAAHJm5G9JzSvToI2u0nOuRn5
 PsaOSFq/dQehUHFSlOeoeiglXNSMwM0q9Nz2UhcBbB/tt1u+CFm2v3rCFSyqKbRRmiw4
 x1RTx8Uizor3TxA0SbomwUddxv22WnhklNrS+jPaqPfOGKUn9dTEU1zsBHMnu0onfv0H
 rZT0fPXAikXuynJnhQt1pV5Zx87mYpyO7gWoRW0NdrXYHv8BwWbMmKkXBhO8ItpX9Ez0
 rqeg==
X-Gm-Message-State: AOAM533P69xw7Z6LAr4V0BEAYhL0MTJ1CKn3HB1Kiiy4Thj7NOwm2ahR
 1GSqk5Nz/DMMYDFEfZeCm2I/cwFcvKWSONyW1F3eYDaHsTH161w7spkCN8y3qnG4oJsVlUEN9cf
 ghpLHE1jiWydq5e532neT1BFeM77En4eYv5jBGj4cacAkBfboNyYFf2g/dSyU
X-Received: by 2002:a05:600c:a54:: with SMTP id
 c20mr20569125wmq.48.1641798984675; 
 Sun, 09 Jan 2022 23:16:24 -0800 (PST)
X-Google-Smtp-Source: ABdhPJx6Z9RD850sa/ddpLJhxSwg5cHDUKVCxYC/tT+ctsq/APOnCRpMEvAtYTujBV345YzlFG/ypw==
X-Received: by 2002:a05:600c:a54:: with SMTP id
 c20mr20569106wmq.48.1641798984419; 
 Sun, 09 Jan 2022 23:16:24 -0800 (PST)
Received: from redhat.com ([2a03:c5c0:107d:b60c:c297:16fe:7528:e989])
 by smtp.gmail.com with ESMTPSA id b14sm5861636wrg.15.2022.01.09.23.16.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 09 Jan 2022 23:16:24 -0800 (PST)
Date: Mon, 10 Jan 2022 02:16:21 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 07/10] Revert "vhost: introduce new VhostOps
 vhost_set_config_call"
Message-ID: <20220110071547.195669-8-mst@redhat.com>
References: <20220110071547.195669-1-mst@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20220110071547.195669-1-mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.597,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This reverts commit 88062372340d33090b7f089ed3b1a00f530a8914.
---
 include/hw/virtio/vhost-backend.h | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/include/hw/virtio/vhost-backend.h b/include/hw/virtio/vhost-backend.h
index ff34eb7c8a..81bf3109f8 100644
--- a/include/hw/virtio/vhost-backend.h
+++ b/include/hw/virtio/vhost-backend.h
@@ -126,8 +126,6 @@ typedef int (*vhost_get_device_id_op)(struct vhost_dev *dev, uint32_t *dev_id);
 
 typedef bool (*vhost_force_iommu_op)(struct vhost_dev *dev);
 
-typedef int (*vhost_set_config_call_op)(struct vhost_dev *dev,
-                                       int fd);
 typedef struct VhostOps {
     VhostBackendType backend_type;
     vhost_backend_init vhost_backend_init;
@@ -173,7 +171,6 @@ typedef struct VhostOps {
     vhost_vq_get_addr_op  vhost_vq_get_addr;
     vhost_get_device_id_op vhost_get_device_id;
     vhost_force_iommu_op vhost_force_iommu;
-    vhost_set_config_call_op vhost_set_config_call;
 } VhostOps;
 
 int vhost_backend_update_device_iotlb(struct vhost_dev *dev,
-- 
MST


