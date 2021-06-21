Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3441A3AE61D
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Jun 2021 11:34:39 +0200 (CEST)
Received: from localhost ([::1]:46674 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lvGKE-0006iA-9U
	for lists+qemu-devel@lfdr.de; Mon, 21 Jun 2021 05:34:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58154)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lvGIT-0005J2-Ex
 for qemu-devel@nongnu.org; Mon, 21 Jun 2021 05:32:49 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:41285)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lvGIR-0007A8-8l
 for qemu-devel@nongnu.org; Mon, 21 Jun 2021 05:32:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1624267966;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=f0b6se3TDz1Edzu8h/EAKxwMAMM6tNdPKOeMtXEb59o=;
 b=ao3UbGmakFZ6LmWFbkSFbZ3E6/S5MVySnWyqUozGEe92frt6DbD6zQITjvZB/u5CSDJykI
 DdpUAFWMvbQTuUh118XwAdKeGLhLPtPbSqEAP/Is5/jmtFOxDlqB4drwg7tSA+UHkeiqRa
 ItWHhXbB2CiMC+/OKE2DrPHLExWqsu0=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-395-A6HX83ZoOfuhLMvNjcXlmw-1; Mon, 21 Jun 2021 05:32:43 -0400
X-MC-Unique: A6HX83ZoOfuhLMvNjcXlmw-1
Received: by mail-wm1-f69.google.com with SMTP id
 u17-20020a05600c19d1b02901af4c4deac5so6796468wmq.7
 for <qemu-devel@nongnu.org>; Mon, 21 Jun 2021 02:32:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=f0b6se3TDz1Edzu8h/EAKxwMAMM6tNdPKOeMtXEb59o=;
 b=GKnXXzKy8fv1fGTBAJor8z4qXnwV4gOxzwVffB23FhltZAcRaXyQqlWZ411dwQWRR+
 2SQ8ZDrFpQouP9/qGE5kCXmXZqBViABmcJ0jmsR1hKWT4kFJj7fPqY0kaElSFmAEhooc
 mreT0PNxDe7CY4/6a4ekDyCQUlLvpYfFyQuC1QZf2X3IMxi56BJ5HN1Nb7YrS85f/sCi
 komxa3XzffodJiAoaHaZqCeWK3PTcUm2k0A9C9LYup5vgxxbf881ENDEHXBPIejPhPfJ
 Z4laLVrUu6f/gNkppnYvMyMv6qTFNPcIYcjZmoCFEXNqNdicnhSWqCqInSe/EuaY5KVm
 PpJw==
X-Gm-Message-State: AOAM5317Ej/bEhgt2sbVNozLnIbi29Wi/B9UraaiuCzYNGYtG8yKBFoE
 tZoOHqfzLJGZ38UxIxmp35aUDAvzymRkgyIZ+85r74akNyjtUNiDzClJK1WBdqJ9GTMagMJDzw0
 vejIqRYzd9iH9zczce/R5w0hhU4vRh8uBZFHfo0ltxz+NImmPmF/YcInh00aM/Xnv
X-Received: by 2002:a05:600c:4145:: with SMTP id
 h5mr5778239wmm.108.1624267962399; 
 Mon, 21 Jun 2021 02:32:42 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxhVDmqYqPrJ+z/L1hmDyM+IXCpX+RuIoV30YH1hjsoyzI8KjVezH2dAI3Gv2R1vJ81xPklcg==
X-Received: by 2002:a05:600c:4145:: with SMTP id
 h5mr5778186wmm.108.1624267962007; 
 Mon, 21 Jun 2021 02:32:42 -0700 (PDT)
Received: from x1w.. (93.red-83-35-24.dynamicip.rima-tde.net. [83.35.24.93])
 by smtp.gmail.com with ESMTPSA id d12sm5337595wrn.69.2021.06.21.02.32.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 21 Jun 2021 02:32:41 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2] block/nvme: Fix VFIO_MAP_DMA failed: No space left on
 device
Date: Mon, 21 Jun 2021 11:32:40 +0200
Message-Id: <20210621093240.4170701-1-philmd@redhat.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.299,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Fam Zheng <fam@euphon.net>, Kevin Wolf <kwolf@redhat.com>,
 qemu-block@nongnu.org,
 =?UTF-8?q?Michal=20Pr=C3=ADvozn=C3=ADk?= <mprivozn@redhat.com>,
 qemu-stable@nongnu.org, Maxim Levitsky <mlevitsk@redhat.com>,
 Eric Auger <eric.auger@redhat.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Max Reitz <mreitz@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

When the NVMe block driver was introduced (see commit bdd6a90a9e5,
January 2018), Linux VFIO_IOMMU_MAP_DMA ioctl was only returning
-ENOMEM in case of error. The driver was correctly handling the
error path to recycle its volatile IOVA mappings.

To fix CVE-2019-3882, Linux commit 492855939bdb ("vfio/type1: Limit
DMA mappings per container", April 2019) added the -ENOSPC error to
signal the user exhausted the DMA mappings available for a container.

The block driver started to mis-behave:

  qemu-system-x86_64: VFIO_MAP_DMA failed: No space left on device
  (qemu)
  (qemu) info status
  VM status: paused (io-error)
  (qemu) c
  VFIO_MAP_DMA failed: No space left on device
  qemu-system-x86_64: block/block-backend.c:1968: blk_get_aio_context: Assertion `ctx == blk->ctx' failed.

Fix by handling the new -ENOSPC error (when DMA mappings are
exhausted) without any distinction to the current -ENOMEM error,
so we don't change the behavior on old kernels where the CVE-2019-3882
fix is not present.

An easy way to reproduce this bug is to restrict the DMA mapping
limit (65535 by default) when loading the VFIO IOMMU module:

  # modprobe vfio_iommu_type1 dma_entry_limit=666

Cc: qemu-stable@nongnu.org
Reported-by: Michal Prívozník <mprivozn@redhat.com>
Fixes: bdd6a90a9e5 ("block: Add VFIO based NVMe driver")
Buglink: https://bugs.launchpad.net/qemu/+bug/1863333
Resolves: https://gitlab.com/qemu-project/qemu/-/issues/65
Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
v2: KISS checking both errors undistinguishedly (Maxim)
---
 block/nvme.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/block/nvme.c b/block/nvme.c
index 2b5421e7aa6..c3d2a49866c 100644
--- a/block/nvme.c
+++ b/block/nvme.c
@@ -1030,7 +1030,7 @@ try_map:
         r = qemu_vfio_dma_map(s->vfio,
                               qiov->iov[i].iov_base,
                               len, true, &iova);
-        if (r == -ENOMEM && retry) {
+        if ((r == -ENOMEM || r == -ENOSPC) && retry) {
             retry = false;
             trace_nvme_dma_flush_queue_wait(s);
             if (s->dma_map_count) {
-- 
2.31.1


