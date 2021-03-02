Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5787832A275
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Mar 2021 15:26:06 +0100 (CET)
Received: from localhost ([::1]:59838 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lH5yP-0007BR-Ds
	for lists+qemu-devel@lfdr.de; Tue, 02 Mar 2021 09:26:05 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34234)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1lH5wW-0005xf-Pb
 for qemu-devel@nongnu.org; Tue, 02 Mar 2021 09:24:08 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:60997)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1lH5wR-0000Vt-RE
 for qemu-devel@nongnu.org; Tue, 02 Mar 2021 09:24:08 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614695043;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=bVzIzD7Ro1WRiD8tdQmS3Q50kGlZuhnBQiiDtoTlZjk=;
 b=d5MWxtfuWEPL4BRB0UCTFue8gBZ/2oeDJA+6JfMolnroN7zQAtj8knuz0HnqtS9uyfJJUC
 2HAueFzsS/iss1hEvf9UAa8DaTFXRufjR5eepOdlr883+Q5QCvlyRtIlM8EIYt/ZjhBsqv
 V5DFnBiYtg9WCzuj8mk99eUXdLDlKE8=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-503-wd9HbWaaOKWVggQzWTLY0Q-1; Tue, 02 Mar 2021 09:21:21 -0500
X-MC-Unique: wd9HbWaaOKWVggQzWTLY0Q-1
Received: by mail-ej1-f71.google.com with SMTP id p8so2390420ejl.0
 for <qemu-devel@nongnu.org>; Tue, 02 Mar 2021 06:21:21 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=bVzIzD7Ro1WRiD8tdQmS3Q50kGlZuhnBQiiDtoTlZjk=;
 b=SCwArQB6ypeteKhKJxn3+6IVoAsWLzJjlRWI7KSa+boRIT13hqJq30adKVzzJ+AOQp
 ty+oaJOuAQgkiECtriRK3DlwG/MFMxhpxuZYdAvwtloWxqgiRZhpC63K7OXZFK1k56l1
 e3qUPECPSC/7od2el+IceqHIUTa5lJAhEz13lyLKfAVMepcH8Y9LStZy1NXpeBGrPQX+
 p5X2zxlXTxRJfBBlO+BKCOTWwdGQFxkF3EkS3NgZJw4va60gHothaKFsXSvKv0nQ+BL4
 XlHURhysBSbx18JL9wzNRTDf84a8ZvF79r3J6nmq1gn+yZ8PjI76hMEnL8zdVoDi2Rec
 Jf1w==
X-Gm-Message-State: AOAM5332WmBPvTaFCkumbbUSCHMGubpRFZ31Ay58zdY2/wugZfTXIehn
 K9kcfvQ9OoD+BP1GZTzwgCWRqJtFn5lGboUz6rtrr383Sgm9wPWiJVEGxVRTQ5iNjRdJBvKZOB3
 EqteLiXvR/zEPSijzcdyDwv5VAzJ3uheBjME/7qJsifWLsxO/aF7KUQmQwUCz
X-Received: by 2002:a17:906:9714:: with SMTP id
 k20mr20898845ejx.519.1614694879960; 
 Tue, 02 Mar 2021 06:21:19 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwU7t0hIRNzHF8HEDrB2Ml46STbpBKNBHtl/st/7WZVBcMIz+d2+kyPJV1zf1zbDUoQ5huC6A==
X-Received: by 2002:a17:906:9714:: with SMTP id
 k20mr20898821ejx.519.1614694879770; 
 Tue, 02 Mar 2021 06:21:19 -0800 (PST)
Received: from redhat.com (bzq-79-180-2-31.red.bezeqint.net. [79.180.2.31])
 by smtp.gmail.com with ESMTPSA id s18sm17921492ejc.79.2021.03.02.06.21.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Mar 2021 06:21:19 -0800 (PST)
Date: Tue, 2 Mar 2021 09:21:17 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 4/4] vhost: simplify vhost_dev_init() fail_busyloop label
Message-ID: <20210302142014.141135-5-mst@redhat.com>
References: <20210302142014.141135-1-mst@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210302142014.141135-1-mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>,
 Stefano Garzarella <sgarzare@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Stefan Hajnoczi <stefanha@redhat.com>

Requiring a conditional for every goto is tedious:

  if (busyloop_timeout) {
      goto fail_busyloop;
  } else {
      goto fail;
  }

Move the conditional to into the fail_busyloop label so that it's safe
to jump to this label unconditionally.

This change makes the migrate_add_blocker() error case more consistent.
It jumped to fail_busyloop unconditionally whereas the memslots limits
error case was conditional.

Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
Message-Id: <20210222114931.272308-1-stefanha@redhat.com>
Reviewed-by: Stefano Garzarella <sgarzare@redhat.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 hw/virtio/vhost.c | 12 +++++-------
 1 file changed, 5 insertions(+), 7 deletions(-)

diff --git a/hw/virtio/vhost.c b/hw/virtio/vhost.c
index 6e17d631f7..2a01662b08 100644
--- a/hw/virtio/vhost.c
+++ b/hw/virtio/vhost.c
@@ -1388,18 +1388,16 @@ int vhost_dev_init(struct vhost_dev *hdev, void *opaque,
         error_report("vhost backend memory slots limit is less"
                 " than current number of present memory slots");
         r = -1;
-        if (busyloop_timeout) {
-            goto fail_busyloop;
-        } else {
-            goto fail;
-        }
+        goto fail_busyloop;
     }
 
     return 0;
 
 fail_busyloop:
-    while (--i >= 0) {
-        vhost_virtqueue_set_busyloop_timeout(hdev, hdev->vq_index + i, 0);
+    if (busyloop_timeout) {
+        while (--i >= 0) {
+            vhost_virtqueue_set_busyloop_timeout(hdev, hdev->vq_index + i, 0);
+        }
     }
 fail:
     hdev->nvqs = n_initialized_vqs;
-- 
MST


