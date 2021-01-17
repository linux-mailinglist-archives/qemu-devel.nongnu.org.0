Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EAC12F921D
	for <lists+qemu-devel@lfdr.de>; Sun, 17 Jan 2021 12:51:40 +0100 (CET)
Received: from localhost ([::1]:50472 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l16ap-0003Jz-8R
	for lists+qemu-devel@lfdr.de; Sun, 17 Jan 2021 06:51:39 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41034)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1l16Vp-0001Ug-8i
 for qemu-devel@nongnu.org; Sun, 17 Jan 2021 06:46:29 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:44691)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1l16Vk-00089P-Q4
 for qemu-devel@nongnu.org; Sun, 17 Jan 2021 06:46:29 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1610883984;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=x9zjpG1DATc/ZyuF1QoNdxW6EFzIE5e1Q0wy1Ill9Rk=;
 b=WRptZnhLvDFAbmE5q5O4nxku94zyLtCv7nzADwJCPQ29yhjB2heXNS1hvkrm8m/7RZEFLK
 iTFux0AwEaFHU+TF+LN+fcZ/9RbGF6CIYV0QTAAcBfj6oJahAsoEQ5eX0CSR5D7BQL6+o6
 0DgyV8IkwJJ0WynM27L9mi1xyiDGVx4=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-245-f4pnUJgkM2WPjrRJ8K407A-1; Sun, 17 Jan 2021 06:46:22 -0500
X-MC-Unique: f4pnUJgkM2WPjrRJ8K407A-1
Received: by mail-wr1-f69.google.com with SMTP id r8so6749697wro.22
 for <qemu-devel@nongnu.org>; Sun, 17 Jan 2021 03:46:22 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=x9zjpG1DATc/ZyuF1QoNdxW6EFzIE5e1Q0wy1Ill9Rk=;
 b=W3MSWrWi4+fX/VYOhG2t0qktRfUoN6L7u7R73utCQ/bz/joHUh2U3fe93hiA0DxTe+
 CvjQ4y8mcvZaQqHWPMWOngpV75zETnT0EoN5G/lgXgypwoAi1g32royWrUTwk98MKpBc
 Af+9BL6zu0m+O+C9yE/nxdgg9Rj9ECIdAp5OlExFX0ud4quEpEF6+fEiXsedb/wg+WZ5
 1gDJLc+Yg8SMCGMY0z+vad+Q1FZbYCaFIYu5V8rtbZ6BV3Jyg9J45tQ5BGFcFbmeQYWp
 kr9r0cDoFp4JDWPZBHLsasd/BOGi8bKNuWAOQawjWaamLmbQtKThqv9atLo3v+Hm0YWg
 6GHg==
X-Gm-Message-State: AOAM531A83HljOVdZq0SAF7GXb3+jNSJfLsZ9cRMYv+v4tGw3eVTttdD
 CQNg5y4dU+pM1ht6jIKzHI0FXF2pv2aFfyr2D9c6xgoCe3XAi0JA3LYj+OarlzSyWrOnYUj+F2o
 rN7ahq0BMNCtvjMReN+wXNWEM8B891SjQNl5OIyTjdjPbs2Bpc+8AXliqOyJE
X-Received: by 2002:a1c:4d05:: with SMTP id o5mr16997922wmh.85.1610883980898; 
 Sun, 17 Jan 2021 03:46:20 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxtE3ixO5j+Fh760BIJDtAq66R32qHgyExR+h1WbPNnza+PaI8WNW5pZ4j9SqlOuJzdaaAgDg==
X-Received: by 2002:a1c:4d05:: with SMTP id o5mr16997909wmh.85.1610883980659; 
 Sun, 17 Jan 2021 03:46:20 -0800 (PST)
Received: from redhat.com (bzq-79-176-30-58.red.bezeqint.net. [79.176.30.58])
 by smtp.gmail.com with ESMTPSA id
 r13sm22741502wrt.10.2021.01.17.03.46.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 17 Jan 2021 03:46:19 -0800 (PST)
Date: Sun, 17 Jan 2021 06:46:18 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 01/10] pci/shpc: don't push attention button when ejecting
 powered-off device
Message-ID: <20210117114519.539647-2-mst@redhat.com>
References: <20210117114519.539647-1-mst@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210117114519.539647-1-mst@redhat.com>
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
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.252,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Roman Kagan <rvkagan@yandex-team.ru>,
 Peter Maydell <peter.maydell@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Roman Kagan <rvkagan@yandex-team.ru>

When the slot is in steady powered-off state and the device is being
removed, there's no need to press the attention button.  Nor is it
mandated by the Standard Hot-Plug Controller Specification, Rev. 1.0.

Moreover it confuses the guest, Linux in particular, as it assumes that
the attention button pressed in this state indicates that the device has
been inserted and will need to be powered on.  Therefore it transitions
the slot into BLINKING_ON state for 5 seconds, and discovers at the end
that no device is actually inserted:

... unplug request
[12685.451329] shpchp 0000:01:00.0: Button pressed on Slot(2)
[12685.455478] shpchp 0000:01:00.0: PCI slot #2 - powering off due to button press
... in 5 seconds OS powers off the slot, QEMU ejects the device
[12690.632282] shpchp 0000:01:00.0: Latch open on Slot(2)
... excessive button press in steady powered-off state
[12690.634267] shpchp 0000:01:00.0: Button pressed on Slot(2)
[12690.636256] shpchp 0000:01:00.0: Card not present on Slot(2)
... the last button press spawns powering on the slot
[12690.638909] shpchp 0000:01:00.0: PCI slot #2 - powering on due to button press
... in 5 more seconds attempt to power on discovers empty slot
[12695.735986] shpchp 0000:01:00.0: No adapter on slot(2)

Worse, if the real device insertion happens within 5 seconds from the
apparent completion of the previous device removal (signaled via
DEVICE_DELETED event), the new button press will be interpreted as the
cancellation of that misguided powering on:

[13448.965295] shpchp 0000:01:00.0: Button pressed on Slot(2)
[13448.969430] shpchp 0000:01:00.0: PCI slot #2 - powering off due to button press
[13454.025107] shpchp 0000:01:00.0: Latch open on Slot(2)
[13454.027101] shpchp 0000:01:00.0: Button pressed on Slot(2)
[13454.029165] shpchp 0000:01:00.0: Card not present on Slot(2)
... the excessive button press spawns powering on the slot
... device has already been ejected by QEMU
[13454.031949] shpchp 0000:01:00.0: PCI slot #2 - powering on due to button press
... new device is inserted in the slot
[13456.861545] shpchp 0000:01:00.0: Latch close on Slot(2)
... valid button press arrives before 5 s since the wrong one
[13456.864894] shpchp 0000:01:00.0: Button pressed on Slot(2)
[13456.869211] shpchp 0000:01:00.0: Card present on Slot(2)
... the valid button press is counted as cancellation of the wrong one
[13456.873173] shpchp 0000:01:00.0: Button cancel on Slot(2)
[13456.877101] shpchp 0000:01:00.0: PCI slot #2 - action canceled due to button press

As a result, the newly inserted device isn't brought up by the guest.

Avoid this situation by not pushing the attention button when the device
in the slot is in powered-off state and is being ejected.

FWIW pcie implementation doesn't suffer from this problem.

Signed-off-by: Roman Kagan <rvkagan@yandex-team.ru>
Message-Id: <20201102053750.2281818-1-rvkagan@yandex-team.ru>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 hw/pci/shpc.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/hw/pci/shpc.c b/hw/pci/shpc.c
index 4786a44996..28e62174c4 100644
--- a/hw/pci/shpc.c
+++ b/hw/pci/shpc.c
@@ -300,7 +300,6 @@ static void shpc_slot_command(SHPCDevice *shpc, uint8_t target,
             shpc_set_status(shpc, slot, SHPC_SLOT_STATUS_PRSNT_EMPTY,
                             SHPC_SLOT_STATUS_PRSNT_MASK);
             shpc->config[SHPC_SLOT_EVENT_LATCH(slot)] |=
-                SHPC_SLOT_EVENT_BUTTON |
                 SHPC_SLOT_EVENT_MRL |
                 SHPC_SLOT_EVENT_PRESENCE;
         }
@@ -566,7 +565,6 @@ void shpc_device_unplug_request_cb(HotplugHandler *hotplug_dev,
         return;
     }
 
-    shpc->config[SHPC_SLOT_EVENT_LATCH(slot)] |= SHPC_SLOT_EVENT_BUTTON;
     state = shpc_get_status(shpc, slot, SHPC_SLOT_STATE_MASK);
     led = shpc_get_status(shpc, slot, SHPC_SLOT_PWR_LED_MASK);
     if (state == SHPC_STATE_DISABLED && led == SHPC_LED_OFF) {
@@ -577,6 +575,8 @@ void shpc_device_unplug_request_cb(HotplugHandler *hotplug_dev,
         shpc->config[SHPC_SLOT_EVENT_LATCH(slot)] |=
             SHPC_SLOT_EVENT_MRL |
             SHPC_SLOT_EVENT_PRESENCE;
+    } else {
+        shpc->config[SHPC_SLOT_EVENT_LATCH(slot)] |= SHPC_SLOT_EVENT_BUTTON;
     }
     shpc_set_status(shpc, slot, 0, SHPC_SLOT_STATUS_66);
     shpc_interrupt_update(pci_hotplug_dev);
-- 
MST


