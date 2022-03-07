Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 43D234D0BB5
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Mar 2022 00:09:21 +0100 (CET)
Received: from localhost ([::1]:34512 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nRMTg-000477-4D
	for lists+qemu-devel@lfdr.de; Mon, 07 Mar 2022 18:09:20 -0500
Received: from eggs.gnu.org ([209.51.188.92]:53060)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1nRM7G-0007t4-KP
 for qemu-devel@nongnu.org; Mon, 07 Mar 2022 17:46:10 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:45605)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1nRM7F-0005h8-62
 for qemu-devel@nongnu.org; Mon, 07 Mar 2022 17:46:10 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1646693168;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=0SLrr2pzwbz8DMCaGa52u4y7YRyNCIg4T/EysVR8B14=;
 b=DsHpTjEgmUNRR8qv7bD+JofgxcaeYBBafrj6vIKpNsmfXZYRQxeR7xNRkGO1HeHtNAyDZz
 wLKnwFSFbah/iPMzGjDUrpZlfloHxe+MoUBEeF/wdodG6bAYr6KZmEAxuxcyguCkojmy4s
 RPMhqP+zAMSrF+/Aw84QuEDzOGg8da0=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-215-jX-TF3m9NX6AHY3Pm3ltIg-1; Mon, 07 Mar 2022 17:46:07 -0500
X-MC-Unique: jX-TF3m9NX6AHY3Pm3ltIg-1
Received: by mail-wm1-f70.google.com with SMTP id
 k41-20020a05600c1ca900b00389a2b983efso1523634wms.4
 for <qemu-devel@nongnu.org>; Mon, 07 Mar 2022 14:46:07 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=0SLrr2pzwbz8DMCaGa52u4y7YRyNCIg4T/EysVR8B14=;
 b=c1lcu426ikqrfQ0gk7i7kXK2TigjWZyRHUHntWXz50H9ewsWwPA0uEEoO9DPx67dqQ
 NkjQM5xOkPj/8ElbuqY4dP3eQAsvbh4RaDNFQP+5oX8LwHa5vv6KFv6aUtjvuniDH7LX
 Y1xrNoFkkAYI5BCnFLxTUjVvYnWQduUq+wbJsG+NPLmcLeGzF8loNQlB7DDDEE6qCfl0
 pa16I9FlcVHKUYdG+WXH1eyxb2vvTfYW/KyGNTwM8aEVhM9eBmxdLC6FNq4bn8J45h2n
 b4cz1uh0pva4WmTLfffr/I5l7a+m1l0r1k7QzMpLVMxZZdvI9yAEAQ0/W0ff1xIYJo51
 aPWg==
X-Gm-Message-State: AOAM532/LtlrIxw9wnEMQdze8imT90xq37FCf5GTXXjogx4cT7fjtmDO
 abpg1jTLhOX8AgsG2EB758Q5R2DD07tVSsYIW4ydxluItTMqCKUbWYg/Dn0YHMFp/kpq9zm4P60
 EOM0sRPRZleBQvcUSNGUOkV+/okNVTU9ApMXDfh7fYHi2wKAxuljPpb79jJim
X-Received: by 2002:a05:600c:5014:b0:389:b0a9:5aac with SMTP id
 n20-20020a05600c501400b00389b0a95aacmr971962wmr.16.1646693166151; 
 Mon, 07 Mar 2022 14:46:06 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwtCbrNCuInfXdkjY/MumqJGMBra+P9Efh2nfFZUYznpdz6nZtuS0kpD2N6yQuwOa6oBprLiw==
X-Received: by 2002:a05:600c:5014:b0:389:b0a9:5aac with SMTP id
 n20-20020a05600c501400b00389b0a95aacmr971943wmr.16.1646693165864; 
 Mon, 07 Mar 2022 14:46:05 -0800 (PST)
Received: from redhat.com ([2.55.138.228]) by smtp.gmail.com with ESMTPSA id
 j3-20020a5d6043000000b001f0247bbdf7sm12435547wrt.64.2022.03.07.14.46.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Mar 2022 14:46:05 -0800 (PST)
Date: Mon, 7 Mar 2022 17:46:02 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL v4 29/47] pci-bridge/xio3130_downstream: Fix error handling
Message-ID: <20220307224357.682101-30-mst@redhat.com>
References: <20220307224357.682101-1-mst@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20220307224357.682101-1-mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
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


