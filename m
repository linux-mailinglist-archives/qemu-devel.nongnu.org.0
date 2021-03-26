Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C35C634A795
	for <lists+qemu-devel@lfdr.de>; Fri, 26 Mar 2021 13:54:49 +0100 (CET)
Received: from localhost ([::1]:50400 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lPlzE-0001e3-PQ
	for lists+qemu-devel@lfdr.de; Fri, 26 Mar 2021 08:54:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58844)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1lPluW-0005CQ-3A
 for qemu-devel@nongnu.org; Fri, 26 Mar 2021 08:49:56 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:33263)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1lPluU-0003js-Cl
 for qemu-devel@nongnu.org; Fri, 26 Mar 2021 08:49:55 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1616762993;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=dQ+ENtLzktKZBnlnyipjl8d2V9gsFQP9rm1k+LUM2R0=;
 b=iT2ZBRfl0fp13AP3ShLc+5QtU2rRxJJqaByuLpghhXJEAFNkk8b/mNIVShDCFgJyEuaFza
 6+1K8uHlY/fOrJqQc+5uYq7GcXJOkJvP4vr3XnyjNY8qLlx28B5cd+8WJL3drbLHwz6XXe
 u5cZLVUkWRC4poFwv8khzVbX4RC88NI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-419-Gxk8on3zMSK-UnMsotFhbQ-1; Fri, 26 Mar 2021 08:49:49 -0400
X-MC-Unique: Gxk8on3zMSK-UnMsotFhbQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5152683DD53;
 Fri, 26 Mar 2021 12:49:48 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-112-102.ams2.redhat.com
 [10.36.112.102])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 8FCA267CC4;
 Fri, 26 Mar 2021 12:49:34 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id ACFE01800386; Fri, 26 Mar 2021 13:49:32 +0100 (CET)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 1/9] usb: Remove "-usbdevice ccid"
Date: Fri, 26 Mar 2021 13:49:24 +0100
Message-Id: <20210326124932.481942-2-kraxel@redhat.com>
In-Reply-To: <20210326124932.481942-1-kraxel@redhat.com>
References: <20210326124932.481942-1-kraxel@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Thomas Huth <thuth@redhat.com>, David Hildenbrand <david@redhat.com>,
 Cornelia Huck <cohuck@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>, qemu-s390x@nongnu.org,
 "Michael S. Tsirkin" <mst@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Thomas Huth <thuth@redhat.com>

"-usbdevice ccid" was not documented and -usbdevice itself was marked
as deprecated before QEMU v6.0. And searching for "-usbdevice ccid"
in the internet does not show any useful results, so likely nobody
was using the ccid device via the -usbdevice option. Remove it now.

Signed-off-by: Thomas Huth <thuth@redhat.com>
Message-Id: <20210311092829.1479051-1-thuth@redhat.com>
Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
---
 hw/usb/dev-smartcard-reader.c    | 1 -
 docs/system/removed-features.rst | 6 ++++++
 qemu-options.hx                  | 3 ---
 3 files changed, 6 insertions(+), 4 deletions(-)

diff --git a/hw/usb/dev-smartcard-reader.c b/hw/usb/dev-smartcard-reader.c
index 80109fa55168..bc3d94092a23 100644
--- a/hw/usb/dev-smartcard-reader.c
+++ b/hw/usb/dev-smartcard-reader.c
@@ -1492,7 +1492,6 @@ static void ccid_register_types(void)
     type_register_static(&ccid_bus_info);
     type_register_static(&ccid_card_type_info);
     type_register_static(&ccid_info);
-    usb_legacy_register(TYPE_USB_CCID_DEV, "ccid", NULL);
 }
 
 type_init(ccid_register_types)
diff --git a/docs/system/removed-features.rst b/docs/system/removed-features.rst
index f28387f183cc..29e90601a51a 100644
--- a/docs/system/removed-features.rst
+++ b/docs/system/removed-features.rst
@@ -120,6 +120,12 @@ Drives with interface types other than ``if=none`` are for onboard
 devices.  Drives the board doesn't pick up can no longer be used with
 -device.  Use ``if=none`` instead.
 
+``-usbdevice ccid`` (removed in 6.0)
+'''''''''''''''''''''''''''''''''''''
+
+This option was undocumented and not used in the field.
+Use `-device usb-ccid`` instead.
+
 
 QEMU Machine Protocol (QMP) commands
 ------------------------------------
diff --git a/qemu-options.hx b/qemu-options.hx
index d60a03d3a973..fd21002bd61d 100644
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
2.30.2


