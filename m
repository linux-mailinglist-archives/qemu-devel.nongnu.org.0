Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 05E483C28B8
	for <lists+qemu-devel@lfdr.de>; Fri,  9 Jul 2021 19:49:25 +0200 (CEST)
Received: from localhost ([::1]:45750 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m1ucu-0002mO-2n
	for lists+qemu-devel@lfdr.de; Fri, 09 Jul 2021 13:49:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:32828)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mohit.kap@samsung.com>)
 id 1m1sfF-00043V-Qm
 for qemu-devel@nongnu.org; Fri, 09 Jul 2021 11:43:41 -0400
Received: from mailout1.samsung.com ([203.254.224.24]:26162)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mohit.kap@samsung.com>)
 id 1m1sf9-0005JK-Ml
 for qemu-devel@nongnu.org; Fri, 09 Jul 2021 11:43:41 -0400
Received: from epcas5p4.samsung.com (unknown [182.195.41.42])
 by mailout1.samsung.com (KnoxPortal) with ESMTP id
 20210709154324epoutp01d8efb6f0878a28642741c3158fb4c0ca~QKcgKFMdH1831518315epoutp01h
 for <qemu-devel@nongnu.org>; Fri,  9 Jul 2021 15:43:24 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.samsung.com
 20210709154324epoutp01d8efb6f0878a28642741c3158fb4c0ca~QKcgKFMdH1831518315epoutp01h
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1625845404;
 bh=2Yob4Q2hi9InngWFCItmL707jizQuSjTl7IFsXNgeso=;
 h=Date:From:To:Cc:Subject:References:From;
 b=TbEFeuJiRpUpNE1TQ4x25E7c3g0aNN6Jl7goudaX6os3ZzME6oMDed1nB5sEQn752
 FhZOIbDSrN4LEH6ylVDdYkzoGGZlacdWGT9+pr40A4LVTk+bY/f0PyylYR+mxKO5qA
 YuMe4XDQSAG+hdouPSh4Zj3bMFVJzzXQe5/Xo2pU=
Received: from epsnrtp2.localdomain (unknown [182.195.42.163]) by
 epcas5p2.samsung.com (KnoxPortal) with ESMTP id
 20210709154322epcas5p2cc51efe2e2d3104cb365c0be91b83ab1~QKceh17Qe1321413214epcas5p24;
 Fri,  9 Jul 2021 15:43:22 +0000 (GMT)
Received: from epsmges5p3new.samsung.com (unknown [182.195.40.208]) by
 epsnrtp2.localdomain (Postfix) with ESMTP id 4GLy9h2j0Xz4x9Pt; Fri,  9 Jul
 2021 15:43:20 +0000 (GMT)
Received: from epcas5p3.samsung.com ( [182.195.41.41]) by
 epsmges5p3new.samsung.com (Symantec Messaging Gateway) with SMTP id
 41.7A.09452.89E68E06; Sat, 10 Jul 2021 00:43:20 +0900 (KST)
Received: from epsmtrp2.samsung.com (unknown [182.195.40.14]) by
 epcas5p3.samsung.com (KnoxPortal) with ESMTPA id
 20210709145458epcas5p35826843853e7a8986098c4ff8fba857a~QJyNYoG8v1523915239epcas5p30;
 Fri,  9 Jul 2021 14:54:58 +0000 (GMT)
Received: from epsmgms1p1new.samsung.com (unknown [182.195.42.41]) by
 epsmtrp2.samsung.com (KnoxPortal) with ESMTP id
 20210709145458epsmtrp2b0794256f9215b7332ddf3852e1f7f04~QJyNXbg9v2943829438epsmtrp2b;
 Fri,  9 Jul 2021 14:54:58 +0000 (GMT)
X-AuditID: b6c32a4b-43fff700000024ec-a9-60e86e9800ce
Received: from epsmtip1.samsung.com ( [182.195.34.30]) by
 epsmgms1p1new.samsung.com (Symantec Messaging Gateway) with SMTP id
 FA.52.08394.14368E06; Fri,  9 Jul 2021 23:54:57 +0900 (KST)
Received: from test-zns (unknown [107.110.206.5]) by epsmtip1.samsung.com
 (KnoxPortal) with ESMTPA id
 20210709145455epsmtip117c6ba7811e8d51811f2d85dff5f4158~QJyK9cRlZ1817118171epsmtip1R;
 Fri,  9 Jul 2021 14:54:55 +0000 (GMT)
Date: Fri, 9 Jul 2021 20:23:52 +0530
From: Mohit Kapoor <mohit.kap@samsung.com>
To: linux-nvme@lists.infrared.org, kbusch@kernel.org
Subject: Re: [RFC PATCH nvme-cli 2/2] nvme-cli/plugins/mi:add support
Message-ID: <20210709145352.GA14300@test-zns>
MIME-Version: 1.0
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Brightmail-Tracker: H4sIAAAAAAAAA02Te0xTVxzHd+5tb4tJl7si40DCrIWYwQZ9QOsFBWcQ0wTmuoCLWba1N3CE
 hnLb9MHc5hwOjGIEN7Gb1McM6pLhgqBCiiIMCOMhr07Kpmyj4aEMA1OeQ0R224sJ/31+39/v
 +/v9Ts45Qlw8TIQKDYwNWRjaKCU28OpaIyOjy5kJvbw1nZqa9xLUQFMfoJqaF/jU6J+zAurK
 DzKq83ADnzrVMgioy25EnT48JKAuPAinfl8aEVADpytwyjl9lKDaS1w86vGpVT51v3CceIfU
 /Nd7lND0uvoEmuuVxYSmo36CpxkbvIFp/m30EJrSm5VAK/jQuD0H0VnIIkFMpinLwGQnSlPT
 dck6lVquiFbEU1ulEobOQ4nSXWna6N0GI7u6VJJPG+2spKWtVqksabvFZLchSY7JakuUInOW
 0axQmmOsdJ7VzmTHZJryEhRyuVLFVuqNOf0lXxPmc738A0PLw1gBWCnhHQcBQkjGwcknbSxv
 EIrJ2wDWjw8CLpgBsHS2eS2zAOB4UQPx0tJ4dxnjEncAXHGdEHDBQza49sLfmEdGQE/rnMDH
 BBkFna2ruI83sm53+XP/DJysx+CRZy7WIBQGkinQvZTrqxGR0bCi8RnG8Wuws3zM3zOIDIe/
 1LX7J0OyQwhry88IuJV2wdF/+nGOA+Fk+801PRTOTt8hfP0h+QV0Vok47zEAL5b2rB1nB3Q3
 rGDcogmw073o9+KkAdY8OgG4mjDo6KrCOP1VWLI8hnG6CLou+NjXPxz+OGfk5BA4U13G51gD
 B294/SwmP4Z9o27sG7DJue5oznXTOI6CK+d71vRP4PH783wnOwEnI+G1W7KLgF8JQpDZmpeN
 rCpzLIM+XX/n14H/dUelusCI90lMC8CEoAVEsO6R6qv9IJTHmBgk3ShSnnmoF4uy6M8+RxaT
 zmI3ImsLULH39i0eGpRpYr8KY9MpVEq1Wh4vV8VSaoU0WHRF0KIXk9m0DeUiZEaWlz5MGBBa
 gG1J602sS7ZhWm2P9qcPqiNzkw5+1737zQzd+0eiuuLbPO0TQd2Twbcz2p5izfK3NbXYpj30
 wDFJoXcvc87iFr/wvocO/Va1457OvhyRP/1gLqyp++4E2hmnFmzjmdNlFd8H/oUtd7Ulv3L1
 y/NFjoBLXy1sdShH9xXjYcGGkZ17Xw/qekNzUu/IGTx5KXahoCglG8g7H9fIVmYWp+YX9q8m
 1DwK9DjKPlpNFbZ79pjuxSyZJAfcfUORBxUd+YcMgXRqiPx53ChRthnt21IdktJwlvBu3tYw
 PPH0LXzKfnny5ySn1zNU+65s/x+Lv6Y1FlbVkauzGX8T3bfOdiSBYmWRlGfNoRVRuMVK/w9N
 BulqcgQAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFmpnkeLIzCtJLcpLzFFi42LZdlhJTtcx+UWCwUFmi7dfH7BZXNl/ntFi
 /8FvrBaP73xmt1g6X9/iZOMeVotJh64xWiy5mGoxpfE2u8W8W8oW138+Yre4MmURs8Wsd+1s
 Fsd7d7BYvJ70n9XiZvNTNgcBjx/n2tk8zu04z+6xaVUnm8eJnS9YPJ5c28zk8X7fVTaPvi2r
 GAPYo7hsUlJzMstSi/TtErgybj1uYCmYcZq14s7bh+wNjFO7WboYOTkkBEwk9p3+zdTFyMUh
 JLCbUWJ6+zs2iISkxPydM5ghbGGJlf+es0MUPWGUOP5wNxNIgkVAReLq4S/sIDabgJbErMP/
 wRpEgKZenPmHEaSBWWA3k8S0xReBGjg4hAVcJS7+zAap4RXQlVi07xcThC0ocXLmExaQEmYB
 DYl5T1xBwswCMRJrei+DHSoqoCxxYNtxpgmM/LOQdMxC6JiFpGMBI/MqRsnUguLc9NxiwwLD
 vNRyveLE3OLSvHS95PzcTYzg+NHS3MG4fdUHvUOMTByMhxhVgNofbVh9gVGKJS8/L1VJhNdo
 xrMEId6UxMqq1KL8+KLSnNTiQ4zSHCxK4rwXuk7GCwmkJ5akZqemFqQWwWSZODilGpgMtXbZ
 dmbw+u9c9T5CPf7tz7ybZ4+e/Wi6fplhsbhRm8rVk+ZHXnOFLTzyyCdl4ifvJDe9r8enTVgw
 kztR1HKBye53FqXpL+efu6B2PvXrD7PKL3dvrmeZcGdh7Y3tG9QcY26uEnmd7Koi+O9wS/c6
 P4kFt7c/kGH8WHOmoEN4Ffv0q6pS/tnv5/otC65fvnfv3k+aluL7Hnxksn740SyR16Wu+lQw
 j+wzoTcG6Se/Sfw6neWc32+Tma38JzXjWL5VtZO7EE/upehlpXuOnev3KLBe9Lf09XLDz5dm
 7BFf9W9hklmgtb5a4dVsI5uTnPvazlW9X3vsVKdrDMP2zwtqXT/sdDwscYnl/6wugdxHSizF
 GYmGWsxFxYkAmp8RvhoDAAA=
X-CMS-MailID: 20210709145458epcas5p35826843853e7a8986098c4ff8fba857a
X-Msg-Generator: CA
filename: nvme-cli-plugin-mi-add-support-for-qemu-mi.patch
Content-Type: multipart/mixed;
 boundary="----hb-dvdiRZtWrjeusMudXEerT0TTrvs-OGX_88iZ4NSx451yS=_1031fc_"
X-Sendblock-Type: REQ_APPROVE
CMS-TYPE: 105P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20210709145458epcas5p35826843853e7a8986098c4ff8fba857a
References: <CGME20210709145458epcas5p35826843853e7a8986098c4ff8fba857a@epcas5p3.samsung.com>
Received-SPF: pass client-ip=203.254.224.24;
 envelope-from=mohit.kap@samsung.com; helo=mailout1.samsung.com
X-Spam_score_int: -74
X-Spam_score: -7.5
X-Spam_bar: -------
X-Spam_report: (-7.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.45,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_HI=-5, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Fri, 09 Jul 2021 13:45:44 -0400
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
Cc: fam@euphon.net, kwolf@redhat.com, p.kalghatgi@samsung.com,
 qemu-block@nongnu.org, k.jensen@samsung.com, d.palani@samsung.com,
 qemu-devel@nongnu.org, mreitz@redhat.com, u.kishore@samsung.com,
 stefanha@redhat.com, its@irrelevant.dk, javier.gonz@samsung.com,
 prakash.v@samsung.com, jg123.choi@samsung.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

------hb-dvdiRZtWrjeusMudXEerT0TTrvs-OGX_88iZ4NSx451yS=_1031fc_
Content-Type: text/x-diff; charset="utf-8"
Content-Disposition: attachment;
	filename="nvme-cli-plugin-mi-add-support-for-qemu-mi.patch"

Signed-off-by: Mohit Kapoor

---

diff --git a/Makefile b/Makefile
index 86eb7c6..3ea82dd 100644
--- a/Makefile
+++ b/Makefile
@@ -83,6 +83,13 @@ PLUGIN_OBJS :=					\
 	plugins/wdc/wdc-utils.o			\
 	plugins/huawei/huawei-nvme.o		\
 	plugins/netapp/netapp-nvme.o		\
+	plugins/mi/util/hal/mi-nvme-hal-main.o 		\
+	plugins/mi/util/hal/mi-nvme-qemu/mi-nvme-qemu.o \
+	plugins/mi/util/mi-nvme-util-base.o			\
+	plugins/mi/util/mi-nvme-util-crc.o 			\
+	plugins/mi/util/mi-nvme-util-tool.o 			\
+	plugins/mi/mi-nvme.o			\
+	plugins/mi/mi-nvme-cmd.o			\
 	plugins/toshiba/toshiba-nvme.o		\
 	plugins/micron/micron-nvme.o		\
 	plugins/seagate/seagate-nvme.o 		\
diff --git a/plugins/mi/mi-nvme-cmd.c b/plugins/mi/mi-nvme-cmd.c
new file mode 100644
index 0000000..3a71170
--- /dev/null
+++ b/plugins/mi/mi-nvme-cmd.c
@@ -0,0 +1,116 @@
+/*
+ * Copyright (C) 2021 Samsung Electronics Inc. All rights reserved.
+ *
+ * This program is free software; you can redistribute it and/or
+ * modify it under the terms of the GNU General Public License version
+ * 2 as published by the Free Software Foundation.
+ *
+ * This program is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+ * GNU General Public License for more details.
+ *
+ * ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
+ * mi-nvme-cmd.c - Implementation of NVMe Management Interface commands in Nvme
+ *
+ * Developer : Mohit Kapoor <mohit.kap@samsung.com>
+ */
+
+#include "mi-nvme-cmd.h"
+
+uint32_t gettransmissionunitsize()
+{
+    return MCTP_TRANS_UNIT_SIZE_VAL_DEF;
+}
+
+int executecommand(__u8 *cmdobj)
+{
+    struct nvme_mi_mctp_message_t message;
+    memset(&message, 0, sizeof(struct nvme_mi_mctp_message_t));
+    nvme_mi_admin_cmd_mctp_message adminmessage;
+    memset(&adminmessage, 0, sizeof(nvme_mi_admin_cmd_mctp_message));
+    bool ret = false;
+    uint32_t RequestDataSize = 0;
+    struct gencmd_nvmemi *micmd;
+    struct gencmd_nvmemi_admin *miadmincmd;
+    uint32_t uiMCTP_TUS = gettransmissionunitsize();
+
+    ret = initialize(uiMCTP_TUS);
+    if (ret == false) {
+        return -1;
+    }
+
+    streply.length = 0;
+    streply.errorcode = 0;
+    memset(streply.replybuf, 0, sizeof(streply.replybuf));
+
+    /*Skipping first element in the structure.... Size of buffer is 4 bytes each(uint32_t) in the  NVMe_MI_Header structure*/
+    memcpy(&message.msgPld, cmdobj, sizeof(struct nvme_mi_mctp_message_t) - 8);
+
+    /*Check if the incoming command is an MI/MI-Admin Command*/
+    if (message.msgPld.nvme_mi_message_header & 0x00001000)	{
+        miadmincmd = (struct gencmd_nvmemi_admin *)cmdobj;
+        /*Skipping first element in the structure....Size of buffer is 4 bytes each(uint32_t) in the  NVMe_MI_Header structure*/
+        memcpy(&adminmessage.msgPld, cmdobj, sizeof(nvme_mi_admin_cmd_mctp_message) - 8);
+        if (miadmincmd->buf != NULL) {
+            adminmessage.msgPld.buffer = miadmincmd->buf;
+        }
+        ret = execute_nvme_mi_admin_command(adminmessage, &(streply), REPLY_BUFFER_SIZE, miadmincmd->dlen);
+    } else if (message.msgPld.nvme_mi_message_header & 0x00000800) {
+        micmd = (struct gencmd_nvmemi *)cmdobj;
+        if (micmd->buf != NULL) {
+        message.msgPld.buffer = micmd->buf;
+        }
+        ret = execute_nvme_mi_command(message, &(streply), REPLY_BUFFER_SIZE, RequestDataSize);
+    }
+
+    if (!ret) {
+        return -1;
+    } else {
+        return 0;
+    }
+}
+
+int getresponsedata(uint8_t *buf, uint32_t size, bool ismicmd)
+{
+    uint32_t offset = 0;
+    uint32_t length = gettransmissionunitsize() - NVME_MI_HEADER_SIZE;
+    uint32_t bytesread = 0;
+
+    if (buf == NULL) {
+        printf("Error : getresponsedata input buf is NULL\n");
+        return -1;
+    }
+
+    if (ismicmd == true) {
+        offset = MCTP_PKT_HEADER_SIZE + NVME_MI_STATUS_SIZE + NVME_MI_HEADER_SIZE;
+        length = gettransmissionunitsize() - NVME_MI_HEADER_SIZE - NVME_MI_STATUS_SIZE;
+        streply.length = streply.length -  NVME_MI_HEADER_SIZE - NVME_MI_STATUS_SIZE - CRC_SIZE;
+    } else {
+        offset = MCTP_PKT_HEADER_SIZE + NVME_MI_STATUS_SIZE + NVME_MI_HEADER_SIZE + CQENTRY_SIZE;
+        length = gettransmissionunitsize() - NVME_MI_HEADER_SIZE - NVME_MI_STATUS_SIZE - CQENTRY_SIZE;
+        streply.length = streply.length - NVME_MI_HEADER_SIZE - NVME_MI_STATUS_SIZE - CRC_SIZE - CQENTRY_SIZE;
+    }
+
+    if (length > size) {
+        length = size;
+    }
+
+    while (bytesread < streply.length) {
+        memcpy(buf + bytesread, streply.replybuf + offset, length);
+        offset += length + MCTP_PKT_HEADER_SIZE;
+        bytesread += length;
+
+        if (bytesread + gettransmissionunitsize() > streply.length) {
+            length = streply.length - bytesread;
+        } else {
+            length = gettransmissionunitsize();
+        }
+    }
+    return 0;
+}
+
+void getresponsemessage(uint8_t *buf, uint32_t size)
+{
+    memcpy(buf, streply.replybuf + MCTP_PKT_HEADER_SIZE, size);
+}
diff --git a/plugins/mi/mi-nvme-cmd.h b/plugins/mi/mi-nvme-cmd.h
new file mode 100644
index 0000000..9a15ada
--- /dev/null
+++ b/plugins/mi/mi-nvme-cmd.h
@@ -0,0 +1,33 @@
+/*
+ * Copyright (C) 2021 Samsung Electronics Inc. All rights reserved.
+ *
+ * This program is free software; you can redistribute it and/or
+ * modify it under the terms of the GNU General Public License version
+ * 2 as published by the Free Software Foundation.
+ *
+ * This program is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+ * GNU General Public License for more details.
+ *
+ * ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
+ * mi-nvme-cmd.h - Implementation of NVMe Management Interface commands in Nvme
+ *
+ * Developer : Mohit Kapoor <mohit.kap@samsung.com>
+ */
+
+#ifndef _MI_NVME__CMD_H_
+#define _MI_NVME_CMD_H_
+
+#include "mi-nvme-struct.h"
+#include "util/mi-nvme-util-base.h"
+#include "util/mi-nvme-util-tool.h"
+
+mctp_reply_buffer_struct streply;
+
+uint32_t gettransmissionunitsize();
+int executecommand(__u8 *cmdobj);
+int getresponsedata(uint8_t *buf, uint32_t size, bool flagmi);
+void getresponsemessage(uint8_t *buf, uint32_t size);
+
+#endif
diff --git a/plugins/mi/mi-nvme-struct.h b/plugins/mi/mi-nvme-struct.h
new file mode 100644
index 0000000..4eed296
--- /dev/null
+++ b/plugins/mi/mi-nvme-struct.h
@@ -0,0 +1,291 @@
+/*
+ * Copyright (C) 2021 Samsung Electronics Inc. All rights reserved.
+ *
+ * This program is free software; you can redistribute it and/or
+ * modify it under the terms of the GNU General Public License version
+ * 2 as published by the Free Software Foundation.
+ *
+ * This program is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+ * GNU General Public License for more details.
+ *
+ * ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
+ * mi-nvme-struct.h - Implementation of NVMe Management Interface commands in NVMe.
+ * This file contains required header and response structures for MI commands.
+ *
+ * Developer : Mohit Kapoor <mohit.kap@samsung.com>
+ */
+
+#ifndef _MI_NVME__HEADER_H_
+#define _MI_NVME_HEADER_H_
+
+#include <stdint.h>
+#include <stdbool.h>
+#include <string.h>
+#include <unistd.h>
+#include <stdio.h>
+#include <linux/types.h>
+
+#define MCTP_PKT_HEADER_SIZE 8
+#define NVME_MI_HEADER_SIZE 4
+#define NVME_MI_STATUS_SIZE 4
+#define CQENTRY_SIZE 12
+#define MCTP_TRANS_UNIT_SIZE_VAL_DEF 64
+
+enum nvmemi_opcode {
+    nvmemi_cmd_readnvmemids = 0x00,
+    nvmemi_cmd_subsyshealthstpoll = 0x01,
+    nvmemi_cmd_chsp = 0x02,
+    nvmemi_cmd_configurationset	= 0x03,
+    nvmemi_cmd_configurationget = 0x04,
+    nvmemi_cmd_vpdread = 0x05,
+    nvmemi_cmd_vpdwrite = 0x06
+};
+
+typedef enum _MI_COMMAND_TYPE {
+    COMMAND_TYPE_MI,
+    COMMAND_TYPE_MI_ADMIN
+}MI_COMMAND_TYPE;
+
+enum CONFIGURATION_IDENTIFIER {
+    RESERVED,
+    SMBUS_I2C_FREQ,
+    HEALTH_STATUS_CHG,
+    MCTP_TRANS_UNIT_SIZE,
+};
+
+struct nvmemi_message_header_struct {
+    uint32_t message_type:7;
+    uint32_t ic:1;
+    uint32_t csi:1;
+    uint32_t reserved:2;
+    uint32_t nmimt:4;
+    uint32_t ror:1;
+    uint32_t reserved1:16;
+};
+
+typedef struct _mctp_message_header {
+    uint8_t messsage_type:7;
+    uint8_t ic:1;
+    uint8_t instance_id:5;
+    uint8_t rsvd:1;
+    uint8_t D:1;
+    uint8_t RQ:1;
+    uint8_t Command_Code;
+}mctp_message_header;
+
+/*Generic command Structure for NVMe MI Commands*/
+struct gencmd_nvmemi {
+    struct nvmemi_message_header_struct msg_header;
+    uint8_t opcode;
+    uint8_t reserved0;
+    uint8_t reserved1;
+    uint8_t reserved2;
+    uint32_t cdw0;
+    uint32_t cdw1;
+    uint8_t *buf;
+    uint32_t mic;
+};
+
+/*Generic command Structure for NVMe MI Admin Commands*/
+struct gencmd_nvmemi_admin {
+    struct nvmemi_message_header_struct msg_header;
+    uint8_t opcode;
+    uint8_t cflgs;
+    uint16_t ctlid;
+    uint32_t nsid;
+    uint32_t cdw2;
+    uint32_t cdw3;
+    uint32_t cdw4;
+    uint32_t cdw5;
+    uint32_t dofst;
+    uint32_t dlen;
+    uint32_t cdw8;
+    uint32_t cdw9;
+    uint32_t cdw10;
+    uint32_t cdw11;
+    uint32_t cdw12;
+    uint32_t cdw13;
+    uint32_t cdw14;
+    uint32_t cdw15;
+    uint8_t *buf;
+    uint32_t mic;
+};
+
+struct admin_cmd_resp_dw3 {
+    uint16_t cid;
+    uint16_t p:1;
+    uint16_t sc:8;
+    uint16_t sct:3;
+    uint16_t crd:2;
+    uint16_t m:1;
+    uint16_t NVME_DIR_SND_ID_OP_ENABLE:1;
+};
+
+struct nvme_admin_cmd_resp_status {
+    uint8_t msg_type:7;
+    uint8_t ic:1;
+
+    uint8_t csi:1;
+    uint8_t reserved :2;
+    uint8_t nvme_mi_msg_type:4;
+    uint8_t ror:1;
+
+    uint16_t reserved1;
+
+    uint32_t status:8;
+    uint32_t nvme_mgmt_response:24;
+
+    uint32_t cqdw0;
+    uint32_t cqdw1;
+    struct admin_cmd_resp_dw3 cqdw3;
+};
+
+struct nvme_mi_cmd_resp {
+    uint8_t msg_type:7;
+    uint8_t ic:1;
+
+    uint8_t csi:1;
+    uint8_t reserved:2;
+    uint8_t nvme_mi_msg_type:4;
+    uint8_t ror:1;
+
+    uint16_t reserved1;
+
+    uint32_t status:8;
+    uint32_t nvme_mgmt_response:24;
+};
+
+struct read_nvme_mi_data_struct_resp {
+    uint16_t resp_data_len;
+    uint8_t reserved;
+};
+
+struct smbus_i2c_freq_cfgget_resp {
+    uint8_t smbus_i2c_freq:4;
+    uint8_t reserved1:4;
+    uint16_t reserved2;
+};
+
+struct mctp_tus_cfgget_resp {
+    uint16_t mctp_trans_unit_size;
+    uint8_t reserved;
+};
+
+struct nvme_subsys_info_data {
+    uint8_t nump;
+    uint8_t mjr;
+    uint8_t mnr;
+    uint8_t reserved[29];
+};
+
+struct option_sup_cmd_struct {
+    uint8_t cmdtype;
+    uint8_t opc;
+};
+
+struct option_sup_cmd_list_struct {
+    uint16_t numcmd;
+    struct option_sup_cmd_struct cmdstruct[2047];
+};
+
+struct nss_status_struct {
+    uint8_t RESERVED			:2;
+    uint8_t PORT1_PLA			:1;
+    uint8_t PORT2_PLA			:1;
+    uint8_t RESET_NOT_REQ      :1;
+    uint8_t DRIVE_FUNC         :1;
+    uint8_t RESERVED1          :2;
+};
+
+struct comp_ctrl_status_struct {
+    uint16_t READY									:1;
+    uint16_t CFS					                :1;
+    uint16_t SHN_STS								:2;
+    uint16_t NSSR_OCCURRED						    :1;
+    uint16_t CECO									:1;
+    uint16_t NSAC									:1;
+    uint16_t FWACT									:1;
+    uint16_t CS_CH									:1;
+    uint16_t CTC									:1;
+    uint16_t PERCENTAGE_USED						:1;
+    uint16_t AVAILABLE_SPARE						:1;
+    uint16_t CRITICAL_WARNING						:1;
+    uint16_t RESERVED								:3;
+};
+
+struct nvm_subsys_health_struct {
+    struct nss_status_struct nss_status;
+    uint8_t smart_warnings;
+    uint8_t composite_temp;
+    uint8_t per_drv_life_used;
+    struct comp_ctrl_status_struct  comp_ctrl_status;
+    uint16_t reserved;
+};
+
+struct ctrl_health_status_poll_resp {
+    __u16 reserved;
+    __u8 rent;
+};
+
+struct cwarn_struct {
+    __u8 spare_thresh:1;
+    __u8 temp_above_or_under_thresh:1;
+    __u8 rel_degraded:1;
+    __u8 read_only:1;
+    __u8 vol_mem_bup_fail:1;
+    __u8 reserved:3;
+};
+
+struct csts_struct {
+    __u16 rdy									:1;
+    __u16 cfs					                :1;
+    __u16 shst									:2;
+    __u16 nssro								    :1;
+    __u16 en									:1;
+    __u16 nssac									:1;
+    __u16 fwact									:1;
+    __u16 reserved                              :8;
+};
+
+struct ctrl_health_data {
+    __u16 ctlid;
+    struct csts_struct csts;
+    __u16 ctemp;
+    __u8 pdlu;
+    __u8 spare;
+    struct cwarn_struct cwarn;
+    __u8 reserved[7];
+};
+
+struct log_page_error_info
+{
+	uint64_t errcnt;
+	uint16_t subqid;
+	uint16_t cid;
+	uint16_t statusfield;
+	uint8_t perr_loc_byte;
+	uint8_t perr_loc_bit:3;
+	uint8_t perr_loc_res:5;
+	uint64_t lba;
+	uint32_t ns;
+	uint8_t vsinfoavl;
+	uint8_t reserved[35];
+};
+
+struct getf_temp_thres
+{
+	uint16_t tmpth;
+	uint16_t tmpsel:4;
+	uint16_t thsel:2;
+	uint16_t reserved:10;
+};
+
+struct getf_no_queues
+{
+	uint16_t nsqa;
+	uint16_t ncqa;
+};
+
+#endif
diff --git a/plugins/mi/mi-nvme.c b/plugins/mi/mi-nvme.c
new file mode 100644
index 0000000..91ed5c7
--- /dev/null
+++ b/plugins/mi/mi-nvme.c
@@ -0,0 +1,1213 @@
+/*
+ * Copyright (C) 2021 Samsung Electronics Inc. All rights reserved.
+ *
+ * This program is free software; you can redistribute it and/or
+ * modify it under the terms of the GNU General Public License version
+ * 2 as published by the Free Software Foundation.
+ *
+ * This program is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+ * GNU General Public License for more details.
+ *
+ * ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
+ * mi-nvme.c - Implementation of NVMe Management Interface commands in NVMe.
+ * This file contains the MI command implementation for the plugin
+ *
+ * Developer : Mohit Kapoor <mohit.kap@samsung.com>
+ */
+
+#include <fcntl.h>
+#include <errno.h>
+#include <stdio.h>
+#include <stdlib.h>
+#include <unistd.h>
+#include <inttypes.h>
+
+#include "linux/nvme_ioctl.h"
+
+#include "common.h"
+#include "nvme-print.h"
+#include "nvme-ioctl.h"
+#include "json.h"
+#include "plugin.h"
+
+#include "argconfig.h"
+#include "suffix.h"
+
+#define CREATE_CMD
+#include <time.h>
+#include "mi-nvme.h"
+#include "linux/nvme.h"
+#include "mi-nvme-cmd.h"
+#include "util/hal/mi-nvme-hal-main.h"
+
+void cleanup_nvmemi()
+{
+    bool ret = close_device();
+    if (ret == false) {
+        printf("Error : Close device Failed!\n");
+    }
+}
+
+int parse_and_open_nvmemi(int argc, char **argv, const char *desc,
+    const struct argconfig_commandline_options *opts)
+{
+    int ret = 0;
+    ret = argconfig_parse(argc, argv, desc, opts);
+	if (ret < 0) {
+		return ret;
+    }
+
+    printf("Setting Sideband Interface to QEMU MI\n");
+    SetSidebandInterface(qemu_nvme_mi);
+
+    return ret;
+}
+
+void msg_header_nvmemi(struct nvmemi_message_header_struct *str, MI_COMMAND_TYPE cmdtype)
+{
+    if (cmdtype == COMMAND_TYPE_MI) {
+        str->message_type = 4;
+        str->ic = 1;
+        str->csi = 0;
+        str->reserved = 0;
+        str->nmimt = 1;
+        str->ror = 0;
+        str->reserved1 = 0;
+    } else if (cmdtype == COMMAND_TYPE_MI_ADMIN) {
+        str->message_type = 4;
+        str->ic = 1;
+        str->csi = 0;
+        str->reserved = 0;
+        str->nmimt = 2;
+        str->ror = 0;
+        str->reserved1 = 0;
+    }
+}
+
+static int nvmemi_cmd_response(struct nvme_mi_cmd_resp *resp, bool ismgmtresp)
+{
+    if (ismgmtresp) {
+        printf("Get the response message for the executed command\n");
+        getresponsemessage((__u8 *)resp, sizeof(struct nvme_mi_cmd_resp));
+    }
+
+    return 0;
+}
+
+static int nvmemi_readnvmemids(__u16 ctrlid, __u8 portid, __u8 dtyp)
+{
+    int retval = 0;
+    __u32 cdw0 = ctrlid | portid << 16 | dtyp << 24;
+    __u32 cdw1 = 0;
+    struct nvmemi_message_header_struct str;
+
+    msg_header_nvmemi(&str, COMMAND_TYPE_MI);
+
+    struct gencmd_nvmemi cmd = {
+        .msg_header = str,
+        .opcode = nvmemi_cmd_readnvmemids,
+        .reserved0 = 0,
+        .reserved1 = 0,
+        .reserved2 = 0,
+        .cdw0 = cdw0,
+        .cdw1 = cdw1,
+        .buf = NULL,
+        .mic = 0
+    };
+
+    /*Sending Command*/
+    retval = executecommand((__u8 *)&cmd);
+    if (retval == -1) {
+        return retval;
+    }
+
+    /*Checking Response*/
+    struct read_nvme_mi_data_struct_resp readNVMeDS;
+    struct nvme_mi_cmd_resp resp;
+    memset(&readNVMeDS, 0, sizeof(struct read_nvme_mi_data_struct_resp));
+    memset(&resp, 0, sizeof(struct nvme_mi_cmd_resp));
+
+    retval = nvmemi_cmd_response(&resp, true);
+    if (retval == -1) {
+        return retval;
+    }
+
+    /*Copy the Management Response*/
+    uint64_t address = (uint64_t)&resp;
+	memcpy(&readNVMeDS, (void*)(address + 5), sizeof(struct read_nvme_mi_data_struct_resp));
+
+    if (readNVMeDS.resp_data_len == 0) {
+        printf("Response data length is 0 in NVMe Management Response!\n");
+        return -1;
+    }
+
+    __u8 *Respbuffer = (__u8 *)malloc(readNVMeDS.resp_data_len);
+    if (Respbuffer == NULL) {
+        printf("Memory allocation error.\n");
+        return -1;
+    }
+
+    retval = getresponsedata(Respbuffer, readNVMeDS.resp_data_len, true);
+    if (retval == -1) {
+        printf("Error : Failed to get response data for the command!\n");
+        return retval;
+    }
+
+    if (dtyp == 0x0) {
+        struct nvme_subsys_info_data NVMeSubsysInfoDS;
+        memset(&NVMeSubsysInfoDS, 0, sizeof(struct nvme_subsys_info_data));
+        memcpy(&NVMeSubsysInfoDS, Respbuffer, readNVMeDS.resp_data_len);
+
+        printf("NVMe-MI Major Version Number = %u\n", NVMeSubsysInfoDS.mjr);
+        printf("NVMe-MI Minor Version Number = %u\n", NVMeSubsysInfoDS.mnr);
+        printf("Number of Ports = %u\n", NVMeSubsysInfoDS.nump);
+    } else if (dtyp == 0x4) {
+        struct option_sup_cmd_list_struct opCommandList;
+        memset(&opCommandList, 0 , sizeof(struct option_sup_cmd_list_struct));
+        memcpy(&opCommandList, Respbuffer, readNVMeDS.resp_data_len);
+
+        printf("Number of commands = %u\n", opCommandList.numcmd);
+    }
+
+    if (Respbuffer != NULL) {
+        free(Respbuffer);
+        Respbuffer = NULL;
+    }
+
+    return retval;
+}
+
+static int readnvmemids(int argc, char **argv, struct command *cmd, struct plugin *plugin)
+{
+    const char *desc = "Read NVMe MI Data Structure";
+    const char *ctrlid = "Controller Identifier";
+    const char *portid = "Port Identifier";
+    const char *dtyp = "Data Structure Type";
+
+    int retval;
+    int err = -1;
+
+    struct config {
+        __u16 ctrlid;
+        __u8 portid;
+        __u8 dtyp;
+    };
+
+    struct config cfg;
+
+    OPT_ARGS(opts) = {
+        OPT_SHRT("ctrlid", 'c', &cfg.ctrlid, ctrlid),
+        OPT_BYTE("portid", 'p', &cfg.portid, portid),
+        OPT_BYTE("dtyp", 'd', &cfg.dtyp, dtyp),
+        OPT_END()
+    };
+
+    retval = parse_and_open_nvmemi(argc, argv, desc, opts);
+    if (retval < 0) {
+        printf("parse_and_open_nvmemi failed!\n");
+        return errno;
+    }
+
+    printf("Issuing readnvmemids Command, ctrlid:%"PRIx16" portid:%d dtyp:%d\n",
+            (uint16_t)cfg.ctrlid, cfg.portid, cfg.dtyp);
+    err = nvmemi_readnvmemids(cfg.ctrlid, cfg.portid, cfg.dtyp);
+    if (!err) {
+        printf("readnvmemids: Success\n");
+    } else if (err > 0) {
+        printf("readnvmemids: Fail, ctrlid:%"PRIx16" portid:%d dtyp:%d\n",
+            (uint16_t)cfg.ctrlid, cfg.portid, cfg.dtyp);
+    }
+
+    cleanup_nvmemi();
+    return err;
+}
+
+static int nvmemi_shspoll(__u8 cs)
+{
+    int retval = 0;
+    __u32 Reserved = 0;
+    __u32 cdw0 = Reserved | cs << 31;
+
+    struct nvmemi_message_header_struct str;
+
+    msg_header_nvmemi(&str, COMMAND_TYPE_MI);
+
+    struct gencmd_nvmemi cmd = {
+        .msg_header = str,
+        .opcode = nvmemi_cmd_subsyshealthstpoll,
+        .reserved0 = 0,
+        .reserved1 = 0,
+        .reserved2 = 0,
+        .cdw0 = cdw0,
+        .cdw1 = 0,
+        .buf = NULL,
+        .mic = 0
+    };
+
+    /*Sending Command*/
+    retval = executecommand((__u8 *)&cmd);
+    if (retval == -1) {
+        return retval;
+    }
+
+    /*Checking Response*/
+    struct nvm_subsys_health_struct subsysStruct;
+    memset(&subsysStruct, 0, sizeof(struct nvm_subsys_health_struct));
+    uint16_t sizetocopy = sizeof(struct nvm_subsys_health_struct);
+
+    __u8 *Respbuffer = (__u8 *)malloc(sizetocopy);
+
+    if (Respbuffer == NULL) {
+        printf("Memory allocation error.\n");
+        return -1;
+    }
+
+    retval = getresponsedata(Respbuffer, sizetocopy, true);
+    if (retval == -1) {
+        printf("Error : Failed to get response data for the command!\n");
+        return retval;
+    }
+
+    memcpy(&subsysStruct, Respbuffer, sizetocopy);
+
+    printf("**********COMMAND RESPONSE START**********\n");
+    printf("SMART Warnings = %u\n", subsysStruct.smart_warnings);
+    printf("Composite Temprature = %u\n", subsysStruct.composite_temp);
+    printf("Percentage Drive Life Used = %u\n", subsysStruct.per_drv_life_used);
+    printf("**********COMMAND RESPONSE END**********\n");
+
+    if (Respbuffer != NULL) {
+        free(Respbuffer);
+        Respbuffer = NULL;
+    }
+
+    return retval;
+}
+
+static int shspoll(int argc, char **argv, struct command *cmd, struct plugin *plugin)
+{
+    const char *desc = "NVM Subsystem Health Status Poll";
+    const char *cs = "Clear Status";
+
+    int retval;
+    int err = -1;
+
+    struct config {
+        __u8 cs;
+    };
+
+    struct config cfg;
+
+    OPT_ARGS(opts) = {
+        OPT_SHRT("cs", 'c', &cfg.cs, cs),
+        OPT_END()
+    };
+
+    retval = parse_and_open_nvmemi(argc, argv, desc, opts);
+    if (retval < 0) {
+        printf("parse_and_open_nvmemi failed!\n");
+        return errno;
+    }
+
+    printf("Issuing Subsystem Health Status Poll Command, cs:%"PRIx8"\n",
+            (uint8_t)cfg.cs);
+    err = nvmemi_shspoll(cfg.cs);
+    if (!err) {
+        printf("NVM Subsystem Health Status Poll: Success\n");
+    } else if (err > 0) {
+        printf("NVM Subsystem Health Status Poll Fail, ctrlid:%"PRIx8"\n",
+            (uint8_t)cfg.cs);
+    }
+
+    cleanup_nvmemi();
+    return err;
+}
+
+static int nvmemi_chspoll(__u32 cdw0, __u32 cdw1)
+{
+    int retval = 0;
+    struct nvmemi_message_header_struct str;
+    msg_header_nvmemi(&str, COMMAND_TYPE_MI);
+
+    struct gencmd_nvmemi cmd = {
+        .msg_header = str,
+        .opcode = nvmemi_cmd_chsp,
+        .reserved0 = 0,
+        .reserved1 = 0,
+        .reserved2 = 0,
+        .cdw0 = cdw0,
+        .cdw1 = cdw1,
+        .buf = NULL,
+        .mic = 0
+    };
+
+    /*Sending Command*/
+    retval = executecommand((__u8 *)&cmd);
+    if (retval == -1) {
+        return retval;
+    }
+
+    /*Checking Response*/
+    struct ctrl_health_status_poll_resp mgmtresp;
+    struct nvme_mi_cmd_resp resp;
+    memset(&mgmtresp, 0, sizeof(struct ctrl_health_status_poll_resp));
+    memset(&resp, 0, sizeof(struct nvme_mi_cmd_resp));
+
+    retval = nvmemi_cmd_response(&resp, true);
+    if (retval == -1) {
+        return retval;
+    }
+
+    /*Copy the Management Response*/
+    uint64_t address = (uint64_t)&resp;
+	memcpy(&mgmtresp, (void*)(address + 5), sizeof(struct ctrl_health_status_poll_resp));
+    //memcpy((void *)&mgmtresp, (void *)&resp.nvme_mgmt_response , sizeof(struct ctrl_health_status_poll_resp));
+
+    if (mgmtresp.rent == 0) {
+        printf("The number of Response Entries is zero!\n");
+        return -1;
+    }
+
+    __u8 *Respbuffer = (__u8 *)malloc(mgmtresp.rent * sizeof(struct ctrl_health_data));
+    if (Respbuffer == NULL) {
+        printf("Memory allocation error.\n");
+        return -1;
+    }
+
+    retval = getresponsedata(Respbuffer, mgmtresp.rent * sizeof(struct ctrl_health_data), true);
+    if (retval == -1) {
+        printf("Error : Failed to get response data for the command!\n");
+        return retval;
+    }
+
+    struct ctrl_health_data chds;
+    memset(&chds, 0, sizeof(struct ctrl_health_data));
+    memcpy(&chds, Respbuffer, sizeof(struct ctrl_health_data));
+
+    printf("Controller Identifier = %u\n", chds.ctlid);
+    printf("Composite Temprature = %u\n", chds.ctemp);
+    printf("Percentage Used = %u\n", chds.pdlu);
+    printf("Available Space = %u\n", chds.spare);
+
+    if (Respbuffer != NULL) {
+        free(Respbuffer);
+        Respbuffer = NULL;
+    }
+
+    return retval;
+}
+
+static int chspoll(int argc, char **argv, struct command *cmd, struct plugin *plugin)
+{
+    const char *desc = "NVM Controller Health Status Poll";
+    const char *cdw0 = "Command DWORD0 Value";
+    const char *cdw1 = "Command DWORD1 Value";
+
+    int retval;
+    int err = -1;
+
+    struct config {
+        __u32 cdw0;
+        __u32 cdw1;
+    };
+
+    struct config cfg;
+
+    OPT_ARGS(opts) = {
+        OPT_SHRT("cdw0", 'c', &cfg.cdw0, cdw0),
+        OPT_SHRT("cdw1", 'd', &cfg.cdw1, cdw1),
+        OPT_END()
+    };
+
+    retval = parse_and_open_nvmemi(argc, argv, desc, opts);
+    if (retval < 0) {
+        printf("parse_and_open_nvmemi failed!\n");
+        return errno;
+    }
+
+    printf("Issuing Controller Health Status Poll Command, cdw0 : \
+         %"PRIx32" cdw1 : %"PRIx32"\n", cfg.cdw0, cfg.cdw1);
+
+    err = nvmemi_chspoll(cfg.cdw0, cfg.cdw1);
+    if (!err) {
+        printf("Controller Health Status Poll: Success\n");
+    } else if (err > 0) {
+        printf("Controller Health Status Poll Failed!\n");
+    }
+
+    cleanup_nvmemi();
+    return err;
+}
+
+static int nvmemi_configget(__u8 configid, __u8 portid)
+{
+    int retval = 0;
+    __u32 cdw0 = configid | portid << 24;
+    __u32 cdw1 = 0;
+    struct nvmemi_message_header_struct str;
+
+    msg_header_nvmemi(&str, COMMAND_TYPE_MI);
+
+    struct gencmd_nvmemi cmd = {
+        .msg_header = str,
+        .opcode = nvmemi_cmd_configurationget,
+        .reserved0 = 0,
+        .reserved1 = 0,
+        .reserved2 = 0,
+        .cdw0 = cdw0,
+        .cdw1 = cdw1,
+        .buf = NULL,
+        .mic = 0
+    };
+
+    /*Sending Command*/
+    retval = executecommand((__u8 *)&cmd);
+    if (retval == -1) {
+        return retval;
+    }
+
+    /*Checking Response*/
+    struct nvme_mi_cmd_resp resp;
+    memset(&resp, 0, sizeof(struct nvme_mi_cmd_resp));
+
+    retval = nvmemi_cmd_response(&resp, true);
+    if (retval == -1) {
+        return retval;
+    }
+
+
+    uint64_t address = (uint64_t)&resp;
+
+    if (configid == SMBUS_I2C_FREQ) {
+        struct smbus_i2c_freq_cfgget_resp mgmt_resp;
+        memset(&mgmt_resp, 0, sizeof(struct smbus_i2c_freq_cfgget_resp));
+        memcpy(&mgmt_resp, (void *)(address + 5), sizeof(struct smbus_i2c_freq_cfgget_resp));
+        printf("SMBus frequency:%d\n", mgmt_resp.smbus_i2c_freq);
+    } else if (configid == MCTP_TRANS_UNIT_SIZE) {
+        struct mctp_tus_cfgget_resp mgmt_resp;
+        memset(&mgmt_resp, 0, sizeof(struct mctp_tus_cfgget_resp));
+        memcpy(&mgmt_resp, (void *)(address + 5), sizeof(struct mctp_tus_cfgget_resp));
+        printf("MCTP Transmission unit size:%d\n" , mgmt_resp.mctp_trans_unit_size);
+    }
+
+    cleanup_nvmemi();
+    return retval;
+}
+
+static int configget(int argc, char **argv, struct command *cmd, struct plugin *plugin)
+{
+    const char *desc = "Configuration Get";
+    const char *configid = "Configuration Identifier";
+    const char *portid = "Port Identifier";
+
+    int retval;
+    int err = -1;
+
+    struct config {
+        __u8 configid;
+        __u8 portid;
+    };
+
+    struct config cfg;
+
+    OPT_ARGS(opts) = {
+        OPT_BYTE("configid", 'c', &cfg.configid, configid),
+        OPT_BYTE("portid", 'p', &cfg.portid, portid),
+        OPT_END()
+    };
+
+    retval = parse_and_open_nvmemi(argc, argv, desc, opts);
+    if (retval < 0) {
+        printf("parse_and_open_nvmemi failed!\n");
+        return errno;
+    }
+
+    printf("Issuing Configuration Get  Command, configid:%d\t portid:%d\n",
+            cfg.configid, cfg.portid);
+    err = nvmemi_configget(cfg.configid, cfg.portid);
+    return err;
+}
+
+static int nvmemi_configset(__u8 configid, __u8 portid, __u8 smbusfreq, __u16 mctpunitsz)
+{
+    int retval = 0;
+    __u32 cdw0 = 0;
+    __u32 cdw1 = 0;
+
+    if (configid == SMBUS_I2C_FREQ) {
+        cdw0 = configid | smbusfreq << 8 | portid << 24;
+        cdw1 = 0;
+    } else if (configid == MCTP_TRANS_UNIT_SIZE) {
+        cdw0 = configid | portid << 24;
+        cdw1 = mctpunitsz;
+    }
+
+    struct nvmemi_message_header_struct str;
+
+    msg_header_nvmemi(&str, COMMAND_TYPE_MI);
+
+    struct gencmd_nvmemi cmd = {
+        .msg_header = str,
+        .opcode = nvmemi_cmd_configurationset,
+        .reserved0 = 0,
+        .reserved1 = 0,
+        .reserved2 = 0,
+        .cdw0 = cdw0,
+        .cdw1 = cdw1,
+        .buf = NULL,
+        .mic = 0
+    };
+
+    /*Sending Command*/
+    retval = executecommand((__u8 *)&cmd);
+    if (retval == -1) {
+        return retval;
+    }
+
+    /*Checking Response*/
+    struct nvme_mi_cmd_resp resp;
+    memset(&resp, 0, sizeof(struct nvme_mi_cmd_resp));
+
+    retval = nvmemi_cmd_response(&resp, false);
+    if (retval == -1) {
+        return retval;
+    }
+
+    cleanup_nvmemi();
+    return retval;
+}
+
+static int configset(int argc, char **argv, struct command *cmd, struct plugin *plugin)
+{
+    const char *desc = "Configuration Set";
+    const char *configid = "Configuration Identifier";
+    const char *portid = "Port Identifier";
+    const char *smbusfreq = "SMBus I2C frequency";
+    const char *mctpunitsz = "MCTP Transmission Unit Size";
+
+    int retval;
+    int err = -1;
+
+    struct config {
+        __u8 configid;
+        __u8 portid;
+        __u8 smbusfreq;
+        __u16 mctpunitsz;
+    };
+
+    struct config cfg;
+
+    OPT_ARGS(opts) = {
+        OPT_BYTE("configid", 'c', &cfg.configid, configid),
+        OPT_BYTE("portid", 'p', &cfg.portid, portid),
+        OPT_BYTE("smbusfreq", 'f', &cfg.smbusfreq, smbusfreq),
+        OPT_BYTE("mctpunitsz", 's', &cfg.mctpunitsz, mctpunitsz),
+        OPT_END()
+    };
+
+    retval = parse_and_open_nvmemi(argc, argv, desc, opts);
+    if (retval < 0) {
+        printf("parse_and_open_nvmemi failed!\n");
+        return errno;
+    }
+
+    printf("Issuing Configuration Set Command, configid:%d portid:%d smbusfreq:%d mctpunitsz:%d\n",
+            cfg.configid, cfg.portid, cfg.smbusfreq, cfg.mctpunitsz);
+    err = nvmemi_configset(cfg.configid, cfg.portid, cfg.smbusfreq, cfg.mctpunitsz);
+    return err;
+}
+
+static int nvmemi_vpdread(__u16 dofst, __u16 dlen, char *file)
+{
+    int retval = 0;
+    __u32 cdw0 = dofst;
+    __u32 cdw1 = dlen;
+
+    struct nvmemi_message_header_struct str;
+
+    msg_header_nvmemi(&str, COMMAND_TYPE_MI);
+
+    struct gencmd_nvmemi cmd = {
+        .msg_header = str,
+        .opcode = nvmemi_cmd_vpdread,
+        .reserved0 = 0,
+        .reserved1 = 0,
+        .reserved2 = 0,
+        .cdw0 = cdw0,
+        .cdw1 = cdw1,
+        .buf = NULL,
+        .mic = 0
+    };
+
+    /*Sending Command*/
+    retval = executecommand((__u8 *)&cmd);
+    if (retval == -1) {
+        return retval;
+    }
+
+    /*Checking Response*/
+    struct nvme_mi_cmd_resp resp;
+    memset(&resp, 0, sizeof(struct nvme_mi_cmd_resp));
+
+    retval = nvmemi_cmd_response(&resp, false);
+    if (retval == -1) {
+        return retval;
+    }
+
+    int dfd = -1;
+    int opcode = 2;
+    int flags = opcode & 1 ? O_RDONLY : O_WRONLY | O_CREAT;
+    int mode = S_IRUSR | S_IWUSR | S_IRGRP | S_IWGRP | S_IROTH;
+    uint64_t address = (uint64_t)&resp;
+
+    if (strlen(file)) {
+        dfd = open(file, flags, mode);
+        if (dfd < 0) {
+            printf("Failed to open the file\n");
+        } else {
+            printf("Open successful\n");
+        }
+    }
+
+    int sz = write(dfd, (void *)(address + 8), dlen);
+    if (sz < 0) {
+        printf("Failed to write\n");
+    }
+
+    cleanup_nvmemi();
+    return retval;
+}
+
+static int vpdread(int argc, char **argv, struct command *cmd, struct plugin *plugin)
+{
+    const char *desc = "VPD Read";
+    const char *dofst = "Data Offset";
+    const char *dlen = "Data Length";
+    const char *data = "Response Data";
+
+    int retval;
+    int err = -1;
+
+    struct config {
+        __u16 dofst;
+        __u16 dlen;
+        char *data;
+    };
+
+    struct config cfg;
+
+    OPT_ARGS(opts) = {
+        OPT_SHRT("dofst", 'o', &cfg.dofst, dofst),
+        OPT_SHRT("dlen", 'l', &cfg.dlen, dlen),
+        OPT_FILE("data", 'd', &cfg.data, data),
+        OPT_END()
+    };
+
+    retval = parse_and_open_nvmemi(argc, argv, desc, opts);
+    if (retval < 0) {
+        printf("parse_and_open_nvmemi failed!\n");
+        return errno;
+    }
+
+    printf("Issuing VPD Read Command, dofst:%d\t dlen:%d\n",
+            cfg.dofst, cfg.dlen);
+    err = nvmemi_vpdread(cfg.dofst, cfg.dlen, cfg.data);
+    return err;
+}
+
+static int nvmemi_vpdwrite(__u16 dofst, __u16 dlen, char *req_data)
+{
+    int retval = 0;
+    __u32 cdw0 = dofst;
+    __u32 cdw1 = dlen;
+
+    struct nvmemi_message_header_struct str;
+
+    msg_header_nvmemi(&str, COMMAND_TYPE_MI);
+
+    struct gencmd_nvmemi cmd = {
+        .msg_header = str,
+        .opcode = nvmemi_cmd_vpdread,
+        .reserved0 = 0,
+        .reserved1 = 0,
+        .reserved2 = 0,
+        .cdw0 = cdw0,
+        .cdw1 = cdw1,
+        .buf = (uint8_t *)req_data,
+        .mic = 0
+    };
+
+    /*Sending Command*/
+    retval = executecommand((__u8 *)&cmd);
+    if (retval == -1) {
+        return retval;
+    }
+
+    /*Checking Response*/
+    struct nvme_mi_cmd_resp resp;
+    memset(&resp, 0, sizeof(struct nvme_mi_cmd_resp));
+
+    retval = nvmemi_cmd_response(&resp, false);
+    if (retval == -1) {
+        return retval;
+    }
+
+    cleanup_nvmemi();
+    return retval;
+}
+
+static int vpdwrite(int argc, char **argv, struct command *cmd, struct plugin *plugin)
+{
+    const char *desc = "VPD Write";
+    const char *dofst = "Data Offset";
+    const char *dlen = "Data Length";
+    const char *data = "Request Data";
+
+    int retval;
+    int err = -1;
+    int dfd = -1;
+    int opcode = 1;
+    int flags = opcode & 1 ? O_RDONLY : O_WRONLY | O_CREAT;
+    int mode = S_IRUSR | S_IWUSR | S_IRGRP | S_IWGRP | S_IROTH;
+
+    struct config {
+        __u16 dofst;
+        __u16 dlen;
+        char *data;
+    };
+
+    struct config cfg = {
+        .data = "",
+    };
+
+    OPT_ARGS(opts) = {
+        OPT_SHRT("dofst", 'o', &cfg.dofst, dofst),
+        OPT_SHRT("dlen", 'l', &cfg.dlen, dlen),
+        OPT_FILE("data", 'd', &cfg.data, data),
+        OPT_END()
+    };
+
+    retval = parse_and_open_nvmemi(argc, argv, desc, opts);
+    if (retval < 0) {
+        printf("parse_and_open_nvmemi failed!\n");
+        return errno;
+    }
+
+    if (strlen(cfg.data)) {
+        dfd = open(cfg.data, flags, mode);
+        if (dfd < 0) {
+            printf("Failed to open the file\n");
+        } else {
+            printf("Open successful\n");
+        }
+    }
+    char req_data[cfg.dlen];
+    int sz = read(dfd, req_data, cfg.dlen);
+    if (sz < 0) {
+        printf("Failed to read\n");
+    }
+    printf("Issuing VPD Write Command, dofst:%d\t dlen:%d\n", cfg.dofst, cfg.dlen);
+    err = nvmemi_vpdwrite(cfg.dofst, cfg.dlen, req_data);
+    return err;
+}
+
+static int nvmemi_id(__u8 cns, __u16 cntid)
+{
+    __u32 data_len = 0;
+    int retval = 0;
+    __u32 cdw10 = 0;
+    cdw10 = cns | cntid << 16;
+
+    struct nvmemi_message_header_struct str;
+    msg_header_nvmemi(&str, COMMAND_TYPE_MI_ADMIN);
+
+    if (cns == NVME_ID_CNS_NS) {
+        data_len = sizeof(struct nvme_id_ns);
+    } else if (cns == NVME_ID_CNS_CTRL) {
+        data_len = sizeof(struct nvme_id_ctrl);
+    }
+
+    struct gencmd_nvmemi_admin cmd = {
+        .msg_header = str,
+        .opcode = nvme_admin_identify,
+        .cflgs = 0x3,
+        .ctlid = 0,
+        .nsid = 0,
+        .cdw2 = 0,
+        .cdw3 = 0,
+        .cdw4 = 0,
+        .cdw5 = 0,
+        .dofst = 0,
+        .dlen = data_len,
+        .cdw8 = 0,
+        .cdw9 = 0,
+        .cdw10 = cdw10,
+        .cdw11 = 0,
+        .cdw12 = 0,
+		.cdw13 = 0,
+		.cdw14 = 0,
+        .cdw15 = 0,
+        .buf = NULL,
+        .mic = 0
+    };
+
+    /*Sending Command*/
+    retval = executecommand((__u8 *)&cmd);
+    if (retval == -1) {
+        return retval;
+    }
+
+    /*Checking Response*/
+    retval = nvmemi_cmd_response(NULL, false);
+    if (retval == -1) {
+        return retval;
+    }
+
+    __u8 *Respbuffer = (__u8 *)malloc(data_len);
+    if (Respbuffer == NULL) {
+        printf("Memory allocation error.\n");
+        return -1;
+    }
+    memset(Respbuffer, 0, data_len);
+
+    retval = getresponsedata(Respbuffer, data_len, false);
+    if (retval == -1) {
+        printf("Error : Failed to get response data for the command!\n");
+        return retval;
+    }
+
+    if (cns == NVME_ID_CNS_NS) {
+        struct nvme_id_ns idns;
+        memset(&idns, 0, sizeof(struct nvme_id_ns));
+        memcpy(&idns, Respbuffer, sizeof(struct nvme_id_ns));
+        nvme_show_id_ns(&idns, 0, 0);
+    } else if (cns == NVME_ID_CNS_CTRL) {
+        struct nvme_id_ctrl idctrl;
+        memset(&idctrl, 0, sizeof(struct nvme_id_ctrl));
+        memcpy(&idctrl, Respbuffer, sizeof(struct nvme_id_ctrl));
+        nvme_show_id_ctrl(&idctrl, 0);
+    }
+
+    if (Respbuffer != NULL) {
+        free(Respbuffer);
+        Respbuffer = NULL;
+    }
+
+    return retval;
+}
+
+static int identify(int argc, char **argv, struct command *cmd, struct plugin *plugin)
+{
+    const char *desc = "Identify Command";
+    char *cns = "Controller or Namespace Structure";
+    const char *cntid = "Controller Identifier";
+
+    struct config {
+        __u8 cns;
+        __u16 cntid;
+    };
+    struct config cfg;
+
+    OPT_ARGS(opts) = {
+        OPT_SHRT("cns", 'c', &cfg.cns, cns),
+        OPT_BYTE("cntid", 'C', &cfg.cntid, cntid),
+        OPT_END()
+    };
+
+    int retval = -1;
+    retval = parse_and_open_nvmemi(argc, argv, desc, opts);
+    if (retval < 0) {
+        printf("parse_and_open_nvmemi failed!\n");
+        return errno;
+    }
+
+    printf("Issuing Identify Command, \
+        cns:%"PRIx8" cntid:%"PRIx16" \n", cfg.cns, cfg.cntid);
+
+    retval = nvmemi_id(cfg.cns, cfg.cntid);
+    if (!retval) {
+        printf("identify: Success\n");
+    } else if (retval > 0) {
+        printf("identify: Failed\n");
+    }
+
+    cleanup_nvmemi();
+    return retval;
+}
+
+static int nvmemi_getlog(__u8 log_id, __u8 lsp, __u64 lpo,
+                 __u16 lsi, bool rae, __u8 uuid_ix, __u32 data_len)
+{
+    __u32 numd = (data_len >> 2) - 1;
+	__u16 numdu = numd >> 16, numdl = numd & 0xffff;
+	__u32 cdw10 = log_id | (numdl << 16) | (rae ? 1 << 15 : 0) | lsp << 8;
+    int retval = 0;
+
+    struct nvmemi_message_header_struct str;
+    msg_header_nvmemi(&str, COMMAND_TYPE_MI_ADMIN);
+
+    struct gencmd_nvmemi_admin cmd = {
+        .msg_header = str,
+        .opcode = nvme_admin_get_log_page,
+        .cflgs = 0x3,
+        .ctlid = 0,
+        .nsid = 0,
+        .cdw2 = 0,
+        .cdw3 = 0,
+        .cdw4 = 0,
+        .cdw5 = 0,
+        .dofst = 0,
+        .dlen = data_len,
+        .cdw8 = 0,
+        .cdw9 = 0,
+        .cdw10 = cdw10,
+        .cdw11 = numdu | (lsi << 16),
+        .cdw12 = lpo & 0xffffffff,
+		.cdw13 = lpo >> 32,
+		.cdw14 = uuid_ix,
+        .cdw15 = 0,
+        .buf = NULL,
+        .mic = 0
+    };
+
+    /*Sending Command*/
+    retval = executecommand((__u8 *)&cmd);
+    if (retval == -1) {
+        return retval;
+    }
+
+    /*Checking Response*/
+    retval = nvmemi_cmd_response(NULL, false);
+    if (retval == -1) {
+        return retval;
+    }
+
+    __u8 *Respbuffer = (__u8 *)malloc(data_len);
+    if (Respbuffer == NULL) {
+        printf("Memory allocation error.\n");
+        return -1;
+    }
+
+    retval = getresponsedata(Respbuffer, data_len, false);
+    if (retval == -1) {
+        printf("Error : Failed to get response data for the command!\n");
+        return retval;
+    }
+
+    printf("sizeof logpage error info : 0x%lx\n", sizeof(struct log_page_error_info));
+    if (log_id == 0x1) {
+        struct log_page_error_info resp;
+        memset(&resp, 0, sizeof(struct log_page_error_info));
+        memcpy(&resp, Respbuffer, sizeof(struct log_page_error_info));
+        printf("Error Count = %"PRIx64"\n", resp.errcnt);
+        printf("Submission Queue ID = %"PRIx16"\n", resp.subqid);
+        printf("Command ID = %"PRIx16"\n", resp.cid);
+        printf("Status Field = %"PRIx16"\n", resp.cid);
+        printf("LBA = %"PRIx64"\n", resp.lba);
+        printf("Namespace = %"PRIx32"\n", resp.ns);
+        printf("Vendor Specific Information Available = %"PRIx8"\n", resp.ns);
+    }
+
+    if (Respbuffer != NULL) {
+        free(Respbuffer);
+        Respbuffer = NULL;
+    }
+
+    return retval;
+}
+
+static int getlog(int argc, char **argv, struct command *cmd, struct plugin *plugin)
+{
+    const char *desc = "NVMe Get Log Page command via Sideband";
+	const char *log_id = "identifier of log to retrieve";
+	const char *log_len = "how many bytes to retrieve";
+	const char *lsp = "log specific field";
+	const char *lpo = "log page offset specifies the location within a log page from where to start returning data";
+	const char *rae = "retain an asynchronous event";
+	const char *uuid_index = "UUID index";
+	int retval = 0;
+
+	struct config {
+		__u8  log_id;
+		__u32 log_len;
+		__u64 lpo;
+		__u8  lsp;
+		__u8  uuid_index;
+		int   rae;
+	};
+
+	struct config cfg = {
+		.log_id       = 0xff,
+		.log_len      = 0,
+		.lpo          = NVME_NO_LOG_LPO,
+		.lsp          = NVME_NO_LOG_LSP,
+		.rae          = 0,
+		.uuid_index   = 0,
+	};
+
+	OPT_ARGS(opts) = {
+		OPT_UINT("log-id",       'i', &cfg.log_id,       log_id),
+		OPT_UINT("log-len",      'l', &cfg.log_len,      log_len),
+		OPT_LONG("lpo",          'o', &cfg.lpo,          lpo),
+		OPT_BYTE("lsp",          's', &cfg.lsp,          lsp),
+		OPT_FLAG("rae",          'r', &cfg.rae,          rae),
+		OPT_BYTE("uuid-index",   'U', &cfg.uuid_index,   uuid_index),
+		OPT_END()
+	};
+
+    retval = parse_and_open_nvmemi(argc, argv, desc, opts);
+    if (retval < 0) {
+        printf("parse_and_open_nvmemi failed!\n");
+        return errno;
+    }
+
+    retval = nvmemi_getlog(cfg.log_id,
+				     cfg.lsp, cfg.lpo, 0, cfg.rae,
+				     cfg.uuid_index, cfg.log_len);
+    if (!retval) {
+        printf("Get Log Page: Success\n");
+    } else if (retval > 0) {
+        printf("Get Log Page: Failed\n");
+    }
+
+    cleanup_nvmemi();
+    return retval;
+}
+
+static int nvmemi_getfeature(__u8 fid, __u8 sel, __u32 cdw11,
+		     __u32 data_len)
+{
+	__u32 cdw10 = fid | sel << 8;
+    int retval = 0;
+
+    struct nvmemi_message_header_struct str;
+    msg_header_nvmemi(&str, COMMAND_TYPE_MI_ADMIN);
+
+    struct gencmd_nvmemi_admin cmd = {
+        .msg_header = str,
+        .opcode = nvme_admin_get_features,
+        .cflgs = 0x3,
+        .ctlid = 0,
+        .nsid = 0,
+        .cdw2 = 0,
+        .cdw3 = 0,
+        .cdw4 = 0,
+        .cdw5 = 0,
+        .dofst = 0,
+        .dlen = data_len,
+        .cdw8 = 0,
+        .cdw9 = 0,
+        .cdw10 = cdw10,
+        .cdw11 = cdw11,
+        .cdw12 = 0,
+		.cdw13 = 0,
+		.cdw14 = 0,
+        .cdw15 = 0,
+        .buf = NULL,
+        .mic = 0
+    };
+
+    /*Sending Command*/
+    retval = executecommand((__u8 *)&cmd);
+    if (retval == -1) {
+        return retval;
+    }
+
+    /*Checking Response*/
+    retval = nvmemi_cmd_response(NULL, false);
+    if (retval == -1) {
+        return retval;
+    }
+
+    __u8 *Respbuffer = (__u8 *)malloc(data_len);
+    if (Respbuffer == NULL) {
+        printf("Memory allocation error.\n");
+        return -1;
+    }
+
+    retval = getresponsedata(Respbuffer, data_len, false);
+    if (retval == -1) {
+        printf("Error : Failed to get response data for the command!\n");
+        return retval;
+    }
+
+    if (fid == NVME_FEAT_TEMP_THRESH) {
+        struct getf_temp_thres resp;
+        memset(&resp, 0, sizeof(struct getf_temp_thres));
+        memcpy(&resp, Respbuffer, sizeof(struct getf_temp_thres));
+        printf("Temprature Threshold = %"PRIx16"\n", resp.tmpth);
+        printf("Threshold Temprature Select = %"PRIx16"\n", resp.tmpsel);
+        printf("Threshold Type Select = %"PRIx16"\n", resp.thsel);
+    } else if (fid == NVME_FEAT_NUM_QUEUES) {
+        struct getf_no_queues resp;
+        memset(&resp, 0, sizeof(struct getf_no_queues));
+        memcpy(&resp, Respbuffer, sizeof(struct getf_no_queues));
+        printf("Number of I/O Submission Queues Requested = \
+        %"PRIx16"\n", resp.nsqa);
+        printf("Number of I/O Completion Queues Requested = \
+        %"PRIx16"\n", resp.ncqa);
+    }
+
+    if (Respbuffer != NULL) {
+        free(Respbuffer);
+        Respbuffer = NULL;
+    }
+
+    return retval;
+}
+
+static int getfeature(int argc, char **argv, struct command *cmd, struct plugin *plugin)
+{
+    const char *desc = "NVMe Get Features Command via Sideband Interface.";
+	const char *namespace_id = "identifier of desired namespace";
+	const char *feature_id = "feature identifier";
+	const char *sel = "[0-3]: current/default/saved/supported";
+	const char *data_len = "buffer len if data is returned through host memory buffer";
+	const char *cdw11 = "dword 11 for interrupt vector config";
+
+	int retval = 0;
+
+	struct config {
+		__u32 namespace_id;
+		__u8  feature_id;
+		__u8  sel;
+		__u32 cdw11;
+		__u32 data_len;
+	};
+
+	struct config cfg = {
+		.namespace_id = 0,
+		.feature_id   = 0,
+		.sel          = 0,
+		.cdw11        = 0,
+		.data_len     = 0,
+	};
+
+	OPT_ARGS(opts) = {
+		OPT_UINT("namespace-id",  'n', &cfg.namespace_id,   namespace_id),
+		OPT_UINT("feature-id",    'f', &cfg.feature_id,     feature_id),
+		OPT_BYTE("sel",           's', &cfg.sel,            sel),
+		OPT_UINT("data-len",      'l', &cfg.data_len,       data_len),
+		OPT_UINT("cdw11",         'c', &cfg.cdw11,          cdw11),
+		OPT_END()
+	};
+
+    retval = parse_and_open_nvmemi(argc, argv, desc, opts);
+    if (retval < 0) {
+        printf("parse_and_open_nvmemi failed!\n");
+        return errno;
+    }
+
+    retval = nvmemi_getfeature(cfg.feature_id,
+				     cfg.sel, cfg.cdw11, cfg.data_len);
+    if (!retval) {
+        printf("Get Log Page: Success\n");
+    } else if (retval > 0) {
+        printf("Get Log Page: Failed\n");
+    }
+
+    cleanup_nvmemi();
+    return retval;
+}
\ No newline at end of file
diff --git a/plugins/mi/mi-nvme.h b/plugins/mi/mi-nvme.h
new file mode 100644
index 0000000..3fa9285
--- /dev/null
+++ b/plugins/mi/mi-nvme.h
@@ -0,0 +1,44 @@
+/*
+ * Copyright (C) 2021 Samsung Electronics Inc. All rights reserved.
+ *
+ * This program is free software; you can redistribute it and/or
+ * modify it under the terms of the GNU General Public License version
+ * 2 as published by the Free Software Foundation.
+ *
+ * This program is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+ * GNU General Public License for more details.
+ *
+ * ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
+ * mi-nvme.h - Implementation of NVMe Management Interface commands in Nvme
+ *
+ * Developer : Mohit Kapoor <mohit.kap@samsung.com>
+ */
+
+#undef CMD_INC_FILE
+#define CMD_INC_FILE plugins/mi/mi-nvme
+
+#if !defined(MI) || defined(CMD_HEADER_MULTI_READ)
+#define MI
+
+#include "cmd.h"
+
+PLUGIN(NAME("mi", "NVMe Management Interface Specific Extention"),
+    COMMAND_LIST(
+        ENTRY("readnvmemids", "nvme-mi : Read NVMe-MI Data Structure", readnvmemids)
+        ENTRY("shspoll", "nvme-mi : NVM Subsystem Health Status Poll", shspoll)
+        ENTRY("chspoll", "nvme-mi : Controller Health Status Poll", chspoll)
+        ENTRY("configget", "nvme-mi : Configuration Get", configget)
+        ENTRY("configset", "nvme-mi : Configuration Set", configset)
+        ENTRY("vpdread", "nvme-mi : VPD Read", vpdread)
+        ENTRY("vpdwrite", "nvme-mi : VPD Write", vpdwrite)
+        ENTRY("identify", "nvme-mi-admin : Identify", identify)
+        ENTRY("getlogpage", "nvme-mi-admin : Get Log Page", getlog)
+        ENTRY("getfeatures", "nvme-mi-admin : Get Features", getfeature)
+    )
+);
+
+#endif
+
+#include "define_cmd.h"
diff --git a/plugins/mi/util/hal/mi-nvme-hal-main.c b/plugins/mi/util/hal/mi-nvme-hal-main.c
new file mode 100644
index 0000000..cdabe36
--- /dev/null
+++ b/plugins/mi/util/hal/mi-nvme-hal-main.c
@@ -0,0 +1,95 @@
+/*
+ * Copyright (C) 2021 Samsung Electronics Inc. All rights reserved.
+ *
+ * This program is free software; you can redistribute it and/or
+ * modify it under the terms of the GNU General Public License version
+ * 2 as published by the Free Software Foundation.
+ *
+ * This program is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+ * GNU General Public License for more details.
+ *
+ * ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
+ * mi-nvme-hal-main.c - Implementation of HAL Layer for supporting Multiple Hardwares
+ * for NVMe Management Interface command support
+ *
+ * Developer : Mohit Kapoor <mohit.kap@samsung.com>
+ */
+
+#include "mi-nvme-hal-main.h"
+
+void SetSidebandInterface(SidebandInterface interface)
+{
+    sbInterface = interface;
+}
+
+SidebandInterface GetSidebandInterface()
+{
+    return sbInterface;
+}
+
+int hal_init()
+{
+    int retval = -1;
+    switch (GetSidebandInterface()) {
+    case qemu_nvme_mi:
+        retval = qemu_mi_init();
+        break;
+    default:
+        break;
+    }
+    return retval;
+}
+
+int hal_open()
+{
+    int retval = -1;
+    switch (GetSidebandInterface()) {
+    case qemu_nvme_mi:
+        retval = qemu_mi_open();
+        break;
+    default:
+        break;
+    }
+    return retval;
+}
+
+int hal_close()
+{
+    int retval = -1;
+    switch (GetSidebandInterface()) {
+    case qemu_nvme_mi:
+        retval = qemu_mi_close();
+        break;
+    default:
+        break;
+    }
+    return retval;
+}
+
+int hal_i2c_write(uint8_t *data_out, uint16_t num_bytes)
+{
+    int retval = -1;
+    switch (GetSidebandInterface()) {
+    case qemu_nvme_mi:
+        retval = qemu_mi_write(data_out, num_bytes);
+        break;
+    default:
+        break;
+    }
+    return retval;
+}
+
+int hal_i2c_read(uint8_t *data_in, uint16_t num_bytes)
+{
+    uint32_t retval = -1;
+    switch (GetSidebandInterface()) {
+    case qemu_nvme_mi:
+        retval = qemu_mi_read(data_in, num_bytes);
+        break;
+    default:
+        break;
+    }
+    return retval;
+}
diff --git a/plugins/mi/util/hal/mi-nvme-hal-main.h b/plugins/mi/util/hal/mi-nvme-hal-main.h
new file mode 100644
index 0000000..ad9bc58
--- /dev/null
+++ b/plugins/mi/util/hal/mi-nvme-hal-main.h
@@ -0,0 +1,35 @@
+/*
+ * Copyright (C) 2021 Samsung Electronics Inc. All rights reserved.
+ *
+ * This program is free software; you can redistribute it and/or
+ * modify it under the terms of the GNU General Public License version
+ * 2 as published by the Free Software Foundation.
+ *
+ * This program is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+ * GNU General Public License for more details.
+ *
+ * ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
+ * mi-nvme-hal-main.h - Implementation of HAL Layer for supporting Multiple Hardwares
+ * for NVMe Management Interface command support
+ *
+ * Developer : Mohit Kapoor <mohit.kap@samsung.com>
+ */
+
+#include <stdint.h>
+#include "mi-nvme-qemu/mi-nvme-qemu.h"
+
+typedef enum _SidebandInterface {
+    qemu_nvme_mi
+} SidebandInterface;
+
+SidebandInterface sbInterface;
+
+int hal_init();
+int hal_open();
+int hal_close();
+int hal_i2c_write(uint8_t *data_out, uint16_t num_bytes);
+int hal_i2c_read(uint8_t *data_in, uint16_t num_bytes);
+void SetSidebandInterface(SidebandInterface interface);
+SidebandInterface GetSidebandInterface();
diff --git a/plugins/mi/util/hal/mi-nvme-qemu/mi-nvme-qemu.c b/plugins/mi/util/hal/mi-nvme-qemu/mi-nvme-qemu.c
new file mode 100644
index 0000000..7a0e42f
--- /dev/null
+++ b/plugins/mi/util/hal/mi-nvme-qemu/mi-nvme-qemu.c
@@ -0,0 +1,98 @@
+/*
+ * Copyright (C) 2021 Samsung Electronics Inc. All rights reserved.
+ *
+ * This program is free software; you can redistribute it and/or
+ * modify it under the terms of the GNU General Public License version
+ * 2 as published by the Free Software Foundation.
+ *
+ * This program is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+ * GNU General Public License for more details.
+ *
+ * ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
+ * mi-nvme-qemu.c - Implementation of QEMU HAL Layer for
+ * for NVMe Management Interface command support via QEMU
+ *
+ * Developer : Mohit Kapoor <mohit.kap@samsung.com>
+ */
+
+#include "mi-nvme-qemu.h"
+static int connectfd = 0;
+
+int qemu_mi_init()
+{
+    connectfd = -1;
+    struct sockaddr_vm sa = {
+                        .svm_family = AF_VSOCK,
+                        .svm_cid = HOST_CID,
+                        .svm_port = 1342,
+                    };
+    connectfd = socket(AF_VSOCK, SOCK_STREAM, 0);
+    if (connectfd == -1) {
+            printf("Socket Error : Could not create socket!\n");
+    }
+    if (connect(connectfd, (struct sockaddr *)&sa , sizeof(sa)) < 0) {
+        printf("Socket Error : Could not connect to QEMU Socket!\n");
+        return -1;
+    }
+    printf("Connection established with QEMU Socket. Socket Handle is 0x%x\n", connectfd);
+    return connectfd;
+}
+
+int qemu_mi_read(uint8_t *data_in, uint16_t num_bytes)
+{
+    printf("qemu_mi_read : QEMU Socket handle : 0x%x num bytes to receive : %d\n", connectfd, num_bytes);
+    int nrecv = 0;
+    if (connectfd != -1) {
+        nrecv = 0;
+        nrecv = recv(connectfd, data_in , num_bytes, 0);
+        if (nrecv < 0) {
+            printf("Error while Revieving packet from QEMU!\n");
+            return -1;
+        }
+        printf("Message successfully Received. Bytes Received : %d\n", nrecv);
+    }
+    return nrecv;
+}
+
+int qemu_mi_write(uint8_t *data_out, uint16_t num_bytes)
+{
+    printf("qemu_mi_write : QEMU Socket handle : 0x%x\n", connectfd);
+    int nsend = 0;
+    if (connectfd != -1) {
+        nsend = write(connectfd, data_out, num_bytes);
+        if (nsend < 0) {
+            printf("Error while sending packet to QEMU!\n");
+            return -1;
+        }
+        printf("Message successfully sent. Bytes sent : %d\n", nsend);
+    }
+    return nsend;
+}
+
+int qemu_mi_open()
+{
+    if (connectfd == -1) {
+        int handle = -1;
+        handle = qemu_mi_init();
+        if (handle != -1) {
+            return handle;
+        } else {
+            return -1;
+        }
+    } else {
+        printf("qemu_mi_open : QEMU Socket handle : 0x%x\n", connectfd);
+        return connectfd;
+    }
+}
+
+int qemu_mi_close()
+{
+    if (connectfd != -1) {
+        printf("qemu_mi_close : QEMU Socket handle : 0x%x\n", connectfd);
+        close(connectfd);
+        connectfd = -1;
+    }
+    return connectfd;
+}
\ No newline at end of file
diff --git a/plugins/mi/util/hal/mi-nvme-qemu/mi-nvme-qemu.h b/plugins/mi/util/hal/mi-nvme-qemu/mi-nvme-qemu.h
new file mode 100644
index 0000000..4bd084a
--- /dev/null
+++ b/plugins/mi/util/hal/mi-nvme-qemu/mi-nvme-qemu.h
@@ -0,0 +1,40 @@
+/*
+ * Copyright (C) 2021 Samsung Electronics Inc. All rights reserved.
+ *
+ * This program is free software; you can redistribute it and/or
+ * modify it under the terms of the GNU General Public License version
+ * 2 as published by the Free Software Foundation.
+ *
+ * This program is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+ * GNU General Public License for more details.
+ *
+ * ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
+ * mi-nvme-qemu.h - Implementation of QEMU HAL Layer for
+ * for NVMe Management Interface command support via QEMU
+ *
+ * Developer : Mohit Kapoor <mohit.kap@samsung.com>
+ */
+
+#ifndef __MI_NVME_QEMU_H__
+#define __MI_NVME_QEMU_H__
+
+#include <stdint.h>
+#include <sys/socket.h>
+#include <linux/vm_sockets.h>
+#include <stdio.h>
+#include <string.h>
+#include<unistd.h>
+#define HOST_CID 2
+
+char server_reply[2000];
+int n;
+
+int qemu_mi_open();
+int qemu_mi_close();
+int qemu_mi_init();
+int qemu_mi_read(uint8_t *data_in, uint16_t num_bytes);
+int qemu_mi_write(uint8_t *data_out, uint16_t num_bytes);
+
+#endif
diff --git a/plugins/mi/util/mi-nvme-util-base.c b/plugins/mi/util/mi-nvme-util-base.c
new file mode 100644
index 0000000..0d71f72
--- /dev/null
+++ b/plugins/mi/util/mi-nvme-util-base.c
@@ -0,0 +1,317 @@
+/*
+ * Copyright (C) 2021 Samsung Electronics Inc. All rights reserved.
+ *
+ * This program is free software; you can redistribute it and/or
+ * modify it under the terms of the GNU General Public License version
+ * 2 as published by the Free Software Foundation.
+ *
+ * This program is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+ * GNU General Public License for more details.
+ *
+ * ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
+ * mi-nvme-util-base.c - Implementation of NVMe Management Interface commands in Nvme
+ *
+ * Developer : Mohit Kapoor <mohit.kap@samsung.com>
+ */
+
+#include "mi-nvme-util-master.h"
+
+extern __u32 TotalByteCount;
+
+void print_mctp_packet (mctp_i2c_header *m)
+{
+    printf("\t\t\t Destination Addr    : 0x%02X (7-bit: 0x%02x)\n", m->destAddr, m->destAddr >> 1);
+    printf("\t\t\t Source      Addr    : 0x%02X (7-bit: 0x%02x)\n", m->srcAddr & 0xFE, m->srcAddr >> 1);
+    printf("\t\t\t Byte Count          : 0x%02X (%d dec)\n", m->byteCnt, m->byteCnt);
+    printf("\t\t\t MCTP Header Version : %d\n", m->headerVer & 0xF);
+    printf("\t\t\t Destination Endpoint: 0x%02X\n", m->destEID);
+    printf("\t\t\t Source      Endpoint: 0x%02X\n", m->srcEID);
+    printf("\t\t\t Message Tag         : 0x%X\n", m->pktCtrl & MCTP_CTRL_PKT_MSGTAG_MASK);
+    printf("\t\t\t MCTP Pkt Seq Num    : %d\n", (m->pktCtrl & MCTP_CTRL_PKT_PKTSEQ_MASK) >> MCTP_CTRL_PKT_PKTSEQ_SHIFT);
+    printf("\t\t\t Packet Control bits : SOM(%d), EOM(%d), TO(%d)\n",
+        (m->pktCtrl & MCTP_CTRL_PKT_SOM) >> MCTP_CTRL_PKT_SOM_SHIFT,
+        (m->pktCtrl & MCTP_CTRL_PKT_EOM) >> MCTP_CTRL_PKT_EOM_SHIFT,
+        (m->pktCtrl & MCTP_CTRL_PKT_TO) >> MCTP_CTRL_PKT_TO_SHIFT);
+}
+
+void format_base_pkt (mctp_message_t *m)
+{
+    /* Prepare the I2C header */
+     m->i2cHdr.cmdCode = MCTP_CMD_CODE;
+    m->i2cHdr.headerVer = MCTP_HEADER_VER;
+    m->i2cHdr.destEID = MCTP_EID_DESTINATION;
+    m->i2cHdr.srcEID = MCTP_EID_SOURCE;
+    /* Base on Table 11 of the MCTP Base Specification about the Response message setting */
+    m->i2cHdr.pktCtrl = MCTP_CTRL_MSGTAG(3) | MCTP_CTRL_PKT_SOM | MCTP_CTRL_PKT_EOM | MCTP_CTRL_PKT_TO | 1;
+}
+
+int rcv_pkt (void *inp_parm)
+{
+    unsigned int status = 0;
+    uint8_t eom = 0;
+    mctp_i2c_header mctp_hdr;
+    rcv_parm_t *rcv_parm = (rcv_parm_t *)inp_parm;
+
+    printf("Getting Data from the device.\n");
+    switch (GetSidebandInterface())
+    {
+    case qemu_nvme_mi:
+        rcv_parm->buf_size = 0;
+        memset(&mctp_hdr, 0, sizeof(mctp_i2c_header));
+        uint32_t bytesread = 0;
+        while (!eom) {
+            uint8_t buf[8];
+            /*Reading first 8 bytes of header info*/
+            int ret = hal_i2c_read(buf, 8);
+            if (ret == -1) {
+                printf("Unable to receive MI response header from device.\n");
+                status = -1;
+                break;
+            }
+            mctp_hdr.byteCnt = buf[2];
+            eom = (buf[7] & 0x40) >> 6;
+            printf("Header info received from device:\n");
+            print_mctp_packet((mctp_i2c_header *)buf);
+
+            /*copy header info to response buffer*/
+            memcpy(rcv_parm->buffer + bytesread, buf, 8);
+            bytesread += 8;
+
+            /*Reading the data sent in next transaction*/
+            ret = hal_i2c_read(rcv_parm->buffer + bytesread, mctp_hdr.byteCnt - 5);
+            if (ret == -1) {
+                printf("Unable to receive data from the device.\n");
+                status = -1;
+                break;
+            }
+            printf("Data Received from Device:\n");
+            PrintBuffer(rcv_parm->buffer + bytesread, mctp_hdr.byteCnt - 5);
+            rcv_parm->buf_size += mctp_hdr.byteCnt - 5;
+            bytesread += mctp_hdr.byteCnt - 5;
+        }
+        *(rcv_parm->ret_bytes) = rcv_parm->buf_size;
+        break;
+    default:
+        break;
+    }
+    return status;
+}
+
+int xmit_pkt (__u8 *buffer)
+{
+    mctp_message_t *message = NULL;
+    __u8 *p = NULL;
+    __u32 mtu = mctp_tus;
+    __u32 bytesleft = 0;
+    int ret = -1;
+
+    message = (mctp_message_t *)buffer;
+    bytesleft = TotalByteCount - 5;
+    /* Append PEC byte to the end of the packet */
+    p = buffer + TotalByteCount + 3;
+    message->i2cHdr.byteCnt = TotalByteCount;
+    *p = Calc_Crc8((__u8 *)buffer, TotalByteCount + 3);
+
+    if ((sys_cfg.sys_flags | SYS_FLAG_PEC_OVERRIDE) &&
+        (sys_cfg.peccode == 1))
+    {
+        *p ^= *buffer; /* Screw up the PEC */
+    }
+
+    usleep(10);
+
+    print_mctp_packet(&message->i2cHdr);
+
+    if (bytesleft) {
+        if ((sys_cfg.sys_flags & SYS_FLAG_PEC_OVERRIDE) &&
+            (sys_cfg.peccode == 0)) {
+            ret = send_data(TotalByteCount+2, (__u8 *)&message->i2cHdr.cmdCode);
+        } else {
+            ret = send_data(TotalByteCount+3, (__u8 *)&message->i2cHdr.cmdCode);
+        }
+    } else {
+        bool isStart = true;
+        __u32  counter = 0;
+        do
+        {
+            mctp_message_t msg_in_chunks;
+            __u8 *buffer_in_chunks;
+
+            buffer_in_chunks = (__u8*)&msg_in_chunks;
+
+            memcpy(&msg_in_chunks, message, MCTP_HEADER_SIZE);
+            msg_in_chunks.i2cHdr.byteCnt = mtu + 5;
+
+            msg_in_chunks.i2cHdr.pktCtrl &= 0x0F;
+            msg_in_chunks.i2cHdr.pktCtrl |= ((counter % 4)<<4);
+
+            if (isStart == true) {
+                msg_in_chunks.i2cHdr.pktCtrl |= 0x80; /*Start of message*/
+                memcpy(&msg_in_chunks.msgHdr, buffer + MCTP_HEADER_SIZE + (mtu*counter), mtu);
+                isStart = false;
+            } else if (bytesleft <= mtu) {
+                msg_in_chunks.i2cHdr.pktCtrl |= 0x40; /*End of message*/
+                msg_in_chunks.i2cHdr.byteCnt = bytesleft + 5;
+                memcpy(&msg_in_chunks.msgHdr, buffer + MCTP_HEADER_SIZE + (mtu*counter), bytesleft);
+            } else {
+                msg_in_chunks.i2cHdr.byteCnt = BYTE_COUNT_WHEN_DATA_EXCEEDS_MTU;
+                memcpy(&msg_in_chunks.msgHdr, buffer + MCTP_HEADER_SIZE + (mtu*counter), mtu);
+            }
+
+            p = buffer_in_chunks + msg_in_chunks.i2cHdr.byteCnt + 3;
+            *p = Calc_Crc8((__u8 *)buffer_in_chunks, msg_in_chunks.i2cHdr.byteCnt + 3);
+
+            if ((sys_cfg.sys_flags | SYS_FLAG_PEC_OVERRIDE) && (sys_cfg.peccode == 1)){
+                *p ^= *buffer_in_chunks; /* Screw up the PEC */
+            }
+
+            if ((sys_cfg.sys_flags & SYS_FLAG_PEC_OVERRIDE) &&
+                (sys_cfg.peccode == 0)) {
+                ret = send_data(msg_in_chunks.i2cHdr.byteCnt + 2, (__u8 *)&msg_in_chunks.i2cHdr.cmdCode);
+                if (ret == -1) {
+                    break;
+                }
+            } else {
+                ret = send_data(msg_in_chunks.i2cHdr.byteCnt + 3, (__u8 *)&msg_in_chunks.i2cHdr.cmdCode);
+                if (ret == -1) {
+                    break;
+                }
+            }
+
+            bytesleft -= mtu;
+            counter++;
+        } while (bytesleft > 0);
+    }
+    return ret;
+}
+
+bool mi_pkt_transaction (__u8 *TxBuf, __u8 *RxBuf, __u16 Rxbuf_size)
+{
+    mctp_reply_buffer_struct *stReplyStruct;
+    stReplyStruct = (mctp_reply_buffer_struct*)RxBuf;
+
+    rcv_parm_t rcv_parm;
+    rcv_parm.buf_size = Rxbuf_size;
+    rcv_parm.buffer = stReplyStruct->replybuf;
+    rcv_parm.ret_bytes = &stReplyStruct->length;
+    rcv_parm.errcode = &stReplyStruct->errorcode;
+
+    int ret = xmit_pkt(TxBuf);
+    if (ret == -1) {
+        printf("Unable to send command to device.\n");
+        return false;
+    }
+    sleep(1);
+    ret = rcv_pkt (&rcv_parm);
+    if (ret == -1) {
+        printf("Unable to receive receive response from device.\n");
+        return false;
+    }
+    return true;
+}
+
+bool execute_nvme_mi_command(struct nvme_mi_mctp_message_t message, mctp_reply_buffer_struct *stReply, int replysize, int RequestDataSize)
+{
+    uint8_t *buffer  = NULL;
+    uint32_t size_of_message = 0;
+    uint32_t crc = 0;
+    bool ret = false;
+
+    format_base_pkt((mctp_message_t*)&message);
+
+    sys_cfg.sys_flags |= SYS_FLAG_NVME_MI;
+
+    if (message.msgPld.buffer == NULL) {
+        size_of_message = sizeof(struct nvme_mi_mctp_message_t) - SIZE_OF_BUFFER_ADDRESS;
+        buffer = (uint8_t*)malloc(size_of_message + 1); /*Adding one for the PEC Byte*/
+        TotalByteCount = size_of_message - 3;
+
+        /*Copy the contents of message apart from buffer, as it is NULL*/
+        if (buffer !=NULL) {
+            memcpy(buffer, &message, OFST_TILL_BUFFER_NVME_MI_CMD);
+        }
+    } else if (message.msgPld.opcode == 06) {   /*This check is for VPD Write*/
+        size_of_message = sizeof(struct nvme_mi_mctp_message_t) - SIZE_OF_BUFFER_ADDRESS;
+        int buffer_len = message.msgPld.dword1 & 0xFFFF;
+
+        size_of_message += buffer_len;
+        TotalByteCount = size_of_message - 3;
+
+        buffer = (uint8_t*)malloc(size_of_message + 1);	/*Adding one for PEC byte*/
+        if (buffer !=NULL) {
+            memcpy(buffer, &message, OFST_TILL_BUFFER_NVME_MI_CMD);
+            memcpy(buffer + OFST_TILL_BUFFER_NVME_MI_CMD, message.msgPld.buffer, buffer_len);
+        }
+
+    } else {
+        size_of_message = sizeof(struct nvme_mi_mctp_message_t)  - SIZE_OF_BUFFER_ADDRESS + RequestDataSize;
+        buffer = (uint8_t*)malloc(size_of_message + 1);	/*Add one for the PEC byte*/
+
+        TotalByteCount = size_of_message - 3;
+        if (buffer != NULL) {
+            memcpy(buffer, &message, OFST_TILL_BUFFER_NVME_MI_CMD);
+            memcpy(buffer+OFST_TILL_BUFFER_NVME_MI_CMD, message.msgPld.buffer, RequestDataSize);
+        }
+    }
+
+    if (buffer != NULL) {
+        crc = GenerateCRC(buffer + MCTP_HEADER_SIZE, size_of_message - MCTP_HEADER_SIZE - CRC_SIZE );
+        memcpy(buffer + size_of_message - CRC_SIZE, &crc ,CRC_SIZE);
+        ret = mi_pkt_transaction(buffer, (__u8 *)stReply, replysize);
+        if (buffer !=NULL) {
+            free(buffer);
+            buffer = NULL;
+        }
+    }
+
+    return ret;
+}
+
+bool execute_nvme_mi_admin_command(nvme_mi_admin_cmd_mctp_message message, mctp_reply_buffer_struct *stReply, int replysize, int RequestDataSize)
+{
+    uint8_t *buffer  = NULL;
+    uint32_t size_of_message = 0;
+    uint32_t crc = 0;
+    bool ret = false;
+
+    format_base_pkt((mctp_message_t*)&message);
+
+    if (message.msgPld.buffer == NULL) {
+        size_of_message = sizeof(nvme_mi_admin_cmd_mctp_message) - SIZE_OF_BUFFER_ADDRESS;
+        buffer = (uint8_t*)malloc(size_of_message + 1);		// Adding one for the PEC byte
+
+        TotalByteCount = size_of_message - 3;
+
+        /*Copy the contents of message apart from buffer, as it is NULL*/
+        if (buffer != NULL) {
+            memcpy(buffer, &message, OFST_TILL_BUFFER_NVME_MI_ADMIN_CMD);
+            memcpy(buffer + OFST_TILL_BUFFER_NVME_MI_ADMIN_CMD, (char*)&message
+                + OFST_TILL_BUFFER_NVME_MI_ADMIN_CMD + SIZE_OF_BUFFER_ADDRESS,SIZE_OF_MIC);
+        }
+    } else {
+        size_of_message = sizeof(nvme_mi_admin_cmd_mctp_message) - SIZE_OF_BUFFER_ADDRESS + RequestDataSize;
+        buffer = (uint8_t*)malloc(size_of_message + 1);		/*Adding one for the PEC Byte*/
+
+        TotalByteCount = size_of_message - 3;
+        if (buffer !=NULL) {
+            memcpy(buffer, &message, OFST_TILL_BUFFER_NVME_MI_ADMIN_CMD);
+            memcpy(buffer + OFST_TILL_BUFFER_NVME_MI_ADMIN_CMD, message.msgPld.buffer, RequestDataSize);
+        }
+    }
+
+    if (buffer !=NULL) {
+        /*CRC has to be calculated only for the message body*/
+        crc = GenerateCRC(buffer + MCTP_HEADER_SIZE, size_of_message - MCTP_HEADER_SIZE - CRC_SIZE);
+        memcpy(buffer + size_of_message - CRC_SIZE, &crc, CRC_SIZE);
+        ret = mi_pkt_transaction(buffer, (__u8 *)stReply, replysize);
+    }
+
+    if (buffer !=NULL) {
+        free(buffer);
+        buffer = NULL;
+    }
+
+    return ret;
+}
diff --git a/plugins/mi/util/mi-nvme-util-base.h b/plugins/mi/util/mi-nvme-util-base.h
new file mode 100644
index 0000000..f9e41fc
--- /dev/null
+++ b/plugins/mi/util/mi-nvme-util-base.h
@@ -0,0 +1,212 @@
+/*
+ * Copyright (C) 2021 Samsung Electronics Inc. All rights reserved.
+ *
+ * This program is free software; you can redistribute it and/or
+ * modify it under the terms of the GNU General Public License version
+ * 2 as published by the Free Software Foundation.
+ *
+ * This program is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+ * GNU General Public License for more details.
+ *
+ * ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
+ * mi-nvme-util-base.h - Implementation of NVMe Management Interface commands in Nvme
+ *
+ * Developer : Mohit Kapoor <mohit.kap@samsung.com>
+ */
+
+#ifndef __MI_NVME_UTIL_BASE_H__
+#define __MI_NVME_UTIL_BASE_H__
+
+#include <pthread.h>
+#include <linux/types.h>
+
+#define MCTP_CMD_CODE                       0x0F
+#define MCTP_HEADER_VER                     0x1
+
+#define MCTP_EID_DESTINATION                0x00
+#define MCTP_EID_SOURCE                     0x00
+
+/* Byte 7 Packet Control Bits */
+#define MCTP_CTRL_PKT_MSGTAG_MASK           0x07
+#define MCTP_CTRL_PKT_TO                    0x08
+#define MCTP_CTRL_PKT_TO_SHIFT              3
+#define MCTP_CTRL_PKT_PKTSEQ_MASK           0x30
+#define MCTP_CTRL_PKT_PKTSEQ_SHIFT          4
+#define MCTP_CTRL_PKT_EOM                   0x40
+#define MCTP_CTRL_PKT_EOM_SHIFT             6
+#define MCTP_CTRL_PKT_SOM                   0x80
+#define MCTP_CTRL_PKT_SOM_SHIFT             7
+#define MCTP_CTRL_MSGTAG(x)                 (x & MCTP_CTRL_PKT_MSGTAG_MASK)
+#define MCTP_CTRL_PKTSEQ(x)                 ((x << MCTP_CTRL_PKT_PKTSEQ_SHIFT) & MCTP_CTRL_PKT_PKTSEQ_MASK)
+
+/* Byte 8 Packet Message Type Bits */
+#define MCTP_CTRL_MSG_IC                    0x80
+#define MCTP_CTRL_MSG_IC_SHIFT              7
+#define VDM_ARG_COUNT 20
+
+#define SIZE_OF_BUFFER_ADDRESS 8
+#define SIZE_OF_32_BUFFER_ADDRESS 4
+#define OFST_TILL_BUFFER_NVME_MI_ADMIN_CMD 76
+#define OFST_TILL_BUFFER_NVME_MI_CMD 24
+#define SIZE_OF_MIC 4
+#define MCTP_HEADER_SIZE 8
+#define CRC_SIZE 4
+#define BYTE_COUNT_WHEN_DATA_EXCEEDS_MTU 69
+#define REPLY_BUFFER_SIZE 5120
+#define REPLAY_BUFFER_SIZE 5120
+#define REPLAY_RESPONSE_MESSAGE_SIZE 20
+
+#define PACKED
+#pragma pack(push,1)
+
+typedef struct _mctp_i2c_header {
+    __u8                 destAddr;
+    __u8                 cmdCode;
+    __u8                 byteCnt;
+    __u8                 srcAddr;
+    __u8                 headerVer;
+    __u8                 destEID;
+    __u8                 srcEID;
+    /* Byte 3 for msgTag(2:0), TO(3), pktSeq(5:4), EOM(6), SOM(7) */
+    __u8                 pktCtrl;
+} mctp_i2c_header;
+
+typedef struct mctp_msg_header_ {
+    __u8                 msgTpe;
+    union
+    {
+        struct
+        {
+            /* Byte for InstID(4:0), D(6), Rq(7) fields */
+            __u8    InstCde;
+            __u8    cmdCode;
+            __u8    OpCpl;
+        } ctrMsg;
+    } msgReqRsp;
+} mctp_msg_header_t;
+
+typedef struct mctp_msg_payload_ {
+    union
+    {
+        struct
+        {
+            __u8        EID_status;
+            __u8        EP_Type;
+            __u8        Misc;
+            __u8        byte[((VDM_ARG_COUNT*4)+13)];
+        } baseCtrl;
+    } dataPld;
+} mctp_msg_payload_t;
+
+typedef struct mctp_message_ {
+    mctp_i2c_header  i2cHdr;
+    mctp_msg_header_t  msgHdr;
+    mctp_msg_payload_t msgPld;
+    __u32                pad[1];
+} mctp_message_t;
+
+typedef struct _mctp_message_header_t
+{
+    __u8 messsage_type : 7;
+    __u8 ic : 1;
+    __u8 instance_id : 5;
+    __u8 rsvd : 1;
+    __u8 D : 1;
+    __u8 RQ : 1;
+    __u8 Command_Code;
+}mctp_message_header_t;
+
+typedef struct _nvme_mi_mctp_cmd_pld
+{
+    mctp_message_header_t nvme_mi_message_header;
+    __u8*    buffer;
+}nvme_mi_mctp_cmd_pld;
+
+typedef struct _mctp_command_packet
+{
+    mctp_i2c_header  i2cHdr;
+    nvme_mi_mctp_cmd_pld msgPld;
+}mctp_command_packet;
+
+typedef struct _mctp_command_reply_packet
+{
+    mctp_i2c_header  i2cHdr;
+    nvme_mi_mctp_cmd_pld msgPld;
+}mctp_command_reply_packet;
+
+struct nvme_mi_mctp_message_pld
+{
+    __u32 nvme_mi_message_header;
+    __u8 opcode;
+    __u8 reserved0;
+    __u8 reserved1;
+    __u8 reserved2;
+    __u32 dword0;
+    __u32 dword1;
+    __u8 *buffer;
+    __u32 mic;
+}__attribute__((packed));
+
+typedef struct _nvme_mi_Admin_cmd_mctp_message_pld
+{
+    __u32 nvme_mi_message_header;
+    __u8 opcode;
+    __u8 cflgs;
+    __u16 ctlid;
+    __u32 cdw1;
+    __u32 cdw2;
+    __u32 cdw3;
+    __u32 cdw4;
+    __u32 cdw5;
+    __u32 dofst;
+    __u32 dlen;
+    __u32 cdw8;
+    __u32 cdw9;
+    __u32 cdw10;
+    __u32 cdw11;
+    __u32 cdw12;
+    __u32 cdw13;
+    __u32 cdw14;
+    __u32 cdw15;
+    __u8* buffer;
+    __u32 mic;
+}nvme_mi_Admin_cmd_mctp_message_pld;
+
+struct nvme_mi_mctp_message_t {
+    mctp_i2c_header i2cHdr;
+    struct nvme_mi_mctp_message_pld	msgPld;
+}__attribute__((packed));
+
+typedef struct _nvme_mi_admin_cmd_mctp_message_ {
+    mctp_i2c_header i2cHdr;
+    nvme_mi_Admin_cmd_mctp_message_pld     msgPld;
+}nvme_mi_admin_cmd_mctp_message;
+
+typedef struct rcv_parm_
+{
+    __u16 buf_size;
+    __u8 *buffer;
+    __u32 *ret_bytes;
+    __u32 *errcode;
+} rcv_parm_t;
+
+typedef struct _mctp_reply_buffer_struct
+{
+    __u8 replybuf[REPLY_BUFFER_SIZE];
+    __u32 length;
+    __u32 errorcode;
+}mctp_reply_buffer_struct;
+
+#pragma pack(pop)
+#undef PACKED
+
+void format_base_pkt(mctp_message_t *m);
+int rcv_pkt(void *inp_parm);
+int xmit_pkt(__u8 *buffer);
+bool mi_pkt_transaction(__u8 *TxBuf, __u8 *RxBuf, __u16 Rxbuf_size);
+bool execute_nvme_mi_command(struct nvme_mi_mctp_message_t message, mctp_reply_buffer_struct *stReply, int replysize, int RequestDataSize);
+bool execute_nvme_mi_admin_command(nvme_mi_admin_cmd_mctp_message message, mctp_reply_buffer_struct *stReply, int replysize, int RequestDataSize);
+
+#endif
diff --git a/plugins/mi/util/mi-nvme-util-crc.c b/plugins/mi/util/mi-nvme-util-crc.c
new file mode 100644
index 0000000..76e1171
--- /dev/null
+++ b/plugins/mi/util/mi-nvme-util-crc.c
@@ -0,0 +1,88 @@
+/*
+ * Copyright (C) 2021 Samsung Electronics Inc. All rights reserved.
+ *
+ * This program is free software; you can redistribute it and/or
+ * modify it under the terms of the GNU General Public License version
+ * 2 as published by the Free Software Foundation.
+ *
+ * This program is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+ * GNU General Public License for more details.
+ *
+ * ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
+ * mi-nvme-util-crc.c - Implementation of NVMe Management Interface commands in Nvme
+ *
+ * Developer : Mohit Kapoor <mohit.kap@samsung.com>
+ */
+
+#include "mi-nvme-util-master.h"
+
+static __u8 crc8(__u8 crc, __u8 crc_data)
+{
+    __u8 i = 0, data = 0;
+    data = crc ^ crc_data;
+
+    for ( i = 0; i < 8; i++ ) {
+        if (( data & 0x80 ) != 0 ) {
+            data <<= 1;
+            data ^= 0x07;
+        } else {
+            data <<= 1;
+        }
+    }
+    return data;
+}
+
+__u8 Calc_Crc8(__u8 *Buffer, __u8 byte_cnt)
+{
+    __u8 crc = 0, *p;
+    int i;
+    p = Buffer;
+
+    for (i = 0; i < byte_cnt; i++) {
+        crc = crc8(crc, *p++);
+    }
+    return (crc);
+}
+
+uint32_t GenerateCRC(uint8_t *message, uint32_t length)
+{
+    if (message != NULL) {
+        uint32_t crc = Calc_Crc32(0x1EDC6F41, -1, message, length);
+        printf("Generated CRC32 : %"PRIx32" \n", crc);
+        return crc;
+    }
+    return 0;
+}
+
+void gen_crc_table(uint32_t poly)
+{
+  register uint16_t i = 0, j = 0;
+  register uint32_t crc_accum = 0;
+
+  for (i = 0;  i < 256;  i++) {
+    crc_accum = ( (uint32_t) i << 24 );
+    for (j = 0;  j < 8;  j++ ) {
+      if (crc_accum & 0x80000000L) {
+        crc_accum = (crc_accum << 1) ^ poly;
+      } else {
+        crc_accum = (crc_accum << 1);
+      }
+    }
+    crc_table[i] = crc_accum;
+  }
+}
+
+uint32_t Calc_Crc32(uint32_t poly, uint32_t crc_accum, uint8_t *data_blk_ptr, uint32_t data_blk_size)
+{
+    register uint32_t i = 0, j = 0;
+    gen_crc_table(poly);
+
+    for (j = 0; j < data_blk_size; j++) {
+        i = ((int) (crc_accum >> 24) ^ *data_blk_ptr++) & 0xFF;
+        crc_accum = (crc_accum << 8) ^ crc_table[i];
+    }
+    crc_accum = ~crc_accum;
+    return crc_accum;
+}
diff --git a/plugins/mi/util/mi-nvme-util-crc.h b/plugins/mi/util/mi-nvme-util-crc.h
new file mode 100644
index 0000000..a9f6f54
--- /dev/null
+++ b/plugins/mi/util/mi-nvme-util-crc.h
@@ -0,0 +1,33 @@
+/*
+ * Copyright (C) 2021 Samsung Electronics Inc. All rights reserved.
+ *
+ * This program is free software; you can redistribute it and/or
+ * modify it under the terms of the GNU General Public License version
+ * 2 as published by the Free Software Foundation.
+ *
+ * This program is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+ * GNU General Public License for more details.
+ *
+ * ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
+ * mi-nvme-util-crc.h - Implementation of NVMe Management Interface commands in Nvme
+ *
+ * Developer : Mohit Kapoor <mohit.kap@samsung.com>
+ */
+
+#ifndef __MI_NVME_UTIL_CRC_H__
+#define __MI_NVME_UTIL_CRC_H__
+
+#include <stdio.h>
+#include <stdlib.h>
+#include <inttypes.h>
+
+uint32_t crc_table[256];
+
+uint32_t GenerateCRC(uint8_t *message, uint32_t length);
+void gen_crc_table();
+uint32_t Calc_Crc32(uint32_t poly, uint32_t crc_accum, uint8_t *message, uint32_t size);
+__u8 Calc_Crc8(__u8 *Buffer, __u8 byte_cnt);
+
+#endif
diff --git a/plugins/mi/util/mi-nvme-util-master.h b/plugins/mi/util/mi-nvme-util-master.h
new file mode 100644
index 0000000..ae2a322
--- /dev/null
+++ b/plugins/mi/util/mi-nvme-util-master.h
@@ -0,0 +1,34 @@
+/*
+ * Copyright (C) 2021 Samsung Electronics Inc. All rights reserved.
+ *
+ * This program is free software; you can redistribute it and/or
+ * modify it under the terms of the GNU General Public License version
+ * 2 as published by the Free Software Foundation.
+ *
+ * This program is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+ * GNU General Public License for more details.
+ *
+ * ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
+ * mi-nvme-util-master.h - Implementation of NVMe Management Interface commands in Nvme
+ *
+ * Developer : Mohit Kapoor <mohit.kap@samsung.com>
+ */
+
+#ifndef __MI_NVME_UTIL_MASTER_H__
+#define __MI_NVME_UTIL_MASTER_H__
+#include <linux/types.h>
+#include <stdio.h>
+#include <stdlib.h>
+#include <string.h>
+#include <stddef.h>
+#include <stdbool.h>
+#include <ctype.h>
+#include <sys/stat.h>
+#include "hal/mi-nvme-hal-main.h"
+#include "mi-nvme-util-tool.h"
+#include "mi-nvme-util-base.h"
+#include "mi-nvme-util-crc.h"
+
+#endif
diff --git a/plugins/mi/util/mi-nvme-util-tool.c b/plugins/mi/util/mi-nvme-util-tool.c
new file mode 100644
index 0000000..8d7f533
--- /dev/null
+++ b/plugins/mi/util/mi-nvme-util-tool.c
@@ -0,0 +1,165 @@
+/*
+ * Copyright (C) 2021 Samsung Electronics Inc. All rights reserved.
+ *
+ * This program is free software; you can redistribute it and/or
+ * modify it under the terms of the GNU General Public License version
+ * 2 as published by the Free Software Foundation.
+ *
+ * This program is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+ * GNU General Public License for more details.
+ *
+ * ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
+ * mi-nvme-util-tool.c - Implementation of NVMe Management Interface commands in Nvme
+ *
+ * Developer : Mohit Kapoor <mohit.kap@samsung.com>
+ */
+
+#include "mi-nvme-util-master.h"
+
+static bool state_dev = false;
+static bool hardware_init = false;
+
+system_cfg_t sys_cfg;
+__u32 mctp_tus;
+__u32 TotalByteCount;
+
+bool initialize(__u32 uiMCTP_TUS)
+{
+    bool retval = false;
+    memset(&sys_cfg, 0, sizeof(system_cfg_t));
+
+    switch (GetSidebandInterface()) {
+    case qemu_nvme_mi:
+        mctp_tus = uiMCTP_TUS;
+        if (!hardware_init) {
+            int ret = hal_init();
+            if (ret == -1) {
+                printf("Initialiation Failed.\n");
+                return false;
+            }
+            printf("QEMU Socket initialized : %d\n", ret);
+            hardware_init = true;
+        }
+
+        retval = open_device();
+        if (retval == false) {
+            printf("open device Failed!\n");
+            return false;
+        }
+        break;
+    default:
+        break;
+    }
+
+    return retval;
+}
+
+int send_data(__u16 num_write, __u8 *data_out)
+{
+    int count = 0;
+
+    printf("\nData being written to the device, byte count = 0x%X:\n", num_write);
+    __u8 *buffertemp = (__u8*)malloc(num_write + 1);
+    if (buffertemp != NULL) {
+        buffertemp[0] = sys_cfg.taddr << 1;
+        memcpy(&buffertemp[1], data_out, num_write);
+        PrintBuffer(buffertemp, num_write + 1);
+
+        free(buffertemp);
+        buffertemp = NULL;
+    }
+
+    count = hal_i2c_write(data_out, num_write);
+    usleep(10);
+
+    printf("num_write=0x%02x(0x%02x)\n", num_write, count);
+
+    if (count < 0) {
+        printf("Error in sending data\n");
+        return -1;
+    }
+    printf("Number of bytes written to the device 0x%02x(%d)\n", count, count);
+
+    return count;
+}
+
+bool open_device()
+{
+    int status = -1, i = 0;
+
+    if (!state_dev) {
+        for (i = 0; i < MAX_OPEN_RETRY; i++) {
+            status = hal_open();
+            if (status < 0) {
+                printf("Unable to open device\n");
+            } else {
+                break;
+            }
+        }
+
+        if (status <= 0) {
+            printf("Unable to open device on port %d\n", sys_cfg.aport);
+            return false;
+        }
+
+        state_dev = true;
+    }
+    return true;
+}
+
+bool close_device()
+{
+    int status = -1, i = 0;
+
+    if (state_dev) {
+        for (i = 0; i < MAX_CLOSE_RETRY; i++) {
+            status = hal_close();
+            if (status == -1) {
+                break;
+            }
+        }
+
+        if (status != -1) {
+            printf("Device handle close unsuccessful!\n");
+            return false;
+        }
+        state_dev = false;
+    }
+    return true;
+}
+
+void PrintBuffer( __u8* buffer,__u32 length)
+{
+    __u32 i = 0;
+    for (i = 0; i < length; i += 0x8) {
+        if (i+1 > length -1) {
+            printf("%06x     %02x\n",i,buffer[i]);
+        } else if (i+2 > length -1) {
+            printf("%06x     %02x %02x \n",i, buffer[i], \
+            buffer[i + 1]);
+        } else if (i+3 > length -1) {
+            printf("%06x     %02x %02x %02x\n", i, buffer[i], \
+            buffer[i + 1], buffer[i + 2]);
+        } else if (i+4 > length -1) {
+            printf("%06x     %02x %02x %02x %02x\n", i, buffer[i], \
+            buffer[i + 1], buffer[i + 2], buffer[i + 3]);
+        } else if (i+5 > length -1) {
+            printf("%06x     %02x %02x %02x %02x %02x\n", i, buffer[i], \
+            buffer[i + 1], buffer[i + 2], buffer[i + 3], buffer[i + 4]);
+        } else if (i+6 > length -1) {
+            printf("%06x     %02x %02x %02x %02x %02x %02x\n", i, \
+            buffer[i], buffer[i + 1], buffer[i + 2], buffer[i + 3], \
+            buffer[i + 4], buffer[i + 5]);
+        } else if (i+7 > length -1) {
+            printf("%06x     %02x %02x %02x %02x %02x %02x %02x\n", i, \
+            buffer[i], buffer[i + 1], buffer[i + 2], buffer[i + 3], \
+            buffer[i + 4], buffer[i + 5], buffer[i + 6]);
+        } else {
+            printf("%06x     %02x %02x %02x %02x %02x %02x %02x %02x\n",i , \
+            buffer[i], buffer[i + 1], buffer[i + 2], buffer[i + 3], \
+            buffer[i + 4], buffer[i + 5], buffer[i + 6], buffer[i + 7]);
+        }
+    }
+}
diff --git a/plugins/mi/util/mi-nvme-util-tool.h b/plugins/mi/util/mi-nvme-util-tool.h
new file mode 100644
index 0000000..1b7b103
--- /dev/null
+++ b/plugins/mi/util/mi-nvme-util-tool.h
@@ -0,0 +1,55 @@
+/*
+ * Copyright (C) 2021 Samsung Electronics Inc. All rights reserved.
+ *
+ * This program is free software; you can redistribute it and/or
+ * modify it under the terms of the GNU General Public License version
+ * 2 as published by the Free Software Foundation.
+ *
+ * This program is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+ * GNU General Public License for more details.
+ *
+ * ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
+ * mi-nvme-util-tool.h - Implementation of NVMe Management Interface commands in Nvme
+ *
+ * Developer : Mohit Kapoor <mohit.kap@samsung.com>
+ */
+
+#include "mi-nvme-util-base.h"
+
+#ifndef __MI_NVME_UTIL_TOOL_H__
+#define __MI_NVME_UTIL_TOOL_H__
+
+#define SYS_FLAG_PEC_OVERRIDE 0x00000400
+#define SYS_FLAG_NVME_MI 0x00010000
+#define MAX_OPEN_RETRY 10
+#define MAX_CLOSE_RETRY 5
+
+typedef struct _system_cfg_t {
+    __u32 sys_flags;
+    __u32 verbose_level;
+    __u32 op_state;
+
+    int phandle;
+    int dhandle;
+    __u16 iport;
+    __u16 aport;
+    __u16 dport;
+
+    __u8 taddr;
+    __u8 saddr;
+
+    __u8 peccode;
+} system_cfg_t;
+
+__u32 mctp_tus;
+extern system_cfg_t  sys_cfg;
+
+bool initialize(__u32 uiMCTP_TUS);
+int send_data(__u16 num_write, __u8 *data_out);
+bool open_device();
+bool close_device();
+void PrintBuffer(__u8* buffer,__u32 length);
+
+#endif

------hb-dvdiRZtWrjeusMudXEerT0TTrvs-OGX_88iZ4NSx451yS=_1031fc_
Content-Type: text/plain; charset="utf-8"


------hb-dvdiRZtWrjeusMudXEerT0TTrvs-OGX_88iZ4NSx451yS=_1031fc_--

