Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BA2C3485AD3
	for <lists+qemu-devel@lfdr.de>; Wed,  5 Jan 2022 22:39:09 +0100 (CET)
Received: from localhost ([::1]:33710 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n5Dzw-00042z-TG
	for lists+qemu-devel@lfdr.de; Wed, 05 Jan 2022 16:39:08 -0500
Received: from eggs.gnu.org ([209.51.188.92]:33100)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1n5DlX-00025N-CS; Wed, 05 Jan 2022 16:24:15 -0500
Received: from [2607:f8b0:4864:20::92d] (port=45734
 helo=mail-ua1-x92d.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1n5DlV-0007tw-SP; Wed, 05 Jan 2022 16:24:15 -0500
Received: by mail-ua1-x92d.google.com with SMTP id az37so782596uab.12;
 Wed, 05 Jan 2022 13:24:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=EYnmCaBTvAMlaO3DMWNIeW4hMBbiDALzaKhpCpUGP1w=;
 b=Hes9kL78o4wDn1G6N3Zw0Y5kIZIE9+nC90VqooUBHkHigs1A/96iZ8JEvgtVNGBpcT
 GOxLj+fy/vnaFu73gbiFH4xy1+UEMtEbPC8QEUdKtnCrt6IrY4XbzOqjbasgATokc3nR
 rRFBCNVoAiepsQdbvS8X4Lbfxl12nndn/qE/A9gPCevLGltuVG7QtlGi/shPz2y+BXgv
 hOZfLhUkprtwXUTPE91x8Bq96AqXf9AlFEr1HixMxB+xGhO6/Vkxc6CXDZXIhP5RFgJw
 iEMpoQ+mt5e7LNIOgRRk1hCfTr4GVAa/u3uCqiplZfWEi/ssXq+Nzrq3aQi/KZlOuSVa
 +B0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=EYnmCaBTvAMlaO3DMWNIeW4hMBbiDALzaKhpCpUGP1w=;
 b=uAQ+UEdqSBg2fD+XzR+Y/p0OmAydwrv4xCpwXhQqwtOA3aFtAJEan6bTOUoRtaZ2ZI
 /JcoUZxMhitglWC4vH5Rle+PQmvYX8OVKKF2zT9JJ6WUjA4YHRDOw2bjgrGtrPG4vbB1
 Irq9vH1dqICI8R9aLsWvVznXFO2+U4ZRk5Q+w+1lvZrv4b5TVZhblHbEG21Zof2Fpqi0
 QcM6sCqOthr7OAWm3Zyf6co1p4WIND22FS9F3HKfv2iqZJC3HrfBbDhQ4VY6qskBb3An
 RjY8vdZbyb00NsrQDvujE+RgwHlXXiTZKIqqJsDNGg//oNN3HHslwsZHlJkpVUo736Nh
 hBZA==
X-Gm-Message-State: AOAM531ccpGXDjdOoSJW4k43H4Bg53fkf9tpv3TvcQa143iFk2oX0U7H
 BKQxJ9i0dylKsqfQcE08uEKbovdMwC4=
X-Google-Smtp-Source: ABdhPJzUrSFZYHaklYQSi7Z/AKDSyzv2zmhOcChqyM4y/wSBbS9bhaUA4R3TGbH94wAUZHbIRT+Nbg==
X-Received: by 2002:a05:6102:3754:: with SMTP id
 u20mr5424598vst.61.1641417852615; 
 Wed, 05 Jan 2022 13:24:12 -0800 (PST)
Received: from rekt.ibmuc.com ([2804:431:c7c7:f4d8:aa07:335f:99e0:a6e7])
 by smtp.gmail.com with ESMTPSA id m5sm65922vke.43.2022.01.05.13.24.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 05 Jan 2022 13:24:12 -0800 (PST)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 10/18] pnv_phb3.h: change TYPE_PNV_PHB3_ROOT_BUS name
Date: Wed,  5 Jan 2022 18:23:30 -0300
Message-Id: <20220105212338.49899-11-danielhb413@gmail.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20220105212338.49899-1-danielhb413@gmail.com>
References: <20220105212338.49899-1-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::92d
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::92d;
 envelope-from=danielhb413@gmail.com; helo=mail-ua1-x92d.google.com
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
Cc: danielhb413@gmail.com, qemu-ppc@nongnu.org, clg@kaod.org,
 david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The TYPE_PNV_PHB3_ROOT_BUS name is used as the default bus name when
the dev has no 'id'. However, pnv-phb3-root-bus is a bit too long to be
used as a bus name.

Most common QEMU buses and PCI controllers are named based on their bus
type (e.g. pSeries spapr-pci-host-bridge is called 'pci'). The most
common name for a PCIE bus controller in QEMU is 'pcie'. Naming it
'pcie' would break the documented use of the pnv-phb3 device, since
'pcie.0' would now refer to the root bus instead of the first root port.

There's nothing particularly wrong with the 'root-bus' name used before,
aside from the fact that 'root-bus' is being used for pnv-phb3 and
pnv-phb4 created buses, which is not quite correct since these buses
aren't implemented the same way in QEMU - you can't plug a
pnv-phb4-root-port into a pnv-phb3 root bus, for example.

This patch renames it as 'pnv-phb3-root', which is a compromise between
the existing and the previously used name. Creating 3 phbs without ID
will result in an "info qtree" output similar to this:

bus: main-system-bus
  type System
  dev: pnv-phb3, id ""
    index = 2 (0x2)
    chip-id = 0 (0x0)
    x-config-reg-migration-enabled = true
    bypass-iommu = false
    bus: pnv-phb3-root.2
      type pnv-phb3-root
(...)
  dev: pnv-phb3, id ""
    index = 1 (0x1)
    chip-id = 0 (0x0)
    x-config-reg-migration-enabled = true
    bypass-iommu = false
    bus: pnv-phb3-root.1
      type pnv-phb3-root
(...)
  dev: pnv-phb3, id ""
    index = 0 (0x0)
    chip-id = 0 (0x0)
    x-config-reg-migration-enabled = true
    bypass-iommu = false
    bus: pnv-phb3-root.0
      type pnv-phb3-root

Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
---
 include/hw/pci-host/pnv_phb3.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/hw/pci-host/pnv_phb3.h b/include/hw/pci-host/pnv_phb3.h
index 2e423c3890..af6ec83cf6 100644
--- a/include/hw/pci-host/pnv_phb3.h
+++ b/include/hw/pci-host/pnv_phb3.h
@@ -105,7 +105,7 @@ struct PnvPBCQState {
 /*
  * PHB3 PCIe Root port
  */
-#define TYPE_PNV_PHB3_ROOT_BUS "pnv-phb3-root-bus"
+#define TYPE_PNV_PHB3_ROOT_BUS "pnv-phb3-root"
 
 #define TYPE_PNV_PHB3_ROOT_PORT "pnv-phb3-root-port"
 
-- 
2.33.1


