Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C7FCF4CD655
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Mar 2022 15:27:47 +0100 (CET)
Received: from localhost ([::1]:33416 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nQ8uI-0001CG-Os
	for lists+qemu-devel@lfdr.de; Fri, 04 Mar 2022 09:27:46 -0500
Received: from eggs.gnu.org ([209.51.188.92]:56960)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1nQ8Bb-0003pc-TD
 for qemu-devel@nongnu.org; Fri, 04 Mar 2022 08:41:36 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:59048)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1nQ8Ba-0001BC-Hx
 for qemu-devel@nongnu.org; Fri, 04 Mar 2022 08:41:35 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1646401294;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=0SLrr2pzwbz8DMCaGa52u4y7YRyNCIg4T/EysVR8B14=;
 b=PwhnroneBvG65zK6mcFTOP+6ZWzrskVBYHSMRnB4WepARWtNXPgdemAtNtfQ1WUkn7w4KB
 CCZTUcqp+MHrpUNdZvy68bZ9Imy2N8V4MswDLgnFQpnlWlAwC2vsAC6P3nb7PSSdaA3T00
 kb/FXqHxmhZAAZyAdE1OQxh4DcoVxeQ=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-326-jIYsY0XYMfWXRv-FClUVuQ-1; Fri, 04 Mar 2022 08:41:33 -0500
X-MC-Unique: jIYsY0XYMfWXRv-FClUVuQ-1
Received: by mail-wr1-f71.google.com with SMTP id
 t15-20020adfdc0f000000b001ef93643476so3375332wri.2
 for <qemu-devel@nongnu.org>; Fri, 04 Mar 2022 05:41:32 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=0SLrr2pzwbz8DMCaGa52u4y7YRyNCIg4T/EysVR8B14=;
 b=zDFVjI+W/GDV/Xpa6GVqKOF8+fzf4bjO9mFnYjIrnV7PxQb0Axpy8y8kVXkrw0anbK
 nUkd9GzTSIHPUSvUQNe7tPGtO4Jl5r6R0LKOpOuQ+bFrY1IpF/uUZsrN5Lz1CS1Fip67
 +xDmuDngQeKa0NHrQCuT1vbyhL1IzijMirus1QiTe5WBehHcuSn2AVwvaZW/gj8csxj6
 0dp7NcnqPON9EdQDJwTrPkwaJjbaKCcVW8brJF7LdoJoAuelFo58/twEf7FJOKz2HdXb
 +9zI/MK+X+6XGN9BDutHz8fZS9OEzadMc9AyEaH21+Y0IHCe1wlexdsRbCiC808a+Y1F
 o6wQ==
X-Gm-Message-State: AOAM532w7YlR+7xTfnk/Ouc6zPDI7HPr/o4TCteOMJFXl/g4ZQXsYSvD
 /TFyAwVW28sI0sIaYTGYdNwf/3nVkLU37Ib2+WTrm/CC6wPtJV88pcoIPtwguVDxJZvaEyOeafP
 QD/B78x9/lrs0JM/G9CG8TZDFQhm3lZGZE2yyfeOIJ3Lt68LXTB7V2ZLA+zUn
X-Received: by 2002:a05:6000:18a4:b0:1f0:5f19:152c with SMTP id
 b4-20020a05600018a400b001f05f19152cmr5348981wri.414.1646401291350; 
 Fri, 04 Mar 2022 05:41:31 -0800 (PST)
X-Google-Smtp-Source: ABdhPJy9uQ36AU+WEuSdNez5i/gd52jNdy544mwNHa8433RNHbFqnXWX2kJYXllO0UkEBMUcXt+yyQ==
X-Received: by 2002:a05:6000:18a4:b0:1f0:5f19:152c with SMTP id
 b4-20020a05600018a400b001f05f19152cmr5348960wri.414.1646401291059; 
 Fri, 04 Mar 2022 05:41:31 -0800 (PST)
Received: from redhat.com ([2.52.16.157]) by smtp.gmail.com with ESMTPSA id
 u18-20020adfdd52000000b001f04e9f215fsm4392617wrm.53.2022.03.04.05.41.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Mar 2022 05:41:26 -0800 (PST)
Date: Fri, 4 Mar 2022 08:41:16 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 33/45] pci-bridge/xio3130_downstream: Fix error handling
Message-ID: <20220304133556.233983-34-mst@redhat.com>
References: <20220304133556.233983-1-mst@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20220304133556.233983-1-mst@redhat.com>
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Jonathan Cameron <Jonathan.Cameron@huawei.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Jonathan Cameron <Jonathan.Cameron@huawei.com>

Wrong goto label, so msi cleanup would not occur if there is
an error in the ssvid initialization.

Signed-off-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
Message-Id: <20220218102303.7061-2-Jonathan.Cameron@huawei.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 hw/pci-bridge/xio3130_downstream.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/pci-bridge/xio3130_downstream.c b/hw/pci-bridge/xio3130_downstream.c
index 04aae72cd6..080a6613fe 100644
--- a/hw/pci-bridge/xio3130_downstream.c
+++ b/hw/pci-bridge/xio3130_downstream.c
@@ -84,7 +84,7 @@ static void xio3130_downstream_realize(PCIDevice *d, Error **errp)
                                XIO3130_SSVID_SVID, XIO3130_SSVID_SSID,
                                errp);
     if (rc < 0) {
-        goto err_bridge;
+        goto err_msi;
     }
 
     rc = pcie_cap_init(d, XIO3130_EXP_OFFSET, PCI_EXP_TYPE_DOWNSTREAM,
-- 
MST


