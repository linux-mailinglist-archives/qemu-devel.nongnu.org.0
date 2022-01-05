Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 17FE1485AB2
	for <lists+qemu-devel@lfdr.de>; Wed,  5 Jan 2022 22:33:01 +0100 (CET)
Received: from localhost ([::1]:43992 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n5Du0-0008KZ-6S
	for lists+qemu-devel@lfdr.de; Wed, 05 Jan 2022 16:33:00 -0500
Received: from eggs.gnu.org ([209.51.188.92]:33402)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1n5Dlw-0002so-V2; Wed, 05 Jan 2022 16:24:41 -0500
Received: from [2607:f8b0:4864:20::932] (port=45742
 helo=mail-ua1-x932.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1n5Dln-0007xI-EP; Wed, 05 Jan 2022 16:24:39 -0500
Received: by mail-ua1-x932.google.com with SMTP id az37so783826uab.12;
 Wed, 05 Jan 2022 13:24:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=FcslmGzmio5+WdWNGQzDrMsHyEjGbkwPHBC+tlXIoYc=;
 b=XXOzQz3GJHhRokOZzSjXdFjIGcQDLLSGoxfuxAfoexvgNLvIUMP5YGkk+6Y0wT31La
 yNuQXXa+y5qKrteE9hEUQranqR/TykEaB2g71OEPoi0wr/C6hYGh9ipx2w5sjwnKU6sv
 PnZUEX1W4YuSLz7BDjPBjtytHa5xUN6lcp67hL9GSxEcklHqAF9K1tpXSNylWouS71Hh
 xZKJUg/bDgi9rA6Ynpb0idEzlulOSsxUarPoa437nATPQ9XId74blgBragV9hWm25iNR
 IYJGrSBzKVxwNQELufSVL+G3WzLhpOdtuhlv6MjJv1Gltw/0NtC8D3zKgXp4B98N8rZt
 UUyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=FcslmGzmio5+WdWNGQzDrMsHyEjGbkwPHBC+tlXIoYc=;
 b=MO3DQplteI60c9zT0OGHv3hONlcMXPRu9fMZbiiDHUOaqjV7qZFOTCN4HeYooNnyHX
 Rk/wuqUj2gCpBcoW1BojwACCn/AnEE6zKJbklE3rNtYxsoLLCHgy99vOjMca5vY+lOZ7
 iJnTlkN5Tg/RSvLVeCJqUn3g2B5h0icuv6dTaONOWxSkCwIW9rMaHjVz2RbYHhmHCQao
 N7zbOH7phz+MVv0s3c0CbeY7io0bnrctA7wZvo7x/fyzda6P447zD9esnL8jgVkEP91+
 /QMxfe46wQF5b5moIYtKjYTkgqMxQPemipGrufLaMdb+QLX093HhXG1Yj2V8xXvxSBE5
 oG9w==
X-Gm-Message-State: AOAM53160SJBmHQIsOsjCP4iafMb13rVLueToc63lqW8RYu/M3qJW7lz
 zldefrJBafZf0Mtvl/n2A641gft56CM=
X-Google-Smtp-Source: ABdhPJyZiX2shpD6WDFP1cJbEGD8rvpdEM0lG61yiCpqhRjrgsKTgTVVygyWJ8EEKalkAn6mFZyDnA==
X-Received: by 2002:a67:d297:: with SMTP id z23mr18630145vsi.18.1641417869580; 
 Wed, 05 Jan 2022 13:24:29 -0800 (PST)
Received: from rekt.ibmuc.com ([2804:431:c7c7:f4d8:aa07:335f:99e0:a6e7])
 by smtp.gmail.com with ESMTPSA id m5sm65922vke.43.2022.01.05.13.24.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 05 Jan 2022 13:24:29 -0800 (PST)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 18/18] pnv_phb4.c: change TYPE_PNV_PHB4_ROOT_BUS name
Date: Wed,  5 Jan 2022 18:23:38 -0300
Message-Id: <20220105212338.49899-19-danielhb413@gmail.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20220105212338.49899-1-danielhb413@gmail.com>
References: <20220105212338.49899-1-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::932
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::932;
 envelope-from=danielhb413@gmail.com; helo=mail-ua1-x932.google.com
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

Similar to what was happening with pnv-phb3 buses,
TYPE_PNV_PHB4_ROOT_BUS set to "pnv-phb4-root-bus" is a bit too long for
a default root bus name. The usual default name for theses buses in QEMU
are 'pcie', but we want to make a distinction between pnv-phb4 buses and
other PCIE buses, at least as far as default name goes, because not all
PCIE devices are attachable to a pnv-phb4 root-bus type.

Changing the default to 'pnv-phb4-root' allow us to have a shorter name
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
    bus: pnv-phb4-root.11
      type pnv-phb4-root
      dev: pnv-phb4-root-port, id ""
(...)
  dev: pnv-phb4, id ""
    index = 0 (0x0)
    chip-id = 1 (0x1)
    version = 704374636546 (0xa400000002)
    device-id = 1217 (0x4c1)
    x-config-reg-migration-enabled = true
    bypass-iommu = false
    bus: pnv-phb4-root.6
      type pnv-phb4-root
      dev: pnv-phb4-root-port, id ""
(..)
  dev: pnv-phb4, id ""
    index = 5 (0x5)
    chip-id = 0 (0x0)
    version = 704374636546 (0xa400000002)
    device-id = 1217 (0x4c1)
    x-config-reg-migration-enabled = true
    bypass-iommu = false
    bus: pnv-phb4-root.5
      type pnv-phb4-root
      dev: pnv-phb4-root-port, id ""
(...)
  dev: pnv-phb4, id ""
    index = 0 (0x0)
    chip-id = 0 (0x0)
    version = 704374636546 (0xa400000002)
    device-id = 1217 (0x4c1)
    x-config-reg-migration-enabled = true
    bypass-iommu = false
    bus: pnv-phb4-root.0
      type pnv-phb4-root
      dev: pnv-phb4-root-port, id ""

Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
---
 include/hw/pci-host/pnv_phb4.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/hw/pci-host/pnv_phb4.h b/include/hw/pci-host/pnv_phb4.h
index 610580a88f..0aec495cbf 100644
--- a/include/hw/pci-host/pnv_phb4.h
+++ b/include/hw/pci-host/pnv_phb4.h
@@ -47,7 +47,7 @@ typedef struct PnvPhb4DMASpace {
 /*
  * PHB4 PCIe Root port
  */
-#define TYPE_PNV_PHB4_ROOT_BUS "pnv-phb4-root-bus"
+#define TYPE_PNV_PHB4_ROOT_BUS "pnv-phb4-root"
 #define TYPE_PNV_PHB4_ROOT_PORT "pnv-phb4-root-port"
 
 typedef struct PnvPHB4RootPort {
-- 
2.33.1


