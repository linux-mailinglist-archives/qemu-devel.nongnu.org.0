Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CAE836C862
	for <lists+qemu-devel@lfdr.de>; Tue, 27 Apr 2021 17:11:05 +0200 (CEST)
Received: from localhost ([::1]:53242 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lbPMe-00055B-Gw
	for lists+qemu-devel@lfdr.de; Tue, 27 Apr 2021 11:11:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54898)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1lbPKM-0003Z5-M2
 for qemu-devel@nongnu.org; Tue, 27 Apr 2021 11:08:42 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:56567)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1lbPKK-0002Cx-QU
 for qemu-devel@nongnu.org; Tue, 27 Apr 2021 11:08:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1619536119;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=jQ6eXPDnQ2mvbvqf/GpeBzQiIbvA6W/AT3lRJG+uWdk=;
 b=B3WgTkQfVUxFrdrT4gJHxxQ1hWL9elHnQ3izidbZ2RE+d6Ip3dWMhaLFXTd99O/4pPfViU
 rmnpKpz6hbg9O2U8kZHzV1YGW+m4yr/HPWOdboYG9JaG4Pr4cSHTld1l2ywN0Q3AOwEaya
 sL48DDaApCr6h2HAjZ8fZofNd1jc/fU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-585-EvlM79o6OLiwVCr4XTkCWg-1; Tue, 27 Apr 2021 11:08:37 -0400
X-MC-Unique: EvlM79o6OLiwVCr4XTkCWg-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id F02B4501E1
 for <qemu-devel@nongnu.org>; Tue, 27 Apr 2021 15:08:36 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-112-203.ams2.redhat.com
 [10.36.112.203])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id D39FA6060F;
 Tue, 27 Apr 2021 15:08:32 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 0987418003AF; Tue, 27 Apr 2021 17:08:25 +0200 (CEST)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 2/8] edid: edid_desc_next
Date: Tue, 27 Apr 2021 17:08:18 +0200
Message-Id: <20210427150824.638359-3-kraxel@redhat.com>
In-Reply-To: <20210427150824.638359-1-kraxel@redhat.com>
References: <20210427150824.638359-1-kraxel@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.218,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
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
Cc: Gerd Hoffmann <kraxel@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Add helper function to find the next free desc block.
Needed when we start to use the dta descriptor entries.

Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
---
 hw/display/edid-generate.c | 41 ++++++++++++++++++++++++--------------
 1 file changed, 26 insertions(+), 15 deletions(-)

diff --git a/hw/display/edid-generate.c b/hw/display/edid-generate.c
index a1bea9a3aa35..ae34999f9eb5 100644
--- a/hw/display/edid-generate.c
+++ b/hw/display/edid-generate.c
@@ -144,6 +144,17 @@ static void edid_checksum(uint8_t *edid)
     }
 }
 
+static uint8_t *edid_desc_next(uint8_t *edid, uint8_t *dta, uint8_t *desc)
+{
+    if (desc == NULL) {
+        return NULL;
+    }
+    if (desc + 18 + 18 < edid + 127) {
+        return desc + 18;
+    }
+    return NULL;
+}
+
 static void edid_desc_type(uint8_t *desc, uint8_t type)
 {
     desc[0] = 0;
@@ -300,7 +311,7 @@ uint32_t qemu_edid_dpi_to_mm(uint32_t dpi, uint32_t res)
 void qemu_edid_generate(uint8_t *edid, size_t size,
                         qemu_edid_info *info)
 {
-    uint32_t desc = 54;
+    uint8_t *desc = edid + 54;
     uint8_t *xtra3 = NULL;
     uint8_t *dta = NULL;
     uint32_t width_mm, height_mm;
@@ -401,32 +412,32 @@ void qemu_edid_generate(uint8_t *edid, size_t size,
 
     /* =============== descriptor blocks =============== */
 
-    edid_desc_timing(edid + desc, info->prefx, info->prefy,
+    edid_desc_timing(desc, info->prefx, info->prefy,
                      width_mm, height_mm);
-    desc += 18;
+    desc = edid_desc_next(edid, dta, desc);
 
-    edid_desc_ranges(edid + desc);
-    desc += 18;
+    edid_desc_ranges(desc);
+    desc = edid_desc_next(edid, dta, desc);
 
     if (info->name) {
-        edid_desc_text(edid + desc, 0xfc, info->name);
-        desc += 18;
+        edid_desc_text(desc, 0xfc, info->name);
+        desc = edid_desc_next(edid, dta, desc);
     }
 
     if (info->serial) {
-        edid_desc_text(edid + desc, 0xff, info->serial);
-        desc += 18;
+        edid_desc_text(desc, 0xff, info->serial);
+        desc = edid_desc_next(edid, dta, desc);
     }
 
-    if (desc < 126) {
-        xtra3 = edid + desc;
+    if (desc) {
+        xtra3 = desc;
         edid_desc_xtra3_std(xtra3);
-        desc += 18;
+        desc = edid_desc_next(edid, dta, desc);
     }
 
-    while (desc < 126) {
-        edid_desc_dummy(edid + desc);
-        desc += 18;
+    while (desc) {
+        edid_desc_dummy(desc);
+        desc = edid_desc_next(edid, dta, desc);
     }
 
     /* =============== finish up =============== */
-- 
2.30.2


