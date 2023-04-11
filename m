Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 84FC66DDE44
	for <lists+qemu-devel@lfdr.de>; Tue, 11 Apr 2023 16:41:36 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pmFAH-00026s-3g; Tue, 11 Apr 2023 10:40:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <steven.sistare@oracle.com>)
 id 1pmFAE-00026L-9N
 for qemu-devel@nongnu.org; Tue, 11 Apr 2023 10:40:06 -0400
Received: from mx0a-00069f02.pphosted.com ([205.220.165.32])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <steven.sistare@oracle.com>)
 id 1pmFAA-0003y5-Vy
 for qemu-devel@nongnu.org; Tue, 11 Apr 2023 10:40:05 -0400
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 33BBObLL005160; Tue, 11 Apr 2023 14:40:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=message-id : date :
 subject : to : cc : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=corp-2023-03-30;
 bh=dg+s8gsnV+MXAWppDpMZAp3eZJt43cFpQ5rfttkdeqM=;
 b=4RsU2FlU91ATOTBH0/gE/WB639JnFZBpdy19PBdpD0Bi9De6TNjn9t3IMvXcukVe1iln
 y0e6oph0IGfJ7YjMiPZGZXqe2YC94T295S9nIailMcq/NF6LpBqBRHYOg2qsNUeB9aUD
 qjjL1vvhAE9D6pt8oFJpnUV546jElES3F8Jg9pR2i93siyH9IhBwkwcu98XhTSRrbu06
 vlvbVvy3Je+ebilf8kUXel+XAq80sHrViWaw4ObNNL1UtVAJWnXGu3/tcwxtCw5S8r4J
 EYADSeHqiJDUmqCHKEt07BPXgp1QqSs057hM5aWiZnM98PPmjJvZ3L7EKvVmvva+rWr3 5A== 
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com
 (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3pu0ttnmn1-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 11 Apr 2023 14:39:59 +0000
Received: from pps.filterd
 (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
 by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.17.1.19/8.17.1.19)
 with ESMTP id 33BEOXRR012860; Tue, 11 Apr 2023 14:39:58 GMT
Received: from nam04-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam04lp2049.outbound.protection.outlook.com [104.47.73.49])
 by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id
 3puwdny9df-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 11 Apr 2023 14:39:57 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nEJJ8dHIAWQOVSP2Ucr0lMBInQheZmUHrcBHg1+sCD4/G/keelkUS2rllR/5UnK+MDyyyDp4saiFe6Kx3MV3Dg+Jn0vtE7XyWSj24hWPYCH2Qie0nYpKVk5XxBNMrAbJKJT9f3aKQMldsxLuGuxjYM9c/uD/V8SSkvvOddjcHfYgRyzwMX6/CwyJPaLcHV+FgYDDaMtFRtuuWfqptO9gkCGkzG5bsQTC2oSHl0UeOzw+9x3buxaCWP3hMvqKdtSM4a/b0hjIaOmXjlz44wPpvj2F06xUMhlf+wsml/lIsMGa+fyPkgcGkkcjHQgO6Sl5mOi7q1/UP5KJaJe0AkZmhg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dg+s8gsnV+MXAWppDpMZAp3eZJt43cFpQ5rfttkdeqM=;
 b=BHlFNkKUgWJdfVk25onpoMuDckcsWHQMkXUEiL+6Wm7GiV3dJrhOWsl+rxGL146/05mOHlWj9UhpsQpP6Jr9FIxr35F2JIrd7YRFjdT4USgntER2BeoHo+SA+7/2i4hvv+VL76qjKFC0h43cNBc44pmQnWPoLT2al+qbQB7AEF1VcXSHVE4NtnFHRCsvp/4VJHfQXxDhu5zYEy+bKAbwJhJUqm71CQfAIFdsAlSCk94x21G73bFgLvfV59T7LlnD04EDzff+ShBB/rgFdMxQJ9qKXvihjYaUnyu9o+xYO5LFmS3DBTtKom+NFXwJZKgXypsKCYFOhmJXcThZ8cP4/Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dg+s8gsnV+MXAWppDpMZAp3eZJt43cFpQ5rfttkdeqM=;
 b=DgN9JqNVbb1JPLJ5VzCMv0ba9oUDDodG2NNZujZbtFTK9mKky9mfbgAooZraBLrtJqZJgnuhc/riIp8TJB2IkF5uQcmStrq/aCohgvYnxrIUcY0vHWJDEJGKqHbZOS5mwzmPNc7H/jZaK6K4l/9GJ1xdgwy0OtJZ1Qd3AXtYyiQ=
Received: from SA2PR10MB4684.namprd10.prod.outlook.com (2603:10b6:806:119::14)
 by SJ0PR10MB4479.namprd10.prod.outlook.com (2603:10b6:a03:2af::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6277.36; Tue, 11 Apr
 2023 14:39:56 +0000
Received: from SA2PR10MB4684.namprd10.prod.outlook.com
 ([fe80::7361:8416:8d4c:7733]) by SA2PR10MB4684.namprd10.prod.outlook.com
 ([fe80::7361:8416:8d4c:7733%8]) with mapi id 15.20.6277.038; Tue, 11 Apr 2023
 14:39:55 +0000
Message-ID: <c3793343-8fc7-7399-3629-43ed3456feac@oracle.com>
Date: Tue, 11 Apr 2023 10:39:53 -0400
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
Subject: Re: [PATCH] util/mmap: optimize qemu_ram_mmap() alignment
Content-Language: en-US
To: David Hildenbrand <david@redhat.com>, qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>, Peter Xu <peterx@redhat.com>,
 Igor Mammedov <imammedo@redhat.com>, Joao Martins
 <joao.m.martins@oracle.com>, Gavin Shan <gshan@redhat.com>
References: <1681141583-87816-1-git-send-email-steven.sistare@oracle.com>
 <5657e1e4-ab20-f0e9-a9d5-7b91aece1459@redhat.com>
From: Steven Sistare <steven.sistare@oracle.com>
Organization: Oracle Corporation
In-Reply-To: <5657e1e4-ab20-f0e9-a9d5-7b91aece1459@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SA0PR11CA0151.namprd11.prod.outlook.com
 (2603:10b6:806:1bb::6) To SA2PR10MB4684.namprd10.prod.outlook.com
 (2603:10b6:806:119::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA2PR10MB4684:EE_|SJ0PR10MB4479:EE_
X-MS-Office365-Filtering-Correlation-Id: 7e5a6573-ebe2-46ec-6a23-08db3a9a9e33
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: sg5X9dFhGmkSnnX0QxaLvgREaIYQPfzfpPsBflxqMYvUPlLru0Kd7fW1T/WNY1TRJstInsTMUZZyRY4sDDcW3LNuJ702cr0lSLSVqV9X+pWXc6L/F0d0izLkg0IPkhoUTr784VhQqGBblryfvnaaK9ko8Jys4mZK6hF31eS5xWpwGjEP2wAkFb7RjPRonzw+BSm/b/eeVFw9+sqjYlOCIDaSgV10LFIkzf5piBp5VHb9wHQpxDe+q/3gL+GyuC8C0CQtLpZTVYrPVB2Alk/2JqXguQKEJTWlLEFDGmCGDg4VPziEG4CCpAWGXOKK4BkosRdoQwMmY6RPUYdl+atGr3ksfjwJQaAcDfi48aeSdnUnUeyKW+QmUxtPJwu0ZgNaohyUB84uwBWN8jSNY5soBmDRbqgvvjNchnoMnomBnwS6mrRsrtUx1Knfp7nM8sLX+hT7egPWOWTGRAjw7VVuF2waGZBKo2a3uWT+ofqQoEuZkbrIuwPOIfO7YmG4ZPRdogyo7QEWpWIpzOOKmv/z6qyAHVhochRFPHK74Q4M9v4FRzDrjclWzaiCGCFBlPUffviNsFe11z+ArDFKcaCYy3C/E1Jh41XQvfuWdv0lpkjgDFvm0yhtkQCUZrdUuqSGR5WYPQBl8FAVOwh7fm+SfQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA2PR10MB4684.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(136003)(346002)(366004)(376002)(39860400002)(396003)(451199021)(36756003)(54906003)(31696002)(86362001)(41300700001)(83380400001)(316002)(66556008)(66476007)(4326008)(36916002)(6486002)(478600001)(8676002)(66946007)(5660300002)(8936002)(2906002)(44832011)(38100700002)(186003)(53546011)(6512007)(26005)(6506007)(2616005)(31686004)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RFF5aHNBa2N0TDdyMWUySTBRWEJmd0tVR3B3cFBYclZ2QnZ5M0FOSEVjUVk5?=
 =?utf-8?B?OGVFc0graDhEUnUvMWxPU2V3SDVjWTlXTGh0Q1Y4ckJMOEpYZ0N4SVpLR09B?=
 =?utf-8?B?UGNtUUNiMWZYQzU5L1dVZUZ6NDZLNGtHVTJjMTNZVGlMK2JtYWdIN1F4Rllr?=
 =?utf-8?B?cjlRTnRNV1JCeXJvOUpBZFpUc0htY0w3QkRvYllXRll2Umg1ZWpDSW41a3hZ?=
 =?utf-8?B?Rm9zTk9yQWR5TkR4K2l2b2Y4TjlJdS82UEFmbklnRkNva1VxU2gvZm5Yb1dj?=
 =?utf-8?B?RUJRaDYvZ2pSNld6MUVyQ3JqMzl4ejEwZkhwdjF5ditNZTA2Wm4raWpHWldK?=
 =?utf-8?B?Tm9oNk0rUkRqck44UGZScEFDREtZWTRja1VqY2VuV20xTGVkUys0VExXdkhE?=
 =?utf-8?B?RjN6M1k1V0luVkFkaUF1VDJZRExMOEp6MkR0eGZlYWJGTllDK0VFOWRkVTlQ?=
 =?utf-8?B?bmFVaHRFWFRpenhlR2x4U1U2UFlZdkYwbnMxQzIwdmtzUEgyTFVUNzRTSHMr?=
 =?utf-8?B?TVdrZVdLRjdsSUVMZG16Y1l2RGRWWVhJWjNnYURyZmdIb21rWUZRUW5oNGFK?=
 =?utf-8?B?T0dLSGVuVVlBSlNrNW8yN2xvVEZqMzhvWkprR2NPQ2hKODIvMnh1eDNncjBT?=
 =?utf-8?B?ZGpTSnBQUlZjV1IzU0RsL3FReGhIZFlHWkdDcFBiRnU0L2w4WVRCTFNkdEZ0?=
 =?utf-8?B?KzFZYjdTVXcwakVPRTNPVm5uQ2VXNVhmcWREc3hQOTYrbHN4R2tVdjcyVnJN?=
 =?utf-8?B?SFBHbWdFcHMrN0t5emIyVi9tT2ZyRndFdkI4cUpHS2syamtpdnBKY05wZGEr?=
 =?utf-8?B?aG1NR2VGKzZEU21LSlo4VWpzdG5nTkEweVFRUVg3R3p5ZWp6V1NraXRKVUQ3?=
 =?utf-8?B?UXJ3akM1WGxJZHVJQzZ4eVlWT24wc0NoMnIwQWI0YWRlMEMzam5lMHFteTM1?=
 =?utf-8?B?eEZPcmM2MmhZVVhQRjlCeTU3TUV3UTVESTcycHpwQk1aSVVQYnBhK1VXajIr?=
 =?utf-8?B?eVUvc3FiU2tRN2Myby9qYVNIM0ZrVHZReXI5K0NsWEF6SkJUTUxkVnhLT29z?=
 =?utf-8?B?M1NDS3M5ZmxJV1JpYkJaTCt1WVZBb3h2Yk1SeWloZ0k5VUlSL1l1bHpnODdW?=
 =?utf-8?B?NHdjTzZwWDJmZUNKS09BUkQvMDFMd3BCRXpqK1FzM080QjJyYU1MelVwOHM3?=
 =?utf-8?B?UFZPQmZlOVJpMGlLRUZENmpFM2czYjJvdGplNHE2YTVQcHluZUJDUGRWU2h5?=
 =?utf-8?B?NDcralZ2YisvSjBLditvRHp2ZEt2c0UxQk1sR1hOaVlxeXR0Tit5RDZUNWF1?=
 =?utf-8?B?L1BpYXUvb1U3QUpFb204bFo0YmMxNk0xQ1h4Z1NwMXB5ZExqQmsrN1MzQjVC?=
 =?utf-8?B?SDkzQUZpWWcvRXVxdGk2MXhDWkVjZUpyYWU3azBKRDc2SFgyY3ppbWJnS1Bs?=
 =?utf-8?B?TFdIOFhFTnRBTVFOOWI4WTdkSkp4MlJ2cnJuUWlTd0tDcGR5ekMzd3JUTmwr?=
 =?utf-8?B?aUordzhBT21IWDk0Ynl2WW1NU1ptUk1odngrTXB6SzduSllBTTM0S3VqSE1Q?=
 =?utf-8?B?N0hGNytZUmFBVS9XM1RIcG91K1Z5NG5icGlQc1Urem5PYTdocmIveVdnK1k1?=
 =?utf-8?B?NFA1WXZCZkVvZWo2U0Fnb2Y2SzJpYXhQeGZ4Z2p3NFNZNFNNU1U3Ry9haHlW?=
 =?utf-8?B?cHp5Y3JvREdINVRUUVFWVGpyQkN4ZTBOMzczeHRZMXZtOUljZlVLcnJqYU5X?=
 =?utf-8?B?U3BNR25ueGtwWVMrNkRrbTFWSnVDa1QvRU9nMUR6ZXVqZGZpaDF4QVhoakx1?=
 =?utf-8?B?S21xcU1uaGdmYlNIaDhtUDlyNEovZlBzRENyTHV3d1lkOTlvZTkxUWVVZ3dk?=
 =?utf-8?B?WUJtbXI4UzhxNkVBZ3o4Z0xkUWtHOFVvL2NES1RQVDFiUGd3THRqUm1IMlA5?=
 =?utf-8?B?QW9rc1UySkczQzFheHRPNWdPUjZaRkozaGF0VzJGcXEwSlZnMFA4azdDVG1Z?=
 =?utf-8?B?bVZDc2o1TC8yTTUrVTZjRHRUVFNFeTIwQ2h4OXp3cmhURVBQZ1JWNmRXOFpF?=
 =?utf-8?B?elNCMFRaK3luSkRGbW15T1d2Mit2d0ZZRzlta0JzbTQ5cVBpMEdMMDhNTTM1?=
 =?utf-8?B?VEU1a1hRTTY4MGRnWHo0ZU14a3hDUGJUWC9XcURya3VJY1BwUVg1akJwRjFi?=
 =?utf-8?B?Y2c9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: uakclRY3Zz1cO5JPSge+2E8zrZm7Syqd9vb50PFQPRIP31col3pZ865tbWdQ/GEpqPUrC2ST9ABWO52ij1ud6OIkbTcgA8/zyVAvWEUtyj6inVIkM6zoqOOoNfNFPPp+NNmwiIpUySU6UJx5ZiKia9NuyAy5VWVqLNWF3MDVG/v5ULmmwg4vyU9G4wVg9eO94Vr013Dtco10aGYfwnhUWLlxHnBoHbGXvWj1bu7/d2TlRUBPQ20z4IjkIrvuBvfcLF7HzorYeie5zxxMIn1VC/sFXda7HBXkmffhErostJCB5Vt5afDRmISPCM6B1WrCOItHnSq7sxV4SzCLVS7oz2o00CXQAnG+L9RC+8qyME/f6M3iHxzh8AUUPoLA0i5pofk74yYMF7RsJY8yXiQU6GNUVIBi12Rrk/fziFb2yIlQE8Kfc3XjQQHi9a+3UF58hHUbBgKIg762dD/0gQcekow1/EsAgrt+MSKYewJpyqcWBiqde7n6nt1njCR5kHChWxMJzPK/6WYTUxrAmeyjcDFHJRFCWyYVFy45RLFWvZS1ofHmj74EEk0MmJtZsZcuBJvGOuD6ZtrwdczntlfcD/tC5UVD/tXnIktlWTW5lR63o/9Z9iq5cb0qdoBl2EK/cGMcwnf8foq3U2DJfYLNqWlrVJF2hAZSDmqygNSSRnCHsFH9gagpmfTphhYFyjjjqmy/ecHYBnXA1qdv6iW75JneAxvkdks5zfko4CDUNsnIs6KzeU36XI4js9hbsYSAud2DMUA+rztDpNok6TYN7Q==
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7e5a6573-ebe2-46ec-6a23-08db3a9a9e33
X-MS-Exchange-CrossTenant-AuthSource: SA2PR10MB4684.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Apr 2023 14:39:55.8816 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Q5h42N+UCimzb9sQT3GOqisV01jmk2OzgdhvIq/FInglW9wcc8e/GyV711z/jnDNp5zffL5npTb4MKhYOnZ0cl/0p5Yf5VXB0m2kFN43hxE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR10MB4479
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-04-11_10,2023-04-11_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0
 mlxscore=0
 mlxlogscore=999 spamscore=0 suspectscore=0 bulkscore=0 adultscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2303200000 definitions=main-2304110134
X-Proofpoint-ORIG-GUID: BNuGM8-oNAR0hqfRSiUpAYWCfxJg7e_0
X-Proofpoint-GUID: BNuGM8-oNAR0hqfRSiUpAYWCfxJg7e_0
Received-SPF: pass client-ip=205.220.165.32;
 envelope-from=steven.sistare@oracle.com; helo=mx0a-00069f02.pphosted.com
X-Spam_score_int: -49
X-Spam_score: -5.0
X-Spam_bar: -----
X-Spam_report: (-5.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.17,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 4/11/2023 3:57 AM, David Hildenbrand wrote:
> On 10.04.23 17:46, Steve Sistare wrote:
>> Guest RAM created with memory-backend-memfd is aligned to a
>> QEMU_VMALLOC_ALIGN=2M boundary, and memory-backend-memfd does not support
>> the "align" parameter to change the default.  This is sub-optimal on
>> aarch64 kernels with a 64 KB page size and 512 MB huge page size, as the
>> range will not be backed by huge pages.  Moreover, any shared allocation
>> using qemu_ram_mmap() will be sub-optimal on such a system if the align
>> parameter is less than 512 MB.
>>
>> The kernel is smart enough to return a hugely aligned pointer for MAP_SHARED
>> mappings when /sys/kernel/mm/transparent_hugepage/shmem_enabled allows it.
>> However, the qemu function qemu_ram_mmap() mmap's twice to perform its own
>> alignment:
>>
>>      guardptr = mmap(0, total, PROT_NONE, flags, ...
>>      flags |= shared ? MAP_SHARED : MAP_PRIVATE;
>>      ptr = mmap(guardptr + offset, size, prot, flags | map_sync_flags, ...
>>
>> On the first call, flags has MAP_PRIVATE, hence the kernel does not apply
>> its shared memory policy, and returns a non-huge-aligned guardptr.
>>
>> To fix, for shared mappings, pass MAP_SHARED to both mmap calls.
>>
>> Signed-off-by: Steve Sistare <steven.sistare@oracle.com>
>> Reviewed-by: Joao Martins <joao.m.martins@oracle.com>
>> ---
>>   util/mmap-alloc.c | 5 +++--
>>   1 file changed, 3 insertions(+), 2 deletions(-)
>>
>> diff --git a/util/mmap-alloc.c b/util/mmap-alloc.c
>> index 5ed7d29..37a0d1e 100644
>> --- a/util/mmap-alloc.c
>> +++ b/util/mmap-alloc.c
>> @@ -121,7 +121,7 @@ static bool map_noreserve_effective(int fd, uint32_t qemu_map_flags)
>>    * Reserve a new memory region of the requested size to be used for mapping
>>    * from the given fd (if any).
>>    */
>> -static void *mmap_reserve(size_t size, int fd)
>> +static void *mmap_reserve(size_t size, int fd, int final_flags)
>>   {
>>       int flags = MAP_PRIVATE;
>>   @@ -144,6 +144,7 @@ static void *mmap_reserve(size_t size, int fd)
>>   #else
>>       fd = -1;
>>       flags |= MAP_ANONYMOUS;
>> +    flags |= final_flags & MAP_SHARED;
> 
> Setting both, MAP_PRIVATE and MAP_SHARED sure sounds very wrong.

Yes, thanks.  I introduced that mistake when I ported the fix from an earlier qemu that did not
have mmap_reserve.  Should be:

    fd = -1;
    flags = MAP_ANONYMOUS;
    flags |= final_flags & (MAP_SHARED | MAP_PRIVATE);

> The traditional way to handle that is via QEMU_VMALLOC_ALIGN.
> 
> I think you'd actually want to turn QEMU_VMALLOC_ALIGN into a function that is able to special-case like hw/virtio/virtio-mem.c:virtio_mem_default_thp_size() does for "qemu_real_host_page_size() == 64 * KiB".
> 
> If you set QEMU_VMALLOC_ALIGN properly, you'll also have any DIMMs get that alignment in guest physical address space.

If we increase QEMU_VMALLOC_ALIGN, then all allocations will be 512MB aligned.  If we make many small
allocations, we could conceivably run out of VA space.  Further, the processor may use low order 
address bits in internal hashes, and now offset X in every allocated range will have the same value for
the low 29 bits, possibly causing more collisions and reducing performance.  Further, the huge alignment
is not even needed if huge pages for shmem have been disabled in sysconfig.

We could avoid that by adding logic to also consider allocation size when choosing alignment, and
checking sysconfig tunables.  Or, we can just let the kernel do so by telling it the truth about 
memory flavor when calling mmap.

- Steve

