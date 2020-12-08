Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 37E172D32CF
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Dec 2020 20:52:47 +0100 (CET)
Received: from localhost ([::1]:38902 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kmj2U-0004PI-9j
	for lists+qemu-devel@lfdr.de; Tue, 08 Dec 2020 14:52:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:49056)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1kmil6-0005Ik-8c
 for qemu-devel@nongnu.org; Tue, 08 Dec 2020 14:34:50 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:30372)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1kmikz-0004ut-Nb
 for qemu-devel@nongnu.org; Tue, 08 Dec 2020 14:34:46 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1607456078;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=FgcgZZzc2Flzw0fgzWTMsHtDenMVkVIL0C7rCd4lpNo=;
 b=fZZJ1bGwQ5QPSxFqoMjhSnCdikAOG+5l04AV6Us5QvXONUClerw+iKIdyEf4Ale+4ga8mF
 Db5KQx/1mhQ+T9dj9IYEu4RqgmsRixpPQZG4D/ZoYLOYBm6NsCuE5Hvoi2JVUW7Sk4Z7mu
 nS+DbXdK0z2fv6C2uX8e2mmOvZjlvoI=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-97-hZosYyQKPi62zhBWTDJx-Q-1; Tue, 08 Dec 2020 14:34:36 -0500
X-MC-Unique: hZosYyQKPi62zhBWTDJx-Q-1
Received: by mail-wr1-f70.google.com with SMTP id q18so1159859wrc.20
 for <qemu-devel@nongnu.org>; Tue, 08 Dec 2020 11:34:36 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=FgcgZZzc2Flzw0fgzWTMsHtDenMVkVIL0C7rCd4lpNo=;
 b=i4SLqIVNCJGFwgOREgzt7ODSnEXYF+bzjW0siGGSVNGZM6X/Q5z9z78hVyddBB2n2G
 pqpZ8k2uPugn/trfm0BKicrwRfkfetDq7kL/Y3D27p+lq0d/+cSFAZSXmm9DY0aC6YfM
 b/cUGeYjUmMh3ilwEx5taLQEyKLZDhPk57Q5xmwezFv43MLyzokg7vscev9rlil7eDjK
 /YakTh1IJe9nHGlCQMnSVMECjAzF/frcY+sjR+4lQsBuBwoHenKbiA329j5rKovs1ohI
 1MrWdzgrQ+QCAMPxcHw/GT+H15pNk5A0RxqJlkTB9MWMXrzS6m8I2k4jZa60EolzvJvJ
 BywQ==
X-Gm-Message-State: AOAM530Ns6MVHxKCGgGJTxcHzod0MCSHh32Kr2vVMxDXC+HAH4Pu4JZH
 9iziju+OHLd8zBnZTjLig0vX8eVwoSYUmwYC2Y6LkTptGB7GyApRgwSEXlCeQYUOVG8PcZuI8H/
 5NGhxJe9uET1PB69gK3nHPf0z1iZYt0vhifbeNjsK7VVeMPp6H+QRmiUKTzzL
X-Received: by 2002:adf:bc92:: with SMTP id g18mr5493674wrh.160.1607456075216; 
 Tue, 08 Dec 2020 11:34:35 -0800 (PST)
X-Google-Smtp-Source: ABdhPJx2dW3ZQ8wCWjZGkOppkL/C9JRSIekoxm8iYwl+W/LQ+nYFfr2VmYJBb+aFopuWCNX+Z6KmCg==
X-Received: by 2002:adf:bc92:: with SMTP id g18mr5493661wrh.160.1607456075066; 
 Tue, 08 Dec 2020 11:34:35 -0800 (PST)
Received: from redhat.com (bzq-79-176-44-197.red.bezeqint.net. [79.176.44.197])
 by smtp.gmail.com with ESMTPSA id s8sm21058227wrn.33.2020.12.08.11.34.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Dec 2020 11:34:34 -0800 (PST)
Date: Tue, 8 Dec 2020 14:34:32 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 18/66] failover: Use always atomics for primary_should_be_hidden
Message-ID: <20201208193307.646726-19-mst@redhat.com>
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Jason Wang <jasowang@redhat.com>,
 Juan Quintela <quintela@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Juan Quintela <quintela@redhat.com>

Signed-off-by: Juan Quintela <quintela@redhat.com>
Message-Id: <20201118083748.1328-4-quintela@redhat.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 hw/net/virtio-net.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/net/virtio-net.c b/hw/net/virtio-net.c
index 1011a524bf..a0fa63e7cb 100644
--- a/hw/net/virtio-net.c
+++ b/hw/net/virtio-net.c
@@ -3136,7 +3136,7 @@ static bool failover_replug_primary(VirtIONet *n, Error **errp)
         return false;
     }
     qdev_set_parent_bus(n->primary_dev, n->primary_bus, &error_abort);
-    n->primary_should_be_hidden = false;
+    qatomic_set(&n->primary_should_be_hidden, false);
     if (!qemu_opt_set_bool(n->primary_device_opts,
                            "partially_hotplugged", true, errp)) {
         return false;
-- 
MST


