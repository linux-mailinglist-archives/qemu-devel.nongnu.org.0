Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D297C18F3AF
	for <lists+qemu-devel@lfdr.de>; Mon, 23 Mar 2020 12:32:01 +0100 (CET)
Received: from localhost ([::1]:60472 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jGLId-00075N-OQ
	for lists+qemu-devel@lfdr.de; Mon, 23 Mar 2020 07:31:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42643)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philmd@redhat.com>) id 1jGLHO-0006BK-5A
 for qemu-devel@nongnu.org; Mon, 23 Mar 2020 07:30:03 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1jGLHM-0005pq-Qh
 for qemu-devel@nongnu.org; Mon, 23 Mar 2020 07:30:02 -0400
Received: from us-smtp-delivery-74.mimecast.com ([63.128.21.74]:58021)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>) id 1jGLHM-0005pk-MY
 for qemu-devel@nongnu.org; Mon, 23 Mar 2020 07:30:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1584963000;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=qPJne7T1WNZJs4ZdrbGHhh572lickvYuJNMVK+NQPnU=;
 b=GHhpb+19BgMFNBz/bGBSHO+olLkNfPC+V8GHEJnn0UGCDoJlqSFPwfwMTzau+t6JY6uhrT
 0H1SJsQgKFSeQo7I+xCKbhirzRpJ23Cr8no/uVPiTdYyEq8o4rNor2Bp5K1eVs7KFtMAHh
 9go4ImU6DUsIuJr/2+RaBFeP9p52sEA=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-374-0cnqywtgPCe95ckBqmkRfw-1; Mon, 23 Mar 2020 07:29:57 -0400
X-MC-Unique: 0cnqywtgPCe95ckBqmkRfw-1
Received: by mail-wr1-f72.google.com with SMTP id d17so7234111wrw.19
 for <qemu-devel@nongnu.org>; Mon, 23 Mar 2020 04:29:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=CIpowIr4JfumkLzd2DtitMDVhlCsfUq7QdF+3HPa76w=;
 b=HERiHQ2tvR1rfRp/yjuIFf2/EcGlnID45AV9VVn3OU8gS/zQBIMzpiTnTaAHjLTJfL
 KiLLVSA7//pEap7RtCzPQOqidIKQAtNz0g3E8lWPnSp1JU5C7z14XuyW+xmLFXj32Cuq
 cgQNovSFDxVFjVsPoXAnpX7SVJXPvrlbRQl2CwCTo6GrD7y+WVrTEaks/zkM075vyAmv
 SCirZ63XYm5xqa0hx/LBi8JOACoz/CS5f32wChjvXsX7j0fviZx7faqXo1MbPPghS0Bo
 aY/CDbjCbgmVOhv9/UIxU1UXi9Tttn9EZEeBFj6N2J0cq9X5ruqww4AIXiqkMT3Y2nlz
 1DAA==
X-Gm-Message-State: ANhLgQ0ioR73DZpbpXa6CCP2n9Qf2vVjJpST7dZDZLkNdtyOuQ6aUFpA
 RUmUY3k+ixVCjWFahlQj7JToq0dqU2rh0xv31MqJhWYY2YInm1oRPp1cQF5HMZgKYgbJexfMRVG
 ny+9QAVyesEXLPOA=
X-Received: by 2002:a1c:7c13:: with SMTP id x19mr4732361wmc.27.1584962996127; 
 Mon, 23 Mar 2020 04:29:56 -0700 (PDT)
X-Google-Smtp-Source: ADFU+vvbiaNPng3Bz3jIx6AsQ7zih992PlLmauKj7QX7WqZnZ/87NqzP8GQ1BrG9p7AUL98ZyXo3cQ==
X-Received: by 2002:a1c:7c13:: with SMTP id x19mr4732335wmc.27.1584962995895; 
 Mon, 23 Mar 2020 04:29:55 -0700 (PDT)
Received: from localhost.localdomain (37.red-83-52-54.dynamicip.rima-tde.net.
 [83.52.54.37])
 by smtp.gmail.com with ESMTPSA id d13sm13644167wrv.34.2020.03.23.04.29.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 Mar 2020 04:29:55 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH-for-5.0 2/3] virtio: Document virtqueue_pop()
Date: Mon, 23 Mar 2020 12:29:42 +0100
Message-Id: <20200323112943.12010-3-philmd@redhat.com>
X-Mailer: git-send-email 2.21.1
In-Reply-To: <20200323112943.12010-1-philmd@redhat.com>
References: <20200323112943.12010-1-philmd@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8;
	text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 63.128.21.74
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
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Document that virtqueue_pop() returned memory must be released
with free().

Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
---
 include/hw/virtio/virtio.h | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/include/hw/virtio/virtio.h b/include/hw/virtio/virtio.h
index b69d517496..c6e3bfc500 100644
--- a/include/hw/virtio/virtio.h
+++ b/include/hw/virtio/virtio.h
@@ -199,6 +199,14 @@ void virtqueue_fill(VirtQueue *vq, const VirtQueueElem=
ent *elem,
                     unsigned int len, unsigned int idx);
=20
 void virtqueue_map(VirtIODevice *vdev, VirtQueueElement *elem);
+/**
+ * virtqueue_pop:
+ * @vq: a VirtQueue queue
+ * @sz: the size of struct to return (must be >=3D VirtQueueElement)
+ *
+ * Returns: a VirtQueueElement filled from the queue or NULL.
+ * The returned element must be free()-d by the caller.
+ */
 void *virtqueue_pop(VirtQueue *vq, size_t sz);
 unsigned int virtqueue_drop_all(VirtQueue *vq);
 void *qemu_get_virtqueue_element(VirtIODevice *vdev, QEMUFile *f, size_t s=
z);
--=20
2.21.1


