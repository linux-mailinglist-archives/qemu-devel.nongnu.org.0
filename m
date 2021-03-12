Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 99247338843
	for <lists+qemu-devel@lfdr.de>; Fri, 12 Mar 2021 10:07:49 +0100 (CET)
Received: from localhost ([::1]:46912 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lKdls-0006JN-L8
	for lists+qemu-devel@lfdr.de; Fri, 12 Mar 2021 04:07:48 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47598)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1lKdin-00038X-T8
 for qemu-devel@nongnu.org; Fri, 12 Mar 2021 04:04:37 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:37485)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1lKdik-0001iS-1G
 for qemu-devel@nongnu.org; Fri, 12 Mar 2021 04:04:37 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615539873;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=mS+qj9rimZOmI+snhJa4P8uGYw1ARWo2wfpkjqmmwhA=;
 b=Bn5nTEgatoUrW+Tx9pyIbodAdkW1oMgRZsqgnVbuiEv1pELGfEJamrJ0FdJ+Fkk4Yke46W
 5W0zJQDeJClInqjytqPe6NYxLiw2Skl+3H8kzjxORn99gM4zGlj60dajoXVo1Ilv27XF+E
 wXlfe7hJR0VMHW5MfONMAwBFjIVLQ7s=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-355-052s0-UTO8CmWarxe5koSQ-1; Fri, 12 Mar 2021 04:04:31 -0500
X-MC-Unique: 052s0-UTO8CmWarxe5koSQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7BB9718397A2
 for <qemu-devel@nongnu.org>; Fri, 12 Mar 2021 09:04:30 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-112-141.ams2.redhat.com
 [10.36.112.141])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id DBB2E694CD;
 Fri, 12 Mar 2021 09:04:26 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 63694180039E; Fri, 12 Mar 2021 10:04:25 +0100 (CET)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 4/4] usb/storage: add kconfig symbols
Date: Fri, 12 Mar 2021 10:04:25 +0100
Message-Id: <20210312090425.772900-5-kraxel@redhat.com>
In-Reply-To: <20210312090425.772900-1-kraxel@redhat.com>
References: <20210312090425.772900-1-kraxel@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.25,
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
Cc: Gerd Hoffmann <kraxel@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Add new kconfig symbols so usb-storage and usb-bot can
be enabled or disabled individually at build time.

Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
---
 hw/usb/Kconfig     | 13 ++++++++++++-
 hw/usb/meson.build |  4 ++--
 2 files changed, 14 insertions(+), 3 deletions(-)

diff --git a/hw/usb/Kconfig b/hw/usb/Kconfig
index 40093d7ea6bf..53f8283ffdc1 100644
--- a/hw/usb/Kconfig
+++ b/hw/usb/Kconfig
@@ -66,11 +66,22 @@ config USB_TABLET_WACOM
     default y
     depends on USB
 
+config USB_STORAGE_CORE
+    bool
+    depends on USB
+    select SCSI
+
+config USB_STORAGE_CLASSIC
+    bool
+    default y
+    depends on USB
+    select USB_STORAGE_CORE
+
 config USB_STORAGE_BOT
     bool
     default y
     depends on USB
-    select SCSI
+    select USB_STORAGE_CORE
 
 config USB_STORAGE_UAS
     bool
diff --git a/hw/usb/meson.build b/hw/usb/meson.build
index 7291021bf3b6..4c3228c4de23 100644
--- a/hw/usb/meson.build
+++ b/hw/usb/meson.build
@@ -39,9 +39,9 @@ specific_ss.add(when: 'CONFIG_XLNX_USB_SUBSYS', if_true: files('xlnx-usb-subsyst
 softmmu_ss.add(when: 'CONFIG_USB', if_true: files('dev-hub.c'))
 softmmu_ss.add(when: 'CONFIG_USB', if_true: files('dev-hid.c'))
 softmmu_ss.add(when: 'CONFIG_USB_TABLET_WACOM', if_true: files('dev-wacom.c'))
-softmmu_ss.add(when: 'CONFIG_USB_STORAGE_BOT', if_true: files('dev-storage.c'))
+softmmu_ss.add(when: 'CONFIG_USB_STORAGE_CORE', if_true: files('dev-storage.c'))
 softmmu_ss.add(when: 'CONFIG_USB_STORAGE_BOT', if_true: files('dev-storage-bot.c'))
-softmmu_ss.add(when: 'CONFIG_USB_STORAGE_BOT', if_true: files('dev-storage-classic.c'))
+softmmu_ss.add(when: 'CONFIG_USB_STORAGE_CLASSIC', if_true: files('dev-storage-classic.c'))
 softmmu_ss.add(when: 'CONFIG_USB_STORAGE_UAS', if_true: files('dev-uas.c'))
 softmmu_ss.add(when: 'CONFIG_USB_AUDIO', if_true: files('dev-audio.c'))
 softmmu_ss.add(when: 'CONFIG_USB_SERIAL', if_true: files('dev-serial.c'))
-- 
2.29.2


