Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EE664C567C
	for <lists+qemu-devel@lfdr.de>; Sat, 26 Feb 2022 15:43:14 +0100 (CET)
Received: from localhost ([::1]:59546 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nNyHw-0005ZJ-Q2
	for lists+qemu-devel@lfdr.de; Sat, 26 Feb 2022 09:43:12 -0500
Received: from eggs.gnu.org ([209.51.188.92]:35560)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <liuxiangdong5@huawei.com>)
 id 1nNt7f-0002zQ-Rl
 for qemu-devel@nongnu.org; Sat, 26 Feb 2022 04:12:18 -0500
Received: from szxga01-in.huawei.com ([45.249.212.187]:4466)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <liuxiangdong5@huawei.com>)
 id 1nNt7c-0005as-Od
 for qemu-devel@nongnu.org; Sat, 26 Feb 2022 04:12:15 -0500
Received: from dggpeml500025.china.huawei.com (unknown [172.30.72.55])
 by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4K5LPh3w3WzbbkK;
 Sat, 26 Feb 2022 17:07:20 +0800 (CST)
Received: from dggpeml500013.china.huawei.com (7.185.36.41) by
 dggpeml500025.china.huawei.com (7.185.36.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.21; Sat, 26 Feb 2022 17:11:55 +0800
Received: from [10.174.187.161] (10.174.187.161) by
 dggpeml500013.china.huawei.com (7.185.36.41) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id
 15.1.2308.21; Sat, 26 Feb 2022 17:11:54 +0800
To: <eperezma@redhat.com>
References: <20220121202733.404989-12-eperezma@redhat.com>
Subject: Re: [PATCH 11/31] vhost: Add vhost_svq_valid_device_features to
 shadow vq
CC: <armbru@redhat.com>, <eblake@redhat.com>, <ehabkost@redhat.com>,
 <eli@mellanox.com>, <gdawar@xilinx.com>, <hanand@xilinx.com>,
 <jasowang@redhat.com>, <lingshan.zhu@intel.com>, <lulu@redhat.com>,
 <lvivier@redhat.com>, <mst@redhat.com>, <parav@mellanox.com>,
 <pbonzini@redhat.com>, <peterx@redhat.com>, <qemu-devel@nongnu.org>,
 <quintela@redhat.com>, <richard.henderson@linaro.org>, <sgarzare@redhat.com>, 
 <stefanha@redhat.com>, <virtualization@lists.linux-foundation.org>,
 <xiao.w.wang@intel.com>, "Fangyi (Eric)" <eric.fangyi@huawei.com>,
 <yebiaoxiang@huawei.com>
Message-ID: <6219EEBD.1050209@huawei.com>
Date: Sat, 26 Feb 2022 17:11:25 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:38.0) Gecko/20100101
 Thunderbird/38.1.0
MIME-Version: 1.0
In-Reply-To: <20220121202733.404989-12-eperezma@redhat.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.174.187.161]
X-ClientProxiedBy: dggeme704-chm.china.huawei.com (10.1.199.100) To
 dggpeml500013.china.huawei.com (7.185.36.41)
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.187;
 envelope-from=liuxiangdong5@huawei.com; helo=szxga01-in.huawei.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_MED=-2.3, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Sat, 26 Feb 2022 09:41:20 -0500
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
Reply-to:  Liuxiangdong <liuxiangdong5@huawei.com>
From:  Liuxiangdong via <qemu-devel@nongnu.org>

Hi, Eugenio.

diff --git a/hw/virtio/vhost-shadow-virtqueue.c 
b/hw/virtio/vhost-shadow-virtqueue.c
index 9619c8082c..51442b3dbf 100644
--- a/hw/virtio/vhost-shadow-virtqueue.c
+++ b/hw/virtio/vhost-shadow-virtqueue.c
@@ -45,6 +45,50 @@ const EventNotifier *vhost_svq_get_dev_kick_notifier(
      return &svq->hdev_kick;
  }

+/**
+ * Validate the transport device features that SVQ can use with the device
+ *
+ * @dev_features  The device features. If success, the acknowledged 
features.
+ *
+ * Returns true if SVQ can go with a subset of these, false otherwise.
+ */
+bool vhost_svq_valid_device_features(uint64_t *dev_features)
+{
+    bool r = true;
+
+    for (uint64_t b = VIRTIO_TRANSPORT_F_START; b <= 
VIRTIO_TRANSPORT_F_END;
+         ++b) {
+        switch (b) {
+        case VIRTIO_F_NOTIFY_ON_EMPTY:
+        case VIRTIO_F_ANY_LAYOUT:
+            continue;



#define VIRTIO_TRANSPORT_F_START    28
#define VIRTIO_TRANSPORT_F_END        38

#define VIRTIO_F_NOTIFY_ON_EMPTY    24

This case (VIRTIO_F_NOTIFY_ON_EMPTY) may be useless.


Thanks.
Xiangdong Liu

