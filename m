Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C2D5B68CE64
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Feb 2023 05:54:47 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pPFyw-0005uu-88; Mon, 06 Feb 2023 23:53:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dongli.zhang@oracle.com>)
 id 1pPFyt-0005uP-Vl
 for qemu-devel@nongnu.org; Mon, 06 Feb 2023 23:53:23 -0500
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dongli.zhang@oracle.com>)
 id 1pPFyr-0001sQ-Oa
 for qemu-devel@nongnu.org; Mon, 06 Feb 2023 23:53:23 -0500
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 316KDspx003914; Tue, 7 Feb 2023 04:53:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : content-transfer-encoding : content-type :
 mime-version; s=corp-2022-7-12;
 bh=f58eAIY6IqBSnWFbJKFsFzA8tDdormsy1g0ryOcTG0s=;
 b=2ERbLOUxqe5gIEnjaaM+aPjZagVS2kikEji8sELcLDsm2q2U2jgmaxJiOuoq8g5IQmDT
 xE00tptaCQIcglbT8n5/sVThEyhc9A1z4KGQWWs9ZJyVdgsXDpJcwSDdtgFjzUyM5ODt
 lFniIVbHK4juHLPGwxKXVRvpsdLh1HHwEjFHrsX5z31AqefrkdsBczGkXNe9clYypCoQ
 nOyWYr7GbDgLBB7CGVMGMTdpF1BSTOSNZ300LRRqGVfQesbc/JErpl9YLb/I1OLh/GZp
 yPGQ+oHGV8AEei2KRyYPgSl8yIvO/wrANwJuDji+uPRqaxdyzKHOVAul28M+kEDvi1XV cg== 
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com
 (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3nheytvkrt-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 07 Feb 2023 04:53:19 +0000
Received: from pps.filterd
 (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
 by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.17.1.5/8.17.1.5)
 with ESMTP id 3172DrqV036959; Tue, 7 Feb 2023 04:53:18 GMT
Received: from nam12-bn8-obe.outbound.protection.outlook.com
 (mail-bn8nam12lp2174.outbound.protection.outlook.com [104.47.55.174])
 by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id
 3nhdtbb8jx-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 07 Feb 2023 04:53:18 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ODPYAQv7gZ8XMi47MBfRff3DGDq3WYhF5fSsEGjVIgT7VNWzB3Rk9edtcNv0mb6trhpaf2oLXFnIficAU5/iE/ueXQBjdaDJzlNd//j9iL3nsXiknbWSbUCy3fBZ3rMuGGm+g9+cYzWC0UzTl9bzC4kdwfIfRF3bof9Wi1RNrktRuuxXCeEneY0GR0jqjPOyY+uJpyS5B9cp/u7tt8e4o2heWqbC6C2cijnpugn8Q0R16ZxProIp5qMieRmDKIlrHPQHSsxtMc9A8d7KOQ7KNqa/UaAptpjY2aQrrAcAL+SKZvp3emlvcf6NA1jHQoZTMpyxZIqg3y8uypsWCf5nng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=f58eAIY6IqBSnWFbJKFsFzA8tDdormsy1g0ryOcTG0s=;
 b=bMfy2Ft41wAvnMKUsDRCsYgTgyIsYwK9fDSKmdOIp+mGy8a6Yhsu0wFHuvb8c9BJBQv7zDU0QbcGJBzxaUJu/Urs6ypTRIPrE/uOqN+R+m2FClSAK1PfwC2oGke/zplA72vqnoPOLWJ7hA5epzOHuAOfge185uKJX7RILSN6FPqvIiy06AJ+hG+QfbFm3y9J4y7x2caUAneSwOsNV5gSNoZSOd1yVtrwNePVpbDvaCR19ECojjnOqj9V0AGdjIREdQaUbkltQ0HC4O4X3rV9IQMqq7NYOSrvsh8oYLyufPMdkpFLlo0KoJ4fIb//mFG80Ga23VTmTaDo5UGfat0Uqw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=f58eAIY6IqBSnWFbJKFsFzA8tDdormsy1g0ryOcTG0s=;
 b=EKbhAwuCBsO+88khtCmRkJVht1yGJ2uyJsGBkXiaws5Ik4bFkpGnJTdmOuf7tqQVtsQaRPHfS7c4i8zfLF+edJTE7vzXg+pNZYe+AmVNDRH4T/hTilk2d3rSr+8UxAHWt5v1LvQZUavK6WrZNJ0TVRYrV7MpFNkXBlr+pOHyYSU=
Received: from BYAPR10MB2663.namprd10.prod.outlook.com (2603:10b6:a02:a9::20)
 by BN0PR10MB5142.namprd10.prod.outlook.com (2603:10b6:408:114::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6086.16; Tue, 7 Feb
 2023 04:53:17 +0000
Received: from BYAPR10MB2663.namprd10.prod.outlook.com
 ([fe80::d3a9:5199:9c2:e8fe]) by BYAPR10MB2663.namprd10.prod.outlook.com
 ([fe80::d3a9:5199:9c2:e8fe%4]) with mapi id 15.20.6086.009; Tue, 7 Feb 2023
 04:53:17 +0000
From: Dongli Zhang <dongli.zhang@oracle.com>
To: qemu-devel@nongnu.org
Cc: dgilbert@redhat.com, joe.jin@oracle.com
Subject: [PATCH 1/1] readline: fix hmp completion issue
Date: Mon,  6 Feb 2023 20:52:41 -0800
Message-Id: <20230207045241.8843-1-dongli.zhang@oracle.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BY3PR05CA0059.namprd05.prod.outlook.com
 (2603:10b6:a03:39b::34) To BYAPR10MB2663.namprd10.prod.outlook.com
 (2603:10b6:a02:a9::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR10MB2663:EE_|BN0PR10MB5142:EE_
X-MS-Office365-Filtering-Correlation-Id: 7a32b088-f795-45a7-b6d2-08db08c73a04
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: zrD3eFv42hhLuwBBxYIH/klbZTcC9eA3vZUP3kKv8Co3kxmoeZenFyFlrkaEMp5OfjQ2mYepuSWejSt4zCjOe7x63wjVdThgx0h/foKkr0R0ZPrZaaW73EiuI3rmenK+8NvQ5aVZal+6Srf9ragqS5Th7r0vFM51S/xOV1TtF8PckuvzV23ycSXMlIQ1UX62a1YbzGpiFKNbAu+FDJ9QVrmC13kJUPuiKUIyRQ9Wr/PB0J3CIi2K88D4rcSCOol05eSjv4LBt61Wbhy8MMAPD8tWA44QHcQ+6lwbYWk6KQoMr8Cgpd5fa5Nqhw23GwBCDBiOqG9lhYsyymgqxalT5K3R4xh1yF4qpN8RaAsZf+4O1ErdyjC4BRXOmhgQM63Opf5huvLPiBaiHcBJRifhI/5RN2n5GkVjFSFYQ38oBShmJPX/gh/VeCBzhy3je7uDiijwrZ2RufElAAE2RuhGgISF+GfIyk6Rq3IelYS4mDF8+nQ8J5e67/4zFZKrW9JkMQfahN2zPD7iJCO34yugAK20mhH/oMum3CngLbpKCuRFdlmATXnh0gfYbHkr5vkgERBq7eR696kPL0AQjdwEIaNQbDL8WkZrC92eJwazQvvWHYjuF1X43OHEct94Mt72diSgFBiHMVG2bCYrccficA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR10MB2663.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(366004)(39860400002)(376002)(396003)(346002)(136003)(451199018)(44832011)(2906002)(36756003)(6486002)(6666004)(26005)(186003)(6512007)(478600001)(8676002)(83380400001)(2616005)(1076003)(107886003)(66946007)(66556008)(66476007)(4326008)(6916009)(86362001)(8936002)(5660300002)(41300700001)(38100700002)(6506007)(316002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?sR1R2LXo3p9+P6Rx5gj/KySI2dSwidduiAUpehmmc4s5VVFIKCFb87cHE3+z?=
 =?us-ascii?Q?XMvxBUVa26GcGwpFFj7PsHM3IN3LBwPEbB4DkGbh/IERMXdwnuHCtaqC9eAw?=
 =?us-ascii?Q?NuVztdnsCjuveHi0/r1QZ2IaBaP5UEEB5vmvKaZqu8aZz0vGC8Kdb25BSUQW?=
 =?us-ascii?Q?BKWDhyqd36EJ3QR0wl00ZnR/l0rQf7Arwi7GQmc3WM9dZVqAbCfoowgKO1sY?=
 =?us-ascii?Q?LVFWrZWtvUq3/n+OY3vKubqhS6VqV0kUPWSWXn87vctwPF75/gYchDFMhI93?=
 =?us-ascii?Q?P2HehfPLqMuAp89JHBZaHT8Z3XDavxJh8omoZV7cmWy/Y6EKd9FHEfIw6ax4?=
 =?us-ascii?Q?ItJesYEffOY13Z5usGMkDkSuasC3LyS7O3SDjSfdsXABp/X+4g+Xu38H8/dG?=
 =?us-ascii?Q?6u6EJbPKYCCfZ2r3Nzcz0KW9QE5neWZjs//VegINgdWnKU9EZLjUXJagndD9?=
 =?us-ascii?Q?mY0o+F2jlfjkHWNw1/TwJ9IHz4peIXYAhbfthGHMpYlDEB8NI/a31x047Bdn?=
 =?us-ascii?Q?8DXGxeA3CYhVIs8EwRWOPm6z4ReuZo6vWKq9MT0YrPscRy9YorCjaSGDFf1I?=
 =?us-ascii?Q?uWvKCQ0yXAX2B+8W9H3lVuOxSkWwfKAaRfogr8zuijb9ZLy0vRUh/eHykxYG?=
 =?us-ascii?Q?2TMJp6OULmYp31ZX/JCMK9U8b/64eOzQ5fZOC+FA8/r70DkAPkfPRbRDcBC5?=
 =?us-ascii?Q?gCnbveotDPAXYt17D+kgzBJDqUxxq9v6rRffYOtBvgySo/lmSiFE2oBeF0jq?=
 =?us-ascii?Q?3/1PYgVF9cMrofDGh0OAjDCfpMVMjYksITwNvrsPCfGeMnI+IqRXzbAd9w3L?=
 =?us-ascii?Q?xbX5OhyecKFv246Qqg0neTCH22rGQwL63v1V8PkzBIjBehb2S24aM4fw4Ama?=
 =?us-ascii?Q?YlQuwdmEfGpB3zfciA/Sdk6yjj7HBQbThZcr9OxZPPvHIZFMs+9wzfZ1KwE7?=
 =?us-ascii?Q?PqglXW1vlTzDCWlYRd90lXVLHIjkemVEpU1uc2bnvMuTKyIKRYj5mXO1cbPs?=
 =?us-ascii?Q?qIaOsmITsS4KGUmdqrp835UTAoBsDSnrOvLKnw/09Nr1qn9lRnMGYqkj/K0p?=
 =?us-ascii?Q?nLnlPiHn5sfihA9CE3dm05Yw4L91hv6TvB2qytf5Hw6nzJNhi1kO8LsbNM2J?=
 =?us-ascii?Q?waHh05zqiJPo42sSuflvF/Ip5VrIrMqOPrYC0r8OapzRdQ3lC28EumEqDqLO?=
 =?us-ascii?Q?6ZS425l+Prozm9FxzTVfmUQydvSZneOXkDqUwe4dVUASDcpnMIc6sL+WItR5?=
 =?us-ascii?Q?g9C0N1lIojuZ8AGQG8l2RRgVon61xGeyAH61s6C3KqkpE7RHkKLf62Ad0MII?=
 =?us-ascii?Q?stCjGYfnoISVq3abDBizM0R/9fOegOIIGXI73S2gMhkWoLoR0l8G68y/5FGh?=
 =?us-ascii?Q?vcNy9+jubU1Wjc9vt9iIzXLC0lyYe4hdJYEoakb6zjx8+O3ErSvR2Mxr2siK?=
 =?us-ascii?Q?Le2oah3AXK6MDeE+dxBfdGRKCGq4mXRaBAQ6HdJJC0VZbVQOw0qYELvVfhoO?=
 =?us-ascii?Q?eWnn+mA7ma3ZX1hs8a+HXmrZoYjtFfEDBObsoZW+yPTWsgrSLBIHSehiaLzh?=
 =?us-ascii?Q?rLOJL3x9BHFuoci58ABnGE0ofNuYCnqMNhlp9SsVym/pvewH1nuNiK7ZaMe9?=
 =?us-ascii?Q?Zg=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: R/mtX2on2o6encxfV+sn/PyM16K9gCa8ahb3YWYNmGxtHoHbIEATlUYJdJbNpPl817fHS6/SMOZZKEnIvFEN5glMtxPotwt/03JMniv1wzG2JjoEfSHrwpzG+Judal5Ac6Gk8gyYZzLkfS3WTElo+PUl51PgjemofucdfLv1l5RMcw9ner7drON8WyOL5CEezS/K62uoVmjY52cdM/040L1cgqOvS4MW2qlYIC2ovqwmA/8aaqzCvqdjCGfJ5dMUaBctOkdwyRazjndQXIn61XtbmAFizZ6jct2sKqUY+/oeBXRyJRi6Rbp/7WfRAdInQzjymRzPdr948VXWEDXaCRvYITAHReJoSGOQ37SdsEfhNk1H74vjyZJrMckdpRbp7sdznL4QT1/zMraLxVRQfAgarRjI2SwcPFUVRhXLXMbO2Je4osmtiqC7i7mCNrTFUKyA34yiiDAxaOXDhod30Yzzcuxjw0wtYehtV8xReWLP9Sq92T0P+elUYmU505bhni6sI4sTiU/4tC9uM+EHDhDchix4QrtlckgQdxykHP6EayrAxYUa1xfd7d25t06TjK3SXm2cwH3ElykhtgDF4D0MYqYsZjjcypML2SRYbcJiIwOupjykMKIJZnVUF0AfPkYSoN/BHYHAeJMQlyeNU27GUXyEMBZEhJ9YTXHHPTGLau/04or4skvZ+pFaFE0gLaW1OA81pJALLgbjuJzD6inDcYvAUfpZhVDLZ7dNJVu49w7xRxsZS52irb2AqQpB4WV3ZmNlSfkLF0L9DWxdJA==
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7a32b088-f795-45a7-b6d2-08db08c73a04
X-MS-Exchange-CrossTenant-AuthSource: BYAPR10MB2663.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Feb 2023 04:53:16.9677 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1kIn5Pg1QvG3Y0XEv94abT4cBOMZT/FRHYfKj3sh0uziFCFBtWLSrUXZDfFOtkdbupiUXFd5pJtJv1WA5YHFbQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN0PR10MB5142
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.122.1
 definitions=2023-02-06_07,2023-02-06_03,2022-06-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0
 suspectscore=0 adultscore=0
 malwarescore=0 mlxscore=0 phishscore=0 spamscore=0 mlxlogscore=999
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2212070000
 definitions=main-2302070043
X-Proofpoint-GUID: IlqU8n2m6sP5q1PwHs_I7j5V32h-Ytkf
X-Proofpoint-ORIG-GUID: IlqU8n2m6sP5q1PwHs_I7j5V32h-Ytkf
Received-SPF: pass client-ip=205.220.177.32;
 envelope-from=dongli.zhang@oracle.com; helo=mx0b-00069f02.pphosted.com
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

The auto completion does not work in some cases.

Case 1.

1. (qemu) info reg
2. Press 'Tab'.
3. It does not auto complete.

Case 2.

1. (qemu) block_resize flo
2. Press 'Tab'.
3. It does not auto complete 'floppy0'.

Since the readline_add_completion_of() may add any completion when
strlen(pfx) is zero, we remove the check with (name[0] == '\0') because
strlen() always returns zero in that case.

Fixes: 52f50b1e9f8f ("readline: Extract readline_add_completion_of() from monitor")
Cc: Joe Jin <joe.jin@oracle.com>
Signed-off-by: Dongli Zhang <dongli.zhang@oracle.com>
---
 monitor/hmp.c | 8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)

diff --git a/monitor/hmp.c b/monitor/hmp.c
index 2aa85d3982..fee410362f 100644
--- a/monitor/hmp.c
+++ b/monitor/hmp.c
@@ -1189,9 +1189,7 @@ static void cmd_completion(MonitorHMP *mon, const char *name, const char *list)
         }
         memcpy(cmd, pstart, len);
         cmd[len] = '\0';
-        if (name[0] == '\0') {
-            readline_add_completion_of(mon->rs, name, cmd);
-        }
+        readline_add_completion_of(mon->rs, name, cmd);
         if (*p == '\0') {
             break;
         }
@@ -1335,9 +1333,7 @@ static void monitor_find_completion_by_table(MonitorHMP *mon,
             /* block device name completion */
             readline_set_completion_index(mon->rs, strlen(str));
             while ((blk = blk_next(blk)) != NULL) {
-                if (str[0] == '\0') {
-                    readline_add_completion_of(mon->rs, str, blk_name(blk));
-                }
+                readline_add_completion_of(mon->rs, str, blk_name(blk));
             }
             break;
         case 's':
-- 
2.34.1


