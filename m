Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A0499132175
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Jan 2020 09:34:54 +0100 (CET)
Received: from localhost ([::1]:44512 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iok8e-0005Ce-0c
	for lists+qemu-devel@lfdr.de; Tue, 07 Jan 2020 03:22:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51949)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <mst@redhat.com>) id 1iojPn-0005nZ-Od
 for qemu-devel@nongnu.org; Tue, 07 Jan 2020 02:36:40 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <mst@redhat.com>) id 1iojPm-00080N-4P
 for qemu-devel@nongnu.org; Tue, 07 Jan 2020 02:36:35 -0500
Received: from us-smtp-2.mimecast.com ([207.211.31.81]:59060
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <mst@redhat.com>) id 1iojPl-000803-Vx
 for qemu-devel@nongnu.org; Tue, 07 Jan 2020 02:36:34 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1578382593;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=bLV8rQCbLBZmY0FVDGOQq3AQD9eSmdJYBYmhF7NfsUU=;
 b=QDlmWqwuYEUoC4UopyGW4dvLCebh1Ibyx04W4RYzBzEJRCvxFJNpDpYNiBEhmg7ZHQCpdK
 QXhjmW7VTcGBbyOdgjboddxqEqU0T50Xu0UDtJtoZqBkcBvPXi5fttSsIqcK3JN+G8IZfc
 3lFcLRmexNAjDUHcNclfkU9CjznP4WU=
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-59-r7ojF80DO-eYCH1c1k6H8Q-1; Tue, 07 Jan 2020 02:36:31 -0500
Received: by mail-qk1-f199.google.com with SMTP id 143so30947373qkg.12
 for <qemu-devel@nongnu.org>; Mon, 06 Jan 2020 23:36:31 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=3qP/C/NttECQ066FqPp6xPe1UgZkrZPuw+r54Uke8BM=;
 b=gUWBUwjbI8DgJgN6tpu5T+k1x6l27CKs71RIT59IwfWsi9XzuQAAR2rDhQyb5y9tLh
 6+xnFvkJCs/OjeRsuFd41LZ+Z72trxXT/UcJffGkngwx1B0XhBpFs3AMwze/UAB64C6T
 /ZxuOuy/PS/DqgVZzV8x2bTV6xvSvek+s0hozkF0JUe9ha7iRiq7Z+jBth31BjzxOKzv
 AWsh9ybCwGlNGVRSaxD8/ZvFVjpAsklRkXrtWLYBbhRFBXpSQhCRnzsJMMK0tNAB2HtL
 pZrpy0kOPMQjMXLa0rdM6d9G4HKhUdYDm7ZxW3GhzxL9wa57Xq9FvYppEl6svCZqZ/wP
 r5/A==
X-Gm-Message-State: APjAAAXEcpCJGlCj0GmKWzY+d77d2ntsQMDEGtweOni/5I2xWVr4MEcB
 sl+yODJvnY4sIx7xlqV/eKZWFOph/V/knOaGL6syK8IpsgrQ/RMJuPl5togETiBs5QXekOVegI8
 /maP6Ict7eHgv6Q4=
X-Received: by 2002:ac8:104:: with SMTP id e4mr77608290qtg.37.1578382590657;
 Mon, 06 Jan 2020 23:36:30 -0800 (PST)
X-Google-Smtp-Source: APXvYqyTWFpHD2gso5//KlOp7VgleXoOPMrcO41QFNikqu5aUarexVbW5RBlAxE+6O3Mnn0vGMEtiA==
X-Received: by 2002:ac8:104:: with SMTP id e4mr77608284qtg.37.1578382590433;
 Mon, 06 Jan 2020 23:36:30 -0800 (PST)
Received: from redhat.com (bzq-79-183-34-164.red.bezeqint.net. [79.183.34.164])
 by smtp.gmail.com with ESMTPSA id z4sm21857065qkz.62.2020.01.06.23.36.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Jan 2020 23:36:29 -0800 (PST)
Date: Tue, 7 Jan 2020 02:36:25 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL v2 15/32] hmat acpi: Build System Locality Latency and
 Bandwidth Information Structure(s)
Message-ID: <20200107073451.298261-16-mst@redhat.com>
References: <20200107073451.298261-1-mst@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20200107073451.298261-1-mst@redhat.com>
X-Mailer: git-send-email 2.24.1.751.gd10ce2899c
X-Mutt-Fcc: =sent
X-MC-Unique: r7ojF80DO-eYCH1c1k6H8Q-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=us-ascii
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Igor Mammedov <imammedo@redhat.com>, Tao Xu <tao3.xu@intel.com>,
 Markus Armbruster <armbru@redhat.com>, Liu Jingqi <jingqi.liu@intel.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Liu Jingqi <jingqi.liu@intel.com>

This structure describes the memory access latency and bandwidth
information from various memory access initiator proximity domains.
The latency and bandwidth numbers represented in this structure
correspond to rated latency and bandwidth for the platform.
The software could use this information as hint for optimization.

Acked-by: Markus Armbruster <armbru@redhat.com>
Reviewed-by: Igor Mammedov <imammedo@redhat.com>
Signed-off-by: Liu Jingqi <jingqi.liu@intel.com>
Signed-off-by: Tao Xu <tao3.xu@intel.com>
Message-Id: <20191213011929.2520-6-tao3.xu@intel.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 hw/acpi/hmat.c | 104 ++++++++++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 103 insertions(+), 1 deletion(-)

diff --git a/hw/acpi/hmat.c b/hw/acpi/hmat.c
index 9ff79308a4..4635d45dee 100644
--- a/hw/acpi/hmat.c
+++ b/hw/acpi/hmat.c
@@ -25,6 +25,7 @@
  */
=20
 #include "qemu/osdep.h"
+#include "qemu/units.h"
 #include "sysemu/numa.h"
 #include "hw/acpi/hmat.h"
=20
@@ -67,11 +68,89 @@ static void build_hmat_mpda(GArray *table_data, uint16_=
t flags,
     build_append_int_noprefix(table_data, 0, 8);
 }
=20
+/*
+ * ACPI 6.3: 5.2.27.4 System Locality Latency and Bandwidth Information
+ * Structure: Table 5-146
+ */
+static void build_hmat_lb(GArray *table_data, HMAT_LB_Info *hmat_lb,
+                          uint32_t num_initiator, uint32_t num_target,
+                          uint32_t *initiator_list)
+{
+    int i, index;
+    HMAT_LB_Data *lb_data;
+    uint16_t *entry_list;
+    uint32_t base;
+    /* Length in bytes for entire structure */
+    uint32_t lb_length
+        =3D 32 /* Table length upto and including Entry Base Unit */
+        + 4 * num_initiator /* Initiator Proximity Domain List */
+        + 4 * num_target /* Target Proximity Domain List */
+        + 2 * num_initiator * num_target; /* Latency or Bandwidth Entries =
*/
+
+    /* Type */
+    build_append_int_noprefix(table_data, 1, 2);
+    /* Reserved */
+    build_append_int_noprefix(table_data, 0, 2);
+    /* Length */
+    build_append_int_noprefix(table_data, lb_length, 4);
+    /* Flags: Bits [3:0] Memory Hierarchy, Bits[7:4] Reserved */
+    assert(!(hmat_lb->hierarchy >> 4));
+    build_append_int_noprefix(table_data, hmat_lb->hierarchy, 1);
+    /* Data Type */
+    build_append_int_noprefix(table_data, hmat_lb->data_type, 1);
+    /* Reserved */
+    build_append_int_noprefix(table_data, 0, 2);
+    /* Number of Initiator Proximity Domains (s) */
+    build_append_int_noprefix(table_data, num_initiator, 4);
+    /* Number of Target Proximity Domains (t) */
+    build_append_int_noprefix(table_data, num_target, 4);
+    /* Reserved */
+    build_append_int_noprefix(table_data, 0, 4);
+
+    /* Entry Base Unit */
+    if (hmat_lb->data_type <=3D HMAT_LB_DATA_WRITE_LATENCY) {
+        /* Convert latency base from nanoseconds to picosecond */
+        base =3D hmat_lb->base * 1000;
+    } else {
+        /* Convert bandwidth base from Byte to Megabyte */
+        base =3D hmat_lb->base / MiB;
+    }
+    build_append_int_noprefix(table_data, base, 8);
+
+    /* Initiator Proximity Domain List */
+    for (i =3D 0; i < num_initiator; i++) {
+        build_append_int_noprefix(table_data, initiator_list[i], 4);
+    }
+
+    /* Target Proximity Domain List */
+    for (i =3D 0; i < num_target; i++) {
+        build_append_int_noprefix(table_data, i, 4);
+    }
+
+    /* Latency or Bandwidth Entries */
+    entry_list =3D g_malloc0(num_initiator * num_target * sizeof(uint16_t)=
);
+    for (i =3D 0; i < hmat_lb->list->len; i++) {
+        lb_data =3D &g_array_index(hmat_lb->list, HMAT_LB_Data, i);
+        index =3D lb_data->initiator * num_target + lb_data->target;
+
+        entry_list[index] =3D (uint16_t)(lb_data->data / hmat_lb->base);
+    }
+
+    for (i =3D 0; i < num_initiator * num_target; i++) {
+        build_append_int_noprefix(table_data, entry_list[i], 2);
+    }
+
+    g_free(entry_list);
+}
+
 /* Build HMAT sub table structures */
 static void hmat_build_table_structs(GArray *table_data, NumaState *numa_s=
tate)
 {
     uint16_t flags;
-    int i;
+    uint32_t num_initiator =3D 0;
+    uint32_t initiator_list[MAX_NODES];
+    int i, hierarchy, type;
+    HMAT_LB_Info *hmat_lb;
=20
     for (i =3D 0; i < numa_state->num_nodes; i++) {
         flags =3D 0;
@@ -82,6 +161,29 @@ static void hmat_build_table_structs(GArray *table_data=
, NumaState *numa_state)
=20
         build_hmat_mpda(table_data, flags, numa_state->nodes[i].initiator,=
 i);
     }
+
+    for (i =3D 0; i < numa_state->num_nodes; i++) {
+        if (numa_state->nodes[i].has_cpu) {
+            initiator_list[num_initiator++] =3D i;
+        }
+    }
+
+    /*
+     * ACPI 6.3: 5.2.27.4 System Locality Latency and Bandwidth Informatio=
n
+     * Structure: Table 5-146
+     */
+    for (hierarchy =3D HMAT_LB_MEM_MEMORY;
+         hierarchy <=3D HMAT_LB_MEM_CACHE_3RD_LEVEL; hierarchy++) {
+        for (type =3D HMAT_LB_DATA_ACCESS_LATENCY;
+             type <=3D HMAT_LB_DATA_WRITE_BANDWIDTH; type++) {
+            hmat_lb =3D numa_state->hmat_lb[hierarchy][type];
+
+            if (hmat_lb && hmat_lb->list->len) {
+                build_hmat_lb(table_data, hmat_lb, num_initiator,
+                              numa_state->num_nodes, initiator_list);
+            }
+        }
+    }
 }
=20
 void build_hmat(GArray *table_data, BIOSLinker *linker, NumaState *numa_st=
ate)
--=20
MST


