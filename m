Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BFA9A4BDB07
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Feb 2022 17:57:10 +0100 (CET)
Received: from localhost ([::1]:51322 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nMBzp-0004to-TF
	for lists+qemu-devel@lfdr.de; Mon, 21 Feb 2022 11:57:09 -0500
Received: from eggs.gnu.org ([209.51.188.92]:41450)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david.edmondson@oracle.com>)
 id 1nMBt6-0007Fs-PA
 for qemu-devel@nongnu.org; Mon, 21 Feb 2022 11:50:15 -0500
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32]:59900)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david.edmondson@oracle.com>)
 id 1nMBsz-0002Jq-Dm
 for qemu-devel@nongnu.org; Mon, 21 Feb 2022 11:50:12 -0500
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 21LDYbKI029477
 for <qemu-devel@nongnu.org>; Mon, 21 Feb 2022 16:49:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references :
 content-transfer-encoding : content-type : mime-version;
 s=corp-2021-07-09; bh=kz//P2bx3m3GWk84RKSr5QvmIsaYkKKtHLPEgk0zA5k=;
 b=cM15H9qm9qocTEVDh134kQW9ZOZTYu7GsMBZLmgJExBx5q/WlHwwDhOzu11nq+3C45gV
 cGcK5rf6pPbWhXFvgtHXm2oIeZc8nlPcIgcDphPl+aJExbSF7lnZHtZY3/2aQMy/5UBx
 C14qUD5ozGAJgbHAXaxaqu33n+B7MeEmzRYeE/PxTzXtRXNRlfWQ50u2MKKF19ENSdVf
 nSddVHAdIqVucL+SI/syD9spcJ0m75FqfjUTGOYAr7ARkM0dRnqtJZ0601Pc3gwyFIOI
 Zln1jFDVgtoca72s+PdCEgJKoEgQADiGjCOazP3YGULEgm4KfTdPtuRY5XkevXG+IPIO IA== 
Received: from aserp3030.oracle.com (aserp3030.oracle.com [141.146.126.71])
 by mx0b-00069f02.pphosted.com with ESMTP id 3ear5t4kde-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
 for <qemu-devel@nongnu.org>; Mon, 21 Feb 2022 16:49:58 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
 by aserp3030.oracle.com (8.16.1.2/8.16.1.2) with SMTP id 21LGklsT126115
 for <qemu-devel@nongnu.org>; Mon, 21 Feb 2022 16:49:57 GMT
Received: from nam11-co1-obe.outbound.protection.outlook.com
 (mail-co1nam11lp2175.outbound.protection.outlook.com [104.47.56.175])
 by aserp3030.oracle.com with ESMTP id 3eapkevn74-3
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
 for <qemu-devel@nongnu.org>; Mon, 21 Feb 2022 16:49:57 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=d76vSCnxPoxTiXm0EU7I2gwuLYd27IDVSWdH6PAvu8x646EXCkP/frvBo3ALM8405Az+Ab61MO+yqthjDkzzAu73VNtDotLM4WqKejUBX22YqbJs+vX2J8fQ9CISkky85BW9RQ8Df4kF6cy513d2e9y22RWIERl5O+oIjT4UKov2XhPe5CVfOs4HrWKp6kOsdjYK3lqEvlDnQC7dx03fJkiGkCYwlL+zz37YWEHqKx+aqhVhvdmKNkro4GUIfT+96Ji57z0sAsJVHUH2bUeZvNEgI4VDke2MUk5NS4lRUKScz5SOJGwsgUbiY7ZmOoBizLJU2RylkoPfLUSzWavRUg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kz//P2bx3m3GWk84RKSr5QvmIsaYkKKtHLPEgk0zA5k=;
 b=Gk+3EfuzAU15m3pPMQIpV5ZaegHscgI2SXkhuDJkGofBw1jsNepxxRE4FLFPO524EfNbJZIDCgOeJyx1Hptxq6ip8EiZDkGDzPy5RmvqduahfwVKvhC3cY6c/ER1UrSWuW+39aXIrmy4YyLG65SzIK9WoOPe/L8DI0uzVjKsrvaMYPX4B6Y/8nWL0X39DO2pjkGwdQka45Yibcuiw9PgpKvcdUmz4Ug6VP84MMfvjZe0gSGLw+8OGI0iyjaDsCLIwTAqKpAgxucVeIolHQ4gW6pwsUjw4guj5zUcf+Wz0XasX5DPU36gh+1/o2/+QoTalgxNlt8PaGyFPY6Jr4IE4A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kz//P2bx3m3GWk84RKSr5QvmIsaYkKKtHLPEgk0zA5k=;
 b=rHdRSDVZBM0N265CmlRmgHfmPhzERNSCUKSD5aUTQP+NjlN3BDR8VKssLij5TIA7XuYeXZV+PUtHgf8MFcRHh+iqHWqgjSVlJMlLtKuq2PO5pTc/ZtR0p6vf2e9KtkxlT2JoWQphQsvxcbLHwYC4FniCdHHJIjiG/IXtzM3qRMU=
Received: from DS7PR10MB4926.namprd10.prod.outlook.com (2603:10b6:5:3ac::20)
 by DM6PR10MB3562.namprd10.prod.outlook.com (2603:10b6:5:17e::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4995.15; Mon, 21 Feb
 2022 16:49:55 +0000
Received: from DS7PR10MB4926.namprd10.prod.outlook.com
 ([fe80::e429:a820:ef6e:98d9]) by DS7PR10MB4926.namprd10.prod.outlook.com
 ([fe80::e429:a820:ef6e:98d9%6]) with mapi id 15.20.4995.027; Mon, 21 Feb 2022
 16:49:55 +0000
From: David Edmondson <david.edmondson@oracle.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 2/2] scripts/qemu-gdb/timers.py: the 'last' attribute is no
 more
Date: Mon, 21 Feb 2022 16:49:48 +0000
Message-Id: <20220221164948.2873713-3-david.edmondson@oracle.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220221164948.2873713-1-david.edmondson@oracle.com>
References: <20220221164948.2873713-1-david.edmondson@oracle.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: LO4P123CA0461.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:1aa::16) To DS7PR10MB4926.namprd10.prod.outlook.com
 (2603:10b6:5:3ac::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 15768033-4479-46c9-4f64-08d9f55a300d
X-MS-TrafficTypeDiagnostic: DM6PR10MB3562:EE_
X-Microsoft-Antispam-PRVS: <DM6PR10MB3562EFD352D7864147ACEDB2883A9@DM6PR10MB3562.namprd10.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: d0LHBQwpvFYs7tSOlCfHl/MgheEBep3Sqrik+7j6GDbI7NB2q9VUziIyPZ536koDBnLtj9z6IXKbXS1IWCuTo5PPN4TUh0NThDpdZYT/+dzWZ4Sy38Mar8/cxBQjS0x08ZgBG3JCnWyQSyp3SDMrasYNE+x7GncA7n18Z0iUpytydfVJx+2Lq8K4tQlHEekZBrhKex/6tpHhS+qN7zVSRrf0+xUC3vx3iAOVKk+c7VA+BTbHTWMsSH5zLCMLgZpBFULoeM/xqquro/LhIiKTylW85tXOWcUtfgBMP6SkfQpM0Ec5EuIfi8Zo46hkegPpb6hX4gJAeJhQfvubC0Yrnk+upWJJM/gQBtogi0s+rPdpWke4r6Qgy5pLiYKMxDP0w9BrQEaAHMKusxQWyU8VHKVg1NlVXx2GiQWyAFIy3rG4yrPMNYK+xGT9krwPIMrtbJtwycg4TfqxdkoW2sCoK588dlTqxLPaRLwfhPa07bK9aqEIezy9NFoMUfV6CFN0obhBa4oF6mecYyAdJbTd+XJkbsCwXTbtvN//y/gjqb53CDmajthvdchhNROdvtZyYgDwuVuYoB4JZJcavA8HbqP1YZhMsJgExzDZuX90gs3d7yx3UxHl8E6C7FYhsTDY10hDMSCIoO8RV1cAsC7DP6GkuraA/J3LvPAkkV1a3eU/ypBoJnB1EFKyt0j1k+yWbJC/4+8aFP/3imwzBeNBsg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS7PR10MB4926.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(86362001)(66476007)(6486002)(38100700002)(66556008)(66946007)(8676002)(5660300002)(4326008)(6916009)(316002)(83380400001)(4744005)(8936002)(44832011)(2906002)(36756003)(2616005)(1076003)(107886003)(186003)(508600001)(6506007)(52116002)(6512007)(6666004)(29513003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?KLq7qpWEiIgetlSwvUptFsJNxoT5jg1+tCdO33Zx/tpUQKNu/q4/vXJA79w7?=
 =?us-ascii?Q?jOcHvnVk3F9M5vlwcW8xXhz+3niffn/+w7mhS7u1X2x55J4MufKtN4DNITTo?=
 =?us-ascii?Q?q+rBAj+7pxWOJfp4cqL7de1D5WftXYPe3kwFdlDbvVEcxvGE9CTDrHbLN953?=
 =?us-ascii?Q?zijc3Wn5ojhc6vn0kINN4w2omxnPhpQf6K4uVdfUIu3LmtXxPuStd+3RbBgd?=
 =?us-ascii?Q?kJ+THw9rlcBIorvOQpGzQJprccKIoSY71OjN4sbD5GrfV3JXOGuVIBiZT4a7?=
 =?us-ascii?Q?keUUD9DZUG3TdgXD0jLcHsjBKCy7MJZcjtPL3QhvyOALtP+ztR6jDrAEENK3?=
 =?us-ascii?Q?15EThdgsuTZLne5wlfHfOi9xtW3DeFXucLIdie14PL/Bz1YOAvlHh+Ocq+Cq?=
 =?us-ascii?Q?0I+ATVznY+XtGh4JcfwPfsbPBvUq91TuHLjAKZMOjiPPkiiSd8jxY8A3rZ+r?=
 =?us-ascii?Q?0nOrrHP16BBrdmFluEu+bf3tefnJKd7wpOi10EvwOeGHWFKMOa8l4l3CCRPQ?=
 =?us-ascii?Q?+X6ru1uJaEWlefDSSmBsGDQUwSbdiucaRpahTRoA0N50Bzj+hbwKORL0B/5+?=
 =?us-ascii?Q?lRhyxHPgA5v6U2MhukD+XBr8zMb/CSCCSRYxwKC5ccAdh48TV6qR5PHQPZc9?=
 =?us-ascii?Q?NPwLO428RWTjdrXd38a+8iRWMOhVtQZMNubKCDBKNwOOD7P5zIsmEB81TSPB?=
 =?us-ascii?Q?vSCoUDOYGlPMNT7EBUPsjyO/dSzyolrfBxXKZJm2lAJYrYGd4pFcWFBB/dYf?=
 =?us-ascii?Q?48JcXyWtmaaXOzzsDUxxNyZ6d/H3LGX51yjDSarxZnCHMHJhnP5HfjvfCsie?=
 =?us-ascii?Q?uVcF1rTCG8W3P4vgOBGBJz/LJPPCxA62o+gOCFSLSYprlZ18pMF/iemC1CC5?=
 =?us-ascii?Q?FYyJBh0FCJ9JlOopT4CKuDDwhOxZeX/wrByr1zehQE4VCI7w8se5s2B77pj/?=
 =?us-ascii?Q?mRMbC8/nwY7gGmOSXe++lVLEv/jSVCd5dNspMtrxKVNgqFYy6plL+oDvjLdN?=
 =?us-ascii?Q?XvDLbGLhm8JuJ9XWyG1YiV6Gh2zg5wkFWcvSKoWB20eDhKSRb5aLBmwgBKdv?=
 =?us-ascii?Q?jADqlZwsnfnMxiNnJvg8kjKRpTY1/6D5S0mb/iSiJyQ6UYrcf25sZr1LzVqY?=
 =?us-ascii?Q?SbhpT+Xgm3fi7go8wQup3PEyNuuNuu40N1WOwMP5h3mt3QmYNw5TXdbL/F6T?=
 =?us-ascii?Q?SjUOEUsCpQeUks10v4utlfEM8JkaqjE3/vztRLhUXQ+6LuogBAZeLVgkhSXf?=
 =?us-ascii?Q?d8yZllehetVMhthpw72rHm46XVBNbOjdYd7kt4zrkiuDNGTogL0eRVOOEuDu?=
 =?us-ascii?Q?aG8ADIIw0XpJNXHRr5MW5jgr5Nnzlqz9FKvw6KPoa6fVdSALMq2AZ8IUOemp?=
 =?us-ascii?Q?0U8mIurkO7jcfFELbBtMRe0FWAFGw4OrHziRSMxLLDM40DR4lXbBmlvvhUmY?=
 =?us-ascii?Q?i7hbm0uPtp3TBWWGTjI3OnnqL+QT0xIaGeBCgPiGFRt3oL0z4w857aDqpkdZ?=
 =?us-ascii?Q?CPc1PViCYBtX8YwSRWZrrdVwCqhkqjTw8ArtOHs8t8vmvA/D3ituYEdu52ME?=
 =?us-ascii?Q?CdYtGXeXlpe/aYh6KYgQbkJI38Ux6mLcC79MpVFwVYNaVYqqWI0j5yzJyUI2?=
 =?us-ascii?Q?Dz2yd2r1+jRMFETpoSCfuRC+AqepY7LOHRfLDt3Avqjf+hwAGVbbY6srENSg?=
 =?us-ascii?Q?231ZN2sXo3srkRCV7jL3akb3+wdnuqShr3shA3RH3WtxSpWX?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 15768033-4479-46c9-4f64-08d9f55a300d
X-MS-Exchange-CrossTenant-AuthSource: DS7PR10MB4926.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Feb 2022 16:49:55.4956 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: f6pdpeSmPpdQ+dGx0rl9kz6iGPRHHIlc+M2KLE96YZftBswi9Up9zm8yvYeoZlf98Hh/B268y34/45YDEeexskXeSmEtHnn0/Vj+qU3Rn7s=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR10MB3562
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10265
 signatures=677614
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0
 suspectscore=0 mlxscore=0
 spamscore=0 mlxlogscore=803 adultscore=0 phishscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2201110000
 definitions=main-2202210099
X-Proofpoint-GUID: Qd7P7yqO20XAR66QrnoChp1t1eBh9XHq
X-Proofpoint-ORIG-GUID: Qd7P7yqO20XAR66QrnoChp1t1eBh9XHq
Received-SPF: pass client-ip=205.220.177.32;
 envelope-from=david.edmondson@oracle.com; helo=mx0b-00069f02.pphosted.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Cc: David Edmondson <david.edmondson@oracle.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The 'last' member of QEMUClock was removed some time ago, but the
python gdb helper did not notice.

Fixes: 3c2d4c8aa6 ("timer: last, remove last bits of last")
Signed-off-by: David Edmondson <david.edmondson@oracle.com>
---
 scripts/qemugdb/timers.py | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/scripts/qemugdb/timers.py b/scripts/qemugdb/timers.py
index 46537b27cf..0538677288 100644
--- a/scripts/qemugdb/timers.py
+++ b/scripts/qemugdb/timers.py
@@ -37,10 +37,9 @@ def dump_timers(self, timer):
 
     def process_timerlist(self, tlist, ttype):
         gdb.write("Processing %s timers\n" % (ttype))
-        gdb.write("  clock %s is enabled:%s, last:%s\n" % (
+        gdb.write("  clock %s is enabled:%s\n" % (
             tlist['clock']['type'],
-            tlist['clock']['enabled'],
-            tlist['clock']['last']))
+            tlist['clock']['enabled']))
         if int(tlist['active_timers']) > 0:
             self.dump_timers(tlist['active_timers'])
 
-- 
2.34.1


