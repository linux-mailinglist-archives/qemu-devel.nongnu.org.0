Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 70C2C46FE17
	for <lists+qemu-devel@lfdr.de>; Fri, 10 Dec 2021 10:46:35 +0100 (CET)
Received: from localhost ([::1]:34648 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mvcU6-00024x-2B
	for lists+qemu-devel@lfdr.de; Fri, 10 Dec 2021 04:46:34 -0500
Received: from eggs.gnu.org ([209.51.188.92]:35744)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1mvaw0-0006yl-I0
 for qemu-devel@nongnu.org; Fri, 10 Dec 2021 03:07:17 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:44376)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1mvavx-0001DP-WB
 for qemu-devel@nongnu.org; Fri, 10 Dec 2021 03:07:15 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1639123631;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=rAlpxsPP0PS43M5XRNg+IJpxGXgnd/GWMNXXexM67z8=;
 b=RGwpP3E0txRiABgaAuAmtgRV3RsTR4vYEhWdOBYOSYMMGs0zwJuvV9pP4JCg11TDiK3rBH
 nwkV8bW5v0wv56Fhj0WnIcUMla2lNGcqN7jgmV3rr2AgymYu7s7dNjqVjGldah8+PPnuPh
 J4IjURMp1vLZbOwCXc2l1XpI9Jt/VkY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-564-Wvou4LXNM-GmcWGoIxWqFA-1; Fri, 10 Dec 2021 03:07:10 -0500
X-MC-Unique: Wvou4LXNM-GmcWGoIxWqFA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4673B801962;
 Fri, 10 Dec 2021 08:07:09 +0000 (UTC)
Received: from sirius.home.kraxel.org (unknown [10.39.192.5])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 01A4D5D740;
 Fri, 10 Dec 2021 08:07:01 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 55CA618003A0; Fri, 10 Dec 2021 09:06:59 +0100 (CET)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH] uas: add missing return
Date: Fri, 10 Dec 2021 09:06:59 +0100
Message-Id: <20211210080659.2537084-1-kraxel@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.619,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: Gerd Hoffmann <kraxel@redhat.com>, Guenter Roeck <linux@roeck-us.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Otherwise we run the error handling code even for successful requests.

Fixes: 13b250b12ad3 ("uas: add stream number sanity checks.")
Reported-by: Guenter Roeck <linux@roeck-us.net>
Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
---
 hw/usb/dev-uas.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/hw/usb/dev-uas.c b/hw/usb/dev-uas.c
index 599d6b52a012..c9f295e7e449 100644
--- a/hw/usb/dev-uas.c
+++ b/hw/usb/dev-uas.c
@@ -908,6 +908,7 @@ static void usb_uas_handle_data(USBDevice *dev, USBPacket *p)
         p->status = USB_RET_STALL;
         break;
     }
+    return;
 
 err_stream:
     error_report("%s: invalid stream %d", __func__, p->stream);
-- 
2.33.1


