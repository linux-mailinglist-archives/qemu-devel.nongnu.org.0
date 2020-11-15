Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E7ED62B39F0
	for <lists+qemu-devel@lfdr.de>; Sun, 15 Nov 2020 23:38:25 +0100 (CET)
Received: from localhost ([::1]:48640 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1keQfB-00013l-0P
	for lists+qemu-devel@lfdr.de; Sun, 15 Nov 2020 17:38:25 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53086)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1keQV2-0000gQ-HZ
 for qemu-devel@nongnu.org; Sun, 15 Nov 2020 17:27:56 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:23455)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1keQV0-0001aX-Ej
 for qemu-devel@nongnu.org; Sun, 15 Nov 2020 17:27:56 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1605479273;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=hNj3O+0UUhM/CTz4F1SZ3hwV0N3LMiDYPqcb3nWx72c=;
 b=W9WN25Fv+ZOR7B/6HGt7yNa45ky1z+jygVQp61Yzpz7tCM59Dm1HPhaNEpUHRswWBVZRfn
 sRn7BI9GoKET4qQvv6P1K6B9jZp74P6ftJG0Z94/cDhEPyQYpzVCWSwRumZcRJRf5zxAWU
 al9SHVUWw0tgB8AQmF6R3ZsWAHGeCXw=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-433-MnseJFlAN1ypql6tNfBXSg-1; Sun, 15 Nov 2020 17:27:52 -0500
X-MC-Unique: MnseJFlAN1ypql6tNfBXSg-1
Received: by mail-wr1-f72.google.com with SMTP id d8so9840661wrr.10
 for <qemu-devel@nongnu.org>; Sun, 15 Nov 2020 14:27:51 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=hNj3O+0UUhM/CTz4F1SZ3hwV0N3LMiDYPqcb3nWx72c=;
 b=FtJxBDOQn5Cd/psruPNu/nDZLgVvqNDhM9wBEV6uBRGQc1DWe2fpe953gMLlL5Zmvn
 vkHLshg3QaWdZS4jCzfGf9c9g2B47i4kXB20BjdTAmjJGc45ipDvucszhsTCVoOGuMaX
 3OVaBKBML4K48rcpj6wTus9L+bf/Aetl7XOPxSh9FBnYK/ATFK0EIfzOTg5r72vbQZZt
 z15O0ZVPLddzlJ7W73gcTBaaMBslAeldVErlZOODDaduboMAr4jfH2y8bdQf2dCVef3B
 fwuxnBipZq2rBtd/IU6ockGdRhzH/oiUKndRnlp3uEbx87gZyhpRXKw9tKwVreicm3eT
 pGtQ==
X-Gm-Message-State: AOAM530jsqTOD3T0j+/nG0c//bLEwh0rrEBCjJ5sydfCwUxS9QgYB4Dl
 8Dc4Q2kUGlz1EBSCIcK9rVk3py/NBYoFke+TkZppP/ebyk3SYsDGKcIOOMpPaGR0PSyYWHPZmEr
 WHRoLBjUZ7y0g4hAztDajTxJkchKUIAw1XVKnsxYdK6Je6TwXVWB9JLwBzvO6
X-Received: by 2002:adf:f549:: with SMTP id j9mr16313495wrp.324.1605479270599; 
 Sun, 15 Nov 2020 14:27:50 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyJ+W5NVksGMGKLmkvVKMsAG2ILyPeS0+wlJXlTBD6YchM2lUDjMVpPoA21C00YlcD0fyimlQ==
X-Received: by 2002:adf:f549:: with SMTP id j9mr16313476wrp.324.1605479270355; 
 Sun, 15 Nov 2020 14:27:50 -0800 (PST)
Received: from redhat.com (bzq-79-176-118-93.red.bezeqint.net. [79.176.118.93])
 by smtp.gmail.com with ESMTPSA id 6sm13626931wrn.72.2020.11.15.14.27.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 15 Nov 2020 14:27:49 -0800 (PST)
Date: Sun, 15 Nov 2020 17:27:47 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 14/17] vhost-user-blk-test: test discard/write zeroes invalid
 inputs
Message-ID: <20201115220740.488850-15-mst@redhat.com>
References: <20201115220740.488850-1-mst@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20201115220740.488850-1-mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/15 16:39:49
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 Thomas Huth <thuth@redhat.com>, qemu-block@nongnu.org,
 Laurent Vivier <lvivier@redhat.com>, Coiby Xu <Coiby.Xu@gmail.com>,
 Max Reitz <mreitz@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Stefan Hajnoczi <stefanha@redhat.com>

Exercise input validation code paths in
block/export/vhost-user-blk-server.c.

Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
Message-Id: <20201111124331.1393747-10-stefanha@redhat.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 block/export/vhost-user-blk-server.c |   4 +-
 tests/qtest/vhost-user-blk-test.c    | 124 +++++++++++++++++++++++++++
 2 files changed, 126 insertions(+), 2 deletions(-)

diff --git a/block/export/vhost-user-blk-server.c b/block/export/vhost-user-blk-server.c
index 3295d3c951..d88e41714d 100644
--- a/block/export/vhost-user-blk-server.c
+++ b/block/export/vhost-user-blk-server.c
@@ -248,8 +248,8 @@ static void coroutine_fn vu_blk_virtio_process_req(void *opaque)
             break;
         }
 
-        req->in->status = vu_blk_discard_write_zeroes(vexp, elem->out_sg,
-                                                      out_num, type);
+        req->in->status = vu_blk_discard_write_zeroes(vexp, out_iov, out_num,
+                                                      type);
         break;
     }
     default:
diff --git a/tests/qtest/vhost-user-blk-test.c b/tests/qtest/vhost-user-blk-test.c
index e52340cffb..991a018c55 100644
--- a/tests/qtest/vhost-user-blk-test.c
+++ b/tests/qtest/vhost-user-blk-test.c
@@ -90,6 +90,124 @@ static uint64_t virtio_blk_request(QGuestAllocator *alloc, QVirtioDevice *d,
     return addr;
 }
 
+static void test_invalid_discard_write_zeroes(QVirtioDevice *dev,
+                                              QGuestAllocator *alloc,
+                                              QTestState *qts,
+                                              QVirtQueue *vq,
+                                              uint32_t type)
+{
+    QVirtioBlkReq req;
+    struct virtio_blk_discard_write_zeroes dwz_hdr;
+    struct virtio_blk_discard_write_zeroes dwz_hdr2[2];
+    uint64_t req_addr;
+    uint32_t free_head;
+    uint8_t status;
+
+    /* More than one dwz is not supported */
+    req.type = type;
+    req.data = (char *) dwz_hdr2;
+    dwz_hdr2[0].sector = 0;
+    dwz_hdr2[0].num_sectors = 1;
+    dwz_hdr2[0].flags = 0;
+    dwz_hdr2[1].sector = 1;
+    dwz_hdr2[1].num_sectors = 1;
+    dwz_hdr2[1].flags = 0;
+
+    virtio_blk_fix_dwz_hdr(dev, &dwz_hdr2[0]);
+    virtio_blk_fix_dwz_hdr(dev, &dwz_hdr2[1]);
+
+    req_addr = virtio_blk_request(alloc, dev, &req, sizeof(dwz_hdr2));
+
+    free_head = qvirtqueue_add(qts, vq, req_addr, 16, false, true);
+    qvirtqueue_add(qts, vq, req_addr + 16, sizeof(dwz_hdr2), false, true);
+    qvirtqueue_add(qts, vq, req_addr + 16 + sizeof(dwz_hdr2), 1, true,
+                   false);
+
+    qvirtqueue_kick(qts, dev, vq, free_head);
+
+    qvirtio_wait_used_elem(qts, dev, vq, free_head, NULL,
+                           QVIRTIO_BLK_TIMEOUT_US);
+    status = readb(req_addr + 16 + sizeof(dwz_hdr2));
+    g_assert_cmpint(status, ==, VIRTIO_BLK_S_UNSUPP);
+
+    guest_free(alloc, req_addr);
+
+    /* num_sectors must be less than config->max_write_zeroes_sectors */
+    req.type = type;
+    req.data = (char *) &dwz_hdr;
+    dwz_hdr.sector = 0;
+    dwz_hdr.num_sectors = 0xffffffff;
+    dwz_hdr.flags = 0;
+
+    virtio_blk_fix_dwz_hdr(dev, &dwz_hdr);
+
+    req_addr = virtio_blk_request(alloc, dev, &req, sizeof(dwz_hdr));
+
+    free_head = qvirtqueue_add(qts, vq, req_addr, 16, false, true);
+    qvirtqueue_add(qts, vq, req_addr + 16, sizeof(dwz_hdr), false, true);
+    qvirtqueue_add(qts, vq, req_addr + 16 + sizeof(dwz_hdr), 1, true,
+                   false);
+
+    qvirtqueue_kick(qts, dev, vq, free_head);
+
+    qvirtio_wait_used_elem(qts, dev, vq, free_head, NULL,
+                           QVIRTIO_BLK_TIMEOUT_US);
+    status = readb(req_addr + 16 + sizeof(dwz_hdr));
+    g_assert_cmpint(status, ==, VIRTIO_BLK_S_IOERR);
+
+    guest_free(alloc, req_addr);
+
+    /* sector must be less than the device capacity */
+    req.type = type;
+    req.data = (char *) &dwz_hdr;
+    dwz_hdr.sector = TEST_IMAGE_SIZE / 512 + 1;
+    dwz_hdr.num_sectors = 1;
+    dwz_hdr.flags = 0;
+
+    virtio_blk_fix_dwz_hdr(dev, &dwz_hdr);
+
+    req_addr = virtio_blk_request(alloc, dev, &req, sizeof(dwz_hdr));
+
+    free_head = qvirtqueue_add(qts, vq, req_addr, 16, false, true);
+    qvirtqueue_add(qts, vq, req_addr + 16, sizeof(dwz_hdr), false, true);
+    qvirtqueue_add(qts, vq, req_addr + 16 + sizeof(dwz_hdr), 1, true,
+                   false);
+
+    qvirtqueue_kick(qts, dev, vq, free_head);
+
+    qvirtio_wait_used_elem(qts, dev, vq, free_head, NULL,
+                           QVIRTIO_BLK_TIMEOUT_US);
+    status = readb(req_addr + 16 + sizeof(dwz_hdr));
+    g_assert_cmpint(status, ==, VIRTIO_BLK_S_IOERR);
+
+    guest_free(alloc, req_addr);
+
+    /* reserved flag bits must be zero */
+    req.type = type;
+    req.data = (char *) &dwz_hdr;
+    dwz_hdr.sector = 0;
+    dwz_hdr.num_sectors = 1;
+    dwz_hdr.flags = ~VIRTIO_BLK_WRITE_ZEROES_FLAG_UNMAP;
+
+    virtio_blk_fix_dwz_hdr(dev, &dwz_hdr);
+
+    req_addr = virtio_blk_request(alloc, dev, &req, sizeof(dwz_hdr));
+
+    free_head = qvirtqueue_add(qts, vq, req_addr, 16, false, true);
+    qvirtqueue_add(qts, vq, req_addr + 16, sizeof(dwz_hdr), false, true);
+    qvirtqueue_add(qts, vq, req_addr + 16 + sizeof(dwz_hdr), 1, true,
+                   false);
+
+    qvirtqueue_kick(qts, dev, vq, free_head);
+
+    qvirtio_wait_used_elem(qts, dev, vq, free_head, NULL,
+                           QVIRTIO_BLK_TIMEOUT_US);
+    status = readb(req_addr + 16 + sizeof(dwz_hdr));
+    g_assert_cmpint(status, ==, VIRTIO_BLK_S_UNSUPP);
+
+    guest_free(alloc, req_addr);
+}
+
 /* Returns the request virtqueue so the caller can perform further tests */
 static QVirtQueue *test_basic(QVirtioDevice *dev, QGuestAllocator *alloc)
 {
@@ -231,6 +349,9 @@ static QVirtQueue *test_basic(QVirtioDevice *dev, QGuestAllocator *alloc)
         g_free(data);
 
         guest_free(alloc, req_addr);
+
+        test_invalid_discard_write_zeroes(dev, alloc, qts, vq,
+                                          VIRTIO_BLK_T_WRITE_ZEROES);
     }
 
     if (features & (1u << VIRTIO_BLK_F_DISCARD)) {
@@ -259,6 +380,9 @@ static QVirtQueue *test_basic(QVirtioDevice *dev, QGuestAllocator *alloc)
         g_assert_cmpint(status, ==, 0);
 
         guest_free(alloc, req_addr);
+
+        test_invalid_discard_write_zeroes(dev, alloc, qts, vq,
+                                          VIRTIO_BLK_T_DISCARD);
     }
 
     if (features & (1u << VIRTIO_F_ANY_LAYOUT)) {
-- 
MST


