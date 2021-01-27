Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A82E3065E8
	for <lists+qemu-devel@lfdr.de>; Wed, 27 Jan 2021 22:25:06 +0100 (CET)
Received: from localhost ([::1]:57318 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l4sJF-0001fo-An
	for lists+qemu-devel@lfdr.de; Wed, 27 Jan 2021 16:25:05 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42706)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1l4sGC-0007DS-3h
 for qemu-devel@nongnu.org; Wed, 27 Jan 2021 16:21:56 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:53459)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1l4sGA-0000Zh-CC
 for qemu-devel@nongnu.org; Wed, 27 Jan 2021 16:21:55 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1611782513;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=LH7rlpbaLs1tBmBzIg89VRyyKUjgUrsdXe1ezZrMVOQ=;
 b=BGQgnMY4fz+e65dpKsF+92JUgKdQXbSmEwVTrTjiuXYZXp7ZGnxpp4hTagqQ4k66P7kyD5
 7phkhgketNk9F8YdgA12Xp4EjkmB48v0SbDbivYSf5w48YUrYOF9gq0m0v+knaDlzdY3eW
 uSbHNawtMg6I79q5IJ/c1KjntD4WQvU=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-561-1lKtP4YrMQalI9xDDqx2Xw-1; Wed, 27 Jan 2021 16:21:52 -0500
X-MC-Unique: 1lKtP4YrMQalI9xDDqx2Xw-1
Received: by mail-wr1-f69.google.com with SMTP id l10so1877974wry.16
 for <qemu-devel@nongnu.org>; Wed, 27 Jan 2021 13:21:52 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=LH7rlpbaLs1tBmBzIg89VRyyKUjgUrsdXe1ezZrMVOQ=;
 b=hRNdC9pRyvDFiKBugANYX9jJcCPf+S/McRJrnRJeVIcso9/Ba/f44/3Lhnid5oWQLM
 dRNA6i3Cq8uvk/KQMQGgVlTy+CREtiO+erXKhK7pq3TrUfBXii+BisW0WBPI1ZI2KdFk
 VTFygHDCICANC+f3A7v8UXZpfR3kz9lISUaj8LozDYZrJpJ2OtbvfVj3h1PxLgS5bN2g
 Bh1XswRFMBx7hmNrer5vIzlY7aL3wlKIi/gMstY7vMGBdefhoOcAGWlTCcgy/Nag1oL6
 ziGha2xb0TRkgtGb05dSrzYHbIH05I9Uo9RdN7hW2GsLZm5pdjmsmKXXdYr49Yji60li
 GNaA==
X-Gm-Message-State: AOAM5312rLDetHQ11qQcObK248a8aoM+SGxLMNfuvxd8BIIllZid+Ktx
 zTc6tQh+Hj4my2TpUngvqREgiC3ZWwarmZ/fxO5dnwOeZrqdTY6ZXXKRevgb5ISE5S1MeXxFYxg
 AI545dG5/9nFnlpA5CRd9I5bT7TNgnTMDjLbECFh09EIYhKggOkDBL5yq2svNI/kV
X-Received: by 2002:a5d:4485:: with SMTP id j5mr12974372wrq.315.1611782511006; 
 Wed, 27 Jan 2021 13:21:51 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxdWt7TGyPE2DYYOsCSrocY1tlcBltiuxjqNrsNDQKbhRkjzFs0KKLulyXq7SdINlOcRAQByA==
X-Received: by 2002:a5d:4485:: with SMTP id j5mr12974353wrq.315.1611782510790; 
 Wed, 27 Jan 2021 13:21:50 -0800 (PST)
Received: from localhost.localdomain (13.red-83-57-169.dynamicip.rima-tde.net.
 [83.57.169.13])
 by smtp.gmail.com with ESMTPSA id u3sm4669392wre.54.2021.01.27.13.21.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 27 Jan 2021 13:21:50 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 2/2] block/nvme: Trace NVMe spec version supported by the
 controller
Date: Wed, 27 Jan 2021 22:21:37 +0100
Message-Id: <20210127212137.3482291-3-philmd@redhat.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210127212137.3482291-1-philmd@redhat.com>
References: <20210127212137.3482291-1-philmd@redhat.com>
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
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.308,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Fam Zheng <fam@euphon.net>, Kevin Wolf <kwolf@redhat.com>,
 qemu-block@nongnu.org, Max Reitz <mreitz@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

NVMe controllers implement different versions of the spec,
and different features of it. It is useful to gather this
information when debugging.

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 block/nvme.c       | 6 ++++++
 block/trace-events | 1 +
 2 files changed, 7 insertions(+)

diff --git a/block/nvme.c b/block/nvme.c
index 80c4318d8fc..2b5421e7aa6 100644
--- a/block/nvme.c
+++ b/block/nvme.c
@@ -708,6 +708,7 @@ static int nvme_init(BlockDriverState *bs, const char *device, int namespace,
     AioContext *aio_context = bdrv_get_aio_context(bs);
     int ret;
     uint64_t cap;
+    uint32_t ver;
     uint64_t timeout_ms;
     uint64_t deadline, now;
     volatile NvmeBar *regs = NULL;
@@ -764,6 +765,11 @@ static int nvme_init(BlockDriverState *bs, const char *device, int namespace,
     bs->bl.request_alignment = s->page_size;
     timeout_ms = MIN(500 * NVME_CAP_TO(cap), 30000);
 
+    ver = le32_to_cpu(regs->vs);
+    trace_nvme_controller_spec_version(extract32(ver, 16, 16),
+                                       extract32(ver, 8, 8),
+                                       extract32(ver, 0, 8));
+
     /* Reset device to get a clean state. */
     regs->cc = cpu_to_le32(le32_to_cpu(regs->cc) & 0xFE);
     /* Wait for CSTS.RDY = 0. */
diff --git a/block/trace-events b/block/trace-events
index 8368f4acb0b..ecbc32a80a9 100644
--- a/block/trace-events
+++ b/block/trace-events
@@ -136,6 +136,7 @@ qed_aio_write_main(void *s, void *acb, int ret, uint64_t offset, size_t len) "s
 # nvme.c
 nvme_controller_capability_raw(uint64_t value) "0x%08"PRIx64
 nvme_controller_capability(const char *desc, uint64_t value) "%s: %"PRIu64
+nvme_controller_spec_version(uint32_t mjr, uint32_t mnr, uint32_t ter) "Specification supported: %u.%u.%u"
 nvme_kick(void *s, unsigned q_index) "s %p q #%u"
 nvme_dma_flush_queue_wait(void *s) "s %p"
 nvme_error(int cmd_specific, int sq_head, int sqid, int cid, int status) "cmd_specific %d sq_head %d sqid %d cid %d status 0x%x"
-- 
2.26.2


