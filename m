Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 625F52D32F5
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Dec 2020 21:05:02 +0100 (CET)
Received: from localhost ([::1]:44724 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kmjEL-0001WO-Bq
	for lists+qemu-devel@lfdr.de; Tue, 08 Dec 2020 15:05:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:49542)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1kmimF-0006TL-5a
 for qemu-devel@nongnu.org; Tue, 08 Dec 2020 14:35:59 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:42781)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1kmim0-0005O4-NB
 for qemu-devel@nongnu.org; Tue, 08 Dec 2020 14:35:58 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1607456144;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=3qrODYIJDbQpe00bcVbjfhxWWnd2OTx6N13MJEKnaIo=;
 b=OEIDTfM8CsGjhD6kxCtr9N94uleLtdX1SGgAAHB+friz/7IXlLa8HyP03BzeCclEjqvIMH
 K7FcxZ0wBAIFWkuEEbQiXV3aGb6eCfYxGStiFE3u+LM9Qr1CzcgeoohS78mgTiNO7eu2DH
 IdfTgQu2+t0zJH/HwBLRedvZmFiejbM=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-585-OvEue8DaOC-VHdLb8ue6OA-1; Tue, 08 Dec 2020 14:35:42 -0500
X-MC-Unique: OvEue8DaOC-VHdLb8ue6OA-1
Received: by mail-wm1-f72.google.com with SMTP id v5so1288730wmj.0
 for <qemu-devel@nongnu.org>; Tue, 08 Dec 2020 11:35:42 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=3qrODYIJDbQpe00bcVbjfhxWWnd2OTx6N13MJEKnaIo=;
 b=V5BGGbIifVsrmNu1SHxVAADI5jAFOF5ui4R9LfybB9EqAfdRpxO7fQUHZP8XSXG+kd
 kGRfoDHoW1wDLsS99ByUi5yZJ6gEY39hXgt01GNDG0G17MImwB0mwRJuOjWLsjcIVl15
 rXwcsIH5f3Fa0XX/N9QeTRZ9uTMMOYZef7Jp2YfnIcSl1gmkRlSVuXa1oBr3aKgivGoj
 6oAo+OgGzDPbNbd1n7Caa9nGVNBMsKs4rGTYSzRDOpm/W2nORqIWsUd+HixQWPEr+MyY
 X7Br+5m8uoSU4o6Tev99O1yRXSBHtRoxx11YG/PzvYjbsEh6I2d8c2BvC/XwnyU+Nndi
 eq/A==
X-Gm-Message-State: AOAM5303UxCI9Ud245nHGZvf9jSkk3tKm0tt+Gk/rl9oJnq34NA/EyVg
 ZzUk0tjOORhnCdbsEnSrO6f+rfdiGjIjcjN6VUpF4lLnbXp7GbaodFwnWpZxsDSgWHjiaLreBUs
 oEHzo06mR3kZHdylTx/ZfJ2Gf6r1yjCcOOcAnKUqdzOOAU3Jx0onGT2H0bhet
X-Received: by 2002:a05:6000:1cf:: with SMTP id
 t15mr26130329wrx.321.1607456141027; 
 Tue, 08 Dec 2020 11:35:41 -0800 (PST)
X-Google-Smtp-Source: ABdhPJymHVg/sNzN9wAIuCWuDMjEAy7gmuZkFPBww8iEuSZ9WKby/aRByrCZp75PrsxhxTikp4KOTA==
X-Received: by 2002:a05:6000:1cf:: with SMTP id
 t15mr26130304wrx.321.1607456140744; 
 Tue, 08 Dec 2020 11:35:40 -0800 (PST)
Received: from redhat.com (bzq-79-176-44-197.red.bezeqint.net. [79.176.44.197])
 by smtp.gmail.com with ESMTPSA id u66sm5000846wmg.30.2020.12.08.11.35.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Dec 2020 11:35:40 -0800 (PST)
Date: Tue, 8 Dec 2020 14:35:38 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 35/66] failover: simplify qdev_device_add()
Message-ID: <20201208193307.646726-36-mst@redhat.com>
References: <20201208193307.646726-1-mst@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20201208193307.646726-1-mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
 Paolo Bonzini <pbonzini@redhat.com>,
 Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Juan Quintela <quintela@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Juan Quintela <quintela@redhat.com>

We don't need to walk the opts by hand.  qmp_opt_get() already does
that.  And then we can remove the functions that did that walk.

Signed-off-by: Juan Quintela <quintela@redhat.com>
Message-Id: <20201118083748.1328-21-quintela@redhat.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 softmmu/qdev-monitor.c | 32 ++++++--------------------------
 1 file changed, 6 insertions(+), 26 deletions(-)

diff --git a/softmmu/qdev-monitor.c b/softmmu/qdev-monitor.c
index 12b7540f17..0e10f0466f 100644
--- a/softmmu/qdev-monitor.c
+++ b/softmmu/qdev-monitor.c
@@ -572,28 +572,6 @@ void qdev_set_id(DeviceState *dev, const char *id)
     }
 }
 
-static int is_failover_device(void *opaque, const char *name, const char *value,
-                              Error **errp)
-{
-    if (strcmp(name, "failover_pair_id") == 0) {
-        QemuOpts *opts = opaque;
-
-        if (qdev_should_hide_device(opts)) {
-            return 1;
-        }
-    }
-
-    return 0;
-}
-
-static bool should_hide_device(QemuOpts *opts)
-{
-    if (qemu_opt_foreach(opts, is_failover_device, opts, NULL) == 0) {
-        return false;
-    }
-    return true;
-}
-
 DeviceState *qdev_device_add(QemuOpts *opts, Error **errp)
 {
     DeviceClass *dc;
@@ -634,11 +612,13 @@ DeviceState *qdev_device_add(QemuOpts *opts, Error **errp)
         }
     }
 
-    if (should_hide_device(opts)) {
-        if (bus && !qbus_is_hotpluggable(bus)) {
-            error_setg(errp, QERR_BUS_NO_HOTPLUG, bus->name);
+    if (qemu_opt_get(opts, "failover_pair_id")) {
+        if (qdev_should_hide_device(opts)) {
+            if (bus && !qbus_is_hotpluggable(bus)) {
+                error_setg(errp, QERR_BUS_NO_HOTPLUG, bus->name);
+            }
+            return NULL;
         }
-        return NULL;
     }
 
     if (qdev_hotplug && bus && !qbus_is_hotpluggable(bus)) {
-- 
MST


