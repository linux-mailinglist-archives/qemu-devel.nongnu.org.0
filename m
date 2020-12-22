Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EBE3C2E06EC
	for <lists+qemu-devel@lfdr.de>; Tue, 22 Dec 2020 08:49:21 +0100 (CET)
Received: from localhost ([::1]:45074 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1krcQ4-0007h6-VL
	for lists+qemu-devel@lfdr.de; Tue, 22 Dec 2020 02:49:21 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33824)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <liliang.opensource@gmail.com>)
 id 1krcP6-00070x-2N
 for qemu-devel@nongnu.org; Tue, 22 Dec 2020 02:48:21 -0500
Received: from mail-pj1-x1030.google.com ([2607:f8b0:4864:20::1030]:53456)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <liliang.opensource@gmail.com>)
 id 1krcP4-0005K9-4h
 for qemu-devel@nongnu.org; Tue, 22 Dec 2020 02:48:19 -0500
Received: by mail-pj1-x1030.google.com with SMTP id iq13so883274pjb.3
 for <qemu-devel@nongnu.org>; Mon, 21 Dec 2020 23:48:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:date:to:cc:subject:message-id:mail-followup-to:mime-version
 :content-disposition:user-agent;
 bh=i3bfHEMTyy3RMCDYIydmrpz6KtdROg7RvoHxWojHkr0=;
 b=D1GHHgB6ojK9kFQC/HqZtz1VG49st4P/x1r7Gk2gUQTRxEFN899dkPc7TLy4YHxKwt
 UyZA9j9NI9zEHmeu2BOHZbb59/+OmLAzjp6tU9y7bHvcku937QY7HLIdHqr6azr0VZp2
 Hvi+wQQXKbxX4gBZNp3ZAZ/u8Q8KNSkv3a9EjKiuKOvVMHDGkq32mMcvVB3ktpdNUiJ4
 v4UnYrMYZANTliJLq/rOqgBGCxDghtjPlHSABDP7j4ez9OqB+toNiEbojmRIihIWPPd4
 SSD6YYG+N1Myh0gfkdPkSOPdl/C3NSmvu6/JB8IqIlEp3q662kKLVkik5X5aaTrO8Lpn
 PEZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:date:to:cc:subject:message-id
 :mail-followup-to:mime-version:content-disposition:user-agent;
 bh=i3bfHEMTyy3RMCDYIydmrpz6KtdROg7RvoHxWojHkr0=;
 b=HxU2t8d/mPifQufhFLlc+8Z7zH+zjJc1f6aLKLceW8r+6umFgfeEy9Eeh5s7IhH0xf
 v7NcHTY8DrSZZYpAXoM3sjxnOW8aV/lx7/Ra30BSj45gxWq7Mi/8rhGPY+WDet4kAnfG
 VobyHboZTzd64KOBYCJPw2iKEThNohlgYS16BtlBRBPH5/wvF/7LEG8yCQlqmFyQ4NMQ
 Mz8f9IyvX3ev1o1J1PT0q22kxApDnrIw5lShg2TGGRqK51kGOuEF1SkvMjcBW3PvwkOm
 ZNMyM+/f5zydCs8oahi+HTlLPkzc+QnaeR3s40JuW0Qy8ngoWq/1r0Hofwc/TIncTlBH
 Swkw==
X-Gm-Message-State: AOAM532wNCPNjDwMsJ9fJuSk8a5fJTa1uAa1btkVQkYdJ03fSdcg48/0
 4Z6rn5wzaD2tMbtONyh06Ks=
X-Google-Smtp-Source: ABdhPJze6WndpyzBv8oA+rCboDsQWgmQOwnmfLMGSWq7A6Jn6aYr6PdovCpLTkyvj0c+KuPIFMKxaQ==
X-Received: by 2002:a17:902:6b89:b029:da:fc41:baec with SMTP id
 p9-20020a1709026b89b02900dafc41baecmr20012241plk.39.1608623296624; 
 Mon, 21 Dec 2020 23:48:16 -0800 (PST)
Received: from open-light-1.localdomain (66.98.113.28.16clouds.com.
 [66.98.113.28])
 by smtp.gmail.com with ESMTPSA id 36sm12872029pgr.56.2020.12.21.23.48.15
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 21 Dec 2020 23:48:16 -0800 (PST)
From: Liang Li <liliang.opensource@gmail.com>
X-Google-Original-From: Liang Li <liliangleo@didiglobal.com>
Date: Tue, 22 Dec 2020 02:48:13 -0500
To: Alexander Duyck <alexander.h.duyck@linux.intel.com>,
 Mel Gorman <mgorman@techsingularity.net>,
 Andrew Morton <akpm@linux-foundation.org>,
 Andrea Arcangeli <aarcange@redhat.com>,
 Dan Williams <dan.j.williams@intel.com>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 David Hildenbrand <david@redhat.com>, Jason Wang <jasowang@redhat.com>,
 Dave Hansen <dave.hansen@intel.com>, Michal Hocko <mhocko@suse.com>,
 Liang Li <liliangleo@didiglobal.com>,
 Mike Kravetz <mike.kravetz@oracle.com>, Liang Li <liliang324@gmail.com>
Subject: [RFC PATCH 2/3] virtio-balloon: add support for providing free huge
 page reports to host
Message-ID: <20201222074810.GA30047@open-light-1.localdomain>
Mail-Followup-To: Alexander Duyck <alexander.h.duyck@linux.intel.com>,
 Mel Gorman <mgorman@techsingularity.net>,
 Andrew Morton <akpm@linux-foundation.org>,
 Andrea Arcangeli <aarcange@redhat.com>,
 Dan Williams <dan.j.williams@intel.com>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 David Hildenbrand <david@redhat.com>,
 Jason Wang <jasowang@redhat.com>,
 Dave Hansen <dave.hansen@intel.com>, Michal Hocko <mhocko@suse.com>,
 Liang Li <liliangleo@didiglobal.com>,
 Mike Kravetz <mike.kravetz@oracle.com>,
 Liang Li <liliang324@gmail.com>, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org,
 virtualization@lists.linux-foundation.org, qemu-devel@nongnu.org
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.5.21 (2010-09-15)
Received-SPF: pass client-ip=2607:f8b0:4864:20::1030;
 envelope-from=liliang.opensource@gmail.com; helo=mail-pj1-x1030.google.com
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
Cc: qemu-devel@nongnu.org, linux-mm@kvack.org, linux-kernel@vger.kernel.org,
 virtualization@lists.linux-foundation.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Free page reporting only supports buddy pages, it can't report the
free pages reserved for hugetlbfs case. On the other hand, hugetlbfs
is a good choice for a system with a huge amount of RAM, because it
can help to reduce the memory management overhead and improve system
performance.  This patch add support for reporting free hugepage to
host when guest use hugetlbfs.
A new feature bit and a new vq is added for this new feature.

Cc: Alexander Duyck <alexander.h.duyck@linux.intel.com>
Cc: Mel Gorman <mgorman@techsingularity.net>
Cc: Andrea Arcangeli <aarcange@redhat.com>
Cc: Dan Williams <dan.j.williams@intel.com>
Cc: Dave Hansen <dave.hansen@intel.com>
Cc: David Hildenbrand <david@redhat.com>  
Cc: Michal Hocko <mhocko@suse.com> 
Cc: Andrew Morton <akpm@linux-foundation.org>
Cc: Alex Williamson <alex.williamson@redhat.com>
Cc: Michael S. Tsirkin <mst@redhat.com>
Cc: Jason Wang <jasowang@redhat.com>
Cc: Mike Kravetz <mike.kravetz@oracle.com>
Cc: Liang Li <liliang324@gmail.com>
Signed-off-by: Liang Li <liliangleo@didiglobal.com>
---
 drivers/virtio/virtio_balloon.c     | 61 +++++++++++++++++++++++++++++
 include/uapi/linux/virtio_balloon.h |  1 +
 2 files changed, 62 insertions(+)

diff --git a/drivers/virtio/virtio_balloon.c b/drivers/virtio/virtio_balloon.c
index a298517079bb..61363dfd3c2d 100644
--- a/drivers/virtio/virtio_balloon.c
+++ b/drivers/virtio/virtio_balloon.c
@@ -52,6 +52,7 @@ enum virtio_balloon_vq {
 	VIRTIO_BALLOON_VQ_STATS,
 	VIRTIO_BALLOON_VQ_FREE_PAGE,
 	VIRTIO_BALLOON_VQ_REPORTING,
+	VIRTIO_BALLOON_VQ_HPG_REPORTING,
 	VIRTIO_BALLOON_VQ_MAX
 };
 
@@ -126,6 +127,10 @@ struct virtio_balloon {
 	/* Free page reporting device */
 	struct virtqueue *reporting_vq;
 	struct page_reporting_dev_info pr_dev_info;
+
+	/* Free hugepage reporting device */
+	struct virtqueue *hpg_reporting_vq;
+	struct page_reporting_dev_info hpr_dev_info;
 };
 
 static const struct virtio_device_id id_table[] = {
@@ -192,6 +197,33 @@ static int virtballoon_free_page_report(struct page_reporting_dev_info *pr_dev_i
 	return 0;
 }
 
+static int virtballoon_free_hugepage_report(struct page_reporting_dev_info *hpr_dev_info,
+				   struct scatterlist *sg, unsigned int nents)
+{
+	struct virtio_balloon *vb =
+		container_of(hpr_dev_info, struct virtio_balloon, hpr_dev_info);
+	struct virtqueue *vq = vb->hpg_reporting_vq;
+	unsigned int unused, err;
+
+	/* We should always be able to add these buffers to an empty queue. */
+	err = virtqueue_add_inbuf(vq, sg, nents, vb, GFP_NOWAIT | __GFP_NOWARN);
+
+	/*
+	 * In the extremely unlikely case that something has occurred and we
+	 * are able to trigger an error we will simply display a warning
+	 * and exit without actually processing the pages.
+	 */
+	if (WARN_ON_ONCE(err))
+		return err;
+
+	virtqueue_kick(vq);
+
+	/* When host has read buffer, this completes via balloon_ack */
+	wait_event(vb->acked, virtqueue_get_buf(vq, &unused));
+
+	return 0;
+}
+
 static void set_page_pfns(struct virtio_balloon *vb,
 			  __virtio32 pfns[], struct page *page)
 {
@@ -515,6 +547,7 @@ static int init_vqs(struct virtio_balloon *vb)
 	callbacks[VIRTIO_BALLOON_VQ_FREE_PAGE] = NULL;
 	names[VIRTIO_BALLOON_VQ_FREE_PAGE] = NULL;
 	names[VIRTIO_BALLOON_VQ_REPORTING] = NULL;
+	names[VIRTIO_BALLOON_VQ_HPG_REPORTING] = NULL;
 
 	if (virtio_has_feature(vb->vdev, VIRTIO_BALLOON_F_STATS_VQ)) {
 		names[VIRTIO_BALLOON_VQ_STATS] = "stats";
@@ -531,6 +564,11 @@ static int init_vqs(struct virtio_balloon *vb)
 		callbacks[VIRTIO_BALLOON_VQ_REPORTING] = balloon_ack;
 	}
 
+	if (virtio_has_feature(vb->vdev, VIRTIO_BALLOON_F_HPG_REPORTING)) {
+		names[VIRTIO_BALLOON_VQ_HPG_REPORTING] = "hpg_reporting_vq";
+		callbacks[VIRTIO_BALLOON_VQ_HPG_REPORTING] = balloon_ack;
+	}
+
 	err = vb->vdev->config->find_vqs(vb->vdev, VIRTIO_BALLOON_VQ_MAX,
 					 vqs, callbacks, names, NULL, NULL);
 	if (err)
@@ -566,6 +604,8 @@ static int init_vqs(struct virtio_balloon *vb)
 	if (virtio_has_feature(vb->vdev, VIRTIO_BALLOON_F_REPORTING))
 		vb->reporting_vq = vqs[VIRTIO_BALLOON_VQ_REPORTING];
 
+	if (virtio_has_feature(vb->vdev, VIRTIO_BALLOON_F_HPG_REPORTING))
+		vb->hpg_reporting_vq = vqs[VIRTIO_BALLOON_VQ_HPG_REPORTING];
 	return 0;
 }
 
@@ -1001,6 +1041,24 @@ static int virtballoon_probe(struct virtio_device *vdev)
 			goto out_unregister_oom;
 	}
 
+	vb->hpr_dev_info.report = virtballoon_free_hugepage_report;
+	if (virtio_has_feature(vb->vdev, VIRTIO_BALLOON_F_HPG_REPORTING)) {
+		unsigned int capacity;
+
+		capacity = virtqueue_get_vring_size(vb->hpg_reporting_vq);
+		if (capacity < PAGE_REPORTING_CAPACITY) {
+			err = -ENOSPC;
+			goto out_unregister_oom;
+		}
+
+		vb->hpr_dev_info.mini_order = 0;
+		vb->hpr_dev_info.batch_size = 2 * 1024 * 1024; /* 2M */
+		vb->hpr_dev_info.delay_jiffies = 1 * HZ; /* 1 seconds */
+		err = hugepage_reporting_register(&vb->hpr_dev_info);
+		if (err)
+			goto out_unregister_oom;
+	}
+
 	virtio_device_ready(vdev);
 
 	if (towards_target(vb))
@@ -1053,6 +1111,8 @@ static void virtballoon_remove(struct virtio_device *vdev)
 
 	if (virtio_has_feature(vb->vdev, VIRTIO_BALLOON_F_REPORTING))
 		page_reporting_unregister(&vb->pr_dev_info);
+	if (virtio_has_feature(vb->vdev, VIRTIO_BALLOON_F_HPG_REPORTING))
+		hugepage_reporting_unregister(&vb->hpr_dev_info);
 	if (virtio_has_feature(vb->vdev, VIRTIO_BALLOON_F_DEFLATE_ON_OOM))
 		unregister_oom_notifier(&vb->oom_nb);
 	if (virtio_has_feature(vb->vdev, VIRTIO_BALLOON_F_FREE_PAGE_HINT))
@@ -1133,6 +1193,7 @@ static unsigned int features[] = {
 	VIRTIO_BALLOON_F_FREE_PAGE_HINT,
 	VIRTIO_BALLOON_F_PAGE_POISON,
 	VIRTIO_BALLOON_F_REPORTING,
+	VIRTIO_BALLOON_F_HPG_REPORTING,
 };
 
 static struct virtio_driver virtio_balloon_driver = {
diff --git a/include/uapi/linux/virtio_balloon.h b/include/uapi/linux/virtio_balloon.h
index ddaa45e723c4..8ca8f89d95c6 100644
--- a/include/uapi/linux/virtio_balloon.h
+++ b/include/uapi/linux/virtio_balloon.h
@@ -37,6 +37,7 @@
 #define VIRTIO_BALLOON_F_FREE_PAGE_HINT	3 /* VQ to report free pages */
 #define VIRTIO_BALLOON_F_PAGE_POISON	4 /* Guest is using page poisoning */
 #define VIRTIO_BALLOON_F_REPORTING	5 /* Page reporting virtqueue */
+#define VIRTIO_BALLOON_F_HPG_REPORTING	6 /* Huge page reporting virtqueue */
 
 /* Size of a PFN in the balloon interface. */
 #define VIRTIO_BALLOON_PFN_SHIFT 12
-- 
2.18.2


