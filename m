Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 98E7242C5F1
	for <lists+qemu-devel@lfdr.de>; Wed, 13 Oct 2021 18:12:40 +0200 (CEST)
Received: from localhost ([::1]:52188 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1magrv-0003bB-M7
	for lists+qemu-devel@lfdr.de; Wed, 13 Oct 2021 12:12:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41554)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jean-philippe@linaro.org>)
 id 1magpE-0000pC-Av
 for qemu-devel@nongnu.org; Wed, 13 Oct 2021 12:09:52 -0400
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435]:43573)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <jean-philippe@linaro.org>)
 id 1magpB-00026c-Nt
 for qemu-devel@nongnu.org; Wed, 13 Oct 2021 12:09:52 -0400
Received: by mail-wr1-x435.google.com with SMTP id r7so10113878wrc.10
 for <qemu-devel@nongnu.org>; Wed, 13 Oct 2021 09:09:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=z51t1fm0QsaKEHQ5rRMvH9Hl6mH6z+8WE2S3J3iChmU=;
 b=tSBlQqCmtW3+tNkD7++WE0hGCZYdcvpBFnnCAad08v6Gu7mEOmmV2XpiOb0R2tfx0n
 yVzNxDNbPtagQ/1G/VOzF8nXAZlqTaUPK+A23Alo07eA9EjhdzRRw+cujoSGmyTQugfu
 Ervj/EZxN3ai7R6+K0UlOQ1XXtrrchUCmPwzJ7ifSh+zcKFnGKXzDywzvWrdyhwj/bIq
 VeM99t4N6ZnfRhKZuxkXzEn0MnXgAdmPBT0Ww7c5lfClKb5VsJNVK1BwOzxIU9maoaDd
 QLq7CKDW3LefU7sYcm1RUlmwL6ZPM1PYcgPqkl+hVeFo4wB74QkR2jp+kw+7KDlOtlKB
 5Z9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=z51t1fm0QsaKEHQ5rRMvH9Hl6mH6z+8WE2S3J3iChmU=;
 b=5HVeM1O3JqKDSQZ9njTSu3tY3hCkq2GtQptAfcq4kaY0JSij+gR4fo8lC0rRztHQvn
 9S8FVjw1+j9ZuHwEreWLwWMjCRfFAFsOLy+uB1XAmuQOt0qSVUITUhjiuOMQgjEe2Ihp
 nVTcm/M+UAPpnKjLtuf+n8SpY6nM4A2NSJaFOCyIoCQ8fmwjKTW895uJ1CklVGzKrzTc
 H5ywTYd4KtcH76cpMreGpXzbVsZ414ocweTlv35scnf7gz9503KXkbwzwb7AVDPE4rA/
 VOkwKyPbIaUuzYMUktmekL5o7Z3A3JbMHcfCH+iISHsBjhKYb6YLpsUunYkJTVysG80d
 U5Vw==
X-Gm-Message-State: AOAM5309u/rwquw17+Vy/6YE+k3gvxiB9pyA6coCX9dxMFJUn/7CVx2z
 PDHM+Ji7RkOPZyRNRdz5G5h8kQ==
X-Google-Smtp-Source: ABdhPJwohxGE8lqOYDCkp4r0jUpmaa8EM5UVmDFowg7JStrBAQMf3wOW56Q0eAZzF1D4cSTmSanUKg==
X-Received: by 2002:adf:b1d7:: with SMTP id r23mr20474wra.145.1634141388328;
 Wed, 13 Oct 2021 09:09:48 -0700 (PDT)
Received: from localhost.localdomain
 (cpc92880-cmbg19-2-0-cust679.5-4.cable.virginm.net. [82.27.106.168])
 by smtp.gmail.com with ESMTPSA id v18sm10482wrm.63.2021.10.13.09.09.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 13 Oct 2021 09:09:47 -0700 (PDT)
From: Jean-Philippe Brucker <jean-philippe@linaro.org>
To: pbonzini@redhat.com,
	peter.maydell@linaro.org
Subject: [RESEND PATCH 1/2] hw/arm/virt: Rename default_bus_bypass_iommu
Date: Wed, 13 Oct 2021 17:06:07 +0100
Message-Id: <20211013160607.649990-2-jean-philippe@linaro.org>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211013160607.649990-1-jean-philippe@linaro.org>
References: <20211013160607.649990-1-jean-philippe@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::435;
 envelope-from=jean-philippe@linaro.org; helo=mail-wr1-x435.google.com
X-Spam_score_int: -1
X-Spam_score: -0.2
X-Spam_bar: /
X-Spam_report: (-0.2 / 5.0 requ) DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

$ qemu-system-aarch64 -M virt,default_bus_bypass_iommu=on
qemu-system-aarch64: Property 'virt-6.1-machine.default-bus-bypass-iommu' not found

Rename the parameter to "default-bus-bypass-iommu". Passing
"default_bus_bypass_iommu" is still valid since the underscore are
transformed automatically.

Fixes: 6d7a85483a06 ("hw/arm/virt: Add default_bus_bypass_iommu machine option")
Reviewed-by: Eric Auger <eric.auger@redhat.com>
Tested-by: Eric Auger <eric.auger@redhat.com>
Signed-off-by: Jean-Philippe Brucker <jean-philippe@linaro.org>
---
 hw/arm/virt.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index 7170aaacd5..5fdd5aa888 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -2687,10 +2687,10 @@ static void virt_machine_class_init(ObjectClass *oc, void *data)
                                           "Set the IOMMU type. "
                                           "Valid values are none and smmuv3");
 
-    object_class_property_add_bool(oc, "default_bus_bypass_iommu",
+    object_class_property_add_bool(oc, "default-bus-bypass-iommu",
                                    virt_get_default_bus_bypass_iommu,
                                    virt_set_default_bus_bypass_iommu);
-    object_class_property_set_description(oc, "default_bus_bypass_iommu",
+    object_class_property_set_description(oc, "default-bus-bypass-iommu",
                                           "Set on/off to enable/disable "
                                           "bypass_iommu for default root bus");
 
-- 
2.33.0


