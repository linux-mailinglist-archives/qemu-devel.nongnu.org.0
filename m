Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 74D622D33F9
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Dec 2020 21:29:42 +0100 (CET)
Received: from localhost ([::1]:52820 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kmjcD-0003gB-ED
	for lists+qemu-devel@lfdr.de; Tue, 08 Dec 2020 15:29:41 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50426)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1kminr-0007xc-59
 for qemu-devel@nongnu.org; Tue, 08 Dec 2020 14:37:39 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:22604)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1kminp-0005xl-E5
 for qemu-devel@nongnu.org; Tue, 08 Dec 2020 14:37:38 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1607456256;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=mZUQSSm1IlD4lFJVF8AvCKDdkoRkM4eh9etogMBBR1A=;
 b=P3eDXHkernSvkwrX/XE71IBpuYk+E4oxq7gQeq7JjLcaYqRCWA/nTwsFD3KV6Fq9BeTLHu
 QPKVDGESg4BUGvLw6+jA2w89sq/E6j4F7/T3MwKRmpdCU3e12PFyrsfrgxChR4wvucwkkc
 6w+16eIhXuv1CMmezvsH668ZZE6UT4Y=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-508-OboB_aobNUOyhVjMiV1R3A-1; Tue, 08 Dec 2020 14:37:34 -0500
X-MC-Unique: OboB_aobNUOyhVjMiV1R3A-1
Received: by mail-wr1-f71.google.com with SMTP id r11so4696986wrs.23
 for <qemu-devel@nongnu.org>; Tue, 08 Dec 2020 11:37:33 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=mZUQSSm1IlD4lFJVF8AvCKDdkoRkM4eh9etogMBBR1A=;
 b=WtEEQdDHmN5PltufvwYbSn/V4HMiFO0MNMOyrTKCJJrJ8dEOtUulMa7vGMA0FfmVZ4
 H4xGzw5/cl+owv1Qrt30Ji5hiaCPjhTY/qdQBCA98KHT0iopVnR7Jo4WgOF0MqENrFW0
 XzZ67HXvdeFu0yRILN9dKayLD0RXy/PAe7dhzAT3wUlb1bLV9il8hxNiFgSbbTmLCMr5
 TX0//QuNHGeicP3QdbZjF9XOWuqWVpeUPZk8bTCNjk9URyBNST5r37/IYKx1Bq0cesl6
 YNg8uDLFwoIHkB/2ZDLJKzVREYG7resjaDVcZU0LluiCNukdRo7pvxJkFCGO5p15Upix
 Ix8w==
X-Gm-Message-State: AOAM531cy7Hm5U17yD2Og8ediEDiJpViXLdi1N+9ZcQPdVPiEbXysVSP
 jQ1OmTiPxmR5dBmwV+IGpO2cawjboBlxhv334TPrUFemO4UY1asG+9OrtK0vsPBxHJafyEdcZbn
 DTUfO+FlyYAXYyfcxqArIshU8IoU7lHuhj5P4yPkU5iyRiZCRRE/V3fuIS886
X-Received: by 2002:adf:e9c9:: with SMTP id l9mr27093540wrn.124.1607456252356; 
 Tue, 08 Dec 2020 11:37:32 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyaJ0wOGyuKB22CcGGQBhARgLPrh9BA+dJoosqItDw2eHeny1XxGk4IHGGZEAd+x1/ra9lUSg==
X-Received: by 2002:adf:e9c9:: with SMTP id l9mr27093520wrn.124.1607456252154; 
 Tue, 08 Dec 2020 11:37:32 -0800 (PST)
Received: from redhat.com (bzq-79-176-44-197.red.bezeqint.net. [79.176.44.197])
 by smtp.gmail.com with ESMTPSA id c4sm5506915wmf.19.2020.12.08.11.37.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Dec 2020 11:37:31 -0800 (PST)
Date: Tue, 8 Dec 2020 14:37:29 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 62/66] x86: ich9: factor out "guest_cpu_hotplug_features"
Message-ID: <20201208193307.646726-63-mst@redhat.com>
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
 Igor Mammedov <imammedo@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Igor Mammedov <imammedo@redhat.com>

it will be reused by next patch to check validity of unplug
feature.

Signed-off-by: Igor Mammedov <imammedo@redhat.com>
Message-Id: <20201207140739.3829993-8-imammedo@redhat.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 hw/isa/lpc_ich9.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/hw/isa/lpc_ich9.c b/hw/isa/lpc_ich9.c
index 087a18d04d..da80430144 100644
--- a/hw/isa/lpc_ich9.c
+++ b/hw/isa/lpc_ich9.c
@@ -366,6 +366,7 @@ static void smi_features_ok_callback(void *opaque)
 {
     ICH9LPCState *lpc = opaque;
     uint64_t guest_features;
+    uint64_t guest_cpu_hotplug_features;
 
     if (lpc->smi_features_ok) {
         /* negotiation already complete, features locked */
@@ -378,9 +379,12 @@ static void smi_features_ok_callback(void *opaque)
         /* guest requests invalid features, leave @features_ok at zero */
         return;
     }
+
+    guest_cpu_hotplug_features = guest_features &
+                                 (BIT_ULL(ICH9_LPC_SMI_F_CPU_HOTPLUG_BIT) |
+                                  BIT_ULL(ICH9_LPC_SMI_F_CPU_HOT_UNPLUG_BIT));
     if (!(guest_features & BIT_ULL(ICH9_LPC_SMI_F_BROADCAST_BIT)) &&
-        guest_features & (BIT_ULL(ICH9_LPC_SMI_F_CPU_HOTPLUG_BIT) |
-                          BIT_ULL(ICH9_LPC_SMI_F_CPU_HOT_UNPLUG_BIT))) {
+        guest_cpu_hotplug_features) {
         /*
          * cpu hot-[un]plug with SMI requires SMI broadcast,
          * leave @features_ok at zero
-- 
MST


