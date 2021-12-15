Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F4B0475A9E
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Dec 2021 15:26:32 +0100 (CET)
Received: from localhost ([::1]:34554 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mxVEl-00034U-89
	for lists+qemu-devel@lfdr.de; Wed, 15 Dec 2021 09:26:31 -0500
Received: from eggs.gnu.org ([209.51.188.92]:47240)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david.edmondson@oracle.com>)
 id 1mxV3e-0000hn-H1
 for qemu-devel@nongnu.org; Wed, 15 Dec 2021 09:15:02 -0500
Received: from mx0a-00069f02.pphosted.com ([205.220.165.32]:19014)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david.edmondson@oracle.com>)
 id 1mxV3b-0000IF-Gg
 for qemu-devel@nongnu.org; Wed, 15 Dec 2021 09:15:01 -0500
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 1BFEAqOx023143; 
 Wed, 15 Dec 2021 14:14:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : content-transfer-encoding : content-type :
 mime-version; s=corp-2021-07-09;
 bh=Bdi+NDSzwB2+1ybDDDzWvOpzMapRWw2bmOk/EqdA0aI=;
 b=DQrI8UaP65iW2scE/NXSLdNEv3/x722V1XWjrnOj1jZZqgbxrgr54tvgDy8DsViiJX0b
 0nKFZ4EU9vZfnf0L7JcZhB2Nm+OiVUc1c1SogVdupfvqWHZRLpiv4m/ix4iAjZtB3QbS
 dxnvz7DyVwozLQ77rWKt/X8ZTTgWVx7i+NKC7EpYB5sB97Lie43KSaPi2QoyigCpmTPj
 X0BMgG/NtwtbIpM4QkzoRIGUDba9WIUK+B+992sMVKMyzk+urMHQRuG1/zxRTmnyASqm
 45/Vozq2GPlNWk3bbRdV9rjEXlJrbSUwV9v2pUe/q0nZmO7XRClBo9wBQGznZakfn+wn Jg== 
Received: from aserp3030.oracle.com (aserp3030.oracle.com [141.146.126.71])
 by mx0b-00069f02.pphosted.com with ESMTP id 3cx3py6y0d-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 15 Dec 2021 14:14:55 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
 by aserp3030.oracle.com (8.16.1.2/8.16.1.2) with SMTP id 1BFEC7bX175963;
 Wed, 15 Dec 2021 14:14:54 GMT
Received: from nam11-co1-obe.outbound.protection.outlook.com
 (mail-co1nam11lp2168.outbound.protection.outlook.com [104.47.56.168])
 by aserp3030.oracle.com with ESMTP id 3cvj1ff8vy-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 15 Dec 2021 14:14:54 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HA29EBBrvAMxFpz8OIlegjeshgoIRvETljlSvniINq7T2xJEeYEQMDdyJ3cakL7qEafbgQhR0AZFLcOmg6DjxSZGRwhGw5q21QnmC2JDyz96xPjEXOqT+NnjwRIhrSG5rz/YDJPNWNmBGQfkxvn4mgaIAQI96ZQ686F3SSBpRARNoe5Cii6SWULww7ofbvlDF0mt3X4+jo5QcEiaMqzt2CTxmrfzIqY6cGDIivg4y9SvZFj545XX3bruEnuHZxfA45vglOVFw6pGFYw0u0u86Lxw4FvRm2cxKyBreoZpn23+tc1ysPF3jRrf/SYWyQ2ub4qD7j3CpyIm65BgvSqi7A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Bdi+NDSzwB2+1ybDDDzWvOpzMapRWw2bmOk/EqdA0aI=;
 b=MdCOxjc0Q0cW2jL0Jds6Mbn8avoO0SVPj+KX76scF6uuwJ9nAqi631irvzHFN1sY5GB+k9wf9/pu3R9DnaaozHg8kRj/Tu15//VgnfwG88/kh942DcDQ94oFfpJZ+BHFlvG6SL2aL4vHqPvj+Ix9FNYP72SWXXh+0U3C4YSLtqNqgY28bmQLpTCEb60YeueQjvOlLwcq5EO5gQohQgjWUlL7XaSRNkWwMHuXbzuGDe+7FrEKmuOBisVP/Y4OnKpXfFFRiZOGLRIQSd8DF6rInC9fj41sbQrXprPEbFt7XtPFOG0baFz/2uDL+IMixnvfuAUNRGDb1/Wj9r+nwXdfTA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Bdi+NDSzwB2+1ybDDDzWvOpzMapRWw2bmOk/EqdA0aI=;
 b=f0qjbRrhEf3Rum7DK7ttmqXSSsVNjH6kV8Vn/EEraw91bncVo6ahFyoFCTnH8p7wWovWX4lfz5W7NpN94/Aain+Euz5s/b6n7MmyXm8NK2+K1BO6Yx1GUkO8aWUf2jRZaZoNFkqfPncpVH55NTXOunc7ykEIsJ5jvoakB0W0gTc=
Received: from DM6PR10MB3148.namprd10.prod.outlook.com (2603:10b6:5:1a4::21)
 by DM6PR10MB2668.namprd10.prod.outlook.com (2603:10b6:5:b2::25) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4778.17; Wed, 15 Dec
 2021 14:14:44 +0000
Received: from DM6PR10MB3148.namprd10.prod.outlook.com
 ([fe80::c517:d737:a012:1a0e]) by DM6PR10MB3148.namprd10.prod.outlook.com
 ([fe80::c517:d737:a012:1a0e%6]) with mapi id 15.20.4801.014; Wed, 15 Dec 2021
 14:14:44 +0000
From: David Edmondson <david.edmondson@oracle.com>
To: qemu-devel@nongnu.org
Subject: [PATCH] migration: Report the error returned when save_live_iterate
 fails
Date: Wed, 15 Dec 2021 14:14:37 +0000
Message-Id: <20211215141437.1238403-1-david.edmondson@oracle.com>
X-Mailer: git-send-email 2.33.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: LO2P123CA0102.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:139::17) To DM6PR10MB3148.namprd10.prod.outlook.com
 (2603:10b6:5:1a4::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 111615be-1344-44a5-125d-08d9bfd53ddf
X-MS-TrafficTypeDiagnostic: DM6PR10MB2668:EE_
X-Microsoft-Antispam-PRVS: <DM6PR10MB2668BA7B7A3A632485DDBB4388769@DM6PR10MB2668.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:212;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: /08ZmfNuUHG1LH5SxN4BVi+ZOt2w9yB8bpXTxXlYpBtD61HqcemdD2Hj/DgNFjXIqvvTI7fFM1CjscATiie9qqQRRj0OaVmuEhZrluzz4Ox8jhZnm+xnOBXArbIQ/W7MkRWFaNdk+WCmG5b0QI13U6U/Sln4AcYul6GPFlZZnImwN9E8YmX1SOWENx4OVX3TtrraaFYMEmYL9Xg2gmfWYYfpsv94tgIBJ1Bnut0ALgLWgkU9YD9yXC3dFO33ElJRgBJRCdvayd+LlBDZpKCr+7EycphBwvtn3Tk2HX76W1P8hCX7DUejx7RM/5eWNwb0H+xi/KzrRLXl7cytyAefyprl++IRUyu4XJm0bhgExp8zZatt3xMn9D/YrRcT3osPjie/cqiC1ZWU5AhuW+4AKb/m8jwE47hnNL6dKDaBrwS0ObOmyd5WC24KlOPye9ZCLhhlyicq6GS7XvQjlYK50vKbJOl3EtOEw4eO0ZrFFZ7DD4sfsT6zlKfQ2Z0eemQwdX9c6NanaTrKp6cQj9fbltpWH4e7iL1pyR9WvQWU0FTDEcjCIZJ8jiWc91Ugd5nsSu44R3NIS7JQ2HHMtYdprUoP8rfO7dPi0cevAlPbc3qyZCO2Fcabj/RRR/mbChxbecuMYc1aiREfCSKAbdtW0w==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR10MB3148.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(6666004)(52116002)(508600001)(4744005)(5660300002)(6916009)(1076003)(107886003)(36756003)(83380400001)(86362001)(6506007)(4326008)(6512007)(2616005)(66946007)(8936002)(66556008)(66476007)(316002)(54906003)(38100700002)(44832011)(186003)(6486002)(8676002)(2906002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?YVq8+t1J2azYyr8TObAC48FdpCS/H2ZcF7edixKNO3YN9YdOKKM0kXQpLI0J?=
 =?us-ascii?Q?M/KFYuB3jviz9vzMSrY/uTYEAir/4PR1gyAAQpsyfaSY6m+2NlEvA+l6Uzhi?=
 =?us-ascii?Q?VkBzFzEECbljuqqvWJU0rhBkeHs2kmGRiAn1SLEzQCh9aMDjBgTL95cJ1Btc?=
 =?us-ascii?Q?jFLsrGPlPWOAy9Wzu76avGiL1jmhdQ1a0AOkltCrAKNPmWN/mpDyUgAcBc82?=
 =?us-ascii?Q?eq4cOG/2HFIXu+viHruB6pMC+3CCdiYupEGjOkFWsjsVFB6EGrm/Hz4DqFLh?=
 =?us-ascii?Q?eJehY8JN2VygVh4hkMwZHgTilcZSB+rxwz2PKpRzcnf8803A+S5ifmHU60C5?=
 =?us-ascii?Q?OZH6B2kW+X2IocbKwIpr7WeUTDxhb7eSc/qguu04DW8uJLGN/n296vEiBupg?=
 =?us-ascii?Q?6ZM5Q025hN70mzPHUZfEEqirTgAMQpTvO3IN7w9iGWS2QGKdEPd6tTOm3map?=
 =?us-ascii?Q?9lzcnXVthQOjWx1reJcKG4AdbdxgCheM6nzjgbuaUjy2+5DUCeqA1VDC0I0L?=
 =?us-ascii?Q?uUCmr57IR2ktVm1etCmw/SBOtgzylYZdYjLHhvXU4DFxS5Qt7y70C4BgUB4R?=
 =?us-ascii?Q?GmNy0TLPn4hgQ95QAVIDi6JOeTfU/tAolBltTi8yxVjgQwNYFpEi/wX5C6s1?=
 =?us-ascii?Q?jKf+rplAwctHs2lG76jSDmXFpHN+oFWpUo0l4t7fYEnWnKs3wIO2ip9CZdIm?=
 =?us-ascii?Q?QeZqks3jk2aggXhxnJgdkaG48ELfpeTA43CssTJBXl7uBhKsH1Dg71ypDVbj?=
 =?us-ascii?Q?BACNR4M5bx9swd3vGC0Matf8W6x0Lit3RskqNnuS9NqYFbG0vYMvlGBotstJ?=
 =?us-ascii?Q?V6HAB8otJry3U8aZ8NYoAwO+hLp6pHk1Ay2bRQMHDF6DwNqIW8IA+e2i/xHt?=
 =?us-ascii?Q?DR6IfGk5liVs3nWK/zFFbuFSUqssJjRYxh10fR5yxVRVPllwi4cK3FRubmRR?=
 =?us-ascii?Q?dALoK8aHB+VcoMpfqKHih5agp5hxjehyh1r7GdTTs6tEChPBOWF8yFzywNNd?=
 =?us-ascii?Q?sIYpm1FHxmw4a26AsT1RTJMTl3Xw/m2r1uVzYGcck2wVVNV6TMwByyM9a5aI?=
 =?us-ascii?Q?agsvddNCNyF6JrLadAUxFAfUHw6aNfDM27r7HzQssU4tdBLQibHWYGs80JXk?=
 =?us-ascii?Q?lmfgrGnTSMj1Zej71IJK0Ogsr3Va7NwKebSx+zWVRN1hUw+sESOsTejWXF0+?=
 =?us-ascii?Q?2lsqxWXuLFjSolSDyn3AW7uUHQIbv1g2g0sBkrU48QUXbFZJjLR1WQr7wHyN?=
 =?us-ascii?Q?tdlgzUx9cYfC5NKBIbtb1T4939ubASzs+pwVYwGoB8/WariKWlbWXZSEANH5?=
 =?us-ascii?Q?l3ultpoPPZisfWa+++aXoWb75Sux0sul/vIlPe4UvY0LYnt0jJqw2imjM/0I?=
 =?us-ascii?Q?npnXpQOTqjBdl/K+DOt1EIiV120YKNJyqDg7uumGi7cZJDiO9t9jbRHk4Aqa?=
 =?us-ascii?Q?gfsZDpDlRAm4GiqP9KFKn4qpkfHlKDwf8pCdxA0IPlQE5yG4P2ihDeweY2ua?=
 =?us-ascii?Q?6eWTAIGtS211QG5nawTEianobDCHGb2wMvC5iNvJSkYG/pd5Mz/aSRfZlbRM?=
 =?us-ascii?Q?ZzixCthkA0TyJhiEAzvkNMRlpJhdCI7Uv/4e1REX+zTagZQsw/GDm+wXPDGn?=
 =?us-ascii?Q?bikLpC77HpYoUwiGNjVWK7OjB8+7u7l7pmK9QmtgCD14lVgt9qAM12LMRLDh?=
 =?us-ascii?Q?EgRm5zRDAC3rgBhu0NPdU38QxxajdMPpexjFcVdyP8wLQgNP?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 111615be-1344-44a5-125d-08d9bfd53ddf
X-MS-Exchange-CrossTenant-AuthSource: DM6PR10MB3148.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Dec 2021 14:14:44.2211 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pWL0ErqUat4GxAXbNcJBiMHom//6e0t/fWDt7I8Umg/W3+HKdKvIiRc27dW6ah8BZuf6BWsdbu6Bj6wPblAEcka6ebdEwe1WfhWiy/k8Hxk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR10MB2668
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10198
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0
 mlxlogscore=999
 suspectscore=0 bulkscore=0 mlxscore=0 spamscore=0 adultscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2110150000 definitions=main-2112150081
X-Proofpoint-ORIG-GUID: -ZmSXQ0c_4kwHp5-1fW2LkHWjBcezVFF
X-Proofpoint-GUID: -ZmSXQ0c_4kwHp5-1fW2LkHWjBcezVFF
Received-SPF: pass client-ip=205.220.165.32;
 envelope-from=david.edmondson@oracle.com; helo=mx0a-00069f02.pphosted.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: David Edmondson <david.edmondson@oracle.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Juan Quintela <quintela@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Should qemu_savevm_state_iterate() encounter a failure when calling a
particular save_live_iterate function, report the error code returned
by the function.

Signed-off-by: David Edmondson <david.edmondson@oracle.com>
---
 migration/savevm.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/migration/savevm.c b/migration/savevm.c
index d59e976d50..26aac04d91 100644
--- a/migration/savevm.c
+++ b/migration/savevm.c
@@ -1298,8 +1298,9 @@ int qemu_savevm_state_iterate(QEMUFile *f, bool postcopy)
         save_section_footer(f, se);
 
         if (ret < 0) {
-            error_report("failed to save SaveStateEntry with id(name): %d(%s)",
-                         se->section_id, se->idstr);
+            error_report("failed to save SaveStateEntry with id(name): "
+                         "%d(%s): %d",
+                         se->section_id, se->idstr, ret);
             qemu_file_set_error(f, ret);
         }
         if (ret <= 0) {
-- 
2.33.0


