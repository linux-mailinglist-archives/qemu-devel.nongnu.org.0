Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E2E332012E
	for <lists+qemu-devel@lfdr.de>; Fri, 19 Feb 2021 23:08:56 +0100 (CET)
Received: from localhost ([::1]:58942 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lDDxH-0005fr-LV
	for lists+qemu-devel@lfdr.de; Fri, 19 Feb 2021 17:08:55 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42924)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1lDDpP-0003K6-PK
 for qemu-devel@nongnu.org; Fri, 19 Feb 2021 17:00:47 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:54476)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1lDDpN-0005cr-Mp
 for qemu-devel@nongnu.org; Fri, 19 Feb 2021 17:00:47 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1613772044;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=6ji6Ud/Z1JR/xpNRHVTli7SYXTNPt/2RyJG0ogwAWUI=;
 b=BXXsNnTtFfhMPf93e20dkaKz1W2Z0eJS83oh2NoBRi0dqH0igdmM+ybXuElt3alTSAZBGF
 YGHuCbTTElcP/ExXvJEocRu+EL4KER0Wd7ggvHtCkJg9bx3y8kmtbOTopok+jleZvi7MMh
 0c83rIcJkks3zuNkj43R/fuYcYRvT+M=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-414-Lc3ZFUJQNfWy7CdKy9waqA-1; Fri, 19 Feb 2021 17:00:42 -0500
X-MC-Unique: Lc3ZFUJQNfWy7CdKy9waqA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E64E9803648;
 Fri, 19 Feb 2021 22:00:41 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-114-184.ams2.redhat.com
 [10.36.114.184])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 79EBF5D723;
 Fri, 19 Feb 2021 22:00:38 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 009D11800398; Fri, 19 Feb 2021 23:00:36 +0100 (CET)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 3/8] ui/cocoa: Support unique keys of JIS keyboards
Date: Fri, 19 Feb 2021 23:00:31 +0100
Message-Id: <20210219220036.100654-4-kraxel@redhat.com>
In-Reply-To: <20210219220036.100654-1-kraxel@redhat.com>
References: <20210219220036.100654-1-kraxel@redhat.com>
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
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Gerd Hoffmann <kraxel@redhat.com>,
 Akihiko Odaki <akihiko.odaki@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Akihiko Odaki <akihiko.odaki@gmail.com>

Signed-off-by: Akihiko Odaki <akihiko.odaki@gmail.com>
Message-Id: <20210212000404.28413-1-akihiko.odaki@gmail.com>
Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
---
 ui/cocoa.m | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/ui/cocoa.m b/ui/cocoa.m
index 13fba8103e1a..78fcfeaf04b7 100644
--- a/ui/cocoa.m
+++ b/ui/cocoa.m
@@ -240,6 +240,13 @@ const int mac_to_qkeycode_map[] = {
     [kVK_F14] = Q_KEY_CODE_SCROLL_LOCK,
     [kVK_F15] = Q_KEY_CODE_PAUSE,
 
+    // JIS keyboards only
+    [kVK_JIS_Yen] = Q_KEY_CODE_YEN,
+    [kVK_JIS_Underscore] = Q_KEY_CODE_RO,
+    [kVK_JIS_KeypadComma] = Q_KEY_CODE_KP_COMMA,
+    [kVK_JIS_Eisu] = Q_KEY_CODE_MUHENKAN,
+    [kVK_JIS_Kana] = Q_KEY_CODE_HENKAN,
+
     /*
      * The eject and volume keys can't be used here because they are handled at
      * a lower level than what an Application can see.
-- 
2.29.2


