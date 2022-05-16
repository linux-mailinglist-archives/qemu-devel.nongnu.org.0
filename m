Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 86379529318
	for <lists+qemu-devel@lfdr.de>; Mon, 16 May 2022 23:45:18 +0200 (CEST)
Received: from localhost ([::1]:46226 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nqiWj-0003WX-KA
	for lists+qemu-devel@lfdr.de; Mon, 16 May 2022 17:45:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60014)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1nqhl2-000453-Aa
 for qemu-devel@nongnu.org; Mon, 16 May 2022 16:56:00 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:23379)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1nqhl0-0007Cp-O6
 for qemu-devel@nongnu.org; Mon, 16 May 2022 16:56:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1652734558;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=wQIFTLb45zQSJrTKig5KtDJeZj1urlocFpW9itg9ENo=;
 b=NU+KvCT59FrBFrOo3Qj2OLp8zW4PvmwWt/oiBq7kDOfDnQlMSaJCe7x+q9tz/qaBztz1f5
 TouyZDFuk7k7V/RNGUc+WfHkXGL3S1sQiSa3Od+ZIS/+v936jKtP/1T9n0ybrMQ4i5jZfG
 qqwLDmtT2j2oPm5Oa2/VQJ2o0rhl/O0=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-163-jSXv7oVIONWzt4fOG3B3TQ-1; Mon, 16 May 2022 16:55:56 -0400
X-MC-Unique: jSXv7oVIONWzt4fOG3B3TQ-1
Received: by mail-ed1-f70.google.com with SMTP id
 p13-20020aa7c4cd000000b0042ab847aba8so1861973edr.0
 for <qemu-devel@nongnu.org>; Mon, 16 May 2022 13:55:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=wQIFTLb45zQSJrTKig5KtDJeZj1urlocFpW9itg9ENo=;
 b=oSGIc1JQalaXs7tjLVen3SMlaY7u7k9ENC3HVVgXaaGmZ9fSNpH5oGB0WtcZrdE/pv
 DyWPNxADewBbv5fSBoLYJgwDq1CzPMg3oYd2ez+Fvt8s9Xx2J1fefxJRwL62Em6ukSP0
 l3co3WCv9UowWbYLUMKJ2WPiPDA+5Tu057bjpMN5iGmFPnJI3ygbasiZ0VM2LAEkSReh
 OxwaDI+6Mwd/gWRsDaScxVRsSH5U+gka5jokZnpfGCbjHnF6AvfvGYMVU93mF/GJVtVd
 GWx6IPZa9xKWeboOUjd+T/S5GD5vAyBXx9OHxEE2hjBClhdtaN2MKcchGePrvcheelHX
 BArg==
X-Gm-Message-State: AOAM530jzegWFUxIro1Q6n5c4dgTo7so4JA1EJc3fJBqBCVKurIjR4lk
 X+QGSQAIJPZ2no2EojtXEb8nxnyeMMm5dHRAFcok41wLd3Hp33ZCXdvGiU5O6KJ1vFoOdJsgKhX
 FKioDnGV53OoKg7oC86wFhJRe+Hdm05Kbl18L0EQx/VNLSHVuTOq/zILphQbX
X-Received: by 2002:a05:6402:1706:b0:42a:a40a:17c6 with SMTP id
 y6-20020a056402170600b0042aa40a17c6mr11648780edu.38.1652734555448; 
 Mon, 16 May 2022 13:55:55 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxxz18v0Znz+fCknp5f4VvfhqU9Dg++XNXILm5cVInkc5zA10X0fI0E82Ylz+51jaQQ/6rrUQ==
X-Received: by 2002:a05:6402:1706:b0:42a:a40a:17c6 with SMTP id
 y6-20020a056402170600b0042aa40a17c6mr11648755edu.38.1652734555242; 
 Mon, 16 May 2022 13:55:55 -0700 (PDT)
Received: from redhat.com ([2.55.131.38]) by smtp.gmail.com with ESMTPSA id
 p6-20020aa7c886000000b0042ab0500495sm2409748eds.36.2022.05.16.13.55.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 May 2022 13:55:54 -0700 (PDT)
Date: Mon, 16 May 2022 16:55:51 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Si-Wei Liu <si-wei.liu@oracle.com>,
 Stefano Garzarella <sgarzare@redhat.com>, Jason Wang <jasowang@redhat.com>,
 Eugenio =?utf-8?B?UMOpcmV6?= <eperezma@redhat.com>
Subject: [PULL v2 83/86] vhost-vdpa: backend feature should set only once
Message-ID: <20220516204913.542894-84-mst@redhat.com>
References: <20220516204913.542894-1-mst@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220516204913.542894-1-mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mst@redhat.com;
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


