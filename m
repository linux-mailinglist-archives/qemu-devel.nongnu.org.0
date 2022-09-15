Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AC975B9ED6
	for <lists+qemu-devel@lfdr.de>; Thu, 15 Sep 2022 17:33:52 +0200 (CEST)
Received: from localhost ([::1]:53430 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oYqsA-0003Kw-KJ
	for lists+qemu-devel@lfdr.de; Thu, 15 Sep 2022 11:33:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56612)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1oYqkZ-0007rY-Ej; Thu, 15 Sep 2022 11:25:59 -0400
Received: from mail-ed1-x532.google.com ([2a00:1450:4864:20::532]:41880)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1oYqkX-0007GG-SV; Thu, 15 Sep 2022 11:25:59 -0400
Received: by mail-ed1-x532.google.com with SMTP id z97so27457258ede.8;
 Thu, 15 Sep 2022 08:25:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=i4b49jUYGVkdhUrYn5lp3mVJKooGzbJRKK9oAzR+CRg=;
 b=QLANjqsq9xgLC2h7TLYuNQodtyHvgQX/EoGZr87PGcCDJF//4BqMEZukwLjnGgiGya
 9KTzn38m85/8Z2P6RmDUw1NFeeFkfDNhxvp7HzNNsaWWS4ngCSa4b+Ux/gg96KQorPC7
 xNmQFrbPnNcuDvN0XZY+qSjpeS87hCCOpuDbgvI3/l7G2yTysiQFJtMFPJRsXcD+UFU0
 D4seUBTZjq66kDawHrOUpc4E5RuxkayxC/mFIl9Y3GGKKGgZN1KWE7J/akMsJ4NYBY5/
 KYNm0cgY7pwAgpuHIT7/Vg5uvetPbsJH4s7E49QYwCtrF0mny9LObBoPv2Ph7AJjBvph
 5koA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=i4b49jUYGVkdhUrYn5lp3mVJKooGzbJRKK9oAzR+CRg=;
 b=rtCzQ8lIq7OjkgTdivRQJZ/XfnpO4QQy+OAUb0g6wb4+/ienNP3hVV2uTN5oOkTwsB
 15Au8tXvr99rqHsL+i9y6uU9hh/dT+SOVGSRzDzvlTFloKNfDjquCHRc038N6DXPQK3E
 2zC4wKsGxAHWEqodea25Lq8du77qZqOCD9GTMmYIvSJtTZWSDrKKsHSSZ6qRW8pIHMfB
 7vHxAF9KNGXtMa/DPEUxPQ88f8J43pG9I6a2q5vx44HDgW58yB+Zd5YC5AJrzKfa353U
 tzwql4y3CTyZrkgVYJCjbUvymLMdXerIvzw7pGCvjFWXH4eV5jMSGiRWvcSI+wQ0U6hA
 lsww==
X-Gm-Message-State: ACrzQf1dgEz44mpSALqDcZ7sysf+FPqnsqWDP+n7H1jGtxZggOiDp9UJ
 h6Cqwh1lRmMs1wvt72Psz6wnApi9vRg=
X-Google-Smtp-Source: AMsMyM7Z2oNH4qL3/5VZkF/eq1vFGc9i4Zso8FQnUYqG5OEv0LYX4hk32GMQMZ5rdf0MilZig/JYVg==
X-Received: by 2002:a05:6402:51c7:b0:452:981:872a with SMTP id
 r7-20020a05640251c700b004520981872amr348713edd.388.1663255555581; 
 Thu, 15 Sep 2022 08:25:55 -0700 (PDT)
Received: from localhost.localdomain
 (dynamic-077-191-182-143.77.191.pool.telefonica.de. [77.191.182.143])
 by smtp.gmail.com with ESMTPSA id
 2-20020a170906210200b00730979f568fsm9297138ejt.150.2022.09.15.08.25.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 15 Sep 2022 08:25:55 -0700 (PDT)
From: Bernhard Beschow <shentey@gmail.com>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Kevin Wolf <kwolf@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 qemu-block@nongnu.org, Bin Meng <bin.meng@windriver.com>,
 qemu-ppc@nongnu.org, Bernhard Beschow <shentey@gmail.com>
Subject: [PATCH 04/11] hw/ppc/mpc8544ds: Add platform bus
Date: Thu, 15 Sep 2022 17:25:13 +0200
Message-Id: <20220915152520.21948-5-shentey@gmail.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20220915152520.21948-1-shentey@gmail.com>
References: <20220915152520.21948-1-shentey@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::532;
 envelope-from=shentey@gmail.com; helo=mail-ed1-x532.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Models the real device more closely.

Signed-off-by: Bernhard Beschow <shentey@gmail.com>
---
 hw/ppc/mpc8544ds.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/hw/ppc/mpc8544ds.c b/hw/ppc/mpc8544ds.c
index 81177505f0..cd6cd04bef 100644
--- a/hw/ppc/mpc8544ds.c
+++ b/hw/ppc/mpc8544ds.c
@@ -14,6 +14,7 @@
 #include "sysemu/device_tree.h"
 #include "hw/ppc/openpic.h"
 #include "qemu/error-report.h"
+#include "qemu/units.h"
 #include "cpu.h"
 
 static void mpc8544ds_fixup_devtree(void *fdt)
@@ -45,6 +46,11 @@ static void e500plat_machine_class_init(ObjectClass *oc, void *data)
     pmc->pci_nr_slots = 2;
     pmc->fixup_devtree = mpc8544ds_fixup_devtree;
     pmc->mpic_version = OPENPIC_MODEL_FSL_MPIC_20;
+    pmc->has_platform_bus = true;
+    pmc->platform_bus_base = 0xEC000000ULL;
+    pmc->platform_bus_size = 128 * MiB;
+    pmc->platform_bus_first_irq = 5;
+    pmc->platform_bus_num_irqs = 10;
     pmc->ccsrbar_base = 0xE0000000ULL;
     pmc->pci_mmio_base = 0xC0000000ULL;
     pmc->pci_mmio_bus_base = 0xC0000000ULL;
-- 
2.37.3


