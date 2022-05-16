Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AFF49528438
	for <lists+qemu-devel@lfdr.de>; Mon, 16 May 2022 14:32:29 +0200 (CEST)
Received: from localhost ([::1]:60564 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nqZtk-0002Bv-Pd
	for lists+qemu-devel@lfdr.de; Mon, 16 May 2022 08:32:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50100)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1nqY9n-0002ut-0U
 for qemu-devel@nongnu.org; Mon, 16 May 2022 06:40:55 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:36729)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1nqY9l-00060P-Cy
 for qemu-devel@nongnu.org; Mon, 16 May 2022 06:40:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1652697652;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=wQIFTLb45zQSJrTKig5KtDJeZj1urlocFpW9itg9ENo=;
 b=I+QBWmzx7xcjIheRSSZPbgPGxfZGtp0TSw8xYpl/wowqy7nZgvAqAsGUB2sSR6E/1LfsZ2
 nJ24L/yGNrmp9GTww4LBg0wrMDDgpeLNV2003Lm+OtvczajcZBEYrSZG883XHglmjd12yf
 a8XRi2pdeFJAFnHrA0g79SuOZIqmhY8=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-166-FtwotPr2O6ONPS_GCnJB5A-1; Mon, 16 May 2022 06:40:51 -0400
X-MC-Unique: FtwotPr2O6ONPS_GCnJB5A-1
Received: by mail-wm1-f71.google.com with SMTP id
 g14-20020a1c4e0e000000b0039425ef54d6so5438902wmh.9
 for <qemu-devel@nongnu.org>; Mon, 16 May 2022 03:40:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=wQIFTLb45zQSJrTKig5KtDJeZj1urlocFpW9itg9ENo=;
 b=Zd1mDrchJaUrcupsKWqTGwxV97vcLX08NGLJWTZseAoAc1r5AkTEHyZWuLknhgGTEm
 xc7oytebwp4PHSg5CwS/0PddYOD4og8vCvRkhTLBCMgKo6TyZvYbWyazhoNK10lZVGbq
 3+t9LV3+CX4EFmeaw+Cb3lz/RQGvRTF13uMv9qhseyF1y2S8i0eWo46t6BDRU6oJ8nBx
 NvsWHgqnjj0h4AvsgV5r3V6f7/imEhNB3GdUPAJvpFnIsXdJELOqNh6fY7jEA1H1SFqk
 +GIftc4LjjpwQhutpyNlQFkZEF633mWkukw9gKBxWcB/ZpnPx7KECadQtzZkh7a3S7r4
 O89A==
X-Gm-Message-State: AOAM5313vnfVZoh4glsPpVyCQ5ROLnPzMTys4FcCZiDeA8/TShWldm8v
 cRi5mc9Rph3asZ1k4mvoFDwQUS2KYNXVXPR2vJnfSdXDGkBJPnHz4vJ3LjqEMP0zu1qa4w4MkGK
 rqV7vPpxoLtbBCoAaq8/pqBxAYk8U3ARxhWYdq1lhcQ8xX4QieQBQ5fRKqnvN
X-Received: by 2002:a7b:cf36:0:b0:396:f50c:da05 with SMTP id
 m22-20020a7bcf36000000b00396f50cda05mr9564499wmg.90.1652697650370; 
 Mon, 16 May 2022 03:40:50 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJx2sPhTVcKKeSsGzQ571FHJxrD5fGckDA92cV9aNbPXLu5rGOiXDNK2JqhhSsYYviZ/jhUCPw==
X-Received: by 2002:a7b:cf36:0:b0:396:f50c:da05 with SMTP id
 m22-20020a7bcf36000000b00396f50cda05mr9564479wmg.90.1652697650104; 
 Mon, 16 May 2022 03:40:50 -0700 (PDT)
Received: from redhat.com ([2.55.141.66]) by smtp.gmail.com with ESMTPSA id
 e9-20020adfc849000000b0020c5253d8basm9706733wrh.6.2022.05.16.03.40.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 May 2022 03:40:49 -0700 (PDT)
Date: Mon, 16 May 2022 06:40:47 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Si-Wei Liu <si-wei.liu@oracle.com>,
 Stefano Garzarella <sgarzare@redhat.com>, Jason Wang <jasowang@redhat.com>,
 Eugenio =?utf-8?B?UMOpcmV6?= <eperezma@redhat.com>
Subject: [PULL 89/91] vhost-vdpa: backend feature should set only once
Message-ID: <20220516095448.507876-90-mst@redhat.com>
References: <20220516095448.507876-1-mst@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220516095448.507876-1-mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
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

From: Si-Wei Liu <si-wei.liu@oracle.com>

The vhost_vdpa_one_time_request() branch in
vhost_vdpa_set_backend_cap() incorrectly sends down
ioctls on vhost_dev with non-zero index. This may
end up with multiple VHOST_SET_BACKEND_FEATURES
ioctl calls sent down on the vhost-vdpa fd that is
shared between all these vhost_dev's.

To fix it, send down ioctl only once via the first
vhost_dev with index 0. Toggle the polarity of the
vhost_vdpa_one_time_request() test should do the
trick.

Fixes: 4d191cfdc7de ("vhost-vdpa: classify one time request")
Signed-off-by: Si-Wei Liu <si-wei.liu@oracle.com>
Reviewed-by: Stefano Garzarella <sgarzare@redhat.com>
Acked-by: Jason Wang <jasowang@redhat.com>
Acked-by: Eugenio Pérez <eperezma@redhat.com>
Message-Id: <1651890498-24478-6-git-send-email-si-wei.liu@oracle.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 hw/virtio/vhost-vdpa.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/virtio/vhost-vdpa.c b/hw/virtio/vhost-vdpa.c
index ed106bff47..870ab74b04 100644
--- a/hw/virtio/vhost-vdpa.c
+++ b/hw/virtio/vhost-vdpa.c
@@ -667,7 +667,7 @@ static int vhost_vdpa_set_backend_cap(struct vhost_dev *dev)
 
     features &= f;
 
-    if (vhost_vdpa_one_time_request(dev)) {
+    if (!vhost_vdpa_one_time_request(dev)) {
         r = vhost_vdpa_call(dev, VHOST_SET_BACKEND_FEATURES, &features);
         if (r) {
             return -EFAULT;
-- 
MST


