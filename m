Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 32B05581B12
	for <lists+qemu-devel@lfdr.de>; Tue, 26 Jul 2022 22:30:49 +0200 (CEST)
Received: from localhost ([::1]:33718 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oGRCa-0005gu-74
	for lists+qemu-devel@lfdr.de; Tue, 26 Jul 2022 16:30:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52376)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1oGQQE-0006Ns-8R
 for qemu-devel@nongnu.org; Tue, 26 Jul 2022 15:40:50 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:59746)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1oGQQ6-000517-VV
 for qemu-devel@nongnu.org; Tue, 26 Jul 2022 15:40:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1658864439;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=1nO9e8F2aKGyZjJwbGc2OCNv0WPUlucgH/QMwh6rRZE=;
 b=CrjaXrpXKXfhrGaOI1qF4DolAESpr4E/WDMCM0oZB0QLyYL8t8xTjn9H78fzNJqxul1N+t
 JomTTFWgcKwAg/pfUcMHEoB6Xhf6Ozle4Ge2wT4d5NMoPwr+GLJgKbi9WKSJfWN6ox7YDb
 amvDXpqdRVm0vy5FyCx3aazTA2oVwgo=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-520-k-pcX9VmMQGOABZNx0kJkw-1; Tue, 26 Jul 2022 15:40:37 -0400
X-MC-Unique: k-pcX9VmMQGOABZNx0kJkw-1
Received: by mail-wm1-f71.google.com with SMTP id
 ay19-20020a05600c1e1300b003a315c2c1c0so10654965wmb.7
 for <qemu-devel@nongnu.org>; Tue, 26 Jul 2022 12:40:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc;
 bh=1nO9e8F2aKGyZjJwbGc2OCNv0WPUlucgH/QMwh6rRZE=;
 b=rid/4MsGXsYEHsqMALDGE/m81FruT+foGqyG/tQSWXUd85acJbRw7A+xuCZpXo0JTE
 /6lyzurKdMTM8YCeU6PweGShtZB3zZMDoJ9NDTA4+Yq9jccHCtj/Yhxau+rycVlgY8P4
 ds6YVm/r0LDLwGL5tznckPWuYgaUtf5DVU6Odjh8e0l7QTPl5QMpibfYG9nJNDSADOrJ
 xZAb+rTB+poX+QGt7BbliWZ8GKHKlnrzeloFqMVCpNvsS7jOxyim/fmy44nBsliEdxY2
 +dNOi0gbnWkGxtXMRrFHfWXjB/sMxLTIvW+Sd/+4V1FVgbdU+QjnED7Qh8C7kb3/Mw9l
 ZEoA==
X-Gm-Message-State: AJIora+WVR4++if49KsSRGA3d3JOnEym7Zt6CZbBGZ/Rv2DahPTLEhs2
 MSApxYPPGx2aOvtHPLRC7GmcMhMPJsBqHAKEOgFjr8QaDYQQWlF+AN9DMbIJ9dXv5j7WBmxf+BI
 0rOkP7thXVICeTSLWcN8hFsf113t4xzq94EU+w79E9Oe+sVST0C6+SZ7woX74
X-Received: by 2002:a05:6000:144a:b0:21d:c50a:89dd with SMTP id
 v10-20020a056000144a00b0021dc50a89ddmr11793603wrx.608.1658864436397; 
 Tue, 26 Jul 2022 12:40:36 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1teIuoiaIPW9VYyc2c2cqhFE2vGjQbQDZIP3w4sZgP7CFBdUvlTKO7etgORZf6apqTvDfjVlg==
X-Received: by 2002:a05:6000:144a:b0:21d:c50a:89dd with SMTP id
 v10-20020a056000144a00b0021dc50a89ddmr11793589wrx.608.1658864435838; 
 Tue, 26 Jul 2022 12:40:35 -0700 (PDT)
Received: from redhat.com ([2a06:c701:7424:0:3d16:86dc:de54:5671])
 by smtp.gmail.com with ESMTPSA id
 u24-20020a05600c211800b003a2e655f2e6sm18338233wml.21.2022.07.26.12.40.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 26 Jul 2022 12:40:35 -0700 (PDT)
Date: Tue, 26 Jul 2022 15:40:34 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Jonathan Cameron <Jonathan.Cameron@huawei.com>,
 Igor Mammedov <imammedo@redhat.com>, Ben Widawsky <ben.widawsky@intel.com>
Subject: [PULL 04/16] hw/cxl: Fix size of constant in interleave granularity
 function.
Message-ID: <20220726193858.177462-5-mst@redhat.com>
References: <20220726193858.177462-1-mst@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220726193858.177462-1-mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Jonathan Cameron <Jonathan.Cameron@huawei.com>

Whilst the interleave granularity is always small enough that this isn't
a real problem (much less than 4GiB) let's change the constant
to ULL to fix the coverity warning.

Reported-by: Peter Maydell <peter.maydell@linaro.org>
Fixes: 829de299d1 ("hw/cxl/component: Add utils for interleave parameter encoding/decoding")
Fixes: Coverity CID 1488868
Signed-off-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
Message-Id: <20220701132300.2264-4-Jonathan.Cameron@huawei.com>
Acked-by: Igor Mammedov <imammedo@redhat.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 include/hw/cxl/cxl_component.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/hw/cxl/cxl_component.h b/include/hw/cxl/cxl_component.h
index 70b5018156..94ec2f07d7 100644
--- a/include/hw/cxl/cxl_component.h
+++ b/include/hw/cxl/cxl_component.h
@@ -215,7 +215,7 @@ uint8_t cxl_interleave_granularity_enc(uint64_t gran, Error **errp);
 
 static inline hwaddr cxl_decode_ig(int ig)
 {
-    return 1 << (ig + 8);
+    return 1ULL << (ig + 8);
 }
 
 CXLComponentState *cxl_get_hb_cstate(PCIHostState *hb);
-- 
MST


