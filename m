Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B02AB6EC867
	for <lists+qemu-devel@lfdr.de>; Mon, 24 Apr 2023 11:08:40 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pqsAv-0006os-8U; Mon, 24 Apr 2023 05:07:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yongxuan.wang@sifive.com>)
 id 1pqsAb-0006du-Fw
 for qemu-devel@nongnu.org; Mon, 24 Apr 2023 05:07:39 -0400
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <yongxuan.wang@sifive.com>)
 id 1pqsAY-0001KW-FK
 for qemu-devel@nongnu.org; Mon, 24 Apr 2023 05:07:37 -0400
Received: by mail-pl1-x633.google.com with SMTP id
 d9443c01a7336-1a6862e47b1so47254085ad.0
 for <qemu-devel@nongnu.org>; Mon, 24 Apr 2023 02:07:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sifive.com; s=google; t=1682327252; x=1684919252;
 h=references:in-reply-to:message-id:date:subject:cc:to:from:from:to
 :cc:subject:date:message-id:reply-to;
 bh=5z/8lGR1AkQIcHq/8iqR9nQgXil5d7VQ8a2hbIgNp0E=;
 b=fDfm2ZTFk1o8gSk8alCzqUgJwDAVAv2wdNYqSiaJ+7votKR76jVnlbsXLQtgLx9EHn
 kzR7hYACAbNCXwemqwPWuUr6uCpHmTur+PiamI+wxb0ymmRzsESVmD7kRSpEK82zpiWD
 nIUcThnq+xeMOFt0QKX/KVdNbhVPMxXDl8FEJFmWMNuXR2ldmEBW+sWUkYGXBHoKBllj
 XfB1JH/aFTa0bAOQDC+z+IIvK7gjCUWCr+YZUO7ywf5sXoQC3zcFxBW5KpbavpvubAEc
 bBxqloGOoHupMMYC7ARkIgQIS4j7/aS20RLxh9eYXkEZXkPuZcJZF1zlOZFyWgAiI7qn
 yttg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682327252; x=1684919252;
 h=references:in-reply-to:message-id:date:subject:cc:to:from
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=5z/8lGR1AkQIcHq/8iqR9nQgXil5d7VQ8a2hbIgNp0E=;
 b=h6+H2QcYBiHf+EaejUimXe5wsDNHqRTCfycZxrwyrUtY0nrTMWeuZlSVcmDaJGJ0Ni
 5gQ7Im87fwI5tzShCWSQuG2OQN75n+FtRBpoPNX5SQlVxZFwgAUZkAm0khC+jS7Ertlk
 tApc07+ba48R0af2UjfbT7g3afm6n+XJFfja3RGVIg/3p8cKkmdML1yKNIg0CWsmvsSC
 IUKNbzd0xMnbFiHtk2Bi2vGiCQLBhdC6yzhTMlvaUlACOhUAR7sZHX+c3Ijy2fvEmt8U
 cvZDJxdZGT+FXRkiPsNtv0RCsSq/1H+U45RvQJya3XwYPupAgKVyfZWrRlkFTiXhUBY0
 822A==
X-Gm-Message-State: AAQBX9cpDuNL83CPUS4Ga06bUxOV8xbNGPme9PsAhSYyxKzIMQZaYNoN
 iljcz395hy0Fb7g3ILJU9ZthKy2bcGE0u+4jNa/GZNRQq+FNL/uIghfjdOivwoj8wwpXPV+i5BG
 tYbackFuHtzT3JKSRwtF0gOp/+VPtYlucHJ9H6S9rUBd9v3GgHubs8Z9yI3LZITjle5ztMj1ddg
 YPQHyd
X-Google-Smtp-Source: AKy350az9guWfDiaJa9jsO+Oh2dtSwmH48lLWeKBR5zQJpQdM0tMgNFkLexzfrSCyCLpKEk42BfStw==
X-Received: by 2002:a17:903:245:b0:1a5:f9b:27bd with SMTP id
 j5-20020a170903024500b001a50f9b27bdmr15188504plh.34.1682327252143; 
 Mon, 24 Apr 2023 02:07:32 -0700 (PDT)
Received: from hsinchu25.internal.sifive.com
 (59-124-168-89.hinet-ip.hinet.net. [59.124.168.89])
 by smtp.gmail.com with ESMTPSA id
 jf2-20020a170903268200b001a207906418sm6234820plb.23.2023.04.24.02.07.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 Apr 2023 02:07:31 -0700 (PDT)
From: Yong-Xuan Wang <yongxuan.wang@sifive.com>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: rkanwal@rivosinc.com, anup@brainfault.org, dbarboza@ventanamicro.com,
 atishp@atishpatra.org, vincent.chen@sifive.com, greentime.hu@sifive.com,
 frank.chang@sifive.com, Yong-Xuan Wang <yongxuan.wang@sifive.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Cornelia Huck <cohuck@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>, Thomas Huth <thuth@redhat.com>,
 Chenyi Qiang <chenyi.qiang@intel.com>,
 Alex Williamson <alex.williamson@redhat.com>, kvm@vger.kernel.org
Subject: [PATCH 1/6] update-linux-headers: sync-up header with Linux for KVM
 AIA support
Date: Mon, 24 Apr 2023 09:07:03 +0000
Message-Id: <20230424090716.15674-2-yongxuan.wang@sifive.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20230424090716.15674-1-yongxuan.wang@sifive.com>
References: <20230424090716.15674-1-yongxuan.wang@sifive.com>
Received-SPF: pass client-ip=2607:f8b0:4864:20::633;
 envelope-from=yongxuan.wang@sifive.com; helo=mail-pl1-x633.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01,
 UPPERCASE_50_75=0.008 autolearn=no autolearn_force=no
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

Sync-up Linux header to get latest KVM RISC-V headers having AIA support.

Signed-off-by: Yong-Xuan Wang <yongxuan.wang@sifive.com>
Reviewed-by: Jim Shu <jim.shu@sifive.com>
---
 linux-headers/linux/kvm.h |  2 ++
 target/riscv/kvm_riscv.h  | 33 +++++++++++++++++++++++++++++++++
 2 files changed, 35 insertions(+)

diff --git a/linux-headers/linux/kvm.h b/linux-headers/linux/kvm.h
index ebdafa576d..316732a617 100644
--- a/linux-headers/linux/kvm.h
+++ b/linux-headers/linux/kvm.h
@@ -1426,6 +1426,8 @@ enum kvm_device_type {
 #define KVM_DEV_TYPE_XIVE		KVM_DEV_TYPE_XIVE
 	KVM_DEV_TYPE_ARM_PV_TIME,
 #define KVM_DEV_TYPE_ARM_PV_TIME	KVM_DEV_TYPE_ARM_PV_TIME
+	KVM_DEV_TYPE_RISCV_AIA,
+#define KVM_DEV_TYPE_RISCV_AIA		KVM_DEV_TYPE_RISCV_AIA
 	KVM_DEV_TYPE_MAX,
 };
 
diff --git a/target/riscv/kvm_riscv.h b/target/riscv/kvm_riscv.h
index ed281bdce0..606968a4b7 100644
--- a/target/riscv/kvm_riscv.h
+++ b/target/riscv/kvm_riscv.h
@@ -22,4 +22,37 @@
 void kvm_riscv_reset_vcpu(RISCVCPU *cpu);
 void kvm_riscv_set_irq(RISCVCPU *cpu, int irq, int level);
 
+#define KVM_DEV_RISCV_AIA_GRP_CONFIG            0
+#define KVM_DEV_RISCV_AIA_CONFIG_MODE           0
+#define KVM_DEV_RISCV_AIA_CONFIG_IDS            1
+#define KVM_DEV_RISCV_AIA_CONFIG_SRCS           2
+#define KVM_DEV_RISCV_AIA_CONFIG_GROUP_BITS     3
+#define KVM_DEV_RISCV_AIA_CONFIG_GROUP_SHIFT    4
+#define KVM_DEV_RISCV_AIA_CONFIG_HART_BITS      5
+#define KVM_DEV_RISCV_AIA_CONFIG_GUEST_BITS     6
+#define KVM_DEV_RISCV_AIA_MODE_EMUL             0
+#define KVM_DEV_RISCV_AIA_MODE_HWACCEL          1
+#define KVM_DEV_RISCV_AIA_MODE_AUTO             2
+#define KVM_DEV_RISCV_AIA_IDS_MIN               63
+#define KVM_DEV_RISCV_AIA_IDS_MAX               2048
+#define KVM_DEV_RISCV_AIA_SRCS_MAX              1024
+#define KVM_DEV_RISCV_AIA_GROUP_BITS_MAX        8
+#define KVM_DEV_RISCV_AIA_GROUP_SHIFT_MIN       24
+#define KVM_DEV_RISCV_AIA_GROUP_SHIFT_MAX       56
+#define KVM_DEV_RISCV_AIA_HART_BITS_MAX         16
+#define KVM_DEV_RISCV_AIA_GUEST_BITS_MAX        8
+
+#define KVM_DEV_RISCV_AIA_GRP_ADDR              1
+#define KVM_DEV_RISCV_AIA_ADDR_APLIC            0
+#define KVM_DEV_RISCV_AIA_ADDR_IMSIC(__vcpu)    (1 + (__vcpu))
+#define KVM_DEV_RISCV_AIA_ADDR_MAX              \
+        (1 + KVM_DEV_RISCV_APLIC_MAX_HARTS)
+
+#define KVM_DEV_RISCV_AIA_GRP_CTRL              2
+#define KVM_DEV_RISCV_AIA_CTRL_INIT             0
+
+#define KVM_DEV_RISCV_AIA_GRP_APLIC             3
+
+#define KVM_DEV_RISCV_AIA_GRP_IMSIC             4
+
 #endif
-- 
2.17.1


