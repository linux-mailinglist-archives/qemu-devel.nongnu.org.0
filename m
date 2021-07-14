Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E66EB3C7E75
	for <lists+qemu-devel@lfdr.de>; Wed, 14 Jul 2021 08:18:46 +0200 (CEST)
Received: from localhost ([::1]:33340 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m3YEI-0006wR-0R
	for lists+qemu-devel@lfdr.de; Wed, 14 Jul 2021 02:18:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55650)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dongli.zhang@oracle.com>)
 id 1m3YD2-0005So-Dq
 for qemu-devel@nongnu.org; Wed, 14 Jul 2021 02:17:28 -0400
Received: from mx0a-00069f02.pphosted.com ([205.220.165.32]:54286)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dongli.zhang@oracle.com>)
 id 1m3YCz-0003Ab-N9
 for qemu-devel@nongnu.org; Wed, 14 Jul 2021 02:17:28 -0400
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 16E6Dcmr015038; Wed, 14 Jul 2021 06:17:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=subject : to : cc :
 references : from : message-id : date : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=corp-2020-01-29;
 bh=P+Fwya0vRLffZv+MHUBkOxfPahmUQvFT7txeCrntLZo=;
 b=P91uJn7sd0vQ526D6ZxGmnuk59K1QAuxWsv3q4vEfcdW+i6Fw2YvocVmLjmq+CL86HNn
 2e6eGDfIY55LrRgENiVDkdyvxouMpb5y7D/tvF9L4GF5PBPH0PsExxxvws2fG+0nzJ2P
 itADXSGjkiNyjSRrjOA5nfRbxNIMBYBWGum0rF4R1QpcTDX55HyWIwlUwE2+DMcg5zY6
 AMcHwScfMzXBxQHJaa2Z0m9xF+XbAdOJeSi+uneCZ6tlUOF9ormzSQCXO6VjGlVZfR17
 CjstDAmHpVvJcRca8hDQTdbviF0x2P5mtA9t4uLTYH44vOr114YNK/V2ovYTrarU1GTr 9Q== 
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
 by mx0b-00069f02.pphosted.com with ESMTP id 39sbtuhm6d-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 14 Jul 2021 06:17:22 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
 by userp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 16E6Exlf144583;
 Wed, 14 Jul 2021 06:17:20 GMT
Received: from nam11-co1-obe.outbound.protection.outlook.com
 (mail-co1nam11lp2171.outbound.protection.outlook.com [104.47.56.171])
 by userp3020.oracle.com with ESMTP id 39qnb2aawg-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 14 Jul 2021 06:17:20 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iNZdUSqjGyxR6jiAlFDy4165SYpWDsaYF9sgtQlagsisl4evBsrKMq0Mr3+875/kjuNvsxjliYIdSLlLGrphR0oglFfWesmk2LtEkAVJ1aJsDrSTnTfp2Y9qDps8NiZdmrY9aeXM4BpWV6RZfGhfoDHoNTVG0yf/fjmu63iTRnC/72qdJyuTTXiIvxKI0SIxWSwqkMYqswQrsQVbZPPkkggW+4hU7iHN9cZM8w5q8DpMnb5OSGx6salwpeFDjpfwRlfA98ebOMulTRKC95ODLPQbtQiiwZ3/48ASYH1SM00PoXbqWWejmqC6nTcFxlErWPb+iWBCPQbYJof370wk7g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=P+Fwya0vRLffZv+MHUBkOxfPahmUQvFT7txeCrntLZo=;
 b=lvEo9ykbRUCObay6w/bSsSio1M4LznRt1gYIF+OI8t9B+swa/aqmJSVE/gwkINzKJNsDcLaU5lWuFVI7ZJQZrmi9bEp14x4nb27Gii5+WIuo+OVeICuwKIwaEaQA7Y6M+HkVU6ZtY+YrJtUsFqF2rxEirOuI5BIo+YDY/eK+qi1eYpbWjkQ6qb9r7qbSjEYHE8Bq1zQRMi36GAboGW9hQe6WFdELLun8P4NNLr7C+ruzB+Ug5dF2MbLOmNxLVpMrvj0gANCyK+YanUJEgHnHf8szMEvE9Kb0K6MiU6mHxRF94JqJoymJlj04GwNCa7c4UQkr1EVVhXEVG+acAECmwQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=P+Fwya0vRLffZv+MHUBkOxfPahmUQvFT7txeCrntLZo=;
 b=rrhFv7O7JbGSXzKA9bO5zrp7c23vsq8vcRyHcHlPFCl84FXfwhpg5G4goOa0XefHXvzAFr3Xlw2SJ3GM6DCGXTZRdVR1zJL72XX5Zk+ffy2dHxAGayyhoQDY9oTNkhPl/dv0ypH8LS1A+sqLU659oBGQ8QOJqyZSou6kq6VR05k=
Authentication-Results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=oracle.com;
Received: from BN7PR10MB2659.namprd10.prod.outlook.com (2603:10b6:406:c5::18)
 by BN0PR10MB4821.namprd10.prod.outlook.com (2603:10b6:408:125::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4308.21; Wed, 14 Jul
 2021 06:17:18 +0000
Received: from BN7PR10MB2659.namprd10.prod.outlook.com
 ([fe80::f90f:61ab:5e6b:d2f6]) by BN7PR10MB2659.namprd10.prod.outlook.com
 ([fe80::f90f:61ab:5e6b:d2f6%7]) with mapi id 15.20.4308.027; Wed, 14 Jul 2021
 06:17:18 +0000
Subject: Re: [PATCH v3 1/3] msix/hmp: add hmp interface to dump MSI-X info
To: Markus Armbruster <armbru@redhat.com>
References: <20210714004754.22243-1-dongli.zhang@oracle.com>
 <20210714004754.22243-2-dongli.zhang@oracle.com>
 <8735shmorf.fsf@dusky.pond.sub.org>
From: Dongli Zhang <dongli.zhang@oracle.com>
Message-ID: <ae859cde-5d56-01f8-4ef8-bffce9303ff1@oracle.com>
Date: Tue, 13 Jul 2021 23:17:14 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
In-Reply-To: <8735shmorf.fsf@dusky.pond.sub.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR13CA0214.namprd13.prod.outlook.com
 (2603:10b6:a03:2c1::9) To BN7PR10MB2659.namprd10.prod.outlook.com
 (2603:10b6:406:c5::18)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2601:646:c303:6700::7d72] (2601:646:c303:6700::7d72) by
 SJ0PR13CA0214.namprd13.prod.outlook.com (2603:10b6:a03:2c1::9) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4331.12 via Frontend Transport; Wed, 14 Jul 2021 06:17:17 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 4742afd2-b4a1-4760-86aa-08d9468f0813
X-MS-TrafficTypeDiagnostic: BN0PR10MB4821:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BN0PR10MB482147064B709BC501C59249F0139@BN0PR10MB4821.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: uVm40GUWW2ypbOjViuXCMmccC5uJbSb33oclqQQV1s9DhXs7LkCj3m1HzAuKwn+0uHabD7AHoE6lP6bbWfH9Bb2Ak6mM1zSgEiBCx18LTUYV2+McZk/JAV2hNza7iXkiSwGm2VbaiyqMJmtP3FzSn8fY9lWq9d2kPvv72k6QoKB4xUkHYvNChuxqQ4YhM4SbE7PYNtmhLmjW0wldteO3eadXQ9FVc1soUcw0JFMLCEs/ejnEWjpgcpRUj4FnbOeG6iW6qJetCKDckMyJrq3J3RZXSOCXuGofih2Mdw8lQ0lSek4lr+OtTYiYv/Ha/MiY/e6qYX0t0lMP6+SDKLPbcjafRsZnyKQTmu2Fv73BoHtziun88kA1mhzFfNYQYv69A9ZOCg//fyoCbNifjmYfNBh63nSHwJ0O+uDbK/GSTt+ur0NEJEs7/rJqUlQXDaHKM0UWjUX+WDSetKNOguVktSmdxrxr/s7pVYvGtHeYh2MobHfKhqVMM9sfxji4aZye6kCI/IJS5ty7plJxi0kdWznRoy+/PauXKCdbgeWoiIK1Bn9yhJD0d/fXa1eA1wQEPFqSahXnwy06kKjgygZISOxWP8l3Na4K607tMgRFHSSlm0TGHr4eClQ9h7BQ3XYNbhOwzInk1KFZRIYqCaaByKqaQY770V1VNRev2p8+ms9y8yyiVzhCHuWpI8u+/RYlQNJJ+87xO73Pxkkr75mIv41u1RRrkYyLX3623T9GGewhIHqkJsJP+T5qnizymAQL
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN7PR10MB2659.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(136003)(396003)(366004)(376002)(39860400002)(346002)(53546011)(8936002)(186003)(316002)(8676002)(6916009)(6486002)(5660300002)(31696002)(66556008)(86362001)(31686004)(83380400001)(4326008)(38100700002)(2906002)(6666004)(2616005)(478600001)(66946007)(66476007)(44832011)(36756003)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MWY3MzN4Z3RaQ1MwZXN0b1UzeE1kWitwSEt6Q2FFaElWblJxUXhoQnBsL29Z?=
 =?utf-8?B?V3JlWS9GaHA5SEhGWitYTXBaOE1PYk5RZlpJZzdNK1FGcm01dHRDYWw1dzlh?=
 =?utf-8?B?RjZ6WWhsQnh1ZVd0eCsxSVo2WmlwZ09QNHBtTmFoS0dSRE5YT3RNSDBwK2gw?=
 =?utf-8?B?NG9xUUdQS1JoVGhvbDZnRkQ4bWRxbTk4aFlpTVlHS3FzQ2RXM0NGSXFPa213?=
 =?utf-8?B?a3ZMQlZ6amtYbWllMHNtMEtJUncydTI5TWs4S2M5RlRHR2F0elg0eStneVYw?=
 =?utf-8?B?aE5OTkN6YjJxaWxSMWxDWjJUWGkxbng0Y2xBajF1eHoyWTVkeG9SM0dqSGFq?=
 =?utf-8?B?bzBHbFFEQmZQWi8ybnphM1Nqa2R0OTZlcXhmb0tLMGQvcENYWlB4NVFmdXpw?=
 =?utf-8?B?cFNpcnRSaGd2RmZNM25XVEhHTkM1SzBWU2NXVjdtMWN5akZROVpyYjVwL0Qz?=
 =?utf-8?B?RnBWMzY1MzRHYTJPK3hRYkMrZ0k1b2kyakFuaHVqTXZCSHdXMlEydVRUQW9G?=
 =?utf-8?B?eDNzdVFoODJXQW10am1GMUtnc1RjTUtMMWpsU0d3dEI5dVlRQWYrK0VwaWMr?=
 =?utf-8?B?a2pKOEQ3Z3ZuR3pZZ2lqS0lUblBKL1pMSitsdDhkOTJQZmhRZkVzOXNXUytP?=
 =?utf-8?B?cXFRaXRWcmRSZ1BlaDh2eldHL3FudVBMZ0xlVEpTSHh2Tkgwa1k5dVR5SVhJ?=
 =?utf-8?B?Wk5KTTJHZ2dEdEh5d015VURSSEFKUVorbVJDZ2N4d252QW1OenRPcnRRYTVC?=
 =?utf-8?B?b2xFY0NKUVptczV1K2ZGRUdvdEl4aytBQzZXelQrc1hqTnZvRHpYcXA0ZEpn?=
 =?utf-8?B?SHc1alFwLzl3cDhGQ3dON296amxaLzVOYVNJQzEzMGx3UzltQTc0aWVCOUt1?=
 =?utf-8?B?QWJveFJtYWd6dUhyMmhJWUR3Y25mRXdKVUkvQ1RxNFl2M3orbWViSXRPNlNE?=
 =?utf-8?B?R0poWHJldFdKaThqRHh3OHNlZkFkZlZZRU9JM0lrdDlFU3ZJb1M5ZHVtaG5M?=
 =?utf-8?B?TzBZbm1DSnZJL2xtdnlMRWxIL0xVWU9UV2xWdXFwTW5QNHZLWHRzNUJsY0cz?=
 =?utf-8?B?WFRQZGpQM09nUUE4NjBHMEFNQnBoNCtYeVkzejlvcUdJV1crNWtWamVwRU5G?=
 =?utf-8?B?UnNTYlNDYkg5bkZUeDNzaDFmUjJCbEFMVFRYQXcvK3lXdjgxalFjQ1BCQ3o4?=
 =?utf-8?B?MzY1cElzeGpJcFRjQ1J3K0RuWGE2VjUxSGIxRExzNGRBaC9sK3VlQklJeFJ3?=
 =?utf-8?B?NWJuMkJLNW9nSzBpb29KYVBoWjdKRGdXMmNWQXZWZDdFTXh6dFZveDNpS00y?=
 =?utf-8?B?SW5HYy9vaGJYbFUzUGhWY2pOK21Sd242Ym04WEV3aC9LM01xajFqTXZESHhy?=
 =?utf-8?B?aEFZUE5aSlBhZk1LL056dTVqdjQ2UkJlSlBVRTdWUXYxMjJxaHJtNy84WE45?=
 =?utf-8?B?YjJIb1hjNTMxdThWRnVXUkFFVDhUQ3lnR3R4M3lIZHNNVzE1S2VVb05WQTFx?=
 =?utf-8?B?ZEZpRzhOVDIrMUJSY3JOZTNPVUZWc1VQekRZWGVOdFh2MFF0dkVCcXZzc2Rk?=
 =?utf-8?B?ZVExMC9POFBZcndTOFc1TDIvTkRJOEFMaklYNG9PSHR5bkRuTERod3FlT1J5?=
 =?utf-8?B?MW5zdWUxSU56aDVPNEV5YXBmZ2UrbS9EQWxoNnpPd2hDM3VXclI3S1hadXJv?=
 =?utf-8?B?MkZmNThXMkhSaUNXUmI0a0wvbVZ1WVNWd3FzNG0wb21pM3VXakNzK0FjalIy?=
 =?utf-8?B?UWdGK29MM2FRT1YreENNZTQ2bE9PeVNiMnZWcitlNmpMYzR1QkNZc1lMZGpE?=
 =?utf-8?B?RFJVem95MGw4b3Y3R3Z0QT09?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4742afd2-b4a1-4760-86aa-08d9468f0813
X-MS-Exchange-CrossTenant-AuthSource: BN7PR10MB2659.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jul 2021 06:17:18.0770 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9qTY5wK4t8XuvAuxGDXLv+Puwf9VkYhKGNqVOCZ7qtQH/5LswegsAN5hB4VpKBxMHiGuQ/T8m1r6oFcFwmDITg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN0PR10MB4821
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=10044
 signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0
 bulkscore=0 malwarescore=0
 spamscore=0 suspectscore=0 adultscore=0 mlxlogscore=740 mlxscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2104190000
 definitions=main-2107140040
X-Proofpoint-GUID: 9lDkFe6tBbyBVNCWUfmAR31jl7xhU5Xa
X-Proofpoint-ORIG-GUID: 9lDkFe6tBbyBVNCWUfmAR31jl7xhU5Xa
Received-SPF: pass client-ip=205.220.165.32;
 envelope-from=dongli.zhang@oracle.com; helo=mx0a-00069f02.pphosted.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, NICE_REPLY_A=-0.368, RCVD_IN_DNSWL_LOW=-0.7,
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
Cc: berrange@redhat.com, ehabkost@redhat.com, mst@redhat.com,
 jasowang@redhat.com, joe.jin@oracle.com, qemu-devel@nongnu.org,
 dgilbert@redhat.com, pbonzini@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Markus,

On 7/13/21 10:46 PM, Markus Armbruster wrote:
> Dongli Zhang <dongli.zhang@oracle.com> writes:
> 
>> This patch is to add the HMP interface to dump MSI-X table and PBA, in
>> order to help diagnose the loss of IRQ issue in VM (e.g., if an MSI-X
>> vector is erroneously masked permanently). Here is the example with
>> vhost-scsi:
>>
>> (qemu) info msix /machine/peripheral/vscsi0
>> Msg L.Addr Msg U.Addr Msg Data   Vect Ctrl
>> 0xfee00000 0x00000000 0x00004041 0x00000000
>> 0xfee00000 0x00000000 0x00004051 0x00000000
>> 0xfee00000 0x00000000 0x00004061 0x00000000
>> 0xfee00000 0x00000000 0x00004071 0x00000000
>> 0xfee01000 0x00000000 0x000040b1 0x00000000
>> 0xfee02000 0x00000000 0x000040c1 0x00000000
>> 0xfee03000 0x00000000 0x000040d1 0x00000000
>>
>> MSI-X PBA
>> 0 0 0 0 0 0 0
>>
>> Since the number of MSI-X entries is not determined and might be very
>> large, it is sometimes inappropriate to dump via QMP.
> 
> Why?  What makes HMP different?

Here are two reasons.

1. The size of MSI-X table is nondeterministic and might be very large, e.g.,
the PCI_MSIX_FLAGS_QSIZE is 0x07FF. The "info tlb" (which is a table and similar
to MSI-X) and "info lapic" also only support hmp.

2. The [PATCH 3/3] of this patchset support device specific data, the
definitional of which varies depending on each device type (so far only
virtio-pci supports the interface).

Thank you very much!

Dongli Zhang

> 
>> Therefore, this patch dumps MSI-X information only via HMP, which is
>> similar to the implementation of hmp_info_mem().
>>
>> Cc: Jason Wang <jasowang@redhat.com>
>> Cc: Joe Jin <joe.jin@oracle.com>
>> Signed-off-by: Dongli Zhang <dongli.zhang@oracle.com>
>> Acked-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
>> Acked-by: Jason Wang <jasowang@redhat.com>
> 

