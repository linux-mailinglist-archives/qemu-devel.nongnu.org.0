Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F686334639
	for <lists+qemu-devel@lfdr.de>; Wed, 10 Mar 2021 19:03:06 +0100 (CET)
Received: from localhost ([::1]:45860 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lK3An-0002gX-7O
	for lists+qemu-devel@lfdr.de; Wed, 10 Mar 2021 13:03:05 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41998)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1lK2iT-0007t3-5J
 for qemu-devel@nongnu.org; Wed, 10 Mar 2021 12:33:49 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:57888)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1lK2iQ-0006zL-VF
 for qemu-devel@nongnu.org; Wed, 10 Mar 2021 12:33:48 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615397626;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=u0+0p19CyzcR+EsdhHrWNL5MsuN+w8ymfYKQkIFx70g=;
 b=EZE30Ui2ntjmCpSb5mVeWDjTpeqYytxBbLBBQtZyE68t716sZrtyuYjIdCjpFx5uByY+Xx
 EDnLst0opDcNxBQ+ssbUwWhs6D6cviFKGQa/YVGWmntEcxMnXOU7/jqVpYEX4QHyWHQc5O
 BA1ReSSTs/7C1cr4nOTKYFy0zAveoVY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-550-73ODmyEIOfWtwzXKvYDeIw-1; Wed, 10 Mar 2021 12:33:44 -0500
X-MC-Unique: 73ODmyEIOfWtwzXKvYDeIw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3CBEE1966320;
 Wed, 10 Mar 2021 17:33:43 +0000 (UTC)
Received: from thuth.com (ovpn-112-19.ams2.redhat.com [10.36.112.19])
 by smtp.corp.redhat.com (Postfix) with ESMTP id B44EF60C13;
 Wed, 10 Mar 2021 17:33:41 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org,
	Gerd Hoffmann <kraxel@redhat.com>
Subject: [PATCH 4/4] usb: Document the missing -usbdevice options
Date: Wed, 10 Mar 2021 18:33:23 +0100
Message-Id: <20210310173323.1422754-5-thuth@redhat.com>
In-Reply-To: <20210310173323.1422754-1-thuth@redhat.com>
References: <20210310173323.1422754-1-thuth@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=63.128.21.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.243,
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Markus Armbruster <armbru@redhat.com>,
 Samuel Thibault <samuel.thibault@ens-lyon.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

There are some more -usbdevice options that have never been mentioned
in the documentation. Now that we removed -usbdevice from the list
of deprecated features again, we should document them properly.

While we're at it, also sort them alphabetically.

Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 qemu-options.hx | 35 +++++++++++++++++++++++++++++------
 1 file changed, 29 insertions(+), 6 deletions(-)

diff --git a/qemu-options.hx b/qemu-options.hx
index 90801286c6..fdecee758a 100644
--- a/qemu-options.hx
+++ b/qemu-options.hx
@@ -1705,7 +1705,7 @@ ERST
 
 DEFHEADING()
 
-DEFHEADING(USB options:)
+DEFHEADING(USB convenience options:)
 
 DEF("usb", 0, QEMU_OPTION_usb,
     "-usb            enable on-board USB host controller (if not enabled by default)\n",
@@ -1723,9 +1723,31 @@ DEF("usbdevice", HAS_ARG, QEMU_OPTION_usbdevice,
     QEMU_ARCH_ALL)
 SRST
 ``-usbdevice devname``
-    Add the USB device devname. Note that this option is deprecated,
-    please use ``-device usb-...`` instead. See the chapter about
+    Add the USB device devname, and enable an on-board USB controller
+    if possible and necessary (just like it can be done via
+    ``-machine usb=on``). Note that this option is mainly intended for
+    the user's convenience only. More fine-grained control can be
+    achieved by selecting a USB host controller (if necessary) and the
+    desired USB device via the ``-device`` option instead. For example,
+    instead of using ``-usbdevice mouse`` it is possible to use
+    ``-device qemu-xhci -device usb-mouse`` to connect the USB mouse
+    to a USB 3.0 controller instead (at least on machines that support
+    PCI and do not have an USB controller enabled by default yet).
+    For more details, see the chapter about
     :ref:`Connecting USB devices` in the System Emulation Users Guide.
+    Possible devices for devname are:
+
+    ``braille``
+        Braille device. This will use BrlAPI to display the braille
+        output on a real or fake device (i.e. it also creates a
+        corresponding ``braille`` chardev automatically beside the
+        ``usb-braille`` USB device).
+
+    ``ccid``
+        Smartcard reader device
+
+    ``keyboard``
+        Standard USB keyboard. Will override the PS/2 keyboard (if present).
 
     ``mouse``
         Virtual Mouse. This will override the PS/2 mouse emulation when
@@ -1737,9 +1759,10 @@ SRST
         position without having to grab the mouse. Also overrides the
         PS/2 mouse emulation when activated.
 
-    ``braille``
-        Braille device. This will use BrlAPI to display the braille
-        output on a real or fake device.
+    ``wacom-tablet``
+        Wacom PenPartner USB tablet.
+
+
 ERST
 
 DEFHEADING()
-- 
2.27.0


