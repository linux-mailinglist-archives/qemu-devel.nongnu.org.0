Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DB7AE51153E
	for <lists+qemu-devel@lfdr.de>; Wed, 27 Apr 2022 13:22:17 +0200 (CEST)
Received: from localhost ([::1]:59978 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1njfkO-0002eV-VV
	for lists+qemu-devel@lfdr.de; Wed, 27 Apr 2022 07:22:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41430)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jean-philippe@linaro.org>)
 id 1njfgV-0006xr-NJ
 for qemu-devel@nongnu.org; Wed, 27 Apr 2022 07:18:15 -0400
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429]:44679)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <jean-philippe@linaro.org>)
 id 1njfgU-0007Oq-6A
 for qemu-devel@nongnu.org; Wed, 27 Apr 2022 07:18:15 -0400
Received: by mail-wr1-x429.google.com with SMTP id b19so1992103wrh.11
 for <qemu-devel@nongnu.org>; Wed, 27 Apr 2022 04:18:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=A2c65tDAbj14lGL/ycGVvF4tProvIRMiix3SHQuwl20=;
 b=n5mo6txLFhe8OVGhdEQla3hkl6qPWQGZ/btvzR/3euamLz2VPXHgqSiV0/ozaZL0LW
 UJoPoZ7j3dy04PcbFHwgGQPeP3iyWnmbNpIElkHn27QOYXlRI2j/zufNlxfqw5XQ2BDg
 xx1ezA5dCmBvhpi9PwlbR6JProuKtJLP3hKyAb3oEbXjE1frAiAVHzVlBB7ofxEkgMZD
 gOMny43ePrT9HDjSLya13qaWQxtNzrp6SnyrCE6fjdrcn91OUnqbuauIx7oIwo/1vkqX
 uA0zOqbVIIDegO2kmBsJHx/sqMX6lM9xfKwIMJLfxyMBZYqskrOUqy9UAK3dOnXbTQ+P
 txtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=A2c65tDAbj14lGL/ycGVvF4tProvIRMiix3SHQuwl20=;
 b=QVU7cQsrec9Le86X+q12SdLJUo3tE63g+KHz9zRvP+6xtUgf1eVLOy6DDXeA5jJuOW
 wPHew0dXXedN/nWc6duxw30l9caCYF7tKjV16vMVaGlZCW6hyYhNfQ9rpIg9/ZL6w2QN
 Ww0BUTcGFqTGIoAs99q5xoemvElaLetudmPK80NbSBsWNS78qrng4jYnUaM62vHlBYue
 0MmztcjC29RCthi12mfo/Fxwes9HWt24i6rjrO/OK8pkRyQYK9j31LK7hijch1KdVDem
 4JvYnioOsMFZiYPLPqnNUI5jtheNhhLY62dI9G9Efa7DPeyrvA44DQ10X6HvUZvQ/PTH
 KOuQ==
X-Gm-Message-State: AOAM532G8yJL0zD0Lhj9YpAmavMBNePO1QilaIK8wMT8BFhxlQf6AWwn
 1hy9WcBeWHltpFa/YOR3ds4tIQ==
X-Google-Smtp-Source: ABdhPJwf1A/3mmxLfNaO719Y9uiDlk2UFicxc/q494dhEaa8kpn5qIF6RCosHp0tDclnOVF+z+HILQ==
X-Received: by 2002:a5d:6da9:0:b0:20a:e1a1:7f0d with SMTP id
 u9-20020a5d6da9000000b0020ae1a17f0dmr8030547wrs.378.1651058292887; 
 Wed, 27 Apr 2022 04:18:12 -0700 (PDT)
Received: from localhost.localdomain
 (cpc92880-cmbg19-2-0-cust679.5-4.cable.virginm.net. [82.27.106.168])
 by smtp.gmail.com with ESMTPSA id
 d17-20020adfa351000000b0020adbfb586fsm8313104wrb.117.2022.04.27.04.18.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 27 Apr 2022 04:18:11 -0700 (PDT)
From: Jean-Philippe Brucker <jean-philippe@linaro.org>
To: eric.auger@redhat.com
Subject: [PATCH 2/2] hw/arm/smmuv3: Add space in guest error message
Date: Wed, 27 Apr 2022 12:15:45 +0100
Message-Id: <20220427111543.124620-2-jean-philippe@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220427111543.124620-1-jean-philippe@linaro.org>
References: <20220427111543.124620-1-jean-philippe@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::429;
 envelope-from=jean-philippe@linaro.org; helo=mail-wr1-x429.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org, qemu-devel@nongnu.org,
 Jean-Philippe Brucker <jean-philippe@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Make the translation error message prettier by adding a missing space
before the parenthesis.

Signed-off-by: Jean-Philippe Brucker <jean-philippe@linaro.org>
---
 hw/arm/smmuv3.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/arm/smmuv3.c b/hw/arm/smmuv3.c
index 8b1d8103dc..3a989b09cb 100644
--- a/hw/arm/smmuv3.c
+++ b/hw/arm/smmuv3.c
@@ -786,7 +786,7 @@ epilogue:
         break;
     case SMMU_TRANS_ERROR:
         qemu_log_mask(LOG_GUEST_ERROR,
-                      "%s translation failed for iova=0x%"PRIx64"(%s)\n",
+                      "%s translation failed for iova=0x%"PRIx64" (%s)\n",
                       mr->parent_obj.name, addr, smmu_event_string(event.type));
         smmuv3_record_event(s, &event);
         break;
-- 
2.35.1


