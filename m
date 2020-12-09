Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AF6D2D4A11
	for <lists+qemu-devel@lfdr.de>; Wed,  9 Dec 2020 20:27:30 +0100 (CET)
Received: from localhost ([::1]:36722 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kn57Z-0002xD-2i
	for lists+qemu-devel@lfdr.de; Wed, 09 Dec 2020 14:27:29 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53374)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1kn3w7-00053e-3X
 for qemu-devel@nongnu.org; Wed, 09 Dec 2020 13:11:35 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:34736)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1kn3w5-0000h2-BE
 for qemu-devel@nongnu.org; Wed, 09 Dec 2020 13:11:34 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1607537492;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=mZUQSSm1IlD4lFJVF8AvCKDdkoRkM4eh9etogMBBR1A=;
 b=XWqWRyjK3XbM2/LBeh7rVaGNuSENX5rpShYg2Y7Q3NUZ8clgSwxrotqf1nrSGlSQrj1ZEr
 kmBjAufoiMr3Z2pt42op78pkbISVb5p0PU2hpvzeoBV89CO2bxg4LNAXU37K+1GP77mABZ
 r1EbHVU9y4N9VZYKZgP62WomOVCjAeg=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-184-oqUw2xX8MOOxBFrZ7w6TDg-1; Wed, 09 Dec 2020 13:11:30 -0500
X-MC-Unique: oqUw2xX8MOOxBFrZ7w6TDg-1
Received: by mail-wr1-f72.google.com with SMTP id x10so964809wrs.2
 for <qemu-devel@nongnu.org>; Wed, 09 Dec 2020 10:11:30 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=mZUQSSm1IlD4lFJVF8AvCKDdkoRkM4eh9etogMBBR1A=;
 b=jFQVFtcgnkNZwfziibjBmV1XechkgAWE//LmzDlG51BeS+RB9VWb8bp+cI2EKSR8ip
 IwC5eS0tMWSYDAw2Fvam3ud7OVtPcby6CW3Tpa8Dd2GfyOM7ihoR6f4jm1ovSohJHfWg
 VwcS5mP0FIp/CwswFNnWveJjjez4eWW3caJfhSDT8+tkQkeIZy8z2g5yvOZZxVOaIqY8
 Ue2VyZ5A3WVRcjv6CnRZFDEEgG6pklWa2VX/84FmCjFQDEKAFB7MNvQ9JjPnZWSgCHBs
 BEYgCb35PB+fMpbL+vWBVNVotnEjoP/X1BweO15KG1NFnAFFjS06desq2CpzECP+QrY+
 9SxA==
X-Gm-Message-State: AOAM530hRM7ZNN2wiE/EQINJ5lW9pPsGRC9ZZ2ENBvZVQNfvolfws+32
 F4Y7QsQlcT9IQcgPIPyUAq/j6NWEIUjzuNIfMoEhS+QQj7h8ruj15lNLAAJT7PEXZCppFYK6UM3
 nKjisTJW2+Y7K1+sD2D9GCwLsk83Eb3BXQlM4gjrpVZJpQaFq/Q4puXxz8L4D
X-Received: by 2002:adf:f84b:: with SMTP id d11mr4059603wrq.216.1607537489166; 
 Wed, 09 Dec 2020 10:11:29 -0800 (PST)
X-Google-Smtp-Source: ABdhPJy+6ENLCWSQjBIuClPB3Rac5gtUoFvRJzm5EXWmDQKFMI7FNDvjVDRWPF4VfA+mG2c7bPhWQA==
X-Received: by 2002:adf:f84b:: with SMTP id d11mr4059570wrq.216.1607537488815; 
 Wed, 09 Dec 2020 10:11:28 -0800 (PST)
Received: from redhat.com (bzq-79-176-44-197.red.bezeqint.net. [79.176.44.197])
 by smtp.gmail.com with ESMTPSA id b73sm4957441wmb.0.2020.12.09.10.11.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Dec 2020 10:11:28 -0800 (PST)
Date: Wed, 9 Dec 2020 13:11:26 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL v2 61/65] x86: ich9: factor out "guest_cpu_hotplug_features"
Message-ID: <20201209180546.721296-62-mst@redhat.com>
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


