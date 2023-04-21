Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 50E0B6EA724
	for <lists+qemu-devel@lfdr.de>; Fri, 21 Apr 2023 11:37:24 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ppn94-0008Dc-0M; Fri, 21 Apr 2023 05:33:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1ppn91-0008Cz-MC
 for qemu-devel@nongnu.org; Fri, 21 Apr 2023 05:33:31 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1ppn8x-00031k-0A
 for qemu-devel@nongnu.org; Fri, 21 Apr 2023 05:33:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1682069606;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=/63fz4Ph/jJK0ribSmtIQrNvkXgQl0x7w1TcAVvHFeA=;
 b=eO7PCCVC2mWJGThAWZzT/dqSeHPFRr5LzV0Qp1t4rjj9C/vdqyghVZKnoKoUW63vofHry5
 FKgzsm7C9vVuvglZ3pst2DeximUTN2cQE8Tqixjk/t9abfaWfXpO9Ph84iJkVamT5Bo7Fm
 KMxag5C+Kimlgpb8W0Fc9rCx4C4fuzI=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-622-bGxdxEU8MkKFcLue9xjyoQ-1; Fri, 21 Apr 2023 05:33:24 -0400
X-MC-Unique: bGxdxEU8MkKFcLue9xjyoQ-1
Received: by mail-ej1-f71.google.com with SMTP id
 a640c23a62f3a-94eaa8f18eeso117433266b.1
 for <qemu-devel@nongnu.org>; Fri, 21 Apr 2023 02:33:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682069603; x=1684661603;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=/63fz4Ph/jJK0ribSmtIQrNvkXgQl0x7w1TcAVvHFeA=;
 b=DSwZivC+7pcR1AJ0bNMURwvKwmIiVQLaQOCh+vsrOrSh+LGFdg7N86nhFxB6CCNWTS
 GtQRlg62bxQ2UCy/K2qzwCMQ24c2I+fl5S3Bbo8q8sIXLKpx/xIqdw/hjKy1XgUf0a5i
 WDqTL0Tp9e9iGQfudnMQuT2Z0IdW3/cVHCpGtk54RfE4xm9C+Wgp7nn/WTE+LiA42zrk
 ffKvlJlSDRLswOU4ksjBEJlA77f/SkVqA4X1GF4v7vjVMPrRBa66Z3dIgvrbg/h/diZY
 AVm+ccBtt4N37/0WXoGGS8gCLqMl0YXYXetX5/m+6SLegp5nHsyaNvAwpUsDqcP3w8wb
 LsCw==
X-Gm-Message-State: AAQBX9dL6/dPaXsTbyIQp8wJl4x7NEi8S6MfCTowdBK/ucrgjxYj49os
 CTN0v7deC64T270/XCs0I1lz1jONOrhFZPvCX3G17tQRo2b8waRD2x9L1pN+b/D/slBsnJjYTUW
 E8M+0X5bf4GBEkXwRPwBkZXNzn/Q5t9RmODn7ztUOTK9DBfh4fKeqAlD5xrO2PXs6iLuPHap51Z
 hDOQ==
X-Received: by 2002:a17:906:b0cf:b0:951:f54c:208c with SMTP id
 bk15-20020a170906b0cf00b00951f54c208cmr1578010ejb.41.1682069603391; 
 Fri, 21 Apr 2023 02:33:23 -0700 (PDT)
X-Google-Smtp-Source: AKy350Y5lu3eyxsi5D818qEh48I1XF5ayPbP8CXCBZ0Z+KqLUuzyv+5L8bADKHIa6bksduzScjVd2Q==
X-Received: by 2002:a17:906:b0cf:b0:951:f54c:208c with SMTP id
 bk15-20020a170906b0cf00b00951f54c208cmr1577997ejb.41.1682069603050; 
 Fri, 21 Apr 2023 02:33:23 -0700 (PDT)
Received: from [192.168.10.118] ([2001:b07:6468:f312:9af8:e5f5:7516:fa89])
 by smtp.gmail.com with ESMTPSA id
 sd14-20020a170906ce2e00b0094f5d1bbb21sm1825232ejb.102.2023.04.21.02.33.21
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 21 Apr 2023 02:33:22 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 04/25] nvme: remove constant argument to tracepoint
Date: Fri, 21 Apr 2023 11:32:55 +0200
Message-Id: <20230421093316.17941-5-pbonzini@redhat.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230421093316.17941-1-pbonzini@redhat.com>
References: <20230421093316.17941-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01,
 T_SPF_HELO_TEMPERROR=0.01 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

The last argument to -pci_nvme_err_startfail_virt_state is always "OFFLINE"
due to the enclosing "if" condition requiring !sctrl->scs.  Reported by
Coverity.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 hw/nvme/ctrl.c       | 4 +---
 hw/nvme/trace-events | 2 +-
 2 files changed, 2 insertions(+), 4 deletions(-)

diff --git a/hw/nvme/ctrl.c b/hw/nvme/ctrl.c
index ac24eeb5ed5a..f59dfe1cbe96 100644
--- a/hw/nvme/ctrl.c
+++ b/hw/nvme/ctrl.c
@@ -7158,9 +7158,7 @@ static int nvme_start_ctrl(NvmeCtrl *n)
 
     if (pci_is_vf(PCI_DEVICE(n)) && !sctrl->scs) {
         trace_pci_nvme_err_startfail_virt_state(le16_to_cpu(sctrl->nvi),
-                                                le16_to_cpu(sctrl->nvq),
-                                                sctrl->scs ? "ONLINE" :
-                                                             "OFFLINE");
+                                                le16_to_cpu(sctrl->nvq));
         return -1;
     }
     if (unlikely(n->cq[0])) {
diff --git a/hw/nvme/trace-events b/hw/nvme/trace-events
index 7f7837e1a281..9afddf3b951c 100644
--- a/hw/nvme/trace-events
+++ b/hw/nvme/trace-events
@@ -187,7 +187,7 @@ pci_nvme_err_startfail_asqent_sz_zero(void) "nvme_start_ctrl failed because the
 pci_nvme_err_startfail_acqent_sz_zero(void) "nvme_start_ctrl failed because the admin completion queue size is zero"
 pci_nvme_err_startfail_zasl_too_small(uint32_t zasl, uint32_t pagesz) "nvme_start_ctrl failed because zone append size limit %"PRIu32" is too small, needs to be >= %"PRIu32""
 pci_nvme_err_startfail(void) "setting controller enable bit failed"
-pci_nvme_err_startfail_virt_state(uint16_t vq, uint16_t vi, const char *state) "nvme_start_ctrl failed due to ctrl state: vi=%u vq=%u %s"
+pci_nvme_err_startfail_virt_state(uint16_t vq, uint16_t vi) "nvme_start_ctrl failed due to ctrl state: vi=%u vq=%u"
 pci_nvme_err_invalid_mgmt_action(uint8_t action) "action=0x%"PRIx8""
 pci_nvme_err_ignored_mmio_vf_offline(uint64_t addr, unsigned size) "addr 0x%"PRIx64" size %d"
 
-- 
2.40.0


