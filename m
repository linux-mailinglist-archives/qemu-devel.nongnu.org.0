Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D7F193DE487
	for <lists+qemu-devel@lfdr.de>; Tue,  3 Aug 2021 04:51:26 +0200 (CEST)
Received: from localhost ([::1]:59620 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mAkWb-0005kw-Cf
	for lists+qemu-devel@lfdr.de; Mon, 02 Aug 2021 22:51:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45898)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <p.kalghatgi@samsung.com>)
 id 1mAkVm-0004xK-6T
 for qemu-devel@nongnu.org; Mon, 02 Aug 2021 22:50:34 -0400
Received: from mailout1.samsung.com ([203.254.224.24]:31287)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <p.kalghatgi@samsung.com>)
 id 1mAkVj-0006wH-Lw
 for qemu-devel@nongnu.org; Mon, 02 Aug 2021 22:50:33 -0400
Received: from epcas5p1.samsung.com (unknown [182.195.41.39])
 by mailout1.samsung.com (KnoxPortal) with ESMTP id
 20210803025022epoutp0134f122199524103bb0f9e57f31024c13~XrBr6mr9N1941819418epoutp01y
 for <qemu-devel@nongnu.org>; Tue,  3 Aug 2021 02:50:22 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.samsung.com
 20210803025022epoutp0134f122199524103bb0f9e57f31024c13~XrBr6mr9N1941819418epoutp01y
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1627959022;
 bh=9KFBl2X0z4r1IHxFd5kubaw/ZvbtMp7/1UtwZu4Pvms=;
 h=From:To:Cc:Subject:Date:References:From;
 b=tNhUKivpshZ+1TacnY/0YYilt8ZlPLJt3lSUczbXyBMLSCXYri9NiMoIG3iuqDUFf
 w2lW2KpjFvGCega0J+2usbUZ0cpuRO7SR2rCXuNCAnF6wQwCvFAju1KXYlSjC429bZ
 fgWm2p/VxYrbJCtK70iz2lB9FfJRgnPmxjXfp2dE=
Received: from epsnrtp4.localdomain (unknown [182.195.42.165]) by
 epcas5p4.samsung.com (KnoxPortal) with ESMTP id
 20210803025020epcas5p4ed018a21a4eb2783ed07d5652551748a~XrBqeOOIg2908429084epcas5p4M;
 Tue,  3 Aug 2021 02:50:20 +0000 (GMT)
Received: from epsmges5p1new.samsung.com (unknown [182.195.38.178]) by
 epsnrtp4.localdomain (Postfix) with ESMTP id 4Gdzqy4wwCz4x9Q5; Tue,  3 Aug
 2021 02:50:06 +0000 (GMT)
Received: from epcas5p1.samsung.com ( [182.195.41.39]) by
 epsmges5p1new.samsung.com (Symantec Messaging Gateway) with SMTP id
 9B.1B.40257.EDEA8016; Tue,  3 Aug 2021 11:50:06 +0900 (KST)
Received: from epsmtrp1.samsung.com (unknown [182.195.40.13]) by
 epcas5p2.samsung.com (KnoxPortal) with ESMTPA id
 20210802180444epcas5p25b5840be02d321439748ab69b23e9b8d~Xj2wOc34a2971929719epcas5p2g;
 Mon,  2 Aug 2021 18:04:44 +0000 (GMT)
Received: from epsmgms1p2.samsung.com (unknown [182.195.42.42]) by
 epsmtrp1.samsung.com (KnoxPortal) with ESMTP id
 20210802180444epsmtrp171eaebf930893f0a4c96b5103a71494a~Xj2wLxjHT1152211522epsmtrp1D;
 Mon,  2 Aug 2021 18:04:44 +0000 (GMT)
X-AuditID: b6c32a49-ee7ff70000019d41-79-6108aede5178
Received: from epsmtip1.samsung.com ( [182.195.34.30]) by
 epsmgms1p2.samsung.com (Symantec Messaging Gateway) with SMTP id
 BD.01.08289.CB338016; Tue,  3 Aug 2021 03:04:44 +0900 (KST)
Received: from test.sa.corp.samsungelectronics.net (unknown [107.108.56.58])
 by epsmtip1.samsung.com (KnoxPortal) with ESMTPA id
 20210802180441epsmtip153d00ac8c9b745fbbc8dcdb37ddf0edf~Xj2twTERe2969329693epsmtip1V;
 Mon,  2 Aug 2021 18:04:41 +0000 (GMT)
From: Padmakar <p.kalghatgi@samsung.com>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH v2 1/2] Adding i2c interface for qemu
Date: Mon,  2 Aug 2021 22:52:01 +0530
Message-Id: <1627924921-22531-1-git-send-email-p.kalghatgi@samsung.com>
X-Mailer: git-send-email 1.8.3.1
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFupnk+LIzCtJLcpLzFFi42LZdlhTXffeOo5Eg7c/VS3m3LewePv1AZvF
 lf3nGS32H/zGavH4zmd2i6Xz9S1ONu5htZh06BqjxZKLqRbzlz1lt1jzQtli3i1li+s/H7Fb
 XJmyiNli1rt2NovjvTtYLF5P+s9qcbP5KZuDkMePc+1sHud2nGf32LSqk81j85J6jyfXNjN5
 vN93lc2jb8sqxgD2qGybjNTElNQihdS85PyUzLx0WyXv4HjneFMzA0NdQ0sLcyWFvMTcVFsl
 F58AXbfMHKAXlBTKEnNKgUIBicXFSvp2NkX5pSWpChn5xSW2SqkFKTkFJgV6xYm5xaV56Xp5
 qSVWhgYGRqZAhQnZGQ/u+BQ8jau42XGSrYFxkksXIweHhICJxOLNeV2MXBxCArsZJf6u6GWG
 cD4xSqxvf8oI4XxmlPi+aRJbFyMnRMePNqiqXYwSh49uYYdwGpkkNk/ZwwpSxSagIXHl4X8m
 EFtEQFLid9dpsA5mgX5miZadPewgy4UFLCUO77IFqWERUJVYcX4iC4jNK+AusfTJLUaIbQoS
 Ux6+B+uVEOjkkOhoXAh1hovExJbPLBC2sMSr4yBXgNhSEi/729ghGpoZJfZ9ucIC4UxglJgy
 /x0TRJW9xMU9f5lArmAW0JRYv0sfIiwrMfXUOrASZgE+id7fT6DKeSV2zIOxVSUeXzgIdYS0
 xOyVn5ggIekhsaZbBSQsJBAr8aXpG/MERtlZCAsWMDKuYpRMLSjOTU8tNi0wzEsth0dUcn7u
 JkZwytTy3MF498EHvUOMTByMhxglOJiVRHj1W9kThXhTEiurUovy44tKc1KLDzGaAgNtIrOU
 aHI+MGnnlcQbmlgamJiZmZlYGpsZKonzssd/TRASSE8sSc1OTS1ILYLpY+LglGpg8vD7/ZjT
 TfBuiPAUFbskA4adBabN/63DZr7LsX2qpr7j/UuZEr+Q3+v/OxVaCkxRMhGwX/Hq2qvK4E38
 +7yu3LlhXrbn96rdr2SadyxZs3kiv6ZTV8gnx4SoackP/lrGzTnVk9t84+eZYzvfndVsbft8
 iu+N5beJbBPTyif3zVB6Glu24ejPfUE2HN5ONj9VWC1cqje8k9fIltxhGB75e6KnFl/hmyLn
 02evXBJ4N2HZvwvBYfnzmDbxbL+4ZrfedY2c+8ffTT66pr3FPfSLkM/irLwf9z/8XuUg/zZ1
 +XavLsY4dSdFzT7D+TtXer04OUvetWJVemPgjoUMnIwqa7tndmSv0HLxnGF/JvA9hxJLcUai
 oRZzUXEiADsQnI0iBAAA
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrJLMWRmVeSWpSXmKPExsWy7bCSnO4eY45Eg2v/xS3m3LewePv1AZvF
 lf3nGS32H/zGavH4zmd2i6Xz9S1ONu5htZh06BqjxZKLqRbzlz1lt1jzQtli3i1li+s/H7Fb
 XJmyiNli1rt2NovjvTtYLF5P+s9qcbP5KZuDkMePc+1sHud2nGf32LSqk81j85J6jyfXNjN5
 vN93lc2jb8sqxgD2KC6blNSczLLUIn27BK6MB3d8Cp7GVdzsOMnWwDjJpYuRk0NCwERi8Y82
 5i5GLg4hgR2MEt9fbWGESEhL7Ht4nQXCFpZY+e85O0TRf0aJGZ+Xs4Ik2AQ0JK48/M8EYosI
 SEr87jrNDGIzCyxlllg0Vb2LkYNDWMBS4vAuW5Awi4CqxIrzE8Fm8gq4Syx9cgtql4LElIfv
 mScw8ixgZFjFKJlaUJybnltsWGCUl1quV5yYW1yal66XnJ+7iREculpaOxj3rPqgd4iRiYPx
 EKMEB7OSCK9+K3uiEG9KYmVValF+fFFpTmrxIUZpDhYlcd4LXSfjhQTSE0tSs1NTC1KLYLJM
 HJxSDUzb4uKXfa5YvPrOMm4X34nnS02uPVt7XmRKwb0TLuce3xD4cbW8Iak8VCRFf1GX8pMZ
 l0LOn3y1++qKWttN/bVcZ/QM/hSYbp5a5d9jqLPg5o12LxHN5RHzrl6aevX0Xvcbgow1m45m
 3dQNNgxuZOGyO71qv34Yx9b6lkcZMhMOcJiGZYu9Nr1/MaRJn2nat9PHI5Tl1bXrr83JuFyr
 e5JJe+286vZ5x3czXvU4mVFnbFL9/9b6pRPmzl0tIL/G6vnb7dVnFb9smvk9tXNr9k6bErYj
 LhF/bzHcW+E5dVmOZWP8sZv/F3PwM3AdUPr7xGHf2Zh7wix5IR+Kqo48dnx4sG5rNPOT6xmv
 Mk46vQ7foMRSnJFoqMVcVJwIAGnMV4bMAgAA
X-CMS-MailID: 20210802180444epcas5p25b5840be02d321439748ab69b23e9b8d
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: REQ_APPROVE
CMS-TYPE: 105P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20210802180444epcas5p25b5840be02d321439748ab69b23e9b8d
References: <CGME20210802180444epcas5p25b5840be02d321439748ab69b23e9b8d@epcas5p2.samsung.com>
Received-SPF: pass client-ip=203.254.224.24;
 envelope-from=p.kalghatgi@samsung.com; helo=mailout1.samsung.com
X-Spam_score_int: -77
X-Spam_score: -7.8
X-Spam_bar: -------
X-Spam_report: (-7.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.701,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_HI=-5, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
 d.palani@samsung.com, linux-nvme@lists.infradead.org, mreitz@redhat.com,
 its@irrelevant.dk, u.kishore@samsung.com, stefanha@redhat.com,
 padmakar <p.kalghatgi@samsung.com>, kbusch@kernel.org, javier.gonz@samsung.com,
 prakash.v@samsung.com, mohit.kap@samsung.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: padmakar <p.kalghatgi@samsung.com>

The changes here includes the interface for i2c/smbus 
for nvme-mi protocol. We have used an address of 0x15
using which the guest VM can send and recieve the nvme-mi
commands. Since the nvme-mi device uses the I2C_SLAVE as
parent, we have used the send and recieve callbacks by
which the nvme-mi device will get the required notification.
With the callback approach, we have eliminated the use of 
threads. 

Please provide us with your valuable feedback on this patch.

---
 hw/nvme/nvme-mi.c | 152 ++++++++++++++++++++++--------------------------------
 hw/nvme/nvme-mi.h |  23 ++++++---
 2 files changed, 79 insertions(+), 96 deletions(-)

diff --git a/hw/nvme/nvme-mi.c b/hw/nvme/nvme-mi.c
index 5e93417..a90ce90 100644
--- a/hw/nvme/nvme-mi.c
+++ b/hw/nvme/nvme-mi.c
@@ -4,7 +4,7 @@
  * Copyright (c) 2021, Samsung Electronics co Ltd.
  *
  * Written by Padmakar Kalghatgi <p.kalghatgi@samsung.com>
- *            Arun Kumar Agasar <arun.ag@partner.samsung.com>
+ *            Arun Kumar Agasar <arun.kka@samsung.com>
  *            Saurav Kumar <saurav.29@partner.samsung.com>
  *
  * This code is licensed under the GNU GPL v2 or later.
@@ -19,10 +19,8 @@
  * The nvme-mi device has to be used along with nvme device only
  *
  * Add options:
- *    -device  nvme-mi,bus=<nvme bus number>
- *    -device  vhost-vsock-pci, guest-cid=<vsock cid>
+ *    -device  nvme-mi,nvme=<nvme id>,address=0x15",
  *
- * the cid is used to connect to the vsock
  */
 
 #include "qemu/osdep.h"
@@ -41,8 +39,8 @@ static void nvme_mi_send_resp(NvmeMiCtrl *ctrl_mi, uint8_t *resp, uint32_t size)
 {
     uint32_t crc_value = crc32c(0xFFFFFFFF, resp, size);
     size += 4;
-    uint32_t retries = 5;
     uint32_t offset = 0;
+    uint32_t ofst = 0;
     uint32_t som = 1;
     uint32_t eom = 0;
     uint32_t pktseq = 0;
@@ -51,24 +49,17 @@ static void nvme_mi_send_resp(NvmeMiCtrl *ctrl_mi, uint8_t *resp, uint32_t size)
         uint32_t sizesent = size > mtus ? mtus : size;
         size -= sizesent;
         eom = size > 0 ? 0 : 1;
-        g_autofree uint8_t *buf = (uint8_t *)g_malloc(sizesent + 8);
+        g_autofree uint8_t *buf = (uint8_t *)g_malloc0(sizesent + 8);
         buf[2] = sizesent + 5;
         buf[7] = (som << 7) | (eom << 6) | (pktseq << 5);
         som = 0;
         memcpy(buf + 8, resp + offset, sizesent);
         offset += sizesent;
         if (size <= 0) {
-            memcpy(buf + 4 + offset , &crc_value, sizeof(crc_value));
-        }
-        retries = 5;
-        while (retries > 0) {
-            int32_t nsend = send(ctrl_mi->sock_desc, buf, sizesent + 8, 0);
-            if (nsend < 0) {
-                retries--;
-            } else {
-                break;
-            }
+            memcpy(buf + 8 + offset , &crc_value, sizeof(crc_value));
         }
+        memcpy(ctrl_mi->misendrecv.sendrecvbuf + ofst, buf, sizesent + 8);
+        ofst += sizesent + 8;
     }
 }
 
@@ -176,7 +167,6 @@ static void nvme_mi_controller_health_ds(NvmeMiCtrl *ctrl_mi,
          (dword1 & 0x2)) {
         nvme_mi_chds.cwarn.temp_above_or_under_thresh = 0x1;
     }
-    printf("size = %lu\n", sizeof(resp) + sizeof(NvmeMiCtrlHealthDs));
     g_autofree uint8_t *resp_buf = (uint8_t *)g_malloc(sizeof(resp) +
                                                        sizeof(NvmeMiCtrlHealthDs));
     resp.mgmt_resp = 1 << 0x10;
@@ -283,9 +273,8 @@ static void nvme_mi_vpd_read(NvmeMiCtrl *ctrl_mi, NvmeMIRequest *req)
         nvme_mi_send_resp(ctrl_mi, resp_buf, dlen + sizeof(resp));
     }
 }
-
-static void nvme_mi_vpd_write(NvmeMiCtrl *ctrl_mi, NvmeMIRequest *req,
-                              uint8_t *buf)
+static void nvme_mi_vpd_write(NvmeMiCtrl *ctrl_mi,
+                              NvmeMIRequest *req, uint8_t *buf)
 {
     uint16_t dofst = (req->dword0 & 0xFFFF);
     uint16_t dlen = (req->dword1 & 0xFFFF);
@@ -308,7 +297,7 @@ static void nvme_mi_nvm_subsys_health_status_poll(NvmeMiCtrl *ctrl_mi,
     NvmeMiNvmSubsysHspds nshds;
     nvme_mi_resp_hdr_init(&resp, false);
     for (uint32_t cntlid = 1; cntlid < ARRAY_SIZE(ctrl_mi->n->subsys->ctrls);
-         cntlid++) {
+                  cntlid++) {
 
         NvmeCtrl *ctrl = nvme_subsys_ctrl(ctrl_mi->n->subsys, cntlid);
         if (!ctrl) {
@@ -335,7 +324,8 @@ static void nvme_mi_nvm_subsys_health_status_poll(NvmeMiCtrl *ctrl_mi,
     }
 
 
-    g_autofree uint8_t *resp_buf = (uint8_t *)g_malloc(sizeof(resp) + sizeof(nshds));
+    g_autofree uint8_t *resp_buf = (uint8_t *)g_malloc(sizeof(resp) +
+                                                       sizeof(nshds));
     memcpy(resp_buf, &resp, sizeof(resp));
     memcpy(resp_buf + sizeof(resp), &nshds, sizeof(nshds));
     nvme_mi_send_resp(ctrl_mi, resp_buf, sizeof(resp_buf));
@@ -553,15 +543,12 @@ static void nvme_mi_admin_command(NvmeMiCtrl *ctrl_mi, void* req_arg)
         NvmeAdminMIRequest *req = (NvmeAdminMIRequest *) (msg);
         switch  (req->opc) {
         case NVME_ADM_MI_CMD_IDENTIFY:
-            printf("identify\n");
             nvme_mi_admin_identify(ctrl_mi, req);
             break;
         case NVME_ADM_MI_CMD_GET_LOG_PAGE:
-            printf("get log page\n");
             nvme_mi_admin_get_log_page(ctrl_mi, req);
             break;
         case NVME_ADM_MI_CMD_GET_FEATURES:
-            printf("get features\n");
             nvme_mi_admin_get_features(ctrl_mi, req);
             break;
         default:
@@ -578,92 +565,79 @@ static void nvme_mi_admin_command(NvmeMiCtrl *ctrl_mi, void* req_arg)
     return;
 }
 
-static void nvme_mi_init(NvmeMiCtrl *ctrl_mi)
+static uint8_t nvme_mi_i2c_recv(I2CSlave *s)
 {
-    pthread_t vsock_tid;
-    pthread_create(&vsock_tid, NULL, vsock_server_start, ctrl_mi);
-    pthread_detach(vsock_tid);
+    NvmeMiCtrl *mictrl = (NvmeMiCtrl *)s;
+    NvmeMiSendRecvStruct *misendrecv = &mictrl->misendrecv;
+    if (misendrecv->bsyncflag == true) {
+        return -1;
+    }
+    return misendrecv->sendrecvbuf[misendrecv->sendlen++];
 }
 
-void *vsock_server_start(void *arg)
+static int nvme_mi_i2c_send(I2CSlave *s, uint8_t data)
 {
-    NvmeMiCtrl *ctrl_mi = (NvmeMiCtrl *)arg;
-    int listenfd = 0, c = 0;
-    struct sockaddr_vm sa = {
-                        .svm_family = AF_VSOCK,
-                        .svm_cid = VMADDR_CID_ANY,
-                        .svm_port = 1342,
-                    };
-    struct sockaddr_vm client;
-    listenfd = socket(AF_VSOCK, SOCK_STREAM, 0);
-    if (listenfd == -1) {
-        pthread_exit(NULL);
-    }
-    if (bind(listenfd, (struct sockaddr *)&sa, sizeof(sa)) < 0) {
-        pthread_exit(NULL);
+    NvmeMiCtrl *mictrl = (NvmeMiCtrl *)s;
+    NvmeMiSendRecvStruct *misendrecv = &mictrl->misendrecv;
+
+    misendrecv->bsyncflag = true;
+    misendrecv->sendlen = 0;
+    switch (misendrecv->len) {
+    case 1:
+        misendrecv->total_len = data;
+        break;
+    case 6:
+        misendrecv->eom = (data & 0x40) >> 6;
+        break;
     }
-    listen(listenfd, 1);
-    puts("Waiting for incoming connections...");
-    c = sizeof(struct sockaddr_vm);
-    while (1) {
-        ctrl_mi->sock_desc = accept(listenfd, (struct sockaddr *)&client,
-                                       (socklen_t *)&c);
-        if ((ctrl_mi->sock_desc) < 0) {
-            continue;
-        }
-
-        NvmeMiMctpHeader mctp_hdr;
-        uint32_t total_len = 0;
-        uint8_t *getdata_buf = NULL;
-        while (!mctp_hdr.EOM) {
-            uint8_t buf[7];
-            recv(ctrl_mi->sock_desc, buf, 7, 0);
-            mctp_hdr.byte_count = buf[1];
-            mctp_hdr.EOM = (buf[6] & 0x40) >> 6;
-            mctp_hdr.SOM = (buf[6] & 0x80) >> 7;
-            mctp_hdr.pckt_seq = (buf[6] & 0x20) >> 5;
-
-            uint32_t curr_len = total_len;
-            total_len = total_len + (mctp_hdr.byte_count - 5);
-
-            getdata_buf = (uint8_t *)g_realloc(getdata_buf, total_len);
-            recv(ctrl_mi->sock_desc, getdata_buf + curr_len,
-                        (mctp_hdr.byte_count - 5), 0);
+    misendrecv->sendrecvbuf[++misendrecv->len] = data;
+    if (misendrecv->len == misendrecv->total_len + 3) {
+        misendrecv->cmdbuffer = (uint8_t *)g_realloc(misendrecv->cmdbuffer,
+                                                     misendrecv->len - 5);
+        memcpy(misendrecv->cmdbuffer + misendrecv->offset,
+               misendrecv->sendrecvbuf + 8, misendrecv->len - 5);
+
+        misendrecv->offset = misendrecv->len - 5;
+        misendrecv->total_len = 0;
+        misendrecv->len = 0;
+
+        if (misendrecv->eom == 1) {
+            nvme_mi_admin_command(mictrl, misendrecv->cmdbuffer);
+            misendrecv->offset = 0;
+            misendrecv->bsyncflag = false;
         }
-        NvmeMiMessageHeader msghdr;
-        memcpy(&msghdr, getdata_buf, sizeof(NvmeMiMessageHeader));
-        nvme_mi_admin_command(ctrl_mi, getdata_buf);
     }
-    pthread_exit(0);
+    return 0;
 }
 
 static void nvme_mi_realize(DeviceState *dev, Error **errp)
 {
-    NvmeMiCtrl *ctrl_mi = (NvmeMiCtrl *)malloc(sizeof(NvmeMiCtrl));
-    BusState *s = qdev_get_parent_bus(dev);
-    ctrl_mi->n = NVME(s->parent);
-    ctrl_mi->mctp_unit_size = 64;
-    ctrl_mi->smbus_freq = 0x01;
-    ctrl_mi->sock_desc = 0;
-    memset(&ctrl_mi->vpd_data, 0, sizeof(ctrl_mi->vpd_data));
-
-    nvme_mi_init(ctrl_mi);
+    NvmeMiCtrl *s = (NvmeMiCtrl *)(dev);
+
+    s->smbus_freq = 100;
+    s->mctp_unit_size = 64;
 }
+static Property nvme_mi_props[] = {
+     DEFINE_PROP_LINK("nvme", NvmeMiCtrl, n, TYPE_NVME,
+                     NvmeCtrl *),
+    DEFINE_PROP_END_OF_LIST(),
+};
 
 static void nvme_mi_class_init(ObjectClass *oc, void *data)
 {
+    I2CSlaveClass *k = I2C_SLAVE_CLASS(oc);
     DeviceClass *dc = DEVICE_CLASS(oc);
 
-    set_bit(DEVICE_CATEGORY_STORAGE, dc->categories);
-
-    dc->bus_type = TYPE_NVME_BUS;
     dc->realize = nvme_mi_realize;
-    dc->desc = "nvme mi";
+    k->recv = nvme_mi_i2c_recv;
+    k->send = nvme_mi_i2c_send;
+
+    device_class_set_props(dc, nvme_mi_props);
 }
 
 static const TypeInfo nvme_mi = {
     .name = TYPE_NVME_MI,
-    .parent = TYPE_DEVICE,
+    .parent = TYPE_I2C_SLAVE,
     .instance_size = sizeof(NvmeMiCtrl),
     .class_init = nvme_mi_class_init,
 };
diff --git a/hw/nvme/nvme-mi.h b/hw/nvme/nvme-mi.h
index 4c155a0..92a20e6 100644
--- a/hw/nvme/nvme-mi.h
+++ b/hw/nvme/nvme-mi.h
@@ -5,7 +5,7 @@
  *
  * Authors:
  *   Padmakar Kalghatgi      <p.kalghatgi@samsung.com>
- *   Arun Kumar Agasar       <arun.ag@partner.samsung.com>
+ *   Arun Kumar Agasar       <arun.kka@samsung.com>
  *   Saurav Kumar            <saurav.29@partner.samsung.com>
  *
  * This code is licensed under the GNU GPL v2 or later.
@@ -14,14 +14,12 @@
 #ifndef NVME_MI_H
 #define NVME_MI_H
 
-#include <sys/socket.h>
-#include <linux/vm_sockets.h>
 #include <stdio.h>
 #include <string.h>
 #include <unistd.h>
 #include <stdint.h>
 #include <stdbool.h>
-#include <pthread.h>
+#include "hw/i2c/i2c.h"
 
 #define TYPE_NVME_MI "nvme-mi"
 
@@ -32,17 +30,28 @@
 #define OPT_SUPP_CMD_LIST 4
 #define MGMT_EPT_BUFF_CMD_SUPP_LIST 5
 
+
+typedef struct NvmeMiSendRecvStruct {
+   uint32_t sendlen;
+   uint8_t len;
+   uint8_t total_len;
+   uint32_t offset;
+   uint8_t eom;
+   bool bsyncflag;
+   u_char sendrecvbuf[5000];
+   uint8_t *cmdbuffer;
+} NvmeMiSendRecvStruct;
 typedef struct NvmeMiVpdElements {
     long common_header;
 } NvmeMiVpdElements;
 
 typedef struct NvmeMiCtrl {
-   int32_t sock_desc;
+   I2CSlave parent_obj;
    uint32_t mctp_unit_size;
    uint32_t smbus_freq;
-   NvmeCtrl *n;
    NvmeMiVpdElements vpd_data;
-   u_char dummy[1000];
+   NvmeMiSendRecvStruct  misendrecv;
+   NvmeCtrl *n;
 } NvmeMiCtrl;
 
 enum NvmeMiMngmtInterfaceCmdSetsOpcodes {
-- 
2.7.0.windows.1


