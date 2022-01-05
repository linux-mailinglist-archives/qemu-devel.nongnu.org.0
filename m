Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BC050485C39
	for <lists+qemu-devel@lfdr.de>; Thu,  6 Jan 2022 00:26:29 +0100 (CET)
Received: from localhost ([::1]:35028 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n5Ffo-00050j-E3
	for lists+qemu-devel@lfdr.de; Wed, 05 Jan 2022 18:26:28 -0500
Received: from eggs.gnu.org ([209.51.188.92]:34924)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <steven.sistare@oracle.com>)
 id 1n5Fe8-0004Gz-FQ
 for qemu-devel@nongnu.org; Wed, 05 Jan 2022 18:24:44 -0500
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32]:32212)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <steven.sistare@oracle.com>)
 id 1n5Fe5-0004S2-VE
 for qemu-devel@nongnu.org; Wed, 05 Jan 2022 18:24:43 -0500
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 205N4xgr009805; 
 Wed, 5 Jan 2022 23:24:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=message-id : date :
 subject : to : cc : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=corp-2021-07-09;
 bh=AafXgm+X18pK59ZONPcJT3SQ+XxkFwwELE2pubn02gc=;
 b=NCsEN2CMQh+bbkKAq+CKMZGonbUDI3tuvLkZh/2d2kEcQbtStdAxxaRm3+JHws8t11R+
 pHObmg3iur6OaGcQR14osbJxPj6zzwM/UjeSMiq95uie0x32WrRra+qKoIBQvZE8GS/s
 VofBZ3nz8wSNd3JDQFxJoPDimw4EuQb++xTTp1UTTsXZQq+5Ct8pFtA+aXwY0468BY9E
 tL2pRrJ4jSsOEwPY1k4Ie/MkIvZzDOTfj/8aPmIBEjcZN/G78rRm2+BbgeKTFsWbB6aC
 7BaMUvUPFE6u1EIUI30cEbm37z7OiIXj/T+ZPdiObjUmLmlyix05FJS0JrkdiubtEixF XA== 
Received: from userp3030.oracle.com (userp3030.oracle.com [156.151.31.80])
 by mx0b-00069f02.pphosted.com with ESMTP id 3ddmpp80t8-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 05 Jan 2022 23:24:33 +0000
Received: from pps.filterd (userp3030.oracle.com [127.0.0.1])
 by userp3030.oracle.com (8.16.1.2/8.16.1.2) with SMTP id 205NFlv0076729;
 Wed, 5 Jan 2022 23:24:32 GMT
Received: from nam11-bn8-obe.outbound.protection.outlook.com
 (mail-bn8nam11lp2176.outbound.protection.outlook.com [104.47.58.176])
 by userp3030.oracle.com with ESMTP id 3ddmqbrtyb-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 05 Jan 2022 23:24:31 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JIHNbYOCMO2T156cY7pN/C5wfp0OEbmG5soIJxaD5vwQM5YjauaTb1b0Zr4SOT+RLhVlr2meMt1d8rN8ZX7Wyy0sLziMD4eM72wbZGzHryBmQcBr12VF+bF74fnS2PyEVRcTVZkvLBP/8spZWDJ5K3GoGO3RvYvQnDC2ZN9XxnTzUgzt4HGG0l3zY2PVfrw3toSlh5s6znBNQ9ZBUqg5SVFUfdY8wdTE15IAJ6tykVcyfzi201WHIJGjx4UeEq0MRIIG7bvIxz5KBGS1z1CKjw+iMmvWqIz3uoxo5qqQKM1z1fLJZs/02dMQiauoByblq8bkLdFlHYaV/3XtnIEFJg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AafXgm+X18pK59ZONPcJT3SQ+XxkFwwELE2pubn02gc=;
 b=hSNehKJHSTTEkjFisOIAH6K3Zpa1E9JwzTWxWv5CTdirfKTw/e7tkqGx9mGEwn6bG/X8nLKyVQVN5NUjZPdk11xakH0fXtR8BpUqG4kU41LOVtsPCXk5AGjj3tREg7kc52Frm8viG7ImYYtQnpaJAoDRttsDVGvOvbMrMJ+DIfb92UDU0jwsPI2P5+owc5Nivg1lfHyPSad3cr+H+akYdfWL1//jDytg90WDGMmS/rbsy+s/mB1agR4kwjrjJrZTwAJEpzHHec6ZA5OR6Kpx7l45XC4jLuAGsQrF/aLaPGkDiuQOPX17eNa5jA08Ka6ryuTHchOiEjW3xBL8Zg2iVA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AafXgm+X18pK59ZONPcJT3SQ+XxkFwwELE2pubn02gc=;
 b=N9J6D6aHN4yNPpSSbuDNzduP1eIBmfCgoGgCGh2zRa/PHj6k2fTgBFw1UW75r1vvzf2T+0s5ekHqPGobfRI+sT9EgpSQxNX3/FNNx5vLcdN/Lti5nLFvzVrz2w77MmcbBnBX/IeTh3RyWACpHxW2CYRdCu1Zb5ocAdUPJShUFzY=
Received: from BYAPR10MB3240.namprd10.prod.outlook.com (2603:10b6:a03:155::17)
 by SJ0PR10MB5407.namprd10.prod.outlook.com (2603:10b6:a03:302::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4867.7; Wed, 5 Jan
 2022 23:24:29 +0000
Received: from BYAPR10MB3240.namprd10.prod.outlook.com
 ([fe80::d91d:1a8b:56bd:6623]) by BYAPR10MB3240.namprd10.prod.outlook.com
 ([fe80::d91d:1a8b:56bd:6623%5]) with mapi id 15.20.4844.016; Wed, 5 Jan 2022
 23:24:29 +0000
Message-ID: <c080ec57-d9e1-3e1b-11ab-5bb3f9c13508@oracle.com>
Date: Wed, 5 Jan 2022 18:24:25 -0500
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.1
Subject: Re: [PATCH V7 19/29] vfio-pci: cpr part 1 (fd and dma)
Content-Language: en-US
To: "Michael S. Tsirkin" <mst@redhat.com>
References: <1640199934-455149-1-git-send-email-steven.sistare@oracle.com>
 <1640199934-455149-20-git-send-email-steven.sistare@oracle.com>
 <20211222181003-mutt-send-email-mst@kernel.org>
 <f1cadf51-795b-200c-8abb-f8f97b34c228@oracle.com>
 <20220105161046-mutt-send-email-mst@kernel.org>
 <e95009cf-aea2-7fc7-c049-687c1badc471@oracle.com>
 <20220105180332-mutt-send-email-mst@kernel.org>
From: Steven Sistare <steven.sistare@oracle.com>
Organization: Oracle Corporation
In-Reply-To: <20220105180332-mutt-send-email-mst@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SA9PR13CA0142.namprd13.prod.outlook.com
 (2603:10b6:806:27::27) To BYAPR10MB3240.namprd10.prod.outlook.com
 (2603:10b6:a03:155::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 64279d36-d2b4-4157-6e83-08d9d0a2855d
X-MS-TrafficTypeDiagnostic: SJ0PR10MB5407:EE_
X-Microsoft-Antispam-PRVS: <SJ0PR10MB5407FF51ABC27BE8578E013BF94B9@SJ0PR10MB5407.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: e9/8j16xpLt/LhKRnI5tnTNnGNF4iTKWQFN79iQAxVVEF97C2uLdVEuacwwT7iNyVKQWxFs+EpFFgxHhh+L3KwDuN0uS77I0MA1yt45PaFMwIl9HSOIk0vKgM+zi8CxfR9kwqD9rDq4uorsGieVjO4ZuB//YKYL7kJGpdyju3g1r4BYbPCdrnibvJmAZiX4T6Qux+e8qbghqPVnkInUjTmPuLN3aU2biDwghlxE4zBHEh0hUeltldTCkqQzDYcj24P05ml+imlT4brhTeifpz1ADfSjJ5h/aIvAROBPFGG0+XQHrJ4CmW/xyf0N/rdAwAFpfDtw8EE3vPQ4CSuHCfTuk4BOMwT4w6exTTRPaJglFy/2habHf088AVUMEWJiUrgVrM6stVPNYAVlmHLUgtb2oAkAvou46+yRwgJGC30VM40BX5jO/l9CkwynyEhz1FYWN271gIOfJo9eB4XPdLvFXj1QbH76zsUFcPyaIeDdsrvBNGW+/MstO6jK3N4kFMcv7v9XiViJsFn4G+8Ff7786dPrRZ3dpfT30ONomnDzcdXY3bAZ2AphXiDW4EF6qGFxRK4p73dO/IK8NFSjZ3GGI549b37NVPK8CIH9cDJ5OQwPlyNgyyCFKJxzN3C3qG3Ub/+idEXFO7FHXTZXVgRxYi9fpHEEI9ZoFAeYUIwhYPuHaDgdT5vyxHZ82+Mbzr4oe+tXZ0YKlAmfHBanDy5k0wnj8YIzVWN3Lp2yKlBQ=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR10MB3240.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(53546011)(31686004)(36756003)(6506007)(36916002)(31696002)(186003)(26005)(7416002)(508600001)(8936002)(8676002)(86362001)(54906003)(2906002)(5660300002)(4326008)(83380400001)(66556008)(66476007)(66946007)(44832011)(107886003)(2616005)(6512007)(6486002)(316002)(38100700002)(6916009)(6666004)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?YUxhTmNOK1ZaOERKb1FEbFlVK0VzUjIrc0NVZnpjK3ZzQTVkLytlSkd1OXg5?=
 =?utf-8?B?SFNBM2VXRlVwZ3pSbXdJMVBtL2RJNk03bzZSWmViczFOc21Za1ZBOEwvMDMz?=
 =?utf-8?B?Q1BWUkxyYysxUTgveDZqZDlndVpCZktRYzFrMy9scEVQRkYrVnF5UmNJbkxE?=
 =?utf-8?B?cFN1ck80WkJic0ZLWGFLTkp3bGxmaW4yS2FCYUQxNTR0NGNidGlUTFkvR1dL?=
 =?utf-8?B?NmxJNzA0a0ZFK2JZL1RYeVhyREllN0tjVEd5U3U0dEdudmZxUk1wdDYweXJB?=
 =?utf-8?B?RytQUnAzYUVhaXAxMTdNVUZsT28wS1N0VS9VMmxlaStEbCs4ZXlJTHNkMExi?=
 =?utf-8?B?TTI0ZmR4UnpocmxIbUNFMk1qdGUxR2VpcjR0OGVsdmxrRzJrT2dLeUxhbUsv?=
 =?utf-8?B?TDd6TS92OGx0SFJTQTJyUUlGNWlqY2FqRUFiWWdkbFBLaWFtRTlOelRBcVlS?=
 =?utf-8?B?WGhqZHpEQXNoOG11RVB3SkZyaGl4d0JrZzZHbTVQaVVTcUx2TDhsVGNNV2ln?=
 =?utf-8?B?K2ZhR21aZzI2aC8zZGFjYjNFcVlwczhYRHEvWkVKeURESFdsQ3gyVkYzM05n?=
 =?utf-8?B?SWJWQW1GL1NDOW5QTnI5elRqK0Flam9SaTNGRHUvQ2dMU3hWQzBjOHZleUtu?=
 =?utf-8?B?Wm1UVTY1SGg1Uk01Wm9laGVOcnhPZk5wWFltN29LdmZxU21YbCtudkpVWFhu?=
 =?utf-8?B?ZWdDd0lWMGNOaVAvVTBvaXFrNlRPc0VYZ0k0K0dhNEJzZUZwbmhCUzd3d0lx?=
 =?utf-8?B?eTcrSGlvaEw2bGJVS2xlMXBGWG04bGhVQVd1dVlFSlp6UFh4VGhHU2ZOakJl?=
 =?utf-8?B?TmNCOGdOT212a1JqZHRKM2NkRE9vWkhJeFNnQVN5djZJK0E5V2o1WnhCNUVk?=
 =?utf-8?B?YnhOMGE2N3p6SmlUZVFTbkNaaGpCcUJUeGt2emNyZGhIS0JUcERHckp6RzBB?=
 =?utf-8?B?VWZjbm12djVTZlRyL1ZWNnk1c3dyUmN2U0xmVHVhOU1CRlc5TUJseTY1SW5u?=
 =?utf-8?B?Q1lDbXpRRWltbWlJN2hTODJVMjlGS3VHL3FkMUh5NHlmNCtXckh0d1MzamZD?=
 =?utf-8?B?YU4xWkVpQUhuQWtaUXRkbFpvYWNTMXRkbTRuWTl4T1ZNVmE4WXFtdTlGVE16?=
 =?utf-8?B?WXNnWUZ2K0hOUzZyTzlyM2xTM2pqVndnQTdPU3JMYkY1U3RiQUdBbllXU0w4?=
 =?utf-8?B?RjFTRmoxcXh5Wmp5TVFYUzNOdEpTVFkxZEhubW0rYjF6WHo0ZVFGTEp3Vy9S?=
 =?utf-8?B?V1p3aDRXZTlocFJoSjNmNzRKSXhTOWVlMzM2ajhXNjJZRlRwT1FoeXNLKzRj?=
 =?utf-8?B?d3R3OGkvZFA1eTk4RVVGdmVqQS9qdTZ0SUl3ekRFRVBkSFAzbDdDb0dnWnhl?=
 =?utf-8?B?SldldmoxV3RkV3FORXFYbEV4Ky9SRFMzeGdRKy9KdXAwY1o4M3lnMDBMa1E0?=
 =?utf-8?B?MUh3SmJqdURjcW5mSThINGlvRmgxR2tSckZiQ250VUN1Y1dmN1lWa1BWZStP?=
 =?utf-8?B?WHhkT2VacENuanV4ZnAzTS8vS2RMVisybC9IM0NqdXRGV21lU2R3VkN4dmo1?=
 =?utf-8?B?Z1VKRnF0MjROSkVRYk8rcGNxMmttdGV1R29vYkdGN1FUcFdKOCtHZGJsNFQz?=
 =?utf-8?B?VFM2OVNHUzJFRXZ2VWdjQldhU0xLOHB0V2d4eVRabUpKdXkxU25CWnVZbENS?=
 =?utf-8?B?NnRqOEsyS2JXZ3NLbWJXZHZZSUpGNjZFUEY0ZG94R0dTdzBvWDJIa244VWZu?=
 =?utf-8?B?VEdWUFFnRDdUOWl3blMyYS9YM29hd0lHTndCMHE5eEFSSVZyMW1RZkttSWhj?=
 =?utf-8?B?NWNrS29xN1dxT043bVZaS3psNjRIZmpGN1RObEZhRGY2RXBDV1Vrby9PNEYx?=
 =?utf-8?B?MmZsNHpoMERQNlZ3Tk5OeUJ6akl2MW8vS1QrNW15MTVBUThqT0NhZjZBcEVF?=
 =?utf-8?B?cFFkV2pPbGUyZFhIWnBDRml4WjBZZEJLT3UzOEJVTklRbzVlVEpiaFNsYTJQ?=
 =?utf-8?B?MFVPYmt3dnEyODVWajkzWVN2cjlnVjBUYU9lZmlseDN0cW5INk5La0NyOTJ4?=
 =?utf-8?B?blN2SVRwTzArcHZZNHdnbHBaQU1zS3NNeUVYZ3V4YW9YUnZQZnhubUtpVEpi?=
 =?utf-8?B?ZUU2N2tlbU83dXFjdkdPTzFIYU9BR3l3M1NLWnVXOFZaWWM5a015SUJ6dm12?=
 =?utf-8?B?UmpoZGs4U3F5bVBLUkh1VUtaNllVZ0JHeTk2MFN3RUlvYWYxeFhtdTBOOUY4?=
 =?utf-8?B?M0xPN0tpMkoySmY1Z3J4bWV2Rkt3PT0=?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 64279d36-d2b4-4157-6e83-08d9d0a2855d
X-MS-Exchange-CrossTenant-AuthSource: BYAPR10MB3240.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jan 2022 23:24:29.3220 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vC1Xyf4ryY1z6ZPybJEkN4IlHCpTJ+DYu4Uc+51uNg4qm7GT/I7tEJIxz9lveAMOTu8jysVtXTfTkTTxgrsvPWbTxd+uSIMZpMmfuNUOlYI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR10MB5407
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10218
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0
 bulkscore=0 mlxscore=0
 malwarescore=0 suspectscore=0 mlxlogscore=999 spamscore=0 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2112160000
 definitions=main-2201050148
X-Proofpoint-ORIG-GUID: HoNoDxis22CJloDF6yyLOurYnX_TunNC
X-Proofpoint-GUID: HoNoDxis22CJloDF6yyLOurYnX_TunNC
Received-SPF: pass client-ip=205.220.177.32;
 envelope-from=steven.sistare@oracle.com; helo=mx0b-00069f02.pphosted.com
X-Spam_score_int: -38
X-Spam_score: -3.9
X-Spam_bar: ---
X-Spam_report: (-3.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.057,
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
Cc: "Daniel P. Berrange" <berrange@redhat.com>,
 Juan Quintela <quintela@redhat.com>, Jason Zeng <jason.zeng@linux.intel.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>, qemu-devel@nongnu.org,
 Eric Blake <eblake@redhat.com>, "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Zheng Chuan <zhengchuan@huawei.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 Markus Armbruster <armbru@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 1/5/2022 6:09 PM, Michael S. Tsirkin wrote:
> On Wed, Jan 05, 2022 at 04:40:43PM -0500, Steven Sistare wrote:
>> On 1/5/2022 4:14 PM, Michael S. Tsirkin wrote:
>>> On Wed, Jan 05, 2022 at 12:24:21PM -0500, Steven Sistare wrote:
>>>> On 12/22/2021 6:15 PM, Michael S. Tsirkin wrote:
>>>>> On Wed, Dec 22, 2021 at 11:05:24AM -0800, Steve Sistare wrote:
>>>>>> Enable vfio-pci devices to be saved and restored across an exec restart
>>>>>> of qemu.
>>>>>>
>>>>>> At vfio creation time, save the value of vfio container, group, and device
>>>>>> descriptors in cpr state.
>>>>>>
>>>>>> In cpr-save and cpr-exec, suspend the use of virtual addresses in DMA
>>>>>> mappings with VFIO_DMA_UNMAP_FLAG_VADDR, because guest ram will be remapped
>>>>>> at a different VA after exec.  DMA to already-mapped pages continues.  Save
>>>>>> the msi message area as part of vfio-pci vmstate, save the interrupt and
>>>>>> notifier eventfd's in cpr state, and clear the close-on-exec flag for the
>>>>>> vfio descriptors.  The flag is not cleared earlier because the descriptors
>>>>>> should not persist across miscellaneous fork and exec calls that may be
>>>>>> performed during normal operation.
>>>>>>
>>>>>> On qemu restart, vfio_realize() finds the saved descriptors, uses
>>>>>> the descriptors, and notes that the device is being reused.  Device and
>>>>>> iommu state is already configured, so operations in vfio_realize that
>>>>>> would modify the configuration are skipped for a reused device, including
>>>>>> vfio ioctl's and writes to PCI configuration space.  The result is that
>>>>>> vfio_realize constructs qemu data structures that reflect the current
>>>>>> state of the device.  However, the reconstruction is not complete until
>>>>>> cpr-load is called. cpr-load loads the msi data and finds eventfds in cpr
>>>>>> state.  It rebuilds vector data structures and attaches the interrupts to
>>>>>> the new KVM instance.  cpr-load then invokes the main vfio listener callback,
>>>>>> which walks the flattened ranges of the vfio_address_spaces and calls
>>>>>> VFIO_DMA_MAP_FLAG_VADDR to inform the kernel of the new VA's.  Lastly, it
>>>>>> starts the VM and suppresses vfio pci device reset.
>>>>>>
>>>>>> This functionality is delivered by 3 patches for clarity.  Part 1 handles
>>>>>> device file descriptors and DMA.  Part 2 adds eventfd and MSI/MSI-X vector
>>>>>> support.  Part 3 adds INTX support.
>>>>>>
>>>>>> Signed-off-by: Steve Sistare <steven.sistare@oracle.com>
>>>>>> ---
>>>>>>  MAINTAINERS                   |   1 +
>>>>>>  hw/pci/pci.c                  |  10 ++++
>>>>>>  hw/vfio/common.c              | 115 ++++++++++++++++++++++++++++++++++++++----
>>>>>>  hw/vfio/cpr.c                 |  94 ++++++++++++++++++++++++++++++++++
>>>>>>  hw/vfio/meson.build           |   1 +
>>>>>>  hw/vfio/pci.c                 |  77 ++++++++++++++++++++++++++++
>>>>>>  hw/vfio/trace-events          |   1 +
>>>>>>  include/hw/pci/pci.h          |   1 +
>>>>>>  include/hw/vfio/vfio-common.h |   8 +++
>>>>>>  include/migration/cpr.h       |   3 ++
>>>>>>  migration/cpr.c               |  10 +++-
>>>>>>  migration/target.c            |  14 +++++
>>>>>>  12 files changed, 324 insertions(+), 11 deletions(-)
>>>>>>  create mode 100644 hw/vfio/cpr.c
>>>>>>
>>>>>> diff --git a/MAINTAINERS b/MAINTAINERS
>>>>>> index cfe7480..feed239 100644
>>>>>> --- a/MAINTAINERS
>>>>>> +++ b/MAINTAINERS
>>>>>> @@ -2992,6 +2992,7 @@ CPR
>>>>>>  M: Steve Sistare <steven.sistare@oracle.com>
>>>>>>  M: Mark Kanda <mark.kanda@oracle.com>
>>>>>>  S: Maintained
>>>>>> +F: hw/vfio/cpr.c
>>>>>>  F: include/migration/cpr.h
>>>>>>  F: migration/cpr.c
>>>>>>  F: qapi/cpr.json
>>>>>> diff --git a/hw/pci/pci.c b/hw/pci/pci.c
>>>>>> index 0fd21e1..e35df4f 100644
>>>>>> --- a/hw/pci/pci.c
>>>>>> +++ b/hw/pci/pci.c
>>>>>> @@ -307,6 +307,16 @@ static void pci_do_device_reset(PCIDevice *dev)
>>>>>>  {
>>>>>>      int r;
>>>>>>  
>>>>>> +    /*
>>>>>> +     * A reused vfio-pci device is already configured, so do not reset it
>>>>>> +     * during qemu_system_reset prior to cpr-load, else interrupts may be
>>>>>> +     * lost.  By contrast, pure-virtual pci devices may be reset here and
>>>>>> +     * updated with new state in cpr-load with no ill effects.
>>>>>> +     */
>>>>>> +    if (dev->reused) {
>>>>>> +        return;
>>>>>> +    }
>>>>>> +
>>>>>>      pci_device_deassert_intx(dev);
>>>>>>      assert(dev->irq_state == 0);
>>>>>>  
>>>>>
>>>>>
>>>>> Hmm that's a weird thing to do. I suspect this works because
>>>>> "reused" means something like "in the process of being restored"?
>>>>> Because clearly, we do not want to skip this part e.g. when
>>>>> guest resets the device.
>>>>
>>>> Exactly.  vfio_realize sets the flag if it detects the device is reused during
>>>> a restart, and vfio_pci_post_load clears the reused flag.
>>>>
>>>>> So a better name could be called for, but really I don't
>>>>> love how vfio gets to poke at internal PCI state.
>>>>> I'd rather we found a way just not to call this function.
>>>>> If we can't, maybe an explicit API, and make it
>>>>> actually say what it's doing?
>>>>
>>>> How about:
>>>>
>>>> pci_set_restore(PCIDevice *dev) { dev->restore = true; }
>>>> pci_clr_restore(PCIDevice *dev) { dev->restore = false; }
>>>>
>>>> vfio_realize()
>>>>   pci_set_restore(pdev)
>>>>
>>>> vfio_pci_post_load()
>>>>   pci_clr_restore(pdev)
>>>>
>>>> pci_do_device_reset()
>>>>     if (dev->restore)
>>>>         return;
>>>>
>>>> - Steve
>>>
>>>
>>> Not too bad. I'd like a better definition of what dev->restore is
>>> exactly and to add them in comments near where it
>>> is defined and used.
>>
>> Will do.
>>
>>> E.g. does this mean "device is being restored because of qemu restart"?
>>>
>>> Do we need a per device flag for this thing or would a global
>>> "qemu restart in progress" flag be enough?
>>
>> A global flag (or function, which already exists) would suppress reset for all
>> PCI devices, not just vfio-pci.  I am concerned that for some devices, vmstate 
>> load may implicitly depend on the device having been reset for correctness, by 
>> virtue of some fields being initialized in the reset function.
>>
>> - Steve
> 
> So just so I understand, how do these other devices work with restart?
> Do they use the save/loadvm machinery? And the reason vfio doesn't
> is because it generally does not support savevm/loadvm?

They all use save/loadvm.  vfio-pci also uses save/loadvm to preserve its soft state,
plus it preserves its device descriptors.  The only bit we are skipping is the reset
function for vfio-pci, because the hardware device is actively processing dma and 
interrupts, and they would be lost.  Reset is called unconditionally for all devices 
during qemu startup, prior to loadvm, by the path qdev_machine_creation_done() ->
qemu_system_reset().

- Steve

