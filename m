Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CC31B4BDB06
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Feb 2022 17:56:09 +0100 (CET)
Received: from localhost ([::1]:47662 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nMByq-0002PO-DB
	for lists+qemu-devel@lfdr.de; Mon, 21 Feb 2022 11:56:08 -0500
Received: from eggs.gnu.org ([209.51.188.92]:41428)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david.edmondson@oracle.com>)
 id 1nMBt6-0007Fq-7c
 for qemu-devel@nongnu.org; Mon, 21 Feb 2022 11:50:15 -0500
Received: from mx0a-00069f02.pphosted.com ([205.220.165.32]:26352)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david.edmondson@oracle.com>)
 id 1nMBsz-0002Jl-FS
 for qemu-devel@nongnu.org; Mon, 21 Feb 2022 11:50:09 -0500
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 21LGmHq4021743
 for <qemu-devel@nongnu.org>; Mon, 21 Feb 2022 16:49:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references :
 content-transfer-encoding : content-type : mime-version;
 s=corp-2021-07-09; bh=o70CU4R/5bA8AKpfrizMe/LOQz4vqdPwIL70kRsw5kE=;
 b=JjAQQdFm8fkKwqM1EmN2xH6o5EQKdnym8QH+p9jvRGL7UZdAYt/M3C4LQ3un0R0//jMv
 J8uk0XgzAyQpUw3NHwDnq6vM1lYq3nfTldfcNfd+4c4+t0wsMyhiuTJNEwF0Baeuysgz
 pzKBgOBC1FQ4bsgR0d47FaMC3vzW4sxhnRjIK6H2IuhmZZ6NIEqzoBBQwr+q+Cl0wO2g
 qQXTaemTQLYd0mY59Ag47dct2jir6FJKFZGWiP5NGCpI/u3KnRgg9uOaHQIRXAM+gotj
 A/o0jsCK/dTjIG+S4URK7AHxUAbwAe3bGecQSJUuAaBlB6CXAlz46/QJjsTxEiYzI/Kd rQ== 
Received: from aserp3030.oracle.com (aserp3030.oracle.com [141.146.126.71])
 by mx0b-00069f02.pphosted.com with ESMTP id 3eaq52cnub-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
 for <qemu-devel@nongnu.org>; Mon, 21 Feb 2022 16:49:58 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
 by aserp3030.oracle.com (8.16.1.2/8.16.1.2) with SMTP id 21LGklsS126115
 for <qemu-devel@nongnu.org>; Mon, 21 Feb 2022 16:49:57 GMT
Received: from nam11-co1-obe.outbound.protection.outlook.com
 (mail-co1nam11lp2175.outbound.protection.outlook.com [104.47.56.175])
 by aserp3030.oracle.com with ESMTP id 3eapkevn74-2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
 for <qemu-devel@nongnu.org>; Mon, 21 Feb 2022 16:49:56 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AmC1IKzpHljbB1tKpE75PeORV/aYVPytifLiSeRMVxt96kuBdNJGFsQwyqh7QGoNAVP8qvqLZFFCm1zUOcaon1acjA963oMY6o/wbGw2A4nCNXd5symK7qecQfdvinbCMcIwZ+nUrvIlMm/6QTmcLX+OC09fx5/5Z//8IFeTHHq6Aw+p022wNEcXrgSihUlyAmRiu+JIQ5SZGgJpdltLB4P5f3JBytOFrY6pw9BoX5Df/aEBwIdjQR87segqJ8ikkYnnEMCh59+7w+qVHM10ZwLdSgrg4W+jLOLS4mW5titncnf/Zd4rQktDZ+DVXafn6C7U3y+z4hSDILtjbfCvAw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=o70CU4R/5bA8AKpfrizMe/LOQz4vqdPwIL70kRsw5kE=;
 b=biZt6dHHM2tkCpUEz7ODR5yspPD5j4Lz33K3WzYwQs40T2eZ66PHes0fiReYPH8pZiu4NbjBC2kydP3/go3Qs9GWgyNxkSJvQ4NJVzdJiJAFl9Im4xdjYOzKQnKwBdQiz+4kRr3TsulE3ggWzLS5ICm3RiGMLFVcadHG650KIYVJKiui/nvYxKNs0UqpfYhu0zYhZw1Jnc4dCXlA4+ac0RY+HW7O4sA6v121kiN3/VLmg3vK9IeXEIg+BPbifBdCWkeU98yU/AhVUqYWwKJLoo2azXlXSvQZL3RdvexKLN/5m2SFGn/ffvctX+LPmtJhq9xmLam51QkjL99lTdO7+A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=o70CU4R/5bA8AKpfrizMe/LOQz4vqdPwIL70kRsw5kE=;
 b=AXSaWXgVwzKTtjjHoaiMi2nO7Q/aRYRXPQ+l+nO1Kz/4FlZ6+7i9OaAprifTaogUvW+1f48kVI5I2a2+yOsDAGAmPfPNNJFI1jzwohnMaOcFZX39v3P8xLY1B0iRLYLk5EijaFsRi4qdV+sJXqhcGppRjiNbTgUJgRBaSaMKLOY=
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
Subject: [PATCH 1/2] scripts/qemu-gdb/mtree.py: Int128 are decimal rather than
 hex
Date: Mon, 21 Feb 2022 16:49:47 +0000
Message-Id: <20220221164948.2873713-2-david.edmondson@oracle.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220221164948.2873713-1-david.edmondson@oracle.com>
References: <20220221164948.2873713-1-david.edmondson@oracle.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: LO4P123CA0088.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:190::21) To DS7PR10MB4926.namprd10.prod.outlook.com
 (2603:10b6:5:3ac::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 1ccc95a5-b044-412a-0315-08d9f55a2f8a
X-MS-TrafficTypeDiagnostic: DM6PR10MB3562:EE_
X-Microsoft-Antispam-PRVS: <DM6PR10MB3562F24655045FB6C438D6CD883A9@DM6PR10MB3562.namprd10.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: cuqn/7coIJWxx1hWqdhfv9XPfjhTs5+hWqDYe5G9nt1ZH/JXPj2EEuqScrLlY3FRQ+TSWfQQ31jO8r7Dkpu8bLkltw1KkwjSHwYZDpwTCV/IDGt0vwv09mN9la81mdumOyBaDFObGrgZiOLSvLzyKV3Z8SAZKBMl+cGb78Tg5wdlDoIcgRS2q8r1SPVbgBXcHCt1b1RMzT/3ORpdRI8EUk4n+QnKmSWmmYnFl25RyU48bLUKSRY1C72dlrjBmdtCaeYmWAN/BiKGpqzldYGfnnnlvreDIuk5tQubpi3ZByfmpKdTYJCu+UV8uXtwhbixtX9q59dp4PeeRJIdh8FD/d5fAhrUgCiPigA0iTGHSjVvJlvN4gBxFisdNO+ZEiFalMm7TlLMhIAjD+Y338WBHtddqEQ0b9K6nmkO+W14620GJRlN/6eR69fz0ruNRAa4hujDjZCG2Xy61Lnp9R+Aovi/soZNv7u00C7dPveqHx4LdvsoCwvNo6rUh5alCpEyzLGryo5lMCxgv0eBM3cUOYzIBB9C3UBm7bqXSXwC4ojKDkdmIXOgAyLl8ZV3DjnWRHEnD47gAq9DGtQBTzUPxv9+xzeBiKmY7fKNQEgm4rNzm9qAF9sUGuLt7y5cQ4bvtufdN0jD4AtJlMFprJlsYA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS7PR10MB4926.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(86362001)(66476007)(6486002)(38100700002)(66556008)(66946007)(8676002)(5660300002)(4326008)(6916009)(316002)(83380400001)(4744005)(8936002)(44832011)(2906002)(36756003)(2616005)(1076003)(107886003)(186003)(508600001)(6506007)(52116002)(6512007)(6666004);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?s52ECKrPjahk38BbkTcDJBoDq82vPlsMENniaVGNCNSU0MVrBsZPfQpX12q+?=
 =?us-ascii?Q?+9FUYv8X+PFvliftxvSsm9OTDlFEE3sm+Fo87l55WUUmBS26i9SmRz/XnUN7?=
 =?us-ascii?Q?I4w69YgmnnaMqlJVT4cBjMF2xdtvoM+o4hPUSPYs3FzkoVO28Z3wrkZZlAI6?=
 =?us-ascii?Q?BztoRT6BYM85MJesd8DZExUsCc/NCNbS3c4U1UVTEYhixiz6HsPlaYEdB2EQ?=
 =?us-ascii?Q?TuE5xCmcp2F9oXpxk/HpYVfh0Yli/8Jq6UplQ8TtPsNeOZb4P5j1QzhkRXmF?=
 =?us-ascii?Q?F7WhD+6dre+xV/VQ7alxpBuOAMMDgdt3eV7ZbqVDtTkuzt3Iz1eKp/olIolH?=
 =?us-ascii?Q?Bs+Y7pHBg+yINCRCnljv/Z7QL1ENCUcV8P0560AciMe4mZcd7ZYASC78vvja?=
 =?us-ascii?Q?S1B03mE/owcnQl2e3ZYg4PgPBehsI716wHXAXwHFaW+CvF5SNNe34l8NmDfT?=
 =?us-ascii?Q?mzGtBSjdvqlMe51mr4t0/4UteCUqIWW8uCnl9CTjF1wutFuxSNTH0C68yiG8?=
 =?us-ascii?Q?bYiw7iZh/Z0ykorqYmNbk41RJt2kTCiBMjDAUVhU4lwqykz3uGWgQSvEPMj6?=
 =?us-ascii?Q?BQ/5hOtSdYJmOHg2O/nUycNeljr8muz1+WbsrkSZljp4RZDstHsOBV+43o15?=
 =?us-ascii?Q?+6S16eo0hQiH3SIUtrJ5twbt0OIE/4zZQB1dOyaKt4h4Xd4DQSnfFfl1B7p/?=
 =?us-ascii?Q?6U8uyNJg1sCP0rOHbUe1vjNBr5xPE0Zsz8o11D+40md4ql7g9addZu5xZigt?=
 =?us-ascii?Q?LUJ6Ia6Q1Pd9ZePiUt5rEVzpBnTNA7q3o1VEX5dAu/sPtEhLO2LtwhOPg64P?=
 =?us-ascii?Q?0pbS0c29BcIz0bPgjkMT+vyYo8RZXFndYFWFQM98ulA6nyLNCnuJNs7cZhSU?=
 =?us-ascii?Q?hiUEvxeMzNLFVvLuCgnGadxUK1gRxl7ICL/oimeBo8ur/KWE4nfS0hxBpMH6?=
 =?us-ascii?Q?6PT1CaUC/vG0by7p6RSwyTUQJgkmbXRhqfgDJAUHypoBmzcCN0bGAO9GYTuJ?=
 =?us-ascii?Q?5WHjXt1iBkMVMSqwPf8a+gIXA+YuNlYR3PFEgDcCzKanBzNuYpaW10/6RY3v?=
 =?us-ascii?Q?aKm26LmEGnPji1KnNzaqCSYl9cQ5iRX41nAhwGuiQ8eajqtH2ny4OoqntlCu?=
 =?us-ascii?Q?erxX72/nIWWZd+VN7zDV4jrpgamsI3F7qKSVRe54L+2goHQqx4Kuo0lsIm0+?=
 =?us-ascii?Q?yTupOzZFHQRreoy/c4wP+kAkcoSgeoteF4mWB8Zl0ML0Gj4z/tgPyZxNA4PZ?=
 =?us-ascii?Q?vbc5uWUnotDnKQ6+PjROiTweJE7LSYUgv7P/2Wsc9OWp5cFJL/rsIjDOR7YK?=
 =?us-ascii?Q?38w6ZriVC8nho6uLrCVfwYu29eDxz35RSmaBX6JwAzjZ87N+wZZyr+/dy3i+?=
 =?us-ascii?Q?CtG4QYpacTOkAdySHP7tmHoR0YS2B5Pr6zRuegpJPDIK2aMzxZpSsJn2TNsj?=
 =?us-ascii?Q?wYhM6zE+/sjkZVKPd55Tm3RsHocD/kDt4LAKjzjACpkrkn/DF/Vric2LATpF?=
 =?us-ascii?Q?W/3WkbYlXYZ4ZGyJcPRiX2fsIWsT17UL3DqHcWBnbLLm07myqYsIKHQJ2p+s?=
 =?us-ascii?Q?d0LOdxRFPNs/2zkW4O2qh7N1QICl6zv9sXCdE+baLBOQ4u/3jUpanmLwXiFZ?=
 =?us-ascii?Q?/t7XcAP4bb5Bk+LhMIVGAx7OmwKfCEqiHnJLaevqgbbbFjfImfTQC86mQ3dK?=
 =?us-ascii?Q?AFKYYzlSCGMmHFIfbb1Q7fxm4ymPo/42Wb3DXI2j9SdmFeaZ?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1ccc95a5-b044-412a-0315-08d9f55a2f8a
X-MS-Exchange-CrossTenant-AuthSource: DS7PR10MB4926.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Feb 2022 16:49:54.6039 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ONSchK4kwa/k+lf+wGe11EnWs/KKOZwulyjbUHDvVipM0JpPgWZYnbaGHeO7rRx5M7I9/41pxejKs6Zh/HlG/oXuwxg57hnjCyBBnRVnrmI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR10MB3562
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10265
 signatures=677614
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0
 suspectscore=0 mlxscore=0
 spamscore=0 mlxlogscore=999 adultscore=0 phishscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2201110000
 definitions=main-2202210099
X-Proofpoint-GUID: 9odYj11sfOiGdA85sLtaGJKWpdu4fDja
X-Proofpoint-ORIG-GUID: 9odYj11sfOiGdA85sLtaGJKWpdu4fDja
Received-SPF: pass client-ip=205.220.165.32;
 envelope-from=david.edmondson@oracle.com; helo=mx0a-00069f02.pphosted.com
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
Cc: David Edmondson <david.edmondson@oracle.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

When parsing QEMU's native Int128 type, do not attempt to convert from
hexadecimal.

Fixes: 8037fa55ac ("scripts/qemugdb/mtree.py: fix up mtree dump")
Signed-off-by: David Edmondson <david.edmondson@oracle.com>
---
 scripts/qemugdb/mtree.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/qemugdb/mtree.py b/scripts/qemugdb/mtree.py
index 8fe42c3c12..c1557d44fa 100644
--- a/scripts/qemugdb/mtree.py
+++ b/scripts/qemugdb/mtree.py
@@ -25,7 +25,7 @@ def int128(p):
     if p.type.code == gdb.TYPE_CODE_STRUCT:
         return int(p['lo']) + (int(p['hi']) << 64)
     else:
-        return int(("%s" % p), 16)
+        return int("%s" % p)
 
 class MtreeCommand(gdb.Command):
     '''Display the memory tree hierarchy'''
-- 
2.34.1


