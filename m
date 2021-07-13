Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C86113C798D
	for <lists+qemu-devel@lfdr.de>; Wed, 14 Jul 2021 00:21:15 +0200 (CEST)
Received: from localhost ([::1]:37610 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m3QmA-0003nP-4D
	for lists+qemu-devel@lfdr.de; Tue, 13 Jul 2021 18:21:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55374)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1m3Qce-0000Rm-T5
 for qemu-devel@nongnu.org; Tue, 13 Jul 2021 18:11:24 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:53510)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1m3Qcc-0008N5-0o
 for qemu-devel@nongnu.org; Tue, 13 Jul 2021 18:11:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1626214281;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=flEK484QxMT1aHuKxIzbr2uWeLGle3LeEcxZhYEt/9E=;
 b=aCil7zAxXxtjxc8XzwtgeWyPXHqU2lQUAyQgDO6gnG8ZE2b2FXcm2Kx++GUhzNOpcJaRJN
 GYvVCbqs0MF4sL6qZDcnpjS4p8yS43cfG6nH96yDTX3O717FPXaXiVlfgWrRPRd8xxu23g
 BxnLvsi7y1ELN81ydP3wS/Q5uIJKIhw=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-422-iXcQ75oEPsK4SEG411b2tA-1; Tue, 13 Jul 2021 18:11:19 -0400
X-MC-Unique: iXcQ75oEPsK4SEG411b2tA-1
Received: by mail-wr1-f72.google.com with SMTP id
 d9-20020adffbc90000b029011a3b249b10so334804wrs.3
 for <qemu-devel@nongnu.org>; Tue, 13 Jul 2021 15:11:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=flEK484QxMT1aHuKxIzbr2uWeLGle3LeEcxZhYEt/9E=;
 b=jyIOPRe+wVElQma/Wk2mz2cNblD3rfXSheto6CnhxXevgqNpQlzjODNUzLBmeUa3y+
 OGdr5gkB1g8QCySYEC6nWfR35lLLwfQhP2fBELFvamVXlXsC4rYyR+5O1yQ8Wb5Z0WuQ
 d9p7ZuvCEikqnTloAmxUS0WJIIPT2FDVQS6ussO9xgtbMgMjkP8EXLG8ogjbedXRTCRH
 gmTW7axD92rXT2Cr4Ro2Vry2SS2rH/H7vSwmtsnAV0rByNqmNft4gM5I1Jv5wj7FxAKU
 c3cL7BEjEarHxeMx9bSoTJOA7m5H1lR1OQcSLMBfscf6ViXzanqvXYSldRBXYxTv/lLN
 IB7w==
X-Gm-Message-State: AOAM532h4sJa/D2/91Svl0RiVhlvBwG4mWnukKmIGMPoeZLczjhutzbp
 bddvMcspEuJE85jUNWYY4DyTsALrRZULQaFZ9zz98Q5cwrv9lygyy/eT5VwCxmsg37sKxthCNxK
 aeU579DooI01Ke1ps6TdSgvF2vBGPc8WzB8PCdhtFJOQz2Zz+eqVffZBhX807
X-Received: by 2002:a05:6000:10c3:: with SMTP id
 b3mr8497278wrx.271.1626214278480; 
 Tue, 13 Jul 2021 15:11:18 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzLlEFDx1orgfBLk5oh4WlQ45ddz/PCP/CySmd1a13+CuF562YCIERHuyPL0/uwK/Wh1enqtA==
X-Received: by 2002:a05:6000:10c3:: with SMTP id
 b3mr8497261wrx.271.1626214278346; 
 Tue, 13 Jul 2021 15:11:18 -0700 (PDT)
Received: from redhat.com ([2.55.15.23])
 by smtp.gmail.com with ESMTPSA id o11sm263555wmq.1.2021.07.13.15.11.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 13 Jul 2021 15:11:17 -0700 (PDT)
Date: Tue, 13 Jul 2021 18:11:15 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 21/23] hw/i386/acpi-build: Add IVRS support to bypass iommu
Message-ID: <20210713220946.212562-22-mst@redhat.com>
References: <20210713220946.212562-1-mst@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210713220946.212562-1-mst@redhat.com>
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
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
 Xingang Wang <wangxingang5@huawei.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Igor Mammedov <imammedo@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Xingang Wang <wangxingang5@huawei.com>

Check bypass_iommu to exclude the devices which will bypass iommu.

Signed-off-by: Xingang Wang <wangxingang5@huawei.com>
Message-Id: <1625748919-52456-9-git-send-email-wangxingang5@huawei.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 hw/i386/acpi-build.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/i386/acpi-build.c b/hw/i386/acpi-build.c
index 7efc6285ac..17836149fe 100644
--- a/hw/i386/acpi-build.c
+++ b/hw/i386/acpi-build.c
@@ -2263,7 +2263,7 @@ ivrs_host_bridges(Object *obj, void *opaque)
     if (object_dynamic_cast(obj, TYPE_PCI_HOST_BRIDGE)) {
         PCIBus *bus = PCI_HOST_BRIDGE(obj)->bus;
 
-        if (bus) {
+        if (bus && !pci_bus_bypass_iommu(bus)) {
             pci_for_each_device(bus, pci_bus_num(bus), insert_ivhd, ivhd_blob);
         }
     }
-- 
MST


