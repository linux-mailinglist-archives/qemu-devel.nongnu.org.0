Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D02212D32D9
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Dec 2020 20:57:21 +0100 (CET)
Received: from localhost ([::1]:52330 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kmj6u-0001U2-Uq
	for lists+qemu-devel@lfdr.de; Tue, 08 Dec 2020 14:57:20 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:49156)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1kmilN-0005Pp-OM
 for qemu-devel@nongnu.org; Tue, 08 Dec 2020 14:35:05 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:38857)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1kmilH-0004xF-2X
 for qemu-devel@nongnu.org; Tue, 08 Dec 2020 14:35:05 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1607456088;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=gA8OZSVFzke8UQRwamLZeTSgAvZS2ts8NQ1bKDBCEMU=;
 b=Zr8jRfY9HEeTn3WmCbui5GM1oiuG8SuT4FQ5cjWLHQFORhMa1fs33fAcz6hwOUxBwqQtrg
 +lfwnm32L92Humie5mAnRjSmCALQKSCsQ0muL+VRIr2M3Npr611jOeTxRTwUzMNWMgt7+P
 aeOMBlehaYuAV5nqDsQe3twj8knaQEE=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-309-YWkVZbf2NZCJ_2O6YGFgdA-1; Tue, 08 Dec 2020 14:34:46 -0500
X-MC-Unique: YWkVZbf2NZCJ_2O6YGFgdA-1
Received: by mail-wr1-f72.google.com with SMTP id o12so1748359wrq.13
 for <qemu-devel@nongnu.org>; Tue, 08 Dec 2020 11:34:46 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=gA8OZSVFzke8UQRwamLZeTSgAvZS2ts8NQ1bKDBCEMU=;
 b=dbNXkOD5AHlezR2C0+my94DPzuyPeWHizYJPHcFEXAtgslLzMhlqx7GnjJdae7UGxi
 EJ3qT6eWdV+8/oBhm0/SKxMLDFF3fLgd0UlTgxRksgDsbDrn0Ud19IpPWSm+wfbV2E3u
 8O9qcNs935L+Cl5BuflbTa6B00dNnVEXcNaRXRNGMFadi8LsZt6L2ob7TKCvlSHYEkaV
 WVl4Kk/PU+PalNPq49cov4Crq/lFOY5Jynk2fXO5sUdeLZkbfzhkpoSVcUNauLPzA/Y0
 /AkPbcQrunX8xzvOT5PPhv8HS+YktH8uInXmmIFV8FQA/aCZ511vpFpEI++xf0hEF4XD
 5eHA==
X-Gm-Message-State: AOAM530sLPJItLykfbJroBOmddqeKxFKACmUGN1ixtP5cEqz4dO/JgJr
 lcntFuHJwWOgUeAj+lu1TUdzbUmqQywvn5kuUWN4sXO5DHM5G/7ejjdrkoi/DkXJ3Cx6sHX380S
 ekgmv4v6deVungUWLJ79XthTZlgQQSQt7IIz6foeo8ds5LXzVA/8KV/p2nBzQ
X-Received: by 2002:a5d:4746:: with SMTP id o6mr25740729wrs.324.1607456085106; 
 Tue, 08 Dec 2020 11:34:45 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwCaN9mWTK4I6eJ2h62jWyKyTcEqThTdDebkfjl2/iwTywFecyCeyRJ8ofkU7Rg9jrPBApFfg==
X-Received: by 2002:a5d:4746:: with SMTP id o6mr25740711wrs.324.1607456084939; 
 Tue, 08 Dec 2020 11:34:44 -0800 (PST)
Received: from redhat.com (bzq-79-176-44-197.red.bezeqint.net. [79.176.44.197])
 by smtp.gmail.com with ESMTPSA id c9sm22136471wrp.73.2020.12.08.11.34.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Dec 2020 11:34:44 -0800 (PST)
Date: Tue, 8 Dec 2020 14:34:41 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 21/66] failover: Remove external partially_hotplugged property
Message-ID: <20201208193307.646726-22-mst@redhat.com>
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

It was only set "once", and with the wrong value. As far as I can see,
libvirt still don't use it.

Signed-off-by: Juan Quintela <quintela@redhat.com>
Message-Id: <20201118083748.1328-7-quintela@redhat.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 hw/net/virtio-net.c | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/hw/net/virtio-net.c b/hw/net/virtio-net.c
index 3f658d6246..6ca85627d8 100644
--- a/hw/net/virtio-net.c
+++ b/hw/net/virtio-net.c
@@ -3135,10 +3135,6 @@ static bool failover_replug_primary(VirtIONet *n, Error **errp)
     }
     qdev_set_parent_bus(n->primary_dev, primary_bus, &error_abort);
     qatomic_set(&n->primary_should_be_hidden, false);
-    if (!qemu_opt_set_bool(n->primary_device_opts,
-                           "partially_hotplugged", true, errp)) {
-        return false;
-    }
     hotplug_ctrl = qdev_get_hotplug_handler(n->primary_dev);
     if (hotplug_ctrl) {
         hotplug_handler_pre_plug(hotplug_ctrl, n->primary_dev, &err);
-- 
MST


