Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F93F5BA33C
	for <lists+qemu-devel@lfdr.de>; Fri, 16 Sep 2022 01:34:52 +0200 (CEST)
Received: from localhost ([::1]:57132 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oYyNf-0004Bq-02
	for lists+qemu-devel@lfdr.de; Thu, 15 Sep 2022 19:34:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59514)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <venu.busireddy@oracle.com>)
 id 1oYyMK-0002Xj-3j
 for qemu-devel@nongnu.org; Thu, 15 Sep 2022 19:33:28 -0400
Received: from mx0a-00069f02.pphosted.com ([205.220.165.32]:2676)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <venu.busireddy@oracle.com>)
 id 1oYyMF-0002MX-W7
 for qemu-devel@nongnu.org; Thu, 15 Sep 2022 19:33:27 -0400
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 28FLNwpR017320;
 Thu, 15 Sep 2022 23:33:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : content-transfer-encoding : content-type :
 mime-version; s=corp-2022-7-12;
 bh=xwYxLvzJuS8tJQkyuP9xzYeoOxeLpTP+7UN5br3If3A=;
 b=gXIkTJ7Uc0GTS2V/FeS7P6WoU2yc+0RX7Hecppaleqzr7n4clmuH86S/v5sOcO8Y1CgM
 B3OWKPZRtRqi1nByphh9KYPJZRfUzboAz/KPsUUJmcUViS40HfNBVv90opOwy/uSjQ70
 iAD/cQclpL3zNV6UZERMucZw5fhPQ1ccnjNB7E+jfsEqTGuMxpotJRRxpAbB9K+YHgVw
 quHxLTIRyC6XrWYo78Guacyq003ZAqLOmMFu0YaV+7b2SvLCPCvCHYUj7BbZJOChBMR6
 8sYlQb0LaUB7OFv4XsJP2ka7uwfbeqs0jCClU141s8DPypqIXmjKLpSn2aKrWeL16xJJ Hw== 
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com
 (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3jm8xbrwk2-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 15 Sep 2022 23:33:08 +0000
Received: from pps.filterd
 (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
 by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.17.1.5/8.17.1.5)
 with ESMTP id 28FL4wiv013174; Thu, 15 Sep 2022 23:33:08 GMT
Received: from nam12-bn8-obe.outbound.protection.outlook.com
 (mail-bn8nam12lp2169.outbound.protection.outlook.com [104.47.55.169])
 by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id
 3jm8x92fvj-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 15 Sep 2022 23:33:08 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FNRR5p61knLKSXPBMDq/dX6bGK+TboOpwVHQAhltAQpuajISGN2jOVxAQW53S7tsXSk919Yds7u6l+6WJa3drpItCPqOlE53woRQLWRpCeYO2P/Nqk4pa4QMTlp+nxbUx7K2ZdJBbD3qEOuy6Qtd5kmdMDQsNVuoq7cSCnE4C/UrsUHdMSrdPwqnNI3Sn892dBX8NTHFhR0lGh+/RDJ0XHhQTGWRzcDYUN+EzEXxgHyJPGMyL4r+EazMj2HiaZPwVE39nUXy595xeYQ7fDh49jrR3tRlo7dcYBamFA5dM3umModPm7+3n4t0u+EM23gQRuPZkihXyGvBXQZHgE89iQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xwYxLvzJuS8tJQkyuP9xzYeoOxeLpTP+7UN5br3If3A=;
 b=nQC4gG/HH3ZMxndSponcRUXek3wo33+PG+keKs5Olny64xn+WTTgS4EgATaSwJtFZ7Yto6To1NG1sLqn8BPIqWJ1psQ/9SWzMMq8bZvjKlw9SkZYOhE9L6wrt61Gcr4BaKKDOj+UiMHqUtqNy+WYUV/Q03M3+tfCt927aoC1LT1heSDygdWBdbWKOn+sUU90e6p9z3Tgyh3Enq0Rn0FTE6KtcaFFvWo3ZAJW+sARZ6Pzu1F0f6dHXJtl0Gv+N+I/Ka2ZQhBr+07mwG8v4iGH8m03P4QjxszOyTd6M0zXfjorG2ai4nDihCRuDyxRlMx9FSpCd8LDl+p/WNec75DrJg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xwYxLvzJuS8tJQkyuP9xzYeoOxeLpTP+7UN5br3If3A=;
 b=dBiAZh+e5Fme8Oy2EECsg3hW+VxT7u21Nz67szBEEX3WK32/uXAxpewHzMzNwIdU4Ab3Ti9GLcHS98VTHr+KySjw01DaZRcM/4HJnrnAkb7utEmvTBJWpNqhPKkpHVp7Dj/mrErpE2m0DLRKPyhebdcC+lx7XdZxOUGPOYBbL0M=
Received: from SN6PR10MB2576.namprd10.prod.outlook.com (2603:10b6:805:44::15)
 by PH0PR10MB5578.namprd10.prod.outlook.com (2603:10b6:510:f1::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5612.14; Thu, 15 Sep
 2022 23:33:06 +0000
Received: from SN6PR10MB2576.namprd10.prod.outlook.com
 ([fe80::8563:4b2c:8877:1815]) by SN6PR10MB2576.namprd10.prod.outlook.com
 ([fe80::8563:4b2c:8877:1815%7]) with mapi id 15.20.5632.016; Thu, 15 Sep 2022
 23:33:06 +0000
From: Venu Busireddy <venu.busireddy@oracle.com>
To: venu.busireddy@oracle.com, qemu-devel@nongnu.org
Cc: Fam Zheng <fam@euphon.net>, "Michael S. Tsirkin" <mst@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Subject: [PATCH v2] virtio-scsi: Send "REPORTED LUNS CHANGED" sense data upon
 disk hotplug events.
Date: Thu, 15 Sep 2022 18:33:02 -0500
Message-Id: <20220915233302.145926-1-venu.busireddy@oracle.com>
X-Mailer: git-send-email 2.37.3
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BYAPR05CA0101.namprd05.prod.outlook.com
 (2603:10b6:a03:e0::42) To SN6PR10MB2576.namprd10.prod.outlook.com
 (2603:10b6:805:44::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN6PR10MB2576:EE_|PH0PR10MB5578:EE_
X-MS-Office365-Filtering-Correlation-Id: be16568f-9b04-4cc1-a6b7-08da9772a3db
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: hQpwu4goifsmqOs0b3goTAapeMTE65w0FIefT62DpLEgIpOpA0gUstffHXttenhTEO9HpGtwyIMZro8/FgflVCSPSjptznnhTIRUg2+utr0rRH+kL3S5+iu6X8mYauou29gFaFwtuwP7r2Tn2b/KifplAvCt5+8G3xO6coQggXuWFYsvyQc8gtNYXhwJHrNJXwy35Epi7W1+g4zUXWr87HgVOjN3cdd6KvLs8c2Y9ZtO3SVLoQJDm7VrlbkQL1B4h5me/3VSqAUFdQLASJUmokPcAYX28jjwuyRQEm4vR81W1cPQajoEgrkbTlxw6DC/NdWCtrVM6CJgM/Pdm9G5LB6h6XNHefMQoOyGSIMZDdwEr37gL3g1QjFrdPWaO4qHdPU7HdbhFRNKSKGIRJ5y/x0sGpPj+q8bcFnLrQnd3olymJji9dq24LqVoEcXbi0mG9JQ9KdVS7V0qtSe8zltgeelott5lh3FQ7dr2ry1ap1gRGr7dFPMX3SkRvGcnE/mmLPS/CgJ6I5XvfIpQNXb/FtNKNnyaBMWum5MxGGeFHw6NXmq+FSo9LnpTtRqTfdy3Fi2Z9LuzO1NF7TTxaVWn3fb48kuG6Jkpc+yiBSeoLK5j/CtfhNauUDE9sjMjNDNkBXA7zOvtQPEhAQIm8o1sID7Wk9uxuIWI2AaaiYIBPx6VKIpKhKcmsWRCo1qHWVAB3mqigNuCATa3Gf7EzfXFg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN6PR10MB2576.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(366004)(396003)(39860400002)(136003)(376002)(346002)(451199015)(5660300002)(4326008)(8936002)(2616005)(8676002)(2906002)(6666004)(316002)(66946007)(36756003)(6512007)(41300700001)(86362001)(66556008)(44832011)(6486002)(66476007)(1076003)(6506007)(54906003)(38100700002)(83380400001)(186003)(26005)(478600001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?tCiluhc6nbXvkS7LDCcvSAwIgJARjXoNEKABFrkMLeTmXjpE/gVJpMKI0mhQ?=
 =?us-ascii?Q?Z9ZeV6+wzMdVso+XkrZcXeRU1Alf/C4WMbAFxZdBt1HiAtVpctZ0qAEVXvqE?=
 =?us-ascii?Q?JgcBYXLRCRcA5nO75tnRtCaLIICbex0moGqRNlbjgEcHEI0OjNDETmNrx1kg?=
 =?us-ascii?Q?FvcSGCJKnGh4wzBy1OaAv8I+cWX8wKUds17jTccEM9I1gclz8hEGDgsVfPpM?=
 =?us-ascii?Q?aOkc11+HIxOq0ZsXIUIw6Tdc9u/JKrBOInPW/wuXM2cUHp66ywLUu7vjujCf?=
 =?us-ascii?Q?ovMA1nKH9cLwyaEodXa0m1/Ie+SmJVA1R3LtG8HWgzDNV21jteMJKR8Vr+l2?=
 =?us-ascii?Q?rl7iQHSxio8SzhQA5DY2jv6iuccslnB1Ft29iuk60YKwzRZelJi2varY+3Mr?=
 =?us-ascii?Q?2j0DUNuNEZHaEaHRiYNLp7NEmB74GSunpQEqGt1FWFvreLqP+KQXP3h3yTIM?=
 =?us-ascii?Q?fJCq9pMmnRiljdZheGfL+sOgPXxbv5zGDSQh/T1+kqqIzRxiwOvxazZj8kXy?=
 =?us-ascii?Q?46XKyC7vkdPZ8heWsYwj1qChW141d4Nn+lyGx/DdIE9Sxyzmmysru0GRmRAF?=
 =?us-ascii?Q?yAtSfLtm/5Tih4xrxwRMSc7RcJn+5qoq9qadz83RCztidgTa/4u7+OQBXtah?=
 =?us-ascii?Q?g4XKTd+AFaGTeK5M1ldLLY2Roh5FEUKKMpvD696v3l9/EXPD/nJeQ8x449Su?=
 =?us-ascii?Q?P9KZXhngsApeWu0cxQBvS4JOTvWIRA+/9xdwnS2Wj/bwYpY8ed5DNvpJX007?=
 =?us-ascii?Q?4AjwuThAmZ6jSgZ85fFb/JV4fpQKMKIiuMXFasFd1mAHATRmROx/5z8rS2NW?=
 =?us-ascii?Q?qs1FAoBT7GvAC90fk81qLPPKDQRDXMp4nqTHKy3gwnUS92tLwSjremWdC9AN?=
 =?us-ascii?Q?wBhbQG/eWrMRejcCdm/6HTNO4aDIovcFkqleoggdauYVhz9Nt3w1vFmBgO3Q?=
 =?us-ascii?Q?6L+D/AFOXXs/R7Z7SkWAV640yuNa3mxo8tz+ciJt4Wsv+2jKzBxr5v+qsKjK?=
 =?us-ascii?Q?pf6Sr9XaBape3Lp7Pc8E2Csjsx0xsGyNp/ZOzwV3WLBJeEmMJi/UYFtJIloT?=
 =?us-ascii?Q?QsksoGkI2DSU6aFFVDkK7UbgFup2/TKBBO+0eTASlA4lIgZSDjst0k4m94Jk?=
 =?us-ascii?Q?uuzFYlB7FKSrahUAzjpMgBbx7M2KKQnVkHUPgwlBrvQYpnP64cClBN81A9fH?=
 =?us-ascii?Q?/Pe8dKuXPMFo62XeWexV2pNSN6N/PtDk+mIdKVmP4UUCM0w9T8kg6XubVBWe?=
 =?us-ascii?Q?JqDDDsCMpMjqAVmuM15BgBMYhDRzT6DXKZNqxF90P5pTeYIid1VshithjjWn?=
 =?us-ascii?Q?CPqVzJWBCWKEeumWuEA8t6eTa4FzSD1WmI/hGmgllzApOB1YN5cLiFvMUUX6?=
 =?us-ascii?Q?LcTwkWjXQzJGx0hrWMzU/+xyBL1MS/LNHSq53jIGKMVANnc8Giehy8GQZKPO?=
 =?us-ascii?Q?49A6hhff1LNDP/7HHF8XIxf/4pdItLyR1V/B1u07vq4laTWxx4sHEvHzqEOU?=
 =?us-ascii?Q?90dMvmAREiHqRIifOdeGqRLpcV0yq6cASQ838kJaQXQldYyCHiqZ0DA0Ew3T?=
 =?us-ascii?Q?0SLIMKFxjIvZO5OcNMvPbuDnnGtsmgZ6LxQctQc1iJimLdhVJF7LIclAcRgD?=
 =?us-ascii?Q?xw=3D=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: be16568f-9b04-4cc1-a6b7-08da9772a3db
X-MS-Exchange-CrossTenant-AuthSource: SN6PR10MB2576.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Sep 2022 23:33:05.9368 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: x++yriuYXKBOEN+gNDEWLUHkJNiP9R4tTN32XDfvSpKvrhd+CU+Nkr99NYY4lLz0mtO3cJvpfyViB327W3e32+W3lQ062SLx3mvJWO8C8mU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR10MB5578
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.528,FMLib:17.11.122.1
 definitions=2022-09-15_10,2022-09-14_04,2022-06-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0
 bulkscore=0 phishscore=0
 mlxlogscore=999 suspectscore=0 adultscore=0 spamscore=0 mlxscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2209130000
 definitions=main-2209150149
X-Proofpoint-GUID: f2kj3v-uaVqLg7RrkyJAbEOPFKoH2Vp6
X-Proofpoint-ORIG-GUID: f2kj3v-uaVqLg7RrkyJAbEOPFKoH2Vp6
Received-SPF: pass client-ip=205.220.165.32;
 envelope-from=venu.busireddy@oracle.com; helo=mx0a-00069f02.pphosted.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

Section 5.6.6.3 of VirtIO specification states, "Events will also
be reported via sense codes..." However, no sense data is sent when
VIRTIO_SCSI_EVT_RESET_RESCAN or VIRTIO_SCSI_EVT_RESET_REMOVED events
are reported (when disk hotplug/hotunplug events occur). SCSI layer
on Solaris depends on this sense data, and hence does not handle disk
hotplug/hotunplug events.

As specified in SAM-4, Section 5.14 (h), return a CHECK_CONDITION status
with sense data of 0x06/0x3F/0x0E (sense code REPORTED_LUNS_CHANGED) when
the disk inventory changes and a command other than INQUIRY, REPORT_LUNS,
or REQUEST_SENSE is received.

Signed-off-by: Venu Busireddy <venu.busireddy@oracle.com>

v1 -> v2:
    - Send the sense data for VIRTIO_SCSI_EVT_RESET_REMOVED event too.
---
 hw/scsi/virtio-scsi.c           | 16 +++++++++++++++-
 include/hw/virtio/virtio-scsi.h |  1 +
 2 files changed, 16 insertions(+), 1 deletion(-)

diff --git a/hw/scsi/virtio-scsi.c b/hw/scsi/virtio-scsi.c
index 41f2a5630173..69194c7ae23c 100644
--- a/hw/scsi/virtio-scsi.c
+++ b/hw/scsi/virtio-scsi.c
@@ -608,7 +608,19 @@ static void virtio_scsi_command_complete(SCSIRequest *r, size_t resid)
 
     req->resp.cmd.response = VIRTIO_SCSI_S_OK;
     req->resp.cmd.status = r->status;
-    if (req->resp.cmd.status == GOOD) {
+    if (req->dev->reported_luns_changed &&
+            (req->req.cmd.cdb[0] != INQUIRY) &&
+            (req->req.cmd.cdb[0] != REPORT_LUNS) &&
+            (req->req.cmd.cdb[0] != REQUEST_SENSE)) {
+        req->dev->reported_luns_changed = false;
+        req->resp.cmd.resid = 0;
+        req->resp.cmd.status_qualifier = 0;
+        req->resp.cmd.status = CHECK_CONDITION;
+        sense_len = scsi_build_sense(sense, SENSE_CODE(REPORTED_LUNS_CHANGED));
+        qemu_iovec_from_buf(&req->resp_iov, sizeof(req->resp.cmd),
+                            sense, sense_len);
+        req->resp.cmd.sense_len = virtio_tswap32(vdev, sense_len);
+    } else if (req->resp.cmd.status == GOOD) {
         req->resp.cmd.resid = virtio_tswap32(vdev, resid);
     } else {
         req->resp.cmd.resid = 0;
@@ -956,6 +968,7 @@ static void virtio_scsi_hotplug(HotplugHandler *hotplug_dev, DeviceState *dev,
         virtio_scsi_push_event(s, sd,
                                VIRTIO_SCSI_T_TRANSPORT_RESET,
                                VIRTIO_SCSI_EVT_RESET_RESCAN);
+        s->reported_luns_changed = true;
         virtio_scsi_release(s);
     }
 }
@@ -973,6 +986,7 @@ static void virtio_scsi_hotunplug(HotplugHandler *hotplug_dev, DeviceState *dev,
         virtio_scsi_push_event(s, sd,
                                VIRTIO_SCSI_T_TRANSPORT_RESET,
                                VIRTIO_SCSI_EVT_RESET_REMOVED);
+        s->reported_luns_changed = true;
         virtio_scsi_release(s);
     }
 
diff --git a/include/hw/virtio/virtio-scsi.h b/include/hw/virtio/virtio-scsi.h
index a36aad9c8695..efbcf9ba069a 100644
--- a/include/hw/virtio/virtio-scsi.h
+++ b/include/hw/virtio/virtio-scsi.h
@@ -81,6 +81,7 @@ struct VirtIOSCSI {
     SCSIBus bus;
     int resetting;
     bool events_dropped;
+    bool reported_luns_changed;
 
     /* Fields for dataplane below */
     AioContext *ctx; /* one iothread per virtio-scsi-pci for now */

