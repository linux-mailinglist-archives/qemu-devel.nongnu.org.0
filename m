Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BA6C45B2735
	for <lists+qemu-devel@lfdr.de>; Thu,  8 Sep 2022 21:55:54 +0200 (CEST)
Received: from localhost ([::1]:57430 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oWNcv-0002hE-R6
	for lists+qemu-devel@lfdr.de; Thu, 08 Sep 2022 15:55:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34036)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1oWNOf-00057V-1y; Thu, 08 Sep 2022 15:41:09 -0400
Received: from mail-oa1-x36.google.com ([2001:4860:4864:20::36]:38863)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1oWNOd-0007DG-Hs; Thu, 08 Sep 2022 15:41:08 -0400
Received: by mail-oa1-x36.google.com with SMTP id
 586e51a60fabf-1278624b7c4so28966249fac.5; 
 Thu, 08 Sep 2022 12:41:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=hBI/7RO7Fr1a9pi8i5aU6Jr0VxpF0f01rU6VBZnellI=;
 b=TZUfa1yA8mGD9gNHIH6Obzh2Tz5G3k4P4q/K+BzV8IhYsA6zvDOY5Pd/OvON7p+616
 Cn10+78eSvbKAKDuxpBEZnjeqDlxUI2cV1R2wuapCT3e263L7aNmJppBuyhcUYG1mIv9
 adjUqyOPbxZwvhf9IvV5fvBV6c7hBECxYe8ryuMLOg/tLxpA54YyAZFcRXqMIjwaq2IM
 tkeBipmMfyZZgpj0466DN5iGqmqC9DQVZRpYYdDuoY+S5m+VhsidvTliBwM5NuF62n+6
 fdTS+zltZ6W55dVr27wZuXUfVVZvF8g1hRMOqGi/lobbUb9ThKxM3bkhzzMEceRrl3+g
 ALXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=hBI/7RO7Fr1a9pi8i5aU6Jr0VxpF0f01rU6VBZnellI=;
 b=4XbEseIuUsgVeka0L7KaFm74hNTjIUdob5GHNJVdnHt7E1AK5wRAraQdg2kRvkA78q
 mrbTeCJiwFR233i1PGLoF0YXh93sW6HP2lBTFsdqJvnZ9h4193+dAXsWhGMzBitIRR3l
 erpGifkb5C3yMfizQ6Z415bQbZYsgHRnCgRmRD3XjTvTBsR0p2qBFidF824UJ/5nhh9W
 dlP4tR0oT1qNW7DUqWkcOfK9z9HjJCG91aBmTywhzFXdGyK3teERV1mGpgrWwCNAsOXZ
 236aFZwyIRAsRuzrvwymJSq/QM0wsZwCaHlK/lKQzK3eDf34DMH/LhQucBJLadJjN5Rn
 FE4Q==
X-Gm-Message-State: ACgBeo3BwrwX4P+j3WMkvaGAQ61brmLYUHk66qrrmcgTxZhJYas2cSdk
 oCGnTVuB9klVFhpAWe3LX6OApXt1sEuuZw==
X-Google-Smtp-Source: AA6agR7yNOjg5jnHvyIliPHaU0K53lqPW3T55i8lRLGG5mJvKandYsg/KO+Mma3dxcWcRSJL3K20VQ==
X-Received: by 2002:a05:6870:701f:b0:127:8afc:e62c with SMTP id
 u31-20020a056870701f00b001278afce62cmr2780842oae.234.1662666065843; 
 Thu, 08 Sep 2022 12:41:05 -0700 (PDT)
Received: from balboa.ibmuc.com (200-207-147-180.dsl.telesp.net.br.
 [200.207.147.180]) by smtp.gmail.com with ESMTPSA id
 3-20020aca0703000000b0033ad6ea8d11sm2839849oih.47.2022.09.08.12.41.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 08 Sep 2022 12:41:05 -0700 (PDT)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, clg@kaod.org,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 BALATON Zoltan <balaton@eik.bme.hu>
Subject: [PATCH v7 08/14] hw/ppc: set machine->fdt in pegasos2_machine_reset()
Date: Thu,  8 Sep 2022 16:40:34 -0300
Message-Id: <20220908194040.518400-9-danielhb413@gmail.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20220908194040.518400-1-danielhb413@gmail.com>
References: <20220908194040.518400-1-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2001:4860:4864:20::36;
 envelope-from=danielhb413@gmail.com; helo=mail-oa1-x36.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
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

We'll introduce a QMP/HMP command that requires machine->fdt to be set
properly.

Cc: BALATON Zoltan <balaton@eik.bme.hu>
Cc: qemu-ppc@nongnu.org
Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
---
 hw/ppc/pegasos2.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/hw/ppc/pegasos2.c b/hw/ppc/pegasos2.c
index 61f4263953..ecf682b148 100644
--- a/hw/ppc/pegasos2.c
+++ b/hw/ppc/pegasos2.c
@@ -331,6 +331,10 @@ static void pegasos2_machine_reset(MachineState *machine)
 
     vof_build_dt(fdt, pm->vof);
     vof_client_open_store(fdt, pm->vof, "/chosen", "stdout", "/failsafe");
+
+    /* Set machine->fdt for 'dumpdtb' QMP/HMP command */
+    machine->fdt = fdt;
+
     pm->cpu->vhyp = PPC_VIRTUAL_HYPERVISOR(machine);
 }
 
-- 
2.37.2


