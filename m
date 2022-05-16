Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BADE8529317
	for <lists+qemu-devel@lfdr.de>; Mon, 16 May 2022 23:45:17 +0200 (CEST)
Received: from localhost ([::1]:46120 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nqiWi-0003Ru-PB
	for lists+qemu-devel@lfdr.de; Mon, 16 May 2022 17:45:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58944)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1nqhiD-0007Fs-FN
 for qemu-devel@nongnu.org; Mon, 16 May 2022 16:53:05 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:35874)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1nqhiB-0006ad-U3
 for qemu-devel@nongnu.org; Mon, 16 May 2022 16:53:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1652734383;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=h6v85Upvw1XmgHE8IwKOzaGKsqCrJwxhny4vM0iQUss=;
 b=YLt5AlyWapSw4qBAwZUYDaCjGeTZG5buTI4jX6ND7Pmhc7jWmprdrtRsWDer8nr6bPqU1G
 FGrDghjvung+dWxRxgNrppR3vToUvN+hEAybi9G4KY/BcwlCOhC0OjIzJjEhWuktokCXDv
 ZriHQ+wNZf/sgq6psEf49iqPWLMr+qM=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-425-z-E3348zPIKEkxlGsAIQbQ-1; Mon, 16 May 2022 16:53:01 -0400
X-MC-Unique: z-E3348zPIKEkxlGsAIQbQ-1
Received: by mail-ed1-f70.google.com with SMTP id
 b3-20020aa7d483000000b004282ca95814so10417332edr.9
 for <qemu-devel@nongnu.org>; Mon, 16 May 2022 13:53:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=h6v85Upvw1XmgHE8IwKOzaGKsqCrJwxhny4vM0iQUss=;
 b=o3x5cJu5tAb2tfXlgr0/DSx5LbjakSLX5CWFW/03m2Jvw50hH10QFK6pj5YFMgeMs+
 WYXZh1Jq5NJqO4qn+8dQlDJP84KAC8wBQoWguMPFJ+LKmL2iDZhtsnXrfFQ0WC3lhvr3
 FVfxv+NGaFkl9Hxq0uVfP8la7RwQ0N2SkXZRmTtCJYgcVQe0YhWvPoas/8+BglmPvPFn
 yLY+zIJFch/t6ISTjTnWnpzMW/zgy3NkUsfW8l/UN6qdULKZYSGYuRqy5xIf8TsWiPdJ
 uEhy37EBTKUTDHkmsSQqXBktgwixZGv3Hij5hq9sq9mxqS4uoz36Xp8OXM65T8cTobA7
 A2DQ==
X-Gm-Message-State: AOAM5328oigrQJROlzS/dpwGxEXqtn1buWPLFnVRJnXLoIXfIBxyfpo0
 ipR2WM2dgg0J4iJtedz1V6vbP9sZPawafRppkuSIKyOLa4RV5pD0Ki2Y88z+eRvniKVsV/xCbrn
 KRG/4x04SVOYtR8Xih5y/CIi4/a8lTQLbjrJ8ilf12YBNerP7ymYte5+0m1X8
X-Received: by 2002:a17:906:974c:b0:6fa:8c68:62a8 with SMTP id
 o12-20020a170906974c00b006fa8c6862a8mr17400797ejy.293.1652734380182; 
 Mon, 16 May 2022 13:53:00 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJx7B4TyIapLst4D7M/rPusVWeRaovvXK/eDENJqvtrSj0gOjYCQzlwsS3v45LVVYxSu/5nsHA==
X-Received: by 2002:a17:906:974c:b0:6fa:8c68:62a8 with SMTP id
 o12-20020a170906974c00b006fa8c6862a8mr17400775ejy.293.1652734379826; 
 Mon, 16 May 2022 13:52:59 -0700 (PDT)
Received: from redhat.com ([2.55.131.38]) by smtp.gmail.com with ESMTPSA id
 f2-20020a056402004200b0042617ba63c4sm5853685edu.78.2022.05.16.13.52.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 May 2022 13:52:59 -0700 (PDT)
Date: Mon, 16 May 2022 16:52:56 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Ben Widawsky <ben.widawsky@intel.com>,
 Jonathan Cameron <Jonathan.Cameron@huawei.com>,
 Thomas Huth <thuth@redhat.com>, Laurent Vivier <lvivier@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Subject: [PULL v2 41/86] qtest/cxl: Add more complex test cases with CFMWs
Message-ID: <20220516204913.542894-42-mst@redhat.com>
References: <20220516204913.542894-1-mst@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
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


