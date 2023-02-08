Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A92E768EF7F
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Feb 2023 14:06:45 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pPk8k-0000Kg-Q1; Wed, 08 Feb 2023 08:05:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <steven.sistare@oracle.com>)
 id 1pPk8h-0000Jz-D3
 for qemu-devel@nongnu.org; Wed, 08 Feb 2023 08:05:31 -0500
Received: from mx0a-00069f02.pphosted.com ([205.220.165.32])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <steven.sistare@oracle.com>)
 id 1pPk8d-0007d4-S6
 for qemu-devel@nongnu.org; Wed, 08 Feb 2023 08:05:30 -0500
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 318CxPon029179; Wed, 8 Feb 2023 13:05:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=message-id : date :
 subject : to : cc : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=corp-2022-7-12;
 bh=s1pt1cK7ezxY6vLGpOZ2vfQkKhECogE1N9hPEVj2ff4=;
 b=106FYgpS0mr+7Po5s/KI5ThDbvXvQBXHTUzv/SW839Lp4mH1L3U+MsnP4q0E/ZnqUgdW
 Ea1IH2QT5wyVL9qyBh6On3OkIWOqreZhxwG00cy8BwODN4LA+5+YcfOAwvnvN2aPCFjl
 GhmAej4ApXNJqMnrU4mjI1bpdZXcv4SWYi1n3WP1Gdyt3nFV4ImIFd2ESAUQIv0k1Gs5
 F7xjUcmWXSr+pjRzpntZBPcKT5FYuyTbHTYw4UOFgMl4yBFHQMg1Hi6aBfKcQlMsblZM
 4YDBV3+oed4MF5doRLShkLT9mPqu6kUJOFOAqiO0+I54SI4inMTuhqTgy8zSXTPhmYeE cA== 
Received: from phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com
 (phxpaimrmta01.appoci.oracle.com [138.1.114.2])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3nhfwu810v-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 08 Feb 2023 13:05:21 +0000
Received: from pps.filterd
 (phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
 by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (8.17.1.5/8.17.1.5)
 with ESMTP id 318AqmwS016115; Wed, 8 Feb 2023 13:05:21 GMT
Received: from nam04-mw2-obe.outbound.protection.outlook.com
 (mail-mw2nam04lp2176.outbound.protection.outlook.com [104.47.73.176])
 by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id
 3njrbbnsev-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 08 Feb 2023 13:05:21 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EPYT8atNsgbqmaAe2e8iEMY8w2PrnpNo7hI10i+xtTThj1I4YYTl+cYFwlqGGWGWZjLBpAkDu7kN40a799ZdhFEWB7ySK9ABfnrZOFN6wsADyHN5u2iDYzJZTRCDmlr7a8mw2cinP3iJ2XjfR0pK9ZxPQ/cRVYQgOMk1psTgilaL+LSaKZzDpdrwG8sIfKfkt5A2fZZdP3wvZDB/dVVZVNyVtNVcfcXa6FURZeF3hDLYGW537WU2vrpgtP/cn0CmnlxdwS11E/0Xv3oehz3bhIYNB2Vx1A0cZN+QHzjA0Al9DJVAtgse3k2nHPn5nZ5SnQPYtqogIrG3vuah/E4ZBA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=s1pt1cK7ezxY6vLGpOZ2vfQkKhECogE1N9hPEVj2ff4=;
 b=bzJAwJMQ1sRW7cFjT8f7rWLHkJ65ccQlPHbVqcbIT4mr06xyYWPhQuswNofXes41L7XXe0K5oRzge+gTRVhVVWpoEbe6Yf1NxnzHsOcHSMQ6/L3nR2SFixaJivS3LaYuejnjWB5KWTwHx9kNUSCYFsMfsgNluzwDXkmMR+CLDhrMOaVkriUJjwCSWnB0enldZc8iBLd8zU02/Ds5yV2c0xCeHWEH05Xu0ikDcW00V+8E1FGDszR/tKWbXZQsGGYOrhWBhKat0t7VI5pFtPKSzomLpprXmD0Kp2rGXzs1s6D2pR7k8Ir1hvoWC5RKACAFxV4MgRIDYhOw+ziIAvSBVw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=s1pt1cK7ezxY6vLGpOZ2vfQkKhECogE1N9hPEVj2ff4=;
 b=qQrBnCj0pMyS4mnfOFGtNjb4yf7r6IsJ4HsAl+0WbKpOYpVe7mZ2B+GfMWJqnbPEVAPD4QcwIt27w7E/+V5nR2MYJNgHsSeQ12jJTitqbAvc3VtmYo5prTun1SINuvUIItr2b6Naig3uKwuP3DwlK0p1ZOQaajxQxO3c1sSihM8=
Received: from SA2PR10MB4684.namprd10.prod.outlook.com (2603:10b6:806:119::14)
 by DM4PR10MB7527.namprd10.prod.outlook.com (2603:10b6:8:182::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6086.17; Wed, 8 Feb
 2023 13:05:18 +0000
Received: from SA2PR10MB4684.namprd10.prod.outlook.com
 ([fe80::ed27:2f6f:22b1:39c]) by SA2PR10MB4684.namprd10.prod.outlook.com
 ([fe80::ed27:2f6f:22b1:39c%9]) with mapi id 15.20.6086.017; Wed, 8 Feb 2023
 13:05:18 +0000
Message-ID: <32f34f74-213d-7107-907d-dda0a509878e@oracle.com>
Date: Wed, 8 Feb 2023 08:05:13 -0500
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH V2 1/4] qapi: strList_from_string
Content-Language: en-US
To: =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@gmail.com>
Cc: qemu-devel@nongnu.org, "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Michael Roth <michael.roth@amd.com>
References: <1675795727-235010-1-git-send-email-steven.sistare@oracle.com>
 <1675795727-235010-2-git-send-email-steven.sistare@oracle.com>
 <CAJ+F1CLFMUDvaOq2QXCKpb8Zj4PRr-tKV1q9L8m2EfgORPLj7A@mail.gmail.com>
From: Steven Sistare <steven.sistare@oracle.com>
Organization: Oracle Corporation
In-Reply-To: <CAJ+F1CLFMUDvaOq2QXCKpb8Zj4PRr-tKV1q9L8m2EfgORPLj7A@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BYAPR06CA0009.namprd06.prod.outlook.com
 (2603:10b6:a03:d4::22) To SA2PR10MB4684.namprd10.prod.outlook.com
 (2603:10b6:806:119::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA2PR10MB4684:EE_|DM4PR10MB7527:EE_
X-MS-Office365-Filtering-Correlation-Id: 11ae183b-916f-40ef-aba4-08db09d520be
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: baTcBugq8zWAmi08hRidAfJqlOS3RcLQNsTf+kb+QHxhmY+gHrA1Mz6yjFlD5yodUs2FM+N/hY9rNx3wTVtVRjdQyre8/+SHAemTf3PoKukwmWu/ZfVqPImhYZMOlkca9HYsHSAcCA2deZ2GKkIZwYW84QvNlO8a1qNNf2MsvUpjttbNi96jpRgyeDM4h/+x+9piWPLR46O9s4dUcb0F9sn5ofFGaMh5Er31EQQZHuqzch3FtQ3zH7LOigmxQZUTy/VJ8oM/5HUrBhXSsa8Evj/tXl/QXPvq8cWsBAjiFNRTGZgi5ihGdg9Xv3dQ0jDMfn1T9/gc62PLfp6QphjgARfbVeN52mqAeuYVHilx29Nkp05VnLz2H9+C0x2VoFbP3xbriW3BK7pGsnIdGPO8LtVR2FrKSGewFGIkv0jFP4m9Lnp7mS/y/w+4Cc4HCFVziHMSDGhwxH0l+ReTS8WrwbqxN5iIDpnCZoasDtTHq7WAl9Xu30cdpEM6JUfuwpJRQ78x18QzCBgKTCwisVEH2j1mE4g2b/JIoKtYfQrOu9MedaInsPB/yXbgvQlUNS8L2bj+ssiLLq8BdBriQsCe3Z6Vqnf7tJ5h9d4z3YJJvGVWxkw8q1PE5RUjjHkWdBGNdY8sXcvSNOUFqix+CMIZbpdQ8EytJUJtvni3wyUJMckUfO7yz374FeTNFXTrAz/p6sH6Zk8Q4jYyglC+lazLalEsG6rEcziXkm5hp24Fbtw=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA2PR10MB4684.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(376002)(346002)(39860400002)(396003)(366004)(136003)(451199018)(186003)(26005)(478600001)(6512007)(6666004)(44832011)(36916002)(6486002)(316002)(83380400001)(54906003)(31686004)(2616005)(53546011)(6506007)(66556008)(66946007)(6916009)(4326008)(41300700001)(5660300002)(38100700002)(8936002)(66476007)(8676002)(86362001)(31696002)(2906002)(36756003)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZCs3SDNESzJWMlJ4b2JCVDJJTnZGczdVbXpNZU4yMzlkRy9QZFlRRk8rYkZC?=
 =?utf-8?B?a1h6SXBDWjZUSE5FMjh5Zmh4NWJjV2JXMXBKaXJpb0ZubzlnSi9TV1Ira2lR?=
 =?utf-8?B?MVlYUUIybXoxRS9IY3dMcktJOFE1Q0J6VVZieWNhbG5rUHVzdThucEl5cTBP?=
 =?utf-8?B?V2FhdjJWMXR5b1Z1TlRTejlSTUtlWnFiUmRSZW5LQ24vYlVNREQybnV5Mm5m?=
 =?utf-8?B?eml4NHVRaHpuQ3JOVmJva0NvZ1Z5MkR5Q1I1eFNtZVQveFJMVEgrc2l5cVVL?=
 =?utf-8?B?RktkcGVsL2RySkUwT05rZ1NoNzVoR3VMeVphTXlubWY3eXZrRU9YbEpGTk1T?=
 =?utf-8?B?Wms2QUxwMTNYczFoZk4vSFpTakwwRGIrcU0xK2pOVjNDckRKYjNjNnRGazY0?=
 =?utf-8?B?cmhKaUhFNTVNTlNjbHZkWW54cTBVaGNsMW8vWXhoL25sTE1hMUFMQ0FWTDVV?=
 =?utf-8?B?SFp0Q3d3RWkrckd6WXdVMGp6WlRLY3hxbENjQWhIdi9OTGtaN3NiZ1d6c1NL?=
 =?utf-8?B?Mi85Z3RZcDVqa1FzODBYM2FjY3JRTUV3TmFRRkE2OERrS1NXOWQ1T3lCSEZj?=
 =?utf-8?B?VHNtWVQ4SklPVzRLVkRuN1JlajZRRlc5NUp6d2xqZUtXN3NmSFNGWG1MdXJy?=
 =?utf-8?B?MUhVVE03S3U1Y0sxUG8rUzYyWnVLaXBxSlFKK3Q1cjRmMUxBcDg1Rkg1eDZI?=
 =?utf-8?B?bk9CQnNlNXYrdHlkNTIxNjFNQVNVOTJUdWRDdld6VVhkZDdhN09DQTJmWmhY?=
 =?utf-8?B?OENmZFEzRGl6NnNxcmJ2TFhhVHNuMGpvOHdVekRWOXRTNnJaY2l3VmV2Ty9T?=
 =?utf-8?B?NjNQZEJTYTJuZ0FZejZQT3ZpaG9ncnhUS21ZZm1Ebm96MldWdjJ2V2VNbGxl?=
 =?utf-8?B?ekkvMDZLbDE0TzQrNWR1R2FlR3VRQUZ1Um9Semc5SVVmR3d5MmhwZ1hhKzBw?=
 =?utf-8?B?a0lENG90MVNtUEpGMm5VVEVWVmtIaXo3eDROczBRUUtud3B3NFljNFdFRGNm?=
 =?utf-8?B?czQ3dG1WdTJxamU4Y002Q29qUldEZVc5dVVkU0d4R3FhdWZuK040eUFxVWhx?=
 =?utf-8?B?NmtteXFJYnNYNHZOK0llS2o4TkYxM2NObnY3MmtIVllJSG9TUUc5SGRDNWRZ?=
 =?utf-8?B?M2N6NUVaUUUva3F0QnZpcHltYlJJN0lMZ243b3JDM0JxQTl5b3ltZnl2MmNS?=
 =?utf-8?B?S01ITE5IOXcwM3RGZ0Q4eWNGMWNsOXZqZzh4NUlUQjlHSitXcnpyNzcxY2tF?=
 =?utf-8?B?YlM0d3Q1VUVRa2NqdjJhMnhDVnhDZkR3UEE4VUIrVld4QTg0UlhSa2wrZG12?=
 =?utf-8?B?a1hJTGFnUWJYWUZTK3NVTytrUzZISGR3UUlQT2ZzdkwwbHkrS3RZRksxTjNK?=
 =?utf-8?B?Q1lhRDdVbllDQVJEUTEyUXlJcklJL2hKZndIZ2NUL0lVZWUvbkpFT0tkUXU1?=
 =?utf-8?B?bm9lYUxqK0kyRmRrMm9ab0NyVVdDZzdTc3hHcFh6UksweWFYTElBMk11MGN2?=
 =?utf-8?B?bHl1OGdWQzhoaXptWXRNZDIwUUJnRW9jTmpmaXdTRHRaa2VsN050SDZSampY?=
 =?utf-8?B?b2ZOcjh2azZNM01RSStTM3VCRGdXWk9IeFZhd1dzaE1Na3crd2JOMStvaWtG?=
 =?utf-8?B?RHQvU2hIa0Z5VEtBbDd2YTF6aEdNNkxBanZRQjhvd1ZWZUt4Tkx2cmlBMVhn?=
 =?utf-8?B?ZkZtR2EwMkE4YXJhWmtHeWhhOGVndSt1bEFldktwM1BEeFI4TkFJNEZVY1o5?=
 =?utf-8?B?ZzBReDdKVzFCTlNyL2x6d1R3MG1YVE5mT0RRSkdQdGh2Nm1UZHB6QkF1bytw?=
 =?utf-8?B?RG9ieEpXSEQrWWxRZFBTaERadFB5UjdRaFo1NENlclk0NWwydGI1UFlNaFM5?=
 =?utf-8?B?Uy8vWXhsODgwai9zOEJKUFNuVk9yaXhuOWd5bXJUUER3dXVyYkpnc2NkS1A2?=
 =?utf-8?B?bW54cUFvU2JlTEJVNkhRZDJwemFMaVJxL3dLSmIwMDdFUFhVVEJtbTJIQmln?=
 =?utf-8?B?R2g1WkEzQ0tMakwrRThSams3RFRIVHJWbWVuSXdIUkVlNzVza1JZUUl6R3dB?=
 =?utf-8?B?SjBXS2luTzMrVExGUFF6Z3luQW8vVzEvUkF5dlhXdE9GOGZobWd1dlJWaVVL?=
 =?utf-8?B?WDRIR1kzcitTRm1xd0FZSm5iSUJ5cnB5WHNxRXpkYTJwdzlZdzRpUmZNLzZE?=
 =?utf-8?B?MlE9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: NCEUfdYEivWXqAcXS0LXSnHedNNq5haOj/EoXfQI6OwdJTH4IhTyO3Knu0XBpKN9LjWHUdYWGBVlut1oYofL+0/yDZ20yq8cOG+7vVpMI+uT9Zq2pWB2wITqL+mAB1KKwkOxBf8QCc+6LU4Tv9+mPtDVrbMonlMH8pyhU/xf6DVSVvJ+gw+IGASHwBGKpem9vTolV3zVFekd8WISd4gSwrOOZ06Jt1wGavxZCYCR6gCXY8SYJie69xtHabd0f5GYv3N6xA1H52Ls9ONl5deSoBsOoxuyUtKU+XUzGFCC31ocn8Vsl5J/DOpDgmJrcd00w/9vTu1fVQRFT82Hdgel+LAawJkg3a21uYrIz/Y8eUTEca2sVgte5rL9P7vD3W4oQ8jVAn4sLb96UgVua9ZKbr0hJT5G6JaYgtKc4z7w07eTui3QeruYcmQ0l8F9iETRy4cxfo8Ck8gMbiVTaCQEguFmbfiwJJf7kp47sNTIzpn3mgDfpnZQwg4Kpdcg81gmbMq/ZOAG7GXyhFl/yScvwGX+ggCfR0MOMz9l559FVdvaP7TuqPmxPWUG9emRT7+dMGYXk4au5e+NPoyF+F8qUA8Vjrd3zeNl1Gvhd1K+1+hETfCxWU49nENze9a5EA8P78+V2wxBC5IDR6Fp/naDJPUzFexxXZKrIjJseAAd+N1TgAvO6BqxfOX7Ah6f6ESVcKpyWgKP7yCMoB06Yk50mHHhwPgWm5ARCg9iYCEdnKtv1KhyDLx0xqWyuHamXhcnYC+71o9wJ0PkS/b4/2OaHgIlM5R3J4BJoBckZclVqmxIEeuOjuzjq3kGsaYh58vb
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 11ae183b-916f-40ef-aba4-08db09d520be
X-MS-Exchange-CrossTenant-AuthSource: SA2PR10MB4684.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Feb 2023 13:05:18.6670 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: a/svGM9oYLZpUeTpOWzyYUjwCEeoJCDORglynEsjodHhbMTw3acydY/VXKHdQjJ1dsyZz6Lz0JF3tuiMiNTLCnGW6Jir0Vk/FGxHV9xEE4Y=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR10MB7527
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.122.1
 definitions=2023-02-08_04,2023-02-08_02,2022-06-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0
 phishscore=0 spamscore=0
 malwarescore=0 suspectscore=0 mlxscore=0 mlxlogscore=999 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2212070000
 definitions=main-2302080116
X-Proofpoint-GUID: c-gwahJ-G7zKMo9IRzw4dQDwbE6dhBCY
X-Proofpoint-ORIG-GUID: c-gwahJ-G7zKMo9IRzw4dQDwbE6dhBCY
Received-SPF: pass client-ip=205.220.165.32;
 envelope-from=steven.sistare@oracle.com; helo=mx0a-00069f02.pphosted.com
X-Spam_score_int: -38
X-Spam_score: -3.9
X-Spam_bar: ---
X-Spam_report: (-3.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.146,
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

On 2/8/2023 1:43 AM, Marc-André Lureau wrote:
> Hi
> 
> On Tue, Feb 7, 2023 at 10:50 PM Steve Sistare <steven.sistare@oracle.com> wrote:
>>
>> Generalize hmp_split_at_comma() to take any delimiter character, rename
>> as strList_from_string(), and move it to qapi/util.c.
>>
>> No functional change.
> 
> The g_strsplit() version was a bit simpler, but if you want to
> optimize it a bit for 1 char delimiter only, ok.
> 
> Reviewed-by: Marc-André Lureau <marcandre.lureau@redhat.com>

Yes, and it saves a malloc+free for the array.  Small stuff, but I
thought it worth a few lines of code.  Thanks for the speedy review!

- Steve

>> Signed-off-by: Steve Sistare <steven.sistare@oracle.com>
>> ---
>>  include/monitor/hmp.h  |  1 -
>>  include/qapi/util.h    |  9 +++++++++
>>  monitor/hmp-cmds.c     | 19 -------------------
>>  net/net-hmp-cmds.c     |  2 +-
>>  qapi/qapi-util.c       | 23 +++++++++++++++++++++++
>>  stats/stats-hmp-cmds.c |  2 +-
>>  6 files changed, 34 insertions(+), 22 deletions(-)
>>
>> diff --git a/include/monitor/hmp.h b/include/monitor/hmp.h
>> index 2220f14..e80848f 100644
>> --- a/include/monitor/hmp.h
>> +++ b/include/monitor/hmp.h
>> @@ -19,7 +19,6 @@
>>
>>  bool hmp_handle_error(Monitor *mon, Error *err);
>>  void hmp_help_cmd(Monitor *mon, const char *name);
>> -strList *hmp_split_at_comma(const char *str);
>>
>>  void hmp_info_name(Monitor *mon, const QDict *qdict);
>>  void hmp_info_version(Monitor *mon, const QDict *qdict);
>> diff --git a/include/qapi/util.h b/include/qapi/util.h
>> index 81a2b13..7d88b09 100644
>> --- a/include/qapi/util.h
>> +++ b/include/qapi/util.h
>> @@ -22,6 +22,8 @@ typedef struct QEnumLookup {
>>      const int size;
>>  } QEnumLookup;
>>
>> +struct strList;
>> +
>>  const char *qapi_enum_lookup(const QEnumLookup *lookup, int val);
>>  int qapi_enum_parse(const QEnumLookup *lookup, const char *buf,
>>                      int def, Error **errp);
>> @@ -31,6 +33,13 @@ bool qapi_bool_parse(const char *name, const char *value, bool *obj,
>>  int parse_qapi_name(const char *name, bool complete);
>>
>>  /*
>> + * Produce a strList from the character delimited string @in.
>> + * All strings are g_strdup'd.
>> + * A NULL or empty input string returns NULL.
>> + */
>> +struct strList *strList_from_string(const char *in, char delim);
>> +
>> +/*
>>   * For any GenericList @list, insert @element at the front.
>>   *
>>   * Note that this macro evaluates @element exactly once, so it is safe
>> diff --git a/monitor/hmp-cmds.c b/monitor/hmp-cmds.c
>> index 34bd8c6..9665e6e 100644
>> --- a/monitor/hmp-cmds.c
>> +++ b/monitor/hmp-cmds.c
>> @@ -39,25 +39,6 @@ bool hmp_handle_error(Monitor *mon, Error *err)
>>      return false;
>>  }
>>
>> -/*
>> - * Split @str at comma.
>> - * A null @str defaults to "".
>> - */
>> -strList *hmp_split_at_comma(const char *str)
>> -{
>> -    char **split = g_strsplit(str ?: "", ",", -1);
>> -    strList *res = NULL;
>> -    strList **tail = &res;
>> -    int i;
>> -
>> -    for (i = 0; split[i]; i++) {
>> -        QAPI_LIST_APPEND(tail, split[i]);
>> -    }
>> -
>> -    g_free(split);
>> -    return res;
>> -}
>> -
>>  void hmp_info_name(Monitor *mon, const QDict *qdict)
>>  {
>>      NameInfo *info;
>> diff --git a/net/net-hmp-cmds.c b/net/net-hmp-cmds.c
>> index 41d326b..30422d9 100644
>> --- a/net/net-hmp-cmds.c
>> +++ b/net/net-hmp-cmds.c
>> @@ -72,7 +72,7 @@ void hmp_announce_self(Monitor *mon, const QDict *qdict)
>>                                              migrate_announce_params());
>>
>>      qapi_free_strList(params->interfaces);
>> -    params->interfaces = hmp_split_at_comma(interfaces_str);
>> +    params->interfaces = strList_from_string(interfaces_str, ',');
>>      params->has_interfaces = params->interfaces != NULL;
>>      params->id = g_strdup(id);
>>      qmp_announce_self(params, NULL);
>> diff --git a/qapi/qapi-util.c b/qapi/qapi-util.c
>> index 63596e1..b61c73c 100644
>> --- a/qapi/qapi-util.c
>> +++ b/qapi/qapi-util.c
>> @@ -15,6 +15,7 @@
>>  #include "qapi/error.h"
>>  #include "qemu/ctype.h"
>>  #include "qapi/qmp/qerror.h"
>> +#include "qapi/qapi-builtin-types.h"
>>
>>  CompatPolicy compat_policy;
>>
>> @@ -152,3 +153,25 @@ int parse_qapi_name(const char *str, bool complete)
>>      }
>>      return p - str;
>>  }
>> +
>> +strList *strList_from_string(const char *in, char delim)
>> +{
>> +    strList *res = NULL;
>> +    strList **tail = &res;
>> +
>> +    while (in && in[0]) {
>> +        char *next = strchr(in, delim);
>> +        char *value;
>> +
>> +        if (next) {
>> +            value = g_strndup(in, next - in);
>> +            in = next + 1; /* skip the delim */
>> +        } else {
>> +            value = g_strdup(in);
>> +            in = NULL;
>> +        }
>> +        QAPI_LIST_APPEND(tail, value);
>> +    }
>> +
>> +    return res;
>> +}
>> diff --git a/stats/stats-hmp-cmds.c b/stats/stats-hmp-cmds.c
>> index 531e35d..4a2adf8 100644
>> --- a/stats/stats-hmp-cmds.c
>> +++ b/stats/stats-hmp-cmds.c
>> @@ -174,7 +174,7 @@ static StatsFilter *stats_filter(StatsTarget target, const char *names,
>>              request->provider = provider_idx;
>>              if (names && !g_str_equal(names, "*")) {
>>                  request->has_names = true;
>> -                request->names = hmp_split_at_comma(names);
>> +                request->names = strList_from_string(names, ',');
>>              }
>>              QAPI_LIST_PREPEND(request_list, request);
>>          }
>> --
>> 1.8.3.1
>>
>>
> 
> 

