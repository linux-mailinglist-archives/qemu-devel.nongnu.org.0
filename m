Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E6A1F6EB3E6
	for <lists+qemu-devel@lfdr.de>; Fri, 21 Apr 2023 23:50:34 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ppydP-0001n5-Nz; Fri, 21 Apr 2023 17:49:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.devolder@oracle.com>)
 id 1ppydN-0001mk-Rl; Fri, 21 Apr 2023 17:49:37 -0400
Received: from mx0a-00069f02.pphosted.com ([205.220.165.32])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.devolder@oracle.com>)
 id 1ppydK-00052v-5X; Fri, 21 Apr 2023 17:49:37 -0400
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 33LKTiPJ014605; Fri, 21 Apr 2023 21:49:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references :
 content-transfer-encoding : content-type : mime-version;
 s=corp-2023-03-30; bh=grxb/zSdsLv3eHAgm5UVpGwrSH0UMzumtDjC1tTQjAk=;
 b=hA5sh2Y3v0uOA2ebJ1IgWQgO9v80HWGMynEl9UkJmS2FK8sZdBrkAYqpeysVgugUlJFF
 4Ttz+MpExmITtl4jXW1ztGYoVhOk1qzl8+C9UdFg4dmFW0KMmn73k6yyiRF8p2G18RvR
 K0qmIaYiKijPs+EL+dQyz3kiliI717P3ZXDBkqSjH1hhLQdmJmXO6QIXq6ghBxTazwHl
 YqpuogS378Nn3tRLE8JlSzbZypxdk13P9Uv9YLL043xoGnqe08O5iwutdNUo/CFqc+OJ
 68ByFwc/forxwAu0JlWm3LXztygKQ86z/bQUAbOnp92PdwnMPa5oTXgjNGur/JV2F/vl HQ== 
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com
 (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3pymfup77g-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 21 Apr 2023 21:49:28 +0000
Received: from pps.filterd
 (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
 by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.17.1.19/8.17.1.19)
 with ESMTP id 33LKxphC015688; Fri, 21 Apr 2023 21:49:24 GMT
Received: from nam11-co1-obe.outbound.protection.outlook.com
 (mail-co1nam11lp2168.outbound.protection.outlook.com [104.47.56.168])
 by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id
 3pyjcg77nn-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 21 Apr 2023 21:49:24 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=N7iDdePFOWmvwtVcjhn/5jgCunCgcwccemTaR88q54ox19Nl+7ej+/nRUJVcKkTWHDGIWBjFa8vsz2VLIErBONyBEWPBpFh5nd+IFeiZBmvd2GMB7E2t/4QoRK37wq+G0im7mCDrdr5ff8qXiVTGmDaXODiiqShKrkpI+25IqAgEA9iTudT8l6xw1prus5c8rJMdHrpjnFJ+zzAQV+7kwIy93CEoozxTMz28UwLsg03fZjlj+ryrl+HxzKkFTqXrMcNOgXelurBcBOU/QLLpAoOVFtzR02uQU8Hlh+yndzKww4yG79UBAMx24v8xok6cbv3yRtaw1hqYFJpjh9qryA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=grxb/zSdsLv3eHAgm5UVpGwrSH0UMzumtDjC1tTQjAk=;
 b=eQNkE7/K/DnPu2yOeQbYCDzS5XqGIkERRxCMkdfOydmLqtOwbpcwYXkuxsELsAr3RS7ZO1EvkEfvagGMTXDw1ABFSMMoSjssGuprFHjjQ077g5/lNmL78Swi4/EYqKWbHW02DXkeoETrtTKYbIXgHrITR0IckqcSYC8zflGyZioZj4ZFUzlcRdDQ8VGFNw8JQuvtQ0X4vYnGCxGQSGFBC2zbw4i/R3H3+D854tY+feRq6d2LkbB57dx1w5SmYw7JiOaAU9J8VhMjNOtI+MjSNZyQlzKKYCpjyK+5zPluxdzDCk59NPGvPdnnrMgjlrVtJOLqNn5pi7GaorF23i/w4Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=grxb/zSdsLv3eHAgm5UVpGwrSH0UMzumtDjC1tTQjAk=;
 b=zp0UAnTwatG7a40VcpfwlsPOkXGKFi4MZ7UCqk9N27AFSxGArWszzOHxS5pMK/XUVGvkwTXBBeWf97TXc361sLF/GlN/9fc/7uuF1ywWUfa3uInfztUwG+zvJZOMJ8nrCcF3tyXFXyX8eGP3JqD4RDAWMzdshvzUW5Ah1umsWQg=
Received: from CO1PR10MB4531.namprd10.prod.outlook.com (2603:10b6:303:6c::22)
 by CH3PR10MB6857.namprd10.prod.outlook.com (2603:10b6:610:14a::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6319.22; Fri, 21 Apr
 2023 21:49:21 +0000
Received: from CO1PR10MB4531.namprd10.prod.outlook.com
 ([fe80::ac1a:bf88:bdbf:2573]) by CO1PR10MB4531.namprd10.prod.outlook.com
 ([fe80::ac1a:bf88:bdbf:2573%5]) with mapi id 15.20.6319.020; Fri, 21 Apr 2023
 21:49:21 +0000
From: Eric DeVolder <eric.devolder@oracle.com>
To: shannon.zhaosl@gmail.com, mst@redhat.com, imammedo@redhat.com,
 ani@anisinha.ca, peter.maydell@linaro.org, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org, marcel.apfelbaum@gmail.com, pbonzini@redhat.com,
 richard.henderson@linaro.org, eduardo@habkost.net
Cc: boris.ostrovsky@oracle.com, miguel.luis@oracle.com,
 eric.devolder@oracle.com
Subject: [PATCH v3 3/3] ACPI: bios-tables-test.c step 5 (updated expected
 table binaries)
Date: Fri, 21 Apr 2023 17:49:01 -0400
Message-Id: <20230421214901.2053-4-eric.devolder@oracle.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20230421214901.2053-1-eric.devolder@oracle.com>
References: <20230421214901.2053-1-eric.devolder@oracle.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: LO4P123CA0135.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:193::14) To CO1PR10MB4531.namprd10.prod.outlook.com
 (2603:10b6:303:6c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PR10MB4531:EE_|CH3PR10MB6857:EE_
X-MS-Office365-Filtering-Correlation-Id: 76f20023-618d-40d5-c745-08db42b24390
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: AqxgM2DisbxmprtjQGN7iOzVUtmI9M7LCFcjBNeeooNzeO+cdi2jnCnD+gK2hJrz40CENrq5qIBPk3Op1FaSs31/OH1GDHgLHZDHfbHhPffjD4RROutBaACpluZkVuCsz5t0WQL4a1l0OCRZXV1gV30X426YtK3hmn1kn+yojVelqQyzaEq9Kzpc+kbE6RDHSeSWRWwpY/wjjDzZ7pqOpdFIwc4uha2vQZCFl2vZRlZoRpsXDT7rv5a63BbQbzEUbR+//D42izG9yW0N0qRePKFRUscNKizgSSnzG0SYk78criQHkmE8vb9/xnU2SkaX9eYkZAH9+yb/83YgHkJ9+2n3P4ykZlKS4ODoPxMY0AfPdesYZPUACxU7y3Q/XSFD0iZGnbJN5RIn3dkw4k2XYZu+XEXWAjmP86uyenynq7Vx81zY4hBMWsI33Vq40TY2xpq5Oz1FCoZ8bfCS+WzZSeLty4dSJQoUIRfmJWCJJZm9YsKhQNjp4ywqgv18Z0N0mbHRkoKPp+Eu3AEzUFt0XNz7AmaQY1gUNq3ZcXzhSNFTNXfHESPgK3Q+w8/Z7rP7ZJpYuyXDTYUwcIoN2OskpM+lfw3XH9XjovzdpOp/0k4=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO1PR10MB4531.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(366004)(136003)(39860400002)(346002)(376002)(396003)(451199021)(36756003)(86362001)(478600001)(41300700001)(921005)(8676002)(38100700002)(5660300002)(8936002)(2906002)(30864003)(7416002)(4326008)(316002)(66476007)(66556008)(1076003)(6506007)(6512007)(83380400001)(66946007)(26005)(186003)(107886003)(6666004)(6486002)(2616005);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?klbQl+v7bZQLrdKDCt5atxeVvGuJJ8vVo/GECvi+KvyO18dqbJM+N7s8dIl5?=
 =?us-ascii?Q?NLlLoDPDS/S+qX4UyUY3gtrWIbakFfS76J89XbNbG2XrneegDzuySKUHENIN?=
 =?us-ascii?Q?80oG8hkJdzr1w1Viom2Ul6LuRFVbPEVIHDzJKGWMynD1L01Oljb2TQPUH/3I?=
 =?us-ascii?Q?faYB1yNXEJJNNKGta5ar90sByAYfERS8NKfkVNTdH697Kkn5j9PM5sL3Swy6?=
 =?us-ascii?Q?FDiDwTUQssjSmZn/3zsC7H5WwSmgbGhH5pIpvkOzirMO1Keg3JDA9CJob61i?=
 =?us-ascii?Q?b7nOYQd/959p/rSj47uvEZotEXA+Z2z9KtKBC9u3SOISnfor9GnEjYDzD9YA?=
 =?us-ascii?Q?+w7KOkiS4NxXXbhz6IFpEjC7X6SzvHa62Cp2N337Y9XYYfKM/+niiQ8gOkfb?=
 =?us-ascii?Q?a57bGZVbSD4FLfFJiI6sqKyy0gihLmpMJHGa39xThce6YqvTGISJZEXqhCzF?=
 =?us-ascii?Q?tN+YFvoVR2/LhZM7+8t1NROvlNll5Safm/j9v05wowWVI5Bw35eqCBBMoQYp?=
 =?us-ascii?Q?HWzhGS6c2UAcDM4skJTyt9sE9sdfPx193CQKS8qlNC7ZotJy6Cu/dl3Q4Pvw?=
 =?us-ascii?Q?XETZ3DiqwdtgzcL/7ftW2QqwK6Zh1OLMTJoFpoC4DNyvUuZcp8O0FeMAf7o4?=
 =?us-ascii?Q?U8zkD3KM4phHrB6GzHQq/rIfj11MAQLfsvLz6g5dkIfN83CXIBA4yeFLhEGf?=
 =?us-ascii?Q?JxrRU8Y9XaDgIJCOYPow/P8bWBPxKtNUajAoZyRo1HtuKQdmoQttDdLzw+4l?=
 =?us-ascii?Q?+eO+BTO1/JUtaX3+jsxn+gbFwTI3UopnRDP5OfCyRpqzn595AyxQ/JMCBR0t?=
 =?us-ascii?Q?tEWz0lzS9wvOyAAMhuX9SLDGfXlRYp6E2mWHpZuSZ058PVSpfwCIvbADPDmZ?=
 =?us-ascii?Q?fAsjZp1w70BaelQqJKdToIZNlQHgP+7YKMfgGhvqSoh0+JqYeZnnZSRTsgwJ?=
 =?us-ascii?Q?8l4Jql7mCEZsIdGc/8DCDcaupEeAPZVl3VFquVhuxmyR5uve3eOZayF5UOSU?=
 =?us-ascii?Q?zgSlaTV/CmNIU9kZg1a5yWLcZCIbFJ2szvFmphKe5AU9iO8ZjJKn/LVgs/sA?=
 =?us-ascii?Q?+GLEFrJMYJBgfbrU+Y6MBFboyby2TQUzk1RCsQn/zoQbVG4eRbDeyf73Cyz4?=
 =?us-ascii?Q?evD76MwR6/zEaDBDciI2mh1IqunHOMhmAPMN4gp1XWp7y8STFD2vncnQTcw7?=
 =?us-ascii?Q?HzxVFw+08969O39Ezu+CrDlu7pudWgWTRldlRss1C4OKOmwzblw2/BVtPoTo?=
 =?us-ascii?Q?ZIYGEotnDIBVBq0Rmkiw83pRzqUDgvONC8KJRvjYuMpraQlk3iFdcGmUEquy?=
 =?us-ascii?Q?KiiPNoR+ulue/IGBYtdR7oHbVpbohkzYTNNgSwvx7cqxmrwh46RcSatAZXjK?=
 =?us-ascii?Q?/05VdObKOZ4/iP5yyiLAxy0lnLXgTbdfQAZ+MnBRBmop84zau54ZtlB/wkSj?=
 =?us-ascii?Q?SoHogmeWjn7P3dlH7EuOzs+1eWFIep6XOlIycIOBmhLxH2ri59o09f8sY8TK?=
 =?us-ascii?Q?APECDjihawMWF1foyKkGrqqVtKIJuu2MZIp7ywt1t49OWUP777lnSC4s//E5?=
 =?us-ascii?Q?dEL6tnkatn8c8DA7aZ/edXbcrJHBoZk1FCFLMfkk0z1/TV62hdSnKs7Vldco?=
 =?us-ascii?Q?9Q=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: EQV/KQTwoCWyuqyVYHpsEbKdaJ9i9QEEPI5jmharO7lHjS6pfyA/hB/tJFqUg1aD1s6mtlGvpHDz16MJ0XvJ0nROX7pB1iVx5E6L0kIel7ghGz1/m3sk8Ip+HlVb1OAhVY5WHN3xwjtD+dk32DWy7kmwnscmqRyrKpxZPmWafN2MnQqVxQxULSJuA19kQub7Q725Ic25fjOMQ2dOFxJznofZ289kOlIMjRqts9CT6dDzUq6s0X2ruPK47ObbJK7f7Z7PwolhRBVC6CQawvzoEeuDWiGG+L5zE7JOkBowRYUXdHwif8re4gR2AJQMAmBokxoTkjVK7DMOjN6GxFLVv0m4Ns1Z0WI0Lns31+NghGpQ1ZwjA28tPpYFrvRcyQ+pn2sVIaf6fvaaali+9yHRapybeLpQoA3PG/0bYn1Nyctr7uijtxt5s8rmdS2SVgrn0yMGQdeP+Od5TPkIGCZBfq+Iqv5MemoLk9FhMLFwq8mFuLaHSP1NFY9S7J8ZQY5kGO5X6QlXEWj7qeYO9FUMeCo8GVY8JLyhtTyeu8D2hTiF+jjXDvH/aAh4BKGmTtZzU3yRV5MCkfv7hC/VLsduHyv3H93zTov/WC/qPnZSnY5IsT3NAFAM5kmGXfgTRjv/XpwA4VxKU1fugCm/NwUtV6SnqhocsQb/EGPqLIKigzm71FnEnyD5bJxq/LY6VLVjVp/oMNcwy6P4FWrwZv88DZPLZ15vDvsUcwU68+nEY6X7cAPVIh6wF3UA6i/a/LPlT9115tQrITF6clmlJ2tBEJzzDqD4TejQt4d1iU96msDCTLYbI0b0d+hNV6Zb31hxLxucsoy2Wrc2fvE2VVMOiFv1c/4BLpq7crw3aa9iKvpAfuilIRb85kryBL/Ji3xaFVB87uaXjjrA3IzGcMh9RQ==
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 76f20023-618d-40d5-c745-08db42b24390
X-MS-Exchange-CrossTenant-AuthSource: CO1PR10MB4531.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Apr 2023 21:49:21.1852 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: G/nl7YKszLodWq8GznBJzu34e4hnu8RcMUkxQ1McG3ozggidlRVeliOZ3j0mm2b8lH5L/1oda8lV+xQlJNWeOdx7Kl8gzHb1t9t2UlxGCM8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR10MB6857
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-04-21_08,2023-04-21_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999
 adultscore=0
 phishscore=0 malwarescore=0 spamscore=0 bulkscore=0 suspectscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2303200000 definitions=main-2304210190
X-Proofpoint-GUID: ZPJRUeqUKzO5PWBjEbG2XHInvTqqln3_
X-Proofpoint-ORIG-GUID: ZPJRUeqUKzO5PWBjEbG2XHInvTqqln3_
Received-SPF: pass client-ip=205.220.165.32;
 envelope-from=eric.devolder@oracle.com; helo=mx0a-00069f02.pphosted.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Following the guidelines in tests/qtest/bios-tables-test.c, this
is step 6.

For the cpuhp test case, it is started with:
 -smp 2,cores=3,sockets=2,maxcpus=6

So two of six CPUs are present, leaving 4 hot-pluggable CPUs. This
is what the disassembly diff below shows (two entries with Enabled=1
and the new Online Capable bit 0, and four entries with Enabled=0 and
Online Capable bit 1).

(NOTE: I'm only showing x86_64 .cphp as i386 is the same. And for
tests not involving hotplug, the diff shows just the corresponding
change to .Revision and .Checksum.)

  /*
   * Intel ACPI Component Architecture
   * AML/ASL+ Disassembler version 20230331 (64-bit version)
   * Copyright (c) 2000 - 2023 Intel Corporation
   *
 - * Disassembly of tests/data/acpi/pc/APIC.cphp, Fri Apr 21 16:50:07 2023
 + * Disassembly of /tmp/aml-9ON131, Fri Apr 21 16:50:07 2023
   *
   * ACPI Data Table [APIC]
   *
   * Format: [HexOffset DecimalOffset ByteLength]  FieldName : FieldValue (in hex)
   */

  [000h 0000 004h]                   Signature : "APIC"    [Multiple APIC Description Table (MADT)]
  [004h 0004 004h]                Table Length : 000000A0
 -[008h 0008 001h]                    Revision : 01
 -[009h 0009 001h]                    Checksum : 18
 +[008h 0008 001h]                    Revision : 05
 +[009h 0009 001h]                    Checksum : 0C
  [00Ah 0010 006h]                      Oem ID : "BOCHS "
  [010h 0016 008h]                Oem Table ID : "BXPC    "
  [018h 0024 004h]                Oem Revision : 00000001
  [01Ch 0028 004h]             Asl Compiler ID : "BXPC"
  [020h 0032 004h]       Asl Compiler Revision : 00000001

  [024h 0036 004h]          Local Apic Address : FEE00000
  [028h 0040 004h]       Flags (decoded below) : 00000001
                           PC-AT Compatibility : 1

  [02Ch 0044 001h]               Subtable Type : 00 [Processor Local APIC]
  [02Dh 0045 001h]                      Length : 08
  [02Eh 0046 001h]                Processor ID : 00
  [02Fh 0047 001h]               Local Apic ID : 00
  [030h 0048 004h]       Flags (decoded below) : 00000001
                             Processor Enabled : 1
                        Runtime Online Capable : 0

  [034h 0052 001h]               Subtable Type : 00 [Processor Local APIC]
  [035h 0053 001h]                      Length : 08
  [036h 0054 001h]                Processor ID : 01
  [037h 0055 001h]               Local Apic ID : 01
  [038h 0056 004h]       Flags (decoded below) : 00000001
                             Processor Enabled : 1
                        Runtime Online Capable : 0

  [03Ch 0060 001h]               Subtable Type : 00 [Processor Local APIC]
  [03Dh 0061 001h]                      Length : 08
  [03Eh 0062 001h]                Processor ID : 02
  [03Fh 0063 001h]               Local Apic ID : 02
 -[040h 0064 004h]       Flags (decoded below) : 00000000
 +[040h 0064 004h]       Flags (decoded below) : 00000002
                             Processor Enabled : 0
 -                      Runtime Online Capable : 0
 +                      Runtime Online Capable : 1

  [044h 0068 001h]               Subtable Type : 00 [Processor Local APIC]
  [045h 0069 001h]                      Length : 08
  [046h 0070 001h]                Processor ID : 03
  [047h 0071 001h]               Local Apic ID : 04
 -[048h 0072 004h]       Flags (decoded below) : 00000000
 +[048h 0072 004h]       Flags (decoded below) : 00000002
                             Processor Enabled : 0
 -                      Runtime Online Capable : 0
 +                      Runtime Online Capable : 1

  [04Ch 0076 001h]               Subtable Type : 00 [Processor Local APIC]
  [04Dh 0077 001h]                      Length : 08
  [04Eh 0078 001h]                Processor ID : 04
  [04Fh 0079 001h]               Local Apic ID : 05
 -[050h 0080 004h]       Flags (decoded below) : 00000000
 +[050h 0080 004h]       Flags (decoded below) : 00000002
                             Processor Enabled : 0
 -                      Runtime Online Capable : 0
 +                      Runtime Online Capable : 1

  [054h 0084 001h]               Subtable Type : 00 [Processor Local APIC]
  [055h 0085 001h]                      Length : 08
  [056h 0086 001h]                Processor ID : 05
  [057h 0087 001h]               Local Apic ID : 06
 -[058h 0088 004h]       Flags (decoded below) : 00000000
 +[058h 0088 004h]       Flags (decoded below) : 00000002
                             Processor Enabled : 0
 -                      Runtime Online Capable : 0
 +                      Runtime Online Capable : 1

  [05Ch 0092 001h]               Subtable Type : 01 [I/O APIC]
  [05Dh 0093 001h]                      Length : 0C
  [05Eh 0094 001h]                 I/O Apic ID : 00
  [05Fh 0095 001h]                    Reserved : 00
  [060h 0096 004h]                     Address : FEC00000
  [064h 0100 004h]                   Interrupt : 00000000

  [068h 0104 001h]               Subtable Type : 02 [Interrupt Source Override]
  [069h 0105 001h]                      Length : 0A
  [06Ah 0106 001h]                         Bus : 00
  [06Bh 0107 001h]                      Source : 00
  [06Ch 0108 004h]                   Interrupt : 00000002
  [070h 0112 002h]       Flags (decoded below) : 0000
                                      Polarity : 0
                                  Trigger Mode : 0
 @@ -121,26 +121,26 @@
  [093h 0147 001h]                      Source : 0B
  [094h 0148 004h]                   Interrupt : 0000000B
  [098h 0152 002h]       Flags (decoded below) : 000D
                                      Polarity : 1
                                  Trigger Mode : 3

  [09Ah 0154 001h]               Subtable Type : 04 [Local APIC NMI]
  [09Bh 0155 001h]                      Length : 06
  [09Ch 0156 001h]                Processor ID : FF
  [09Dh 0157 002h]       Flags (decoded below) : 0000
                                      Polarity : 0
                                  Trigger Mode : 0
  [09Fh 0159 001h]        Interrupt Input LINT : 01

  Raw Table Data: Length 160 (0xA0)

 -    0000: 41 50 49 43 A0 00 00 00 01 18 42 4F 43 48 53 20  // APIC......BOCHS
 +    0000: 41 50 49 43 A0 00 00 00 05 0C 42 4F 43 48 53 20  // APIC......BOCHS
      0010: 42 58 50 43 20 20 20 20 01 00 00 00 42 58 50 43  // BXPC    ....BXPC
      0020: 01 00 00 00 00 00 E0 FE 01 00 00 00 00 08 00 00  // ................
      0030: 01 00 00 00 00 08 01 01 01 00 00 00 00 08 02 02  // ................
 -    0040: 00 00 00 00 00 08 03 04 00 00 00 00 00 08 04 05  // ................
 -    0050: 00 00 00 00 00 08 05 06 00 00 00 00 01 0C 00 00  // ................
 +    0040: 02 00 00 00 00 08 03 04 02 00 00 00 00 08 04 05  // ................
 +    0050: 02 00 00 00 00 08 05 06 02 00 00 00 01 0C 00 00  // ................
      0060: 00 00 C0 FE 00 00 00 00 02 0A 00 00 02 00 00 00  // ................
      0070: 00 00 02 0A 00 05 05 00 00 00 0D 00 02 0A 00 09  // ................
      0080: 09 00 00 00 0D 00 02 0A 00 0A 0A 00 00 00 0D 00  // ................
      0090: 02 0A 00 0B 0B 00 00 00 0D 00 04 06 FF 00 00 01  // ................
 **
Signed-off-by: Eric DeVolder <eric.devolder@oracle.com>
---
 tests/data/acpi/microvm/APIC                  | Bin 70 -> 70 bytes
 tests/data/acpi/microvm/APIC.ioapic2          | Bin 82 -> 82 bytes
 tests/data/acpi/microvm/APIC.pcie             | Bin 110 -> 110 bytes
 tests/data/acpi/pc/APIC                       | Bin 120 -> 120 bytes
 tests/data/acpi/pc/APIC.acpihmat              | Bin 128 -> 128 bytes
 tests/data/acpi/pc/APIC.cphp                  | Bin 160 -> 160 bytes
 tests/data/acpi/pc/APIC.dimmpxm               | Bin 144 -> 144 bytes
 tests/data/acpi/q35/APIC                      | Bin 120 -> 120 bytes
 tests/data/acpi/q35/APIC.acpihmat             | Bin 128 -> 128 bytes
 tests/data/acpi/q35/APIC.acpihmat-noinitiator | Bin 144 -> 144 bytes
 tests/data/acpi/q35/APIC.core-count2          | Bin 2478 -> 2478 bytes
 tests/data/acpi/q35/APIC.cphp                 | Bin 160 -> 160 bytes
 tests/data/acpi/q35/APIC.dimmpxm              | Bin 144 -> 144 bytes
 tests/data/acpi/q35/APIC.xapic                | Bin 2686 -> 2686 bytes
 tests/data/acpi/virt/APIC                     | Bin 172 -> 172 bytes
 tests/data/acpi/virt/APIC.acpihmatvirt        | Bin 412 -> 412 bytes
 tests/data/acpi/virt/APIC.topology            | Bin 732 -> 732 bytes
 tests/qtest/bios-tables-test-allowed-diff.h   |   4 ----
 18 files changed, 4 deletions(-)

diff --git a/tests/data/acpi/microvm/APIC b/tests/data/acpi/microvm/APIC
index 68dbd44a7e35a356083f086df60f70e424c4249f..e1c72bd3e60e46acc2c8b3de14f5992946cd55a3 100644
GIT binary patch
delta 16
XcmZ>B<8ln}barE4U|=nn$Ylcn95w?+

delta 16
XcmZ>B<8ln}barE4U|=kn$Ylcn95Mq&

diff --git a/tests/data/acpi/microvm/APIC.ioapic2 b/tests/data/acpi/microvm/APIC.ioapic2
index 3063c52cd3e9bbed29c06031b375900f4a49b9e0..7c4f1b61d6c37f893d0d46be44a00e3f54a27a75 100644
GIT binary patch
delta 16
XcmWFv;&Ke|bPi%*U|_AE$mIb59$o{5

delta 16
XcmWFv;&Ke|bPi%*U|?*X$mIb59$Ev1

diff --git a/tests/data/acpi/microvm/APIC.pcie b/tests/data/acpi/microvm/APIC.pcie
index 4e8f6ed8d6a866429fc17aecdeafc3fb5ef65fa3..23956151765cae221853d92448a619d5576119b5 100644
GIT binary patch
delta 16
Xcmd1H<8ln}bk1X7U|_A7$dv*BBEAFe

delta 16
Xcmd1H<8ln}bk1X7U|_77$dv*BBDw?a

diff --git a/tests/data/acpi/pc/APIC b/tests/data/acpi/pc/APIC
index 208331db53b7dd5c6205cce0e95427636b86dd64..48bdab41959d7895b01491c6136d7403df284f98 100644
GIT binary patch
delta 16
Xcmb=Z;BpM`bgp1vU|?;V$dv~GB#;Co

delta 16
Xcmb=Z;BpM`bgp1vU|{T;$dv~GB#Z<k

diff --git a/tests/data/acpi/pc/APIC.acpihmat b/tests/data/acpi/pc/APIC.acpihmat
index 812c4603f2701494f6bb761570323158a20d4043..57d15150f781504090c8be19fe063836a66ccdc1 100644
GIT binary patch
delta 18
ZcmZo*Y+&Sa4DfVrU|?WiEuP3#1^_261Tz2t

delta 18
ZcmZo*Y+&Sa4DfVrU|?WiET70#1^_221Tz2t

diff --git a/tests/data/acpi/pc/APIC.cphp b/tests/data/acpi/pc/APIC.cphp
index 65cc4f4a9aa2676140a6525cdac1e838274b1e07..8451b99c3065f76214023a88ef955de0efc75c60 100644
GIT binary patch
delta 47
scmZ3$xPXz%F~HM#0RsaAE6+qOGf5^Oi-Cig1wym1LTFYtriqd60Hq=YaR2}S

delta 47
scmZ3$xPXz%F~HM#0RsaAqr^lmGf5zWfq{dW1wym1LTFYthKZ5x0Hvk{aR2}S

diff --git a/tests/data/acpi/pc/APIC.dimmpxm b/tests/data/acpi/pc/APIC.dimmpxm
index d904d4a70ddecbb79a83a267af8e26f925e9f4c6..824a279eb7d4134554cb447808bab5a174657272 100644
GIT binary patch
delta 18
ZcmbQhIDwJNF~HM#0s{jBtNTQ*HUKF;1V;b>

delta 18
ZcmbQhIDwJNF~HM#0s{jBqxVFvHUKF)1V;b>

diff --git a/tests/data/acpi/q35/APIC b/tests/data/acpi/q35/APIC
index 208331db53b7dd5c6205cce0e95427636b86dd64..48bdab41959d7895b01491c6136d7403df284f98 100644
GIT binary patch
delta 16
Xcmb=Z;BpM`bgp1vU|?;V$dv~GB#;Co

delta 16
Xcmb=Z;BpM`bgp1vU|{T;$dv~GB#Z<k

diff --git a/tests/data/acpi/q35/APIC.acpihmat b/tests/data/acpi/q35/APIC.acpihmat
index 812c4603f2701494f6bb761570323158a20d4043..57d15150f781504090c8be19fe063836a66ccdc1 100644
GIT binary patch
delta 18
ZcmZo*Y+&Sa4DfVrU|?WiEuP3#1^_261Tz2t

delta 18
ZcmZo*Y+&Sa4DfVrU|?WiET70#1^_221Tz2t

diff --git a/tests/data/acpi/q35/APIC.acpihmat-noinitiator b/tests/data/acpi/q35/APIC.acpihmat-noinitiator
index d904d4a70ddecbb79a83a267af8e26f925e9f4c6..824a279eb7d4134554cb447808bab5a174657272 100644
GIT binary patch
delta 18
ZcmbQhIDwJNF~HM#0s{jBtNTQ*HUKF;1V;b>

delta 18
ZcmbQhIDwJNF~HM#0s{jBqxVFvHUKF)1V;b>

diff --git a/tests/data/acpi/q35/APIC.core-count2 b/tests/data/acpi/q35/APIC.core-count2
index a255082ef5bc39f0d92d3e372b91f09dd6d0d9a1..5b9093a60ee95608cca9560daa7fc07cf7703466 100644
GIT binary patch
delta 19
acmZ1{yiS<QF~HM#9VY_=>zR#QOE>{I`~{i-

delta 19
acmZ1{yiS<QF~HM#9VY_=<Ase}OE>{I_yw8(

diff --git a/tests/data/acpi/q35/APIC.cphp b/tests/data/acpi/q35/APIC.cphp
index 65cc4f4a9aa2676140a6525cdac1e838274b1e07..8451b99c3065f76214023a88ef955de0efc75c60 100644
GIT binary patch
delta 47
scmZ3$xPXz%F~HM#0RsaAE6+qOGf5^Oi-Cig1wym1LTFYtriqd60Hq=YaR2}S

delta 47
scmZ3$xPXz%F~HM#0RsaAqr^lmGf5zWfq{dW1wym1LTFYthKZ5x0Hvk{aR2}S

diff --git a/tests/data/acpi/q35/APIC.dimmpxm b/tests/data/acpi/q35/APIC.dimmpxm
index d904d4a70ddecbb79a83a267af8e26f925e9f4c6..824a279eb7d4134554cb447808bab5a174657272 100644
GIT binary patch
delta 18
ZcmbQhIDwJNF~HM#0s{jBtNTQ*HUKF;1V;b>

delta 18
ZcmbQhIDwJNF~HM#0s{jBqxVFvHUKF)1V;b>

diff --git a/tests/data/acpi/q35/APIC.xapic b/tests/data/acpi/q35/APIC.xapic
index c1969c35aa12b61d25e0134bbb8d2187ba42d663..9cc1db8e078fa3d23d1ab836fea70881a745bb07 100644
GIT binary patch
literal 2686
zcmXxmQ+ym<7=ZEFO*UD?c2e7RlP!`eX;Y-OZKt+v+qP2McB<62(r?~8=Q|hkf1mT4
znVXr56B!p{Pqb>9DJ3e_9vvSMl@Mo-(3e5eG?_(BOHNJGtZ8U47-idRG@^q8Iy$1s
zgicQA?2KkJS}bU_qRoabF6iotZf@xAjvgN9>4{!m=<SU@KIrR<etzihj{yM~7>GeZ
z7#xftAs8BpVPO~^ju8=<E*+*%j~Oyx#*COL6K2kgS+Zc(te7nuX3vf}a$wG!m@60N
z&W(BUVBWl#FCXU5j|B=~!Gc(*5Ed?sMT%h2qFAgL7B7w^N?^&7SgI73E{$c%VA--5
z8HrI*Xt!gza#+4RR;Yj#D`Ips#>8NyN?5rvR;hwjt75fk7#oXmaag@N)~JE;@mRAa
z)~bcIYh#@{n2>;V>telnSie3tXn+kHVxvabxG^?qf=!!Zvu4=5IksqlEn8x%R@k~V
zwrPWH+hV(R*uFh>=ztwNVy8~nxifa@f?c~}w{F<IJND>-J$quWUf8=g_UVIt`(nR-
z*uOsx7=Qx@Vqzi=8ia!f<B%aZbSMrRhQo*Bh!Hq)B#s(|qetVIF*tTCjvI&L$K!+v
zIB_CQnuL=l<CG~lbt+DqhSR6xj2Sp{CeE6LvuER+IXHJN&YOqx=i`C}xNspZT7-)i
z<B}z~bSW-dhRc`ZiWRtWC9Yb9t5@TiHMn*yu3Lxe*W-o_xN#$H+Ju`o<CZPBbt`V$
zhTFH}jvcsjC+^yXyLaQBJ-Bx-?%Rj^_v3*Bc<>+|I)q6{c=#|LIf6%z;<00R{5YOC
zfhSMmsZ)6RG@dzwXV2ofb9nwdUbui4FXE+3c=<A3xq?@(;<amd{W{*bfj4jBty_5e
zHr}~|ckkl8dwBmoK6ro+A7XMcK6-?YALElJ`1C10dxj|~`20D(c!4ip;;UEq`Zd0J
zgKyvByLb5hJ%0FrA3x%!Px$#We))o5zv8!V`29Qn_<=uv;;&!$`#1jigMa^GYN}}Q
z(6oQLGK<o35J<a6SK6Rjls2jsr5#j@(vGS{X_IPE+DWx2?W|gqHmeq;EviLnt7=i&
zrdpJCQ7uZlsurc)REyH?szqrJ)uObgYEjxtwJ7baT9o!tElT^U7Nz}Ei_-q8Md<+5
zqI95YQ94MqC>^X?lnzlXN{6ZzrNdN<(&4H_gNy$CwWL(J8uhbd+J7LE$)xYN%4D(p
WKUwt~*t6NvCaeDRKYi&h(*6VF!XOX;

literal 2686
zcmXZeQ+OOv7=Yo~aI?wAcAeU0vPDuQZHm;k?bNny+g57ZPHkIh=b!JKoA-S43@*-G
z{Lu+<wq%Q@nWAFiZLx`wF-ZxwNPU?!O_RN-X{l+3X8k@%vx&=QJ3C3uY;TVa4(RBJ
zPEP3TjAs1}`ZBw?phf?(w5uz+xuMmH?(XQ}fu5e|<%Qnf=;MRFzUb$N{{9#cfPsM+
z6okRS7!rb^p%@m1;o%q&fsv7zE*+*%j~Oyx#*COL6K2kgS+ZbM6lTqe*|K5w?3g15
z=FEw?a$)Y=m?sbB&5QZ+VgCGBpa2#uh=mGa;lfy?2o^1h#fo9^;#i^tmMn>-N@3~J
zSf&g{M`KJ3+H6?1ES4*W<;!D*3K$!UadB9&B37z|l`CVFDp<8D#>Znq0#>Vr)vIG-
zBG#yZHEUw6T3EX_CM98=I#{<Z)~kp0>tllk*svisYJ`m&W0NM>v?(@ghRvH}ix$|j
zCAMmXty^Q8HrTc;wrhv&+hd0g*s&va>V%y;W0x-2wJUb(hTXekj~>{wC-&-vy?bMy
zKG?S}_UniJ`{RHCn4F9Q2jZYXICwA)8G=KH;;>;jd^nC6fg?xas8Kk2G>#dAW5?pS
zaX5ZFPMClbC*q_@IC(NonSxWN;<RZveLBvVfiq{~tXVjFHqM!YbLZl`c{qPQE?9sI
z7viEtxOg!xS%OQK;<9D9d^xUIfh$+ys#UmpHLh8MYuDnsb+~>#ZrFeuH{zyExOp>f
z*@9cQ;<jzLeLL>hfjf8Nu3fl$H}2Vkd-vkLeYk%=9yovp4`NCR9y)}F595&|c=RY9
zJBG)P<B1b^@+6)*g{M#BnKO9yES@`u=g;GX3wZG&Ub=*rFXNRfc=ak?yN1`V<Bc15
z^CsT9g|~0xojZ8<F5bI`_wVC_2bh|Q4<F*ANBH<LK6!#qpW?G;`20D(c!4ip;;UEq
z`Zd0JgKyvByLb5hJ%0FrA3x%!Px$#We))o5zv8!V`29Qn_<=uv;;&!$`#1jigMa^G
zTAJwMscHX=3n<MXfYNFrFqF14@qj38uUeFLP%TP3surc4REyHiszqtDYEjxnwJ2>-
zElRtp7Ny-(i_%urqO`keQQAYbDDA0Ql=f0BN_(porF~S3(!Q!iX+PDXw7+UmIzY83
z9jIEA4pJ>j2dfsPLsW~>p{hmcFx8@TxN1>4LbYgele0}R{tY{ee%8iO>pNrYvugUz
Y81RgpG2$6JW5}~=7X9ge`jQv^2Net*5C8xG

diff --git a/tests/data/acpi/virt/APIC b/tests/data/acpi/virt/APIC
index 179d274770a23209b949c90a929525e22368568b..318cdea179b244639417efe4fe1acb2a79879e7a 100644
GIT binary patch
delta 18
ZcmZ3(xQ3C-F~HM#4FdxMtJ_4bMF1`e1hxPG

delta 18
ZcmZ3(xQ3C-F~HM#4FdxMi~B^bMF1`d1hxPG

diff --git a/tests/data/acpi/virt/APIC.acpihmatvirt b/tests/data/acpi/virt/APIC.acpihmatvirt
index 68200204c6f8f2706c9896dbbccc5ecbec130d26..a066df3651f9e832546d47b2a0bc8475f830bdc1 100644
GIT binary patch
delta 19
acmbQkJcpUfF~HM#4kH5tYu84uNsIt7;soFT

delta 19
acmbQkJcpUfF~HM#4kH5tOZP^uNsIt7;RN6S

diff --git a/tests/data/acpi/virt/APIC.topology b/tests/data/acpi/virt/APIC.topology
index 3a6ac525e7faeaec025fa6b3fc01dc67110e1296..7f10e34f6ba5af0a5c05acf0ac95f3d0b83e8339 100644
GIT binary patch
delta 19
acmcb^dWV(EF~HOL4if_d>+X$QmzV%QB?cD&

delta 19
acmcb^dWV(EF~HOL4if_d%btx~mzV%QBnB4%

diff --git a/tests/qtest/bios-tables-test-allowed-diff.h b/tests/qtest/bios-tables-test-allowed-diff.h
index 1e5e354ecf..dfb8523c8b 100644
--- a/tests/qtest/bios-tables-test-allowed-diff.h
+++ b/tests/qtest/bios-tables-test-allowed-diff.h
@@ -1,5 +1 @@
 /* List of comma-separated changed AML files to ignore */
-"tests/data/acpi/pc/APIC",
-"tests/data/acpi/q35/APIC",
-"tests/data/acpi/microvm/APIC",
-"tests/data/acpi/virt/APIC",
--
2.31.1
---
 tests/data/acpi/microvm/APIC                  | Bin 70 -> 70 bytes
 tests/data/acpi/microvm/APIC.ioapic2          | Bin 82 -> 82 bytes
 tests/data/acpi/microvm/APIC.pcie             | Bin 110 -> 110 bytes
 tests/data/acpi/pc/APIC                       | Bin 120 -> 120 bytes
 tests/data/acpi/pc/APIC.acpihmat              | Bin 128 -> 128 bytes
 tests/data/acpi/pc/APIC.cphp                  | Bin 160 -> 160 bytes
 tests/data/acpi/pc/APIC.dimmpxm               | Bin 144 -> 144 bytes
 tests/data/acpi/q35/APIC                      | Bin 120 -> 120 bytes
 tests/data/acpi/q35/APIC.acpihmat             | Bin 128 -> 128 bytes
 tests/data/acpi/q35/APIC.acpihmat-noinitiator | Bin 144 -> 144 bytes
 tests/data/acpi/q35/APIC.core-count2          | Bin 2478 -> 2478 bytes
 tests/data/acpi/q35/APIC.cphp                 | Bin 160 -> 160 bytes
 tests/data/acpi/q35/APIC.dimmpxm              | Bin 144 -> 144 bytes
 tests/data/acpi/q35/APIC.xapic                | Bin 2686 -> 2686 bytes
 tests/qtest/bios-tables-test-allowed-diff.h   |   4 ----
 15 files changed, 4 deletions(-)

diff --git a/tests/data/acpi/microvm/APIC b/tests/data/acpi/microvm/APIC
index 68dbd44a7e35a356083f086df60f70e424c4249f..e1c72bd3e60e46acc2c8b3de14f5992946cd55a3 100644
GIT binary patch
delta 16
XcmZ>B<8ln}barE4U|=nn$Ylcn95w?+

delta 16
XcmZ>B<8ln}barE4U|=kn$Ylcn95Mq&

diff --git a/tests/data/acpi/microvm/APIC.ioapic2 b/tests/data/acpi/microvm/APIC.ioapic2
index 3063c52cd3e9bbed29c06031b375900f4a49b9e0..7c4f1b61d6c37f893d0d46be44a00e3f54a27a75 100644
GIT binary patch
delta 16
XcmWFv;&Ke|bPi%*U|_AE$mIb59$o{5

delta 16
XcmWFv;&Ke|bPi%*U|?*X$mIb59$Ev1

diff --git a/tests/data/acpi/microvm/APIC.pcie b/tests/data/acpi/microvm/APIC.pcie
index 4e8f6ed8d6a866429fc17aecdeafc3fb5ef65fa3..23956151765cae221853d92448a619d5576119b5 100644
GIT binary patch
delta 16
Xcmd1H<8ln}bk1X7U|_A7$dv*BBEAFe

delta 16
Xcmd1H<8ln}bk1X7U|_77$dv*BBDw?a

diff --git a/tests/data/acpi/pc/APIC b/tests/data/acpi/pc/APIC
index 208331db53b7dd5c6205cce0e95427636b86dd64..48bdab41959d7895b01491c6136d7403df284f98 100644
GIT binary patch
delta 16
Xcmb=Z;BpM`bgp1vU|?;V$dv~GB#;Co

delta 16
Xcmb=Z;BpM`bgp1vU|{T;$dv~GB#Z<k

diff --git a/tests/data/acpi/pc/APIC.acpihmat b/tests/data/acpi/pc/APIC.acpihmat
index 812c4603f2701494f6bb761570323158a20d4043..57d15150f781504090c8be19fe063836a66ccdc1 100644
GIT binary patch
delta 18
ZcmZo*Y+&Sa4DfVrU|?WiEuP3#1^_261Tz2t

delta 18
ZcmZo*Y+&Sa4DfVrU|?WiET70#1^_221Tz2t

diff --git a/tests/data/acpi/pc/APIC.cphp b/tests/data/acpi/pc/APIC.cphp
index 65cc4f4a9aa2676140a6525cdac1e838274b1e07..8451b99c3065f76214023a88ef955de0efc75c60 100644
GIT binary patch
delta 47
scmZ3$xPXz%F~HM#0RsaAE6+qOGf5^Oi-Cig1wym1LTFYtriqd60Hq=YaR2}S

delta 47
scmZ3$xPXz%F~HM#0RsaAqr^lmGf5zWfq{dW1wym1LTFYthKZ5x0Hvk{aR2}S

diff --git a/tests/data/acpi/pc/APIC.dimmpxm b/tests/data/acpi/pc/APIC.dimmpxm
index d904d4a70ddecbb79a83a267af8e26f925e9f4c6..824a279eb7d4134554cb447808bab5a174657272 100644
GIT binary patch
delta 18
ZcmbQhIDwJNF~HM#0s{jBtNTQ*HUKF;1V;b>

delta 18
ZcmbQhIDwJNF~HM#0s{jBqxVFvHUKF)1V;b>

diff --git a/tests/data/acpi/q35/APIC b/tests/data/acpi/q35/APIC
index 208331db53b7dd5c6205cce0e95427636b86dd64..48bdab41959d7895b01491c6136d7403df284f98 100644
GIT binary patch
delta 16
Xcmb=Z;BpM`bgp1vU|?;V$dv~GB#;Co

delta 16
Xcmb=Z;BpM`bgp1vU|{T;$dv~GB#Z<k

diff --git a/tests/data/acpi/q35/APIC.acpihmat b/tests/data/acpi/q35/APIC.acpihmat
index 812c4603f2701494f6bb761570323158a20d4043..57d15150f781504090c8be19fe063836a66ccdc1 100644
GIT binary patch
delta 18
ZcmZo*Y+&Sa4DfVrU|?WiEuP3#1^_261Tz2t

delta 18
ZcmZo*Y+&Sa4DfVrU|?WiET70#1^_221Tz2t

diff --git a/tests/data/acpi/q35/APIC.acpihmat-noinitiator b/tests/data/acpi/q35/APIC.acpihmat-noinitiator
index d904d4a70ddecbb79a83a267af8e26f925e9f4c6..824a279eb7d4134554cb447808bab5a174657272 100644
GIT binary patch
delta 18
ZcmbQhIDwJNF~HM#0s{jBtNTQ*HUKF;1V;b>

delta 18
ZcmbQhIDwJNF~HM#0s{jBqxVFvHUKF)1V;b>

diff --git a/tests/data/acpi/q35/APIC.core-count2 b/tests/data/acpi/q35/APIC.core-count2
index a255082ef5bc39f0d92d3e372b91f09dd6d0d9a1..5b9093a60ee95608cca9560daa7fc07cf7703466 100644
GIT binary patch
delta 19
acmZ1{yiS<QF~HM#9VY_=>zR#QOE>{I`~{i-

delta 19
acmZ1{yiS<QF~HM#9VY_=<Ase}OE>{I_yw8(

diff --git a/tests/data/acpi/q35/APIC.cphp b/tests/data/acpi/q35/APIC.cphp
index 65cc4f4a9aa2676140a6525cdac1e838274b1e07..8451b99c3065f76214023a88ef955de0efc75c60 100644
GIT binary patch
delta 47
scmZ3$xPXz%F~HM#0RsaAE6+qOGf5^Oi-Cig1wym1LTFYtriqd60Hq=YaR2}S

delta 47
scmZ3$xPXz%F~HM#0RsaAqr^lmGf5zWfq{dW1wym1LTFYthKZ5x0Hvk{aR2}S

diff --git a/tests/data/acpi/q35/APIC.dimmpxm b/tests/data/acpi/q35/APIC.dimmpxm
index d904d4a70ddecbb79a83a267af8e26f925e9f4c6..824a279eb7d4134554cb447808bab5a174657272 100644
GIT binary patch
delta 18
ZcmbQhIDwJNF~HM#0s{jBtNTQ*HUKF;1V;b>

delta 18
ZcmbQhIDwJNF~HM#0s{jBqxVFvHUKF)1V;b>

diff --git a/tests/data/acpi/q35/APIC.xapic b/tests/data/acpi/q35/APIC.xapic
index c1969c35aa12b61d25e0134bbb8d2187ba42d663..9cc1db8e078fa3d23d1ab836fea70881a745bb07 100644
GIT binary patch
literal 2686
zcmXxmQ+ym<7=ZEFO*UD?c2e7RlP!`eX;Y-OZKt+v+qP2McB<62(r?~8=Q|hkf1mT4
znVXr56B!p{Pqb>9DJ3e_9vvSMl@Mo-(3e5eG?_(BOHNJGtZ8U47-idRG@^q8Iy$1s
zgicQA?2KkJS}bU_qRoabF6iotZf@xAjvgN9>4{!m=<SU@KIrR<etzihj{yM~7>GeZ
z7#xftAs8BpVPO~^ju8=<E*+*%j~Oyx#*COL6K2kgS+Zc(te7nuX3vf}a$wG!m@60N
z&W(BUVBWl#FCXU5j|B=~!Gc(*5Ed?sMT%h2qFAgL7B7w^N?^&7SgI73E{$c%VA--5
z8HrI*Xt!gza#+4RR;Yj#D`Ips#>8NyN?5rvR;hwjt75fk7#oXmaag@N)~JE;@mRAa
z)~bcIYh#@{n2>;V>telnSie3tXn+kHVxvabxG^?qf=!!Zvu4=5IksqlEn8x%R@k~V
zwrPWH+hV(R*uFh>=ztwNVy8~nxifa@f?c~}w{F<IJND>-J$quWUf8=g_UVIt`(nR-
z*uOsx7=Qx@Vqzi=8ia!f<B%aZbSMrRhQo*Bh!Hq)B#s(|qetVIF*tTCjvI&L$K!+v
zIB_CQnuL=l<CG~lbt+DqhSR6xj2Sp{CeE6LvuER+IXHJN&YOqx=i`C}xNspZT7-)i
z<B}z~bSW-dhRc`ZiWRtWC9Yb9t5@TiHMn*yu3Lxe*W-o_xN#$H+Ju`o<CZPBbt`V$
zhTFH}jvcsjC+^yXyLaQBJ-Bx-?%Rj^_v3*Bc<>+|I)q6{c=#|LIf6%z;<00R{5YOC
zfhSMmsZ)6RG@dzwXV2ofb9nwdUbui4FXE+3c=<A3xq?@(;<amd{W{*bfj4jBty_5e
zHr}~|ckkl8dwBmoK6ro+A7XMcK6-?YALElJ`1C10dxj|~`20D(c!4ip;;UEq`Zd0J
zgKyvByLb5hJ%0FrA3x%!Px$#We))o5zv8!V`29Qn_<=uv;;&!$`#1jigMa^GYN}}Q
z(6oQLGK<o35J<a6SK6Rjls2jsr5#j@(vGS{X_IPE+DWx2?W|gqHmeq;EviLnt7=i&
zrdpJCQ7uZlsurc)REyH?szqrJ)uObgYEjxtwJ7baT9o!tElT^U7Nz}Ei_-q8Md<+5
zqI95YQ94MqC>^X?lnzlXN{6ZzrNdN<(&4H_gNy$CwWL(J8uhbd+J7LE$)xYN%4D(p
WKUwt~*t6NvCaeDRKYi&h(*6VF!XOX;

literal 2686
zcmXZeQ+OOv7=Yo~aI?wAcAeU0vPDuQZHm;k?bNny+g57ZPHkIh=b!JKoA-S43@*-G
z{Lu+<wq%Q@nWAFiZLx`wF-ZxwNPU?!O_RN-X{l+3X8k@%vx&=QJ3C3uY;TVa4(RBJ
zPEP3TjAs1}`ZBw?phf?(w5uz+xuMmH?(XQ}fu5e|<%Qnf=;MRFzUb$N{{9#cfPsM+
z6okRS7!rb^p%@m1;o%q&fsv7zE*+*%j~Oyx#*COL6K2kgS+ZbM6lTqe*|K5w?3g15
z=FEw?a$)Y=m?sbB&5QZ+VgCGBpa2#uh=mGa;lfy?2o^1h#fo9^;#i^tmMn>-N@3~J
zSf&g{M`KJ3+H6?1ES4*W<;!D*3K$!UadB9&B37z|l`CVFDp<8D#>Znq0#>Vr)vIG-
zBG#yZHEUw6T3EX_CM98=I#{<Z)~kp0>tllk*svisYJ`m&W0NM>v?(@ghRvH}ix$|j
zCAMmXty^Q8HrTc;wrhv&+hd0g*s&va>V%y;W0x-2wJUb(hTXekj~>{wC-&-vy?bMy
zKG?S}_UniJ`{RHCn4F9Q2jZYXICwA)8G=KH;;>;jd^nC6fg?xas8Kk2G>#dAW5?pS
zaX5ZFPMClbC*q_@IC(NonSxWN;<RZveLBvVfiq{~tXVjFHqM!YbLZl`c{qPQE?9sI
z7viEtxOg!xS%OQK;<9D9d^xUIfh$+ys#UmpHLh8MYuDnsb+~>#ZrFeuH{zyExOp>f
z*@9cQ;<jzLeLL>hfjf8Nu3fl$H}2Vkd-vkLeYk%=9yovp4`NCR9y)}F595&|c=RY9
zJBG)P<B1b^@+6)*g{M#BnKO9yES@`u=g;GX3wZG&Ub=*rFXNRfc=ak?yN1`V<Bc15
z^CsT9g|~0xojZ8<F5bI`_wVC_2bh|Q4<F*ANBH<LK6!#qpW?G;`20D(c!4ip;;UEq
z`Zd0JgKyvByLb5hJ%0FrA3x%!Px$#We))o5zv8!V`29Qn_<=uv;;&!$`#1jigMa^G
zTAJwMscHX=3n<MXfYNFrFqF14@qj38uUeFLP%TP3surc4REyHiszqtDYEjxnwJ2>-
zElRtp7Ny-(i_%urqO`keQQAYbDDA0Ql=f0BN_(porF~S3(!Q!iX+PDXw7+UmIzY83
z9jIEA4pJ>j2dfsPLsW~>p{hmcFx8@TxN1>4LbYgele0}R{tY{ee%8iO>pNrYvugUz
Y81RgpG2$6JW5}~=7X9ge`jQv^2Net*5C8xG

diff --git a/tests/qtest/bios-tables-test-allowed-diff.h b/tests/qtest/bios-tables-test-allowed-diff.h
index 1e5e354ecf..dfb8523c8b 100644
--- a/tests/qtest/bios-tables-test-allowed-diff.h
+++ b/tests/qtest/bios-tables-test-allowed-diff.h
@@ -1,5 +1 @@
 /* List of comma-separated changed AML files to ignore */
-"tests/data/acpi/pc/APIC",
-"tests/data/acpi/q35/APIC",
-"tests/data/acpi/microvm/APIC",
-"tests/data/acpi/virt/APIC",
-- 
2.31.1


