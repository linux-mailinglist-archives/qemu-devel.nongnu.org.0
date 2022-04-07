Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EF93E4F7C34
	for <lists+qemu-devel@lfdr.de>; Thu,  7 Apr 2022 11:54:10 +0200 (CEST)
Received: from localhost ([::1]:32964 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ncOqA-0007JE-2A
	for lists+qemu-devel@lfdr.de; Thu, 07 Apr 2022 05:54:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33772)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1ncOoG-0006eP-0q
 for qemu-devel@nongnu.org; Thu, 07 Apr 2022 05:52:12 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:33984)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1ncOoD-0003NK-8c
 for qemu-devel@nongnu.org; Thu, 07 Apr 2022 05:52:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1649325127;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=FgcfXjrvJer0JVW/CZeVkZHv48jUQO407BOciY2GhX8=;
 b=RFBm3gIleHu1nDGZ5RaqbhBe0DoXffP9lubc+A27DaMHTvwC5agr+I4JQftWN8OL1JZF0i
 RP1fy7kPNbufKVBsD8BGfWgeKz5Zuk2m/ZmXTQl06kanvh8rvwL7avU6Lb1y+K/cMvo5EA
 CDCed1soOozRmoWkP/nkAk96k8a8jSQ=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-148-qItTR9KHP52iAngmPDfAAw-1; Thu, 07 Apr 2022 05:52:04 -0400
X-MC-Unique: qItTR9KHP52iAngmPDfAAw-1
Received: by mail-wm1-f69.google.com with SMTP id
 n21-20020a05600c4f9500b0038e3b0aa367so2975667wmq.1
 for <qemu-devel@nongnu.org>; Thu, 07 Apr 2022 02:52:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
 :content-disposition:content-transfer-encoding;
 bh=FgcfXjrvJer0JVW/CZeVkZHv48jUQO407BOciY2GhX8=;
 b=dcWkG0bSLzTAYfUWDSMcywGc9CrRaAMJBwQYmMkI4mlL+1zh+7GVP22RDB2soX1G2M
 M86GnqSprRlclPq3G/1a1wt/yIXidSWqLI5aiA6342BXBxnBVWrVLs66sggIuoIJbMtT
 1oWWMCZg4iWx9aYvVqUW5fWlsXDXB/ATnLoKLV5ZjP3uHRx5VD5xmsoo7JGnBqGzp2bS
 PB1jo14w35VcboEoqRG2e/CKrVhaUb6RmxXLo1svGeF92QL2ehWN0V2WiQRE8MYQyjcJ
 Hacfki1NcPwEvygBh3ND6YZtfE8rPjMK++9D2KCM9bNxqrQe0izJI4Jz25J0xjPJxnqF
 5F3Q==
X-Gm-Message-State: AOAM532G61ECYHl9kEESwf3viXZgdSjIBVHpShxke+8SBx7jlaf0TUhc
 Io4Oh+p+YjXkqfs+DB2rCTOgViopg/6a9Wlwg9xDDOUpkQUkPyJNsEV42bvWLJwgMzQJAbs1ODA
 WYP9+ivRYcKhTw61kTwRcbWWZk6UW5j1/8iLFlgbt5HrbtlUdl6wVBtSrPPxt
X-Received: by 2002:a5d:598c:0:b0:205:a7ab:fe52 with SMTP id
 n12-20020a5d598c000000b00205a7abfe52mr9857467wri.411.1649325122955; 
 Thu, 07 Apr 2022 02:52:02 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw9tPDcayjhhIzDglLXSV4+nUsHFDMFXgMB/UyCPHC2UFyXMHkLhQATORYAo70ruUIU7AWHsA==
X-Received: by 2002:a5d:598c:0:b0:205:a7ab:fe52 with SMTP id
 n12-20020a5d598c000000b00205a7abfe52mr9857440wri.411.1649325122540; 
 Thu, 07 Apr 2022 02:52:02 -0700 (PDT)
Received: from redhat.com ([2.55.139.64]) by smtp.gmail.com with ESMTPSA id
 f13-20020a05600c4e8d00b0038c949ef0d5sm8793312wmq.8.2022.04.07.02.52.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 Apr 2022 02:52:01 -0700 (PDT)
Date: Thu, 7 Apr 2022 05:51:59 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org, Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH for-7.0] virtio-iommu: use-after-free fix
Message-ID: <20220407095047.50371-1-mst@redhat.com>
MIME-Version: 1.0
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
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: Eric Auger <eric.auger@redhat.com>, Wentao Liang <Wentao_Liang_g@163.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Wentao Liang <Wentao_Liang_g@163.com>

A potential Use-after-free was reported in virtio_iommu_handle_command
when using virtio-iommu:

> I find a potential Use-after-free in QEMU 6.2.0, which is in
> virtio_iommu_handle_command() (./hw/virtio/virtio-iommu.c).
>
>
> Specifically, in the loop body, the variable 'buf' allocated at line 639 can be
> freed by g_free() at line 659. However, if the execution path enters the loop
> body again and the if branch takes true at line 616, the control will directly
> jump to 'out' at line 651. At this time, 'buf' is a freed pointer, which is not
> assigned with an allocated memory but used at line 653. As a result, a UAF bug
> is triggered.
>
>
>
> 599     for (;;) {
> ...
> 615         sz = iov_to_buf(iov, iov_cnt, 0, &head, sizeof(head));
> 616         if (unlikely(sz != sizeof(head))) {
> 617             tail.status = VIRTIO_IOMMU_S_DEVERR;
> 618             goto out;
> 619         }
> ...
> 639             buf = g_malloc0(output_size);
> ...
> 651 out:
> 652         sz = iov_from_buf(elem->in_sg, elem->in_num, 0,
> 653                           buf ? buf : &tail, output_size);
> ...
> 659         g_free(buf);
>
> We can fix it by set ‘buf‘ to NULL after freeing it:
>
>
> 651 out:
> 652         sz = iov_from_buf(elem->in_sg, elem->in_num, 0,
> 653                           buf ? buf : &tail, output_size);
> ...
> 659         g_free(buf);
> +++ buf = NULL;
> 660     }

Fix as suggested by the reporter.

Signed-off-by: Wentao Liang <Wentao_Liang_g@163.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
Message-ID: <20220406040445-mutt-send-email-mst@kernel.org>
---
 hw/virtio/virtio-iommu.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/hw/virtio/virtio-iommu.c b/hw/virtio/virtio-iommu.c
index 239fe97b12..2b1d21edd1 100644
--- a/hw/virtio/virtio-iommu.c
+++ b/hw/virtio/virtio-iommu.c
@@ -683,6 +683,7 @@ out:
         virtio_notify(vdev, vq);
         g_free(elem);
         g_free(buf);
+        buf = NULL;
     }
 }
 
-- 
MST


