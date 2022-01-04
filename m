Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A9950483E53
	for <lists+qemu-devel@lfdr.de>; Tue,  4 Jan 2022 09:41:01 +0100 (CET)
Received: from localhost ([::1]:54102 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n4fNM-0001jL-Qe
	for lists+qemu-devel@lfdr.de; Tue, 04 Jan 2022 03:41:00 -0500
Received: from eggs.gnu.org ([209.51.188.92]:56258)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david.edmondson@oracle.com>)
 id 1n4fM1-00010v-Ue
 for qemu-devel@nongnu.org; Tue, 04 Jan 2022 03:39:37 -0500
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32]:59960)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david.edmondson@oracle.com>)
 id 1n4fLz-0002st-Lh
 for qemu-devel@nongnu.org; Tue, 04 Jan 2022 03:39:37 -0500
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 2047qv4U019854; 
 Tue, 4 Jan 2022 08:39:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : references : date : in-reply-to : message-id : content-type :
 content-transfer-encoding : mime-version; s=corp-2021-07-09;
 bh=KZQpfQ8emyapwU/dfI7Lq5gx7kFRFg893R/J99wVw2I=;
 b=nPyNE0RdRZcNn3NkQtknL1gxrIX7G67qESN7ykDK7/brfIw08CV2D2YkAoiGXflKZ/Zb
 ZqtN5KXC1jQXjZJaU+B5RXjHvR0dwV/RVgfET/XRbr8yp4BPV3N5TpjPh0wTCloYMBLR
 VMcfmEElhQFsTL9BixUDd4IqDC5MRPE+2rYC/9B9hSHZFn/oHk3PiJ/JtNFS37GiBkTb
 Prh5B8YMRHD2KRgJpxncMZi/Vz57aldcReivx+tFUiKkKW7TqfkmfZZ2LepDALEC3A2S
 DZ0sy1eFNzsFPAY+yYIBi0D2OP/C5UztcjbRErwnkXk6MzaKhKrZepma7WbL9VT2KXFC mw== 
Received: from userp3030.oracle.com (userp3030.oracle.com [156.151.31.80])
 by mx0b-00069f02.pphosted.com with ESMTP id 3dc43g9m5b-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 04 Jan 2022 08:39:25 +0000
Received: from pps.filterd (userp3030.oracle.com [127.0.0.1])
 by userp3030.oracle.com (8.16.1.2/8.16.1.2) with SMTP id 2048VjTj076688;
 Tue, 4 Jan 2022 08:39:21 GMT
Received: from nam12-bn8-obe.outbound.protection.outlook.com
 (mail-bn8nam12lp2171.outbound.protection.outlook.com [104.47.55.171])
 by userp3030.oracle.com with ESMTP id 3dac2w6gyf-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 04 Jan 2022 08:39:21 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PIWHYvarZ3H5jd+Ku5JkQAPYcDPiAekB9NPCTEDt+coel/y1BfBj2yzcEkw2mGdHUH5Xs5EBPhykSLaPJgLHVT7Ol+cJFinJna/BIpPLc452Ari2PqnM32GsTPlmdaldNjWs8uR1lq9sdVjeGotuJkuPvQy3q61Ic3KYUbQbKalgKl0Wxl2unWDpzTejjfMfnGJSQTceN0IVTLB5+5kHp96Y2ru1dmiDxJRA0AmSkThavVB+OFtwfSMOnHaj2GeK4/H9uHCNizrDHnqB0/NV+g4YxCR3ceZt2N3p7enJm0PERdii0t4gEd0hQ/myIsj6a1oXmARzw/PkXpn+wCHkWg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KZQpfQ8emyapwU/dfI7Lq5gx7kFRFg893R/J99wVw2I=;
 b=Z9Gn+oQDi/02Y3mhKgF9bS1Qf1GZ6IAATrHhppR2HTBbmrK3Fl+X54edpuOQTEDYGdC/z4RgpelGemRp0+fKsJxyJiHVDRfEiA3LM+/gvjfY1P/yoQfD6VAvkbU9WG8RDEWim90JIZTorDVfy15DBJiHht09X5cdRsvLNDcKULdCjBU4fC7hkPgQHYy3MUyERFxOdgVzNhXsvgL8lmZnryKUrNBMy6nIrQZcmDdGElPs6JfVvqWWu8IH3bJJZkg/p3wl4r8cc4s7Jekh/e8+7uZCeqcM6OV27ly7U4H9Vfri7cLPjDbNrEZEhrkP0m+jGTB2neLBUWpqCcAMwAGrgA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KZQpfQ8emyapwU/dfI7Lq5gx7kFRFg893R/J99wVw2I=;
 b=cUR8vy14WNSLtxdORz3xYBLJ1URf9gv4TNSH+c+pOnUvv3wb1PxzkzrRBMe1oDYEnczepCpk9A97a/XitJhsJb92DPtEqQcvtrn/Th7M0sPdIyxeYZfUeCsNstj481DVvdhXsbmIW5/xdOp3YJZKRziegGeeAF1kwiz97ER49iQ=
Received: from CY4PR10MB1447.namprd10.prod.outlook.com (2603:10b6:903:2a::13)
 by CY4PR10MB1397.namprd10.prod.outlook.com (2603:10b6:903:27::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4844.15; Tue, 4 Jan
 2022 08:39:19 +0000
Received: from CY4PR10MB1447.namprd10.prod.outlook.com
 ([fe80::d9e2:7bb1:528e:42b0]) by CY4PR10MB1447.namprd10.prod.outlook.com
 ([fe80::d9e2:7bb1:528e:42b0%9]) with mapi id 15.20.4844.016; Tue, 4 Jan 2022
 08:39:19 +0000
From: David Edmondson <david.edmondson@oracle.com>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Subject: Re: [PATCH] migration: Don't return for postcopy_send_discard_bm_ram()
References: <20211230160525.462185-1-philmd@redhat.com>
Date: Tue, 04 Jan 2022 08:39:11 +0000
In-Reply-To: <20211230160525.462185-1-philmd@redhat.com> ("Philippe
 =?utf-8?Q?Mathieu-Daud=C3=A9=22's?= message of "Thu, 30 Dec 2021 17:05:25
 +0100")
Message-ID: <cun8rvvuc7k.fsf@oracle.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/29.0.50 (gnu/linux)
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: LO4P123CA0225.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:1a6::14) To CY4PR10MB1447.namprd10.prod.outlook.com
 (2603:10b6:903:2a::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: dd876ff0-ba2a-404d-b2dc-08d9cf5db2eb
X-MS-TrafficTypeDiagnostic: CY4PR10MB1397:EE_
X-Microsoft-Antispam-PRVS: <CY4PR10MB1397C9107FE99B1EAA041209884A9@CY4PR10MB1397.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2582;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: sBWIDYkbRawU//Hjtgzq2znesEJmfJPstIolTGyXhjkoQsAxw/UPHkzTOjYf9+LHcaBRobgQaw+Gj5P76kjnH+QvXiLYoCEQeuaeugtm1zT29Gqetsvog7VudH/Al0A++k+JsWUw4McfxddvzqBv2yntDKlIGjDXb2JWmqBpT8dmPJA8knuFbMGdPSPPHrvn4u9yKqNcE3t4o91CL1aebSZu1mNihYZZceainCKoErItDb+1Do5Wgf2IEXAVacXatbLjy7sFu3K9Ir9ipZ/AFA1kBWqd1gSXuLyMaDhdAODZc0cOMAm/CRZLlh4bMiB2m4qUAvP11jLWjah/wuNIejI+6mhB839KxmqLJvum3bZQIfD4GQFFG58Ptha7ef+LUjgnqhx7cIWtl+v8syKonjyIsa0DnBOH1ypVcg6flvCoqRYwW4IGQw320sXukyWalTGPBd3O+jE1wxNcy7u+U/kecHIqIkrdDfhv4n41eiyM1nSqmDmZDLIQl7RGqOQZZXe3oTpVoCujMpuaWtMlN6B341m420zHOQ7fw0/67CPXrjUy69o4YGtCOquYtL2U6Mqiv+Gin/URcGkCdU8pqWVhP9h18TypPFobyA84F9t+GiOv1HMN76HpQXZgYjo4Q5WJEJ41IHbWWhUgDSFrNw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY4PR10MB1447.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(316002)(2906002)(66556008)(36756003)(6666004)(6506007)(6916009)(8676002)(66946007)(83380400001)(8936002)(66476007)(4001150100001)(54906003)(508600001)(86362001)(2616005)(5660300002)(186003)(38100700002)(6486002)(52116002)(6512007)(44832011)(4326008);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UkdBUXdDeG84bjI5WU9YcTJwQmNUK1NiVUhrOTV5aC9aTXdYeExCUm1mNUYv?=
 =?utf-8?B?RTRUajhCMHRBVi93Z0xoUGtvSkgrSmxsZUEvL1ZhSXpoQkVYMzF0d0JiZzZX?=
 =?utf-8?B?WU5aVlVSMDR1UUMycEp4M1VPRE5zeXRzTDFCOGNHZFFNbnhkWTF4YUpSVFVl?=
 =?utf-8?B?TENBSm1xZzdmTEZGL0VDNDJ4N3hzUk5TcXFOOVM4L1pwdllldWt3SGxCS3Z1?=
 =?utf-8?B?b1RrNm5aUGRiRk4rRTYvcy9LSDFLaXo5KzFDWWdLRkFEQkVybVNYdGRiQ2tI?=
 =?utf-8?B?UXRiMCs1VWdXdHhSemo2VG5kT3VhdTNiZzl3cmFlM3kxaDNPTkN5QlNSRWp1?=
 =?utf-8?B?YUZqTTAvMnJrQ3BFYmZHRzZsVVFIdkNyeHlBakV5a29mMW5EejhyampnOGsv?=
 =?utf-8?B?VnN6ajcvaFFRY0RhY0xvRG1FSDZuYzdLbDNSQlQzci81OFR2eTVNZGxGWGtl?=
 =?utf-8?B?a0hFSWV0WFZ1dm5NLzZsdTd2bHQzM0NycE9vS0M5Vmt3dFhTODZJeWw1RmFh?=
 =?utf-8?B?K28zSGpIZXlvVVczbG54YmxnZ3lZelpLYlBiTTZUcnYrWnZmMXJTK1pKYXhV?=
 =?utf-8?B?UXdLdTB6SndIdUoyZy9tWFNqb0FqeVFiYURzbkRRQXFNNStMcG00V0tRbFFB?=
 =?utf-8?B?cFJ6SU1TUlRyVFlyN01tbXVrWUd4RVFUb01BS0UzTHZpdk1LUTJkazBNZFhl?=
 =?utf-8?B?SmNNZVB4dUVRYmVrLzI4SDVKa3ErU0xYYllPTU84eDhneHFZZzBLQ1BEVjZz?=
 =?utf-8?B?ZWI1TVdUeldvSUJCOHNlaWRFR1FBSmdxUEQ2VTBobXQ3M2c0L3JPem5ydXRR?=
 =?utf-8?B?M2xZWUNkMmF5cUdwaXA0Z1UzeTlxK1R1Ym9tSGVDcWQ3cVdTMEtqQVdCTGsv?=
 =?utf-8?B?eVRXb1lnaElLYmhpMTZmeGNVSTA5WGFSY0pxeHR2dGI4dWR5dzM4NXQrR0Fq?=
 =?utf-8?B?Uy85S2pwZDNDVkp5Q1h1WEcyNDM1M3NQRmlrdWZOalZUdFh0WkRLU2RsWXNR?=
 =?utf-8?B?WVRRRGxXQUU1ZTZjM3BIWnBBZlFWWHJvZUlOQkYyelpVWnRhL0lkUFYzUHJO?=
 =?utf-8?B?c2QrVmdLdXVEdm1NTVZodDk5MEZ4YlZSb2xnQmVTcmdiY1YvcEtDbjZvejNq?=
 =?utf-8?B?RFZGQ3JMQnFxN2lYSDd6ZStUNXFiS1grYjlFMi9Zc2lkL2gxL3ZXam1Za05Q?=
 =?utf-8?B?Uk9GdENwczI2cloyYlFWa2Vxd0xPblU0ZFJtQzlLK2N5eVpZSnE3UXF3RkpJ?=
 =?utf-8?B?M2ZQMGJTRXhmMUNCTXphT3hSR0hVaDJGYmZtS2M3WDdaV1RRYnFFOS9hTUdm?=
 =?utf-8?B?dDF4TVgxb0JZQUpOMkhBa1Q0dXA0d0xKR2dEQWJpYTRqQVJFM0VkZHRmL25X?=
 =?utf-8?B?KzZqTFBOZDdyQkxyRWREN2E1N1FvdmIxekhzeGdTemQxZC9wTXZ6aFJNa2ww?=
 =?utf-8?B?bk4rS1RsbW11U1ZSYmltaVZzeFNZNTRSTWtRUjhVU09MVkNkNFVZSzFQRHlW?=
 =?utf-8?B?Smh3Nzl1aXRFWFc5bEo3WUxxWGlPcFdWbUtJZE1IS25FSFZwM0VQaFdFTHhB?=
 =?utf-8?B?NEw4bVZJUENwN2x3aUthRUxGWlBQOEplZmdtZXBGakJ4Z3EyNjU4ZTM0ZkFj?=
 =?utf-8?B?VnFZSUFXS2NQVnNaSmlqUnNJdTlZTExYM1JTTS80VC9uUWlBNHRTbnBkS0J6?=
 =?utf-8?B?UENiV1dNMlZKTEhuLzhlQUpBazVMSmhNK1EvdGFtcXJ3MHhZc09SamxPZGlw?=
 =?utf-8?B?WDNNaWNLL0xPZktmSG1xQkxFWUNMdnZHV25sRmwvUDRKREs4OXhNU3lzRnpR?=
 =?utf-8?B?anBHSjBYbTJ4VkJGZVpBSDdnaGluZWJlYkc4a0xoSWpuSURnTW1xVlNnWUhz?=
 =?utf-8?B?VDNpenZMVXpKbDlES2IvTzhsZ0JBOGswYng2SXdOTUFxUExwQ29GTm85TTdS?=
 =?utf-8?B?WG53S0cwUVdqM0dXSk0wK3hNQ1praEpBbXZ0eHlVUWovQWpLWFNEbC95MnV1?=
 =?utf-8?B?aXVDUHI2djJSa1YvQTFYaTdhNFhjSUJJSWE5c3ZyTEVSVStDVVFJR1B6RGY1?=
 =?utf-8?B?NHZ4SHRxaUl2NkpLVW93MXd5ZjZYN2E2Rk40a1UyalZlbnN2dlp4NFViSkx6?=
 =?utf-8?B?Y2lwNEdva2tUUThRMWoySTA3eFg2ZUxIaTFmc3RXdzRpamVSVk95TGRJalBw?=
 =?utf-8?B?VExlWTR4V0cxVnVhNitOVjlHVzVRRGpVc3lvdzExL3ZNUzFxTm4yVVc3MW5U?=
 =?utf-8?B?R1dHM1N6bFJUOUg5YVpNLzdHZFVqL2hLbjFuRTViazZhQXhSK05SSVlmV3ZB?=
 =?utf-8?Q?6qNzImVbxjDuFVQ7ud?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dd876ff0-ba2a-404d-b2dc-08d9cf5db2eb
X-MS-Exchange-CrossTenant-AuthSource: CY4PR10MB1447.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jan 2022 08:39:19.2210 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fUiASW/P24GKy/23sNlxP8a4vmrNF18bsbDcN19liB+yoTnSUs8WDU9kxXI0QOZM1ABit5uaEuZ5/6nsiwgZs+iyVoEEsrLb8mnSdRrha8c=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR10MB1397
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10216
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0
 mlxlogscore=999 mlxscore=0
 suspectscore=0 spamscore=0 phishscore=0 malwarescore=0 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2110150000
 definitions=main-2201040056
X-Proofpoint-GUID: S4WAZpp9t3yopnkTRdDq7oGIujlMDb1b
X-Proofpoint-ORIG-GUID: S4WAZpp9t3yopnkTRdDq7oGIujlMDb1b
Received-SPF: pass client-ip=205.220.177.32;
 envelope-from=david.edmondson@oracle.com; helo=mx0b-00069f02.pphosted.com
X-Spam_score_int: -8
X-Spam_score: -0.9
X-Spam_bar: /
X-Spam_report: (-0.9 / 5.0 requ) DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_LOW=-0.7,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Peter Xu <peterx@redhat.com>, qemu-devel@nongnu.org, "Dr. David
 Alan Gilbert" <dgilbert@redhat.com>, Juan Quintela <quintela@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thursday, 2021-12-30 at 17:05:25 +01, Philippe Mathieu-Daud=C3=A9 wrote:

> postcopy_send_discard_bm_ram() always return zero. Since it can't
> fail, simplify and do not return anything.
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>

Reviewed-by: David Edmondson <david.edmondson@oracle.com>

> ---
> Based-on: <20211224065000.97572-1-peterx@redhat.com>
> ---
>  migration/ram.c | 6 +-----
>  1 file changed, 1 insertion(+), 5 deletions(-)
>
> diff --git a/migration/ram.c b/migration/ram.c
> index 5234d1ece11..e241ce98461 100644
> --- a/migration/ram.c
> +++ b/migration/ram.c
> @@ -2433,14 +2433,12 @@ void ram_postcopy_migrated_memory_release(Migrati=
onState *ms)
>  /**
>   * postcopy_send_discard_bm_ram: discard a RAMBlock
>   *
> - * Returns zero on success
> - *
>   * Callback from postcopy_each_ram_send_discard for each RAMBlock
>   *
>   * @ms: current migration state
>   * @block: RAMBlock to discard
>   */
> -static int postcopy_send_discard_bm_ram(MigrationState *ms, RAMBlock *bl=
ock)
> +static void postcopy_send_discard_bm_ram(MigrationState *ms, RAMBlock *b=
lock)
>  {
>      unsigned long end =3D block->used_length >> TARGET_PAGE_BITS;
>      unsigned long current;
> @@ -2464,8 +2462,6 @@ static int postcopy_send_discard_bm_ram(MigrationSt=
ate *ms, RAMBlock *block)
>          postcopy_discard_send_range(ms, one, discard_length);
>          current =3D one + discard_length;
>      }
> -
> -    return 0;
>  }
>
>  static void postcopy_chunk_hostpages_pass(MigrationState *ms, RAMBlock *=
block);

dme.
--=20
Tell me sweet little lies.

