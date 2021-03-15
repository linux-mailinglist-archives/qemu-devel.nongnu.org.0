Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 567CE33C58E
	for <lists+qemu-devel@lfdr.de>; Mon, 15 Mar 2021 19:27:09 +0100 (CET)
Received: from localhost ([::1]:49494 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lLrvo-0004ie-7A
	for lists+qemu-devel@lfdr.de; Mon, 15 Mar 2021 14:27:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35030)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1lLrYZ-0002G8-Au
 for qemu-devel@nongnu.org; Mon, 15 Mar 2021 14:03:07 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:59753)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1lLrYX-0000ak-8c
 for qemu-devel@nongnu.org; Mon, 15 Mar 2021 14:03:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615831384;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=NnYj+Ud94yZuYTKYu1oplzmvSJIFCNsTmjib9Tj3UNM=;
 b=FgH1UCaroNBSDIuLksHu/IRVxF9hBZWbvoiEne4CByeggNXDYyVP0+h1T+cVy0LSRXPI8C
 UUb6hmLFYBpisYvKCThnOYYlG+D6zXPCgM4tizwf9kY8PkYMYY9q4YnSG7wz2fS2PuG2XP
 oLk8C6RpLdS9tp7twb122xHNF3fwi3U=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-312-tbov__GHNvW6X4thpP4aGQ-1; Mon, 15 Mar 2021 14:02:59 -0400
X-MC-Unique: tbov__GHNvW6X4thpP4aGQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A0AD718460E8;
 Mon, 15 Mar 2021 18:02:57 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-112-141.ams2.redhat.com
 [10.36.112.141])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id F0FB45D75A;
 Mon, 15 Mar 2021 18:02:50 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id A4EB31800842; Mon, 15 Mar 2021 19:02:41 +0100 (CET)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 12/13] usb/storage: add kconfig symbols
Date: Mon, 15 Mar 2021 19:02:39 +0100
Message-Id: <20210315180240.1597240-13-kraxel@redhat.com>
In-Reply-To: <20210315180240.1597240-1-kraxel@redhat.com>
References: <20210315180240.1597240-1-kraxel@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=63.128.21.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.25,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: libvir-list@redhat.com, Huacai Chen <chenhuacai@kernel.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Gerd Hoffmann <kraxel@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Samuel Thibault <samuel.thibault@ens-lyon.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Add new kconfig symbols so usb-storage and usb-bot can
be enabled or disabled individually at build time.

Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
Message-Id: <20210312090425.772900-5-kraxel@redhat.com>
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
index 9e4da68e3b6c..fb7a74e73ae8 100644
--- a/hw/usb/meson.build
+++ b/hw/usb/meson.build
@@ -40,9 +40,9 @@ specific_ss.add(when: 'CONFIG_XLNX_USB_SUBSYS', if_true: files('xlnx-usb-subsyst
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


