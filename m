Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F0140378CB6
	for <lists+qemu-devel@lfdr.de>; Mon, 10 May 2021 15:24:49 +0200 (CEST)
Received: from localhost ([::1]:46958 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lg5tx-0000uV-0W
	for lists+qemu-devel@lfdr.de; Mon, 10 May 2021 09:24:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49882)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1lg5qa-0002e7-6o
 for qemu-devel@nongnu.org; Mon, 10 May 2021 09:21:20 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:29010)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1lg5qY-0002W7-IF
 for qemu-devel@nongnu.org; Mon, 10 May 2021 09:21:19 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620652877;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ThfuC+fWrjdL4kBApcDWJYtFdonpBBWUeWsaT/jmVqo=;
 b=eSSvDd8MHDGPQRAheA5VyIMjKM9ftBoVAoFfrFVWG0hKgG4rqHtyA4vZCKfVZKzCNI6yFX
 QGTsLz5mKK7fUEsOYzvxK7g/Z4O6Xpdc3SAb8O/rDoQQndEFLlKm9OpNLbcRKdxn2wItmm
 xJpQJpzfDeDRGHsN2m0M6/zfrYnvSSQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-375-GA58UlQKMfmXsw7k7UVETA-1; Mon, 10 May 2021 09:21:16 -0400
X-MC-Unique: GA58UlQKMfmXsw7k7UVETA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3C32B106BB2B
 for <qemu-devel@nongnu.org>; Mon, 10 May 2021 13:21:15 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-112-11.ams2.redhat.com
 [10.36.112.11])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 64E8862923;
 Mon, 10 May 2021 13:21:02 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 28C69180038E; Mon, 10 May 2021 15:20:51 +0200 (CEST)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 02/25] edid: edid_desc_next
Date: Mon, 10 May 2021 15:20:28 +0200
Message-Id: <20210510132051.2208563-3-kraxel@redhat.com>
In-Reply-To: <20210510132051.2208563-1-kraxel@redhat.com>
References: <20210510132051.2208563-1-kraxel@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.698,
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Add helper function to find the next free desc block.
Needed when we start to use the dta descriptor entries.

Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
Reviewed-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Message-id: 20210427150824.638359-1-kraxel@redhat.com
Message-Id: <20210427150824.638359-3-kraxel@redhat.com>
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
2.31.1


