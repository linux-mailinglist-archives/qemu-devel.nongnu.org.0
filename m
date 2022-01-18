Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E0044492673
	for <lists+qemu-devel@lfdr.de>; Tue, 18 Jan 2022 14:07:25 +0100 (CET)
Received: from localhost ([::1]:41240 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n9oCq-0000rW-66
	for lists+qemu-devel@lfdr.de; Tue, 18 Jan 2022 08:07:24 -0500
Received: from eggs.gnu.org ([209.51.188.92]:51862)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1n9nEY-0006GK-UV; Tue, 18 Jan 2022 07:05:07 -0500
Received: from [2a00:1450:4864:20::32a] (port=52137
 helo=mail-wm1-x32a.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1n9nES-0005ta-79; Tue, 18 Jan 2022 07:05:06 -0500
Received: by mail-wm1-x32a.google.com with SMTP id c2so21606876wml.1;
 Tue, 18 Jan 2022 04:03:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Zvy/0amefCGpvF7RDj72qeKzXoYRfL+1cByeWJWkLYw=;
 b=o0zCEJCXSoGCVb8E6IS7UDtKTfazLBon1tEFqPlh68s0cg1RbVtzpaBSWNmS/huf2m
 wRBCxURA1jdKqfWitQPCVZgGQZsHSYdr//7meijVXOyJOaG0WgbafDwErDGazmPripO9
 /KjRDuFSidUXmFA4kpnsWsxZoSoZ8Xi0Z8hKX78DwUr2Pu15iAxXBQBeOXWP/78xGtvd
 Ac76udg/xXOxOcKar8BaNoBZX+Uh/8wlYHTaI7V6ylC74BhiafxFGKhr5KznOYXuR1MY
 qq6lITVa5G/u5U5gmEZgb1iJ4n4OEmNDrmuNk82LH9orkLdq0j6IGFlFHDSfp/6u1IiW
 bVOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=Zvy/0amefCGpvF7RDj72qeKzXoYRfL+1cByeWJWkLYw=;
 b=nHz6vpyuC1WQwUB8RU42LivYKHmMbF2A3EEQW0NxP8Wl2W9FjrjR84BAG8Js92pV7K
 ow+YFOIh/YAVk1FEOTBl6VflH4DrPyN2SX69eFX69OADPkAy+LBBH5l59ilTuFQIsRvo
 puXNgcNadCIRTILB1YWMLIwyEDtVOXWBpOrSJd+6CyAq11U8qkY6PDUQjHijxZr+WL39
 WQgAqgwIyLIMjZniLUiixBI3WuqYBy9plHEFeUM35hZ9BAYzJmQbZCFPfm4+el4AxLbp
 EWfJjjBhnmMRqDggEmpavaMuZhLBI4ehj5Sy9ItygTNHQuyLl17XexFMoMepRQq7EsTC
 yLdA==
X-Gm-Message-State: AOAM5311lc1mEde3WzEzEjpJOxg0haR8r+U/KjVVSLOg1N0ihxxnPfeM
 gtSklSpqq6cc3Efh93le3O78Y74rhCI=
X-Google-Smtp-Source: ABdhPJy5SVa4rIlf3IRWPl8TVOt7wpUO6DSsQ2nSXreqtaRCmg/pxAMPsFES04t6qmipspOtDO39Ag==
X-Received: by 2002:a05:6000:1c0c:: with SMTP id
 ba12mr21375033wrb.285.1642507423394; 
 Tue, 18 Jan 2022 04:03:43 -0800 (PST)
Received: from nuc.. (154.red-83-50-83.dynamicip.rima-tde.net. [83.50.83.154])
 by smtp.gmail.com with ESMTPSA id
 u16sm3027041wmq.23.2022.01.18.04.03.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 Jan 2022 04:03:43 -0800 (PST)
To: qemu-devel@nongnu.org
Cc: Peter Xu <peterx@redhat.com>, David Hildenbrand <david@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, qemu-block@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Richard Henderson <richard.henderson@linaro.org>
Subject: [PULL 15/19] hw/dma: Fix format string issues using dma_addr_t
Date: Tue, 18 Jan 2022 13:02:25 +0100
Message-Id: <20220118120229.196337-16-f4bug@amsat.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220118120229.196337-1-f4bug@amsat.org>
References: <20220118120229.196337-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::32a
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::32a;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x32a.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.248,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Reply-to:  =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
From:  =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= via <qemu-devel@nongnu.org>

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: David Hildenbrand <david@redhat.com>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Message-Id: <20220111184309.28637-10-f4bug@amsat.org>
---
 hw/ide/ahci.c        | 2 +-
 hw/rdma/trace-events | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/hw/ide/ahci.c b/hw/ide/ahci.c
index 205dfdc6622..6c727dd0c08 100644
--- a/hw/ide/ahci.c
+++ b/hw/ide/ahci.c
@@ -1159,7 +1159,7 @@ static void process_ncq_command(AHCIState *s, int port, const uint8_t *cmd_fis,
     ahci_populate_sglist(ad, &ncq_tfs->sglist, ncq_tfs->cmdh, size, 0);
 
     if (ncq_tfs->sglist.size < size) {
-        error_report("ahci: PRDT length for NCQ command (0x%zx) "
+        error_report("ahci: PRDT length for NCQ command (0x" DMA_ADDR_FMT ") "
                      "is smaller than the requested size (0x%zx)",
                      ncq_tfs->sglist.size, size);
         ncq_err(ncq_tfs);
diff --git a/hw/rdma/trace-events b/hw/rdma/trace-events
index 9accb149734..c23175120e1 100644
--- a/hw/rdma/trace-events
+++ b/hw/rdma/trace-events
@@ -27,5 +27,5 @@ rdma_rm_alloc_qp(uint32_t rm_qpn, uint32_t backend_qpn, uint8_t qp_type) "rm_qpn
 rdma_rm_modify_qp(uint32_t qpn, uint32_t attr_mask, int qp_state, uint8_t sgid_idx) "qpn=0x%x, attr_mask=0x%x, qp_state=%d, sgid_idx=%d"
 
 # rdma_utils.c
-rdma_pci_dma_map(uint64_t addr, void *vaddr, uint64_t len) "0x%"PRIx64" -> %p (len=%" PRId64")"
+rdma_pci_dma_map(uint64_t addr, void *vaddr, uint64_t len) "0x%"PRIx64" -> %p (len=%" PRIu64")"
 rdma_pci_dma_unmap(void *vaddr) "%p"
-- 
2.34.1


