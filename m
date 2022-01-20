Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 38ACC4953AB
	for <lists+qemu-devel@lfdr.de>; Thu, 20 Jan 2022 18:58:18 +0100 (CET)
Received: from localhost ([::1]:57650 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nAbhQ-0006nN-22
	for lists+qemu-devel@lfdr.de; Thu, 20 Jan 2022 12:58:16 -0500
Received: from eggs.gnu.org ([209.51.188.92]:42624)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nAWgJ-00046t-5B
 for qemu-devel@nongnu.org; Thu, 20 Jan 2022 07:36:47 -0500
Received: from [2a00:1450:4864:20::333] (port=41714
 helo=mail-wm1-x333.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nAWgA-000374-6z
 for qemu-devel@nongnu.org; Thu, 20 Jan 2022 07:36:42 -0500
Received: by mail-wm1-x333.google.com with SMTP id
 q141-20020a1ca793000000b00347b48dfb53so13504608wme.0
 for <qemu-devel@nongnu.org>; Thu, 20 Jan 2022 04:36:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=M0GSM/gGyPWyvP4duDWsVDdUIy8/Nu30tI3UmJhTaGU=;
 b=q4ZN2GlooRMES+0zu99UdyQmOvR0IWq3PjSnP3SypVrTv8M8ZKwVZ1ilcE2ywD2uxj
 hURyMFfuTftnUZ8GJ6eWcWHJ8cYLRnDjK2WxWN2c6I/SbfaKGdUsdfaGvWO8No8bTpZK
 yftfuZcsOdNft2NWDNnQGROe8ySxEN47bYCPkmIQwl+a4g8Jm495VSbLYLWULG8vNd0m
 4wGMAKhh0VdCpr29QsxTjEZETj4zeMztez29Z9mPMoyWUy5Znyaj6DiMYbFKK9Jpu6FU
 G75I9xX2IPOPo0Orv2bdHGmHTd7DwYLPKrFC+dPYY0ob015KteSFbKi89yKZMFq551/3
 rQWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=M0GSM/gGyPWyvP4duDWsVDdUIy8/Nu30tI3UmJhTaGU=;
 b=drQV8hLRY3rNyTz5vRd16JPoipifaG75HLjuoZRqFkNHo9zdZrRMe0LG4HyIdywL6o
 d/16kSTecn47RmxNT76NTofxI7Y9TeBPsLU66yinKD3qM8lWg3nQ7l7H/kOs2NSFg23k
 K0L36rqEeNjTRwbCX6gHmSZJk0SnALPns6vfNkR3LXbhSElxk92yWagrBMdeprZsqZxQ
 8lXjZsJqldcb4mtGbsdLl0s7TGgONy5asD97ZGBOG0VGq+6DrqnU+UHwWUaJRRONy/nv
 tV2KsEaA1h+7gX9sdjI8rLpoavczwPjWOu9tqQil1a+w3VZ93duqafRRTGE93lmSoebE
 MEPw==
X-Gm-Message-State: AOAM532BYC2mseIr8F9/PNEJErPrddr4SJgSZSt3cIsUjk6cvxrEVr1Q
 LTEQSFOBe76B+jUkaBa2kpusm5d9R8gWNw==
X-Google-Smtp-Source: ABdhPJyeKlWo5j5iJIvau1+M2iumfgkT/LAK2J0jlKDTie/ZG4sE7AdfBD6WBViWGaiIvuXZ6dPRig==
X-Received: by 2002:a05:600c:190a:: with SMTP id
 j10mr8693331wmq.55.1642682195221; 
 Thu, 20 Jan 2022 04:36:35 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id t8sm7993324wmq.43.2022.01.20.04.36.34
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 Jan 2022 04:36:34 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 03/38] hw/arm/musicpal: Fix coding style of code related to
 MV88W8618 device
Date: Thu, 20 Jan 2022 12:35:55 +0000
Message-Id: <20220120123630.267975-4-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220120123630.267975-1-peter.maydell@linaro.org>
References: <20220120123630.267975-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::333
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::333;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x333.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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

From: Philippe Mathieu-Daudé <f4bug@amsat.org>

We are going to move this code, so fix its style first to avoid:

  ERROR: spaces required around that '/' (ctx:VxV)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Message-id: 20220107184429.423572-3-f4bug@amsat.org
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/arm/musicpal.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/hw/arm/musicpal.c b/hw/arm/musicpal.c
index 2680ec55b5a..1291eb98aba 100644
--- a/hw/arm/musicpal.c
+++ b/hw/arm/musicpal.c
@@ -310,13 +310,13 @@ static uint64_t mv88w8618_eth_read(void *opaque, hwaddr offset,
         return s->imr;
 
     case MP_ETH_FRDP0 ... MP_ETH_FRDP3:
-        return s->frx_queue[(offset - MP_ETH_FRDP0)/4];
+        return s->frx_queue[(offset - MP_ETH_FRDP0) / 4];
 
     case MP_ETH_CRDP0 ... MP_ETH_CRDP3:
-        return s->rx_queue[(offset - MP_ETH_CRDP0)/4];
+        return s->rx_queue[(offset - MP_ETH_CRDP0) / 4];
 
     case MP_ETH_CTDP0 ... MP_ETH_CTDP1:
-        return s->tx_queue[(offset - MP_ETH_CTDP0)/4];
+        return s->tx_queue[(offset - MP_ETH_CTDP0) / 4];
 
     default:
         return 0;
@@ -361,16 +361,16 @@ static void mv88w8618_eth_write(void *opaque, hwaddr offset,
         break;
 
     case MP_ETH_FRDP0 ... MP_ETH_FRDP3:
-        s->frx_queue[(offset - MP_ETH_FRDP0)/4] = value;
+        s->frx_queue[(offset - MP_ETH_FRDP0) / 4] = value;
         break;
 
     case MP_ETH_CRDP0 ... MP_ETH_CRDP3:
-        s->rx_queue[(offset - MP_ETH_CRDP0)/4] =
-            s->cur_rx[(offset - MP_ETH_CRDP0)/4] = value;
+        s->rx_queue[(offset - MP_ETH_CRDP0) / 4] =
+            s->cur_rx[(offset - MP_ETH_CRDP0) / 4] = value;
         break;
 
     case MP_ETH_CTDP0 ... MP_ETH_CTDP1:
-        s->tx_queue[(offset - MP_ETH_CTDP0)/4] = value;
+        s->tx_queue[(offset - MP_ETH_CTDP0) / 4] = value;
         break;
     }
 }
-- 
2.25.1


