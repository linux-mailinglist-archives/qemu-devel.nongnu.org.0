Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AE4546F7AA8
	for <lists+qemu-devel@lfdr.de>; Fri,  5 May 2023 03:19:43 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pujuP-0006vi-O5; Thu, 04 May 2023 21:06:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1puju6-0006ne-8X
 for qemu-devel@nongnu.org; Thu, 04 May 2023 21:06:36 -0400
Received: from mail-pj1-x1031.google.com ([2607:f8b0:4864:20::1031])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1puju2-0007lG-TF
 for qemu-devel@nongnu.org; Thu, 04 May 2023 21:06:33 -0400
Received: by mail-pj1-x1031.google.com with SMTP id
 98e67ed59e1d1-24e01ba9e03so867972a91.1
 for <qemu-devel@nongnu.org>; Thu, 04 May 2023 18:06:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1683248788; x=1685840788;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=kfBR1l/PXU4/Q6yJtXXce9Y0KTY53G4yiiDVUTCQE3g=;
 b=jfZZ7xnBfzijqPsuj3Fj02RyZ3+0ow59iT2Je1Qg+bF4AYeTNk3ZUSG+g4H9OIAyzT
 suMM4Wa+wee3RBONfnUG/Q1Yt39ed+55tHB/dNGbzoEzQX//89BPPOB7ZGvd2+BKPfPk
 DTVthYLOOSnSj6cUCsvloqFeBxRHk48Uu9+95ITdhBMqO1Kuc/q98MzndmsaBs9HZVuT
 NWpN0KfI6LoQ6xyATaSWAbanIQDyH91OwcUPBFG+ynQyUSLfmS7nc6kbOpVZPfhbo414
 BvlMONBkgOXpXjburLX/eqGRD06ix2jl58chG+tZWLJnlo0llsPynpmrcaUxv3SAOoj9
 cEiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683248788; x=1685840788;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=kfBR1l/PXU4/Q6yJtXXce9Y0KTY53G4yiiDVUTCQE3g=;
 b=L+LEDVzZ1W97tsHN7XuKm6rOxC87budbb8MfStUEIxf6J8h/2k3TzhrM3Ta1S8p17+
 Qsqy/ex1LzU3c1VOImQ2iqm+hR9beptTL2oGQKGnGT9OzNxRkfTym5YFlBVgNI/QM/F1
 p+SFmCO2wrPGPw6lBqfmqsSbYOXvG6wQPaTKoC1xAc4BCE5fa9JZeAqlYITqaYKSRga+
 FozRQ6qwpCwlVEaVAmnVKatsnGOUREw7CIV2eC/0m/Ef5b4Zra7mcgdbgMaAAY6ZHbnM
 lLQaHjF/t9qbqDgcZe7ltpt1ZPPSVYRa7PiNP/DSstocbJ/8+T6/554pijvowsa3rYvK
 cAeA==
X-Gm-Message-State: AC+VfDxW3mInEPOUS/gn0psEG6lJuJfwDz5VFb6mnVDmraD1N5LbQtOs
 EejGo7U3oeobbx3TYtWCeX98alCZjygXsA==
X-Google-Smtp-Source: ACHHUZ7Q+m8je07754uF9vYVXmDo+DwaG7znWw2qz4gxCrXS7O96+OjB54Oc1Gf3ChQJuDMf/Pua3Q==
X-Received: by 2002:a17:90b:2290:b0:24e:f37:a6a2 with SMTP id
 kx16-20020a17090b229000b0024e0f37a6a2mr3916614pjb.21.1683248787762; 
 Thu, 04 May 2023 18:06:27 -0700 (PDT)
Received: from toolbox.alistair23.me
 (2403-580b-97e8-0-321-6fb2-58f1-a1b1.ip6.aussiebb.net.
 [2403:580b:97e8:0:321:6fb2:58f1:a1b1])
 by smtp.gmail.com with ESMTPSA id
 l19-20020a170902d35300b0019309be03e7sm218762plk.66.2023.05.04.18.06.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 04 May 2023 18:06:27 -0700 (PDT)
From: Alistair Francis <alistair23@gmail.com>
X-Google-Original-From: Alistair Francis <alistair.francis@wdc.com>
To: qemu-devel@nongnu.org
Cc: alistair23@gmail.com, Weiwei Li <liweiwei@iscas.ac.cn>,
 Junqiang Wang <wangjunqiang@iscas.ac.cn>,
 Alistair Francis <alistair.francis@wdc.com>
Subject: [PULL 56/89] target/riscv: Use check for relationship between
 Zdinx/Zhinx{min} and Zfinx
Date: Fri,  5 May 2023 11:02:08 +1000
Message-Id: <20230505010241.21812-57-alistair.francis@wdc.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230505010241.21812-1-alistair.francis@wdc.com>
References: <20230505010241.21812-1-alistair.francis@wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1031;
 envelope-from=alistair23@gmail.com; helo=mail-pj1-x1031.google.com
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

From: Weiwei Li <liweiwei@iscas.ac.cn>

Zdinx/Zhinx{min} require Zfinx. And require relationship is usually done
by check currently.

Signed-off-by: Weiwei Li <liweiwei@iscas.ac.cn>
Signed-off-by: Junqiang Wang <wangjunqiang@iscas.ac.cn>
Acked-by: Alistair Francis <alistair.francis@wdc.com>
Message-Id: <20230408135908.25269-1-liweiwei@iscas.ac.cn>
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/cpu.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index d1769fd218..fab38859ec 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -916,8 +916,9 @@ static void riscv_cpu_validate_set_extensions(RISCVCPU *cpu, Error **errp)
         cpu->cfg.ext_zhinxmin = true;
     }
 
-    if (cpu->cfg.ext_zdinx || cpu->cfg.ext_zhinxmin) {
-        cpu->cfg.ext_zfinx = true;
+    if ((cpu->cfg.ext_zdinx || cpu->cfg.ext_zhinxmin) && !cpu->cfg.ext_zfinx) {
+        error_setg(errp, "Zdinx/Zhinx/Zhinxmin extensions require Zfinx");
+        return;
     }
 
     if (cpu->cfg.ext_zfinx) {
-- 
2.40.0


