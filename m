Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 87836440A94
	for <lists+qemu-devel@lfdr.de>; Sat, 30 Oct 2021 19:24:40 +0200 (CEST)
Received: from localhost ([::1]:47486 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mgs5v-0007vi-Kz
	for lists+qemu-devel@lfdr.de; Sat, 30 Oct 2021 13:24:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56110)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mgrpX-0003b2-Ee
 for qemu-devel@nongnu.org; Sat, 30 Oct 2021 13:07:43 -0400
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333]:41579)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mgrpV-0004rA-7t
 for qemu-devel@nongnu.org; Sat, 30 Oct 2021 13:07:43 -0400
Received: by mail-wm1-x333.google.com with SMTP id
 f7-20020a1c1f07000000b0032ee11917ceso5286581wmf.0
 for <qemu-devel@nongnu.org>; Sat, 30 Oct 2021 10:07:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=jdKl9o+oBM2OX3ufm2SkZhH3pZxHP0D3+nsrQfsxMSs=;
 b=a76d4XwEeKriXMlCMgb1fe1Ggltw+7umdhUsWm72F7kPmi4dk8LnlPAlQTlkn/Ox3J
 CwpSKqLtV5zmqV4sQYobvCqXRVHrBeWYYRbK57TZ7Le+Z9VbnniwU2Mhs/qbkdTr+gT6
 lUncquVRN5JMTUjo3hwx0wegpYb2Nc3lknXCC28YNTg7C+5iTzPJKFoB2XdCEDKHOQ1I
 GuyCNNp+Z0BOsZbkUVfXWGNUiXX41u5eA01K4757bMIYC+Iw1adNXIcLYocRfxCP5sor
 imb+74P6qY/Ntsa7Ia10u1Whcfv0VlbEf+g92dH+2tWmGBWCvBTcTB8yJbhGADwCw153
 wXtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=jdKl9o+oBM2OX3ufm2SkZhH3pZxHP0D3+nsrQfsxMSs=;
 b=5Rm4qBFltcMweo5Fgd0bK2LJ+3KcDNf/gLMjbZ2YCMWGmTIqbhAPKo8XsoyvJcprMM
 3nn5xzt1F2YegeAOOpUa3vq9GPT1bZVNweqjxVeI3pSJq0txIxnxEVhjMnrz6XdnrDTq
 dyH3p8gWQtLdjbHGDDh+Duc0oDdakLHgNWnlynPaGlINaT8DQtwmKxbiOD+TBZwtcC6a
 91xZEgA4PCTV14quUrkboATddD8XM4a9tixpaKBqQzkZHb9iAw2mK+4y3tl7Ppjs6d8R
 MLvSLAYx9oTBn9qXJTGCRWYS1FyRPNYNEVYwoHiMnvcYF2iJAqYCvRQzMkCeaET74coN
 8YmQ==
X-Gm-Message-State: AOAM532VVAs8cB641ViJa28UJUJjskiggGy169L2BrTDJq4Vxx2aH3S1
 r/AsfSgvnwXBAWGwXauP4eOo/8bA56I=
X-Google-Smtp-Source: ABdhPJz+27a4tGdkvfAj3S+SXAAlRrk7Nsh01UFyRZ10moyeTKxlEZF1Q6M011xrIcXDuNOPvdI16Q==
X-Received: by 2002:a7b:c303:: with SMTP id k3mr19613051wmj.44.1635613659850; 
 Sat, 30 Oct 2021 10:07:39 -0700 (PDT)
Received: from x1w.. (62.red-83-57-168.dynamicip.rima-tde.net. [83.57.168.62])
 by smtp.gmail.com with ESMTPSA id
 10sm13732631wme.27.2021.10.30.10.07.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 30 Oct 2021 10:07:39 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PULL 17/30] hw/intc/sh_intc: Rename iomem region
Date: Sat, 30 Oct 2021 19:06:02 +0200
Message-Id: <20211030170615.2636436-18-f4bug@amsat.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211030170615.2636436-1-f4bug@amsat.org>
References: <20211030170615.2636436-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::333;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x333.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Yoshinori Sato <ysato@users.sourceforge.jp>,
 Magnus Damm <magnus.damm@gmail.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: BALATON Zoltan <balaton@eik.bme.hu>

Rename the iomem region to "intc" from "interrupt-controller" which
makes the info mtree output less wide as it is already too wide
because of all the aliases. Also drop the format macro which was only
used twice in close proximity so we can just use the literal string
instead without a macro definition.

Signed-off-by: BALATON Zoltan <balaton@eik.bme.hu>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Message-Id: <cb6402dab6b44c804142b5cf9af68e6398cb613f.1635541329.git.balaton@eik.bme.hu>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/intc/sh_intc.c | 11 ++++-------
 1 file changed, 4 insertions(+), 7 deletions(-)

diff --git a/hw/intc/sh_intc.c b/hw/intc/sh_intc.c
index f0ef83124e3..175d12b371c 100644
--- a/hw/intc/sh_intc.c
+++ b/hw/intc/sh_intc.c
@@ -287,15 +287,13 @@ static unsigned int sh_intc_register(MemoryRegion *sysmem,
     iomem_p4 = desc->iomem_aliases + index;
     iomem_a7 = iomem_p4 + 1;
 
-#define SH_INTC_IOMEM_FORMAT "interrupt-controller-%s-%s-%s"
-    snprintf(name, sizeof(name), SH_INTC_IOMEM_FORMAT, type, action, "p4");
+    snprintf(name, sizeof(name), "intc-%s-%s-%s", type, action, "p4");
     memory_region_init_alias(iomem_p4, NULL, name, iomem, A7ADDR(address), 4);
     memory_region_add_subregion(sysmem, P4ADDR(address), iomem_p4);
 
-    snprintf(name, sizeof(name), SH_INTC_IOMEM_FORMAT, type, action, "a7");
+    snprintf(name, sizeof(name), "intc-%s-%s-%s", type, action, "a7");
     memory_region_init_alias(iomem_a7, NULL, name, iomem, A7ADDR(address), 4);
     memory_region_add_subregion(sysmem, A7ADDR(address), iomem_a7);
-#undef SH_INTC_IOMEM_FORMAT
 
     /* used to increment aliases index */
     return 2;
@@ -431,9 +429,8 @@ int sh_intc_init(MemoryRegion *sysmem,
     }
 
     desc->irqs = qemu_allocate_irqs(sh_intc_set_irq, desc, nr_sources);
-
-    memory_region_init_io(&desc->iomem, NULL, &sh_intc_ops, desc,
-                          "interrupt-controller", 0x100000000ULL);
+    memory_region_init_io(&desc->iomem, NULL, &sh_intc_ops, desc, "intc",
+                          0x100000000ULL);
 
 #define INT_REG_PARAMS(reg_struct, type, action, j) \
         reg_struct->action##_reg, #type, #action, j
-- 
2.31.1


