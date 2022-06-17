Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0504154F69C
	for <lists+qemu-devel@lfdr.de>; Fri, 17 Jun 2022 13:26:02 +0200 (CEST)
Received: from localhost ([::1]:48714 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o2A6y-0001zW-MQ
	for lists+qemu-devel@lfdr.de; Fri, 17 Jun 2022 07:26:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60334)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <joao.m.martins@oracle.com>)
 id 1o29zp-00051A-Di
 for qemu-devel@nongnu.org; Fri, 17 Jun 2022 07:18:38 -0400
Received: from mx0a-00069f02.pphosted.com ([205.220.165.32]:49798)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <joao.m.martins@oracle.com>)
 id 1o29zn-0004gO-54
 for qemu-devel@nongnu.org; Fri, 17 Jun 2022 07:18:37 -0400
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 25H7aAlv026644;
 Fri, 17 Jun 2022 11:18:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=message-id : date :
 subject : to : cc : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=corp-2021-07-09;
 bh=ryYkmq7ttZ5JOxAzvARPQG0mEmfAPmultlCwDV6y7Iw=;
 b=sHvCr1CQa0iC4weOKZFPQFqKWKHTN5krurGzEIHD4MUAU1wKmbCGK9Ow7TYsvhayvd3h
 c2emd2vYe+yOMCKqCrBI8KZhsQe+1FLVDyztr6eRW+lPromRItXltBiZe0LPZV4H+jvn
 CX5foP8Xpv6d87xi4WrbVrKf35djkBmvvSAyBF+5UlXo9Khdu3pi0wavgPMWO5v/vYfp
 Zs2wScDj2NYYyEXyhxZbQOEEjmq0Hayv5dt/7kpndZi3kzzdRYMdCkeIhd5AX0RTmvv4
 AABGEVf8ZQg1kyvNmFiOcTNT4q427rDPNuQ6GFYMbvlkrfBnud0aIfI4r2IwX07GET9/ tA== 
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com
 (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3gmhn0nn8d-2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 17 Jun 2022 11:18:27 +0000
Received: from pps.filterd
 (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
 by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.16.1.2/8.16.1.2)
 with SMTP id 25HAv40S021152; Fri, 17 Jun 2022 10:57:43 GMT
Received: from nam11-co1-obe.outbound.protection.outlook.com ([104.47.56.176])
 by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com with ESMTP id
 3gpr2c8w2f-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 17 Jun 2022 10:57:43 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WFuVpgYulUsaw+ACmPecl+Cpbtm4YukhAONdRaggPM15rz+mLZhzBpWIrQl4XdIlbQ8rNt2WmEW83+Z+WRRWE5OketDCb9POYVzjenJcp3y8QhRg6vrGJF44a+MlsHL6Ps/2pO2Ubrdxn2Bf45z0DI/JQsHL10PGP77q2yF7Gt72dyJI7UW47oKRqntwqsVvYivquaB0cKlEMWZ+LNlN+26PeqChyeSc70Gb5WhFqVm4KaDheqnFW6S0QEfDFGqJkBwJR9+T9Aq88/J/AAYDkTdnB10ThpX3Fw8f3Ko7Pow+l9mcZygPlhvZ4sO63jEC7QaDaFx3lfSwwzZauRvsWw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ryYkmq7ttZ5JOxAzvARPQG0mEmfAPmultlCwDV6y7Iw=;
 b=SOUzVEKxz21GpsdFhDYlhcw2Pgv/n3gMkQ55d6pMfpUuDM3fzldKS7wykuQtrj3a8nwHwJ8yM+R0FGUcijy6laP7lGxLuNx9z8gd8hmdLFfqbwlhY+5v34K5Iuniea3XWR0IyFaT/Vr/s/5sKZ2m2mjREn1kaXvjwQwnjyVDIaW0U1+jWUKJp7dPukLeEso0aLgA/afNQMX7wnzosfIGLzhw4jbY5/8y8nNnGprZVtnA2M79pgdNqHMeYD6bGoXj4tffz797c9omQRn8fVedLpRgMuUYMt+ngh+PPARkbZqFS5v5pH79EATkgEv7yZ/XBobLtJJ3zVX4M6egdOWxQg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ryYkmq7ttZ5JOxAzvARPQG0mEmfAPmultlCwDV6y7Iw=;
 b=GQSQBrUYUcB6OG/N3GKHu4sW3OqDzQXO0Wzut38Ttg0jObXbbWaXzncJIW7olI6Joqk1d1tB9M9jqCwPqThWnmIBkQC/ey9q9GvhNG/I8Ex3TbferX/SyXCQwuEcSkTIcvN8D/zTP9Pa9uk5jP6mnVePfvOa51d7t5vVzEsoNd0=
Received: from BLAPR10MB4835.namprd10.prod.outlook.com (2603:10b6:208:331::11)
 by MW5PR10MB5805.namprd10.prod.outlook.com (2603:10b6:303:192::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5353.14; Fri, 17 Jun
 2022 10:57:25 +0000
Received: from BLAPR10MB4835.namprd10.prod.outlook.com
 ([fe80::b842:a301:806d:231e]) by BLAPR10MB4835.namprd10.prod.outlook.com
 ([fe80::b842:a301:806d:231e%9]) with mapi id 15.20.5353.015; Fri, 17 Jun 2022
 10:57:25 +0000
Message-ID: <a451d4ad-8beb-2e31-1516-e7cbecc9764b@oracle.com>
Date: Fri, 17 Jun 2022 11:57:15 +0100
Subject: Re: [PATCH v5 1/5] hw/i386: add 4g boundary start to X86MachineState
Content-Language: en-US
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
 <20220520104532.9816-2-joao.m.martins@oracle.com>
 <20220616150540.31b51edf@redhat.com>
From: Joao Martins <joao.m.martins@oracle.com>
In-Reply-To: <20220616150540.31b51edf@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO4P265CA0193.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:318::7) To BLAPR10MB4835.namprd10.prod.outlook.com
 (2603:10b6:208:331::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 275af989-e02f-419d-0a5e-08da505029e2
X-MS-TrafficTypeDiagnostic: MW5PR10MB5805:EE_
X-Microsoft-Antispam-PRVS: <MW5PR10MB5805825B51D6F3C167467E64BBAF9@MW5PR10MB5805.namprd10.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: PHRFVwgmt2MnmOvAMzEdesN/MdTN65uADCUGGneBmLsxTkbufLrvu7ZPevg71yg82IVxAtc1rGfeBK0K0OCqmwl+Ce9AEFZrgiPqcy6A4BfDhUVJQkOEDvVokZedIVcMlPbrv5B4VyNzkkkeUAiNkG+AcuFHUvoXeRenVWU4yyJuFs/uOHYTl/0JYKahyoN9iTU17ZEpkABN7hqy2W6CY1fdVFq8gdHC+j4bEHnxJIPw0wb7AkvdN6eTLH3oinmVMLupVisWqsXXiMcZSwytUq2rjVWzVgjpYhzUagp1+oS4QgvEDNNiOOYBZ/K4+ySZ6YsQec5TpU2sIw+m2ZNjM0xhm7Xze/fnJs9ZZRjPZS1n7bjZVp+5o5n4lpy/ZAK+nyPAyMDzFOmNbqlL7fr09nWshWFFZdlOxgqvr95KDYEnAGcZyX7xFVwV4Ju5qJJy5mCGoB2wsR8tHqTqI0NOqbgBgdrFKHn4SVErBLoryLSgVq9fR8CG2VVX5gRdamUOsQkVZfn7oeYOB+h6oepZGrOAjMAqHhTvck4W032z5SBEjYe/ItvwRdhxPu69HUfoqn4IU4HwCvHfT2bf9VEveHTrXItsNAUsspj1fNDfTBIlpRTYNQOPIkVuGZUedRayLa1ggENeL6UQpCO5VuierMydRk8pq5ysRbbHMCHJMCBzM94QWz8fHpvlYm8jQO9ElQDWWRhGpnG0D6PsUpkDkw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BLAPR10MB4835.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(366004)(31686004)(498600001)(7416002)(2616005)(31696002)(5660300002)(38100700002)(53546011)(66946007)(4326008)(36756003)(6486002)(6916009)(6666004)(6512007)(54906003)(2906002)(66556008)(66476007)(8676002)(83380400001)(186003)(26005)(6506007)(8936002)(316002)(86362001)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UElSNGVsOWNVNGgrbnBCcjFPd3VPR00ya0tVUWM3UWJXaVlGRi9CY3NvcEV3?=
 =?utf-8?B?TlpGU1ZRaU9JbjRDTkJzYzJGMksxcVFHQVZlMVJLU1lZa25PNmZTVDJ4SVBB?=
 =?utf-8?B?VDlieDRhSkIvN0l1ay9VUEhOZW5OaXRGSEs3NEYyZldlMUp3V1ZYNkkyS2R4?=
 =?utf-8?B?TGNkVWFhV0c2Qk42ZHRDTFpUamVxL3dRaTFpcitpOUlpaWVqRGUvSXkwMEdF?=
 =?utf-8?B?VVV1Qzcrd3QvWWsvMlNKamlQeWtRUTdLbUZ0NnU3TnhlU1pDbVdlWnBCVzYx?=
 =?utf-8?B?UW82eW1tTll4azd2NXhBdUZIclFiZDROK2tNTzRidEdGZVE0bmZuNzlhUFNG?=
 =?utf-8?B?bC9SdFk2MmFabEh0T3c5VnprQlZoVkRHNlpvekV4UnNCRGlYNGNYc1ZVaTh2?=
 =?utf-8?B?SVZ1Mk1EU2ZxSEVjZUdJSUFxRGMyNkwwY0Y4NWgvYzZQOEN5M2FoMWkyaUFn?=
 =?utf-8?B?M08ydUNNR3pwbFJRaXVlZFNuT3c2VzkvVGFUZEdNSVlaVGp3alFoMjVCT3pJ?=
 =?utf-8?B?SGJrL0tDajc2Si9LMk8rcHBBb1JsOGdvYXRFWU8yaGQyendNT28vSncyUVdi?=
 =?utf-8?B?d0EydEpFVDd1UnhzZGxkVTQyVHJPMG4yenFzRXhndmdRTXVZcmZoaERLSlRj?=
 =?utf-8?B?eDhYeTh5QkpEZ0p6WGZ3bVlwR2dTQ1BxcG5qS0dtU3dkN0kxUzNtbzhzTEhM?=
 =?utf-8?B?R2dUTDloYXJ1RVJpaXl2akhPLytzWkpHSmMyVWlJMzVzOHQ3a09LZEpXUGx5?=
 =?utf-8?B?ZDVYYnlza3JOVXZpeDJUWEdMQVB2RURzUnpTdThiNzFPY2pmWG5Vc0NjQTVP?=
 =?utf-8?B?NEdnNWJnQVg4T0lsZkdlUm9hbEMrc3dDdTlaV1pBeFVGL3IyeVBjMnhjd3o3?=
 =?utf-8?B?bmJtbVJVTUgyL2g1aC9sNzBreTF0TVc2RFZVeDZ2YVVSSWc1ZCs5Mlozb3Vi?=
 =?utf-8?B?QzdqcjhqcFhtNm9saTNNNlJJaGxGdUhCcFQxRzZLV0o3RXlmVExubXVCbnJG?=
 =?utf-8?B?cjAvOElGd3ZDVkx1VHptWEdhenZ5Z0NOb2xHVnlnN0Z3SERDQjBLZG1BUEJt?=
 =?utf-8?B?bW52VlNVR1RhcUN6Y3NUR1MxV0szcWx0NWFMamQ3SDJyNnFaNkVCZUd1cWt6?=
 =?utf-8?B?T2NPZ0tqTHJvblpRcXhEb1V1dUF4UUlWTmtvd2w5MDZiZVBMRnNZZHE4OGwy?=
 =?utf-8?B?dHhsbllOOW9BNUs5NlhaU1hVMnNWSTdwNjVhQVRMczBXNzNzZ2tVVmY5OEF1?=
 =?utf-8?B?dS9oN3IweXJhcWZsOGRaV1BDRGZxTUMwU01vbTRkOGpCbGNoa3lyRjArWUpL?=
 =?utf-8?B?Q05iV3IyZE1pdG9MWHZPeTB4WWtJSlFSK3FyTmV2YU1UTTN3U0wwbU84TkRD?=
 =?utf-8?B?a0RnRUE5KytZcUtrMXhaSjIzNzJucitPTVBuOWNscGxrYytyK2EvZHlKemlN?=
 =?utf-8?B?bkVVYzdGRFFaTEZIT1F3N0g3RUJmM0lINzdlLzBlYXlNaEw0UHJiaGZoZG05?=
 =?utf-8?B?d1FJSFFCUFNlZmxGc2pvakJCdUN5b1F6ZkdscjMvUlRtTFRTdktTRURRWTZo?=
 =?utf-8?B?LzN5WmhEVXVIMGNUR2RxdGdyckRHZElkcytuSWJUOXhvbkV3ZWRKMGxvV1Na?=
 =?utf-8?B?Z1lhTVpGN0ZiTFJnVzhyaFd4ZDl2eXp3U3dXdGJvZVZ3bjk2NzhLcEVsOWZw?=
 =?utf-8?B?WDY2UHEyOEpvbTdVUE9uRWsrNk1JMzRtU1VYOUFqNy90MXozZGlYa2V2SFNQ?=
 =?utf-8?B?MTNLTk1Ra0ZNV3FYekp4N2hqMVY2T0ZRcG1wYWVNZlREOGVHWnhIZzZmb1By?=
 =?utf-8?B?bis3TFN2bno4eTREOEY4S282RHZoWHNNTk1XaEI1WlFjVVNxK3I3enJ5T0Jq?=
 =?utf-8?B?b3VWVWhVTWswcWpuanJSdStLQTdibFVCL1JvMjRXck1rSUhuc1ROazJIUXFs?=
 =?utf-8?B?N3pMc0xib2N5TldpbENqdmQ4OENzZ1NOMEk2N3gzTkdvSzY4MURieERFYTNR?=
 =?utf-8?B?azd5VWxLckNoQWVKQWV6K1RNNWtRZ29qSXNMUWErNEVOK2duWjljRmMzWGc1?=
 =?utf-8?B?Q1hZVk1sL01BMDVjd2pHNXVWbCtmQUR3NzU1UXBFWmk5NTVERFhMYWpZTkVs?=
 =?utf-8?B?OTEyZTlSeVU3MWtvMXZQZTYva1RKNmhSQ1dwdHNSKzJVNWt3bkZ3RGptYnZm?=
 =?utf-8?B?amxldnJ5MnBBMlFRTXUrYStXZjRud1gya1l6UFZaMk1LeURoV2J0MWhBR29P?=
 =?utf-8?B?dDdVKzMwNlYzMmNlMGFQakJqaVk1M2VMc0l1ZHZ1eVFXWTFrVURtSWNkREZ2?=
 =?utf-8?B?ZTRrdVpRU3FiYXVWYWVYYmhvbnNhVEhEQjhocm5oUlVMR29EYUVuM1QzWkZn?=
 =?utf-8?Q?BOhsWZh5HEIO0DFY=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 275af989-e02f-419d-0a5e-08da505029e2
X-MS-Exchange-CrossTenant-AuthSource: BLAPR10MB4835.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jun 2022 10:57:25.8506 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dehKUlHRjm+a2c/7NZOHW9LSNsfpq9RTyHwOdzpSqtkxcfM/MK34vfBE7uE1CoHSpTX8KH9H9a8oP4u4eavKOXXTLTxSMzdPFnrsoxPcctw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW5PR10MB5805
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.517, 18.0.883
 definitions=2022-06-17_07:2022-06-16,
 2022-06-17 signatures=0
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0
 spamscore=0 adultscore=0
 mlxlogscore=999 phishscore=0 malwarescore=0 bulkscore=0 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2204290000
 definitions=main-2206170049
X-Proofpoint-GUID: 3-JHDqOyDufqNsNOYCzlUQ2ZNpkNgWdU
X-Proofpoint-ORIG-GUID: 3-JHDqOyDufqNsNOYCzlUQ2ZNpkNgWdU
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

On 6/16/22 14:05, Igor Mammedov wrote:
> On Fri, 20 May 2022 11:45:28 +0100
> Joao Martins <joao.m.martins@oracle.com> wrote:
>> Rather than hardcoding the 4G boundary everywhere, introduce a
>> X86MachineState property @above_4g_mem_start and use it
> so far it's just field not a property /fix commit message/
> 
Fixed.

>> accordingly.
>>
>> This is in preparation for relocating ram-above-4g to be
>> dynamically start at 1T on AMD platforms.
> 
> possibly needs to be rebased on top of current master to include cxl_base
> 
Yeap. I fxed the cxl_base as following:

diff --git a/hw/i386/pc.c b/hw/i386/pc.c
index 82cfafc1c3b6..a9d1bf95649a 100644
--- a/hw/i386/pc.c
+++ b/hw/i386/pc.c
@@ -930,7 +930,7 @@ void pc_memory_init(PCMachineState *pcms,
         } else if (pcms->sgx_epc.size != 0) {
             cxl_base = sgx_epc_above_4g_end(&pcms->sgx_epc);
         } else {
-            cxl_base = 0x100000000ULL + x86ms->above_4g_mem_size;
+            cxl_base = x86ms->above_4g_mem_start + x86ms->above_4g_mem_size;
         }

         e820_add_entry(cxl_base, cxl_size, E820_RESERVED);


> with comments fixed
> 
> Reviewed-by: Igor Mammedov <imammedo@redhat.com>
> 

I added this -- Thanks a lot!

>>
>> Signed-off-by: Joao Martins <joao.m.martins@oracle.com>
>> ---
>>  hw/i386/acpi-build.c  | 2 +-
>>  hw/i386/pc.c          | 9 +++++----
>>  hw/i386/sgx.c         | 2 +-
>>  hw/i386/x86.c         | 1 +
>>  include/hw/i386/x86.h | 3 +++
>>  5 files changed, 11 insertions(+), 6 deletions(-)
>>
>> diff --git a/hw/i386/acpi-build.c b/hw/i386/acpi-build.c
>> index c125939ed6f9..3160b20c9574 100644
>> --- a/hw/i386/acpi-build.c
>> +++ b/hw/i386/acpi-build.c
>> @@ -2120,7 +2120,7 @@ build_srat(GArray *table_data, BIOSLinker *linker, MachineState *machine)
>>                  build_srat_memory(table_data, mem_base, mem_len, i - 1,
>>                                    MEM_AFFINITY_ENABLED);
>>              }
>> -            mem_base = 1ULL << 32;
>> +            mem_base = x86ms->above_4g_mem_start;
>>              mem_len = next_base - x86ms->below_4g_mem_size;
>>              next_base = mem_base + mem_len;
>>          }
>> diff --git a/hw/i386/pc.c b/hw/i386/pc.c
>> index 7c39c913355b..f7da1d5dd40d 100644
>> --- a/hw/i386/pc.c
>> +++ b/hw/i386/pc.c
>> @@ -832,9 +832,10 @@ void pc_memory_init(PCMachineState *pcms,
>>                                   machine->ram,
>>                                   x86ms->below_4g_mem_size,
>>                                   x86ms->above_4g_mem_size);
>> -        memory_region_add_subregion(system_memory, 0x100000000ULL,
>> +        memory_region_add_subregion(system_memory, x86ms->above_4g_mem_start,
>>                                      ram_above_4g);
>> -        e820_add_entry(0x100000000ULL, x86ms->above_4g_mem_size, E820_RAM);
>> +        e820_add_entry(x86ms->above_4g_mem_start, x86ms->above_4g_mem_size,
>> +                       E820_RAM);
>>      }
>>  
>>      if (pcms->sgx_epc.size != 0) {
>> @@ -875,7 +876,7 @@ void pc_memory_init(PCMachineState *pcms,
>>              machine->device_memory->base = sgx_epc_above_4g_end(&pcms->sgx_epc);
>>          } else {
>>              machine->device_memory->base =
>> -                0x100000000ULL + x86ms->above_4g_mem_size;
>> +                x86ms->above_4g_mem_start + x86ms->above_4g_mem_size;
>>          }
>>  
>>          machine->device_memory->base =
>> @@ -1019,7 +1020,7 @@ uint64_t pc_pci_hole64_start(void)
>>      } else if (pcms->sgx_epc.size != 0) {
>>              hole64_start = sgx_epc_above_4g_end(&pcms->sgx_epc);
>>      } else {
>> -        hole64_start = 0x100000000ULL + x86ms->above_4g_mem_size;
>> +        hole64_start = x86ms->above_4g_mem_start + x86ms->above_4g_mem_size;
>>      }
>>  
>>      return ROUND_UP(hole64_start, 1 * GiB);
>> diff --git a/hw/i386/sgx.c b/hw/i386/sgx.c
>> index a44d66ba2afc..09d9c7c73d9f 100644
>> --- a/hw/i386/sgx.c
>> +++ b/hw/i386/sgx.c
>> @@ -295,7 +295,7 @@ void pc_machine_init_sgx_epc(PCMachineState *pcms)
>>          return;
>>      }
>>  
>> -    sgx_epc->base = 0x100000000ULL + x86ms->above_4g_mem_size;
>> +    sgx_epc->base = x86ms->above_4g_mem_start + x86ms->above_4g_mem_size;
>>  
>>      memory_region_init(&sgx_epc->mr, OBJECT(pcms), "sgx-epc", UINT64_MAX);
>>      memory_region_add_subregion(get_system_memory(), sgx_epc->base,
>> diff --git a/hw/i386/x86.c b/hw/i386/x86.c
>> index 78b05ab7a2d1..af3c790a2830 100644
>> --- a/hw/i386/x86.c
>> +++ b/hw/i386/x86.c
>> @@ -1373,6 +1373,7 @@ static void x86_machine_initfn(Object *obj)
>>      x86ms->oem_id = g_strndup(ACPI_BUILD_APPNAME6, 6);
>>      x86ms->oem_table_id = g_strndup(ACPI_BUILD_APPNAME8, 8);
>>      x86ms->bus_lock_ratelimit = 0;
>> +    x86ms->above_4g_mem_start = 0x100000000ULL;
> 
> s/0x.../4 * GiB/
> 
Fixed.

>>  }
>>  
>>  static void x86_machine_class_init(ObjectClass *oc, void *data)
>> diff --git a/include/hw/i386/x86.h b/include/hw/i386/x86.h
>> index 9089bdd99c3a..df82c5fd4252 100644
>> --- a/include/hw/i386/x86.h
>> +++ b/include/hw/i386/x86.h
>> @@ -56,6 +56,9 @@ struct X86MachineState {
>>      /* RAM information (sizes, addresses, configuration): */
>>      ram_addr_t below_4g_mem_size, above_4g_mem_size;
>>  
>> +    /* Start address of the initial RAM above 4G */
>> +    uint64_t above_4g_mem_start;
>> +
>>      /* CPU and apic information: */
>>      bool apic_xrupt_override;
>>      unsigned pci_irq_mask;
> 

