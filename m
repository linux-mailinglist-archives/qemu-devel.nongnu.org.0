Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A812694986
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Feb 2023 15:59:47 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pRaHo-0007NH-Kp; Mon, 13 Feb 2023 09:58:32 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <darren.kenny@oracle.com>)
 id 1pRaHm-0007Je-PL
 for qemu-devel@nongnu.org; Mon, 13 Feb 2023 09:58:31 -0500
Received: from mx0a-00069f02.pphosted.com ([205.220.165.32])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <darren.kenny@oracle.com>)
 id 1pRaHj-000072-QW
 for qemu-devel@nongnu.org; Mon, 13 Feb 2023 09:58:30 -0500
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 31DEnJOL028616; Mon, 13 Feb 2023 14:58:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : in-reply-to : references : date : message-id : content-type :
 mime-version; s=corp-2022-7-12;
 bh=7noouuHKXY6n4PScEWntYvGVIvtyuDosGaeoGAF2I38=;
 b=NeOwq4Qni2CbrajDBA4oaE5HePeRnoz+QskDQIi+QBQuHtwtO69cUt1CRvtoPVb142Oj
 kFwZe3+ZQ0X+Gk0hJVptse9pwoBv6zXI9slvQ84kg49bC59jRIc8wF1Fj8kOCetAGMpx
 5V9eMcV2Aub4SQdNCtwF0oZ3S8j6f6kBQWoCM36wl9sXx7LaS1tmsR8bOxcqy5dUGcqW
 7lXsI7AL9Rtge6DPP3tx9nXlM7DT/uD+wZW4/VJ9v/V/OU5ev/EFcl8MjDGjE06XYxuD
 a4a2uyz1AFc/FkloTc+WzOCdO1wSW96+LeUESBMSaJG0OeLsSFSvT1k2nmLkBKiUiujN OA== 
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com
 (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3np3jttx1f-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 13 Feb 2023 14:58:22 +0000
Received: from pps.filterd
 (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
 by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.17.1.5/8.17.1.5)
 with ESMTP id 31DDQSTu028792; Mon, 13 Feb 2023 14:58:21 GMT
Received: from nam11-bn8-obe.outbound.protection.outlook.com
 (mail-bn8nam11lp2169.outbound.protection.outlook.com [104.47.58.169])
 by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id
 3np1f3xgcn-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 13 Feb 2023 14:58:21 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Bs4/algMDfTBm4i/6VS5HcQBcEyqKgWaIJs8OfjKIulIVpYGbQGYh0QZOwUxU7JTpPMk27oBSFYE80/XwJs2Gt4zyTaJWNgNKqk0m2NSS6D0XFG/2nfbTNjscKQwVvrYMwmwz9NzDQzDgzlicX23CUWACmfonEL6r1A7fPqjvK2xvCvw2rj8UeWX+MJzz9FitQBEBJ3MguftnPYB4OrPWx0EUTlKAS/Vk8lRhtzu4M6YGYNkBZYKDhozokYB58RErXOp1p7oDIfZlH4LR1+VX67O5Md4fRnyOs3ABdxtcTXPF2pEwebMVF9S1ctNSlne1fl1mWk9OCpx1L9XmWmc3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7noouuHKXY6n4PScEWntYvGVIvtyuDosGaeoGAF2I38=;
 b=DVNbs7VGobPIPzX9fEE3uFL7gmj5TALWe1EeKcVpz8sclTBMGAmP/iqUn+Gq1lrjn62Z40nqhQ6ucXiIlD4ix82A8FXWrpBKC3tp3PHESI3bbaPAZ28LxkOOZ3tGcGnfGmJqzUTrNEX9cJw+1Wq1pSnrM4WyCYySQaHi3oTngUFaXvxU7v3Nf97sPAsELpnH9sAk0to/bZFyFj9pdX5m3zmKxpZ7N1y1lDRxyy98SV4n5iO9+od73AAXIbMJPDTzzMd4MdsCyqJyhTHI0uZmvexd46w1FvKWOieewfiQGmBom0pwoCt5ooi7TrNCn/4EJbZvuOLOz3xhwRF3gGfXwg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7noouuHKXY6n4PScEWntYvGVIvtyuDosGaeoGAF2I38=;
 b=R3lrvDoOLqKpOJZJySiMDbc4OyJ1QnsvgDeIYExGX6Joz28Nh1vMD3yl7dcdDiyg2uoC2Ze/ePIdskMpB378PyDnmXIJjQy8WuzbQxf5yn1X460WyLEpmM5eRN/fIa2HuHSlg3I5xLmdBudV4nDq6+sbdMVxB4OQHjmV4abPw2c=
Received: from BLAPR10MB5138.namprd10.prod.outlook.com (2603:10b6:208:322::8)
 by MN0PR10MB5958.namprd10.prod.outlook.com (2603:10b6:208:3ce::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6111.9; Mon, 13 Feb
 2023 14:58:19 +0000
Received: from BLAPR10MB5138.namprd10.prod.outlook.com
 ([fe80::8a7d:60c:7965:98c3]) by BLAPR10MB5138.namprd10.prod.outlook.com
 ([fe80::8a7d:60c:7965:98c3%7]) with mapi id 15.20.6111.010; Mon, 13 Feb 2023
 14:58:19 +0000
From: Darren Kenny <darren.kenny@oracle.com>
To: Alexander Bulekov <alxndr@bu.edu>, qemu-devel@nongnu.org
Cc: Alexander Bulekov <alxndr@bu.edu>, Stefan Hajnoczi <stefanha@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>, Mauro
 Matteo Cascella <mcascell@redhat.com>, Peter Xu <peterx@redhat.com>, Jason
 Wang <jasowang@redhat.com>, David Hildenbrand <david@redhat.com>, Gerd
 Hoffmann <kraxel@redhat.com>, Thomas Huth <thuth@redhat.com>, Laurent
 Vivier <lvivier@redhat.com>, Bandan Das <bsd@redhat.com>, "Edgar E .
 Iglesias" <edgar.iglesias@gmail.com>,
 Bin Meng <bin.meng@windriver.com>, Paolo Bonzini <pbonzini@redhat.com>,
 "Michael S . Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 =?utf-8?Q?Daniel_P_=2E_Berrang=C3=A9?= <berrange@redhat.com>, Eduardo
 Habkost <eduardo@habkost.net>, Jon Maloy <jmaloy@redhat.com>,
 Siqi Chen <coc.cyqh@gmail.com>
Subject: Re: [PATCH v6 0/4] memory: prevent dma-reentracy issues
In-Reply-To: <20230205040737.3567731-1-alxndr@bu.edu>
References: <20230205040737.3567731-1-alxndr@bu.edu>
Date: Mon, 13 Feb 2023 14:58:13 +0000
Message-ID: <m21qmtr4sa.fsf@oracle.com>
Content-Type: text/plain
X-ClientProxiedBy: DB6P18901CA0006.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:4:16::16) To BLAPR10MB5138.namprd10.prod.outlook.com
 (2603:10b6:208:322::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BLAPR10MB5138:EE_|MN0PR10MB5958:EE_
X-MS-Office365-Filtering-Correlation-Id: a797124d-4f8a-4b44-8ac9-08db0dd2be02
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 5tfl48bQ3YZHNvWLNRHq+mJ2SdXbXXWD7CoH6dBmQ0vGJhKwhMjU1WgEQygWJRbl4o5q77gwQs2ylYGbmptZREeBVh66p705nihcKRUAStqgFgk8xQRI9tpAeVqJct0Ys1nGDoliYeZAwAiwfzgnCa707xD28pK9/zeRNBfFFPqshL2Gymf4rVPftuRhqYamEOLGVoKFGSs1P1WO+0eh/tcPYdPn4ipW9Em2dISL53ftRLPSoMvO5pFMaR2Dub/ZO+xhi+4wYBuwYu8Zy89hNI18/CjgwC5DaaJT8YY4zP+5Iq5NnyYr6QiOGziubJ0vDL/1mkHNCbGUjOdlsHZuiIqBxKC06wM1E2D2UCr4uDePMZ9LoOoPn1zHtfq2y7M2rP1m4eEtlGPs9X7aBAzh2pbyjAZRT3ocISdxsfbsWTJUViEYDx4sY+Fsnr/sQqbHT+Djh8vzwK+qEu6mFrrY68N2HF2wfE0npsXO4gNQqDjg2NMDkHJExeHeEb6RuepooOMIz7fjiPrd95Zxus/1WiepIq2ZMw5ea29Neil6tzeGUp/YKC9zpEfysgjpjeKwmpXTLo9M0nGpzCwAUPXRY4tzYy3xd/cal4CqnKx3e72avGV+HNWoA/qTSIaXciS2NRsAPoCkybJN7dHboeysaQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BLAPR10MB5138.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(136003)(39860400002)(366004)(376002)(396003)(346002)(451199018)(316002)(36756003)(2616005)(41300700001)(44832011)(54906003)(66556008)(5660300002)(66476007)(66946007)(2906002)(7416002)(8936002)(8676002)(4326008)(38100700002)(86362001)(478600001)(6486002)(26005)(6506007)(6666004)(6512007)(186003)(83380400001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?9ztDcnfRRCrcSxubkpJPes5ukyMkj3LCrKV875lUbVW3V8L4X90Qrfn9Rfwq?=
 =?us-ascii?Q?cXguLOBeJvtiYITDsrjKUkq1nm5TSL0pEPR7nWjjh+gaT4ERynEyCcoZpa7/?=
 =?us-ascii?Q?ggKjWA3xdN1AgZ7hAdvVnbhCOBx7+9xpdSzrcq7BwxoMyvNltitrGikdx/tJ?=
 =?us-ascii?Q?6Rg/1QHORqC8FokB7pTm5aqun6pTsk/RxMKBVqp5UxhVyX2sqdEfCx9lnbLM?=
 =?us-ascii?Q?ZGiB96NAcGoqBTJSW/3bY1mGY02f9BOqLicOgWiQZ7T4WFL7H6GUYo3ywFqf?=
 =?us-ascii?Q?btGPgA7z4a0KWouGDcQ9gCWcE6JEkUMd8CXgHRoFlRD7BCtrM89KwlspExHl?=
 =?us-ascii?Q?BFGZbRasa8C10CputF/WxfGnkJT9LGgq7sUWatv+prfckJsE4eBUAp+KjRTl?=
 =?us-ascii?Q?iQU0PTpPNMVOv9IN11gwl/pcBo6guCqwhTD/tKVlxPjTpTF3Bon4zD7bTPjJ?=
 =?us-ascii?Q?qmRrjPHDVGs7Ypm3R/M62ClM2UnPRfHi6HGEj4+XzOD1M4qfqM/nnQe4Kwam?=
 =?us-ascii?Q?UQyiTWgYbwWM6OvcaGN0E2sQqWtfwhiCfX7oJxGI2k6Rsss2gdP+duQnW4pb?=
 =?us-ascii?Q?vcXxBipMfq3HpMavTW4hFZsOH3ppf/f7VmTgBhvGRmaC2MxPOS8/TOUzcjmU?=
 =?us-ascii?Q?PMWXB0ZLJbdnALfoOMUyGD1119lBKvPkTpQtR92NW+XauSziJj3hZ7V+YqYw?=
 =?us-ascii?Q?2/idSjWe1pSWaLevP7DDFXUX2qhZnfVzo389gj/3TpzfgGfhu4Rs49uDWEcY?=
 =?us-ascii?Q?NQsfDx/cVKj+O6X0NLod5Pq79k1Cdc8Zt5GL2cRjZB+vogrdcDe87HXIAZhu?=
 =?us-ascii?Q?uZSy/OUYgvs5KkvfOeo0hftcVvrPbWpN8gjMBm0bGnpXEPBxgBcqkOUm13WJ?=
 =?us-ascii?Q?MMHvw2Q5UAcOB5dXi1OKzwR/SnJlZjk6bdDYWPCqDPRnpyyWVs4D4N7N+4hk?=
 =?us-ascii?Q?oJdq3I5VFJjLi6+F02w0aMty93K56cS3jawr8OX/5tqd1fV7J8vf777YrF3Y?=
 =?us-ascii?Q?vOAB0fCRdm3fRtN2X/DtElm9/+x/joC00eIdMK0nTnnTymXvfLATGVRYprqE?=
 =?us-ascii?Q?Vijci+MKre2zIIGoUyR8yFyrCzuMtHq3kIuywj+3a9hfCG7g1QzTGzLwKOYZ?=
 =?us-ascii?Q?wur7CogJUIm/6IuFmHGdnx8+oLt9n9MZHn+YQJ/KpsSzCEeAxaz8HkyKP9w6?=
 =?us-ascii?Q?0UJlEGmmyXzJy9bKGVORJngr4/qHlhXgR4sEm7NA7cC0gEsPdrTtdQgSdzcB?=
 =?us-ascii?Q?6M+UopqrTCsuaGfRmBFvXuTg+LJfZQJC/yYctub/fs2no7vdXNVDmTf+N18X?=
 =?us-ascii?Q?PKK8sAqi0mMjV9Y3OLTzD3+ZNSfDWSN6l0aVG206Sj4luA1jPDnL9vlCLKls?=
 =?us-ascii?Q?3l1KCVe9zAIJiZarpTXuwjk5jKz/M/UJCFTcPNT2zXtEXGaxWa2OD7DGZGyx?=
 =?us-ascii?Q?RI9XKspk/CbnG4Qz9A20KwW+TSFZmokmpcRTtMxsfarqiupHRzmwbYQWFffc?=
 =?us-ascii?Q?p+1mRusKlVtZhxfYnucqQglXoxD/w14R5L1N0CbaOgW+I61m/zIlemhlY6oP?=
 =?us-ascii?Q?3sZICaG6+rBSpv61PZFCUeOG1LRwwyrz8PNbfiVSc8QEYiqdmszT4yQrv9MX?=
 =?us-ascii?Q?xw=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: MwDgRIxHnsVSj1H187mK5W5bpVKp1uU1Mw7mXxTHi+k8R5QgO1oqy4GArIb64PuUNPvIo3NnwpArGMYuIbYK8iZOjCx/23TeZVX5CZPsItDB2Nme3XaQwRkrkdi9ZS7X8aY8bqOQbYA8emfBDmdqIbdxywyTzj1yGTqyHbFkqGXBqO2KCn2kz+bz6ynVgeAgXOSnPFYTNTqq5mRlkOIsfEJ+cqkUGVRJOI5Af/NZCodMr5Yh6NfzNir6AmIjkd+gsX+I9LuqVjSqVuFRgjuv+FfLpCLPaqvTJerEU0o6jbfcnp0wjUq11WTQ1S9U6C9CarrMLzde83SlViSMYuvJoPtLB1ib3C6o+R1vniwNd4ANs/Bsq+UMTE9dowqlDZmN2i3i+GoiUxjR/TTNmofNWcEgu16qH34s44yoyj9MTjkKCeO8KXFWkHBdVjC0pyc6gtBsr/KkPas4KiPzZnSAqg0yNJWEAd7V7HFWsLW97DFfrhXs6ZDAPYLTvxfIpYN7Rtf5K0t2v/atrtMeCHnENbWM+WeQ+AaV0WWo+hnki6bh4gLQdLgAPcOPLxVi4na95AEOQ1THU3Zk3uJ04NaNHyDkthrT6F57kceef3YAj/4WBbGatJTvMOEh/8lFqU10ZktmCLM5H/hN0BRuljwf1glMzhSKacZbnGjJdll0nZz/T767RMofDj956dAvcD8RusvpZhR0iD2kP4QloAhNjc2bAZ92L6l1mHufvhhfK0pCitktPqKuAGXfMowRNl1pnFp0a5A7Sd5juZIvEH3czP5vhCraU4cZtOpZXLcAdaT9HwncaKIUGzydVfiwkGzSqPcpZugq7SWROAcBhKZdAiWfKGqTEH2DKL+n25zZTN/lKRhrZ5LGjcza5HH1WrKd18frqXRmwFEWQcuemXUlh7EMTtZlHKwyh2pifbPqfOs=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a797124d-4f8a-4b44-8ac9-08db0dd2be02
X-MS-Exchange-CrossTenant-AuthSource: BLAPR10MB5138.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Feb 2023 14:58:19.0343 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mQSDKWrk/6Vwh5ujwAIb0M7wBF+aV+ZGCuBaAzj/yAfTBjVf61DidwtiHGc4Lv4A8xbLtgXeC88z3FWZ14n0Kg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR10MB5958
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.170.22
 definitions=2023-02-13_09,2023-02-13_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0
 suspectscore=0
 phishscore=0 spamscore=0 bulkscore=0 mlxlogscore=999 malwarescore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2302130135
X-Proofpoint-ORIG-GUID: wIGOZ_1EmbOPDMu7K2k3fOgodJMIfUQd
X-Proofpoint-GUID: wIGOZ_1EmbOPDMu7K2k3fOgodJMIfUQd
Received-SPF: pass client-ip=205.220.165.32;
 envelope-from=darren.kenny@oracle.com; helo=mx0a-00069f02.pphosted.com
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

Hi Alex,

Everything looks good to me, I don't have anything else to add:

Reviewed-by: Darren Kenny <darren.kenny@oracle.com>

Thanks,

Darren.

On Saturday, 2023-02-04 at 23:07:33 -05, Alexander Bulekov wrote:
> These patches aim to solve two types of DMA-reentrancy issues:
>   
> 1.) mmio -> dma -> mmio case
> To solve this, we track whether the device is engaged in io by
> checking/setting a reentrancy-guard within APIs used for MMIO access.
>   
> 2.) bh -> dma write -> mmio case
> This case is trickier, since we dont have a generic way to associate a
> bh with the underlying Device/DeviceState. Thus, this version allows a
> device to associate a reentrancy-guard with a bh, when creating it.
> (Instead of calling qemu_bh_new, you call qemu_bh_new_guarded)
>   
> I replaced most of the qemu_bh_new invocations with the guarded analog,
> except for the ones where the DeviceState was not trivially accessible.
>
> v5 -> v6:
>     - Only apply checkpatch checks to code in paths containing "/hw/"
>       (/hw/ and include/hw/)
>     - Fix a bug in a _guarded call added to hw/block/virtio-blk.c
> v4-> v5:
>     - Add corresponding checkpatch checks
>     - Save/restore reentrancy-flag when entering/exiting BHs
>     - Improve documentation
>     - Check object_dynamic_cast return value
>   
> v3 -> v4: Instead of changing all of the DMA APIs, instead add an
>     optional reentrancy guard to the BH API.
>
> v2 -> v3: Bite the bullet and modify the DMA APIs, rather than
>     attempting to guess DeviceStates in BHs.
>
> Alexander Bulekov (4):
>   memory: prevent dma-reentracy issues
>   async: Add an optional reentrancy guard to the BH API
>   checkpatch: add qemu_bh_new/aio_bh_new checks
>   hw: replace most qemu_bh_new calls with qemu_bh_new_guarded
>
>  docs/devel/multiple-iothreads.txt |  7 +++++++
>  hw/9pfs/xen-9p-backend.c          |  4 +++-
>  hw/block/dataplane/virtio-blk.c   |  3 ++-
>  hw/block/dataplane/xen-block.c    |  5 +++--
>  hw/char/virtio-serial-bus.c       |  3 ++-
>  hw/display/qxl.c                  |  9 ++++++---
>  hw/display/virtio-gpu.c           |  6 ++++--
>  hw/ide/ahci.c                     |  3 ++-
>  hw/ide/core.c                     |  3 ++-
>  hw/misc/imx_rngc.c                |  6 ++++--
>  hw/misc/macio/mac_dbdma.c         |  2 +-
>  hw/net/virtio-net.c               |  3 ++-
>  hw/nvme/ctrl.c                    |  6 ++++--
>  hw/scsi/mptsas.c                  |  3 ++-
>  hw/scsi/scsi-bus.c                |  3 ++-
>  hw/scsi/vmw_pvscsi.c              |  3 ++-
>  hw/usb/dev-uas.c                  |  3 ++-
>  hw/usb/hcd-dwc2.c                 |  3 ++-
>  hw/usb/hcd-ehci.c                 |  3 ++-
>  hw/usb/hcd-uhci.c                 |  2 +-
>  hw/usb/host-libusb.c              |  6 ++++--
>  hw/usb/redirect.c                 |  6 ++++--
>  hw/usb/xen-usb.c                  |  3 ++-
>  hw/virtio/virtio-balloon.c        |  5 +++--
>  hw/virtio/virtio-crypto.c         |  3 ++-
>  include/block/aio.h               | 18 ++++++++++++++++--
>  include/hw/qdev-core.h            |  7 +++++++
>  include/qemu/main-loop.h          |  7 +++++--
>  scripts/checkpatch.pl             |  8 ++++++++
>  softmmu/memory.c                  | 17 +++++++++++++++++
>  softmmu/trace-events              |  1 +
>  tests/unit/ptimer-test-stubs.c    |  3 ++-
>  util/async.c                      | 18 +++++++++++++++++-
>  util/main-loop.c                  |  5 +++--
>  util/trace-events                 |  1 +
>  35 files changed, 147 insertions(+), 41 deletions(-)
>
> -- 
> 2.39.0

