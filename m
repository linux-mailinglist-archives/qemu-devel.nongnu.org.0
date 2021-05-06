Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F3BFE375BD5
	for <lists+qemu-devel@lfdr.de>; Thu,  6 May 2021 21:35:52 +0200 (CEST)
Received: from localhost ([::1]:60294 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lejmp-0007EI-IL
	for lists+qemu-devel@lfdr.de; Thu, 06 May 2021 15:35:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44186)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lvivier@redhat.com>)
 id 1lejkw-0006l8-Gv
 for qemu-devel@nongnu.org; Thu, 06 May 2021 15:33:54 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:52688)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lvivier@redhat.com>)
 id 1lejkq-0000GA-H0
 for qemu-devel@nongnu.org; Thu, 06 May 2021 15:33:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620329626;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=Sa+zmAZFYBuVWBr7dqXqNRBpzu4wYHbErzK41EuC+Ps=;
 b=J4vT/QhO49cxGAtnsNZuAlw/0yGYJvCYoH3BnRh3V+hgwz3F1CqBXE6OvvseTDKQzHJu5v
 +35GTQpy8R+wJEKAXCfd88xZZ7KnIv8Ccomlb9fj1nKWCXY6j7/JNa02gdWm2vKiPv2w8v
 dW+8/jcZeXi1EzftySROxIilWp2Y+V4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-290-GAntSWVQNUqQvu2e8LPowQ-1; Thu, 06 May 2021 15:33:44 -0400
X-MC-Unique: GAntSWVQNUqQvu2e8LPowQ-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id AA48F801107
 for <qemu-devel@nongnu.org>; Thu,  6 May 2021 19:33:43 +0000 (UTC)
Received: from thinkpad.redhat.com (ovpn-114-90.ams2.redhat.com [10.36.114.90])
 by smtp.corp.redhat.com (Postfix) with ESMTP id B7CC16E706;
 Thu,  6 May 2021 19:33:42 +0000 (UTC)
From: Laurent Vivier <lvivier@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH] scripts: add a script to list virtio devices in a system
Date: Thu,  6 May 2021 21:33:41 +0200
Message-Id: <20210506193341.140141-1-lvivier@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=lvivier@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=lvivier@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.69,
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
Cc: Laurent Vivier <lvivier@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Add "lsvirtio" that lists all virtio devices in a system
the same way lspci does for the PCI cards.

For instance:

 $ ./lsvirtio
 0000:01:00.0 virtio0 Red Hat, Inc. (PCI) Virtio Network Card
	 Subsystem: virtio
	 Modalias: virtio:d00000001v00001AF4
	 Status: ACKNOWLEDGE DRIVER_OK DRIVER FEATURES_OK
	 Feature: CSUM
	 Feature: GUEST_CSUM
	 Feature: CTRL_GUEST_OFFLOADS
	 Feature: MAC
	 Feature: GUEST_TSO4
	 Feature: GUEST_TSO6
	 Feature: GUEST_ECN
	 Feature: GUEST_UFO
	 Feature: HOST_TSO4
	 Feature: HOST_TSO6
	 Feature: HOST_ECN
	 Feature: HOST_UFO
	 Feature: MRG_RXBUF
	 Feature: STATUS
	 Feature: CTRL_VQ
	 Feature: CTRL_RX
	 Feature: CTRL_VLAN
	 Feature: GUEST_ANNOUNCE
	 Feature: CTRL_MAC_ADDR
	 Feature: RING_INDIRECT_DESC
	 Feature: RING_EVENT_IDX
	 Feature: VERSION_1
	 Kernel driver in use: virtio_net
         Interfaces: enp1s0

 0000:03:00.0 virtio1 Red Hat, Inc. (PCI) Virtio Console
	 Subsystem: virtio
	 Modalias: virtio:d00000003v00001AF4
	 Status: ACKNOWLEDGE DRIVER_OK DRIVER FEATURES_OK
	 Feature: MULTIPORT
	 Feature: RING_INDIRECT_DESC
	 Feature: RING_EVENT_IDX
	 Feature: VERSION_1
	 Kernel driver in use: virtio_console
         Interfaces: vport1p1
 ...

This is useful to have the list of virtio devices when they are not
mapped by a PCI card:

 $ ./lsvirtio
 virtio-mmio.121 virtio0 Virt (MMIO) Virtio 9P transport
	 Subsystem: virtio
	 Modalias: virtio:d00000009v554D4551
	 Status: FEATURES_OK ACKNOWLEDGE DRIVER DRIVER_OK
	 Feature: MOUNT_TAG
	 Feature: RING_INDIRECT_DESC
	 Feature: RING_EVENT_IDX
	 Feature: VERSION_1
	 Kernel driver in use: 9pnet_virtio
         Interfaces: home0

 virtio-mmio.122 virtio1 Virt (MMIO) Virtio GPU Device
	 Subsystem: virtio
	 Modalias: virtio:d00000010v554D4551
	 Status: FEATURES_OK ACKNOWLEDGE DRIVER DRIVER_OK
	 Feature: EDID
	 Feature: RING_INDIRECT_DESC
	 Feature: RING_EVENT_IDX
	 Feature: VERSION_1
	 Kernel driver in use: virtio_gpu
         Interfaces: fb0
 ...

Signed-off-by: Laurent Vivier <lvivier@redhat.com>
---
 scripts/lsvirtio | 317 +++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 317 insertions(+)
 create mode 100755 scripts/lsvirtio

diff --git a/scripts/lsvirtio b/scripts/lsvirtio
new file mode 100755
index 000000000000..f457d5b7344d
--- /dev/null
+++ b/scripts/lsvirtio
@@ -0,0 +1,317 @@
+#!/usr/bin/env python3
+#
+# Copyright (C) 2021 Red Hat, Inc.
+#
+# SPDX-License-Identifier: GPL-2.0-or-later
+
+import os
+
+# Virtual I/O Device (VIRTIO) Version 1.1
+
+# 2.1 Device Status Field
+status_name = {
+    ( 1, 'ACKNOWLEDGE' ),
+    ( 2, 'DRIVER') ,
+    ( 4, 'DRIVER_OK' ),
+    ( 8, 'FEATURES_OK' ),
+    ( 64, 'DEVICE_NEEDS_RESET' ),
+    ( 128, 'FAILED' )
+}
+
+# 5 Device Types
+device_name = {
+    1:'Network Card',
+    2:'Block Device',
+    3:'Console',
+    4:'Entropy Source',
+    5:'Memory Ballooning (traditional)',
+    6:'ioMemory',
+    7:'rpmsg',
+    8:'SCSI host',
+    9:'9P transport',
+    10:'MAC80211 WLAN',
+    11:'rproc serial',
+    12:'CAIF',
+    13:'Memory Balloon',
+    16:'GPU Device',
+    17:'Timer/Clock Device',
+    18:'Input Device',
+    19:'Socket Device',
+    20:'Crypto Device',
+    21:'Signal Distribution Module',
+    22:'pstore Device',
+    23:'IOMMU Device',
+    24:'Memory Device',
+# From linux headers
+    26:'Filesystem',
+    27:'pmem',
+    29:'mac80211-hwsim',
+}
+
+# 5.1 Network Device
+# 5.1.3 Feature bits
+net_feature_name = {
+    0:'CSUM',
+    1:'GUEST_CSUM',
+    2:'CTRL_GUEST_OFFLOADS',
+    3:'MTU',
+    5:'MAC',
+    6:'GSO',
+    7:'GUEST_TSO4',
+    8:'GUEST_TSO6',
+    9:'GUEST_ECN',
+    10:'GUEST_UFO',
+    11:'HOST_TSO4',
+    12:'HOST_TSO6',
+    13:'HOST_ECN',
+    14:'HOST_UFO',
+    15:'MRG_RXBUF',
+    16:'STATUS',
+    17:'CTRL_VQ',
+    18:'CTRL_RX',
+    19:'CTRL_VLAN',
+    21:'GUEST_ANNOUNCE',
+    22:'MQ',
+    23:'CTRL_MAC_ADDR',
+    41:'GUEST_RSC4',
+    42:'GUEST_RSC6',
+    61:'RSC_EXT',
+    62:'STANDBY',
+}
+
+def get_feature_net(feature):
+    return net_feature_name[feature]
+
+# 5.2 Block Device
+# 5.2.3 Feature bits
+block_feature_name = {
+    0:'BARRIER',
+    1:'SIZE_MAX',
+    2:'SEG_MAX',
+    4:'GEOMETRY',
+    5:'RO',
+    6:'BLK_SIZE',
+    7:'SCSI',
+    9:'FLUSH',
+    10:'TOPOLOGY',
+    11:'CONFIG_WCE',
+    13:'DISCARD',
+    14:'WRITE_ZEROES',
+}
+
+def get_feature_block(feature):
+    return block_feature_name[feature]
+
+# 5.3 Console Device
+# 5.3.3 Feature bits
+console_feature_name = {
+    0:'SIZE',
+    1:'MULTIPORT',
+    2:'EMERG_WRITE',
+}
+
+def get_feature_console(feature):
+    return console_feature_name[feature]
+
+# 5.4 Entropy Device
+# 5.4.3 Feature bits
+# No feature bits
+
+# 5.5 Traditional Memory Balloon Device
+# 5.5.3 Feature bits
+balloon_traditional_feature_name = {
+    0:'MUST_TELL_HOST',
+    1:'STATS_VQ',
+    2:'DEFLATE_ON_OOM',
+# from linux headers
+    3:'FREE_PAGE_HINT',
+    4:'PAGE_POISON',
+    5:'REPORTING',
+}
+
+def get_feature_balloon_traditional(feature):
+    return balloon_traditional_feature_name[feature]
+
+# 5.6 SCSI Host Device
+# 5.6.3 Feature bits
+scsi_feature_name = {
+    0:'INOUT',
+    1:'HOTPLUG',
+    2:'CHANGE',
+    3:'T10_PI',
+}
+
+def get_feature_scsi_host(feature):
+    return scsi_feature_name[feature]
+
+# 5.7 GPU Device
+# 5.7.3 Feature bits
+gpu_feature_name = {
+    0:'VIRGL',
+    1:'EDID',
+}
+
+def get_feature_gpu(feature):
+    return gpu_feature_name[feature]
+
+# 5.8 Input Device
+# 5.8.3 Feature bits
+# No feature bits
+
+# 5.9 Crypto Device
+# 5.9.3 Feature bits
+crypto_feature_name = {
+    0:'REVISION_1',
+    1:'CIPHER_STATELESS_MODE',
+    2:'HASH_STATELESS_MODE',
+    3:'MAC_STATELESS_MODE',
+    4:'AEAD_STATELESS_MODE',
+}
+
+def get_feature_crypto(feature):
+    return crypto_feature_name[feature]
+
+# 5.10 Socket Device
+# 5.10.3 Feature bits
+# No feature bits
+
+# following feature bits from linux headers
+# 9P
+ninep_feature_name = {
+    0:'MOUNT_TAG',
+}
+
+def get_feature_9p(feature):
+    return ninep_feature_name[feature]
+
+# IOMMU
+iommu_feature_name = {
+    0:'INPUT_RANGE',
+    1:'DOMAIN_RANGE',
+    2:'MAP_UNMAP',
+    3:'BYPASS',
+    4:'PROBE',
+    5:'MMIO',
+}
+
+def get_feature_iommu(feature):
+    return iommu_feature_name[feature]
+
+# MEM
+
+mem_feature_name = {
+    0:'ACPI_PXM',
+}
+
+def get_feature_memory(feature):
+    return mem_feature_name[feature]
+
+get_feature = {
+    1:get_feature_net,
+    2:get_feature_block,
+    3:get_feature_console,
+    5:get_feature_balloon_traditional,
+    8:get_feature_scsi_host,
+    9:get_feature_9p,
+    16:get_feature_gpu,
+    20:get_feature_crypto,
+    23:get_feature_iommu,
+    24:get_feature_memory,
+}
+
+# 6 Reserved Feature Bits
+reserved_feature_name = {
+    24:'NOTIFY_ON_EMPTY',
+    27:'ANY_LAYOUT',
+    28:'RING_INDIRECT_DESC',
+    29:'RING_EVENT_IDX',
+    30:'BAD_FEATURE',
+    32:'VERSION_1',
+    33:'ACCESS_PLATFORM',
+    34:'RING_PACKED',
+    35:'IN_ORDER',
+    36:'ORDER_PLATFORM',
+    37:'SR_IOV',
+    38:'NOTIFICATION_DATA'
+}
+
+vendor_name = {
+    0x554D4551:'Virt (MMIO)',
+    0x1AF4:'Red Hat, Inc. (PCI)',
+}
+
+def get_status_name(status):
+    result = ''
+    for name in status_name:
+        if name[0] & status:
+            result = result + name[1] + ' '
+    return result
+
+def list_interfaces(path):
+    interfaces = ''
+    for interface in sorted(os.listdir(path)):
+        interfaces = interfaces + interface + ' '
+    return interfaces
+
+def get_net_interfaces(path):
+    return list_interfaces(path + '/net')
+
+def get_block_interfaces(path):
+    return list_interfaces(path + '/block')
+
+def get_console_interfaces(path):
+    return list_interfaces(path + '/block')
+
+def get_9p_interfaces(path):
+    return open(path + '/mount_tag').read().rstrip()
+
+def get_gpu_interfaces(path):
+    return list_interfaces(path + '/graphics')
+
+def get_input_interaces(path):
+    return list_interfaces(path + '/input')
+
+get_interfaces = {
+    1:get_net_interfaces,
+    2:get_block_interfaces,
+    3:get_console_interfaces,
+    9:get_9p_interfaces,
+    16:get_gpu_interfaces,
+    18:get_input_interaces,
+}
+
+busses = '/sys/bus/virtio'
+devices = busses + '/devices'
+
+for device in sorted(os.listdir(devices)):
+    bus = os.path.basename(os.path.dirname(os.readlink(devices + '/' + device)))
+    path = devices + '/' + device
+    subsystem = os.path.basename(os.readlink(path + '/subsystem'))
+    device_id = int(open(path + '/device').read(), base = 0)
+    vendor = int(open(path + '/vendor').read(), base = 0)
+    driver = os.path.basename(os.readlink(path + '/driver'))
+    modalias = open(path + '/modalias').read().rstrip()
+    features = open(path + '/features').read().rstrip()
+    status = open(path + '/status').read().rstrip()
+
+    print(bus + ' ' + device + ' ' + vendor_name[vendor] + ' Virtio ' + device_name[device_id])
+    print('\tSubsystem: ' + subsystem)
+    print('\tModalias: ' + modalias)
+    print('\tStatus: ' + get_status_name(int(status, base=0)))
+    bit=0
+    for feature in features:
+        if feature == '1':
+            try:
+                if bit >= 24:
+                    print('\tFeature: ' + reserved_feature_name[bit])
+                else:
+                    print('\tFeature: ' + get_feature[device_id](bit))
+            except:
+                print('\tFeature: ' + str(bit))
+        bit += 1
+    print('\tKernel driver in use: ' + driver)
+    try:
+        print('\tInterfaces: ' + get_interfaces[device_id](path))
+    except:
+        print('\tNo interface')
+    print('')
-- 
2.31.1


