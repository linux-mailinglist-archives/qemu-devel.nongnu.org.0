Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 095601263AE
	for <lists+qemu-devel@lfdr.de>; Thu, 19 Dec 2019 14:37:31 +0100 (CET)
Received: from localhost ([::1]:41632 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ihvzd-00058I-HP
	for lists+qemu-devel@lfdr.de; Thu, 19 Dec 2019 08:37:29 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57560)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <mst@redhat.com>) id 1ihvqy-0002YK-N0
 for qemu-devel@nongnu.org; Thu, 19 Dec 2019 08:28:34 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <mst@redhat.com>) id 1ihvqx-0008DU-9A
 for qemu-devel@nongnu.org; Thu, 19 Dec 2019 08:28:32 -0500
Received: from us-smtp-1.mimecast.com ([207.211.31.81]:35075
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <mst@redhat.com>) id 1ihvqx-0008BE-1n
 for qemu-devel@nongnu.org; Thu, 19 Dec 2019 08:28:31 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1576762110;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=9TnHo7VvJZaLFzHYDnog4vzTE/uU8KgG0+PD95HCZAE=;
 b=IBQ2IoGZo5J6qNHexwHYPenOVO5bIIisloXzklr18MTedXVgHrlUOIJsxwwhp7iJTY3JaD
 BDbMBW0Ej3/thCW6OJQSY1ol3Vja1pD6OM2zvkcBSGCf/4rOZbmp9pBlkQup2htwlIu5zw
 fRPstW+vAs6QZ2BQcmdKL3J1ntaHgQw=
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-231-RtLigwRtM9ebhVYi5uljAA-1; Thu, 19 Dec 2019 08:28:26 -0500
Received: by mail-qv1-f72.google.com with SMTP id dw11so3590567qvb.16
 for <qemu-devel@nongnu.org>; Thu, 19 Dec 2019 05:28:26 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=yLxJY7rN1k5OoWYN8rEjFXzk7p6lyE6U8ZaTa83HTg0=;
 b=bQc73j7jHrQRlgpcjBHWDlWrlqZ0cAA1DTgD5FMHOa6M24+P2aHN7uKqR1/iFKSZ9H
 3ymKcwaWR8unYCerwV0tiUlJfRNN39kXk+e+pAL3FP0vFfD3IOvsY/sygRd2j7X7PWOp
 Mbb7RIWtYNrsCxjy//NEfcdJyk9wEmIAil0NowXo34LVAHzHarRposBriqoOy5ZYsbc6
 ouHLRQT03yG3s6LpX/EefdlH/J0Ni85UB/vpZkjGFGgrwO/l5fqvgYg6LxekGxPt42yc
 zEL/bv+WawYS5qyLSdQ5ioO2QWEceGrKNqx8npF/NdTy6XSwvaJqIrMhVjGEq73Q7uOc
 Tjfg==
X-Gm-Message-State: APjAAAVO73BZaz6ZSd45N+TGSvC31+1cFMCsemM1scoTDRI84H/lZWhi
 +f2GWN8KKg3Lqup/AdDZigh5Ov+k6ve3Xjh06ycJxqh+MT+Tr/BbfMY2wXv2p46S24iNLlVNtLj
 GUAaqI/TvWhiDYzY=
X-Received: by 2002:a0c:c389:: with SMTP id o9mr7601388qvi.232.1576762104153; 
 Thu, 19 Dec 2019 05:28:24 -0800 (PST)
X-Google-Smtp-Source: APXvYqwM7ha9P8MMuBct7HkWloorJVvXOXiC3l+pb0wjbxcrjT+TFNJJFgaazcjfYaXTq0Nw9RFthQ==
X-Received: by 2002:a0c:c389:: with SMTP id o9mr7601368qvi.232.1576762103922; 
 Thu, 19 Dec 2019 05:28:23 -0800 (PST)
Received: from redhat.com (bzq-79-181-48-215.red.bezeqint.net. [79.181.48.215])
 by smtp.gmail.com with ESMTPSA id c20sm1935269qtc.13.2019.12.19.05.28.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 19 Dec 2019 05:28:23 -0800 (PST)
Date: Thu, 19 Dec 2019 08:28:18 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 16/24] hmat acpi: Build Memory Side Cache Information
 Structure(s)
Message-ID: <20191219132621.16595-17-mst@redhat.com>
References: <20191219132621.16595-1-mst@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20191219132621.16595-1-mst@redhat.com>
X-Mailer: git-send-email 2.24.1.751.gd10ce2899c
X-Mutt-Fcc: =sent
X-MC-Unique: RtLigwRtM9ebhVYi5uljAA-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 207.211.31.81
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Peter Maydell <peter.maydell@linaro.org>, Liu Jingqi <jingqi.liu@intel.com>,
 Tao Xu <tao3.xu@intel.com>, Markus Armbruster <armbru@redhat.com>,
 Daniel Black <daniel@linux.ibm.com>,
 Jonathan Cameron <Jonathan.Cameron@huawei.com>,
 Igor Mammedov <imammedo@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Liu Jingqi <jingqi.liu@intel.com>

This structure describes memory side cache information for memory
proximity domains if the memory side cache is present and the
physical device forms the memory side cache.
The software could use this information to effectively place
the data in memory to maximize the performance of the system
memory that use the memory side cache.

Acked-by: Markus Armbruster <armbru@redhat.com>
Reviewed-by: Igor Mammedov <imammedo@redhat.com>
Reviewed-by: Daniel Black <daniel@linux.ibm.com>
Reviewed-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
Signed-off-by: Liu Jingqi <jingqi.liu@intel.com>
Signed-off-by: Tao Xu <tao3.xu@intel.com>
Message-Id: <20191213011929.2520-7-tao3.xu@intel.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 hw/acpi/hmat.c | 69 +++++++++++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 68 insertions(+), 1 deletion(-)

diff --git a/hw/acpi/hmat.c b/hw/acpi/hmat.c
index 4635d45dee..7c24bb5371 100644
--- a/hw/acpi/hmat.c
+++ b/hw/acpi/hmat.c
@@ -143,14 +143,62 @@ static void build_hmat_lb(GArray *table_data, HMAT_LB=
_Info *hmat_lb,
     g_free(entry_list);
 }
=20
+/* ACPI 6.3: 5.2.27.5 Memory Side Cache Information Structure: Table 5-147=
 */
+static void build_hmat_cache(GArray *table_data, uint8_t total_levels,
+                             NumaHmatCacheOptions *hmat_cache)
+{
+    /*
+     * Cache Attributes: Bits [3:0] =E2=80=93 Total Cache Levels
+     * for this Memory Proximity Domain
+     */
+    uint32_t cache_attr =3D total_levels;
+
+    /* Bits [7:4] : Cache Level described in this structure */
+    cache_attr |=3D (uint32_t) hmat_cache->level << 4;
+
+    /* Bits [11:8] - Cache Associativity */
+    cache_attr |=3D (uint32_t) hmat_cache->associativity << 8;
+
+    /* Bits [15:12] - Write Policy */
+    cache_attr |=3D (uint32_t) hmat_cache->policy << 12;
+
+    /* Bits [31:16] - Cache Line size in bytes */
+    cache_attr |=3D (uint32_t) hmat_cache->line << 16;
+
+    /* Type */
+    build_append_int_noprefix(table_data, 2, 2);
+    /* Reserved */
+    build_append_int_noprefix(table_data, 0, 2);
+    /* Length */
+    build_append_int_noprefix(table_data, 32, 4);
+    /* Proximity Domain for the Memory */
+    build_append_int_noprefix(table_data, hmat_cache->node_id, 4);
+    /* Reserved */
+    build_append_int_noprefix(table_data, 0, 4);
+    /* Memory Side Cache Size */
+    build_append_int_noprefix(table_data, hmat_cache->size, 8);
+    /* Cache Attributes */
+    build_append_int_noprefix(table_data, cache_attr, 4);
+    /* Reserved */
+    build_append_int_noprefix(table_data, 0, 2);
+    /*
+     * Number of SMBIOS handles (n)
+     * Linux kernel uses Memory Side Cache Information Structure
+     * without SMBIOS entries for now, so set Number of SMBIOS handles
+     * as 0.
+     */
+    build_append_int_noprefix(table_data, 0, 2);
+}
+
 /* Build HMAT sub table structures */
 static void hmat_build_table_structs(GArray *table_data, NumaState *numa_s=
tate)
 {
     uint16_t flags;
     uint32_t num_initiator =3D 0;
     uint32_t initiator_list[MAX_NODES];
-    int i, hierarchy, type;
+    int i, hierarchy, type, cache_level, total_levels;
     HMAT_LB_Info *hmat_lb;
+    NumaHmatCacheOptions *hmat_cache;
=20
     for (i =3D 0; i < numa_state->num_nodes; i++) {
         flags =3D 0;
@@ -184,6 +232,25 @@ static void hmat_build_table_structs(GArray *table_dat=
a, NumaState *numa_state)
             }
         }
     }
+
+    /*
+     * ACPI 6.3: 5.2.27.5 Memory Side Cache Information Structure:
+     * Table 5-147
+     */
+    for (i =3D 0; i < numa_state->num_nodes; i++) {
+        total_levels =3D 0;
+        for (cache_level =3D 1; cache_level < HMAT_LB_LEVELS; cache_level+=
+) {
+            if (numa_state->hmat_cache[i][cache_level]) {
+                total_levels++;
+            }
+        }
+        for (cache_level =3D 0; cache_level <=3D total_levels; cache_level=
++) {
+            hmat_cache =3D numa_state->hmat_cache[i][cache_level];
+            if (hmat_cache) {
+                build_hmat_cache(table_data, total_levels, hmat_cache);
+            }
+        }
+    }
 }
=20
 void build_hmat(GArray *table_data, BIOSLinker *linker, NumaState *numa_st=
ate)
--=20
MST


