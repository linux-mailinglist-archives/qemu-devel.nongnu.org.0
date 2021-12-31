Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 38672482119
	for <lists+qemu-devel@lfdr.de>; Fri, 31 Dec 2021 01:57:53 +0100 (CET)
Received: from localhost ([::1]:51028 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n36Ey-0002bQ-1J
	for lists+qemu-devel@lfdr.de; Thu, 30 Dec 2021 19:57:52 -0500
Received: from eggs.gnu.org ([209.51.188.92]:40174)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1n36D8-00006G-Mf
 for qemu-devel@nongnu.org; Thu, 30 Dec 2021 19:55:58 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:48568)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1n36D5-0003PT-Pa
 for qemu-devel@nongnu.org; Thu, 30 Dec 2021 19:55:57 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1640912155;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=gOzChpACyeatTO+0ft8wECHRMSNI7uqBSXhaq5nDK3A=;
 b=cPhDDlPEF9WJ8KsGZ6nzMdz6+X/P6v02MhPfS30fk7gl3zUGIIZGBQmeIlZ9wMszNNoZnW
 FG7ydqcnogM14K2lD7NU5jPCvA+uAJgY5JWy+X9EO+EjSJN6dlPlzaWlTLtQ178mF5cwc0
 /qFxK8g/3p2/qShjIOeyLV04y9EJWfE=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-562--Pe5TnhcPCSR2C5wyhuvtw-1; Thu, 30 Dec 2021 19:55:54 -0500
X-MC-Unique: -Pe5TnhcPCSR2C5wyhuvtw-1
Received: by mail-ed1-f72.google.com with SMTP id
 dz8-20020a0564021d4800b003f897935eb3so18052440edb.12
 for <qemu-devel@nongnu.org>; Thu, 30 Dec 2021 16:55:53 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=gOzChpACyeatTO+0ft8wECHRMSNI7uqBSXhaq5nDK3A=;
 b=rXdW3CW7LeHRyFpyrEMoVhXiW0FNdl1w8KYVnav8/g4ahv3WOtyKMfpCdBt0AOIjjL
 BN1zjOPpbAAkXwD6b9dCvvDBnQLBINuHzi6756w4TFGm0mbaf6DFArjDWZS3D/gb6fxN
 OQoOSm3tD0wcc6pD1lOStOLpRZaVnBY/O2fc+xT3GJTG3MHE/CeqBQL4XleRSnXeKb5E
 CekUfpBwuzqEz3T2CGAtiJ1rCvi+K/PdnYL6Ctd7zLqmiIJnJQuQsFgR+aUq3MJN/fCg
 39weUZDhHHaOjuKrRdh/d/WGuG60u800pcD2/jwZCo4JqL/ysOB2brs8gVdVP7GzGPxA
 t90w==
X-Gm-Message-State: AOAM532A/yM5nJUS3D4z0gBz1c89/pC3M6x5SYDEU2df6UK1LS6240VK
 S7rzQm82B5KVtgzkfDyQkIb2dKAJ0/TtVACeHBC8h0IZgIBpmbtOo6SJlAk1SySnf3Sxhhu9k9O
 03oVwSdZVeh+B2NCGAXaurk4f2+ONdBYDonPKSSuvFedro6qdJnMXVYcK+kQWbvfd
X-Received: by 2002:a17:906:2109:: with SMTP id
 9mr12119296ejt.38.1640912152771; 
 Thu, 30 Dec 2021 16:55:52 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwGMbhv7zja5Awvll/fHnFDn+fDCJb3TeXRvNsDtEbVJjHA+oH4sacFWwuRaQ7RCEJuQFzAcA==
X-Received: by 2002:a17:906:2109:: with SMTP id
 9mr12119279ejt.38.1640912152582; 
 Thu, 30 Dec 2021 16:55:52 -0800 (PST)
Received: from x1w.redhat.com (26.red-83-50-86.dynamicip.rima-tde.net.
 [83.50.86.26])
 by smtp.gmail.com with ESMTPSA id e26sm10096073edr.82.2021.12.30.16.55.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 30 Dec 2021 16:55:52 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 01/22] hw/scsi/megasas: Use uint32_t for reply queue head/tail
 values
Date: Fri, 31 Dec 2021 01:55:25 +0100
Message-Id: <20211231005546.723396-2-philmd@redhat.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211231005546.723396-1-philmd@redhat.com>
References: <20211231005546.723396-1-philmd@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) DKIMWL_WL_HIGH=-0.573, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>
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
Message-Id: <20211223115554.3155328-20-philmd@redhat.com>
---
 hw/scsi/megasas.c    | 4 ++--
 hw/scsi/trace-events | 8 ++++----
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/hw/scsi/megasas.c b/hw/scsi/megasas.c
index 8f357841004..14ec6d68bbf 100644
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


