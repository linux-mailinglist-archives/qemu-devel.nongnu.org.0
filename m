Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4205A346313
	for <lists+qemu-devel@lfdr.de>; Tue, 23 Mar 2021 16:38:54 +0100 (CET)
Received: from localhost ([::1]:57210 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lOj7N-0006Wl-9w
	for lists+qemu-devel@lfdr.de; Tue, 23 Mar 2021 11:38:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34806)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1lOj59-0004c7-Qb
 for qemu-devel@nongnu.org; Tue, 23 Mar 2021 11:36:35 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:51685)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1lOj51-0002zu-R6
 for qemu-devel@nongnu.org; Tue, 23 Mar 2021 11:36:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1616513785;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=mobfb8EqlXp0lvXlsCwgLqGIobMgc21Nb0OooPDDHcw=;
 b=M4Ws/m1oXN/QNHjY8OTu/MgU7AWGOJAB4j/xk4dOdZpO3nnPbB+LCPefGmjjLq2rAoOQzw
 UsW7UeTzRfNWkLl4hYlceTDeD92wADh+OKeLrLMkCPB/rntEoRbTdHiiRP7P00qOv0J0S3
 RA69gKkFF1tOJSjIRV4iF+axM5EZ7Z4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-388-HrbiaGY7O4-4zVGkAvUvaQ-1; Tue, 23 Mar 2021 11:36:23 -0400
X-MC-Unique: HrbiaGY7O4-4zVGkAvUvaQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B3A4C100748A;
 Tue, 23 Mar 2021 15:36:22 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-112-41.ams2.redhat.com
 [10.36.112.41])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 7CAB76087C;
 Tue, 23 Mar 2021 15:36:18 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 17F191800621; Tue, 23 Mar 2021 16:36:17 +0100 (CET)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 4/5] include/ui/console.h: Delete is_surface_bgr()
Date: Tue, 23 Mar 2021 16:36:15 +0100
Message-Id: <20210323153616.873822-5-kraxel@redhat.com>
In-Reply-To: <20210323153616.873822-1-kraxel@redhat.com>
References: <20210323153616.873822-1-kraxel@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Markus Armbruster <armbru@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Peter Maydell <peter.maydell@linaro.org>

The function is_surface_bgr() is no longer used anywhere,
so we can delete it.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Message-Id: <20210314163927.1184-1-peter.maydell@linaro.org>
Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
---
 include/ui/console.h | 10 ----------
 1 file changed, 10 deletions(-)

diff --git a/include/ui/console.h b/include/ui/console.h
index 2714038a0fae..ca3c7af6a6c8 100644
--- a/include/ui/console.h
+++ b/include/ui/console.h
@@ -267,16 +267,6 @@ PixelFormat qemu_default_pixelformat(int bpp);
 DisplaySurface *qemu_create_displaysurface(int width, int height);
 void qemu_free_displaysurface(DisplaySurface *surface);
 
-static inline int is_surface_bgr(DisplaySurface *surface)
-{
-    if (PIXMAN_FORMAT_BPP(surface->format) == 32 &&
-        PIXMAN_FORMAT_TYPE(surface->format) == PIXMAN_TYPE_ABGR) {
-        return 1;
-    } else {
-        return 0;
-    }
-}
-
 static inline int is_buffer_shared(DisplaySurface *surface)
 {
     return !(surface->flags & QEMU_ALLOCATED_FLAG);
-- 
2.30.2


