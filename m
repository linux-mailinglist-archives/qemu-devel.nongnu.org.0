Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E3561D7C82
	for <lists+qemu-devel@lfdr.de>; Mon, 18 May 2020 17:14:54 +0200 (CEST)
Received: from localhost ([::1]:37730 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jahTh-0001QF-Ba
	for lists+qemu-devel@lfdr.de; Mon, 18 May 2020 11:14:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47626)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1jahS2-0008CU-Ot
 for qemu-devel@nongnu.org; Mon, 18 May 2020 11:13:10 -0400
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:60098
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1jahS0-0005wu-UE
 for qemu-devel@nongnu.org; Mon, 18 May 2020 11:13:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1589814787;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=6eB67NrJRwks3wq3b/evsRLH9VPaAsga7aoULUOuONk=;
 b=I1kflOlFop78GpnCY+bTKSHU+whzNTZbJlWsi0o4gv7luGPdTbKtErSuq4mANAK/0DfoK+
 N4oLl9QHQ1zI2sSKuIuE6ASMMZsD5PA1TLkPjioIzUA2zbifp0hQUtcz3ZWym/Zx8QIuA8
 2cJI1QO/bTuawBzCyZaDqwLq3Uj5eXE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-472-eawVyf9aNSS3M37YpZb-rg-1; Mon, 18 May 2020 11:13:05 -0400
X-MC-Unique: eawVyf9aNSS3M37YpZb-rg-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 635931054F92;
 Mon, 18 May 2020 15:13:04 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-113-50.ams2.redhat.com
 [10.36.113.50])
 by smtp.corp.redhat.com (Postfix) with ESMTP id AE4F55C1B5;
 Mon, 18 May 2020 15:13:03 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id ADC3D9DAE; Mon, 18 May 2020 17:12:55 +0200 (CEST)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 5/8] ramfb: drop leftover debug message
Date: Mon, 18 May 2020 17:12:52 +0200
Message-Id: <20200518151255.10785-6-kraxel@redhat.com>
In-Reply-To: <20200518151255.10785-1-kraxel@redhat.com>
References: <20200518151255.10785-1-kraxel@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
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
Cc: Thomas Huth <huth@tuxfamily.org>, Paolo Bonzini <pbonzini@redhat.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Reviewed-by: Laszlo Ersek <lersek@redhat.com>
Message-id: 20200429115236.28709-4-kraxel@redhat.com
---
 hw/display/ramfb.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/hw/display/ramfb.c b/hw/display/ramfb.c
index 9d41c2ad2868..228defee5683 100644
--- a/hw/display/ramfb.c
+++ b/hw/display/ramfb.c
@@ -81,8 +81,6 @@ static void ramfb_fw_cfg_write(void *dev, off_t offset, size_t len)
     addr      = be64_to_cpu(s->cfg.addr);
     format    = qemu_drm_format_to_pixman(fourcc);
 
-    fprintf(stderr, "%s: %dx%d @ 0x%" PRIx64 "\n", __func__,
-            s->width, s->height, addr);
     s->ds = ramfb_create_display_surface(s->width, s->height,
                                          format, stride, addr);
 }
-- 
2.18.4


