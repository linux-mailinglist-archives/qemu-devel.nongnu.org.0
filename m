Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D8ED351C565
	for <lists+qemu-devel@lfdr.de>; Thu,  5 May 2022 18:49:53 +0200 (CEST)
Received: from localhost ([::1]:52256 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nmefo-0003vo-VY
	for lists+qemu-devel@lfdr.de; Thu, 05 May 2022 12:49:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37252)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1nmeBP-00023X-I6; Thu, 05 May 2022 12:18:27 -0400
Received: from mail-ej1-x62a.google.com ([2a00:1450:4864:20::62a]:46792)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1nmeBN-0005i6-Rp; Thu, 05 May 2022 12:18:27 -0400
Received: by mail-ej1-x62a.google.com with SMTP id j6so9656119ejc.13;
 Thu, 05 May 2022 09:18:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=MEkiF45uG0tcJHA4L/93sG9+aM2PpilRQO/AdqVmaNU=;
 b=pcdpqXJ8iC8QpqlZeY+Tr8Aiva5pGdiIar8BZkFwn40rVJKXuFuLlUySXqgFSEt617
 pVxCiZE33GAEyWd+UFKQlPDMxaWpZEupipdTXm9pz50qP+Pi8SEYtg1mUXfT+WNOgf/M
 3elgPGlBhYeJlZBfR4geXzHTcNxdsOPgRvhBaoRRkgtcGurVFA6VMhgHRZ0hjX1E29tv
 BB2IY2ULh3FGnP3/xAMoD0+yCpMU5lOPWCE0wyM4CQHOQtGhfDU1EZart/J20mQqlLOR
 pm8k5RTz50ce1x2JQhTqcyEXBJwA9rmRGte02i1JkzHua9tBks+fvxzmryKLrvI3jhIX
 bq7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=MEkiF45uG0tcJHA4L/93sG9+aM2PpilRQO/AdqVmaNU=;
 b=QdQvGTH3zrlSujuqsQ0YBus3QPObIlq5wbeH+ITo4rKUQImYnsqBfIxknUsmQHPgcs
 v0cF/yahuNnehSsDh8OrFTYQF2gHjttMi+aQj3evHMirASiQb55/vsjPmxY+oVEVr13Z
 7+01QNH3mDBkunhU+SeJKcBdmLWUIetZP8P7rhHq7Aemt2gfMdwLaAz/0LpJj6sTKzoa
 rqer8jnSZ9gU3OJyOXm6eKPp8KdV55rQ8higN9OIiTxzrhMjsVaZbKkbRAi+bJpn33Jk
 b97iwKb47Sxcvd10ftWlU/tu7q5I2d3HaGKBzVW9h5PaZlSeqeSrVJbKB5+H9NFXioNW
 0yTA==
X-Gm-Message-State: AOAM532lsi7SDJ6QLZxe2+/jM15sc2IF2wIs7bBzd9kaXaXE7nXY1SRC
 ZsY9KIg+WSNVHkwdk3LmYWDOekIXhoA=
X-Google-Smtp-Source: ABdhPJyVqIV5yRyA/vUAfVLAgIXvCb33+LACCdlIJNrlTh0rtAN4Ff0Dxh503XMFSU4+R7MoHJR/RA==
X-Received: by 2002:a17:907:7f2a:b0:6f4:a358:c826 with SMTP id
 qf42-20020a1709077f2a00b006f4a358c826mr12655332ejc.404.1651767504570; 
 Thu, 05 May 2022 09:18:24 -0700 (PDT)
Received: from Provence.localdomain
 (dynamic-078-054-123-159.78.54.pool.telefonica.de. [78.54.123.159])
 by smtp.gmail.com with ESMTPSA id
 i6-20020a17090685c600b006f3ef214dcfsm868542ejy.53.2022.05.05.09.18.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 May 2022 09:18:24 -0700 (PDT)
From: Bernhard Beschow <shentey@gmail.com>
To: qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org, Bernhard Beschow <shentey@gmail.com>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
Subject: [PATCH 06/11] hw/i386/pc: Remove orphan declarations
Date: Thu,  5 May 2022 18:18:00 +0200
Message-Id: <20220505161805.11116-7-shentey@gmail.com>
X-Mailer: git-send-email 2.36.0
In-Reply-To: <20220505161805.11116-1-shentey@gmail.com>
References: <20220505161805.11116-1-shentey@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::62a;
 envelope-from=shentey@gmail.com; helo=mail-ej1-x62a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Bernhard Beschow <shentey@gmail.com>
---
 include/hw/i386/pc.h | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/include/hw/i386/pc.h b/include/hw/i386/pc.h
index a087ea7598..2cd58ee0c6 100644
--- a/include/hw/i386/pc.h
+++ b/include/hw/i386/pc.h
@@ -172,9 +172,6 @@ void pc_cmos_init(PCMachineState *pcms,
                   BusState *ide0, BusState *ide1,
                   ISADevice *s);
 void pc_nic_init(PCMachineClass *pcmc, ISABus *isa_bus, PCIBus *pci_bus);
-void pc_pci_device_init(PCIBus *pci_bus);
-
-typedef void (*cpu_set_smm_t)(int smm, void *arg);
 
 void pc_i8259_create(ISABus *isa_bus, qemu_irq *i8259_irqs);
 
-- 
2.36.0


