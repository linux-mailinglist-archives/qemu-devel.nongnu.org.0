Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 61B9847E3C2
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Dec 2021 13:54:11 +0100 (CET)
Received: from localhost ([::1]:60554 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n0Nbm-00081C-FK
	for lists+qemu-devel@lfdr.de; Thu, 23 Dec 2021 07:54:10 -0500
Received: from eggs.gnu.org ([209.51.188.92]:34002)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1n0Mlk-0004mq-HH
 for qemu-devel@nongnu.org; Thu, 23 Dec 2021 07:00:27 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:60365)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1n0Mlh-0001LU-PK
 for qemu-devel@nongnu.org; Thu, 23 Dec 2021 07:00:23 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1640260821;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=oOieGHzt55TTLrMgE6y82ndRao5o7/HgB++E/ZPWN8c=;
 b=EKSjXu0QeGv4YzU7mCLzsDXkOIGWDTZpoFcYKvkxpeElbGU7vJV70yiELo1ZA7hcGE6fTO
 EhwKywe+9EVMV8DvTGh47WXLHgLkgzkFXh3HhOtHysPU9+BFhYCv7m2JaACB4t7YKeIbcc
 DhJecQXWlhmnyASejYWBmCR4j4gOgOY=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-463-41J2rQQPMFqOuCxGtcxPdw-1; Thu, 23 Dec 2021 07:00:20 -0500
X-MC-Unique: 41J2rQQPMFqOuCxGtcxPdw-1
Received: by mail-wm1-f70.google.com with SMTP id
 z13-20020a05600c0a0d00b003457d6619f8so1882244wmp.1
 for <qemu-devel@nongnu.org>; Thu, 23 Dec 2021 04:00:19 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=oOieGHzt55TTLrMgE6y82ndRao5o7/HgB++E/ZPWN8c=;
 b=7YFgn3DkEyQbM4NOfKsNlpsBskSOkTRJDlB/ps19ByDacdlJ5lUn7IiwtfWTNKbeRJ
 5wgcnSoJGROQAU3DO9+lrq6Rw/9TgB1HP7ZcELG19TDM2vjxRJe00KFkwP7QBUABMgjp
 yMVF4jZqpZg6lRHwtm4pOYrycFBNB3D4Ps0vBKXSjfQoH9nuDkYCtg0Ry8rLYgAwHujS
 Mvj2PosxpNdVdTrjhpqNdbkknC0mPiEBgkaSNob/y3CCWMMpYbfEZexS3WYiUTGuglOJ
 pUVc6tppNDDd+Hm/YscjrBQeQOL1bX0bFIjOd1B0yi9WJntA5gfNO36g9qfRjXw65QXa
 s/Xw==
X-Gm-Message-State: AOAM530cwFB26w40z3raFnUUMf+hdZSO5/7BqF857+PBeEVhmr3i2Law
 fGc8RXvIQKco3oqbBb0Q2xsfn8rxymXde/XUZIvRxPeGW8+rlmkQz531Z/BVPAXsE2I2aWvhswk
 dgxXYm+0mY/Lb6laj9b+FN/NveBgnW231r2ANWqI91nRBUQ0btVirAOcW3p64IRF8
X-Received: by 2002:adf:dc12:: with SMTP id t18mr1594677wri.566.1640260818982; 
 Thu, 23 Dec 2021 04:00:18 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxGfYn4yd0fXb5c1xYbseXF9g+iDrur+UWaKtsUx6dlZQeu/i7TrlfCzyVN9bsHr2TL9HY27w==
X-Received: by 2002:adf:dc12:: with SMTP id t18mr1594625wri.566.1640260818723; 
 Thu, 23 Dec 2021 04:00:18 -0800 (PST)
Received: from x1w.. (33.red-193-152-124.dynamicip.rima-tde.net.
 [193.152.124.33])
 by smtp.gmail.com with ESMTPSA id s189sm9632538wme.0.2021.12.23.04.00.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 23 Dec 2021 04:00:18 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 19/23] hw/scsi/megasas: Use uint32_t for reply queue
 head/tail values
Date: Thu, 23 Dec 2021 12:55:50 +0100
Message-Id: <20211223115554.3155328-20-philmd@redhat.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211223115554.3155328-1-philmd@redhat.com>
References: <20211223115554.3155328-1-philmd@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.203,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Fam Zheng <fam@euphon.net>, Peter Maydell <peter.maydell@linaro.org>,
 Dmitry Fleytman <dmitry.fleytman@gmail.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>,
 Bin Meng <bin.meng@windriver.com>, David Hildenbrand <david@redhat.com>,
 Peter Xu <peterx@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Klaus Jensen <its@irrelevant.dk>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Sven Schnelle <svens@stackframe.org>, Hannes Reinecke <hare@suse.com>,
 qemu-block@nongnu.org, Daniel Henrique Barboza <danielhb413@gmail.com>,
 Havard Skinnemoen <hskinnemoen@google.com>, Joel Stanley <joel@jms.id.au>,
 Stefan Weil <sw@weilnetz.de>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Alistair Francis <alistair@alistair23.me>,
 Richard Henderson <richard.henderson@linaro.org>, Greg Kurz <groug@kaod.org>,
 Beniamino Galvani <b.galvani@gmail.com>, Eric Auger <eric.auger@redhat.com>,
 qemu-arm@nongnu.org, Jan Kiszka <jan.kiszka@web.de>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Keith Busch <kbusch@kernel.org>, John Snow <jsnow@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>,
 Eduardo Habkost <eduardo@habkost.net>, Andrew Jeffery <andrew@aj.id.au>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Andrew Baumann <Andrew.Baumann@microsoft.com>,
 Tyrone Ting <kfting@nuvoton.com>, qemu-ppc@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

While the reply queue values fit in 16-bit, they are accessed
as 32-bit:

  661:    s->reply_queue_head = ldl_le_pci_dma(pcid, s->producer_pa);
  662:    s->reply_queue_head %= MEGASAS_MAX_FRAMES;
  663:    s->reply_queue_tail = ldl_le_pci_dma(pcid, s->consumer_pa);
  664:    s->reply_queue_tail %= MEGASAS_MAX_FRAMES;

Having:

  41:#define MEGASAS_MAX_FRAMES 2048         /* Firmware limit at 65535 */

In order to update the ld/st*_pci_dma() API to pass the address
of the value to access, it is simpler to have the head/tail declared
as 32-bit values. Replace the uint16_t by uint32_t, wasting 4 bytes in
the MegasasState structure.

Acked-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 hw/scsi/megasas.c    | 4 ++--
 hw/scsi/trace-events | 8 ++++----
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/hw/scsi/megasas.c b/hw/scsi/megasas.c
index 87101705d01..266c3d38003 100644
--- a/hw/scsi/megasas.c
+++ b/hw/scsi/megasas.c
@@ -109,8 +109,8 @@ struct MegasasState {
     uint64_t reply_queue_pa;
     void *reply_queue;
     uint16_t reply_queue_len;
-    uint16_t reply_queue_head;
-    uint16_t reply_queue_tail;
+    uint32_t reply_queue_head;
+    uint32_t reply_queue_tail;
     uint64_t consumer_pa;
     uint64_t producer_pa;
 
diff --git a/hw/scsi/trace-events b/hw/scsi/trace-events
index 92d5b40f892..ae8551f2797 100644
--- a/hw/scsi/trace-events
+++ b/hw/scsi/trace-events
@@ -42,18 +42,18 @@ mptsas_config_sas_phy(void *dev, int address, int port, int phy_handle, int dev_
 
 # megasas.c
 megasas_init_firmware(uint64_t pa) "pa 0x%" PRIx64 " "
-megasas_init_queue(uint64_t queue_pa, int queue_len, uint64_t head, uint64_t tail, uint32_t flags) "queue at 0x%" PRIx64 " len %d head 0x%" PRIx64 " tail 0x%" PRIx64 " flags 0x%x"
+megasas_init_queue(uint64_t queue_pa, int queue_len, uint32_t head, uint32_t tail, uint32_t flags) "queue at 0x%" PRIx64 " len %d head 0x%" PRIx32 " tail 0x%" PRIx32 " flags 0x%x"
 megasas_initq_map_failed(int frame) "scmd %d: failed to map queue"
 megasas_initq_mapped(uint64_t pa) "queue already mapped at 0x%" PRIx64
 megasas_initq_mismatch(int queue_len, int fw_cmds) "queue size %d max fw cmds %d"
 megasas_qf_mapped(unsigned int index) "skip mapped frame 0x%x"
 megasas_qf_new(unsigned int index, uint64_t frame) "frame 0x%x addr 0x%" PRIx64
 megasas_qf_busy(unsigned long pa) "all frames busy for frame 0x%lx"
-megasas_qf_enqueue(unsigned int index, unsigned int count, uint64_t context, unsigned int head, unsigned int tail, int busy) "frame 0x%x count %d context 0x%" PRIx64 " head 0x%x tail 0x%x busy %d"
-megasas_qf_update(unsigned int head, unsigned int tail, unsigned int busy) "head 0x%x tail 0x%x busy %d"
+megasas_qf_enqueue(unsigned int index, unsigned int count, uint64_t context, uint32_t head, uint32_t tail, unsigned int busy) "frame 0x%x count %d context 0x%" PRIx64 " head 0x%" PRIx32 " tail 0x%" PRIx32 " busy %u"
+megasas_qf_update(uint32_t head, uint32_t tail, unsigned int busy) "head 0x%" PRIx32 " tail 0x%" PRIx32 " busy %u"
 megasas_qf_map_failed(int cmd, unsigned long frame) "scmd %d: frame %lu"
 megasas_qf_complete_noirq(uint64_t context) "context 0x%" PRIx64 " "
-megasas_qf_complete(uint64_t context, unsigned int head, unsigned int tail, int busy) "context 0x%" PRIx64 " head 0x%x tail 0x%x busy %d"
+megasas_qf_complete(uint64_t context, uint32_t head, uint32_t tail, int busy) "context 0x%" PRIx64 " head 0x%" PRIx32 " tail 0x%" PRIx32 " busy %u"
 megasas_frame_busy(uint64_t addr) "frame 0x%" PRIx64 " busy"
 megasas_unhandled_frame_cmd(int cmd, uint8_t frame_cmd) "scmd %d: MFI cmd 0x%x"
 megasas_handle_scsi(const char *frame, int bus, int dev, int lun, void *sdev, unsigned long size) "%s dev %x/%x/%x sdev %p xfer %lu"
-- 
2.33.1


