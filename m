Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6763B48EFD4
	for <lists+qemu-devel@lfdr.de>; Fri, 14 Jan 2022 19:23:03 +0100 (CET)
Received: from localhost ([::1]:34032 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n8RE6-0000WA-A1
	for lists+qemu-devel@lfdr.de; Fri, 14 Jan 2022 13:23:02 -0500
Received: from eggs.gnu.org ([209.51.188.92]:50128)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1n8QzM-00063D-8Q; Fri, 14 Jan 2022 13:07:48 -0500
Received: from [2607:f8b0:4864:20::233] (port=35751
 helo=mail-oi1-x233.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1n8QzK-0000QH-JL; Fri, 14 Jan 2022 13:07:47 -0500
Received: by mail-oi1-x233.google.com with SMTP id s127so13270754oig.2;
 Fri, 14 Jan 2022 10:07:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=X5e0WNYOkSb9/7sSS76exmWPGRyaYulA3prv/bx4WpM=;
 b=Hcr2CV/6GAxvPNkAFwyKf16t7SIgQP7v/jH5SONh23X3SS9/RNK1g4xpAFu/f4yCpo
 jps/oI+7Khg+1Iv976Qjb9x35sDaWcJvz+0HtPxc98ORG+AoTo2x4aHhVDQ8xyosLuBy
 vVb715LugvFhI/M/25996CfzFux3lZqPZ7+ElS6eFaXlf3EPolzkGkoRNhzjUHNidYg7
 psNanoz9O4VTDZ7Sb2p30/yE9YRJ0SnS+g40+UT2/l1D3VmsBDkaySkncmG2Hty0BDEw
 CMDFOwmfOP5Cc+76Va1n2ll3DyVzIUx6NRE04eOrc9ONpRnfwD4voL0HiJ4/QyRZemIB
 Gqgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=X5e0WNYOkSb9/7sSS76exmWPGRyaYulA3prv/bx4WpM=;
 b=CwZbnEmL6/a+Vt0Ej5uZwO0YXDmvRienpRbj0Xbk16jJA9Bx60j/OxNwqXMNktIHAZ
 vW+WfFR7EWXQzvO8gFGrUuIWMNCuOjZKO27d4/dNmmlJpyDx5gevlilWWFRkZhAjTMja
 ioY/WSTXroZ2fZiKpGNIgqtxNZDqwlZ69AZk5QwO+xu834Np8e2vFM0EEvhIfhXNPdXm
 JYPBuDOVubk1gFY6hEv8P/Sqb7BX+Z5BL/EUHY/o2MdtNt01mtivDUEZpKGrfQNPl+XS
 hi0EmxmnEsJ/JckCy8EzDfIhW2eRW1SW+Lbj4NU+o0SDIXitkBfzVZZclxSjs5S6yoQo
 WRiQ==
X-Gm-Message-State: AOAM531KGIcB83ijjZJW+DOHDyA3rukUC2FYP4E0bvLm4B3QwIv3JHny
 U8rh8y9m141s2U2A5Idgu2SYxYiNAv1TPvvO
X-Google-Smtp-Source: ABdhPJxBj8IvwZvp0Qi20xhdlSF8vdamoPLlsc56xJKbsfiI9yjmVJRxX/tC5h6oyxrD7tfPnU0mgA==
X-Received: by 2002:aca:702:: with SMTP id 2mr8456627oih.44.1642183665206;
 Fri, 14 Jan 2022 10:07:45 -0800 (PST)
Received: from rekt.COMFAST ([152.249.109.193])
 by smtp.gmail.com with ESMTPSA id e17sm1353584otr.13.2022.01.14.10.07.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 14 Jan 2022 10:07:44 -0800 (PST)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 8/8] ppc/pnv: rename pnv_pec_stk_update_map()
Date: Fri, 14 Jan 2022 15:07:19 -0300
Message-Id: <20220114180719.52117-9-danielhb413@gmail.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20220114180719.52117-1-danielhb413@gmail.com>
References: <20220114180719.52117-1-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::233
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::233;
 envelope-from=danielhb413@gmail.com; helo=mail-oi1-x233.google.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, PDS_HP_HELO_NORDNS=0.001,
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

Reviewed-by: Cédric Le Goater <clg@kaod.org>
Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
---
 hw/pci-host/pnv_phb4.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/hw/pci-host/pnv_phb4.c b/hw/pci-host/pnv_phb4.c
index 3dc3c70cb2..1db815b1ab 100644
--- a/hw/pci-host/pnv_phb4.c
+++ b/hw/pci-host/pnv_phb4.c
@@ -914,7 +914,7 @@ static void pnv_phb4_update_regions(PnvPHB4 *phb)
     pnv_phb4_check_all_mbt(phb);
 }
 
-static void pnv_pec_stk_update_map(PnvPHB4 *phb)
+static void pnv_pec_phb_update_map(PnvPHB4 *phb)
 {
     PnvPhb4PecState *pec = phb->pec;
     MemoryRegion *sysmem = get_system_memory();
@@ -1066,7 +1066,7 @@ static void pnv_pec_stk_nest_xscom_write(void *opaque, hwaddr addr,
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


