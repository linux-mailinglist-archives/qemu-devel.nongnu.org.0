Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 13DCC477B2A
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Dec 2021 18:58:44 +0100 (CET)
Received: from localhost ([::1]:38246 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mxv1f-0005Jj-6O
	for lists+qemu-devel@lfdr.de; Thu, 16 Dec 2021 12:58:43 -0500
Received: from eggs.gnu.org ([209.51.188.92]:53298)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mxuyg-0002Pc-0a
 for qemu-devel@nongnu.org; Thu, 16 Dec 2021 12:55:38 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:44969)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mxuye-0007QJ-6F
 for qemu-devel@nongnu.org; Thu, 16 Dec 2021 12:55:37 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1639677335;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=UGIjOqreiR3wf0mzjMXHC2g8ApWAQ49FKn1AAebFmwc=;
 b=Y3jQG/KSIJHxj2lACXAEWPMGT42ULeINMD1EbIa+UtJUqmr12Thbirw5BmDevVcIQFliEA
 QzcewVBIiuFYslu2piPO3OumC3uo3DuCTuQhMOlDrmjx7LPIfNowBSQqLmifdUcJ0Udj3B
 wv9+oy9tVWVX5HaJbA6ZoT4d1R1zrWU=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-62-KyEP2K_UPZy-GiI4jVRlDA-1; Thu, 16 Dec 2021 12:55:34 -0500
X-MC-Unique: KyEP2K_UPZy-GiI4jVRlDA-1
Received: by mail-wm1-f69.google.com with SMTP id
 f202-20020a1c1fd3000000b00344f1cae317so1221493wmf.0
 for <qemu-devel@nongnu.org>; Thu, 16 Dec 2021 09:55:33 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=UGIjOqreiR3wf0mzjMXHC2g8ApWAQ49FKn1AAebFmwc=;
 b=numrWMEPlQQhDz2aMwBvAiIC2Le11AWvKQCVcOtuGzyOvImkrkVqgQmEGi1MXmZCY4
 jTkAEvuSWUbm9/zzWRTlecMvwArKiWAULswNIw7pqsaXZkQki4t60RwOu0zui9vAZaim
 1fvL81j+2T8+kgLA5Y9xG1QbQJd64QKS5hFK/5PrxOrkOtpxa9V11gPnFN0TJnGkuS/T
 N5dgmL2jGt7YqEYE/iW3KN31dB6ifHg3EGbJHjvLng7DqihlV+5+An+dRhdk3lVfhEje
 0q6UUeDFay6HDrE/xVQhPW600Zutz4VXKsuqb5+jdz2pY49PSKaTqCxJHKBzrHDN6+3T
 lABA==
X-Gm-Message-State: AOAM5317Udq90gVDBU7IB4CzhSdghadxM2yuc7e/ttlTqha2NkhdHp33
 j3s/t2BrO7i2h7pXMzApRHBFVsqjHdpAzh6OeqMmpf5yObyzc7Hy4NztOYbI57wbpuCGPpcIgt/
 hcco4LtHFmm4wp+csfAmjanpoM/x2jEbVlFcikcg+UXFIymbNwKMjfRFsaW5Mcwzw
X-Received: by 2002:a05:6000:15ca:: with SMTP id
 y10mr10179928wry.642.1639677329978; 
 Thu, 16 Dec 2021 09:55:29 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxfnK03Kv0K9CSC7sl1OfJrbOKYMl9wq8FDK48j9kAeeeUDkNhtP8urE/K/I3TexWuHcKVuSg==
X-Received: by 2002:a05:6000:15ca:: with SMTP id
 y10mr10179895wry.642.1639677329708; 
 Thu, 16 Dec 2021 09:55:29 -0800 (PST)
Received: from localhost.localdomain
 (174.red-83-50-185.dynamicip.rima-tde.net. [83.50.185.174])
 by smtp.gmail.com with ESMTPSA id t17sm9238842wmq.15.2021.12.16.09.55.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Dec 2021 09:55:29 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 2/2] hw/nvme/ctrl: Prohibit DMA accesses to devices
 (CVE-2021-3929)
Date: Thu, 16 Dec 2021 18:55:10 +0100
Message-Id: <20211216175510.884749-3-philmd@redhat.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211216175510.884749-1-philmd@redhat.com>
References: <20211216175510.884749-1-philmd@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.718,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Mauro Matteo Cascella <mcascell@redhat.com>, qemu-block@nongnu.org,
 David Hildenbrand <david@redhat.com>, Jason Wang <jasowang@redhat.com>,
 Li Qiang <liq3ea@gmail.com>, Qiuhao Li <Qiuhao.Li@outlook.com>,
 Peter Xu <peterx@redhat.com>, Alexander Bulekov <alxndr@bu.edu>,
 Keith Busch <kbusch@kernel.org>, Bandan Das <bsd@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Klaus Jensen <its@irrelevant.dk>,
 "Edgar E . Iglesias" <edgar.iglesias@gmail.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Darren Kenny <darren.kenny@oracle.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Async DMA requests might access MMIO regions and re-program the
NVMe controller internal registers while DMA requests are still
scheduled or in flight. Avoid that by prohibing the controller
to access non-memories regions.

The bug has been audited looking at the following report from
Qiuhao Li:

  =================================================================
  ==793444==ERROR: AddressSanitizer: heap-use-after-free on address 0x616000026198
  WRITE of size 2 at 0x616000026198 thread T0
      #0 0x55d64d672178 in nvme_process_sq hw/nvme/ctrl.c:5556:25
      #1 0x55d64f3b3fde in timerlist_run_timers util/qemu-timer.c:573:9
      #2 0x55d64f3b430c in qemu_clock_run_timers util/qemu-timer.c:587:12

  0x616000026198 is located 24 bytes inside of 624-byte region [0x616000026180,0x6160000263f0)
  freed by thread T0 here:
      #1 0x7f9e20a0ddac in g_free (/lib64/libglib-2.0.so.0+0x56dac)
      #2 0x55d64d661ec2 in nvme_ctrl_reset hw/nvme/ctrl.c:5578:13
      #3 0x55d64d65b5e4 in nvme_write_bar hw/nvme/ctrl.c:5824:13
      #4 0x55d64d658f70 in nvme_mmio_write hw/nvme/ctrl.c:6174:9
      #5 0x55d64e36f413 in memory_region_write_accessor softmmu/memory.c:492:5
      #6 0x55d64e36ed51 in access_with_adjusted_size softmmu/memory.c:554:18
      #7 0x55d64e36d666 in memory_region_dispatch_write softmmu/memory.c:1504:16
      #8 0x55d64e33e8ee in flatview_write_continue softmmu/physmem.c:2812:23
      #9 0x55d64e32d0eb in flatview_write softmmu/physmem.c:2854:12
      #10 0x55d64e32cba8 in address_space_write softmmu/physmem.c:2950:18
      #11 0x55d64e32d417 in address_space_rw softmmu/physmem.c:2960:16
      #12 0x55d64cd207e2 in dma_memory_rw_relaxed include/sysemu/dma.h:89:12
      #13 0x55d64cd2054a in dma_memory_rw include/sysemu/dma.h:132:12
      #14 0x55d64cd1c922 in dma_buf_rw softmmu/dma-helpers.c:312:16
      #15 0x55d64cd1c2e1 in dma_buf_read softmmu/dma-helpers.c:327:12
      #16 0x55d64d638aab in nvme_tx hw/nvme/ctrl.c:1156:19
      #17 0x55d64d6a72f4 in nvme_c2h hw/nvme/ctrl.c:1191:12
      #18 0x55d64d6b7554 in nvme_fw_log_info hw/nvme/ctrl.c:4142:12
      #19 0x55d64d6ab5e8 in nvme_get_log hw/nvme/ctrl.c:4294:16
      #20 0x55d64d6740d5 in nvme_admin_cmd hw/nvme/ctrl.c:5499:16
      #21 0x55d64d6720a3 in nvme_process_sq hw/nvme/ctrl.c:5554:13
      #22 0x55d64f3b3fde in timerlist_run_timers util/qemu-timer.c:573:9

  previously allocated by thread T0 here:
      #1 0x7f9e20a115e0 in g_malloc0 (/lib64/libglib-2.0.so.0+0x5a5e0)
      #2 0x55d64d661856 in nvme_start_ctrl hw/nvme/ctrl.c:5718:5
      #3 0x55d64d65b503 in nvme_write_bar hw/nvme/ctrl.c:5815:17
      #4 0x55d64d658f70 in nvme_mmio_write hw/nvme/ctrl.c:6174:9
      #5 0x55d64e36f413 in memory_region_write_accessor softmmu/memory.c:492:5
      #6 0x55d64e36ed51 in access_with_adjusted_size softmmu/memory.c:554:18
      #7 0x55d64e36d666 in memory_region_dispatch_write softmmu/memory.c:1504:16
      #8 0x55d64e33e8ee in flatview_write_continue softmmu/physmem.c:2812:23
      #9 0x55d64e32d0eb in flatview_write softmmu/physmem.c:2854:12
      #10 0x55d64e32cba8 in address_space_write softmmu/physmem.c:2950:18

  SUMMARY: AddressSanitizer: heap-use-after-free hw/nvme/ctrl.c:5556:25 in nvme_process_sq
  Shadow bytes around the buggy address:
    0x0c2c7fffcbe0: fd fd fd fd fd fd fd fd fd fd fd fd fd fd fd fd
    0x0c2c7fffcbf0: fd fd fd fd fd fd fd fd fd fd fd fd fd fd fd fd
    0x0c2c7fffcc00: fd fd fd fd fd fd fd fd fd fd fd fd fd fd fd fd
    0x0c2c7fffcc10: fd fd fd fd fd fd fd fd fd fd fd fd fd fd fd fd
    0x0c2c7fffcc20: fa fa fa fa fa fa fa fa fa fa fa fa fa fa fa fa
  =>0x0c2c7fffcc30: fd fd fd[fd]fd fd fd fd fd fd fd fd fd fd fd fd
    0x0c2c7fffcc40: fd fd fd fd fd fd fd fd fd fd fd fd fd fd fd fd
    0x0c2c7fffcc50: fd fd fd fd fd fd fd fd fd fd fd fd fd fd fd fd
    0x0c2c7fffcc60: fd fd fd fd fd fd fd fd fd fd fd fd fd fd fd fd
    0x0c2c7fffcc70: fd fd fd fd fd fd fd fd fd fd fd fd fd fd fa fa
    0x0c2c7fffcc80: fa fa fa fa fa fa fa fa fa fa fa fa fa fa fa fa
  Shadow byte legend (one shadow byte represents 8 application bytes):
    Heap left redzone:       fa
    Freed heap region:       fd
  ==793444==ABORTING

Fixes: CVE-2021-3929
Reported-by: Qiuhao Li <Qiuhao.Li@outlook.com>
Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 hw/nvme/ctrl.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/nvme/ctrl.c b/hw/nvme/ctrl.c
index 604ed0aea0d..2be2c340b34 100644
--- a/hw/nvme/ctrl.c
+++ b/hw/nvme/ctrl.c
@@ -1146,7 +1146,7 @@ static uint16_t nvme_tx(NvmeCtrl *n, NvmeSg *sg, uint8_t *ptr, uint32_t len,
     assert(sg->flags & NVME_SG_ALLOC);
 
     if (sg->flags & NVME_SG_DMA) {
-        const MemTxAttrs attrs = MEMTXATTRS_UNSPECIFIED;
+        const MemTxAttrs attrs = { .memory = true };
         MemTxResult res;
         uint64_t residual;
 
-- 
2.33.1


