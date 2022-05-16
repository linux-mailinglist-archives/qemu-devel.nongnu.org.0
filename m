Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 830FD528360
	for <lists+qemu-devel@lfdr.de>; Mon, 16 May 2022 13:37:09 +0200 (CEST)
Received: from localhost ([::1]:44484 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nqZ2C-00062k-L1
	for lists+qemu-devel@lfdr.de; Mon, 16 May 2022 07:37:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48674)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1nqY76-0007f3-2U
 for qemu-devel@nongnu.org; Mon, 16 May 2022 06:38:08 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:48745)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1nqY74-0005SP-If
 for qemu-devel@nongnu.org; Mon, 16 May 2022 06:38:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1652697486;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=h6v85Upvw1XmgHE8IwKOzaGKsqCrJwxhny4vM0iQUss=;
 b=bRwsllEU8tRVl1f4kppYT/I94UuMX/yxh8grp3IBh/9GrPCCtUjBS2kYTgavppsvEYMcmg
 oq3D7ecDeqsX8XOaVM8XU1Z+dW9OzQVUYbelB3bgg4WUHmjTPcWKxhbvqHSsKmH5pq2xVq
 8UoIpRTR5sDOIFky5S1GMoz/ie15TN0=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-515-yjbWvZ6MNxuvRmtvYDqloQ-1; Mon, 16 May 2022 06:38:05 -0400
X-MC-Unique: yjbWvZ6MNxuvRmtvYDqloQ-1
Received: by mail-wr1-f72.google.com with SMTP id
 w4-20020adfbac4000000b0020acba4b779so3809152wrg.22
 for <qemu-devel@nongnu.org>; Mon, 16 May 2022 03:38:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=h6v85Upvw1XmgHE8IwKOzaGKsqCrJwxhny4vM0iQUss=;
 b=TWiS5xLvGsCipzXDReCfARYo93VP2H9nCy39Rg6DQctRcXFd7SlZeEYOiiGxQvmvdg
 72RtFDqCmvf/G+Ovzu5Inv6druRimitxDCRriuzcBMvUAJztF6rBh8ZDkUoOIHHy+ak4
 7NPEVK6XTEAQ3dIgHXeviTsLyDckVxu43yh20WWSASzp6BUDqCI2FLA9Yaok8Rr/Xz8I
 Va+VMB7ZfiVF6MXqMW6phZEg1M8PXC1L0NuJZ5UeTjGz4DGmE2GMyPZP3xOvXxCvDT1A
 UIxz1N0Ty2Er9XaYa4G682B6exqLnnPJU+DqIZS3mBdb2FDSxlVDK8BOygIZuzvu1DW4
 LUXQ==
X-Gm-Message-State: AOAM5316TNVS3F375klyx5Auz16kI+acuXLiMPfPf4wZVBN9DHp1ZTdB
 ZwmDkHHZ3Kr7b50DoqTZv+HoKs0yKgA745/p+tSividrO7bDi1xmHdXlTMFBIPS28v7GKc3NJlj
 ZR3Upl4Xp+1WVqBrijQSKACKjMV0T9xHslTalOq2EeXGuOolNZ473WUCrU3aj
X-Received: by 2002:a05:600c:2102:b0:394:2765:580c with SMTP id
 u2-20020a05600c210200b003942765580cmr15839272wml.150.1652697483554; 
 Mon, 16 May 2022 03:38:03 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwdeB6wHzfIQDRs7+G1d4PMmFKu3rPKFbqqU0qAi25HslddJCXZHJbMK95xqQUF+0+AHMZY0g==
X-Received: by 2002:a05:600c:2102:b0:394:2765:580c with SMTP id
 u2-20020a05600c210200b003942765580cmr15839251wml.150.1652697483325; 
 Mon, 16 May 2022 03:38:03 -0700 (PDT)
Received: from redhat.com ([2.55.141.66]) by smtp.gmail.com with ESMTPSA id
 u10-20020adfc64a000000b0020c5253d8d4sm1938234wrg.32.2022.05.16.03.38.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 May 2022 03:38:02 -0700 (PDT)
Date: Mon, 16 May 2022 06:38:00 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Ben Widawsky <ben.widawsky@intel.com>,
 Jonathan Cameron <Jonathan.Cameron@huawei.com>,
 Thomas Huth <thuth@redhat.com>, Laurent Vivier <lvivier@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Subject: [PULL 41/91] qtest/cxl: Add more complex test cases with CFMWs
Message-ID: <20220516095448.507876-42-mst@redhat.com>
References: <20220516095448.507876-1-mst@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220516095448.507876-1-mst@redhat.com>
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

From: Ben Widawsky <ben.widawsky@intel.com>

Add CXL Fixed Memory Windows to the CXL tests.

Signed-off-by: Ben Widawsky <ben.widawsky@intel.com>
Co-developed-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
Signed-off-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
Message-Id: <20220429144110.25167-40-Jonathan.Cameron@huawei.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 tests/qtest/cxl-test.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/tests/qtest/cxl-test.c b/tests/qtest/cxl-test.c
index 5f0794e816..079011af6a 100644
--- a/tests/qtest/cxl-test.c
+++ b/tests/qtest/cxl-test.c
@@ -9,11 +9,13 @@
 #include "libqtest-single.h"
 
 #define QEMU_PXB_CMD "-machine q35,cxl=on " \
-                     "-device pxb-cxl,id=cxl.0,bus=pcie.0,bus_nr=52 "
+                     "-device pxb-cxl,id=cxl.0,bus=pcie.0,bus_nr=52 "  \
+                     "-cxl-fixed-memory-window targets.0=cxl.0,size=4G "
 
-#define QEMU_2PXB_CMD "-machine q35,cxl=on " \
+#define QEMU_2PXB_CMD "-machine q35,cxl=on "                            \
                       "-device pxb-cxl,id=cxl.0,bus=pcie.0,bus_nr=52 "  \
-                      "-device pxb-cxl,id=cxl.1,bus=pcie.0,bus_nr=53 "
+                      "-device pxb-cxl,id=cxl.1,bus=pcie.0,bus_nr=53 " \
+                      "-cxl-fixed-memory-window targets.0=cxl.0,targets.1=cxl.1,size=4G "
 
 #define QEMU_RP "-device cxl-rp,id=rp0,bus=cxl.0,chassis=0,slot=0 "
 
-- 
MST


