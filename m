Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D7AC44C00B8
	for <lists+qemu-devel@lfdr.de>; Tue, 22 Feb 2022 18:58:39 +0100 (CET)
Received: from localhost ([::1]:39974 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nMZQs-0003WA-WB
	for lists+qemu-devel@lfdr.de; Tue, 22 Feb 2022 12:58:39 -0500
Received: from eggs.gnu.org ([209.51.188.92]:36566)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1nMZ7f-000403-5W
 for qemu-devel@nongnu.org; Tue, 22 Feb 2022 12:38:47 -0500
Received: from [2a00:1450:4864:20::534] (port=40919
 helo=mail-ed1-x534.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1nMZ7d-0002qd-6r
 for qemu-devel@nongnu.org; Tue, 22 Feb 2022 12:38:46 -0500
Received: by mail-ed1-x534.google.com with SMTP id h15so21729677edv.7
 for <qemu-devel@nongnu.org>; Tue, 22 Feb 2022 09:38:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=/3j29R7lXMdrMKGnt5++sE1+VglPHaZYEgL5oGNi9kU=;
 b=IYEzeZkOpD+tCxBCkj+puA2KbyUcR75VNdF+5fh2AJ93fKzCnDxHeA58ApRHbY1GDX
 qLnhfbYLLsyPPI9M+C03g7Sw14sl0nbdGaoZ2AbUU70sjLcBpYyKkGQ1YTol5PBoJtpA
 /elai6iSwqTvwr3RBj7tWL73hOmO+26tyIuR09Lh0VyqZpyCEywErGegbgUTHP/QUCzv
 qRTKlcfZETZgMOl8PxDUB0bXKRNKFTj14YQP4b2h4KmSqf1FuVEXuYDtXW1+cJnBZx83
 kfILgJK5w2a6p90P1G2HvNFfkrrRyU2U5EDOjp7Giv85dHVH3bEfDduX6GVlwbylhXbi
 bDXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=/3j29R7lXMdrMKGnt5++sE1+VglPHaZYEgL5oGNi9kU=;
 b=Gvw1A0WuYaDOL1Y0NaVwdQRfS/K6B/UeXZU2Av9O5xKPgm1hXZ6mjAGb8YTj/oJU0/
 3faRvcWPezo70P1sxggs7J4byd0G0yp5cTijXGrt9yHSoe5RxqdAJrlEFk+2lp2+UTBp
 peLZxmHeDc5k1xfRNhd1IyUAGn1tR127f0+ti7e997RGe5JTD7nzzFEZ+voWOSCL4IfB
 bF51kqmfu2XY+u3rHuUFKy8Nz/vxUxqGbH2r4TdBobVaJNA+I6i8UAX5c2xCnhslI2gG
 xJkTDoG0HduucDDQWOLbIx2vKvRumtOcE2Z63p8PWWKMcxoiM0ITwmQFtiXjOzhdkDIx
 ebpA==
X-Gm-Message-State: AOAM532Qq9TSUyZG/OHUZCg4xj7a0EdIA5ZAAIV1bMCUQUKWlJaoFDxl
 b0ecLRRUAFchFgZgy3rksUDXCIUQUmY=
X-Google-Smtp-Source: ABdhPJysvbm++pSafN/7RZhnBh/zPr/oTuqFQ1dXx1i23Ij0hOh7JmjY9hDqZyB8ntSJi6eVH4NmTQ==
X-Received: by 2002:a05:6402:1d54:b0:410:f02d:4765 with SMTP id
 dz20-20020a0564021d5400b00410f02d4765mr26905537edb.28.1645551523758; 
 Tue, 22 Feb 2022 09:38:43 -0800 (PST)
Received: from Provence.localdomain
 (dynamic-089-012-227-088.89.12.pool.telefonica.de. [89.12.227.88])
 by smtp.gmail.com with ESMTPSA id et2sm6449382ejc.101.2022.02.22.09.38.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 22 Feb 2022 09:38:43 -0800 (PST)
From: Bernhard Beschow <shentey@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 17/22] hw/isa/piix4: Disuse isa_init_irq()
Date: Tue, 22 Feb 2022 18:38:14 +0100
Message-Id: <20220222173819.76568-18-shentey@gmail.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220222173819.76568-1-shentey@gmail.com>
References: <20220222173819.76568-1-shentey@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::534
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::534;
 envelope-from=shentey@gmail.com; helo=mail-ed1-x534.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
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
Cc: =?UTF-8?q?Herv=C3=A9=20Poussineau?= <hpoussin@reactos.org>,
 Bernhard Beschow <shentey@gmail.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

isa_init_irq() has become a trivial one-line wrapper for isa_get_irq().
Use the original instead such that isa_init_irq() can be removed
eventually.

Signed-off-by: Bernhard Beschow <shentey@gmail.com>
---
 hw/isa/piix4.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/isa/piix4.c b/hw/isa/piix4.c
index cb291d121c..0fd6756dcf 100644
--- a/hw/isa/piix4.c
+++ b/hw/isa/piix4.c
@@ -197,7 +197,7 @@ static void piix4_realize(PCIDevice *dev, Error **errp)
     if (!qdev_realize(DEVICE(&s->rtc), BUS(isa_bus), errp)) {
         return;
     }
-    isa_init_irq(ISA_DEVICE(&s->rtc), &s->rtc.irq, s->rtc.isairq);
+    s->rtc.irq = isa_get_irq(ISA_DEVICE(&s->rtc), s->rtc.isairq);
 
     piix4_dev = dev;
 }
-- 
2.35.1


