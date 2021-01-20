Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 528022FCA99
	for <lists+qemu-devel@lfdr.de>; Wed, 20 Jan 2021 06:29:27 +0100 (CET)
Received: from localhost ([::1]:53506 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l263Z-0000HT-VA
	for lists+qemu-devel@lfdr.de; Wed, 20 Jan 2021 00:29:25 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36514)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alejandro.j.jimenez@oracle.com>)
 id 1l262e-0008Bc-DC
 for qemu-devel@nongnu.org; Wed, 20 Jan 2021 00:28:28 -0500
Received: from userp2130.oracle.com ([156.151.31.86]:35704)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alejandro.j.jimenez@oracle.com>)
 id 1l262b-0004ds-A4
 for qemu-devel@nongnu.org; Wed, 20 Jan 2021 00:28:27 -0500
Received: from pps.filterd (userp2130.oracle.com [127.0.0.1])
 by userp2130.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 10K5JV95153749;
 Wed, 20 Jan 2021 05:28:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=subject : to : cc :
 references : from : message-id : date : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=corp-2020-01-29;
 bh=hwm1QTqzKSg2wwbgPCHriqsbN5AzOgzgBjU5BRzGIXs=;
 b=mWuS28sb0DYX2PkPKluJ5/0Ba7yqo7EVQKdQZKKMV6yebyC82rB73ymGM/UnGRu5uNG1
 XPNcOCjShF6BfVFvORA+uCYitV7KJd7ACDy3JRZcInH6FgHYTt4QSGRAceZdLaBo8y41
 nozE9Iw5cfeiIfAZYCCP6LF42zUBjq6Id+TPw8mNuvd8nX+Rd4F8JIGq25VOeLnLM0mP
 0VKWEdQ2Hf1q3lCi38irPqEmpvAxAnofl6CIFweWnwKmv0+3pw6o0ZRP3I0dVgK4mB+R
 MnKr6vjdxekHPvOC5w0IXBhEu11ikVb7D5pxIvpPAeWrwHoq2f8XpgtsmbdfpHHOaXmU UA== 
Received: from userp3030.oracle.com (userp3030.oracle.com [156.151.31.80])
 by userp2130.oracle.com with ESMTP id 3668qa8r0k-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 20 Jan 2021 05:28:19 +0000
Received: from pps.filterd (userp3030.oracle.com [127.0.0.1])
 by userp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 10K5PenV071909;
 Wed, 20 Jan 2021 05:28:19 GMT
Received: from nam11-bn8-obe.outbound.protection.outlook.com
 (mail-bn8nam11lp2170.outbound.protection.outlook.com [104.47.58.170])
 by userp3030.oracle.com with ESMTP id 3668rcd5ba-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 20 Jan 2021 05:28:19 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XqJBXNLyh8Riax3pUvOG88nrw02OFE7dfwAJorbjOuK3APMK1m13U6rMTsAycHEYEq1yXZZIcuqaBcowzo2xSLWwKLN9zvnhCdUpAc/qEngaOrJ/ZosVvNJsOGWb5iBMG0U7Rleyi14VrGZfiYKZOTZywSRxyLr9OEge8s7ARWxGGJYapC+NWJ2BpaLWLWkMxBN1jfo1s/Ki+M38JDU0teZBXJzIt7JpWkARYORc4Gpg8r1ernATdfks3I4V++vZT0sFVw3I0dV0lsMCjBow3H6h8HjmVPRK5/UwMXZuNC3HITV+gyulhJVn6scYkRs5XLaU4JXKchlBdEyzjJvzog==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hwm1QTqzKSg2wwbgPCHriqsbN5AzOgzgBjU5BRzGIXs=;
 b=T4fQ2uyEAi5zh2QzDqjox39dxWxF53s3Sq0Azo5bJl44N7hyfWHXBeaceuC+hmr6fZcSALI/4j1Qw80MjKETXYnFATi4d4/mbggJijSQIXgKWZsflrpKBjed3xd2fLyWnSGVl70go9lqJKLy+jFWBPZonvwxkfQ0LXhbf8QO59xxkUj3ixpeY1syfnNgXlm5LiWhTp3jmAoheBKVT9QfipameCevR3ru4R6e2It/R97RkdczrBAeC3D5N0Pv4Tnb2rnuGoLiNf7kL09ICOFWSOOU30TF5zXrJbYk7WZFLW/h4xUbrqNGgup6d96r6CXuuBK3fatYkBf3PYL42OPP8Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hwm1QTqzKSg2wwbgPCHriqsbN5AzOgzgBjU5BRzGIXs=;
 b=P35e5xSBoB3hshN5IAQlZbLTinVYGA6I8tnCuevQxjYvhO3jUtY5cLpnysgQpLsVCkpQRP3gI6MiXrLZnHQHC4otM5JfwhdtCPQqurkLLXddLRBuHTCbTL2fP21JKw1tZFPMULC0bxfgzULhzp9vQIfCD9b1asskwsMrnNED2Og=
Received: from SJ0PR10MB4750.namprd10.prod.outlook.com (2603:10b6:a03:2d5::7)
 by SJ0PR10MB4752.namprd10.prod.outlook.com (2603:10b6:a03:2d7::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3763.11; Wed, 20 Jan
 2021 05:28:17 +0000
Received: from SJ0PR10MB4750.namprd10.prod.outlook.com
 ([fe80::8cee:110d:7287:821e]) by SJ0PR10MB4750.namprd10.prod.outlook.com
 ([fe80::8cee:110d:7287:821e%6]) with mapi id 15.20.3763.014; Wed, 20 Jan 2021
 05:28:17 +0000
Subject: Re: [PULL 16/45] vl: Add option to avoid stopping VM upon guest panic
To: Peter Maydell <peter.maydell@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>
References: <20201215175445.1272776-1-pbonzini@redhat.com>
 <20201215175445.1272776-17-pbonzini@redhat.com>
 <CAFEAcA93tYRjdjQJm8GKNS2=4iV5QU4X_JJevWEBc7wggX6Cwg@mail.gmail.com>
From: Alejandro Jimenez <alejandro.j.jimenez@oracle.com>
Organization: Oracle Corporation
Message-ID: <3f399e69-f941-d928-acee-f3d16182df5d@oracle.com>
Date: Wed, 20 Jan 2021 00:28:14 -0500
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
In-Reply-To: <CAFEAcA93tYRjdjQJm8GKNS2=4iV5QU4X_JJevWEBc7wggX6Cwg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-Originating-IP: [24.125.97.121]
X-ClientProxiedBy: SN6PR2101CA0023.namprd21.prod.outlook.com
 (2603:10b6:805:106::33) To SJ0PR10MB4750.namprd10.prod.outlook.com
 (2603:10b6:a03:2d5::7)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.50.86] (24.125.97.121) by
 SN6PR2101CA0023.namprd21.prod.outlook.com (2603:10b6:805:106::33) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3805.0 via Frontend
 Transport; Wed, 20 Jan 2021 05:28:16 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 16c89827-35f6-431e-8642-08d8bd0430c2
X-MS-TrafficTypeDiagnostic: SJ0PR10MB4752:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <SJ0PR10MB47520F42FA28C0418D7B4EF0C7A20@SJ0PR10MB4752.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: azeZhg+OLzDeVLHZuUxrScNAJisUUKm1eNiybd8ERZ+0fLEvS6DJ00GLKuZ3I1G/roDSBZE4BTZRMoti2GzHM3e6Au3q6QHb+3FuYXcwSdSspymDLAEF80uQ8MXiW7iS32WNaNLfXMODqmBdef2CWpprpAzO3yIQ1lrL5PNosNqKdvHmBKDzmzgf74GmSwAP8qY+Ne+8MK4hQ1NsUc4MHbNjE2SsVnraVuqJMUetQW8CeXQvi1t1JgX9pDZ0sYhqVx1nQpxUg6UOuSJdM27IDqpAwiyCBmipW25guGvt9SrIj+Z9B/n5TFmHF2d5MheHe66krktD4JYtl5DU4/CWDa+afjL1ln1c8nQ0u7B/USbJId5IsOkxN5GDJygdQQhqse3QD2ddSU5oyw3sTL1fZUUI9c06KLmdmN2upm6yVE6oWbzT3z93ELbqhQoD7eEB6TKu+WkUmXsWOOgotUu0HjwEgNRq9aUZFBnvGOSBn0XGA0nPj9Q/66NGaBn6+M19VNDIAfZMAnh78oUag0OjPUFpz/eymcj5Dlq3ot7pE2gkJk2XK/z25dladxV0Hmk2Py0wRLzJz1fFgiBRpXQXgM0rJ/Z/i4gUFndY87BTt1oJeVB8HBgL22wAAk1ZGHekuDvWIA6nOUuvqPuvatKPabnZalAEHovXtxOiLxrMaRLXpOtRGL5n5zKO8cgr+k0I
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ0PR10MB4750.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(396003)(39860400002)(136003)(376002)(346002)(366004)(110136005)(83380400001)(54906003)(6486002)(53546011)(16576012)(31696002)(956004)(4326008)(316002)(36756003)(16526019)(2616005)(66476007)(186003)(86362001)(26005)(36916002)(2906002)(66556008)(31686004)(966005)(478600001)(66946007)(5660300002)(8676002)(107886003)(8936002)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?V1gvQkk2OFZIcnJhY0NRbEZHWFkrTDBYK2p2UENJS1hieTJoaFJCUlg2R0t1?=
 =?utf-8?B?Y1lRVXFvV3VWbFZtaXJ5K09DY25sOWdTVzhLWkY0aDRhOFRiUDdOemJYYkNG?=
 =?utf-8?B?MUM2UHRzWmk5TjV3REg0Tlhteno5aHZMWkRtK3RmUVdWYW81NVNvOXRuaDB5?=
 =?utf-8?B?OHU1LzFUdFBYdlJBQTJFSk0wK09sOXBhQXZoMnM2WGFHeWRvKzJCWWF6YS9J?=
 =?utf-8?B?MGxwcnlRelZObFhEUmpiOC94ZnNPc25PZEk1RWk0WjdkQnJPZE9oSEtwcy8z?=
 =?utf-8?B?RDNJQTVpcnVqaXRzOWdzT05CaHM5RHlVZTlreVFuRHdaRzExM1JFd3crNDI0?=
 =?utf-8?B?SGM1Mlp6UVlhSk5jZ2FZTmJOa1B4WTJiOHJjcmtnSTVPT2RVWmVhdUI1UHdS?=
 =?utf-8?B?dHJQdVpWM1Yyd2pqS01ySm0vWlpUYlR2aWNMYUlkTzBpbTAxcmJBZzhEbmhn?=
 =?utf-8?B?bEgxVG5ZMk5vdkFvQkwxREtsTkhubDJ2Y21qNUU0bFI1a3RGWi9zNURPT0Ux?=
 =?utf-8?B?STZBbGRPYkt5L1lybXU2T1Z4UG42U1JEeE9mVkJ0RjVNeVlkNnVoRkF3WlBZ?=
 =?utf-8?B?Rk1SdkFtanBMLzMyMkxWdFNiSmtBNjBaUXIzMWJLUFF1ZVFBTjg1bUxjOW9K?=
 =?utf-8?B?c2E4cVVJMnlISjc4WU5qc3RHNjBheEpFd1FERnBRYzJhUVFKMGluUHZkdjkr?=
 =?utf-8?B?WFhabndOVjRZSGxvQ3lVN215QXd1VVY5RW1mcjJ1QlVvdWIyNmZUR1B5Mld5?=
 =?utf-8?B?a3lQckF5ZThKbi9GUEp2WlZhMTRuMU5xOFBIUmJudlFKc3lIMG5XR3RPc2x6?=
 =?utf-8?B?SzlrMTZyL0VTNUpYSnpRWjJjaXRjZDhZbWJlc215bEJqSlhSdEhTOHd1S1BF?=
 =?utf-8?B?Y3ZsZTVEYTVKc0RvekVuZWUvbitnUzc2NE1Ia1k4VUJVS2M3MVIyYVdrSnU0?=
 =?utf-8?B?R3pHVC9mUUlMNjArdzNwMlM2NmlwSUpOcVpqNWhSRDhEbzloSWp4SEZxVmxX?=
 =?utf-8?B?Z1NxQTE2aXdxU2xRSU9BVXdKNHU2ZldZVmJlRE5SV3E0SkpvZVcrN2tEaGpQ?=
 =?utf-8?B?SkMrdkhnUUFDZSt0N0ZpczVIY1NsTHhSakFGUDRBT0ZYb0pTUGdCbWIvY3VE?=
 =?utf-8?B?R2lhT1gwKzNWaVRUVTFiS3BMbWxSajZIa2M2TmlodWk0WllxbDV0bk11aVRt?=
 =?utf-8?B?dS9zblRpQVNUSStKaHhTQ3pYQm8zN09EVXBkQmYxTXlrK2xBQ0JCUVpFVThT?=
 =?utf-8?B?WTFaaGNYL0JWNDdtUGJqM1BYM1kxb1piMTJrcXl4akhvUHJtV2preFplUzUr?=
 =?utf-8?Q?ncK6pvxDW85JwhSie8Hnd+5Sbd2+38C0GL?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 16c89827-35f6-431e-8642-08d8bd0430c2
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR10MB4750.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jan 2021 05:28:17.0748 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: etHKerS/Y3xyEB08WID/CRkkXkoo1u2KbI3GQDCxQ3ETLf3TbtXJuDz82UcRspKpJYa4li/fnmltN6YRzB3b49FNfxBhOnd4ilQOhFHAhb4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR10MB4752
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9869
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0
 mlxscore=0 spamscore=0
 suspectscore=0 phishscore=0 adultscore=0 mlxlogscore=999 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2101200032
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9869
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 spamscore=0
 impostorscore=0 mlxscore=0 priorityscore=1501 phishscore=0 mlxlogscore=999
 lowpriorityscore=0 malwarescore=0 adultscore=0 clxscore=1011 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2101200031
Received-SPF: pass client-ip=156.151.31.86;
 envelope-from=alejandro.j.jimenez@oracle.com; helo=userp2130.oracle.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Mihai Carabas <mihai.carabas@oracle.com>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On 1/19/2021 4:34 PM, Peter Maydell wrote:
> On Tue, 15 Dec 2020 at 18:11, Paolo Bonzini <pbonzini@redhat.com> wrote:
>> From: Alejandro Jimenez <alejandro.j.jimenez@oracle.com>
>>
>> The current default action of pausing a guest after a panic event
>> is received leaves the responsibility to resume guest execution to the
>> management layer. The reasons for this behavior are discussed here:
>> https://lore.kernel.org/qemu-devel/52148F88.5000509@redhat.com/
>>
>> However, in instances like the case of older guests (Linux and
>> Windows) using a pvpanic device but missing support for the
>> PVPANIC_CRASHLOADED event, and Windows guests using the hv-crash
>> enlightenment, it is desirable to allow the guests to continue
>> running after sending a PVPANIC_PANICKED event. This allows such
>> guests to proceed to capture a crash dump and automatically reboot
>> without intervention of a management layer.
>>
>> Add an option to avoid stopping a VM after a panic event is received,
>> by passing:
>>
>> -action panic=none
>>
>> in the command line arguments, or during runtime by using an upcoming
>> QMP command.
> Hi. This commit message doesn't say it's changing the default
> action, but the change does:
>
>> @@ -3899,6 +3899,8 @@ DEF("action", HAS_ARG, QEMU_OPTION_action,
>>       "                   action when guest reboots [default=none]\n"
>>       "-action shutdown=poweroff|pause\n"
>>       "                   action when guest shuts down [default=poweroff]\n"
>> +    "-action panic=poweroff|pause|none\n"
>> +    "                   action when guest panics [default=poweroff]\n"
>>       "-action watchdog=reset|shutdown|poweroff|inject-nmi|pause|debug|none\n"
>>       "                   action when watchdog fires [default=reset]\n",
>>       QEMU_ARCH_ALL)
>>   RebootAction reboot_action = REBOOT_ACTION_NONE;
>>   ShutdownAction shutdown_action = SHUTDOWN_ACTION_POWEROFF;
>> +PanicAction panic_action = PANIC_ACTION_POWEROFF;
> We used to default to 'pause' and now we default to 'poweroff'.
Hi Peter.

My rationale for setting the panic action to 'poweroff' was to keep the 
default behavior of QEMU when '-no-shutdown' is not specified, and a 
panic occurs. I believe that in order to accomplish that, the default 
panic action should still be 'poweroff', but as you point out there is 
an instance where the behavior changes. Specifically, when 
'-no-shutdown' is not used there is now one fewer QMP event issued when 
a guest panic is detected, before stopping the VM and powering off.

I tried to account for this scenario in the original patches, but I 
failed to catch the problem after the rebase when the changes were 
merged. I'll test and send a fix for this issue in the next few days.

>
> We noticed this because it broke an in-flight test case for
> the pvpanic-pci device from Mihai (which was expecting to see
> the device in 'pause' state and found it was now in 'poweroff').
The test is just checking for the arrival of the QMP event, and not 
actually expecting the VM to be paused, correct? I see that if a 
test/management app is expecting to receive a GUEST_PANICKED event with 
the specific 'pause' action, then it might be confused. But any such 
tests would only be able to check for the arrival of the QMP event, and 
not actually expect to issue any commands to a paused VM, since the next 
block of code in QEMU immediately powers off and shutdowns when 
'-no-shutdown' is not requested. This was the typical behavior before 
the patches.

> Test cases aren't very exciting, but was it really intentional
> to change the default behaviour?
My intention was to preserve the default behavior. Perhaps Paolo wanted 
to reduce the number of GUEST_PANICKED events by removing the one with 
'pause' action? You could consider it superfluous since it is 
immediately followed by another indicating the 'poweroff' action... 
Unless I hear otherwise from either of you, I'll work on a fix to keep 
the same number and type of events sent.

Thank you,
Alejandro

>   It's part of the user-facing
> surface of QEMU, so if we did intend a default change that ought
> really to be more clearly stated (and noted in the Changelog) I think.
>
> thanks
> -- PMM


