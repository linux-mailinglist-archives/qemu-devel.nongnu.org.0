Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 020B14CD6CC
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Mar 2022 15:53:32 +0100 (CET)
Received: from localhost ([::1]:39372 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nQ9JC-0001d1-QP
	for lists+qemu-devel@lfdr.de; Fri, 04 Mar 2022 09:53:30 -0500
Received: from eggs.gnu.org ([209.51.188.92]:38138)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1nQ8oe-0007pW-6K
 for qemu-devel@nongnu.org; Fri, 04 Mar 2022 09:21:56 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:43531)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1nQ8oa-00008c-Lb
 for qemu-devel@nongnu.org; Fri, 04 Mar 2022 09:21:54 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1646403712;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=PC/TnAgEtZW+A9j9gQ4ee9w9hCyjPbjZ3C8l7vcAV7A=;
 b=S1EgejLnVDC2a4RX7zvLLKVGxKvoMRA4mNqsAJJO3lr/COKNl1nJUjwHKcn7guRrGu99Mp
 sfjez0H8xKnX6ien4+RlJlZ66U210I0RWCBdxyBQl7Fs14Utk7+NiTPxaKf4mNbH0XULk0
 XSbZN23dFW3XeFNQfWtGGa/lm9KKxAs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-331-nhZ3vlirNZyIN2bziaR5Uw-1; Fri, 04 Mar 2022 09:21:49 -0500
X-MC-Unique: nhZ3vlirNZyIN2bziaR5Uw-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 592CCFC80;
 Fri,  4 Mar 2022 14:21:47 +0000 (UTC)
Received: from sirius.home.kraxel.org (unknown [10.39.192.99])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 50F807DE5E;
 Fri,  4 Mar 2022 14:21:46 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id E1A4C1800394; Fri,  4 Mar 2022 15:21:23 +0100 (CET)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 02/35] hw/usb/dev-mtp: create directories with a+x mode mask
Date: Fri,  4 Mar 2022 15:20:50 +0100
Message-Id: <20220304142123.956171-3-kraxel@redhat.com>
In-Reply-To: <20220304142123.956171-1-kraxel@redhat.com>
References: <20220304142123.956171-1-kraxel@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: Eduardo Habkost <eduardo@habkost.net>,
 Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Akihiko Odaki <akihiko.odaki@gmail.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Thomas Huth <huth@tuxfamily.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Volker=20R=C3=BCmelin?= <vr_qemu@t-online.de>,
 Christian Schoenebeck <qemu_oss@crudebyte.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Gerd Hoffmann <kraxel@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Volker Rümelin <vr_qemu@t-online.de>

Current code creates directories with mode 0644. Even the creator
can't create files in the new directory. Set all x mode flags in
variable mask and clear all x mode flags in function open() to
preserve the current open mode.

Signed-off-by: Volker Rümelin <vr_qemu@t-online.de>
Message-Id: <20220122140619.7514-1-vr_qemu@t-online.de>
Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
---
 hw/usb/dev-mtp.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/hw/usb/dev-mtp.c b/hw/usb/dev-mtp.c
index 1e6ac76bef9b..e6b77a2a941d 100644
--- a/hw/usb/dev-mtp.c
+++ b/hw/usb/dev-mtp.c
@@ -1607,7 +1607,7 @@ static void usb_mtp_write_data(MTPState *s, uint32_t handle)
         usb_mtp_object_lookup(s, s->dataset.parent_handle);
     char *path = NULL;
     uint64_t rc;
-    mode_t mask = 0644;
+    mode_t mask = 0755;
     int ret = 0;
 
     assert(d != NULL);
@@ -1635,7 +1635,7 @@ static void usb_mtp_write_data(MTPState *s, uint32_t handle)
             }
 
             d->fd = open(path, O_CREAT | O_WRONLY |
-                         O_CLOEXEC | O_NOFOLLOW, mask);
+                         O_CLOEXEC | O_NOFOLLOW, mask & 0666);
             if (d->fd == -1) {
                 ret = 1;
                 goto done;
-- 
2.35.1


