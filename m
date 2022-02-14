Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F396E4B52F3
	for <lists+qemu-devel@lfdr.de>; Mon, 14 Feb 2022 15:16:24 +0100 (CET)
Received: from localhost ([::1]:51830 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nJc9P-0002jz-TJ
	for lists+qemu-devel@lfdr.de; Mon, 14 Feb 2022 09:16:23 -0500
Received: from eggs.gnu.org ([209.51.188.92]:60150)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <joao.m.martins@oracle.com>)
 id 1nJbIU-0002Km-CE
 for qemu-devel@nongnu.org; Mon, 14 Feb 2022 08:21:42 -0500
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32]:4442)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <joao.m.martins@oracle.com>)
 id 1nJbIQ-0003hw-9S
 for qemu-devel@nongnu.org; Mon, 14 Feb 2022 08:21:42 -0500
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 21EAOY6C021606; 
 Mon, 14 Feb 2022 13:21:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=message-id : date :
 subject : to : cc : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=corp-2021-07-09;
 bh=J9c0D7jGmGdgk3ctoxSnb4MLNZ0TBcmm5f5+OgwSt0M=;
 b=oWQ0TjOOY+Lg89c2UU3f9Fz+thr9Rd0PASqeJsuDcefJn2N98yuai7D9jpOqA/qgFv4D
 LZt8gTFgmT3e1P77vd/DuH80ATSgOyYk0YkfJg7lzMyP0xUSIN8S5dLcOMnjXOzL0YmB
 54U+F+vusOYWxYF8Dd+APzRmVDkDEXkiEQ91bf6xgpYFDEf2MqyjentJeTYrhajjpv8l
 BYRcZ3MNHQYVtjZazaVV58v3ncxfBSFHXer2jj1AYqRyuxKqpBeHXJwRmgwRRJgMF+yU
 bqJKTssDS3swZSZaWlRMv4cobUCsxmLaSZNT3VGLoG/L8oyxhqjuNxpb24BWv6bUtQ1x kQ== 
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
 by mx0b-00069f02.pphosted.com with ESMTP id 3e63p24har-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 14 Feb 2022 13:21:34 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
 by userp3020.oracle.com (8.16.1.2/8.16.1.2) with SMTP id 21EDAiSq165343;
 Mon, 14 Feb 2022 13:21:33 GMT
Received: from nam11-co1-obe.outbound.protection.outlook.com
 (mail-co1nam11lp2177.outbound.protection.outlook.com [104.47.56.177])
 by userp3020.oracle.com with ESMTP id 3e66bm107w-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 14 Feb 2022 13:21:33 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=e+jHy/7EZpXWJ1iNB4xczMTbMm52/KCcqOuHuXYCU8Zd1fx4CLkWc0lDgr3bsClEcXu0w2Kl5y6oH4BvTpjMLanZLP/2TArv8NpBuIrc3Td33zdsEytitAHNWUuIilHnofqEvrS4GbaI10L00bp7PzseyFnky8VXcKHcd/v31JgkHL2AW3bfE1FUcckyHlOYPLHW2nHSTMWGv4DJgI5OpIvomxYf2etm507pD5Xrh7mCz2vzWJXQVx/kdO0IugZaVRWzMguQVUbTXgjjmN/4JxHXdtfoKyz7tEBiZ34l2ZKWjTbGsoLhuyYsFtsmyIFWxTy2OQgFRyDUq5s40UJQfg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=J9c0D7jGmGdgk3ctoxSnb4MLNZ0TBcmm5f5+OgwSt0M=;
 b=EsfKPa5nymsYCK9K/x4QgNMDHnjo0n99meBpzFkklmgYhKhP1k3+QOuPaZbzgeLhCKgt1we8r9iWInVRz/Lxscw5Kx4mbmv3lQqouN0UH9HoJwMzLYqRhYeZwEzqU7wgnaOfsE7SOHIqtKb++x4qz9R77fd+zEC+t6B/izxmrFi7vtyAQxoHJA+zjPuXgVoqm3P7VcnDPrAw2ixMyldrQSjxO+Zr9M6AAzFoq4fN1ilHF1FZKn4r85xa5pouFjfCVRD1162/77gP1wHkPB1W/7hbXrEOQN1WoD3DK0v0Faos9HjRZJyyf5noM6uiKnQqHMNvCitJBJQ+PA4KQAE6dA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=J9c0D7jGmGdgk3ctoxSnb4MLNZ0TBcmm5f5+OgwSt0M=;
 b=JMmwORq13XJYZurfqUZCxaWvGujJXo603ke5tFkWpLtCvFbhhACk+CS7Q4myV1419zZRAuDwPsAmwu5iDB5Hqh8Oq1k2kb/Nfu7uzweO5EIY+AI+m4xMBYmHBxw8HvG1h3QpyXuDPYLI7FbUskPFdRN2JaXhb5IoR8gnvVo5fE4=
Received: from BLAPR10MB4835.namprd10.prod.outlook.com (2603:10b6:208:331::11)
 by BY5PR10MB3777.namprd10.prod.outlook.com (2603:10b6:a03:1b5::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4975.12; Mon, 14 Feb
 2022 13:21:30 +0000
Received: from BLAPR10MB4835.namprd10.prod.outlook.com
 ([fe80::4910:964a:4156:242a]) by BLAPR10MB4835.namprd10.prod.outlook.com
 ([fe80::4910:964a:4156:242a%5]) with mapi id 15.20.4975.019; Mon, 14 Feb 2022
 13:21:30 +0000
Message-ID: <cec28541-17cd-04ba-67fe-96255102df4f@oracle.com>
Date: Mon, 14 Feb 2022 13:21:23 +0000
Subject: Re: [PATCH RFCv2 1/4] hw/i386: add 4g boundary start to
 X86MachineState
Content-Language: en-US
To: Igor Mammedov <imammedo@redhat.com>
References: <20220207202422.31582-1-joao.m.martins@oracle.com>
 <20220207202422.31582-2-joao.m.martins@oracle.com>
 <20220214141931.61b87d43@redhat.com>
From: Joao Martins <joao.m.martins@oracle.com>
In-Reply-To: <20220214141931.61b87d43@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO2P123CA0044.GBRP123.PROD.OUTLOOK.COM (2603:10a6:600::32)
 To BLAPR10MB4835.namprd10.prod.outlook.com
 (2603:10b6:208:331::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 24d3c1ee-7af2-4cc3-226b-08d9efbce9cd
X-MS-TrafficTypeDiagnostic: BY5PR10MB3777:EE_
X-Microsoft-Antispam-PRVS: <BY5PR10MB377724D0F6D5F2079B2FB907BB339@BY5PR10MB3777.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5797;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: vILv+b4thWWsDo5Wv8+Lli+gKdpyuIiHPkV3gBUIw6k6Uj9Es18T837V1cFimFBLhl9gyTI0c+qlvHV2wY74JuPw4IB54ph7V0U7kHYECzURSXYZxHoJ1IW8ymTFI2I2pqLkWXLek2q/lbZWjfhGQ9JO3ncgzx28fc4J6elQRNDyC0WeXQ3QJ9quwHzEUFjxKyGcsaCjYXSElW5RS6e8xs0lKP5HH1QoX76/dY2ToLA+Tay3rfwslcWp+pdK/VnCXigNe4D6q0Mv6MALefPighkX6uiUuZxV6t6LX6Z9RydGT6GLRi3qnM4asxAmCpIgsg1WvfxvPG2+kfwfK47YDW4tSDLskgN6UBK1DKGI0W0dnSVmjH8RmUVPsEYSADGsWBlVRLm5icoBVlKjffLlup/5kKxeTisfV0xyZtQfxFHi/M+gG/G4Fc4ijz0dWFoatuY+TqiOXqB7EDy7A+Dek+7A+3I3MgVnXUWBIMkNX8iJGp+f4HcqSwCgE7d15mgpqvYnK/uUIaIZMP2BP2TuxBebaW8kVmJFmf1XNFd37MhW/YqESix9FOM1lzDXi8n8+K/EcbJpGLUhuM0z4eGu28N2nw/9BNfDiIu5e7RO55VAhXxLujNgNiRomPk5qqX//0HV6NqVXmM+Dxaax9oxJGDfnWnWf2eVAAenPqhwNfakZ1KQbuwaBBQj91vG6F7JhPVgN2C+JwhoUjRZRipjyg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BLAPR10MB4835.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(31686004)(26005)(4744005)(36756003)(186003)(5660300002)(8936002)(2906002)(38100700002)(316002)(6666004)(66946007)(66476007)(53546011)(66556008)(4326008)(8676002)(6506007)(86362001)(54906003)(31696002)(6916009)(508600001)(6486002)(2616005)(6512007)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UWVIOFlXY3llMFoxN3YwRHcyY2tTMyt1RHc2NTFjUXp4bGhFRHAzQUl3UXI2?=
 =?utf-8?B?Ty9UVWFYNmFvZ0M5UVJjTnZsM1V0aWUzSS9qY1VIMlVSTnZmRHBzOWgzenJ4?=
 =?utf-8?B?dFdmYk51MmdZUmN4bzJBd2xSamw2cHIwa2xXZEM5NjlQZkdNcmRQNUpJbzd6?=
 =?utf-8?B?TWdMOXI2V3lyVmdWYXBoUnpzRUFvbG5uYWtiM05pM2lUeHV4c3JvS2Q3eElC?=
 =?utf-8?B?Q09IMjJRa1FLdGNxQTZCNEpTaU5uVW5rRm9aLzQ5WFJvQkN3R3R4S2JhdFg0?=
 =?utf-8?B?YVNQUzAzeDFuMEx4RncxMlAyeTV4cWU0NzY5a1I1bllhK0ZONHhsRWVNMHQ1?=
 =?utf-8?B?eHJzMHF1Q1UzcWVpT1F2a1R2Sk1hZWFmdll3VnRBdE5idkF2TjExQlJ5R0tN?=
 =?utf-8?B?blRMc3ZZeWRwTFd4ZkdQcTI3dE9LajQ1eTNCM1phRzVlQmptQXBEd0M1azdL?=
 =?utf-8?B?NUcwaG5GQWx1OS9nN2U0QXFRaHlpblNWZlk4c1psOVhtSUZCVGRYdmRVQ3dF?=
 =?utf-8?B?b1plbWYrd05SK3NpRzJsUGV2MW1QQmZsUGJhMWJhU1Y4U2llb0NYMlk0QkdV?=
 =?utf-8?B?VnBEei9oUW82Tnd1dmhmSlZvaWNlSWRBaEZBK0QzNENTdGRtZDRXR3dmYkRq?=
 =?utf-8?B?Ylk2VEZFNXRSRTU4Q3l0QUFGcms4ZnVMWnc2bDVFU0g0R2xiakswWGlSUndr?=
 =?utf-8?B?aWh1RFpUSXJIT1crb245UThvZWw3dlFuaEt0VmtnOWErWllzOHVJdDN2TUNZ?=
 =?utf-8?B?V29ZdkxrVVg1MUwvdkVzbzdyVndjb1FPSUVJNzEva1hpVjlyQW5sSTB2WWl3?=
 =?utf-8?B?Um56NU9pcnRlTlFrR29JVDl6VDZlaEJ1cExkRmo2bkV6MEwwaVpDMU5WWi9O?=
 =?utf-8?B?VWRtOGprN0N3RGk3c0VZZ2dWODgxZGZZbGwyN2k1YjJOVXoyRGFTd0tCM3hJ?=
 =?utf-8?B?WWtVS0lhMW1sZStvUHAwZFd1cXN3S25BbVBjYVBtclNyMTNmdUkvS3RRWTZT?=
 =?utf-8?B?dGQ2L1FCMXZaMmI5cXZ2RFZGVk1leHVjUGdYYkhmdE1uVlhIUWFUOHltS3lH?=
 =?utf-8?B?d0VFWHRIb1ZDekNJanhqYUZzdW1PeTdpbklHZ3V0UVJRNkdDeWpmdFZWbjQx?=
 =?utf-8?B?ZmNkNWRFdDYzK29lVGNTU3hXZ3NlTkYwTXo4eDh6blJlZ05BbUQ3aXZzay91?=
 =?utf-8?B?UUJ3M2w3RXVtRG0xd3orNXQvMmUybWFQdEI3ZUlaM05sc2EyaHI1VWR6aHR5?=
 =?utf-8?B?Sm9XeHBDSThtOEZmZWJmbVF3TXNwQjkzeU0yRWJUY21nUDh4Q1FCQ3VPbFdF?=
 =?utf-8?B?a29jZVNtL3BuZWxSek9zWnFxUW04MjlyVGJZeDhJeFRFTzhTeWt1dDJ5aUtj?=
 =?utf-8?B?cTVvSUpqK2FmWmU4RVY5NEdZWmJjZG5FUm8vUmJSQWxOY1hkMi9kSTF2ZkRZ?=
 =?utf-8?B?UXhOenhtQ21qM2JXcmdPYmNGcnJCUlBwWkdpLzh4QS9FUGNlVC9sLzRGRUlk?=
 =?utf-8?B?RDBOSy9RWUQzS1M4UHNuUlF1YzBtR2l2MTh2dWxBZVVLcVR4QTBjY1Y5Wm90?=
 =?utf-8?B?bVZXWlhLSTgrdXJHQ2J5QjdZTmJMQ2lXR292N2hIT3p0QkRpTnhBQVFuKzRF?=
 =?utf-8?B?NklXWXV5aFdjOCtpd0hXbDQySzRiNnFVd2Y0ZUtURmR0VWlESkRCNnp4RXFl?=
 =?utf-8?B?UXl6WHlkRnczcEFWWUR0YkRDRWN5S2NpVUdnWnF4MmQyeGdOU3VYZmFaRU9q?=
 =?utf-8?B?UlBiMERMemd5enc1eE1DeEM4cDBTTy9rVEZhMWdNR0VBdVMycitubTc5M1hJ?=
 =?utf-8?B?MzFZZEhZQnZSd3RxRHBNS21hRW9jNncxN00rYkY5MmZnaE02ME1Mc1ludm1O?=
 =?utf-8?B?Zm9YTG0zbm1mYTJRWDVGbFhSQnRCallvcEhIRUEvOUx4RjNNL1RTM2tGWDMw?=
 =?utf-8?B?OHcwSVczRmRtME5CbU0yREtGRWl6TzhRVWlTNnFER0pmajNBRXhESVJJNTdS?=
 =?utf-8?B?OUQ3SEhVaGVkQ295cGhrOG5iVDN4bEh0RUFQeHhYUEF6aWxMZ0tvT0RTblF5?=
 =?utf-8?B?czBGSVhxZEpoUjRWanRxSVVSVGFCdWR6YThPWXlRTzZQZnordWJ1WXZIS0dB?=
 =?utf-8?B?VmNLb0tnQnhGOGw3c254cGRibTkyVTFxRU5iNjZiekRhM0w3QlRJbzE0N2I3?=
 =?utf-8?B?Y1VzSitPOVFWWWQvWUlFMStia2JWNmlBbmpQdGdpTEFpYXlYM0pQd1dqbE5u?=
 =?utf-8?B?dEZ5ZS9jU0wwTjNoVHZ3aHVKaGVRPT0=?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 24d3c1ee-7af2-4cc3-226b-08d9efbce9cd
X-MS-Exchange-CrossTenant-AuthSource: BLAPR10MB4835.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Feb 2022 13:21:30.7091 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vSimfWR6sp0hRT2M8IUjB2wHy1LpxyonRaIhRvRKyH4Z2nBtn5BHNAwyM9qLCxepoaUcah7k6PXtnncRkNLx05G3KNYdiBqD4cojN0bvbfE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR10MB3777
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10257
 signatures=673431
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 spamscore=0
 mlxlogscore=999 phishscore=0 bulkscore=0 malwarescore=0 adultscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2201110000 definitions=main-2202140081
X-Proofpoint-ORIG-GUID: ZqarS9wHmJSyH5dryTo6cG48WSWPO9pH
X-Proofpoint-GUID: ZqarS9wHmJSyH5dryTo6cG48WSWPO9pH
Received-SPF: pass client-ip=205.220.177.32;
 envelope-from=joao.m.martins@oracle.com; helo=mx0b-00069f02.pphosted.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Cc: Eduardo Habkost <ehabkost@redhat.com>,
 "Michael S . Tsirkin" <mst@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 Daniel Jordan <daniel.m.jordan@oracle.com>,
 David Edmondson <david.edmondson@oracle.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>,
 Ani Sinha <ani@anisinha.ca>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/14/22 13:19, Igor Mammedov wrote:
> On Mon,  7 Feb 2022 20:24:19 +0000
> Joao Martins <joao.m.martins@oracle.com> wrote:
>>  static void x86_machine_class_init(ObjectClass *oc, void *data)
>> diff --git a/include/hw/i386/x86.h b/include/hw/i386/x86.h
>> index a145a303703f..2de7ec046b75 100644
>> --- a/include/hw/i386/x86.h
>> +++ b/include/hw/i386/x86.h
>> @@ -58,6 +58,9 @@ struct X86MachineState {
>>      /* RAM information (sizes, addresses, configuration): */
>>      ram_addr_t below_4g_mem_size, above_4g_mem_size;
>>  
>> +    /* RAM information when there's a hole in 1Tb */
> 
> s/^^^/GPA of the part of initial RAM above 4G/
> 
> or something like that, it doesn't have anything to do with hole at 1Tb
> on some hosts.
> 
Yeap, will do.

