Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 24B821D540E
	for <lists+qemu-devel@lfdr.de>; Fri, 15 May 2020 17:17:25 +0200 (CEST)
Received: from localhost ([::1]:54638 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jZc5U-0006o0-5r
	for lists+qemu-devel@lfdr.de; Fri, 15 May 2020 11:17:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48566)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1jZbtI-0001Bi-Id
 for qemu-devel@nongnu.org; Fri, 15 May 2020 11:04:48 -0400
Received: from us-smtp-1.mimecast.com ([207.211.31.81]:57640
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1jZbtF-0001CG-Qx
 for qemu-devel@nongnu.org; Fri, 15 May 2020 11:04:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1589555085;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=IFlya5bn1MZgKV5cDgqIH5p13gjmZo586pTVIFP1Ois=;
 b=M+yCutsOy6zGJ7XT1kh56vamLACSYzLgWsINV3N2NgtnpZCAPXmXy9PigwLPPJlfG9nsBL
 ENyWb+KMie+vBwyMtE/SBV2tZyopQlbwTQlHIeSKjMXCHypbTOT0dC5ynRFck3KxpNiPgp
 ZUamMspWLdQTOik7sWAzmk/U/fnz99o=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-351-Mq1JXUonOquGuyR5nf1jSg-1; Fri, 15 May 2020 11:04:41 -0400
X-MC-Unique: Mq1JXUonOquGuyR5nf1jSg-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 073B7835B40;
 Fri, 15 May 2020 15:04:40 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-115-145.ams2.redhat.com
 [10.36.115.145])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 13DE66FDD1;
 Fri, 15 May 2020 15:04:32 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id EFCC19D61; Fri, 15 May 2020 17:04:21 +0200 (CEST)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v6 09/16] floppy: make isa_fdc_get_drive_max_chs static
Date: Fri, 15 May 2020 17:04:14 +0200
Message-Id: <20200515150421.25479-10-kraxel@redhat.com>
In-Reply-To: <20200515150421.25479-1-kraxel@redhat.com>
References: <20200515150421.25479-1-kraxel@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=207.211.31.81; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/05/15 00:39:12
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
Cc: Laurent Vivier <lvivier@redhat.com>, Kevin Wolf <kwolf@redhat.com>,
 Thomas Huth <thuth@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
 qemu-block@nongnu.org, "Michael S. Tsirkin" <mst@redhat.com>,
 Max Reitz <mreitz@redhat.com>, Igor Mammedov <imammedo@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 John Snow <jsnow@redhat.com>, Richard Henderson <rth@twiddle.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

acpi aml generator needs this, but it is in floppy code now
so we can make the function static.

Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
Reviewed-by: Igor Mammedov <imammedo@redhat.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Acked-by: John Snow <jsnow@redhat.com>
---
 include/hw/block/fdc.h | 2 --
 hw/block/fdc.c         | 4 ++--
 2 files changed, 2 insertions(+), 4 deletions(-)

diff --git a/include/hw/block/fdc.h b/include/hw/block/fdc.h
index c15ff4c62315..5d71cf972268 100644
--- a/include/hw/block/fdc.h
+++ b/include/hw/block/fdc.h
@@ -16,7 +16,5 @@ void sun4m_fdctrl_init(qemu_irq irq, hwaddr io_base,
                        DriveInfo **fds, qemu_irq *fdc_tc);
 
 FloppyDriveType isa_fdc_get_drive_type(ISADevice *fdc, int i);
-void isa_fdc_get_drive_max_chs(FloppyDriveType type,
-                               uint8_t *maxc, uint8_t *maxh, uint8_t *maxs);
 
 #endif
diff --git a/hw/block/fdc.c b/hw/block/fdc.c
index b4d2eaf66dcd..8024c822cea3 100644
--- a/hw/block/fdc.c
+++ b/hw/block/fdc.c
@@ -2744,8 +2744,8 @@ FloppyDriveType isa_fdc_get_drive_type(ISADevice *fdc, int i)
     return isa->state.drives[i].drive;
 }
 
-void isa_fdc_get_drive_max_chs(FloppyDriveType type,
-                               uint8_t *maxc, uint8_t *maxh, uint8_t *maxs)
+static void isa_fdc_get_drive_max_chs(FloppyDriveType type, uint8_t *maxc,
+                                      uint8_t *maxh, uint8_t *maxs)
 {
     const FDFormat *fdf;
 
-- 
2.18.4


