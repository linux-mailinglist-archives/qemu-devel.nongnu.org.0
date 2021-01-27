Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 025D8305912
	for <lists+qemu-devel@lfdr.de>; Wed, 27 Jan 2021 12:03:14 +0100 (CET)
Received: from localhost ([::1]:51708 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l4ibR-0005nI-0V
	for lists+qemu-devel@lfdr.de; Wed, 27 Jan 2021 06:03:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42774)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1l4iZi-0004w2-9A
 for qemu-devel@nongnu.org; Wed, 27 Jan 2021 06:01:26 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:46658)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1l4iZe-000636-Nl
 for qemu-devel@nongnu.org; Wed, 27 Jan 2021 06:01:26 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1611745281;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=dg3lPtAIr14K/zqGaS95xx8Dt+ABTx/f8jFA9Ee42ns=;
 b=fNEvmttg96QJ+tkIyFLhwS2SdvvIw1//q55PxcsjUCOFVprpI1nw567XkLYvW828S7oh8b
 /u/cvFzE6fNxgv4rwycD/gbChGRcvl2uQ8lkJIsItCBMB8NsIVEWMEqRrmYgdym/Pxi789
 r/V7XURs7B4J6y000Iyx+F4QluY0Gbo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-173-ikopAFnTNACwFUZQkoGobQ-1; Wed, 27 Jan 2021 06:01:19 -0500
X-MC-Unique: ikopAFnTNACwFUZQkoGobQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 19D0A180E46C;
 Wed, 27 Jan 2021 11:01:18 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-113-27.ams2.redhat.com
 [10.36.113.27])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id E30765D9C6;
 Wed, 27 Jan 2021 11:01:14 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 272EC180039D; Wed, 27 Jan 2021 12:01:13 +0100 (CET)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 3/3] hw/display/vmware_vga: Remove dependency on VNC header
Date: Wed, 27 Jan 2021 12:01:12 +0100
Message-Id: <20210127110113.2111855-4-kraxel@redhat.com>
In-Reply-To: <20210127110113.2111855-1-kraxel@redhat.com>
References: <20210127110113.2111855-1-kraxel@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.255,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Gerd Hoffmann <kraxel@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Peter Maydell <peter.maydell@linaro.org>

In commit 2f487a3d40faff1 we fixed a problem observed with using the
vmware-vga device and the VNC UI frontend in a belt-and-braces
manner:
 * we made the VNC frontend handle non-multiple-of-16 surface widths
 * we rounded up the vmware-vga display width to a multiple of 16

However this introduced a spurious dependency of a device model on a
UI frontend header.  vmware-vga isn't special and should not care
about what UI frontend it is using, and the VNC frontend needs to
handle arbitrary surface widths because other display device models
could use them.  Moreover, even if the maximum width in vmware-vga is
made a multiple of 16, the guest itself can always program a
different width.

Remove the dependency on the VNC header.  Since we have been using
the rounded-up width value since 2014, stick with it rather than
introducing a behaviour change, but don't calculate it by rounding up
to VNC_DIRTY_BITS_PER_PIXEL any more.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Message-Id: <20210112161608.16055-1-peter.maydell@linaro.org>
Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
---
 hw/display/vmware_vga.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/hw/display/vmware_vga.c b/hw/display/vmware_vga.c
index bef0d7d69a79..e2969a6c81c8 100644
--- a/hw/display/vmware_vga.c
+++ b/hw/display/vmware_vga.c
@@ -29,7 +29,6 @@
 #include "qemu/log.h"
 #include "hw/loader.h"
 #include "trace.h"
-#include "ui/vnc.h"
 #include "hw/pci/pci.h"
 #include "hw/qdev-properties.h"
 #include "migration/vmstate.h"
@@ -220,7 +219,7 @@ enum {
 
 /* These values can probably be changed arbitrarily.  */
 #define SVGA_SCRATCH_SIZE               0x8000
-#define SVGA_MAX_WIDTH                  ROUND_UP(2360, VNC_DIRTY_PIXELS_PER_BIT)
+#define SVGA_MAX_WIDTH                  2368
 #define SVGA_MAX_HEIGHT                 1770
 
 #ifdef VERBOSE
-- 
2.29.2


