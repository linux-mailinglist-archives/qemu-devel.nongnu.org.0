Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E9B543B315
	for <lists+qemu-devel@lfdr.de>; Tue, 26 Oct 2021 15:19:45 +0200 (CEST)
Received: from localhost ([::1]:59604 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mfMMh-0001Mp-NQ
	for lists+qemu-devel@lfdr.de; Tue, 26 Oct 2021 09:19:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33574)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <p.kalghatgi@samsung.com>)
 id 1mfMLG-0000GJ-KZ
 for qemu-devel@nongnu.org; Tue, 26 Oct 2021 09:18:14 -0400
Received: from mailout2.samsung.com ([203.254.224.25]:18877)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <p.kalghatgi@samsung.com>)
 id 1mfML3-00041R-HW
 for qemu-devel@nongnu.org; Tue, 26 Oct 2021 09:18:13 -0400
Received: from epcas5p2.samsung.com (unknown [182.195.41.40])
 by mailout2.samsung.com (KnoxPortal) with ESMTP id
 20211026131751epoutp0299d8f1f340fb1abcff691ae3f31abf20~xlxiPKk3s1350813508epoutp02b
 for <qemu-devel@nongnu.org>; Tue, 26 Oct 2021 13:17:51 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.samsung.com
 20211026131751epoutp0299d8f1f340fb1abcff691ae3f31abf20~xlxiPKk3s1350813508epoutp02b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1635254271;
 bh=JBVByvUXfMFUKdQI0iJryebH+AEsMyTw3+jHIR6iKRM=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=fjypPcP/k8RAxZLrobhOPVjoappABYr0tOaBzXkgVy7+ZNk8NsVAb/Hu57sk0Q2l6
 jm0HYdceUono/RYHo5+ypUFJ/QyFZ6N5bwhOwYph4nf2LYE2TsNhzLv7EzgZZ2XHTh
 4UOC8PMOdMVECYOC3lBQg5gIJzxVqkp/8yhrYQsM=
Received: from epsnrtp4.localdomain (unknown [182.195.42.165]) by
 epcas5p4.samsung.com (KnoxPortal) with ESMTP id
 20211026131750epcas5p452b98803bf500ca065a065a520976465~xlxhrStN52336223362epcas5p4_;
 Tue, 26 Oct 2021 13:17:50 +0000 (GMT)
Received: from epsmges5p2new.samsung.com (unknown [182.195.38.179]) by
 epsnrtp4.localdomain (Postfix) with ESMTP id 4HdsnN3c7Yz4x9Pw; Tue, 26 Oct
 2021 13:17:44 +0000 (GMT)
Received: from epcas5p4.samsung.com ( [182.195.41.42]) by
 epsmges5p2new.samsung.com (Symantec Messaging Gateway) with SMTP id
 E5.AF.09607.8FFF7716; Tue, 26 Oct 2021 22:17:44 +0900 (KST)
Received: from epsmtrp2.samsung.com (unknown [182.195.40.14]) by
 epcas5p1.samsung.com (KnoxPortal) with ESMTPA id
 20211026131417epcas5p152d15efe40dd729b0cde0e84ebfb4518~xluapBem20335803358epcas5p1P;
 Tue, 26 Oct 2021 13:14:17 +0000 (GMT)
Received: from epsmgms1p1new.samsung.com (unknown [182.195.42.41]) by
 epsmtrp2.samsung.com (KnoxPortal) with ESMTP id
 20211026131417epsmtrp2249d12415f74bf704deb923e40ef9fb4~xluan_Zu22351623516epsmtrp2Q;
 Tue, 26 Oct 2021 13:14:17 +0000 (GMT)
X-AuditID: b6c32a4a-c7fff70000002587-b8-6177fff81353
Received: from epsmtip2.samsung.com ( [182.195.34.31]) by
 epsmgms1p1new.samsung.com (Symantec Messaging Gateway) with SMTP id
 3E.A5.29871.82FF7716; Tue, 26 Oct 2021 22:14:16 +0900 (KST)
Received: from test.sa.corp.samsungelectronics.net (unknown [107.108.56.58])
 by epsmtip2.samsung.com (KnoxPortal) with ESMTPA id
 20211026131414epsmtip230808c97808b712aa10a2331d5ce9b5d~xluYUev2g2666326663epsmtip2Z;
 Tue, 26 Oct 2021 13:14:14 +0000 (GMT)
Date: Tue, 26 Oct 2021 18:43:58 +0530
From: Padmakar Kalghatgi <p.kalghatgi@samsung.com>
To: Klaus Jensen <its@irrelevant.dk>
Subject: Re: [RFC PATCH: v4 1/2] add mi device in qemu
Message-ID: <20211026131358.GA23684@test.sa.corp.samsungelectronics.net>
MIME-Version: 1.0
In-Reply-To: <YVPtogzu2OSh/1yK@apples.localdomain>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrNJsWRmVeSWpSXmKPExsWy7bCmlu6P/+WJBp0LRCzm3LewePv1AZvF
 lf3nGS32H/zGavH4zmd2i6Xz9S1ONu5htZh06BqjxZKLqRZrXihbzLulbHFlyiJmi1nv2tks
 jvfuYLF4Pek/q8XN5qdsDgIeP861s3mc23Ge3WPTqk42jyfXNjN5vN93lc2jb8sqxgC2qGyb
 jNTElNQihdS85PyUzLx0WyXv4HjneFMzA0NdQ0sLcyWFvMTcVFslF58AXbfMHKCjlRTKEnNK
 gUIBicXFSvp2NkX5pSWpChn5xSW2SqkFKTkFJgV6xYm5xaV56Xp5qSVWhgYGRqZAhQnZGbvv
 fWcu2LqQqeLxf9MGxs5LjF2MnBwSAiYSc3pnsnQxcnEICexmlJjWNZ0RwvnEKPFl9nxWkCoh
 gW+MEr/ni8N0nNj0iRmiaC+jxMKmrWwQTiOTxMNtl9lBqlgEVCWuTnwEZHNwsAkYSXxvtQUJ
 iwioSDz9txdsHbPAWSaJSY9vsYEkhAXMJE49PAh2E6+Ah0TvtffMELagxMmZT1hAbE6gOReW
 PQezRYEGTTm5jQ3iogMcEhenpUDYLhJLtz9jgbCFJV4d38IOYUtJfH63F+xQCYFmRol9X66w
 QDgTGCWmzH/HBFFlL3Fxz18wm1kgQ+Jl9wVWiLisxNRT66DifBK9v59A1fNK7JgHY6tKPL5w
 EOoiaYnZKz8xgXwvAfTNrTuakBA6xChxct8N1gmM8rOQPDcLyToI20qi80MTkM0BZEtLLP/H
 AWFqSqzfpb+AkXUVo2RqQXFuemqxaYFRXmo5PMqT83M3MYJTtZbXDsaHDz7oHWJk4mAEWsvB
 rCTCe3leeaIQb0piZVVqUX58UWlOavEhRlNgZE1klhJNzgdmi7ySeEMTSwMTMzMzE0tjM0Ml
 cd7TotmJQgLpiSWp2ampBalFMH1MHJxSDUzGlnLJW37U7U5U285bZyzv/qChcWbYIwWtlMv2
 FtkrF6t+yTi/SCGK+38aQ77+W/P0Y6/j+Q4kOPSz3lxwePmydVoSzFvV/3p89nG0mR3gen6n
 8OOXCfP5I96UZa9MDt+Weyb4ygkzzQtXb+kJhPw9lswmt37C2a1bj64OFmmurwhivtHLdMjz
 QsBUdm75xMTeh3+qjuxaZaigWPKvpZ/1/owJXnyqR6rsBNic5TJcTzw5ECsj9/ltHbOLp2RY
 mcD1s3sTji77/3LbvNKH5W8k1m+auSHXcFstY+WSj8WbGLeeD3AquCpyKrQiR6HkkA6D6qcN
 s6fpWEcznlc+o3NNKD7+Rq4jw3crXrMvVUosxRmJhlrMRcWJAP6IwUdeBAAA
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFupjkeLIzCtJLcpLzFFi42LZdlhJXlfjf3miwccF5hZz7ltYvP36gM3i
 yv7zjBb7D35jtXh85zO7xdL5+hYnG/ewWkw6dI3RYsnFVIs1L5Qt5t1StrgyZRGzxax37WwW
 x3t3sFi8nvSf1eJm81M2BwGPH+fa2TzO7TjP7rFpVSebx5Nrm5k83u+7yubRt2UVYwBbFJdN
 SmpOZllqkb5dAlfGigW3WAuez2OqOD6rl6mB8ep5xi5GTg4JAROJE5s+MXcxcnEICexmlNjw
 9gMTREJaYt/D6ywQtrDEyn/P2SGK/jNK/Di0ig0kwSKgKnF14iOgBAcHm4CRxPdWW5CwiICK
 xNN/e1lA6pkFzjNJTFv3ixUkISxgJnHq4UGwzbwCHhK9195DbT7EKHHvZRsTREJQ4uTMJ2Cb
 mYEa5m1+yAyygBnoouX/OEDCnEC7Lix7DlYiCrRsysltbBMYBWch6Z6FpHsWQvcCRuZVjJKp
 BcW56bnFhgWGeanlesWJucWleel6yfm5mxjBUaaluYNx+6oPeocYmTgYgU7jYFYS4b08rzxR
 iDclsbIqtSg/vqg0J7X4EKM0B4uSOO+FrpPxQgLpiSWp2ampBalFMFkmDk6pBqYyn7eztV/O
 XHUr75rpe6fyKeJbuZ9pbu3onf8kt+dQ6t275UrSthfZVyQGPnk4d+vc0O/ZzJ3sKSUCOXrp
 a5k2R/74fyg49Xv9yhW6oYsVb8splCbPSO30O+Wy5qWrt7/JUi4WWasjSx893bnCf9NkWeX8
 FLeP799aSlw+MGsZ+7TQZdVPrJ+8OhRrpPvnSzZ7WWvhQZnYtOj1tTHbk3kMQzexHt7fLGzZ
 wLvLPUKw9vreg0b/JRtNUjykNaOesZ2c0mhT2/35VsT7+2Fl4bIi3Ilsf3UXbjS+3lPQNbMq
 ZY3D1b0VVueWix2YYvawdfexL7sMr5/SepDp+dldx1F0Sr/6GY4KoT7lbYJzo5VYijMSDbWY
 i4oTAYafBBchAwAA
X-CMS-MailID: 20211026131417epcas5p152d15efe40dd729b0cde0e84ebfb4518
X-Msg-Generator: CA
Content-Type: multipart/mixed;
 boundary="----TI73IYgzdP03rYJ9SiN0qM3o3mlayfAqXHuFFMbUzbY.6Ea-=_5621f_"
X-Sendblock-Type: REQ_APPROVE
CMS-TYPE: 105P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20210803080737epcas5p1c9bd6ecde8700d1194748533a3812db6
References: <CGME20210803080737epcas5p1c9bd6ecde8700d1194748533a3812db6@epcas5p1.samsung.com>
 <1627975487-1640-1-git-send-email-p.kalghatgi@samsung.com>
 <YVPtogzu2OSh/1yK@apples.localdomain>
Received-SPF: pass client-ip=203.254.224.25;
 envelope-from=p.kalghatgi@samsung.com; helo=mailout2.samsung.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001,
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
Cc: fam@euphon.net, kwolf@redhat.com, arun.kka@samsung.com,
 jg123.choi@samsung.com, qemu-block@nongnu.org, k.jensen@samsung.com,
 d.palani@samsung.com, qemu-devel@nongnu.org, mreitz@redhat.com,
 u.kishore@samsung.com, stefanha@redhat.com, kbusch@kernel.org,
 javier.gonz@samsung.com, prakash.v@samsung.com, mohit.kap@samsung.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

------TI73IYgzdP03rYJ9SiN0qM3o3mlayfAqXHuFFMbUzbY.6Ea-=_5621f_
Content-Type: text/plain; charset="utf-8"; format="flowed"
Content-Disposition: inline

This patch addresses most of the review comments raised by Klaus.
Mainly, I have ensured that the emulated mi device in qemu posts
the response rather than waiting for the guest-os(mi utility) to ask 
for the response. For the same purpose, I have added a new device called
nvme-mi-slave which acts as an i2c slave and to which the emulated
mi device posts the response. The guest-os(mi utility) reads response 
from this slave. The nvme-mi-slave has to be used in tandem with nvme-mi device.


In addition to the above change, we will be providing the mi utility 
on the guest as a standalone rather than as a plugin to the 
nvme-cli application.

We will be glad to hear any suggestions, corrections in the approach 
we have used. 

Please find the patch below:

========================================================================
diff --git a/hw/nvme/meson.build b/hw/nvme/meson.build
index 3cf4004..8768ca1 100644
--- a/hw/nvme/meson.build
+++ b/hw/nvme/meson.build
@@ -1 +1 @@
-softmmu_ss.add(when: 'CONFIG_NVME_PCI', if_true: files('ctrl.c',
'dif.c', 'ns.c', 'subsys.c'))
+softmmu_ss.add(when: 'CONFIG_NVME_PCI', if_true: files('ctrl.c',
'dif.c', 'ns.c', 'subsys.c', 'nvme-mi.c', 'nvme-mi-slave.c'))
diff --git a/hw/nvme/nvme-mi-slave.c b/hw/nvme/nvme-mi-slave.c
new file mode 100644
index 0000000..e6ada07
--- /dev/null
+++ b/hw/nvme/nvme-mi-slave.c
@@ -0,0 +1,93 @@
+/*
+ * QEMU NVMe-MI Controller
+ *
+ * Copyright (c) 2021, Samsung Electronics co Ltd.
+ *
+ * Written by Padmakar Kalghatgi <p.kalghatgi@samsung.com>
+ *
+ * This code is licensed under the GNU GPL v2 or later.
+ * 
+ * This module acts as a host slave, to which the QEMU-MI module
+ * will post the response to.
+ * 
+ * Need to use as following to enable this device
+ * -device nvme-mi-i2c-slave, addr=<slaveaddr>
+ */
+
+#include "qemu/osdep.h"
+#include "hw/qdev-properties.h"
+#include "hw/qdev-core.h"
+#include "hw/block/block.h"
+#include "nvme-mi-slave.h"
+
+static uint8_t nvme_mi_slave_i2c_recv(I2CSlave *s)
+{
+    Nvmemislave *mislave = (Nvmemislave *)s;
+	
+    if (mislave->syncflag == true) {
+        return -1;
+    }
+    return mislave->recvbuffer[mislave->recvlen++];
+}
+
+static int nvme_mi_slave_i2c_send(I2CSlave *s, uint8_t data)
+{    
+    Nvmemislave *mislave = (Nvmemislave *)s;
+    mislave->syncflag = true;
+
+    switch (mislave->pktpos) {
+    case NVME_MI_BYTE_LENGTH_POS:
+        mislave->pktlen = data;
+        break;
+    case NVME_MI_EOM_POS:
+        mislave->eom = (data >> 6) & 1;
+        break;
+    }
+    mislave->recvbuffer[mislave->sendlen++] = data;
+    mislave->pktpos++;
+    if (mislave->pktpos == mislave->pktlen + 3) {
+        mislave->pktlen = 0;
+        mislave->pktpos = 0;
+
+        if (mislave->eom == 1) {
+            mislave->sendlen = 0;
+            mislave->recvlen = 0;
+            mislave->eom = 0;
+            mislave->syncflag = false;          
+        }
+    }
+    return 0;
+}
+
+static void nvme_mi_slave_realize(DeviceState *dev, Error **errp)
+{
+    Nvmemislave *mislave = (Nvmemislave *)dev;
+    mislave->sendlen = 0;
+    mislave->recvlen = 0;
+    mislave->eom = 0;
+    mislave->syncflag = false;
+}
+
+static void nvme_mi_slave_class_init(ObjectClass *oc, void *data)
+{
+    I2CSlaveClass *k = I2C_SLAVE_CLASS(oc);
+    DeviceClass *dc = DEVICE_CLASS(oc);
+    
+    dc->realize = nvme_mi_slave_realize;
+    k->recv = nvme_mi_slave_i2c_recv;
+    k->send = nvme_mi_slave_i2c_send;
+}
+
+static const TypeInfo nvme_mi_slave = {
+    .name = TYPE_NVME_MI_SLAVE,
+    .parent = TYPE_I2C_SLAVE,
+    .instance_size = sizeof(Nvmemislave),
+    .class_init = nvme_mi_slave_class_init,
+};
+
+static void register_types(void)
+{
+    type_register_static(&nvme_mi_slave);
+}
+
+type_init(register_types);
diff --git a/hw/nvme/nvme-mi-slave.h b/hw/nvme/nvme-mi-slave.h
new file mode 100644
index 0000000..971411a
--- /dev/null
+++ b/hw/nvme/nvme-mi-slave.h
@@ -0,0 +1,28 @@
+#ifndef NVMEMISLAVEH
+#define NVMEMISLAVEH
+
+#include "hw/i2c/i2c.h"
+#define TYPE_NVME_MI_SLAVE "nvme-mi-i2c-slave"
+
+#define MAX_NVME_MI_BUF_SIZE 5000
+
+enum Nvmemislavepktpos
+{
+   NVME_MI_ADDR_POS = 0,
+   NVME_MI_BYTE_LENGTH_POS = 2,
+   NVME_MI_EOM_POS = 7
+};
+
+typedef struct Nvmemislave
+{
+    I2CSlave parent_obj;
+    uint32_t sendlen;
+    uint32_t recvlen;
+    uint32_t pktpos;
+    uint32_t pktlen;
+    uint8_t eom;
+    bool syncflag;
+    u_char recvbuffer[MAX_NVME_MI_BUF_SIZE];
+} Nvmemislave;
+
+#endif
\ No newline at end of file
diff --git a/hw/nvme/nvme-mi.c b/hw/nvme/nvme-mi.c
new file mode 100644
index 0000000..ad98bd8
--- /dev/null
+++ b/hw/nvme/nvme-mi.c
@@ -0,0 +1,684 @@
+    /*
+ * QEMU NVMe-MI Controller
+ *
+ * Copyright (c) 2021, Samsung Electronics co Ltd.
+ *
+ * Written by Padmakar Kalghatgi <p.kalghatgi@samsung.com>
+ *            Arun Kumar Agasar <arun.kka@samsung.com>
+ *            Saurav Kumar <saurav.29@partner.samsung.com>
+ *
+ * This code is licensed under the GNU GPL v2 or later.
+ */
+
+/**
+ * Reference Specs: http://www.nvmexpress.org,
+ *
+ *
+ * Usage
+ * -----
+ * The nvme-mi device has to be used along with nvme device only
+ *
+ * Add options:
+ *    -device  nvme-mi,nvme=<nvme id>,address=0x15",
+ *
+ */
+
+#include "qemu/osdep.h"
+#include "hw/qdev-properties.h"
+#include "hw/qdev-core.h"
+#include "hw/block/block.h"
+#include "hw/pci/msix.h"
+#include "include/block/nvme.h"
+#include "nvme.h"
+#include "nvme-mi.h"
+#include "qemu/crc32c.h"
+#include "hw/i2c/smbus_master.h"
+
+#define NVME_TEMPERATURE 0x143
+#define NVME_TEMPERATURE_WARNING 0x157
+#define NVME_TEMPERATURE_CRITICAL 0x175
+
+static uint8_t nvme_mi_gen_pec(uint8_t *data, size_t len)
+{
+    uint8_t pec = 0xff;
+    size_t i, j;
+    for (i = 0; i < len; i++) {
+        pec ^= data[i];
+        for (j = 0; j < 8; j++) {
+            if ((pec & 0x80) != 0) {
+                pec = (uint8_t)((pec << 1) ^ 0x31);
+            } else {
+                pec <<= 1;
+            }
+        }
+    }
+    return pec;
+}
+static void nvme_mi_send_resp(NvmeMiCtrl *ctrl_mi, uint8_t *resp,
uint32_t size)
+{
+    uint32_t crc_value = crc32c(0xFFFFFFFF, resp, size);
+    uint32_t offset = 0;
+    uint32_t som = 1;
+    uint32_t eom = 0;
+    uint32_t pktseq = 0;
+    uint32_t mtus = ctrl_mi->mctp_unit_size;
+    size += sizeof(crc_value);
+    while (size > 0) {
+        size_t sizesent = MIN(size, mtus);
+        size -= sizesent;
+        eom = size > 0 ? 0 : 1;
+        g_autofree uint8_t *buf = (uint8_t *)g_malloc0(sizesent + 8 +
1);
+        buf[2] = sizesent + 6;
+        buf[7] = (som << 7) | (eom << 6) | (pktseq << 5);
+        som = 0;
+        memcpy(buf + 8, resp + offset, sizesent);
+        uint8_t pec = nvme_mi_gen_pec(resp + offset, sizesent);
+        buf[9] = pec;
+        offset += sizesent;
+        if (size <= 0) {
+            memcpy(buf + sizesent + NVME_MI_SMBUS_HEADER_AND_PEC -
sizeof(crc_value),
+                   &crc_value, sizeof(crc_value));
+        }
+        memcpy(ctrl_mi->misendrecv.state.sendrecvbuf +
ctrl_mi->misendrecv.total_len,
+               buf, sizesent + NVME_MI_SMBUS_HEADER_AND_PEC);
+        ctrl_mi->misendrecv.total_len += sizesent +
NVME_MI_SMBUS_HEADER_AND_PEC;
+
+    }
+
+
+}
+
+static void nvme_mi_resp_hdr_init(NvmeMiResponse *resp, int NvmeMiType)
+{
+    resp->msg_header.msgtype = 4;
+    resp->msg_header.ic = 1;
+    resp->msg_header.csi = 0;
+    resp->msg_header.reserved = 0;
+    resp->msg_header.nmimt = NvmeMiType;
+    resp->msg_header.ror = 1;
+    resp->msg_header.reserved1 = 0;
+}
+static void nvme_mi_nvm_subsys_ds(NvmeMiCtrl *ctrl_mi, NvmeMiRequest
*req)
+{
+    NvmeMiResponse resp;
+    NvmMiSubsysInfoDs ds;
+    uint32_t total_size = sizeof(resp) + sizeof(ds);
+    uint8_t resp_message[total_size];
+    ds.nump = 1;
+    ds.mjr = (ctrl_mi->n->bar.vs & 0xFF0000) >> 16;
+    ds.mnr = (ctrl_mi->n->bar.vs & 0xFF00) >> 8;
+
+    nvme_mi_resp_hdr_init(&resp , NVME_MI_CMD);
+    resp.status = SUCCESS;
+    resp.mgmt_resp = sizeof(ds);
+    memcpy(resp_message, &resp, sizeof(resp));
+    memcpy(resp_message + sizeof(resp), &ds, sizeof(ds));
+
+    nvme_mi_send_resp(ctrl_mi, resp_message, total_size);
+}
+
+static void nvme_mi_opt_supp_cmd_list(NvmeMiCtrl *ctrl_mi,
NvmeMiRequest *req)
+{
+    NvmeMiResponse resp;
+    uint32_t offset = 0, size = 0, total_size = 0;
+    uint16_t mi_opt_cmd_cnt, admin_mi_opt_cmd_cnt, total_commands;
+    g_autofree uint8_t *resp_message = NULL;
+    g_autofree uint8_t *cmd_supp_list = NULL;
+    nvme_mi_resp_hdr_init(&resp , NVME_MI_CMD);
+    resp.status = SUCCESS;
+
+    mi_opt_cmd_cnt = sizeof(NvmeMiCmdOptSupList) /
+                              sizeof(uint32_t);
+    admin_mi_opt_cmd_cnt = sizeof(NvmeMiAdminCmdOptSupList) /
+                                    sizeof(uint32_t);
+
+    total_commands = mi_opt_cmd_cnt + admin_mi_opt_cmd_cnt;
+    size = 2 * (total_commands + 1);
+
+    cmd_supp_list = (uint8_t *)g_malloc0(size);
+
+    memcpy(cmd_supp_list, &total_commands, sizeof(uint16_t));
+    offset += sizeof(uint16_t);
+    for (uint32_t i = 0; i < mi_opt_cmd_cnt; i++) {
+        memcpy(cmd_supp_list + offset, &NvmeMiCmdOptSupList[i],
+               sizeof(uint8_t));
+        cmd_supp_list[offset + 1] = 1;
+        offset += 2;
+    }
+
+    for (uint32_t i = 0; i < admin_mi_opt_cmd_cnt; i++) {
+        memcpy(cmd_supp_list + offset, &NvmeMiAdminCmdOptSupList[i],
+               sizeof(uint8_t));
+        cmd_supp_list[offset + 1] = 1;
+        offset += 2;
+    }
+
+    resp.mgmt_resp = size;
+    total_size = sizeof(resp) + size;
+    resp_message = (uint8_t *) g_malloc(total_size);
+    memcpy(resp_message, &resp, sizeof(resp));
+    memcpy(resp_message + sizeof(resp), cmd_supp_list, size);
+
+    nvme_mi_send_resp(ctrl_mi, resp_message, total_size);
+}
+
+static void nvme_mi_controller_health_ds(NvmeMiCtrl *ctrl_mi,
+                                         NvmeMiRequest *req)
+{
+    uint32_t dword0 = req->dword0;
+    uint32_t dword1 = req->dword1;
+    uint32_t maxrent = (dword0 >> 16) & 0xFF;
+    uint32_t reportall = (dword0 >> 31) & 0x1;
+    uint32_t incvf = (dword0 >> 26) & 0x1;
+    uint32_t incpf = (dword0 >> 25) & 0x1;
+    uint32_t incf = (dword0 >> 24) & 0x1;
+    g_autofree uint8_t *resp_buf = NULL;
+
+    NvmeMiResponse resp;
+    nvme_mi_resp_hdr_init(&resp , NVME_MI_CMD);
+
+    if (maxrent > 255 || (reportall == 0) || incvf || incpf || (incf ==
0)) {
+        resp.status = INVALID_PARAMETER;
+        return nvme_mi_send_resp(ctrl_mi, (uint8_t *)&resp,
sizeof(resp));
+    }
+    NvmeMiCtrlHealthDs nvme_mi_chds;
+    if (dword1 & 0x1) {
+        nvme_mi_chds.csts.rdy = ctrl_mi->n->bar.csts & 0x1;
+        nvme_mi_chds.csts.cfs |= ctrl_mi->n->bar.csts & 0x2;
+        nvme_mi_chds.csts.shst |= ctrl_mi->n->bar.csts & 0xa;
+        nvme_mi_chds.csts.nssro |= ctrl_mi->n->bar.csts & 0x10;
+        nvme_mi_chds.csts.en |= ctrl_mi->n->bar.cc & 0x1 << 5;
+    }
+    if (dword1 & 0x2) {
+        nvme_mi_chds.ctemp = ctrl_mi->n->temperature;
+    }
+    if (((ctrl_mi->n->temperature >=
ctrl_mi->n->features.temp_thresh_hi) ||
+        (ctrl_mi->n->temperature <=
ctrl_mi->n->features.temp_thresh_low)) &&
+         (dword1 & 0x2)) {
+        nvme_mi_chds.cwarn.temp_above_or_under_thresh = 0x1;
+    }
+    resp_buf = (uint8_t *)g_malloc(sizeof(resp) +
+                                   sizeof(NvmeMiCtrlHealthDs));
+    resp.mgmt_resp = 1 << 0x10;
+    memcpy(resp_buf, &resp, sizeof(resp));
+    memcpy(resp_buf + sizeof(resp), &nvme_mi_chds,
sizeof(nvme_mi_chds));
+    nvme_mi_send_resp(ctrl_mi, resp_buf, sizeof(resp) +
sizeof(NvmeMiCtrlHealthDs));
+}
+
+static void nvme_mi_read_nvme_mi_ds(NvmeMiCtrl *ctrl_mi, NvmeMiRequest
*req)
+{
+    ReadNvmeMiDs ds;
+    int dtyp;
+    ds.cntrlid = req->dword0 & 0xFFFF;
+    ds.portlid = (req->dword0 & 0xFF0000) >> 16;
+    ds.dtyp = (req->dword0 & ~0xFF) >> 24;
+    dtyp = ds.dtyp;
+    switch (dtyp) {
+    case NVM_SUBSYSTEM_INFORMATION:
+        nvme_mi_nvm_subsys_ds(ctrl_mi, req);
+        break;
+    case OPT_SUPP_CMD_LIST:
+        nvme_mi_opt_supp_cmd_list(ctrl_mi, req);
+        break;
+    }
+}
+
+static void nvme_mi_configuration_get(NvmeMiCtrl *ctrl_mi,
NvmeMiRequest *req)
+{
+    uint8_t config_identifier = (req->dword0 & 0xFF);
+    NvmeMiResponse resp;
+    uint32_t total_size = sizeof(resp);
+    uint8_t resp_message[total_size];
+    switch (config_identifier) {
+    case SMBUS_I2C_FREQ: {
+       nvme_mi_resp_hdr_init(&resp, NVME_MI_CMD);
+       resp.status = SUCCESS;
+       resp.mgmt_resp = ctrl_mi->smbus_freq;
+       memcpy(resp_message, &resp, sizeof(resp));
+
+       nvme_mi_send_resp(ctrl_mi, resp_message, total_size);
+    }
+    break;
+    case MCTP_TRANS_UNIT_SIZE: {
+        nvme_mi_resp_hdr_init(&resp, NVME_MI_CMD);
+        resp.status = SUCCESS;
+        resp.mgmt_resp = ctrl_mi->mctp_unit_size;
+        memcpy(resp_message, &resp, sizeof(resp));
+
+        nvme_mi_send_resp(ctrl_mi, resp_message, total_size);
+    }
+    break;
+    }
+}
+
+static void nvme_mi_configuration_set(NvmeMiCtrl *ctrl_mi,
NvmeMiRequest *req)
+{
+    uint8_t config_identifier = (req->dword0 & 0xFF);
+    NvmeMiResponse resp;
+    uint32_t total_size = sizeof(resp);
+    uint8_t resp_message[total_size];
+    switch (config_identifier) {
+    case SMBUS_I2C_FREQ: {
+        nvme_mi_resp_hdr_init(&resp, NVME_MI_CMD);
+        resp.status = SUCCESS;
+        resp.mgmt_resp = 0;
+        ctrl_mi->smbus_freq = (req->dword0 & 0xF00) >> 8;
+        memcpy(resp_message, &resp, sizeof(resp));
+
+        nvme_mi_send_resp(ctrl_mi, resp_message, total_size);
+    }
+    break;
+    case MCTP_TRANS_UNIT_SIZE: {
+        nvme_mi_resp_hdr_init(&resp, NVME_MI_CMD);
+        resp.status = SUCCESS;
+        ctrl_mi->mctp_unit_size = (req->dword1 & 0xFFFF);
+        memcpy(resp_message, &resp, sizeof(resp));
+
+        nvme_mi_send_resp(ctrl_mi, resp_message, total_size);
+    }
+    break;
+    default:
+        nvme_mi_resp_hdr_init(&resp, NVME_MI_CMD);
+        resp.status = INVALID_PARAMETER;
+        memcpy(resp_message, &resp, sizeof(resp));
+        nvme_mi_send_resp(ctrl_mi, resp_message, total_size);
+    }
+
+}
+
+static void nvme_mi_vpd_read(NvmeMiCtrl *ctrl_mi, NvmeMiRequest *req)
+{
+    uint16_t dofst = (req->dword0 & 0xFFFF);
+    uint16_t dlen = (req->dword1 & 0xFFFF);
+    NvmeMiResponse resp;
+    g_autofree uint8_t *resp_buf = NULL;
+    nvme_mi_resp_hdr_init(&resp, NVME_MI_CMD);
+    if ((dofst + dlen) > sizeof(NvmeMiVpdElements)) {
+        resp.status = INVALID_PARAMETER;
+        nvme_mi_send_resp(ctrl_mi, (uint8_t *)&resp, sizeof(resp));
+    } else {
+        resp.status = SUCCESS;
+        resp_buf = (uint8_t *) g_malloc(dlen + sizeof(resp));
+        memcpy(resp_buf, &resp, sizeof(resp));
+        memcpy(resp_buf + sizeof(resp), &ctrl_mi->vpd_data + dofst,
dlen);
+        nvme_mi_send_resp(ctrl_mi, resp_buf, dlen + sizeof(resp));
+    }
+}
+static void nvme_mi_vpd_write(NvmeMiCtrl *ctrl_mi,
+                              NvmeMiRequest *req, uint8_t *buf)
+{
+    uint16_t dofst = (req->dword0 & 0xFFFF);
+    uint16_t dlen = (req->dword1 & 0xFFFF);
+    NvmeMiResponse resp;
+    nvme_mi_resp_hdr_init(&resp, NVME_MI_CMD);
+    if ((dofst + dlen) > sizeof(NvmeMiVpdElements)) {
+        resp.status = INVALID_PARAMETER;
+        nvme_mi_send_resp(ctrl_mi, (uint8_t *)&resp, sizeof(resp));
+    } else {
+        resp.status = SUCCESS;
+        memcpy(&ctrl_mi->vpd_data + dofst, buf + 16 , dlen);
+        nvme_mi_send_resp(ctrl_mi, (uint8_t *)&resp, sizeof(resp));
+    }
+}
+
+static void nvme_mi_nvm_subsys_health_status_poll(NvmeMiCtrl *ctrl_mi,
+                                                  NvmeMiRequest *req)
+{
+    NvmeMiResponse resp;
+    NvmeMiNvmSubsysHspds nshds;
+    NvmeCtrl *ctrl = NULL;
+    g_autofree uint8_t *resp_buf = NULL;
+    nvme_mi_resp_hdr_init(&resp, NVME_MI_CMD);
+    for (uint32_t cntlid = 1; cntlid <
ARRAY_SIZE(ctrl_mi->n->subsys->ctrls);
+                  cntlid++) {
+
+        ctrl = nvme_subsys_ctrl(ctrl_mi->n->subsys, cntlid);
+        if (!ctrl) {
+            continue;
+        }
+
+        if ((ctrl->bar.csts & 0x1) == 0x1) {
+            nshds.ccs = 0x1;
+        }
+        if ((ctrl->bar.csts & 0x2) == 0x2) {
+            nshds.ccs |= 0x2;
+        }
+        if ((ctrl->bar.csts & 0x10) == 0x10) {
+            nshds.ccs |= 0x10;
+        }
+        if (find_first_bit(ctrl->changed_nsids, NVME_CHANGED_NSID_SIZE)
!=
+            NVME_CHANGED_NSID_SIZE) {
+                nshds.ccs |= 0x40;
+        }
+        if ((ctrl->temperature >= ctrl->features.temp_thresh_hi) ||
+           (ctrl->temperature <= ctrl->features.temp_thresh_low)) {
+            nshds.ccs |= 0x200;
+        }
+    }
+
+
+    resp_buf = (uint8_t *)g_malloc(sizeof(resp) + sizeof(nshds));
+    memcpy(resp_buf, &resp, sizeof(resp));
+    memcpy(resp_buf + sizeof(resp), &nshds, sizeof(nshds));
+    nvme_mi_send_resp(ctrl_mi, resp_buf, sizeof(resp_buf));
+}
+
+static void nvme_mi_admin_identify_ns(NvmeMiCtrl *ctrl_mi,
+                                      NvmeAdminMiRequest *req,
+                                      uint32_t dofst, uint32_t dlen)
+{
+    NvmeIdNs *id_ns;
+    uint32_t nsid = req->sqentry1;
+    NvmeMiAdminResponse resp;
+    NvmeNamespace *ns;
+    g_autofree uint8_t *resp_buff = NULL;
+    nvme_mi_resp_hdr_init((NvmeMiResponse *)&resp, NVME_ADM_CMD);
+    resp.status = SUCCESS;
+    ns = nvme_ns(ctrl_mi->n, nsid);
+    if (!ns) {
+        resp.cqdword0 = 0;
+        resp.cqdword1 = 0;
+        resp.cqdword3 = NVME_INVALID_NSID << 16;
+            nvme_mi_send_resp(ctrl_mi, (uint8_t *)&resp,
sizeof(NvmeMiAdminResponse));
+        return ;
+    }
+
+    id_ns = &ns->id_ns;
+
+    resp_buff = g_malloc0(sizeof(NvmeMiAdminResponse) + dlen);
+    memcpy(resp_buff, &resp, sizeof(NvmeMiAdminResponse));
+    memcpy(resp_buff + sizeof(NvmeMiAdminResponse), id_ns + dofst,
dlen);
+
+    nvme_mi_send_resp(ctrl_mi, (uint8_t *)resp_buff,
+                      (sizeof(NvmeMiAdminResponse) + dlen));
+}
+static void nvme_mi_admin_identify_ctrl(NvmeMiCtrl *ctrl_mi,
+                                        NvmeAdminMiRequest *req,
+                                        uint32_t dofst, uint32_t dlen)
+{
+    NvmeMiAdminResponse resp;
+    g_autofree uint8_t *resp_buff = NULL;
+    nvme_mi_resp_hdr_init((NvmeMiResponse *)&resp, NVME_ADM_CMD);
+    resp.status = SUCCESS;
+    resp_buff = g_malloc0(sizeof(NvmeMiAdminResponse) + dlen);
+    memcpy(resp_buff, &resp, sizeof(NvmeMiAdminResponse));
+    memcpy(resp_buff + sizeof(NvmeMiAdminResponse),
&ctrl_mi->n->id_ctrl + dofst, dlen);
+
+    nvme_mi_send_resp(ctrl_mi, (uint8_t *)resp_buff,
+                     (sizeof(NvmeMiAdminResponse) + dlen));
+}
+static void nvme_mi_admin_identify(NvmeMiCtrl *ctrl_mi,
NvmeAdminMiRequest *req)
+{
+    uint32_t cns = req->sqentry10 & 0xFF;
+    uint32_t cflags = req->cmdflags;
+    uint32_t dofst = req->dataofst;
+    uint32_t dlen = req->datalen;
+    NvmeMiResponse resp;
+    if (dofst + dlen > 4096) {
+        nvme_mi_resp_hdr_init(&resp, true);
+        resp.status = INVALID_PARAMETER;
+        return nvme_mi_send_resp(ctrl_mi, (uint8_t *)&resp,
sizeof(resp));
+    }
+    if ((cflags & 0x1) == 0) {
+        dlen = 4096;
+    }
+    if (!(cflags & 0x2)) {
+        dofst = 0;
+    }
+    switch (cns) {
+    case 0x00:
+        return nvme_mi_admin_identify_ns(ctrl_mi, req, dofst, dlen);
+    case 0x1:
+        return nvme_mi_admin_identify_ctrl(ctrl_mi, req, dofst, dlen);
+    default:
+    {
+        NvmeMiAdminResponse resp;
+        nvme_mi_resp_hdr_init((NvmeMiResponse *)&resp, NVME_ADM_CMD);
+        resp.status = SUCCESS;
+        resp.cqdword3 = NVME_INVALID_FIELD << 16;
+        nvme_mi_send_resp(ctrl_mi, (uint8_t *)&resp, sizeof(resp));
+    }
+    }
+}
+static void nvme_mi_admin_error_info_log(NvmeMiCtrl *ctrl_mi,
+                                         NvmeAdminMiRequest *req,
+                                         uint32_t dofst, uint32_t dlen)
+{
+    NvmeMiAdminResponse resp;
+    NvmeErrorLog errlog = { };
+    g_autofree uint8_t *resp_buff = NULL;
+    memset(&errlog, 0x0, sizeof(errlog));
+    nvme_mi_resp_hdr_init((NvmeMiResponse *)&resp, NVME_ADM_CMD);
+    resp.status = SUCCESS;
+    resp_buff = g_malloc0(sizeof(NvmeMiAdminResponse) + dlen);
+    memcpy(resp_buff, &resp, sizeof(NvmeMiAdminResponse));
+    memcpy(resp_buff + sizeof(NvmeMiAdminResponse), &errlog + dofst,
dlen);
+    nvme_mi_send_resp(ctrl_mi, (uint8_t *)resp_buff,
+                     (sizeof(NvmeMiAdminResponse) + dlen));
+}
+
+static void nvme_mi_admin_get_log_page(NvmeMiCtrl *ctrl_mi,
+                                       NvmeAdminMiRequest *req)
+{
+    uint32_t lid = req->sqentry10;
+    uint32_t cflags = req->cmdflags;
+    uint32_t dofst = req->dataofst;
+    uint32_t dlen = req->datalen;
+    NvmeMiResponse resp;
+
+    switch (lid) {
+    case 0x00:
+        if (dofst + dlen > sizeof(NvmeErrorLog)) {
+            nvme_mi_resp_hdr_init(&resp, NVME_ADM_CMD);
+            resp.status = INVALID_PARAMETER;
+            return nvme_mi_send_resp(ctrl_mi, (uint8_t *)&resp,
sizeof(resp));
+        }
+        if ((cflags & 0x1) == 0) {
+            dlen = sizeof(NvmeErrorLog);
+        }
+        if (!(cflags & 0x2)) {
+            dofst = 0;
+        }
+        if (dofst + dlen > sizeof(NvmeErrorLog)) {
+            nvme_mi_resp_hdr_init(&resp, NVME_ADM_CMD);
+            resp.status = INVALID_PARAMETER;
+            return nvme_mi_send_resp(ctrl_mi, (uint8_t *)&resp,
sizeof(resp));
+        }
+
+        return nvme_mi_admin_error_info_log(ctrl_mi, req, dofst, dlen);
+    default:
+    {
+        NvmeMiAdminResponse resp;
+        nvme_mi_resp_hdr_init((NvmeMiResponse *)&resp, NVME_ADM_CMD);
+        resp.status = SUCCESS;
+        resp.cqdword3 = NVME_INVALID_FIELD << 16;
+        nvme_mi_send_resp(ctrl_mi, (uint8_t *)&resp, sizeof(resp));
+    }
+    }
+}
+
+static void nvme_mi_admin_get_features(NvmeMiCtrl *ctrl_mi,
+                                       NvmeAdminMiRequest *req)
+{
+    uint32_t fid = req->sqentry10 & 0xFF;
+    uint32_t dofst = req->dataofst;
+    uint32_t dlen = req->datalen;
+    NvmeMiResponse miresp;
+    NvmeMiAdminResponse miadminresp;
+    if (dofst || dlen) {
+
+        nvme_mi_resp_hdr_init(&miresp, NVME_ADM_CMD);
+        miresp.status = INVALID_PARAMETER;
+        return nvme_mi_send_resp(ctrl_mi, (uint8_t *)&miresp,
sizeof(miresp));
+    }
+
+    nvme_mi_resp_hdr_init((NvmeMiResponse *)&miadminresp,
NVME_ADM_CMD);
+    miadminresp.status = SUCCESS;
+
+    switch (fid) {
+    case NVME_TEMPERATURE_THRESHOLD:
+        miadminresp.cqdword0 = 0;
+
+        if (NVME_TEMP_TMPSEL(req->sqentry11) !=
NVME_TEMP_TMPSEL_COMPOSITE) {
+            break;
+        }
+
+        if (NVME_TEMP_THSEL(req->sqentry11) == NVME_TEMP_THSEL_OVER) {
+            miadminresp.cqdword0 = NVME_TEMPERATURE_WARNING;
+        }
+        break;
+    case NVME_NUMBER_OF_QUEUES:
+        miadminresp.cqdword0 = (ctrl_mi->n->params.max_ioqpairs - 1) |
+                        ((ctrl_mi->n->params.max_ioqpairs - 1) << 16);
+        break;
+    default:
+        miadminresp.cqdword3 = NVME_INVALID_FIELD << 16;
+        break;
+    }
+
+    return nvme_mi_send_resp(ctrl_mi, (uint8_t *)&miadminresp,
sizeof(miadminresp));
+}
+
+static void nvme_mi_admin_command(NvmeMiCtrl *ctrl_mi, void* req_arg)
+{
+    uint8_t *msg  = ((uint8_t *)req_arg);
+    NvmeMiMessageHeader msghdr;
+    NvmeMiRequest *req = (NvmeMiRequest *) (msg);
+    memcpy(&msghdr, msg, sizeof(NvmeMiMessageHeader));
+    if (msghdr.nmimt == 1) {
+        switch (req->opc) {
+        case READ_NVME_MI_DS:
+            nvme_mi_read_nvme_mi_ds(ctrl_mi, req);
+            break;
+        case CHSP:
+            nvme_mi_controller_health_ds(ctrl_mi, req);
+            break;
+        case NVM_SHSP:
+            nvme_mi_nvm_subsys_health_status_poll(ctrl_mi, req);
+            break;
+        case CONFIGURATION_SET:
+            nvme_mi_configuration_set(ctrl_mi, req);
+            break;
+        case CONFIGURATION_GET:
+            nvme_mi_configuration_get(ctrl_mi, req);
+            break;
+        case VPD_READ:
+            nvme_mi_vpd_read(ctrl_mi, req);
+            break;
+        case VPD_WRITE:
+            nvme_mi_vpd_write(ctrl_mi, req, msg);
+            break;
+        default:
+        {
+            NvmeMiResponse resp;
+            nvme_mi_resp_hdr_init(&resp, false);
+            resp.status = INVALID_COMMAND_OPCODE;
+            nvme_mi_send_resp(ctrl_mi, (uint8_t *)&resp, sizeof(resp));
+            break;
+        }
+        }
+    } else {
+        NvmeAdminMiRequest *req = (NvmeAdminMiRequest *) (msg);
+        switch  (req->opc) {
+        case NVME_ADM_CMD_IDENTIFY:
+            nvme_mi_admin_identify(ctrl_mi, req);
+            break;
+        case NVME_ADM_CMD_GET_LOG_PAGE:
+            nvme_mi_admin_get_log_page(ctrl_mi, req);
+            break;
+        case NVME_ADM_CMD_GET_FEATURES:
+            nvme_mi_admin_get_features(ctrl_mi, req);
+            break;
+        default:
+        {
+            NvmeMiResponse resp;
+            nvme_mi_resp_hdr_init(&resp, true);
+            resp.status = INVALID_COMMAND_OPCODE;
+            nvme_mi_send_resp(ctrl_mi, (uint8_t *)&resp, sizeof(resp));
+            break;
+        }
+        }
+    }
+
+    return;
+}
+
+static int nvme_mi_i2c_send(I2CSlave *s, uint8_t data)
+{
+    NvmeMiCtrl *mictrl = (NvmeMiCtrl *)s;
+    NvmeMiSendRecvStruct *misendrecv = &mictrl->misendrecv;
+
+    switch (misendrecv->state.pktpos) {
+    case NVME_MI_BYTE_LENGTH_POS:
+        misendrecv->state.pktlen = data;
+        break;
+    case NVME_MI_HOST_SLAVE_ADDR_POS:
+        misendrecv->hostslaveaddr = data >> 1;
+        break;
+    case NVME_MI_EOM_POS:
+        misendrecv->eom = (data >> 6) & 1;
+        break;
+    }
+    misendrecv->state.sendrecvbuf[++misendrecv->state.pktpos] = data;
+    if (misendrecv->state.pktpos == misendrecv->state.pktlen + 3) {
+        misendrecv->cmdbuffer = (uint8_t
*)g_realloc(misendrecv->cmdbuffer,
+                                                     misendrecv->offset
+
+
misendrecv->state.pktpos - 5);
+        memcpy(misendrecv->cmdbuffer + misendrecv->offset,
+               misendrecv->state.sendrecvbuf + 8,
misendrecv->state.pktpos - 5);
+
+        misendrecv->offset += misendrecv->state.pktpos - 5;
+        misendrecv->state.pktlen = 0;
+        misendrecv->state.pktpos = 0;
+
+        if (misendrecv->eom == 1) {
+            misendrecv->total_len = 0;
+            misendrecv->eom = 0;
+            nvme_mi_admin_command(mictrl, misendrecv->cmdbuffer);
+            misendrecv->offset = 0;
+            i2c_end_transfer(mictrl->bus);
+            for (int i = 0; i < misendrecv->total_len; i++) {
+                smbus_send_byte(mictrl->bus, misendrecv->hostslaveaddr,
+                                misendrecv->state.sendrecvbuf[i]);
+            }
+        }
+    }
+    return 0;
+}
+
+static void nvme_mi_realize(DeviceState *dev, Error **errp)
+{
+    NvmeMiCtrl *s = (NvmeMiCtrl *)(dev);
+    s->bus = (I2CBus *)dev->parent_bus;
+    s->smbus_freq = NVME_MI_DEF_SMBUS_FREQ;
+    s->mctp_unit_size = NVME_MI_DEF_MCTP_TRANS_UNIT_SIZE;
+}
+static Property nvme_mi_props[] = {
+     DEFINE_PROP_LINK("nvme", NvmeMiCtrl, n, TYPE_NVME, NvmeCtrl *),
+    DEFINE_PROP_END_OF_LIST(),
+};
+
+static void nvme_mi_class_init(ObjectClass *oc, void *data)
+{
+    I2CSlaveClass *k = I2C_SLAVE_CLASS(oc);
+    DeviceClass *dc = DEVICE_CLASS(oc);
+
+    dc->realize = nvme_mi_realize;
+    k->send = nvme_mi_i2c_send;
+
+    device_class_set_props(dc, nvme_mi_props);
+}
+
+static const TypeInfo nvme_mi = {
+    .name = TYPE_NVME_MI,
+    .parent = TYPE_I2C_SLAVE,
+    .instance_size = sizeof(NvmeMiCtrl),
+    .class_init = nvme_mi_class_init,
+};
+
+static void register_types(void)
+{
+    type_register_static(&nvme_mi);
+}
+
+type_init(register_types);
diff --git a/hw/nvme/nvme-mi.h b/hw/nvme/nvme-mi.h
new file mode 100644
index 0000000..5e3007d
--- /dev/null
+++ b/hw/nvme/nvme-mi.h
@@ -0,0 +1,288 @@
+/*
+ * QEMU NVMe-MI
+ *
+ * Copyright (c) 2021 Samsung Electronics Co., Ltd.
+ *
+ * Authors:
+ *   Padmakar Kalghatgi      <p.kalghatgi@samsung.com>
+ *   Arun Kumar Agasar       <arun.kka@samsung.com>
+ *   Saurav Kumar            <saurav.29@partner.samsung.com>
+ *
+ * This code is licensed under the GNU GPL v2 or later.
+ */
+
+#ifndef NVME_MI_H
+#define NVME_MI_H
+
+#include <stdio.h>
+#include <string.h>
+#include <unistd.h>
+#include <stdint.h>
+#include <stdbool.h>
+#include "hw/i2c/i2c.h"
+
+#define TYPE_NVME_MI "nvme-mi-i2c"
+
+#define NVM_SUBSYSTEM_INFORMATION 0
+#define PORT_INFORMATION 1
+#define CONTROLLER_LIST 2
+#define CONTROLLER_INFORMATION 3
+#define OPT_SUPP_CMD_LIST 4
+#define MGMT_EPT_BUFF_CMD_SUPP_LIST 5
+
+/*
+ *  considering MCTP transmission unit size
+ *  being 64, total MI payload size equal to 4224
+ *  and further including the SMBUS header for
+ *  each of the MCTP packet, I have defined maximum
+ *  buffer size of 5000
+ */
+#define MAX_NVME_MI_BUF_SIZE 5000
+#define NVME_MI_SMBUS_HEADER_AND_PEC 9
+
+/* value of 1 for the frequency means 100Khz */
+#define NVME_MI_DEF_SMBUS_FREQ 1
+#define NVME_MI_DEF_MCTP_TRANS_UNIT_SIZE 64
+
+enum NvmeMiMngmtInterfaceCmdSetsOpcodes {
+   READ_NVME_MI_DS                   = 0x00,
+   NVM_SHSP                          = 0x01,
+   CHSP                              = 0x02,
+   CONFIGURATION_SET                 = 0x03,
+   CONFIGURATION_GET                 = 0x04,
+   VPD_READ                          = 0x05,
+   VPD_WRITE                         = 0x06,
+   MI_RESET                          = 0x07,
+   SES_RECEIVE                       = 0x08,
+   SES_SEND                          = 0x09,
+   MANAGEMENT_ENDPOINT_BUFFER_READ   = 0x0A,
+   MANAGEMENT_ENDPOINT_BUFFER_WRITE  = 0x0B,
+   MI_RESERVED                       = 0x0C,
+   VENDOR_SPECIFIC                   = 0xC0
+};
+
+enum NvmeMiControlPrimitiveOpcodes {
+   PAUSE                             = 0x00,
+   RESUME                            = 0x01,
+   ABORT                             = 0x02,
+   GET_STATE                         = 0x03,
+   REPLAY                            = 0x04,
+   CTRL_PRIMITIVE_RESERVED           = 0x05,
+   CTRL_PRIMITIVE_VENDOR_SPECIFIC    = 0xF0
+};
+
+enum NvmeMiType {
+    CP,
+    NVME_MI_CMD,
+    NVME_ADM_CMD
+};
+
+enum NvmeMiConfigGetResponseValue {
+   DEFAULT_MCTP_SIZE   = 64,
+   DEFAULT_SMBUS_FREQ  = 1,
+   SET_SMBUS_FREQ      = 129,
+   SET_7BITS           = 255,
+   SET_4BITS           = 15,
+   SET_16BITS          = 65535
+};
+
+enum NvmeMiConfigurationIdentifier {
+   SMBUS_I2C_FREQ = 1,
+   HEALTH_STATUS_CHG,
+   MCTP_TRANS_UNIT_SIZE,
+};
+
+enum NvmeMiResponseMessageStatus {
+   SUCCESS,
+   MORE_PROCESSING_REQUIRED,
+   INTERNAL_ERROR,
+   INVALID_COMMAND_OPCODE,
+   INVALID_PARAMETER,
+   INVALID_COMMAND_SIZE,
+   INVALID_COMMAND_INPUT_DATA_SIZE,
+   ACCESS_DENIED,
+   VPD_UPDATES_EXCEEDED = 0x20,
+   PCIe_INACCESSIBLE
+};
+
+uint32_t NvmeMiCmdOptSupList[] = {
+  /*
+   * MANAGEMENT_ENDPOINT_BUFFER_READ,
+   * MANAGEMENT_ENDPOINT_BUFFER_WRITE,
+   */
+};
+
+uint32_t NvmeMiAdminCmdOptSupList[] = {
+   /*
+    *  NVME_ADM_CMD_DST,
+    *  NVME_ADM_CMD_DOWNLOAD_FW,
+    *  NVME_ADM_CMD_ACTIVATE_FW,
+    *  NVME_ADM_CMD_FORMAT_NVM,
+    *  NVME_ADM_CMD_NS_MANAGEMENT,
+    *  NVME_ADM_CMD_NS_ATTACHMENT,
+    *  NVME_ADM_CMD_DIRECTIVE_SEND,
+    *  NVME_ADM_CMD_DIRECTIVE_RECV,
+    *  NVME_ADM_CMD_SET_FEATURES,
+    *  NVME_ADM_CMD_SANITIZE,
+    */
+};
+
+enum NvmemiPktPos {
+   NVME_MI_BYTE_LENGTH_POS = 1,
+   NVME_MI_HOST_SLAVE_ADDR_POS = 2,
+   NVME_MI_EOM_POS = 6
+};
+
+typedef struct pktposstate {
+  u_char sendrecvbuf[MAX_NVME_MI_BUF_SIZE];
+  uint32_t pktlen, pktpos, mode;
+} pktposstate;
+
+typedef struct NvmeMiSendRecvStruct {
+   uint32_t total_len;
+   uint32_t offset;
+   uint8_t eom;
+   pktposstate state;
+   uint8_t *cmdbuffer;
+   uint8_t hostslaveaddr;
+} NvmeMiSendRecvStruct;
+
+typedef struct NvmeMiVpdElements {
+    long common_header;
+} NvmeMiVpdElements;
+
+typedef struct NvmeMiCtrl {
+   I2CSlave parent_obj;
+   uint32_t mctp_unit_size;
+   uint32_t smbus_freq;
+   NvmeMiVpdElements vpd_data;
+   NvmeMiSendRecvStruct  misendrecv;
+   NvmeCtrl *n;
+   I2CBus *bus;
+} NvmeMiCtrl;
+
+typedef struct NvmeMiMessageHeader {
+   uint32_t msgtype:7;
+   uint32_t ic:1;
+   uint32_t csi:1;
+   uint32_t reserved:2;
+   uint32_t nmimt:4;
+   uint32_t ror:1;
+   uint32_t reserved1:16;
+} NvmeMiMessageHeader;
+
+typedef struct NvmeMiRequest {
+   NvmeMiMessageHeader msg_header;
+   uint32_t               opc:8;
+   uint32_t               rsvd:24;
+   uint32_t               dword0;
+   uint32_t               dword1;
+   uint32_t               mic;
+} NvmeMiRequest;
+
+typedef struct NvmeAdminMiRequest {
+   NvmeMiMessageHeader msg_header;
+   uint8_t                opc;
+   uint8_t                cmdflags;
+   uint16_t               cntlid;
+   uint32_t               sqentry1;
+   uint32_t               sqentry2;
+   uint32_t               sqentry3;
+   uint32_t               sqentry4;
+   uint32_t               sqentry5;
+   uint32_t               dataofst;
+   uint32_t               datalen;
+   uint32_t               reserved[2];
+   uint32_t               sqentry10;
+   uint32_t               sqentry11;
+   uint32_t               sqentry12;
+   uint32_t               sqentry13;
+   uint32_t               sqentry14;
+   uint32_t               sqentry15;
+   uint32_t               mic;
+} NvmeAdminMiRequest;
+
+typedef struct ReadNvmeMiDs {
+    uint16_t cntrlid;
+    uint8_t  portlid;
+    uint8_t  dtyp;
+}  ReadNvmeMiDs;
+
+typedef struct NvmeMiConfigurationSet {
+    uint8_t conf_identifier_dword_0;
+    uint16_t conf_identifier_specific_dword_0;
+    uint16_t conf_identifier_specific_dword_1;
+}  MiConfigurationSet;
+
+typedef struct NvmeMiNvmSubsysHspds {
+    uint8_t nss;
+    uint8_t sw;
+    uint8_t ctemp;
+    uint8_t pdlu;
+    uint16_t ccs;
+    uint16_t reserved;
+} NvmeMiNvmSubsysHspds;
+
+typedef struct NvmeMiControlPrimitives {
+    uint32_t nmh;
+    uint32_t cpo;
+    uint32_t tag;
+    uint32_t cpsp;
+    uint32_t mic;
+} NvmeMiControlPrimitives;
+
+typedef struct NvmMiSubsysInfoDs {
+    uint8_t nump;
+    uint8_t mjr;
+    uint8_t mnr;
+    uint8_t rsvd[29];
+} NvmMiSubsysInfoDs;
+
+typedef struct NvmeMiCwarnStruct {
+    uint8_t spare_thresh:1;
+    uint8_t temp_above_or_under_thresh:1;
+    uint8_t rel_degraded:1;
+    uint8_t read_only:1;
+    uint8_t vol_mem_bup_fail:1;
+    uint8_t reserved:3;
+} NvmeMiCwarnStruct;
+
+typedef struct NvmeMiCstsStruct {
+    uint16_t rdy:1;
+    uint16_t cfs:1;
+    uint16_t shst:2;
+    uint16_t nssro:1;
+    uint16_t en:1;
+    uint16_t nssac:1;
+    uint16_t fwact:1;
+    uint16_t reserved:8;
+} NvmeMiCstsStruct;
+
+typedef struct NvmeMiCtrlHealthDs {
+   uint16_t ctlid;
+   NvmeMiCstsStruct csts;
+   uint16_t ctemp;
+   uint16_t pdlu;
+   uint8_t spare;
+   NvmeMiCwarnStruct cwarn;
+   uint8_t reserved[7];
+} NvmeMiCtrlHealthDs;
+
+typedef struct NvmeMiResponse {
+   NvmeMiMessageHeader msg_header;
+   uint32_t status:8;
+   uint32_t mgmt_resp:24;
+} NvmeMiResponse;
+
+typedef struct NvmeMiAdminResponse {
+   NvmeMiMessageHeader msg_header;
+   uint32_t status:8;
+   uint32_t mgmt_resp:24;
+   uint32_t cqdword0;
+   uint32_t cqdword1;
+   uint32_t cqdword3;
+} NvmeMiAdminResponse;
+
+
+
+#endif


------TI73IYgzdP03rYJ9SiN0qM3o3mlayfAqXHuFFMbUzbY.6Ea-=_5621f_
Content-Type: text/plain; charset="utf-8"


------TI73IYgzdP03rYJ9SiN0qM3o3mlayfAqXHuFFMbUzbY.6Ea-=_5621f_--

