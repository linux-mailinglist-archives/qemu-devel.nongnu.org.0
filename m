Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B954E578440
	for <lists+qemu-devel@lfdr.de>; Mon, 18 Jul 2022 15:48:55 +0200 (CEST)
Received: from localhost ([::1]:56964 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oDR7G-0005po-RI
	for lists+qemu-devel@lfdr.de; Mon, 18 Jul 2022 09:48:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48920)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <joao.m.martins@oracle.com>)
 id 1oDR4l-0001qU-39
 for qemu-devel@nongnu.org; Mon, 18 Jul 2022 09:46:19 -0400
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32]:12312)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <joao.m.martins@oracle.com>)
 id 1oDR4e-00018p-Ni
 for qemu-devel@nongnu.org; Mon, 18 Jul 2022 09:46:18 -0400
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 26IDZjNV002739;
 Mon, 18 Jul 2022 13:45:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=message-id : date :
 subject : to : cc : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=corp-2022-7-12;
 bh=5boS5t8qHv98KXiWAaxt87WPrydviTcKO0Ls1U1RKC4=;
 b=uiBMG+LSB9BRuzxDWGlDyp1z19N8E13g2btOZtupCrOSqiMLCgcCnk4DAHuqM9S3IdD1
 CBj9VOhQ7OUXM81Ta9WNIrhhJ0ZIgXgX8rA3Kn32rJjYOEIomN1I0OulLqzBGMS6x8TO
 OtuXJe5r82oxaDS59ku3+gTfNzrqxix8/xXqO2bcIoBb5tyxiNdIM44884HJweLXRLmx
 R8kSJRYF2OQo8Qf4cQpvVGDeIREw2j8fI3GaPUnMjV45APgiN3E9WvTla62Lk2OMGmt8
 k2MjvPbz/7MZI+S2uC4WmozR67l95zPPerDeWrx4b9ycM25O6d8yKmXPqDgbBpPS6CmN /g== 
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com
 (iadpaimrmta03.appoci.oracle.com [130.35.103.27])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3hbmxs39n9-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 18 Jul 2022 13:45:56 +0000
Received: from pps.filterd
 (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
 by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (8.17.1.5/8.17.1.5)
 with ESMTP id 26IBDQEx002089; Mon, 18 Jul 2022 13:45:56 GMT
Received: from nam10-bn7-obe.outbound.protection.outlook.com
 (mail-bn7nam10lp2109.outbound.protection.outlook.com [104.47.70.109])
 by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id
 3hc1hr0r1d-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 18 Jul 2022 13:45:56 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YpgBCWNB57nj7vXMPUd3HcMHObNYi6VReTmWIOW4sYIA5AK7vEliPrpaQARbYpWbeymHsDFfNJd5Zx447IwejkvR3LaZkgUHIoIeLaDP7BRwpaZfT7orj4ZQnI50s64l8HG+Bg0dKCSnz7ywhfm5MdaGB7x1UCR8x44bh/wvMuB58AQXPszyG21j7nlTBGK5uFB/TW5s51zMp5LUiFThb4jAHGN6Z1ktIAfkTYxayeMCjMAf88ZEfX9lxSmuMRnMME1humUYsaBwBJTPTURA+hs+h7nNthxARRB+BDj0IoIZwR5lMBzv0j6DXQb4C0ytBQ3uPyTTBQ6xK+a/neZyEw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5boS5t8qHv98KXiWAaxt87WPrydviTcKO0Ls1U1RKC4=;
 b=XjYB8HqrSJjehWBPTStfgcLq5GD6Br4Rd7X3PhdzFaqbXaONcaMgv5AvKvFMGYkaB1yVDyTyuxn21kyQHPIriGYCzOktMa4rjFUaWc9GJ5vup021lu0y/j1m2/FUt0jz2zixAvvY6ykkgw49Qj4XqfkarOotrNAcrVS2pibNwRXRSbx6bS83nKI40LRWs0iItOkI7f48HG+vih/qP3355OFpshEkJdVPw2a3sSfUWzoXlpMmf1/aPkunIKLijpwOf6BSGr12aiwBGHJjFBRxUGrf+HcM+UfPufYjS3Rw9h28dug78kcOiPMVLejqocZ0xnUZh4aNLgYHyhKZhHOuoQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5boS5t8qHv98KXiWAaxt87WPrydviTcKO0Ls1U1RKC4=;
 b=tWhiKMucqXybGVvHxt7R9fbfN9kf09kYZf10QHnPSwzFsje0+bq+z8ZVJ1R4IIHxM9aBLHPlMyrHzs8CddaaAWtByrJ+9D4m3JnGglXqAS77pAf+vbJNp0V1XzRHl+U24an7P2UeweKJYUutUNmFRYrGiOZWyPis7sdmNvws98k=
Received: from BLAPR10MB4835.namprd10.prod.outlook.com (2603:10b6:208:331::11)
 by CH2PR10MB4261.namprd10.prod.outlook.com (2603:10b6:610:7d::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5438.14; Mon, 18 Jul
 2022 13:45:54 +0000
Received: from BLAPR10MB4835.namprd10.prod.outlook.com
 ([fe80::b842:a301:806d:231e]) by BLAPR10MB4835.namprd10.prod.outlook.com
 ([fe80::b842:a301:806d:231e%8]) with mapi id 15.20.5438.023; Mon, 18 Jul 2022
 13:45:54 +0000
Message-ID: <91b2ec7d-c159-85ed-dad8-37aac6c505d3@oracle.com>
Date: Mon, 18 Jul 2022 14:45:48 +0100
Subject: Re: [PATCH] x86: cpu: Error out if memory exceeds addressable range
Content-Language: en-US
To: "Nikunj A. Dadhania" <nikunj@amd.com>, Igor Mammedov <imammedo@redhat.com>
Cc: qemu-devel@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 Vitaly Kuznetsov <vkuznets@redhat.com>, f4bug@amsat.org,
 Abraham.Shaju@amd.com, bharata@amd.com,
 Sean Christopherson <seanjc@google.com>
References: <20220718081734.135598-1-nikunj@amd.com>
 <20220718144210.4ef95c53@redhat.com>
 <e4cd8e81-a8a0-a898-e61b-3e0250dc4995@amd.com>
From: Joao Martins <joao.m.martins@oracle.com>
In-Reply-To: <e4cd8e81-a8a0-a898-e61b-3e0250dc4995@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM0PR04CA0044.eurprd04.prod.outlook.com
 (2603:10a6:208:1::21) To BLAPR10MB4835.namprd10.prod.outlook.com
 (2603:10b6:208:331::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 26b2901f-caf2-46d3-895d-08da68c3d5c6
X-MS-TrafficTypeDiagnostic: CH2PR10MB4261:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: XiInmsGezWrIQKe2TixPSUXHHA1Zylgx3QWCuMSQu+nG8VbiaELla1VFXojM+bwTS3SnqI4m//qFX2w739l0DOQzJTHyZ4EojjA132T2VhWrUxpWUAFbSmm1G9cpQoVP8/9Gs7/UuISORLciLW9DN553E46AjZposPYkeOaTPXfPRtYM2CGdNix8mOFD6NgGy2cx8h9PGWBYmKJDQvKfidsRjldhqj2kruaXKb9Y2xVEIEUo2kx3ACEtQ2RSaWFk7lo2D1ddbfyQ9PGUQsudBTo6l0B0vHYb6VXRMTGB7VRGPUJhQQjToXmOpwTvMzN9I7q12mZ/IHneJIFYubfon81V08zORRIvVrgLELmRkU92YqrBlhM3Jc19CJFKd/UBXPsdLFYydwBM+khE2RMeje8YoD/jVhE93HlJ9mZIelWTSRHNk1JhX9NXJRs/Fsh3XaXdQP+GJ8HgK7hEsaZxcBdoj4pZ16dI3ewgPBwn2N9+MEwtkok7lrpbFrE2OnylAPfUqKJxB7rWZooJ8pnvhbpJDQe6AqU7Ecb+TqtSLoB4lqYIo4TjS0/L6eSvSRDPACiTWsq5tEsrYLZERwFw7FTMLG7Gh7U5rZNvtORpnRwyFuW0y8y6Knodsq/rCD8hC7jKpBowPrRBeZ6QXyiTf/GCrDf8uDmhdebccPTn9mGwMhapTgkQ++CMmSrYrv5h0RerjtSfOvH96CavXkn4hcDnMHLKbzdZBCPEBuf+5hgSSPoPeLtxrDDG44o/NA/nW7rmHmTiDrkghHmBSF5ieTBtmwXbH4/TSdLpJiGzJcmiF0bp9NQopvhR1m8XutenkL55hLr1zDN19FTW3uw6OiI2WgbeaQn8bJqfsw4mM31cd3kRgSFygytUxsGhtHLC
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BLAPR10MB4835.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(39860400002)(366004)(376002)(396003)(346002)(136003)(54906003)(83380400001)(110136005)(5660300002)(966005)(186003)(2616005)(6486002)(38100700002)(316002)(478600001)(8936002)(86362001)(66476007)(66946007)(4326008)(8676002)(66556008)(31696002)(31686004)(36756003)(26005)(6506007)(2906002)(6512007)(6666004)(41300700001)(53546011)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cVBpRW5SSkxId3pKYkdXd0t4L1dRMDNod0ltc1JuS2xkTnNFNnF5MlNPRFdX?=
 =?utf-8?B?bGlIaHNPc1VaZnMzUHhZUjkvWFQ4OHlocmwzVnlDOXFuaHdGaWFEVVVEQk1C?=
 =?utf-8?B?U1hscHRlMjBlSHBhWWlXTjR4eGovYUFDWnR3cHpKanhDMGgwa2lVME1BamZK?=
 =?utf-8?B?aVZqanpFblpvVWk1SURaY0puQ2lvTUVWZldJSWlSemJreHBqMW8wbyt5THdJ?=
 =?utf-8?B?cGdGYktMdjlocVFLU3ZhbkNLWTBTbFhleWZYMDNUNmUxejMzNDNEY01sQndi?=
 =?utf-8?B?Q2UwQW9LcEErakxXWkFKNXNWNUZoZnA1TWZUODNMVkhSMkFBSmZqd0ZJRU9S?=
 =?utf-8?B?cWhpazNVZW93RjhZcjhKeUVPdGZ2ZkpCUTdlbzBZeWl3NjZLMEp2MFNMVS8z?=
 =?utf-8?B?bXpGWG9ERmlCTFVCK2dsRVJqaEJRL0ZSbkJJLzhRZ3FEWEx1L2NvTGlZamlh?=
 =?utf-8?B?Q2dYQjczUkIxaXM2TTBkWmdUOHBPbmVpYzJ4Y2FxdGQySVVMRVNwaHdVWEli?=
 =?utf-8?B?MzJKM3VkWkhxUTB2V3kxa040UlBldHIrUDNLT0NWRTliNHJuRXNIUWdkNERE?=
 =?utf-8?B?KzJvVUsrekFudHNWaGp5cUx0QVJkNnJ0cWdRSDhBT0luMjRqcENYWXBmczNa?=
 =?utf-8?B?aGlYa2k4WDJldllGdU9rZGg3UWNhSFkwdm0xRkozV09Kb3NBdnY4ZmtGYkRX?=
 =?utf-8?B?Nzc5YWtXc2lINEFubTRuVFArVmJKTXdkMHVGYTJHSG0wdEJVYi94djQ0NUZk?=
 =?utf-8?B?U3RVWTI2UUtSaEFSUUtoSExsS3h0cU9TUVlCR0huWGhPMU5HT1d6THZUYlVR?=
 =?utf-8?B?aHFmLzMwVWw4cjk1bWFqSkZMZVBQdThVMjB1cS90emlRcGtuMSs1VVE1aEtq?=
 =?utf-8?B?emdJZ1Nyb2Q2Sis3L3NPMzZ4MjdUaW1hT0FpbzYybGhBZmpFMWlVcHZMZmRz?=
 =?utf-8?B?M0p5V2pQQW95NUxiNUVxamlkVU1NSm0vZHVwV0w4R3BhclJMM3hLM09KMkEw?=
 =?utf-8?B?dmg2TG9pcVdGcU5ZSTFJTFpKZzFqZjEwSG40UFlqa1FROUpySTc0SHd4ZXMw?=
 =?utf-8?B?NTlQWUwxU0dQV2RNOUh1ZjF6ZStuQ3J2b1MzMHRhcjcwMUFRVFJ0eWEwZDRa?=
 =?utf-8?B?S0lGSE9tNVcvTW5CTWs5dzdJQ0U2R1JJcjgyN2hVeUVLdXlsa3pnOEtXSUp0?=
 =?utf-8?B?Q04rcmpCWHFON25Gam0zRDhMTzF2eTdPd3ZSbWJNVjVhQTNhQnBYampsNFUz?=
 =?utf-8?B?bFF0OC9HbGtkcURZeGlZa3pPRXUxRXROT2lKRUUzSkNlMlp3RFRKbkJEYjd2?=
 =?utf-8?B?TnpCRkJaQU5UUlY1Z2RYQm5YNW0wci9peWlvUG5aYUl1UEsxeHppa2pPZmF2?=
 =?utf-8?B?aVVUVzdUWnZTY1JnRzVXbWVRRkdhR0lqb0tKQzhYZUwwUndsNlp5UmlMeTBk?=
 =?utf-8?B?VEtJK0gzY0Fxc3hJc1FETE5ScVRzWm9oNFBsQzNTMG1ISWFqSDlWSkV4aUV1?=
 =?utf-8?B?ZzZMNW5CSUR5Z1p1ektVTEtiOWJKNWhFaVQvVkpZQ0NabzZ3RHFuWUZ4SWxq?=
 =?utf-8?B?VHRvV1grNHRZZnhWdG0xeldJNThLTjFrbTh5WWN6TGl2RHFENmpWTnBPM0RN?=
 =?utf-8?B?MUNrd1VicFZIUHZjUEVtbVNRbGg2Q08zdVNZSzdNcUxYRlVxUDNiMEV2SjJp?=
 =?utf-8?B?bkFYSGZMNUpvclYvcjZJbmt5bVVwRVJqa1E0VEpsRTRLcU5QU1UwWG4rK0NM?=
 =?utf-8?B?QmExMTFNMGxzTmFwbTJTNlUzcTRnNnljNUxrcVRiM3lFdktiOThYU0pFWEhr?=
 =?utf-8?B?eEZsZE9zSEZrZFUwVXllaTFHYkE5eXZzZlp2VGdEUS9taGNlL3BzL1V6TU4v?=
 =?utf-8?B?cTh3ZkNEUlMrOFpHRnpTQ3puQjlDQ00xMm80OFZ2a2I1Q1pTNHI3UDQrWDNS?=
 =?utf-8?B?NVNnWURGZFpTNDdOSjZaK0kxR0Q0QWYvUzNEN0ZLRm0yYWpWZWIzcVQ3Z0xx?=
 =?utf-8?B?UGgxaE9tQ2Z6Qmc3cG1ydXlyK0I3MmRuYXJsb3dDSGh2bDJWVkV5UFRvZWVQ?=
 =?utf-8?B?S0JGVDArMkx2UitIUnk3c0ZlZ2wzZy9DcVZGR21acisrNkRWdVN0MTF1aGg0?=
 =?utf-8?B?MGNhVUluNDFKOGlOeTl4cEZ3VGFLZFhCWDV0QlRHU0hvWkkwSkNpM1dnN2Zy?=
 =?utf-8?B?SFE9PQ==?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 26b2901f-caf2-46d3-895d-08da68c3d5c6
X-MS-Exchange-CrossTenant-AuthSource: BLAPR10MB4835.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jul 2022 13:45:54.4096 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kcf1FCzmpD6nK2aaTgHRRHfclAqi33oUtKr6Bf6y0ETYoW6biyD1jgbLzYiu/JM0wao2yWsw8aj9NU+/UnKHMSjGDCkIZnTh+Xf8Y2JMTbE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR10MB4261
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-07-18_12,2022-07-18_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0
 bulkscore=0 malwarescore=0
 mlxscore=0 phishscore=0 mlxlogscore=999 suspectscore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2206140000
 definitions=main-2207180059
X-Proofpoint-GUID: K3sKqcLBCAvHBKS2fYOmz-N-yQe8CxeZ
X-Proofpoint-ORIG-GUID: K3sKqcLBCAvHBKS2fYOmz-N-yQe8CxeZ
Received-SPF: pass client-ip=205.220.177.32;
 envelope-from=joao.m.martins@oracle.com; helo=mx0b-00069f02.pphosted.com
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

On 7/18/22 14:10, Nikunj A. Dadhania wrote:
> On 7/18/2022 6:12 PM, Igor Mammedov wrote:
>> On Mon, 18 Jul 2022 13:47:34 +0530
>> Nikunj A Dadhania <nikunj@amd.com> wrote:
>>
>>> Currently it is possible to start a guest with memory that is beyond
>>> the addressable range of CPU and QEMU does not even warn about it.
>>> The default phys_bits is 40 and can address 1TB. However it allows to
>>> start a guest with greater than 1TB memory.
>>>
>>> Prevent this by erroring out in such a scenario.
>>>
>>> Reported-by: Shaju Abraham <Abraham.Shaju@amd.com>
>>> Signed-off-by: Nikunj A Dadhania <nikunj@amd.com>
>>
>>
>> Following shall care of your issue:
>> https://www.mail-archive.com/qemu-devel@nongnu.org/msg900136.html
> 
> Thanks, I tried out the patch series, I could start guest till 978G (not sure 
> why this magic number yet) and after that I start getting errors:

It's expected. The point of the series is meant to avoid attempting at DMA mapping
over the HyperTransport region. Before it would just fail to either hotplug/boot with VFIO
devices on kernels >= 5.4 (even if older kernels or other configs let you go through you
might still see IOMMU errors at some point). So what we essentially do is to have the
region above 4G to instead start at 1T, thus requiring 1 more phys-bit on cases like this
where the max gpa hits the Hyper Transport reserved region.

The cover-letter and this patch
(https://lore.kernel.org/qemu-devel/20220715171628.21437-11-joao.m.martins@oracle.com/)
should clarify on the logic.

The check you're adding here is essentially patch 9 of the series.

> 
> $ ./build/qemu-system-x86_64 -enable-kvm  -machine q35 -m 979G  -kernel bzImage -initrd initramfs.cpio -vga none -nographic -append "console=ttyS0,115200n8 earlyprintk=serial,ttyS0,115200 debug=1 " -nodefaults -serial stdio
> qemu-system-x86_64: Address space limit 0xffffffffff < 0x1fc3fffffff phys-bits too low (40)
> 
> Regards
> Nikunj

