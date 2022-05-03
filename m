Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 48F645186AA
	for <lists+qemu-devel@lfdr.de>; Tue,  3 May 2022 16:28:14 +0200 (CEST)
Received: from localhost ([::1]:35390 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nltVd-0006NR-8J
	for lists+qemu-devel@lfdr.de; Tue, 03 May 2022 10:28:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42562)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jag.raman@oracle.com>)
 id 1nltLp-0001PR-W4
 for qemu-devel@nongnu.org; Tue, 03 May 2022 10:18:06 -0400
Received: from mx0a-00069f02.pphosted.com ([205.220.165.32]:32108)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jag.raman@oracle.com>)
 id 1nltLo-0001RA-3l
 for qemu-devel@nongnu.org; Tue, 03 May 2022 10:18:05 -0400
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 243BLJh5030616;
 Tue, 3 May 2022 14:17:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references :
 content-transfer-encoding : content-type : mime-version;
 s=corp-2021-07-09; bh=w724ZuHrHAXeMxoWPy21id6gRSHTFTyl0Dhlxo3unHI=;
 b=WgTCsjhM1Kqd2b6hBgGnIr+CZAZ0VGm+18E3A26lMevI/wu5Oq/KShGfIr4MkhQ7taFo
 kmjra0Rk1NyGaV3vCcB55XB1xauh1/Vn5XCmcX0Fy0TVTlAM2ZEAHsBzeq7yfudaBfuX
 mStmj0hrp9v1nT16RariY9Ir1dYH/f3TPrhWIctDq90y1JvLiz7ilgoClOvkUthbOPI4
 pSaJ63/f8uAatO3gixDTWyql26bEEEUC51oHWBgaZ0XsMw5GoMB206DkAKEobE1Sx55p
 i9rNi/EfaFqvDVQI76au0lAbU9YZlWnF4zRhB5DlfBHPheRLGPGt0FmxaqSC+yq+4/8X Tw== 
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com
 (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3fruq0dtrt-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 03 May 2022 14:17:49 +0000
Received: from pps.filterd
 (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
 by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.16.1.2/8.16.1.2)
 with SMTP id 243EGR9Q001768; Tue, 3 May 2022 14:17:48 GMT
Received: from nam02-sn1-obe.outbound.protection.outlook.com
 (mail-sn1anam02lp2047.outbound.protection.outlook.com [104.47.57.47])
 by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com with ESMTP id
 3fruj91keq-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 03 May 2022 14:17:48 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ex/86i70sAcbsWFJTY2opzKkzv6G/8IlWIBPBcCpFOcNvbzWVX/vwLwhvmBy7D0wjnS+yvzSwx4DZC4iXzBggYWDWpkAs4KDf1killHz27qms1cxgwtcQacOAkSQaTqPyzERuQ3Atdvx2vmW/Hfk8XHQ49aYLK91VKPeOZDj4pmNEXC2Mzf8eFSgSsSQLtu00OWAPpkU0eYlM3GrSfIa4le4GQl7vJgEmyF9BPmgPrRzXYZOWU/QHXxJArnt+QET2xxY/dz+isqp2thrS9VlOjnbnwOcgkiQxaR6TY2NMQBCcTSdVXhGtnENcazCFMMfhKxVyAKnw+V+64/wcHqAog==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=w724ZuHrHAXeMxoWPy21id6gRSHTFTyl0Dhlxo3unHI=;
 b=EnTPwDUYdADySxmHKsSbgAPqQKPqvaZg1kPPzqNS4+7p9/ZXA3qPgDuDL+//ew56y2/9ontulzZomCOen1VX57oi3e78gSn/K8n0G6oZ0HBi2XUmduXPMBkflx+ByfdZN9l4UiDoB0RAE9CGYkXO0kOQxG2gaSryccIJB2XsSztHD2wptsbtKKnWLWRrZ0VInl055tZhjQytKZNpTEKb933zI61Xvlaab0oGejaSEun6ztdmVBzdoSv9RfM7pVECzXz9D+K0RGpu5f1TBShguUyMoRYPDjhJG5HVbWAQzQpN7OBgLtVSpY3Hk9WAxkZkGq8/cOXnQtYPgWY5zwzbbA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=w724ZuHrHAXeMxoWPy21id6gRSHTFTyl0Dhlxo3unHI=;
 b=N/UI7fKNM7z6GmrGeWIemKwMrzIbTdhBKtc0tcSeugmD7VAq/0eHbl/6V9SfwTpwpZr2d8jnBmBHEBl/65V4XtuP0vD06XaTy2RvlSwYtf0F60y96slIjbDKpqh1yqQbBjrflbR1a1QoIGbTKQSbmHhq71jZe8j/7WmFbUcdtJw=
Received: from MN2PR10MB4013.namprd10.prod.outlook.com (2603:10b6:208:185::25)
 by MN2PR10MB3358.namprd10.prod.outlook.com (2603:10b6:208:12f::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5206.24; Tue, 3 May
 2022 14:17:46 +0000
Received: from MN2PR10MB4013.namprd10.prod.outlook.com
 ([fe80::e9cb:e1ca:8189:f191]) by MN2PR10MB4013.namprd10.prod.outlook.com
 ([fe80::e9cb:e1ca:8189:f191%7]) with mapi id 15.20.5206.013; Tue, 3 May 2022
 14:17:46 +0000
From: Jagannathan Raman <jag.raman@oracle.com>
To: qemu-devel@nongnu.org
Cc: stefanha@redhat.com, mst@redhat.com, f4bug@amsat.org, pbonzini@redhat.com, 
 marcandre.lureau@redhat.com, thuth@redhat.com, bleal@redhat.com,
 berrange@redhat.com, eduardo@habkost.net, marcel.apfelbaum@gmail.com,
 eblake@redhat.com, armbru@redhat.com, quintela@redhat.com,
 dgilbert@redhat.com, imammedo@redhat.com, peterx@redhat.com,
 john.levon@nutanix.com, thanos.makatos@nutanix.com,
 elena.ufimtseva@oracle.com, john.g.johnson@oracle.com,
 kanth.ghatraju@oracle.com, jag.raman@oracle.com
Subject: [PATCH v9 16/17] vfio-user: handle reset of remote device
Date: Tue,  3 May 2022 10:16:57 -0400
Message-Id: <72e150191b85971dddae712f0f6969482cb4d6fb.1651586203.git.jag.raman@oracle.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <cover.1651586203.git.jag.raman@oracle.com>
References: <cover.1651586203.git.jag.raman@oracle.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SA9PR11CA0005.namprd11.prod.outlook.com
 (2603:10b6:806:6e::10) To MN2PR10MB4013.namprd10.prod.outlook.com
 (2603:10b6:208:185::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a1932284-7ae7-40b3-f3fd-08da2d0fb1db
X-MS-TrafficTypeDiagnostic: MN2PR10MB3358:EE_
X-Microsoft-Antispam-PRVS: <MN2PR10MB33585FED0D98B2E5A1A314CC90C09@MN2PR10MB3358.namprd10.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: LqJUyBSLcYROqTQcw6F8OQVX4uqpsAvqMIP4sTtx8QtHhOgNnr7zbLgNPq2KrxTyj/AmNmy+gvfQcJodk8rXc4hz/7gNA2eB63FkC3EK39qRRZRKOkwulKR/q5NjoYa0zzCCJGOKz1vB3AmbrN+96BI+QIwEF66xHicvkhd8B9Botui9TG+0qBwInR/TToZgYRm3cULbNWNJX2/rIYHpacibtOBMyGC8bVMs0znAhpPsnJRMuYD9PGsDkJbA7c+2UyUKZ4pC531AZDrDEN5chs7dsqnEheOcI9Yz+mFY2C9UAF5bS4NP+1DxLJyE1ardfbAkkaqHZV9Qm9Au5PfvK4NvYI0ebIBvQOtIdrUwgxq2WiDHSq8otV6rfBsWLvUGsD9qnELNgNWtg0Q4FFmL0lnS5yV+RYbpItPAe7jPtF7E/7z8ELnUSDcVcGYM6DFGQFT+NN/wNNenUlkV3mQ+IsFNPaoMEEJ1WJA6bVLj5mSFCGwBuiLUzGgQSWnszK+0BIzcrzBfkLH1KB8YksnDNTYZJIKdrlmtg9M2XmNnhC883JhsYGQwNIkUmtcURsDCyNC5jZ+nKPYhffcZW2GOM4RpRdsxzWCjZQHnNBrIPrwVP/j4o+u5Uq5uDRT44av4iBlIOQwrRirFuVGFXBJfq9U6utSO+pFF8DcXsgZLQqrNeQnm0jOWXP5XxjH4cE+0B2iVN/fdn2pnBzY5Y+DLdA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR10MB4013.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(36756003)(66946007)(2616005)(6506007)(186003)(107886003)(2906002)(6486002)(6916009)(316002)(38350700002)(38100700002)(7416002)(5660300002)(8936002)(6512007)(86362001)(4326008)(6666004)(52116002)(66476007)(508600001)(8676002)(26005)(66556008);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Zo5hnyw49TSGAzNCEs5LKoESpdNlbwX+Zs6Tb8Jr+3CIZmgubns8MozUnw/J?=
 =?us-ascii?Q?GJ+vkt3CmdbDfdIYKQrQTkyY7RelviPUbiviNqHKIfBTbK+U+8GZYfhac+LW?=
 =?us-ascii?Q?lhiTefe5ubqbqMAiDjoCDlHNdmIdStCnObXoOt/J83N+TtfrIeNoPSnHrzkX?=
 =?us-ascii?Q?2O+J0nqVnTNWOypFKZc4SRyLCkowN9uaOwz/39IN5CNXHFWiZqwkzd3a0Etw?=
 =?us-ascii?Q?bLUqe+PMf+WqbpeqN6/fCdkYjOB0zupH4MKrXkzz6twd6yJQmZczy+PGBsUe?=
 =?us-ascii?Q?i9mOXf4O7QLYH8wihjAZqnPaHLaFSZZ7iRt0MHOUPWvy6uEUrarvxpfFhZu5?=
 =?us-ascii?Q?/M+Q2pyleHS3z29e+EX3i3cYN/A/1ukFHhHreb9mj+vUukZrWBdr8Nx2i23I?=
 =?us-ascii?Q?QYbyOrmCi7DYuiH3tZU9R2WhebmRkpgGYgjfm4JgJW417gMzGYloNIt0oi/o?=
 =?us-ascii?Q?63VBoLcFPT5WG8rZ4FwyuaXYtFK/Q1vc8sS8On/4FLXKJypuXXOziWqJX9Ft?=
 =?us-ascii?Q?/NjkPV+pRGzlWykLilPmB6xjkv+TzbbHzuYQeUouKKhNj4aLf4acnKMsHXov?=
 =?us-ascii?Q?zJk8KNqmuWQR/Oadx7nxH9eM2In4BPCt/1axlz8+O81h1WC6oz3CJcfPqKgb?=
 =?us-ascii?Q?N8jakEIMQjFhHzxlc1MaPa6lapvpWNDJnziX+tMbVXJBBltVfkmrepZgSagd?=
 =?us-ascii?Q?sBAJhBk2HFOcYfIgSIaEt3aLg8rDAgpOy9daZw2FYn7fLS9W4R5yh8RjUvBj?=
 =?us-ascii?Q?X4A3/qRjFdoCL++ZVtnMHb+aNJEK5VuJQI980hJUqHYFly2O2sz9EQubi7Po?=
 =?us-ascii?Q?qqWUo5hkqSviXCX8GYc/c9NzhnN6on5OtYH2iMVVxdTb1m7Fouc6Y7ThwQZf?=
 =?us-ascii?Q?M9lm4818v9AjnC3XTTho4MdY6ph6tsffyMy3tj9ztw4/4mi/BTA7FT5S2k7v?=
 =?us-ascii?Q?6jM5hjes/H/33+CYytOw/wEQUfD4cz147RDqN/zpFSVxq1s+bTo2MepULeHM?=
 =?us-ascii?Q?PVTz5a+10M+y3hoHgEaGrqQji60FYot47BVH/rHs0dD7jsWL0LgmJqASaD9C?=
 =?us-ascii?Q?6AXHnu3iY2nohpMXIkLHHAPugSZdUqsvuGYr15QQtK5OnItRI01iUTIDjGik?=
 =?us-ascii?Q?gaRbAoOyIyMiTLVPu8PtqtU+/A8zcgybOQm64Teb4DeSJitCsmBVuh2s7+ah?=
 =?us-ascii?Q?LmP4LYMtQXCVX3cAaLiWjrGBOM7l3SAejPZdQI5wdljopVYO7NWDfMRMwFnJ?=
 =?us-ascii?Q?gBcAt41WAkztgLjEPmzPykg0arAr5h4/dawatBJnrfi4TEl/00um14xP9/Wr?=
 =?us-ascii?Q?mllPFXa1w8X6DbFEnnl653EG9bmx111s2YLwpRZ9df5NHg0XCPN/FLFFo4oQ?=
 =?us-ascii?Q?h+o3MqaEU/dad5xpKZ1VPUXza//z39sVix4EG/+fwnD1snaA3cvpsiuGVT6l?=
 =?us-ascii?Q?Tha0dlPF6nwV9sZaFKCGQWHc8Il61PQGcHiWicOX4a7jsFpNj4k4i0ORQoFp?=
 =?us-ascii?Q?pWeXp3gylDJPc+FuRorP4wL5m3pQjGw0PTsGVIkYn24qch5V5UPh9qjd0T6d?=
 =?us-ascii?Q?k1ma2cFAwtbM84EiPLCCbiFLCE6NUYRqw8jjBG0lBNt6fvbVbrLtiDKL8UK0?=
 =?us-ascii?Q?XIpXT9IY2ks4K6nzxFmh2GU7qQwI9BBdK5gbnPIyUyNelNnTQnS78kciVnFJ?=
 =?us-ascii?Q?Gy4N2I8+lGg91S3xjcKYTIfqWt3tGytCY+mE2kUStdifhAI/iyQGuVeq44Us?=
 =?us-ascii?Q?TL1RSYAUrA=3D=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a1932284-7ae7-40b3-f3fd-08da2d0fb1db
X-MS-Exchange-CrossTenant-AuthSource: MN2PR10MB4013.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 May 2022 14:17:46.0275 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: juHTelQDHBq2DXt7Ah1z37FG8jlPhzKrEkQKCnqL7lh44KaE4AFeF67QlUWkcga9PSt+bHFU6w5QLGhf/goj3w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR10MB3358
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.486, 18.0.858
 definitions=2022-05-03_05:2022-05-02,
 2022-05-03 signatures=0
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0
 phishscore=0
 mlxlogscore=999 mlxscore=0 spamscore=0 suspectscore=0 bulkscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2202240000 definitions=main-2205030103
X-Proofpoint-ORIG-GUID: XvNVxvY1ISS0TjhntCxqlTfzeoLiF9IR
X-Proofpoint-GUID: XvNVxvY1ISS0TjhntCxqlTfzeoLiF9IR
Received-SPF: pass client-ip=205.220.165.32; envelope-from=jag.raman@oracle.com;
 helo=mx0a-00069f02.pphosted.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

Adds handler to reset a remote device

Signed-off-by: Elena Ufimtseva <elena.ufimtseva@oracle.com>
Signed-off-by: John G Johnson <john.g.johnson@oracle.com>
Signed-off-by: Jagannathan Raman <jag.raman@oracle.com>
Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
---
 hw/remote/vfio-user-obj.c | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/hw/remote/vfio-user-obj.c b/hw/remote/vfio-user-obj.c
index d351b1daa3..15b06744f9 100644
--- a/hw/remote/vfio-user-obj.c
+++ b/hw/remote/vfio-user-obj.c
@@ -630,6 +630,20 @@ void vfu_object_set_bus_irq(PCIBus *pci_bus)
     pci_bus_irqs(pci_bus, vfu_object_set_irq, vfu_object_map_irq, pci_bus, 1);
 }
 
+static int vfu_object_device_reset(vfu_ctx_t *vfu_ctx, vfu_reset_type_t type)
+{
+    VfuObject *o = vfu_get_private(vfu_ctx);
+
+    /* vfu_object_ctx_run() handles lost connection */
+    if (type == VFU_RESET_LOST_CONN) {
+        return 0;
+    }
+
+    qdev_reset_all(DEVICE(o->pci_dev));
+
+    return 0;
+}
+
 /*
  * TYPE_VFU_OBJECT depends on the availability of the 'socket' and 'device'
  * properties. It also depends on devices instantiated in QEMU. These
@@ -735,6 +749,12 @@ static void vfu_object_init_ctx(VfuObject *o, Error **errp)
         goto fail;
     }
 
+    ret = vfu_setup_device_reset_cb(o->vfu_ctx, &vfu_object_device_reset);
+    if (ret < 0) {
+        error_setg(errp, "vfu: Failed to setup reset callback");
+        goto fail;
+    }
+
     ret = vfu_realize_ctx(o->vfu_ctx);
     if (ret < 0) {
         error_setg(errp, "vfu: Failed to realize device %s- %s",
-- 
2.20.1


