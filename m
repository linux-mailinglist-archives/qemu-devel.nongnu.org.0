Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1381769483E
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Feb 2023 15:39:34 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pRZyd-0003uu-Ax; Mon, 13 Feb 2023 09:38:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <darren.kenny@oracle.com>)
 id 1pRZya-0003uZ-TP
 for qemu-devel@nongnu.org; Mon, 13 Feb 2023 09:38:40 -0500
Received: from mx0a-00069f02.pphosted.com ([205.220.165.32])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <darren.kenny@oracle.com>)
 id 1pRZyY-0004tg-9p
 for qemu-devel@nongnu.org; Mon, 13 Feb 2023 09:38:40 -0500
Received: from pps.filterd (m0333521.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 31DAQUrf011946; Mon, 13 Feb 2023 14:38:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : in-reply-to : references : date : message-id : content-type :
 mime-version; s=corp-2022-7-12;
 bh=GlQEEJHPEOwbKBgnZVA4s+3n44xQBnfIlQ9F8HOfOcA=;
 b=eINKWCgvu/z85DjfQrJMcxWLDp2G97mm0/fWVUk0M6XLvYxqLa49jfaenYXshtjRaFfT
 f7fqclxQcMbkxKryRRQVdmS7uJO4PtWjoEeiFnkqU1ou1SXp9Gbx/zYXnr2LirDTu9x8
 AoS69/BJOt01h5K7FfYrFLnr4sN9Nq1x9Qzhlp2w6pG2XFDuupz+Eh/mUTZIUHTKPB5m
 VRUCkErPqVzLCgTa/GiqFtsDTB+mjFhp4YoRQbeRHqgT5Uc71DvJL9wYwMXBwKjxBccF
 atZ/JxbvTEWKNrRwTZWhpx3Jd891ahFL74srQHdvxp+7bILVnca+WgvJeisKO60fIY8q Mg== 
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com
 (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3np1xb2xfy-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 13 Feb 2023 14:38:35 +0000
Received: from pps.filterd
 (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
 by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.17.1.5/8.17.1.5)
 with ESMTP id 31DDoxWb017956; Mon, 13 Feb 2023 14:38:34 GMT
Received: from nam10-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam10lp2108.outbound.protection.outlook.com [104.47.58.108])
 by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id
 3np1f4nm8w-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 13 Feb 2023 14:38:33 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dGei3/NVfo+12g/5gj0NteG5xRoCQL0mHtmdWT2wmLm8Z8lriCrp7SONb+fB/nIYleUKxonXXt9EdFlKDePnjlhzUsz+mZstO+1dM/3npysPKwIRRljTfSXlzwYFxwlqIZfCEgUWKTbeAU9wTIoDqHw7gRUWtrNDOzs3PLEAyR4+uREC1X2xRB7B3pFk1RB81YARq3+F1Gjq265nsOD8fn9T1fypyWibqeInnoyXptXkVPSN6wsnjOuVkYUVOjeHB7WPf5vg/Tx3FF66zuGiMFlcSU/dqqKZaTkumoxbj/id39c/H+hIziokaZkHic3gZlBxRWxmwRmzzJQzJhwypw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GlQEEJHPEOwbKBgnZVA4s+3n44xQBnfIlQ9F8HOfOcA=;
 b=NaEJafTcWgyZs+x3rjNmnPI31Zpewh0TS/iCoYvFjKzQGa2Fg8D+nYWUcnbkTmKNdy1icpcD1RtL/+kZ1SsQCXARkI/wJOuZYSmlUpJkzSXkE7FVhW6ej6oAiZV1MLMyMdsLitxwDA9Tb+j5kc6IFAcWWGuZZ//KAsfsqlXEHo7+mskw6w2xe2+6ZGMpxjukSf0yM6UDm40abcQ7UMoagrPnxlVYHnZXrmpcep0KOnX9/uJmeFTiTL9xd6OSSzcyAl/MhPmV0QgEYOJnoPN6uyy2mHx9TbyVeSk6ZCQdcDvZWfNp/g7nKJ5PMpzA3z+Mt5i82rlYN3X49Iy8fuSgig==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GlQEEJHPEOwbKBgnZVA4s+3n44xQBnfIlQ9F8HOfOcA=;
 b=EZGBCEhAPI2G136f5FxnkgtaDPGP7sLoE4SrPVc+WBljPTkPrBLkX4dTjPFOSH37lVnSt4T2/wKYqSEXilIwgRkMe8Wc3oHuhxQwLu8RwH++Qrq1wFxi/R61qybbNNXxSv73CofY/JGQ1ouFzi9b7gvRUFBFhK0TFpqQouMM9wU=
Received: from BLAPR10MB5138.namprd10.prod.outlook.com (2603:10b6:208:322::8)
 by IA1PR10MB7262.namprd10.prod.outlook.com (2603:10b6:208:3f8::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6111.10; Mon, 13 Feb
 2023 14:38:32 +0000
Received: from BLAPR10MB5138.namprd10.prod.outlook.com
 ([fe80::8a7d:60c:7965:98c3]) by BLAPR10MB5138.namprd10.prod.outlook.com
 ([fe80::8a7d:60c:7965:98c3%7]) with mapi id 15.20.6111.010; Mon, 13 Feb 2023
 14:38:32 +0000
From: Darren Kenny <darren.kenny@oracle.com>
To: Alexander Bulekov <alxndr@bu.edu>, qemu-devel@nongnu.org
Cc: Alexander Bulekov <alxndr@bu.edu>, Stefan Hajnoczi <stefanha@redhat.com>,
 Bandan Das <bsd@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Thomas Huth <thuth@redhat.com>, Qiuhao Li <Qiuhao.Li@outlook.com>,
 Laurent Vivier <lvivier@redhat.com>
Subject: Re: [PATCH 04/10] fuzz/generic-fuzz: add a limit on DMA bytes written
In-Reply-To: <20230205042951.3570008-5-alxndr@bu.edu>
References: <20230205042951.3570008-1-alxndr@bu.edu>
 <20230205042951.3570008-5-alxndr@bu.edu>
Date: Mon, 13 Feb 2023 14:38:28 +0000
Message-ID: <m2lel1r5p7.fsf@oracle.com>
Content-Type: text/plain
X-ClientProxiedBy: DB6P192CA0015.EURP192.PROD.OUTLOOK.COM (2603:10a6:4:b8::25)
 To BLAPR10MB5138.namprd10.prod.outlook.com
 (2603:10b6:208:322::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BLAPR10MB5138:EE_|IA1PR10MB7262:EE_
X-MS-Office365-Filtering-Correlation-Id: 17ea4e57-73d8-4892-2fb6-08db0dcffab7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 8ryJw44jOLqeYHNTBfq7MCp8CIsWpGxpu92JHuCAySK2pgQtlPZ9vmkl8feVX7Howkp8/WVYPEJQDPzOZd3igzU2gnyJiXTh7s6GGUdL23xs0D17bDh8rG1oFL6mXhf6jB1BI0aGf70X5xUvpBStL3HVq8VxTUEK2CKemzz+Xkn6QmaAvrpSKSMaTCem5gkZpHa9ktn6De4UcEtMStPRXFWsp3BxGWgP650XHFm8BV1PPy1su4eeSrq2miAs/dVUemkGBqfNXg0lk/pwXCCaEW51W30RwEiqSBVlqv9K2AlPk5QM5nkY/gvUXHLDB4/27J9ycO7SEustwzq0VIsbbcq1gHzKfc6WUsFkMLKbgkIfWkoU2A3gtOdME0W5h5LvEOVHY7Ui08ZafhtqNaE5//5zCek2rFRFNNVpy5rQnaxXIZAEjrRrPvVIBrSqTWvCpxHq/G01pJchETyUJJzrMSd7wJ2H5uVlbtJmzUTadM2zR5UWiIhVkrNzmLDejr/TedO6cxHmKPQewSjkz8aAIKw6H2rGsbE99kS8cxyeo8M5BKitdA/0QjlSkWEOMK75kVBKLVBCRjknuEO1DG1VRN6AvXoSHwbFuRyXNzm/H901ihQJH2ZHh735+rB+or1wzVC4d6Mnvm30Oknk8uChz+8S+TBLRzNopoQQgQg0hBGRgX0mZkOnE2p/PJAhrNIf
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BLAPR10MB5138.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(366004)(136003)(346002)(39860400002)(396003)(376002)(451199018)(478600001)(6666004)(6512007)(6486002)(26005)(186003)(2616005)(54906003)(83380400001)(316002)(66946007)(66556008)(66476007)(6506007)(8676002)(4326008)(36756003)(86362001)(41300700001)(8936002)(5660300002)(2906002)(44832011)(38100700002)(41533002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?1RRvIHw6mn56iCJKwN8RpJGb90HIIQTdB7Q6QRGDHpBnWFyoPqc1oIsfdN5e?=
 =?us-ascii?Q?Dd7VS8Jo3n28zl6jicHOU6K3pzMn7nquPmUaUkrkQ61vcrWhIAV0cRnpIx/3?=
 =?us-ascii?Q?SYfpMf6D+ac6TskHX9cb5yLAvqOI06Wxs887huYC1FGlWFbee1JZjz15sM7Q?=
 =?us-ascii?Q?cwRHCxC9UNn645qtgjDdnM4vpkwjuZVhpqtF3Fgae+oCsreYU6uoZvq8l7Zu?=
 =?us-ascii?Q?Ze+h+00L+zfd5nfbk8wCFEcu0JGCDyuGvXLHvt6MU+FDJxzmVgrd1I4TQeOy?=
 =?us-ascii?Q?wd2rIwI1N1WK+MNAf+NgCdWPODfMxafEJcZhqwS+bruX22HETL9ECGGd1EzC?=
 =?us-ascii?Q?pxwYmzg9YqIbYUIv8KRu81J9Rdc/tRHDYv+ZKiePQ77aEjGux+Jv22DYHoWb?=
 =?us-ascii?Q?i28B7KJ+8jijc2rJ5lC/mP23IACex1msgL6FD92WpgiwI37h7EzJzu4sOlzi?=
 =?us-ascii?Q?bL/MXPqQjNkE6rjgdm8j7hKfEjC6xrYGF7UC1m9t3R00VbKtm9gulQVDZuOs?=
 =?us-ascii?Q?ELTEQaR1dn7DARaAGfnGq12EtO9QszFoAOKtIk8tXM/LijqWMFnuFyB5B63c?=
 =?us-ascii?Q?/nI6P3game9Dr6cYSR0F0ZXQUuMIqLaW3XrJr8c8dOq2Cfif0VCj7mpCcs9/?=
 =?us-ascii?Q?XEzvFAoaiSCkAdj/jZwMUT8VZb7S0xQah1JIvCOHdHDnO9b8gPUNmZhyM+7/?=
 =?us-ascii?Q?GX53s+u3F2BZD+umaTEwM8LV3ZKPxN0tXWk3lBRz9xqsw9kwrwNi8QJWeQXL?=
 =?us-ascii?Q?gA5H85GDOkworTmXcdoKPFBsLcCs9+zDOFGLinFrn9OC/FNpVSFPlN65h23H?=
 =?us-ascii?Q?rJDjq7MpBYKVW6fVcfjs45M0aKLECGiQmclwlKyiiBxNlmDRpKoupYzocAvl?=
 =?us-ascii?Q?lhYMUrRBkIsvizADffvlACYiuQ4FCqDU7duNnx/cnrL01eCzYmJ/E6Di3QQm?=
 =?us-ascii?Q?/n82APbRKmTrv6z11TTVkJhRjOv4mKKlj7KjYkqir8Ot/iXQKx6n0vkQ1FXz?=
 =?us-ascii?Q?cwEvuwKFbzlFE/hox2lWEN602gNl7pTSZhS8BBvG/1yg0/9EPctq7zsp3cCI?=
 =?us-ascii?Q?puau1NwWVvnAAsiPDooLJP/8xfqupLeGp6xGTqmyzTXc7wz5bBsmGa57AOnx?=
 =?us-ascii?Q?9ksngIZOvVxRpFIF7yXBmf2vSFkCnB+UlYDnUB/+PnooKO3gUDp9lbjtQnU0?=
 =?us-ascii?Q?vmPP9bb5cHWwuiEU42+Bn8seU1jS3PjREkEze6v91iW5yl2jXMlzZKd5pune?=
 =?us-ascii?Q?LHZrkGAGEQbFXOVlGj5h+AmpvnrTQKSImWEBgqy+qYp/ILfI5aTyDwBdw0ym?=
 =?us-ascii?Q?PH4iOUUlZMpvq0oT/T2MZovsVREfJc0WpmCL8z4Nc4GxD3zSI5UMIkbMgrLV?=
 =?us-ascii?Q?FbyQGbjL+sC04v98EjJavJRzYR1WOqt1ny+ks2CXBFCYKWWsx9mTBDdI8T87?=
 =?us-ascii?Q?DJdR63IOMx+Iu9db58nzih5YhDnXai3fB0FIONag9i14/iz1x5Nqlor6DyPE?=
 =?us-ascii?Q?PR6DVVJHqAtxOutqaNoBgLggLpXSyc/8/fKcUQuquZLOjcXch/0P9qS3wHlv?=
 =?us-ascii?Q?lWiq/bOenSYhb2l+AqPihVJ8TNglL8fgqz7zCQGTCRvuDl2zPr8Wj08YwjKs?=
 =?us-ascii?Q?jw=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: vEHKurCP2hYEvVSJbs5LNps224fgoiJg4fEfOfyaH23gHLLQ+kqxT8oCZUv1aM+Y/we0ymTiyTBnMhI4+SxFCRT89rhu7qZ9uP1CWqLvLTxyIvGQm6JVpnb6zIwxgbqS0HdjUb1mfe31wZq+Oq+ZN2m76YyVhWD4+wfbNA6/YX5G91CQ+JoxUra5b2AekhcO8vQJnrDpGQkdb6tRcD1a67A62yCsBaOzmy7PPNNDvpmfLOOWa1rlXfckdI0D9o4zurvjUVsQCjg4/UtDLdgai0HjH2Dxe9C/p6FTYhahFxGFHy+UrnSn2e2mjDOY7YfucR5Cma2zWw6GMyqKjVTkVGPq3hXLCii8cAibjHsaWMnrXyKIGqgNq3ssqgyB96HoiPKrOaiu8XKyudtLpT+p0zUaTcRFoE1moLBFuSfqAnNNlSnBsiE+vUpN4wek5v5/cF8e+grjbW3FeL7I6+pFP9zauEKo91wKDax6UcxXSVIWuMkFamC3OH/pkEr2xfXyVoNr0B6VlOvTDwLgiTVrTEip9+3uKzqePacceVMUMo5eqco1gioTdKr6c7PLWf2Y1qCooPlvXBLpk7vrHPRSZl7pq5jqr4sUr/xZHTirPL6gCZsmWIf94BMlLaltyrHVeFE9h7lJFcbrQEjHBGzkHrUJ+pGKvzm3hUbnM1I7t2EU0wxKIC8Kobuga9sBCudJnfFOjPS4FDnxEZC97Pc0TgfRQEjtLQeOdofIis4dg+VHyRNe8jFZHIjt9CJjTuZjFW4Awr4zzmlbpqILhe+w3e6q3mqJGTmCscnQXbq+IeeH/Ms3jYShmcm7SX/nfe9lWUvWmqZ+NyLljtTbzlHWXw==
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 17ea4e57-73d8-4892-2fb6-08db0dcffab7
X-MS-Exchange-CrossTenant-AuthSource: BLAPR10MB5138.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Feb 2023 14:38:32.1257 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: n1l3wWVKqUQpx0D5YkEghbVQfeZ/wRXSKMpWlUESbaHWZUo8jzSCwnhGx2L/4yKCX5is/fmMk+XaZMkta21+Yg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR10MB7262
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.170.22
 definitions=2023-02-13_09,2023-02-13_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999
 mlxscore=0 adultscore=0
 malwarescore=0 phishscore=0 bulkscore=0 spamscore=0 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2212070000
 definitions=main-2302130132
X-Proofpoint-ORIG-GUID: 7GPpmKxpQ6oYq73D8J_4ZI_ZPY1npG7n
X-Proofpoint-GUID: 7GPpmKxpQ6oYq73D8J_4ZI_ZPY1npG7n
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

On Saturday, 2023-02-04 at 23:29:45 -05, Alexander Bulekov wrote:
> As we have repplaced fork-based fuzzing, with reboots - we can no longer
> use a timeout+exit() to avoid slow inputs. Libfuzzer has its own timer
> that it uses to catch slow inputs, however these timeouts are usually
> seconds-minutes long: more than enough to bog-down the fuzzing process.
> However, I found that slow inputs often attempt to fill overly large DMA
> requests. Thus, we can mitigate most timeouts by setting a cap on the
> total number of DMA bytes written by an input.
>
> Signed-off-by: Alexander Bulekov <alxndr@bu.edu>
> ---
>  tests/qtest/fuzz/generic_fuzz.c | 5 +++++
>  1 file changed, 5 insertions(+)
>
> diff --git a/tests/qtest/fuzz/generic_fuzz.c b/tests/qtest/fuzz/generic_fuzz.c
> index c2e5642150..eab92cbc23 100644
> --- a/tests/qtest/fuzz/generic_fuzz.c
> +++ b/tests/qtest/fuzz/generic_fuzz.c
> @@ -52,6 +52,7 @@ enum cmds {
>  #define USEC_IN_SEC 1000000000
>  
>  #define MAX_DMA_FILL_SIZE 0x10000
> +#define MAX_TOTAL_DMA_SIZE 0x10000000
>  
>  #define PCI_HOST_BRIDGE_CFG 0xcf8
>  #define PCI_HOST_BRIDGE_DATA 0xcfc
> @@ -64,6 +65,7 @@ typedef struct {
>  static useconds_t timeout = DEFAULT_TIMEOUT_US;
>  
>  static bool qtest_log_enabled;
> +size_t dma_bytes_written;
>  
>  MemoryRegion *sparse_mem_mr;
>  
> @@ -197,6 +199,7 @@ void fuzz_dma_read_cb(size_t addr, size_t len, MemoryRegion *mr)
>       */
>      if (dma_patterns->len == 0
>          || len == 0
> +        || dma_bytes_written > MAX_TOTAL_DMA_SIZE

NIT: Just wondering if you should check dma_bytes_written + l as opposed
     to dma_bytes_written? It's probably not important enough given it's
     just an artificial limit, but thought I'd ask.

>          || (mr != current_machine->ram && mr != sparse_mem_mr)) {
>          return;
>      }
> @@ -269,6 +272,7 @@ void fuzz_dma_read_cb(size_t addr, size_t len, MemoryRegion *mr)
>                  fflush(stderr);
>              }
>              qtest_memwrite(qts_global, addr, buf, l);
> +            dma_bytes_written += l;
>          }
>          len -= l;
>          buf += l;
> @@ -648,6 +652,7 @@ static void generic_fuzz(QTestState *s, const unsigned char *Data, size_t Size)
>  
>      op_clear_dma_patterns(s, NULL, 0);
>      pci_disabled = false;
> +    dma_bytes_written = 0;
>  
>      QPCIBus *pcibus = qpci_new_pc(s, NULL);
>      g_ptr_array_foreach(fuzzable_pci_devices, pci_enum, pcibus);
> -- 
> 2.39.0

While this will still consume the existing corpus, is it likely to
cause these existing corpus to be trimmed?

Otherwise, the changes look good:

Reviewed-by: Darren Kenny <darren.kenny@oracle.com>

Thanks,

Darren.

