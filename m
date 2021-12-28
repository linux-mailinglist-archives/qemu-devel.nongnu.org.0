Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AB1B480CD7
	for <lists+qemu-devel@lfdr.de>; Tue, 28 Dec 2021 20:48:46 +0100 (CET)
Received: from localhost ([::1]:45646 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n2ISj-0004H3-2L
	for lists+qemu-devel@lfdr.de; Tue, 28 Dec 2021 14:48:45 -0500
Received: from eggs.gnu.org ([209.51.188.92]:48420)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1n2IIm-0003l1-JT; Tue, 28 Dec 2021 14:38:30 -0500
Received: from [2607:f8b0:4864:20::f2f] (port=42805
 helo=mail-qv1-xf2f.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1n2IIh-00044M-Ht; Tue, 28 Dec 2021 14:38:24 -0500
Received: by mail-qv1-xf2f.google.com with SMTP id q4so17256912qvh.9;
 Tue, 28 Dec 2021 11:38:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=piKMipm/jtlGzPVWLh3Y4aDoia+41Dlhy/W+XbF0Y6o=;
 b=mExBK0ImQrP8SuyC0JJRlaN2GlqLyMPHVY3dZdvtG/e01cili+1/vsHGWjYPSFgTYV
 as3n91SMpV8FaYgePI1qQbVqkaurixBx92aVNBvIy+mGUE52C+QzAr0nQaQeO7djcgqf
 26OfU4Nzqg3dZXt4CcEoDmkEdp0pUUluKsC9L1Z2eKnmr3XrSOzKoLQ5ZEeeyXzMKYpk
 G7TolePgZnNBKkylC6QHSAAz63vj6YyzZK50Vi+ROdOye72eVmmuugzLIvdbeL7AH0ZV
 XActukzMsVnx6mBoFz+buMgOW4LsdQR5Hmrw64R+HsR6R7A/Ee5l9qT2LfugluDhQdLC
 YMgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=piKMipm/jtlGzPVWLh3Y4aDoia+41Dlhy/W+XbF0Y6o=;
 b=zir7hlTsupq3P36NM4JSwW2p5l/DeTCMgCDIhnbDzMEnkOsZsWxUIqVS1pLaumyo0V
 hxclbJ4iQWG5ysUgRGgLjfcRW1oabtdDZLSMwfxMEfsdGT7Ypj93UkGzq7L+ssZkpkya
 kjA977JXSKURrM0KbIBoGhnhJPvTdrrKB/zOZ1DSWdTzRPxropCFh/kzeP28LvMZblW0
 OTgaHBr2d0sekMZtEmqbGBprbQRJDgxt+RXwuayw6NttIlsY+ClTG6iBLdewK6kZQOlN
 3VxNNdTeB1aUyG9BZc6XKXjagd6vNYnoZUW68et3bPM9LpJq2B27ePJgIvWxpNWbv0SF
 wIXg==
X-Gm-Message-State: AOAM533irum3R6A7Alb1Gof/M4FJG1SEC6URPWsQBqt4VU09ReALoCzz
 11DsJGjc/yjk8NFB5qC3dLKfPgTYumk=
X-Google-Smtp-Source: ABdhPJwhaldaChSHNrVbHrmZo1amNO2U1LrP+0M8wOQxegWg/ZvzIh5f3bwxpfTW8b492tyDTNj1/w==
X-Received: by 2002:ad4:5be5:: with SMTP id k5mr20440485qvc.124.1640720302363; 
 Tue, 28 Dec 2021 11:38:22 -0800 (PST)
Received: from rekt.ibmuc.com ([2804:431:c7c6:7ce4:b718:2cc0:32df:97ee])
 by smtp.gmail.com with ESMTPSA id r20sm16924059qkp.21.2021.12.28.11.38.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Dec 2021 11:38:22 -0800 (PST)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 03/17] pnv_phb3.h: change TYPE_PNV_PHB3_ROOT_BUS name
Date: Tue, 28 Dec 2021 16:37:52 -0300
Message-Id: <20211228193806.1198496-4-danielhb413@gmail.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211228193806.1198496-1-danielhb413@gmail.com>
References: <20211228193806.1198496-1-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::f2f
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::f2f;
 envelope-from=danielhb413@gmail.com; helo=mail-qv1-xf2f.google.com
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

This patch renames it as 'phb3-root', which is a compromise between the
existing and the previously used name. Creating 3 phbs without ID will
result in an "info qtree" output similar to this:

bus: main-system-bus
  type System
  dev: pnv-phb3, id ""
    index = 2 (0x2)
    chip-id = 0 (0x0)
    x-config-reg-migration-enabled = true
    bypass-iommu = false
    bus: phb3-root.2
      type phb3-root
  dev: pnv-phb3, id ""
    index = 1 (0x1)
    chip-id = 0 (0x0)
    x-config-reg-migration-enabled = true
    bypass-iommu = false
    bus: phb3-root.1
      type phb3-root
  dev: pnv-phb3, id ""
    index = 0 (0x0)
    chip-id = 0 (0x0)
    x-config-reg-migration-enabled = true
    bypass-iommu = false
    bus: phb3-root.0
      type phb3-root

Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
---
 include/hw/pci-host/pnv_phb3.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/hw/pci-host/pnv_phb3.h b/include/hw/pci-host/pnv_phb3.h
index 2e423c3890..658ee40e13 100644
--- a/include/hw/pci-host/pnv_phb3.h
+++ b/include/hw/pci-host/pnv_phb3.h
@@ -105,7 +105,7 @@ struct PnvPBCQState {
 /*
  * PHB3 PCIe Root port
  */
-#define TYPE_PNV_PHB3_ROOT_BUS "pnv-phb3-root-bus"
+#define TYPE_PNV_PHB3_ROOT_BUS "phb3-root"
 
 #define TYPE_PNV_PHB3_ROOT_PORT "pnv-phb3-root-port"
 
-- 
2.33.1


