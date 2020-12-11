Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A3102D72B5
	for <lists+qemu-devel@lfdr.de>; Fri, 11 Dec 2020 10:17:41 +0100 (CET)
Received: from localhost ([::1]:58980 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kneYW-0003s1-G9
	for lists+qemu-devel@lfdr.de; Fri, 11 Dec 2020 04:17:40 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50804)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1kneUk-0007JO-N9
 for qemu-devel@nongnu.org; Fri, 11 Dec 2020 04:13:46 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:45105)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1kneU1-0004io-MD
 for qemu-devel@nongnu.org; Fri, 11 Dec 2020 04:13:11 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1607677981;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=moo2ZcRcZPyC2G8O/AUuESXMynkoKZxPPDH8sQImA3Q=;
 b=WB5FlQAK2qbVRDPlPMqK4zxKQMnT+sy2hlh+gsMd+xxogKVsJt8K8wI/8mp0/ofZy5kpjZ
 JHNFnS64o9y3DzOgIvW5+bvDD9/33kvs/xvDcON0W+hlKsH2n7ad+Sgmbi+4RVbUedESyd
 dEqOGMeYcW4FWgMBSAAqIE41cX/kzkI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-298-UI5bmkhNO9mgbwWvajN-rQ-1; Fri, 11 Dec 2020 04:12:59 -0500
X-MC-Unique: UI5bmkhNO9mgbwWvajN-rQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6FE3A107ACE3
 for <qemu-devel@nongnu.org>; Fri, 11 Dec 2020 09:12:58 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-112-94.ams2.redhat.com
 [10.36.112.94])
 by smtp.corp.redhat.com (Postfix) with ESMTP id A83855D9D5;
 Fri, 11 Dec 2020 09:12:51 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id F07AB9D99; Fri, 11 Dec 2020 10:12:50 +0100 (CET)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 4/8] vnc: drop unused copyrect feature
Date: Fri, 11 Dec 2020 10:12:46 +0100
Message-Id: <20201211091250.1415-5-kraxel@redhat.com>
In-Reply-To: <20201211091250.1415-1-kraxel@redhat.com>
References: <20201211091250.1415-1-kraxel@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

vnc stopped using the copyrect pseudo encoding in 2017, in commit
50628d3479e4 ("cirrus/vnc: zap bitblit support from console code.")
So we can drop the now unused copyrect feature bit.

Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
Reviewed-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>
Message-id: 20201208115737.18581-5-kraxel@redhat.com
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


