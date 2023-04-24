Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AEAB26EC86D
	for <lists+qemu-devel@lfdr.de>; Mon, 24 Apr 2023 11:08:47 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pqsB5-0007Id-Fk; Mon, 24 Apr 2023 05:08:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yongxuan.wang@sifive.com>)
 id 1pqsAz-00076l-87
 for qemu-devel@nongnu.org; Mon, 24 Apr 2023 05:08:03 -0400
Received: from mail-pf1-x436.google.com ([2607:f8b0:4864:20::436])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <yongxuan.wang@sifive.com>)
 id 1pqsAt-0001NS-SL
 for qemu-devel@nongnu.org; Mon, 24 Apr 2023 05:08:00 -0400
Received: by mail-pf1-x436.google.com with SMTP id
 d2e1a72fcca58-63b52ad6311so5254172b3a.2
 for <qemu-devel@nongnu.org>; Mon, 24 Apr 2023 02:07:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sifive.com; s=google; t=1682327274; x=1684919274;
 h=references:in-reply-to:message-id:date:subject:cc:to:from:from:to
 :cc:subject:date:message-id:reply-to;
 bh=YZkT/mJaQEVE4BJ0UCLivl6r6Ulqlc6LfLfb+GExIU0=;
 b=c5DojMkbArsYGM8weGe4bNC4IRNlcafiuRLh9F1nLaRYMNHDSqxnsbM14rkYbRjYsy
 DdieWuvexa0HCAid9N5B8hyMLbr5bGIt5mC4qXRTP7QIgynIkiERR+cN/D8FqJRFrJ1s
 xuTeRywkA1o+VeBb7QTyNHqvaH4maqEDqs2MHRXoEkmTAcg3+4mIZeKbBXWcyok9TCGY
 GugOJZduu0PFa68RoAVRQNAMYzCaW6jn5QDGWgyfXxOu/7Bd6fE8VBXxxnSyQ+gXTqea
 eDQZSR70YTxaZWznQNKkQeobzBSFBGsNyZp7VvxqUa/GqEcVlCbyKG0Ip+u0cACb386i
 H/kA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682327274; x=1684919274;
 h=references:in-reply-to:message-id:date:subject:cc:to:from
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=YZkT/mJaQEVE4BJ0UCLivl6r6Ulqlc6LfLfb+GExIU0=;
 b=PnVUWtx74p2dACGsTFREJ+/P3nUWpk9FBSTw3ui22duZV6/8rLNt3mt4iN+uPp2WyL
 fXcEQr2UdBXOucN83ypgVrYmiu+pVwHkKwYu4B4EOvzMt4CPm7AybMUz1syDIIca7hSh
 keK68OjZogGBDNGmdDTOXGL/nDPBCAC/VTHlnNqRXsZQIeNYibXZaxr5EaBsyvV17uSq
 291xzlYe1qc2DJYpA6JcUX7czF43wketLbQ5N+ctRDGEJGs7k04bbpmfFB6Hpl4T6//h
 QxcjgveOhPw+XIOlgS2MkFrVahEI+HuBj6A4Y0baprfE9jRANMONfO8NL7Dc6DNOuVd0
 lDXQ==
X-Gm-Message-State: AAQBX9f8/91EB0tZJL9L6Al9GLwAP9zaWE7D8LLvBsoqY4gpYHuk7wfu
 L0neh+vjQesctvZbeyC1UDhPGrADDNDVd21gOdCXIic2SDwbbi3JEhyOed62cw5YkQ7jRa8oMFA
 2KJ8pSsdvx1Jv+HJAVHkeBB+Cp/M2rUDSIfs4kqNipoDbYDQn+HMp/7EfZk7sdnCFrogJ9unAoJ
 /Sl0nV
X-Google-Smtp-Source: AKy350ap6F91TGSpJPWRnLbYY7Oz3owGZjtivJpBN94nccA7kn3x5lehvSO4PrpnbV6uGyRTuzd0sw==
X-Received: by 2002:a17:902:ce81:b0:1a5:32d7:90f4 with SMTP id
 f1-20020a170902ce8100b001a532d790f4mr17380475plg.50.1682327273910; 
 Mon, 24 Apr 2023 02:07:53 -0700 (PDT)
Received: from hsinchu25.internal.sifive.com
 (59-124-168-89.hinet-ip.hinet.net. [59.124.168.89])
 by smtp.gmail.com with ESMTPSA id
 jf2-20020a170903268200b001a207906418sm6234820plb.23.2023.04.24.02.07.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 Apr 2023 02:07:53 -0700 (PDT)
From: Yong-Xuan Wang <yongxuan.wang@sifive.com>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: rkanwal@rivosinc.com, anup@brainfault.org, dbarboza@ventanamicro.com,
 atishp@atishpatra.org, vincent.chen@sifive.com, greentime.hu@sifive.com,
 frank.chang@sifive.com, Yong-Xuan Wang <yongxuan.wang@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>
Subject: [PATCH 6/6] target/riscv: select KVM AIA in riscv virt machine
Date: Mon, 24 Apr 2023 09:07:08 +0000
Message-Id: <20230424090716.15674-7-yongxuan.wang@sifive.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20230424090716.15674-1-yongxuan.wang@sifive.com>
References: <20230424090716.15674-1-yongxuan.wang@sifive.com>
Received-SPF: pass client-ip=2607:f8b0:4864:20::436;
 envelope-from=yongxuan.wang@sifive.com; helo=mail-pf1-x436.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, T_SCC_BODY_TEXT_LINE=-0.01,
 T_SPF_TEMPERROR=0.01 autolearn=unavailable autolearn_force=no
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

Select KVM AIA when the host kernel has in-kernel AIA chip support.

Signed-off-by: Yong-Xuan Wang <yongxuan.wang@sifive.com>
Reviewed-by: Jim Shu <jim.shu@sifive.com>
---
 hw/riscv/virt.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/hw/riscv/virt.c b/hw/riscv/virt.c
index 18aede7b23..908b304991 100644
--- a/hw/riscv/virt.c
+++ b/hw/riscv/virt.c
@@ -35,6 +35,7 @@
 #include "hw/riscv/virt.h"
 #include "hw/riscv/boot.h"
 #include "hw/riscv/numa.h"
+#include "kvm_riscv.h"
 #include "hw/intc/riscv_aclint.h"
 #include "hw/intc/riscv_aplic.h"
 #include "hw/intc/riscv_imsic.h"
@@ -1215,6 +1216,15 @@ static DeviceState *virt_create_aia(RISCVVirtAIAType aia_type, int aia_guests,
             msimode, false, aplic_m);
     }
 
+    if (kvm_irqchip_in_kernel()) {
+        kvm_riscv_aia_create(
+            aplic_s, msimode, socket,
+            VIRT_IRQCHIP_NUM_SOURCES,
+            hart_count,
+            memmap[VIRT_APLIC_S].base + socket * memmap[VIRT_APLIC_S].size,
+            memmap[VIRT_IMSIC_S].base + socket * VIRT_IMSIC_GROUP_MAX_SIZE);
+    }
+
     return kvm_enabled() ? aplic_s : aplic_m;
 }
 
-- 
2.17.1


