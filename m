Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C4D84B176B
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Feb 2022 22:06:01 +0100 (CET)
Received: from localhost ([::1]:58750 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nIGdc-0007yJ-2z
	for lists+qemu-devel@lfdr.de; Thu, 10 Feb 2022 16:06:00 -0500
Received: from eggs.gnu.org ([209.51.188.92]:37786)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jimmy.brisson@linaro.org>)
 id 1nIGaR-0005pr-2Q
 for qemu-devel@nongnu.org; Thu, 10 Feb 2022 16:02:43 -0500
Received: from [2607:f8b0:4864:20::22e] (port=42942
 helo=mail-oi1-x22e.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <jimmy.brisson@linaro.org>)
 id 1nIGaO-0003xf-0Y
 for qemu-devel@nongnu.org; Thu, 10 Feb 2022 16:02:41 -0500
Received: by mail-oi1-x22e.google.com with SMTP id v67so7347594oie.9
 for <qemu-devel@nongnu.org>; Thu, 10 Feb 2022 13:02:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=/HLq/gHeUXvoR0qXgOV5J7lPCXpIMXUke6vhLjSZEdA=;
 b=gNeRDJgIw47tJ+MZ1k54Z/fb7FJlm42rlOe3y57olkx7R42T5zZcVrH/TogUVMyg/j
 uWU9cDyifyJTwoNywSo0ArzHzbOMTzuz2mvApLWryi0awk3CNjYVPHpQZUnjTTAhnlCu
 EzOJRtQpIZbooI5g2auh2QRaMqRzGqHmic6D7+uBE+UZToD3GccdlA62pu0tlmilWEPb
 sZ6wWVyTHHDOX2RtmBAay1dIJxpwCRdd3PHCnKl55RDv96Tm+FjeiTJ0YqOqgg9ViAel
 3vAXSZju5MiA5Ksxzd1qUe2pU0TBhSXPZZkZiLRhgZTiE4pSHKc7StogfZizLdd1SDV5
 37NA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=/HLq/gHeUXvoR0qXgOV5J7lPCXpIMXUke6vhLjSZEdA=;
 b=t8MIbM0UX67axHsL85LB4rbY9fcLUkqJP2vM7c6soI/JIvRE8Uriw2QRm2nd+gm/HN
 Ef57wia2nMmUF3THInclw67EdKX+h6bdxSuw6xX+cdvG4YxvBWKXxvnuS76ZedXiO6eL
 koHn02bVjYfvqGwHUKimSOHR6F+7mSDVi8aGZrRzeLbb5aIGYEpW72ZTo+SCkLkLiGU5
 exi57blKPHsqgZ2cqKOhz9JNpfKzULtCEVSXIKt8OOzJKz13DCQd8fvU4ace78F4nI8Y
 LzEmzZ6eFG1RdiXTHefQAMzY0l8NqZa7XbSFcBqfnZV18KZayeJeWEeNCbUZeYmI4Mc+
 icVw==
X-Gm-Message-State: AOAM5309cU1wrSO2PdnrAbwdj4mPKv2lmKuoEE+jYxtIOQuypnjHiGrz
 ONHxgNYh0EnaOmo5PO6JGBpMjw==
X-Google-Smtp-Source: ABdhPJwtNd62CQF4XRuCr3+ZWRSYwmV35Ka8Jb6fXZIk+JuTelHk87R7jVa17hrzHIoNUsNjADdXHw==
X-Received: by 2002:a05:6808:168b:: with SMTP id
 bb11mr1840510oib.184.1644526957885; 
 Thu, 10 Feb 2022 13:02:37 -0800 (PST)
Received: from localhost.localdomain (24-155-109-70.dyn.grandenetworks.net.
 [24.155.109.70])
 by smtp.googlemail.com with ESMTPSA id b6sm8221642otl.0.2022.02.10.13.02.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Feb 2022 13:02:37 -0800 (PST)
From: Jimmy Brisson <jimmy.brisson@linaro.org>
To: 
Subject: [PATCH] mps3-an547: Add missing user ahb interfaces
Date: Thu, 10 Feb 2022 15:02:27 -0600
Message-Id: <20220210210227.3203883-1-jimmy.brisson@linaro.org>
X-Mailer: git-send-email 2.33.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::22e
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::22e;
 envelope-from=jimmy.brisson@linaro.org; helo=mail-oi1-x22e.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 "open list:MPS2" <qemu-arm@nongnu.org>,
 "open list:All patches CC here" <qemu-devel@nongnu.org>,
 Jimmy Brisson <jimmy.brisson@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

With these interfaces missing, TFM would delegate peripherals 0, 1,
2, 3 and 8, and qemu would ignore the delegation of interface 8, as
it thought interface 4 was eth & USB.

This patch corrects this behavior and allows TFM to delegate the
eth & USB peripheral to NS mode.

Signed-off-by: Jimmy Brisson <jimmy.brisson@linaro.org>
---
 hw/arm/mps2-tz.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/hw/arm/mps2-tz.c b/hw/arm/mps2-tz.c
index f40e854dec..e287ad4d06 100644
--- a/hw/arm/mps2-tz.c
+++ b/hw/arm/mps2-tz.c
@@ -1078,6 +1078,10 @@ static void mps2tz_common_init(MachineState *machine)
                 { "gpio1", make_unimp_dev, &mms->gpio[1], 0x41101000, 0x1000 },
                 { "gpio2", make_unimp_dev, &mms->gpio[2], 0x41102000, 0x1000 },
                 { "gpio3", make_unimp_dev, &mms->gpio[3], 0x41103000, 0x1000 },
+                { /* port 4 USER AHB interface 0 */ },
+                { /* port 5 USER AHB interface 1 */ },
+                { /* port 6 USER AHB interface 2 */ },
+                { /* port 7 USER AHB interface 3 */ },
                 { "eth-usb", make_eth_usb, NULL, 0x41400000, 0x200000, { 49 } },
             },
         },
-- 
2.33.1


