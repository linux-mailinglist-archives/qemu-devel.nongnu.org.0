Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7052C2D3340
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Dec 2020 21:27:22 +0100 (CET)
Received: from localhost ([::1]:46390 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kmjZx-0000y2-G8
	for lists+qemu-devel@lfdr.de; Tue, 08 Dec 2020 15:27:21 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:49510)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1kmim7-0006Ll-O0
 for qemu-devel@nongnu.org; Tue, 08 Dec 2020 14:35:51 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:35642)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1kmim5-0005PR-1e
 for qemu-devel@nongnu.org; Tue, 08 Dec 2020 14:35:51 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1607456148;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=5ZgbqeJXgCxK3O2GUnfhbym96kBp64mbV0i3XbWKY/U=;
 b=PTS2ST6f1nxeF8+87atHL3WEogTB89zg6AJ9KYxHfcZ0TVeLdAbcInLlkvfrAxsFJBdvg8
 aDT3/haf6Fq9giXc+5wjQkYWvQAR3XAix8Y6qjnL3fjL5KUhnXvSV2WTk4IxBznbWYYfAl
 btNP4cmjszPbXZnVqzLSPgx2jV2Fet0=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-316-Xr84PnSRMRe37IEZwm6pug-1; Tue, 08 Dec 2020 14:35:46 -0500
X-MC-Unique: Xr84PnSRMRe37IEZwm6pug-1
Received: by mail-wm1-f69.google.com with SMTP id j62so1278547wma.4
 for <qemu-devel@nongnu.org>; Tue, 08 Dec 2020 11:35:46 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=5ZgbqeJXgCxK3O2GUnfhbym96kBp64mbV0i3XbWKY/U=;
 b=lkBKn9XoRrqw/cikDED5a5V/aQfJBhnTH46QowuU44ehuCVMnHteWYEDe3WZdO1+Kb
 T4k2SIr/Op2+iI+X4jhKKu57ZinSrXdM+FvZXsfBra3eNRZqv9Z88/sNEB/i97vcBPkx
 4VFiM4lbOaAyQ/b5rpzvg3lnTVt4vzt8tQYUhQ2TMC6jwJFtdTq3iU3icx4zz+CeuPmH
 cNhAbXH7dqWSVkbr2pyRx6Ebwv7sVpEXNLQlqb9HVk00K65DA4AEAv766H2BjTSaH+iv
 v63A0WDZxrhyH5wGy2IYFZwDclOhTzifky4RC5Fa8n9HtBVygqr0GZ0tnCBCxO7Fvre3
 rSeQ==
X-Gm-Message-State: AOAM5315ioamAbpIKDQZ739W0u7SvuKZ10f+AD1Xfr5LWgiH+ZPxsljL
 9GSUYrqL6DoViAfzZWb0FZBTs73FiRmXY0cmpZEHvQSUo7DovghSq+ixVhCRO5eqHf7/XA00yIx
 u5jB/yn5s1hHNiuGf73+oTTmOz74+UUXSeQb2PFF0GTzL7dQRDqPZ1OTk0WgU
X-Received: by 2002:a05:600c:21c7:: with SMTP id
 x7mr5106510wmj.75.1607456145287; 
 Tue, 08 Dec 2020 11:35:45 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxd+23apXPZF5pFCQWiCCSaEPfB5aJOXxL8WbjTJhUAy7LJaob+XqeSVP9bfBJyy9CckhM8hQ==
X-Received: by 2002:a05:600c:21c7:: with SMTP id
 x7mr5106493wmj.75.1607456145099; 
 Tue, 08 Dec 2020 11:35:45 -0800 (PST)
Received: from redhat.com (bzq-79-176-44-197.red.bezeqint.net. [79.176.44.197])
 by smtp.gmail.com with ESMTPSA id i9sm16052149wrs.70.2020.12.08.11.35.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Dec 2020 11:35:44 -0800 (PST)
Date: Tue, 8 Dec 2020 14:35:40 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 36/66] failover: make sure that id always exist
Message-ID: <20201208193307.646726-37-mst@redhat.com>
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


