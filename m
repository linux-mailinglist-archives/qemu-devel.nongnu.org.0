Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 13E82493DAE
	for <lists+qemu-devel@lfdr.de>; Wed, 19 Jan 2022 16:51:38 +0100 (CET)
Received: from localhost ([::1]:57938 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nADFG-00082w-T3
	for lists+qemu-devel@lfdr.de; Wed, 19 Jan 2022 10:51:34 -0500
Received: from eggs.gnu.org ([209.51.188.92]:41022)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <anup@brainfault.org>)
 id 1nACsQ-0007ke-Ay
 for qemu-devel@nongnu.org; Wed, 19 Jan 2022 10:27:58 -0500
Received: from [2607:f8b0:4864:20::62b] (port=38739
 helo=mail-pl1-x62b.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <anup@brainfault.org>)
 id 1nACsB-0000Xv-4e
 for qemu-devel@nongnu.org; Wed, 19 Jan 2022 10:27:44 -0500
Received: by mail-pl1-x62b.google.com with SMTP id c3so2531116pls.5
 for <qemu-devel@nongnu.org>; Wed, 19 Jan 2022 07:27:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=brainfault-org.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=pp8R2yp0LwUIqj1uG0Z00NdjUepf/4Fv+MsY1tChXMw=;
 b=nLIqIkqzo5fpP++7FDtyk5l3W3biChCnqBC7vflPVqf4L+7RwkCVVai/kmZ/syKgzk
 gZH90FU5JVzCGsqxe3B6zhLa4aRO7Qi0A9T12sno+xh3omo91WgHEU/+hM9zNMLP6iyY
 JxEpeDh/HREdz2mHhVEWH8twT4fyXdPGBlrKFaCotqzPLzpi7BxWuMyC2nlDZpFhKkTA
 FMQ2JMn94eSPuOHlVAjPf1wOcaW4AaMf6OjDm+s3BEkUof6R9xBELjsS34oKoAp31Ykn
 QlOlw7qS5eEaF7XFAgISawxXy1/nl/3vqV+WDnv0L//4+QZWFHDDyHcbRlYu3lQPTOfN
 Zbow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=pp8R2yp0LwUIqj1uG0Z00NdjUepf/4Fv+MsY1tChXMw=;
 b=mx6uancGuW05jk7xOagj2G/3V5jkDDditnbSID7RPQ4cyL7WdUDNxJ3Y5c2EEV99mL
 y9Haf26pCnCdanFy2ed4C8ABt+sQyVBT+HuvDI+ysV+iiYSa3NMmCB8jEb82AK3uWn9I
 tVoiYg9l4ZyY0BFIR564+IBFOMKMuuIXSuPsf1sLM99UH8g3y0OLX4B8adoPpyeB6CZt
 TYToGRq3aCA9NCmtRqpV3x/9cU9E0icbh4uLdD9cvo3mkFvQD9gBBuaxvd6Vt122u59A
 JDC0SvQu/5y8T8ypuSZRVMC9dZYWyaPbX3QMn0lKym52xto1nL7uhTxJ7pyc2oVRyhQz
 bSHA==
X-Gm-Message-State: AOAM532cKDGFF2V/YUI+Hd2jPaKj/pH3SGNDb6DvuiIcM57b+alGHrs+
 JA3ywUMDoxP1WTZVMTGD6nnoFw==
X-Google-Smtp-Source: ABdhPJyLcCxMd1eLh/wZuZ8QlKuTpeMOpSTwFXCbH2LGOLLnrzQAgXFbO0HPa6cPsg6EEOD9uAmodw==
X-Received: by 2002:a17:90b:1e43:: with SMTP id
 pi3mr4818322pjb.223.1642606061091; 
 Wed, 19 Jan 2022 07:27:41 -0800 (PST)
Received: from localhost.localdomain ([122.179.40.245])
 by smtp.gmail.com with ESMTPSA id 187sm26791pfv.157.2022.01.19.07.27.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 19 Jan 2022 07:27:40 -0800 (PST)
From: Anup Patel <anup@brainfault.org>
To: Peter Maydell <peter.maydell@linaro.org>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>
Subject: [PATCH v8 16/23] hw/riscv: virt: Use AIA INTC compatible string when
 available
Date: Wed, 19 Jan 2022 20:56:07 +0530
Message-Id: <20220119152614.27548-17-anup@brainfault.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220119152614.27548-1-anup@brainfault.org>
References: <20220119152614.27548-1-anup@brainfault.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::62b
 (failed)
Received-SPF: none client-ip=2607:f8b0:4864:20::62b;
 envelope-from=anup@brainfault.org; helo=mail-pl1-x62b.google.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=no autolearn_force=no
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
Cc: qemu-riscv@nongnu.org, Frank Chang <frank.chang@sifive.com>,
 Anup Patel <anup@brainfault.org>, qemu-devel@nongnu.org,
 Alistair Francis <alistair.francis@wdc.com>,
 Atish Patra <atishp@atishpatra.org>, Bin Meng <bmeng.cn@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Anup Patel <anup.patel@wdc.com>

We should use the AIA INTC compatible string in the CPU INTC
DT nodes when the CPUs support AIA feature. This will allow
Linux INTC driver to use AIA local interrupt CSRs.

Signed-off-by: Anup Patel <anup.patel@wdc.com>
Signed-off-by: Anup Patel <anup@brainfault.org>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Reviewed-by: Frank Chang <frank.chang@sifive.com>
---
 hw/riscv/virt.c | 13 +++++++++++--
 1 file changed, 11 insertions(+), 2 deletions(-)

diff --git a/hw/riscv/virt.c b/hw/riscv/virt.c
index 2643c8bc37..e3068d6126 100644
--- a/hw/riscv/virt.c
+++ b/hw/riscv/virt.c
@@ -212,8 +212,17 @@ static void create_fdt_socket_cpus(RISCVVirtState *s, int socket,
         qemu_fdt_add_subnode(mc->fdt, intc_name);
         qemu_fdt_setprop_cell(mc->fdt, intc_name, "phandle",
             intc_phandles[cpu]);
-        qemu_fdt_setprop_string(mc->fdt, intc_name, "compatible",
-            "riscv,cpu-intc");
+        if (riscv_feature(&s->soc[socket].harts[cpu].env,
+                          RISCV_FEATURE_AIA)) {
+            static const char * const compat[2] = {
+                "riscv,cpu-intc-aia", "riscv,cpu-intc"
+            };
+            qemu_fdt_setprop_string_array(mc->fdt, intc_name, "compatible",
+                                      (char **)&compat, ARRAY_SIZE(compat));
+        } else {
+            qemu_fdt_setprop_string(mc->fdt, intc_name, "compatible",
+                "riscv,cpu-intc");
+        }
         qemu_fdt_setprop(mc->fdt, intc_name, "interrupt-controller", NULL, 0);
         qemu_fdt_setprop_cell(mc->fdt, intc_name, "#interrupt-cells", 1);
 
-- 
2.25.1


