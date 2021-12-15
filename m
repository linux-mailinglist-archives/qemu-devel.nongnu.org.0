Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E9031476157
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Dec 2021 20:09:57 +0100 (CET)
Received: from localhost ([::1]:53704 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mxZf2-0005sH-OF
	for lists+qemu-devel@lfdr.de; Wed, 15 Dec 2021 14:09:56 -0500
Received: from eggs.gnu.org ([209.51.188.92]:50840)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.devolder@oracle.com>)
 id 1mxYX2-0005MV-78
 for qemu-devel@nongnu.org; Wed, 15 Dec 2021 12:57:37 -0500
Received: from mx0a-00069f02.pphosted.com ([205.220.165.32]:35076)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.devolder@oracle.com>)
 id 1mxYWz-00072D-JJ
 for qemu-devel@nongnu.org; Wed, 15 Dec 2021 12:57:35 -0500
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 1BFGB51o013374; 
 Wed, 15 Dec 2021 17:57:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=message-id : date :
 subject : to : cc : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=corp-2021-07-09;
 bh=h+BGw59klwuRDxaqCqdhxpYUps4/RBx9mPXInGECQ8E=;
 b=dhDuUoOn87szghPA43qZml3vMajN58w24ZHDK6Pn4/O0Bl7JVqzsq1a2AjXfaHovbMqJ
 iArZ9QBIv+zlEdX6mkqbPL42YEJM0Y497kkkNNECKKwRC8JAYtgcchUxpOOtwOIW+r09
 THb+N78jE0c+4N8n/5TwgMCT1wKrmdMnbHdhmyWX+aqq1RBwZzrSpGw21alFQ31JhHSs
 JyF8E+tlMjrld2c6baRHMnJYznWKdP41JTYntzji5m4zoH05naKWTn35C9WjlekLrx//
 rSYLmPqsUoOBfvhuzpFE5qcYKwg7m1hleuVKQ2VkBdR1uxnzuj9CKcaX9vVEGzYttZlF uQ== 
Received: from userp3030.oracle.com (userp3030.oracle.com [156.151.31.80])
 by mx0b-00069f02.pphosted.com with ESMTP id 3cyknp0c69-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 15 Dec 2021 17:57:29 +0000
Received: from pps.filterd (userp3030.oracle.com [127.0.0.1])
 by userp3030.oracle.com (8.16.1.2/8.16.1.2) with SMTP id 1BFHuVH6133573;
 Wed, 15 Dec 2021 17:57:28 GMT
Received: from nam11-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam11lp2174.outbound.protection.outlook.com [104.47.57.174])
 by userp3030.oracle.com with ESMTP id 3cvh40h8rq-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 15 Dec 2021 17:57:28 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VwxaasP3faPMqslbGen3Zfi+3Oy1hyBXvA/ZbK20M8ODmT9j46oF2cK/Z2Uwr+CDUtUCTtMppKXjxFmTvLdw25CjAV5mhBMePR33H73sDH8vNM0KO/IlPlGIMaIa/8QCyyqolRkCF6BVAtPNHDTxPlzHLgGDILzNOdqIB5W4TqTk2NXFjyqcARBqfPKhXC8lWZh1VAc2VfiYc0fX8N3Z29KfZreXHI2ViRAawxUTeuvS+lbRpSecO60HYI9YXQU82eltuZs+ipE/OhK9VY6G8T7Zw+OijE4QenYp5yE44t4p/eKRfHiPOeUjm5aIxbvXwBLsyvWTFX1q0HA8L6+InA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=h+BGw59klwuRDxaqCqdhxpYUps4/RBx9mPXInGECQ8E=;
 b=emymVmXJNpGUJOvbw0lHZlQzZfW6WsI3jcFThSYI7fbkArgBGP8FWamI/VvcIPSmZi4DcFfbBxZf1KusqnxHEj8hGC2uPfR74AWKfmANIyyWMwxPS1WNFOK2b59vg9EtwKUuiE8EAQYPUaOdlmeEl9ngTTuFjef4rOpbQw37Y9zp6kOqPoKjsqeyEHQViulL4aTZMGJ8i7N29rkurb1qNytjhdc88QgMlMKmnzatqF5iF8UTgsQ7ulb0NDYMPrO0CS2P38E2wCrDkFKCZgILzilVLuJUxyMpfxD4LdrF9Q2bQdJKuHxFL9Iduz1Z82OXEUVcYXfbPcZcF4Ep8exrAQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=h+BGw59klwuRDxaqCqdhxpYUps4/RBx9mPXInGECQ8E=;
 b=ArgRKE+fKD7GB713/BJCQpQMgZ1IaysAuxrbhUCbR9PDHbOZgmh0z/3J42PAQfAVa3hQcT6QDlgsiNRrrpbrA/+J+uqf06vNNdjheW6kM8pHCZ6CHH5qZOZamVW8af4iOchHxKwDsTYjwDbWKkbquPnjpw8wOjXhyw7/ixx7FbA=
Received: from CO1PR10MB4531.namprd10.prod.outlook.com (2603:10b6:303:6c::22)
 by MWHPR10MB1759.namprd10.prod.outlook.com (2603:10b6:301:8::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4778.12; Wed, 15 Dec
 2021 17:57:26 +0000
Received: from CO1PR10MB4531.namprd10.prod.outlook.com
 ([fe80::143c:ea64:7017:19f]) by CO1PR10MB4531.namprd10.prod.outlook.com
 ([fe80::143c:ea64:7017:19f%4]) with mapi id 15.20.4778.018; Wed, 15 Dec 2021
 17:57:25 +0000
Message-ID: <2596427e-7c29-3d23-a0d4-3a0a8c960153@oracle.com>
Date: Wed, 15 Dec 2021 11:57:21 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH v11 06/10] ACPI ERST: build the ACPI ERST table
Content-Language: en-US
To: Ani Sinha <ani@anisinha.ca>
References: <1639582695-7328-1-git-send-email-eric.devolder@oracle.com>
 <1639582695-7328-7-git-send-email-eric.devolder@oracle.com>
 <CAARzgwy0qBE2rBtsjFaW6ED_bWW4SjV0JNfVYmc=P7groLJthw@mail.gmail.com>
From: Eric DeVolder <eric.devolder@oracle.com>
In-Reply-To: <CAARzgwy0qBE2rBtsjFaW6ED_bWW4SjV0JNfVYmc=P7groLJthw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR05CA0023.namprd05.prod.outlook.com
 (2603:10b6:a03:33b::28) To CO1PR10MB4531.namprd10.prod.outlook.com
 (2603:10b6:303:6c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 2cd2eb6c-2281-402b-731e-08d9bff45a45
X-MS-TrafficTypeDiagnostic: MWHPR10MB1759:EE_
X-Microsoft-Antispam-PRVS: <MWHPR10MB1759B66E045D1C3D411EC74597769@MWHPR10MB1759.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: DBY1OSGAEdGAjF4pvJqpj4vsgFqpVKZWLRlI5LTDxWfBgnLs5ZO/TB5l8NhCBXC66I7dHjXYbSUmTg5UDxp94Wk7xca0Mj2/U/uQvgqt2Pm2kvHG/JbG7yLm4XQ4MDHJ32qoEvm5r5KkMcxQqq/Bta6YftmY00NCsIgFg4GQKBZxa0o4IxM9g7rebNWmLHGtKvYglet4scFp9HWbuxfw2uB8Kc9MoCtrdieOwZHIb865Rdi1wJl9sFtlSi2xhFuSZA20HULGO41w5bf40g4HubgpgV1uXBWwQ0tvFjb+EP8f5j4Vge86rEUuozmd3ykBlfyAK7Bfr+gn/xKNCq39504QNN716sGhwH4aUQIjWkixKWMSwxEY1qX7SGUv7H4XMqRjQHlM/fiVZU8bm/nIrgeQ4dkA3ehiJUUC4vYNV/BtPbR4cAyYmTF6LEyS2XGYMDx9urT9i7ozqZvhJhrxjaCzZQX1BoyjcmOlEU36hFD1NeYjg8HXfiPb28XM6/xXIinBvcp+vpbk3SNJ/kPT4ynSpz1wJrzfJNLe44Hm3lirBwR9DJjyZuiGlceizLn+/Ub15Jqk+c5n1VUgWPJDoM40lJMIfhCGjvmLLyxhx69m0P4O9VB1edIY8Js5utUKnFaoR0a6LTOOm1CAMTcdOxO/lwlm+M47h8AesXwRL3PPHXshUd1BpKCJhL+JHZFLRHlBkUx6EyZBO/Src8AzNQ1rVJnoefodSHwCgE8gZbI=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO1PR10MB4531.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(31686004)(107886003)(8676002)(6512007)(6486002)(8936002)(508600001)(53546011)(66946007)(38100700002)(66556008)(36756003)(5660300002)(6506007)(2906002)(186003)(4326008)(66476007)(6916009)(316002)(83380400001)(31696002)(2616005)(6666004)(86362001)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?L1dwNVNVeUUzMEt5YTFxM1BvWXZXTTU1RUYwenVmbTFneUl6clRGL2x0SHNO?=
 =?utf-8?B?eGljbW4zbUZiQ2R5ZjVHVlYyUzVlNVRKTGRNeXRMZ3doZkN0aW02MmdqWU1l?=
 =?utf-8?B?Y2JvQyt6VWpBdkh0TjJNcHdJR3ZaMHNjRVZIWkFROG1jYjUxQmQrejlZUldO?=
 =?utf-8?B?T2tSM0h2SmEzS20vZFNRREFSYUxBczZnSHVsWXgzYUIxT1VzQ1ZTWUN4TmxF?=
 =?utf-8?B?WXVhWWNqeFdBallxUXRiRWxiTnorYkRiblhuNXJlUmFzbmNFMkJGODJxQXNM?=
 =?utf-8?B?Skh2a3ViaVJSRFZkcy9VWVpkaE9JOHJIb3ZYamYrY1JhZkJQZkxHVXNIRW5o?=
 =?utf-8?B?eTVhNngrNGJEejlIdERVMkM1Y3hCZk1NWk52aXJTMmM1ampRUzhUVUgzdTY4?=
 =?utf-8?B?YnRiaGdENUh5aXpNY3lNWHlrd0QrdkpCRnNWbW5NWWxSU2FvWW93S0VLTGxU?=
 =?utf-8?B?cWZiM0NiN3l3d2RqdjVyR3MyM25rMDJLMnlLanJDbjFodCtxOVZ4b0FhY2tu?=
 =?utf-8?B?TnF0ZGlqRUdjUERVVWwwZkx1S29qeEtHVmlQTVVIei8vQ2RSU0dLN0pwT0V6?=
 =?utf-8?B?TUk0cWtSUUFDbks0OWE5cjljclFPOWg1RXduQnBiU3JtU1hrYjlvZ3NBeFlX?=
 =?utf-8?B?a092SFpYNnltb25pQ3V5TC9DQWZKZmZISTFBVVpLaDZCRG5Nb2MxaWxaTjl3?=
 =?utf-8?B?QUpSemxjTVVLZmQwUGFWTVdGT25xUFBxTURtY0tNLzBBNGhTek9tc1V5NGFK?=
 =?utf-8?B?dmRhM1g1ZERwQVYwU3lpSlF4UVZFNGhOSmY5V3NnbW51a0Z0UEJ2SS9xaGZz?=
 =?utf-8?B?dHY5U1VIcmx3c1dObEZ0Q3d4VWgyN3NPTmxlbW1zdUlOdjBUOVJlY3dUNDNJ?=
 =?utf-8?B?RFJvVDBEYUwrS1FicjZRaTNCK3M4WXBkSzY3d2RJT0pxMkdPRzdOejVNdEVr?=
 =?utf-8?B?NkdYbk1Oc2FsaDlYanNVdG1nQnF2MUo5MTcvaG9FT1FzY2Vna0t1ZWZjU1pm?=
 =?utf-8?B?UXJRWDdIL05Zd21KM2p2MVlzSTg5c0o3WWxSQWZTQUJoNzJRdXljQTNSd0lR?=
 =?utf-8?B?WUg3N1hNTFFmR21tY2NpUUFvNCtFZkJGc1BMcWU1MUdZbW9lY3B2b1NEcDQx?=
 =?utf-8?B?YjZMR0tGNVU2QlkybTJSeFNOWHhVd29XUmg3SEdWWmJpdVBWZGw5Sy95bFBy?=
 =?utf-8?B?d3BOZStibEtrUGNzOEs4b3JHR2dHMFhvdGEzVEZpRTdvenlvVWZWbGhTUDkv?=
 =?utf-8?B?dG1tMDBNclFUcVU5aFVYRlM2blZ2TG1hTmJ2N1ZKZkxrbWNxaG9RZk1lTUQy?=
 =?utf-8?B?RTVOZERQQy9GaVdpSkMvbDZldUZSM2ZlaFZEZVd3SkxCYzAwN1VKMElrSjVJ?=
 =?utf-8?B?cXRJNkhEMkd6UVZFU09weXZBMS92d2VwOVJFOVpCbVhoSGJEa3BhVGllYnRJ?=
 =?utf-8?B?V283b25PZk0vek5xeVE3MGk3dkNOcHYzMUpPYVVkV0R5dFN0U3BXdTFuY0Ro?=
 =?utf-8?B?aVY4NWxLZ0tLMDdyK29QUWIrVHJJV3FDeTJGcTI1U2Q5OGVxWDlkYnlaRXhh?=
 =?utf-8?B?dFY0NkJvM3JVcWVISXE2Yit4ZEpybDVTSmovZWpIRHBTT1BpYUxCQUcvd1Vq?=
 =?utf-8?B?WWRkdGVwOXl0TmVLL0ZVbkc3L2RvNk5RdE0zSk1LcERFOUU3c2JodW53NUFx?=
 =?utf-8?B?QkRaQWZCcTBQRmxpaG9nTGxJbi9aMXNBOEwraGFueUs2U21IazhOWmJZMjM2?=
 =?utf-8?B?TmFwTVpaeVpTemtWMXZDejFCbVlWaG8rZUE3ZVVFSEZic09tRXJGWDhyM0ZV?=
 =?utf-8?B?UnZacXNhYTZNVmRBT0VIbWZLdUl6YTNMaXJhS2hDZ3p2VmQ0SWdmTjlNWml2?=
 =?utf-8?B?bC8zcEE1NGJFL0EvMU9UZTl4RGJxcXFWc2dPQXppdnZ0S2xkMUlnZFh6bkNG?=
 =?utf-8?B?UUk0cW1sdU04WEF3L2MyOW1uNlNWQnR5c1V3VGZVU0dSS2Y3KzBrd05Yc2Vr?=
 =?utf-8?B?ZkdLK2Z0L0hyRjh4WDJrNDlnRnIvNUh6RjRkWEFWdlB5NFdZVkVrUXZQZkVU?=
 =?utf-8?B?d3NYUFZiZ2I1TFdQaVBJbk8yUnJXUGxzeDZaZC9qOFp1SE0ya3BiQ3Z4L3Vp?=
 =?utf-8?B?K1VvNnA2RGMzSHJWSE5JUWJVVkovMjhwc3pLK3ZhcXhSZEE1K2IzeVRYZzdG?=
 =?utf-8?B?QXRQMmllVFh2ci9FajdkekxXRWUzcXhqTExSTDF6UU1ySjJNSTkrTWE2ZWxl?=
 =?utf-8?B?amhaQkJJTXRObjY3eWYxdHEwTmttbEVOaytPSDdDV0R0Rmt6dyt2VFE2Ui9J?=
 =?utf-8?Q?LVhkfKT87VaPNuLirr?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2cd2eb6c-2281-402b-731e-08d9bff45a45
X-MS-Exchange-CrossTenant-AuthSource: CO1PR10MB4531.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Dec 2021 17:57:25.8311 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SlF/Yj5g37KrlDNLWvKwBvrekB2UE4tma/ZpsQR68FNb1bwpRFwBlstMuGUews78FihtnXBQyzI/Z5ws9W6gmTQrtCzLuFMfB7fBEVJwpKc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR10MB1759
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10199
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0
 spamscore=0 suspectscore=0
 malwarescore=0 mlxlogscore=999 bulkscore=0 mlxscore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2110150000
 definitions=main-2112150101
X-Proofpoint-ORIG-GUID: zMPz73XMFV4h-LN5lrSTVTNr5AQoz-Um
X-Proofpoint-GUID: zMPz73XMFV4h-LN5lrSTVTNr5AQoz-Um
Received-SPF: pass client-ip=205.220.165.32;
 envelope-from=eric.devolder@oracle.com; helo=mx0a-00069f02.pphosted.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.64,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

Hi Ani,
Thanks for such quick feedback! One inline response below.
eric

On 12/15/21 10:33, Ani Sinha wrote:
> On Wed, Dec 15, 2021 at 9:08 PM Eric DeVolder <eric.devolder@oracle.com> wrote:
>>
>> This builds the ACPI ERST table to inform OSPM how to communicate
>> with the acpi-erst device.
>>
>> Signed-off-by: Eric DeVolder <eric.devolder@oracle.com>
>> ---
>>   hw/acpi/erst.c | 188 +++++++++++++++++++++++++++++++++++++++++++++++++++++++++
>>   1 file changed, 188 insertions(+)
>>
>> diff --git a/hw/acpi/erst.c b/hw/acpi/erst.c
>> index bb6cad4..05177b3 100644
>> --- a/hw/acpi/erst.c
>> +++ b/hw/acpi/erst.c
>> @@ -59,6 +59,27 @@
>>   #define STATUS_RECORD_STORE_EMPTY     0x04
>>   #define STATUS_RECORD_NOT_FOUND       0x05
>>
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
>>   /* UEFI 2.1: Appendix N Common Platform Error Record */
>>   #define UEFI_CPER_RECORD_MIN_SIZE 128U
>>   #define UEFI_CPER_RECORD_LENGTH_OFFSET 20U
>> @@ -172,6 +193,173 @@ typedef struct {
>>
>>   /*******************************************************************/
>>   /*******************************************************************/
>> +
>> +/* ACPI 4.0: 17.4.1.2 Serialization Instruction Entries */
>> +static void build_serialization_instruction_entry(GArray *table_data,
>> +    uint8_t serialization_action,
>> +    uint8_t instruction,
>> +    uint8_t flags,
>> +    uint8_t register_bit_width,
>> +    uint64_t register_address,
>> +    uint64_t value)
>> +{
>> +    /* ACPI 4.0: Table 17-18 Serialization Instruction Entry */
>> +    struct AcpiGenericAddress gas;
>> +    uint64_t mask;
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
>> +    gas.access_width = ctz32(register_bit_width) - 2;
>> +    gas.address = register_address;
>> +    build_append_gas_from_struct(table_data, &gas);
>> +    /* Value */
>> +    build_append_int_noprefix(table_data, value  , 8);
>> +    /* Mask */
>> +    mask = (1ULL << (register_bit_width - 1) << 1) - 1;
>> +    build_append_int_noprefix(table_data, mask  , 8);
>> +}
>> +
>> +/* ACPI 4.0: 17.4.1 Serialization Action Table */
>> +void build_erst(GArray *table_data, BIOSLinker *linker, Object *erst_dev,
>> +    const char *oem_id, const char *oem_table_id)
>> +{
>> +    GArray *table_instruction_data;
>> +    unsigned action;
> 
> This variable can be eliminated (see below).
> 
>> +    pcibus_t bar0 = pci_get_bar_addr(PCI_DEVICE(erst_dev), 0);
>> +    AcpiTable table = { .sig = "ERST", .rev = 1, .oem_id = oem_id,
>> +                        .oem_table_id = oem_table_id };
>> +
>> +    trace_acpi_erst_pci_bar_0(bar0);
>> +
>> +    /*
>> +     * Serialization Action Table
>> +     * The serialization action table must be generated first
>> +     * so that its size can be known in order to populate the
>> +     * Instruction Entry Count field.
>> +     */
>> +    table_instruction_data = g_array_new(FALSE, FALSE, sizeof(char));
>> +
>> +    /*
>> +     * Macros for use with construction of the action instructions
>> +     */
>> +#define build_read_register(action, width_in_bits, reg) \
>> +    build_serialization_instruction_entry(table_instruction_data, \
>> +        action, INST_READ_REGISTER, 0, width_in_bits, \
>> +        bar0 + reg, 0)
>> +
>> +#define build_read_register_value(action, width_in_bits, reg, value) \
>> +    build_serialization_instruction_entry(table_instruction_data, \
>> +        action, INST_READ_REGISTER_VALUE, 0, width_in_bits, \
>> +        bar0 + reg, value)
>> +
>> +#define build_write_register(action, width_in_bits, reg, value) \
>> +    build_serialization_instruction_entry(table_instruction_data, \
>> +        action, INST_WRITE_REGISTER, 0, width_in_bits, \
>> +        bar0 + reg, value)
>> +
>> +#define build_write_register_value(action, width_in_bits, reg, value) \
>> +    build_serialization_instruction_entry(table_instruction_data, \
>> +        action, INST_WRITE_REGISTER_VALUE, 0, width_in_bits, \
>> +        bar0 + reg, value)
>> +
>> +    /* Serialization Instruction Entries */
>> +    action = ACTION_BEGIN_WRITE_OPERATION;
>> +    build_write_register_value(action, 32, ERST_ACTION_OFFSET, action);
>> +
>> +    action = ACTION_BEGIN_READ_OPERATION;
>> +    build_write_register_value(action, 32, ERST_ACTION_OFFSET, action);
>> +
>> +    action = ACTION_BEGIN_CLEAR_OPERATION;
>> +    build_write_register_value(action, 32, ERST_ACTION_OFFSET, action);
>> +
>> +    action = ACTION_END_OPERATION;
>> +    build_write_register_value(action, 32, ERST_ACTION_OFFSET, action);
>> +
>> +    action = ACTION_SET_RECORD_OFFSET;
>> +    build_write_register(action, 32, ERST_VALUE_OFFSET, 0);
>> +    build_write_register_value(action, 32, ERST_ACTION_OFFSET, action);
>> +
>> +    action = ACTION_EXECUTE_OPERATION;
>> +    build_write_register_value(action, 32, ERST_VALUE_OFFSET,
>> +        ERST_EXECUTE_OPERATION_MAGIC);
>> +    build_write_register_value(action, 32, ERST_ACTION_OFFSET, action);
> 
> 
> 
>> +
>> +    action = ACTION_CHECK_BUSY_STATUS;
>> +    build_write_register_value(action, 32, ERST_ACTION_OFFSET, action);
>> +    build_read_register_value(action, 32, ERST_VALUE_OFFSET, 0x01);
>> +
>> +    action = ACTION_GET_COMMAND_STATUS;
>> +    build_write_register_value(action, 32, ERST_ACTION_OFFSET, action);
>> +    build_read_register(action, 32, ERST_VALUE_OFFSET);
>> +
>> +    action = ACTION_GET_RECORD_IDENTIFIER;
>> +    build_write_register_value(action, 32, ERST_ACTION_OFFSET, action);
>> +    build_read_register(action, 64, ERST_VALUE_OFFSET);
>> +
>> +    action = ACTION_SET_RECORD_IDENTIFIER;
>> +    build_write_register(action, 64, ERST_VALUE_OFFSET, 0);
>> +    build_write_register_value(action, 32, ERST_ACTION_OFFSET, action);
>> +
>> +    action = ACTION_GET_RECORD_COUNT;
>> +    build_write_register_value(action, 32, ERST_ACTION_OFFSET, action);
>> +    build_read_register(action, 32, ERST_VALUE_OFFSET);
>> +
>> +    action = ACTION_BEGIN_DUMMY_WRITE_OPERATION;
>> +    build_write_register_value(action, 32, ERST_ACTION_OFFSET, action);
>> +
>> +    action = ACTION_GET_ERROR_LOG_ADDRESS_RANGE;
>> +    build_write_register_value(action, 32, ERST_ACTION_OFFSET, action);
>> +    build_read_register(action, 64, ERST_VALUE_OFFSET);
>> +
>> +    action = ACTION_GET_ERROR_LOG_ADDRESS_LENGTH;
>> +    build_write_register_value(action, 32, ERST_ACTION_OFFSET, action);
>> +    build_read_register(action, 64, ERST_VALUE_OFFSET);
>> +
>> +    action = ACTION_GET_ERROR_LOG_ADDRESS_RANGE_ATTRIBUTES;
>> +    build_write_register_value(action, 32, ERST_ACTION_OFFSET, action);
>> +    build_read_register(action, 32, ERST_VALUE_OFFSET);
>> +
>> +    action = ACTION_GET_EXECUTE_OPERATION_TIMINGS;
>> +    build_write_register_value(action, 32, ERST_ACTION_OFFSET, action);
>> +    build_read_register(action, 64, ERST_VALUE_OFFSET);
> 
> if I am reading this right, build_write_register_value() is called
> with the same parameters, except that action is changing. We can
> optimize repetative calls with the same parameters.
> 
> build_read_register can be split into build_read_register_32() and
> build_read_register_64().
> So we can have :
> build_write_register_value(ACTION_GET_EXECUTE_OPERATION_TIMINGS);
> build_read_register_64(ACTION_GET_EXECUTE_OPERATION_TIMINGS);
> 

If I understand correctly, you are essentially asking for appropriate accessor functions.
I did an inventory and the following would be the list of unique accessors needed:

To ACTION register:
  write_value_32

To VALUE register:
  write_value_32
  write_32
  write_64
  read_value_32
  read_32
  read_64

So that is 7 accessors, which must spell out the access type and register name in the macro.

With respect to the comment on eliminating the action variable. Given the current code I did miss an 
optimization to avoid passing 'action' as the first parameter to the macros; I should have just used 
it directly within the macro. Plus the 'action' assignment acts as documentation to inform you as to 
which action is being constructed. But in other places, 'action' is being used as a true parameter 
to the macros as the value to write.

If you think that going to more accessors is simpler/more clear, then I'll do so.

Thanks!
eric




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
>> +    g_assert((table_instruction_data->len) % 32 == 0);
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
>> +/*******************************************************************/
>> +/*******************************************************************/
>>   static uint8_t *get_nvram_ptr_by_index(ERSTDeviceState *s, unsigned index)
>>   {
>>       uint8_t *rc = NULL;
>> --
>> 1.8.3.1
>>

