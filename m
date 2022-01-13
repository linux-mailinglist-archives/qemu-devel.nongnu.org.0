Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D72FE48DE74
	for <lists+qemu-devel@lfdr.de>; Thu, 13 Jan 2022 20:59:59 +0100 (CET)
Received: from localhost ([::1]:50596 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n86GM-0008IA-V2
	for lists+qemu-devel@lfdr.de; Thu, 13 Jan 2022 14:59:58 -0500
Received: from eggs.gnu.org ([209.51.188.92]:35910)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1n85oJ-0006kB-KA; Thu, 13 Jan 2022 14:30:59 -0500
Received: from [2607:f8b0:4864:20::235] (port=43915
 helo=mail-oi1-x235.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1n85oE-0005FA-5J; Thu, 13 Jan 2022 14:30:58 -0500
Received: by mail-oi1-x235.google.com with SMTP id s22so9122704oie.10;
 Thu, 13 Jan 2022 11:30:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=fn5MqNmLIwPUhXnNn/DmGCeAKsyLrzk+MGSJss6HHVg=;
 b=m7Hdx7Ahgqq0rtYBntd3rygqOG9c9H/pbhVXEM1spUIAO+ovJYiQeRJBxLF5hUM9ur
 Ln77NRUE2EhZerCE1eDvMVdXyulkoKx8Vv23dMHFDceAnayHLicWhfeyu/4R71uDqR3G
 y2RypR0ypTFMrg/wzsYrjr41i5AdRycd5dtCvdn3f+j+iyDWBUNtl2Z8wYxrJJf36Dno
 IDsP1JDrp+VlAqGMgdu2FniPCUmqI1n7Vw8m1WaLNChzqDEA/0ikLV0WnlcgmF7IDpj0
 RO2Z3jbKYiq55yWDs9Mih2IMRvg7egAQzdNt75Ym50zZD7xgWdtdkEpeQ5ZrfXeGLDLA
 pctg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=fn5MqNmLIwPUhXnNn/DmGCeAKsyLrzk+MGSJss6HHVg=;
 b=1b++meZUrom9wxPoFHPWk0bjhlQFJTpee71VfGLxCnnarRYF76Z1cq7ST5AX6J9fdb
 iy2ZAcQNrCVu4VBPZzpf9Z/Hr3IpVp0VPqH1US2LvXPugSaQs2+buSw8jyGK9rc1odXX
 Uj1LVQsi/s5Ys9MB25N/vrc90wXWodcjyrarE1sZFVl/rETm8ukoZqRxT4MrDw86jlzu
 ZDsOg6aW6HnIELcnoe1j57rCvR/PX8MihGEzmzTCvdwLqVdvoGQ8kmQtmCS3KdR0OFTJ
 ezD0/+T7G5WGOSRg7kvU1yt2FwPQLfJ4vC/jKfvf7UBeTAt2mW1OTwhT4EatlLVxyTGp
 VjhQ==
X-Gm-Message-State: AOAM531OAgc2tpAGpkRbL8owN/LU34w5ZpTH2abDsaexF9kepdOP+pob
 yYhji+bv+oL9L9jeR4Y1aDSjhaygbG/3eJta
X-Google-Smtp-Source: ABdhPJz7oj/wNBFLaJZeXGxLMMU43GqJTGhmcRnG7RCgSmfm0fd3Ey87hdFO72Oth/IS7npfPy2o4g==
X-Received: by 2002:a05:6808:14cc:: with SMTP id
 f12mr4200769oiw.154.1642102232455; 
 Thu, 13 Jan 2022 11:30:32 -0800 (PST)
Received: from rekt.COMFAST ([152.249.109.193])
 by smtp.gmail.com with ESMTPSA id 90sm743409otn.59.2022.01.13.11.30.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 13 Jan 2022 11:30:32 -0800 (PST)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 17/17] ppc/pnv: rename pnv_pec_stk_update_map()
Date: Thu, 13 Jan 2022 16:29:52 -0300
Message-Id: <20220113192952.911188-18-danielhb413@gmail.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20220113192952.911188-1-danielhb413@gmail.com>
References: <20220113192952.911188-1-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::235
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::235;
 envelope-from=danielhb413@gmail.com; helo=mail-oi1-x235.google.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Daniel Henrique Barboza <danielhb413@gmail.com>, qemu-ppc@nongnu.org,
 clg@kaod.org, david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This function does not use 'stack' anymore. Rename it to
pnv_pec_phb_update_map().

Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
---
 hw/pci-host/pnv_phb4.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/hw/pci-host/pnv_phb4.c b/hw/pci-host/pnv_phb4.c
index a9ec42ce2c..d27b62a50a 100644
--- a/hw/pci-host/pnv_phb4.c
+++ b/hw/pci-host/pnv_phb4.c
@@ -892,7 +892,7 @@ static void pnv_phb4_update_regions(PnvPHB4 *phb)
     pnv_phb4_check_all_mbt(phb);
 }
 
-static void pnv_pec_stk_update_map(PnvPHB4 *phb)
+static void pnv_pec_phb_update_map(PnvPHB4 *phb)
 {
     PnvPhb4PecState *pec = phb->pec;
     MemoryRegion *sysmem = get_system_memory();
@@ -1043,7 +1043,7 @@ static void pnv_pec_stk_nest_xscom_write(void *opaque, hwaddr addr,
         break;
     case PEC_NEST_STK_BAR_EN:
         phb->nest_regs[reg] = val & 0xf000000000000000ull;
-        pnv_pec_stk_update_map(phb);
+        pnv_pec_phb_update_map(phb);
         break;
     case PEC_NEST_STK_DATA_FRZ_TYPE:
     case PEC_NEST_STK_PBCQ_TUN_BAR:
-- 
2.33.1


