Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AA612D4985
	for <lists+qemu-devel@lfdr.de>; Wed,  9 Dec 2020 19:55:00 +0100 (CET)
Received: from localhost ([::1]:59788 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kn4c7-00016t-4u
	for lists+qemu-devel@lfdr.de; Wed, 09 Dec 2020 13:54:59 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:52566)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1kn3u9-0003Ow-Of
 for qemu-devel@nongnu.org; Wed, 09 Dec 2020 13:09:34 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:49310)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1kn3u7-0008Od-VX
 for qemu-devel@nongnu.org; Wed, 09 Dec 2020 13:09:33 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1607537371;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=5ZgbqeJXgCxK3O2GUnfhbym96kBp64mbV0i3XbWKY/U=;
 b=bQlDlLG4D3dMQTvUOpUm/qf7cTEdM9+Oc+K3uqqHHXR+Pi8M11CERBiCdf/46EiAplG9j/
 Pw1Z/tu+3K8Q+EWsRzhrhRLoJgFFIiLW6cKD8anSYfGrrIwzG0sZCqdof4SfK8nTC8R2tQ
 PK7+HzMlyw+sBTjlSMIHjNtVvTasFB8=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-127-22oxYIeOP9q6ChBM9xdUig-1; Wed, 09 Dec 2020 13:09:29 -0500
X-MC-Unique: 22oxYIeOP9q6ChBM9xdUig-1
Received: by mail-wm1-f69.google.com with SMTP id b124so175383wmh.0
 for <qemu-devel@nongnu.org>; Wed, 09 Dec 2020 10:09:29 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=5ZgbqeJXgCxK3O2GUnfhbym96kBp64mbV0i3XbWKY/U=;
 b=ov4Mer4+qNWyqUrE9M7wWIolL27cSYKaf9qsYxTVv2PBJWemungw09rcZxLyJBXCLn
 b8GrKiA1TRTL/Ca774poszeZ+T4cPHqWTU4LjtIZndCfI66Qi5xmiiX+XD4Ecq3kjc45
 UG7ge7MWFn6MmoQmFMlFWoNfR0JVppPZ0+Xfif3peJkAKfFzO5Zl9M9SdixyjjVdkmWj
 rqc0OQxLhMXGyjqBicShO2sKrPBoGMZe3l4oeGMnkGJI0LtwzK75yT/nJtkq6ma/yq7U
 0LlpzHQyBZrmJBF91R+1FzOIPNrEjqaATiM24zc7v/1okHjVwlL/L0cIWolpfU1fMEq0
 OmvQ==
X-Gm-Message-State: AOAM530krlWhBnXt4VV+/Qsrh80n/C2vBAGov7qjivGHV6ONyORj6RuH
 /mYvws8gNvQoHoftIdSew2O4hkaCrP5clHkZh2U59MqVK66q3VkhekQA7B5DrCNlX67AMrEeNEU
 sBf9Z8sPrQrO3a5CT3KxXhhc6BkkfKAQscmhQyI5H3UHzhCHwwsbjZTzTa4xL
X-Received: by 2002:a1c:2b46:: with SMTP id r67mr4060911wmr.162.1607537368072; 
 Wed, 09 Dec 2020 10:09:28 -0800 (PST)
X-Google-Smtp-Source: ABdhPJw6BS2K8cNfaA5jveBNxKvqfrZuejeuM+DC8cUdfWiEuHj16PKfkOwSrWT9Tkart2oBrhiOsg==
X-Received: by 2002:a1c:2b46:: with SMTP id r67mr4060899wmr.162.1607537367915; 
 Wed, 09 Dec 2020 10:09:27 -0800 (PST)
Received: from redhat.com (bzq-79-176-44-197.red.bezeqint.net. [79.176.44.197])
 by smtp.gmail.com with ESMTPSA id l8sm5025057wmf.35.2020.12.09.10.09.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Dec 2020 10:09:27 -0800 (PST)
Date: Wed, 9 Dec 2020 13:09:24 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL v2 36/65] failover: make sure that id always exist
Message-ID: <20201209180546.721296-37-mst@redhat.com>
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
 Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Juan Quintela <quintela@redhat.com>,
 Jason Wang <jasowang@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Juan Quintela <quintela@redhat.com>

We check that it exist at device creation time, so we don't have to
check anywhere else.

Signed-off-by: Juan Quintela <quintela@redhat.com>
Message-Id: <20201118083748.1328-22-quintela@redhat.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 hw/net/virtio-net.c    | 3 ---
 softmmu/qdev-monitor.c | 4 ++++
 2 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/hw/net/virtio-net.c b/hw/net/virtio-net.c
index ff82f1017d..c708c03cf6 100644
--- a/hw/net/virtio-net.c
+++ b/hw/net/virtio-net.c
@@ -3173,9 +3173,6 @@ static bool failover_hide_primary_device(DeviceListener *listener,
     hide = qatomic_read(&n->failover_primary_hidden);
     g_free(n->primary_device_id);
     n->primary_device_id = g_strdup(device_opts->id);
-    if (!n->primary_device_id) {
-        warn_report("primary_device_id not set");
-    }
     return hide;
 }
 
diff --git a/softmmu/qdev-monitor.c b/softmmu/qdev-monitor.c
index 0e10f0466f..301089eaea 100644
--- a/softmmu/qdev-monitor.c
+++ b/softmmu/qdev-monitor.c
@@ -613,6 +613,10 @@ DeviceState *qdev_device_add(QemuOpts *opts, Error **errp)
     }
 
     if (qemu_opt_get(opts, "failover_pair_id")) {
+        if (!opts->id) {
+            error_setg(errp, "Device with failover_pair_id don't have id");
+            return NULL;
+        }
         if (qdev_should_hide_device(opts)) {
             if (bus && !qbus_is_hotpluggable(bus)) {
                 error_setg(errp, QERR_BUS_NO_HOTPLUG, bus->name);
-- 
MST


