Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C21D2622F85
	for <lists+qemu-devel@lfdr.de>; Wed,  9 Nov 2022 16:58:42 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1osnSS-0001qM-Dt; Wed, 09 Nov 2022 10:57:44 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mrezanin@redhat.com>)
 id 1osnSA-0001cv-Uf
 for qemu-devel@nongnu.org; Wed, 09 Nov 2022 10:57:28 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mrezanin@redhat.com>)
 id 1osnS8-0005ob-EC
 for qemu-devel@nongnu.org; Wed, 09 Nov 2022 10:57:26 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1668009442;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=kdqvurnWAXVDsjl6mVesUOVqmPHheeOSHJAfsJCbOyU=;
 b=fmfsFSSVjpkgTXepv1rLE/dKIxyD0SJxq4BPPio+rFse4lGAcL/p5fOkZA5kdy7ngCB17s
 rn83ejcq7JuEYv9nX3QLImasJHji34xf9p7VQBIOKuLBv2IB0khd/JrhjqzHQIADgaQyxI
 Zo34vfrQpU8X5p5M6F0qzCzMkI0zt6o=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-553-qt9jf7c4PImCsh-VGGsTlw-1; Wed, 09 Nov 2022 10:57:20 -0500
X-MC-Unique: qt9jf7c4PImCsh-VGGsTlw-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 1B640101E157
 for <qemu-devel@nongnu.org>; Wed,  9 Nov 2022 15:57:20 +0000 (UTC)
Received: from wi2021.rezanina.moe.rezanina.moe (ovpn-193-213.brq.redhat.com
 [10.40.193.213])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 6635440C83BA;
 Wed,  9 Nov 2022 15:57:19 +0000 (UTC)
From: mrezanin@redhat.com
To: qemu-devel@nongnu.org
Cc: Miroslav Rezanina <mrezanin@redhat.com>
Subject: [PATCH 4/4] host-libusb: Remove unused variable
Date: Wed,  9 Nov 2022 10:57:14 -0500
Message-Id: <00df0db69ff9167d38bac81f6d03281955bd861a.1668009030.git.mrezanin@redhat.com>
In-Reply-To: <cover.1668009030.git.mrezanin@redhat.com>
References: <cover.1668009030.git.mrezanin@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.1
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mrezanin@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

From: Miroslav Rezanina <mrezanin@redhat.com>

Variable unconnected used in usb_host_auto_check function is only incremented
but never read as line where it is read was disabled since introducing the code.
This causes 'Unused but set variable' warning on Clang 15.0.1 compiler.

Removing the variable and disabled code to prevent the warning.

Signed-off-by: Miroslav Rezanina <mrezanin@redhat.com>
---
 hw/usb/host-libusb.c | 15 ---------------
 1 file changed, 15 deletions(-)

diff --git a/hw/usb/host-libusb.c b/hw/usb/host-libusb.c
index 28f8af8941..176868d345 100644
--- a/hw/usb/host-libusb.c
+++ b/hw/usb/host-libusb.c
@@ -1837,7 +1837,6 @@ static void usb_host_auto_check(void *unused)
     struct USBAutoFilter *f;
     libusb_device **devs = NULL;
     struct libusb_device_descriptor ddesc;
-    int unconnected = 0;
     int i, n;
 
     if (usb_host_init() != 0) {
@@ -1897,9 +1896,6 @@ static void usb_host_auto_check(void *unused)
         libusb_free_device_list(devs, 1);
 
         QTAILQ_FOREACH(s, &hostdevs, next) {
-            if (s->dh == NULL) {
-                unconnected++;
-            }
             if (s->seen == 0) {
                 if (s->dh) {
                     usb_host_close(s);
@@ -1908,17 +1904,6 @@ static void usb_host_auto_check(void *unused)
             }
             s->seen = 0;
         }
-
-#if 0
-        if (unconnected == 0) {
-            /* nothing to watch */
-            if (usb_auto_timer) {
-                timer_del(usb_auto_timer);
-                trace_usb_host_auto_scan_disabled();
-            }
-            return;
-        }
-#endif
     }
 
     if (!usb_vmstate) {
-- 
2.31.1


