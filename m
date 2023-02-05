Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E599C68AF44
	for <lists+qemu-devel@lfdr.de>; Sun,  5 Feb 2023 11:09:27 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pObuC-0001bu-Ko; Sun, 05 Feb 2023 05:05:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1pObtk-00016R-Hx; Sun, 05 Feb 2023 05:05:34 -0500
Received: from mail-oi1-x235.google.com ([2607:f8b0:4864:20::235])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1pObti-0005Nm-IL; Sun, 05 Feb 2023 05:05:23 -0500
Received: by mail-oi1-x235.google.com with SMTP id s66so7609823oib.7;
 Sun, 05 Feb 2023 02:05:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=sxuS5pblADF2zAslUcqpRrTAA9fU7BxkRz9/gcJGFo4=;
 b=Gk2JKQI3UptqtYfxuzkkV/o9ps7PcQot9uqwz6saDKvVwtUpnnmzFgxY9kD6RPQDdJ
 YPZvGHQOw7ntesINPy+t1QoQLnY32QUsNsiV+XQp9aJyc3u7CaRDwtDy5OwSO+3VSAii
 vAn4DvpkQqm/wqP8zlbncwMSbek/uOKgh7SHzeH84I++4jUxv6vKhb9Mgyplf/stiAFs
 vW/TZk+FJ80eU/f3EnQqGWiRhhDzgUS0TzypCYdhzL9JU6eao+OCBvhhRRQi5TNd6ob3
 u/XalkN4ZWJsBLXUQ9nSlzrPsiSW2v+vCrTsv8z0ACaYZIqK4bG1fMTS6/HN6pDM0ANT
 8T8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=sxuS5pblADF2zAslUcqpRrTAA9fU7BxkRz9/gcJGFo4=;
 b=RnSb0YMgZ5T0MzKx4l+ZttBiHLXh6/7yIz1EEPAZTzgWT0oaZniN8L/Fq5wGv5r+P7
 UReJp1sWQtuvylWakv93MYzQWIviR/bi8csKKMYO2dYt4GcMaig8gTzWsM5B/aCOZyBv
 5zC8x78XksIpbGF/uFxYUAwws8Xv1uiQfqEuJ5dzK9cipgh2oDR68/y5gtAGsf8kuqUr
 lqei6vt98f838ClRTZA8NfJoCnhtb1Fog1uRfsacA/t+n4afXYjRavHM/chNk40+9h+q
 zsnEERDygdd7Pz/SGmCvV7tVdfAoUzvmaORxee1M7thNvtJhU+IdYgJmC4nqcT4BSQU+
 uCtQ==
X-Gm-Message-State: AO0yUKXbF+zqcFflPR0/zq5CC5uBAUj+0nOtyXNoGoUJXrJ0hI1mw/r5
 Mtd826WqmndrzCmWZz/7L4MTVf02EFs=
X-Google-Smtp-Source: AK7set8b4kx1RGRIFZAtOffIsuEBf26vAmTi3HfV2de0xau+gZZXSS5SmpgxW2XgNMQ/BV3kO7X2zw==
X-Received: by 2002:a05:6808:1307:b0:378:84aa:1c20 with SMTP id
 y7-20020a056808130700b0037884aa1c20mr10348154oiv.45.1675591520011; 
 Sun, 05 Feb 2023 02:05:20 -0800 (PST)
Received: from grind.. ([191.19.125.138]) by smtp.gmail.com with ESMTPSA id
 s191-20020acaa9c8000000b003631fe1810dsm2730924oie.47.2023.02.05.02.05.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 05 Feb 2023 02:05:19 -0800 (PST)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, danielhb413@gmail.com, peter.maydell@linaro.org,
 Frederic Barrat <fbarrat@linux.ibm.com>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Subject: [PULL 12/16] ppc/pnv/pci: Fix PHB xscom registers memory region name
Date: Sun,  5 Feb 2023 07:04:45 -0300
Message-Id: <20230205100449.2352781-13-danielhb413@gmail.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230205100449.2352781-1-danielhb413@gmail.com>
References: <20230205100449.2352781-1-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::235;
 envelope-from=danielhb413@gmail.com; helo=mail-oi1-x235.google.com
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

From: Frederic Barrat <fbarrat@linux.ibm.com>

The name is for the region mapping the PHB xscom registers. It was
apparently a bad cut-and-paste from the per-stack pci xscom area just
above, so we had two regions with the same name.

Signed-off-by: Frederic Barrat <fbarrat@linux.ibm.com>
Reviewed-by: Cédric Le Goater <clg@kaod.org>
Message-Id: <20230127122848.550083-5-fbarrat@linux.ibm.com>
Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
---
 hw/pci-host/pnv_phb4.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/pci-host/pnv_phb4.c b/hw/pci-host/pnv_phb4.c
index ccbde841fc..542f9e2932 100644
--- a/hw/pci-host/pnv_phb4.c
+++ b/hw/pci-host/pnv_phb4.c
@@ -1497,7 +1497,7 @@ static void pnv_phb4_xscom_realize(PnvPHB4 *phb)
                           PHB4_PEC_PCI_STK_REGS_COUNT);
 
     /* PHB pass-through */
-    snprintf(name, sizeof(name), "xscom-pec-%d.%d-pci-phb-%d",
+    snprintf(name, sizeof(name), "xscom-pec-%d.%d-phb-%d",
              pec->chip_id, pec->index, stack_no);
     pnv_xscom_region_init(&phb->phb_regs_mr, OBJECT(phb),
                           &pnv_phb4_xscom_ops, phb, name, 0x40);
-- 
2.39.1


