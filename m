Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BBF2C40503A
	for <lists+qemu-devel@lfdr.de>; Thu,  9 Sep 2021 14:34:23 +0200 (CEST)
Received: from localhost ([::1]:55546 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mOJG2-0004cM-K8
	for lists+qemu-devel@lfdr.de; Thu, 09 Sep 2021 08:34:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55452)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1mOJEL-0003Xc-Hs
 for qemu-devel@nongnu.org; Thu, 09 Sep 2021 08:32:37 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:54551)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1mOJEI-0006zU-8Q
 for qemu-devel@nongnu.org; Thu, 09 Sep 2021 08:32:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1631190752;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=Vy+b74M0wvfr3jeTiNLCn6CbWgryAIcZNYbzzajYQQw=;
 b=BikHPRxLbT//4ZyNiJHCivuCPnnQmcYXKuGmmB4Egmo/EuAQwv8PorbWB1KSYSM5D2EoqD
 MwG5n6Vn8CrsZ+NI09ybh84yrGPygoCRAHwWQKEXTzQ4hYEFHIgMYSqCUaTFPkTfe9oaQl
 e4tAhgXEl4HCUKCXx/uccYlBmMg7r6o=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-250-7vvABU4hOXq1dnfQwwBasg-1; Thu, 09 Sep 2021 08:32:31 -0400
X-MC-Unique: 7vvABU4hOXq1dnfQwwBasg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C6FAA101AFBA;
 Thu,  9 Sep 2021 12:32:30 +0000 (UTC)
Received: from localhost.localdomain.com (unknown [10.39.195.19])
 by smtp.corp.redhat.com (Postfix) with ESMTP id CAE9060C04;
 Thu,  9 Sep 2021 12:32:20 +0000 (UTC)
From: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH] hw/misc: deprecate the 'sga' device
Date: Thu,  9 Sep 2021 13:32:19 +0100
Message-Id: <20210909123219.862652-1-berrange@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.393,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: libvir-list@redhat.com,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This is obsolete since SeaBIOS 1.11.0 introduced native support for
sending messages to the serial console. The new support can be
activated using -machine graphics=off on x86 targets.

Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
---
 docs/about/deprecated.rst | 10 ++++++++++
 hw/misc/sga.c             |  2 ++
 2 files changed, 12 insertions(+)

diff --git a/docs/about/deprecated.rst b/docs/about/deprecated.rst
index 9ee355ec0b..cafca05826 100644
--- a/docs/about/deprecated.rst
+++ b/docs/about/deprecated.rst
@@ -280,6 +280,16 @@ full SCSI support.  Use virtio-scsi instead when SCSI passthrough is required.
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
 
diff --git a/hw/misc/sga.c b/hw/misc/sga.c
index 4dbe6d78f9..1d04672b01 100644
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
 
-- 
2.31.1


