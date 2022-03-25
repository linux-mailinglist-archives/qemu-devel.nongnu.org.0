Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 90B914E7A76
	for <lists+qemu-devel@lfdr.de>; Fri, 25 Mar 2022 20:30:37 +0100 (CET)
Received: from localhost ([::1]:49506 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nXpds-0002jz-EK
	for lists+qemu-devel@lfdr.de; Fri, 25 Mar 2022 15:30:36 -0400
Received: from eggs.gnu.org ([209.51.188.92]:33582)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jag.raman@oracle.com>)
 id 1nXpUK-000802-E7
 for qemu-devel@nongnu.org; Fri, 25 Mar 2022 15:20:44 -0400
Received: from mx0a-00069f02.pphosted.com ([205.220.165.32]:42332)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jag.raman@oracle.com>)
 id 1nXpUI-00038T-3w
 for qemu-devel@nongnu.org; Fri, 25 Mar 2022 15:20:44 -0400
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 22PHUH2O031150; 
 Fri, 25 Mar 2022 19:20:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references :
 content-transfer-encoding : content-type : mime-version;
 s=corp-2021-07-09; bh=dXElRtKeaVpbiR8AMSIG66ErK6bZOL7wLm/mXAkIwqw=;
 b=Sn8vFS0sS/8GbfJm36weViyd1jL8M3l7BLf8au1QthI8kq0YJIEuRcta8E0l6XyMXofF
 WkFl3+4MOUEr75ATX3lR5RGKoJTCHtuTCm4Op4mZeUnY2+Zm9HJH6CaKQzs2SheQ3mlo
 l7PXinUJ0C8iC5/X7+AfeN6W5AVIPtqzqX74w5ANXzlX1WeHz3G36lR6EQiJ9hPtsyey
 abEckT+cpCLgJ35M9FjheGsq7q8pRcuXW7QvmtZCLF/HnTKa14RwLbO4zoxhCIf4u3OV
 vm9ADOSbzQnB2bYiXgG8Dsxtc44MlEaN7eHfUl7vSYShll43XSbZP5Iyxp6zpVhPJXc0 Ow== 
Received: from aserp3030.oracle.com ([141.146.126.71])
 by mx0b-00069f02.pphosted.com with ESMTP id 3ew5s1051k-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 25 Mar 2022 19:20:27 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
 by aserp3030.oracle.com (8.16.1.2/8.16.1.2) with SMTP id 22PJHF0G014645;
 Fri, 25 Mar 2022 19:20:26 GMT
Received: from nam12-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam12lp2169.outbound.protection.outlook.com [104.47.59.169])
 by aserp3030.oracle.com with ESMTP id 3ew5793v1g-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 25 Mar 2022 19:20:26 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Hf99uDLfq6BHRnlCOyDxGYeFyc0atJSoyXfY6W1ropj1BYvnrXmoHtSoK2Eie7ekMsqSnps+UWJ8kmunmSMmBBO14l4m37Ubmw+/sjCKayx4TTSHJ9jPRrDunauFdu+Mx/2+5JqVUSAMXpKMHdFTi6s5ihsiCSxklKzg+40758o5dB7sxNfLwVRuoG9P5crelLeqBEMNYZYyfG2fzA7jHXRhp9ySfOtY5UCp7Co9Sb/RVtmpp8KEahwbrJYiRLrE8jqPjYPyRjrEe5EuNojv3DUD2x+8Z9q06ih47BYJeO5AJeu2qorBhpRB0JIqYgYzAlz0XCDygFq2u9En2Gfiog==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dXElRtKeaVpbiR8AMSIG66ErK6bZOL7wLm/mXAkIwqw=;
 b=l5oUug8W65nSO8ZHr2DFGicUtC91dWAjhbRcGm4fuJnd8UOEELDxH/Stay+kincvmV2oJqF+rNS5n2FSKcRWfTfqACy6I+cg3Vj9IibkkWgGmcyg3oiqPQnOneR+lLHgrgv7SxHTuB9wN03vphJEX7NKKieBvd7La+wbvxU6zFsTy+FfaCu5bz2rsYvyouWw9r+bfF3qxypfTEA1kNoUQluQgq/6EqxVczSNOmX/j/iZHRaSenfkL+eMGwWHidYO/g2mRs/4UraolGZ5dophDeTQqYLpb91dK08o5H/lRBdeBuVPBGF/WVnQoXLL+vrJyaebelGHRjyAwV6a6wLm/w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dXElRtKeaVpbiR8AMSIG66ErK6bZOL7wLm/mXAkIwqw=;
 b=JVs4FCiEnEM7m3+D4oP+tzAX2fG1C0s8qzPOdRgsjbcJKcgtvnKbcd0Zf6hy5AhdwM3T7hfmHtvnIuUogWYDRvHMTiwzzimj430eaJP8zwTE/t4PjQCxd+hFiQuzDPEtxwdpdbD8MIzuhlBxghKruhs4o5YVgkA/SQ5ouOSSPOA=
Received: from MN2PR10MB4013.namprd10.prod.outlook.com (2603:10b6:208:185::25)
 by BN8PR10MB3729.namprd10.prod.outlook.com (2603:10b6:408:af::29)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5102.18; Fri, 25 Mar
 2022 19:20:24 +0000
Received: from MN2PR10MB4013.namprd10.prod.outlook.com
 ([fe80::508e:7f79:394:563a]) by MN2PR10MB4013.namprd10.prod.outlook.com
 ([fe80::508e:7f79:394:563a%5]) with mapi id 15.20.5102.019; Fri, 25 Mar 2022
 19:20:24 +0000
From: Jagannathan Raman <jag.raman@oracle.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v7 14/17] vfio-user: handle PCI BAR accesses
Date: Fri, 25 Mar 2022 15:19:43 -0400
Message-Id: <1c2cc82cc72964216fb63270805fefb095f4d4a8.1648234157.git.jag.raman@oracle.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <cover.1648234157.git.jag.raman@oracle.com>
References: <cover.1648234157.git.jag.raman@oracle.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SN6PR2101CA0024.namprd21.prod.outlook.com
 (2603:10b6:805:106::34) To MN2PR10MB4013.namprd10.prod.outlook.com
 (2603:10b6:208:185::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 50ec3704-5245-44a2-ad72-08da0e9482f3
X-MS-TrafficTypeDiagnostic: BN8PR10MB3729:EE_
X-Microsoft-Antispam-PRVS: <BN8PR10MB372948C4A31F0FC6F731DC54901A9@BN8PR10MB3729.namprd10.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: CMZ8ZfefA9P3FWZ6RHylCac26IM2JkhaIspFEc7c2/HBVmz47Y+MsI7MAqyDfLHurqkC+xAjztCvnCVUD31VrvBQupgwFfk9uMZT00+ljVEn7TbHDyzFZylMsmaUpQERvxo8QjtiAMPw40uz7j0ZhaSoYPZ+Se2lZDmgXbvnXsPW0jtTIAsXyoKw7wlITdDBGrqVn+9thrFa81WAYAIYdNlzku4TD/hE5ePJm6VaeSoz32T6unktcHAkuvbITvlxFS1BL9v4SyamX8oGixUNW/8EN7SgNThE02hEdMsoV8y/CYzw1lsB+EH3lVHb5O8zIRqX5jdZ+hpeGL5u1EjeVNZ4OTIy/Isr01t4T5h3itR0Vxq8N2cs4J/fQGiw4SM441GqJ2HQ3AlZhHp8rIkZl3GOrr40BYfO2VBPVjxIBDO9mnR0OvV7mfx/CtdaZMf3Lzapffi9I8lwnPQF2ZSmLt11kO/G1Qez7Yh15Yzq7tGMFEurXbhh21d62YPotIaqEjo2biPngvdRglgOSg2hYVZ9iudCQOPNYehTOAgjGTTByGT5oZylpkXoSEk8KbHafXildCPCMwJa+zZoge/W1847KATKLwv5DLGiSOtyE/dhg9AaYvJADyzSy/natei0gtSnILNCf+FvpOQ5rqTJWxAMkmTx/kWHwnVnQVUcopk4FFpgDcjOJIOpQkKq2AxrQlgoW9FVFJMaxoOQJsixzA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR10MB4013.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(107886003)(6486002)(8936002)(6506007)(2616005)(8676002)(4326008)(508600001)(66476007)(86362001)(6666004)(6512007)(6916009)(66946007)(66556008)(5660300002)(52116002)(2906002)(7416002)(83380400001)(38350700002)(186003)(38100700002)(26005)(36756003)(316002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?GepRCunmAng6+CaYZ5ePsAh+6CAXLppcsD7T3l/t+lVRsP8MCjqrYFdJiqAK?=
 =?us-ascii?Q?qkS4E2Ttp4kNkRSZUQmQ0QtZy7DcpdjbXXMGZo73aIcPA5cfz6VU3zLswDz4?=
 =?us-ascii?Q?1nBsjPcI4F6cH1YuIr0shyyodFLFBAlbJvcg/Pixl8v7HYTprRvB1JSWCkGv?=
 =?us-ascii?Q?vKbjOZmlwagJD83IZQlZz9Ctmk0G2eTtAx8BfFFM4hGZXOca9x4HhaBF2FWc?=
 =?us-ascii?Q?CnL3zV0hQpzrXK1hW6G6RKRnwiX8Y5GQqk9wtB9UEqL7Z99ZPNpPbdq6CJlA?=
 =?us-ascii?Q?rrc8aD5FjzkjlPjetu6rDeokZZF9cXdH4u8bN8tgZcZN0h20IZEcJNK1+4Aa?=
 =?us-ascii?Q?Y0XDeoxG6SP8ipbyCPVEZDWbMg22kIoRhgF11OW0V88h5hztx21/zwO8IJeB?=
 =?us-ascii?Q?kzSRt6vy1qqtqwcvFMNof561Ab4oCFD9bwnXv1mCH0NpJfThfU/sQnvekW/s?=
 =?us-ascii?Q?1sa5dJY3YA22vHqdQTqDfiFy1BCT2lQogYfOu+hxJpRY9L6m3EwXuyNgonWw?=
 =?us-ascii?Q?FE6W7CaOuV2+gLsmkcBGo9llGXqgfCAAgHSroju2fNpiCPEfql/YIFqDbzXj?=
 =?us-ascii?Q?vW6mqnHTEU123JLRnRiFFQNUlhrrjop3wS9O1KrA+WPZN6lNJOJd8RLgudk4?=
 =?us-ascii?Q?oU42RuxQap+N1qQ9d8/yWL9KGHLpIiLT+Vm9yvCox3VtAykFFO+I9oOfYpUV?=
 =?us-ascii?Q?e8MK/ja56RjYRmihZPYZ2b/03W8N9sJ6CtJMzdVmzny3GaHOA4uQdQWG8hhP?=
 =?us-ascii?Q?tg4p3bqOTFTiQrGy1uzkZTZ+NanXQwyie8XYgBtpFcCN6Oul0YZomwPEiF1h?=
 =?us-ascii?Q?Tut+VQ+YGz5r0cFYwHB7s17fkCWXTKRlXDla+83qCUrkfDn/K8Hmj9SeYkcX?=
 =?us-ascii?Q?aC2B3eCj3VTSgXHGSEJzKAkDVk0ugZxR/z6m3x21IdlbEcWInMw0/gaVXG+F?=
 =?us-ascii?Q?EomU2hbM9C4n3slz3H8ZDvMb9s1eA5Ym/BpCLvJDnAWvuhcXRWFUeXgv8yAO?=
 =?us-ascii?Q?bLcg74Wf4oZHKiZ/lynCfg+yqwQ3S78mj7SBkQD4y8BgbgSp52Kij4OXqnIB?=
 =?us-ascii?Q?AOwY/big0K7WI7d+M8CyvlHE9iPTTyP3ReONc9JNib03sNOsOb8Toj76ggBv?=
 =?us-ascii?Q?CYzCmF1RS8zT5KBu8ynbIurjlKyJx8LcDkLlbi9z/b6WW7e8cmvUAZzfERwp?=
 =?us-ascii?Q?TGc2Em8jGE4FDz6zwt9L8wnFPh2RRxgEyVzgiS05LVtvWKOBqoyD1uMPlFcz?=
 =?us-ascii?Q?DRFBmkYod7vy4PQMhnfFxu2b4pvA7LO86Nbi+5fvmOeO6JT6Ao58bLXsmBd6?=
 =?us-ascii?Q?o4iRbsI56oZP6b/qFcC2LMdGRdjFuh1l8qbCyWTqCwfg9Xdn/WO0oExU+iab?=
 =?us-ascii?Q?c+fwIhv3gsKOllSlTTfVE84tNWcq0UzHFhlu4c98+j1QIPHIRXT2gy8jHMlx?=
 =?us-ascii?Q?cIjySkAg8HhRLX+6JlljxzZGMsPOwsCUTeosC2zZuPhu7EL53KSmaMPN5wP6?=
 =?us-ascii?Q?a7j7ybUHxFqJaTWzQ1gaVjGnJg81az93cpS2RLUgeOLPKJwtclulMtX0jFM8?=
 =?us-ascii?Q?Mpwev9r1sDHA+cdnsai2H4/qXuG/n2KpyZnlvh/oiCEKbCGy1SkrqduLTGiw?=
 =?us-ascii?Q?WM3lCkbbq1uUNcM1CoTWKbX08VENE5ceaKVTkDrveEhYp0kw5pK1y4AFVIBg?=
 =?us-ascii?Q?2LMxKEQw11EAtXohIF7hVkwbSkVqrz/a+P1ngmNUicrArJCYBivjhEa1jAI3?=
 =?us-ascii?Q?rhWoel/JAFSzy5SCbRFV4KsS93FYVFw=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 50ec3704-5245-44a2-ad72-08da0e9482f3
X-MS-Exchange-CrossTenant-AuthSource: MN2PR10MB4013.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Mar 2022 19:20:24.3334 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZOmdf2VV9I+hCJzNm8fdyYArblzGTfDCjgxhbeYJE3X/l9bPYFVZQDPzvBXPtH2fsygJ6x7DE8X0euNm0Ppugw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN8PR10MB3729
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10297
 signatures=694973
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0
 suspectscore=0 spamscore=0
 mlxlogscore=999 phishscore=0 bulkscore=0 malwarescore=0 mlxscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2202240000
 definitions=main-2203250106
X-Proofpoint-GUID: 04tig37UFYUquRXS9_tIdvZLb0eS3XBr
X-Proofpoint-ORIG-GUID: 04tig37UFYUquRXS9_tIdvZLb0eS3XBr
Received-SPF: pass client-ip=205.220.165.32; envelope-from=jag.raman@oracle.com;
 helo=mx0a-00069f02.pphosted.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: eduardo@habkost.net, elena.ufimtseva@oracle.com, john.g.johnson@oracle.com,
 berrange@redhat.com, bleal@redhat.com, john.levon@nutanix.com, mst@redhat.com,
 armbru@redhat.com, quintela@redhat.com, f4bug@amsat.org,
 alex.williamson@redhat.com, kanth.ghatraju@oracle.com, stefanha@redhat.com,
 thanos.makatos@nutanix.com, pbonzini@redhat.com, jag.raman@oracle.com,
 eblake@redhat.com, dgilbert@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Determine the BARs used by the PCI device and register handlers to
manage the access to the same.

Signed-off-by: Elena Ufimtseva <elena.ufimtseva@oracle.com>
Signed-off-by: John G Johnson <john.g.johnson@oracle.com>
Signed-off-by: Jagannathan Raman <jag.raman@oracle.com>
---
 include/exec/memory.h           |   3 +
 hw/remote/vfio-user-obj.c       | 167 ++++++++++++++++++++++++++++++++
 softmmu/physmem.c               |   4 +-
 tests/qtest/fuzz/generic_fuzz.c |   9 +-
 hw/remote/trace-events          |   3 +
 5 files changed, 180 insertions(+), 6 deletions(-)

diff --git a/include/exec/memory.h b/include/exec/memory.h
index 4d5997e6bb..4b061e62d5 100644
--- a/include/exec/memory.h
+++ b/include/exec/memory.h
@@ -2810,6 +2810,9 @@ MemTxResult address_space_write_cached_slow(MemoryRegionCache *cache,
                                             hwaddr addr, const void *buf,
                                             hwaddr len);
 
+int memory_access_size(MemoryRegion *mr, unsigned l, hwaddr addr);
+bool prepare_mmio_access(MemoryRegion *mr);
+
 static inline bool memory_access_is_direct(MemoryRegion *mr, bool is_write)
 {
     if (is_write) {
diff --git a/hw/remote/vfio-user-obj.c b/hw/remote/vfio-user-obj.c
index 425e45e8b2..6910c16243 100644
--- a/hw/remote/vfio-user-obj.c
+++ b/hw/remote/vfio-user-obj.c
@@ -53,6 +53,7 @@
 #include "hw/qdev-core.h"
 #include "hw/pci/pci.h"
 #include "qemu/timer.h"
+#include "exec/memory.h"
 
 #define TYPE_VFU_OBJECT "x-vfio-user-server"
 OBJECT_DECLARE_TYPE(VfuObject, VfuObjectClass, VFU_OBJECT)
@@ -324,6 +325,170 @@ static void dma_unregister(vfu_ctx_t *vfu_ctx, vfu_dma_info_t *info)
     trace_vfu_dma_unregister((uint64_t)info->iova.iov_base);
 }
 
+static size_t vfu_object_bar_rw(PCIDevice *pci_dev, int pci_bar,
+                                hwaddr offset, char * const buf,
+                                hwaddr len, const bool is_write)
+{
+    uint8_t *ptr = (uint8_t *)buf;
+    uint8_t *ram_ptr = NULL;
+    bool release_lock = false;
+    MemoryRegionSection section = { 0 };
+    MemoryRegion *mr = NULL;
+    int access_size;
+    hwaddr size = 0;
+    MemTxResult result;
+    uint64_t val;
+
+    section = memory_region_find(pci_dev->io_regions[pci_bar].memory,
+                                 offset, len);
+
+    if (!section.mr) {
+        return 0;
+    }
+
+    mr = section.mr;
+    offset = section.offset_within_region;
+
+    if (is_write && mr->readonly) {
+        warn_report("vfu: attempting to write to readonly region in "
+                    "bar %d - [0x%"PRIx64" - 0x%"PRIx64"]",
+                    pci_bar, offset, (offset + len));
+        return 0;
+    }
+
+    if (memory_access_is_direct(mr, is_write)) {
+        /**
+         * Some devices expose a PCI expansion ROM, which could be buffer
+         * based as compared to other regions which are primarily based on
+         * MemoryRegionOps. memory_region_find() would already check
+         * for buffer overflow, we don't need to repeat it here.
+         */
+        ram_ptr = memory_region_get_ram_ptr(mr);
+
+        size = len;
+
+        if (is_write) {
+            memcpy((ram_ptr + offset), buf, size);
+        } else {
+            memcpy(buf, (ram_ptr + offset), size);
+        }
+
+        goto exit;
+    }
+
+    while (len > 0) {
+        /**
+         * The read/write logic used below is similar to the ones in
+         * flatview_read/write_continue()
+         */
+        release_lock = prepare_mmio_access(mr);
+
+        access_size = memory_access_size(mr, len, offset);
+
+        if (is_write) {
+            val = ldn_he_p(ptr, access_size);
+
+            result = memory_region_dispatch_write(mr, offset, val,
+                                                  size_memop(access_size),
+                                                  MEMTXATTRS_UNSPECIFIED);
+        } else {
+            result = memory_region_dispatch_read(mr, offset, &val,
+                                                 size_memop(access_size),
+                                                 MEMTXATTRS_UNSPECIFIED);
+
+            stn_he_p(ptr, access_size, val);
+        }
+
+        if (release_lock) {
+            qemu_mutex_unlock_iothread();
+            release_lock = false;
+        }
+
+        if (result != MEMTX_OK) {
+            warn_report("vfu: failed to %s 0x%"PRIx64"",
+                        is_write ? "write to" : "read from",
+                        (offset - size));
+
+            goto exit;
+        }
+
+        len -= access_size;
+        size += access_size;
+        ptr += access_size;
+        offset += access_size;
+    }
+
+exit:
+    memory_region_unref(mr);
+
+    return size;
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
+        PCIDevice *pci_dev = o->pci_dev;                                       \
+                                                                               \
+        return vfu_object_bar_rw(pci_dev, BAR_NO, offset,                      \
+                                 buf, count, is_write);                        \
+    }                                                                          \
+
+VFU_OBJECT_BAR_HANDLER(0)
+VFU_OBJECT_BAR_HANDLER(1)
+VFU_OBJECT_BAR_HANDLER(2)
+VFU_OBJECT_BAR_HANDLER(3)
+VFU_OBJECT_BAR_HANDLER(4)
+VFU_OBJECT_BAR_HANDLER(5)
+VFU_OBJECT_BAR_HANDLER(6)
+
+static vfu_region_access_cb_t *vfu_object_bar_handlers[PCI_NUM_REGIONS] = {
+    &vfu_object_bar0_handler,
+    &vfu_object_bar1_handler,
+    &vfu_object_bar2_handler,
+    &vfu_object_bar3_handler,
+    &vfu_object_bar4_handler,
+    &vfu_object_bar5_handler,
+    &vfu_object_bar6_handler,
+};
+
+/**
+ * vfu_object_register_bars - Identify active BAR regions of pdev and setup
+ *                            callbacks to handle read/write accesses
+ */
+static void vfu_object_register_bars(vfu_ctx_t *vfu_ctx, PCIDevice *pdev)
+{
+    int flags = VFU_REGION_FLAG_RW;
+    int i;
+
+    for (i = 0; i < PCI_NUM_REGIONS; i++) {
+        if (!pdev->io_regions[i].size) {
+            continue;
+        }
+
+        if ((i == VFU_PCI_DEV_ROM_REGION_IDX) ||
+            pdev->io_regions[i].memory->readonly) {
+            flags &= ~VFU_REGION_FLAG_WRITE;
+        }
+
+        vfu_setup_region(vfu_ctx, VFU_PCI_DEV_BAR0_REGION_IDX + i,
+                         (size_t)pdev->io_regions[i].size,
+                         vfu_object_bar_handlers[i],
+                         flags, NULL, 0, -1, 0);
+
+        trace_vfu_bar_register(i, pdev->io_regions[i].addr,
+                               pdev->io_regions[i].size);
+    }
+}
+
 /*
  * TYPE_VFU_OBJECT depends on the availability of the 'socket' and 'device'
  * properties. It also depends on devices instantiated in QEMU. These
@@ -420,6 +585,8 @@ static void vfu_object_init_ctx(VfuObject *o, Error **errp)
         goto fail;
     }
 
+    vfu_object_register_bars(o->vfu_ctx, o->pci_dev);
+
     ret = vfu_realize_ctx(o->vfu_ctx);
     if (ret < 0) {
         error_setg(errp, "vfu: Failed to realize device %s- %s",
diff --git a/softmmu/physmem.c b/softmmu/physmem.c
index 4e1b27a20e..f9a68d1fe5 100644
--- a/softmmu/physmem.c
+++ b/softmmu/physmem.c
@@ -2719,7 +2719,7 @@ void memory_region_flush_rom_device(MemoryRegion *mr, hwaddr addr, hwaddr size)
     invalidate_and_set_dirty(mr, addr, size);
 }
 
-static int memory_access_size(MemoryRegion *mr, unsigned l, hwaddr addr)
+int memory_access_size(MemoryRegion *mr, unsigned l, hwaddr addr)
 {
     unsigned access_size_max = mr->ops->valid.max_access_size;
 
@@ -2746,7 +2746,7 @@ static int memory_access_size(MemoryRegion *mr, unsigned l, hwaddr addr)
     return l;
 }
 
-static bool prepare_mmio_access(MemoryRegion *mr)
+bool prepare_mmio_access(MemoryRegion *mr)
 {
     bool release_lock = false;
 
diff --git a/tests/qtest/fuzz/generic_fuzz.c b/tests/qtest/fuzz/generic_fuzz.c
index dd7e25851c..77547fc1d8 100644
--- a/tests/qtest/fuzz/generic_fuzz.c
+++ b/tests/qtest/fuzz/generic_fuzz.c
@@ -144,7 +144,7 @@ static void *pattern_alloc(pattern p, size_t len)
     return buf;
 }
 
-static int memory_access_size(MemoryRegion *mr, unsigned l, hwaddr addr)
+static int fuzz_memory_access_size(MemoryRegion *mr, unsigned l, hwaddr addr)
 {
     unsigned access_size_max = mr->ops->valid.max_access_size;
 
@@ -242,11 +242,12 @@ void fuzz_dma_read_cb(size_t addr, size_t len, MemoryRegion *mr)
 
         /*
          *  If mr1 isn't RAM, address_space_translate doesn't update l. Use
-         *  memory_access_size to identify the number of bytes that it is safe
-         *  to write without accidentally writing to another MemoryRegion.
+         *  fuzz_memory_access_size to identify the number of bytes that it
+         *  is safe to write without accidentally writing to another
+         *  MemoryRegion.
          */
         if (!memory_region_is_ram(mr1)) {
-            l = memory_access_size(mr1, l, addr1);
+            l = fuzz_memory_access_size(mr1, l, addr1);
         }
         if (memory_region_is_ram(mr1) ||
             memory_region_is_romd(mr1) ||
diff --git a/hw/remote/trace-events b/hw/remote/trace-events
index f945c7e33b..847d50d88f 100644
--- a/hw/remote/trace-events
+++ b/hw/remote/trace-events
@@ -9,3 +9,6 @@ vfu_cfg_read(uint32_t offset, uint32_t val) "vfu: cfg: 0x%u -> 0x%x"
 vfu_cfg_write(uint32_t offset, uint32_t val) "vfu: cfg: 0x%u <- 0x%x"
 vfu_dma_register(uint64_t gpa, size_t len) "vfu: registering GPA 0x%"PRIx64", %zu bytes"
 vfu_dma_unregister(uint64_t gpa) "vfu: unregistering GPA 0x%"PRIx64""
+vfu_bar_register(int i, uint64_t addr, uint64_t size) "vfu: BAR %d: addr 0x%"PRIx64" size 0x%"PRIx64""
+vfu_bar_rw_enter(const char *op, uint64_t addr) "vfu: %s request for BAR address 0x%"PRIx64""
+vfu_bar_rw_exit(const char *op, uint64_t addr) "vfu: Finished %s of BAR address 0x%"PRIx64""
-- 
2.20.1


