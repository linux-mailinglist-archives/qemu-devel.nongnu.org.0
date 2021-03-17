Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F30F33E9DB
	for <lists+qemu-devel@lfdr.de>; Wed, 17 Mar 2021 07:38:01 +0100 (CET)
Received: from localhost ([::1]:46908 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lMPoe-0003mL-8O
	for lists+qemu-devel@lfdr.de; Wed, 17 Mar 2021 02:38:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34336)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1lMPeN-0003rr-DT
 for qemu-devel@nongnu.org; Wed, 17 Mar 2021 02:27:28 -0400
Received: from mail-ej1-x633.google.com ([2a00:1450:4864:20::633]:45210)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1lMPeG-0000Au-2A
 for qemu-devel@nongnu.org; Wed, 17 Mar 2021 02:27:18 -0400
Received: by mail-ej1-x633.google.com with SMTP id mm21so704909ejb.12
 for <qemu-devel@nongnu.org>; Tue, 16 Mar 2021 23:27:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:subject:date:message-id:in-reply-to:references;
 bh=fYxXpZBSx/3UmjTv+pgNgyANPy1MdJ+W91DIofp+gdA=;
 b=rsjCm1p4oSaT/NrcdRais0wAaXOi8NWgu60uAYdQ7nDkABJvdk6iuSDHW6ordlQDtD
 QnEilhSqaQOmnEor0V6fGtDc4h3I1qdpbhwDPIVx+w9u7oWidG8S2lffYFXxmwxAbkwM
 eN0pFPXYuvGIMgXi3AytMThpamVAHHLIJ/eWLPDv6ZcO+/MPKQhGWkP5qE411dZwLvWa
 1PlggwZ4tGzB0Ci4e1qKBObf9o9HoEuss9Gur0ut5rCmjanQZMoS1xcoes9RLWHqHGun
 7Ly0iucbMmoSnHRGpjQyAXjSr7klNZHzBJRS3SUOWRYpUmtzD4zidZrnZmMR1vEJ0258
 Dc+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references;
 bh=fYxXpZBSx/3UmjTv+pgNgyANPy1MdJ+W91DIofp+gdA=;
 b=kqVyiIe+rFztFFgGbqWyLqlWIiHMm/ifGquZ0SuxWvUB4Qghq4yPQHvpvqNWEK+Z9W
 SNn/GpyTvMbAQi6Boti783P8jSuqCELzN+ap7ZIZYr4uPx6eQV3r6vjfBK6QjQwpYEwx
 UBl6e4uAT5G+G5tZCJOQFvP2UoJsMfPL3G/hoNyqzYr2452AI9FXsvHj4Jhn5LZLDcTv
 rn+MmghmS6xKObwuZ5W21RmhYBfiu2u1qRRQMBbiO47T7Y+eSHCC7E6bT1iQNWKFKvs1
 hwrIEm53XwH/0S61zcEgvQxvzkkSvdZlxCYMaIc3KENCXnDFOKWJXNTnz/0O7RIR0mFI
 /bnQ==
X-Gm-Message-State: AOAM532FHvGqD9kqtPyvjbqx9YvhH+RrLVPXDzJz1njRwfmrUwb3cmBR
 of8AsPF14qfyOdXceucsd9BuUPEglOc=
X-Google-Smtp-Source: ABdhPJyP5r9iC9iQZaJn62Cuj7ymKoimIrhsOHc9hIaOOGojXGBMvyJC/YDYFt4q38T9whQGkwiJ7Q==
X-Received: by 2002:a17:906:4a50:: with SMTP id
 a16mr34271487ejv.256.1615962434210; 
 Tue, 16 Mar 2021 23:27:14 -0700 (PDT)
Received: from pek-vx-bsp9.wrs.com
 (ec2-44-242-66-180.us-west-2.compute.amazonaws.com. [44.242.66.180])
 by smtp.gmail.com with ESMTPSA id d1sm10751349eje.26.2021.03.16.23.27.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 16 Mar 2021 23:27:13 -0700 (PDT)
From: Bin Meng <bmeng.cn@gmail.com>
To: Jason Wang <jasowang@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org
Subject: [PATCH v5 06/12] hw/net: vmxnet3: Remove the logic of padding short
 frames in the receive path
Date: Wed, 17 Mar 2021 14:26:32 +0800
Message-Id: <20210317062638.72626-7-bmeng.cn@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210317062638.72626-1-bmeng.cn@gmail.com>
References: <20210317062638.72626-1-bmeng.cn@gmail.com>
Received-SPF: pass client-ip=2a00:1450:4864:20::633;
 envelope-from=bmeng.cn@gmail.com; helo=mail-ej1-x633.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Now that we have implemented unified short frames padding in the
QEMU networking codes, remove the same logic in the NIC codes.

This actually reverts commit 40a87c6c9b11ef9c14e0301f76abf0eb2582f08e.

Signed-off-by: Bin Meng <bmeng.cn@gmail.com>
---

(no changes since v1)

 hw/net/vmxnet3.c | 10 ----------
 1 file changed, 10 deletions(-)

diff --git a/hw/net/vmxnet3.c b/hw/net/vmxnet3.c
index eff299f629..d993cce097 100644
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
2.17.1


