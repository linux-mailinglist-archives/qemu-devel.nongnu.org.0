Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9969B1A06CD
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Apr 2020 07:53:39 +0200 (CEST)
Received: from localhost ([::1]:41642 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jLhB4-000631-Lp
	for lists+qemu-devel@lfdr.de; Tue, 07 Apr 2020 01:53:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60118)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <arilou@gmail.com>) id 1jLh9n-0004bo-Jv
 for qemu-devel@nongnu.org; Tue, 07 Apr 2020 01:52:21 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <arilou@gmail.com>) id 1jLh9m-0002Xg-45
 for qemu-devel@nongnu.org; Tue, 07 Apr 2020 01:52:19 -0400
Received: from mail-wm1-x343.google.com ([2a00:1450:4864:20::343]:54241)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <arilou@gmail.com>) id 1jLh9l-0002Wz-TO
 for qemu-devel@nongnu.org; Tue, 07 Apr 2020 01:52:18 -0400
Received: by mail-wm1-x343.google.com with SMTP id d77so475502wmd.3
 for <qemu-devel@nongnu.org>; Mon, 06 Apr 2020 22:52:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=nB3g7cVPtrxnSwQ59aiunL+jtz+a9s2+uCzKtHmRtTI=;
 b=jWcbIFWT4TTFUnlrewc/pERPG5DZGgcJJEe975LxrQRnoKwRrAotEP+qsG4dlBpDeD
 q+zi7FeQ7eW7vuR0N+NjDRjEyD78iw2RzfGb1+ivB6Tq3GhQ7jy0l91+KNaqiGzcgUvx
 QSOs8fVbDn58hZct6ZqNqDFJusPsHe8e9CVm9B5O64Qw6GggBcsKScOI1x+S03N7e1TH
 ZjkQvm9KrlrZE9P53kaQrw88FlEJkhXPrdv+UD/kGAomDyvhwOWNrnhNXMlBPlrPzJdf
 cBncHmgLZM5cWEA8XgCZ39DZGH2d9TuWOZ15vfx/BFAfZEqf/SwS80/DBASqcYEg+lNz
 wUAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=nB3g7cVPtrxnSwQ59aiunL+jtz+a9s2+uCzKtHmRtTI=;
 b=WveCP0pvdEy0AMrQ7uUQMXbrTDXxXTlNykAQSOKSVG/MdoChTS5YTgJH/W0z2CG4YH
 kDG73TzCU4qRPqvH1eMfGZ9WkbFWPtSn+9zjWjlD9dktG7ThF+bxf51p7Ac6zSqvRDGi
 fl0QZ/qjNDVx4u7+HCgMDpey0o8YcBSueroZa+/XxsUT+FLmlS12SRbKgFf2hhczxWLx
 8LaL+lqD0YWBWs+eCpvIHUusocbm251MEarM59O15qFR/Dwlf1eqgkX/hakjPa8xc194
 ePCoS8r1heK7ixFvi2eN/Zpuqy4Hg2NQD68iOTPu75DLodDz7MaSzI76rwBy5v4cKJrd
 OlcQ==
X-Gm-Message-State: AGi0PuYsUvRJtDsjURm93tLu79TP6OL5JYfFJRk+QExHdNLMnfHDs17m
 cXgq65CXrfQ5mX+U7ytZJT+NFsF+Ykk=
X-Google-Smtp-Source: APiQypKkG9/fA2snDtg9m85nAw5HyscOF47MQsx7q1aG3apnlpmv+IA+8QE71lm1BMzhGN0tqnN6qg==
X-Received: by 2002:a05:600c:4102:: with SMTP id
 j2mr537757wmi.159.1586238736722; 
 Mon, 06 Apr 2020 22:52:16 -0700 (PDT)
Received: from jondnuc.lan (IGLD-84-229-155-55.inter.net.il. [84.229.155.55])
 by smtp.gmail.com with ESMTPSA id
 n11sm32271007wrg.72.2020.04.06.22.52.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Apr 2020 22:52:16 -0700 (PDT)
From: Jon Doron <arilou@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 3/7] vmbus: add vmbus protocol definitions
Date: Tue,  7 Apr 2020 08:51:52 +0300
Message-Id: <20200407055156.137249-4-arilou@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200407055156.137249-1-arilou@gmail.com>
References: <20200407055156.137249-1-arilou@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::343
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
Cc: mail@maciej.szmigiero.name, eyakovlev@virtuozzo.com, ehabkost@redhat.com,
 rvkagan@gmail.com, liran.alon@oracle.com, Roman Kagan <rkagan@virtuozzo.com>,
 pbonzini@redhat.com, vkuznets@redhat.com,
 "Maciej S . Szmigiero" <maciej.szmigiero@oracle.com>,
 Jon Doron <arilou@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Add a header with data structures and constants used in Hyper-V VMBus
hypervisor <-> guest interactions.

Based on the respective stuff from Linux kernel.

Signed-off-by: Roman Kagan <rkagan@virtuozzo.com>
Signed-off-by: Maciej S. Szmigiero <maciej.szmigiero@oracle.com>
Signed-off-by: Jon Doron <arilou@gmail.com>
---
 include/hw/hyperv/vmbus-proto.h | 222 ++++++++++++++++++++++++++++++++
 1 file changed, 222 insertions(+)
 create mode 100644 include/hw/hyperv/vmbus-proto.h

diff --git a/include/hw/hyperv/vmbus-proto.h b/include/hw/hyperv/vmbus-proto.h
new file mode 100644
index 0000000000..4628d3b323
--- /dev/null
+++ b/include/hw/hyperv/vmbus-proto.h
@@ -0,0 +1,222 @@
+/*
+ * QEMU Hyper-V VMBus support
+ *
+ * Copyright (c) 2017-2018 Virtuozzo International GmbH.
+ *
+ * This work is licensed under the terms of the GNU GPL, version 2 or later.
+ * See the COPYING file in the top-level directory.
+ */
+
+#ifndef HW_HYPERV_VMBUS_PROTO_H
+#define HW_HYPERV_VMBUS_PROTO_H
+
+#define VMBUS_VERSION_WS2008                    ((0 << 16) | (13))
+#define VMBUS_VERSION_WIN7                      ((1 << 16) | (1))
+#define VMBUS_VERSION_WIN8                      ((2 << 16) | (4))
+#define VMBUS_VERSION_WIN8_1                    ((3 << 16) | (0))
+#define VMBUS_VERSION_WIN10                     ((4 << 16) | (0))
+#define VMBUS_VERSION_INVAL                     -1
+#define VMBUS_VERSION_CURRENT                   VMBUS_VERSION_WIN10
+
+#define VMBUS_MESSAGE_CONNECTION_ID             1
+#define VMBUS_EVENT_CONNECTION_ID               2
+#define VMBUS_MONITOR_CONNECTION_ID             3
+#define VMBUS_SINT                              2
+
+#define VMBUS_MSG_INVALID               0
+#define VMBUS_MSG_OFFERCHANNEL          1
+#define VMBUS_MSG_RESCIND_CHANNELOFFER  2
+#define VMBUS_MSG_REQUESTOFFERS         3
+#define VMBUS_MSG_ALLOFFERS_DELIVERED   4
+#define VMBUS_MSG_OPENCHANNEL           5
+#define VMBUS_MSG_OPENCHANNEL_RESULT    6
+#define VMBUS_MSG_CLOSECHANNEL          7
+#define VMBUS_MSG_GPADL_HEADER          8
+#define VMBUS_MSG_GPADL_BODY            9
+#define VMBUS_MSG_GPADL_CREATED         10
+#define VMBUS_MSG_GPADL_TEARDOWN        11
+#define VMBUS_MSG_GPADL_TORNDOWN        12
+#define VMBUS_MSG_RELID_RELEASED        13
+#define VMBUS_MSG_INITIATE_CONTACT      14
+#define VMBUS_MSG_VERSION_RESPONSE      15
+#define VMBUS_MSG_UNLOAD                16
+#define VMBUS_MSG_UNLOAD_RESPONSE       17
+#define VMBUS_MSG_COUNT                 18
+
+#define VMBUS_MESSAGE_SIZE_ALIGN        sizeof(uint64_t)
+
+#define VMBUS_PACKET_INVALID                    0x0
+#define VMBUS_PACKET_SYNCH                      0x1
+#define VMBUS_PACKET_ADD_XFER_PAGESET           0x2
+#define VMBUS_PACKET_RM_XFER_PAGESET            0x3
+#define VMBUS_PACKET_ESTABLISH_GPADL            0x4
+#define VMBUS_PACKET_TEARDOWN_GPADL             0x5
+#define VMBUS_PACKET_DATA_INBAND                0x6
+#define VMBUS_PACKET_DATA_USING_XFER_PAGES      0x7
+#define VMBUS_PACKET_DATA_USING_GPADL           0x8
+#define VMBUS_PACKET_DATA_USING_GPA_DIRECT      0x9
+#define VMBUS_PACKET_CANCEL_REQUEST             0xa
+#define VMBUS_PACKET_COMP                       0xb
+#define VMBUS_PACKET_DATA_USING_ADDITIONAL_PKT  0xc
+#define VMBUS_PACKET_ADDITIONAL_DATA            0xd
+
+#define VMBUS_CHANNEL_USER_DATA_SIZE            120
+
+#define VMBUS_OFFER_MONITOR_ALLOCATED           0x1
+#define VMBUS_OFFER_INTERRUPT_DEDICATED         0x1
+
+#define VMBUS_RING_BUFFER_FEAT_PENDING_SZ       (1ul << 0)
+
+#define VMBUS_CHANNEL_ENUMERATE_DEVICE_INTERFACE      0x1
+#define VMBUS_CHANNEL_SERVER_SUPPORTS_TRANSFER_PAGES  0x2
+#define VMBUS_CHANNEL_SERVER_SUPPORTS_GPADLS          0x4
+#define VMBUS_CHANNEL_NAMED_PIPE_MODE                 0x10
+#define VMBUS_CHANNEL_LOOPBACK_OFFER                  0x100
+#define VMBUS_CHANNEL_PARENT_OFFER                    0x200
+#define VMBUS_CHANNEL_REQUEST_MONITORED_NOTIFICATION  0x400
+#define VMBUS_CHANNEL_TLNPI_PROVIDER_OFFER            0x2000
+
+#define VMBUS_PACKET_FLAG_REQUEST_COMPLETION    1
+
+typedef struct vmbus_message_header {
+    uint32_t message_type;
+    uint32_t _padding;
+} vmbus_message_header;
+
+typedef struct vmbus_message_initiate_contact {
+    vmbus_message_header header;
+    uint32_t version_requested;
+    uint32_t target_vcpu;
+    uint64_t interrupt_page;
+    uint64_t monitor_page1;
+    uint64_t monitor_page2;
+} vmbus_message_initiate_contact;
+
+typedef struct vmbus_message_version_response {
+    vmbus_message_header header;
+    uint8_t version_supported;
+    uint8_t status;
+} vmbus_message_version_response;
+
+typedef struct vmbus_message_offer_channel {
+    vmbus_message_header header;
+    uint8_t  type_uuid[16];
+    uint8_t  instance_uuid[16];
+    uint64_t _reserved1;
+    uint64_t _reserved2;
+    uint16_t channel_flags;
+    uint16_t mmio_size_mb;
+    uint8_t  user_data[VMBUS_CHANNEL_USER_DATA_SIZE];
+    uint16_t sub_channel_index;
+    uint16_t _reserved3;
+    uint32_t child_relid;
+    uint8_t  monitor_id;
+    uint8_t  monitor_flags;
+    uint16_t interrupt_flags;
+    uint32_t connection_id;
+} vmbus_message_offer_channel;
+
+typedef struct vmbus_message_rescind_channel_offer {
+    vmbus_message_header header;
+    uint32_t child_relid;
+} vmbus_message_rescind_channel_offer;
+
+typedef struct vmbus_gpa_range {
+    uint32_t byte_count;
+    uint32_t byte_offset;
+    uint64_t pfn_array[];
+} vmbus_gpa_range;
+
+typedef struct vmbus_message_gpadl_header {
+    vmbus_message_header header;
+    uint32_t child_relid;
+    uint32_t gpadl_id;
+    uint16_t range_buflen;
+    uint16_t rangecount;
+    vmbus_gpa_range range[];
+} QEMU_PACKED vmbus_message_gpadl_header;
+
+typedef struct vmbus_message_gpadl_body {
+    vmbus_message_header header;
+    uint32_t message_number;
+    uint32_t gpadl_id;
+    uint64_t pfn_array[];
+} vmbus_message_gpadl_body;
+
+typedef struct vmbus_message_gpadl_created {
+    vmbus_message_header header;
+    uint32_t child_relid;
+    uint32_t gpadl_id;
+    uint32_t status;
+} vmbus_message_gpadl_created;
+
+typedef struct vmbus_message_gpadl_teardown {
+    vmbus_message_header header;
+    uint32_t child_relid;
+    uint32_t gpadl_id;
+} vmbus_message_gpadl_teardown;
+
+typedef struct vmbus_message_gpadl_torndown {
+    vmbus_message_header header;
+    uint32_t gpadl_id;
+} vmbus_message_gpadl_torndown;
+
+typedef struct vmbus_message_open_channel {
+    vmbus_message_header header;
+    uint32_t child_relid;
+    uint32_t open_id;
+    uint32_t ring_buffer_gpadl_id;
+    uint32_t target_vp;
+    uint32_t ring_buffer_offset;
+    uint8_t  user_data[VMBUS_CHANNEL_USER_DATA_SIZE];
+} vmbus_message_open_channel;
+
+typedef struct vmbus_message_open_result {
+    vmbus_message_header header;
+    uint32_t child_relid;
+    uint32_t open_id;
+    uint32_t status;
+} vmbus_message_open_result;
+
+typedef struct vmbus_message_close_channel {
+    vmbus_message_header header;
+    uint32_t child_relid;
+} vmbus_message_close_channel;
+
+typedef struct vmbus_ring_buffer {
+    uint32_t write_index;
+    uint32_t read_index;
+    uint32_t interrupt_mask;
+    uint32_t pending_send_sz;
+    uint32_t _reserved1[12];
+    uint32_t feature_bits;
+} vmbus_ring_buffer;
+
+typedef struct vmbus_packet_hdr {
+    uint16_t type;
+    uint16_t offset_qwords;
+    uint16_t len_qwords;
+    uint16_t flags;
+    uint64_t transaction_id;
+} vmbus_packet_hdr;
+
+typedef struct vmbus_pkt_gpa_direct {
+    uint32_t _reserved;
+    uint32_t rangecount;
+    vmbus_gpa_range range[];
+} vmbus_pkt_gpa_direct;
+
+typedef struct vmbus_xferpg_range {
+    uint32_t byte_count;
+    uint32_t byte_offset;
+} vmbus_xferpg_range;
+
+typedef struct vmbus_pkt_xferpg {
+    uint16_t buffer_id;
+    uint8_t sender_owns_set;
+    uint8_t _reserved;
+    uint32_t rangecount;
+    vmbus_xferpg_range range[];
+} vmbus_pkt_xferpg;
+
+#endif
-- 
2.24.1


