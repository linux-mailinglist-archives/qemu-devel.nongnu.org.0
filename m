Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E7C553B1B0B
	for <lists+qemu-devel@lfdr.de>; Wed, 23 Jun 2021 15:24:15 +0200 (CEST)
Received: from localhost ([::1]:39114 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lw2rW-0008Sh-Fz
	for lists+qemu-devel@lfdr.de; Wed, 23 Jun 2021 09:24:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33164)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <joao.m.martins@oracle.com>)
 id 1lw2q6-0007nK-6P
 for qemu-devel@nongnu.org; Wed, 23 Jun 2021 09:22:46 -0400
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32]:6472)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <joao.m.martins@oracle.com>)
 id 1lw2q3-0000th-5s
 for qemu-devel@nongnu.org; Wed, 23 Jun 2021 09:22:45 -0400
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 15NDCJCk002950; Wed, 23 Jun 2021 13:22:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=subject : to : cc :
 references : from : message-id : date : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=corp-2020-01-29;
 bh=S0kGXK7P/ezgMVF3DmwF50X6b3qYVJa4HPLwEAPrXNM=;
 b=VVel3CZqXOMqo8a32OMnQL2iOL9oCu88t5aXb1t4T6kbft+JOxyhnX5yTZoFLP1KacsU
 gMMIEBBgpfCCkkq1g840dWQ4EV2TZKK8RRem0oZJ01ho9dh30c2x/hqYNFgPFJMAgK1p
 zmmL/VCfm5cmKHZGLJI9y0Ko6pnt1/tdndkVO4+fZhcz+3eeMDzpQaFeaw2rzC8f7kMA
 kTely3i4MpNFgotviEqtn/RsMgd708IkZfNKLo36PDyz7mLWfoAvz8mItlaU6sVDn5AR
 UJL+BnNNeROmxoYyITzy2WwVXobg9iU5q1NNGV/r7Ofh5V8Y0txhyKbTUlvVXsqRSEmE hQ== 
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
 by mx0b-00069f02.pphosted.com with ESMTP id 39b98vbst8-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 23 Jun 2021 13:22:38 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
 by aserp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 15NDBUNx183165;
 Wed, 23 Jun 2021 13:22:37 GMT
Received: from nam02-sn1-obe.outbound.protection.outlook.com
 (mail-sn1anam02lp2046.outbound.protection.outlook.com [104.47.57.46])
 by aserp3020.oracle.com with ESMTP id 3998d93puw-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 23 Jun 2021 13:22:37 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WlJin1qEMYE6rHTeWn8sMOzEjtu0WkRzjZn4oy7fncbhVFFOO+P4EREV5AgwTjxGnFVxnG/pk5EKqn3mV1m8IX5glxxac1DzTvRE3njSqJtRl589nvkR591VZ6r3TlwZmcy+Lxx7e1TX+Wx0OIB2izw7xCsC+GXrZrAKe6abg//FzFWGqaKOdIrtPsAVSBgiQ2bnYNFstiKJwz0YtEwHXDLW3QQL4BQCQICRwwsh3a0/LMH1sgpwPoQWgHD2FrtANLXEkcLHGb0Nje4y9blNGgYI7kPAp/s8inANuZhx3AHLitSDQ0vyiyKpyTrBn/t4HqHqSZ6tHg0BV73LFA8m9g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=S0kGXK7P/ezgMVF3DmwF50X6b3qYVJa4HPLwEAPrXNM=;
 b=JSfoWplJM7bwJSnQLHcrt7QSh83ogPsaSyYcuHwqsG6W3vmRUBxr3vK56PuePXAIiyaOjQuc41dEUCgOY1xlpgwVpcn0+ycDbNxnGavZIzyXUlfxo+OMbcJFfvxQIBii3ImL2W232OjthelDVogEErQrta5owS+t4p7iodx9jVzuU7fmuhbc5wLKo5i7P9OvmsUSXfHqhLZx0n292cFtmDZNqwFInptAS5q8BsjGZMyMlRKbl9QkRMh4j1igFodJU3QhsJzc6gRzVQvGEhbqc7k825U1qnLf44slF6oHuYeQFsf+EySIiVpAH2nO2AiStKHBIvPzExudtR6wJrn9vA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=S0kGXK7P/ezgMVF3DmwF50X6b3qYVJa4HPLwEAPrXNM=;
 b=gHQaXST/6EInMBLTddlR+avfXowq6FaGtBh7fttki7BgJjfFtckfa79KBZ76nzjJfKuWvCdWCs2KHRQn0SPiIywQ3L4JGCBYWAfrllYfgscpk1o0wzUJJwbxz0uGbxwFnacRlUufafTx4qjV8oFUBvT21fCHk/4R2Vee/PFZYwE=
Authentication-Results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=oracle.com;
Received: from BLAPR10MB4835.namprd10.prod.outlook.com (2603:10b6:208:331::11)
 by MN2PR10MB3982.namprd10.prod.outlook.com (2603:10b6:208:1bc::28)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4264.18; Wed, 23 Jun
 2021 13:22:35 +0000
Received: from BLAPR10MB4835.namprd10.prod.outlook.com
 ([fe80::d875:3dd7:c053:6582]) by BLAPR10MB4835.namprd10.prod.outlook.com
 ([fe80::d875:3dd7:c053:6582%5]) with mapi id 15.20.4264.018; Wed, 23 Jun 2021
 13:22:35 +0000
Subject: Re: [PATCH RFC 4/6] i386/pc: Keep PCI 64-bit hole within usable IOVA
 space
To: Igor Mammedov <imammedo@redhat.com>
References: <20210622154905.30858-1-joao.m.martins@oracle.com>
 <20210622154905.30858-5-joao.m.martins@oracle.com>
 <20210623143031.1dd7faa1@redhat.com>
From: Joao Martins <joao.m.martins@oracle.com>
Message-ID: <57664249-003c-7e62-2a16-925b3bb33418@oracle.com>
Date: Wed, 23 Jun 2021 14:22:29 +0100
In-Reply-To: <20210623143031.1dd7faa1@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [94.61.1.144]
X-ClientProxiedBy: LO2P265CA0426.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:a0::30) To BLAPR10MB4835.namprd10.prod.outlook.com
 (2603:10b6:208:331::11)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.1.67] (94.61.1.144) by
 LO2P265CA0426.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:a0::30) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4264.18 via Frontend Transport; Wed, 23 Jun 2021 13:22:34 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 067a34a7-bab1-4e1c-a6f0-08d93649f72f
X-MS-TrafficTypeDiagnostic: MN2PR10MB3982:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <MN2PR10MB3982B3EECD00F17E2D36874ABB089@MN2PR10MB3982.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2887;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 7x46eAL6f6LMTs7mvm0+1rwGwTurupd/AvVEZxrS13dfFcpOmVARc3OIjSHiLYBljQ42eqnG4i8+rlxwZ4U7hueUmbWSQmwzY9K6j/NpmSIxY92X1MvbrOQgLgwkSu/y4NZKxgACY8EbDzC33D2VairPdEjL2e0/6cygk7IzXZE7b2Ny6fenxmPvTln3Wogw5JsPVAuDFteZypBGoIuN+wYPe+whL/sEtuZ2F6eSvf5ZQwij+K13+7gPs4K+Qoj3WtDlUglOIuOWTAAJ71Qg/NE+YIDjoPQ5Q13zNWgcJL+GwesJ7DtdqB28CvQozZhe2XkiOvInTG/TIaE6E2PJukFcHz/8EUmeGDZa9cyeyBT0xw5wxC/wTu1hYMWZN/lxWnGR8wLW0cNz4oY0BgejqzL+o/w1hZPQmeWYrsJWetvWgYtP8kkNowchTZhXhuAyp+alwm4B9g1eqyHS0EF38wb4zb16/edUBo89xQJ2/Qm0FFL5+zLzb+L+kZI5M13sTynLPmOEHq9O2e2qetKJcjc82XN3OZPPriDq12lyjXlZVnH3tRn/MeW5jjMcbu7LLZ7b2mFr9plIFD3TrL0Iks24UfmemMjYPUhyEiuEdWTJv3NCYhsZNUHAaN+SifNyLzOVNTm+/nmSnHrpZRPXot3VM4xHPZ69Nbv8pm9jXbOalQGJWSVfJQ3DFRgde63Rx43QhPNIoqGJNC1dMwq0CA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BLAPR10MB4835.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(376002)(396003)(346002)(39860400002)(136003)(366004)(26005)(8936002)(16526019)(186003)(16576012)(316002)(53546011)(38100700002)(6486002)(4326008)(54906003)(2906002)(8676002)(66556008)(31686004)(956004)(83380400001)(2616005)(6916009)(36756003)(66946007)(478600001)(86362001)(66476007)(31696002)(5660300002)(6666004)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?K2FOcWZIdmx0L0kydVBzVkoySTJRYUxpV25acFZQUkY2MC84UTkzaFAydVhq?=
 =?utf-8?B?M3dxS0htdVlzdUx0KzlMVFhoNVhwOFE5WDdnNnFRZmdEcmlhU0IwcWczUUZZ?=
 =?utf-8?B?bENJdmpqRFZ4RGo4ZEEvdnpLZWdtTXEwNHU2Z3lSMUEraWhGUXViaWd2Z0Fi?=
 =?utf-8?B?NjV1NkNPUlVOMG0xeU9iL2p6MmZTUk5sZzh3cHkyREFXcEpzcjVhRTNRbUxG?=
 =?utf-8?B?K21KWjMweEpteVZ4cGZWY0w5UC9TTGI1T0lPSEVrZVpZZUFNd1hVN1ZRWkww?=
 =?utf-8?B?VDR6dnYwSnJMbWJqWk01Ry83TWI0RjRUa0lVZGlIZ0RtSXVoanlpcHF4NUFP?=
 =?utf-8?B?anNaR2U0WFk4RnYrZFBaZHZCbVRyaWNXaUxSVWQ2UUx4SlBSc3Vsenhsa0ht?=
 =?utf-8?B?WHJrUnAycmxMZFlDOVNYMHMzQXVxQ284NG9YV1MxcjR5emlmWmhyU0tEeENz?=
 =?utf-8?B?eDhQczRIWVkyUVVqLzNXdVpCRWswclVKTGhXb2ZsdWtEbC9aY1k2MUxTYXBW?=
 =?utf-8?B?YXpTV2h0ZWhVRUlVWWdQMXYwMkJLT0lTUFJpZDhZZlZPWStHdStGNFRRZUJa?=
 =?utf-8?B?MFZMdGZJdE5ORVhyNVNSSDZ3UmVQRHJXcW8zZ21SOVp4SWVhZ0Q0LzhoZ1Az?=
 =?utf-8?B?bTFSbVdLV3lMRCswbG0vOFNGWXZ6cGg4WkRCSFZ4M1UyclZkRFlWNXVEVGhz?=
 =?utf-8?B?UVJpUERDSW5BeXBMTlJHcU5wUkRZZDR0NHRBdXM0d1FOZVZwVnF3eUtiMERp?=
 =?utf-8?B?M3BlK3ZuZlZKMFVzT0VTYmlVUk5YR2dPYXVFRndTdGwxaEN5dVhzSnlnWVlv?=
 =?utf-8?B?dTZ5cllTNVQvMUZvZHNxRlhvZHZoV0J0MHFFUkxNdEd2TFd1cEJSaVY3Y0JN?=
 =?utf-8?B?UGpzRm1OZ1J3czRaZXR4RzVqeVZNOUhOM0VJZk9MVGptQ3Y5TkhYanJWaFBB?=
 =?utf-8?B?Q3Irc0VKZTdndjVTTEE4YlFMU0t6SWk0Z0FTQWhsWmlpYkJtMkt6VGM3YVA0?=
 =?utf-8?B?ZU1vdEUzWXhQR21lMUQ4OXlLOWVhTHpjNStrdWpXS3dWOEhrVnM3UmVnY3F6?=
 =?utf-8?B?VzlhdUtGT3lyOFBWT2tGUEUyOWdYOUZMTzdvSlIyUXh5MkNwbzVReDFuN1da?=
 =?utf-8?B?REJsYjlCb2R1ZWZPVXVHaWk1SVBWa2ZRbXcrUWZETG9jcUM5a3l5NHR4b3hX?=
 =?utf-8?B?L09vKzBJOWFHMkdPVWtwTG5ZQVA5UWtLc2lnSXRRWVJOekFUamJHRjVpak1Q?=
 =?utf-8?B?bng1cStuZUhVVFFKTS90NWF3VFdPd0pFZ3JxQ3poN2tvSlozcHMvWTBxdXBi?=
 =?utf-8?B?T0l3TTJTeFYrUy9TTzZlczA1QlUrdjliUWJXckQyYUt1RjlzMk9ld1dEY2dl?=
 =?utf-8?B?ODU4UXo2dy95MjY2MWhOeDVIcmU3V1p1NWtFY2lSSFpRU095VXlPRmd3RWxB?=
 =?utf-8?B?Y04vS2E4QXNycFNUUzNOQ2ZYV1ZtLzB5b2pibTlmSXBRRE1yckJDU1k0RmUw?=
 =?utf-8?B?US9zUm9qcm80TnVBVUN2WGYxZWJLdDFSTnNWbjZFTytWZ1VzMko0UytyMFln?=
 =?utf-8?B?V01tU2s5dGtBaHhiUEVCZ2ZQUFhQRVVKdnpnSkVwcUJuWmlJWG00a3RJTUdm?=
 =?utf-8?B?eVpYUkNkVEFIVzNTejd6dzNYb2FrZGFkV0NRTVl1dEZ5TTdJZ0UxM1Rsanly?=
 =?utf-8?B?SnBJVldtQ2lIbXFVK015UCtoRkt6Ym1Ea1ZCd3Jma3pQWnpjL1JHL1NHMW9H?=
 =?utf-8?Q?y8WQ5P72N5Nsq3d35AqBNXY8fA4FI0+tId7CUji?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 067a34a7-bab1-4e1c-a6f0-08d93649f72f
X-MS-Exchange-CrossTenant-AuthSource: BLAPR10MB4835.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jun 2021 13:22:35.8488 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Jd8yq+rjI5YfLDssPbAamC+qkScOQcIyFAgvWon3pCGNL9L8ug4BQnVSjsc5ItFfMzJvKXvwCdjBNIBItZZ/9V0AXooFi2bFmM6nZPQ1IkM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR10MB3982
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=10023
 signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0
 mlxscore=0 adultscore=0
 mlxlogscore=999 phishscore=0 suspectscore=0 bulkscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2104190000
 definitions=main-2106230077
X-Proofpoint-ORIG-GUID: s3j9286baYlMicrnXYY7FSC9uW3ytze1
X-Proofpoint-GUID: s3j9286baYlMicrnXYY7FSC9uW3ytze1
Received-SPF: pass client-ip=205.220.177.32;
 envelope-from=joao.m.martins@oracle.com; helo=mx0b-00069f02.pphosted.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Eduardo Habkost <ehabkost@redhat.com>,
 "Michael S . Tsirkin" <mst@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 Daniel Jordan <daniel.m.jordan@oracle.com>,
 David Edmondson <david.edmondson@oracle.com>,
 Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>,
 Paolo Bonzini <pbonzini@redhat.com>, lersek@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On 6/23/21 1:30 PM, Igor Mammedov wrote:
> On Tue, 22 Jun 2021 16:49:03 +0100
> Joao Martins <joao.m.martins@oracle.com> wrote:
> 
>> pci_memory initialized by q35 and i440fx is set to a range
>> of 0 .. UINT64_MAX, and as a consequence when ACPI and pci-host
>> pick the hole64_start it does not account for allowed IOVA ranges.
>>
>> Rather than blindly returning, round up the hole64_start
>> value to the allowable IOVA range, such that it accounts for
>> the 1Tb hole *on AMD*. On Intel it returns the input value
>> for hole64 start.
> 
> wouldn't that work only in case where guest firmware hadn't
> mapped any PCI bars above 4Gb (possibly in not allowed region).
> 
> Looking at Seabios, it uses reserved_memory_end as the start
> of PCI64 window. Not sure about OVMF,
>  CCing Laszlo.
> 
Hmmm, perhaps only in the case that I don't advertise the reserved
region (i.e. mem size not being big enough to let the guest know in
the e820). But then that it begs the question, should we then always
advertise the said HT region as reserved regardless of memory size?

>> Suggested-by: David Edmondson <david.edmondson@oracle.com>
>> Signed-off-by: Joao Martins <joao.m.martins@oracle.com>
>> ---
>>  hw/i386/pc.c         | 17 +++++++++++++++--
>>  hw/pci-host/i440fx.c |  4 +++-
>>  hw/pci-host/q35.c    |  4 +++-
>>  include/hw/i386/pc.h |  3 ++-
>>  4 files changed, 23 insertions(+), 5 deletions(-)
>>
>> diff --git a/hw/i386/pc.c b/hw/i386/pc.c
>> index 2e2ea82a4661..65885cc16037 100644
>> --- a/hw/i386/pc.c
>> +++ b/hw/i386/pc.c
>> @@ -1141,7 +1141,7 @@ void pc_memory_init(PCMachineState *pcms,
>>   * The 64bit pci hole starts after "above 4G RAM" and
>>   * potentially the space reserved for memory hotplug.
>>   */
>> -uint64_t pc_pci_hole64_start(void)
>> +uint64_t pc_pci_hole64_start(uint64_t size)
>>  {
>>      PCMachineState *pcms = PC_MACHINE(qdev_get_machine());
>>      PCMachineClass *pcmc = PC_MACHINE_GET_CLASS(pcms);
>> @@ -1155,12 +1155,25 @@ uint64_t pc_pci_hole64_start(void)
>>              hole64_start += memory_region_size(&ms->device_memory->mr);
>>          }
>>      } else {
>> -        hole64_start = 0x100000000ULL + x86ms->above_4g_mem_size;
>> +        if (!x86ms->above_1t_mem_size) {
>> +            hole64_start = 0x100000000ULL + x86ms->above_4g_mem_size;
>> +        } else {
>> +            hole64_start = x86ms->above_1t_maxram_start;
>> +        }
>>      }
> 
>> +    hole64_start = allowed_round_up(hole64_start, size);
> 
> I'm not sure but, might it cause problems if there were BARs placed
> by firmware in region below rounded up value?
> (i.e. ACPI description which uses PCI_HOST_PROP_PCI_HOLE_START property
> won't match whatever firmware programmed due to rounding pushing hole
> start up)
> 
But wouldn't then the problem be firmware ignoring E820 to avoid putting
firmware region where it shouldn't? Unless of course, it wasn't advertised
like I mentioned earlier.

>>      return ROUND_UP(hole64_start, 1 * GiB);
>>  }
>>  
>> +uint64_t pc_pci_hole64_start_aligned(uint64_t start, uint64_t size)
>> +{
>> +    if (nb_iova_ranges == DEFAULT_NR_USABLE_IOVAS) {
>> +        return start;
>> +    }
>> +    return allowed_round_up(start, size);
>> +}
>> +
>>  DeviceState *pc_vga_init(ISABus *isa_bus, PCIBus *pci_bus)
>>  {
>>      DeviceState *dev = NULL;
>> diff --git a/hw/pci-host/i440fx.c b/hw/pci-host/i440fx.c
>> index 28c9bae89944..e8eaebfe1034 100644
>> --- a/hw/pci-host/i440fx.c
>> +++ b/hw/pci-host/i440fx.c
>> @@ -163,8 +163,10 @@ static uint64_t i440fx_pcihost_get_pci_hole64_start_value(Object *obj)
>>      pci_bus_get_w64_range(h->bus, &w64);
>>      value = range_is_empty(&w64) ? 0 : range_lob(&w64);
>>      if (!value && s->pci_hole64_fix) {
>> -        value = pc_pci_hole64_start();
>> +        value = pc_pci_hole64_start(s->pci_hole64_size);
>>      }
>> +    /* This returns @value when not on AMD */
>> +    value = pc_pci_hole64_start_aligned(value, s->pci_hole64_size);
>>      return value;
>>  }
>>  
>> diff --git a/hw/pci-host/q35.c b/hw/pci-host/q35.c
>> index 2eb729dff585..d556eb965ddb 100644
>> --- a/hw/pci-host/q35.c
>> +++ b/hw/pci-host/q35.c
>> @@ -126,8 +126,10 @@ static uint64_t q35_host_get_pci_hole64_start_value(Object *obj)
>>      pci_bus_get_w64_range(h->bus, &w64);
>>      value = range_is_empty(&w64) ? 0 : range_lob(&w64);
>>      if (!value && s->pci_hole64_fix) {
>> -        value = pc_pci_hole64_start();
>> +        value = pc_pci_hole64_start(s->mch.pci_hole64_size);
>>      }
>> +    /* This returns @value when not on AMD */
>> +    value = pc_pci_hole64_start_aligned(value, s->mch.pci_hole64_size);
>>      return value;
>>  }
>>  
>> diff --git a/include/hw/i386/pc.h b/include/hw/i386/pc.h
>> index 73b8e2900c72..b924aef3a218 100644
>> --- a/include/hw/i386/pc.h
>> +++ b/include/hw/i386/pc.h
>> @@ -217,7 +217,8 @@ void pc_memory_init(PCMachineState *pcms,
>>                      MemoryRegion *system_memory,
>>                      MemoryRegion *rom_memory,
>>                      MemoryRegion **ram_memory);
>> -uint64_t pc_pci_hole64_start(void);
>> +uint64_t pc_pci_hole64_start(uint64_t size);
>> +uint64_t pc_pci_hole64_start_aligned(uint64_t value, uint64_t size);
>>  DeviceState *pc_vga_init(ISABus *isa_bus, PCIBus *pci_bus);
>>  void pc_basic_device_init(struct PCMachineState *pcms,
>>                            ISABus *isa_bus, qemu_irq *gsi,
> 

