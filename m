Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 203023F8F7B
	for <lists+qemu-devel@lfdr.de>; Thu, 26 Aug 2021 22:09:04 +0200 (CEST)
Received: from localhost ([::1]:34962 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mJLgM-00007W-HR
	for lists+qemu-devel@lfdr.de; Thu, 26 Aug 2021 16:09:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52114)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mJLey-0005xv-Q8
 for qemu-devel@nongnu.org; Thu, 26 Aug 2021 16:07:36 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:31502)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mJLew-0005gV-T6
 for qemu-devel@nongnu.org; Thu, 26 Aug 2021 16:07:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1630008454;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=8ZLosj281VIPcnVVY5MWZocWOZi5mT78NAOIuJQf3M8=;
 b=PiHdk1IU4lg1cBiCRgt2BZhKoPUcmYTAvus2Jm/SOvNJatWSujXRWEmdq67aZKLLgGrM8a
 uz+Uyk6fjHy7c6jYgbbGE8IhDBEYY1rQ86t5HhreM8JDvwYoJQWnVveKwn6tfYmJ7v0sKr
 uI6rYaUDtrfHcOFvcnZqweWMAqXfzoQ=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-488-aD0tW992NFOuzZVhkQAYqw-1; Thu, 26 Aug 2021 16:07:33 -0400
X-MC-Unique: aD0tW992NFOuzZVhkQAYqw-1
Received: by mail-wm1-f72.google.com with SMTP id
 j135-20020a1c238d000000b002e87aa95b5aso3984902wmj.4
 for <qemu-devel@nongnu.org>; Thu, 26 Aug 2021 13:07:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=8ZLosj281VIPcnVVY5MWZocWOZi5mT78NAOIuJQf3M8=;
 b=qkUiOTbT+xR26hdgsbFnGZjyJPWKma8ARL+y3/uFGL9kqdxLz6KWhruzCNppJfxJWU
 2WC8VQqlh4gqLicEYotOQ0qvjznwJ/xCuPyE9mWyVHQVNnw3bA63sxNHyhPxfTVN/dwK
 IqZ6G2oT50pugB2u0+41LPkn38iRCWXZLJ3kFs2P+WUDNj+fUoOoLUy/TFI7BJIzFYOU
 YMLxKMcG2zeZYg9dywRXofMOyiIZTQIHgqSsfAyEb93jvNk9n5Ht2OAxHRPYL8AFXbkt
 BCFN1J8HzTEV/pCEj+8QCbavUeVuKyXw31XH8g0tGrhodXajvZcotxvuU6WmRN/0C3Q9
 x4vg==
X-Gm-Message-State: AOAM5324F5dawzr6YHyuUI6qwtyIDVBB9s8AhSaJS0A9OSKCemOGRL2T
 1u7U2YKQTq2Y8TU3WSK7Tfh7in+3rjie5rXQdAYSCzYTn6qbxWU4u5UaV8ACZNGBWGjdLT2RquU
 SpV7yxzkbfRuzSUzRlKRLPNpq+1q6AR8gcIy8Hw6QL6BCSgP5IY9BFqNQav1jjriB
X-Received: by 2002:a1c:a5c2:: with SMTP id o185mr16068553wme.34.1630008451522; 
 Thu, 26 Aug 2021 13:07:31 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyMCstQ65sK3jZMXwP0SFbsn0H2tQqwl2KgBLEA5lchtjsw/WTWmqZcZYq3kpEdDr2fs9ONKQ==
X-Received: by 2002:a1c:a5c2:: with SMTP id o185mr16068529wme.34.1630008451304; 
 Thu, 26 Aug 2021 13:07:31 -0700 (PDT)
Received: from x1w.. (163.red-83-52-55.dynamicip.rima-tde.net. [83.52.55.163])
 by smtp.gmail.com with ESMTPSA id
 y1sm3837057wmq.43.2021.08.26.13.07.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 26 Aug 2021 13:07:30 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 2/3] hw/usb/hcd-xhci-pci: Abort if setting link property
 failed
Date: Thu, 26 Aug 2021 22:07:19 +0200
Message-Id: <20210826200720.2196827-3-philmd@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210826200720.2196827-1-philmd@redhat.com>
References: <20210826200720.2196827-1-philmd@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.742,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Eduardo Habkost <ehabkost@redhat.com>, Sergio Lopez <slp@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Gerd Hoffmann <kraxel@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Do not ignore eventual error if we failed at setting the 'host'
property of the TYPE_XHCI model.

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 hw/usb/hcd-xhci-pci.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/usb/hcd-xhci-pci.c b/hw/usb/hcd-xhci-pci.c
index e934b1a5b1f..24c528d210f 100644
--- a/hw/usb/hcd-xhci-pci.c
+++ b/hw/usb/hcd-xhci-pci.c
@@ -115,7 +115,7 @@ static void usb_xhci_pci_realize(struct PCIDevice *dev, Error **errp)
     dev->config[PCI_CACHE_LINE_SIZE] = 0x10;
     dev->config[0x60] = 0x30; /* release number */
 
-    object_property_set_link(OBJECT(&s->xhci), "host", OBJECT(s), NULL);
+    object_property_set_link(OBJECT(&s->xhci), "host", OBJECT(s), &error_abort);
     s->xhci.intr_update = xhci_pci_intr_update;
     s->xhci.intr_raise = xhci_pci_intr_raise;
     if (!qdev_realize(DEVICE(&s->xhci), NULL, errp)) {
-- 
2.31.1


