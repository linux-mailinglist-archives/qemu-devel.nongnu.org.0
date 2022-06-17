Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 67EDF54FAE5
	for <lists+qemu-devel@lfdr.de>; Fri, 17 Jun 2022 18:15:07 +0200 (CEST)
Received: from localhost ([::1]:58258 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o2Ecj-00032E-MU
	for lists+qemu-devel@lfdr.de; Fri, 17 Jun 2022 12:15:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34260)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <joao.m.martins@oracle.com>)
 id 1o2Eas-0000fS-8W
 for qemu-devel@nongnu.org; Fri, 17 Jun 2022 12:13:10 -0400
Received: from mx0a-00069f02.pphosted.com ([205.220.165.32]:44526)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <joao.m.martins@oracle.com>)
 id 1o2Eak-0000mi-LI
 for qemu-devel@nongnu.org; Fri, 17 Jun 2022 12:13:09 -0400
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 25HFcxjT026649;
 Fri, 17 Jun 2022 16:12:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=message-id : date :
 subject : from : to : cc : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=corp-2021-07-09;
 bh=haOWMoBTqfBgdGIxdy6XHq2QoPOQ2aEulhtXmBZE3Us=;
 b=iJ6BLDyrZTP9o3k32Q7dbLR8BDZtcA8HfqCTLPBTACYBVOkIblUehvqMtrYiMC2Mvd+m
 gsEc+XF99pUpIYv6UekOjjPfoN/sSs/wjXZ4MV5M8OtyGKAUXwAw3ctASAPnyUMUi4rM
 hcK2WvAerLO5QjVgepZ0JHe0mkibmE3B+01XydhCKTlsOTMNlwOUC8TKoMQzePBkzhTr
 mOCF1bYlqGycq6NQY+vv1F9iCB71WHfXdZTeAm5FbTvVUkWqW0+nJu4Z592s1jSCsm8O
 NA+/rCnh+N27anGo/+AMMTZGu7M+dfapwwFNOVnU8J+Y0SWhlsUsxOh1UZXMbgT0j4ae kg== 
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com
 (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3gmhn0panp-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 17 Jun 2022 16:12:54 +0000
Received: from pps.filterd
 (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
 by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.16.1.2/8.16.1.2)
 with SMTP id 25HGA9tK019159; Fri, 17 Jun 2022 16:12:53 GMT
Received: from nam10-bn7-obe.outbound.protection.outlook.com
 (mail-bn7nam10lp2100.outbound.protection.outlook.com [104.47.70.100])
 by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com with ESMTP id
 3gpr28at6r-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 17 Jun 2022 16:12:53 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Tennvg/bb88Wg3as28t1ykhupCYUwR1TCRfQ1XiQOLuenWgAvwOM5Ebz4nuXTObpGCsH49LypVOQINtKTsLr2UGVgx614U3eO5VgfxtGVKZURg7UtXsx2zPdClADsZq9iQS71puRdaYjuT0/HmsS+N/24rzwhtvWBN8bd4ISz4QouFp3V+145yL13EbmHPrLvPpO2ZPKJdDI/9kr3lhsSpvfRTK739gzpcStAc9EgzoWUT2Wuz0sWpKt8fiG6t7TVW89TYW2FxJ31BVmNQwzOKSqE69XQEs83mwD0cE0GPKMl3tQIHCivmdkWFrnf82pj4Y2rLk/vjS2GqPM5ioonQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=haOWMoBTqfBgdGIxdy6XHq2QoPOQ2aEulhtXmBZE3Us=;
 b=Q+IAWW0QSswTmX7Xl+MNVUOsTxf1RUr7iDSO87QIrtF1PhaZbW9TTlM1a/oYazcusj5N5lsT73ZALgcWYKJNLnXevDgSsQB+4Ofpp0GG1hHaVC83AoTTU6OK/cATV9rYgG14d5mOGgYK0V9RGWu0W55OWmfdq6RVSRx0SGp+mVoI3JPOF0EKrJHtUnVp5GVpiP2EsiFh90r6bIUlZWKnPn4vFYSicDgdnSt4ne91Ybl8WH6vh9WSS4YwYmhLctegzemaiiYDZ7rX+YXsRtYD9aEzOVZ9iY3zpZ8/nXRQW5YRGbiK1B6+H4nLKa34wFSSdP70gt9AsA1ya8DqkgZL6w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=haOWMoBTqfBgdGIxdy6XHq2QoPOQ2aEulhtXmBZE3Us=;
 b=Ly+Hx0Ps5klAc/1oIJtE7elbbhUptQo4TsLut7pUiiIlNoSjE5n+bh/G/+3b+GqWivJC6N3n2fI/NudGzwVPBBQAVnKoTEiLhX73dpPg38D/BogcmGQYc2x0TIOE2W2uh+PmJky8W+XyFsaPtY+t+RixFYWvGXiSTlYsDl+eB7A=
Received: from BLAPR10MB4835.namprd10.prod.outlook.com (2603:10b6:208:331::11)
 by PH0PR10MB4710.namprd10.prod.outlook.com (2603:10b6:510:3e::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5353.16; Fri, 17 Jun
 2022 16:12:50 +0000
Received: from BLAPR10MB4835.namprd10.prod.outlook.com
 ([fe80::b842:a301:806d:231e]) by BLAPR10MB4835.namprd10.prod.outlook.com
 ([fe80::b842:a301:806d:231e%9]) with mapi id 15.20.5353.015; Fri, 17 Jun 2022
 16:12:50 +0000
Message-ID: <3f5f8514-5581-8488-7b9e-81904f8dc06f@oracle.com>
Date: Fri, 17 Jun 2022 17:12:43 +0100
Subject: Re: [PATCH v5 4/5] i386/pc: relocate 4g start to 1T where applicable
Content-Language: en-US
From: Joao Martins <joao.m.martins@oracle.com>
To: Igor Mammedov <imammedo@redhat.com>
Cc: qemu-devel@nongnu.org, Eduardo Habkost <eduardo@habkost.net>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Daniel Jordan <daniel.m.jordan@oracle.com>,
 David Edmondson <david.edmondson@oracle.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Ani Sinha <ani@anisinha.ca>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>
References: <20220520104532.9816-1-joao.m.martins@oracle.com>
 <20220520104532.9816-5-joao.m.martins@oracle.com>
 <20220616162328.64138d4f@redhat.com>
 <bc50bb88-5330-a839-bd50-ca49b0edec9d@oracle.com>
In-Reply-To: <bc50bb88-5330-a839-bd50-ca49b0edec9d@oracle.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO2P265CA0216.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:9e::36) To BLAPR10MB4835.namprd10.prod.outlook.com
 (2603:10b6:208:331::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: bddbb6be-a5d7-4cd1-8cd1-08da507c39f9
X-MS-TrafficTypeDiagnostic: PH0PR10MB4710:EE_
X-Microsoft-Antispam-PRVS: <PH0PR10MB47101D8372FEBB498EB23123BBAF9@PH0PR10MB4710.namprd10.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: OrBpQ1cMCJfCSRDzdK/TBai6upY4SQUt092RCvaT7a56xUKSWLFWOqoKKNeXkVX4nDm96tIPmz5xg/Hrvmp4ZmfFNEcVadwy8BD2/zwZnMv6EU7FihasNT9JoZGhWeSv1/yK1ngQHTf1n8sIh77TkxvKRLauyS7SOV3M4Xt+254j1rC+8nTvLdDVihxH8hQ6Ym/yZqWulmPvgubgTtfTFvmKlsvb3VHG62MP0Tdg/nS9SBL9r7YaRQXg0plMAXn+yxEUHto0PiXKiDFjoMDfxrcLnwKeneJIhzl0EZ04/BlUIdnGaehJTluOdDD+kS40E3NueSOBHujGqB8OpMAnwC9DQ9BZ2G44x+rKDtVUS/rDZhhHHtW1f10pkDdEOkz3pBfmL06a+l0KFoBVBwmiDTgyHFur3ta/cF3xvQiuexJ3Pla5kGNC/c/FJLu+gc564ojYin9iii4dmKYkbE8CntrRxOwqLQzvPrmnlW+na+68VTmuZc33IgjvGmYMj32Q6HNeaMAA/Rp98myNQnXFVZqzM0S1Sk/jL/f4iy7Ruxl5Q/7VGDpqauqqWo5E7n7GyJ/AluQLS45d7Jqjn0K7fLF+h/CjXVxPi9L8MK0qzAPzlNUPD6l0cuWwjBHm9mc6vM/0fJpeOKEsfPNxU6NWmtGO0YSfKdaxnZfU/pgNa0HZcE1JCXQqS9C74S4CouKX6mpwFN18WEyFnlGvkFbDww==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BLAPR10MB4835.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(366004)(316002)(31696002)(83380400001)(54906003)(6916009)(66946007)(186003)(86362001)(8676002)(4326008)(66476007)(66556008)(7416002)(38100700002)(6506007)(6512007)(498600001)(2906002)(6666004)(8936002)(36756003)(53546011)(5660300002)(31686004)(2616005)(26005)(6486002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?L2pXYVM2eEZhcnlPVEsrK0Q3Vkt6Q2ZSRTRocUI3WGZKelk1NmV6N2RUYmJD?=
 =?utf-8?B?cHlvUE1XWDBJYmtmSzJvbW91MzUwbHN1dFppWGp1VVpoRTR4SXoyWWF5UVdE?=
 =?utf-8?B?VmhjMlJWTktsT0tHNStQWVlnZFl3TkQyeHBVbFJQa2xNMHh0UjVObXBkMDcy?=
 =?utf-8?B?Znoyc0hyREJYY1hwRHgzeWtPdkJYK0JSSTV6b0V0M1U5bUp2VjZkc0g4Z1Zr?=
 =?utf-8?B?NXk1Z0tCODhCQ2wxeXJ2bnl4NUVlOE9abThEenB5MXE3NzZuQWhKaU90QzAv?=
 =?utf-8?B?ZUwyaUM3ejRVQWp0cGYwQXdjNERyQlhDcDh1VmIzamxHeWsxYW83bjJFQ1Bq?=
 =?utf-8?B?ZnVZNkNLd1ovUEVYemZlc1pmYzExVWlaTDZwMlBRR0Zkbks1WVBGWTA3aDJU?=
 =?utf-8?B?cVZuZmlZMFhmblMxWUoyNmsvZEFkZy9OZHlZazRabDNDbi91bFhSYXAxR3NS?=
 =?utf-8?B?L2o0ZW1QQjVSOGZEOURLd1ZTb2w2NFpLTERRd2hNRXVhVUIyUGhLMU8rbHJT?=
 =?utf-8?B?Nm9TSmlkR3BuTzBZT1RLZjRXT0VRdGJDRkpkeWxGTWdKeDhjNlF1K0ZsRmF5?=
 =?utf-8?B?VmNtdVJickIwR2JZcUU0bjZhU2laNlFuK1l1eGdtUWdzdTlYV1FzMGpucmhL?=
 =?utf-8?B?QU1keWR1TEMxMnRUQmEzSEQ4OFFLUlg4YnRGWmZtdWF4TDcrVHV1V0NvMkFR?=
 =?utf-8?B?Wnk0WDFvTjNHMGQzekhMSStmZ2ZmdlZXU1QzUm9weXVOYitnZVFwOS9veFYz?=
 =?utf-8?B?a25TQyt1aHltVzI5V1U4VGJzNi9YVk4vTEtVS0RPQjYrZnZIb2JjYlU0WmJW?=
 =?utf-8?B?NHV0QlpHQ3VVR0V1T0hGV3F4cEZoeGNFN1VQWVg0Y3ZXclFyM0llSVBWVzZl?=
 =?utf-8?B?T0htc0haRlB5eldacmNpaWVtdjE4dnJ4cnR1UmRFUFdET0xWVkFLSmxualBs?=
 =?utf-8?B?RjU0YXRWM0dtK1NVT0NoNk5FN1p6WEZFZXdzL2pPUisveGREK0cwVmJMUjBr?=
 =?utf-8?B?OG0wUkI2a0Q3VXljUWdYbTlkTUcwUC83UC9zQ1pDeERNSDJzelNOQkVlbm5K?=
 =?utf-8?B?KzkvZEp6OVNyVnMxSUxXUjJkYUt0MmMyQit0YUtJSnl6c3A4dDJaRGJ4L2J5?=
 =?utf-8?B?RUlsNzRNMWM1UTNWeEc1ZTZTQ2Q4d1FpMElZd2QvbWVJbEVJdnRIcHVHeGxB?=
 =?utf-8?B?WDdldmJXa1JyY1dCWktldjYyOFUwTnV0ZmpKVkpKdWVKN0wrSU9jc21wdWdo?=
 =?utf-8?B?Z05DZHBYVkl6YlAwRTFoa1M4MVRzd0JQOUl0VUZ2RGp3czh6NjVvaUNaL0dY?=
 =?utf-8?B?ZktjS2pmREtrWWVYS2NDY2t5SUpOMkNic3E0WkdxZEUyN2xraGdhT2orYlNv?=
 =?utf-8?B?REZwVjZqOFFRa1E4VUVUSDl6RXBZKzdGRFBEeHNsdzhJemdiVmtPVFF0ajhm?=
 =?utf-8?B?Y2VOZkl1amZzMXd3Vk1qOFl2bS9aRmZzZ2VzUDVtN211cTAxeGM3d2Yrcndq?=
 =?utf-8?B?bHlUK0hhdUZDNXpXa21wK1h4eXhiQ1J6MVNsbXU2eVh2dHl0aUFuTklROXYw?=
 =?utf-8?B?ZlRUODBkUDlFYzRvYWpKQU54VGR2OFNxeEVXdC9DZG43MWlrVXQzOWFqV2c3?=
 =?utf-8?B?Vi9ZYnFRRDJjb1FBZnp4MEVTRmxwcXg2NmJONjREVEdsN1BxVnBmaDJYOXh6?=
 =?utf-8?B?WmJSSDJwdkE1SE52Z1ljRWFhRDF3SWk5S0s2bGN5dFVNcG1mbjJzWlNXNVQ2?=
 =?utf-8?B?SmxmMTNXcWdPK1VBYVFUK1NJYkVYN3hwSEtpMVVOQWIvaWtMTGw5NFhmT2dv?=
 =?utf-8?B?eHR5WWNRVjljU3plNUl2MFB6VW9CT3Z5ek9wYXM3aC9mT2x1L1QvbWx2aW54?=
 =?utf-8?B?allGeWNuMGJ0NTV0WGRqVm5LZUZ4RnNSbVVoWTRxYzlkM3hId0lyOXlWYlkx?=
 =?utf-8?B?MkJKdVh1cTBEMkRnNXJiamRkanZaSG1PSFZ5ZVNETzNEaWpIM3FBT0tKUmJD?=
 =?utf-8?B?TEZGdXdGUXF5SldpRFQyVk5ES1RSekFYZlBFU2pVRFN3U3ZDand0eGFGM082?=
 =?utf-8?B?SnAxaGd2Vjh5SmdKd0pxa1ZTWGVsSGU5RWtTbDFpckRWejNpREtZVGt3c3dS?=
 =?utf-8?B?bGVmTldhcGtSYmg1eEFWOHdTSWpYU2FwSTRINFJnTmljVWUrbVBmcGVwM0N1?=
 =?utf-8?B?OVhUL0pxakFaSVhvcmVWNEJ1MUNaazhlSUlFV2ZhNUMvNWJmbVpIQ2Q2bUlj?=
 =?utf-8?B?aVdpNkhsQ3J2ZzMyVWc0WXBSbXFkM21SZjBhRFlRSHhTc1dWb0l5WGtHL0JO?=
 =?utf-8?B?RGFIbkVoczFDRTF2UnpqMGMxRHFWdWNPbHV5b2RGbGlEOXdYSHRWTTZCN2h5?=
 =?utf-8?Q?W4pOdNGjSXJrbVKA=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bddbb6be-a5d7-4cd1-8cd1-08da507c39f9
X-MS-Exchange-CrossTenant-AuthSource: BLAPR10MB4835.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jun 2022 16:12:50.7840 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dzV4TWCndpz7XApm4gPu/bVeKpvU22ofEXsAjDbbJocEquoIOX4yseWnX3oujc+sF0F54YubqkPTjxyATPO/e/B9QPrT/U0ByHpUxl44tSI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR10MB4710
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.517, 18.0.883
 definitions=2022-06-17_09:2022-06-17,
 2022-06-17 signatures=0
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0
 malwarescore=0
 suspectscore=0 spamscore=0 mlxscore=0 phishscore=0 bulkscore=0
 mlxlogscore=841 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2204290000 definitions=main-2206170071
X-Proofpoint-GUID: Jafl2_LbDGyciGxkPBBHS99uips3vOZr
X-Proofpoint-ORIG-GUID: Jafl2_LbDGyciGxkPBBHS99uips3vOZr
Received-SPF: pass client-ip=205.220.165.32;
 envelope-from=joao.m.martins@oracle.com; helo=mx0a-00069f02.pphosted.com
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 6/17/22 13:18, Joao Martins wrote:
> On 6/16/22 15:23, Igor Mammedov wrote:
>> On Fri, 20 May 2022 11:45:31 +0100
>> Joao Martins <joao.m.martins@oracle.com> wrote:
>>> +    }
>>> +
>>> +    if (pcmc->has_reserved_memory &&
>>> +       (machine->ram_size < machine->maxram_size)) {
>>> +        device_mem_size = machine->maxram_size - machine->ram_size;
>>> +    }
>>> +
>>> +    base = ROUND_UP(above_4g_mem_start + x86ms->above_4g_mem_size +
>>> +                    pcms->sgx_epc.size, 1 * GiB);
>>> +
>>> +    return base + device_mem_size + pci_hole64_size;
>>
>> it's not guarantied that pci64 hole starts right away device_mem,
>> but you are not 1st doing this assumption in code, maybe instead of
>> all above use existing 
>>    pc_pci_hole64_start() + pci_hole64_size
>> to gestimate max address 
>>
> I've switched the block above to that instead.
> 

I had done this, albeit on a second look (and confirmed with testing) this
will crash, provided @device_memory isn't yet initialized. And even without
hotplug, CXL might have had issues.

The problem is largely that pc_pci_hole64_start() that the above check relies
on info we only populate later on in pc_memory_init(), and I don't think I can
move this done to a later point as definitely don't want to re-initialize
MRs or anything.

So we might be left with manually calculating as I was doing in this patch
but maybe try to arrange some form of new helper that has somewhat shared
logic with pc_pci_hole64_start().

  1114  uint64_t pc_pci_hole64_start(void)
  1115  {
  1116      PCMachineState *pcms = PC_MACHINE(qdev_get_machine());
  1117      PCMachineClass *pcmc = PC_MACHINE_GET_CLASS(pcms);
  1118      MachineState *ms = MACHINE(pcms);
  1119      X86MachineState *x86ms = X86_MACHINE(pcms);
  1120      uint64_t hole64_start = 0;
  1121
  1122      if (pcms->cxl_devices_state.host_mr.addr) {
  1123          hole64_start = pcms->cxl_devices_state.host_mr.addr +
  1124              memory_region_size(&pcms->cxl_devices_state.host_mr);
  1125          if (pcms->cxl_devices_state.fixed_windows) {
  1126              GList *it;
  1127              for (it = pcms->cxl_devices_state.fixed_windows; it; it = it->next) {
  1128                  CXLFixedWindow *fw = it->data;
  1129                  hole64_start = fw->mr.addr + memory_region_size(&fw->mr);
  1130              }
  1131          }
* 1132      } else if (pcmc->has_reserved_memory && ms->device_memory->base) {
  1133          hole64_start = ms->device_memory->base;
  1134          if (!pcmc->broken_reserved_end) {
  1135              hole64_start += memory_region_size(&ms->device_memory->mr);
  1136          }
  1137      } else if (pcms->sgx_epc.size != 0) {
  1138              hole64_start = sgx_epc_above_4g_end(&pcms->sgx_epc);
  1139      } else {
  1140          hole64_start = x86ms->above_4g_mem_start + x86ms->above_4g_mem_size;
  1141      }


