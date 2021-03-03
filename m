Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B67732BA26
	for <lists+qemu-devel@lfdr.de>; Wed,  3 Mar 2021 20:15:27 +0100 (CET)
Received: from localhost ([::1]:35442 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lHWxw-0001vA-0n
	for lists+qemu-devel@lfdr.de; Wed, 03 Mar 2021 14:15:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39902)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lHWvB-0008Sv-R6
 for qemu-devel@nongnu.org; Wed, 03 Mar 2021 14:12:33 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:30654)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lHWvA-0006rs-5B
 for qemu-devel@nongnu.org; Wed, 03 Mar 2021 14:12:33 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614798751;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=lI2hg/5TdIAfeO1bSBITqXaKfCArmvxD5CXNkSGoaBM=;
 b=Yox6x7JI59Jnn7YweD3mBtiu6DqMtiVqXxtybh3QALgqMvVQcXSqpmjcaK8mdN6puFtqQC
 HuztSTpacAjZhnEp+NMXoCvL0neNYmbH/tEN38HBDCThQtHiur1npxIU+o0ktn+dOly19v
 kGP++uxVkTJn107tIdaUqnT0jAwN6jE=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-378-ul0lOS3mM7y7kRr6HeRNnQ-1; Wed, 03 Mar 2021 14:12:29 -0500
X-MC-Unique: ul0lOS3mM7y7kRr6HeRNnQ-1
Received: by mail-wm1-f69.google.com with SMTP id q24so3445581wmc.1
 for <qemu-devel@nongnu.org>; Wed, 03 Mar 2021 11:12:29 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=lI2hg/5TdIAfeO1bSBITqXaKfCArmvxD5CXNkSGoaBM=;
 b=IbLiGpCzG/hCjBMQeOTBUCaeeK/menevAnsK9lyB+fwoqV5eBdf97OeHTNejsfwQIT
 Hc1Q6DRmHJOd+QoRjOhGzQFnCRRI2bOEcevZHu/cGO428o/88rcwmIxBUC2N0XhLCLkz
 RFVpWJl0FGbM52+FCswVWF9rkfAatNN7B+DwHeqGn8PBkGawJ9CU9wmjIl9xfDRSDTiw
 EseNzLD/u8EDJ7n0ixSsDZH5tZkAFjN4WEK5qCr/tfLptuyLsJiKRZVY39Cs60N9kScX
 J7B1ljo67vmWxckQNb3nPj/0YPFo4Ra4o+L9jew2FQhx+3h6pqGHhQMST5XNX8J/fyo3
 d7VQ==
X-Gm-Message-State: AOAM5333Sbb5sHLj5B9ZEFpHRUo8PqSs/C/qvSuxtZ46PHld/OCINqVx
 4U9z4HctWLN6jPy6t0Y+G2d5WxVE1u5cChx4M9NDv3vO4noaPaYy5TNd9XZNM83yOSpJPqf+20l
 9q5WzPjqMga1/jmer3KvEOV+2CpKjlJ5oIoqbDDf7CkPWPAEZWmQFglat/k3hJ/2Z
X-Received: by 2002:a5d:6807:: with SMTP id w7mr113485wru.103.1614798748196;
 Wed, 03 Mar 2021 11:12:28 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzJ/vu7VkJDNRTJxHn8KacjuJXnNtB5wI32n3AUCT7z22SIxTEMI2t8fZ+4Xaeq6zopWEhjJA==
X-Received: by 2002:a5d:6807:: with SMTP id w7mr113461wru.103.1614798748012;
 Wed, 03 Mar 2021 11:12:28 -0800 (PST)
Received: from x1w.redhat.com (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id b186sm5250134wmc.44.2021.03.03.11.12.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 Mar 2021 11:12:27 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH v3 04/10] hw/net: vmxnet3: Remove the logic of padding
 short frames in the receive path
Date: Wed,  3 Mar 2021 20:11:59 +0100
Message-Id: <20210303191205.1656980-5-philmd@redhat.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210303191205.1656980-1-philmd@redhat.com>
References: <20210303191205.1656980-1-philmd@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Dmitry Fleytman <dmitry.fleytman@gmail.com>, Jason Wang <jasowang@redhat.com>,
 Bin Meng <bin.meng@windriver.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Bin Meng <bmeng.cn@gmail.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Bin Meng <bin.meng@windriver.com>

Now that we have implemented unified short frames padding in the
QEMU networking codes, remove the same logic in the NIC codes.

This actually reverts commit 40a87c6c9b11ef9c14e0301f76abf0eb2582f08e.

Signed-off-by: Bin Meng <bin.meng@windriver.com>
Message-Id: <1614763306-18026-4-git-send-email-bmeng.cn@gmail.com>
Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 hw/net/vmxnet3.c | 10 ----------
 1 file changed, 10 deletions(-)

diff --git a/hw/net/vmxnet3.c b/hw/net/vmxnet3.c
index eff299f6290..d993cce097a 100644
--- a/hw/net/vmxnet3.c
+++ b/hw/net/vmxnet3.c
@@ -39,7 +39,6 @@
 
 #define PCI_DEVICE_ID_VMWARE_VMXNET3_REVISION 0x1
 #define VMXNET3_MSIX_BAR_SIZE 0x2000
-#define MIN_BUF_SIZE 60
 
 /* Compatibility flags for migration */
 #define VMXNET3_COMPAT_FLAG_OLD_MSI_OFFSETS_BIT 0
@@ -1951,7 +1950,6 @@ vmxnet3_receive(NetClientState *nc, const uint8_t *buf, size_t size)
 {
     VMXNET3State *s = qemu_get_nic_opaque(nc);
     size_t bytes_indicated;
-    uint8_t min_buf[MIN_BUF_SIZE];
 
     if (!vmxnet3_can_receive(nc)) {
         VMW_PKPRN("Cannot receive now");
@@ -1964,14 +1962,6 @@ vmxnet3_receive(NetClientState *nc, const uint8_t *buf, size_t size)
         size -= sizeof(struct virtio_net_hdr);
     }
 
-    /* Pad to minimum Ethernet frame length */
-    if (size < sizeof(min_buf)) {
-        memcpy(min_buf, buf, size);
-        memset(&min_buf[size], 0, sizeof(min_buf) - size);
-        buf = min_buf;
-        size = sizeof(min_buf);
-    }
-
     net_rx_pkt_set_packet_type(s->rx_pkt,
         get_eth_packet_type(PKT_GET_ETH_HDR(buf)));
 
-- 
2.26.2


