Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E7DE3CCE0E
	for <lists+qemu-devel@lfdr.de>; Mon, 19 Jul 2021 08:42:35 +0200 (CEST)
Received: from localhost ([::1]:37728 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m5Mz4-0006Db-Fy
	for lists+qemu-devel@lfdr.de; Mon, 19 Jul 2021 02:42:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33614)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <elena.ufimtseva@oracle.com>)
 id 1m5MlV-0004Xj-1Z
 for qemu-devel@nongnu.org; Mon, 19 Jul 2021 02:28:33 -0400
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32]:35630)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <elena.ufimtseva@oracle.com>)
 id 1m5MlQ-0002MZ-QU
 for qemu-devel@nongnu.org; Mon, 19 Jul 2021 02:28:32 -0400
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 16J6HiHU031108; Mon, 19 Jul 2021 06:28:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references :
 content-transfer-encoding : content-type : mime-version;
 s=corp-2021-07-09; bh=irPRvaBDaEQrHwfm0kPhFL3GIsCF0Jf2WOsculUoluU=;
 b=kJbqn8R6g6P07drwjlREeedWPiFN6lMmp58Sq+Vw2xMhjqOgjDn3sZ5p4+ets0efuMhj
 G4lgpi24OmiEZYruIJM49TBVmXOU6IW8wd5fvXa7v+JhRC2hgRWbAVn30JoDvTmA0W4C
 FvHfguyt0tRQY92RPU6pARmSHwE9WIV0AVgWXRKK/Voxek1eNDmyj/gX0UXZvEb1rhj5
 vMPbEZCp6JFIEApTAF0CbOfdma+mrmoGe69RrpEDpTIsNiv5ReR8wQccP/EJ/K6J8IpY
 TEPOMJ9k9Qpyt13B0DLnfcG3+fB9HZSX4Lm4SV/j+elbUNzpuNvN5uQozNu1UWHmFTn3 VA== 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references :
 content-transfer-encoding : content-type : mime-version;
 s=corp-2020-01-29; bh=irPRvaBDaEQrHwfm0kPhFL3GIsCF0Jf2WOsculUoluU=;
 b=vdHR1hp7cGP86/8jj2iuHJLDAcgCU/qUQnRp34+BjvO3kpihTg1mzCQqyJ28+q5yd+Ep
 en92ZG/5u34FjH//g5uCSnS+6o6IjFMuoOC6DcKAPBD2vSLJ41qeABTdGK7MdgPQz621
 4oq0W198+Z1l12PQxDfn8KDEnd7kbGG5S+Zs2nKcHLAMrZek+2Y/hi9quPni/RRix+Un
 Y0CVsecMwiPYEUV/kfGkgoxJHsmEmPucBLpR15YZZVCX7AD3yHu50BVoRkXvGL/nYykc
 OnQ8QNs4Dj5YJvp4z8s45HuIRXpsJ5WbbJzJv3n81jFp3EYRUP//qCGmqYpOvIC+bAT3 SA== 
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
 by mx0b-00069f02.pphosted.com with ESMTP id 39up0327pd-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 19 Jul 2021 06:28:17 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
 by userp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 16J6GAHS086933;
 Mon, 19 Jul 2021 06:28:16 GMT
Received: from nam02-sn1-obe.outbound.protection.outlook.com
 (mail-sn1anam02lp2048.outbound.protection.outlook.com [104.47.57.48])
 by userp3020.oracle.com with ESMTP id 39v8ys1vy3-2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 19 Jul 2021 06:28:15 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Y4keiYiFcH9CBVV3g3MadV3IR/DFl0CYVZMPVp7/dAuxgxkf6/WAfIWguex6wKfqqPveyMTjIoa0dEJROvEUqKNYLELpiQ72q90NjCeQeUMde0aIgaSE5HiW0rdDdZj3pE6eFDfZY71WA+SHALHctJ/hf/iRww8Di0VOITu9FGh+Q24nBD9tDI0G1x97nUP91KvvYE8kuI1T/wQoYb6kmMPU83o1XYeM+6pMMk9F0FpUWpQlOQq9QHBze+wqyABNS+p/DbrddVzXCOEMqp2wqNepfW/SAxxaCCePB9LwlVEG5cZ8U+vU0hkb3wLYYF8nRZPUVAAR7//ad/1Y+vCubw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=irPRvaBDaEQrHwfm0kPhFL3GIsCF0Jf2WOsculUoluU=;
 b=gmdQ64XjukuGSOqzvbR/j24Lj0wSsltM7dB2fHzj/V1BS+2mK+WRXV5QzDwx2pNdy8E3NI4RFCRrta7LRal4DIQ4BRHKKc2gF38Hi3US71sNY8HNFEoneLoS7kXrt8b/Jp0ww2IarXVkpES22N/qh4j+IXhxiXbCKMVXkTrp5kVHrMg/ND7//h3RdyF59CL+Lxr7E4rEB5RdnIUHzzazmIHWQdC9S950JGJnQ27ZAiyJAvwUqRvePNP4qgyAYX5AQ7FQCXNKIpR/SpQUJ7z6UUwHOI7QN8qqb6ng/UAe17hppY1h+Dk7rLDNsjHFJdtAjsDQzcmoPOv3jRwaIjBbhA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=irPRvaBDaEQrHwfm0kPhFL3GIsCF0Jf2WOsculUoluU=;
 b=NFYnXtiC5ejR8qvTmWw2lh6RfISo6Cloz5uJRaKhqMT1DeiumMUb9hVl5bwN0+K+dlJhQHoTURG7pPt40ybK541qAd9zzNFcmbGLbZr4eodwDvdUouLVYwpAq9jQFZ+wtRxF4HU2l6O4/cta94DxhfaCdvhH7k6ZfWNPS5OODh0=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=oracle.com;
Received: from BYAPR10MB2869.namprd10.prod.outlook.com (2603:10b6:a03:85::17)
 by BY5PR10MB4033.namprd10.prod.outlook.com (2603:10b6:a03:1fe::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4331.23; Mon, 19 Jul
 2021 06:28:14 +0000
Received: from BYAPR10MB2869.namprd10.prod.outlook.com
 ([fe80::5891:a7dc:5c2b:5539]) by BYAPR10MB2869.namprd10.prod.outlook.com
 ([fe80::5891:a7dc:5c2b:5539%7]) with mapi id 15.20.4331.032; Mon, 19 Jul 2021
 06:28:14 +0000
From: Elena Ufimtseva <elena.ufimtseva@oracle.com>
To: qemu-devel@nongnu.org
Subject: [PATCH RFC 19/19] vfio-user: add migration cli options and version
 negotiation
Date: Sun, 18 Jul 2021 23:27:58 -0700
Message-Id: <95efca08f3160ce4ac2fb49fe9c9bc1183ca187d.1626675354.git.elena.ufimtseva@oracle.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1626675354.git.elena.ufimtseva@oracle.com>
References: <cover.1626675354.git.elena.ufimtseva@oracle.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BY5PR16CA0022.namprd16.prod.outlook.com
 (2603:10b6:a03:1a0::35) To BYAPR10MB2869.namprd10.prod.outlook.com
 (2603:10b6:a03:85::17)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from nuker.hsd1.ca.comcast.net
 (2601:642:4000:a09:3c73:d99e:ec8c:2487) by
 BY5PR16CA0022.namprd16.prod.outlook.com (2603:10b6:a03:1a0::35) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4331.21 via Frontend
 Transport; Mon, 19 Jul 2021 06:28:13 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ffd1afcb-ade0-4e93-f3f7-08d94a7e6311
X-MS-TrafficTypeDiagnostic: BY5PR10MB4033:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BY5PR10MB4033F36E5C16179192638B6A8CE19@BY5PR10MB4033.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: qexwhun7hirq+MBFuLn0bx2uuzwPXey3gILXmrNY3fzmhyh8sG9nSYtyQg7TOa/pcceNM7L5UoyofmFXfE5l6oBnUwK0b/tbAN1E9C+eQ1/7DUiVW1gmmhzOo0Af6KFL/gy4ftfH+zGuGIN1Uy3DgZw4F1ar7CU+UwVLetuYuK8GhqbdYHGw2/3IkLdz5x/Rt3iZBE8mqC3M/4vlPO+xlr/2Bdq392mGrkNC/aGKg7lDrOjNbEnRHf4CEPO6CKWgkzHqfr2TdUuUGAj9vCA80/RTqP9LMPCoykQu2tvaMJfFts8k35iG4K2bEAxjmNMtFYQzKi26FlaT16hf99q7rx0/sqA8sQlqFXLJmkidAODwAMBfu4Aeu6lZv9HuQJU9xfDer5mF4gs7q8jOS7KEd21QT8/3+gD54OlyFPFTKsJbUT4U+OOcgJzsnebYwwZPpkjuXiCt4cvNyj66ehwwM6W7OqADo6Fn1JPEsYRH5vt4lJLU0esRgoPfEBa6MKBP/+kDXe8FsVdzwlGObxJC3GNzKgUzAGBGVZt+TRE0xy1P3dn8XkcEImSVo2m/QSP50gGBISq7yw6M44P2Tw2Px3LbhG2eHA56NW4RiYIe27Fe/O8p/oDPeDJQSCYHxHBcMTDfrdtJ2Jj7nGTPCcCKSA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR10MB2869.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(136003)(396003)(39860400002)(376002)(346002)(366004)(38100700002)(6506007)(186003)(52116002)(6512007)(2906002)(6666004)(8936002)(478600001)(2616005)(44832011)(36756003)(5660300002)(86362001)(107886003)(6486002)(6916009)(8676002)(4326008)(66946007)(66556008)(66476007)(316002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?4C3bZzKeLRCWpDPOsJHA8ULVlpN3kEIA+wvGlnuY8iF4k5j4VyVnEnxpjNUI?=
 =?us-ascii?Q?/ZNFdo/aPUp6dfBpZjfcq/q44ZV2bGhrP0jQSk/GKX3NPS2dppoOk2NJtIIb?=
 =?us-ascii?Q?r4Zd298f51EOSu0lfDV3GudZri9SIh6BkvwNshvJREXuUB0Ag0pwUjOOaLXs?=
 =?us-ascii?Q?RU7JOONUszYYgp51XVJwuM+IyJF7BZ/jJDwaC1p6zKB++GZWWc4bv038pg3k?=
 =?us-ascii?Q?Q+E2fFtASuh+lRidj59glETMTaWAFgnqQ+MqGzYl+U1PrARbAoFYIVtT8/SW?=
 =?us-ascii?Q?uOTVdyjfuqVIhdUYTUqVbWHaqvuTDJ940ymC2g64p96sl3GrIDr5twJaAiEW?=
 =?us-ascii?Q?U+w/p/8mVAgqkZiic4C5TUXsLWd8Gn+5QKc67hd7MK4GrK181QjhzfOs3TZg?=
 =?us-ascii?Q?58+frYdSoODfh+EDC7oZ2aBgcvwDoppKItLAByem7x1VlgM7EaTPJ27jea/7?=
 =?us-ascii?Q?1wO/Dgd9KepQCGW5ywn1HOfuw9Es1yJdEV1qSQ9m4XWGiKU6IRGaOtUivup9?=
 =?us-ascii?Q?7wrDSueLM0mWff+vuMnZobfMXlVNwP09Zoel+ZwglIZZCXe5RkSWn5Ds3qj7?=
 =?us-ascii?Q?hnDJVWv8mPiUZLsQ1hK8OR4aW9sELv2+ilM5BtPChVg3RFGoo+t1tArZ/Oe8?=
 =?us-ascii?Q?/CFTsuWbUCTGSOMxKEVJInnC5gNSnL3CCRXzQW1VUBlQFO5gwJMD8yDdWDkj?=
 =?us-ascii?Q?hLvYNPOvEzOBoy7a27GaOkeH5M/O4221Sa1pIjiIzpAkP5+FyH9bUc3IU0yi?=
 =?us-ascii?Q?fvk8m1bvs9AjmnCI4s5trZ45x27Umc6g3cJVKfG39gd11Og+exGMlE5rpN6g?=
 =?us-ascii?Q?6+i/LoLsns7Rotc9rTClzUVPjiFPapalH0dw4+1H9da50o6RjAelpr3Qt43j?=
 =?us-ascii?Q?wKihvzrRWWLLGWAD4waH0U2xnwHnvHNr19Ux4u0hForLXmd32SvmbdIByIQM?=
 =?us-ascii?Q?bF0WsdImVG4gcRASRsBOG5U7mmgimB6P/wCMlFiTr/TWqzigDAPKvOPVfpX1?=
 =?us-ascii?Q?dBUKLSp3QYqyEeS2VOwXrMLbI0oTm9v2nR/C5H1SkmcSM/K6Tl9rrIHmNziu?=
 =?us-ascii?Q?8+gQMprXlKH9Uh6n0gGWT7196/PXerbyxXtqXY89vep4Xmord5n2shTNkggx?=
 =?us-ascii?Q?de0tAiqi7PoYw72xjMogPgSdYSkbW0Ji8EjMrZl9Sb23ZBzbUPdRmLgdAQoP?=
 =?us-ascii?Q?PLoW/FoEtPRfNsf/yP2sUAJNBmBubIoV6nLgko2wxzPQ1MZG4GWkRRhqxQdV?=
 =?us-ascii?Q?l8NsD6RhUKha/bMwDWV/1zq0hmKwHKa0vR3Q58S+V177lJ3IJ6VumY27dzrO?=
 =?us-ascii?Q?pK8Ow2yVL1/6+qag3ii1kU6M3IwJum/X9Hig6gtvr3NimhvntByu95S8IYRL?=
 =?us-ascii?Q?wZ6S7ZN6UBhI7HZYlkFXqIZLkiSk?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ffd1afcb-ade0-4e93-f3f7-08d94a7e6311
X-MS-Exchange-CrossTenant-AuthSource: BYAPR10MB2869.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jul 2021 06:28:13.9230 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0WdqTsB0FOqmMRuVzgEDmEeHOMvlX6fhBbaD+rnRRO910kchtZWWca+U0XyhrZ184DHHgTJgqqeOXZN2IqeYjcxDOM+z8JlZAa48tsqlMuA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR10MB4033
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=10049
 signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0
 mlxscore=0 malwarescore=0
 adultscore=0 phishscore=0 suspectscore=0 mlxlogscore=999 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2104190000
 definitions=main-2107190035
X-Proofpoint-GUID: DbWyipfUtA7ErF9umCOB0JIlLL6sbAmF
X-Proofpoint-ORIG-GUID: DbWyipfUtA7ErF9umCOB0JIlLL6sbAmF
Received-SPF: pass client-ip=205.220.177.32;
 envelope-from=elena.ufimtseva@oracle.com; helo=mx0b-00069f02.pphosted.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_BL=0.01,
 RCVD_IN_MSPIKE_L3=0.9, SPF_HELO_NONE=0.001,
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
 stefanha@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: John G Johnson <john.g.johnson@oracle.com>

Signed-off-by: John G Johnson <john.g.johnson@oracle.com>
Signed-off-by: Jagannathan Raman <jag.raman@oracle.com>
Signed-off-by: Elena Ufimtseva <elena.ufimtseva@oracle.com>
---
 hw/vfio/user.h |  4 ++++
 hw/vfio/pci.c  |  5 +++++
 hw/vfio/user.c | 33 +++++++++++++++++++++++++++++++++
 3 files changed, 42 insertions(+)

diff --git a/hw/vfio/user.h b/hw/vfio/user.h
index eeb328c0a9..5542aa1932 100644
--- a/hw/vfio/user.h
+++ b/hw/vfio/user.h
@@ -70,6 +70,10 @@ struct vfio_user_version {
 /* "capabilities" members */
 #define VFIO_USER_CAP_MAX_FDS   "max_msg_fds"
 #define VFIO_USER_CAP_MAX_XFER  "max_data_xfer_size"
+#define VFIO_USER_CAP_MIGR      "migration"
+
+/* "migration" member */
+#define VFIO_USER_CAP_PGSIZE    "pgsize"
 
 #define VFIO_USER_DEF_MAX_FDS   8
 #define VFIO_USER_MAX_MAX_FDS   16
diff --git a/hw/vfio/pci.c b/hw/vfio/pci.c
index 36f8524e7c..2f97160147 100644
--- a/hw/vfio/pci.c
+++ b/hw/vfio/pci.c
@@ -3688,6 +3688,11 @@ static void vfio_user_pci_reset(DeviceState *dev)
 static Property vfio_user_pci_dev_properties[] = {
     DEFINE_PROP_STRING("socket", VFIOUserPCIDevice, sock_name),
     DEFINE_PROP_BOOL("secure-dma", VFIOUserPCIDevice, secure, false),
+    DEFINE_PROP_BOOL("x-enable-migration", VFIOPCIDevice,
+                     vbasedev.enable_migration, false),
+    DEFINE_PROP_ON_OFF_AUTO("x-pre-copy-dirty-page-tracking", VFIOPCIDevice,
+                            vbasedev.pre_copy_dirty_page_tracking,
+                            ON_OFF_AUTO_ON),
     DEFINE_PROP_END_OF_LIST(),
 };
 
diff --git a/hw/vfio/user.c b/hw/vfio/user.c
index eceaeeccea..23ace82bbb 100644
--- a/hw/vfio/user.c
+++ b/hw/vfio/user.c
@@ -393,6 +393,23 @@ static int caps_parse(QDict *qdict, struct cap_entry caps[], Error **errp)
     return 0;
 }
 
+static int check_pgsize(QObject *qobj, Error **errp)
+{
+    QNum *qn = qobject_to(QNum, qobj);
+    uint64_t pgsize;
+
+    if (qn == NULL || !qnum_get_try_uint(qn, &pgsize)) {
+        error_setg(errp, "malformed %s", VFIO_USER_CAP_PGSIZE);
+        return -1;
+    }
+    return pgsize == 4096 ? 0 : -1;
+}
+
+static struct cap_entry caps_migr[] = {
+    { VFIO_USER_CAP_PGSIZE, check_pgsize },
+    { NULL }
+};
+
 static int check_max_fds(QObject *qobj, Error **errp)
 {
     QNum *qn = qobject_to(QNum, qobj);
@@ -417,9 +434,21 @@ static int check_max_xfer(QObject *qobj, Error **errp)
     return 0;
 }
 
+static int check_migr(QObject *qobj, Error **errp)
+{
+    QDict *qdict = qobject_to(QDict, qobj);
+
+    if (qdict == NULL || caps_parse(qdict, caps_migr, errp)) {
+        error_setg(errp, "malformed %s", VFIO_USER_CAP_MAX_FDS);
+        return -1;
+    }
+    return 0;
+}
+
 static struct cap_entry caps_cap[] = {
     { VFIO_USER_CAP_MAX_FDS, check_max_fds },
     { VFIO_USER_CAP_MAX_XFER, check_max_xfer },
+    { VFIO_USER_CAP_MIGR, check_migr },
     { NULL }
 };
 
@@ -466,8 +495,12 @@ static GString *caps_json(void)
 {
     QDict *dict = qdict_new();
     QDict *capdict = qdict_new();
+    QDict *migdict = qdict_new();
     GString *str;
 
+    qdict_put_int(migdict, VFIO_USER_CAP_PGSIZE, 4096);
+    qdict_put_obj(capdict, VFIO_USER_CAP_MIGR, QOBJECT(migdict));
+
     qdict_put_int(capdict, VFIO_USER_CAP_MAX_FDS, VFIO_USER_MAX_MAX_FDS);
     qdict_put_int(capdict, VFIO_USER_CAP_MAX_XFER, VFIO_USER_DEF_MAX_XFER);
 
-- 
2.25.1


