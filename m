Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EFA621D7C8A
	for <lists+qemu-devel@lfdr.de>; Mon, 18 May 2020 17:17:05 +0200 (CEST)
Received: from localhost ([::1]:45222 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jahVp-0004gE-1g
	for lists+qemu-devel@lfdr.de; Mon, 18 May 2020 11:17:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47638)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1jahS6-0008Cw-Qf
 for qemu-devel@nongnu.org; Mon, 18 May 2020 11:13:14 -0400
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:54410
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1jahS1-0005xE-UN
 for qemu-devel@nongnu.org; Mon, 18 May 2020 11:13:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1589814788;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=+YCI2nfcVXJ1PDK3L/CPcyRZvTy24qI3gtfy+cKDHFE=;
 b=S9MHh8rVcsrWd31oHyfXu3Cr+0lrICpH6bZC8ozG0CLFqXPoUk7xFxY0cVa0ijHssYZ+ka
 Vz/nhVnvAKSPYSPZY2VhsEwk3XIYyLilDNG3mlpsdkoG+eDbixiq4IsMtjQCJnV1coYo76
 lYRVoCkgbboiKDfHoY3X2AgKaKGj62I=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-412-zDufPmW7NCKkz82R7VT-JQ-1; Mon, 18 May 2020 11:13:03 -0400
X-MC-Unique: zDufPmW7NCKkz82R7VT-JQ-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5B1131853B03;
 Mon, 18 May 2020 15:13:02 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-113-50.ams2.redhat.com
 [10.36.113.50])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 9BEBF1002394;
 Mon, 18 May 2020 15:12:56 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 8D4991750A; Mon, 18 May 2020 17:12:55 +0200 (CEST)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 2/8] hw/display: Include local 'framebuffer.h'
Date: Mon, 18 May 2020 17:12:49 +0200
Message-Id: <20200518151255.10785-3-kraxel@redhat.com>
In-Reply-To: <20200518151255.10785-1-kraxel@redhat.com>
References: <20200518151255.10785-1-kraxel@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=205.139.110.120; envelope-from=kraxel@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/05/17 22:51:00
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_PASS=-0.001, URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
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
Cc: Thomas Huth <huth@tuxfamily.org>, Paolo Bonzini <pbonzini@redhat.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Philippe Mathieu-Daudé <f4bug@amsat.org>

The "framebuffer.h" header is not an exported include.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Thomas Huth <huth@tuxfamily.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-id: 20200504082003.16298-2-f4bug@amsat.org
Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
---
 hw/display/artist.c  | 2 +-
 hw/display/next-fb.c | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/hw/display/artist.c b/hw/display/artist.c
index 7e2a4556bd06..6261bfe65b72 100644
--- a/hw/display/artist.c
+++ b/hw/display/artist.c
@@ -21,7 +21,7 @@
 #include "migration/vmstate.h"
 #include "ui/console.h"
 #include "trace.h"
-#include "hw/display/framebuffer.h"
+#include "framebuffer.h"
 
 #define TYPE_ARTIST "artist"
 #define ARTIST(obj) OBJECT_CHECK(ARTISTState, (obj), TYPE_ARTIST)
diff --git a/hw/display/next-fb.c b/hw/display/next-fb.c
index 2b726a10f845..b0513a8fba62 100644
--- a/hw/display/next-fb.c
+++ b/hw/display/next-fb.c
@@ -27,7 +27,7 @@
 #include "hw/hw.h"
 #include "hw/boards.h"
 #include "hw/loader.h"
-#include "hw/display/framebuffer.h"
+#include "framebuffer.h"
 #include "ui/pixel_ops.h"
 #include "hw/m68k/next-cube.h"
 
-- 
2.18.4


