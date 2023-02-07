Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ED42B68E2F6
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Feb 2023 22:29:40 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pPVWS-0008Al-JE; Tue, 07 Feb 2023 16:29:04 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <steven.sistare@oracle.com>)
 id 1pPVWP-0008AF-10
 for qemu-devel@nongnu.org; Tue, 07 Feb 2023 16:29:01 -0500
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <steven.sistare@oracle.com>)
 id 1pPVWL-0005GR-GS
 for qemu-devel@nongnu.org; Tue, 07 Feb 2023 16:29:00 -0500
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 317KSe54029807; Tue, 7 Feb 2023 21:28:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=message-id : date :
 subject : to : cc : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=corp-2022-7-12;
 bh=6r++7SBN/J2t0loNFXEzAAPOnJczsai12ZixjjqMF24=;
 b=unEn+CPzfgBDRU1CvuUmNYgkwVJ46EReUMMmrXT+cv73RaS2Sh4+VzhdC8/EWTv8fcE/
 PSDj7epn3NoV9XrNzOOsqL04l3rba/5ImoAJStnwI1fSTdel0nkm/0aFYETNPcViOS9z
 c5GowSEIecXoc5AhiXIMpnpbB668gdowbkuP9Lmw+1EuxydU226gdgTmHzxP+v6M4B++
 Jxkw33Q1dXJuMmuN9thlSD9+8JRgJeO6d/9dZO4qY8ZzsI8MGpR8YW4/tTlWq72M0e/M
 vycYmMrsnc1VBsW6iUNefb2O4LCHaTnONS+WabvdmiW3PSluV5ye85xew7YuMdMW9Qff XA== 
Received: from phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com
 (phxpaimrmta01.appoci.oracle.com [138.1.114.2])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3nheytxsr7-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 07 Feb 2023 21:28:55 +0000
Received: from pps.filterd
 (phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
 by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (8.17.1.5/8.17.1.5)
 with ESMTP id 317LHc4n024897; Tue, 7 Feb 2023 21:28:54 GMT
Received: from nam12-mw2-obe.outbound.protection.outlook.com
 (mail-mw2nam12lp2044.outbound.protection.outlook.com [104.47.66.44])
 by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id
 3njrbatcp7-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 07 Feb 2023 21:28:54 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jEjYqh1myGNh4k1SSijcrpCJf0L39LUHGGPlrZdu/3kwMV57g6iEmQf//+yvaEiUeOKdo/xt1XAaze2AayYZt9Gc0RcVV3FeJfkq/xaBbIBTGhHGRTY5DdvU2Q9c+TT0YKj5Xt7stjDWKHqITuhLsLzl2EoXyOFONZAgzGh42ze2GXNoPEsomLEeRCBBevSr7ya+2EoqQDo7CGgpWV7R22vMOoZaUDhcVb/VpLcKLas1tqEg1HasrmmNROQpcpLNNK3DHPd9LplMdc+dmz4ueitciWnwryFR+ewklkYbEv/7eO9QKCRE63xN22q8UtudnnhiJzlCq7/4p7xGHzmJpg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6r++7SBN/J2t0loNFXEzAAPOnJczsai12ZixjjqMF24=;
 b=VUGH6xBz0s3Bl+Wi0iPZWgYRz+8cE6AiRMBTWrJskDLfCJ3rubdqNQ11TiuwurHDVKy3yqEx+N0p6+KMlZobAge1CDEB4oJW08i8EFr5kG4bw8it68EClDQ88RakA2Xx7AH/Fvxjn5QCvJZ8vTMPnHS6OxADtjSTlrue4fbVGXqvyYsg8VsrUm59TmaBjHi0qWKyQ1kOAlhhO3SC9dfmYIeodjShMg0bfnwQi53D0KTUFDaUwqoLhh/mlNs8MQNeAt5PYCxb/sDC/EqEcunNb1MwYtBB3dTNPJ3Yv7YGUyHbxhfZqM+iu5jcO0qz68o8aJ93TPjLYVB9I5HAJYtMTw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6r++7SBN/J2t0loNFXEzAAPOnJczsai12ZixjjqMF24=;
 b=Rqunx6rR/yFRSuFSZYixsyo1mlw0+0f1kpM0Q+Y2AC3VvgNgzaPJjUHMTTfSsSFgQHpLOUlA+XkKHXvd50Kjy+UkmTfEDUNAMCcVWIDPI77wjknsx4Om8Ow2SxVMXsuNwa9rbdkTpB8LhjvS1T5zEoduSXHGLCpvZ9aDwwcsdj0=
Received: from SA2PR10MB4684.namprd10.prod.outlook.com (2603:10b6:806:119::14)
 by DS0PR10MB7245.namprd10.prod.outlook.com (2603:10b6:8:fd::6) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6086.16; Tue, 7 Feb 2023 21:28:52 +0000
Received: from SA2PR10MB4684.namprd10.prod.outlook.com
 ([fe80::ed27:2f6f:22b1:39c]) by SA2PR10MB4684.namprd10.prod.outlook.com
 ([fe80::ed27:2f6f:22b1:39c%9]) with mapi id 15.20.6086.016; Tue, 7 Feb 2023
 21:28:52 +0000
Message-ID: <d2cf4bae-1a45-d2ae-8f47-f4ce56cf21dd@oracle.com>
Date: Tue, 7 Feb 2023 16:28:49 -0500
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH V2] memory: flat section iterator
Content-Language: en-US
To: Peter Xu <peterx@redhat.com>
Cc: qemu-devel@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 David Hildenbrand <david@redhat.com>,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 Alex Williamson <alex.williamson@redhat.com>
References: <1675796609-235681-1-git-send-email-steven.sistare@oracle.com>
 <Y+KwNN9v81aLKct2@x1n>
From: Steven Sistare <steven.sistare@oracle.com>
Organization: Oracle Corporation
In-Reply-To: <Y+KwNN9v81aLKct2@x1n>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MN2PR06CA0011.namprd06.prod.outlook.com
 (2603:10b6:208:23d::16) To SA2PR10MB4684.namprd10.prod.outlook.com
 (2603:10b6:806:119::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA2PR10MB4684:EE_|DS0PR10MB7245:EE_
X-MS-Office365-Filtering-Correlation-Id: 98eb5193-cc90-466e-cb81-08db09524f1e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: P2SRr4xDi2CSkcJYFolZ2CYHU2m5Jm95iNWQ8XotuZj4rXo5rOaqajx8SlWIG8M8gtSvAldJNAonX6pM2wHeDI1MFSVGkIb9hyTSkPjZeUqo570fBKzC1IP8dEvZwUFsTM0vRakez+VoK4JKgwSWCfdzX3ncrWoqlzwm0F86phMzxt+COh5Z1P/eR0bFhi/Hklcqt/dgXDjca0sK8mC7rVAQPq38waFw2V1KGS5VgVlYqy0oo7FOvyMAKe2BYKz7LgvnB5pXgHC3F4ybeDWTHiZAVpVM1z+KUEiMyZXI5sbKNohFUWX53WC+lmYxOU7Tkdo+jBnLeAv4jzCyI1tr1pHWeJgKTjeQRGBc6yJ9uUl/4uldb52E/H1uUHLkFQfuFuUULX14nWOSGXZZ17FsNCeKMBAFSlFEzlx4F9cVs21ArMvK867+oyKi76HGrX0ZqKaQV3rHGLr+aBP0Uu0BvnwQ8fg+Mmy1akfc57jboTHNw89fyxMHjd39ldc32wHLiVXW+B89DugGRKjkOrya203e7i4W2vUCzBO1YTYDdqJwmzQtr5trz7B/a6dyZpsXUM8x0NkrSD28/YOIRIIq7Gll9zkytDeTLw9+qIryCGzStlo/h5GldmMFkW6mlJcyLIbRYis8cbMQhuQkUGM8nDavIh1M0/deyPTDJ0BkIS2u+LdnUh2+VwnCSiRUHyZecRezF6Xpf7XrK9ELXp5cyeWsA6JXJUKB+W80AsFSkISuqAr/pkkUVt4Fn+nz61y/bYgP38dmjFY+0REW8hboBg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA2PR10MB4684.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(346002)(366004)(396003)(136003)(376002)(39860400002)(451199018)(44832011)(5660300002)(36916002)(36756003)(966005)(2616005)(6486002)(86362001)(2906002)(6506007)(6512007)(186003)(53546011)(26005)(31696002)(478600001)(6666004)(83380400001)(41300700001)(66556008)(66476007)(66946007)(4326008)(6916009)(8676002)(38100700002)(31686004)(54906003)(316002)(8936002)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VkVzZkhRcUdobm1HcHNIdDF3cjlsUGZjUHJ5U05Qa21PUEtiUFgxakdjT3lL?=
 =?utf-8?B?dVFMb1hpYVovM0Izay9XZGVwQzUyN21GWkNLd1N5NWczSHNud0dlQmg3YVVt?=
 =?utf-8?B?MW42MXdKVWlUQW53bHd0cmtxR3NYQldvcmM0Y3QwR3VtU3JGM3h1cmxPb1Nx?=
 =?utf-8?B?RVFmMFJxaFNvaDdhZ3N2bXB1THlNQ0JZYW1uNXdzRWpBdWFTL0tvN2Nobkpr?=
 =?utf-8?B?UWtHeWFBU2puT1ZnQndtTkdCNklIelBEeEZhRkZoR3BVNnJDYmw3bTArN2px?=
 =?utf-8?B?TklBRzk3MjZEcE9SWDVoSENTdDh0cktGNkxKY1REVFhPeWU3ODV1bmZhTUVl?=
 =?utf-8?B?Wi9QbzlUV05MRDZvTG1TVXNhVWxZUkQ1SkpGTEFCbnRVSld0Q1VDZGZJblRO?=
 =?utf-8?B?V1lhWkNWUWZPbWg5eXJEQ0EyMTNwRU1nWkRSMENNZ0grT2k3OUhKdWs5Wk9a?=
 =?utf-8?B?VFd2RDRqWWIzUGUxNTZkNHBqbzFqejNNQTY4V3JEN255djNJa2tFam5uV2Rm?=
 =?utf-8?B?UjhvTUp1aG96YWFoS0FHNVNMVnM5bVQ4KzkyK3dZM3BpV3FIQ0tSU055dDVN?=
 =?utf-8?B?a0VSa3VpdzZUVm4rWEwwWWVpbEt3SmxKVktzb2kyMm9Rb2JaVk53STJFUFg2?=
 =?utf-8?B?NU94T252SU1PVi82S1BldmEyR0dlUnZLVU5naW5LS09aeTQ4Q1NyTXpTREdj?=
 =?utf-8?B?b1BqTU05ODRDekgvRmJhaC9XcEpzdzY1bUpreUx5dWdjTXUwalBOWDlnNFp1?=
 =?utf-8?B?bFNad1Zhc3M3Smt3YnByY0ZCa0FpSlVNYXRLKzNGdTc5M29WR0VoVWQ0b2o2?=
 =?utf-8?B?SEtmQk1xbkpGZElPckF2ekJBbkV4amNsOEZpMzhLNi91YjUvS3FYcVlRN1BI?=
 =?utf-8?B?dFVGeXpmNHZWVHhPZUZXc2dadjRyai9qTmtUUXFVbUFmcU1XeER0aFMwcm5z?=
 =?utf-8?B?a0M4N3ZSL25JeXpnY20zR0p1UEoxODc5cG02RmFQMEF4ZjdBUjNqbmY5MFY1?=
 =?utf-8?B?b2Z1ZWVrNE9yRHJFNGdoNGtXZG1TTllyUlJmWThYd3grMm4vY3Z6V2xXaUJX?=
 =?utf-8?B?d0ViViswbW1KSXp2ZUNTUjVSbWlEM3UydTBxRTNQakhwVnh1dXhUeFd4ckk2?=
 =?utf-8?B?bllSbnFwRTJ2ekxpWFo4UXF5WjIzQUtQQXRkV0t1SUFuMCtsMi8vbEcyQ3lL?=
 =?utf-8?B?V1paRkpPb2VvZGZUaEJlZENHVzFVK3Z0akZObEE0ekV4VEZ4cFZHYStxcUg0?=
 =?utf-8?B?Mk1FT05tc2dWdDdTZ1Jyb290ZGJNckN0QTJBQ2sramFTSUdMQmJwaXhvQkF6?=
 =?utf-8?B?aXZuVlBWa1JlVGR0SUN4b1FVTGZUcGY4Uk5Oc094SXN5aTJ3dU0vOWhRNEEv?=
 =?utf-8?B?Um1qNXRoZ1c0ZXB3VHdkVXZhTDJzYnZVbHRWbTlSR2lMbCt2YmJnNSt0eWpY?=
 =?utf-8?B?dkxLeU5rZkdyV2JFaUJRb1BhdUU5VHZlQW50N2FDeXBSZnoyNHpCdVF4M1FQ?=
 =?utf-8?B?enlyTURIMlNzMnphRVVTTVljNG1rYlErbXcvRWswNmwwb2hDNDNaQVBLN2Nl?=
 =?utf-8?B?WnNOZVh4bmFlTTJ5MlFFQzUvQTIyZzloZlhHNFVQMlR6YUxyVDVldGtpRTg5?=
 =?utf-8?B?TXlieFN2OTU1eGczSTR4NVJ0TWV4bmk4R0hpam1FVTNrcUpwL0dQNlZGaENm?=
 =?utf-8?B?WWpJd05xbG5Pc2hRSHlEMjZCTnRrZmpYL3NYMm15RlhjalVGeVpjRzRFUWov?=
 =?utf-8?B?c3ErTWZabVJMZ0swVGFUQWFPa2RMVjQ4Rlp3S0cvZFAvRERlMERkZzE1Y0JO?=
 =?utf-8?B?UUVSWVdaS0NNWTBIdUJGSDFwbnd6eWo0bmFQNGFQUTUycWdnTFAvY2tIbG1u?=
 =?utf-8?B?MGtDVUUyRUpFdklYRDJmemhkZDY1VmRoOHYwd2VoM05qQkFCd2gzZnZIdDVz?=
 =?utf-8?B?SFU2YWRxVmZCNFhrT3huU09TdmxScGZ3SjlXOGM1RytKa3l6amJTbDZIaHFq?=
 =?utf-8?B?YnlPd3pBVlJIR1dDSW1GNWdmS0Rwem1UbHZCVTI4UzFZd0g2Wm9WRnQyYnhB?=
 =?utf-8?B?TnN6dDRzSTNIeVBrMEl3aUNYK3hmbzJnUy9SeTYwQ3krc2psQVJSU1dyaDlo?=
 =?utf-8?B?SzlHUFF2eHY1VGZXUlh3T1A3M1VRN2dtdkFQODNoL1dOYktVaEVhckNINWtG?=
 =?utf-8?B?VHc9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: oqwsaFLUYUlzqG6XLHXgppgTi/24cg1rr2ZNxDYxClzqv0Q4e1jdae+5Km0tlazGF2MMS49/KylGg8fQyD3sKbkOBd41gdFd/CqDW0b/5Mf/d4lVUBKuitwHE7uw5JMHoZAx+5NsALuy1bX6G2cHCdIj9AdvdeGQFw8opC1Fj2w0TrfO4lP3k2JkEmy63BnzwYbG7fndgeaFNhKQsfEXEDom1sC+jl5XYi5rpudBiCF+jWcmkomIHBb1zYpIUx0OKTTRBtqM5JqYWSk2kmjA72X3g3qtJ8XZTgZ3oTOM1a/Gh7jASq/FT83D9cgW/qjK9YFtiImJkMyPBIH9pBdoBzus9TQIVNq3tisO1466ZEpPXJil68RDf4wqJ7sHMFjUlQ/nwaIYj5VLLSZRmmIakPC0UQH4wAqsSTM1NPwbt08Po94Y0Vs95yo7eF8E+KVxkIxwYoLdgf95Jm8tAJXq5buUcw52l1FR7qL4Kv8M+qELjtkiah5NSINMjfaBmU11knFZ3THtJ6bOU7ySvO9Wjt86z0WZhJsMfYRoM4dmMN7NZTorkv+bmWq+H7oxW+UUrb0hH0IRSs9v7bCRrCnm5GwMn7sxKNqUPgroH/XunOk2NEBU8i94swl6I+Gbg/4Tt94BhKbOviMIyE4rjsOO1xB8nCiJZVBQTh5NQ76Ds/kU03efCBrHXgC87Mw/zMAiZAvxv3H4J5WsnX6cnrFez6yjUeO2WznH3iyTJBlEnyiYM5ma1B19eA3dTapVuinuix6SeEtY4/VzcEEYJzP3Nj7SipaXj9ibRq/HVsW64+zBEflUPH3q9TlMaTLPs0SV
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 98eb5193-cc90-466e-cb81-08db09524f1e
X-MS-Exchange-CrossTenant-AuthSource: SA2PR10MB4684.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Feb 2023 21:28:52.4488 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: s3H+sh7tVGZ7qj4x7Q0N6zGO7PREKPIUjZLsXfHdTne4nNoapbgn7P5Octy9ynnty6NQJvJRIUVQT7BphbiykhAhaNMpPvDXUB3U6ugN7wI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR10MB7245
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.122.1
 definitions=2023-02-07_13,2023-02-06_03,2022-06-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0
 phishscore=0 spamscore=0
 malwarescore=0 suspectscore=0 mlxscore=0 mlxlogscore=999 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2212070000
 definitions=main-2302070184
X-Proofpoint-GUID: xLqpDDy7YbzT1JTtDBqErXxayYAVnrxX
X-Proofpoint-ORIG-GUID: xLqpDDy7YbzT1JTtDBqErXxayYAVnrxX
Received-SPF: pass client-ip=205.220.177.32;
 envelope-from=steven.sistare@oracle.com; helo=mx0b-00069f02.pphosted.com
X-Spam_score_int: -38
X-Spam_score: -3.9
X-Spam_bar: ---
X-Spam_report: (-3.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.148,
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

On 2/7/2023 3:10 PM, Peter Xu wrote:
> On Tue, Feb 07, 2023 at 11:03:29AM -0800, Steve Sistare wrote:
>> Add an iterator over the sections of a flattened address space.
>> This will be needed by cpr to issue vfio ioctl's on the same memory
>> ranges that are already programmed.
> 
> Should this better be proposed with the context of using it?  Or I don't
> know how to justify this new interface is needed.
> 
> For example, any explanations on why memory region listeners cannot work?

For context, the new interfaces is used in the patch
  "vfio-pci: recover from unmap-all-vaddr failure"
in the original live update series:
  https://lore.kernel.org/qemu-devel/1658851843-236870-1-git-send-email-steven.sistare@oracle.com/

More succinctly, the memory region listeners already ran, and the vfio 
callbacks created vfio memory regions.  Now we want to perform live update,
and are in steady state, so no listeners are being called.  We need the
flat section iterator to reproduce the same addresses and extents that were
produced by the listeners, to make a state change on each distinct vfio
memory region.

- Steve

