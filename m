Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0631043495D
	for <lists+qemu-devel@lfdr.de>; Wed, 20 Oct 2021 12:51:22 +0200 (CEST)
Received: from localhost ([::1]:49332 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1md9Bp-0005l9-0y
	for lists+qemu-devel@lfdr.de; Wed, 20 Oct 2021 06:51:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48292)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1md8hi-0004Pg-DK
 for qemu-devel@nongnu.org; Wed, 20 Oct 2021 06:20:15 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:36739)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1md8hg-0003Jc-TD
 for qemu-devel@nongnu.org; Wed, 20 Oct 2021 06:20:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1634725212;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=A7I3owIbz1hLTkvG+O1oeRq8T2bvra3NbCuqdt9S6fE=;
 b=N3RMdzZ60ZjWYgoEfvaPpVGjYhQ61im38ZHrN3nh7JPxNYjK+XUsAmVZAaqxk+wkWarnND
 fRYAI6JijXNp1vMD4ZYx5yWHEGgXh5w/f9zhptsDhrl1xLoUZNs/qECv9t++u+QDabGLJ+
 qy2H4tBzcJwmCuKUd9NXDWhYvj3cE+s=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-588--FVG5KQ9OLSXY5FkGgjKHg-1; Wed, 20 Oct 2021 06:20:10 -0400
X-MC-Unique: -FVG5KQ9OLSXY5FkGgjKHg-1
Received: by mail-ed1-f72.google.com with SMTP id
 f4-20020a50e084000000b003db585bc274so20480302edl.17
 for <qemu-devel@nongnu.org>; Wed, 20 Oct 2021 03:20:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=A7I3owIbz1hLTkvG+O1oeRq8T2bvra3NbCuqdt9S6fE=;
 b=w9GLSYDz0FJE1/myAhQIXe4453a7d0or40VMg7t4OY1MsO+MSDyjnruSQl8cfF3PIK
 7B2a9Ula30M694btRG47b9g5o1wwynXzjYZ8uG7H4Hc94ENYfRICSyvdfixJxFd67n+n
 srCVeJToQu7DIiel7kzTra56X2n59ukJeq2KrU+CNxd4A1xq5nYp+4MFKfvctAxuT1/J
 CaA8WbiRWmh5ddsLVFc8NrOwKXmDu3tqBhyQVYQn4+tSavQaUCrB5cKlr4r3sK4dL6lz
 Ww5FYP6r4VhWl7u0LsObe7Y0Y3+WKV0PaqCHTI01Yamz664zpFipxCfDFWc5a4hywqlM
 ESJw==
X-Gm-Message-State: AOAM531rQVcwfLAs1KkCVRULJGCWgCQNUNOB94sg8EmrFhgZf0E1gRRY
 BdOf9+zZ5wnnB8idN7CId7NCrZFvf8d6ai46WdzedD8vALY+Y3DTECvIIoP+D1ptn09vsL242ap
 Qy3BRn8Z9eRW0NVetNJbFH3E/TPCszOCfh1BsO+VhMDjtlJEDWqKTvpip9hNa
X-Received: by 2002:a05:6402:42ce:: with SMTP id
 i14mr62789764edc.5.1634725208514; 
 Wed, 20 Oct 2021 03:20:08 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyCIuvA6l8ORedk+zYheKbUkSIKpydsNNa+TWQmTgDqcmwYjt3uWGjecU8BxI0JiuaDbUdKlw==
X-Received: by 2002:a05:6402:42ce:: with SMTP id
 i14mr62789743edc.5.1634725208328; 
 Wed, 20 Oct 2021 03:20:08 -0700 (PDT)
Received: from redhat.com ([2.55.24.172])
 by smtp.gmail.com with ESMTPSA id b7sm857374ejl.10.2021.10.20.03.20.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 20 Oct 2021 03:20:07 -0700 (PDT)
Date: Wed, 20 Oct 2021 06:20:05 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL v2 19/44] virtio-iommu: Remove the non transitional name
Message-ID: <20211020101844.988480-20-mst@redhat.com>
References: <20211020101844.988480-1-mst@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20211020101844.988480-1-mst@redhat.com>
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


