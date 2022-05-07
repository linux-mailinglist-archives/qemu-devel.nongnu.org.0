Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D79BD51E38B
	for <lists+qemu-devel@lfdr.de>; Sat,  7 May 2022 04:31:08 +0200 (CEST)
Received: from localhost ([::1]:41416 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nnADr-0007cH-Ok
	for lists+qemu-devel@lfdr.de; Fri, 06 May 2022 22:31:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46606)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <si-wei.liu@oracle.com>)
 id 1nnABU-0004t8-NG
 for qemu-devel@nongnu.org; Fri, 06 May 2022 22:28:40 -0400
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32]:35794)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <si-wei.liu@oracle.com>)
 id 1nnABR-0002T6-7k
 for qemu-devel@nongnu.org; Fri, 06 May 2022 22:28:40 -0400
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 246KM4Vb013484;
 Sat, 7 May 2022 02:28:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : content-type :
 mime-version; s=corp-2021-07-09;
 bh=UH8ONQDqwjqYQ4lGiy+B4eQ6Ks2NSI+/jFWft0KaAxI=;
 b=QrB7As27w9bVnU7iye251SdZDMMIqzDBDCfI0LQs0aeQ5cUpx5/sD0ogAnAGMXsr8z4F
 AHuhT/ZrlDDzP9NHLxSoL/MAF/7HDaUXAJnH8MXknt6bgZ7aTbmSUg+3D5PQV+u2MbBr
 aqTK9lMRlqyktuDfZ3nQBsJkvGK0msbhVFWEuHt+VE3RFpwIIGfclRi52i2R1WuSyj3w
 LiAd90mIjiD3u+VhXQIDVTZp0n3LbiHR0QAAGWgrpXke3TdlPrL8KBM2LLbEydoDmUcD
 d7pSf2TBXh3xRfaZaxzTHwQHmTVmB/bOmf0P4W4FT+iG7f+2IzuCe+c4n3pwJqvnBcTt zg== 
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com
 (phxpaimrmta02.appoci.oracle.com [147.154.114.232])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3frvqsqg0x-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Sat, 07 May 2022 02:28:34 +0000
Received: from pps.filterd
 (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
 by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (8.16.1.2/8.16.1.2)
 with SMTP id 2472BQET024288; Sat, 7 May 2022 02:28:33 GMT
Received: from nam02-bn1-obe.outbound.protection.outlook.com
 (mail-bn1nam07lp2045.outbound.protection.outlook.com [104.47.51.45])
 by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com with ESMTP id
 3fwf700tpe-2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Sat, 07 May 2022 02:28:33 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BaM7QMOhL3+LiU7qUcY/1H8219MmNF80c7tUTTXBSi4Ft7aFmEZ40bCowBap/sqGvEK5hdgDf7shdwCZp8SDF14aEppTI+xmtR6ikxDtW9p8F7Nc2ZcF7UEgBOCdLBWsg3XMbaQ9VfgVgheC7G7H1+v4hwYIU/2oz/UJocLddytWJ+XYu/JpeXxKD+xWjUHLsWpUoiQAkYehYVwdwQp4hr1RxxkLezJrpRW3Y8G2RVF1GF2wvDczPNw4cCIPavkSdo4wmZaEYSo+RxJ9J8X40TOnHkAJ5S6JFSQAiDdcdfdqyAs/CjStNaOMD8Hn2AziRc6lnNga2W3ua4gdTeCGuA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UH8ONQDqwjqYQ4lGiy+B4eQ6Ks2NSI+/jFWft0KaAxI=;
 b=HPUYbUmMnGIsmSYLjbca1fvPpiB0HFumIlJgghhEltcLp5PP9oS6TQtbbn3Bne7osrLais7uBLxCLByBZ8/cLyl4lo/jPJBu31xrEG8P9DT4KwyeRgLwG9I467N4FRk5rFNNDFLaH1d4KuygboWuXak3swvUmebq/8KKsqCYMYN4u0gsaUzWngXgFGIxZpe5kpazf9BAUs+ZsHRkLrK0M3Pe9/iSOcOsPn+Rgsm++sTCyGu7K+FZr56fatiTNca5+hPU8CdDUUA3f7lCl2SFJdGMAyvuPiK1jn8jbox4+toZdJkylsYAJ3fhC6tiqIFJFQBUjdib3brziqgQ3TWAag==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UH8ONQDqwjqYQ4lGiy+B4eQ6Ks2NSI+/jFWft0KaAxI=;
 b=q4g8M5Ud1zM7eVt/CHyxWfEO4QP9Itiv3ftubJgSSYR2h/nbEYJ5MupF6Qq6vsmuhLVHcXpSb9Jh4DkFs98C8x0B42eKkP13uEYlcTVh6dMnxQFABkSHN25ebgVG2bhQU5ELTH/KsUF8VDEXzKROIPUJc/yq3nrpc9Ekj3+2/go=
Received: from BYAPR10MB3287.namprd10.prod.outlook.com (2603:10b6:a03:15c::11)
 by DM5PR10MB1370.namprd10.prod.outlook.com (2603:10b6:3:f::8) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5206.24; Sat, 7 May 2022 02:28:31 +0000
Received: from BYAPR10MB3287.namprd10.prod.outlook.com
 ([fe80::c89:e3f5:ea4a:8d30]) by BYAPR10MB3287.namprd10.prod.outlook.com
 ([fe80::c89:e3f5:ea4a:8d30%2]) with mapi id 15.20.5227.021; Sat, 7 May 2022
 02:28:31 +0000
From: Si-Wei Liu <si-wei.liu@oracle.com>
To: qemu-devel@nongnu.org
Cc: jasowang@redhat.com, mst@redhat.com, eperezma@redhat.com,
 sgarzare@redhat.com, eli@mellanox.com, si-wei.liu@oracle.com
Subject: [PATCH v4 3/7] vhost-vdpa: fix improper cleanup in net_init_vhost_vdpa
Date: Fri,  6 May 2022 19:28:14 -0700
Message-Id: <1651890498-24478-4-git-send-email-si-wei.liu@oracle.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1651890498-24478-1-git-send-email-si-wei.liu@oracle.com>
References: <1651890498-24478-1-git-send-email-si-wei.liu@oracle.com>
Content-Type: text/plain
X-ClientProxiedBy: DM6PR03CA0041.namprd03.prod.outlook.com
 (2603:10b6:5:100::18) To BYAPR10MB3287.namprd10.prod.outlook.com
 (2603:10b6:a03:15c::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 02a8e495-4036-4f68-98eb-08da2fd14708
X-MS-TrafficTypeDiagnostic: DM5PR10MB1370:EE_
X-Microsoft-Antispam-PRVS: <DM5PR10MB1370BDF9E65031B09318AB05B1C49@DM5PR10MB1370.namprd10.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: JaN3z7WNpJkhD4v9mARaB2V0ekUR2cYsfKmAEXFtlQsYoYOla7DGJ8ODgFVJMq/pen/A06+DmnpHCfbgJK5KG/+cj/XiGKJBC5HjRlcifD5oBd69an1TOWSjzh6HtAMhtKV0h2/fADpgI1psmo9KOzoLGFPHJKnzJOjq17ggrt4uvFS2v+fyiphugwEV1NDx3HBdQMib596FUyX30wa81QVKNrqop3Jfe4AcROqFz9W2ENRpTZLf7m3WVTIJ/2lbYx2IgI+i8Arfv4GtoI0PDTZFCpWLBTA4hEPgvC/PZoWv5bv0FY68zC54jEvnhgO3t3kCOUFIjJEnDWws5k1gJT8Eigsi1fKrOuif5mlXi2Wc8Z74dKCvsqOpr79+OlxLQ+dUmqvegcRY9sR8ChVItDxybDDdZBFEh//8Y62uZPEoz7EFzkpd/68InpfoL8XdB9u8n0yE7rWG3meFoPQjL64XTI9kl4wWWlcHHbgFf9aEJqQzpsVFtPKmssMH5WrFNOSA4YtxJ525mVPXYIw++IjrO23x53hA/SwK1AV2/zOqY1s1RdT0Sy7vilrm/0z/BRh7PMBBuCHIUjx9Iwn1GXCav1LOPzXocx4S1lJqfgUoLbfeqPekF2bSVIjTfczNKt0m+GQVIARK+CrELwDNp2BBxMIzpdDcLUcWtlpMNp+vx+MAU6/55KheU0XEwPEsxhXo6/2fMiWzI6EyI3OJ9w==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR10MB3287.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(83380400001)(52116002)(6666004)(508600001)(5660300002)(6506007)(4744005)(6486002)(8936002)(186003)(86362001)(38100700002)(38350700002)(2616005)(316002)(8676002)(6916009)(66476007)(4326008)(66556008)(2906002)(66946007)(26005)(6512007)(107886003)(36756003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?rQClKn9bK1qDawViP5txBkbIwkp6qGcRlaQwTMWF0Q4qeW5MrX0XPWOOhVpp?=
 =?us-ascii?Q?wDZo4pwhR/fgmg44/R/upeBPR7BroEeJ1a59sAPHbXN/FFe0GrRLfzmvrq2l?=
 =?us-ascii?Q?zbURSasZT/s5d8kDz41yB3DzqlLLOwA/OhQmbRZTYYsf97pj8eoRG2qaYo6T?=
 =?us-ascii?Q?ePSN6yur48be/q+KmFF/1nPSl/bj9Zj2cLZg0BGf4ZZvs8YRhtiA+aTCplLk?=
 =?us-ascii?Q?2pwyyichYLmtrCASmwpHEoaexCyFJcKquDEK8DGq7PhEmlHtbF1TS5YkDpgK?=
 =?us-ascii?Q?mzht2mnE9/1hermNRBQ1sO931mXWX3iJ8hQXSdoTDrkpzExyjhNAbcFF/2Km?=
 =?us-ascii?Q?eqoBMR1H8PrS/ubF1TlEFUTjmhJrB0wDNHK9YJM2ckqJ6IJEo2LntJHGF/6A?=
 =?us-ascii?Q?igvqmU79dQjnQD37IsReuDNWSlQIHycrbrGOJXW0yJV9LF+CisqonugJ7FGM?=
 =?us-ascii?Q?50FZjYZWBjTuhqC+unadSa2TZsnNRqCL2hme4FqrsVsNxuUCx7CE7hPJUMeA?=
 =?us-ascii?Q?1+rDahv4FuYKhbvdwPrkb/6bgKlQXhTZkcUMRHYxnS1H9EMavEWeR3081VRl?=
 =?us-ascii?Q?ShjtvyEbO+R8sYqInxhjtayP2Oz7Lg1F0hpE2VRcwbXhHgNGK78GamM6Lq7X?=
 =?us-ascii?Q?nMr6AduZ40Pcv4ln1hlKHMgica4QkqZ3FCTPR6T+3q+d2lCXTZc3XYpWFIsA?=
 =?us-ascii?Q?6Yo6M/jHqo25KU0FWEd0or/XSbEEgC4b4tZDdbV1x5ek98GbgjKWS3lXfNii?=
 =?us-ascii?Q?/qs84rhR5BwNvKLdYgcYe6wg7jniattbE1lkGNzYCK44XLJKw7ViwrBooAbO?=
 =?us-ascii?Q?hGxJRjUQE55NyaTA9dbHFDIlEQeERMeXfcLrWVmnOEnR5txH2OBAgOldlD2I?=
 =?us-ascii?Q?0NGk4VI3Fu1yk1GZ1f74wsRp+T/ep8CB0zBUKe6ZjosFHG+wfWUKCyNjEl6d?=
 =?us-ascii?Q?IC+357m3CQAAuqJMKGciAaeDktU0+KtfBAM1d6fNOQg9PpMuPXThKLBIyC/v?=
 =?us-ascii?Q?t1xMqWWVAs3OW1MnXXWVg/TSUudXTHUHv+n2Ctf3JrDHWiDhzSDeXlK8WZ0F?=
 =?us-ascii?Q?XoCu33v84sf5APBtgxUHAUteaYvZlTLhVwsn+BxnwwysJlAiu6g6W5JsH0m+?=
 =?us-ascii?Q?67PRZQU7pk8YF75+abGRW/F1387eNud4vXWDbjBGT6XgPpntYac/0qY6yyPc?=
 =?us-ascii?Q?rfBtB+ahT5qn4TqrOvrxID/Z7O62i1Oil06z/ivrQxmEVMVnKX6aQXuBvB9d?=
 =?us-ascii?Q?7PD8Zksm7nUZfFkhsmJefdFqngVDoAQHY3lciJDY5N9Cmr9gCTQQe8MhqtDK?=
 =?us-ascii?Q?R/I6V6L01b4uez87zKFXbYBvMvwp/gkaGcSN9ZFCzn69azhdrq/6m347/bQB?=
 =?us-ascii?Q?5hxChvk9V7EI4DlrZzT6NQ8tCUpwABeJFU7NArEVYcuUH/diEWa39RLWVBX/?=
 =?us-ascii?Q?13k3MvRhrsO4Qbvb2IiXgExc1nzzi7c63ZkDjrhWpSsmLz7PA2HQnATx1+VR?=
 =?us-ascii?Q?cqEibxm0B1jauhDsoq7SfHmIU35ZMB1Q9RoehVe7OJ2U3QeiHLd9RG0Os3Uq?=
 =?us-ascii?Q?QfXTWVz48WF3yGo5fDgihABwfxG+eQmr/XqB5ZjbVtF8GJFe9PaHtf6mszqA?=
 =?us-ascii?Q?yrTKBjxQnQ0NgmWaepPD26dM6WWbpKDxwyXt3/Cg6tAlYByc9lMwP936/6sc?=
 =?us-ascii?Q?ViClaCz6BbQ3qQXhSSVKf6TBZ6cQmLv1TCcALDxjUzsyWBGUI0QXUcAaIKLq?=
 =?us-ascii?Q?udRe17DyIfpYAnOGU3M/yT/BdgEadrg=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 02a8e495-4036-4f68-98eb-08da2fd14708
X-MS-Exchange-CrossTenant-AuthSource: BYAPR10MB3287.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 May 2022 02:28:31.4325 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: P2OuW39l5oFOvh8a6miaqO8d1gN60ARgsiHMAjeDyspjK/gDshOYmGr+OIT/iGCDRAzbYdy95iBTEXG2CiBjBw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR10MB1370
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.486, 18.0.858
 definitions=2022-05-06_07:2022-05-05,
 2022-05-06 signatures=0
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999
 malwarescore=0
 suspectscore=0 phishscore=0 spamscore=0 bulkscore=0 mlxscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2202240000 definitions=main-2205070012
X-Proofpoint-GUID: lLhfRrWEEZN1fTR1nK-03YvAJkhULkZ0
X-Proofpoint-ORIG-GUID: lLhfRrWEEZN1fTR1nK-03YvAJkhULkZ0
Received-SPF: pass client-ip=205.220.177.32;
 envelope-from=si-wei.liu@oracle.com; helo=mx0b-00069f02.pphosted.com
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

... such that no memory leaks on dangling net clients in case of
error.

Signed-off-by: Si-Wei Liu <si-wei.liu@oracle.com>
Acked-by: Jason Wang <jasowang@redhat.com>
---
 net/vhost-vdpa.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/net/vhost-vdpa.c b/net/vhost-vdpa.c
index 1e9fe47..df1e69e 100644
--- a/net/vhost-vdpa.c
+++ b/net/vhost-vdpa.c
@@ -306,7 +306,9 @@ int net_init_vhost_vdpa(const Netdev *netdev, const char *name,
 
 err:
     if (i) {
-        qemu_del_net_client(ncs[0]);
+        for (i--; i >= 0; i--) {
+            qemu_del_net_client(ncs[i]);
+        }
     }
     qemu_close(vdpa_device_fd);
 
-- 
1.8.3.1


