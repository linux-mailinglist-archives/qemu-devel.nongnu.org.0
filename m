Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 11F2C476C28
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Dec 2021 09:47:43 +0100 (CET)
Received: from localhost ([::1]:42336 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mxmQQ-00022K-6K
	for lists+qemu-devel@lfdr.de; Thu, 16 Dec 2021 03:47:42 -0500
Received: from eggs.gnu.org ([209.51.188.92]:34226)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mxmOa-0000IG-Gj; Thu, 16 Dec 2021 03:45:48 -0500
Received: from [2a00:1450:4864:20::32e] (port=37425
 helo=mail-wm1-x32e.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mxmOY-0003I7-LU; Thu, 16 Dec 2021 03:45:48 -0500
Received: by mail-wm1-x32e.google.com with SMTP id
 k37-20020a05600c1ca500b00330cb84834fso1171879wms.2; 
 Thu, 16 Dec 2021 00:45:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=NsGkgLg/FTwpFvrnErxAcsQIbF5SaAPwAKaBC1NuFFw=;
 b=TTqmbdwrTuYtGxNO6UZ9OZSlYOQk1mnBWSbxVx6UVofNubiFcbxHsLkAlUnYzcaPQU
 7nkDpDQIFtYPQur5HrFX5qHRn9vEiEvBiw6mkFqH2M+e7TUBL3iwpKZN8HFBoKz4+7Zh
 mlvyY8WfEKZpGqJe4RNHEYLOTByulavBfDvD/0v2qFQJMJO6uZTVUSKbUXJp8F2cAvva
 rhkEkt1pzFq/pCu1LJ4FFBtB6AR85b0gF8Yd8EY+NGnaVoF7YhntAM4MxZ+0VT7BjMT7
 Bb/e1kHEeQjcgpik2odStH0JQZEZ8qzgu/KRbLebjblHR2TEDOTfJlNYZRJ2xfmQhUXO
 2NhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=NsGkgLg/FTwpFvrnErxAcsQIbF5SaAPwAKaBC1NuFFw=;
 b=CWIo+2b/nXwImvCs80j+7Zk2AVNS3lVeD/SNnSjcnFfPcJxECcN/R1g0P6DOIc4ZVS
 HcGVWYDwUXwXyk/mEevwMkQydMsP+lfPg5IkPSfSXgRviQy0/CzWpQRCjZIE9HRLuzqf
 KwnG0geHPwd3AXUnMv6Jc8DNl7XPDW1J++9RyDytryWCQGOsU4uoMFPPR+aSQPA3EPss
 2r6ht20rXAaDt8dbQiREdEHoHFtnAPJWspIsCtqxhOGjRShJx3iMlxMC8gL00Yi/tnTQ
 OD9gJQRpsgYUti4EO2CR/SIg+hCoy+NWjR2GR5g4woh1/iraOXJxegkPatZW5CYEiDIn
 7dqA==
X-Gm-Message-State: AOAM532zphaVcBxvUHn+xFomlfuX0TbpyXlnlS+jsnBzEcGfmDNQXZ37
 ltxFbfvaIuAFzg4B6+FdCXHkrD8qnog=
X-Google-Smtp-Source: ABdhPJyoLvMjgBokFHf7umNJHcpJwuydEWgOmefHNlHAQVKedJ4nn1MEiPi78Z0FXy270hUiiFErZg==
X-Received: by 2002:a7b:c008:: with SMTP id c8mr3849651wmb.87.1639644344844;
 Thu, 16 Dec 2021 00:45:44 -0800 (PST)
Received: from localhost.localdomain
 (174.red-83-50-185.dynamicip.rima-tde.net. [83.50.185.174])
 by smtp.gmail.com with ESMTPSA id g3sm753057wrp.79.2021.12.16.00.45.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Dec 2021 00:45:44 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 1/2] hw/arm/musicpal: Fix coding style of code related to
 MV88W8618 device
Date: Thu, 16 Dec 2021 09:45:29 +0100
Message-Id: <20211216084530.698125-2-f4bug@amsat.org>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211216084530.698125-1-f4bug@amsat.org>
References: <20211216084530.698125-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::32e
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::32e;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x32e.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
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
 qemu-arm@nongnu.org, Jan Kiszka <jan.kiszka@web.de>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

We are going to move this code, so fix its style first to avoid:

  ERROR: spaces required around that '/' (ctx:VxV)

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/arm/musicpal.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/hw/arm/musicpal.c b/hw/arm/musicpal.c
index 2d612cc0c9b..6b5310117b8 100644
--- a/hw/arm/musicpal.c
+++ b/hw/arm/musicpal.c
@@ -309,13 +309,13 @@ static uint64_t mv88w8618_eth_read(void *opaque, hwaddr offset,
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
@@ -360,16 +360,16 @@ static void mv88w8618_eth_write(void *opaque, hwaddr offset,
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


