Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 17F645EB078
	for <lists+qemu-devel@lfdr.de>; Mon, 26 Sep 2022 20:49:04 +0200 (CEST)
Received: from localhost ([::1]:57232 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1octA6-0005ZY-MV
	for lists+qemu-devel@lfdr.de; Mon, 26 Sep 2022 14:49:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41028)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1ocs4X-0008At-7N
 for qemu-devel@nongnu.org; Mon, 26 Sep 2022 13:39:13 -0400
Received: from mail-oi1-x233.google.com ([2607:f8b0:4864:20::233]:40698)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1ocs4V-00026L-NM
 for qemu-devel@nongnu.org; Mon, 26 Sep 2022 13:39:12 -0400
Received: by mail-oi1-x233.google.com with SMTP id n124so9114431oih.7
 for <qemu-devel@nongnu.org>; Mon, 26 Sep 2022 10:39:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=vHdfvsXs7srv9brU6TUmccxbRW5ad8ZONz/r55nW2zs=;
 b=cCDDp8zkDYzRynqPvw1FyTXX1kPcdZB2C+bYoKzWfusnctHBkjx40yIIfhuM1N7sej
 4za2kg1C0ujajDyh/5XZkXtzqO2rIfx6LUhy8FYQJeDfEqr8HjCjXc4xgAHm9oZPnRkK
 OGmZaCR+OtIKm8FUYX/IzUy5xZCxVFWpSLMMb23nz5mT0B3W9kqJ2ORK9LQiOw2GscQn
 O/2/LRnu555DbdQPbkQUds/mZ0ikT4p5tlutl7WH47lbVk4LfvjIG8rdfvJBwpP2rP+S
 ydIRErWCtqqIpJYdgT1mxF+9zgMlsvOv3M1Q6B86RHePrWR0DQbUYYilyTYzmqZ3+470
 5xTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=vHdfvsXs7srv9brU6TUmccxbRW5ad8ZONz/r55nW2zs=;
 b=P9xxTyGRH1LvBk3qirJLYUy07+n+gWx2byUyRkh7V4zd+ib1HI+crUlKjEJhY8Zrzi
 tM0YT2ywgIyE75ZpSnGB9z5Teqx4y5qPkmbECf2ADJfQm3LLbWQOW8TTMNurlcwEc04p
 hbf9NmYxce9ozlirOkJw6IFrO/lGF+T+EajmiqgUTTihgRV2pLs5XtiNn8+0azB9ama8
 579hwPmH5saikC09Kj5ODe9Ws9sEBSIAFQ1SZcvsTz4EMTvqQiccUQRLdKplX5iQhhGX
 k7yM6nrchueI6UF0ifMhf1cjc+2hNkc6U2LD3GdzuAijq83xeGojNfPjmm+9WNNkgC9C
 04Aw==
X-Gm-Message-State: ACrzQf082pRuNqd9z2Wid0kVd5RueRcA+kPiSh63tgSLOOmP4RINeRDm
 yAT2RuByVJonn/U2fLiVofJ7dUtseO4=
X-Google-Smtp-Source: AMsMyM6029gcTA9hPYOrjsXTReJn6Ez0ARyg1F9EwysaI3u6AOpT/PlptXgFNOTB4qi/dTDlC0fMoQ==
X-Received: by 2002:a05:6808:f88:b0:350:36e8:f29a with SMTP id
 o8-20020a0568080f8800b0035036e8f29amr15457476oiw.195.1664213950223; 
 Mon, 26 Sep 2022 10:39:10 -0700 (PDT)
Received: from balboa.COMFAST (189-68-154-15.dsl.telesp.net.br.
 [189.68.154.15]) by smtp.gmail.com with ESMTPSA id
 m12-20020a0568301e6c00b0061c9ab1032dsm7947165otr.18.2022.09.26.10.39.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 26 Sep 2022 10:39:09 -0700 (PDT)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Cc: Daniel Henrique Barboza <danielhb413@gmail.com>
Subject: [PATCH v8 04/16] hw/mips: set machine->fdt in boston_mach_init()
Date: Mon, 26 Sep 2022 14:38:43 -0300
Message-Id: <20220926173855.1159396-5-danielhb413@gmail.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20220926173855.1159396-1-danielhb413@gmail.com>
References: <20220926173855.1159396-1-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::233;
 envelope-from=danielhb413@gmail.com; helo=mail-oi1-x233.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
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

This will enable support for the 'dumpdtb' QMP/HMP command for the
boston machine.

'dtb_load_data' can't be autofreed anymore, otherwise we'll free the fdt
that is now being referenced by machine->fdt.

Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
---
 hw/mips/boston.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/hw/mips/boston.c b/hw/mips/boston.c
index d2ab9da1a0..65d38cbd71 100644
--- a/hw/mips/boston.c
+++ b/hw/mips/boston.c
@@ -793,7 +793,7 @@ static void boston_mach_init(MachineState *machine)
         if (kernel_size > 0) {
             int dt_size;
             g_autofree const void *dtb_file_data = NULL;
-            g_autofree const void *dtb_load_data = NULL;
+            const void *dtb_load_data = NULL;
             hwaddr dtb_paddr = QEMU_ALIGN_UP(kernel_high, 64 * KiB);
             hwaddr dtb_vaddr = cpu_mips_phys_to_kseg0(NULL, dtb_paddr);
 
@@ -810,6 +810,9 @@ static void boston_mach_init(MachineState *machine)
             /* Calculate real fdt size after filter */
             dt_size = fdt_totalsize(dtb_load_data);
             rom_add_blob_fixed("dtb", dtb_load_data, dt_size, dtb_paddr);
+
+            /* Set machine->fdt for 'dumpdtb' QMP/HMP command */
+            machine->fdt = (void *)dtb_load_data;
         } else {
             /* Try to load file as FIT */
             fit_err = load_fit(&boston_fit_loader, machine->kernel_filename, s);
-- 
2.37.3


