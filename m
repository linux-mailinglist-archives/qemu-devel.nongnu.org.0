Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D2E5A6ADE7C
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Mar 2023 13:15:35 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pZWCm-0004tR-Kn; Tue, 07 Mar 2023 07:14:08 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <joao.m.martins@oracle.com>)
 id 1pZWCj-0004s7-QV
 for qemu-devel@nongnu.org; Tue, 07 Mar 2023 07:14:06 -0500
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <joao.m.martins@oracle.com>)
 id 1pZWCe-0006yc-II
 for qemu-devel@nongnu.org; Tue, 07 Mar 2023 07:14:03 -0500
Received: from pps.filterd (m0333520.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 327842w8001757; Tue, 7 Mar 2023 12:13:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=message-id : date :
 subject : from : to : cc : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=corp-2022-7-12;
 bh=RFRgdsC8y8scTfTv0AByvsRyaHk2BIRNbNCYHqOQqGc=;
 b=vCNDHoiK6blAt10oYc7B4fcAoVNEL1VM1h9KYeu4W4bqoJii9Q/dolWeehyIfxm9qbBo
 iXPS1iGN8foIWMwAKqu7orvLSadhqFON13obGODO9cY9fURPtHTIVAFZwP8UiIpLlHr2
 R3iM9Hgm9JObiSjQq2i3rdk7FPejZ9vYRKpTfT0DAB+N5cBrrw6Y91GVyOs+ujeuK3m5
 i3W3y9M5GHflnvIW6BXO0vPA4sDfYoO2HpCXdH387PKC/vaSYCS6jvcNYf8VUFEGw6U0
 cAYF11eW+oJWQhdgn5IraDPIcn3uUuR1EuLyE1kBE5eGBGYgHs2HXUhteB7ZRfzaY1g3 cg== 
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com
 (phxpaimrmta02.appoci.oracle.com [147.154.114.232])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3p415hwbyg-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 07 Mar 2023 12:13:58 +0000
Received: from pps.filterd
 (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
 by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (8.17.1.5/8.17.1.5)
 with ESMTP id 3279xuOc024899; Tue, 7 Mar 2023 12:13:57 GMT
Received: from nam12-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam12lp2172.outbound.protection.outlook.com [104.47.59.172])
 by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id
 3p4ttjwfnf-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 07 Mar 2023 12:13:57 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nqhYx+r8KM+hs5lx9hHtbjVT2zmWSgZCcaXpV9ndm3cMRhey8VZjtRcgOpW0zsGZbj7vRYGMTxDqJz4JNn8EUM3lKLomyRVweSS9hF2vyc8BP6Vlxrx+jmGp2oI5PNWeF2AXMJnw8BMvK0ikZx4lFWxhTmcioznPVgaBldMv01oP/0l7ree03VtaDWfDOV0fElydq90+CIXR8qlweIwin5bggGyl14tUVRtz13U4U/SnU4IcMFEpMg0fY4AhTFSNwtuK0PWlNDTe+COz2ExRfj0PyhOs7O5tOmOBBfciphPA+BDzXNh8lUK2fYyGYRNuprMlfONWr6mjlir1SDJjMA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RFRgdsC8y8scTfTv0AByvsRyaHk2BIRNbNCYHqOQqGc=;
 b=mfoYBLKgDBRoK/PbPhd/jw6vH7sYbIze23sGEirC2NGAwe52TS8/BprmfQoFijckC+B396kbQsQ3b2NOmGWFjmKB9G7t3I4y1IDA2U5A0hxmlpd+siQ4H61qOy81bc8dmg0b/aZ8aZU0KOF+M7MJCVRMneOHeioKtIoLWaJRlTQycfnSML2wDqbl2BCVInSNAXnlNphZ3DGAjh5cjJbqxCieM9IHoRi1iAusaQ2MbTb1r/VsUbhck819mBLHctRW9idyHdrR5ZdVKZISDYeUA4uPS8nX6cwKaKF8CssuUWshGmdU9JsdGDge0VlaoBGOfxtBG5ph1lm7c+TNcsKdnw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RFRgdsC8y8scTfTv0AByvsRyaHk2BIRNbNCYHqOQqGc=;
 b=oJI8Yb02Bzgm5NLCEVfVvjAX0H3b0aFTow+w5dSObsGv5B+G/7FAD0HUOZNoBX2yvoaQdi1xan+QPMaP/B7lDFyfFTBQsPmR0FIAVimxZXMSM4C6RmGyap8SOB0K+HOuuWP28ALY31+nYb+Tqw23W4d3BLTOKttR7EP7Az/1Flk=
Received: from BLAPR10MB4835.namprd10.prod.outlook.com (2603:10b6:208:331::11)
 by BN0PR10MB4919.namprd10.prod.outlook.com (2603:10b6:408:129::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6156.29; Tue, 7 Mar
 2023 12:13:55 +0000
Received: from BLAPR10MB4835.namprd10.prod.outlook.com
 ([fe80::9b30:898b:e552:8823]) by BLAPR10MB4835.namprd10.prod.outlook.com
 ([fe80::9b30:898b:e552:8823%6]) with mapi id 15.20.6156.029; Tue, 7 Mar 2023
 12:13:55 +0000
Message-ID: <3a1dbe5c-9899-babf-25a4-bf78aa849666@oracle.com>
Date: Tue, 7 Mar 2023 12:13:49 +0000
Subject: Re: [PATCH v4 08/14] vfio/common: Record DMA mapped IOVA ranges
Content-Language: en-US
From: Joao Martins <joao.m.martins@oracle.com>
To: Alex Williamson <alex.williamson@redhat.com>
Cc: qemu-devel@nongnu.org, Cedric Le Goater <clg@redhat.com>,
 Yishai Hadas <yishaih@nvidia.com>, Jason Gunthorpe <jgg@nvidia.com>,
 Maor Gottlieb <maorg@nvidia.com>, Kirti Wankhede <kwankhede@nvidia.com>,
 Tarun Gupta <targupta@nvidia.com>, Avihai Horon <avihaih@nvidia.com>
References: <20230307020258.58215-1-joao.m.martins@oracle.com>
 <20230307020258.58215-9-joao.m.martins@oracle.com>
 <20230306195736.3efc6980.alex.williamson@redhat.com>
 <83aaa9ab-2851-5a13-61ca-1a7ae827c64c@oracle.com>
In-Reply-To: <83aaa9ab-2851-5a13-61ca-1a7ae827c64c@oracle.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO2P123CA0083.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:138::16) To BLAPR10MB4835.namprd10.prod.outlook.com
 (2603:10b6:208:331::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BLAPR10MB4835:EE_|BN0PR10MB4919:EE_
X-MS-Office365-Filtering-Correlation-Id: c709236c-9543-4488-3f4c-08db1f056c13
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: gfZzg1VefWjdudgsSfyS+jlM85lHddlKAu5AUjZouacYb/7WAqr7srI73Wuvnn1Xh/rSQxasVDDGzIfPfArNnVc2xUAQu9qQYPk5+z42OTst8+ggeYOTzITtHI/1GczxydsqVDfsy7qvB0RBDFOM2d/39PyqJnHC0tm+/v/okkKjuPRrFbuNRXPuCbvmVIQqqZPgQC0XmJ7wn3gTUWa786Wn6KnJOa8BIEnWaLUaW50r5JV+k0CXRVto11Y+MHqapZkFSmjxqKRUmMvzg6ZiMPPwon42nlx3IGoghVSB5J+tl8tP+m3hNdzIQEXqP0pzZggDGYGKCz0lMllVJ6/2cqf9yyyTNlX3rvX83hy9hQI8UJZ98kIvfvifcmffwjxpcnLF/YLTYTIUYLAeLcniYJNBTJsvhjZCvixC/g71k8pPdELfKOiEeCHb7o864lUTbVQ6ls6YX26bEWbMvhYj52moGJm7mUpGoxIQyyD97uwg0w4rjb5khRnOFI2liK1W9K+21nmKte9hQaCfe60GI4qdeVC5D6IGs52DTsSXkByYl12vVgAnPaZyhQQuysZcZznB5asZG6QJR0DB8XzZExrUuRJx5uSza3FRxcpd3zZDI6LIM+sEjHvAs7pOyawVpNlLHak5vHdxWn3QYYJN6g6vMDAO/BRThzxqB+qHlrUOhNeoJIxqM84Ygk4qQOqLz8qul3IuCKkksUaz0Y/U1Q==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BLAPR10MB4835.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(376002)(346002)(396003)(366004)(39860400002)(136003)(451199018)(2906002)(38100700002)(186003)(26005)(6506007)(53546011)(6512007)(2616005)(31686004)(6666004)(66476007)(66556008)(66946007)(478600001)(5660300002)(8936002)(6486002)(41300700001)(31696002)(54906003)(316002)(36756003)(8676002)(4326008)(6916009)(86362001)(83380400001)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MGd2bTEwRGJDOXVSdVVDL0E4WXBvUjYraDNRSjZQYW1qclRYUGpvaDhMV3FL?=
 =?utf-8?B?QWpvYnN5QzNGSE1GdzBjcVNHanlnSkZSU29qNXovaGR2RVhzK25la2kwNHU3?=
 =?utf-8?B?dkN0TTd6Z00zUDRsTkl3QjI3Z3M1NWo4RGZGTDJZVFVNVGtXSkF6ODQwbjFY?=
 =?utf-8?B?bVBYWjNtclk4dkc1QmJhYWFkZjRPRmVUYnRUZVIyYkRlV1lqZ2I3R2JCeHRq?=
 =?utf-8?B?TTA5NXk1SHdoYWtlQ1ZkRlFWaENodWhZbno0T1kyT2JWbGlkUDBxcHNhUnpl?=
 =?utf-8?B?aVYyTHQ2a1BNV2FueW9FNGN6OTk2cVpDOUhtb05Eb05OUFFNM1U5cXpNcXhI?=
 =?utf-8?B?TFh5TGJDQ0tZbVZOcWxKRzZYcjAvQXNSRis2d3hqeEExTWxrZzRpWVZFNStE?=
 =?utf-8?B?VU9ObEtES3RVVmJNeVg4VmJFRENzOXhoZmZ0c0x4WEhZYmc2NlFRTE4zUXk4?=
 =?utf-8?B?aEhHcG9FN3FCNUZLajZ5K2tkQVVMQUNtVjAvK1JPbTJOOEdLOXVyZExNQXoy?=
 =?utf-8?B?OHRhbzlvdXdrZGgzUnBlczk2UDNFRzlxaW9kVjZKdmdBclRmYkZhWnJyRmZF?=
 =?utf-8?B?Vms3VFJxekpSc2lUUStHOVA2YUJTSjRnR3RzWmt6S0xsQ1NOVEV3MUorMGQ1?=
 =?utf-8?B?Tmp2Zm9rS2V3RkExd1JqVURBNUg1OHRqNkx6QlNMdGpIQlZqMnQ4UzY3Tmxu?=
 =?utf-8?B?OWdtdGhFZnR5TDJZeWE0ejFkNlFxOURrOU1tVmhnemZvQVRKUXc0eFVlUGVY?=
 =?utf-8?B?Q2tlK0Q3SCs5ZTNYODRXQXdld1ZCU2lBZjkxZk5WTU0zM3lYWWoyWjFUcnVi?=
 =?utf-8?B?aFlrSm1qNXpobFFSa1VNRVBmRUZwMlhwZVJmRU00TmlxdStTVjloQVh3WUNp?=
 =?utf-8?B?TlVLU0V4UzV1NFYzRG0wQ1FDdUVBTmZFQnNOSVFaTVR4T01zMFFKTjJqMk56?=
 =?utf-8?B?b21sM3pYblU5LzdycnJaRGkrSlZUcFRaMWg1aUo3QXlJQ2ZOMytXM0Q2SnM3?=
 =?utf-8?B?ZnJxeWZxckIvSXFVUlpYbW5NRFg3ZmhBWmNvd09yVU4rUzVZc0pjV0hMTFlM?=
 =?utf-8?B?UHNYWkRBMHRqN3phZmhRV1BFSzdJWnJOT2ZKM1A0Zk9BemVpbi9iNVN3SkNk?=
 =?utf-8?B?SklmN1hVeGMwVGdFdzQyM290dmtta3FBd3ZUVC9uRlhJMmltbGdOdlpLS0NO?=
 =?utf-8?B?NWoyMGJFQ1UyU0ZwT2M2TUNYbkl4NWlHNm1hczVWM05GeFpGMmxvckY4Y0tt?=
 =?utf-8?B?WG9PYTh1NjBIdEt0Z2c0a0hzZXNMRGpPREwzRVpubWdqL2RiU2tZb2VvcXg1?=
 =?utf-8?B?cEJVeFMxQWhUY0o2aE4xMDcvOTNTZGcvUEx0Q3E4U1hIR1AwYll1SzFJTXNk?=
 =?utf-8?B?OEtKdktrQjljVzlqVDhRMXh2SWdhbTJZK3lUc2IvZnRSMXVDc0NsZWNpV2Vj?=
 =?utf-8?B?YkhrSWhSU2U3STlNQWNKVFkzVWlNV2NROXRVYVFqVDhqUmp2OFAwejUyWWpR?=
 =?utf-8?B?T1lSbndZM3dKbk4yb0xhRjVHWUYrQW9BeERFRXJqdVFPTytUTGVSdXZBdzZx?=
 =?utf-8?B?WUxPL1hsem5VdGVES01vdk9jRllRbXBXaG5NdlM0RWpEYlBZejhPYytYVHhY?=
 =?utf-8?B?K2UrTVBReEpNdk9wZGRnZHNsd25NVEQwTTFOemp2b2h6Z3JEVmozSHZtZkk4?=
 =?utf-8?B?Vm5jMGVvS0U1ak1WdlBkWGdHbXo3aHd6YXhueHBXMG5ldUhTeFl5aEVLT1lI?=
 =?utf-8?B?bEYxVlpHRkVGUUh5VGlpeGE3UzNLd3NIRkoxZ2VzS1NFd0lVQVYwNTBHdHpI?=
 =?utf-8?B?SDgzN1U4elRGemZUK1NLZ3h6RHphWEpvVjF5SWtMSElSaUM5eDY2UFhmcnN3?=
 =?utf-8?B?eDFuaFNjV1ZOT2JpZzlmb1Z3cUtsOWF2QkNBOVJncExRRVdrWGpCSjhtOFE3?=
 =?utf-8?B?RVJpbjl2cUhuL2tzR2U4U2hOY2xwU3FPNTVoNGlYSUM2aysxWmdTWHdUQzVz?=
 =?utf-8?B?L2h2QUIrVy84YjJjV0NBdkhrUHNabjI4eEJjWm9Ba3RWY2pnVlZnOHY4d2Q5?=
 =?utf-8?B?ZXpnNVBtMlIrKzFGblR2elJJZXNYTnpPRkVwdSt4WWdaVVhkaWpjZUdjRjNE?=
 =?utf-8?B?SG5ZdVhTZlJ6ZkQ4dFJvQnhxanBSMzZaZS8weFNLNWtWeVhvMFhnK0dSelZq?=
 =?utf-8?B?ckE9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: zLjDBbPioQm16uWP8h52c3BVF/5GCeVHpMCsyVHFKFfSIEd+Uzxfo2hobDOqAbbeefMn+FGPvlL5fChbLsEIywMo0SZULxL4NcFFcJoNsgRQC9FUsDrMlNrGRGWiJHPYnh6SGjNehqp827VZhXAvnCLQo2Yrd85lIMp+Jh9rGMkLLokPbhHVkPCXWOk6iNBRjt9i4ThFyJLvaYMqv6GeNYk8fAzmlIjdrENvvsvl3qObgJ822r+AubSEsG/jCvTuwM17GNcoPSpbS0OUSuihw6aw69OpwJqubR51LAtNF5iwNpUU5xbVOr2HzHmV7LTpgrypGLMfYrrfLgygIG4Sr/p8tv1LsfRsFpqDvWquwg8IOHrfZsIJfP7oUgxwhgkhVOqvGdBD29VnLz2faH5U7iUaJilfJfDXnuWsTs8Ks2MjT+OFMR18MiTnpweRTRe1vP1qtmC3xjh+Mrt8QjIwS7bHMFgfU+E5VnjdDCGtftxb7dUsWFDPx1ySsBQBIG2M86PaEo6BsUzLvclvdKWZMMF8u2Y8qQD6962qS74asjq0HOtAUK/BoNiepuiZeNCQ6J70WcIiSJbG24sT+A8T7+TNBu0OBs48s1z5TDW5d3MBPsiugioVQzj38BueSLA+VBjjevwBEvSnQZcb55mVj456/Sc5o+P50lkBjoD/M7TtGn5wKVlfFK+xTf4JgE+AfnCpUimLYrTj1LFvDKJWrl0lcDdxwhY6RPzbk40M1SDzZBX/NlOvIjfMFgjJJ9g0msFcpjLGbzTk5NyapSnPsyYGvhbAKoghdiq5Sq8adC00np+Y3BtOP2MfN/x5p02A
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c709236c-9543-4488-3f4c-08db1f056c13
X-MS-Exchange-CrossTenant-AuthSource: BLAPR10MB4835.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Mar 2023 12:13:55.3117 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 07mwTo2bru+WS8Xu/dWYpOCUBOleyRqLaMv5rt0lS8/NiGvND/GUMUursq/BcHFNoLjc6yINbJdyQUPg/Yd+iGBi9UnoC6rGRF3SbQ5guws=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN0PR10MB4919
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-03-07_06,2023-03-07_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0
 phishscore=0 malwarescore=0
 mlxlogscore=999 bulkscore=0 mlxscore=0 adultscore=0 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2212070000
 definitions=main-2303070110
X-Proofpoint-GUID: rSWqxKaLIRg-oB8b946QfoeLsZBeSmYG
X-Proofpoint-ORIG-GUID: rSWqxKaLIRg-oB8b946QfoeLsZBeSmYG
Received-SPF: pass client-ip=205.220.177.32;
 envelope-from=joao.m.martins@oracle.com; helo=mx0b-00069f02.pphosted.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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



On 07/03/2023 10:16, Joao Martins wrote:
> On 07/03/2023 02:57, Alex Williamson wrote:
>> On Tue,  7 Mar 2023 02:02:52 +0000
>> Joao Martins <joao.m.martins@oracle.com> wrote:
>>
>>> According to the device DMA logging uAPI, IOVA ranges to be logged by
>>> the device must be provided all at once upon DMA logging start.
>>>
>>> As preparation for the following patches which will add device dirty
>>> page tracking, keep a record of all DMA mapped IOVA ranges so later they
>>> can be used for DMA logging start.
>>>
>>> Signed-off-by: Avihai Horon <avihaih@nvidia.com>
>>> Signed-off-by: Joao Martins <joao.m.martins@oracle.com>
>>> ---
>>>  hw/vfio/common.c              | 76 +++++++++++++++++++++++++++++++++++
>>>  hw/vfio/trace-events          |  1 +
>>>  include/hw/vfio/vfio-common.h | 13 ++++++
>>>  3 files changed, 90 insertions(+)
>>>
>>> diff --git a/hw/vfio/common.c b/hw/vfio/common.c
>>> index 3a6491dbc523..a9b1fc999121 100644
>>> --- a/hw/vfio/common.c
>>> +++ b/hw/vfio/common.c
>>> @@ -1334,11 +1334,87 @@ static int vfio_set_dirty_page_tracking(VFIOContainer *container, bool start)
>>>      return ret;
>>>  }
>>>  
>>> +static void vfio_dirty_tracking_update(MemoryListener *listener,
>>> +                                       MemoryRegionSection *section)
>>> +{
>>> +    VFIODirtyRanges *dirty = container_of(listener, VFIODirtyRanges, listener);
>>> +    VFIODirtyTrackingRange *range = &dirty->ranges;
>>> +    hwaddr max32 = UINT32_MAX - 1ULL;
>>
>> The -1 is wrong here, UINT32_MAX is (2^32 - 1)
>>
> Ugh, what a distraction.
> 
> The reason it worked in my tests is because there's a whole at the boundary,
> being off by one wouldn't change the end range.
> 
>>> +    hwaddr iova, end;
>>> +
>>> +    if (!vfio_listener_valid_section(section) ||
>>> +        !vfio_get_section_iova_range(dirty->container, section,
>>> +                                     &iova, &end, NULL)) {
>>> +        return;
>>> +    }
>>> +
>>> +    /*
>>> +     * The address space passed to the dirty tracker is reduced to two ranges:
>>> +     * one for 32-bit DMA ranges, and another one for 64-bit DMA ranges.
>>> +     * The underlying reports of dirty will query a sub-interval of each of
>>> +     * these ranges.
>>> +     *
>>> +     * The purpose of the dual range handling is to handle known cases of big
>>> +     * holes in the address space, like the x86 AMD 1T hole. The alternative
>>> +     * would be an IOVATree but that has a much bigger runtime overhead and
>>> +     * unnecessary complexity.
>>> +     */
>>> +    if (iova < max32 && end <= max32) {
>>
>> Nit, the first test is redundant, iova is necessarily less than end.
>>
> 
> I'll delete it.
> 
>>> +        if (range->min32 > iova) {
>>> +            range->min32 = iova;
>>> +        }
>>> +        if (range->max32 < end) {
>>> +            range->max32 = end;
>>> +        }
>>> +        trace_vfio_device_dirty_tracking_update(iova, end,
>>> +                                    range->min32, range->max32);
>>> +    } else {
>>> +        if (!range->min64 || range->min64 > iova) {
>>
>> The first test should be removed, we're initializing min64 to a
>> non-zero value now, so if it's zero it's been set and we can't
>> de-prioritize that set value.
>>
> Distraction again, I am sure I removed all. and the test is pretty useless as
> this will never be true.
> 

Meanwhile I rewrote that as below for readability. I have one level off of
indentation, and it reads better to me with less repetition of checks.
We select the min/max pair and apply it and update the tracking range.

diff --git a/hw/vfio/common.c b/hw/vfio/common.c
index a03a2fdfafc5..2ba8fa9043d2 100644
--- a/hw/vfio/common.c
+++ b/hw/vfio/common.c
@@ -1329,8 +1329,7 @@ static void vfio_dirty_tracking_update(MemoryListener
*listener,
 {
     VFIODirtyRanges *dirty = container_of(listener, VFIODirtyRanges, listener);
     VFIODirtyTrackingRange *range = &dirty->ranges;
-    hwaddr max32 = UINT32_MAX - 1ULL;
-    hwaddr iova, end;
+    hwaddr iova, end, *min, *max;

     if (!vfio_listener_valid_section(section) ||
         !vfio_get_section_iova_range(dirty->container, section,
@@ -1349,26 +1348,17 @@ static void vfio_dirty_tracking_update(MemoryListener
*listener,
      * would be an IOVATree but that has a much bigger runtime overhead and
      * unnecessary complexity.
      */
-    if (iova < max32 && end <= max32) {
-        if (range->min32 > iova) {
-            range->min32 = iova;
-        }
-        if (range->max32 < end) {
-            range->max32 = end;
-        }
-        trace_vfio_device_dirty_tracking_update(iova, end,
-                                    range->min32, range->max32);
-    } else {
-        if (!range->min64 || range->min64 > iova) {
-            range->min64 = iova;
-        }
-        if (range->max64 < end) {
-            range->max64 = end;
-        }
-        trace_vfio_device_dirty_tracking_update(iova, end,
-                                    range->min64, range->max64);
+    min = (end <= UINT32_MAX) ? &range->min32 : &range->min64;
+    max = (end <= UINT32_MAX) ? &range->max32 : &range->max64;
+
+    if (*min > iova) {
+        *min = iova;
+    }
+    if (*max < end) {
+        *max = end;
     }

+    trace_vfio_device_dirty_tracking_update(iova, end, *min, *max);
     return;
 }

>>> +            range->min64 = iova;
>>> +        }
>>> +        if (range->max64 < end) {
>>> +            range->max64 = end;
>>> +        }
>>> +        trace_vfio_device_dirty_tracking_update(iova, end,
>>> +                                    range->min64, range->max64);
>>> +    }
>>> +
>>> +    return;
>>> +}
>>> +
>>> +static const MemoryListener vfio_dirty_tracking_listener = {
>>> +    .name = "vfio-tracking",
>>> +    .region_add = vfio_dirty_tracking_update,
>>> +};
>>> +
>>> +static void vfio_dirty_tracking_init(VFIOContainer *container,
>>> +                                     VFIODirtyRanges *dirty)
>>> +{
>>> +    memset(dirty, 0, sizeof(*dirty));
>>> +    dirty->ranges.min32 = UINT32_MAX;
>>> +    dirty->ranges.min64 = UINT64_MAX;
>>> +    dirty->listener = vfio_dirty_tracking_listener;
>>> +    dirty->container = container;
>>> +
>>
>> I was actually thinking the caller would just pass
>> VFIODirtyTrackingRange and VFIODirtyRanges would be allocated on the
>> stack here, perhaps both are defined private to this file, but this
>> works and we can refine later if we so decide.  Thanks,
>>
> OK, I see what you mean. Since I have to respin v5, I'll fix this.
> 

I've done this, and made the declarations private (using Cedric's naming
suggestions).

>>
>>> +    memory_listener_register(&dirty->listener,
>>> +                             container->space->as);
>>> +
>>> +    /*
>>> +     * The memory listener is synchronous, and used to calculate the range
>>> +     * to dirty tracking. Unregister it after we are done as we are not
>>> +     * interested in any follow-up updates.
>>> +     */
>>> +    memory_listener_unregister(&dirty->listener);
>>> +}
>>> +
>>>  static void vfio_listener_log_global_start(MemoryListener *listener)
>>>  {
>>>      VFIOContainer *container = container_of(listener, VFIOContainer, listener);
>>> +    VFIODirtyRanges dirty;
>>>      int ret;
>>>  
>>> +    vfio_dirty_tracking_init(container, &dirty);
>>> +
>>>      ret = vfio_set_dirty_page_tracking(container, true);
>>>      if (ret) {
>>>          vfio_set_migration_error(ret);
>>> diff --git a/hw/vfio/trace-events b/hw/vfio/trace-events
>>> index 669d9fe07cd9..d97a6de17921 100644
>>> --- a/hw/vfio/trace-events
>>> +++ b/hw/vfio/trace-events
>>> @@ -104,6 +104,7 @@ vfio_known_safe_misalignment(const char *name, uint64_t iova, uint64_t offset_wi
>>>  vfio_listener_region_add_no_dma_map(const char *name, uint64_t iova, uint64_t size, uint64_t page_size) "Region \"%s\" 0x%"PRIx64" size=0x%"PRIx64" is not aligned to 0x%"PRIx64" and cannot be mapped for DMA"
>>>  vfio_listener_region_del_skip(uint64_t start, uint64_t end) "SKIPPING region_del 0x%"PRIx64" - 0x%"PRIx64
>>>  vfio_listener_region_del(uint64_t start, uint64_t end) "region_del 0x%"PRIx64" - 0x%"PRIx64
>>> +vfio_device_dirty_tracking_update(uint64_t start, uint64_t end, uint64_t min, uint64_t max) "section 0x%"PRIx64" - 0x%"PRIx64" -> update [0x%"PRIx64" - 0x%"PRIx64"]"
>>>  vfio_disconnect_container(int fd) "close container->fd=%d"
>>>  vfio_put_group(int fd) "close group->fd=%d"
>>>  vfio_get_device(const char * name, unsigned int flags, unsigned int num_regions, unsigned int num_irqs) "Device %s flags: %u, regions: %u, irqs: %u"
>>> diff --git a/include/hw/vfio/vfio-common.h b/include/hw/vfio/vfio-common.h
>>> index 87524c64a443..0f84136cceb5 100644
>>> --- a/include/hw/vfio/vfio-common.h
>>> +++ b/include/hw/vfio/vfio-common.h
>>> @@ -96,6 +96,19 @@ typedef struct VFIOContainer {
>>>      QLIST_ENTRY(VFIOContainer) next;
>>>  } VFIOContainer;
>>>  
>>> +typedef struct VFIODirtyTrackingRange {
>>> +    hwaddr min32;
>>> +    hwaddr max32;
>>> +    hwaddr min64;
>>> +    hwaddr max64;
>>> +} VFIODirtyTrackingRange;
>>> +
>>> +typedef struct VFIODirtyRanges {
>>> +    VFIOContainer *container;
>>> +    VFIODirtyTrackingRange ranges;
>>> +    MemoryListener listener;
>>> +} VFIODirtyRanges;
>>> +
>>>  typedef struct VFIOGuestIOMMU {
>>>      VFIOContainer *container;
>>>      IOMMUMemoryRegion *iommu_mr;
>>

