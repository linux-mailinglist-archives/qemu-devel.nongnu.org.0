Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 633DB79AEB
	for <lists+qemu-devel@lfdr.de>; Mon, 29 Jul 2019 23:19:18 +0200 (CEST)
Received: from localhost ([::1]:56466 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hsD37-0000Is-LX
	for lists+qemu-devel@lfdr.de; Mon, 29 Jul 2019 17:19:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56693)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <mst@redhat.com>) id 1hsD06-0005cm-IV
 for qemu-devel@nongnu.org; Mon, 29 Jul 2019 17:16:11 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <mst@redhat.com>) id 1hsD05-0003gD-GQ
 for qemu-devel@nongnu.org; Mon, 29 Jul 2019 17:16:10 -0400
Received: from mail-qk1-f174.google.com ([209.85.222.174]:46608)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <mst@redhat.com>) id 1hsD05-0003fx-B9
 for qemu-devel@nongnu.org; Mon, 29 Jul 2019 17:16:09 -0400
Received: by mail-qk1-f174.google.com with SMTP id r4so44993288qkm.13
 for <qemu-devel@nongnu.org>; Mon, 29 Jul 2019 14:16:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=+ZGWjw1OaIuDmpM6NLOjoTAP/QWzrO1rV9SIMYsAMog=;
 b=X7J7gv6skOzWPyptsgoE9ZxDLkLcrq7g9V/21/28JbAh2CQu6L+TW4dJ15KhziyA53
 W+YBbmdNGUO7j/I8e9bx8Na6ULCicZQVAcBGhq0ofM52APnTPpdWcBPOdjeeKen4Ycrr
 0St+rnQcaVBKUoBwuJwZ8NvCRSBn+PHnEZUzZL7EUio3qMsWwI78UcXkOYWmxFXhE52k
 Gb3co4L6a02UBhwjPbsvcr+7LZ/Sury/ePmpgCPa+USaRVAjsPr7Pe4p2Swrn4xbboAR
 Y39cPr61a1qrBkx3FxxeD1ErJDLXnG8/h3mO27aa9qM+dVAynEUGmSRpmK0YdeCHzjtf
 Emgg==
X-Gm-Message-State: APjAAAVdyPK7GQeNXX2NxdG6YCGwDkfU7Cs358KkdIO+dI7A6PVyzwWj
 l4G/V17Z3YEo/av6IT7hzBEjWZ2VLeiTCw==
X-Google-Smtp-Source: APXvYqwIQRWLRqfFv/di1aDwV3wzaravRnPZtgbUFHmiCYiQsOAGTH224E3dS91XJ1a0yj4jzNSbLg==
X-Received: by 2002:a05:620a:113b:: with SMTP id
 p27mr44241325qkk.397.1564434968332; 
 Mon, 29 Jul 2019 14:16:08 -0700 (PDT)
Received: from redhat.com (bzq-79-181-91-42.red.bezeqint.net. [79.181.91.42])
 by smtp.gmail.com with ESMTPSA id
 l123sm26687136qkc.9.2019.07.29.14.16.05
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Mon, 29 Jul 2019 14:16:07 -0700 (PDT)
Date: Mon, 29 Jul 2019 17:16:03 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Message-ID: <20190729162903.4489-2-dgilbert@redhat.com>
References: <20190729211404.1533-1-mst@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190729211404.1533-1-mst@redhat.com>
X-Mailer: git-send-email 2.22.0.678.g13338e74b8
X-Mutt-Fcc: =sent
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 209.85.222.174
Subject: [Qemu-devel] [PULL 1/3] Revert "Revert "globals: Allow global
 properties to be optional""
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
 Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Cornelia Huck <cohuck@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>

This reverts commit 8fa70dbd8bb478d9483c1da3e9976a2d86b3f9a0.

Because we're about to revert it's neighbour and thus uses an optional
again.

Signed-off-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
Message-Id: <20190729162903.4489-2-dgilbert@redhat.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
Reviewed-by: Cornelia Huck <cohuck@redhat.com>
---
 include/hw/qdev-core.h | 3 +++
 qom/object.c           | 3 +++
 2 files changed, 6 insertions(+)

diff --git a/include/hw/qdev-core.h b/include/hw/qdev-core.h
index e157fc4acd..136df7774c 100644
--- a/include/hw/qdev-core.h
+++ b/include/hw/qdev-core.h
@@ -252,6 +252,8 @@ struct PropertyInfo {
 /**
  * GlobalProperty:
  * @used: Set to true if property was used when initializing a device.
+ * @optional: If set to true, GlobalProperty will be skipped without errors
+ *            if the property doesn't exist.
  *
  * An error is fatal for non-hotplugged devices, when the global is applied.
  */
@@ -260,6 +262,7 @@ typedef struct GlobalProperty {
     const char *property;
     const char *value;
     bool used;
+    bool optional;
 } GlobalProperty;
 
 static inline void
diff --git a/qom/object.c b/qom/object.c
index 3966a3d461..1555547727 100644
--- a/qom/object.c
+++ b/qom/object.c
@@ -386,6 +386,9 @@ void object_apply_global_props(Object *obj, const GPtrArray *props, Error **errp
         if (object_dynamic_cast(obj, p->driver) == NULL) {
             continue;
         }
+        if (p->optional && !object_property_find(obj, p->property, NULL)) {
+            continue;
+        }
         p->used = true;
         object_property_parse(obj, p->value, p->property, &err);
         if (err != NULL) {
-- 
MST


