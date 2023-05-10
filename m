Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3ADA46FE27B
	for <lists+qemu-devel@lfdr.de>; Wed, 10 May 2023 18:30:03 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pwmgp-0001qx-3g; Wed, 10 May 2023 12:29:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.devolder@oracle.com>)
 id 1pwmgm-0001q8-Nu; Wed, 10 May 2023 12:29:16 -0400
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.devolder@oracle.com>)
 id 1pwmgi-0003rv-Vk; Wed, 10 May 2023 12:29:16 -0400
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 34ADwvUQ016211; Wed, 10 May 2023 16:29:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=message-id : date :
 subject : to : cc : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=corp-2023-03-30;
 bh=w+imZ9DpRHlV7qifXuiGQ0rXv887vzOrqfwPhmcHwwc=;
 b=icjYByOTQSsknz72winoCsWP5mxGF7a+eBRTASzEl8iiORBEHdyKZ2HANaqiLbfEtkho
 AWmdsLfBpRGDOvEqhMzQPsXrlSG4pVz+vcCUVfli/N7N34FmYGJW2o0oFhZG03sVYebT
 nWc1sU8zQ1tRMkKrTZYRWLQh1GFfq5cm5SU2LApHmMCOJl6z9pItV1i4ab9cbXo8VLZ0
 pzml4XBK7tZYVt1hgq+TG+vielq3y+bW8PsYkR/SdX8GxxokgYcbS8wwpyoHk/kfMstk
 GcPDshsonCBr+pwBZY3VYp368CAnXnBQhtciaDZN/cTsIZoLh9sYsEsZYWHboIk3aaCJ 5w== 
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com
 (phxpaimrmta02.appoci.oracle.com [147.154.114.232])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3qf7775381-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 10 May 2023 16:29:05 +0000
Received: from pps.filterd
 (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
 by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (8.17.1.19/8.17.1.19)
 with ESMTP id 34AEwgCV014345; Wed, 10 May 2023 16:29:05 GMT
Received: from nam12-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam12lp2169.outbound.protection.outlook.com [104.47.59.169])
 by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id
 3qf82x89ed-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 10 May 2023 16:29:04 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NTqsXVMqNv9MNwj/g2iDwe40ySGrFYeZ6L+Pno9Y/VzJflTP3x3x+8XSAeU/Mj7PkkBQyxE4TgPve4YcETSqP7jenY5AB7VE2J1xqZO5yRhxCPKQak3xPgeKHoKPmQRZlyv071EctzkS1OngjmmG/iD5oCer6luU/wMhAxlTWOj6OB2MU037DiQlj6OFTPz+jnpAlF27H5zJW6fcavD5dkcJbV129uKl+2nJwrJ9t75mD2gpoTkZbuM1rQDnRWqN/rWPuFNw6L4+czVv4rA+EvhwzMJeJgXwNVqex3J7/JXeokO+ivmTReYLCqxEKEWvGnI2OEMU7Wfq/Neh137Cdg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=w+imZ9DpRHlV7qifXuiGQ0rXv887vzOrqfwPhmcHwwc=;
 b=eJC60Nbr7Kyqx2aN35xUJUo6ktH7VnEgL+z8WLWJJI0RCJgMvbFNoc6Q62A+4+K87IUySnTK9bWiYmjjvBan/iTSNpUloNKJtpoPwelkJ2O6ENOA77lcjF8pfmXfcDWKHxwPGxX5RaRT/aRZnecbhj9BeF6mTtAKBPu/fN6f94V86ghNEVvkPFzUC986saY4CcAfxZQC+qK4jRQLe9+QmVv3OfHUlsZZKQuTzWdsnhN3WTmtB+ZSkfPKJfuQZuLUhFQsyCnzhXlZeXGY+ggZRTYx52bIkCY95P74Lgt+/Ogdwi9AUlSwUO6JxkNlxM7/uXviID5UI/r9XHu+K3rnog==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=w+imZ9DpRHlV7qifXuiGQ0rXv887vzOrqfwPhmcHwwc=;
 b=zPeODymCCtD6vvZCneK4DrDu0c9nywM2HH0a6/ZOT7277TqGTIHEYvIRrmTRp549/hNqkNEs1KYlR018lzdZmG+q01ov400toJA/PI81qDd/CfG2hnOpWOjz+bZ/6tiPNqfRne6dEZDLO3rA/4E5Qyutqfb5uN8p4IvKG0hl5dU=
Received: from SJ0PR10MB4542.namprd10.prod.outlook.com (2603:10b6:a03:2da::19)
 by SA2PR10MB4492.namprd10.prod.outlook.com (2603:10b6:806:11f::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6363.33; Wed, 10 May
 2023 16:29:02 +0000
Received: from SJ0PR10MB4542.namprd10.prod.outlook.com
 ([fe80::ad42:b11a:662:9466]) by SJ0PR10MB4542.namprd10.prod.outlook.com
 ([fe80::ad42:b11a:662:9466%3]) with mapi id 15.20.6387.020; Wed, 10 May 2023
 16:29:02 +0000
Message-ID: <b4c7a40f-519b-7754-34be-0c1b2567452f@oracle.com>
Date: Wed, 10 May 2023 11:28:58 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH v3 0/3] ACPI: i386: bump MADT to revision 5
Content-Language: en-US
To: Igor Mammedov <imammedo@redhat.com>
Cc: shannon.zhaosl@gmail.com, mst@redhat.com, ani@anisinha.ca,
 peter.maydell@linaro.org, qemu-arm@nongnu.org, qemu-devel@nongnu.org,
 marcel.apfelbaum@gmail.com, pbonzini@redhat.com,
 richard.henderson@linaro.org, eduardo@habkost.net,
 boris.ostrovsky@oracle.com, miguel.luis@oracle.com
References: <20230421214901.2053-1-eric.devolder@oracle.com>
 <67265b8f-10ff-d276-bdda-b6c66666e36a@oracle.com>
 <20230510101408.03e6684f@imammedo.users.ipa.redhat.com>
 <d6262e92-9f2e-10f3-6fff-1bc376f98cc5@oracle.com>
 <20230510174510.089ecb14@imammedo.users.ipa.redhat.com>
From: Eric DeVolder <eric.devolder@oracle.com>
In-Reply-To: <20230510174510.089ecb14@imammedo.users.ipa.redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SN7PR04CA0053.namprd04.prod.outlook.com
 (2603:10b6:806:120::28) To SJ0PR10MB4542.namprd10.prod.outlook.com
 (2603:10b6:a03:2da::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR10MB4542:EE_|SA2PR10MB4492:EE_
X-MS-Office365-Filtering-Correlation-Id: 62230af2-7dc0-4077-bc7e-08db5173a9f9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Q5SwCfYFqAf54GyCJs6AKvGME6ujO4T/yex5NYWWtTWdz+7vjQCKkSPYTJLcwvNtiwNzSaWPJaB3jeSc72ECCYdQW4VkhueSRA/P2f7FJpjY6ZU7skT+5qaELpgrypboPYHEF9ZKINtMxSBYNMjkPtt83ss0ax3Opp/7alZXaTgXTiSpttAQ+0m6jOJcR7czYmGCYKSqQowGvsm2N+6swVJP2tdXmJHK4b7vsqz7AvDcAe2aT0GaF1mAXP42lrHoR3nS326WwOExPpn1E+UFftYl68pqDyFkzbnhwysgPbOgL19Te5eosehiiXlRCAqWPOKpS7DdsYtaYuzNDt0af9OZ01+rmgRcDzApxkcF+HdBvwozNpC0nOlWx3PAUZQvTldMtpCqjYBDp3IBSSeF4vss5QNgzX1uer6qCFiNhzDg/tHGUOgUGJQ3B6PZLVUyEd+FX1GAe9eTZeGzqVrJdw9QDT1h51LQcJF0XcZIeqzet/xSZ45snUKE/3RvyMDH+mB8AWGHmKUsQGt3oyhHvl2L0sZTjZ3drCgkDWcyjX1g1NM2af0xNx1ZMCuX5F6vFE0R2ER59UaqPG71dxs7lnNH6tSkHjUqd1/GS2OQYXnWsmXczSgFM8wubkUFZGykHGT3B1RUOSa5jrI3Z8J5XK66nqJRgM9UmOlRdXkKmmM=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ0PR10MB4542.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(136003)(396003)(39860400002)(376002)(346002)(366004)(451199021)(2906002)(6506007)(30864003)(53546011)(26005)(6512007)(186003)(2616005)(83380400001)(5660300002)(6666004)(66946007)(66476007)(66556008)(41300700001)(316002)(4326008)(6916009)(8676002)(6486002)(36756003)(8936002)(966005)(31686004)(478600001)(86362001)(107886003)(31696002)(38100700002)(7416002)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WDAwNlZ4RG5GYzQyeUxDNWFER3VFanhDUkh1dkhFTkNIVDcvK2xDc3RFdDcy?=
 =?utf-8?B?dEozYzFVL0QvSGQxLzV5OHM0SUlKaGl2N1FMcUwzNkRxT0N6YUZEQjFNYkRJ?=
 =?utf-8?B?UktzSXNIbFl6ZTZmcytQTEFadnR1dTBJSklGYTBCY1UyRkNzL0xvMUlZb1lO?=
 =?utf-8?B?K2pISTFBMTFzNmN1SC9YQS9hcEdQSnhleGRJT2dDMjU3TjhrVDAzNlJLOTBG?=
 =?utf-8?B?VjZmby9abzA2S3ZTc0lvSDUvTXpReUFiaE5GZEhUaXZxYVpHUlRDUzZ2cjh0?=
 =?utf-8?B?L28rNThIbElUOFR6Mnl4MnhsVm13SlRUckJlYkN1QXNDblZwTVlmL1cxZDM1?=
 =?utf-8?B?V1locXJPSktlazUwZFQ1aHF1ZFhPVENYNUprcVZTMTRRRG41Q1JIK3Naend2?=
 =?utf-8?B?NlpwQjYxeTZmaVovWmFraHNJdHd5Y1MrQTR5bmQ5Tk92S0NSZUtoNjNFN2Fj?=
 =?utf-8?B?TzIvVXMxNnNPQ05ub01CSFlCSk42NlAyN01Td3ZrVEIwUUZtNFpKUkgyZHAr?=
 =?utf-8?B?NnlPZnBDenVSeXRqRkcxc3B2MWo5dktEZWdxWjBQYjJRWUJmaGhFZWdkQWFB?=
 =?utf-8?B?QjUwSlQ4WUNINU9uK203V3lzQm9ZUFlzSkZ2bC9SMm9UTnFUcFRCaFlmSFky?=
 =?utf-8?B?SGtWOGR6ckhCZHJjMkJod2lmQ3pXSVkxQUp3UE9sRHlVZ0lMd2JpaitNcUhp?=
 =?utf-8?B?MWtrTUNTUHlyTC9LSzNiaWwyTlQ5YXV2SWp6REpEM05VOFZjYjFjMS9LeGMv?=
 =?utf-8?B?RDdsN0lzRXUyUlpwM0Y4RFBJa1ZaZmI5bTQ1a3kxbDVpeGhkSjhSVlpXU3Mx?=
 =?utf-8?B?cTNWS2FjUlJTNlRPK0NPOWxSUzRNdFBiTmFldDcyVHZ4a2lGbUlkZEJkTUhL?=
 =?utf-8?B?d0tuclpvdERsNjNQbGlqUUovTmRwWlJ3aHdoaG1WU1V1aXpwdFVROFh3Umsx?=
 =?utf-8?B?WHB1MDVWRFBPRW9qWVpjQTZwUHZuMXlDWTBtU2NrMkhTUnl4cDAyWEpGbFRN?=
 =?utf-8?B?ZnlWcUVMY21jRlgrelhRQkxzdnQxZXFIVkFwMGxjYmxpQjEwVEZTbmx5Y0hw?=
 =?utf-8?B?K0UvWVBmNTMra2tMc3p4cTlydWZTcER5aDdqZDFxM1VvRDN4Y0IxWXFCNXNo?=
 =?utf-8?B?aWFVM2NEblU5REE5L2R6NVRxY21lL1I3ckxUenJDZGJNVXVBRkt1SFBEL3Ev?=
 =?utf-8?B?VTdnb2JYY1Fpck0xUUxaWmI2RW01SDZFc01sMHVHdkQ5UXpnN3QzNXc0MHB3?=
 =?utf-8?B?cDRuR3NaLzdvTWtMejVCcFZRSG5hY0xVVkp0MjhGNkhiMXo3VlQ2MTZkdEx0?=
 =?utf-8?B?ekFPbUZpM1VWT1dKalhkMExUMUM4aU9tazVYS2xKU1FGV3BxLzBQbWs0d0tw?=
 =?utf-8?B?ZXRiN2FrT2lGTUpSOFJaTXVSUUZvbGNweVBLbmhSU2NXdFB1ZjNSRGVUbnJJ?=
 =?utf-8?B?bDZTSnNBZmxmKzl0ZTEwMXExbzZZV090ditrUjQybldYWVE2Y2dJd1ZOMFgy?=
 =?utf-8?B?aSt2Y2dUdGN5Y0xDNXYwNWowY1cwYzY5Tmt0ejQ5U0NkQ2dGQlNJR0lJNkZh?=
 =?utf-8?B?K3JkYjJocnVZQ3M5SnM4U2VTcHNIc1NyV1ZJQm5BNUxHL3JKQkFhSDluSUho?=
 =?utf-8?B?cDgreXNPY25vaEFLNkN6bG1FWjEvNEV1Zk9TanYxNHA4Q2JJZzBOTjZWMmRB?=
 =?utf-8?B?amdDc0FTQTJWd0lNbUNmL05MRzcrQ3FnaVJSUW9haWJUS0ZpSzBaYzU3MUFH?=
 =?utf-8?B?RWxoNkFmM1VBQ0xUMnczRXlySDZTcmNHSkY1dld4VzFxWUlHa2llK3lVbGZI?=
 =?utf-8?B?SkpxRWRzY1pmVjNOYzRES2hTTEVBb3B5VzhxeFh1UXFvSGJuSXUvNTQvSGU2?=
 =?utf-8?B?WkhTS09XbUY3OTRWME8yUUg4ZHpMZ29vWlM3K0gxWEk5WE9rY1E0eDkrc010?=
 =?utf-8?B?MUtRQ2VmelF4Y1d6TUcvbjQ5b3pKY3VHTTh0RlBGMzFJd3VQdUtRL3h6Yktn?=
 =?utf-8?B?cEt2MXoyVVFhckc4dU84UWtuYVdJRk1zSzV1N1dHaFVrTWVYSGNXRm9JK2lu?=
 =?utf-8?B?THZsVjRCWHp3dGhhdVRjaDFPYktZanBLdkFrcVVtQmtZbjhyTHBGVjZlTzFs?=
 =?utf-8?B?SGtscHI4cUkrODRlMjdQbVhsVElES2pIMXVZekhCNm1hMVY3ME0zTkZFWnRE?=
 =?utf-8?B?Znc9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: drF9xiqDfLHLgaFZ3QMa4ykQoJUQom7u6qCRWnrIPmiuv9gdSKfTz4TukTiys5VSlKhVCRjuOVcBMfXH8wWZnKVdIfkznEPB24s121WBmK4EuVP2Wq65t4EDVKG6xyLqLmsU7mp+lNakdJuF7nARz0bWBVVUbf0rnNUHieKCICWC00wRSR9P4OkpbOT5HDKBSFg+MVhmFt+Nny/EBnXnfL6D5VmynehSIfY1LYjt+x4UoW369GTNyVLmBlKBEvsDfnXIb9VPea7hmhz7LuMqxIM/eoWuDGwVNmsDkJsouXPjg76gMKWj4OJLRqPLC2lZooYiBgJwHXCWtr/xSXX7hYU41kCTy71RgPTIvbQ6m3sRDPgUn5aMMT3lzcI2pH5qytQW4WK84HY+2G1IaLM/PYxFFxWiPhk8oJOgcKiMd1OUt4ecDANkoWkuDlzfQ8qIVxX9B9McsmGxN0MHUrRG8IFbdXytwHtTOV8pi5NAOfbmcpD0CeCEu6nkGb8R6K3tKiZ110uhtqpK17/+g2drdu4uXlDkhZHtu79c1q5uL4mDHJqnnZcj+gkNKPIxsw0SPC2Xs9o37RjHa8Ulqks06kl7WjTb6ZT1+XgYO5ZLaUMSF4VGSmK5cYKFfMiAwWp7S3fvWIp1bKblVlw7YBr247NSXhzpOvkBd+HQAHqhHi4+/Jl7qpsFL95/aW7sffnUdGB3PAwaBljNSOje4LSerCJV/zHTFWjnCN9KZbvOXSyXqGDhaOzQxl5FOunqkmMqgGrF0Pj0Tjq7Sh5E0Bwfji/PEvMy4YJuDWP9VFUVoDJ7SeX0ViPdEzIIrwb3htWExgf6iGK9mHITuHux7Jz24JpU+nYfFMvDCyDBYm/jBPLmnjfpbGf14OC+ppeOJQIqGzNbFh2H9ubENPY7z31fFg==
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 62230af2-7dc0-4077-bc7e-08db5173a9f9
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR10MB4542.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 May 2023 16:29:01.9459 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HC3JRpK2W4SOT5/nYVZwet8mYVr2MM6mmqFQNAnvZdajcosQ2jbBNPRmr4He/cQtGFpsBvZfKEMbhOy56U1DaZ9l4gPazDXrKK+LLSJRoQY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR10MB4492
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-05-10_04,2023-05-05_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999
 malwarescore=0
 adultscore=0 mlxscore=0 bulkscore=0 suspectscore=0 spamscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2304280000 definitions=main-2305100134
X-Proofpoint-GUID: A5bfLZRd16yMg99ivvs6YaVkCcCK_wgA
X-Proofpoint-ORIG-GUID: A5bfLZRd16yMg99ivvs6YaVkCcCK_wgA
Received-SPF: pass client-ip=205.220.177.32;
 envelope-from=eric.devolder@oracle.com; helo=mx0b-00069f02.pphosted.com
X-Spam_score_int: -60
X-Spam_score: -6.1
X-Spam_bar: ------
X-Spam_report: (-6.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-3.251,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org



On 5/10/23 10:45, Igor Mammedov wrote:
> On Wed, 10 May 2023 10:08:50 -0500
> Eric DeVolder <eric.devolder@oracle.com> wrote:
> 
>> On 5/10/23 03:14, Igor Mammedov wrote:
>>> On Fri, 5 May 2023 16:53:22 -0500
>>> Eric DeVolder <eric.devolder@oracle.com> wrote:
>>>    
>>>> Thoughts?
>>>
>>> I still don't think we need to bump x86 to rev 5 in QEMU.
>>
>> Linux v6.3 has the fix merged (so crisis averted 8).
>> The investigation allowed me to opportunistically provide this patch.
>> I think this should receive serious consideration for merging,
>> more so because generating MADT .revision 3 and reporting .revision 1
>> seems wrong to me.
> 
> It's a way much simpler to bump revision to 3 without introducing
> OnlineCapable handling. So if you post rev3 patch, I'll gladly
> ack it.
> (+include kernel commit ids of kernel side fix, so if someone
> stumbles upon it, one can easily find what to backport)
> 
OK, I'll do that. It'll be next week as I'm on a short week this week.

>> This patch seems really straight forward, and low risk, now.
>>
>>>    
>>>> eric
>>>>
>>>> On 4/21/23 16:48, Eric DeVolder wrote:
>>>>> The following Linux kernel change broke CPU hotplug for MADT revision
>>>>> less than 5.
>>>>>
>>>>>     e2869bd7af60 ("x86/acpi/boot: Do not register processors that cannot be onlined for x2APIC")
>>>>>
>>>>> Discussion on this topic can be located here:
>>>>>
>>>>>     https://lore.kernel.org/linux-acpi/20230327191026.3454-1-eric.devolder@oracle.com/T/#t
>>>
>>> have your kernel fix landed up upstream?
>>>    
>> Yes, merged and available in v6.3.
>>
>>>>>
>>>>> which resulted in the following fixes Linux in 6.3-rc5:
>>>>>
>>>>>     a74fabfbd1b7: ("x86/ACPI/boot: Use FADT version to check support for online capable")
>>>>>     fed8d8773b8e: ("x86/acpi/boot: Correct acpi_is_processor_usable() check")
>>>>>
>>>>> However, as part of the investigation into resolving this breakage, I
>>>>> learned that i386 QEMU reports revision 1, while technically it
>>>>> generates revision 3. Aarch64 generates and reports revision 4.
>>>>>
>>>>> ACPI 6.3 bumps MADT revision to 5 as it introduces an Online Capable
>>>>> flag that the above Linux patch utilizes to denote hot pluggable CPUs.
>>>>>
>>>>> So in order to bump MADT to the current revision of 5, need to
>>>>> validate that all MADT table changes between 1 and 5 are present
>>>>> in QEMU.
>>>>>
>>>>> Below is a table summarizing the changes to the MADT. This information
>>>>> gleamed from the ACPI specs on uefi.org.
>>>>>
>>>>> ACPI    MADT    What
>>>>> Version Version
>>>>> 1.0             MADT not present
>>>>> 2.0     1       Section 5.2.10.4
>>>>> 3.0     2       Section 5.2.11.4
>>>>>                     5.2.11.13 Local SAPIC Structure added two new fields:
>>>>>                      ACPI Processor UID Value
>>>>>                      ACPI Processor UID String
>>>>>                     5.2.10.14 Platform Interrupt Sources Structure:
>>>>>                      Reserved changed to Platform Interrupt Sources Flags
>>>>> 3.0b    2       Section 5.2.11.4
>>>>>                     Added a section describing guidelines for the ordering of
>>>>>                     processors in the MADT to support proper boot processor
>>>>>                     and multi-threaded logical processor operation.
>>>>> 4.0     3       Section 5.2.12
>>>>>                     Adds Processor Local x2APIC structure type 9
>>>>>                     Adds Local x2APIC NMI structure type 0xA
>>>>> 5.0     3       Section 5.2.12
>>>>> 6.0     3       Section 5.2.12
>>>>> 6.0a    4       Section 5.2.12
>>>>>                     Adds ARM GIC structure types 0xB-0xF
>>>>> 6.2a    45      Section 5.2.12   <--- version 45, is indeed accurate!
>>>>> 6.2b    5       Section 5.2.12
>>>>>                     GIC ITS last Reserved offset changed to 16 from 20 (typo)
>>>>> 6.3     5       Section 5.2.12
>>>>>                     Adds Local APIC Flags Online Capable!
>>>>>                     Adds GICC SPE Overflow Interrupt field
>>>>> 6.4     5       Section 5.2.12
>>>>>                     Adds Multiprocessor Wakeup Structure type 0x10
>>>>>                     (change notes says structure previously misplaced?)
>>>>> 6.5     5       Section 5.2.12
>>>>>
>>>>> For the MADT revision change 1 -> 2, the spec has a change to the
>>>>> SAPIC structure. In general, QEMU does not generate/support SAPIC.
>>>>> So the QEMU i386 MADT revision can safely be moved to 2.
>>>>>
>>>>> For the MADT revision change 2 -> 3, the spec adds Local x2APIC
>>>>> structures. QEMU has long supported x2apic ACPI structures. A simple
>>>>> search of x2apic within QEMU source and hw/i386/acpi-common.c
>>>>> specifically reveals this. So the QEMU i386 MADT revision can safely
>>>>> be moved to 3.
>>>>>
>>>>> For the MADT revision change 3 -> 4, the spec adds support for the ARM
>>>>> GIC structures. QEMU ARM does in fact generate and report revision 4.
>>>>> As these will not be used by i386 QEMU, so then the QEMU i386 MADT
>>>>> revision can safely be moved to 4 as well.
>>>>>
>>>>> Now for the MADT revision change 4 -> 5, the spec adds the Online
>>>>> Capable flag to the Local APIC structure, and the ARM GICC SPE
>>>>> Overflow Interrupt field.
>>>
>>> All ARM stuff is irrelevant in x86 patch
>>>    
>> sure
>>
>>>>> For i386, the ARM SPE is not applicable.
>>>>>
>>>>> For the i386 Local APIC flag Online Capable, the spec has certain rules
>>>>> about this value. And in particuar setting this value now explicitly
>>>>> indicates a hotpluggable CPU.
>>>>>
>>>>> So this patch makes the needed changes to move i386 MADT to
>>>>> revision 5.
>>>>>
>>>>> Without these changes, the information below shows "how" CPU hotplug
>>>>> breaks with the current upstream Linux kernel 6.3.  For example, a Linux
>>>>> guest started with:
>>>
>>> what's the status wrt current upstream kernel?
>>>      
>> qemu cpu hotplug works with upstream kernel ( >= v6.3) but only because the
>> kernel fix allows the legacy fallback assumption that the non Enabled
>> cpus specified in MADT are online capable.
> 
> Kernel should be able to handle MADT revisions below 5 correctly as well,
> so frankly speaking it's a kernel regression that's been fixed.
> (affected distros should pull in your kernel patch[es] if
> they are interested in cpu hotplug)
> 
> It's great that you dug through all the mess they made in
> spec and found/fixed a bug in kernel.
> But that doesn't justify complicating QEMU [1] just to make
> recently broken kernel work or just because patch is already
> written.
> 
> And no, all effort you put into figuring it out is not wasted,
> since the bug was fixed at the place of regression (kernel)
> and all involved have learned from it and grateful to you
> fixing it up.
> 
Of course!

>> with this patch applied to qemu, the kernel honors the Online Capable bit
>> for cpus not Enabled at boot.
> 
> This is not really applicable/interesting to QEMU,
> I read this bit in spec as a workaround for hardware vendors
> that might simplify their life.
True, but it is in the spec. And not complicated.

> 
> 1) But it is useless for QEMU (see my reply in v2 or v1 review thread
> with analysis as to why).
> So I'd rather avoid adding 'Online Capable bit' to QEMU unless
> we have to do so (i.e. we would need MADTr5 for some other feature).
Afaik, OnlineCapable is the only feature added in .revision 5 (other than
that ARM feature).

eric
> 
>>
>>
>>>>>     qemu-system-x86_64 -smp 30,maxcpus=32 ...
>>>>>
>>>>> and then attempting to hotplug a CPU:
>>>>>
>>>>>      (QEMU) device_add id=cpu30 driver=host-x86_64-cpu socket-id=0 core-id=30 thread-id=0
>>>>>
>>>>> fails with the following:
>>>>>
>>>>>      APIC: NR_CPUS/possible_cpus limit of 30 reached. Processor 30/0x.
>>>>>      ACPI: Unable to map lapic to logical cpu number
>>>>>      acpi LNXCPU:1e: Enumeration failure
>>>>>
>>>>>      # dmesg | grep smpboot
>>>>>      smpboot: Allowing 30 CPUs, 0 hotplug CPUs
>>>>>      smpboot: CPU0: Intel(R) Xeon(R) CPU D-1533 @ 2.10GHz (family: 0x)
>>>>>      smpboot: Max logical packages: 1
>>>>>      smpboot: Total of 30 processors activated (125708.76 BogoMIPS)
>>>>>
>>>>>      # iasl -d /sys/firmware/tables/acpi/APIC
>>>>>      [000h 0000   4]                    Signature : "APIC"    [Multiple APIC Descript
>>>>>      [004h 0004   4]                 Table Length : 00000170
>>>>>      [008h 0008   1]                     Revision : 01          <=====
>>>>>      [009h 0009   1]                     Checksum : 9C
>>>>>      [00Ah 0010   6]                       Oem ID : "BOCHS "
>>>>>      [010h 0016   8]                 Oem Table ID : "BXPC    "
>>>>>      [018h 0024   4]                 Oem Revision : 00000001
>>>>>      [01Ch 0028   4]              Asl Compiler ID : "BXPC"
>>>>>      [020h 0032   4]        Asl Compiler Revision : 00000001
>>>>>
>>>>>      ...
>>>>>
>>>>>      [114h 0276   1]                Subtable Type : 00 [Processor Local APIC]
>>>>>      [115h 0277   1]                       Length : 08
>>>>>      [116h 0278   1]                 Processor ID : 1D
>>>>>      [117h 0279   1]                Local Apic ID : 1D
>>>>>      [118h 0280   4]        Flags (decoded below) : 00000001
>>>>>                                 Processor Enabled : 1          <=====
>>>>>
>>>>>      [11Ch 0284   1]                Subtable Type : 00 [Processor Local APIC]
>>>>>      [11Dh 0285   1]                       Length : 08
>>>>>      [11Eh 0286   1]                 Processor ID : 1E
>>>>>      [11Fh 0287   1]                Local Apic ID : 1E
>>>>>      [120h 0288   4]        Flags (decoded below) : 00000000
>>>>>                                 Processor Enabled : 0          <=====
>>>>>
>>>>>      [124h 0292   1]                Subtable Type : 00 [Processor Local APIC]
>>>>>      [125h 0293   1]                       Length : 08
>>>>>      [126h 0294   1]                 Processor ID : 1F
>>>>>      [127h 0295   1]                Local Apic ID : 1F
>>>>>      [128h 0296   4]        Flags (decoded below) : 00000000
>>>>>                                 Processor Enabled : 0          <=====
>>>>>
>>>>> The (latest upstream) Linux kernel sees 30 Enabled processors, and
>>>>> does not consider processors 31 and 32 to be hotpluggable.
>>>>>
>>>>> With this patch series applied, by bumping MADT to revision 5, the
>>>>> latest upstream Linux kernel correctly identifies 30 CPUs plus 2
>>>>> hotpluggable CPUS.
>>>>>
>>>>>      CPU30 has been hot-added
>>>>>      smpboot: Booting Node 0 Processor 30 APIC 0x1e
>>>>>      Will online and init hotplugged CPU: 30
>>>>>
>>>>>      # dmesg | grep smpboot
>>>>>      smpboot: Allowing 32 CPUs, 2 hotplug CPUs
>>>>>      smpboot: CPU0: Intel(R) Xeon(R) CPU D-1533 @ 2.10GHz (family: 0x6, model: 0x56, stepping: 0x3)
>>>>>      smpboot: Max logical packages: 2
>>>>>      smpboot: Total of 30 processors activated (125708.76 BogoMIPS)
>>>>>
>>>>>      # iasl -d /sys/firmware/tables/acpi/APIC
>>>>>      [000h 0000 004h]                   Signature : "APIC"    [Multiple APIC Descript
>>>>>      [004h 0004 004h]                Table Length : 00000170
>>>>>      [008h 0008 001h]                    Revision : 05          <=====
>>>>>      [009h 0009 001h]                    Checksum : 94
>>>>>      [00Ah 0010 006h]                      Oem ID : "BOCHS "
>>>>>      [010h 0016 008h]                Oem Table ID : "BXPC    "
>>>>>      [018h 0024 004h]                Oem Revision : 00000001
>>>>>      [01Ch 0028 004h]             Asl Compiler ID : "BXPC"
>>>>>      [020h 0032 004h]       Asl Compiler Revision : 00000001
>>>>>
>>>>>      ...
>>>>>
>>>>>      [114h 0276 001h]               Subtable Type : 00 [Processor Local APIC]
>>>>>      [115h 0277 001h]                      Length : 08
>>>>>      [116h 0278 001h]                Processor ID : 1D
>>>>>      [117h 0279 001h]               Local Apic ID : 1D
>>>>>      [118h 0280 004h]       Flags (decoded below) : 00000001
>>>>>                                 Processor Enabled : 1          <=====
>>>>>                            Runtime Online Capable : 0          <=====
>>>>>
>>>>>      [11Ch 0284 001h]               Subtable Type : 00 [Processor Local APIC]
>>>>>      [11Dh 0285 001h]                      Length : 08
>>>>>      [11Eh 0286 001h]                Processor ID : 1E
>>>>>      [11Fh 0287 001h]               Local Apic ID : 1E
>>>>>      [120h 0288 004h]       Flags (decoded below) : 00000002
>>>>>                                 Processor Enabled : 0          <=====
>>>>>                            Runtime Online Capable : 1          <=====
>>>>>
>>>>>      [124h 0292 001h]               Subtable Type : 00 [Processor Local APIC]
>>>>>      [125h 0293 001h]                      Length : 08
>>>>>      [126h 0294 001h]                Processor ID : 1F
>>>>>      [127h 0295 001h]               Local Apic ID : 1F
>>>>>      [128h 0296 004h]       Flags (decoded below) : 00000002
>>>>>                                 Processor Enabled : 0          <=====
>>>>>                            Runtime Online Capable : 1          <=====
>>>>>
>>>>> In terms of testing older operating systems, I did:
>>>>>
>>>>> - Windows Server 2008.
>>>>>     By opening Device Manager -> Processors, and watching/counting
>>>>>     the listed CPUs before and after hot un/plug operations.
>>>>>     When hot plugging a CPU, the new processor shows in the list;
>>>>>     one more processor is available after the hotplug.
>>>>>     When hot unplugging a CPU, Windows refuses, with the message:
>>>>>
>>>>>      The 'Intel(R) Xeon(R) CPU D-1533 @ 2.10GHz' device is not
>>>>>      removable and cannot be ejected or unplugged.
>>>>>
>>>>>     This is expected as hot unplug did not work in Windows 2008.
>>>>>
>>>>> - RHEL 6.9
>>>>>     Kernel 2.6.32-696.el6.x86_64
>>>>>     Build Feb 21 2017
>>>>>     From dmesg:
>>>>>     ACPI: APIC 000000007ffe32f0 000F0 (v05 BOCHS  BXPC    00000001 BXPC 00000001)
>>>>>     SMP: Allowing 16 CPUs, 8 hotplug CPUs
>>>>>
>>>>>     # cat /sys/devices/system/cpu/online
>>>>>     0-7
>>>>>
>>>>>     (QEMU) device_add id=cpu8 driver=host-x86_64-cpu socket-id=0 core-id=8 thread-id=0
>>>>>
>>>>>     CPU 8 got hotplugged
>>>>>     Booting Node 0 Processor 8 APIC 0x8
>>>>>     kvm-clock: cpu 8, msr 2830ed00
>>>>>     Will online and init hotplugged CPU: 8
>>>>>     microcode: CPU8 sig=0x50663, pf=0x1, revision=0x700001c
>>>>>     platform microcode: firmware: requesting intel-ucode/06-56-03
>>>>>
>>>>>     # cat /sys/devices/system/cpu/online
>>>>>     0-8
>>>>>
>>>>>     (QEMU) device_del id=cpu8
>>>>>
>>>>>     Broke affinity for irq 24
>>>>>     CPU 8 is now offline
>>>>>
>>>>>     # cat /sys/devices/system/cpu/online
>>>>>     0-7
>>>>>
>>>>>     RHEL 6.9
>>>>>     kernel 2.6.32-696.el6.x86_64
>>>>>     build Feb 21 2017
>>>>>
>>>>> Both of the above 'legacy' operating systems behaved as expected.
>>>>>
>>>>> Regards,
>>>>> Eric
>>>>>
>>>>> ---
>>>>> v3: 21apr2023
>>>>>     - Dropped ARM patch as there is no compelling need to move to
>>>>>       MADT revision 5, per Michael Tsirkin.
>>>>>     - Recoded the flags to be simpler, per Michael, Ani Sinha and
>>>>>       Miguel Luis.
>>>>>     - Regenerated the binary tables, as per bios-tables-test.c
>>>>>       instructions.
>>>>>
>>>>> v2: 18apr2023
>>>>>     https://lists.gnu.org/archive/html/qemu-devel/2023-04/msg02576.html
>>>>>     - Code formatting changes per Igor Mammedov
>>>>>     - Included the steps in bios-tables-test.
>>>>>
>>>>> v1: 28mar2023
>>>>>     https://lists.gnu.org/archive/html/qemu-devel/2023-03/msg06705.html
>>>>>     - Initial series for ARM and i386 MADT revision bump to 5.
>>>>> Eric DeVolder (3):
>>>>>      ACPI: bios-tables-test.c step 2 (allowed-diff entries)
>>>>>      hw/acpi: i386: bump MADT to revision 5
>>>>>      ACPI: bios-tables-test.c step 5 (updated expected table binaries)
>>>>>
>>>>>     hw/i386/acpi-common.c                         |   4 ++--
>>>>>     tests/data/acpi/microvm/APIC                  | Bin 70 -> 70 bytes
>>>>>     tests/data/acpi/microvm/APIC.ioapic2          | Bin 82 -> 82 bytes
>>>>>     tests/data/acpi/microvm/APIC.pcie             | Bin 110 -> 110 bytes
>>>>>     tests/data/acpi/pc/APIC                       | Bin 120 -> 120 bytes
>>>>>     tests/data/acpi/pc/APIC.acpihmat              | Bin 128 -> 128 bytes
>>>>>     tests/data/acpi/pc/APIC.cphp                  | Bin 160 -> 160 bytes
>>>>>     tests/data/acpi/pc/APIC.dimmpxm               | Bin 144 -> 144 bytes
>>>>>     tests/data/acpi/q35/APIC                      | Bin 120 -> 120 bytes
>>>>>     tests/data/acpi/q35/APIC.acpihmat             | Bin 128 -> 128 bytes
>>>>>     tests/data/acpi/q35/APIC.acpihmat-noinitiator | Bin 144 -> 144 bytes
>>>>>     tests/data/acpi/q35/APIC.core-count2          | Bin 2478 -> 2478 bytes
>>>>>     tests/data/acpi/q35/APIC.cphp                 | Bin 160 -> 160 bytes
>>>>>     tests/data/acpi/q35/APIC.dimmpxm              | Bin 144 -> 144 bytes
>>>>>     tests/data/acpi/q35/APIC.xapic                | Bin 2686 -> 2686 bytes
>>>>>     15 files changed, 2 insertions(+), 2 deletions(-)
>>>>>       
>>>>   
>>>    
>>
> 

