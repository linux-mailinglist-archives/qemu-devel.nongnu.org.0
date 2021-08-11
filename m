Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8163D3E8CC2
	for <lists+qemu-devel@lfdr.de>; Wed, 11 Aug 2021 11:02:00 +0200 (CEST)
Received: from localhost ([::1]:59342 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mDk7b-0007H6-J4
	for lists+qemu-devel@lfdr.de; Wed, 11 Aug 2021 05:01:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40412)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jean-philippe@linaro.org>)
 id 1mDk64-0005Qd-2D
 for qemu-devel@nongnu.org; Wed, 11 Aug 2021 05:00:24 -0400
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435]:35702)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <jean-philippe@linaro.org>)
 id 1mDk62-00044r-Ja
 for qemu-devel@nongnu.org; Wed, 11 Aug 2021 05:00:23 -0400
Received: by mail-wr1-x435.google.com with SMTP id q10so2023705wro.2
 for <qemu-devel@nongnu.org>; Wed, 11 Aug 2021 02:00:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=IMEyq0QTcSaxiPLGZloAxgxwzusPwMjF/8D98Aa1LAk=;
 b=xBvIcqM26v2WH/Rj3vkrddRHunLVRXZCTyFZHcrEW4Np1Y765VyjdR2b5h/DW78jdB
 9i1SRNBKoNeNdiNRagXbc250qbMJcAU9rGjZm1Icv7B+rWfwAMHUGmaUKpj9J1O6yIs9
 vvu1BYvpubC5iWGqXy5g8YM4jNn1X+l38NlLPcKS7l6cc58P2m9OovcbGzLrxGgXE5qi
 JAQ0LLpEaq3vNmn75uXvuBrsQNT4nWBUg/70cu9eHR0nprfviqHzX4M+Ttib9CMdbmVq
 EyxU6LJiz93/xSXQtpviZHV5HOOdBVI2zjjbiz1tB/Yka6PmWdT90XvQ+TgsPiTkAJ65
 RHNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=IMEyq0QTcSaxiPLGZloAxgxwzusPwMjF/8D98Aa1LAk=;
 b=cHrEZynE139KowgGkWMfMBRidfPl5gkMiVSwfCD1nOCcDY7IvkArcuHw0k9iO5YHih
 lqGKDoUwkSt6L3nYvi1I+ESPPNmcys6O6DSCxudsxPFv3SwbBqNA6TkDX18EuqwoMuXc
 E6I89a9vKgqoT9P+QVaKSgavwdwwvPdWMHQUdE+8dEqIW5MdGM2RD7Pjf2mhZ4LWeapu
 +QeV2Yhl9gGErBxCCs4bMcZqbcymWL1mTLQ17Shl4XsUmvp1tC0VbE513bRt+zWvqTKY
 rJfXi/FrIcUGB+rV4xZbczWk96bz5cdm6wF6lOvS+eiTjIp8D22tVEQskczge76iuu4G
 sL3A==
X-Gm-Message-State: AOAM532gAFQ/9d7sqQ+2eQaE4PaEco/xul0nImT+Vk3sEsc/YW86M4mZ
 MpdHqGW4Ksb82359Jj60wSUkzw==
X-Google-Smtp-Source: ABdhPJz4Ga/waAfatphmjl16Cn6s3Fij62rAbPGUY/ANf4Y9197sNUXhdneCySATd87QkL4JM6qaHA==
X-Received: by 2002:a5d:4846:: with SMTP id n6mr18612489wrs.91.1628672420720; 
 Wed, 11 Aug 2021 02:00:20 -0700 (PDT)
Received: from localhost.localdomain (adsl-84-226-111-173.adslplus.ch.
 [84.226.111.173])
 by smtp.gmail.com with ESMTPSA id q5sm26227538wrx.33.2021.08.11.02.00.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 11 Aug 2021 02:00:20 -0700 (PDT)
From: Jean-Philippe Brucker <jean-philippe@linaro.org>
To: pbonzini@redhat.com
Subject: [PATCH 2/2] hw/i386: Rename default_bus_bypass_iommu
Date: Wed, 11 Aug 2021 10:58:44 +0200
Message-Id: <20210811085842.2511545-2-jean-philippe@linaro.org>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210811085842.2511545-1-jean-philippe@linaro.org>
References: <20210811085842.2511545-1-jean-philippe@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::435;
 envelope-from=jean-philippe@linaro.org; helo=mail-wr1-x435.google.com
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
Cc: Jean-Philippe Brucker <jean-philippe@linaro.org>, armbru@redhat.com,
 qemu-devel@nongnu.org
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
Signed-off-by: Jean-Philippe Brucker <jean-philippe@linaro.org>
---
 hw/i386/pc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/i386/pc.c b/hw/i386/pc.c
index fb24f000e7..ce4756ad59 100644
--- a/hw/i386/pc.c
+++ b/hw/i386/pc.c
@@ -1779,7 +1779,7 @@ static void pc_machine_class_init(ObjectClass *oc, void *data)
     object_class_property_add_bool(oc, "hpet",
         pc_machine_get_hpet, pc_machine_set_hpet);
 
-    object_class_property_add_bool(oc, "default_bus_bypass_iommu",
+    object_class_property_add_bool(oc, "default-bus-bypass-iommu",
         pc_machine_get_default_bus_bypass_iommu,
         pc_machine_set_default_bus_bypass_iommu);
 
-- 
2.32.0


