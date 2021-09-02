Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DCFE63FF1D3
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Sep 2021 18:53:05 +0200 (CEST)
Received: from localhost ([::1]:60056 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mLpxY-0004Ua-IV
	for lists+qemu-devel@lfdr.de; Thu, 02 Sep 2021 12:53:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49552)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mLpvP-0001qn-El
 for qemu-devel@nongnu.org; Thu, 02 Sep 2021 12:50:51 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:58819)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mLpvK-0000AX-PZ
 for qemu-devel@nongnu.org; Thu, 02 Sep 2021 12:50:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1630601444;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=TuD82sa8ZbKDuLj1f0/ZDwnCG6IUjn8ZqsERz54t99U=;
 b=OvYuRoxw5W1BoB5zeamzRs5VLb8NEm0x80gCpFV0KhEz/1VfFKOMEgtZd5iS6Hcw9d8dPS
 tEzAQlAqHvuSexlneh2Zi2zA5FeNk90huw6SeAjEA3/J2wrhwpmr/yf8OEoC2ZzgHl5xDQ
 LUQSbDroTkxlyoMzNWgsQtU0z8lBbNo=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-509-nuIeYc2zOYmqWcZcL5BibA-1; Thu, 02 Sep 2021 12:50:43 -0400
X-MC-Unique: nuIeYc2zOYmqWcZcL5BibA-1
Received: by mail-wm1-f70.google.com with SMTP id
 u1-20020a05600c210100b002e74fc5af71so946824wml.1
 for <qemu-devel@nongnu.org>; Thu, 02 Sep 2021 09:50:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=x1xVyQauaixwRXXUdEbHFOnKdOLNOwH6aJIYBVHQSOA=;
 b=MVp45hroojnjB+wH58hPxlrSBUnvsdOhTVz+GwCkF6NGAPYcSwz9o1ns/SjKtyRa+I
 NjwAFjfOL8RhLwfGW+8kS/Gg516K9N9rs0aNS/VCvWR5D5WKzclh8R766VwZaw139xip
 Yrm7+ISRbxhOEfNAv0L1HWdLd9irORGZFYgNFzMLPmWTArNh0iZ2MMwMtCWAHjKZSQu9
 knnHHgxAVEc1MiCvwE+j9ZpkwoywytSl0jitAypHUybbEOC8us2juS+8mjuDqts2faJt
 GH8SJXomEEAPd7Cf8lnIW7vwnwsH8YGyj2sVe4Dv7Bpim+igll+RpkshiicRGhUPhF8W
 kQrA==
X-Gm-Message-State: AOAM532VkWQcw8M3GzQN4/uPL6uNSYcIbFhHTBorpRbXHfoBAJGUfgZv
 HbVcJgh7qYiSQa0uGLKHMIL8ISdlNyUjtf2PD69f1BAxs7UT12FaomfUGA6aKN2ScUvAezP+BAt
 RAb+Qo0PoVmLBJRE3AhaQ0oNUCUPaWpLl3RdZvT1ooW+WC9epYFLxDQI8yaF3HqIR
X-Received: by 2002:adf:fd8c:: with SMTP id d12mr4879799wrr.21.1630601441740; 
 Thu, 02 Sep 2021 09:50:41 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwjKnq3OZ4nXwn4fyIJWESQkWzKZu5CDCQPSApKCG3GkAJkubJ5JJafKhiRixYYOK4bPzGQGw==
X-Received: by 2002:adf:fd8c:: with SMTP id d12mr4879772wrr.21.1630601441496; 
 Thu, 02 Sep 2021 09:50:41 -0700 (PDT)
Received: from x1w.. (163.red-83-52-55.dynamicip.rima-tde.net. [83.52.55.163])
 by smtp.gmail.com with ESMTPSA id
 o15sm2458762wra.3.2021.09.02.09.50.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Sep 2021 09:50:40 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 0/5] hw/virtio: Minor housekeeping patches
Date: Thu,  2 Sep 2021 18:50:34 +0200
Message-Id: <20210902165039.432786-1-philmd@redhat.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.39,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: "Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>,
 Cornelia Huck <cohuck@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Stefano Garzarella <sgarzare@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi,=0D
=0D
This series contains few patches I gathered while tooking notes=0D
trying to understand issues #300-#302.=0D
=0D
Since v1:=0D
- Added virtqueue_flush comment (Stefano)=0D
- Call RCU_READ_LOCK_GUARD in virtqueue_packed_drop_all (Stefano)=0D
=0D
Philippe Mathieu-Daud=C3=A9 (5):=0D
  hw/virtio: Document virtio_queue_packed_empty_rcu is called within RCU=0D
  hw/virtio: Comment virtqueue_flush() must be called with RCU read lock=0D
  hw/virtio: Remove NULL check in virtio_free_region_cache()=0D
  hw/virtio: Acquire RCU read lock in virtqueue_packed_drop_all()=0D
  hw/virtio: Have virtqueue_get_avail_bytes() pass caches arg to callees=0D
=0D
 include/hw/virtio/virtio.h |  7 +++++++=0D
 hw/virtio/virtio.c         | 39 ++++++++++++++++++--------------------=0D
 2 files changed, 25 insertions(+), 21 deletions(-)=0D
=0D
--=20=0D
2.31.1=0D
=0D


