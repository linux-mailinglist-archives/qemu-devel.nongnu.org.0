Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 773284435BE
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Nov 2021 19:38:47 +0100 (CET)
Received: from localhost ([::1]:39274 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mhygI-0002aM-Kb
	for lists+qemu-devel@lfdr.de; Tue, 02 Nov 2021 14:38:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38756)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mhyTT-0005oe-3j
 for qemu-devel@nongnu.org; Tue, 02 Nov 2021 14:25:31 -0400
Received: from mail-qk1-x732.google.com ([2607:f8b0:4864:20::732]:45912)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mhyTR-0004Eg-Ka
 for qemu-devel@nongnu.org; Tue, 02 Nov 2021 14:25:30 -0400
Received: by mail-qk1-x732.google.com with SMTP id n15so7022666qkp.12
 for <qemu-devel@nongnu.org>; Tue, 02 Nov 2021 11:25:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=gjZPVUhejzMPbTovw5hhnqve/TPMZkIYSlSBPY79smc=;
 b=zAHBUHDDaodCGT3YW8qxmynZYoCnWg0Bse3sB7efNdFYEpLGAyIf06cKc+MG6ZUJu3
 tH0KnePTNGMPeRuuBldtUCV744oXkGQRQg1MuujqoryoL42EZ8spKbm0HFsCnlFhUhEl
 QiYh46l0ieokMUSiTsJ3GY4UHISOktOkf47VysA/jPkI1OIeXYA0bcvs5gDpkGMC4O4Q
 dQmzNJoP7LKjuZoP9/usiUf/h/fFwomhZc6yJYncJLggdKF5sPjli25FJQCdX62tAC8C
 0cGgWYulBHqCV16FbOeTA515WpbskW3Pk7zt9TItcaLTgRikq+217qVEZwmCcPNJQQrG
 u6kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=gjZPVUhejzMPbTovw5hhnqve/TPMZkIYSlSBPY79smc=;
 b=SqL9g+uz42RFwI1V/k9dd0z1hV2sR3RFlwAVByzhu6RoL1V9gDJDYS46xeEJ/YyGPi
 qMmDIIQMWyEeHOdeRK/mkZXU3ihpSEnTaeb3Oz5a7dHBBnHaN3ERnKSJQJPlqp1Y4o9t
 D763BwrJehptvat5MqUm9XS4yip4ql3wGvZza5iyel9XzP8qABztREiWcs2vT6QLi9nU
 +gUsaMivUZGEZEakoGtrmhYKxrb7XynaCCWZuZ4ny6Bf+zZbMDVrf5U22+HMA4NfqxDC
 BUh67Wpzwfgck+daHbo+oZ91zID53L23FgzPQJkmr7KKVOKnyKaSgBs1jlqXJWpsRHTN
 2T6A==
X-Gm-Message-State: AOAM533AhowsDB31oDxKCAdnhJvycjb7e39pZQs27wrVDqdNa8a5W/74
 IixXXyal5oKQsWC3rkSXdQGhpagdd3AIJQ==
X-Google-Smtp-Source: ABdhPJzX/kOdm8x4xgJJUaSGsY2nHoKGqYP+bEQJoYvA6cTivLwqp/i316JkJ5YiAPix1e7b2tdJ+w==
X-Received: by 2002:a05:620a:171e:: with SMTP id
 az30mr21373924qkb.20.1635877527783; 
 Tue, 02 Nov 2021 11:25:27 -0700 (PDT)
Received: from localhost.localdomain (rrcs-172-254-253-57.nyc.biz.rr.com.
 [172.254.253.57])
 by smtp.gmail.com with ESMTPSA id y9sm13701081qko.74.2021.11.02.11.25.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Nov 2021 11:25:27 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL v2 11/12] hw/arm/virt: Rename default_bus_bypass_iommu
Date: Tue,  2 Nov 2021 14:25:18 -0400
Message-Id: <20211102182519.320319-12-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211102182519.320319-1-richard.henderson@linaro.org>
References: <20211102182519.320319-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::732;
 envelope-from=richard.henderson@linaro.org; helo=mail-qk1-x732.google.com
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


