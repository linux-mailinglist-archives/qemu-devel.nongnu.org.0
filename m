Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FDF53BEB25
	for <lists+qemu-devel@lfdr.de>; Wed,  7 Jul 2021 17:42:21 +0200 (CEST)
Received: from localhost ([::1]:49078 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m19gq-0005AQ-BL
	for lists+qemu-devel@lfdr.de; Wed, 07 Jul 2021 11:42:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44602)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1m19fu-0004L4-Pq
 for qemu-devel@nongnu.org; Wed, 07 Jul 2021 11:41:22 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:45391)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1m19ft-0002TX-0v
 for qemu-devel@nongnu.org; Wed, 07 Jul 2021 11:41:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1625672480;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=3ihkGAZ0f6xrwWK710pxEhrMVwaZ2kV4RuRtcgrHzyE=;
 b=cS/EIrPtKTgt/vrMHy68b4mRKzX0ESkoLjlD8HrH8717WsC1YGSIc3goaD08IqwFHzBquH
 b8mzNFGeoFsKBF2N1fTE8SvXuXxpXxG4diC8aNkbBGo0O+Lbq34hLPoVnCy7nKaKhGPzcz
 ZTIki7H+f+Kb8VmonnFTfS8PMW1Eof8=
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-476-V8OsAQ3BNyyctKxpMNSQug-1; Wed, 07 Jul 2021 11:41:19 -0400
X-MC-Unique: V8OsAQ3BNyyctKxpMNSQug-1
Received: by mail-qv1-f70.google.com with SMTP id
 s14-20020ad4438e0000b02902c3cd066c0bso1252148qvr.18
 for <qemu-devel@nongnu.org>; Wed, 07 Jul 2021 08:41:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=3ihkGAZ0f6xrwWK710pxEhrMVwaZ2kV4RuRtcgrHzyE=;
 b=RX3L8OPEd7OLbMc8rt6pYIeMTjK8XqdmuDurmspUuce0VvFTzbP03iJj2jlLb7u2Qw
 kmp35VtMXNVoWjBSftIxubNmuPLuCMErqrNAdkpx2zOkz0G/blspbGTReJGz9GDbvwvn
 X9RWmIe2gNObSLqaV3Q7qp1FIqgzAru1xFYIzqI6YvcuuMK2qtStuKUSIVMOJSqmI6dm
 BPoNTK3RJOTtMS4r5R0/fgt6gC09QEaF33S1hQQMYGR17/I4glNOs//vmq3WF3lKu3w0
 Vk8MMKKPcGX6oDpVAtobH5HjzxrdlEAQWlhYxl7C2a+70c83V7wsaIbMlLsgeVKmBcSn
 djQw==
X-Gm-Message-State: AOAM533u0uM2C8weCo79agu7gobq53WyhMJiXdOfbQlgANHVhXI+z7LR
 s9wLvjP5wZ6wmVTIny99QkGE7q0DsJCy6maCUFHFFxZAlAf13juNI3mxKb93VJI30FY4QRBjSzt
 gUeekb3XE5SJd1ST7gFwnU1MeurSFRe5o9RYMwPrqIzu0oyG3NzAZXW+Li1AsZw1l
X-Received: by 2002:a05:620a:201c:: with SMTP id
 c28mr1426442qka.345.1625672478068; 
 Wed, 07 Jul 2021 08:41:18 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwojfy+YBGOk/GwdZnszp7IelSTU3xpP+w5siTr6HpAxcL3WuX1HvceTHfEDaEn9bWWlHXLnA==
X-Received: by 2002:a05:620a:201c:: with SMTP id
 c28mr1426420qka.345.1625672477812; 
 Wed, 07 Jul 2021 08:41:17 -0700 (PDT)
Received: from localhost.localdomain
 (bras-base-toroon474qw-grc-65-184-144-111-238.dsl.bell.ca. [184.144.111.238])
 by smtp.gmail.com with ESMTPSA id x20sm8614057qkp.15.2021.07.07.08.41.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 07 Jul 2021 08:41:17 -0700 (PDT)
From: Peter Xu <peterx@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2] docs: Add '-device intel-iommu' entry
Date: Wed,  7 Jul 2021 11:41:14 -0400
Message-Id: <20210707154114.197580-1-peterx@redhat.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=peterx@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.439,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Yi Liu <yi.l.liu@intel.com>, "Michael S . Tsirkin" <mst@redhat.com>,
 Jason Wang <jasowang@redhat.com>, peterx@redhat.com,
 Alex Williamson <alex.williamson@redhat.com>, Jing Zhao <jinzhao@redhat.com>,
 Lei Yang <leiyang@redhat.com>, Chao Yang <chayang@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The parameters of intel-iommu device are non-trivial to understand.  Add an
entry for it so that people can reference to it when using.

There're actually a few more options there, but I hide them explicitly because
they shouldn't be used by normal QEMU users.

Cc: Chao Yang <chayang@redhat.com>
Cc: Lei Yang <leiyang@redhat.com>
Cc: Jing Zhao <jinzhao@redhat.com>
Cc: Jason Wang <jasowang@redhat.com>
Cc: Michael S. Tsirkin <mst@redhat.com>
Cc: Alex Williamson <alex.williamson@redhat.com>
Reviewed-by: Jason Wang <jasowang@redhat.com>
Reviewed-by: Yi Liu <yi.l.liu@intel.com>
Signed-off-by: Peter Xu <peterx@redhat.com>
---
v2:
- Drop "in the guest" in intremap entry [Jason]
- Explain how the default value of intremap is chosen [Eric]
- Add r-bs for Jason and Yi
Signed-off-by: Peter Xu <peterx@redhat.com>
---
 qemu-options.hx | 33 +++++++++++++++++++++++++++++++++
 1 file changed, 33 insertions(+)

diff --git a/qemu-options.hx b/qemu-options.hx
index 8965dabc83..0fcc8973dd 100644
--- a/qemu-options.hx
+++ b/qemu-options.hx
@@ -926,6 +926,39 @@ SRST
 
 ``-device pci-ipmi-bt,bmc=id``
     Like the KCS interface, but defines a BT interface on the PCI bus.
+
+``-device intel-iommu[,option=...]``
+    This is only supported by ``-machine q35``, which will enable Intel VT-d
+    emulation within the guest.  It supports below options:
+
+    ``intremap=on|off`` (default: auto)
+        This enables interrupt remapping feature.  It's required to enable
+        complete x2apic.  Currently it only supports kvm kernel-irqchip modes
+        ``off`` or ``split``, while full kernel-irqchip is not yet supported.
+        The default value is "auto", which will be decided by the mode of
+        kernel-irqchip.
+
+    ``caching-mode=on|off`` (default: off)
+        This enables caching mode for the VT-d emulated device.  When
+        caching-mode is enabled, each guest DMA buffer mapping will generate an
+        IOTLB invalidation from the guest IOMMU driver to the vIOMMU device in
+        a synchronous way.  It is required for ``-device vfio-pci`` to work
+        with the VT-d device, because host assigned devices requires to setup
+        the DMA mapping on the host before guest DMA starts.
+
+    ``device-iotlb=on|off`` (default: off)
+        This enables device-iotlb capability for the emulated VT-d device.  So
+        far virtio/vhost should be the only real user for this parameter,
+        paired with ats=on configured for the device.
+
+    ``aw-bits=39|48`` (default: 39)
+        This decides the address width of IOVA address space.  The address
+        space has 39 bits width for 3-level IOMMU page tables, and 48 bits for
+        4-level IOMMU page tables.
+
+    Please also refer to the wiki page for general scenarios of VT-d
+    emulation in QEMU: https://wiki.qemu.org/Features/VT-d.
+
 ERST
 
 DEF("name", HAS_ARG, QEMU_OPTION_name,
-- 
2.31.1


