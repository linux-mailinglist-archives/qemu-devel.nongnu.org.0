Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 78AD56EC869
	for <lists+qemu-devel@lfdr.de>; Mon, 24 Apr 2023 11:08:45 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pqsB3-000751-Tz; Mon, 24 Apr 2023 05:08:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yongxuan.wang@sifive.com>)
 id 1pqsAi-0006mb-6z
 for qemu-devel@nongnu.org; Mon, 24 Apr 2023 05:07:44 -0400
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <yongxuan.wang@sifive.com>)
 id 1pqsAg-0001Ll-BM
 for qemu-devel@nongnu.org; Mon, 24 Apr 2023 05:07:43 -0400
Received: by mail-pl1-x634.google.com with SMTP id
 d9443c01a7336-1a6762fd23cso36796825ad.3
 for <qemu-devel@nongnu.org>; Mon, 24 Apr 2023 02:07:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sifive.com; s=google; t=1682327261; x=1684919261;
 h=references:in-reply-to:message-id:date:subject:cc:to:from:from:to
 :cc:subject:date:message-id:reply-to;
 bh=Fua0B/nbmKUJP9K04TOuYhl26KH1ZTyjvPcnsj/T2bE=;
 b=nN1yn7vtcS6I+YONZyIzuM3GtJ+qW/CuqcuBYf6Iops/SOssZCikqJy3pfgBIZ50vW
 JtzyqMiGxSud2nTGnUWY8vyvHJlXCudv9+h+uqIWAK3lz1cEwY98xwJ1qYN2FCB9o8Mh
 OeOZXYFenf/zEaSNqocoIJVTNcGUmOAhy92+NdxwZvvTltInjrdMMitu0e6jGI/RyCIT
 y2DwUg4O/xaZmje9KW7xBD/qyXrwZohnPmEtWR3gm+uhaXRkMwZ0iGKg60JffTwmnrGj
 NE24oSbZQwl60KG4Ic4BomGz142PpuayvBsyE+7HyhXuTrxA8CFjBvJPoLHdK+gaUs5V
 MU/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682327261; x=1684919261;
 h=references:in-reply-to:message-id:date:subject:cc:to:from
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Fua0B/nbmKUJP9K04TOuYhl26KH1ZTyjvPcnsj/T2bE=;
 b=Gj+sFH6BlmCYD1/PYnEUs+nUl+9KncWUHH1nR/VGNnv8N9yJ5Opq8hCheSLSLi5RT1
 TxOiSn7V63EA1nlvBolMkjXbcQne5/2gNJ2OUkhb0EHMhkV5C6fkNr75wVavLxzrgiZy
 MO6m6E8GAP9pOH3JLZq4S0ZIyArWJwwEnRpXTlhSjZmM/TMbKAfznnrAlQPM6UammP6A
 qF//TrtITj//HkNQVIMnxsEcWze9yg4zGB5imkyZ8gy/SO+ajVfkzQ/oZ06pSD1tmgxC
 Utw2S1nNFdrHfDvzqaQIaNWSn3+DSNWcujPm5ECjDKohSnSrpex82+chfJxeSdSIqun2
 PIxw==
X-Gm-Message-State: AAQBX9cTCDqe+h8xtrxwV5ZDohUXMXwrYwTOw75AqFpRoio6+fUGcwJ8
 YUQ0d7csT+dxcJgWti/+a78fQGqmuwpBKrmdZFrHTfcnjqz5yKI/KLWFvOCEp5hZdjDi+FzRQ/h
 tnh9Piy6laMKUouxpjtFQ/PQddgAl6a6l2sPMP0+AGUAhW7x7txBPJ7eA6+4sz5bVqN9UwzmfYp
 3sN+qf
X-Google-Smtp-Source: AKy350Y0kVgXK6MzgqOE+iENhZhpis8rzzeUu2s5kgPtN4XeCpSsdsoSS99vmnY0iNRjzTZaFcPT9Q==
X-Received: by 2002:a17:902:ec86:b0:1a9:5674:282e with SMTP id
 x6-20020a170902ec8600b001a95674282emr10310838plg.14.1682327260677; 
 Mon, 24 Apr 2023 02:07:40 -0700 (PDT)
Received: from hsinchu25.internal.sifive.com
 (59-124-168-89.hinet-ip.hinet.net. [59.124.168.89])
 by smtp.gmail.com with ESMTPSA id
 jf2-20020a170903268200b001a207906418sm6234820plb.23.2023.04.24.02.07.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 Apr 2023 02:07:40 -0700 (PDT)
From: Yong-Xuan Wang <yongxuan.wang@sifive.com>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: rkanwal@rivosinc.com, anup@brainfault.org, dbarboza@ventanamicro.com,
 atishp@atishpatra.org, vincent.chen@sifive.com, greentime.hu@sifive.com,
 frank.chang@sifive.com, Yong-Xuan Wang <yongxuan.wang@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>, Paolo Bonzini <pbonzini@redhat.com>,
 kvm@vger.kernel.org
Subject: [PATCH 3/6] target/riscv: check the in-kernel irqchip support
Date: Mon, 24 Apr 2023 09:07:05 +0000
Message-Id: <20230424090716.15674-4-yongxuan.wang@sifive.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20230424090716.15674-1-yongxuan.wang@sifive.com>
References: <20230424090716.15674-1-yongxuan.wang@sifive.com>
Received-SPF: pass client-ip=2607:f8b0:4864:20::634;
 envelope-from=yongxuan.wang@sifive.com; helo=mail-pl1-x634.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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

We check the in-kernel irqchip support when using KVM acceleration.

Signed-off-by: Yong-Xuan Wang <yongxuan.wang@sifive.com>
Reviewed-by: Jim Shu <jim.shu@sifive.com>
---
 target/riscv/kvm.c | 13 ++++++++++++-
 1 file changed, 12 insertions(+), 1 deletion(-)

diff --git a/target/riscv/kvm.c b/target/riscv/kvm.c
index 30f21453d6..6aad25bbc3 100644
--- a/target/riscv/kvm.c
+++ b/target/riscv/kvm.c
@@ -433,7 +433,18 @@ int kvm_arch_init(MachineState *ms, KVMState *s)
 
 int kvm_arch_irqchip_create(KVMState *s)
 {
-    return 0;
+    if (kvm_kernel_irqchip_split()) {
+        error_report("-machine kernel_irqchip=split is not supported "
+                     "on RISC-V.");
+        exit(1);
+    }
+
+    /*
+     * If we can create the VAIA using the newer device control API, we
+     * let the device do this when it initializes itself, otherwise we
+     * fall back to the old API
+     */
+    return kvm_check_extension(s, KVM_CAP_DEVICE_CTRL);
 }
 
 int kvm_arch_process_async_events(CPUState *cs)
-- 
2.17.1


