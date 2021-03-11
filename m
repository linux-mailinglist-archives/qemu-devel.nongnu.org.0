Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A140E336EE4
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Mar 2021 10:31:03 +0100 (CET)
Received: from localhost ([::1]:46264 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lKHeo-0004yY-Jw
	for lists+qemu-devel@lfdr.de; Thu, 11 Mar 2021 04:31:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:54384)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1lKHcY-0003Ij-PC
 for qemu-devel@nongnu.org; Thu, 11 Mar 2021 04:28:42 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:50363)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1lKHcW-00060X-4w
 for qemu-devel@nongnu.org; Thu, 11 Mar 2021 04:28:41 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615454918;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=fa23qDEwmXsSX6yfRYssVCKS7s8Xcn4NLnmr57AjFJU=;
 b=B05i+/zJIuUm8mh0i3i4+EDwVS61gxiLrhzXHmmx/hHSOMy9901DDAYZ6m2Dtir/TJWlnW
 EsvFw3HP7qnb/4V3ZkOup6eYvjGPNsMe/o52eLcgbduvB4qT3wEnoc3z7dsfs59JVPkYb0
 dCvwPz59V//qOYlInUdOd6jBVTxQb+Y=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-277-5SfKT7q9MYS629QtAWPlDQ-1; Thu, 11 Mar 2021 04:28:36 -0500
X-MC-Unique: 5SfKT7q9MYS629QtAWPlDQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5AB24101F000
 for <qemu-devel@nongnu.org>; Thu, 11 Mar 2021 09:28:35 +0000 (UTC)
Received: from thuth.com (ovpn-112-33.ams2.redhat.com [10.36.112.33])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 6BACE5C1CF;
 Thu, 11 Mar 2021 09:28:31 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org,
	Gerd Hoffmann <kraxel@redhat.com>
Subject: [PATCH 5/4] usb: Remove "-usbdevice ccid"
Date: Thu, 11 Mar 2021 10:28:29 +0100
Message-Id: <20210311092829.1479051-1-thuth@redhat.com>
In-Reply-To: <20210310173323.1422754-1-thuth@redhat.com>
References: <20210310173323.1422754-1-thuth@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.243,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

"-usbdevice ccid" was not documented and -usbdevice itself was marked
as deprecated before QEMU v6.0. And searching for "-usbdevice ccid"
in the internet does not show any useful results, so likely nobody
was using the ccid device via the -usbdevice option. Remove it now.

Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 docs/system/removed-features.rst | 6 ++++++
 hw/usb/dev-smartcard-reader.c    | 1 -
 qemu-options.hx                  | 3 ---
 3 files changed, 6 insertions(+), 4 deletions(-)

diff --git a/docs/system/removed-features.rst b/docs/system/removed-features.rst
index ea28904e5f..335d8a5f2f 100644
--- a/docs/system/removed-features.rst
+++ b/docs/system/removed-features.rst
@@ -45,6 +45,12 @@ This option lacked the possibility to specify an audio backend device.
 Use ``-device usb-audio`` now instead (and specify a corresponding USB
 host controller or ``-usb`` if necessary).
 
+``-usbdevice ccid`` (removed in 6.0)
+'''''''''''''''''''''''''''''''''''''
+
+This option was undocumented and not used in the field.
+Use `-device usb-ccid`` instead.
+
 
 QEMU Machine Protocol (QMP) commands
 ------------------------------------
diff --git a/hw/usb/dev-smartcard-reader.c b/hw/usb/dev-smartcard-reader.c
index 80109fa551..bc3d94092a 100644
--- a/hw/usb/dev-smartcard-reader.c
+++ b/hw/usb/dev-smartcard-reader.c
@@ -1492,7 +1492,6 @@ static void ccid_register_types(void)
     type_register_static(&ccid_bus_info);
     type_register_static(&ccid_card_type_info);
     type_register_static(&ccid_info);
-    usb_legacy_register(TYPE_USB_CCID_DEV, "ccid", NULL);
 }
 
 type_init(ccid_register_types)
diff --git a/qemu-options.hx b/qemu-options.hx
index fdecee758a..8f4ede1e11 100644
--- a/qemu-options.hx
+++ b/qemu-options.hx
@@ -1743,9 +1743,6 @@ SRST
         corresponding ``braille`` chardev automatically beside the
         ``usb-braille`` USB device).
 
-    ``ccid``
-        Smartcard reader device
-
     ``keyboard``
         Standard USB keyboard. Will override the PS/2 keyboard (if present).
 
-- 
2.27.0


