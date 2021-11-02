Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 67427443321
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Nov 2021 17:38:15 +0100 (CET)
Received: from localhost ([::1]:55738 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mhwne-000091-H5
	for lists+qemu-devel@lfdr.de; Tue, 02 Nov 2021 12:38:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59822)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1mhwcf-0006Jx-Qm
 for qemu-devel@nongnu.org; Tue, 02 Nov 2021 12:26:54 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:51602)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1mhwcR-0002ak-Sj
 for qemu-devel@nongnu.org; Tue, 02 Nov 2021 12:26:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1635870399;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=PO+K1n8lNHJsRPOY2iY3bSK66+tYW/HTXAOPTrvGSKg=;
 b=dP86WOCFkzaXBNo2O7OxeJ3ZQcOYaw6R1CEKvH/PiUyiGblzAFPRLsLrS9XM2w0ug3J9QW
 86E8ulJlN68e/6qRvt8Y0+9cwR/93WnPRQYLO3T7FDI8QtzOrkCrvG9KzbwEoiZdjzPmZm
 VZSuAOB2/f6BUlY5YSFcAQEJpZ+dx6k=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-474-RxcfRHJAPpmrZje9EVSSng-1; Tue, 02 Nov 2021 12:26:38 -0400
X-MC-Unique: RxcfRHJAPpmrZje9EVSSng-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3E58C80668B;
 Tue,  2 Nov 2021 16:26:37 +0000 (UTC)
Received: from sirius.home.kraxel.org (unknown [10.39.194.99])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 804B95F4EB;
 Tue,  2 Nov 2021 16:26:36 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 0B8AC1801B3A; Tue,  2 Nov 2021 17:26:20 +0100 (CET)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 09/10] hw/misc: deprecate the 'sga' device
Date: Tue,  2 Nov 2021 17:26:18 +0100
Message-Id: <20211102162619.2760593-10-kraxel@redhat.com>
In-Reply-To: <20211102162619.2760593-1-kraxel@redhat.com>
References: <20211102162619.2760593-1-kraxel@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.702,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Sergio Lopez <slp@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, libvir-list@redhat.com,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Willian Rampazzo <willianr@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Daniel P. Berrangé <berrange@redhat.com>

This is obsolete since SeaBIOS 1.11.0 introduced native support for
sending messages to the serial console. The new support can be
activated using -machine graphics=off on x86 targets.

Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
Reviewed-by: Gerd Hoffmann <kraxel@redhat.com>
Message-Id: <20210909123219.862652-1-berrange@redhat.com>
Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
---
 hw/misc/sga.c             |  2 ++
 docs/about/deprecated.rst | 10 ++++++++++
 2 files changed, 12 insertions(+)

diff --git a/hw/misc/sga.c b/hw/misc/sga.c
index 4dbe6d78f9e5..1d04672b013b 100644
--- a/hw/misc/sga.c
+++ b/hw/misc/sga.c
@@ -30,6 +30,7 @@
 #include "hw/loader.h"
 #include "qemu/module.h"
 #include "qom/object.h"
+#include "qemu/error-report.h"
 
 #define SGABIOS_FILENAME "sgabios.bin"
 
@@ -42,6 +43,7 @@ struct ISASGAState {
 
 static void sga_realizefn(DeviceState *dev, Error **errp)
 {
+    warn_report("-device sga is deprecated, use -machine graphics=off");
     rom_add_vga(SGABIOS_FILENAME);
 }
 
diff --git a/docs/about/deprecated.rst b/docs/about/deprecated.rst
index be19317470a1..25b7ec8d92d9 100644
--- a/docs/about/deprecated.rst
+++ b/docs/about/deprecated.rst
@@ -313,6 +313,16 @@ full SCSI support.  Use virtio-scsi instead when SCSI passthrough is required.
 Note this also applies to ``-device virtio-blk-pci,scsi=on|off``, which is an
 alias.
 
+``-device sga`` (since 6.2)
+^^^^^^^^^^^^^^^^^^^^^^^^^^^
+
+The ``sga`` device loads an option ROM for x86 targets which enables
+SeaBIOS to send messages to the serial console. SeaBIOS 1.11.0 onwards
+contains native support for this feature and thus use of the option
+ROM approach is obsolete. The native SeaBIOS support can be activated
+by using ``-machine graphics=off``.
+
+
 Block device options
 ''''''''''''''''''''
 
-- 
2.31.1


