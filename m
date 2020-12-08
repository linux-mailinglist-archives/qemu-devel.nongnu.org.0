Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 358D22D3322
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Dec 2020 21:24:27 +0100 (CET)
Received: from localhost ([::1]:37854 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kmjX8-0005oz-6V
	for lists+qemu-devel@lfdr.de; Tue, 08 Dec 2020 15:24:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:49420)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1kmilz-000686-H8
 for qemu-devel@nongnu.org; Tue, 08 Dec 2020 14:35:43 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:42121)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1kmilx-0005Mx-Ul
 for qemu-devel@nongnu.org; Tue, 08 Dec 2020 14:35:43 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1607456141;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=1wb8cjVjEm8LjY+gw2guY2LG1SKAkAGDpQL6LyRDU/U=;
 b=QaXwNpvruy19SdTVQe037oz+wIhWXFw2vIATYOedDXA/M5sGLcqjCW1URf1fGLKgjnbr3l
 Qo/QVKR1FILsCjb6wmGBfnA/puwpFjGvtfmKhbgRq55EbbEAFsVBO8oaYmVRF/aTCEVbPc
 wxNlrsYYe3mezxReuQ8vHys4SMdWxNY=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-418-JfLwdbkDOUOUGAEEhlzC6w-1; Tue, 08 Dec 2020 14:35:39 -0500
X-MC-Unique: JfLwdbkDOUOUGAEEhlzC6w-1
Received: by mail-wm1-f72.google.com with SMTP id a205so690375wme.9
 for <qemu-devel@nongnu.org>; Tue, 08 Dec 2020 11:35:39 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=1wb8cjVjEm8LjY+gw2guY2LG1SKAkAGDpQL6LyRDU/U=;
 b=a4bMzEimCjutWnYRVqNbR0wCuIpKKcZX+FBhNDQItMSRdo8YQ4hRQPCsBotkg5A1ii
 OAkv3QNzy3ynze4O5nIOUQXh1Zy1XJZRRq5gJ8jGGJRtAowWsN9MzBkiTtUxNr0By25/
 GRMOpbZZUPIDlV+nuEr5QB7GKTsJ/8JVUE92hCMWrx6xzRRYqk8WpTekBBrSERSJDKTd
 Y9JJf5WhW4yX5f8clbUIqe6Ps18o+Xa6DR5+8UhGKkLv2iWFrX+R4w8Fv+NRbclpDq2l
 Z/3AdPCbpw6dI5vcK6+ilADucTdbD83lrbT0CORup7y18G1kRga84AwI4v+CnwhI4KY2
 yA0A==
X-Gm-Message-State: AOAM532gNYwuhEjHBMTIN2b/v/nJjf5dWzh8WkLwY6zI+2oufDosdCZG
 PZIAAsC2ozN7pyFZaUYKpJAC2xc7rWEXOv7n1bsezSIZKnNNfw/+hntoPFWb9iNd62LYHPH8Si9
 +whU0sEDU/nggCyWSzNKwvVvVcREerHzgCEn+ZtyIkXmaoZ2+nuSebW+uhG99
X-Received: by 2002:adf:ef4c:: with SMTP id c12mr27390276wrp.242.1607456138106; 
 Tue, 08 Dec 2020 11:35:38 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwVdj/qj5v6LixDS8L5NxVHubQaz0ztawbxbku5viehaKT1xZ4KIp0YJaMqFSs9C5YTPR2Hbg==
X-Received: by 2002:adf:ef4c:: with SMTP id c12mr27390246wrp.242.1607456137897; 
 Tue, 08 Dec 2020 11:35:37 -0800 (PST)
Received: from redhat.com (bzq-79-176-44-197.red.bezeqint.net. [79.176.44.197])
 by smtp.gmail.com with ESMTPSA id r16sm282112wrx.36.2020.12.08.11.35.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Dec 2020 11:35:37 -0800 (PST)
Date: Tue, 8 Dec 2020 14:35:33 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 34/66] failover: simplify qdev_device_add() failover case
Message-ID: <20201208193307.646726-35-mst@redhat.com>
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

Just put allthe logic inside the same if.

Signed-off-by: Juan Quintela <quintela@redhat.com>
Message-Id: <20201118083748.1328-20-quintela@redhat.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 softmmu/qdev-monitor.c | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

diff --git a/softmmu/qdev-monitor.c b/softmmu/qdev-monitor.c
index a25f5d612c..12b7540f17 100644
--- a/softmmu/qdev-monitor.c
+++ b/softmmu/qdev-monitor.c
@@ -600,7 +600,6 @@ DeviceState *qdev_device_add(QemuOpts *opts, Error **errp)
     const char *driver, *path;
     DeviceState *dev = NULL;
     BusState *bus = NULL;
-    bool hide;
 
     driver = qemu_opt_get(opts, "driver");
     if (!driver) {
@@ -634,14 +633,16 @@ DeviceState *qdev_device_add(QemuOpts *opts, Error **errp)
             return NULL;
         }
     }
-    hide = should_hide_device(opts);
 
-    if ((hide || qdev_hotplug) && bus && !qbus_is_hotpluggable(bus)) {
-        error_setg(errp, QERR_BUS_NO_HOTPLUG, bus->name);
+    if (should_hide_device(opts)) {
+        if (bus && !qbus_is_hotpluggable(bus)) {
+            error_setg(errp, QERR_BUS_NO_HOTPLUG, bus->name);
+        }
         return NULL;
     }
 
-    if (hide) {
+    if (qdev_hotplug && bus && !qbus_is_hotpluggable(bus)) {
+        error_setg(errp, QERR_BUS_NO_HOTPLUG, bus->name);
         return NULL;
     }
 
-- 
MST


