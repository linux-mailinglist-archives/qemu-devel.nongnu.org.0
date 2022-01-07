Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 61EE4487D5B
	for <lists+qemu-devel@lfdr.de>; Fri,  7 Jan 2022 20:55:41 +0100 (CET)
Received: from localhost ([::1]:41236 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n5uQl-0005uL-Hy
	for lists+qemu-devel@lfdr.de; Fri, 07 Jan 2022 13:57:39 -0500
Received: from eggs.gnu.org ([209.51.188.92]:36186)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1n5uET-0005RB-BW; Fri, 07 Jan 2022 13:44:57 -0500
Received: from [2a00:1450:4864:20::32c] (port=39739
 helo=mail-wm1-x32c.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1n5uEH-0004nE-0y; Fri, 07 Jan 2022 13:44:50 -0500
Received: by mail-wm1-x32c.google.com with SMTP id
 x18-20020a7bc212000000b00347cc83ec07so1138690wmi.4; 
 Fri, 07 Jan 2022 10:44:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=NPnPA9g/AWJ0+WUMg3ngrXHqBt6v4p6Ae8wOIVjeVbs=;
 b=RYZpE8UV5jzUInuFvtdYEh3PRChb5KFgX6Kwq1YdHylcj8NE+kancsqCvQUGrlGjhC
 4TmZCbH22vn9091tYMHLORp2MJ9mHYmU+XPuY8312gRYRbocQ976QJfAJ8J2WPOL/rxV
 vucUmj4HHHDuIMT8C55ckZIAZKGGZpaA9KZVsEygYt9gIrN7GlmWlWnDemNCfTGNdv9D
 +D49k1EHLrXjuKJ1wHkERKuYuQMiVWK/CbEk02UcpS+zg1yFjdQ8OZCmn5md1JRvfonk
 HO1/r8yJli8OhNWB2Fmsze3fxP4FpFOJf24lWJ72+ha4XE6QsO7PCnHGDwC3CDWwwpyn
 zLug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=NPnPA9g/AWJ0+WUMg3ngrXHqBt6v4p6Ae8wOIVjeVbs=;
 b=KPgDAtZtNpe9grUkWtvP4q3OhiFwg0i/DgmjIkIOpIj7gCkgBcdF862wH/emySQQhY
 chxHuBrSVOz3Tx0cdA14GN4UuLjsDJ0mhL3pXAgGYRbqkxSyqpSAkc0gFpELwU4ZJp2/
 j8NOpCc+hZ3Ce/NIPEN4z70RRBsOGfo4a0f00pAaUxcdsxrLuebnjNohiIHnPrGxyhgc
 N08Aqe/YNd3ffv6i91QRr14mVLJ3bTA7PASLm79GEywtEuObNqCXFPSF9u7Pubvh8lZF
 /koSSWvcMzf1w+jc8BJPfveVl5wWs3r5WluHisEqnT1rfx+BWUx5bDSfHQIBxhLjYX29
 T08A==
X-Gm-Message-State: AOAM532+5lqJZSY8pZyhiBR6FAgCxQAWnUMDl+9VN7flLqPn3x0ekAHW
 Z6icYKGT/sUnadRE+Gytwcl5XtbqyaO6gA==
X-Google-Smtp-Source: ABdhPJxX8EOsCKvCiAS6b+kTJzWXBQJhPAIQshOslqzpr5UTBoxJCEBsrLOsHhJEuswHdg8YyD8rGg==
X-Received: by 2002:a05:600c:1f19:: with SMTP id
 bd25mr12130573wmb.42.1641581081071; 
 Fri, 07 Jan 2022 10:44:41 -0800 (PST)
Received: from nuc.. (83.red-83-50-87.dynamicip.rima-tde.net. [83.50.87.83])
 by smtp.gmail.com with ESMTPSA id c16sm3142522wrp.109.2022.01.07.10.44.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 07 Jan 2022 10:44:40 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 2/3] hw/arm/musicpal: Fix coding style of code related to
 MV88W8618 device
Date: Fri,  7 Jan 2022 19:44:28 +0100
Message-Id: <20220107184429.423572-3-f4bug@amsat.org>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20220107184429.423572-1-f4bug@amsat.org>
References: <20220107184429.423572-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::32c
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::32c;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x32c.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Jason Wang <jasowang@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 qemu-arm@nongnu.org, Jan Kiszka <jan.kiszka@web.de>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

We are going to move this code, so fix its style first to avoid:

  ERROR: spaces required around that '/' (ctx:VxV)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
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
2.33.1


