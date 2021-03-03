Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E7F9732B61F
	for <lists+qemu-devel@lfdr.de>; Wed,  3 Mar 2021 10:23:32 +0100 (CET)
Received: from localhost ([::1]:40224 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lHNj9-0006Im-VH
	for lists+qemu-devel@lfdr.de; Wed, 03 Mar 2021 04:23:31 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51440)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1lHNhr-0004p4-QZ
 for qemu-devel@nongnu.org; Wed, 03 Mar 2021 04:22:11 -0500
Received: from mail-ej1-x62f.google.com ([2a00:1450:4864:20::62f]:46036)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1lHNhq-0001Cj-1d
 for qemu-devel@nongnu.org; Wed, 03 Mar 2021 04:22:11 -0500
Received: by mail-ej1-x62f.google.com with SMTP id mm21so40474231ejb.12
 for <qemu-devel@nongnu.org>; Wed, 03 Mar 2021 01:22:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=Q2tkJ8NbxeX4ElZp8NKBaqHSprq+lBbv+U0LcxD9Tt4=;
 b=ptRjWwjjPE78kPMqBpkboNVI+hwpJmq88d9vzooyP2GD59VYm9n8Fasij0/JxWjxXE
 5yObEmTyDlndLf65qIK8uTS29bwbdY2i/en+Lj8Zj6kem3Gcgi167a3AS8PgzKuOH/Wp
 Fr8D9MTw4z5YLpsYgl0x39GDcogWFfamDCxAxEaMW+whPWIxyWQT1zqRyQMBAQ6rCDHU
 sLpyUCJVB9jl+e8R/DN2XyIP519r+9Uc0i9P+BYAfe9qC0fRF/Utfx7v+TpAOYDlPeZ+
 6pLDUL/9uVyxFt8hRMMRmn+8TWTNFKT5crPLlcgZKlhX/8GWNKqktikx6Nr3isKFZl7r
 hRbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=Q2tkJ8NbxeX4ElZp8NKBaqHSprq+lBbv+U0LcxD9Tt4=;
 b=Zrayltp4kpY4HebvlD2IsYcVhE7QxWGujvDcOO855dNlpOwQhSBr6+z3HheTV7PqQa
 Wg0oyUe2g5L2MbQp1b2wNg1RNH89bdzOq7z5pvgB+aV0IBeemtY6tQBiyW1kzixe4smI
 yos/9MwxmCTtCZ03sQMZnkM+GJPpLIyl2ihrw9xIOJVy6Ob4hIPkdRlzUuLRlZFGKujD
 UlVXnP0Kr4sOfwPMO1lTpFevjm+rcNuJv2cDYxTrzyeSQAQVN9657I2+MMKABkZAVKmw
 2bGGCiIC/85lTmg5UuttHwemVQ4hJnmnQ5IYv1tLvjzLdVuJCI+N5NjRRSqV8i+qK0H1
 AYzA==
X-Gm-Message-State: AOAM530wBIjqvFyjqbiA6c7wu52BOnYFpM04y8j+NRDughID6T2L4Nzd
 Jp9S2X+DuW70HpHURj7Xutc=
X-Google-Smtp-Source: ABdhPJyZaU34GWDmBkFLsCPKfyPe/SlfoQ9NU5vkFppdpgvPNbYL4KHRcwZbqL3ZVfHtv/d7yAD9mQ==
X-Received: by 2002:a17:906:85b:: with SMTP id
 f27mr18104506ejd.414.1614763328829; 
 Wed, 03 Mar 2021 01:22:08 -0800 (PST)
Received: from pek-vx-bsp2.wrs.com
 (ec2-44-242-66-180.us-west-2.compute.amazonaws.com. [44.242.66.180])
 by smtp.gmail.com with ESMTPSA id i6sm16614865ejz.95.2021.03.03.01.22.05
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 03 Mar 2021 01:22:08 -0800 (PST)
From: Bin Meng <bmeng.cn@gmail.com>
To: Jason Wang <jasowang@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org
Subject: [RFC PATCH v2 3/9] hw/net: vmxnet3: Remove the logic of padding short
 frames in the receive path
Date: Wed,  3 Mar 2021 17:21:40 +0800
Message-Id: <1614763306-18026-4-git-send-email-bmeng.cn@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1614763306-18026-1-git-send-email-bmeng.cn@gmail.com>
References: <1614763306-18026-1-git-send-email-bmeng.cn@gmail.com>
Received-SPF: pass client-ip=2a00:1450:4864:20::62f;
 envelope-from=bmeng.cn@gmail.com; helo=mail-ej1-x62f.google.com
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
Cc: Bin Meng <bin.meng@windriver.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Bin Meng <bin.meng@windriver.com>

Now that we have implemented unified short frames padding in the
QEMU networking codes, remove the same logic in the NIC codes.

This actually reverts commit 40a87c6c9b11ef9c14e0301f76abf0eb2582f08e.

Signed-off-by: Bin Meng <bin.meng@windriver.com>
---

(no changes since v1)

 hw/net/vmxnet3.c | 10 ----------
 1 file changed, 10 deletions(-)

diff --git a/hw/net/vmxnet3.c b/hw/net/vmxnet3.c
index eff299f..d993cce 100644
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
2.7.4


