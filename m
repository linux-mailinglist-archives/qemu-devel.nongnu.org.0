Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CA4ED62586A
	for <lists+qemu-devel@lfdr.de>; Fri, 11 Nov 2022 11:33:01 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1otRJP-0007XE-D6; Fri, 11 Nov 2022 05:31:03 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1otRJJ-0007UB-Qw
 for qemu-devel@nongnu.org; Fri, 11 Nov 2022 05:30:57 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1otRJI-0000f6-81
 for qemu-devel@nongnu.org; Fri, 11 Nov 2022 05:30:57 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1668162655;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Cwe5B57sWClZbcai1js1rXky9401kBIE+zgEgWTZFcw=;
 b=d/1KZL75IoIddoaIcCysSjTRSeNDSeFFbFvYsRD2RvZzrjICKu1RYkwQtc3fzJ0fS0jI4E
 GT/+fkWzNH3tG99l4Hmd/eXBXlsER4VyooYcUbhY77MrAadOPYYZcWfskZ6Vq8QZzkGS3/
 wN89Nu8kFHpQu45WQOjLbwMU/9eROYg=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-251-YrGSbagSO8m9TKjx-dnMAA-1; Fri, 11 Nov 2022 05:30:54 -0500
X-MC-Unique: YrGSbagSO8m9TKjx-dnMAA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id CFBE785A5B6
 for <qemu-devel@nongnu.org>; Fri, 11 Nov 2022 10:30:53 +0000 (UTC)
Received: from thuth.com (dhcp-192-232.str.redhat.com [10.33.192.232])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 4D93B2023272;
 Fri, 11 Nov 2022 10:30:53 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: Stefan Hajnoczi <stefanha@redhat.com>,
	qemu-devel@nongnu.org
Cc: Miroslav Rezanina <mrezanin@redhat.com>
Subject: [PULL 4/8] host-libusb: Remove unused variable
Date: Fri, 11 Nov 2022 11:30:44 +0100
Message-Id: <20221111103048.202519-5-thuth@redhat.com>
In-Reply-To: <20221111103048.202519-1-thuth@redhat.com>
References: <20221111103048.202519-1-thuth@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.4
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Reviewed-by: Thomas Huth <thuth@redhat.com>
Message-Id: <00df0db69ff9167d38bac81f6d03281955bd861a.1668009030.git.mrezanin@redhat.com>
Signed-off-by: Thomas Huth <thuth@redhat.com>
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


