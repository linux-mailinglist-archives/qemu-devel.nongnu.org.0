Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C121949E835
	for <lists+qemu-devel@lfdr.de>; Thu, 27 Jan 2022 17:58:27 +0100 (CET)
Received: from localhost ([::1]:54510 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nD86M-0000DA-T2
	for lists+qemu-devel@lfdr.de; Thu, 27 Jan 2022 11:58:26 -0500
Received: from eggs.gnu.org ([209.51.188.92]:48010)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <anthony.perard@citrix.com>)
 id 1nD6vn-0000bS-Bv
 for qemu-devel@nongnu.org; Thu, 27 Jan 2022 10:43:27 -0500
Received: from esa2.hc3370-68.iphmx.com ([216.71.145.153]:9725)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <anthony.perard@citrix.com>)
 id 1nD6vl-0007hu-D2
 for qemu-devel@nongnu.org; Thu, 27 Jan 2022 10:43:27 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1643298205;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=GuqAfKXzSxKalGM6eT/tR+t7OAliByx2K08LxaHBjd0=;
 b=UgSaxxZK3NP0Ks4KluiftMEFC3HLecOSgnkXSarAZdDVsPlNeFLldyIl
 nxrOHCMiwb6B8M5E70qJUPi6PHcdZvA92qPiXiY6zH6SqD6JCQEa1VEaj
 xiUgyotllWT6wPr29HRvoFCKf7Boe4eFSsH+NgLa7bxzrC14CWPcjoL7w o=;
Authentication-Results: esa2.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: YDi/8KC/LRASVA73LB9+31H5kPzVcc/L5naw9fjTPRmhmjzBq8E2fQiVFjajn5sqQXIKigN39x
 ru2Ibyb1JJby3p+oewOdJl75ULjHy7U/UhTkF1RkvCRqB6+L8wClea+3VJHYQa0JrUT/Q52tPq
 ybWXy5tgG4ToQop9Tn4UzFPwynyEAieWTmVLkOw6LSQeOD3+znKKfmFN4ahc5CLNtnejbPFkBR
 J7pn5Ga6/UweJqt9DwDaUxQXxQZzlQnoQBXcTagr4wMF835PDZT6i0l5d+7jMfyw0PO2WbBL9L
 YFwKpbvyi+SMY/thUR0vMj2D
X-SBRS: 5.2
X-MesageID: 62906460
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:YcdVh6zyktwTRIuNwpF6t+fxwSrEfRIJ4+MujC+fZmUNrF6WrkVUz
 DYdC2/TP6mNZWWmco9xb9iy90NT65/XydZiTwBq/yAxQypGp/SeCIXCJC8cHc8zwu4v7q5Dx
 59DAjUVBJlsFhcwnvopW1TYhSEUOZugH9IQM8aZfHAhLeNYYH1500g7wrRm2tQAbeWRWGthh
 /uj+6UzB3f9s9JEGjp8B3Wr8U4HUFza4Vv0j3RmDRx5lAa2e0o9VfrzEZqZPXrgKrS4K8bhL
 wr1IBNVyUuCl/slIovNfr8W6STmSJaKVeSFoiI+t6RPHnGuD8H9u0o2HKN0VKtZt9mGt+gq7
 sxXt9u0cDosDrKSmvo2c0N5Si4raMWq+JefSZS+mcmazkmAeHrw2fR+SkoxOOX0+M4uXzsIr
 6ZBbmlQMFbT3Ipaw5riIgVors0lMMnsOpJZonx6xCvVJf0nXYrCU+PB4towMDIY2JofRaiCO
 ZJxhTxHMSWQeTBqYk4rUakmo/W6gkn2QRhVtwfAzUYwyzeKl1EguFT3C/LNd8CHX4NQl1eUq
 2bC12D4BBgAM5qY0zXt2muhg/KKkS7lVYY6Erq++fh3xlqJyQQu5AY+DAXh56Pj0wjnBowZe
 xd8FjcSQbYazBeNV8P/GBmBnXu0oUAeRfFwScxj51TYokbL2DqxCm8BRz9HTdUpss4qWDAnv
 mO0c8PV6S9H6+PMFy/EnluAhXbrYHVOczdeDcMRZVZdu7HeTJcPYgUjpzqJOIq8lZXLFD752
 FhmRwBu1uxI3abnO0hWlG0rYg5ARLCUFmbZBS2NBwpJCz+Vgqb/OuREDnCAtZ59wH6xFAXpg
 ZT9s5H2ABoyJZ+MjjeRZ+4GAauk4f2IWBWF3wI0RcJ5rGrwoyPyFWy13N2YDB03WirjUWSxC
 HI/RCsLvMMDVJdURfEfj32N5zQCkvG7SIWNugH8ZdtSeJlhHDJrDwk1DXN8K1vFyRB2+YlmY
 M/zWZ/1UR4yVPo7pBLrGbZ1+eJ7l0gWmDKILbimnkvP7FZrTCPPIVvzGAHQPrlRAWLtiFi9z
 uuzwOPTm0wAC7WvO3eOmWPRRHhTRUUG6VnNg5Q/Xoa+zsBORAnN0tfdnuEsfZJLhaNQmrua9
 32xQBYAmlH+mWfGOUOBbXU6MOHjWpN2rHQaOy0wPAn3hyh/MNj3tKpPJYEqebQH9fB4yaImR
 fcyZMjdUO9ETS7K+mpBYMCl/pBibhmimSmHIzGhPGokZ5dlSgGQoo3kcwLj+TMgFC2yscdi8
 bSs2hmCGcgIRhh4DdaQY/WqlgvjsX8YkeN0fk3JPtgMJxm8rNk0c3T816ZlLdsNJBPPwiqh+
 zyXWRpI9/PQp4IV8cXSgfzWpYmeDOYjTFFRGHPW7OjqOHCCrHaj24JJTM2BYSvZCDHv4Kyna
 OhYk6P8PfkAkAoYuoZwCe82n6c35t+prL5G1AV0Wn7Mag3zWL9nJ3CH2+hJt7FMmeAF6VfnB
 BrX94kII6iNNePkDEUVdVgsYem03P0JniXfsKYuK0Lg6S4rpLeKXC2+5fVXZPCx+FetDL4Y/
 A==
IronPort-HdrOrdr: A9a23:xlEm4qBFyGMatGHlHemq55DYdb4zR+YMi2TC1yhKJiC9Ffbo8P
 xG/c5rrCMc5wxxZJhNo7290ey7MBHhHP1OkO0s1NWZPDUO0VHAROoJ0WKh+UyEJ8SXzJ866U
 4KScZD4bPLYWSS9fyKgzWFLw==
X-IronPort-AV: E=Sophos;i="5.88,321,1635220800"; d="scan'208";a="62906460"
To: <qemu-devel@nongnu.org>
CC: Peter Maydell <peter.maydell@linaro.org>, Ross Lagerwall
 <ross.lagerwall@citrix.com>, Anthony PERARD <anthony.perard@citrix.com>
Subject: [PULL 2/2] xen-mapcache: Avoid entry->lock overflow
Date: Thu, 27 Jan 2022 15:42:46 +0000
Message-ID: <20220127154246.6281-3-anthony.perard@citrix.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220127154246.6281-1-anthony.perard@citrix.com>
References: <20220127154246.6281-1-anthony.perard@citrix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: pass client-ip=216.71.145.153;
 envelope-from=anthony.perard@citrix.com; helo=esa2.hc3370-68.iphmx.com
X-Spam_score_int: -45
X-Spam_score: -4.6
X-Spam_bar: ----
X-Spam_report: (-4.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.159,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_PASS=-0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
Reply-to:  Anthony PERARD <anthony.perard@citrix.com>
From:  Anthony PERARD via <qemu-devel@nongnu.org>

From: Ross Lagerwall <ross.lagerwall@citrix.com>

In some cases, a particular mapcache entry may be mapped 256 times
causing the lock field to wrap to 0. For example, this may happen when
using emulated NVME and the guest submits a large scatter-gather write.
At this point, the entry map be remapped causing QEMU to write the wrong
data or crash (since remap is not atomic).

Avoid this overflow by increasing the lock field to a uint32_t and also
detect it and abort rather than continuing regardless.

Signed-off-by: Ross Lagerwall <ross.lagerwall@citrix.com>
Reviewed-by: Paul Durrant <paul@xen.org>
Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>
Message-Id: <20220124104450.152481-1-ross.lagerwall@citrix.com>
Signed-off-by: Anthony PERARD <anthony.perard@citrix.com>
---
 hw/i386/xen/xen-mapcache.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/hw/i386/xen/xen-mapcache.c b/hw/i386/xen/xen-mapcache.c
index bd47c3d672..f2ef977963 100644
--- a/hw/i386/xen/xen-mapcache.c
+++ b/hw/i386/xen/xen-mapcache.c
@@ -52,7 +52,7 @@ typedef struct MapCacheEntry {
     hwaddr paddr_index;
     uint8_t *vaddr_base;
     unsigned long *valid_mapping;
-    uint8_t lock;
+    uint32_t lock;
 #define XEN_MAPCACHE_ENTRY_DUMMY (1 << 0)
     uint8_t flags;
     hwaddr size;
@@ -355,6 +355,12 @@ static uint8_t *xen_map_cache_unlocked(hwaddr phys_addr, hwaddr size,
     if (lock) {
         MapCacheRev *reventry = g_malloc0(sizeof(MapCacheRev));
         entry->lock++;
+        if (entry->lock == 0) {
+            fprintf(stderr,
+                    "mapcache entry lock overflow: "TARGET_FMT_plx" -> %p\n",
+                    entry->paddr_index, entry->vaddr_base);
+            abort();
+        }
         reventry->dma = dma;
         reventry->vaddr_req = mapcache->last_entry->vaddr_base + address_offset;
         reventry->paddr_index = mapcache->last_entry->paddr_index;
-- 
Anthony PERARD


