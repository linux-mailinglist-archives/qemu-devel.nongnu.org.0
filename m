Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D07613406C
	for <lists+qemu-devel@lfdr.de>; Tue,  4 Jun 2019 09:38:12 +0200 (CEST)
Received: from localhost ([127.0.0.1]:47444 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hY41L-0002bT-Vi
	for lists+qemu-devel@lfdr.de; Tue, 04 Jun 2019 03:38:12 -0400
Received: from eggs.gnu.org ([209.51.188.92]:46176)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <elohimes@gmail.com>) id 1hY3yx-0001Kp-Nm
	for qemu-devel@nongnu.org; Tue, 04 Jun 2019 03:35:44 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <elohimes@gmail.com>) id 1hY3yw-0004UC-Ov
	for qemu-devel@nongnu.org; Tue, 04 Jun 2019 03:35:43 -0400
Received: from mail-pg1-x544.google.com ([2607:f8b0:4864:20::544]:44655)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <elohimes@gmail.com>) id 1hY3yw-0004Mh-Iw
	for qemu-devel@nongnu.org; Tue, 04 Jun 2019 03:35:42 -0400
Received: by mail-pg1-x544.google.com with SMTP id n2so9825624pgp.11
	for <qemu-devel@nongnu.org>; Tue, 04 Jun 2019 00:35:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=0LFWE+6YBWNetnIjT0/2k7O7uyx6xdsCiXpzjLGF0E8=;
	b=fKZQwn8dh+OPZQuQscBOTSRkc+9+3XY6psxqRvrxoGcuSBJEKvVNSrBxf+qckjp8vS
	4d60AIbV8oOgRD/lBPZ/kVrSlX10ip3Yenowg6DXILhKRz3xm/D/kprXQt78ckxR8fyu
	Gpb+H5e1A31zZ2DBd62/WCwqzwjQ/M5o6VLE4tuvVw76rzU0oR/3qNJsypGkPkS7eV2z
	tPDLhn5mC9nvuQTIGMotOLHkmgIQeOLi7kUl34Y5+UK9ezRpOpR95pl4qj6JAbcANaiE
	0s/l4h77kE0/YRXmToBMPZb6BgIkCA6HjptG+jSfcWXWSfwsDLIcLtMNZO3pUAFM4NPR
	4EJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=0LFWE+6YBWNetnIjT0/2k7O7uyx6xdsCiXpzjLGF0E8=;
	b=PHcrCR96BYtwuQr9HWl+3HC9gSFbnMDog6NNIblG194SZ+oKRZmTyyjupFXvRmNQ/d
	SaDeKSbEfN9W7EHrY6+38WtWXpYBVoiP95reX2hglr0yUcLR4QBxTvczl9qx0+8+Qm8H
	+cQDpqNOi2gr5qGs44eJbXVCo/dzJ1NVu5b5ouSbSU1UAzxD/i4a2rvNcWpxNptucAMn
	I/cN9VYzoR052dJ4QwKwdr1PoD/D8/hKigQ1+8323ZVfN+hx0eBrDqWN4VLtxO/pnGYS
	EzNnBx+mX/aEvk+ps5mYMXDDyOF0FcSyRyEi6406z8KxE0M0rn28acZXJJBrSG4VEt71
	oz9w==
X-Gm-Message-State: APjAAAVnZ06+wArZxR7TEVwhrRtQ79mZojqBNBQYlAHH6+jcRCZrxrx8
	sECY/hQU1fuyO4fJWlw4YTMdurdT
X-Google-Smtp-Source: APXvYqyth0u6KIGmJPcmLqnzefKa4kPF5OCC+7EHSY2dFyQUU+p23NQa+LC+1w6yYeOBDTMO1FUHTg==
X-Received: by 2002:a17:90a:7f02:: with SMTP id
	k2mr35414091pjl.78.1559633741441; 
	Tue, 04 Jun 2019 00:35:41 -0700 (PDT)
Received: from localhost ([116.247.112.152]) by smtp.gmail.com with ESMTPSA id
	m8sm26428531pff.137.2019.06.04.00.35.40
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Tue, 04 Jun 2019 00:35:41 -0700 (PDT)
From: elohimes@gmail.com
X-Google-Original-From: xieyongji@baidu.com
To: mst@redhat.com,
	groug@kaod.org
Date: Tue,  4 Jun 2019 15:34:58 +0800
Message-Id: <20190604073459.15651-5-xieyongji@baidu.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190604073459.15651-1-xieyongji@baidu.com>
References: <20190604073459.15651-1-xieyongji@baidu.com>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::544
Subject: [Qemu-devel] [PATCH v2 4/5] virtio: Don't change "started" flag on
 virtio_vmstate_change()
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Xie Yongji <xieyongji@baidu.com>, dgilbert@redhat.com,
	qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Xie Yongji <xieyongji@baidu.com>

We will call virtio_set_status() on virtio_vmstate_change().
The "started" flag should not be changed in this case. Otherwise,
we may get an incorrect value when we set "started" flag but
not set DRIVER_OK in source VM.

Signed-off-by: Xie Yongji <xieyongji@baidu.com>
---
 hw/virtio/virtio.c | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/hw/virtio/virtio.c b/hw/virtio/virtio.c
index 3dc2f8c223..3960619bd4 100644
--- a/hw/virtio/virtio.c
+++ b/hw/virtio/virtio.c
@@ -1162,9 +1162,13 @@ int virtio_set_status(VirtIODevice *vdev, uint8_t val)
             }
         }
     }
-    vdev->started = val & VIRTIO_CONFIG_S_DRIVER_OK;
-    if (unlikely(vdev->start_on_kick && vdev->started)) {
-        vdev->start_on_kick = false;
+
+    if ((vdev->status & VIRTIO_CONFIG_S_DRIVER_OK) !=
+        (val & VIRTIO_CONFIG_S_DRIVER_OK)) {
+        vdev->started = val & VIRTIO_CONFIG_S_DRIVER_OK;
+        if (unlikely(vdev->start_on_kick && vdev->started)) {
+            vdev->start_on_kick = false;
+        }
     }
 
     if (k->set_status) {
-- 
2.17.1


