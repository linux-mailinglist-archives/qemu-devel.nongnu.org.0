Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C0C058F297
	for <lists+qemu-devel@lfdr.de>; Wed, 10 Aug 2022 20:56:24 +0200 (CEST)
Received: from localhost ([::1]:33024 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oLqsR-0004yd-Hg
	for lists+qemu-devel@lfdr.de; Wed, 10 Aug 2022 14:56:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42398)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1oLqfE-00027c-SS
 for qemu-devel@nongnu.org; Wed, 10 Aug 2022 14:42:47 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:47571)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1oLqfB-0006h5-6Q
 for qemu-devel@nongnu.org; Wed, 10 Aug 2022 14:42:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1660156954;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=u8z3qhSzG4xe38qyIY4qics2r2QDCs0AchsGOJ8UEk8=;
 b=gJ7Jh5x+CxlwhH44fGwIhhkTpMwhqBS8v/0FXpEu26DO25ZIBpcRai5O7ELPbqHk+tTmnD
 Ee26DTzVPJ0Xw97bcAgxKXLD/xTDcjfl5EXLf/2Oiu2k1Qowd90ysZ+jk2HcbyaSuDEI8V
 dLZCNOhFmR5h3y5d8oUgVs4Zs3QO3B0=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-256-3kDloFI2NymFQY74KhmyfQ-1; Wed, 10 Aug 2022 14:42:29 -0400
X-MC-Unique: 3kDloFI2NymFQY74KhmyfQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 5E1193C10237;
 Wed, 10 Aug 2022 18:42:28 +0000 (UTC)
Received: from eperezma.remote.csb (unknown [10.39.193.156])
 by smtp.corp.redhat.com (Postfix) with ESMTP id CA831C15BA3;
 Wed, 10 Aug 2022 18:42:25 +0000 (UTC)
From: =?UTF-8?q?Eugenio=20P=C3=A9rez?= <eperezma@redhat.com>
To: qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 "Gonglei (Arei)" <arei.gonglei@huawei.com>, Cindy Lu <lulu@redhat.com>,
 Laurent Vivier <lvivier@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Parav Pandit <parav@mellanox.com>, Zhu Lingshan <lingshan.zhu@intel.com>,
 Gautam Dawar <gdawar@xilinx.com>, Liuxiangdong <liuxiangdong5@huawei.com>,
 Jason Wang <jasowang@redhat.com>, Cornelia Huck <cohuck@redhat.com>,
 Eli Cohen <eli@mellanox.com>, Stefano Garzarella <sgarzare@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Harpreet Singh Anand <hanand@xilinx.com>
Subject: [RFC 1/8] [NOTMERGE] Update linux headers
Date: Wed, 10 Aug 2022 20:42:13 +0200
Message-Id: <20220810184220.2362292-2-eperezma@redhat.com>
In-Reply-To: <20220810184220.2362292-1-eperezma@redhat.com>
References: <20220810184220.2362292-1-eperezma@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.8
Received-SPF: pass client-ip=170.10.133.124; envelope-from=eperezma@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Add _F_SUSPEND and suspend ioctl.

TODO: This is still not merged in Linux upstream, so it may change.
---
 include/standard-headers/linux/vhost_types.h | 3 +++
 linux-headers/linux/vhost.h                  | 3 +++
 2 files changed, 6 insertions(+)

diff --git a/include/standard-headers/linux/vhost_types.h b/include/standard-headers/linux/vhost_types.h
index ce78551b0f..c93ed1b920 100644
--- a/include/standard-headers/linux/vhost_types.h
+++ b/include/standard-headers/linux/vhost_types.h
@@ -161,5 +161,8 @@ struct vhost_vdpa_iova_range {
  * message
  */
 #define VHOST_BACKEND_F_IOTLB_ASID  0x3
+/* Stop device from processing virtqueue buffers */
+#define VHOST_BACKEND_F_SUSPEND  0x4
+
 
 #endif
diff --git a/linux-headers/linux/vhost.h b/linux-headers/linux/vhost.h
index cab645d4a6..f3f5bea3cb 100644
--- a/linux-headers/linux/vhost.h
+++ b/linux-headers/linux/vhost.h
@@ -171,4 +171,7 @@
 #define VHOST_VDPA_SET_GROUP_ASID	_IOW(VHOST_VIRTIO, 0x7C, \
 					     struct vhost_vring_state)
 
+/* Stop or resume a device so it does not process virtqueue requests anymore */
+#define VHOST_VDPA_SUSPEND              _IO(VHOST_VIRTIO, 0x7D)
+
 #endif
-- 
2.31.1


