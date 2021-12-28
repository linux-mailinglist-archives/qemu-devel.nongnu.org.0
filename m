Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 21017480CDF
	for <lists+qemu-devel@lfdr.de>; Tue, 28 Dec 2021 20:52:31 +0100 (CET)
Received: from localhost ([::1]:57182 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n2IWM-0003bw-8q
	for lists+qemu-devel@lfdr.de; Tue, 28 Dec 2021 14:52:30 -0500
Received: from eggs.gnu.org ([209.51.188.92]:48714)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1n2IJk-0003yf-Dg; Tue, 28 Dec 2021 14:39:28 -0500
Received: from [2607:f8b0:4864:20::732] (port=34349
 helo=mail-qk1-x732.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1n2IJT-00047b-ET; Tue, 28 Dec 2021 14:39:17 -0500
Received: by mail-qk1-x732.google.com with SMTP id b85so18061030qkc.1;
 Tue, 28 Dec 2021 11:38:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=2XiWEBDF142LHMVr3kJNFRGx9OjiLnQOHdejwQhKny8=;
 b=m9g8B3UI72qSVdHYMjUGwj19zxo2UPV9yB8e5CT/D4zejfgzozDgvkEQI7KVw2enz1
 5WbXX6yPHVqGRYGba31vkBfcNN5EXJ3uDQ74kdNpXi9m8tTIuEomRQRkSJ0FUrd4rXSA
 7nfneZV/F29uEho/iUR4SD6Y7lEHvKZvQWkbe82xGMn6FfftQ6ksnLCkGk31NwZryLFk
 jQmbXAUdKougMsLjslAPcHnSzbe+uukhXEff6pxvGeeVhfdEiahXeRaaCETnsm2XQyWt
 LcdVBOMKgZ2npn8RdamZFsLpuLCPoq2kHBMecENON+kpBjJKMFV+PmG594udBwkrfpDJ
 zZow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=2XiWEBDF142LHMVr3kJNFRGx9OjiLnQOHdejwQhKny8=;
 b=T3gJ4eeGXiS2J7DUyOs2g6CASVnGgsb808Nt24bX2gyeAqUZUC4h/HMyF4pX0qwLiv
 3oftSyUtIPxwIKz1Bl90Rcu8jJIDiggDmAJ9Ci0z+VOaQqK05mQxYohJARgmQb8a8J94
 Dq9d1ItDBRkIOY2KGjXK4NHyo2GsVXizXWKbCSUVX8TTjEVnbTxqzuJ4rnTzAE20IsMC
 1wUvGAeVwk1+nIm63IvxbAuW8/QYbSgEK1kwHLeGynM/kbpyXYsvgpH0sJrJvw/etc+/
 HRLo1Dg42NAp1qW2e2SMADKtt7CBFBghZlyiAK/DZVFvb3sC4p5jpPFbOXbsoqjUFrq1
 wtNg==
X-Gm-Message-State: AOAM532iLBB72NQQ4i4AgCPf95ZlQQ7IxDUBXdMNmYIboVf2Uj/+fCAy
 y5qUhPNmLRgUL4YBfr0suPczAAKLp/s=
X-Google-Smtp-Source: ABdhPJxS3KRIbEK6lFBodBzjAVORQ2iwj802LdSLcfal285AZDgiq0/U0RfsXEPuXk3E2EvyQxC43A==
X-Received: by 2002:a05:620a:1249:: with SMTP id
 a9mr15531412qkl.76.1640720330645; 
 Tue, 28 Dec 2021 11:38:50 -0800 (PST)
Received: from rekt.ibmuc.com ([2804:431:c7c6:7ce4:b718:2cc0:32df:97ee])
 by smtp.gmail.com with ESMTPSA id r20sm16924059qkp.21.2021.12.28.11.38.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Dec 2021 11:38:50 -0800 (PST)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 17/17] pnv_phb4.c: change TYPE_PNV_PHB4_ROOT_BUS name
Date: Tue, 28 Dec 2021 16:38:06 -0300
Message-Id: <20211228193806.1198496-18-danielhb413@gmail.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211228193806.1198496-1-danielhb413@gmail.com>
References: <20211228193806.1198496-1-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::732
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::732;
 envelope-from=danielhb413@gmail.com; helo=mail-qk1-x732.google.com
X-Spam_score_int: 8
X-Spam_score: 0.8
X-Spam_bar: /
X-Spam_report: (0.8 / 5.0 requ) DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_ENVFROM_END_DIGIT=0.25,
 FREEMAIL_FROM=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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

Similar to what was happening with pnv-phb3 buses,
TYPE_PNV_PHB4_ROOT_BUS set to "pnv-phb4-root-bus" is a bit too long for
a default root bus name. The usual default name for theses buses in QEMU
are 'pcie', but we want to make a distinction between pnv-phb4 buses and
other PCIE buses, at least as far as default name goes, because not all
PCIE devices are attachable to a pnv-phb4 root-bus type.

Changing the default to 'phb4-root' allow us to have a shorter name
while making this bus distinct, and the user can always set its own bus
naming via the "id" attribute anyway.

This is the 'info qtree' output after this change, using a powernv9
domain with 2 sockets and default settings enabled:

qemu-system-ppc64 -m 4G -machine powernv9,accel=tcg \
     -smp 2,sockets=2,cores=1,threads=1

  dev: pnv-phb4, id ""
    index = 5 (0x5)
    chip-id = 1 (0x1)
    version = 704374636546 (0xa400000002)
    device-id = 1217 (0x4c1)
    x-config-reg-migration-enabled = true
    bypass-iommu = false
    bus: phb4-root.11
      type phb4-root
      dev: pnv-phb4-root-port, id ""
(...)
  dev: pnv-phb4, id ""
    index = 0 (0x0)
    chip-id = 1 (0x1)
    version = 704374636546 (0xa400000002)
    device-id = 1217 (0x4c1)
    x-config-reg-migration-enabled = true
    bypass-iommu = false
    bus: phb4-root.6
      type phb4-root
      dev: pnv-phb4-root-port, id ""
(..)
  dev: pnv-phb4, id ""
    index = 5 (0x5)
    chip-id = 0 (0x0)
    version = 704374636546 (0xa400000002)
    device-id = 1217 (0x4c1)
    x-config-reg-migration-enabled = true
    bypass-iommu = false
    bus: phb4-root.5
      type phb4-root
      dev: pnv-phb4-root-port, id ""
(...)
  dev: pnv-phb4, id ""
    index = 0 (0x0)
    chip-id = 0 (0x0)
    version = 704374636546 (0xa400000002)
    device-id = 1217 (0x4c1)
    x-config-reg-migration-enabled = true
    bypass-iommu = false
    bus: phb4-root.0
      type phb4-root
      dev: pnv-phb4-root-port, id ""

Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
---
 include/hw/pci-host/pnv_phb4.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/hw/pci-host/pnv_phb4.h b/include/hw/pci-host/pnv_phb4.h
index d67e33924b..cd0714d30b 100644
--- a/include/hw/pci-host/pnv_phb4.h
+++ b/include/hw/pci-host/pnv_phb4.h
@@ -47,7 +47,7 @@ typedef struct PnvPhb4DMASpace {
 /*
  * PHB4 PCIe Root port
  */
-#define TYPE_PNV_PHB4_ROOT_BUS "pnv-phb4-root-bus"
+#define TYPE_PNV_PHB4_ROOT_BUS "phb4-root"
 #define TYPE_PNV_PHB4_ROOT_PORT "pnv-phb4-root-port"
 #define TYPE_PNV_PHB5_ROOT_PORT "pnv-phb5-root-port"
 
-- 
2.33.1


