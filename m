Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A09E02D49FC
	for <lists+qemu-devel@lfdr.de>; Wed,  9 Dec 2020 20:22:44 +0100 (CET)
Received: from localhost ([::1]:52062 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kn52x-0005pi-Ky
	for lists+qemu-devel@lfdr.de; Wed, 09 Dec 2020 14:22:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:52560)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1kn3u9-0003Ny-6T
 for qemu-devel@nongnu.org; Wed, 09 Dec 2020 13:09:33 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:37843)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1kn3u6-0008O9-5l
 for qemu-devel@nongnu.org; Wed, 09 Dec 2020 13:09:32 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1607537369;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=3qrODYIJDbQpe00bcVbjfhxWWnd2OTx6N13MJEKnaIo=;
 b=AVXUsLSm9WAhehz6DYIJBrg2pagot/MeUQq9nxPekx4ML3RbNpJz/FfiIUqaQZNLMT0M5b
 2uyXKrsqnFQIvpoCfhYEXLgK0/kdfncLCb1BnDFORsVfhSJsY6vUW6dSMpnbEVs5H1aEv+
 bxspyVhtcGhkGmmjwQhmkCi/BWpI7iQ=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-462-AHIM68YpOficA3XysELy2g-1; Wed, 09 Dec 2020 13:09:27 -0500
X-MC-Unique: AHIM68YpOficA3XysELy2g-1
Received: by mail-wr1-f71.google.com with SMTP id d2so961011wrr.5
 for <qemu-devel@nongnu.org>; Wed, 09 Dec 2020 10:09:26 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=3qrODYIJDbQpe00bcVbjfhxWWnd2OTx6N13MJEKnaIo=;
 b=jVa7SZw1tt8ZFHn7zJX8ZRcY97jOSqzaJCMwFISlklPU/ylrT3wSq2BxgFQA0t+lLV
 5ycYm8umubXYEx7lpALdjjxAZ9X5E/xx0YafZHvpqx60UNl7cK/pyqxiDOvwfI3UAzn3
 KvG/M7eStF38twhqfdtlGOvstTkt+0+shXXS2fSWKsMC2TC+pWpmJD+JMcGlSPPJ3/LR
 SjBCGrLd5yEoPWAU6eQnw5ZvUwzRrOKMrKYcGJb3sbrjo8ntFQtGJrr3qX3t6Rq5MeO3
 9c8NbgBQTUKF5TYwloYHERKilyfA+STx/+fkPjxPwc9iktwmg8D3nILEC9ojLv0gheJW
 ZWvQ==
X-Gm-Message-State: AOAM533IcJUlUYdfh4lRJvdkXk3c37AVbvuw2qxiO/ZwBx/GMwbomo4O
 OJMwVWMPKzRK1ctZD3qrXtLEECyXvP44d7zcTN/kBeTA+FatcTAleZi2zfDuo1UljufN056mfAr
 Ppm47r1r0KkwTzLkfSFPsqDmL2ZSoxh+JMjrNkJQMZKRHd9+id3V8nQF9y+j0
X-Received: by 2002:a1c:61c3:: with SMTP id v186mr4083687wmb.146.1607537364642; 
 Wed, 09 Dec 2020 10:09:24 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzCUqKQurbgMvLtCBaiY3hAVHgK2igK8S0Si9aLa/1cOC2INboZMczacPUvMFAyAgC4+uFSgw==
X-Received: by 2002:a1c:61c3:: with SMTP id v186mr4083658wmb.146.1607537364374; 
 Wed, 09 Dec 2020 10:09:24 -0800 (PST)
Received: from redhat.com (bzq-79-176-44-197.red.bezeqint.net. [79.176.44.197])
 by smtp.gmail.com with ESMTPSA id a13sm4996418wrt.96.2020.12.09.10.09.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Dec 2020 10:09:23 -0800 (PST)
Date: Wed, 9 Dec 2020 13:09:20 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL v2 35/65] failover: simplify qdev_device_add()
Message-ID: <20201209180546.721296-36-mst@redhat.com>
References: <20201209180546.721296-1-mst@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20201209180546.721296-1-mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=63.128.21.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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


