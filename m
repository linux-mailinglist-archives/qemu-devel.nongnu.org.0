Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AE90D439468
	for <lists+qemu-devel@lfdr.de>; Mon, 25 Oct 2021 13:02:45 +0200 (CEST)
Received: from localhost ([::1]:39896 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mexka-00062T-R2
	for lists+qemu-devel@lfdr.de; Mon, 25 Oct 2021 07:02:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58920)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jean-philippe@linaro.org>)
 id 1mexYG-0006Sq-OP
 for qemu-devel@nongnu.org; Mon, 25 Oct 2021 06:50:04 -0400
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331]:42631)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <jean-philippe@linaro.org>)
 id 1mexYE-0002iN-Cf
 for qemu-devel@nongnu.org; Mon, 25 Oct 2021 06:50:00 -0400
Received: by mail-wm1-x331.google.com with SMTP id
 62-20020a1c0241000000b0032ca21cffeeso8490943wmc.1
 for <qemu-devel@nongnu.org>; Mon, 25 Oct 2021 03:49:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=GwBog1t3j023ImQdSxgRBMGXf0bVA3BoiZIm6RiCAYY=;
 b=EZNHS4CiRBbPbIRShtWsLinJT+osdeltN1mWdDJwyPsBAd/CBvxPuV/cFELZwOobmf
 f6osxbQNhvGlRVuPOGE1pmr5sUzQA5JfXjFi3cMEXHIntZcXeINsJiDwyYiNRcVWt3fe
 AdNe/DpZzG/97L9RjYUPcFxAzonKO6rRCgDGTIrOkVJM99yCi5JppfkVbz7WIQUaBRqx
 99ZTIpweCTMGKPF8TUbXG3A0DDSMyHoMYA4iK6TuVKD1NcvzrY74bimSnhHvejCfpRFQ
 6xAdTzYIC0t1sd/r73paxCSG0OCD8b8hysCrqbc+Al00Zjjop496a1CV6sPJXv+CVZUr
 upOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=GwBog1t3j023ImQdSxgRBMGXf0bVA3BoiZIm6RiCAYY=;
 b=dDXLA3h+ZKFV0wJPpQ3s+Y7MpF5CQAzAky7pyzC/ub/Ag+EXN87CR9XKxGXTjcGFvy
 oibuxu4vsImpK9cvvk50ePJKhcjr1OtvBbbZecuhxt6G6gocELDHN7oACXquAb/aUZeR
 6D9tvSELhc709rM4iO/3+e6lb7wPdW4LqNs/0b5WLrOJrjOH03EEDsi0MhwAjNhJPCSL
 rv5aHULV/GNXOaOjIiTK3Tsmw1RnCDE2B6ZdgaWJhfBHNEXKYnb3zIJP0WSg/DNosbEi
 3TTSoqmYeWdS0BiJOuIdxpnED44NbP+KYOvK/E+xyme3NmiUyyzx+S1+jQ5++8LdF/eW
 rjYA==
X-Gm-Message-State: AOAM533vj8l5kNaFHRUYzf+UDEUZfA6P7aDeVCAwGRoeHUX9hTx4HvxW
 B8q0CBXX2WVjxKMy7RaZLk6e1Q==
X-Google-Smtp-Source: ABdhPJxL6knaA82OKDfPQr/eWwBMouetTfSNMc27HnEwnfwZ7ALMWUxD7s6ySU99F7Qi++fZ4FpLbw==
X-Received: by 2002:a05:600c:3b19:: with SMTP id
 m25mr8452990wms.130.1635158993642; 
 Mon, 25 Oct 2021 03:49:53 -0700 (PDT)
Received: from localhost.localdomain
 (cpc92880-cmbg19-2-0-cust679.5-4.cable.virginm.net. [82.27.106.168])
 by smtp.gmail.com with ESMTPSA id p188sm11710664wmp.30.2021.10.25.03.49.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 25 Oct 2021 03:49:53 -0700 (PDT)
From: Jean-Philippe Brucker <jean-philippe@linaro.org>
To: mst@redhat.com
Subject: [PATCH v2] hw/i386: Rename default_bus_bypass_iommu
Date: Mon, 25 Oct 2021 11:47:38 +0100
Message-Id: <20211025104737.1560274-1-jean-philippe@linaro.org>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::331;
 envelope-from=jean-philippe@linaro.org; helo=mail-wm1-x331.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Cc: Jean-Philippe Brucker <jean-philippe@linaro.org>, ehabkost@redhat.com,
 richard.henderson@linaro.org, qemu-devel@nongnu.org,
 Eric Auger <eric.auger@redhat.com>, pbonzini@redhat.com,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
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
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Tested-by: Eric Auger <eric.auger@redhat.com>
Signed-off-by: Jean-Philippe Brucker <jean-philippe@linaro.org>
---
v1: https://lore.kernel.org/qemu-devel/20211013160607.649990-3-jean-philippe@linaro.org/
v2: no change, added review tag and resending to be merged separately
    from the equivalent arm fix
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


