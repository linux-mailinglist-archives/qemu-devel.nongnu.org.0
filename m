Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 398D268F83E
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Feb 2023 20:44:14 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pPqLx-0005rF-E9; Wed, 08 Feb 2023 14:43:37 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <steven.sistare@oracle.com>)
 id 1pPqLk-0005lA-Sp
 for qemu-devel@nongnu.org; Wed, 08 Feb 2023 14:43:26 -0500
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <steven.sistare@oracle.com>)
 id 1pPqLg-0000aS-S2
 for qemu-devel@nongnu.org; Wed, 08 Feb 2023 14:43:23 -0500
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 318Hx22R024836; Wed, 8 Feb 2023 19:43:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=message-id : date :
 subject : to : cc : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=corp-2022-7-12;
 bh=5SUfv6GPWULu8xCa1JVOMAzlWcRqZWxtJ8YkrLCb99Y=;
 b=o/sbVuK5qrDM6zymcRtehdYKJr9xezcf4FLcvSPmF2XiH6eK6aO2elBhg/Mc4+bG6UvC
 ZkzzK1IVoxlijF3+DT6EGiUS6VpnAGdca3ukCNu88fB3qACA9Ew4FTpnLANZz6KB8dN9
 vV7hZCFPdYF0azKU4QUEWYK+V7pywrJ8nnwQqvn0mrfcuKR6pt+tRL6WyEDfv0QM6uyz
 FPeqYexGTD72CyHd4ZiXKOFj3UU9jjQXq+DvmL6NEZClxAITvox3Fd0Rg6ew9rGNyaUy
 7uaxkt+bytJB0qcnY9vK0rblo+vxWmIv5YOIgzAeTOwu+S5B0aWppJhKJYA+4bR1jw5l Ag== 
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com
 (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3nhe53h4sp-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 08 Feb 2023 19:43:05 +0000
Received: from pps.filterd
 (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
 by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.17.1.5/8.17.1.5)
 with ESMTP id 318Ja0Uv036374; Wed, 8 Feb 2023 19:43:05 GMT
Received: from nam04-mw2-obe.outbound.protection.outlook.com
 (mail-mw2nam04lp2169.outbound.protection.outlook.com [104.47.73.169])
 by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id
 3nhdteqp7g-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 08 Feb 2023 19:43:05 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OCrxUFTwB9cfQCkAvkCbleJw6XBF2/MJradlEkLZlLvJJWbri+h/T4nJytZxjy7yiALBqNyeD7AD/n8DR+B4M+dmbjUkLgcMjU+wmBi9BxboNLSVawQzGCbY5R5G9lZ7SeZvx86aDocD7M8fyV8YV9q4SICkULoWdqCyRL3Oumy6seOfIGvoEGcxuyuq7/J+KVir3CyY2JeQyg4M472jsjDjej27J1ilCdMA4lt8ZnKbBLV9Uv52ZBszTd8Wuc9/rcszW2GyK8yQbB9ILTm1LD5ZD8L85NH6vQn5jk8yIQWbRF/aaQP8BE8giVN+KU9H9M0mPvDBlhx5ywYkmpG/HA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5SUfv6GPWULu8xCa1JVOMAzlWcRqZWxtJ8YkrLCb99Y=;
 b=I+pWvNbLUhYRZGgwbzfaAq1m+KxOwVelCCZ/RSKJb5gaipgribgKzbKCOViwNb9YYYSODIb1Ef16sQDtmuVWVCVkgUwum8KtFQSMd7YYFcAsUoaE2hvj00mldmx7yLFRrAHhUZKbx4X/LxVYoCaVkFaDUKch0bpe0sQue/vJEb9ukpIQt44xkpNQOV26uDBdQhKpWR4F2LyzwfkNHRE8FKVfK4+XL5e/LSPaR8mo/at+3xE8KmDImbQ6qyPY5o7J51H/xLP0iUvrwYds9Ex6mkRxc5hLRqRKsabyCjFBvQ4gozswzhH4b5CHG/BfeR9V6+nndLSR0XEoNx6zRCzF8A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5SUfv6GPWULu8xCa1JVOMAzlWcRqZWxtJ8YkrLCb99Y=;
 b=LTLCZn5Uv9wUvvdjhYMdQ34SGaPajj4O2fSCavae9ak3qTHigRL5XetcttnaUz9qb9nUXd/JPDaFD9fdG8Om3k7BOCbf7pFMB/nfRKNjpQ+6HDexVz6WVnHOMDsmQuneSOMDlIKU5/kYa9VZqLKK+tFajfEPIXGKZouadUBh7/Q=
Received: from SA2PR10MB4684.namprd10.prod.outlook.com (2603:10b6:806:119::14)
 by SJ1PR10MB5977.namprd10.prod.outlook.com (2603:10b6:a03:488::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6086.15; Wed, 8 Feb
 2023 19:43:02 +0000
Received: from SA2PR10MB4684.namprd10.prod.outlook.com
 ([fe80::ed27:2f6f:22b1:39c]) by SA2PR10MB4684.namprd10.prod.outlook.com
 ([fe80::ed27:2f6f:22b1:39c%9]) with mapi id 15.20.6086.017; Wed, 8 Feb 2023
 19:43:02 +0000
Message-ID: <96dd803d-89b1-1679-a7bb-6edd4a74a76a@oracle.com>
Date: Wed, 8 Feb 2023 14:42:59 -0500
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH V2 1/4] qapi: strList_from_string
Content-Language: en-US
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
Cc: =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@gmail.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Markus Armbruster <armbru@redhat.com>,
 Michael Roth <michael.roth@amd.com>, qemu-devel@nongnu.org
References: <1675795727-235010-1-git-send-email-steven.sistare@oracle.com>
 <1675795727-235010-2-git-send-email-steven.sistare@oracle.com>
 <CAJ+F1CLFMUDvaOq2QXCKpb8Zj4PRr-tKV1q9L8m2EfgORPLj7A@mail.gmail.com>
 <32f34f74-213d-7107-907d-dda0a509878e@oracle.com> <87h6vwnstx.fsf@linaro.org>
From: Steven Sistare <steven.sistare@oracle.com>
Organization: Oracle Corporation
In-Reply-To: <87h6vwnstx.fsf@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SA9P223CA0007.NAMP223.PROD.OUTLOOK.COM
 (2603:10b6:806:26::12) To SA2PR10MB4684.namprd10.prod.outlook.com
 (2603:10b6:806:119::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA2PR10MB4684:EE_|SJ1PR10MB5977:EE_
X-MS-Office365-Filtering-Correlation-Id: 05216bfe-eb97-40a1-8f0c-08db0a0cb0b8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: CMH7fvCSOl+pTCug3It9BK4rgzyq22itsbe1C2WCTCWu9ppYdGzbgqQGwXwIs8OExKDyUIL4AVlcpyDOB+KK1QQpinvHL+W47KXXK6Zulh23oH4KUiyE1uLB/kbC+auV17zXy0waHML0aLjUBoJP+/yS8tWosWXw0KwEozAiiM7FoGUaKCDhkgjt5Z/Q0Co2LW1zrjzkkgBg5KSBXx65rVkiGNk6aMr6jjiZ5ibUy1Gl8jjuDtS9FWDPxQy5f/XwayVd8ZfLVlyRd+lEuio7tD/DlXbrS02P49Jy6vUg9gAcSkpRxFyUC11nRj64SLoWhz9UxG9zeBIAQAaW0t0y9XybYcIjSayNFJ59NU+2+EGZLfkPpH20QsrBRSHXq7IaSOMwQyN43MNEsdhxIveyOkpF8AM6sd8deSz8WRtdjQ2Umao+FquLx6AdFm9XuUjbz/0a7EwWskjmFsEOdr/hHLKfnckfGL6og8sCZxdBPtD/9pp4qCSQbDGkAPmwJ1L/Q00cbx8warOatRV2Z4mrhg9vuwLCnCNZd+Wj6EQPvFYuPA2oUp0Ym9zM6DQ+iLIm051wH+Ih5wgoIt5MHn0ObI6aNxmJTRgcArbXNI+z/TbkBANOJ3SqJXzEXifR9YZxFFb6mi3dDUzKirVnt4VfNJ4XlLCDJRc6MWl9+l1VU6LSSc+989MiqwfTg9stJJx0NsqHffVNXf4oHNmOV9+FxLhVfTf03Gt7L2iWSbWB/rI=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA2PR10MB4684.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(396003)(376002)(366004)(346002)(39860400002)(136003)(451199018)(53546011)(6506007)(478600001)(6486002)(26005)(186003)(6512007)(36916002)(2616005)(31686004)(6666004)(66574015)(316002)(83380400001)(54906003)(66476007)(66946007)(66556008)(38100700002)(8676002)(6916009)(4326008)(2906002)(36756003)(8936002)(41300700001)(44832011)(86362001)(31696002)(5660300002)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?eW5QM1Yyc0JoMHBNbFFFV2t3V0ExWDgwaXdIaHJvNnZ6ZWZ1dzFpNGE5bHJn?=
 =?utf-8?B?d2RTbGZPN2hQd2R5M29xa2g0TVN6Mm9rYTFvSUczMXhFZUJzU1FsZVZwdlJE?=
 =?utf-8?B?RC9oNVdTQWJiL1JRNHdIcnpDYU9LSzQyQWlndVFDYzQyK3AvZHhjTkRJM0l6?=
 =?utf-8?B?eFdPWjNrMHJpamhiOElVb09jd0pJMFo2REJaaXZJeWhYbWlYVU8wVkIrdFFj?=
 =?utf-8?B?MG9sS25wZlNLYitQb3ZJU3Iydko2akJuWGhMY1A4OTBEdGI4dGcvZ1ZTb2Qz?=
 =?utf-8?B?c3dTWkhGb3hSMUNEQ3Zzc3lQWUFvb2FTOHhpQ3VHclAvbUtuRXNBSllyQlA3?=
 =?utf-8?B?dlFNMlA4QkltUnlJTHBZWUl6T0M1RUxBVEtCTVBCbVZUVVRJWTA4L29jNXA1?=
 =?utf-8?B?NGhWOEVmamdVRU1CZFhScTQ1U0puNkZ2bnYwZVhsTlRmdVhHNUN3WC8vejlS?=
 =?utf-8?B?UjlxYnFEM1ZrdWlaZXdCUEtHdmtyNUg0NExobHlhNnRIRjlucUJaTFZsTVA1?=
 =?utf-8?B?ekhyR1VLNUNUUzBjSHFBUTR1d1BwaVZ6WkRhS2hNQUxkS1liKzY3V1UxR1RO?=
 =?utf-8?B?TjBDdlZsckRMWFI4eGlpT3NDajA0T1Z6c2J6Qk9pOGIwRE42elY1cXIrSU5n?=
 =?utf-8?B?MEZlbDloTzNGYlNROEVHSG5CT0hwMzJpT3FENTdzT0MvUGJ2bFdpbDMxYXc2?=
 =?utf-8?B?d2dHV1VCT1BxaTJ0akJkV2ptdm5WSE9za3JJNUlZS0ZvSHY5N0lZVlMrQWlG?=
 =?utf-8?B?Q0V0c0VzelpCbHltUm9CZUM4RHoxZlpuaFRQMFZsWldhVWM4ZUhDNWpXUGlY?=
 =?utf-8?B?M0tPcFp3anp5alhsVlVidTNza3ZMTEhESWlyTjhZY25DV1ZKaXpFWld0Q2NV?=
 =?utf-8?B?bEtKMjdjRmpDRWFwUlZNSjMydUYxQzdyZ1dpMnpSRSttMEZTbjVFKy9DWXhx?=
 =?utf-8?B?VE13eWdNUDNkam9NRjlNQzl1UzcvdWY1WDZ4UFBsREdjRWRaR2tPODBMaHEy?=
 =?utf-8?B?Q0U3a3RiZnJVQ09tbE5RMkxzNWdkOE5nNnR4N0xOK1dtRldCOGlCUm04ZXY1?=
 =?utf-8?B?Rm9jUGxyREthcndpallvcEVWVXFRbUpnODJPaXhRL211M1pTb1krNGhWblFP?=
 =?utf-8?B?ZGpLMkF5ZEZERHFMQVEwakpZak9FRENmMTQzV3BiSzFsd3V2UHMvVE5LY2x2?=
 =?utf-8?B?NE1SQS9admt5YUM3NzQvbHN4TFMrckZVT1RkaDNNejA3RlI4bE1rT3pDVktW?=
 =?utf-8?B?UUhpdXRjL1N4aXRLVXUwQk40d2FUSGtJUk5iNFhlbVZqbFQ2TDhzQVg3eVJv?=
 =?utf-8?B?bDFDL010ZkQ5WXgwSnJBNVNCcDY3aDdnb0xZS3NRNGVYUUozSmhic1I2c2JN?=
 =?utf-8?B?MUNpTnRDM2xRc0p6NmhEdERIWTlzTkswZlIvRkdybFlwNXAwUjB6U3lPWDNs?=
 =?utf-8?B?SkhSMUhYYkVpVXByUGRWQlBPeU50ZjV4NW9pSzhKQnU4WVkrZWlDMm50Z2xJ?=
 =?utf-8?B?WUFRa3NuMWJRMjM0Q1pZTVA1c0lVRTJ1ekszaXRBWG9QOHcwRmU5dkY4N1Zw?=
 =?utf-8?B?TDhiMTdYaHRyenh4aDFMZUcrdkRLd1VobUdsYldTekF4NituMjMxZFZ1c2Rp?=
 =?utf-8?B?a3RRcHBnekRocXVIbjNlNjVIdnhNWTRBMVErbkZLYUxrTFIxYVBPb2RHcFpn?=
 =?utf-8?B?a2NsMGttdHo4QWJJN0Z6WTl1NHV1MkxrcUtldzlySjFpVnFuMnYxZnNQZ3p3?=
 =?utf-8?B?MDk3NFZPSW5ZaDFQUG4rSkVjd1pVTmM2SitMODN1aUlKUTYybDFBUWx2aHVO?=
 =?utf-8?B?YlQ5enB5S0haVm45K2VIaERFd0h5b3h5U3ZHYnB6Uzl1VTVacmMwSnp3b2VO?=
 =?utf-8?B?R1dkSmd0Y0JpZElaYkJBWUJmRGZnNmd2Mno4cUh3NmZKVlJxZG1qZ254UDZS?=
 =?utf-8?B?eUkwaXVrV3pWd3lIN0tZbUpuK0dXWHpPVXdldjZDRUVSODkremFTdEwrUms4?=
 =?utf-8?B?QjVGK2sremRGQUZIc3Y5TEdFQmxySm9SS3VYVUd6Ni9JeEpDcGllbEJNTG1F?=
 =?utf-8?B?WmNsSEFQL1BtMHY1all0b0hyRnVQc3J3T2ZIQkxBVmVBM01MKzNuZlIxUzh5?=
 =?utf-8?B?QmU5b3B3OXdvcFhSd0JIWU8wYWlyVzNHdXlNU1BtMzlPSzY5cmpCeVhwdkpE?=
 =?utf-8?B?dEE9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: YpeUS+PaEH9s14kEQ8bXHBfsLeO7GTIV6kHhVT1zlT1SXDCtzGbEaCGoA9Ra/5uSyOYYFw688lik00iJW4kY5eecf9ZJeIpIWidknOuOwKMq6K2TnhHfaLVWDQNnj9iHPFMcgXYR8+OCMgv4Z3Z+4vPRxUTocwaSfVd1698VkyhIrfnm0QhE3wjhUAyqfhRtxOP5TvtiFxmEdQUZee0OIea+gYQy4+76J+ICT6O7QbPyic5ilhW5lu/2N0cJETLl33bCVeuBPnAe8Zgd1PEjDvM05c/6cZSHlOrh8oaYKKGSaGDlsCsImUxr4qxG+DySrvwQgjYrqy9ONyos9uRil3dMQNd6HrVqWLofUga1WjEspPnlK9WIL28Pe3TXTBpmUh1CPeNoK3FgnTXkisUSLC3oMuucIsCo6q6dsn6RkNT9H/LJS7/83FXMg1AkeRmz/r1X0LKsNLhPYtBK9m6iz4TqTSiaHKDqYzJ5rBFDZ3Ll2uHB0GNjN/7L0IwUSj3UEK9/G6wuhPEnDuzHwR9JGTloovb8uNRwAumK/zzXlddqVgBxZDlHDot9R23N4c1g5BYvbfg114B940VKbHnymSHcHjc1FAh+9rxNVTk7tnD28NzUPNzdrnFs5Wzxr7FBWgTnJyfHW6S+NxX9A5/4SxpNhVKuOsjoG8v84/DYw9xFw3BhmC6Iu/rnqZg8tb1HlFRvWP4pQe2gRbxb/9+Clsy4yT0LUJsynjpbxr+zatrHICfHzoSBPBxTM/Fd0tEsxMMMJIN1zgd7ZTYr/aBtrz1cGtxm5HLbDo0wtXGIqcR1MEieRba4bEYkDUcYhZzRAYjd6KrBA0G08dllUXcv5fwm7V3gQrDOEcTgULF7NJk=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 05216bfe-eb97-40a1-8f0c-08db0a0cb0b8
X-MS-Exchange-CrossTenant-AuthSource: SA2PR10MB4684.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Feb 2023 19:43:02.5546 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: C0ptPx96OC+cK124Pcmh/zJSmqsTrhCDswscP38XkWtPbU5rr4TQUbDdpZpSUrPEnfLlxztBgAgpxYqEY4ApHdRevlRRTkQkPX3MzZEk45g=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ1PR10MB5977
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.122.1
 definitions=2023-02-08_09,2023-02-08_02,2022-06-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0
 mlxlogscore=999
 malwarescore=0 adultscore=0 phishscore=0 suspectscore=0 mlxscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2302080168
X-Proofpoint-ORIG-GUID: vrExq9guRaCbG6hJ09gAtZpLXkpncXMt
X-Proofpoint-GUID: vrExq9guRaCbG6hJ09gAtZpLXkpncXMt
Received-SPF: pass client-ip=205.220.177.32;
 envelope-from=steven.sistare@oracle.com; helo=mx0b-00069f02.pphosted.com
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

On 2/8/2023 9:17 AM, Alex Bennée wrote:
> Steven Sistare <steven.sistare@oracle.com> writes:
> 
>> On 2/8/2023 1:43 AM, Marc-André Lureau wrote:
>>> Hi
>>>
>>> On Tue, Feb 7, 2023 at 10:50 PM Steve Sistare <steven.sistare@oracle.com> wrote:
>>>>
>>>> Generalize hmp_split_at_comma() to take any delimiter character, rename
>>>> as strList_from_string(), and move it to qapi/util.c.
>>>>
>>>> No functional change.
>>>
>>> The g_strsplit() version was a bit simpler, but if you want to
>>> optimize it a bit for 1 char delimiter only, ok.
>>>
>>> Reviewed-by: Marc-André Lureau <marcandre.lureau@redhat.com>
>>
>> Yes, and it saves a malloc+free for the array.  Small stuff, but I
>> thought it worth a few lines of code.  Thanks for the speedy review!
> 
> But is the HMP path that performance critical? Otherwise I'd favour
> consistent use of the glib APIs because its one less thing to get wrong.

Either implementation is fine with me.  If I use g_strsplit, I will
allow a string delimiter:

strList *strList_from_string(const char *str, const char *delim)
{
    char **split = g_strsplit(str ?: "", delim, -1);
    strList *res = NULL;
    strList **tail = &res;
    int i;

    for (i = 0; split[i]; i++) {
        QAPI_LIST_APPEND(tail, split[i]);
    }

    g_free(split);
    return res;
}

- Steve

>>>> Signed-off-by: Steve Sistare <steven.sistare@oracle.com>
>>>> ---
>>>>  include/monitor/hmp.h  |  1 -
>>>>  include/qapi/util.h    |  9 +++++++++
>>>>  monitor/hmp-cmds.c     | 19 -------------------
>>>>  net/net-hmp-cmds.c     |  2 +-
>>>>  qapi/qapi-util.c       | 23 +++++++++++++++++++++++
>>>>  stats/stats-hmp-cmds.c |  2 +-
>>>>  6 files changed, 34 insertions(+), 22 deletions(-)
>>>>
>>>> diff --git a/include/monitor/hmp.h b/include/monitor/hmp.h
>>>> index 2220f14..e80848f 100644
>>>> --- a/include/monitor/hmp.h
>>>> +++ b/include/monitor/hmp.h
>>>> @@ -19,7 +19,6 @@
>>>>
>>>>  bool hmp_handle_error(Monitor *mon, Error *err);
>>>>  void hmp_help_cmd(Monitor *mon, const char *name);
>>>> -strList *hmp_split_at_comma(const char *str);
>>>>
>>>>  void hmp_info_name(Monitor *mon, const QDict *qdict);
>>>>  void hmp_info_version(Monitor *mon, const QDict *qdict);
>>>> diff --git a/include/qapi/util.h b/include/qapi/util.h
>>>> index 81a2b13..7d88b09 100644
>>>> --- a/include/qapi/util.h
>>>> +++ b/include/qapi/util.h
>>>> @@ -22,6 +22,8 @@ typedef struct QEnumLookup {
>>>>      const int size;
>>>>  } QEnumLookup;
>>>>
>>>> +struct strList;
>>>> +
>>>>  const char *qapi_enum_lookup(const QEnumLookup *lookup, int val);
>>>>  int qapi_enum_parse(const QEnumLookup *lookup, const char *buf,
>>>>                      int def, Error **errp);
>>>> @@ -31,6 +33,13 @@ bool qapi_bool_parse(const char *name, const char *value, bool *obj,
>>>>  int parse_qapi_name(const char *name, bool complete);
>>>>
>>>>  /*
>>>> + * Produce a strList from the character delimited string @in.
>>>> + * All strings are g_strdup'd.
>>>> + * A NULL or empty input string returns NULL.
>>>> + */
>>>> +struct strList *strList_from_string(const char *in, char delim);
>>>> +
>>>> +/*
>>>>   * For any GenericList @list, insert @element at the front.
>>>>   *
>>>>   * Note that this macro evaluates @element exactly once, so it is safe
>>>> diff --git a/monitor/hmp-cmds.c b/monitor/hmp-cmds.c
>>>> index 34bd8c6..9665e6e 100644
>>>> --- a/monitor/hmp-cmds.c
>>>> +++ b/monitor/hmp-cmds.c
>>>> @@ -39,25 +39,6 @@ bool hmp_handle_error(Monitor *mon, Error *err)
>>>>      return false;
>>>>  }
>>>>
>>>> -/*
>>>> - * Split @str at comma.
>>>> - * A null @str defaults to "".
>>>> - */
>>>> -strList *hmp_split_at_comma(const char *str)
>>>> -{
>>>> -    char **split = g_strsplit(str ?: "", ",", -1);
>>>> -    strList *res = NULL;
>>>> -    strList **tail = &res;
>>>> -    int i;
>>>> -
>>>> -    for (i = 0; split[i]; i++) {
>>>> -        QAPI_LIST_APPEND(tail, split[i]);
>>>> -    }
>>>> -
>>>> -    g_free(split);
>>>> -    return res;
>>>> -}
>>>> -
>>>>  void hmp_info_name(Monitor *mon, const QDict *qdict)
>>>>  {
>>>>      NameInfo *info;
>>>> diff --git a/net/net-hmp-cmds.c b/net/net-hmp-cmds.c
>>>> index 41d326b..30422d9 100644
>>>> --- a/net/net-hmp-cmds.c
>>>> +++ b/net/net-hmp-cmds.c
>>>> @@ -72,7 +72,7 @@ void hmp_announce_self(Monitor *mon, const QDict *qdict)
>>>>                                              migrate_announce_params());
>>>>
>>>>      qapi_free_strList(params->interfaces);
>>>> -    params->interfaces = hmp_split_at_comma(interfaces_str);
>>>> +    params->interfaces = strList_from_string(interfaces_str, ',');
>>>>      params->has_interfaces = params->interfaces != NULL;
>>>>      params->id = g_strdup(id);
>>>>      qmp_announce_self(params, NULL);
>>>> diff --git a/qapi/qapi-util.c b/qapi/qapi-util.c
>>>> index 63596e1..b61c73c 100644
>>>> --- a/qapi/qapi-util.c
>>>> +++ b/qapi/qapi-util.c
>>>> @@ -15,6 +15,7 @@
>>>>  #include "qapi/error.h"
>>>>  #include "qemu/ctype.h"
>>>>  #include "qapi/qmp/qerror.h"
>>>> +#include "qapi/qapi-builtin-types.h"
>>>>
>>>>  CompatPolicy compat_policy;
>>>>
>>>> @@ -152,3 +153,25 @@ int parse_qapi_name(const char *str, bool complete)
>>>>      }
>>>>      return p - str;
>>>>  }
>>>> +
>>>> +strList *strList_from_string(const char *in, char delim)
>>>> +{
>>>> +    strList *res = NULL;
>>>> +    strList **tail = &res;
>>>> +
>>>> +    while (in && in[0]) {
>>>> +        char *next = strchr(in, delim);
>>>> +        char *value;
>>>> +
>>>> +        if (next) {
>>>> +            value = g_strndup(in, next - in);
>>>> +            in = next + 1; /* skip the delim */
>>>> +        } else {
>>>> +            value = g_strdup(in);
>>>> +            in = NULL;
>>>> +        }
>>>> +        QAPI_LIST_APPEND(tail, value);
>>>> +    }
>>>> +
>>>> +    return res;
>>>> +}
>>>> diff --git a/stats/stats-hmp-cmds.c b/stats/stats-hmp-cmds.c
>>>> index 531e35d..4a2adf8 100644
>>>> --- a/stats/stats-hmp-cmds.c
>>>> +++ b/stats/stats-hmp-cmds.c
>>>> @@ -174,7 +174,7 @@ static StatsFilter *stats_filter(StatsTarget target, const char *names,
>>>>              request->provider = provider_idx;
>>>>              if (names && !g_str_equal(names, "*")) {
>>>>                  request->has_names = true;
>>>> -                request->names = hmp_split_at_comma(names);
>>>> +                request->names = strList_from_string(names, ',');
>>>>              }
>>>>              QAPI_LIST_PREPEND(request_list, request);
>>>>          }
>>>> --
>>>> 1.8.3.1
>>>>
>>>>
>>>
>>>
> 
> 

