Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A095742C5FB
	for <lists+qemu-devel@lfdr.de>; Wed, 13 Oct 2021 18:15:51 +0200 (CEST)
Received: from localhost ([::1]:57924 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1magv0-0007Rp-0W
	for lists+qemu-devel@lfdr.de; Wed, 13 Oct 2021 12:15:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41574)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jean-philippe@linaro.org>)
 id 1magpG-0000sQ-Nb
 for qemu-devel@nongnu.org; Wed, 13 Oct 2021 12:09:54 -0400
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436]:39744)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <jean-philippe@linaro.org>)
 id 1magpC-00026q-ML
 for qemu-devel@nongnu.org; Wed, 13 Oct 2021 12:09:53 -0400
Received: by mail-wr1-x436.google.com with SMTP id r18so10124558wrg.6
 for <qemu-devel@nongnu.org>; Wed, 13 Oct 2021 09:09:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Sivj80yDIiOP5VpyG1S6/rDmp/L3z3yozBqSD5N66KA=;
 b=PzKhDYbYevofByY3ICIlK+du3i/exCYeCRYYQpjaxRW7OGIU+KTXJfj9gHwgs/Utbw
 p8peivcca/HTvFlFDHKNs5+T7iEWvf11CLAvr67YW+XiSW3mA1TMhHsXIEdbC9i71Je9
 9W3BLUIV0abFh3kOM06RIBGzAh8Gcjhk9RkSPBFWqqJeemrCmNR6Whd21wsp5fDo/WG/
 VmuOJAFnO5RVkk5Z2F4xCoiagXk23Q4SX6mbNjYPu5v1Ul41c++G3jeOWl4iB3eUopmF
 hdixWYbiwdazMf5/wrFf1RwFe5VKtSDap3zlulxBOnl+AcjpHbMlXPJvZghQ8iKxiy0W
 i8dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Sivj80yDIiOP5VpyG1S6/rDmp/L3z3yozBqSD5N66KA=;
 b=hQn6yNmoZ0qFE1+9AtwrOeT9CxuQFGNOo8e9/Lbgeb84f8sSUwYL28Gan/QoNI5aP5
 pJSa6+NXq9odnRFUix8ZoN7LzHMK86B2f2bfhqTWB3IasDUaifY7PYrfT9jmkTA/Cl/v
 kDsZLS+DRoO5SQOHtVLDGz9UJf2b5B5SA/QN2Uac3A3nbJsyizic+DsTgudJIX7/yxSr
 K3srg/oCFixBet5BhXXASe5Qw63Oa0aZ1LVMBaKa1F2rPwBd8wAQEIgqHGvsqauu8Ei+
 o820Xr34n1zutLRVVVuHTEELptMqNA3hKN5eGdUc5btCZdxxzv1nGQIQbT4uGWk8BAFu
 sm1A==
X-Gm-Message-State: AOAM533V74fDOd1laRMfH/qX2TFhWul79bK3nBVuZHN+jilFBBqq2Ry+
 Q0HwEJ4/S9mdtpRy+YyN+xPxDg==
X-Google-Smtp-Source: ABdhPJyUw1TVUfh7+rdheCbb5h7bo355erDm2PDwrfjiup2YoWUtqlPqPo4MsWlfYLsb3kOhzabH6Q==
X-Received: by 2002:adf:bc14:: with SMTP id s20mr95171wrg.8.1634141389277;
 Wed, 13 Oct 2021 09:09:49 -0700 (PDT)
Received: from localhost.localdomain
 (cpc92880-cmbg19-2-0-cust679.5-4.cable.virginm.net. [82.27.106.168])
 by smtp.gmail.com with ESMTPSA id v18sm10482wrm.63.2021.10.13.09.09.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 13 Oct 2021 09:09:48 -0700 (PDT)
From: Jean-Philippe Brucker <jean-philippe@linaro.org>
To: pbonzini@redhat.com,
	peter.maydell@linaro.org
Subject: [RESEND PATCH 2/2] hw/i386: Rename default_bus_bypass_iommu
Date: Wed, 13 Oct 2021 17:06:08 +0100
Message-Id: <20211013160607.649990-3-jean-philippe@linaro.org>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211013160607.649990-1-jean-philippe@linaro.org>
References: <20211013160607.649990-1-jean-philippe@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::436;
 envelope-from=jean-philippe@linaro.org; helo=mail-wr1-x436.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Jean-Philippe Brucker <jean-philippe@linaro.org>, ehabkost@redhat.com,
 mst@redhat.com, qemu-devel@nongnu.org, richard.henderson@linaro.org,
 armbru@redhat.com, qemu-stable@nongnu.org, Eric Auger <eric.auger@redhat.com>,
 eauger@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Since commit d8fb7d0969d5 ("vl: switch -M parsing to keyval"), machine
parameter definitions cannot use underscores, because keyval_dashify()
transforms them to dashes and the parser doesn't find the parameter.

This affects option default_bus_bypass_iommu which was introduced in the
same release:

$ qemu-system-x86_64 -M q35,default_bus_bypass_iommu=on
qemu-system-x86_64: Property 'pc-q35-6.1-machine.default-bus-bypass-iommu' not found

Rename the parameter to "default-bus-bypass-iommu". Passing
"default_bus_bypass_iommu" is still valid since the underscore are
transformed automatically.

Fixes: c9e96b04fc19 ("hw/i386: Add a default_bus_bypass_iommu pc machine option")
Reviewed-by: Eric Auger <eric.auger@redhat.com>
Tested-by: Eric Auger <eric.auger@redhat.com>
Signed-off-by: Jean-Philippe Brucker <jean-philippe@linaro.org>
---
 hw/i386/pc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/i386/pc.c b/hw/i386/pc.c
index 86223acfd3..54e4c00dce 100644
--- a/hw/i386/pc.c
+++ b/hw/i386/pc.c
@@ -1718,7 +1718,7 @@ static void pc_machine_class_init(ObjectClass *oc, void *data)
     object_class_property_add_bool(oc, "hpet",
         pc_machine_get_hpet, pc_machine_set_hpet);
 
-    object_class_property_add_bool(oc, "default_bus_bypass_iommu",
+    object_class_property_add_bool(oc, "default-bus-bypass-iommu",
         pc_machine_get_default_bus_bypass_iommu,
         pc_machine_set_default_bus_bypass_iommu);
 
-- 
2.33.0


