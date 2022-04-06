Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3259E4F4B3B
	for <lists+qemu-devel@lfdr.de>; Wed,  6 Apr 2022 02:58:57 +0200 (CEST)
Received: from localhost ([::1]:49494 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nbu0d-0004eU-Sp
	for lists+qemu-devel@lfdr.de; Tue, 05 Apr 2022 20:58:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52914)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <si-wei.liu@oracle.com>)
 id 1nbtyF-000349-5w
 for qemu-devel@nongnu.org; Tue, 05 Apr 2022 20:56:29 -0400
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32]:47602)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <si-wei.liu@oracle.com>)
 id 1nbtyB-0007DV-Jt
 for qemu-devel@nongnu.org; Tue, 05 Apr 2022 20:56:26 -0400
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 235NRCub000752; 
 Wed, 6 Apr 2022 00:56:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=message-id : date :
 subject : to : cc : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=corp-2021-07-09;
 bh=2zfIKT39NpVpd8TBVJ+qyX7NbDYhxehmgUMaWG9dzDs=;
 b=WujBItWK6DAoeH0pRkW/IbLCrr7+9ut0COirU30NAkNDoYNiasLh6z8eQjN2CQ0Hos9C
 /ir1Z/nJx9N82MKiujYwBj+4zDwZe/gzBqLN/ei7R03QJfyq0IkhWZ01Xh1zkJSWgRZu
 YM3bL305HFQHGLNCklNB9Wyg+6HtkPClNMrGTBQqaIZeci+LtRxCuG9FcPcNq+xE7+3R
 aC/tKKD5EpaZRH40nRZl9ZyW/EnpJV1GJBZ9h7NyXyP6NCJ01QkAxci2elAj9hLY5XlU
 i8FqZyou1OOS76AgIT5jCwmTk/JtqWvoWNzDdNfLLJx5uv6oK4W3B6JN0IS00CnlfutZ JA== 
Received: from phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com
 (phxpaimrmta01.appoci.oracle.com [138.1.114.2])
 by mx0b-00069f02.pphosted.com with ESMTP id 3f6e3sqfd5-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 06 Apr 2022 00:56:14 +0000
Received: from pps.filterd
 (phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
 by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (8.16.1.2/8.16.1.2)
 with SMTP id 2360aNO3037474; Wed, 6 Apr 2022 00:56:13 GMT
Received: from nam10-bn7-obe.outbound.protection.outlook.com
 (mail-bn7nam10lp2102.outbound.protection.outlook.com [104.47.70.102])
 by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com with ESMTP id
 3f6cx41agm-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 06 Apr 2022 00:56:13 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BxwPSBRpgPtna3M5T8IXDL7VI6Dtg4SwoserNrDmNgwrTKpXNJfmE39RGvBqRHq0aL9yhaeBlUL7+42e3n+KBRVW9KuN5DFjHsBe9UYhpvbWRk2Kfm9PKB1DZg/rBMx5poLRagwfgWc2HFdlj2NECzyJCfoiqUZFifkygKTobsAtVQSUqMikrdWmxIsPrn7m5CApqxszY90uJdgWvyGVqfP/3sJ3CZrzW0WxaBPF9zYqn0iJwBUZtZsxnOWDEoN178hkzvQGt9WPP9iVvz/s67r/46XIQ3AWglj8QpiybCwWWJ3qOWA3oCpu0ASa3cSRraPDpFBxd4HhCXSlth/D4A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2zfIKT39NpVpd8TBVJ+qyX7NbDYhxehmgUMaWG9dzDs=;
 b=YBASx2FyKye3eeIr/ZoWFsCMgza7MAYlffASXGBmTq2uUqq1Y6vh7ydhW5bJXWIgC9CrCyoJkQ43r+O7LSSXQ1+LD0wpSKgm+PS9D35lWJxdUBOxdIHuh37DN/eZDpxQ5MazdhsWtCyXdLnzTuj5VWiTXD9o5tDMFOlYKv4jTX7QHMKlVQwHs1SXg+xoeZXS+90tX6RhaX8MK0SGCNp2plRCgl7waUU4FKng1R0sUqYwYd3iYdQz7AnWI4cD6J1yQjreWF4Rk6K3iC3U2lnUWFsC3xQgM3Jw9CyDaLHjC0FgmGD+HYXh63LQIl7X+/sh4F2X1E+BNiFADRgvos0zPQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2zfIKT39NpVpd8TBVJ+qyX7NbDYhxehmgUMaWG9dzDs=;
 b=nMf8ZEAZfE0ivpXZMfHjcC8yhhuAsxixN5hn/USe7a4LpMkG9OW9mu9ibb27HdFMpaL0yN+XyWighugpKturQ0T4jDYDQ2nSiatxszzvzeyENrQng1Y22HkOXZS1TqSiN3zclm+7A5wXFP1+RBD8YWygLF8Fy8GnOvnyJd/CuTI=
Received: from BYAPR10MB3287.namprd10.prod.outlook.com (2603:10b6:a03:15c::11)
 by SJ0PR10MB4574.namprd10.prod.outlook.com (2603:10b6:a03:2dd::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5144.19; Wed, 6 Apr
 2022 00:56:11 +0000
Received: from BYAPR10MB3287.namprd10.prod.outlook.com
 ([fe80::fcff:70e5:ceb0:4947]) by BYAPR10MB3287.namprd10.prod.outlook.com
 ([fe80::fcff:70e5:ceb0:4947%7]) with mapi id 15.20.5123.031; Wed, 6 Apr 2022
 00:56:10 +0000
Message-ID: <379df944-f46a-ecbc-3566-8776cfefa3f1@oracle.com>
Date: Tue, 5 Apr 2022 17:56:04 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH v4] vdpa: reset the backend device in the end of
 vhost_net_stop()
Content-Language: en-US
To: Jason Wang <jasowang@redhat.com>
References: <1648718713-7637-1-git-send-email-qiudayu@archeros.com>
 <1648776683-23739-1-git-send-email-qiudayu@archeros.com>
 <CACGkMEuQ_YW+aSysnFtDrjy=Wjq_U3KouOobYSC+e5+5SR0zEA@mail.gmail.com>
 <ab772bc3-4acd-bb79-7f97-0518e04bb7fe@oracle.com>
 <CACGkMEv8+XC39G4wK_bUY0ZdFd29YoR7D3ugrMy-iT7cO1arew@mail.gmail.com>
From: Si-Wei Liu <si-wei.liu@oracle.com>
Organization: Oracle Corporation
In-Reply-To: <CACGkMEv8+XC39G4wK_bUY0ZdFd29YoR7D3ugrMy-iT7cO1arew@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BYAPR07CA0014.namprd07.prod.outlook.com
 (2603:10b6:a02:bc::27) To BYAPR10MB3287.namprd10.prod.outlook.com
 (2603:10b6:a03:15c::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 92558e96-39e7-4061-25e0-08da17683da5
X-MS-TrafficTypeDiagnostic: SJ0PR10MB4574:EE_
X-Microsoft-Antispam-PRVS: <SJ0PR10MB4574A496EE71BD9581C2B62CB1E79@SJ0PR10MB4574.namprd10.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: VrVJT1o2LivqR2TZS+v/mbARR1v20cAf2ZYnOusELhruB9HCJNW/g1vyz4pDBrc2DUn0G+GDuR8ij15TGEjWefxhKtPmDPOLegR8UtGFRYjDQSqoJpmFhNBBDDFL3CqaATBT/qIO32uo5XAMkdlF8iRsVY8EdGpF2U08QdnTgUHaTAlwuclvhsmPvXOkcYhy8QiJ9KYttvFPra1PhTOo/BgWHe3aps4zBtyGUkLCn2bo9pzwqiQwQxcmW71xkuKU8p12ozu9zMEcf93EWzGfGwEzKvOvgqKhP3WaDEEq66eZwRZc/+B5Vd9ydPVtryE6k0rKv7m1omkcWMpCHyM5OMPP/i9TraG2TVFfWguYURAiquhnrIgQdn87AxfjfbvGE0Kn77S4mIlFiHvYJ2Lcr7xtGhXN3+pyZQSrdZp2Set+fFQyi3L1G4reTjX30dEs7jxLosXoILCIFEEbMzhYgxpSD9m8s4V4q6O9GkGtonN9FCQf7jSMw0AXRTBu7uvT9A+oLBVqmlO+BSYPiVd7uD1XhJBxcNZhbd190FVqKlhEFJfnbvSmj57hSa7Ouj0Mekkul9aNmZaNMsIVdZn+l6kJG/IZBiDVkdRTy3MtbZ7lO+9t2ButR0cF7Dlt5OEZ+ox1UIH9zPdiEZlDi/18gbF+m2MWXHb+tQMDsOSqRsMoUc75RjyfZawv9f2DmL3Mz8Yt1asoAvswrFRsT0EsDfZ4NiW7gp64PfgtcGde6VuzkruqR+P+EbZyW79TA+pcKltpUpgugIN7A9qPL0PNB5mSPMoVrlkJG7Fa+GGQO4k2S7urSxBY5Amh8G9HgyEQ0miUV1j0zFLhNF9WEHeW9Q==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR10MB3287.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(36916002)(2906002)(6666004)(53546011)(966005)(6486002)(6506007)(508600001)(8936002)(5660300002)(30864003)(31696002)(86362001)(186003)(26005)(83380400001)(6512007)(2616005)(36756003)(38100700002)(8676002)(316002)(6916009)(54906003)(66946007)(31686004)(4326008)(66476007)(66556008)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Ylh5bnBhUmJkcGZvNWYrcVlZd0dlOVZTWGJpMlFPOGJIVmVYUnM3VEptK05a?=
 =?utf-8?B?cDFvRkZOdDdHYk9kRWx2UkxIV0VLTHB0K1hzMnRRLzdDWHVYS1QrbCtUa09m?=
 =?utf-8?B?bnpUUHlkRkZUZUwwWXlxc2ZrMHZrdEkxTVRDVVpQM2tlYytTa1k4cVFlNDJn?=
 =?utf-8?B?NmgwU3pqOHJvaFc0ZWtGNEEzSlNQQkFzUC9LbG9lYUhKRkEwaVJGdFR5SHZT?=
 =?utf-8?B?anlCVElBTURRUDN2bGZ1QlhWUnpYS0ptNFpsUFJPYXVGN0N0ZmJjb1hFd3Vr?=
 =?utf-8?B?YnBaU1ZZVWg2R2ppSkVqdTZLb2l5V0MzRyt4Q3d2WXJpNmtZdTVrUDJMSkg2?=
 =?utf-8?B?OWJlOFk2QTJ3cU5uMlNyVTJFeDR6RVpISmZNM1E0cFZaR0FvTEJqMStpWHl5?=
 =?utf-8?B?ZmtlRnVRM09OZVhQM1Jqay9ES2hkWXBza29GQVdjaUhwMWpUSFNrOGVWZC9q?=
 =?utf-8?B?YmxabE9DZXAyMElYOTBVdTM2UGlVWldxc3BsdmN3eSs1RisrdDRwYTU2L3FJ?=
 =?utf-8?B?c3I2SWorL3ovSFd3QXprZ0huUDY1c3ZXTmF6Qy82MUtuK3dIWnlWWXlVVzhV?=
 =?utf-8?B?WlVUWUJUSmhXaFR0MDJHTGYrOC8zMmlUcW1yd3RrUlQ4RDl6dW9uUzh4eENS?=
 =?utf-8?B?V0Y4YXozTXgzQ0NyQW5xUk03M3EvZUVHRUlodFhmNERybWx6ZU1pTXVPSS96?=
 =?utf-8?B?cFBjZUkvOGJxQ0tKTHU5aUxDYWsxL0tiTE1EUjVIUWx5SHZXZzZlalZFYXlj?=
 =?utf-8?B?M0l3elFYL2lIZUJlMTJleVZTMUtqUjhrQVlmSFdNZi9SVmRkNVlVUDdnV1lC?=
 =?utf-8?B?OG1iMDlMb2tiMU1CQ0ZTdkJHbDVhQzk0dmc1bisyQWxKQkV5M213NjhqTnB6?=
 =?utf-8?B?MWgyTGV4WHI2VnpsRGFudnBaMTlLVFFjV0kwWlc2NmcyZ2pkT0tpRTRsYXVy?=
 =?utf-8?B?TUR5Y0YxdWUvc3RLSENZbUlQOW5yZXlDSWtGTTlDZDlrOXp1SlFSSzZpU0ZQ?=
 =?utf-8?B?dkN6NXk5NWgvQXlrdXBwZk1ob3huNnNJSU0vMDZtUmRVcTNvOHZKTE9NaXlm?=
 =?utf-8?B?N1Y0Y3AwRmMzRGkxaU02RXhscm5lTGZSY1MzRkhKdE5ISTdDUGVEZ3VPaHBB?=
 =?utf-8?B?elJHT0tzb1NpWHNiWDdZL29sTFBKZlR5MGFCeERaMVB0VmpKSFRCTFNHWlIx?=
 =?utf-8?B?eTFZUGQzSFN5NDZVZm9HaVdrcmh1NG5xeDUvUXh0RkZsV3JLTCsxKzZ2K0Ex?=
 =?utf-8?B?VkMvVUJYb2tzNEVvckQvbTNHcjdzUkxjNmRVVW9VcWdiVDlJY0FubWZHT1Yr?=
 =?utf-8?B?dkx6eVJsbWx0UGtmeU01ZG5VZ3BVc0l0YVhCRjFJMkFIYVBtalloanZDTHRU?=
 =?utf-8?B?c0JENmxvb1l6YTllRm1VbWxOckpucEhDS3NrOFBwRFY4eWkzYWtuK2FVZXZD?=
 =?utf-8?B?VTdhQlVDOEZMV1l5U2lMV25aSFh3VjlSVUw3c0tVQW9ITTR0OTNwbEVlMXlm?=
 =?utf-8?B?bzYvM0JzZENoeHYrY04zbk1XWmRKTU5NTHpqbEg2RWhmdm0wZFBxTVBsckxY?=
 =?utf-8?B?RFJwUk1iN2M1a2tkbHpROXk2YVFBWVhoZ21KQ0hKcVR6Zi8yWUJqOU1MWEFF?=
 =?utf-8?B?ZldRZEJ2V205U0Q3cDVZN0wwTDN1ei9zYXJKSnFJZDNTY3JHclVSQTFoMjFm?=
 =?utf-8?B?c2Nka0tpTXdVbmRseVZTa3R0S3g0dTlsdXVvdWM3R1dkR2lXN3ZmRmhLZnVx?=
 =?utf-8?B?Z0lDbnZjQ1E3Zk5zK0pjQzlkWmVSSXBiR0kvaEU4NGI2OUtwOHNpWW5sNUtP?=
 =?utf-8?B?SXV6R0wxMjFydHVnV2N2KzFUNUQySzhKV2lJZ1RQbkJzYU5DbGljS214VGts?=
 =?utf-8?B?SUtKSGNBTWlZbExkNHpRYXpvQUVxQW5pWGRmbzF1bVlvcEhidXJKVThOS1lI?=
 =?utf-8?B?TGVsZ1RVdmxIcVVYYkpHWTNzNHA2VHh5U21pWmFyVHR4UnBYRjJ6NFBzZmo0?=
 =?utf-8?B?eDZURGNGSllCekJRTzhrNmYvdjc3eEwyMm9aMk1XQ0I1dFRBT2ZWMURiY1dt?=
 =?utf-8?B?Z3pVM0JqWWRuWU5Fczd0THVERFovSExvYzdxejBLOTk5VTVhVmd1ZzBvV21x?=
 =?utf-8?B?dUJ0TmJxd0lQZFZlNkg5SCsxV3FuQVZpR0dySHBkUlU2UVB5bVhSZVhJaEtN?=
 =?utf-8?B?eVhRTjZZaWZJWkxNT0NzUmh0QjZFUTN3YjlMMFRSNEVyazR6bzQ4QmhDY1A1?=
 =?utf-8?B?Sng0dW1Sd2pvaFQrQ3FvM0dQOWJUMWR4d3NCV1dHU21xbG5DYmVXaVRQUmg2?=
 =?utf-8?B?UE03c1dIYkdVZzNCMUpVOEZEcDNRb3VHQ21TMndyVlh6MlYrdExIR0o2Vm5U?=
 =?utf-8?Q?RPYb1lZRv2RNm7xo=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 92558e96-39e7-4061-25e0-08da17683da5
X-MS-Exchange-CrossTenant-AuthSource: BYAPR10MB3287.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Apr 2022 00:56:10.8210 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: W1SlICUJjejupLQy2ZYOkEBblZk+pZMn0xQh3SRok25zo/4zSHQNt5LG5nvJ986suW5tQSeMKgvNpwd14+hNPg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR10MB4574
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.425, 18.0.850
 definitions=2022-04-05_08:2022-04-04,
 2022-04-05 signatures=0
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0
 spamscore=0 bulkscore=0
 adultscore=0 mlxscore=0 phishscore=0 suspectscore=0 mlxlogscore=999
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2202240000
 definitions=main-2204060001
X-Proofpoint-ORIG-GUID: _aqGLu_KHpL3MYHIQVYFaCob39Qylspi
X-Proofpoint-GUID: _aqGLu_KHpL3MYHIQVYFaCob39Qylspi
Received-SPF: pass client-ip=205.220.177.32;
 envelope-from=si-wei.liu@oracle.com; helo=mx0b-00069f02.pphosted.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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
Cc: Cindy Lu <lulu@redhat.com>, mst <mst@redhat.com>,
 qemu-devel <qemu-devel@nongnu.org>, eperezma <eperezma@redhat.com>,
 Michael Qiu <qiudayu@archeros.com>, Zhu Lingshan <lingshan.zhu@intel.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On 4/1/2022 7:20 PM, Jason Wang wrote:
> Adding Michael.
>
> On Sat, Apr 2, 2022 at 7:08 AM Si-Wei Liu <si-wei.liu@oracle.com> wrote:
>>
>>
>> On 3/31/2022 7:53 PM, Jason Wang wrote:
>>> On Fri, Apr 1, 2022 at 9:31 AM Michael Qiu <qiudayu@archeros.com> wrote:
>>>> Currently, when VM poweroff, it will trigger vdpa
>>>> device(such as mlx bluefield2 VF) reset many times(with 1 datapath
>>>> queue pair and one control queue, triggered 3 times), this
>>>> leads to below issue:
>>>>
>>>> vhost VQ 2 ring restore failed: -22: Invalid argument (22)
>>>>
>>>> This because in vhost_net_stop(), it will stop all vhost device bind to
>>>> this virtio device, and in vhost_dev_stop(), qemu tries to stop the device
>>>> , then stop the queue: vhost_virtqueue_stop().
>>>>
>>>> In vhost_dev_stop(), it resets the device, which clear some flags
>>>> in low level driver, and in next loop(stop other vhost backends),
>>>> qemu try to stop the queue corresponding to the vhost backend,
>>>>    the driver finds that the VQ is invalied, this is the root cause.
>>>>
>>>> To solve the issue, vdpa should set vring unready, and
>>>> remove reset ops in device stop: vhost_dev_start(hdev, false).
>>>>
>>>> and implement a new function vhost_dev_reset, only reset backend
>>>> device after all vhost(per-queue) stoped.
>>> Typo.
>>>
>>>> Signed-off-by: Michael Qiu<qiudayu@archeros.com>
>>>> Acked-by: Jason Wang <jasowang@redhat.com>
>>> Rethink this patch, consider there're devices that don't support
>>> set_vq_ready(). I wonder if we need
>>>
>>> 1) uAPI to tell the user space whether or not it supports set_vq_ready()
>> I guess what's more relevant here is to define the uAPI semantics for
>> unready i.e. set_vq_ready(0) for resuming/stopping virtqueue processing,
>> as starting vq is comparatively less ambiguous.
> Yes.
>
>> Considering the
>> likelihood that this interface may be used for live migration, it would
>> be nice to come up with variants such as 1) discard inflight request
>> v.s. 2) waiting for inflight processing to be done,
> Or inflight descriptor reporting (which seems to be tricky). But we
> can start from net that a discarding may just work.
>
>> and 3) timeout in
>> waiting.
> Actually, that's the plan and Eugenio is proposing something like this
> via virtio spec:
>
> https://urldefense.com/v3/__https://lists.oasis-open.org/archives/virtio-dev/202111/msg00020.html__;!!ACWV5N9M2RV99hQ!bcX6i6_atR-6Gcl-4q5Tekab_xDuXr7lDAMw2E1hilZ_1cZIX1c5mztQtvsnjiiy$
Thanks for the pointer, I seem to recall I saw it some time back though 
I wonder if there's follow-up for the v3? My impression was that this is 
still a work-in-progress spec proposal, while the semantics of various 
F_STOP scenario is unclear yet and not all of the requirements (ex: 
STOP_FAILED, rewind & !IN_ORDER) for live migration do seem to get 
accommodated?

>
>>> 2) userspace will call SET_VRING_ENABLE() when the device supports
>>> otherwise it will use RESET.
>> Are you looking to making virtqueue resume-able through the new
>> SET_VRING_ENABLE() uAPI?
>>
>> I think RESET is inevitable in some case, i.e. when guest initiates
>> device reset by writing 0 to the status register.
> Yes, that's all my plan.
>
>> For suspend/resume and
>> live migration use cases, indeed RESET can be substituted with
>> SET_VRING_ENABLE. Again, it'd need quite some code refactoring to
>> accommodate this change. Although I'm all for it, it'd be the best to
>> lay out the plan for multiple phases rather than overload this single
>> patch too much. You can count my time on this endeavor if you don't mind. :)
> You're welcome, I agree we should choose a way to go first:
>
> 1) manage to use SET_VRING_ENABLE (more like a workaround anyway)
For networking device and the vq suspend/resume and live migration use 
cases to support, I thought it might suffice? We may drop inflight or 
unused ones for Ethernet... What other part do you think may limit its 
extension to become a general uAPI or add new uAPI to address similar VQ 
stop requirement if need be? Or we might well define subsystem specific 
uAPI to stop the virtqueue, for vdpa device specifically? I think the 
point here is given that we would like to avoid guest side modification 
to support live migration, we can define specific uAPI for specific live 
migration requirement without having to involve guest driver change. 
It'd be easy to get started this way and generalize them all to a full 
blown _S_STOP when things are eventually settled.

> 2) go with virtio-spec (may take a while)
I feel it might be still quite early for now to get to a full blown 
_S_STOP spec level amendment that works for all types of virtio (vendor) 
devices. Generally there can be very specific subsystem-dependent ways 
to stop each type of virtio devices that satisfies the live migration of 
virtio subsystem devices. For now the discussion mostly concerns with vq 
index rewind, inflight handling, notification interrupt and 
configuration space such kind of virtio level things, but real device 
backend has implication on the other parts such as the order of IO/DMA 
quiescing and interrupt masking. If the subsystem virtio guest drivers 
today somehow don't support any of those _S_STOP new behaviors, I guess 
it's with little point to introduce the same or similar _S_STOP 
functionality to the guest driver to effectively support live migration.


Thanks,
-Siwei
> 3) don't wait for the spec, have a vDPA specific uAPI first. Note that
> I've chatted with most of the vendors and they seem to be fine with
> the _S_STOP. If we go this way, we can still provide the forward
> compatibility of _S_STOP
> 4) or do them all (in parallel)
>
> Any thoughts?
>
> Thanks
>
>>> And for safety, I suggest tagging this as 7.1.
>> +1
>>
>> Regards,
>> -Siwei
>>
>>>> ---
>>>> v4 --> v3
>>>>       Nothing changed, becasue of issue with mimecast,
>>>>       when the From: tag is different from the sender,
>>>>       the some mail client will take the patch as an
>>>>       attachment, RESEND v3 does not work, So resend
>>>>       the patch as v4
>>>>
>>>> v3 --> v2:
>>>>       Call vhost_dev_reset() at the end of vhost_net_stop().
>>>>
>>>>       Since the vDPA device need re-add the status bit
>>>>       VIRTIO_CONFIG_S_ACKNOWLEDGE and VIRTIO_CONFIG_S_DRIVER,
>>>>       simply, add them inside vhost_vdpa_reset_device, and
>>>>       the only way calling vhost_vdpa_reset_device is in
>>>>       vhost_net_stop(), so it keeps the same behavior as before.
>>>>
>>>> v2 --> v1:
>>>>      Implement a new function vhost_dev_reset,
>>>>      reset the backend kernel device at last.
>>>> ---
>>>>    hw/net/vhost_net.c        | 24 +++++++++++++++++++++---
>>>>    hw/virtio/vhost-vdpa.c    | 15 +++++++++------
>>>>    hw/virtio/vhost.c         | 15 ++++++++++++++-
>>>>    include/hw/virtio/vhost.h |  1 +
>>>>    4 files changed, 45 insertions(+), 10 deletions(-)
>>>>
>>>> diff --git a/hw/net/vhost_net.c b/hw/net/vhost_net.c
>>>> index 30379d2..422c9bf 100644
>>>> --- a/hw/net/vhost_net.c
>>>> +++ b/hw/net/vhost_net.c
>>>> @@ -325,7 +325,7 @@ int vhost_net_start(VirtIODevice *dev, NetClientState *ncs,
>>>>        int total_notifiers = data_queue_pairs * 2 + cvq;
>>>>        VirtIONet *n = VIRTIO_NET(dev);
>>>>        int nvhosts = data_queue_pairs + cvq;
>>>> -    struct vhost_net *net;
>>>> +    struct vhost_net *net = NULL;
>>>>        int r, e, i, index_end = data_queue_pairs * 2;
>>>>        NetClientState *peer;
>>>>
>>>> @@ -391,8 +391,17 @@ int vhost_net_start(VirtIODevice *dev, NetClientState *ncs,
>>>>    err_start:
>>>>        while (--i >= 0) {
>>>>            peer = qemu_get_peer(ncs , i);
>>>> -        vhost_net_stop_one(get_vhost_net(peer), dev);
>>>> +
>>>> +        net = get_vhost_net(peer);
>>>> +
>>>> +        vhost_net_stop_one(net, dev);
>>>>        }
>>>> +
>>>> +    /* We only reset backend vdpa device */
>>>> +    if (net && net->dev.vhost_ops->backend_type == VHOST_BACKEND_TYPE_VDPA) {
>>>> +        vhost_dev_reset(&net->dev);
>>>> +    }
>>>> +
>>>>        e = k->set_guest_notifiers(qbus->parent, total_notifiers, false);
>>>>        if (e < 0) {
>>>>            fprintf(stderr, "vhost guest notifier cleanup failed: %d\n", e);
>>>> @@ -410,6 +419,7 @@ void vhost_net_stop(VirtIODevice *dev, NetClientState *ncs,
>>>>        VirtioBusClass *k = VIRTIO_BUS_GET_CLASS(vbus);
>>>>        VirtIONet *n = VIRTIO_NET(dev);
>>>>        NetClientState *peer;
>>>> +    struct vhost_net *net = NULL;
>>>>        int total_notifiers = data_queue_pairs * 2 + cvq;
>>>>        int nvhosts = data_queue_pairs + cvq;
>>>>        int i, r;
>>>> @@ -420,7 +430,15 @@ void vhost_net_stop(VirtIODevice *dev, NetClientState *ncs,
>>>>            } else {
>>>>                peer = qemu_get_peer(ncs, n->max_queue_pairs);
>>>>            }
>>>> -        vhost_net_stop_one(get_vhost_net(peer), dev);
>>>> +
>>>> +        net = get_vhost_net(peer);
>>>> +
>>>> +        vhost_net_stop_one(net, dev);
>>>> +    }
>>>> +
>>>> +    /* We only reset backend vdpa device */
>>>> +    if (net && net->dev.vhost_ops->backend_type == VHOST_BACKEND_TYPE_VDPA) {
>>>> +        vhost_dev_reset(&net->dev);
>>>>        }
>>> So we've already reset the device in vhost_vdpa_dev_start(), any
>>> reason we need to do it again here?
>>>
>>>>        r = k->set_guest_notifiers(qbus->parent, total_notifiers, false);
>>>> diff --git a/hw/virtio/vhost-vdpa.c b/hw/virtio/vhost-vdpa.c
>>>> index c5ed7a3..3ef0199 100644
>>>> --- a/hw/virtio/vhost-vdpa.c
>>>> +++ b/hw/virtio/vhost-vdpa.c
>>>> @@ -708,6 +708,11 @@ static int vhost_vdpa_reset_device(struct vhost_dev *dev)
>>>>
>>>>        ret = vhost_vdpa_call(dev, VHOST_VDPA_SET_STATUS, &status);
>>>>        trace_vhost_vdpa_reset_device(dev, status);
>>>> +
>>>> +    /* Add back this status, so that the device could work next time*/
>>>> +    vhost_vdpa_add_status(dev, VIRTIO_CONFIG_S_ACKNOWLEDGE |
>>>> +                               VIRTIO_CONFIG_S_DRIVER);
>>> This seems to contradict the semantic of reset.
>>>
>>>> +
>>>>        return ret;
>>>>    }
>>>>
>>>> @@ -719,14 +724,14 @@ static int vhost_vdpa_get_vq_index(struct vhost_dev *dev, int idx)
>>>>        return idx;
>>>>    }
>>>>
>>>> -static int vhost_vdpa_set_vring_ready(struct vhost_dev *dev)
>>>> +static int vhost_vdpa_set_vring_ready(struct vhost_dev *dev, unsigned int ready)
>>>>    {
>>>>        int i;
>>>>        trace_vhost_vdpa_set_vring_ready(dev);
>>>>        for (i = 0; i < dev->nvqs; ++i) {
>>>>            struct vhost_vring_state state = {
>>>>                .index = dev->vq_index + i,
>>>> -            .num = 1,
>>>> +            .num = ready,
>>>>            };
>>>>            vhost_vdpa_call(dev, VHOST_VDPA_SET_VRING_ENABLE, &state);
>>>>        }
>>>> @@ -1088,8 +1093,9 @@ static int vhost_vdpa_dev_start(struct vhost_dev *dev, bool started)
>>>>            if (unlikely(!ok)) {
>>>>                return -1;
>>>>            }
>>>> -        vhost_vdpa_set_vring_ready(dev);
>>>> +        vhost_vdpa_set_vring_ready(dev, 1);
>>>>        } else {
>>>> +        vhost_vdpa_set_vring_ready(dev, 0);
>>>>            ok = vhost_vdpa_svqs_stop(dev);
>>>>            if (unlikely(!ok)) {
>>>>                return -1;
>>>> @@ -1105,9 +1111,6 @@ static int vhost_vdpa_dev_start(struct vhost_dev *dev, bool started)
>>>>            memory_listener_register(&v->listener, &address_space_memory);
>>>>            return vhost_vdpa_add_status(dev, VIRTIO_CONFIG_S_DRIVER_OK);
>>>>        } else {
>>>> -        vhost_vdpa_reset_device(dev);
>>>> -        vhost_vdpa_add_status(dev, VIRTIO_CONFIG_S_ACKNOWLEDGE |
>>>> -                                   VIRTIO_CONFIG_S_DRIVER);
>>>>            memory_listener_unregister(&v->listener);
>>>>
>>>>            return 0;
>>>> diff --git a/hw/virtio/vhost.c b/hw/virtio/vhost.c
>>>> index b643f42..7e0cdb6 100644
>>>> --- a/hw/virtio/vhost.c
>>>> +++ b/hw/virtio/vhost.c
>>>> @@ -1820,7 +1820,6 @@ fail_features:
>>>>    void vhost_dev_stop(struct vhost_dev *hdev, VirtIODevice *vdev)
>>>>    {
>>>>        int i;
>>>> -
>>> Unnecessary changes.
>>>
>>>>        /* should only be called after backend is connected */
>>>>        assert(hdev->vhost_ops);
>>>>
>>>> @@ -1854,3 +1853,17 @@ int vhost_net_set_backend(struct vhost_dev *hdev,
>>>>
>>>>        return -ENOSYS;
>>>>    }
>>>> +
>>>> +int vhost_dev_reset(struct vhost_dev *hdev)
>>>> +{
>>> Let's use a separate patch for this.
>>>
>>> Thanks
>>>
>>>> +    int ret = 0;
>>>> +
>>>> +    /* should only be called after backend is connected */
>>>> +    assert(hdev->vhost_ops);
>>>> +
>>>> +    if (hdev->vhost_ops->vhost_reset_device) {
>>>> +        ret = hdev->vhost_ops->vhost_reset_device(hdev);
>>>> +    }
>>>> +
>>>> +    return ret;
>>>> +}
>>>> diff --git a/include/hw/virtio/vhost.h b/include/hw/virtio/vhost.h
>>>> index 58a73e7..b8b7c20 100644
>>>> --- a/include/hw/virtio/vhost.h
>>>> +++ b/include/hw/virtio/vhost.h
>>>> @@ -114,6 +114,7 @@ int vhost_dev_init(struct vhost_dev *hdev, void *opaque,
>>>>    void vhost_dev_cleanup(struct vhost_dev *hdev);
>>>>    int vhost_dev_start(struct vhost_dev *hdev, VirtIODevice *vdev);
>>>>    void vhost_dev_stop(struct vhost_dev *hdev, VirtIODevice *vdev);
>>>> +int vhost_dev_reset(struct vhost_dev *hdev);
>>>>    int vhost_dev_enable_notifiers(struct vhost_dev *hdev, VirtIODevice *vdev);
>>>>    void vhost_dev_disable_notifiers(struct vhost_dev *hdev, VirtIODevice *vdev);
>>>>
>>>> --
>>>> 1.8.3.1
>>>>
>>>>
>>>>


