Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BB0BE602D8B
	for <lists+qemu-devel@lfdr.de>; Tue, 18 Oct 2022 15:57:37 +0200 (CEST)
Received: from localhost ([::1]:41126 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1okn68-00034N-5p
	for lists+qemu-devel@lfdr.de; Tue, 18 Oct 2022 09:57:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46342)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1okmgU-000225-6q
 for qemu-devel@nongnu.org; Tue, 18 Oct 2022 09:31:07 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:39949)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1okmgJ-0004y8-Ou
 for qemu-devel@nongnu.org; Tue, 18 Oct 2022 09:31:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1666099853;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=M4z+JhV9qDTZgqn3J9Gd4ALHXvhuoKERwwE9F7a3A3I=;
 b=CKqG6WDqxfnBBcwEZBffYEmxQJe+rwNNOlTpoR6EY+wgCxMO69KJJ/772vbZ/ARulnHjs0
 1d5xq01P05Ked0gLNnkS2aAJDDyoi8ZYTpcwWZhkSIb6r1BKj3ogddX5EcBT7XG/ebmfBz
 h2E/bIL8bs0Wm1QdhVShTroeIJeIT3Y=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-283-P44KYV_NO1CGq8JKB3QYlQ-1; Tue, 18 Oct 2022 09:30:52 -0400
X-MC-Unique: P44KYV_NO1CGq8JKB3QYlQ-1
Received: by mail-ej1-f70.google.com with SMTP id
 hc43-20020a17090716ab00b0078e28567ffbso4746779ejc.15
 for <qemu-devel@nongnu.org>; Tue, 18 Oct 2022 06:30:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=M4z+JhV9qDTZgqn3J9Gd4ALHXvhuoKERwwE9F7a3A3I=;
 b=bG8z/YlNg+DQcGeBIvbL4JcKfsSi6jDZod6yWGxm5H7Dv2fsN16eb3Xbm63vF/FDvi
 PyB5URDftrLqiuYKUQWp+LQaO/NrHsrBLYKvtgdOJHvyobMv/dmYHTI6kPjrqVAfGdGW
 P4ZIwPW96gE9GgxsEioc/h0khNenMJoZpLI4EwqPMuL3zgYh7qYQM3QyhzWNw1aO4gnR
 Upl/chKqi3bc4X1RvagcK+qKgeBdLloSjp8lqYKO5FhJM+lb3ZklUEv05IxWjwny3cIu
 XPzy0yNDk8zunAKY59fY28A1PhTJqlfbRv7sYMd54bebw+TrtretJRLMYSwJRgyNaMg4
 5Xww==
X-Gm-Message-State: ACrzQf0THQHsqhGGtk8wuHejNQVzQCJ6xlNldYsWWq2iNKieKqzYdPSE
 mfrGS4o/lalonrm0YJgkb87ojSHRz2h6n9l/zA8muCafoL59vMJO4Ww+Yz17HwED0T6C8hT5a7Z
 gAsFoiuwklZnyNU3ZlGPDAlyPTeO5QXbrOuNJVW700b9K2+1jrQG/sYPrhDKtYAnrUJo=
X-Received: by 2002:a05:6402:2791:b0:45d:3a94:3494 with SMTP id
 b17-20020a056402279100b0045d3a943494mr2595630ede.91.1666099850386; 
 Tue, 18 Oct 2022 06:30:50 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM7g8c4dYlKxH2YpIyQuZmnTv/+igxRG8sz6HUZKttg5hQhHUH6uJ03p8ddI2RXnevWK3zAUmA==
X-Received: by 2002:a05:6402:2791:b0:45d:3a94:3494 with SMTP id
 b17-20020a056402279100b0045d3a943494mr2595605ede.91.1666099850102; 
 Tue, 18 Oct 2022 06:30:50 -0700 (PDT)
Received: from avogadro.local ([2001:b07:6468:f312:2f4b:62da:3159:e077])
 by smtp.gmail.com with ESMTPSA id
 t29-20020a056402241d00b0045ce419ecffsm8965588eda.58.2022.10.18.06.30.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 Oct 2022 06:30:48 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: Venu Busireddy <venu.busireddy@oracle.com>
Subject: [PULL 01/53] virtio-scsi: Send "REPORTED LUNS CHANGED" sense data
 upon disk hotplug events
Date: Tue, 18 Oct 2022 15:29:50 +0200
Message-Id: <20221018133042.856368-2-pbonzini@redhat.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20221018133042.856368-1-pbonzini@redhat.com>
References: <20221018133042.856368-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.256,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Venu Busireddy <venu.busireddy@oracle.com>

Section 5.6.6.3 of VirtIO specification states, "Events will also
be reported via sense codes..." However, no sense data is sent when
VIRTIO_SCSI_EVT_RESET_RESCAN or VIRTIO_SCSI_EVT_RESET_REMOVED events
are reported (when disk hotplug/hotunplug events occur). SCSI layer
on Solaris depends on this sense data, and hence does not handle disk
hotplug/hotunplug events.

When the disk inventory changes, use the bus unit attention mechanism
to return a CHECK_CONDITION status with sense data of 0x06/0x3F/0x0E
(sense code REPORTED_LUNS_CHANGED).  The first device on the bus to
execute a command successfully will report and consume the unit
attention status.

Signed-off-by: Venu Busireddy <venu.busireddy@oracle.com>
Message-Id: <20221006194946.24134-1-venu.busireddy@oracle.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 hw/scsi/scsi-bus.c     | 18 ++++++++++++++++++
 hw/scsi/virtio-scsi.c  |  2 ++
 include/hw/scsi/scsi.h |  1 +
 3 files changed, 21 insertions(+)

diff --git a/hw/scsi/scsi-bus.c b/hw/scsi/scsi-bus.c
index 4403717c4a..ceceafb2cd 100644
--- a/hw/scsi/scsi-bus.c
+++ b/hw/scsi/scsi-bus.c
@@ -1616,6 +1616,24 @@ static int scsi_ua_precedence(SCSISense sense)
     return (sense.asc << 8) | sense.ascq;
 }
 
+void scsi_bus_set_ua(SCSIBus *bus, SCSISense sense)
+{
+    int prec1, prec2;
+    if (sense.key != UNIT_ATTENTION) {
+        return;
+    }
+
+    /*
+     * Override a pre-existing unit attention condition, except for a more
+     * important reset condition.
+     */
+    prec1 = scsi_ua_precedence(bus->unit_attention);
+    prec2 = scsi_ua_precedence(sense);
+    if (prec2 < prec1) {
+        bus->unit_attention = sense;
+    }
+}
+
 void scsi_device_set_ua(SCSIDevice *sdev, SCSISense sense)
 {
     int prec1, prec2;
diff --git a/hw/scsi/virtio-scsi.c b/hw/scsi/virtio-scsi.c
index 41f2a56301..cf2721aa46 100644
--- a/hw/scsi/virtio-scsi.c
+++ b/hw/scsi/virtio-scsi.c
@@ -956,6 +956,7 @@ static void virtio_scsi_hotplug(HotplugHandler *hotplug_dev, DeviceState *dev,
         virtio_scsi_push_event(s, sd,
                                VIRTIO_SCSI_T_TRANSPORT_RESET,
                                VIRTIO_SCSI_EVT_RESET_RESCAN);
+        scsi_bus_set_ua(&s->bus, SENSE_CODE(REPORTED_LUNS_CHANGED));
         virtio_scsi_release(s);
     }
 }
@@ -973,6 +974,7 @@ static void virtio_scsi_hotunplug(HotplugHandler *hotplug_dev, DeviceState *dev,
         virtio_scsi_push_event(s, sd,
                                VIRTIO_SCSI_T_TRANSPORT_RESET,
                                VIRTIO_SCSI_EVT_RESET_REMOVED);
+        scsi_bus_set_ua(&s->bus, SENSE_CODE(REPORTED_LUNS_CHANGED));
         virtio_scsi_release(s);
     }
 
diff --git a/include/hw/scsi/scsi.h b/include/hw/scsi/scsi.h
index 001103488c..3b1b3d278e 100644
--- a/include/hw/scsi/scsi.h
+++ b/include/hw/scsi/scsi.h
@@ -186,6 +186,7 @@ SCSIDevice *scsi_bus_legacy_add_drive(SCSIBus *bus, BlockBackend *blk,
                                       BlockdevOnError rerror,
                                       BlockdevOnError werror,
                                       const char *serial, Error **errp);
+void scsi_bus_set_ua(SCSIBus *bus, SCSISense sense);
 void scsi_bus_legacy_handle_cmdline(SCSIBus *bus);
 void scsi_legacy_handle_cmdline(void);
 
-- 
2.37.3


