Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9839A4334C4
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Oct 2021 13:34:01 +0200 (CEST)
Received: from localhost ([::1]:42088 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mcnNY-0003fh-Ld
	for lists+qemu-devel@lfdr.de; Tue, 19 Oct 2021 07:34:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50414)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1mcnAp-0000Lp-Fp
 for qemu-devel@nongnu.org; Tue, 19 Oct 2021 07:20:53 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:24766)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1mcnAd-0002PG-O2
 for qemu-devel@nongnu.org; Tue, 19 Oct 2021 07:20:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1634642438;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=A7I3owIbz1hLTkvG+O1oeRq8T2bvra3NbCuqdt9S6fE=;
 b=Ne93fdCCOZwzxQq0sRjJk+ahEp4K/Vw2YTtGzsmLaHem4UuUhXqII4iRW/3Q8KmU6RfHX4
 k/5Tm19i4laXz1v7yEPoQBH3cF2WfyJrOzxk2FfmUNwIdsyhvSt/ybjRQ21yTMLdMLhXdT
 ogLMAKc/nIViCkALsc6g0VvXUGe66ic=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-208-upQCpUxIOb6iGGOhZDc8Uw-1; Tue, 19 Oct 2021 07:20:37 -0400
X-MC-Unique: upQCpUxIOb6iGGOhZDc8Uw-1
Received: by mail-ed1-f71.google.com with SMTP id
 c25-20020a056402143900b003dc19782ea8so13794476edx.3
 for <qemu-devel@nongnu.org>; Tue, 19 Oct 2021 04:20:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=A7I3owIbz1hLTkvG+O1oeRq8T2bvra3NbCuqdt9S6fE=;
 b=sAq8xYRXB6KZjPinr9GJvwoO/D/7sOMHQQCUibVJMJtmdGXA+G4IxBBheTB074oN2E
 r0LujUbjtqn5neRx08CEND1XDFYCs/Lb6AggSPEbWtnRX4+z2sbwg/tvatR4JAms03qg
 tcQOkIvTAV/Aaf5tp1tewGzUao0kXIWU8LiAjD9RXyquow/33+0KIAHqeArvUGnhA9fb
 Vudzwuubgp+LcPVYgvvzzSUN3HU2IEEOx2BIBjOkqhwPWQxsHilNOm4rxEpXh873x+or
 QI0eSTPvVVL302ILSuegJfAKvKKikfYzDhfaqnkIImKYdKUlyNdP5fzMu4oFoC1t/sMS
 Zoqg==
X-Gm-Message-State: AOAM533M/kt9Eq/brpUBBXc6cajThMqE5c/SK3s0HE7e3SsPiuMLt97K
 wvtTrJkMhJoBNtjfLDYReySraIB1efZfiwpOzIhrCKmUWYOZYtBmOC9RMad39JEvGe5cG++/PHl
 a03A6pmz59zOIKSYmwkuEuuxwmGiD+sIem0XeRNCdkyvgdAk8S95z/CbP1QFS
X-Received: by 2002:a17:907:16aa:: with SMTP id
 hc42mr33239746ejc.39.1634642436179; 
 Tue, 19 Oct 2021 04:20:36 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyTwnrMkcR97yMvkiwhdxoHh3HUMF24bWGCENEd+FjBMXivtEzTcK3UX1NvA3hVO32B2Z+LAg==
X-Received: by 2002:a17:907:16aa:: with SMTP id
 hc42mr33239722ejc.39.1634642435886; 
 Tue, 19 Oct 2021 04:20:35 -0700 (PDT)
Received: from redhat.com ([2.55.24.172])
 by smtp.gmail.com with ESMTPSA id y19sm12035659edd.39.2021.10.19.04.20.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 19 Oct 2021 04:20:35 -0700 (PDT)
Date: Tue, 19 Oct 2021 07:20:33 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 19/29] virtio-iommu: Remove the non transitional name
Message-ID: <20211019111923.679826-20-mst@redhat.com>
References: <20211019111923.679826-1-mst@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20211019111923.679826-1-mst@redhat.com>
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
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
 Jean-Philippe Brucker <jean-philippe@linaro.org>,
 Cornelia Huck <cohuck@redhat.com>, Andrea Bolognani <abologna@redhat.com>,
 Eric Auger <eric.auger@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Eric Auger <eric.auger@redhat.com>

Remove the non transitional name for virtio iommu. Like other
devices introduced after 1.0 spec, the virtio-iommu does
not need it.

Signed-off-by: Eric Auger <eric.auger@redhat.com>
Reported-by: Andrea Bolognani <abologna@redhat.com>
Reviewed-by: Cornelia Huck <cohuck@redhat.com>
Message-Id: <20211013191755.767468-2-eric.auger@redhat.com>
Reviewed-by: Jean-Philippe Brucker <jean-philippe@linaro.org>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 hw/virtio/virtio-iommu-pci.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/hw/virtio/virtio-iommu-pci.c b/hw/virtio/virtio-iommu-pci.c
index 770c286be7..86fa4e6c28 100644
--- a/hw/virtio/virtio-iommu-pci.c
+++ b/hw/virtio/virtio-iommu-pci.c
@@ -100,7 +100,6 @@ static void virtio_iommu_pci_instance_init(Object *obj)
 static const VirtioPCIDeviceTypeInfo virtio_iommu_pci_info = {
     .base_name             = TYPE_VIRTIO_IOMMU_PCI,
     .generic_name          = "virtio-iommu-pci",
-    .non_transitional_name = "virtio-iommu-pci-non-transitional",
     .instance_size = sizeof(VirtIOIOMMUPCI),
     .instance_init = virtio_iommu_pci_instance_init,
     .class_init    = virtio_iommu_pci_class_init,
-- 
MST


