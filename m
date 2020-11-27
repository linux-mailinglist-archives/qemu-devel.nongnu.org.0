Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 13D512C6BCF
	for <lists+qemu-devel@lfdr.de>; Fri, 27 Nov 2020 20:08:58 +0100 (CET)
Received: from localhost ([::1]:36392 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kij73-0000yr-1r
	for lists+qemu-devel@lfdr.de; Fri, 27 Nov 2020 14:08:57 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43686)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <info@metux.net>) id 1kiiUo-0007Lt-Lf
 for qemu-devel@nongnu.org; Fri, 27 Nov 2020 13:29:26 -0500
Received: from mout.kundenserver.de ([212.227.17.13]:56909)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <info@metux.net>) id 1kiiUm-00073k-4E
 for qemu-devel@nongnu.org; Fri, 27 Nov 2020 13:29:26 -0500
Received: from orion.localdomain ([95.114.158.11]) by mrelayeu.kundenserver.de
 (mreue106 [212.227.15.183]) with ESMTPSA (Nemesis) id
 1MCJvA-1ks6Pd030M-009Sc9; Fri, 27 Nov 2020 19:29:19 +0100
From: "Enrico Weigelt, metux IT consult" <info@metux.net>
To: mst@redhat.com, ehabkost@redhat.com, crosa@redhat.com,
 qemu-devel@nongnu.org
Subject: [PATCH 4/5] standard-headers: virtio-gpio protocol headers
Date: Fri, 27 Nov 2020 19:29:16 +0100
Message-Id: <20201127182917.2387-4-info@metux.net>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20201127182917.2387-1-info@metux.net>
References: <20201127182917.2387-1-info@metux.net>
X-Provags-ID: V03:K1:vHz07pv+Uh+Gimj7PM+ycUO4NFOapbDFnrlbSvbR4di0v0erYTj
 qMtJssvvNaHqDk1B5rC2KtcffNmb++ZG0gUN4t3lPQNK61ck9HmZFL+k8rUJZUt3MSPHQsf
 67RzgGd6lrElmBu7sXLkM6jrM6qeYF+KULYMJP+y+0WTvoPoDHkCNSIvGWuPY6q+28X/HMu
 E+2DyJsqo9kkQ/TB5yfGg==
X-UI-Out-Filterresults: notjunk:1;V03:K0:nyu3MaZgHN0=:3OX9tsvDglg/Wflk4h4akp
 uu6rDNhcqfqleHaxoLW2LRkab4mnMht8rfRfkus0sNRKbIe0yLPGfCFimqU3KEWbe0Enbyzae
 4Ud3paTozO+hdz1HbHTUo1XeyiqwBYZAHMxOEOfL9MDS/PkRHv7Sx17Y+EGr5OvTvWPYFyXBi
 ELGYihWDbG8fgvR1JFz6pXaB2y6GN7vi0rZ517elyhZze7tEf8u5vbcTFt2KEyiVnl31qszO1
 tPRr7WCfdBpE5tYVabnNpSeLifkjvrNHyFtBX9noCw+4UCvOFwWC/cr8X8yH9XYxG86SRP+5y
 B4NBMubAUozf0kaajZvyYKNirFGPzOiOBUTYtIZkVTjWjCnuLQX+HyPVPaX5+dcc6a0nINX1d
 cIwh1t4KdanhN4VLHVvLepdajNOs1L/aX3Cq5Wd4u+ZFjnV+5zkx1u45RPZI5
Received-SPF: none client-ip=212.227.17.13; envelope-from=info@metux.net;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Fri, 27 Nov 2020 14:04:07 -0500
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Introduce virtio-gpio protocol headers from Linux kernel.
(work in progress, not mainlined yet)

Signed-off-by: Enrico Weigelt, metux IT consult <info@metux.net>
---
 include/standard-headers/linux/virtio_gpio.h | 39 ++++++++++++++++++++++++++++
 include/standard-headers/linux/virtio_ids.h  |  1 +
 2 files changed, 40 insertions(+)
 create mode 100644 include/standard-headers/linux/virtio_gpio.h

diff --git a/include/standard-headers/linux/virtio_gpio.h b/include/standard-headers/linux/virtio_gpio.h
new file mode 100644
index 0000000000..d1db0ef1fe
--- /dev/null
+++ b/include/standard-headers/linux/virtio_gpio.h
@@ -0,0 +1,39 @@
+// SPDX-License-Identifier: GPL-2.0+
+
+#ifndef _LINUX_VIRTIO_GPIO_H
+#define _LINUX_VIRTIO_GPIO_H
+
+#include <linux/types.h>
+
+enum virtio_gpio_event_type {
+	// requests from quest to host
+	VIRTIO_GPIO_EV_GUEST_REQUEST		= 0x01,	// ->request()
+	VIRTIO_GPIO_EV_GUEST_DIRECTION_INPUT	= 0x02,	// ->direction_input()
+	VIRTIO_GPIO_EV_GUEST_DIRECTION_OUTPUT	= 0x03,	// ->direction_output()
+	VIRTIO_GPIO_EV_GUEST_GET_DIRECTION	= 0x04,	// ->get_direction()
+	VIRTIO_GPIO_EV_GUEST_GET_VALUE		= 0x05,	// ->get_value()
+	VIRTIO_GPIO_EV_GUEST_SET_VALUE		= 0x06,	// ->set_value()
+
+	// messages from host to guest
+	VIRTIO_GPIO_EV_HOST_LEVEL		= 0x11,	// gpio state changed
+
+	/* mask bit set on host->guest reply */
+	VIRTIO_GPIO_EV_REPLY			= 0xF000,
+};
+
+struct virtio_gpio_config {
+	__u8    version;
+	__u8    reserved0;
+	__u16   num_gpios;
+	__u32   names_size;
+	__u8    reserved1[24];
+	__u8    name[32];
+};
+
+struct virtio_gpio_event {
+	__le16 type;
+	__le16 pin;
+	__le32 value;
+};
+
+#endif /* _LINUX_VIRTIO_GPIO_H */
diff --git a/include/standard-headers/linux/virtio_ids.h b/include/standard-headers/linux/virtio_ids.h
index b052355ac7..053fe59c73 100644
--- a/include/standard-headers/linux/virtio_ids.h
+++ b/include/standard-headers/linux/virtio_ids.h
@@ -48,5 +48,6 @@
 #define VIRTIO_ID_FS           26 /* virtio filesystem */
 #define VIRTIO_ID_PMEM         27 /* virtio pmem */
 #define VIRTIO_ID_MAC80211_HWSIM 29 /* virtio mac80211-hwsim */
+#define VIRTIO_ID_GPIO		 30 /* virtio GPIO */
 
 #endif /* _LINUX_VIRTIO_IDS_H */
-- 
2.11.0


