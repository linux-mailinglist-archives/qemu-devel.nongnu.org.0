Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D1BE82CD46E
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Dec 2020 12:18:35 +0100 (CET)
Received: from localhost ([::1]:59622 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kkmd3-0007GN-OX
	for lists+qemu-devel@lfdr.de; Thu, 03 Dec 2020 06:18:29 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50630)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1kkmTB-00038h-0N
 for qemu-devel@nongnu.org; Thu, 03 Dec 2020 06:08:17 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:21723)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1kkmT8-0006c8-JC
 for qemu-devel@nongnu.org; Thu, 03 Dec 2020 06:08:16 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1606993692;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=z2rAMvJaEpmgH5hlnaGVQ4GwKIYO5cThsshz4AHj+pY=;
 b=bh08kBJbLmGX6aStcXDu0M36DgAKn8zFMn/SuwRI5in8kosX3+GFkSt8lncOHmWT1Q3uRw
 jCQpQ6Ov5XyW7RZo5jqN1vTNPevCb/UaybOVnO/V0cGQztpbOzWmSFpwJRS25rCoul28qr
 oowrVFIi7JpYzVd0EqWlOpiIqbYFdao=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-180-qa5Tsoy-OaOYmcID-8LwcA-1; Thu, 03 Dec 2020 06:08:11 -0500
X-MC-Unique: qa5Tsoy-OaOYmcID-8LwcA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 25E448049C0
 for <qemu-devel@nongnu.org>; Thu,  3 Dec 2020 11:08:10 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-112-94.ams2.redhat.com
 [10.36.112.94])
 by smtp.corp.redhat.com (Postfix) with ESMTP id E21025D6AC;
 Thu,  3 Dec 2020 11:08:06 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 2FB949D9C; Thu,  3 Dec 2020 12:08:06 +0100 (CET)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 4/9] vnc: drop unused copyrect feature
Date: Thu,  3 Dec 2020 12:08:00 +0100
Message-Id: <20201203110806.13556-5-kraxel@redhat.com>
In-Reply-To: <20201203110806.13556-1-kraxel@redhat.com>
References: <20201203110806.13556-1-kraxel@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=63.128.21.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.495,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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

vnc stopped using the copyrect pseudo encoding in 2017, in commit
50628d3479e4 ("cirrus/vnc: zap bitblit support from console code.")
So we can drop the now unused copyrect feature bit.

Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
---
 ui/vnc.h | 2 --
 ui/vnc.c | 3 ---
 2 files changed, 5 deletions(-)

diff --git a/ui/vnc.h b/ui/vnc.h
index 262fcf179b44..a7fd38a82075 100644
--- a/ui/vnc.h
+++ b/ui/vnc.h
@@ -445,7 +445,6 @@ enum VncFeatures {
     VNC_FEATURE_WMVI,
     VNC_FEATURE_TIGHT,
     VNC_FEATURE_ZLIB,
-    VNC_FEATURE_COPYRECT,
     VNC_FEATURE_RICH_CURSOR,
     VNC_FEATURE_TIGHT_PNG,
     VNC_FEATURE_ZRLE,
@@ -459,7 +458,6 @@ enum VncFeatures {
 #define VNC_FEATURE_WMVI_MASK                (1 << VNC_FEATURE_WMVI)
 #define VNC_FEATURE_TIGHT_MASK               (1 << VNC_FEATURE_TIGHT)
 #define VNC_FEATURE_ZLIB_MASK                (1 << VNC_FEATURE_ZLIB)
-#define VNC_FEATURE_COPYRECT_MASK            (1 << VNC_FEATURE_COPYRECT)
 #define VNC_FEATURE_RICH_CURSOR_MASK         (1 << VNC_FEATURE_RICH_CURSOR)
 #define VNC_FEATURE_TIGHT_PNG_MASK           (1 << VNC_FEATURE_TIGHT_PNG)
 #define VNC_FEATURE_ZRLE_MASK                (1 << VNC_FEATURE_ZRLE)
diff --git a/ui/vnc.c b/ui/vnc.c
index 49235056f7a8..8c2771c1ce3b 100644
--- a/ui/vnc.c
+++ b/ui/vnc.c
@@ -2061,9 +2061,6 @@ static void set_encodings(VncState *vs, int32_t *encodings, size_t n_encodings)
         case VNC_ENCODING_RAW:
             vs->vnc_encoding = enc;
             break;
-        case VNC_ENCODING_COPYRECT:
-            vs->features |= VNC_FEATURE_COPYRECT_MASK;
-            break;
         case VNC_ENCODING_HEXTILE:
             vs->features |= VNC_FEATURE_HEXTILE_MASK;
             vs->vnc_encoding = enc;
-- 
2.27.0


