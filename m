Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B18C2442C4D
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Nov 2021 12:14:06 +0100 (CET)
Received: from localhost ([::1]:58716 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mhrjx-0004Pu-S0
	for lists+qemu-devel@lfdr.de; Tue, 02 Nov 2021 07:14:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40984)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mhrW6-0007gR-Ox
 for qemu-devel@nongnu.org; Tue, 02 Nov 2021 06:59:46 -0400
Received: from mail-qk1-x72e.google.com ([2607:f8b0:4864:20::72e]:34773)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mhrW4-0006sT-Ux
 for qemu-devel@nongnu.org; Tue, 02 Nov 2021 06:59:46 -0400
Received: by mail-qk1-x72e.google.com with SMTP id bq14so7728627qkb.1
 for <qemu-devel@nongnu.org>; Tue, 02 Nov 2021 03:59:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=gjZPVUhejzMPbTovw5hhnqve/TPMZkIYSlSBPY79smc=;
 b=dQIC3V0q8wJm3Ywz2PK07TZX8Yr/yOPLKJWWVgIdpvZ6Rru1EOJRiC44Q1O0kkSSdW
 w9dntCvEjj5L/8JvSYh52FFOefch15dj9Un9UQZn0Lt8VuTI6JblFwquzNub2mNYnuBX
 cPE4lgpDN6rxWp1MmslQevMjviXiECpATr/SaHioKj/+tUUZuVdebPdd4JjkQ8yHAzay
 SYCJJ8NfTfSNK21URjQXL/cDw/736UZqGL2uz0SfQYDVV8GbpazFxa+VHahBigtqZ3TE
 JjKoSxIDrdi1gdv/JsmroXF9LN2eSkY8x7szuX+vj7cq0O1zjqZ8utCdAHTCg5xw4U76
 Tq0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=gjZPVUhejzMPbTovw5hhnqve/TPMZkIYSlSBPY79smc=;
 b=BxKmrAg6fX/8sEym/tfvtxof8gNhSaErO1vTW8aG2adyxcEyy4skplAQEHFApsDrk7
 CNnv3oAOuNaq6WgJCjpWXi51ah89lH5bnsQ2FZKWF6rLe7wUKgkrcD0IVaQVthKnDroA
 YrgGWsrg7HqdSadNF0zK57bQBbAKO1sRY8yO7JW/4R2gbfxd4CVGt/1aLCspJIWqiD0k
 mHOg584ZcwT02lUNA6FlyGvSyp9v2ID5nue+27uYNufl3XP7Aw8Hl/3hoRg9yS8TIdE0
 tYs9Erbk03p0cgvw84AAfrDbJcAKNDns3rjY6RwzNi6hpq8gTr9zYVhbHrc6Gt5MvH01
 BW+Q==
X-Gm-Message-State: AOAM532bx/kQC11EXKKKzVdV3AG4eo9+SfSegzZeKg0keZVmcB9NaN51
 cccY5k3m2mClwNDTdQXUL1yRfm2Piyci+w==
X-Google-Smtp-Source: ABdhPJxRKawp5e9WesErgawKnsmJrc7HW6eKP0BD47K9RdMGiggZ+zfG4ojFO2WJ+EqniyNMI44a3Q==
X-Received: by 2002:a05:620a:450b:: with SMTP id
 t11mr16152091qkp.362.1635850784091; 
 Tue, 02 Nov 2021 03:59:44 -0700 (PDT)
Received: from localhost.localdomain (rrcs-172-254-253-57.nyc.biz.rr.com.
 [172.254.253.57])
 by smtp.gmail.com with ESMTPSA id z26sm11789510qko.13.2021.11.02.03.59.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Nov 2021 03:59:43 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 12/12] hw/arm/virt: Rename default_bus_bypass_iommu
Date: Tue,  2 Nov 2021 06:59:34 -0400
Message-Id: <20211102105934.214596-13-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211102105934.214596-1-richard.henderson@linaro.org>
References: <20211102105934.214596-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::72e;
 envelope-from=richard.henderson@linaro.org; helo=mail-qk1-x72e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Jean-Philippe Brucker <jean-philippe@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Eric Auger <eric.auger@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Jean-Philippe Brucker <jean-philippe@linaro.org>

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
Signed-off-by: Jean-Philippe Brucker <jean-philippe@linaro.org>
Tested-by: Eric Auger <eric.auger@redhat.com>
Reviewed-by: Eric Auger <eric.auger@redhat.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Message-Id: <20211026093733.2144161-1-jean-philippe@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 hw/arm/virt.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index ca433adb5b..369552ad45 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -2737,10 +2737,10 @@ static void virt_machine_class_init(ObjectClass *oc, void *data)
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
2.25.1


