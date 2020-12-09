Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E1F492D4969
	for <lists+qemu-devel@lfdr.de>; Wed,  9 Dec 2020 19:48:48 +0100 (CET)
Received: from localhost ([::1]:44596 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kn4W7-0003Dz-Sx
	for lists+qemu-devel@lfdr.de; Wed, 09 Dec 2020 13:48:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:52480)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1kn3u3-0003DE-Lm
 for qemu-devel@nongnu.org; Wed, 09 Dec 2020 13:09:27 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:42636)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1kn3u1-0008Lr-ER
 for qemu-devel@nongnu.org; Wed, 09 Dec 2020 13:09:27 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1607537364;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=1wb8cjVjEm8LjY+gw2guY2LG1SKAkAGDpQL6LyRDU/U=;
 b=ckec8dQ76pFtpugdYt4/j2Vsn6iMDYBCSzf2X9NjNBCD9a9emIP7jEEUOcnIycS29MqIlA
 x297vCk+NW8rYu5e+sFaX/rzHhCmVjYV7VNKqJKa6qw7i2khWoBzqipMrsrsz3VQcy+cw9
 4K++SdQwZrHl/GGVp7n6D7n4WejbmGY=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-481-Pon7HJW3MQaK-InMdR507Q-1; Wed, 09 Dec 2020 13:09:23 -0500
X-MC-Unique: Pon7HJW3MQaK-InMdR507Q-1
Received: by mail-wm1-f72.google.com with SMTP id h68so872922wme.5
 for <qemu-devel@nongnu.org>; Wed, 09 Dec 2020 10:09:22 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=1wb8cjVjEm8LjY+gw2guY2LG1SKAkAGDpQL6LyRDU/U=;
 b=ZoK+rlyVtuZH7Qhbv7gAckY4MWcTbEnd5JcvleYo1TxZNBRr+1AE8veG3ybMjXfZFE
 jek0FXG3uH5qIIQFCeSYVTfOY9g9+gRZsKeh89TZUgDcycemX01AUzr2oxdDi9DPfnY/
 JH+X2CnX8kArO3RZ9Em3xrfByZfidJbOpT16rS0kFRYCr2MkFzOSyNRLSjlDb0D5hnD2
 OcTD7gPbVL60dYAjrLrmZJEYGNn4EDcqUaZ8ZyM8Z5NozxsGXkp6IxDkvbs27g9e/tJU
 NY+vojKqHVQl76zfk6IrT/Wsvqpkj+lTaK5QIPtrQY0pslrjs2vcKv+yugwKDNxHV89j
 oI/A==
X-Gm-Message-State: AOAM530MXrUOyFckD/V8DrASvoQARlHl3QBjucQYCCVhxo9n+vxNZKd2
 wuaAhniOVMO1XHPvSpquqeVP6AyIQDo2KIHD7rigdAiPddEjLJUU178SYT3RmS7vXqTbSTptFoC
 oRrbeh1kwLKosLGnXQmKd9J1N+r/4HLj/tmlJv1h8PhymxWigPxVTD0Vek88v
X-Received: by 2002:a5d:4ccd:: with SMTP id c13mr4104498wrt.254.1607537361015; 
 Wed, 09 Dec 2020 10:09:21 -0800 (PST)
X-Google-Smtp-Source: ABdhPJx/JvJV2T6gVrHqWZTZ4hzSWLLh83JAvUWgojIfV7zVYEB0SeBIjxvo9h2QID8e1lbl5yZjBw==
X-Received: by 2002:a5d:4ccd:: with SMTP id c13mr4104475wrt.254.1607537360819; 
 Wed, 09 Dec 2020 10:09:20 -0800 (PST)
Received: from redhat.com (bzq-79-176-44-197.red.bezeqint.net. [79.176.44.197])
 by smtp.gmail.com with ESMTPSA id f199sm4666574wme.15.2020.12.09.10.09.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Dec 2020 10:09:20 -0800 (PST)
Date: Wed, 9 Dec 2020 13:09:18 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL v2 34/65] failover: simplify qdev_device_add() failover case
Message-ID: <20201209180546.721296-35-mst@redhat.com>
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
Received-SPF: pass client-ip=216.205.24.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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


