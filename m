Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 778C85265A8
	for <lists+qemu-devel@lfdr.de>; Fri, 13 May 2022 17:08:17 +0200 (CEST)
Received: from localhost ([::1]:46542 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1npWts-0007kp-Jb
	for lists+qemu-devel@lfdr.de; Fri, 13 May 2022 11:08:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36584)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <joao.m.martins@oracle.com>)
 id 1npWsR-00073s-BE
 for qemu-devel@nongnu.org; Fri, 13 May 2022 11:06:48 -0400
Received: from mx0a-00069f02.pphosted.com ([205.220.165.32]:57784)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <joao.m.martins@oracle.com>)
 id 1npWsL-0001mx-Gq
 for qemu-devel@nongnu.org; Fri, 13 May 2022 11:06:45 -0400
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 24DEdeNu026387;
 Fri, 13 May 2022 15:06:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=message-id : date :
 subject : to : cc : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=corp-2021-07-09;
 bh=XAyx+Dez/w2cOWG+PokawezDp7uDb+qUVpcQVpEQzLU=;
 b=HywRG4i8wkGaYAeXe8KY250vrjQJ7j+FrvXBQqz431dcVAq6Dw7Kt0DeWIjr/nofTLjn
 UAIQbwk+v//Ac5zuqOG+2yv24KfGzwSQ12Aq4RKuKXgAaP2aPYoBCWmTXUBbecFthaZw
 sAEIseBMviWtVfbAIvtUMGIczE8GK7kHTOCQPE4QTsCu6c/9Y97HBqcM1TpkwhrS2GOy
 u2wZMq6BjgQaO4cD4qNpuO3oXKkIj7JyWpSEi3oiZObT7hXi3Chabg9X2fLDqKkmC9Ux
 Dco3RKHnqxdaCzQEyGGNWDUMVDz/yYvM7tN3Gmsd1ll+bUh2sAP2aOJNvxqS0DYEKXpf LQ== 
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com
 (phxpaimrmta02.appoci.oracle.com [147.154.114.232])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3fwfc0yqnr-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 13 May 2022 15:06:30 +0000
Received: from pps.filterd
 (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
 by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (8.16.1.2/8.16.1.2)
 with SMTP id 24DExmvo022377; Fri, 13 May 2022 15:06:29 GMT
Received: from nam04-mw2-obe.outbound.protection.outlook.com
 (mail-mw2nam08lp2176.outbound.protection.outlook.com [104.47.73.176])
 by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com with ESMTP id
 3fwf76vdn4-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 13 May 2022 15:06:29 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lsXW81oUx8nKZYbL7O/aWmH4AwI9jHZLhgrbYUXDCY1yt9Nl7fDmGwroBiwnM26lR1e4iAeYbh2KQkwUKXvt42mSjihby8GT9rqMUDLd5WTiO9zhHkACIAebJ0XWCz0X019c6KAaREQwBdunEGhnSV23224tEKJ4yEthAF438NTnn5HjTW0xMdXn+1M3iaKDr05wzQCFfiF3nYzJrvaz0k/ekk2VDkvPJNEAkeU9zHK6xnpQMKWJjh6loDHfTUqpLrqkZkGPTeA5nN9rLVJF3WAnoGDuuwpyXOdPnx+JWQQfje7+AEfERA4IobnuOWUdQISZZhB0pA92XGsEn6hPOQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XAyx+Dez/w2cOWG+PokawezDp7uDb+qUVpcQVpEQzLU=;
 b=Mn5QQ8J0vhCiiNdQN1vgxuLVgIyYNJXDwC1v8S+epuJJxCMj5+PJ/6bPz8HqIVqPSN1YZtWoEhcXM7/g8VCrbaUsea/gEBisMFeI6UCfMhDEyTxtzeoNTnVhe4dxfHrTXR63CDskAqbm7R1ZnViJU/FygRrtdSTurkKdDLLR1lY6YRQcgzu/gZcMx7muZCFhTluGLd3jVSxHHJqEtT/izDI7zDmosuNk+NuKpW3gl3iMtngYKxZt9oOCCR2jEc9yxMWIG87CQAgAfgrX1b98KNyfYdlUsNIHK5bazVYDfj7GqgrQp2UYl348NL32EpWmhQp4/ca0c1KWYwFy14aeuQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XAyx+Dez/w2cOWG+PokawezDp7uDb+qUVpcQVpEQzLU=;
 b=WAaFDU/fzM/q8tNvAHZbNe6sL+e9ar78cEHq3I+BID7Nmepg0BFDxlBGrt0t5sV0qfB/Wy+QPrscSr7w/mNJWHENHNPK+SHuzzoJ4OztM6sGK9BuRjzFarw6vV/gjLc37dWSaMbYHtQP/ojiy/GjJhfzspw+VJO0L5Fa9gL37fs=
Received: from BLAPR10MB4835.namprd10.prod.outlook.com (2603:10b6:208:331::11)
 by DM6PR10MB3354.namprd10.prod.outlook.com (2603:10b6:5:1ae::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5227.21; Fri, 13 May
 2022 15:06:27 +0000
Received: from BLAPR10MB4835.namprd10.prod.outlook.com
 ([fe80::b9e5:d1b6:b4be:f9d]) by BLAPR10MB4835.namprd10.prod.outlook.com
 ([fe80::b9e5:d1b6:b4be:f9d%6]) with mapi id 15.20.5250.015; Fri, 13 May 2022
 15:06:27 +0000
Message-ID: <23514250-d0c8-a94a-0b21-e7f0f34cf965@oracle.com>
Date: Fri, 13 May 2022 16:06:26 +0100
Subject: Re: [PATCH v4 4/5] i386/pc: relocate 4g start to 1T where applicable
Content-Language: en-US
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: qemu-devel@nongnu.org, Eduardo Habkost <eduardo@habkost.net>,
 Richard Henderson <richard.henderson@linaro.org>,
 Daniel Jordan <daniel.m.jordan@oracle.com>,
 David Edmondson <david.edmondson@oracle.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Ani Sinha <ani@anisinha.ca>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Igor Mammedov <imammedo@redhat.com>,
 Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>
References: <20220420201138.23854-1-joao.m.martins@oracle.com>
 <20220420201138.23854-5-joao.m.martins@oracle.com>
 <20220513083052-mutt-send-email-mst@kernel.org>
From: Joao Martins <joao.m.martins@oracle.com>
In-Reply-To: <20220513083052-mutt-send-email-mst@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO4P123CA0316.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:197::15) To BLAPR10MB4835.namprd10.prod.outlook.com
 (2603:10b6:208:331::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 6af84985-7305-498b-08c2-08da34f226e0
X-MS-TrafficTypeDiagnostic: DM6PR10MB3354:EE_
X-Microsoft-Antispam-PRVS: <DM6PR10MB33543A6FC14BD7E23DFA8AC7BBCA9@DM6PR10MB3354.namprd10.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: /qxW3dMMFe2WVU+1R9H3DRcmuifuG+62ijnRM4Qiq/aC2t2wdJgZWUSf8yFBwT/i0OqWG9MpxkTHH6l0jG13/pUAT3J0Yf5hoIVl+Fp7sSrqJ/5BLeQLBYpJRd8pPq2wT+5rUVY9nBmqHOTpIlzuFAnOfHciMwUnqWj9y77/HjPV+0QF3M3QIvNkZlXtLo7jvVHr6x0+75vWUA86nJzV62/6ObUA/34JjUIYDoqzhXT3+skhHwRG7zsyiIDwhLgCckICiB3y/Dxl59xCUI6h8/LhxZszcRzRP8MApPfi+SUvG0Qq6Z7FwBAlMRbAScCUq06+7pJ6CuAtgizUjmzAEGiJ1y/q7rImlrdrJW3biA5pMQpmn2KIM5zylaUcDOhC4u2MQOZ+N7UMAqqap2fYt8k8LLU9I7U6LUtculhOkPSjTd6/g6jjjlUyCWJpLRmFTyCp91loKlssZWzY/ft0mJmnpPCfi/d6CtIlBxNzCy1OljZPtuWq7AihMi4TbxTLORPOeXv9GpjIaB2a1uJDKhgykS3DRzLUFhVNS3bZ6FxUFNbfodfMpJtGJWm4+CHmj+hn0eoN4pvs4KNrSvfQX+nSXg+erMnZNZp7sfaHb22Lm/jv3nzKg7q3kPGGyk0Pk4NV+VGKzOa3yvhkE4RX5x2eDqoTT4MZI1JJfhqi85h20VV/y4Y1l6g/mBkUOw4Oz51fP2GSGyuNW0j188R75Q==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BLAPR10MB4835.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(508600001)(2906002)(6486002)(186003)(7416002)(54906003)(53546011)(26005)(6512007)(5660300002)(2616005)(6506007)(8936002)(38100700002)(66556008)(6916009)(83380400001)(86362001)(66476007)(8676002)(66946007)(31686004)(4326008)(31696002)(316002)(36756003)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZGxNTEY4UzZoekp6VzVjeWdmdVBOY05vTlVmcmp0NzlVV2dlamhyNEZRVzQw?=
 =?utf-8?B?aWIzZjZRRWtOSk5xeGJpNkZIWGJHREg2TE8zdzFNYkh5Y1BWZ0dwdVFhd3BS?=
 =?utf-8?B?NFNmVGd1M1lYU0NySkRxdGdXYVJ0V0dRSGR2cXVkM3NURS9Tczh0RkpoMk5L?=
 =?utf-8?B?ZUZjR09BTTJEYUlUb3o2T1hoL3hzUUlIRnkvZTN2ODBMdmJ1R0tocWZvSk1z?=
 =?utf-8?B?SDhoZkpaRUxNMHY1MjlPWkNkbUYvdTRUWTNSVzQ0MFk0SjVpZ2xMbFp3dVlD?=
 =?utf-8?B?YXdHTXdEbkI1d1hzcDdGekpweGlyMHVGK25NNEQ0Z1gvWW5sWCtRR1pka3Ez?=
 =?utf-8?B?TWY5dXVocTNPb05KUUY3MHNJeFlBMzdsRnVmd0JzMHBlYUxIYmNNWllybVJr?=
 =?utf-8?B?QzdqNVpGMUErNGE4eXVSZTYvTVlSZTdlZEFmaGdlYSs3UXhNZDAxK1RtNkZZ?=
 =?utf-8?B?dXRpM0NHb3I5T1BaaG1BUHcvN1VJVGthV1FyeDIzL0JqbzR1Q1EzcWYxOVlK?=
 =?utf-8?B?bkJ0SVdBRnlxaHlnZ0YwWnBOUStFYzgva3UyMExjeFk1MTJEbFdiSWtlRVdy?=
 =?utf-8?B?T0pGN3N4Q1RJVmtlNDdqSHBBOHFoQXJRQkdndkpacExDd2FJS0JZU3ZHZWMz?=
 =?utf-8?B?dkpoRTUyUmVLOVNKNnBDUCtEZ21HRnQyeHhFWG5CWVNGamxjNXdmbnVCWWJG?=
 =?utf-8?B?QmpxenVvQXVGY3NoY0xzKzdHV3EwK1ZGcTRmUjd4RXBvZWNnVGpMbVV4bVo2?=
 =?utf-8?B?QVFDY3ZJakFzS1hYdWpCNDJpVUdyS1BrRUxWaUd1RjJhbzZSaC9uMWJDamwv?=
 =?utf-8?B?MUlNVjZiRTEzSndXSUkzT1grSEgrR0swRVlUS09tNlJjc2RwbmoxckMvSHRI?=
 =?utf-8?B?emdnUVFNcHZyS3ZxVyttZUVQV1BwOUpScU5USFZtaEJDMFFkOEUyTXIwZE5T?=
 =?utf-8?B?Z1MvQUNSTEF5bVY2MCtYYlRiTGhNWnIyVG85bllJRkhSczljNlBKRmgzUENm?=
 =?utf-8?B?QjlXNG0vYWZYNDRGcHpvaGQwTW1zRERwWjViOXBjM21BWkRuVkVSaUh6R2li?=
 =?utf-8?B?MU9TK1Y1TURubjRvYlJsK1JiTWdtWTRwVFROd2RoQnZibXNXNlZMWnhib2VG?=
 =?utf-8?B?ZUF1cFNrSnYyRUFwb3BlcmRwMXhZSUxIRmZtRDlKbStSbEZhZFZwVXhicXJ3?=
 =?utf-8?B?REtHUlVYV0Frd0ZrZENDQ2hBdmVIVG1wdGc1ZStaREVvY1RlSHpiSjkvMmJS?=
 =?utf-8?B?djF3eG1wWGxvdW1pYldyQkw3NC9wUnZqVmxibjBrbUlSTk13Q0Q0dGthWTRO?=
 =?utf-8?B?clFSQUFvMEI4TjFXV215OWZwcThaMnhHSnEzelU4WjdPSUJqUTNlRWVoYkdF?=
 =?utf-8?B?WmlzK3BnMk4zNWo3aVpCWnZJa0IvOGFYMkN0c09MbURPUVdLVUVmR2FTeHU1?=
 =?utf-8?B?MU9aVnFPbHZ4cVZmR05JUlIrY0N1NUVqdHcyOVNiMDRDRmdlcFpmV0haN1Fu?=
 =?utf-8?B?WUdhMFBkME5nUzVLaGJ3WFdJbCthTVRIRCtuQ1pvWlhpWDV3Tkp3VU5HTUI1?=
 =?utf-8?B?M3R5bmF5Z0c3QlN3Rlgzc3YwZDhFbThIbHJtOTZGMENXOU9ubE1UeE9icEVG?=
 =?utf-8?B?Q3Fqc0tTbDhHdTVJR1RrRnh3WEpaUzdJVEdBcThNUmh0cmZpMUM4UU5FYmxm?=
 =?utf-8?B?dHBKWTNOY01uNFhudi9OdFF4MjhiejhlSVcwaVhEREZUc1pkQ0l1eXYxUWNu?=
 =?utf-8?B?OGdOdXl2NG1CYXFBN1FBOWErYjFvR0dNQjAvZmhIV2hFeU9oaC9nTkZCSE8z?=
 =?utf-8?B?RHBXb2pKYTVqQ1hucUY5cjJpNXVha003QkNWSHpWL1dHYUY4L3FCUndOYXBY?=
 =?utf-8?B?ZmVhdUxqM25GSW02OUxFUlJRY2RnYTU3OEtHRS8rQVo5ckdFU0RoVXVrdXNy?=
 =?utf-8?B?QllUTHVzNEZKZWhvQnQzRlFST01IRmxodU1SVnNhelV6YXV5MmFaSm00QWZv?=
 =?utf-8?B?QjFiNWwvQitmRDdGQUZ1OHN2NTVpRUMrb2xhWlVxclpDT01WM3BwdzQ0eDNj?=
 =?utf-8?B?YmRVZDBMUG1iVUQrUUhTallCbUZldG5DWHlsRlY5L1ZzR0hDeTBackQrZWdU?=
 =?utf-8?B?MFdiNG1VazJvRFdXbFFaazNxVzh6YW9ScnErTG9LblM3WmJ3RU12VTExOUNY?=
 =?utf-8?B?TGZIZm9QVlJIcDJneWVnM0pTZy9ZYzVoOTYvanZwUitqZy9ZS2JqMG1XN09m?=
 =?utf-8?B?VUd4UzVMWmJWVVlTOFdsVkU3TEJ0ZG53aWpCTURNRVQvcDN2djZNOHdUam5k?=
 =?utf-8?B?UmlPY2Q4WVpIdnFuWllmK0RxWTRMSTNsR3RUcVdvSnBpUWxFNmU5WkRoUVNW?=
 =?utf-8?Q?TqgX/N0sKXRCj6Uc=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6af84985-7305-498b-08c2-08da34f226e0
X-MS-Exchange-CrossTenant-AuthSource: BLAPR10MB4835.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 May 2022 15:06:27.2322 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Jn1k23Cr/ktLF7iSo95hPeNE29NCZVrrKRvToPyzDnj8zLBVnY4f9eaYnHSsAbJSL4DRngrgnozG/xQlkEA31XIPb9XOAHBn9EttNN2ZPtM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR10MB3354
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.486, 18.0.858
 definitions=2022-05-13_04:2022-05-13,
 2022-05-13 signatures=0
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999
 malwarescore=0
 suspectscore=0 phishscore=0 spamscore=0 bulkscore=0 mlxscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2202240000 definitions=main-2205130067
X-Proofpoint-ORIG-GUID: ckT1YhuoYny42XgSf1KkiHAhMyK8Kv3P
X-Proofpoint-GUID: ckT1YhuoYny42XgSf1KkiHAhMyK8Kv3P
Received-SPF: pass client-ip=205.220.165.32;
 envelope-from=joao.m.martins@oracle.com; helo=mx0a-00069f02.pphosted.com
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

On 5/13/22 13:33, Michael S. Tsirkin wrote:
> On Wed, Apr 20, 2022 at 09:11:37PM +0100, Joao Martins wrote:
>> It is assumed that the whole GPA space is available to be DMA
>> addressable, within a given address space limit, expect for a
>> tiny region before the 4G. Since Linux v5.4, VFIO validates
>> whether the selected GPA is indeed valid i.e. not reserved by
>> IOMMU on behalf of some specific devices or platform-defined
>> restrictions, and thus failing the ioctl(VFIO_DMA_MAP) with
>>  -EINVAL.
>>
>> AMD systems with an IOMMU are examples of such platforms and
>> particularly may only have these ranges as allowed:
>>
>> 	0000000000000000 - 00000000fedfffff (0      .. 3.982G)
>> 	00000000fef00000 - 000000fcffffffff (3.983G .. 1011.9G)
>> 	0000010000000000 - ffffffffffffffff (1Tb    .. 16Pb[*])
>>
>> We already account for the 4G hole, albeit if the guest is big
>> enough we will fail to allocate a guest with  >1010G due to the
>> ~12G hole at the 1Tb boundary, reserved for HyperTransport (HT).
>>
>> [*] there is another reserved region unrelated to HT that exists
>> in the 256T boundaru in Fam 17h according to Errata #1286,
>> documeted also in "Open-Source Register Reference for AMD Family
>> 17h Processors (PUB)"
>>
>> When creating the region above 4G, take into account that on AMD
>> platforms the HyperTransport range is reserved and hence it
>> cannot be used either as GPAs. On those cases rather than
>> establishing the start of ram-above-4g to be 4G, relocate instead
>> to 1Tb. See AMD IOMMU spec, section 2.1.2 "IOMMU Logical
>> Topology", for more information on the underlying restriction of
>> IOVAs.
>>
>> After accounting for the 1Tb hole on AMD hosts, mtree should
>> look like:
>>
>> 0000000000000000-000000007fffffff (prio 0, i/o):
>> 	 alias ram-below-4g @pc.ram 0000000000000000-000000007fffffff
>> 0000010000000000-000001ff7fffffff (prio 0, i/o):
>> 	alias ram-above-4g @pc.ram 0000000080000000-000000ffffffffff
>>
>> If the relocation is done, we also add the the reserved HT
>> e820 range as reserved.
>>
>> Default phys-bits on Qemu is TCG_PHYS_BITS (40) which is enough
>> to address 1Tb (0xff ffff ffff). On AMD platforms, if a
>> ram-above-4g relocation may be desired and the CPU wasn't configured
>> with a big enough phys-bits, print an error message to the user
>> and do not make the relocation of the above-4g-region if phys-bits
>> is too low.
>>
>> Suggested-by: Igor Mammedov <imammedo@redhat.com>
>> Signed-off-by: Joao Martins <joao.m.martins@oracle.com>
>> ---
>>  hw/i386/pc.c | 111 +++++++++++++++++++++++++++++++++++++++++++++++++++
>>  1 file changed, 111 insertions(+)
>>
>> diff --git a/hw/i386/pc.c b/hw/i386/pc.c
>> index 8eaa32ee2106..aac32ba0bd02 100644
>> --- a/hw/i386/pc.c
>> +++ b/hw/i386/pc.c
>> @@ -803,6 +803,110 @@ void xen_load_linux(PCMachineState *pcms)
>>  #define PC_ROM_ALIGN       0x800
>>  #define PC_ROM_SIZE        (PC_ROM_MAX - PC_ROM_MIN_VGA)
>>  
>> +/*
>> + * AMD systems with an IOMMU have an additional hole close to the
>> + * 1Tb, which are special GPAs that cannot be DMA mapped. Depending
>> + * on kernel version, VFIO may or may not let you DMA map those ranges.
>> + * Starting Linux v5.4 we validate it, and can't create guests on AMD machines
>> + * with certain memory sizes. It's also wrong to use those IOVA ranges
>> + * in detriment of leading to IOMMU INVALID_DEVICE_REQUEST or worse.
>> + * The ranges reserved for Hyper-Transport are:
>> + *
>> + * FD_0000_0000h - FF_FFFF_FFFFh
>> + *
>> + * The ranges represent the following:
>> + *
>> + * Base Address   Top Address  Use
>> + *
>> + * FD_0000_0000h FD_F7FF_FFFFh Reserved interrupt address space
>> + * FD_F800_0000h FD_F8FF_FFFFh Interrupt/EOI IntCtl
>> + * FD_F900_0000h FD_F90F_FFFFh Legacy PIC IACK
>> + * FD_F910_0000h FD_F91F_FFFFh System Management
>> + * FD_F920_0000h FD_FAFF_FFFFh Reserved Page Tables
>> + * FD_FB00_0000h FD_FBFF_FFFFh Address Translation
>> + * FD_FC00_0000h FD_FDFF_FFFFh I/O Space
>> + * FD_FE00_0000h FD_FFFF_FFFFh Configuration
>> + * FE_0000_0000h FE_1FFF_FFFFh Extended Configuration/Device Messages
>> + * FE_2000_0000h FF_FFFF_FFFFh Reserved
>> + *
>> + * See AMD IOMMU spec, section 2.1.2 "IOMMU Logical Topology",
>> + * Table 3: Special Address Controls (GPA) for more information.
>> + */
>> +#define AMD_HT_START         0xfd00000000UL
>> +#define AMD_HT_END           0xffffffffffUL
>> +#define AMD_ABOVE_1TB_START  (AMD_HT_END + 1)
>> +#define AMD_HT_SIZE          (AMD_ABOVE_1TB_START - AMD_HT_START)
>> +
>> +static hwaddr x86_max_phys_addr(PCMachineState *pcms,
>> +                                hwaddr above_4g_mem_start,
>> +                                uint64_t pci_hole64_size)
>> +{
>> +    PCMachineClass *pcmc = PC_MACHINE_GET_CLASS(pcms);
>> +    X86MachineState *x86ms = X86_MACHINE(pcms);
>> +    MachineState *machine = MACHINE(pcms);
>> +    ram_addr_t device_mem_size = 0;
>> +    hwaddr base;
>> +
>> +    if (!x86ms->above_4g_mem_size) {
>> +       /*
>> +        * 32-bit pci hole goes from
>> +        * end-of-low-ram (@below_4g_mem_size) to IOAPIC.
>> +        */
>> +        return IO_APIC_DEFAULT_ADDRESS - 1;
>> +    }
>> +
>> +    if (pcmc->has_reserved_memory &&
>> +       (machine->ram_size < machine->maxram_size)) {
>> +        device_mem_size = machine->maxram_size - machine->ram_size;
>> +    }
>> +
>> +    base = ROUND_UP(above_4g_mem_start + x86ms->above_4g_mem_size +
>> +                    pcms->sgx_epc.size, 1 * GiB);
>> +
>> +    return base + device_mem_size + pci_hole64_size;
>> +}
>> +
>> +static void x86_update_above_4g_mem_start(PCMachineState *pcms,
>> +                                          uint64_t pci_hole64_size)
>> +{
>> +    X86MachineState *x86ms = X86_MACHINE(pcms);
>> +    CPUX86State *env = &X86_CPU(first_cpu)->env;
>> +    hwaddr start = x86ms->above_4g_mem_start;
>> +    hwaddr maxphysaddr, maxusedaddr;
>> +
>> +    /*
>> +     * The HyperTransport range close to the 1T boundary is unique to AMD
>> +     * hosts with IOMMUs enabled. Restrict the ram-above-4g relocation
>> +     * to above 1T to AMD vCPUs only.
>> +     */
>> +    if (!IS_AMD_CPU(env)) {
>> +        return;
>> +    }
>> +
>> +    /* Bail out if max possible address does not cross HT range */
>> +    if (x86_max_phys_addr(pcms, start, pci_hole64_size) < AMD_HT_START) {
>> +        return;
>> +    }
>> +
>> +    /*
>> +     * Relocating ram-above-4G requires more than TCG_PHYS_BITS (40).
>> +     * So make sure phys-bits is required to be appropriately sized in order
>> +     * to proceed with the above-4g-region relocation and thus boot.
>> +     */
>> +    start = AMD_ABOVE_1TB_START;
>> +    maxphysaddr = ((hwaddr)1 << X86_CPU(first_cpu)->phys_bits) - 1;
>> +    maxusedaddr = x86_max_phys_addr(pcms, start, pci_hole64_size);
>> +    if (maxphysaddr < maxusedaddr) {
>> +        error_report("Address space limit 0x%"PRIx64" < 0x%"PRIx64
>> +                     " phys-bits too low (%u) cannot avoid AMD HT range",
>> +                     maxphysaddr, maxusedaddr, X86_CPU(first_cpu)->phys_bits);
>> +        exit(EXIT_FAILURE);
>> +    }
>> +
>> +
>> +    x86ms->above_4g_mem_start = start;
>> +}
>> +
>>  void pc_memory_init(PCMachineState *pcms,
>>                      MemoryRegion *system_memory,
>>                      MemoryRegion *rom_memory,
>> @@ -823,6 +927,8 @@ void pc_memory_init(PCMachineState *pcms,
>>  
>>      linux_boot = (machine->kernel_filename != NULL);
>>  
>> +    x86_update_above_4g_mem_start(pcms, pci_hole64_size);
>> +
>>      /*
>>       * Split single memory region and use aliases to address portions of it,
>>       * done for backwards compatibility with older qemus.
>> @@ -833,6 +939,11 @@ void pc_memory_init(PCMachineState *pcms,
>>                               0, x86ms->below_4g_mem_size);
>>      memory_region_add_subregion(system_memory, 0, ram_below_4g);
>>      e820_add_entry(0, x86ms->below_4g_mem_size, E820_RAM);
>> +
>> +    if (x86ms->above_4g_mem_start == AMD_ABOVE_1TB_START) {
>> +        e820_add_entry(AMD_HT_START, AMD_HT_SIZE, E820_RESERVED);
>> +    }
> 
> 
> Causes a warning (and so a build failure) on 32 bit mingw:
> 
> ../qemu/hw/i386/pc.c: In function 'pc_memory_init':
> ../qemu/hw/i386/pc.c:939:35: error: comparison is always false due to limited range of data type [-Werror=type-limits]
>   939 |     if (x86ms->above_4g_mem_start == AMD_ABOVE_1TB_START) {
>       |                                   ^~
> cc1: all warnings being treated as errors
> 
> 
> Looking at the code, how is it supposed to work on 32 bit?
> It's ok if it does not work but I'd like a graceful failure
> not a silent corruption.
> 
> 
It didn't work on 32-bit qemu binaries -- My apologies for my oversight.

This diff below fixes the 2 warnings you got.
The rest of the added code uses hwaddr which is defined
as a uint64_t already (...)

diff --git a/include/hw/i386/x86.h b/include/hw/i386/x86.h
index 845e67c13f5a..b4022888879e 100644
--- a/include/hw/i386/x86.h
+++ b/include/hw/i386/x86.h
@@ -57,7 +57,7 @@ struct X86MachineState {
     ram_addr_t below_4g_mem_size, above_4g_mem_size;

     /* Start address of the initial RAM above 4G */
-    ram_addr_t above_4g_mem_start;
+    uint64_t above_4g_mem_start;

     /* CPU and apic information: */
     bool apic_xrupt_override;

(...) The second warning aforementioned being this:

../hw/i386/x86.c: In function 'x86_machine_initfn':
../hw/i386/x86.c:1324:33: error: large integer implicitly truncated to unsigned type
[-Werror=overflow]
     x86ms->above_4g_mem_start = 0x100000000ULL;
                                 ^~~~~~~~~~~~~~
cc1: all warnings being treated as errors

