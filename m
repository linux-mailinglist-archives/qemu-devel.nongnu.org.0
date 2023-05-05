Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 565746F8234
	for <lists+qemu-devel@lfdr.de>; Fri,  5 May 2023 13:42:41 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1putpZ-0006Db-7g; Fri, 05 May 2023 07:42:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yongxuan.wang@sifive.com>)
 id 1putp7-0005rd-BY
 for qemu-devel@nongnu.org; Fri, 05 May 2023 07:42:09 -0400
Received: from mail-pf1-x436.google.com ([2607:f8b0:4864:20::436])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <yongxuan.wang@sifive.com>)
 id 1putp5-00025Q-Te
 for qemu-devel@nongnu.org; Fri, 05 May 2023 07:42:05 -0400
Received: by mail-pf1-x436.google.com with SMTP id
 d2e1a72fcca58-64359d9c531so1287414b3a.3
 for <qemu-devel@nongnu.org>; Fri, 05 May 2023 04:42:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sifive.com; s=google; t=1683286921; x=1685878921;
 h=references:in-reply-to:message-id:date:subject:cc:to:from:from:to
 :cc:subject:date:message-id:reply-to;
 bh=HxsCvQwxLEcQi94CUGp/cWnGbPEwoOLvSmcwHfkynGY=;
 b=IeDtkLLoRQXFErlkQbokYeV57nHVz7f4/ceq6ACz3V0i6PZaC4Ly0FVElhA1eevjc/
 Pnl8d/hNaozMdNN99EfbyU37fEApZVCV2/Z2Snvr18hvJUzjtV9c8E7PyDpNZWb22isF
 vrIkh1eAJxtTej8l1V5VepliyN6/amU7UTSQBQaROk5UaDVkx/cKpz2wOo2oLGQ0Xl9n
 Yr7YIwl23AqnYcP5jBj8NkbpuzpdVoMGiUzvlusrsQZXVQmmBmUxFmcP+cjJapXHGqC+
 cKfMjdMcejWX6fiZCvd/5FTBkBMj/t1mYyP4q8yND5L875jL5kAqBdDwdXa351PhpvxL
 ZggQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683286921; x=1685878921;
 h=references:in-reply-to:message-id:date:subject:cc:to:from
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=HxsCvQwxLEcQi94CUGp/cWnGbPEwoOLvSmcwHfkynGY=;
 b=CFWw4G81mDbaxXRsYjNTrl3/3iK8WfnmPy+qC/2/wcpltEtY/yMYmdfZy0FlMBNND1
 Do1q4fNQL8VXAxtwAHW6TsHdJpOaGVyWHsTEUDkfEVLbEOcnZ9ZtqOPED/XrmUx9y36X
 8NWPnzKGDyWpPP998V49tDXFSiWzKUSVAe0z1IFWj26hm20tNLSlkzFO+uS7Nr/6C/ia
 zlLxshdGAsijvSKIk14JnRrzxOkaDw8qcFFFRYkdbrrS02OSIwH8F1X2S3nVgucwmkgT
 yN88QEongUmzWhVxFgHRvPNQiwGpoEyoyRvzlKyLM+cZOPEi3a2GXOaKgmnqh2ENtrH8
 POeg==
X-Gm-Message-State: AC+VfDx2DrkPbALQ0D+iWwPVctfCqUCYCJZRGuWPAuBiVUlHZG1VGWjo
 XW1s6PmIatBaFb0kmLIzddbM0tI4th/wVemaBz7wuVw7K2M3LXG3++7VY6fDx6pw+4IxFEyw5+W
 hst3oK0jLR0ScG76OHbJtjy6ZLjOc7lw0eN7GeRktILUSaiMOeCOa8o1KVP1D8qcVBsAGmad1lx
 /H+Gin
X-Google-Smtp-Source: ACHHUZ6AD9Db6LzAuU089hNnkT8NC1XE46GFr3HOiRnRGq0Z/6Z2yVy04WBYT/TuKkVAUkqpsb/lZA==
X-Received: by 2002:a05:6a00:2442:b0:63b:854e:8459 with SMTP id
 d2-20020a056a00244200b0063b854e8459mr1826888pfj.31.1683286921609; 
 Fri, 05 May 2023 04:42:01 -0700 (PDT)
Received: from hsinchu25.internal.sifive.com
 (59-124-168-89.hinet-ip.hinet.net. [59.124.168.89])
 by smtp.gmail.com with ESMTPSA id
 y17-20020aa78051000000b0062d859a33d1sm1448171pfm.84.2023.05.05.04.41.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 05 May 2023 04:42:00 -0700 (PDT)
From: Yong-Xuan Wang <yongxuan.wang@sifive.com>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: rkanwal@rivosinc.com, anup@brainfault.org, dbarboza@ventanamicro.com,
 atishp@atishpatra.org, vincent.chen@sifive.com, greentime.hu@sifive.com,
 frank.chang@sifive.com, jim.shu@sifive.com,
 Yong-Xuan Wang <yongxuan.wang@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>, Weiwei Li <liweiwei@iscas.ac.cn>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>
Subject: [PTACH v2 6/6] target/riscv: select KVM AIA in riscv virt machine
Date: Fri,  5 May 2023 11:39:41 +0000
Message-Id: <20230505113946.23433-7-yongxuan.wang@sifive.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20230505113946.23433-1-yongxuan.wang@sifive.com>
References: <20230505113946.23433-1-yongxuan.wang@sifive.com>
Received-SPF: pass client-ip=2607:f8b0:4864:20::436;
 envelope-from=yongxuan.wang@sifive.com; helo=mail-pf1-x436.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
index 396025b5a5..9fad01a5ab 100644
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
@@ -1216,6 +1217,15 @@ static DeviceState *virt_create_aia(RISCVVirtAIAType aia_type, int aia_guests,
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


