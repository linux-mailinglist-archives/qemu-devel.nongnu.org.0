Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 68B853CEB95
	for <lists+qemu-devel@lfdr.de>; Mon, 19 Jul 2021 22:06:33 +0200 (CEST)
Received: from localhost ([::1]:40926 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m5ZX6-0005ho-DP
	for lists+qemu-devel@lfdr.de; Mon, 19 Jul 2021 16:06:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47690)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jag.raman@oracle.com>)
 id 1m5ZRP-0005rh-5X
 for qemu-devel@nongnu.org; Mon, 19 Jul 2021 16:00:40 -0400
Received: from mx0a-00069f02.pphosted.com ([205.220.165.32]:24166)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jag.raman@oracle.com>)
 id 1m5ZRL-0005Qk-0H
 for qemu-devel@nongnu.org; Mon, 19 Jul 2021 16:00:38 -0400
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 16JJudNv002502; Mon, 19 Jul 2021 20:00:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : content-type :
 mime-version; s=corp-2021-07-09;
 bh=3SxDd3ZXIB+irqGn7Cyg1NVPw9m9wYjCsB52ZuqV+28=;
 b=nXjT6oqzonzvVXGqgXO/X5ugp17OQJGOw+J1ilOhMQ+RMPS0WkuqE1sPLESjZnPD276V
 oi2Tbp3MIjDmd2wo80lshSj1ixLYNo5I6FOkxTUKgii0WHmOuyeVlDI/nQMjM0djYuMd
 zk9P9tx/bO+IBKNNLhFFICLc9LB00Duzx8DCV+9S2dVh80lxK30AYIiAcotcS8kvbPec
 kvhSy2ZaC8fEHS8/3oPRrN0eWp3LSpYJ9MRiker6FZ0uMSLc8XJsWG9s6C3SfhRqdkiR
 xagMZFzC3/q5bbfvtqDAsVmVt2UfunGBxgaXiXDsmeHaTUulST50K+SXBCRblkiVIj2X yQ== 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : content-type :
 mime-version; s=corp-2020-01-29;
 bh=3SxDd3ZXIB+irqGn7Cyg1NVPw9m9wYjCsB52ZuqV+28=;
 b=SLGIqR/EOCBKbTNdOHna3V2BJM3xi82OQ7+Q3F7mhjgC0Zu4/0nQTyZTRr1c/rCEL+qy
 RFwuwL+JVm/VJt6u8prv2soak8MK7PJxTkZLLYEnvCW+9zc2wGSI2IXk7D1JX/oXo+Io
 bjiEJuNtI5ZLyCBjkskA4E1lqmu6+d4u+crNSinqFpZpi3BcKl1nE2ZLazP4kchmrZrt
 04KlYl7nSBO2jxvfrEYtkh7UAWWZ+2dzC5XOjeHUOBHW7X83PbCT2dA7JRkj4hnduomI
 H24cd3iVVHFQPZ+kgXaPRNtVjRVgFzDhXAIokC1OZkM4Qw7kbGR08Jv9cFwC0L7T0UMa ew== 
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
 by mx0b-00069f02.pphosted.com with ESMTP id 39vrn5j9xk-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 19 Jul 2021 20:00:32 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
 by aserp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 16JJf5Is033120;
 Mon, 19 Jul 2021 20:00:31 GMT
Received: from nam10-mw2-obe.outbound.protection.outlook.com
 (mail-mw2nam10lp2103.outbound.protection.outlook.com [104.47.55.103])
 by aserp3020.oracle.com with ESMTP id 39uq15b6up-2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 19 Jul 2021 20:00:30 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gCUBy2YSJaF0EqflcdjH7pRGoVW90Wy15FyQ60SsYBfvWWVOQ+dt/U+Uh5C1eOt0udeMxJc+KSJIak4NZsrubqtbFXJwIyYTssWSYrknSeQ0g8MYD1EtKa9QXLrtljvzd+ZvKTR0mXVvkBQZYLD2pw5DnTafPlTf6TYPYNeBvM4mq5rq0FAacW0Zr8r2gkht+QCW+Gvjb/74AvHJzARKLqL14uolI1EnU9nU2021eWX09GNdmvWhvmkIWVvTgx+6B1L10es1ISMbXVt30nSV+UspwNaiQgvMzeGdMNSy92PDbj7zzI5YblDGuKUXmUOa1zFmAN05IsFtA9HTXCTl6g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3SxDd3ZXIB+irqGn7Cyg1NVPw9m9wYjCsB52ZuqV+28=;
 b=bzAortg6QHFj9AeySy6cZxhMclLaY7cOh0QDH4wdatfcI3MiUJO2+eq+Ay2Kq5TxZ6bH5CGRPhXDnNFup0vorTGSk3HmdiA69qMhwie+jjRv33Dn4KSN6NkYtAKw9WW84RnaYaNl3r9yrn4Hv/SnwkEzAdgxauFO7ku6LOKze9RqSCEkH5I6oc1f3NI7sgFcdt8yb6oU08r/x6Nd70cCa6MPV2isX2aB5Rgivmx7DfxMP5UYwSRHjxbkOSLsvUNMyDjMX0DOgZMOVNPLzysdSEVRyiksnmIyZ/1aYGAJMqLrhAXbt52ztk3lKuByd0K33R6+L+xQ+ZHvIJZjWHwyMA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3SxDd3ZXIB+irqGn7Cyg1NVPw9m9wYjCsB52ZuqV+28=;
 b=xoJ2vcYzZuCpgXNdkGkmmfzo5fmDTdBKuU8ugbcIZAjKteisPwsOHgZUkWocCE3zJVaTx5ysCPiYDkIbUAVYhB8daMzuUhka1a5IPV6nQwCVClHfFmegjem6VKD9fIqoUGmbWhT2H3CsHc19FTxKzCG6dULKmrgCToDMv6/pBvQ=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=oracle.com;
Received: from MN2PR10MB4013.namprd10.prod.outlook.com (2603:10b6:208:185::25)
 by MN2PR10MB3853.namprd10.prod.outlook.com (2603:10b6:208:180::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4331.26; Mon, 19 Jul
 2021 20:00:28 +0000
Received: from MN2PR10MB4013.namprd10.prod.outlook.com
 ([fe80::e935:82a8:3c37:8aa4]) by MN2PR10MB4013.namprd10.prod.outlook.com
 ([fe80::e935:82a8:3c37:8aa4%4]) with mapi id 15.20.4331.033; Mon, 19 Jul 2021
 20:00:28 +0000
From: Jagannathan Raman <jag.raman@oracle.com>
To: qemu-devel@nongnu.org
Subject: [PATCH RFC server 08/11] vfio-user: handle PCI BAR accesses
Date: Mon, 19 Jul 2021 16:00:10 -0400
Message-Id: <ada307c461a47f808a457d2b7d2a12357a8979fd.1626722742.git.jag.raman@oracle.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <cover.1626722742.git.jag.raman@oracle.com>
References: <cover.1626675354.git.elena.ufimtseva@oracle.com>
 <cover.1626722742.git.jag.raman@oracle.com>
Content-Type: text/plain
X-ClientProxiedBy: SA0PR11CA0040.namprd11.prod.outlook.com
 (2603:10b6:806:d0::15) To MN2PR10MB4013.namprd10.prod.outlook.com
 (2603:10b6:208:185::25)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from jaraman-bur-1.us.oracle.com (209.17.40.44) by
 SA0PR11CA0040.namprd11.prod.outlook.com (2603:10b6:806:d0::15) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4331.21 via Frontend Transport; Mon, 19 Jul 2021 20:00:27 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 8287826d-0bd2-4507-a0b9-08d94aefdadf
X-MS-TrafficTypeDiagnostic: MN2PR10MB3853:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <MN2PR10MB3853DE8952E3DC476E9980D890E19@MN2PR10MB3853.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:346;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: NZyIbrhj5Ans6ZRZNNHfmu8ReJ5q2cucOyKJ1evzleJD3Ili9sqJ0jjoWEDgpMfMeAJyVxUg7S8I8giZmn+xbyzEQW0wOPdhn8z3Dwd6ob3FenbsUbRchRb2bkWW+IVAOKyvOYGjITlV/NehY61So3JE2LYTDKFEphTYoajNWob+dcsUL0DpIySQ59yOTSBH6j/SBP3XrXxCXQB28loXAT9ekrnTW5edB7PUK/lHrWFGmc2TsRY1Gng3P05Aoe2nU1tkFsjIpU4J5V9rBbGsnEUfgrPNnroKIOGJHzAKCXjIqQvufVO2sjx2s3ZL1HZ03aZHdWe1wUTi4GMNXglThYGJsoDAQLw9JZvtI148tKQ3H+R9I5mhKBOntvPdoFCZs3S+t/nRiCYURtiHJnnHeMbT+sQa5XywwrcapFwTh8/SXL7KBwx6i/RBmC8LhJQkK50QQrMNDT5i+EBDfYcxxm7/pX7vTS3lYmcK8c5iWA+H82OyO2lS3tcrTrZL20x0vGoATyq9gcTiKIH8FQ3hvpAozrVVW11yNLJ0/0KCqRc4i4q5C3TmihyvKYO4B31xOwms4eaCcTDZ2lEXHaRvBNtvJpaBM96e1ZOAyBP0D01FJO2BcNCTwX97470QiScrX+VHH55TflgTMccSMmUqSH4l0ll4ciq1FUo2r4c8crucaRpu6ORi6yhKQez3+81ixfN0OuLmUCmMmLevkqiegw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR10MB4013.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(316002)(5660300002)(956004)(2616005)(107886003)(7696005)(26005)(6666004)(508600001)(38350700002)(38100700002)(52116002)(36756003)(86362001)(186003)(6486002)(4326008)(66556008)(66476007)(6916009)(66946007)(83380400001)(8676002)(2906002)(8936002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: qxP+SHuYoUmw73SSR3WdhJLRoF7AWaqtvW0PWzNMDXdY+kKwO7jJODtK/oAiO1kOQ+rMpVBY4hHkWyKXcEONWiIpnSl0aIGrNGSxFyb9SUbVTfY7v5XWIUbaORLQpV3d+vrARFFXCmenrL5W15l7j4wtjiwMzsYhI2HEAHF+SLUYSHxtagIQWg8QYjVCH/abUNOTlLhw6kpPh4QucGsioE1aG33Jm/V3kDQoqbCXa7k/6j+MIVBJwRmytnb1OpmnoTdy9HiuXcQ/GVHvGY/K/S/GTHA6tAO2jiPSJw4bVuDoWJX2wX3LoqribFKDaYL1u5/l7REDPzkXC+HlvwmfnhgYkpGKqQeJGTwYtGPB4nsIjvEWRLkRh543wgRi7Rcs2zGHFWgZCRoqo3WrVzIIsj3A8wlXBjyrSgawA20sC4JCE0PrJE+PAomhKGQU2Np7H+u8um/d/pvswpkx6vjZem9lCo3rKekx9/J6pvyLBKL825lvprxZwecV6agHsqe6QWb9SoQ7+mOA8VZaCZDW6IRRqP/Etr3faXZgTrKzCInYgJwGTCP5ULLbRn7Y5wHikT+FZe9xyY3zR6uPehP8UdKW/nmtuv5k6ZZdaT1VL3+uljzp3pvwvmFhdDWuYLmUKUdzittzA5spG2mHaKeuoBLyvk6Vcx6VMMxEGmSqG/l4EDdNVJ4ZB2DSFWCUz0PV1gsTjeboDIp6qQ9/l0YTSh8E4Y5eHcc9RbbQnRNQ5GvcxY7297qNwwzezxusMIGE
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8287826d-0bd2-4507-a0b9-08d94aefdadf
X-MS-Exchange-CrossTenant-AuthSource: MN2PR10MB4013.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jul 2021 20:00:28.0772 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YPxWVnYzdZDV2GmBPBjsKio9hGjPsXoMeSGVokmaURkelRPH/hLrdRVnQ9ogjoUGedXNB75Cn1C5ahjlwnW2FA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR10MB3853
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=10050
 signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0
 malwarescore=0
 mlxlogscore=999 suspectscore=0 bulkscore=0 spamscore=0 phishscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104190000 definitions=main-2107190112
X-Proofpoint-GUID: mXIv2UsOMw7AZ3fSLdm56u5Ikbz0CfK_
X-Proofpoint-ORIG-GUID: mXIv2UsOMw7AZ3fSLdm56u5Ikbz0CfK_
Received-SPF: pass client-ip=205.220.165.32; envelope-from=jag.raman@oracle.com;
 helo=mx0a-00069f02.pphosted.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
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
Cc: elena.ufimtseva@oracle.com, john.g.johnson@oracle.com, jag.raman@oracle.com,
 swapnil.ingle@nutanix.com, john.levon@nutanix.com, alex.williamson@redhat.com,
 stefanha@redhat.com, thanos.makatos@nutanix.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Determine the BARs used by the PCI device and register handlers to
manage the access to the same.

Signed-off-by: Elena Ufimtseva <elena.ufimtseva@oracle.com>
Signed-off-by: John G Johnson <john.g.johnson@oracle.com>
Signed-off-by: Jagannathan Raman <jag.raman@oracle.com>
---
 hw/remote/vfio-user-obj.c | 95 +++++++++++++++++++++++++++++++++++++++++++++++
 hw/remote/trace-events    |  2 +
 2 files changed, 97 insertions(+)

diff --git a/hw/remote/vfio-user-obj.c b/hw/remote/vfio-user-obj.c
index d158a7f..9853feb 100644
--- a/hw/remote/vfio-user-obj.c
+++ b/hw/remote/vfio-user-obj.c
@@ -212,6 +212,99 @@ static int dma_unregister(vfu_ctx_t *vfu_ctx, vfu_dma_info_t *info)
     return 0;
 }
 
+static ssize_t vfu_object_bar_rw(PCIDevice *pci_dev, hwaddr addr, size_t count,
+                                 char * const buf, const bool is_write,
+                                 uint8_t type)
+{
+    AddressSpace *as = NULL;
+    MemTxResult res;
+
+    if (type == PCI_BASE_ADDRESS_SPACE_MEMORY) {
+        as = pci_device_iommu_address_space(pci_dev);
+    } else {
+        as = &address_space_io;
+    }
+
+    trace_vfu_bar_rw_enter(is_write ? "Write" : "Read", (uint64_t)addr);
+
+    res = address_space_rw(as, addr, MEMTXATTRS_UNSPECIFIED, (void *)buf,
+                           (hwaddr)count, is_write);
+    if (res != MEMTX_OK) {
+        warn_report("vfu: failed to %s 0x%"PRIx64"",
+                    is_write ? "write to" : "read from",
+                    addr);
+        return -1;
+    }
+
+    trace_vfu_bar_rw_exit(is_write ? "Write" : "Read", (uint64_t)addr);
+
+    return count;
+}
+
+/**
+ * VFU_OBJECT_BAR_HANDLER - macro for defining handlers for PCI BARs.
+ *
+ * To create handler for BAR number 2, VFU_OBJECT_BAR_HANDLER(2) would
+ * define vfu_object_bar2_handler
+ */
+#define VFU_OBJECT_BAR_HANDLER(BAR_NO)                                         \
+    static ssize_t vfu_object_bar##BAR_NO##_handler(vfu_ctx_t *vfu_ctx,        \
+                                        char * const buf, size_t count,        \
+                                        loff_t offset, const bool is_write)    \
+    {                                                                          \
+        VfuObject *o = vfu_get_private(vfu_ctx);                               \
+        hwaddr addr = (hwaddr)(pci_get_long(o->pci_dev->config +               \
+                                            PCI_BASE_ADDRESS_0 +               \
+                                            (4 * BAR_NO)) + offset);           \
+                                                                               \
+        return vfu_object_bar_rw(o->pci_dev, addr, count, buf, is_write,       \
+                                 o->pci_dev->io_regions[BAR_NO].type);         \
+    }                                                                          \
+
+VFU_OBJECT_BAR_HANDLER(0)
+VFU_OBJECT_BAR_HANDLER(1)
+VFU_OBJECT_BAR_HANDLER(2)
+VFU_OBJECT_BAR_HANDLER(3)
+VFU_OBJECT_BAR_HANDLER(4)
+VFU_OBJECT_BAR_HANDLER(5)
+
+static vfu_region_access_cb_t *vfu_object_bar_handlers[PCI_NUM_REGIONS] = {
+    &vfu_object_bar0_handler,
+    &vfu_object_bar1_handler,
+    &vfu_object_bar2_handler,
+    &vfu_object_bar3_handler,
+    &vfu_object_bar4_handler,
+    &vfu_object_bar5_handler,
+};
+
+/**
+ * vfu_object_register_bars - Identify active BAR regions of pdev and setup
+ *                            callbacks to handle read/write accesses
+ */
+static void vfu_object_register_bars(vfu_ctx_t *vfu_ctx, PCIDevice *pdev)
+{
+    uint32_t orig_val, new_val;
+    int i, size;
+
+    for (i = 0; i < PCI_NUM_REGIONS; i++) {
+        orig_val = pci_default_read_config(pdev,
+                                           PCI_BASE_ADDRESS_0 + (4 * i), 4);
+        new_val = 0xffffffff;
+        pci_default_write_config(pdev,
+                                 PCI_BASE_ADDRESS_0 + (4 * i), new_val, 4);
+        new_val = pci_default_read_config(pdev,
+                                          PCI_BASE_ADDRESS_0 + (4 * i), 4);
+        size = (~(new_val & 0xFFFFFFF0)) + 1;
+        pci_default_write_config(pdev, PCI_BASE_ADDRESS_0 + (4 * i),
+                                 orig_val, 4);
+        if (size) {
+            vfu_setup_region(vfu_ctx, VFU_PCI_DEV_BAR0_REGION_IDX + i, size,
+                             vfu_object_bar_handlers[i], VFU_REGION_FLAG_RW,
+                             NULL, 0, -1, 0);
+        }
+    }
+}
+
 static void vfu_object_machine_done(Notifier *notifier, void *data)
 {
     VfuObject *o = container_of(notifier, VfuObject, machine_done);
@@ -266,6 +359,8 @@ static void vfu_object_machine_done(Notifier *notifier, void *data)
         return;
     }
 
+    vfu_object_register_bars(o->vfu_ctx, o->pci_dev);
+
     qemu_thread_create(&o->vfu_ctx_thread, "VFU ctx runner", vfu_object_ctx_run,
                        o, QEMU_THREAD_JOINABLE);
 }
diff --git a/hw/remote/trace-events b/hw/remote/trace-events
index f945c7e..f3f65e2 100644
--- a/hw/remote/trace-events
+++ b/hw/remote/trace-events
@@ -9,3 +9,5 @@ vfu_cfg_read(uint32_t offset, uint32_t val) "vfu: cfg: 0x%u -> 0x%x"
 vfu_cfg_write(uint32_t offset, uint32_t val) "vfu: cfg: 0x%u <- 0x%x"
 vfu_dma_register(uint64_t gpa, size_t len) "vfu: registering GPA 0x%"PRIx64", %zu bytes"
 vfu_dma_unregister(uint64_t gpa) "vfu: unregistering GPA 0x%"PRIx64""
+vfu_bar_rw_enter(const char *op, uint64_t addr) "vfu: %s request for BAR address 0x%"PRIx64""
+vfu_bar_rw_exit(const char *op, uint64_t addr) "vfu: Finished %s of BAR address 0x%"PRIx64""
-- 
1.8.3.1


