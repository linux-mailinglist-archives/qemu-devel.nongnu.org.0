Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 95E431298FA
	for <lists+qemu-devel@lfdr.de>; Mon, 23 Dec 2019 17:56:41 +0100 (CET)
Received: from localhost ([::1]:58938 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ijR0a-0003rW-7g
	for lists+qemu-devel@lfdr.de; Mon, 23 Dec 2019 11:56:40 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41562)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <mst@redhat.com>) id 1ijQmk-0004bv-B0
 for qemu-devel@nongnu.org; Mon, 23 Dec 2019 11:42:23 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <mst@redhat.com>) id 1ijQmj-0005c5-0Z
 for qemu-devel@nongnu.org; Mon, 23 Dec 2019 11:42:22 -0500
Received: from us-smtp-2.mimecast.com ([205.139.110.61]:26526
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <mst@redhat.com>) id 1ijQmi-0005am-S9
 for qemu-devel@nongnu.org; Mon, 23 Dec 2019 11:42:20 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1577119335;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=9TnHo7VvJZaLFzHYDnog4vzTE/uU8KgG0+PD95HCZAE=;
 b=UsjP7ehUye5Xia7lCt3Svx2xtWaeqek6oBuacQhp2uZwe4NT9XhLVoNGgVM5kqibK9n//w
 DZwk+Cy2wOgZJayc3WMa5OTZiOvN/Ue3WDbtR2wCw1gJ97eQYtLX2w0CsfRbfXKg9Rz/lt
 pXm06x6zOdoRAhSqbqk05NkExJP7PNE=
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-276-AYKwGA5pO1OEOO4zgUEAOg-1; Mon, 23 Dec 2019 11:42:14 -0500
Received: by mail-qt1-f199.google.com with SMTP id i3so11412443qtb.10
 for <qemu-devel@nongnu.org>; Mon, 23 Dec 2019 08:42:14 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=yLxJY7rN1k5OoWYN8rEjFXzk7p6lyE6U8ZaTa83HTg0=;
 b=dkz+7VQT4BRcvVECPDhe5qo4uGG9riyadA5Nk2jgZNszdHek7OV/2Yidwb0g4zSRCi
 ohcbJmWMIBWcEP/0R0dnXjLg4UIS2QhnjSf36Ym0C/hWXAl50GcQMiKSIR4EuZrqwToL
 h+z+SEAojp8t6ZwNB0Zo7URZRPeDAvB5QdneJGrcpl69xVF4huGxZ7eTfmZUWW/nkTEs
 n0Fgg1+KtilUTamJ4dzQ7mJWKL4R/ZzRMQNi0YQaN0cWHwAQ2YwhsUqBKuUXxczNugyC
 O1cjxjEXhiatFeSgmgV2WhQ2voNGHOKfcDO//7H2dBE6JlyAZK0Fll0UrY0CFnsYtZtT
 oorQ==
X-Gm-Message-State: APjAAAU2XfXqCIZVxQDmDcLVh8Clnn9YG0AdE9oyM25sbyuCfPeVQ+zy
 Fs/+ADhj1lUwrAoLul5lbOzjygT+SF99W8NwJIeiv4le5a3qfASNJaG5qIvzlSTTI0W0AL6F5I1
 YtLSSS/okI7OvnTQ=
X-Received: by 2002:a37:4141:: with SMTP id o62mr26271045qka.282.1577119333752; 
 Mon, 23 Dec 2019 08:42:13 -0800 (PST)
X-Google-Smtp-Source: APXvYqz6G5qcLUKAkjZQu5EGV2Ebs5gplV5qrt/J7b6ol1kK1zaxTXA9hj7mvPqx9VjqPqfelVO4WQ==
X-Received: by 2002:a37:4141:: with SMTP id o62mr26271024qka.282.1577119333519; 
 Mon, 23 Dec 2019 08:42:13 -0800 (PST)
Received: from redhat.com (bzq-109-64-31-13.red.bezeqint.net. [109.64.31.13])
 by smtp.gmail.com with ESMTPSA id
 e3sm4974740qtj.30.2019.12.23.08.42.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 Dec 2019 08:42:12 -0800 (PST)
Date: Mon, 23 Dec 2019 11:42:09 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL v2 16/27] hmat acpi: Build Memory Side Cache Information
 Structure(s)
Message-ID: <20191223141536.72682-17-mst@redhat.com>
References: <20191223141536.72682-1-mst@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20191223141536.72682-1-mst@redhat.com>
X-Mailer: git-send-email 2.24.1.751.gd10ce2899c
X-Mutt-Fcc: =sent
X-MC-Unique: AYKwGA5pO1OEOO4zgUEAOg-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 205.139.110.61
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


