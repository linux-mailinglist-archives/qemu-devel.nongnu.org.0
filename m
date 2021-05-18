Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A76E9387CF1
	for <lists+qemu-devel@lfdr.de>; Tue, 18 May 2021 17:55:27 +0200 (CEST)
Received: from localhost ([::1]:44122 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lj246-0004Y6-O1
	for lists+qemu-devel@lfdr.de; Tue, 18 May 2021 11:55:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41700)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <steven.sistare@oracle.com>)
 id 1lj1xJ-0002Q8-Nf
 for qemu-devel@nongnu.org; Tue, 18 May 2021 11:48:25 -0400
Received: from mx0a-00069f02.pphosted.com ([205.220.165.32]:26248)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <steven.sistare@oracle.com>)
 id 1lj1xG-00027z-Ew
 for qemu-devel@nongnu.org; Tue, 18 May 2021 11:48:25 -0400
Received: from pps.filterd (m0246629.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 14IFWelW012570; Tue, 18 May 2021 15:48:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=subject : to : cc :
 references : from : message-id : date : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=corp-2020-01-29;
 bh=1hc+L0gX5/TQ7ZmeBVrCIzQN1+D53CeTwOonyoHc8Oc=;
 b=JVNHw5Fo+T+r8NiDEknhW/sbpaC5WlyPVjOeLnTwMTT3S6ocpUG6MiWh7Yikx/MqqN9x
 YC0XyNFXg8xIavrSKx9sk5Yj8CczVk94pn6QwaL7+5sM8i0rJj+xm2sR6aqnlybtGF2d
 expMM1Ab21RZWkGG9jxgf7VFYQadB1pMfpXoTcZcu3aCXIeNII0DaChaFPOUxW7kMpA/
 8VERk7mDhroeH+hd2pAnqIWSTFxnFPWjC5thKN6jfL59wOrQKSiBqoAcv1CkHX713APA
 EM7/evwmL/3NarFMmvTVe84OIAPiZg0Z4Mxfiehoc/SFj9Xmf8xkp9X8Rd2EeDrwc66Y 0w== 
Received: from oracle.com (userp3030.oracle.com [156.151.31.80])
 by mx0b-00069f02.pphosted.com with ESMTP id 38m9bgg5x2-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 18 May 2021 15:48:15 +0000
Received: from userp3030.oracle.com (userp3030.oracle.com [127.0.0.1])
 by pps.podrdrct (8.16.0.36/8.16.0.36) with SMTP id 14IFbHI8099452;
 Tue, 18 May 2021 15:48:14 GMT
Received: from nam10-mw2-obe.outbound.protection.outlook.com
 (mail-mw2nam10lp2101.outbound.protection.outlook.com [104.47.55.101])
 by userp3030.oracle.com with ESMTP id 38megjkgvg-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 18 May 2021 15:48:13 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QTkojZYYHnEaw2dq6EThLYLP30CMCvZCGn64ICyu0iK/LV46bIUEJjddQ+f5Lz33VdeuwoVoC6gR4fe9uWx/JDcrHiRYTrk1BQe4kGSeEjoDND8IFvDj1QTTt5Ap32XeqJy+NEVWHNAyK0nLIv2J/P02Y9y9b2GelkU6VQ8TYg+hjB042WEdWVr/6lP0kAAcn4fOd/k3wMWSgBMXeQMSXenb/FLmakt1G7VQDD9g9YmYI4xCgg42KrdVuZgCQ4B/MWN9OCBpAouUftPp9Wzudv2tn63MAxOE7DvZ91Y6BYEWwP924L8DVKjnUYo9BZS8pf8NH28wtHuugEEKuV7jfA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1hc+L0gX5/TQ7ZmeBVrCIzQN1+D53CeTwOonyoHc8Oc=;
 b=JahoYyDZwKejUSAjd5eqrK7oU7LH2I4tNr1/OMj9ztZuC77sbtoHgkDyalgZ8iFgkhUWtYwkg61duwkTHBS4vEJiMHfqRrUzzSlPlvxN5RYBz95a2MNQm0Xmoj+SQOde6fLF+tDOnbMT4zYnOYOuDj2kPQeNX33bVWoHgUEEHSqxPW8UWkGo0blmqPOlBE/nB/sxRBR4bG9yzse0irX96KxL/toKbYWbdJQXuMjpvHie8WCUzfIDvI4BB0gE7gTW3fu9+3bevRJFOxzqoqDb5sRM5VD5MEwhwORSSUtxI8hwQFh3j5OSvxYKpHtbCCtXMhCiT/gZQzHnd3UWTDT32g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1hc+L0gX5/TQ7ZmeBVrCIzQN1+D53CeTwOonyoHc8Oc=;
 b=E2p8uTuw5YbXHI4V8Fa0ftPkPYouy4ABh4WTvuB6iiU6b4HT43e22o9/gXsq0tLdVa/4jifPdij6Ozkf9nZH1HrPJ3k+l9TGUSewQ0BwkGv9RsN1jxJ8ihw7tMqsVMgm1aJmWF4oYq+LVqJpBzCmlMPpMEwkQ6IiHZYxFtDBF3Y=
Authentication-Results: oracle.com; dkim=none (message not signed)
 header.d=none;oracle.com; dmarc=none action=none header.from=oracle.com;
Received: from BYAPR10MB3240.namprd10.prod.outlook.com (2603:10b6:a03:155::17)
 by BY5PR10MB3939.namprd10.prod.outlook.com (2603:10b6:a03:1f7::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4129.26; Tue, 18 May
 2021 15:48:11 +0000
Received: from BYAPR10MB3240.namprd10.prod.outlook.com
 ([fe80::6ce3:f0a3:c303:f851]) by BYAPR10MB3240.namprd10.prod.outlook.com
 ([fe80::6ce3:f0a3:c303:f851%7]) with mapi id 15.20.4129.032; Tue, 18 May 2021
 15:48:11 +0000
Subject: Re: [PATCH V3 00/22] Live Update
To: Stefan Hajnoczi <stefanha@redhat.com>,
 Alex Williamson <alex.williamson@redhat.com>
References: <1620390320-301716-1-git-send-email-steven.sistare@oracle.com>
 <YJwFkhlYISA9INwO@stefanha-x1.localdomain>
 <4d3dd5ff-5180-16df-ab48-11de610dd396@oracle.com>
 <YJ5kokhzyA5tCom3@stefanha-x1.localdomain>
 <29356c3a-0b3f-2773-4f9f-18ff4ed4d5bb@oracle.com>
 <YKJWO6sGIFuzpdkZ@stefanha-x1.localdomain>
 <20210517131001.792593f0.alex.williamson@redhat.com>
 <YKPDotJVB/82SDaU@stefanha-x1.localdomain>
From: Steven Sistare <steven.sistare@oracle.com>
Organization: Oracle Corporation
Message-ID: <98a916fe-ed30-7dc0-f8dd-b9c2021653eb@oracle.com>
Date: Tue, 18 May 2021 11:48:06 -0400
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
In-Reply-To: <YKPDotJVB/82SDaU@stefanha-x1.localdomain>
Content-Type: text/plain; charset=windows-1252
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [24.62.106.7]
X-ClientProxiedBy: SA0PR11CA0129.namprd11.prod.outlook.com
 (2603:10b6:806:131::14) To BYAPR10MB3240.namprd10.prod.outlook.com
 (2603:10b6:a03:155::17)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.1.92] (24.62.106.7) by
 SA0PR11CA0129.namprd11.prod.outlook.com (2603:10b6:806:131::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4108.25 via Frontend
 Transport; Tue, 18 May 2021 15:48:08 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c3fa0e0b-128d-49a7-ea8f-08d91a1456db
X-MS-TrafficTypeDiagnostic: BY5PR10MB3939:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BY5PR10MB3939224D3E7909251217EA9AF92C9@BY5PR10MB3939.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: bZi0HJTbAa0lylGarcBMcapgdWQsRXQpS+P6y3lyMBOKKVQ/Ea1gzXh2211ZPzRU9rkBmzhdsLt3oNFDRK/R8kkI7Nk9wdHqpGFvHo6gSpiUQKdRPfnirQNitBTx1bizI4Wt1lnAl7pu//OO7wZvzH5s1BeIgaEwm/2eQ3T8eaNZLcai0VmmnUGhepWxa1Ng0amitUDfAq3BnqFu7OUgfzjaYpJq9OIY96GXX3FoFdp2FrAiJnHC01yxoPRTPNDbF9jH/AIXDknZwlHw5ajEZtEmGFplCALPryhdhnFWak21cbJPw8neJpiXgV1F15pb6+tETg4IdsZzofMWrzUguKPea10zOQfC/EZJx0UFovaGA37UYHNzYMrceYdGKDDiJ/O0PxtkKK/6CVBewMWBQoWXiC+Y53rroGs7434rbKHnjKL/SSZSsIG9QKUYVcidRE9Do3WzUJRddeNnRfyz+F3HJ6wSvqVuSiFK6R4Fz8e18ZJ8BlhxwqcPE4+kQcMfnVxApUmSy9yCx3JOc7YhorVXfl7odL381Eq2OiWfSzJhxvR8LSIvHws18mEEdud3e21FvRlVyfS/ZABT5TALvThHL4guWGmY/9gz8DX72ubte4l1lVnBplz14PUQ+ZasjxvR3++1b+hDOzhv3KpfxhdEqLt+T+iadOYIWgPSFqfUmabCkTEqDOJ4OTFcM2qY
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR10MB3240.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(346002)(136003)(39860400002)(396003)(376002)(2906002)(16526019)(31686004)(186003)(7416002)(15650500001)(66946007)(26005)(5660300002)(44832011)(66476007)(66556008)(4326008)(38100700002)(8936002)(54906003)(2616005)(956004)(83380400001)(6486002)(8676002)(86362001)(36756003)(36916002)(478600001)(16576012)(53546011)(31696002)(110136005)(316002)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?Windows-1252?Q?QpMcVqCSqhCK/KrJcXA4aC+vgw9KWkM9TAvRXPj4Mwb0FTqA5qNN/B0o?=
 =?Windows-1252?Q?q46vt0CfCeETNaRiWH9FtQGpsDLqZc0UwkXFM/PPOtFv/MSyu7SxOMLn?=
 =?Windows-1252?Q?3HO2CDjC0g7Rcn9aLLO3kODlF4pDcs3CePQNvRdoU1LTgIdu/Un5JxOX?=
 =?Windows-1252?Q?ODvw064FAKYWl8X26H9YKZ5r5Lm2NY+I+8UcslWQ48n9q6e2jQog7oI2?=
 =?Windows-1252?Q?k/f5ex5TNvfCECLMhW0u+Il6NQOl7+8Xt7Co+S0TGrn8/LXeh7gGJxBX?=
 =?Windows-1252?Q?2sWQed8WITckiiNjVfXlgk7KeoZZqJYnERpLgpNAgCN2w1I/5v45HX/7?=
 =?Windows-1252?Q?WJ3AjnnCMDcK4DmKWMCnB2Lsb2myWYeu98EV9eRl/AyOwlG69+RzbQRA?=
 =?Windows-1252?Q?W2hMuqdO7k/FQ7+vuDAXyojDBldOtVIn8iOiN6Ozns+V9zOrRlqREOFu?=
 =?Windows-1252?Q?Y0v+6Ox8/MCjC5BL/GPyHgDdyr9TpdsAuRGQkkjknV/h2gdGgc1EDGxo?=
 =?Windows-1252?Q?9DlB84z7kLon4z8g6tJ+MO39c5jgw8KxUJZgIOQ+tXv5UPT3EFGcPGc/?=
 =?Windows-1252?Q?rcBGGItF9pecqXvuc1EMQ77WHDDBpgMVsT1lgoS4vEkTHyHI1L5wINko?=
 =?Windows-1252?Q?gxL8QeM4y74WdxGws2G4O3r5Svkapkon10h8QacrgwCLdu2RjHAPIAXq?=
 =?Windows-1252?Q?yh3L2vemUjd3kPWluPn0vxcFICVL9l4JwDUq9KTRjq//kMzOqNzDtB51?=
 =?Windows-1252?Q?8hQHBiFgWolt3HJ5HN8zVSmS6ClgscMvuyOVWHzCHY4PcmVZkmIP1DEy?=
 =?Windows-1252?Q?DNPySksKRUervVJG1Fnpf5x7Bm+s25wJBGdt4kr5KDF1fbJ8NVDMmpJO?=
 =?Windows-1252?Q?iv2rs8gP5c9/6QsUcUoom6IzNjdgDEItn0BiGqDT0zBIYsliV45m2Z7L?=
 =?Windows-1252?Q?dlmfnuOXHxJ/8iqGrfqne9jP/+7uGcWyIk5h6cI81TbnKgj1w06IeiwR?=
 =?Windows-1252?Q?Rg5amwYAj0jGS5qSbd7esAgyCYNpzvyAIq6YQk6pts/Fdy3JiTAVu7v+?=
 =?Windows-1252?Q?Pks3aK5bDXEdUdjM6m/rwnWhhq559beAMoRc/mGwgXTRfh+59a8rUdPF?=
 =?Windows-1252?Q?UCylwuN4IxTG8NddfeXiziTU4OxQou6s2R2OC3P13L3MJnVqPDFxQ+Fm?=
 =?Windows-1252?Q?qvTrY+wFVjUs1TbJEUbOy1bcSjqXLiMO9vRXU4grCy5Pk7GtC/RpWlMF?=
 =?Windows-1252?Q?7Qw2UkY71uGjp2stqXJA3EQWoBo2sEYTWOWsXzV63Hny6+rlFObIVwWg?=
 =?Windows-1252?Q?ZyGLIoFe+AcExETzCx/4Qmoo4xpeU+5hEr0ZnLdFtvS3q4UjaB3qrfyi?=
 =?Windows-1252?Q?nT6TPpDWapkEvMcKiii/tBXVACe2JkMMvn9vYL6biRuPyeB8EB7Q4VDa?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c3fa0e0b-128d-49a7-ea8f-08d91a1456db
X-MS-Exchange-CrossTenant-AuthSource: BYAPR10MB3240.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 May 2021 15:48:11.1495 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: l4zlAF8CK+21G/ZlS7cfBJB35wq4T0Pr4ijOv4HInY05Auc+qjJQjK6ycnPI4tz6LrSn6eiYE2/5mMX+6O2SVnoQaR2SPEduXaVm/1w/G7s=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR10MB3939
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9988
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999
 phishscore=0
 adultscore=0 malwarescore=0 bulkscore=0 mlxscore=0 spamscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104190000 definitions=main-2105180111
X-Proofpoint-ORIG-GUID: qBqKIvAp4Bw2uxxO7DocRN5_7AD6sq8P
X-Proofpoint-GUID: qBqKIvAp4Bw2uxxO7DocRN5_7AD6sq8P
Received-SPF: pass client-ip=205.220.165.32;
 envelope-from=steven.sistare@oracle.com; helo=mx0a-00069f02.pphosted.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: "Daniel P. Berrange" <berrange@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Jason Zeng <jason.zeng@linux.intel.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Juan Quintela <quintela@redhat.com>, qemu-devel@nongnu.org,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, vfio-users@redhat.com,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 Markus Armbruster <armbru@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 5/18/2021 9:39 AM, Stefan Hajnoczi wrote:
> On Mon, May 17, 2021 at 01:10:01PM -0600, Alex Williamson wrote:
>> On Mon, 17 May 2021 12:40:43 +0100
>> Stefan Hajnoczi <stefanha@redhat.com> wrote:
>>
>>> On Fri, May 14, 2021 at 11:15:18AM -0400, Steven Sistare wrote:
>>>> On 5/14/2021 7:53 AM, Stefan Hajnoczi wrote:  
>>>>> On Thu, May 13, 2021 at 04:21:15PM -0400, Steven Sistare wrote:  
>>>>>> On 5/12/2021 12:42 PM, Stefan Hajnoczi wrote:  
>>>>>>> On Fri, May 07, 2021 at 05:24:58AM -0700, Steve Sistare wrote:  
>>>>>>>> Provide the cprsave and cprload commands for live update.  These save and
>>>>>>>> restore VM state, with minimal guest pause time, so that qemu may be updated
>>>>>>>> to a new version in between.
>>>>>>>>
>>>>>>>> cprsave stops the VM and saves vmstate to an ordinary file.  It supports two
>>>>>>>> modes: restart and reboot.  For restart, cprsave exec's the qemu binary (or
>>>>>>>> /usr/bin/qemu-exec if it exists) with the same argv.  qemu restarts in a
>>>>>>>> paused state and waits for the cprload command.  
>>>>>>>
>>>>>>> I think cprsave/cprload could be generalized by using QMP to stash the
>>>>>>> file descriptors. The 'getfd' QMP command already exists and QEMU code
>>>>>>> already opens fds passed using this mechanism.
>>>>>>>
>>>>>>> I haven't checked but it may be possible to drop some patches by reusing
>>>>>>> QEMU's monitor file descriptor passing since the code already knows how
>>>>>>> to open from 'getfd' fds.
>>>>>>>
>>>>>>> The reason why using QMP is interesting is because it eliminates the
>>>>>>> need for execve(2). QEMU may be unable to execute a program due to
>>>>>>> chroot, seccomp, etc.
>>>>>>>
>>>>>>> QMP would enable cprsave/cprload to work both with and without
>>>>>>> execve(2).
>>>>>>>
>>>>>>> One tricky thing with this approach might be startup ordering: how to
>>>>>>> get fds via the QMP monitor in the new process before processing the
>>>>>>> entire command-line.  
>>>>>>
>>>>>> Early on I experimented with a similar approach.  Old qemu passed descriptors to an
>>>>>> escrow process and exited; new qemu started and retrieved the descriptors from escrow.
>>>>>> vfio mostly worked after I hacked the kernel to suppress the original-pid owner check.
>>>>>> I suspect my recent vfio extensions would smooth the rough edges.  
>>>>>
>>>>> I wonder about the reason for VFIO's pid limitation, maybe because it
>>>>> pins pages from the original process?  
>>>>
>>>> The dma unmap code verifies that the requesting task is the same as the task that mapped
>>>> the pages.  We could add an ioctl that passes ownership to a new task.  We would also need
>>>> to fix locked memory accounting, which is associated with the mm of the original task.
>>>>   
>>>>> Is this VFIO pid limitation the main reason why you chose to make QEMU
>>>>> execve(2) the new binary?  
>>>>
>>>> That is one.  Plus, re-attaching to named shared memory for pc.ram causes the vfio conflict
>>>> errors I mentioned in the previous email.  We would need to suppress redundant dma map calls,
>>>> but allow legitimate dma maps and unmaps in response to the ongoing address space changes and
>>>> diff callbacks caused by some drivers. It would be messy and fragile. In general, it felt like 
>>>> I was working against vfio rather than with it.
>>>>
>>>> Another big reason is a requirement to preserve anonymous memory for legacy qemu updates (via
>>>> code injection which I briefly mentioned in KVM forum).  If we extend cpr to allow updates 
>>>> without exec, I still need the exec option.
>>>>   
>>>>>> However, the main issue is that guest ram must be backed by named shared memory, and
>>>>>> we would need to add code to support shared memory for all the secondary memory objects.
>>>>>> That makes it less interesting for us at this time; we care about updating legacy qemu 
>>>>>> instances with anonymous guest memory.  
>>>>>
>>>>> Thanks for explaining this more in the other sub-thread. The secondary
>>>>> memory objects you mentioned are relatively small so I don't think
>>>>> saving them in the traditional way is a problem.
>>>>>
>>>>> Two approaches for zero-copy memory migration fit into QEMU's existing
>>>>> migration infrastructure:
>>>>>
>>>>> - Marking RAM blocks that are backed by named memory (tmpfs, hugetlbfs,
>>>>>   etc) so they are not saved into the savevm file. The existing --object
>>>>>   memory-backend-file syntax can be used.
>>>>>
>>>>> - Extending the live migration protocol to detect when file descriptor
>>>>>   passing is available (i.e. UNIX domain socket migration) and using
>>>>>   that for memory-backend-* objects that have fds.
>>>>>
>>>>> Either of these approaches would handle RAM with existing savevm/migrate
>>>>> commands.  
>>>>
>>>> Yes, but the vfio issues would still need to be solved, and we would need new
>>>> command line options to back existing and future secondary memory objects with 
>>>> named shared memory.
>>>>   
>>>>> The remaining issue is how to migrate VFIO and other file descriptors
>>>>> that cannot be reopened by the new process. As mentioned, QEMU already
>>>>> has file descriptor passing support in the QMP monitor and support for
>>>>> opening passed file descriptors (see qemu_open_internal(),
>>>>> monitor_fd_param(), and socket_get_fd()).
>>>>>
>>>>> The advantage of integrating live update functionality into the existing
>>>>> savevm/migrate commands is that it will work in more use cases with
>>>>> less code duplication/maintenance/bitrot prevention than the
>>>>> special-case cprsave command in this patch series.
>>>>>
>>>>> Maybe there is a fundamental technical reason why live update needs to
>>>>> be different from QEMU's existing migration commands but I haven't
>>>>> figured it out yet.  
>>>>
>>>> vfio and anonymous memory.
>>>>
>>>> Regarding code duplication, I did consider whether to extend the migration
>>>> syntax and implementation versus creating something new.  Those functions
>>>> handle stuff like bdrv snapshot, aio, and migration which are n/a for the cpr
>>>> use case, and the cpr functions handle state that is n/a for the migration case.
>>>> I judged that handling both in the same functions would be less readable and
>>>> maintainable.  After feedback during the V1 review, I simplified the cprsave
>>>> code by by calling qemu_save_device_state, as Xen does, thus eliminating any
>>>> interaction with the migration code.
>>>>
>>>> Regarding bit rot, I still need to add a cpr test to the test suite, when the 
>>>> review is more complete and folks agree on the final form of the functionality.
>>>>
>>>> I do like the idea of supporting update without exec, but as a future project, 
>>>> and not at the expense of dropping update with exec.  
>>>
>>> Alex: We're discussing how to live update QEMU while VFIO devices are
>>> running. This patch series introduces monitor commands that call
>>> execve(2) to run the new QEMU binary and inherit the memory/vfio/etc
>>> file descriptors. This way live update is transparent to VFIO but it
>>> won't work if a sandboxed QEMU process is forbidden to call execve(2).
>>> What are your thoughts on 1) the execve(2) approach and 2) extending
>>> VFIO to allow running devices to be attached to a different process so
>>> that execve(2) is not necessary?
>>
>> Tracking processes is largely to support page pinning; we need to be
>> able to support both asynchronous page pinning to handle requests from
>> mdev drivers and we need to make sure pinned page accounting is
>> tracked to the same process.  If userspace can "pay" for locked pages
>> from one process on mappping, then "credit" them to another process on
>> unmap, that seems fairly exploitable.  We'd need some way to transfer
>> the locked memory accounting or handle it outside of vfio.  Thanks,
> 
> Vhost's VHOST_SET_OWNER ioctl is somewhat similar. It's used to
> associate the in-kernel vhost device with a userspace process and it's
> mm.
> 
> Would it be possible to add a VFIO_SET_OWNER ioctl that associates the
> current process with the vfio_device? Only one process would be the
> owner at any given time.

It is possible, but the implementation would need to invent new hooks in mm
to transfer the locked memory accounting.

> I'm not sure how existing DMA mappings would behave, but this patch
> series seems to rely on DMA continuing to work even though there is a
> window of time when the execve(2) process doesn't have guest RAM
> mmapped. So I guess existing DMA mappings continue to work because the
> pages were previously pinned?

Correct.  And changes to mappings are blocked between the pre-exec process issuing
VFIO_DMA_UNMAP_FLAG_VADDR and the post-exec process issuing VFIO_DMA_MAP_FLAG_VADDR.

- Steve

