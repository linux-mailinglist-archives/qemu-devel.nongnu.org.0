Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 30C21636235
	for <lists+qemu-devel@lfdr.de>; Wed, 23 Nov 2022 15:46:57 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oxqzh-0004F4-AL; Wed, 23 Nov 2022 09:44:57 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1oxqzf-0004El-IL
 for qemu-devel@nongnu.org; Wed, 23 Nov 2022 09:44:55 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1oxqze-0002wa-55
 for qemu-devel@nongnu.org; Wed, 23 Nov 2022 09:44:55 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1669214693;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=GlC6m0Elefo7qiGZqWhbcNV4wWhKgMW879Br6ZVPxos=;
 b=FqbGXSByMDN0r43PLOfg3Jn1H8449D5IWJpTl1eVT7baRdlmRTfIRcOQqbS93IpBwoQ52J
 oi6X2+JYo2JYGLQySZCZie9TnQltvd8RP/fPtYuhVUnS3YxzSBoMGPLpQ7KL0/qI5oO/so
 B+y8V99OWcy4VruTWKXiOJu3tMm8sqE=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-584-LUZFv88bOE2nPUtcknaO9Q-1; Wed, 23 Nov 2022 09:44:46 -0500
X-MC-Unique: LUZFv88bOE2nPUtcknaO9Q-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 758A629AB44C;
 Wed, 23 Nov 2022 14:44:44 +0000 (UTC)
Received: from sirius.home.kraxel.org (unknown [10.39.194.45])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id AF800111DCE6;
 Wed, 23 Nov 2022 14:44:43 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id C037D1800617; Wed, 23 Nov 2022 15:44:36 +0100 (CET)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Cc: Gerd Hoffmann <kraxel@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Michael Tokarev <mjt@tls.msk.ru>, Stefan Weil <sw@weilnetz.de>
Subject: [PULL 3/7] hw/usb/hcd-xhci.c: spelling: tranfer
Date: Wed, 23 Nov 2022 15:44:32 +0100
Message-Id: <20221123144436.2141069-4-kraxel@redhat.com>
In-Reply-To: <20221123144436.2141069-1-kraxel@redhat.com>
References: <20221123144436.2141069-1-kraxel@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

From: Michael Tokarev <mjt@tls.msk.ru>

Fixes: effaf5a240e03020f4ae953e10b764622c3e87cc
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
Reviewed-by: Thomas Huth <thuth@redhat.com>
Reviewed-by: Stefan Weil <sw@weilnetz.de>
Message-Id: <20221105114851.306206-1-mjt@msgid.tls.msk.ru>
Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
---
 hw/usb/hcd-xhci.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/usb/hcd-xhci.c b/hw/usb/hcd-xhci.c
index 8299f35e6695..b89b618ec210 100644
--- a/hw/usb/hcd-xhci.c
+++ b/hw/usb/hcd-xhci.c
@@ -796,7 +796,7 @@ static int xhci_ring_chain_length(XHCIState *xhci, const XHCIRing *ring)
          */
     } while (length < TRB_LINK_LIMIT * 65536 / TRB_SIZE);
 
-    qemu_log_mask(LOG_GUEST_ERROR, "%s: exceeded maximum tranfer ring size!\n",
+    qemu_log_mask(LOG_GUEST_ERROR, "%s: exceeded maximum transfer ring size!\n",
                           __func__);
 
     return -1;
-- 
2.38.1


