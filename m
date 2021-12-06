Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F7C946A14B
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Dec 2021 17:26:04 +0100 (CET)
Received: from localhost ([::1]:51036 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1muGoV-0006oD-Kc
	for lists+qemu-devel@lfdr.de; Mon, 06 Dec 2021 11:26:03 -0500
Received: from eggs.gnu.org ([209.51.188.92]:56372)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.devolder@oracle.com>)
 id 1muGlB-0004Jc-8C
 for qemu-devel@nongnu.org; Mon, 06 Dec 2021 11:22:38 -0500
Received: from mx0a-00069f02.pphosted.com ([205.220.165.32]:54616)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.devolder@oracle.com>)
 id 1muGl8-0006PC-IW
 for qemu-devel@nongnu.org; Mon, 06 Dec 2021 11:22:36 -0500
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 1B6FxWKf004451; 
 Mon, 6 Dec 2021 16:22:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=message-id : date :
 subject : to : cc : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=corp-2021-07-09;
 bh=e+XMbWOSBG/HX9P7XObTOgkTAV1bfC+B/lBFOvKM6Bk=;
 b=As3tGB5qT9F0873LDx8PS56KFhoU17l/iSJKcxwYWROfPmuazrXiMTG49pYqeYoPuHUO
 zUXIbmtNUTIUtusFbykzs8SwEaZei+S3M+GN2rwfKzvq4TLUAYirwaCpFn1z/DARIvhC
 vdZbQJenFpmQ6L5igf9x4xANCGLsTcDVUPnDOeiqPzYYr8nr4OlrEheobFAnFc/ANpY3
 D7P6GdU5HXVcEv/mgoTmnjw1TG5Ezvlk9J6p9csjuMWGtVlCVkBJ4vRpXvEPUtNknz3H
 j6P/I6VmrttJRi2J0uVhmxPTIbK0UmQIdoz31VdYwgvHa3EHqIkuy87tuS/xXX0et15S +A== 
Received: from userp3030.oracle.com (userp3030.oracle.com [156.151.31.80])
 by mx0b-00069f02.pphosted.com with ESMTP id 3csctwjpr9-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 06 Dec 2021 16:22:29 +0000
Received: from pps.filterd (userp3030.oracle.com [127.0.0.1])
 by userp3030.oracle.com (8.16.1.2/8.16.1.2) with SMTP id 1B6GL7Y8172268;
 Mon, 6 Dec 2021 16:22:28 GMT
Received: from nam11-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam11lp2171.outbound.protection.outlook.com [104.47.57.171])
 by userp3030.oracle.com with ESMTP id 3cqwew8bqs-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 06 Dec 2021 16:22:27 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MJen4bLQ2tD9tM3Bdu1FNHDLZaVTJoWDpdOlOSStwzLAMKKLqoASzg0L2AAkVty4jCTCzRAEJmuodYJA/+KlNoVUqbgoVQuXCbeypRzvIK0AhwViJqnR87MMu90SmBcek+hCE1LMd55Qy3r3TWbwEpNxrFHdl2YhcgayDNpkn22THVgck5RMdCCzSCe/nqA20RybtpUxUWHQe3p8SuodeFFKrATGIy+EmXmGpPqM5Skh8aNokfp6cdq8rtESKiInOkr6BsYKiHI4VGkVAkE/zDQbLAf4Wve1hPP57xnPEoj2DSlupw0wqvDa8/bn0df4Gt1VU36ipIPsjqC+HmtXOQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=e+XMbWOSBG/HX9P7XObTOgkTAV1bfC+B/lBFOvKM6Bk=;
 b=aYuZOde5MBC6LkO/YmtFb1jNNH2j4opyjcvb+9Fqax7T/tdh0j6UlYY6I+og6Io4Seq5iTNzyz30akrP2weYVUcf6zgx4kE7NXa+428W7tLmNF/Ub2CHdYHQHej/oriPhxCCuxOxX5PobCdnSTI6s9TmwRGMIz3caV70mm7JyVY2UM1RrDFT8iIKcK5L4EBHbmHZFDupc4jLyKwiM456+Zd2IvTh8Zb7sqC7RDv/bHQfi1qMS1R90qdfa5vEXiHqRfBQxtTdzrGN1xBelpOFNksiYEeQJOsA4PPBPKdjAq7JXef3H8IyhsP8cJ1GEXZZnE67Gaw847O9EFZ2AeJm2g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=e+XMbWOSBG/HX9P7XObTOgkTAV1bfC+B/lBFOvKM6Bk=;
 b=x96BUK7o1WDYyQoYDycigmupfKv+IlAec2IMoE0rEZJO6ZLPrRe670hO4PA0Tj+u7kJrxNmoiE8pM59gV6RAdmEYS0fiXVLAcwtx3IAye2kUUwlYff3OojYQuAOQqMNe6VDXBwGnF7BhsL/0hSpDNjoLsaEBe9aUrkl7dg3MXCs=
Received: from CO1PR10MB4531.namprd10.prod.outlook.com (2603:10b6:303:6c::22)
 by CO1PR10MB4420.namprd10.prod.outlook.com (2603:10b6:303:97::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4755.21; Mon, 6 Dec
 2021 16:22:25 +0000
Received: from CO1PR10MB4531.namprd10.prod.outlook.com
 ([fe80::143c:ea64:7017:19f]) by CO1PR10MB4531.namprd10.prod.outlook.com
 ([fe80::143c:ea64:7017:19f%4]) with mapi id 15.20.4755.022; Mon, 6 Dec 2021
 16:22:25 +0000
Message-ID: <0ef0a6c4-291c-acfc-502e-a9b97fe844cc@oracle.com>
Date: Mon, 6 Dec 2021 10:22:22 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH v9 06/10] ACPI ERST: build the ACPI ERST table
Content-Language: en-US
To: Ani Sinha <ani@anisinha.ca>
References: <1638472142-14396-1-git-send-email-eric.devolder@oracle.com>
 <1638472142-14396-7-git-send-email-eric.devolder@oracle.com>
 <CAARzgwyKyk+J71esb_U5m8gDsU9PZ3FKps9fEtyomuJB_GJwdg@mail.gmail.com>
From: Eric DeVolder <eric.devolder@oracle.com>
In-Reply-To: <CAARzgwyKyk+J71esb_U5m8gDsU9PZ3FKps9fEtyomuJB_GJwdg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SN6PR01CA0032.prod.exchangelabs.com (2603:10b6:805:b6::45)
 To CO1PR10MB4531.namprd10.prod.outlook.com
 (2603:10b6:303:6c::22)
MIME-Version: 1.0
Received: from [IPV6:2606:b400:414:8061:221:28ff:fea5:27c8]
 (2606:b400:8024:1010::112a) by SN6PR01CA0032.prod.exchangelabs.com
 (2603:10b6:805:b6::45) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4755.14 via Frontend
 Transport; Mon, 6 Dec 2021 16:22:24 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 69f8b29b-9a65-4d9e-ff20-08d9b8d496fc
X-MS-TrafficTypeDiagnostic: CO1PR10MB4420:EE_
X-Microsoft-Antispam-PRVS: <CO1PR10MB4420EE10EA70EDD8772775CD976D9@CO1PR10MB4420.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3383;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 7AANRPCJiXhhbOJ0HBBcCs09iaaF4yff4oTBu5eawL59Ln2K7xy5eIzv0c9LsPtdCDcoWjrI5Bfb+SJGPaLg5l6KZ8Pbm2RBqi64jWEoERDHY2++ZlpFxNiT34rk0qoizX8rlSjAU+Auf8rN0YtPyibOoYzLySkM15Vp3+tK+LuHnCjgn5qJh5q9MmrUX8OAWuaGMQfVK8MwYQBY8HhvkmFZ28y1E2+EIL3+1fbygtfeknlLom6u6Uofs2Viq3BJ3LWXf7/gT+sWwFqvXBp3UXBZ3Z9R7clW+BPDkld4ZwVqUz30Rt8d4RSoppGLMbGPiYZYp3xRaoJFKqTPvOdiyVp3uz3tSjyUVqAfQWwoBtVE7XMWQQF2lPisLCFX+f8gcYyp1lEewTuG4/d7jOvYLzyCbm2WlVKSiE37SQh+sRYbPmp74zr40n2OJNnk4o58YfUNI4KKqoV65AAFjgvnaoC77+skejkvRXm/Tn4ydhyzX2JPofyun6iGkE/2Zus1VNyQhRgNBf3/fDI9R0dUF0BpwJkkIkYiSMrLcM1N9eelLpS9VXDKZv4XYO0t+xTzxpWellhJeXtfVb+ZdPNkhUjl8IoEwIJEG1iL7hn8crFx/SUHdAIk4DEXV14HlNdXA3IJLEAD5eWk+lugvKYimOraI8+R7SdSbl4JyPq6iciGA8TShOH0mMV0y0gUZeiB3yfYCBBuIKgjl4PkVdnNKw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO1PR10MB4531.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(31696002)(38100700002)(83380400001)(31686004)(6486002)(66946007)(66476007)(66556008)(36756003)(5660300002)(2616005)(2906002)(508600001)(186003)(30864003)(316002)(53546011)(8676002)(107886003)(86362001)(4326008)(8936002)(6916009)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?L0dRL3ZqS1gyYjY0Q3l6RFdvUWxMTEVwVDdMQnhjc1BJK1RpeTB5NkhTRTdv?=
 =?utf-8?B?d1JZdWF2aExEMXBXbU5YZGF2aGZNY3FvTTdKclhleDJYd045dHhpZ2xXUFBK?=
 =?utf-8?B?djlZdkFFc3J3THg5OVZEcUYwRGxzejhNSmJaUjd1MDkwemdjSG5veHVvUWF1?=
 =?utf-8?B?UTJRdGlHM0RSRFEzdGFSRVZMQmtZajlubi94R3IrWlJzRlFzWE5GQWF1Rld3?=
 =?utf-8?B?Vjl2VHlqYUYvd2VPQlJRSUQ0ZHgralFxamNyU2t0dW80b2FKczVDMUx1ME5Y?=
 =?utf-8?B?OEVpWjBDekdZaEhTRit2MFhOSEN4a0d4YmFJZHp1WjExcWcwMWhCOUxSYjNR?=
 =?utf-8?B?UXk4c0h2ZnlpSnZzYmlBcVcveXJwejJUUCs0MFdQNDJaWHpJekVWdzFrT2Ir?=
 =?utf-8?B?NCtIYUQ3dXNya2lLNk9BL21KVlYyWHlKY1ZMYjNtSWVSeTJvV1l0T3Voczg1?=
 =?utf-8?B?RGJGY0FwNkZmV2d4VHdmdGhzenpvTWZQNTFjRElGUGhpWStMcWRRM1VQODBk?=
 =?utf-8?B?RDhaM1NTaWNmNnVsRFJhMW9oV1c4VUUzMUNKSEFmd0dhZEdqRDBoNHdDWUxj?=
 =?utf-8?B?bU9aVEJYTVRXd0xlSmo1QmlSL2tSRDVINVB0U0ZvaldTTE5uYWhrd3lyS2FW?=
 =?utf-8?B?NHNWWXVFMnRSb0Y0RHpNcVJRMXNlUDJqT1l2ZU1taFpGQUN3TEgyK3Vmck5y?=
 =?utf-8?B?QmhFQmpsWUdNM0xQOEVSMVVyODNpNUVwbDVJaEVQSVlXbE9NZFhvSUFUOEdM?=
 =?utf-8?B?aEQxVlJWenlQZHBBejZZZ0s3OXlTWmQvN1FzRTltZjVObklibEt3TlI3MTVQ?=
 =?utf-8?B?L3hTRXpXbjJwQzdVbm9jK2hEMGpjVE9saXdEZFYzd0ZucmpSZERGYkRDbGNo?=
 =?utf-8?B?RWU4N0RUUUJQZ3IzWnBxcUtpRzZuNHg3cjdaKzRqazNzMHhxOTBEdHpWVHk1?=
 =?utf-8?B?Z3FURlRVaEdhem9LTFdPYW1zN2NzVklHd1JaNno2TnNZMHQrWlJhNmtQSXRG?=
 =?utf-8?B?NmxxSGJSeHdCM3haVHpaZnJySHUyQzA3MFpYQTNRWWtHanRSQXB1cUJGREI2?=
 =?utf-8?B?Z2FRUmRaWXRWV01mbXBtdFZ2d0xvR0lxV1NrSWVCRlhzY3FlSk9tcFlGQVpH?=
 =?utf-8?B?SmpLZDFFbG9UcFlaRzhuVHlZWk43cWJpZDY0bFBOWjFYZERqS01MYjRTUGVF?=
 =?utf-8?B?bU91RHZrdVZVWkJ4Z2dHZUZWWlB3Q0NLbi92QWhjTEhDYXBxbWF2OVVQaE5K?=
 =?utf-8?B?TGlLQ1l1ckZiQmpoWWNqU1ZMZHEyVncvM1R3bTk3YitRU3RjQUZpVGZmbk9K?=
 =?utf-8?B?QXBvZGJHYU9aZXhGZkpQaUgrMUFCbzVFc25FbEVkZ294SDhJQUlIaFhKeUF1?=
 =?utf-8?B?NDFxN1dmaEZvQmU4WTk3TlppRE8zUkJGUXA2cnlwSjBLazNKSmVIdlpLcjFZ?=
 =?utf-8?B?a2F4NW90NDUrcytoTHFJR3ZhRHlBN2daaGlITVVaaGFCQXVRSngxTFgyeW95?=
 =?utf-8?B?Y0NuUGVOcDk3cEozcmVFTDNic0RrMVdSczNIOVo1LzMxeHcyQmxIek53NWt5?=
 =?utf-8?B?NS9Mbi9IQWNCWmZtdFpSNkVHb3FaMnJPNDFoZGpORzhyUkdvbENFZWNZOURE?=
 =?utf-8?B?VFlrUmJOOUNETlMvcUQzOUVkaFAvMDlSYkE2MmtRa1VhWjF5cmp6eCtXVHVz?=
 =?utf-8?B?ME9OamYrS2NaU1ZzN2VuZHZuam5XVnFFTU1UaXBrL1d2WFpESlJzRXhjUGlE?=
 =?utf-8?B?TWd4K3NwQU9DMFdNQnQxNUdXTGIxOFdWcTVzamYvOXZRYjlzZDI2WnRTbi9X?=
 =?utf-8?B?YWlvVmQ1NFh4SkRDaE93RHliWHAwZXBkekJKRmxCbHNxTzd2aldkYktpenpj?=
 =?utf-8?B?MVFBa0Jlb0lGMkNHTzU5bEc1S0dYREtlNU40ZmR1NnF6YjZ0MEE0K2wvTUdu?=
 =?utf-8?B?MVVhM1JGTDlCUGNMYzBOSlFCSEVjeXRLMjhpNnJvNjhOSk5wenNZczBwM0Zz?=
 =?utf-8?B?NEcyWDhxQk5BZXg2cnBHMm5TR1IvcHVqOHFOOURRM0tNeGREKzd0VXl3d2dl?=
 =?utf-8?B?bmwxeDRhVXV6cnhGVWd1S3lEdDFaUExVWjJOU0F2WVdlRkY3QTd4YzU5MEpJ?=
 =?utf-8?B?QlhwS05FUkNrQlYrRkhsRHc0RDNuUzA2TFlSNjQ2QnhWT1o4L1BXRlhzYnox?=
 =?utf-8?B?aGlkeHdBYW1LVkwrWUV5SjUxdlpYbG5vamhTNEd4b2h6Z3drdnJORmdqZDVr?=
 =?utf-8?B?N3ROK1pJMTVyMzVJakVtZEE4aHQyTHhJNkxtWDRiVUJySlhLWG84c04wMTN2?=
 =?utf-8?Q?fEoP4JlOO2cfK3UNBH?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 69f8b29b-9a65-4d9e-ff20-08d9b8d496fc
X-MS-Exchange-CrossTenant-AuthSource: CO1PR10MB4531.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Dec 2021 16:22:25.7094 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MlQ3y0jH15JhmWx+Kq5cleOu2T6OXjXlClCIoVJDMd1jzs3IcGuJ5ZjzwJdRmRuXhdERCDpxGIyecHJwlfTTkhQPGiBOeBVeqTFM7VgBc7Q=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR10MB4420
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10189
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0
 suspectscore=0
 adultscore=0 mlxlogscore=999 bulkscore=0 malwarescore=0 mlxscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2110150000 definitions=main-2112060101
X-Proofpoint-ORIG-GUID: WlYGeW4XbF2KLlKK6xmDX_KPePCOc1LJ
X-Proofpoint-GUID: WlYGeW4XbF2KLlKK6xmDX_KPePCOc1LJ
Received-SPF: pass client-ip=205.220.165.32;
 envelope-from=eric.devolder@oracle.com; helo=mx0a-00069f02.pphosted.com
X-Spam_score_int: -48
X-Spam_score: -4.9
X-Spam_bar: ----
X-Spam_report: (-4.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, NICE_REPLY_A=-2.076, RCVD_IN_DNSWL_LOW=-0.7,
 RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: berrange@redhat.com, ehabkost@redhat.com, mst@redhat.com,
 konrad.wilk@oracle.com, qemu-devel@nongnu.org, pbonzini@redhat.com,
 imammedo@redhat.com, boris.ostrovsky@oracle.com, rth@twiddle.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Ani, response below. eric

On 12/6/21 04:30, Ani Sinha wrote:
> On Fri, Dec 3, 2021 at 12:40 AM Eric DeVolder <eric.devolder@oracle.com> wrote:
>>
>> This builds the ACPI ERST table to inform OSPM how to communicate
>> with the acpi-erst device.
>>
>> Signed-off-by: Eric DeVolder <eric.devolder@oracle.com>
>> ---
>>   hw/acpi/erst.c | 241 +++++++++++++++++++++++++++++++++++++++++++++++++++++++++
>>   1 file changed, 241 insertions(+)
>>
>> diff --git a/hw/acpi/erst.c b/hw/acpi/erst.c
>> index 4304f55..06a87af 100644
>> --- a/hw/acpi/erst.c
>> +++ b/hw/acpi/erst.c
>> @@ -701,6 +701,247 @@ static const MemoryRegionOps erst_reg_ops = {
>>       .endianness = DEVICE_NATIVE_ENDIAN,
>>   };
>>
>> +
>> +/*******************************************************************/
>> +/*******************************************************************/
>> +
>> +/* ACPI 4.0: Table 17-19 Serialization Instructions */
>> +#define INST_READ_REGISTER                 0x00
>> +#define INST_READ_REGISTER_VALUE           0x01
>> +#define INST_WRITE_REGISTER                0x02
>> +#define INST_WRITE_REGISTER_VALUE          0x03
>> +#define INST_NOOP                          0x04
>> +#define INST_LOAD_VAR1                     0x05
>> +#define INST_LOAD_VAR2                     0x06
>> +#define INST_STORE_VAR1                    0x07
>> +#define INST_ADD                           0x08
>> +#define INST_SUBTRACT                      0x09
>> +#define INST_ADD_VALUE                     0x0A
>> +#define INST_SUBTRACT_VALUE                0x0B
>> +#define INST_STALL                         0x0C
>> +#define INST_STALL_WHILE_TRUE              0x0D
>> +#define INST_SKIP_NEXT_INSTRUCTION_IF_TRUE 0x0E
>> +#define INST_GOTO                          0x0F
>> +#define INST_SET_SRC_ADDRESS_BASE          0x10
>> +#define INST_SET_DST_ADDRESS_BASE          0x11
>> +#define INST_MOVE_DATA                     0x12
>> +
>> +/* ACPI 4.0: 17.4.1.2 Serialization Instruction Entries */
>> +static void build_serialization_instruction_entry(GArray *table_data,
>> +    uint8_t serialization_action,
>> +    uint8_t instruction,
>> +    uint8_t flags,
>> +    uint8_t register_bit_width,
>> +    uint64_t register_address,
>> +    uint64_t value,
>> +    uint64_t mask)
>> +{
>> +    /* ACPI 4.0: Table 17-18 Serialization Instruction Entry */
>> +    struct AcpiGenericAddress gas;
>> +
>> +    /* Serialization Action */
>> +    build_append_int_noprefix(table_data, serialization_action, 1);
>> +    /* Instruction */
>> +    build_append_int_noprefix(table_data, instruction         , 1);
>> +    /* Flags */
>> +    build_append_int_noprefix(table_data, flags               , 1);
>> +    /* Reserved */
>> +    build_append_int_noprefix(table_data, 0                   , 1);
>> +    /* Register Region */
>> +    gas.space_id = AML_SYSTEM_MEMORY;
>> +    gas.bit_width = register_bit_width;
>> +    gas.bit_offset = 0;
>> +    switch (register_bit_width) {
>> +    case 8:
>> +        gas.access_width = 1;
>> +        break;
>> +    case 16:
>> +        gas.access_width = 2;
>> +        break;
>> +    case 32:
>> +        gas.access_width = 3;
>> +        break;
>> +    case 64:
>> +        gas.access_width = 4;
>> +        break;
>> +    default:
>> +        gas.access_width = 0;
>> +        break;
>> +    }
>> +    gas.address = register_address;
>> +    build_append_gas_from_struct(table_data, &gas);
>> +    /* Value */
>> +    build_append_int_noprefix(table_data, value  , 8);
>> +    /* Mask */
>> +    build_append_int_noprefix(table_data, mask   , 8);
>> +}
>> +
>> +/* ACPI 4.0: 17.4.1 Serialization Action Table */
>> +void build_erst(GArray *table_data, BIOSLinker *linker, Object *erst_dev,
>> +    const char *oem_id, const char *oem_table_id)
>> +{
>> +    GArray *table_instruction_data;
>> +    unsigned action;
>> +    hwaddr bar0, bar1;
> 
> I would rather have pcibus_t here as opposed to hwaddr although
> currently they are both unint64_t. Just in case they diverge in
> future.
ok, I will change to pcibus_t.

> 
>> +    AcpiTable table = { .sig = "ERST", .rev = 1, .oem_id = oem_id,
>> +                        .oem_table_id = oem_table_id };
>> +
>> +    bar0 = (hwaddr)pci_get_bar_addr(PCI_DEVICE(erst_dev), 0);
>> +    trace_acpi_erst_pci_bar_0(bar0);
>> +    bar1 = (hwaddr)pci_get_bar_addr(PCI_DEVICE(erst_dev), 1);
>> +    trace_acpi_erst_pci_bar_1(bar1);
>> +
>> +#define MASK8  0x00000000000000FFUL
>> +#define MASK16 0x000000000000FFFFUL
>> +#define MASK32 0x00000000FFFFFFFFUL
>> +#define MASK64 0xFFFFFFFFFFFFFFFFUL
>> +
>> +    /*
>> +     * Serialization Action Table
>> +     * The serialization action table must be generated first
>> +     * so that its size can be known in order to populate the
>> +     * Instruction Entry Count field.
>> +     */
>> +    table_instruction_data = g_array_new(FALSE, FALSE, sizeof(char));
>> +
>> +    /* Serialization Instruction Entries */
>> +    action = ACTION_BEGIN_WRITE_OPERATION;
>> +    build_serialization_instruction_entry(table_instruction_data,
>> +        action, INST_WRITE_REGISTER_VALUE, 0, 32,
>> +        bar0 + ERST_ACTION_OFFSET, action, MASK8);
>> +
>> +    action = ACTION_BEGIN_READ_OPERATION;
>> +    build_serialization_instruction_entry(table_instruction_data,
>> +        action, INST_WRITE_REGISTER_VALUE, 0, 32,
>> +        bar0 + ERST_ACTION_OFFSET, action, MASK8);
>> +
>> +    action = ACTION_BEGIN_CLEAR_OPERATION;
>> +    build_serialization_instruction_entry(table_instruction_data,
>> +        action, INST_WRITE_REGISTER_VALUE, 0, 32,
>> +        bar0 + ERST_ACTION_OFFSET, action, MASK8);
>> +
>> +    action = ACTION_END_OPERATION;
>> +    build_serialization_instruction_entry(table_instruction_data,
>> +        action, INST_WRITE_REGISTER_VALUE, 0, 32,
>> +        bar0 + ERST_ACTION_OFFSET, action, MASK8);
>> +
>> +    action = ACTION_SET_RECORD_OFFSET;
>> +    build_serialization_instruction_entry(table_instruction_data,
>> +        action, INST_WRITE_REGISTER      , 0, 32,
>> +        bar0 + ERST_VALUE_OFFSET , 0, MASK32);
>> +    build_serialization_instruction_entry(table_instruction_data,
>> +        action, INST_WRITE_REGISTER_VALUE, 0, 32,
>> +        bar0 + ERST_ACTION_OFFSET, action, MASK8);
>> +
>> +    action = ACTION_EXECUTE_OPERATION;
>> +    build_serialization_instruction_entry(table_instruction_data,
>> +        action, INST_WRITE_REGISTER_VALUE, 0, 32,
>> +        bar0 + ERST_VALUE_OFFSET , ERST_EXECUTE_OPERATION_MAGIC, MASK8);
>> +    build_serialization_instruction_entry(table_instruction_data,
>> +        action, INST_WRITE_REGISTER_VALUE, 0, 32,
>> +        bar0 + ERST_ACTION_OFFSET, action, MASK8);
>> +
>> +    action = ACTION_CHECK_BUSY_STATUS;
>> +    build_serialization_instruction_entry(table_instruction_data,
>> +        action, INST_WRITE_REGISTER_VALUE, 0, 32,
>> +        bar0 + ERST_ACTION_OFFSET, action, MASK8);
>> +    build_serialization_instruction_entry(table_instruction_data,
>> +        action, INST_READ_REGISTER_VALUE , 0, 32,
>> +        bar0 + ERST_VALUE_OFFSET, 0x01, MASK8);
>> +
>> +    action = ACTION_GET_COMMAND_STATUS;
>> +    build_serialization_instruction_entry(table_instruction_data,
>> +        action, INST_WRITE_REGISTER_VALUE, 0, 32,
>> +        bar0 + ERST_ACTION_OFFSET, action, MASK8);
>> +    build_serialization_instruction_entry(table_instruction_data,
>> +        action, INST_READ_REGISTER       , 0, 32,
>> +        bar0 + ERST_VALUE_OFFSET, 0, MASK8);
>> +
>> +    action = ACTION_GET_RECORD_IDENTIFIER;
>> +    build_serialization_instruction_entry(table_instruction_data,
>> +        action, INST_WRITE_REGISTER_VALUE, 0, 32,
>> +        bar0 + ERST_ACTION_OFFSET, action, MASK8);
>> +    build_serialization_instruction_entry(table_instruction_data,
>> +        action, INST_READ_REGISTER       , 0, 64,
>> +        bar0 + ERST_VALUE_OFFSET, 0, MASK64);
>> +
>> +    action = ACTION_SET_RECORD_IDENTIFIER;
>> +    build_serialization_instruction_entry(table_instruction_data,
>> +        action, INST_WRITE_REGISTER      , 0, 64,
>> +        bar0 + ERST_VALUE_OFFSET , 0, MASK64);
>> +    build_serialization_instruction_entry(table_instruction_data,
>> +        action, INST_WRITE_REGISTER_VALUE, 0, 32,
>> +        bar0 + ERST_ACTION_OFFSET, action, MASK8);
>> +
>> +    action = ACTION_GET_RECORD_COUNT;
>> +    build_serialization_instruction_entry(table_instruction_data,
>> +        action, INST_WRITE_REGISTER_VALUE, 0, 32,
>> +        bar0 + ERST_ACTION_OFFSET, action, MASK8);
>> +    build_serialization_instruction_entry(table_instruction_data,
>> +        action, INST_READ_REGISTER       , 0, 32,
>> +        bar0 + ERST_VALUE_OFFSET, 0, MASK32);
>> +
>> +    action = ACTION_BEGIN_DUMMY_WRITE_OPERATION;
>> +    build_serialization_instruction_entry(table_instruction_data,
>> +        action, INST_WRITE_REGISTER_VALUE, 0, 32,
>> +        bar0 + ERST_ACTION_OFFSET, action, MASK8);
>> +
>> +    action = ACTION_GET_ERROR_LOG_ADDRESS_RANGE;
>> +    build_serialization_instruction_entry(table_instruction_data,
>> +        action, INST_WRITE_REGISTER_VALUE, 0, 32,
>> +        bar0 + ERST_ACTION_OFFSET, action, MASK8);
>> +    build_serialization_instruction_entry(table_instruction_data,
>> +        action, INST_READ_REGISTER       , 0, 64,
>> +        bar0 + ERST_VALUE_OFFSET, 0, MASK64);
>> +
>> +    action = ACTION_GET_ERROR_LOG_ADDRESS_LENGTH;
>> +    build_serialization_instruction_entry(table_instruction_data,
>> +        action, INST_WRITE_REGISTER_VALUE, 0, 32,
>> +        bar0 + ERST_ACTION_OFFSET, action, MASK8);
>> +    build_serialization_instruction_entry(table_instruction_data,
>> +        action, INST_READ_REGISTER       , 0, 64,
>> +        bar0 + ERST_VALUE_OFFSET, 0, MASK32);
>> +
>> +    action = ACTION_GET_ERROR_LOG_ADDRESS_RANGE_ATTRIBUTES;
>> +    build_serialization_instruction_entry(table_instruction_data,
>> +        action, INST_WRITE_REGISTER_VALUE, 0, 32,
>> +        bar0 + ERST_ACTION_OFFSET, action, MASK8);
>> +    build_serialization_instruction_entry(table_instruction_data,
>> +        action, INST_READ_REGISTER       , 0, 32,
>> +        bar0 + ERST_VALUE_OFFSET, 0, MASK32);
>> +
>> +    action = ACTION_GET_EXECUTE_OPERATION_TIMINGS;
>> +    build_serialization_instruction_entry(table_instruction_data,
>> +        action, INST_WRITE_REGISTER_VALUE, 0, 32,
>> +        bar0 + ERST_ACTION_OFFSET, action, MASK8);
>> +    build_serialization_instruction_entry(table_instruction_data,
>> +        action, INST_READ_REGISTER       , 0, 64,
>> +        bar0 + ERST_VALUE_OFFSET, 0, MASK64);
>> +
>> +    /* Serialization Header */
>> +    acpi_table_begin(&table, table_data);
>> +
>> +    /* Serialization Header Size */
>> +    build_append_int_noprefix(table_data, 48, 4);
>> +
>> +    /* Reserved */
>> +    build_append_int_noprefix(table_data,  0, 4);
>> +
>> +    /*
>> +     * Instruction Entry Count
>> +     * Each instruction entry is 32 bytes
>> +     */
>> +    build_append_int_noprefix(table_data,
>> +        (table_instruction_data->len / 32), 4);
>> +
>> +    /* Serialization Instruction Entries */
>> +    g_array_append_vals(table_data, table_instruction_data->data,
>> +        table_instruction_data->len);
>> +    g_array_free(table_instruction_data, TRUE);
>> +
>> +    acpi_table_end(linker, &table);
>> +}
>> +
>>   /*******************************************************************/
>>   /*******************************************************************/
>>   static int erst_post_load(void *opaque, int version_id)
>> --
>> 1.8.3.1
>>

