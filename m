Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 16A6438DABA
	for <lists+qemu-devel@lfdr.de>; Sun, 23 May 2021 11:41:57 +0200 (CEST)
Received: from localhost ([::1]:36600 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lkkcM-0004UD-RE
	for lists+qemu-devel@lfdr.de; Sun, 23 May 2021 05:41:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37924)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lkkbK-0003ee-1f
 for qemu-devel@nongnu.org; Sun, 23 May 2021 05:40:50 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:46109)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lkkbG-00047C-VQ
 for qemu-devel@nongnu.org; Sun, 23 May 2021 05:40:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1621762844;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=l/srWcdbIelU+Cf/uD7ox1LabteZtPhwyCo62ZgjXfs=;
 b=X+/J6ZQr5dpUwBYMbk3Myb9cGNids5YrOhZwuxX5azioOOX9bvtKzEBsHRudLZF8AoMtW4
 09umP8l5d04RiPpby8wnZLTKes6iKxmf6/DiPRP/VMMBQf2PgFYTxUNLK+gPxgJTuMsw6V
 3veulGMldlrEOl2C3CCei+vTvsziBZM=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-33-tRU4NU1rMcyVUKD1qWHQkQ-1; Sun, 23 May 2021 05:40:43 -0400
X-MC-Unique: tRU4NU1rMcyVUKD1qWHQkQ-1
Received: by mail-ed1-f72.google.com with SMTP id
 h16-20020a0564020950b029038cbdae8cbaso13846921edz.6
 for <qemu-devel@nongnu.org>; Sun, 23 May 2021 02:40:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=l/srWcdbIelU+Cf/uD7ox1LabteZtPhwyCo62ZgjXfs=;
 b=MRdx27rmyZW7/FSUOGXnFtqblQchabaDHnf6jeiWLVyoL3RuKeu2ZJPFBErN+NuqsI
 UvJCwsmIwoNFr6b3NqWCaxnqZ+SN7qRatvfLU3168cL+Syyn/riK4qE+io/DeKiW9Swz
 ZHw/citYEcbZPivdTpZThFS06sghpdYrVZfJsuN4U7M1V/lE19/S05HXcIPH/KCcyoFr
 zw7lb1y790AEnBj4i/4fVaCBYLNnS44K3lXF6bTalnDnHwr2XaMdNWRTGtwzsYGxJd/G
 DmiDJpZ6FRiHSsJ2BKA39kZ4PUaGxLq+y/Zvyj2FzecoaZipcIO80CbTRHiKPyw5M91N
 paJQ==
X-Gm-Message-State: AOAM533xeyQXqoiDkVSyMrCTlKWrmSTCAhm4p1cWnnzf/WqgpaNHsdog
 WCOXcKmHtCuix3D+L9Tg9c/CYAlf1QfJsuRpZ6lcoAawOPFC7bQdgUS/avBYrobeDUlG9wDijIN
 HaE8IwbZrlJGNCPMB7rJAbPRJA+Ld7Z7cton9SOKq5z2fK5aZJFzw2MmVT7lqYIYM
X-Received: by 2002:a05:6402:487:: with SMTP id
 k7mr19764513edv.315.1621762842100; 
 Sun, 23 May 2021 02:40:42 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw3uMxU61e0PG8/u8JR/p8mSE7qqj/8U5YovHt2hc93HAAlsNtHgxYEiugKVwsFIkuFw6zNeQ==
X-Received: by 2002:a05:6402:487:: with SMTP id
 k7mr19764494edv.315.1621762841782; 
 Sun, 23 May 2021 02:40:41 -0700 (PDT)
Received: from x1w.redhat.com (31.red-83-51-215.dynamicip.rima-tde.net.
 [83.51.215.31])
 by smtp.gmail.com with ESMTPSA id qo14sm6479143ejb.47.2021.05.23.02.40.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 23 May 2021 02:40:41 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2] hw/virtio: Document *_should_notify() are called within
 rcu_read_lock()
Date: Sun, 23 May 2021 11:40:40 +0200
Message-Id: <20210523094040.3516968-1-philmd@redhat.com>
X-Mailer: git-send-email 2.26.3
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.374,
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
Cc: qemu-trivial@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Such comments make reviewing this file somehow easier.

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
v2: only one space before end of comment (mst)
---
 hw/virtio/virtio.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/hw/virtio/virtio.c b/hw/virtio/virtio.c
index e02544b2df7..130e3568409 100644
--- a/hw/virtio/virtio.c
+++ b/hw/virtio/virtio.c
@@ -2449,6 +2449,7 @@ static void virtio_set_isr(VirtIODevice *vdev, int value)
     }
 }
 
+/* Called within rcu_read_lock(). */
 static bool virtio_split_should_notify(VirtIODevice *vdev, VirtQueue *vq)
 {
     uint16_t old, new;
@@ -2485,6 +2486,7 @@ static bool vring_packed_need_event(VirtQueue *vq, bool wrap,
     return vring_need_event(off, new, old);
 }
 
+/* Called within rcu_read_lock(). */
 static bool virtio_packed_should_notify(VirtIODevice *vdev, VirtQueue *vq)
 {
     VRingPackedDescEvent e;
-- 
2.26.3


