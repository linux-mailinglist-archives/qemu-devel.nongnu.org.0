Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F1673B170E
	for <lists+qemu-devel@lfdr.de>; Wed, 23 Jun 2021 11:39:06 +0200 (CEST)
Received: from localhost ([::1]:35030 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lvzLc-0003Aa-Vb
	for lists+qemu-devel@lfdr.de; Wed, 23 Jun 2021 05:39:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49740)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <joao.m.martins@oracle.com>)
 id 1lvzKT-0002UE-QP
 for qemu-devel@nongnu.org; Wed, 23 Jun 2021 05:37:54 -0400
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32]:42708)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <joao.m.martins@oracle.com>)
 id 1lvzKR-0002Z0-LX
 for qemu-devel@nongnu.org; Wed, 23 Jun 2021 05:37:53 -0400
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 15N9aO5m011124; Wed, 23 Jun 2021 09:37:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=subject : to : cc :
 references : from : message-id : date : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=corp-2020-01-29;
 bh=oeF1qfKvh/wRKlkeXQ+3rDFsa27otvzqbXr4pUjdPA8=;
 b=WiaKKvCXREYHUopgbtuVY+n4giJB3Y9DACKe+x0HF37ZGO5sLYhUr4DHUpkhqUHX6VHX
 QmP7qBI1ocPJgB57lBc/stHRQ1HFyL3uuF7kurhXKrjlkfW7FoQzvgH9J54Fs5qqa1+s
 e2fG5IY7l8oAd5PPcWfe5yc6WXR9oJrnkhhwBIzEF6MkgznCJCUrP7RFCD+td8Qsjsl2
 erbth9Odqv57OFOR+M/Q1Nt90ly+DkI06opufYt3vXfq2sG986vY79OxUpP4Xw00NR+f
 IZtQxxwBJxlE5lH35oE7nNVZ5gEiMOdk/qUH8/1fUa4wZsDSFs1cjOnI17IR7NN4WhI8 aQ== 
Received: from userp3030.oracle.com (userp3030.oracle.com [156.151.31.80])
 by mx0b-00069f02.pphosted.com with ESMTP id 39bf94tdr9-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 23 Jun 2021 09:37:47 +0000
Received: from pps.filterd (userp3030.oracle.com [127.0.0.1])
 by userp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 15N9ZHPD147352;
 Wed, 23 Jun 2021 09:37:46 GMT
Received: from nam02-bn1-obe.outbound.protection.outlook.com
 (mail-bn1nam07lp2040.outbound.protection.outlook.com [104.47.51.40])
 by userp3030.oracle.com with ESMTP id 3995pxycah-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 23 Jun 2021 09:37:46 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZpmfJqLPK7gQjeqj0Wtm0Tp4nYnHlsqOhjnX6HdQzwxU/dRP7gPA+20878uBe3Xk49HGLIfblo8kAZfhUxnjjCgVnFzrFvEp434A30hRVXThwbWGlaU46Gg03C1FXOSo61w4RJew1tO8siB9jBtqNe1k7jznyrDLbzydNLnogO8n0jR0g6ZdfeRl1Qad6QMMw2Vx1geZGxJCmOgYly/xIPaMuGGr7zVc9dLGElG7Ybc8grwYtEPwqpUR+s/i0c1Cer0LXXJ0uDTTxN0CWdek1SsE14MxI0Mru+o5iHEfelMtZ3TUUoW+kJ4hUJmH/w0FqVlERugSeoJWnn3ie4N4kw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oeF1qfKvh/wRKlkeXQ+3rDFsa27otvzqbXr4pUjdPA8=;
 b=fB/FUqnvdYpk6Z4K0PPMfY99acPU4jhdabkZSE/gkv4Av9iusEqkE2nXqa7GUKJK4qVRMs7bC/8mgbVTIGTxgjv2rFUrLfwQLVNg02m+A53nP7yN4l5AtCFVQAkUd9c01IfghDurornOAczfyEvUL+rSqxVJPqZptkJ6b8pAZtNwt3cIJOEhY5VFmd94hDLJibZGUVpEnSc8x9m6gQSHCmBH/3Sn2XSWIBiHq9wP6vYizwDxpzRlIp9PB74tMJ0bGsjLDZHtkw+XDQn305kIMIJDAXOIWzUJeqSKFNSqJmsCeFAH/9MkJ6qBW4BJ+3cVrWxy5Ssn8R32sctVJaaBkQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oeF1qfKvh/wRKlkeXQ+3rDFsa27otvzqbXr4pUjdPA8=;
 b=EBP/3CUOdqxpOYqYq2SubHDi0MKJwXpZj9y9L4K8F/5+2SXcjs0nPoVQVeG4qVAWuH4j8xieDBVsfASm1BpL0iJNRROqaJbY7R35NiC1HgxCNW7MdRa341ogEL4cEL/Z9PJB62Kb1mE3uw8sKOhGGZp8BQ1tizgj7WQjH9h0mPc=
Authentication-Results: amd.com; dkim=none (message not signed)
 header.d=none;amd.com; dmarc=none action=none header.from=oracle.com;
Received: from BLAPR10MB4835.namprd10.prod.outlook.com (2603:10b6:208:331::11)
 by MN2PR10MB3789.namprd10.prod.outlook.com (2603:10b6:208:181::31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4242.21; Wed, 23 Jun
 2021 09:37:44 +0000
Received: from BLAPR10MB4835.namprd10.prod.outlook.com
 ([fe80::d875:3dd7:c053:6582]) by BLAPR10MB4835.namprd10.prod.outlook.com
 ([fe80::d875:3dd7:c053:6582%5]) with mapi id 15.20.4264.018; Wed, 23 Jun 2021
 09:37:44 +0000
Subject: Re: [PATCH RFC 1/6] i386/pc: Account IOVA reserved ranges above 4G
 boundary
To: Igor Mammedov <imammedo@redhat.com>
References: <20210622154905.30858-1-joao.m.martins@oracle.com>
 <20210622154905.30858-2-joao.m.martins@oracle.com>
 <20210623091138.2f7828dd@redhat.com>
From: Joao Martins <joao.m.martins@oracle.com>
Message-ID: <ea55dc1b-b48a-3af1-be03-e72abc358f46@oracle.com>
Date: Wed, 23 Jun 2021 10:37:38 +0100
In-Reply-To: <20210623091138.2f7828dd@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [94.61.1.144]
X-ClientProxiedBy: LO2P265CA0337.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:d::13) To BLAPR10MB4835.namprd10.prod.outlook.com
 (2603:10b6:208:331::11)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.1.67] (94.61.1.144) by
 LO2P265CA0337.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:d::13) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4264.18 via Frontend Transport; Wed, 23 Jun 2021 09:37:42 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 1cd8b7d8-c261-4d80-5ffe-08d9362a8d8f
X-MS-TrafficTypeDiagnostic: MN2PR10MB3789:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <MN2PR10MB3789A71EBF6ADA44EE981C71BB089@MN2PR10MB3789.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: vdKXF+W9GNZ3KMPlz8G+zfYJ1yUo8Lh2/Tzw72NKQYJYnjDxAeRjhvWcSGY03dy/HzRc0ycg9cgboHvZquGW3ZxxxgKzmZ9YenhMlDrb2QCFNlnrhTKUycKGOYpKSK5cpa90iWh/JbMG1K0rcaR8iFS1GPMSANwewmFo7JOFgGTAOxYb81zvw4qS/cUG+RXkwooWH+ZyvPCb+gG/ZGKlLQoQeHO2PMoY+3TJvt8C9kKFE3AksVAuyXfggp1hw46JGpwD4nYsaRXktUk3N+r47VmRtdiazqFOXvvl/cMkhZG/0RrjMwCZ5u2jqZ7xDr74cSOZlBxMeGh0k5stRlgNSoNMyqtBSAJ/Zbjp6dT/3yTLhqXeK+6UBRFpNHphu7NljvKy0olWqudnAvNCa2NnjFYfYgiFmLVoSLlWa/qP5hV5T54WTOvoqJXGVCLaW+Cwr6LVxFxRdY27M1L+hcj5IwXLp8yUwLKNndLju79d9mKiE1N5yR3MgBYg1u608t/2jllE+DCg38AYxTskmvOAHBt6ksCUA7tiHz69AlatsKKkjH4HETQkyYktkR905HDXWQH/faRDBXKdbcU8rIu8lWpYWGIqKUsAtsXHt1CmTPvkt3SuF45e/v/bXaOQ5p4QrJ1AixGIH9UdQvA4/+dTF6FlPPVXuUesQb9+LVCaYZw=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BLAPR10MB4835.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(136003)(346002)(396003)(376002)(39860400002)(8936002)(31696002)(8676002)(83380400001)(31686004)(54906003)(5660300002)(316002)(6666004)(53546011)(16526019)(2906002)(478600001)(16576012)(186003)(2616005)(26005)(956004)(86362001)(66946007)(4326008)(38100700002)(66476007)(6486002)(66556008)(6916009)(15650500001)(36756003)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?d1N4TWczMlM4R0JoSHUwL2N6aFFYam1mbW1VMnVobFVWaGl5K1dEemptQ0E4?=
 =?utf-8?B?amVXNzNVQjFGZlo2cnBsekZqOXFYbGZrUHA2aXIxT2VWWGEwYlVIcVJjR1hQ?=
 =?utf-8?B?VUtGZk9aK1RxaUh6ZUxZK0prNFBNVTFoaEE3OXhaTW03bU5yQllsVmI2SStO?=
 =?utf-8?B?ekluS2dPT3JGcjVGR3phRTRCTXZZWjNaV2dHQUdzNU9GQ2pCY1hUR1hQL3Jp?=
 =?utf-8?B?T2JRd0RTMUg5bUEvT1VoM0pIQkJZeGlTUUJScUdQVHMyZHBRQ3dhdWNmaDds?=
 =?utf-8?B?L3JxM1pBUEV5Yk9vdnBZbjkxMWJGZ0M4QWFtY0RIeCtGYmp3aGpFdTNQY3hh?=
 =?utf-8?B?enpVczdNZDRtaGxXZUFXbHllS29iOFc2YzJyUitHQXV1NHBCQ0Z0OTczKzZR?=
 =?utf-8?B?TFdBdXVEbXI5TjY4TjhhRitTTDJ2NkVCRlN4QUVtQTIvK2pHUHBtRG56UDNv?=
 =?utf-8?B?dUxUMVNteFNDTGdtSFFUb3M5OTRXdHYyZGQ1UEt3VngyZi9VRTJUdnVndU1w?=
 =?utf-8?B?ZFVKeGJ6L2o1cmd4TmRoVjZZM2ROVmw2c1RXOFpBeXorYTBZMU54UGF1dlV0?=
 =?utf-8?B?RDNaQ3lGai9GS1U5UnczVmRYS0oxWk5wREUrQS9PSXR1VEFvazh0TjRKYit4?=
 =?utf-8?B?MmlGYVRuKzVpZzN5QXJDM1BjajZTbDB3bjBEeEVrZStidzFvdkd0Q092eXF6?=
 =?utf-8?B?VjJXTDZzRXBXd2Y0Rk1saTRRbmdLYVlZUmxHUFdCNjloRHJPaUJGKythTUFq?=
 =?utf-8?B?Wm5YWWhjNHNGQ0pJdEhTeVE2bjJwOGVsNlE0Qm5VVE1TeENHS0toQ0JIbVl4?=
 =?utf-8?B?eHkwR3dBYzRlamtZb3Y3eDdmaDh3VWpIYkFmdVhyZmJid2hJNDlkQ29jZmRC?=
 =?utf-8?B?K2tPbjhEOWlqTkZicEhMZitlQzFVWVRveUtYVkxDVGJnU2RVK2k4ZXRZbTIx?=
 =?utf-8?B?amFkcFFCNUJPZG9waFVMTUR1YUlXWktlNitDai9uZ01OWFREVzZLVjM1NHN3?=
 =?utf-8?B?OGpEbFNvam10WXhzVFlzOEJXckJoaTdsSzNmelhoc0dSbEZBWFNjc091ekdI?=
 =?utf-8?B?a1NBL2h0WlNVcis4UlVMeEkySkw5MW9XU3RUSm53TkNCWXcvK2gxM0ZSYnE2?=
 =?utf-8?B?b0ZvSnVKUnJBM3BSRm1kdTBDejM4UmhBKzFCeFA0WFh2UzAycGtScCtEb0hY?=
 =?utf-8?B?c3MwUlF6N0E1U3RyL0RlMjdPaTdobTcvUXczWW9ZaWJCaEw2dlk1eklPUGhw?=
 =?utf-8?B?UWlqVlkxY1V1YkM0RjBXWldmb0k1RndQTjZFUjM2RXg1Y3BxQmZnY1gvMHhK?=
 =?utf-8?B?QkpsYUM1bFdVRlMveFRNMFN0ald5TTdRdWtaUW8rR013YmlnSFE0Z0JFNW1h?=
 =?utf-8?B?TmZQY0plZ0kzcXVJSjJzMHNaV0d0RzdNb1VWTHJyaW42d29STFROK2d0U3Yr?=
 =?utf-8?B?Uzg1R1lHZmdHcHAzbEVGM2lIZFFIZHBON3ZOZ2xKb2ZMclErSVhQUEl6RmFs?=
 =?utf-8?B?dWRMQXdHUUJSdHM2MGdSalhxNUQ3WTc1Zktvb0VPdVdoRXJISXdkYitpVll2?=
 =?utf-8?B?cnJ0THYrOHUxOSthYTBreTZxZW9ZM09YMHZNejI0N3Ribk9VZWFWNUxFTWZ2?=
 =?utf-8?B?MmdKeUV1eGpON21iOFBtTkNFKzgyVGR1d0VOc3lHOHAwSDJPWWZhU1prUVNj?=
 =?utf-8?B?Mmp5aGNRUWxUbXhVb0d2aUwvdlY3K0lZOUNGb0dyYlZaQ1JOeVdKQndkMXl1?=
 =?utf-8?Q?isKd7tuvRKdBTIFdYlPXng6bIqnZ3MuJxOoVuB/?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1cd8b7d8-c261-4d80-5ffe-08d9362a8d8f
X-MS-Exchange-CrossTenant-AuthSource: BLAPR10MB4835.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jun 2021 09:37:44.2320 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zITQbbZCqT3bk6irT21dt2OYopjzY0DN+7bQKtwNUt34XBYWJ8ip9W7qeq0dz8HYYHnQKG12G4elLN13Lo+4fPv42nHfNhlWykFNGjOn04U=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR10MB3789
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=10023
 signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0
 adultscore=0 suspectscore=0
 phishscore=0 malwarescore=0 mlxscore=0 mlxlogscore=999 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2104190000
 definitions=main-2106230056
X-Proofpoint-ORIG-GUID: yrypTk36Y4QMCJRhErUH1gTiGKuwVSKC
X-Proofpoint-GUID: yrypTk36Y4QMCJRhErUH1gTiGKuwVSKC
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
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 6/23/21 8:11 AM, Igor Mammedov wrote:
> On Tue, 22 Jun 2021 16:49:00 +0100
> Joao Martins <joao.m.martins@oracle.com> wrote:
> 
>> It is assumed that the whole GPA space is available to be
>> DMA addressable, within a given address space limit. Since
>> v5.4 based that is not true, and VFIO will validate whether
>> the selected IOVA is indeed valid i.e. not reserved by IOMMU
>> on behalf of some specific devices or platform-defined.
>>
>> AMD systems with an IOMMU are examples of such platforms and
>> particularly may export only these ranges as allowed:
>>
>> 	0000000000000000 - 00000000fedfffff (0      .. 3.982G)
>> 	00000000fef00000 - 000000fcffffffff (3.983G .. 1011.9G)
>> 	0000010000000000 - ffffffffffffffff (1Tb    .. 16Pb)
>>
>> We already know of accounting for the 4G hole, albeit if the
>> guest is big enough we will fail to allocate a >1010G given
>> the ~12G hole at the 1Tb boundary, reserved for HyperTransport.
>>
>> When creating the region above 4G, take into account what
>> IOVAs are allowed by defining the known allowed ranges
>> and search for the next free IOVA ranges. When finding a
>> invalid IOVA we mark them as reserved and proceed to the
>> next allowed IOVA region.
>>
>> After accounting for the 1Tb hole on AMD hosts, mtree should
>> look like:
>>
>> 0000000100000000-000000fcffffffff (prio 0, i/o):
>> 	alias ram-above-4g @pc.ram 0000000080000000-000000fc7fffffff
>> 0000010000000000-000001037fffffff (prio 0, i/o):
>> 	alias ram-above-1t @pc.ram 000000fc80000000-000000ffffffffff
> 
> why not push whole ram-above-4g above 1Tb mark
> when RAM is sufficiently large (regardless of used host),
> instead of creating yet another hole and all complexity it brings along?
> 

There's the problem with CMOS which describes memory above 4G, part of the
reason I cap it to the 1TB minus the reserved range i.e. for AMD, CMOS would
only describe up to 1T.

But should we not care about that then it's an option, I suppose.

We would waste 1Tb of address space because of 12G, and btw the logic here
is not so different than the 4G hole, in fact could probably share this
with it.

