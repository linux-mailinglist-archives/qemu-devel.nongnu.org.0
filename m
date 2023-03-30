Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B1006D0523
	for <lists+qemu-devel@lfdr.de>; Thu, 30 Mar 2023 14:45:08 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1phrds-0006H3-RD; Thu, 30 Mar 2023 08:44:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1phrdq-0006GZ-4F
 for qemu-devel@nongnu.org; Thu, 30 Mar 2023 08:44:34 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1phrdo-0003Yv-OE
 for qemu-devel@nongnu.org; Thu, 30 Mar 2023 08:44:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1680180272;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=nTVuE8NuVb2zdXy2LMXQL0hemJ8bk3hgs1eQsKsjWes=;
 b=jLGglq0XBKR6rvJUDQrZt1KD/SpkblZBgeNssJyD/5YRWtYpCbbywJQ001tINHxbWnZY30
 2rTsnHN399s3qbNShGhpuSpnI2QWvm7pB83ZGgCkstnR0YgKEhZ8wruYuM1fL4Nx8qQSH9
 mnloRoEbihzk5e4zYS6Ozba6W5KOudA=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-610-oJSG1bBtP0KV8mHUT6wI8Q-1; Thu, 30 Mar 2023 08:44:30 -0400
X-MC-Unique: oJSG1bBtP0KV8mHUT6wI8Q-1
Received: by mail-wm1-f69.google.com with SMTP id
 n19-20020a05600c3b9300b003ef63ef4519so8206614wms.3
 for <qemu-devel@nongnu.org>; Thu, 30 Mar 2023 05:44:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680180269; x=1682772269;
 h=content-transfer-encoding:mime-version:message-id:date:subject:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=nTVuE8NuVb2zdXy2LMXQL0hemJ8bk3hgs1eQsKsjWes=;
 b=Z3KSIIytx6Z1Wrikt49SXy0GSjAB5BlVE0/c7rjK0ncqQB70+UY46Pc7kzX2TKh16s
 JbRHH8uUsSDXAjlsL97QemXJleLEfwJ/wt0Rz4g/0z2zYjGv8Vr2fk3RPsRMrrkWHHa/
 nik0235jw+kly+C+Zkg++zC2U5eBbjUHuUoPcvj77qdA/bDi3LtPNcQG92zlpp3vDB08
 K2S29a1Ng+RTUq0ntZ/MtleTAIyHaW9rdDmxqooinuIzSPQsdAkEgQUMMZUry/XAklqq
 MDhdwyG1a1HBVjaLiLkA3CQHfIH/SQPbeKwA18mTjYNiHAtHtnLzMKr4/Y5RDk1z2a+O
 A+5g==
X-Gm-Message-State: AAQBX9dUDQlbqy6H5mQYIeBeLM66ZO+y/PoXOWXco1bz2IHFHiBkUUuS
 B4qV7OcWD5+6iZhBwAE4yC52PGkEhNMAR9p2KY62ZGWxrVUCYBQ79eZiLyRzxG2m14prAqDNLIu
 EUMQdi2JnFKL6R9yxk6ea5wnDPdTKGfIIGEdhc26GzG4PLQTqUEnESW/4PoOYLwlKm1MYrhNgrd
 nGKA==
X-Received: by 2002:a7b:c4c7:0:b0:3ef:6ae7:8994 with SMTP id
 g7-20020a7bc4c7000000b003ef6ae78994mr12552905wmk.22.1680180269410; 
 Thu, 30 Mar 2023 05:44:29 -0700 (PDT)
X-Google-Smtp-Source: AKy350bqpk6MAIPuHhgV1gbGpu3qU0VoT41dTT99QxuredWTBP8aOboULkHvbRbD4c6/UgE3XrrERg==
X-Received: by 2002:a7b:c4c7:0:b0:3ef:6ae7:8994 with SMTP id
 g7-20020a7bc4c7000000b003ef6ae78994mr12552890wmk.22.1680180269086; 
 Thu, 30 Mar 2023 05:44:29 -0700 (PDT)
Received: from [192.168.10.118] ([2001:b07:6468:f312:4783:a68:c1ee:15c5])
 by smtp.gmail.com with ESMTPSA id
 r16-20020a05600c35d000b003ee9f396dcesm6074267wmq.30.2023.03.30.05.44.27
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 30 Mar 2023 05:44:28 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH] nvme: remove constant argument to tracepoint
Date: Thu, 30 Mar 2023 14:44:27 +0200
Message-Id: <20230330124427.40631-1-pbonzini@redhat.com>
X-Mailer: git-send-email 2.39.2
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
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
index 8b7be1420912..4e8f26dc60ad 100644
--- a/hw/nvme/ctrl.c
+++ b/hw/nvme/ctrl.c
@@ -7155,9 +7155,7 @@ static int nvme_start_ctrl(NvmeCtrl *n)
 
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
2.39.2


