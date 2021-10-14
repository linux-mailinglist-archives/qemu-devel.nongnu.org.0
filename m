Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D02D42E215
	for <lists+qemu-devel@lfdr.de>; Thu, 14 Oct 2021 21:38:10 +0200 (CEST)
Received: from localhost ([::1]:43652 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mb6YL-0006I1-Mu
	for lists+qemu-devel@lfdr.de; Thu, 14 Oct 2021 15:38:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48214)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.devolder@oracle.com>)
 id 1mb6T5-0001Ws-U8
 for qemu-devel@nongnu.org; Thu, 14 Oct 2021 15:32:43 -0400
Received: from mx0a-00069f02.pphosted.com ([205.220.165.32]:56412)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.devolder@oracle.com>)
 id 1mb6Sq-0000jf-P2
 for qemu-devel@nongnu.org; Thu, 14 Oct 2021 15:32:43 -0400
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 19EIFx2a022054; 
 Thu, 14 Oct 2021 19:32:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=message-id : date :
 subject : to : cc : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=corp-2021-07-09;
 bh=oQzlLbKPWl/T0oxFkr5kbSgnYmyQuAJH4EVLea7/uzM=;
 b=LhuM7qbFBJt++O7SYZzo8sTXlkJy3kixsYX1KSztT2Ou5hwBzca4rtyX3zwKGUuLg2ZC
 PRhNWiyz9qOa0uOxNMuo2TIav6nT9Ytv/8mUf2lNl1xwdttAukGwfViu1+Zb/B6fzP/i
 51MkfNRUKVhthCD+tr4SqQWFO6zzbCUESXZ6/I2AkXEjJTfVLVXjRKkmXIeiXYD04AlG
 CVhTBB67RGxpi0Vsr8XmOppTtLNUv0fOIOFkLDwvcdE5gjX232NYeaoIUxHE0AevfV+z
 MgSSsiEEUhpmtzDq/UjSA5G58SQnLFEHMAU7k0K73vIH1hhzjjhwos+B0OPo6oyzr3Dq aQ== 
Received: from aserp3030.oracle.com (aserp3030.oracle.com [141.146.126.71])
 by mx0b-00069f02.pphosted.com with ESMTP id 3bpfvecq7e-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 14 Oct 2021 19:32:20 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
 by aserp3030.oracle.com (8.16.1.2/8.16.1.2) with SMTP id 19EJGWxO043406;
 Thu, 14 Oct 2021 19:32:19 GMT
Received: from nam11-bn8-obe.outbound.protection.outlook.com
 (mail-bn8nam11lp2177.outbound.protection.outlook.com [104.47.58.177])
 by aserp3030.oracle.com with ESMTP id 3bkyxvtq2t-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 14 Oct 2021 19:32:19 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QhuSHvBrs6dRbieZQbf5KQ47jn++JqE5W9t+plTbVJIjQtUvjFzW4B98sWhSuyXTo6K1k2+he2aBcEP73rRMUszgdh20VM7BR6tRP0KKlS/ObwGkHvMCMIzea28bYfISxzu/MrN3L9hZzKTV1PBjY5KsE1inkGwLjTgvXJrESNObhxBU8cVKxM2OoJMPXeONP3gsHzS8aYKpqF1RGgEmI0ym1gTba14KwG0/JV0qahLQY2K0k6L/QVQLQXip2xHuaViC9qQn7eXJTfcIitltCpbMbnWE2tyXd6AbGTXHr/wvoRCt6RaWvwTAS7QqjutwvLNJ5jM7xXIau8Mxcn5z6w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oQzlLbKPWl/T0oxFkr5kbSgnYmyQuAJH4EVLea7/uzM=;
 b=cJAudAyWDzFPjp0OZZq/zIslOgnEHwRITfXU2CZO1K58V9QJuL8Ht4ItmZncNQ7wwJPtUS4TVDG31xBw/Vdtfk7hByE7hm/QKF4lP2HJBy96Lw3yh2QRlMshR866kAiXCm8b7ALWwDM1NGQ7/cIbzgx4vSVnzXNpmwAamrN0PXJiFOd4v70EoJ/RwdAvLPkL4Jppaca/EUc0uJIzS4UZvIYYpFrw7hkgYNKy+X+GUrDdczsdGSmobmGRSepMtlIbvDRO3ihpIiR0xQ9jL74trSLOs/y0K6mI9s1cYEtUunN8aGXYpv5XRGcSUw18YrsLuS+VrIb3MfwopJ+wH75C1w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oQzlLbKPWl/T0oxFkr5kbSgnYmyQuAJH4EVLea7/uzM=;
 b=lauUeUIrCcjIdk+Qe4df15CRBI/7RrfuWuob/gkTPUb3FwEKf6ivTh3/x2+u6PRg53bfktq5bXnq7QtzTv7NapBcAp9+wmIp8UqhzUBXVl+6iFVnpdyvjeq6Rjc7kxEpTezIuUEbRuCKojP/JZJ16iQFpGbO7ltLrkFRsdlyWT0=
Authentication-Results: anisinha.ca; dkim=none (message not signed)
 header.d=none;anisinha.ca; dmarc=none action=none header.from=oracle.com;
Received: from CO1PR10MB4531.namprd10.prod.outlook.com (2603:10b6:303:6c::22)
 by MWHPR1001MB2288.namprd10.prod.outlook.com (2603:10b6:301:2c::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4587.22; Thu, 14 Oct
 2021 19:32:17 +0000
Received: from CO1PR10MB4531.namprd10.prod.outlook.com
 ([fe80::90ef:e061:a4c2:acd6]) by CO1PR10MB4531.namprd10.prod.outlook.com
 ([fe80::90ef:e061:a4c2:acd6%9]) with mapi id 15.20.4608.017; Thu, 14 Oct 2021
 19:32:17 +0000
Message-ID: <e465219f-9d2e-63ec-1b54-7593c26e6a5c@oracle.com>
Date: Thu, 14 Oct 2021 14:32:13 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH v7 04/10] ACPI ERST: support for ACPI ERST feature
Content-Language: en-US
To: Ani Sinha <ani@anisinha.ca>
References: <1633626876-12115-1-git-send-email-eric.devolder@oracle.com>
 <1633626876-12115-5-git-send-email-eric.devolder@oracle.com>
 <alpine.DEB.2.22.394.2110080658350.820442@anisinha-lenovo>
From: Eric DeVolder <eric.devolder@oracle.com>
In-Reply-To: <alpine.DEB.2.22.394.2110080658350.820442@anisinha-lenovo>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR05CA0162.namprd05.prod.outlook.com
 (2603:10b6:a03:339::17) To CO1PR10MB4531.namprd10.prod.outlook.com
 (2603:10b6:303:6c::22)
MIME-Version: 1.0
Received: from [IPV6:2606:b400:414:8061:221:28ff:fea5:27c8]
 (2606:b400:8024:1010::112a) by SJ0PR05CA0162.namprd05.prod.outlook.com
 (2603:10b6:a03:339::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4628.9 via Frontend
 Transport; Thu, 14 Oct 2021 19:32:15 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ff491f52-d650-4e84-30a1-08d98f4954a3
X-MS-TrafficTypeDiagnostic: MWHPR1001MB2288:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <MWHPR1001MB2288D9C8BFAB4F443A6C39B897B89@MWHPR1001MB2288.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3968;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Kzvc08ltCfr/wr7T1wgXEjNoHhVqhyB0+TUeoGXd+8QCxZb6pvkZelj2VmoCI5pb9HAYmd7mwWh9+ntw6GZh/5JhXtQOlJ3w0ZaaBbd9L15YriOH6MQl+tkEceVeJdB6COsNQ8DyBzx2jYRxpZZetWXXLOd8AaK2Oe0CxetYwjYh9qM1v/TC6c+WlFBUN9MsJ6/IUVsePpBjjQiIi60S6WEYbIpJqaqWs2qfVvwgjJNnfbB/WDeJw48Bc5MJcltSDApSdpIEzWTyB/OPPwwkHwnMqkviEZ+pP9yVE2yBgk8L7OgFRmYd5KTR2QbjSJfq8tirXH0ceNAXy4nafP/2Uleh9393ri5kubcfgebhpRAkV/198BBPtY/3bAwo+yv78xzpcaxrC1rVjD+Z+iX5d+VbC0dU38Hm3R4LSrBhvXp2lkN/PjT1xCPEq/hLByvD4yHfujKilnfgRYRruMbV18XjK5YTZToz56gmhiABGgRW3qfEYaxhbebjj8tTvMFMr7YtTyIJW8AixpLQCGtqowdYwQWTk/LeqEdAjZMhfSxE5cl/c7k9PCaJFtJ53P0dku+wTyO6MU7z4qn0p0I6jnOmaqy0Kdp9ZukwMrO1gF6c9t28RmHW5qKQu5YnH3SUVWLdTiwqquCLaJYsKyNxBMBqggJ+fmIzgSFrW7sgsSU+h0Pg8BXwXVNUQdSn1Pa2BcqMhtKmuWxP7tO9l52XebyJvxkYak3iJB+ztEQQ58k=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO1PR10MB4531.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(186003)(31686004)(38100700002)(508600001)(66946007)(31696002)(4326008)(30864003)(2616005)(8676002)(107886003)(66476007)(6486002)(2906002)(53546011)(83380400001)(5660300002)(66556008)(316002)(86362001)(8936002)(36756003)(6916009)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NHVIQTY1ZmlCeFh1UHdJeisrdXpTN0VaT0k3cEE2Q3c4dTlCUzNRU0VqbXpB?=
 =?utf-8?B?Nlh4eVd5U24yZ0tBMUI2QmxFSkVtMko2N3VkQ1NndUFQMktsM0VWVC9Ed1Ni?=
 =?utf-8?B?UEJ1TkxLb3RNZk5lcWpscnF5YkFqWE82TDlXN09EWGpqV1pNL3J0bURYUDRh?=
 =?utf-8?B?MWxXMm9ZK3dxSkh1T0NwQVRpYlhNRTBUUm5MODVicnlzSFVsdTd4SkRKbzN2?=
 =?utf-8?B?SUNFRncxUXB5dDdlS0w1L1dWZldWcEdyN1AwK2l4YXlBSmQvMUl4RG5mMG92?=
 =?utf-8?B?ZmZBZkNJbFhUMGhVNHpuOUFKNGV0ZjNiWkdlaTByR1NPR3FGRmJXelloRGRl?=
 =?utf-8?B?UEZ6eDh4UDVDRW1ld2RaazNIcE93S1gvVENyN3o1Q3pMZU5VcDAvQzlTV2FH?=
 =?utf-8?B?dG90ZktvcjRrQXMwSDg0VWhCR1E3YjRhVjVnWURNMUtyeUZ6WHZEMGdnMGZv?=
 =?utf-8?B?eTJwSmFybzFRT2JZd2thWS96eGlKclh6c3V1ak1HVjZURHRlY0Y3WkNHM21N?=
 =?utf-8?B?NDFSZFdUZjBtYUhlUllJelBMYzhzUVA1aExUZzJJdXVYT24xMlZBZVFSSmdi?=
 =?utf-8?B?QWJ0bnNnU3lGYU1wb1d4YWhwckRPeHNjdHlCMU0reGdIMXkvYWMxZS9iQkIy?=
 =?utf-8?B?WFpsczJqa3BkMlFoS25RVnZvWWZUeTFyZnhnUEt0VkJNZjh2MEZKM2ZyS1Fo?=
 =?utf-8?B?MU1JUVM2RzBHbkNOREEzaERpMUI0UEs3M0V2ckFTTSt3OFhLZVhxM3luZHlH?=
 =?utf-8?B?UlQ1L1d4cUdEa3VYWXNnc1BFaW9oV0ZvS2pRaHNNWmFLMlFaRmRHN1lHNTBW?=
 =?utf-8?B?cDZRSHBEZFNaZURLU1hzSHNqWG9sYUFJK2lFeFR2ZWJJbWpTV1E1SzlXSFFD?=
 =?utf-8?B?Mm82aWxqZ0RRWXMwTmRVcGEwQTZYZTZtaC93bmpIME1FQlJCclV0QjMyR016?=
 =?utf-8?B?REdxUTI0ZVJLTllsMFZ2R2pFV1NWWmdzQW5CSnNVdzBDM3BpU0Z2bzJvUkpx?=
 =?utf-8?B?SFAvaCszSVJFMXU3U0xZclc3ZVE0Q2ZqRFhUNkNYQUg5QU9YaXJHeUd2VUNq?=
 =?utf-8?B?QklldXBqaExBWml0ckhVUWx4b095Z2h3aGZYOVhYNmNzZDlVVWo0Qi95dFAx?=
 =?utf-8?B?cnBqUDVOOXNVQkJGa01ubjF3MTBjeVJiajkzTTgzU28vRWFtdEJ2NTVnR0JU?=
 =?utf-8?B?ZWZwcituU285QkhwRDdnNDBEdFY5Q3czelRWNTVYTWpmajRhTzViS1JsZ3hh?=
 =?utf-8?B?Y1l6N0NDZmxZc3NBaVVMSDVSQUgwVVFPS0Q1L05XUFlCZ3dFMEp2RncrbTE0?=
 =?utf-8?B?Tmova3N1Z1hTSzR1TEdHZ0pVTnNOclFaRWJQelN0ZmR6RGl5eE5reWxEYi9n?=
 =?utf-8?B?Zm41Wm1WVGxWNE43enBaekZqN1VsU3lRVStlcDFOOUhINXVha2tDK0xLeUNa?=
 =?utf-8?B?STFqcjZ4cW4yaDZ1T2NWN3ZlRDUrQyttbGtCdk0rdTUwbFNqOFhIeFoxK2Z0?=
 =?utf-8?B?QW5aakF3emxzeFFRcFFzb3EvK1V4VWordE40c2YwVFAwcE52dy9ubHoxRVNQ?=
 =?utf-8?B?aWN3Mzl0Q3F2bnRkVit5dCtoeVNiM3Y5WjBlRWppRXVqaEd5bk4zYW4wTzUx?=
 =?utf-8?B?bnhYVTdiWHA0Y0wzRExFaTZxNkpxZUJaRzdFRmppZ1RSNDBva29YNmQrTktE?=
 =?utf-8?B?cmM4YWlqZnBZaWJTamJGMHMyRFRlOUw4TUNyWVBvNDZFYjJFcHFrUVJPRmN4?=
 =?utf-8?B?N3I3RjlDYk5oSTlKd2lPZVhNc1U1SWFMMWRyenR4L3puZkhRREl6T1kyOXQ3?=
 =?utf-8?B?dkpucUlSK29UbFQvQkozUT09?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ff491f52-d650-4e84-30a1-08d98f4954a3
X-MS-Exchange-CrossTenant-AuthSource: CO1PR10MB4531.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Oct 2021 19:32:16.7141 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gdAmIOfrTAmjP+Gy9qo96LynZtSGlgJEnDaHwQoYrGuNRJnyft8cHfKoFsK6pHbBERGo54EMIn+B9VVCy3zQ77Z3FkzzBwIs+ZGnHiWRNis=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR1001MB2288
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10137
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0
 phishscore=0 suspectscore=0
 mlxlogscore=999 mlxscore=0 bulkscore=0 adultscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2109230001
 definitions=main-2110140109
X-Proofpoint-GUID: cSQoJfOmJztED6Y13lShBNGVr2o23xJ9
X-Proofpoint-ORIG-GUID: cSQoJfOmJztED6Y13lShBNGVr2o23xJ9
Received-SPF: pass client-ip=205.220.165.32;
 envelope-from=eric.devolder@oracle.com; helo=mx0a-00069f02.pphosted.com
X-Spam_score_int: -1
X-Spam_score: -0.2
X-Spam_bar: /
X-Spam_report: (-0.2 / 5.0 requ) DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, MSGID_FROM_MTA_HEADER=0.001,
 NICE_REPLY_A=-0.001, SPF_HELO_NONE=0.001,
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
Cc: berrange@redhat.com, ehabkost@redhat.com, mst@redhat.com,
 konrad.wilk@oracle.com, qemu-devel@nongnu.org, pbonzini@redhat.com,
 imammedo@redhat.com, boris.ostrovsky@oracle.com, rth@twiddle.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Ani,
Inline responses below.
eric


On 10/7/21 20:29, Ani Sinha wrote:
> 
> 
> On Thu, 7 Oct 2021, Eric DeVolder wrote:
> 
>> This implements a PCI device for ACPI ERST. This implements the
>> non-NVRAM "mode" of operation for ERST as it is supported by
>> Linux and Windows.
>>
>> Signed-off-by: Eric DeVolder <eric.devolder@oracle.com>
>> ---
>>   hw/acpi/erst.c       | 836 +++++++++++++++++++++++++++++++++++++++++++++++++++
>>   hw/acpi/meson.build  |   1 +
>>   hw/acpi/trace-events |  15 +
>>   3 files changed, 852 insertions(+)
>>   create mode 100644 hw/acpi/erst.c
>>
>> diff --git a/hw/acpi/erst.c b/hw/acpi/erst.c
>> new file mode 100644
>> index 0000000..af7e1a9
>> --- /dev/null
>> +++ b/hw/acpi/erst.c
>> @@ -0,0 +1,836 @@
>> +/*
>> + * ACPI Error Record Serialization Table, ERST, Implementation
>> + *
>> + * ACPI ERST introduced in ACPI 4.0, June 16, 2009.
>> + * ACPI Platform Error Interfaces : Error Serialization
>> + *
>> + * Copyright (c) 2021 Oracle and/or its affiliates.
>> + *
>> + * SPDX-License-Identifier: GPL-2.0-or-later
>> + */
>> +
>> +#include <sys/types.h>
>> +#include <sys/stat.h>
>> +#include <unistd.h>
>> +
>> +#include "qemu/osdep.h"
>> +#include "qapi/error.h"
>> +#include "hw/qdev-core.h"
>> +#include "exec/memory.h"
>> +#include "qom/object.h"
>> +#include "hw/pci/pci.h"
>> +#include "qom/object_interfaces.h"
>> +#include "qemu/error-report.h"
>> +#include "migration/vmstate.h"
>> +#include "hw/qdev-properties.h"
>> +#include "hw/acpi/acpi.h"
>> +#include "hw/acpi/acpi-defs.h"
>> +#include "hw/acpi/aml-build.h"
>> +#include "hw/acpi/bios-linker-loader.h"
>> +#include "exec/address-spaces.h"
>> +#include "sysemu/hostmem.h"
>> +#include "hw/acpi/erst.h"
>> +#include "trace.h"
>> +
>> +/* ACPI 4.0: Table 17-16 Serialization Actions */
>> +#define ACTION_BEGIN_WRITE_OPERATION         0x0
>> +#define ACTION_BEGIN_READ_OPERATION          0x1
>> +#define ACTION_BEGIN_CLEAR_OPERATION         0x2
>> +#define ACTION_END_OPERATION                 0x3
>> +#define ACTION_SET_RECORD_OFFSET             0x4
>> +#define ACTION_EXECUTE_OPERATION             0x5
>> +#define ACTION_CHECK_BUSY_STATUS             0x6
>> +#define ACTION_GET_COMMAND_STATUS            0x7
>> +#define ACTION_GET_RECORD_IDENTIFIER         0x8
>> +#define ACTION_SET_RECORD_IDENTIFIER         0x9
>> +#define ACTION_GET_RECORD_COUNT              0xA
>> +#define ACTION_BEGIN_DUMMY_WRITE_OPERATION   0xB
>> +#define ACTION_RESERVED                      0xC
>> +#define ACTION_GET_ERROR_LOG_ADDRESS_RANGE   0xD
>> +#define ACTION_GET_ERROR_LOG_ADDRESS_LENGTH  0xE
>> +#define ACTION_GET_ERROR_LOG_ADDRESS_RANGE_ATTRIBUTES 0xF
>> +#define ACTION_GET_EXECUTE_OPERATION_TIMINGS 0x10
>> +
>> +/* ACPI 4.0: Table 17-17 Command Status Definitions */
>> +#define STATUS_SUCCESS                0x00
>> +#define STATUS_NOT_ENOUGH_SPACE       0x01
>> +#define STATUS_HARDWARE_NOT_AVAILABLE 0x02
>> +#define STATUS_FAILED                 0x03
>> +#define STATUS_RECORD_STORE_EMPTY     0x04
>> +#define STATUS_RECORD_NOT_FOUND       0x05
>> +
>> +
>> +/* UEFI 2.1: Appendix N Common Platform Error Record */
>> +#define UEFI_CPER_RECORD_MIN_SIZE 128U
>> +#define UEFI_CPER_RECORD_LENGTH_OFFSET 20U
>> +#define UEFI_CPER_RECORD_ID_OFFSET 96U
>> +#define IS_UEFI_CPER_RECORD(ptr) \
>> +    (((ptr)[0] == 'C') && \
>> +     ((ptr)[1] == 'P') && \
>> +     ((ptr)[2] == 'E') && \
>> +     ((ptr)[3] == 'R'))
>> +
>> +/*
>> + * NOTE that when accessing CPER fields within a record, memcpy()
>> + * is utilized to avoid a possible misaligned access on the host.
>> + */
>> +
>> +/*
>> + * This implementation is an ACTION (cmd) and VALUE (data)
>> + * interface consisting of just two 64-bit registers.
>> + */
>> +#define ERST_REG_SIZE (16UL)
>> +#define ERST_ACTION_OFFSET (0UL) /* action (cmd) */
>> +#define ERST_VALUE_OFFSET  (8UL) /* argument/value (data) */
>> +
>> +/*
>> + * ERST_RECORD_SIZE is the buffer size for exchanging ERST
>> + * record contents. Thus, it defines the maximum record size.
>> + * As this is mapped through a PCI BAR, it must be a power of
>> + * two and larger than UEFI_CPER_RECORD_MIN_SIZE.
>> + * The backing storage is divided into fixed size "slots",
>> + * each ERST_RECORD_SIZE in length, and each "slot"
>> + * storing a single record. No attempt at optimizing storage
>> + * through compression, compaction, etc is attempted.
>> + * NOTE that slot 0 is reserved for the backing storage header.
>> + * Depending upon the size of the backing storage, additional
>> + * slots will be part of the slot 0 header in order to account
>> + * for a record_id for each available remaining slot.
>> + */
>> +/* 8KiB records, not too small, not too big */
>> +#define ERST_RECORD_SIZE (8192UL)
>> +
>> +#define ACPI_ERST_MEMDEV_PROP "memdev"
>> +#define ACPI_ERST_RECORD_SIZE_PROP "record_size"
>> +
>> +/*
>> + * From the ACPI ERST spec sections:
>> + * A record id of all 0s is used to indicate 'unspecified' record id.
>> + * A record id of all 1s is used to indicate empty or end.
>> + */
>> +#define ERST_UNSPECIFIED_RECORD_ID (0UL)
>> +#define ERST_EMPTY_END_RECORD_ID (~0UL)
>> +#define ERST_EXECUTE_OPERATION_MAGIC 0x9CUL
>> +#define ERST_IS_VALID_RECORD_ID(rid) \
>> +    ((rid != ERST_UNSPECIFIED_RECORD_ID) && \
>> +     (rid != ERST_EMPTY_END_RECORD_ID))
>> +#define ERST_STORE_MAGIC 0x524F545354535245UL /* ERSTSTOR */
>> +
>> +typedef struct {
>> +    uint64_t magic;
>> +    uint32_t record_size;
>> +    uint32_t storage_offset; /* offset to record storage beyond header */
>> +    uint16_t version;
>> +    uint16_t reserved;
>> +    uint32_t record_count;
>> +    uint64_t map[]; /* contains record_ids, and position indicates index */
>> +} __attribute__((packed)) ERSTStorageHeader;
>> +
>> +/*
>> + * Object cast macro
>> + */
>> +#define ACPIERST(obj) \
>> +    OBJECT_CHECK(ERSTDeviceState, (obj), TYPE_ACPI_ERST)
>> +
>> +/*
>> + * Main ERST device state structure
>> + */
>> +typedef struct {
>> +    PCIDevice parent_obj;
>> +
>> +    /* Backend storage */
>> +    HostMemoryBackend *hostmem;
>> +    MemoryRegion *hostmem_mr;
>> +    uint32_t storage_size;
>> +    uint32_t default_record_size;
>> +
>> +    /* Programming registers */
>> +    MemoryRegion iomem_mr;
>> +
>> +    /* Exchange buffer */
>> +    MemoryRegion exchange_mr;
>> +
>> +    /* Interface state */
>> +    uint8_t operation;
>> +    uint8_t busy_status;
>> +    uint8_t command_status;
>> +    uint32_t record_offset;
>> +    uint64_t reg_action;
>> +    uint64_t reg_value;
>> +    uint64_t record_identifier;
>> +    ERSTStorageHeader *header;
>> +    unsigned first_record_index;
>> +    unsigned last_record_index;
>> +    unsigned next_record_index;
>> +
>> +} ERSTDeviceState;
>> +
>> +/*******************************************************************/
>> +/*******************************************************************/
>> +
>> +static uint8_t *get_nvram_ptr_by_index(ERSTDeviceState *s, unsigned index)
>> +{
>> +    uint8_t *rc = NULL;
>> +    off_t offset = (index * le32_to_cpu(s->header->record_size));
>> +
>> +    g_assert(offset < s->storage_size);
>> +
>> +    rc = memory_region_get_ram_ptr(s->hostmem_mr);
>> +    rc += offset;
>> +
>> +    return rc;
>> +}
>> +
>> +static void make_erst_storage_header(ERSTDeviceState *s)
>> +{
>> +    ERSTStorageHeader *header = s->header;
>> +    unsigned mapsz, headersz;
>> +
>> +    header->magic = cpu_to_le64(ERST_STORE_MAGIC);
>> +    header->record_size = cpu_to_le32(s->default_record_size);
>> +    header->version = cpu_to_le16(0x0100);
>> +    header->reserved = cpu_to_le16(0x0000);
>> +
>> +    /* Compute mapsize */
>> +    mapsz = s->storage_size / s->default_record_size;
>> +    mapsz *= sizeof(uint64_t);
>> +    /* Compute header+map size */
>> +    headersz = sizeof(ERSTStorageHeader) + mapsz;
>> +    /* Round up to nearest integer multiple of ERST_RECORD_SIZE */
>> +    headersz = QEMU_ALIGN_UP(headersz, s->default_record_size);
>> +    header->storage_offset = cpu_to_le32(headersz);
>> +
>> +    /*
>> +     * The HostMemoryBackend initializes contents to zero,
>> +     * so all record_ids stashed in the map are zero'd.
>> +     * As well the record_count is zero. Properly initialized.
>> +     */
>> +}
>> +
>> +static void check_erst_backend_storage(ERSTDeviceState *s, Error **errp)
>> +{
>> +    ERSTStorageHeader *header;
>> +    uint32_t record_size;
>> +
>> +    header = memory_region_get_ram_ptr(s->hostmem_mr);
>> +    s->header = header;
>> +
>> +    /* Ensure pointer to header is 64-bit aligned */
>> +    g_assert(QEMU_PTR_IS_ALIGNED(header, sizeof(uint64_t)));
>> +
>> +    /*
>> +     * Check if header is uninitialized; HostMemoryBackend inits to 0
>> +     */
>> +    if (le64_to_cpu(header->magic) == 0UL) {
>> +        make_erst_storage_header(s);
>> +    }
>> +
>> +    /* Validity check record_size */
>> +    record_size = le32_to_cpu(header->record_size);
>> +    if (!(
>> +        (record_size) && /* non zero */
>> +        (record_size >= UEFI_CPER_RECORD_MIN_SIZE) &&
>> +        (((record_size - 1) & record_size) == 0) && /* is power of 2 */
>> +        (record_size >= 4096) /* PAGE_SIZE */
>> +        )) {
>> +        error_setg(errp, "ERST record_size %u is invalid", record_size);
>> +    }
>> +
>> +    /* Validity check header */
>> +    if (!(
>> +        (le64_to_cpu(header->magic) == ERST_STORE_MAGIC) &&
>> +        ((le32_to_cpu(header->storage_offset) % record_size) == 0) &&
>> +        (le16_to_cpu(header->version) == 0x0100) &&
>> +        (le16_to_cpu(header->reserved) == 0)
>> +        )) {
>> +        error_setg(errp, "ERST backend storage header is invalid");
>> +    }
>> +
>> +    /* Check storage_size against record_size */
>> +    if (((s->storage_size % record_size) != 0) ||
>> +         (record_size > s->storage_size)) {
>> +        error_setg(errp, "ACPI ERST requires size be multiple of "
>> +            "record size (%uKiB)", record_size);
>> +    }
>> +
>> +    /* Compute offset of first and last record storage slot */
>> +    s->first_record_index = le32_to_cpu(header->storage_offset)
>> +        / record_size;
>> +    s->last_record_index = (s->storage_size / record_size);
>> +}
>> +
>> +static void update_map_entry(ERSTDeviceState *s, unsigned index,
>> +    uint64_t record_id)
>> +{
>> +    if (index < s->last_record_index) {
>> +        s->header->map[index] = cpu_to_le64(record_id);
>> +    }
>> +}
>> +
>> +static unsigned allocate_erst_record(ERSTDeviceState *s)
>> +{
>> +    unsigned rc = 0; /* 0 not a valid index */
>> +    unsigned index = s->first_record_index;
>> +
>> +    for (; index < s->last_record_index; ++index) {
>> +        if (le64_to_cpu(s->header->map[index]) == ERST_UNSPECIFIED_RECORD_ID) {
>> +            rc = index;
>> +            break;
>> +        }
>> +    }
>> +
>> +    return rc;
>> +}
>> +
>> +static unsigned lookup_erst_record(ERSTDeviceState *s,
>> +    uint64_t record_identifier)
>> +{
>> +    unsigned rc = 0; /* 0 not a valid index */
>> +
>> +    /* Find the record_identifier in the map */
>> +    if (record_identifier != ERST_UNSPECIFIED_RECORD_ID) {
>> +        /*
>> +         * Count number of valid records encountered, and
>> +         * short-circuit the loop if identifier not found
>> +         */
>> +        uint32_t record_count = le32_to_cpu(s->header->record_count);
>> +        unsigned count = 0;
>> +        unsigned index;
>> +        for (index = s->first_record_index; index < s->last_record_index &&
>> +                count < record_count; ++index) {
>> +            if (le64_to_cpu(s->header->map[index]) == record_identifier) {
>> +                rc = index;
>> +                break;
>> +            }
>> +            if (le64_to_cpu(s->header->map[index]) !=
>> +                ERST_UNSPECIFIED_RECORD_ID) {
>> +                ++count;
>> +            }
>> +        }
>> +    }
>> +
>> +    return rc;
>> +}
>> +
>> +/*
>> + * ACPI 4.0: 17.4.1.1 Serialization Actions, also see
>> + * ACPI 4.0: 17.4.2.2 Operations - Reading 6.c and 2.c
>> + */
>> +static unsigned get_next_record_identifier(ERSTDeviceState *s,
>> +    uint64_t *record_identifier, bool first)
>> +{
>> +    unsigned found = 0;
>> +    unsigned index;
>> +
>> +    /* For operations needing to return 'first' record identifer */
>> +    if (first) {
>> +        /* Reset initial index to beginning */
>> +        s->next_record_index = s->first_record_index;
>> +    }
>> +    index = s->next_record_index;
>> +
>> +    *record_identifier = ERST_EMPTY_END_RECORD_ID;
>> +
>> +    if (le32_to_cpu(s->header->record_count)) {
>> +        for (; index < s->last_record_index; ++index) {
>> +            if (le64_to_cpu(s->header->map[index]) !=
>> +                    ERST_UNSPECIFIED_RECORD_ID) {
>> +                    /* where to start next time */
>> +                    s->next_record_index = index + 1;
>> +                    *record_identifier = le64_to_cpu(s->header->map[index]);
>> +                    found = 1;
>> +                    break;
>> +            }
>> +        }
>> +    }
>> +    if (!found) {
>> +        /* at end (ie scan complete), reset */
>> +        s->next_record_index = s->first_record_index;
>> +    }
>> +
>> +    return STATUS_SUCCESS;
>> +}
>> +
>> +/* ACPI 4.0: 17.4.2.3 Operations - Clearing */
>> +static unsigned clear_erst_record(ERSTDeviceState *s)
>> +{
>> +    unsigned rc = STATUS_RECORD_NOT_FOUND;
>> +    unsigned index;
>> +
>> +    /* Check for valid record identifier */
>> +    if (!ERST_IS_VALID_RECORD_ID(s->record_identifier)) {
>> +        return STATUS_FAILED;
>> +    }
>> +
>> +    index = lookup_erst_record(s, s->record_identifier);
>> +    if (index) {
>> +        /* No need to wipe record, just invalidate its map entry */
>> +        uint32_t record_count;
>> +        update_map_entry(s, index, ERST_UNSPECIFIED_RECORD_ID);
>> +        record_count = le32_to_cpu(s->header->record_count);
>> +        record_count -= 1;
>> +        s->header->record_count = cpu_to_le32(record_count);
>> +        rc = STATUS_SUCCESS;
>> +    }
>> +
>> +    return rc;
>> +}
>> +
>> +/* ACPI 4.0: 17.4.2.2 Operations - Reading */
>> +static unsigned read_erst_record(ERSTDeviceState *s)
>> +{
>> +    unsigned rc = STATUS_RECORD_NOT_FOUND;
>> +    unsigned exchange_length;
>> +    unsigned index;
>> +
>> +    /* Check if backend storage is empty */
>> +    if (le32_to_cpu(s->header->record_count) == 0) {
>> +        return STATUS_RECORD_STORE_EMPTY;
>> +    }
>> +
>> +    exchange_length = memory_region_size(&s->exchange_mr);
>> +
>> +    /* Check for record identifier of all 0s */
>> +    if (s->record_identifier == ERST_UNSPECIFIED_RECORD_ID) {
>> +        /* Set to 'first' record in storage */
>> +        get_next_record_identifier(s, &s->record_identifier, true);
>> +        /* record_identifier is now a valid id, or all 1s */
>> +    }
>> +
>> +    /* Check for record identifier of all 1s */
>> +    if (s->record_identifier == ERST_EMPTY_END_RECORD_ID) {
>> +        return STATUS_FAILED;
>> +    }
>> +
>> +    /* Validate record_offset */
>> +    if (s->record_offset > (exchange_length - UEFI_CPER_RECORD_MIN_SIZE)) {
>> +        return STATUS_FAILED;
>> +    }
>> +
>> +    index = lookup_erst_record(s, s->record_identifier);
>> +    if (index) {
>> +        uint8_t *nvram;
>> +        uint8_t *exchange;
>> +        uint32_t record_length;
>> +
>> +        /* Obtain pointer to the exchange buffer */
>> +        exchange = memory_region_get_ram_ptr(&s->exchange_mr);
>> +        exchange += s->record_offset;
>> +        /* Obtain pointer to slot in storage */
>> +        nvram = get_nvram_ptr_by_index(s, index);
>> +        /* Validate CPER record_length */
>> +        memcpy((uint8_t *)&record_length,
>> +            &nvram[UEFI_CPER_RECORD_LENGTH_OFFSET],
>> +            sizeof(uint32_t));
>> +        record_length = le32_to_cpu(record_length);
>> +        if (record_length < UEFI_CPER_RECORD_MIN_SIZE) {
>> +            rc = STATUS_FAILED;
>> +        }
>> +        if ((s->record_offset + record_length) > exchange_length) {
>> +            rc = STATUS_FAILED;
>> +        }
>> +        /* If all is ok, copy the record to the exchange buffer */
>> +        if (rc != STATUS_FAILED) {
>> +            memcpy(exchange, nvram, record_length);
>> +            rc = STATUS_SUCCESS;
>> +        }
>> +    } else {
>> +        /* Set to 'first' record in storage */
>> +        get_next_record_identifier(s, &s->record_identifier, true);
>> +    }
>> +
>> +    return rc;
>> +}
>> +
>> +/* ACPI 4.0: 17.4.2.1 Operations - Writing */
>> +static unsigned write_erst_record(ERSTDeviceState *s)
>> +{
>> +    unsigned rc = STATUS_FAILED;
>> +    unsigned exchange_length;
>> +    unsigned index;
>> +    uint64_t record_identifier;
>> +    uint32_t record_length;
>> +    uint8_t *exchange;
>> +    uint8_t *nvram = NULL;
>> +    bool record_found = false;
>> +
>> +    exchange_length = memory_region_size(&s->exchange_mr);
>> +
>> +    /* Validate record_offset */
>> +    if (s->record_offset > (exchange_length - UEFI_CPER_RECORD_MIN_SIZE)) {
>> +        return STATUS_FAILED;
>> +    }
>> +
>> +    /* Obtain pointer to record in the exchange buffer */
>> +    exchange = memory_region_get_ram_ptr(&s->exchange_mr);
>> +    exchange += s->record_offset;
>> +
>> +    /* Validate CPER record_length */
>> +    memcpy((uint8_t *)&record_length, &exchange[UEFI_CPER_RECORD_LENGTH_OFFSET],
>> +        sizeof(uint32_t));
>> +    record_length = le32_to_cpu(record_length);
>> +    if (record_length < UEFI_CPER_RECORD_MIN_SIZE) {
>> +        return STATUS_FAILED;
>> +    }
>> +    if ((s->record_offset + record_length) > exchange_length) {
>> +        return STATUS_FAILED;
>> +    }
>> +
>> +    /* Extract record identifier */
>> +    memcpy((uint8_t *)&record_identifier, &exchange[UEFI_CPER_RECORD_ID_OFFSET],
>> +        sizeof(uint64_t));
>> +    record_identifier = le64_to_cpu(record_identifier);
>> +
>> +    /* Check for valid record identifier */
>> +    if (!ERST_IS_VALID_RECORD_ID(record_identifier)) {
>> +        return STATUS_FAILED;
>> +    }
>> +
>> +    index = lookup_erst_record(s, record_identifier);
>> +    if (index) {
>> +        /* Record found, overwrite existing record */
>> +        nvram = get_nvram_ptr_by_index(s, index);
>> +        record_found = true;
>> +    } else {
>> +        /* Record not found, not an overwrite, allocate for write */
>> +        index = allocate_erst_record(s);
>> +        if (index) {
>> +            nvram = get_nvram_ptr_by_index(s, index);
>> +        } else {
>> +            rc = STATUS_NOT_ENOUGH_SPACE;
>> +        }
>> +    }
>> +    if (nvram) {
>> +        /* Write the record into the slot */
>> +        memcpy(nvram, exchange, record_length);
>> +        memset(nvram + record_length, exchange_length - record_length, 0xFF);
>> +        /* If a new record, increment the record_count */
>> +        if (!record_found) {
>> +            uint32_t record_count;
>> +            record_count = le32_to_cpu(s->header->record_count);
>> +            record_count += 1; /* writing new record */
>> +            s->header->record_count = cpu_to_le32(record_count);
>> +        }
>> +        update_map_entry(s, index, record_identifier);
>> +        rc = STATUS_SUCCESS;
>> +    }
>> +
>> +    return rc;
>> +}
>> +
>> +/*******************************************************************/
>> +
>> +static uint64_t erst_rd_reg64(hwaddr addr,
>> +    uint64_t reg, unsigned size)
>> +{
>> +    uint64_t rdval;
>> +    uint64_t mask;
>> +    unsigned shift;
>> +
>> +    if (size == sizeof(uint64_t)) {
>> +        /* 64b access */
>> +        mask = 0xFFFFFFFFFFFFFFFFUL;
>> +        shift = 0;
>> +    } else {
>> +        /* 32b access */
>> +        mask = 0x00000000FFFFFFFFUL;
>> +        shift = ((addr & 0x4) == 0x4) ? 32 : 0;
>> +    }
>> +
>> +    rdval = reg;
>> +    rdval >>= shift;
>> +    rdval &= mask;
>> +
>> +    return rdval;
>> +}
>> +
>> +static uint64_t erst_wr_reg64(hwaddr addr,
>> +    uint64_t reg, uint64_t val, unsigned size)
>> +{
>> +    uint64_t wrval;
>> +    uint64_t mask;
>> +    unsigned shift;
>> +
>> +    if (size == sizeof(uint64_t)) {
>> +        /* 64b access */
>> +        mask = 0xFFFFFFFFFFFFFFFFUL;
>> +        shift = 0;
>> +    } else {
>> +        /* 32b access */
>> +        mask = 0x00000000FFFFFFFFUL;
>> +        shift = ((addr & 0x4) == 0x4) ? 32 : 0;
>> +    }
>> +
>> +    val &= mask;
>> +    val <<= shift;
>> +    mask <<= shift;
>> +    wrval = reg;
>> +    wrval &= ~mask;
>> +    wrval |= val;
>> +
>> +    return wrval;
>> +}
>> +
>> +static void erst_reg_write(void *opaque, hwaddr addr,
>> +    uint64_t val, unsigned size)
>> +{
>> +    ERSTDeviceState *s = (ERSTDeviceState *)opaque;
>> +
>> +    /*
>> +     * NOTE: All actions/operations/side effects happen on the WRITE,
>> +     * by this implementation's design. The READs simply return the
>> +     * reg_value contents.
>> +     */
>> +    trace_acpi_erst_reg_write(addr, val, size);
>> +
>> +    switch (addr) {
>> +    case ERST_VALUE_OFFSET + 0:
>> +    case ERST_VALUE_OFFSET + 4:
>> +        s->reg_value = erst_wr_reg64(addr, s->reg_value, val, size);
>> +        break;
>> +    case ERST_ACTION_OFFSET + 0:
>> +        /*
>> +         * NOTE: all valid values written to this register are of the
>> +         * ACTION_* variety. Thus there is no need to make this a 64-bit
>> +         * register, 32-bits is appropriate. As such ERST_ACTION_OFFSET+4
>> +         * is not needed.
>> +         */
>> +        switch (val) {
>> +        case ACTION_BEGIN_WRITE_OPERATION:
>> +        case ACTION_BEGIN_READ_OPERATION:
>> +        case ACTION_BEGIN_CLEAR_OPERATION:
>> +        case ACTION_BEGIN_DUMMY_WRITE_OPERATION:
>> +        case ACTION_END_OPERATION:
>> +            s->operation = val;
>> +            break;
>> +        case ACTION_SET_RECORD_OFFSET:
>> +            s->record_offset = s->reg_value;
>> +            break;
>> +        case ACTION_EXECUTE_OPERATION:
>> +            if ((uint8_t)s->reg_value == ERST_EXECUTE_OPERATION_MAGIC) {
>> +                s->busy_status = 1;
>> +                switch (s->operation) {
>> +                case ACTION_BEGIN_WRITE_OPERATION:
>> +                    s->command_status = write_erst_record(s);
>> +                    break;
>> +                case ACTION_BEGIN_READ_OPERATION:
>> +                    s->command_status = read_erst_record(s);
>> +                    break;
>> +                case ACTION_BEGIN_CLEAR_OPERATION:
>> +                    s->command_status = clear_erst_record(s);
>> +                    break;
>> +                case ACTION_BEGIN_DUMMY_WRITE_OPERATION:
>> +                    s->command_status = STATUS_SUCCESS;
>> +                    break;
>> +                case ACTION_END_OPERATION:
>> +                    s->command_status = STATUS_SUCCESS;
>> +                    break;
>> +                default:
>> +                    s->command_status = STATUS_FAILED;
>> +                    break;
>> +                }
>> +                s->busy_status = 0;
>> +            }
>> +            break;
>> +        case ACTION_CHECK_BUSY_STATUS:
>> +            s->reg_value = s->busy_status;
>> +            break;
>> +        case ACTION_GET_COMMAND_STATUS:
>> +            s->reg_value = s->command_status;
>> +            break;
>> +        case ACTION_GET_RECORD_IDENTIFIER:
>> +            s->command_status = get_next_record_identifier(s,
>> +                                    &s->reg_value, false);
>> +            break;
>> +        case ACTION_SET_RECORD_IDENTIFIER:
>> +            s->record_identifier = s->reg_value;
>> +            break;
>> +        case ACTION_GET_RECORD_COUNT:
>> +            s->reg_value = le32_to_cpu(s->header->record_count);
>> +            break;
>> +        case ACTION_GET_ERROR_LOG_ADDRESS_RANGE:
>> +            s->reg_value = (hwaddr)pci_get_bar_addr(PCI_DEVICE(s), 1);
>> +            break;
>> +        case ACTION_GET_ERROR_LOG_ADDRESS_LENGTH:
>> +            s->reg_value = le32_to_cpu(s->header->record_size);
>> +            break;
>> +        case ACTION_GET_ERROR_LOG_ADDRESS_RANGE_ATTRIBUTES:
>> +            s->reg_value = 0x0; /* intentional, not NVRAM mode */
>> +            break;
>> +        case ACTION_GET_EXECUTE_OPERATION_TIMINGS:
>> +            s->reg_value =
>> +                (100ULL << 32) | /* 100us max time */
>> +                (10ULL  <<  0) ; /*  10us min time */
>> +            break;
>> +        default:
>> +            /* Unknown action/command, NOP */
>> +            break;
>> +        }
>> +        break;
>> +    default:
>> +        /* This should not happen, but if it does, NOP */
>> +        break;
>> +    }
>> +}
>> +
>> +static uint64_t erst_reg_read(void *opaque, hwaddr addr,
>> +                                unsigned size)
>> +{
>> +    ERSTDeviceState *s = (ERSTDeviceState *)opaque;
>> +    uint64_t val = 0;
>> +
>> +    switch (addr) {
>> +    case ERST_ACTION_OFFSET + 0:
>> +    case ERST_ACTION_OFFSET + 4:
>> +        val = erst_rd_reg64(addr, s->reg_action, size);
>> +        break;
>> +    case ERST_VALUE_OFFSET + 0:
>> +    case ERST_VALUE_OFFSET + 4:
>> +        val = erst_rd_reg64(addr, s->reg_value, size);
>> +        break;
>> +    default:
>> +        break;
>> +    }
>> +    trace_acpi_erst_reg_read(addr, val, size);
>> +    return val;
>> +}
>> +
>> +static const MemoryRegionOps erst_reg_ops = {
>> +    .read = erst_reg_read,
>> +    .write = erst_reg_write,
>> +    .endianness = DEVICE_NATIVE_ENDIAN,
>> +};
>> +
>> +/*******************************************************************/
>> +/*******************************************************************/
>> +static int erst_post_load(void *opaque, int version_id)
>> +{
>> +    ERSTDeviceState *s = opaque;
>> +
>> +    /* Recompute pointer to header */
>> +    s->header = (ERSTStorageHeader *)get_nvram_ptr_by_index(s, 0);
>> +    trace_acpi_erst_post_load(s->header, le32_to_cpu(s->header->record_size));
>> +
>> +    return 0;
>> +}
>> +
>> +static const VMStateDescription erst_vmstate  = {
>> +    .name = "acpi-erst",
>> +    .version_id = 1,
>> +    .minimum_version_id = 1,
>> +    .post_load = erst_post_load,
>> +    .fields = (VMStateField[]) {
>> +        VMSTATE_UINT8(operation, ERSTDeviceState),
>> +        VMSTATE_UINT8(busy_status, ERSTDeviceState),
>> +        VMSTATE_UINT8(command_status, ERSTDeviceState),
>> +        VMSTATE_UINT32(record_offset, ERSTDeviceState),
>> +        VMSTATE_UINT64(reg_action, ERSTDeviceState),
>> +        VMSTATE_UINT64(reg_value, ERSTDeviceState),
>> +        VMSTATE_UINT64(record_identifier, ERSTDeviceState),
>> +        VMSTATE_UINT32(next_record_index, ERSTDeviceState),
>> +        VMSTATE_END_OF_LIST()
>> +    }
>> +};
>> +
>> +static void erst_realizefn(PCIDevice *pci_dev, Error **errp)
>> +{
>> +    ERSTDeviceState *s = ACPIERST(pci_dev);
>> +
>> +    trace_acpi_erst_realizefn_in();
>> +
>> +    if (!s->hostmem) {
>> +        error_setg(errp, "'" ACPI_ERST_MEMDEV_PROP "' property is not set");
>> +        return;
>> +    } else if (host_memory_backend_is_mapped(s->hostmem)) {
>> +        error_setg(errp, "can't use already busy memdev: %s",
>> +                   object_get_canonical_path_component(OBJECT(s->hostmem)));
>> +        return;
>> +    }
>> +
>> +    s->hostmem_mr = host_memory_backend_get_memory(s->hostmem);
>> +
>> +    /* HostMemoryBackend size will be multiple of PAGE_SIZE */
>> +    s->storage_size = object_property_get_int(OBJECT(s->hostmem), "size", errp);
>> +
>> +    /* Initialize backend storage and record_count */
>> +    check_erst_backend_storage(s, errp);
>> +
>> +    /* BAR 0: Programming registers */
>> +    memory_region_init_io(&s->iomem_mr, OBJECT(pci_dev), &erst_reg_ops, s,
>> +                          TYPE_ACPI_ERST, ERST_REG_SIZE);
>> +    pci_register_bar(pci_dev, 0, PCI_BASE_ADDRESS_SPACE_MEMORY, &s->iomem_mr);
>> +
>> +    /* BAR 1: Exchange buffer memory */
>> +    memory_region_init_ram(&s->exchange_mr, OBJECT(pci_dev),
>> +                            "erst.exchange",
>> +                            le32_to_cpu(s->header->record_size), errp);
>> +    pci_register_bar(pci_dev, 1, PCI_BASE_ADDRESS_SPACE_MEMORY,
>> +                        &s->exchange_mr);
>> +
>> +    /* Include the backend storage in the migration stream */
>> +    vmstate_register_ram_global(s->hostmem_mr);
>> +
>> +    trace_acpi_erst_realizefn_out(s->storage_size);
>> +}
>> +
>> +static void erst_reset(DeviceState *dev)
>> +{
>> +    ERSTDeviceState *s = ACPIERST(dev);
>> +
>> +    trace_acpi_erst_reset_in(le32_to_cpu(s->header->record_count));
>> +    s->operation = 0;
>> +    s->busy_status = 0;
>> +    s->command_status = STATUS_SUCCESS;
>> +    s->record_identifier = ERST_UNSPECIFIED_RECORD_ID;
>> +    s->record_offset = 0;
>> +    s->next_record_index = s->first_record_index;
>> +    /* NOTE: first/last_record_index are computed only once */
>> +    trace_acpi_erst_reset_out(le32_to_cpu(s->header->record_count));
>> +}
>> +
>> +static Property erst_properties[] = {
>> +    DEFINE_PROP_LINK(ACPI_ERST_MEMDEV_PROP, ERSTDeviceState, hostmem,
>> +                     TYPE_MEMORY_BACKEND, HostMemoryBackend *),
>> +    DEFINE_PROP_UINT32(ACPI_ERST_RECORD_SIZE_PROP, ERSTDeviceState,
>> +                     default_record_size, ERST_RECORD_SIZE),
>> +    DEFINE_PROP_END_OF_LIST(),
>> +};
>> +
>> +static void erst_class_init(ObjectClass *klass, void *data)
>> +{
>> +    DeviceClass *dc = DEVICE_CLASS(klass);
>> +    PCIDeviceClass *k = PCI_DEVICE_CLASS(klass);
>> +
>> +    trace_acpi_erst_class_init_in();
>> +    k->realize = erst_realizefn;
>> +    k->vendor_id = PCI_VENDOR_ID_REDHAT;
>> +    k->device_id = PCI_DEVICE_ID_REDHAT_ACPI_ERST;
>> +    k->revision = 0x00;
>> +    k->class_id = PCI_CLASS_OTHERS;
>> +    dc->reset = erst_reset;
>> +    dc->vmsd = &erst_vmstate;
>> +    dc->user_creatable = true;
>> +    dc->hotpluggable = false;
>> +    device_class_set_props(dc, erst_properties);
>> +    dc->desc = "ACPI Error Record Serialization Table (ERST) device";
>> +    set_bit(DEVICE_CATEGORY_MISC, dc->categories);
>> +    trace_acpi_erst_class_init_out();
>> +}
>> +
>> +static const TypeInfo erst_type_info = {
>> +    .name          = TYPE_ACPI_ERST,
>> +    .parent        = TYPE_PCI_DEVICE,
>> +    .class_init    = erst_class_init,
>> +    .instance_size = sizeof(ERSTDeviceState),
>> +    .interfaces = (InterfaceInfo[]) {
>> +        { INTERFACE_CONVENTIONAL_PCI_DEVICE },
>> +        { }
>> +    }
>> +};
>> +
>> +static void erst_register_types(void)
>> +{
>> +    type_register_static(&erst_type_info);
>> +}
>> +
>> +type_init(erst_register_types)
>> diff --git a/hw/acpi/meson.build b/hw/acpi/meson.build
>> index 7d8c0eb..348b94f 100644
>> --- a/hw/acpi/meson.build
>> +++ b/hw/acpi/meson.build
>> @@ -5,6 +5,7 @@ acpi_ss.add(files(
>>     'bios-linker-loader.c',
>>     'core.c',
>>     'utils.c',
>> +  'erst.c',
> 
> I think we should introduce a CONFIG variable here and specific archs
> can then use the earst device by enabling that config. Adding erst.c in
> the general section isn't right.

Done; I've introduced CONFIG_ACPI_ERST via hw/acpi/Kconfig, and changed meson accordingly.

> 
> 
>>   ))
>>   acpi_ss.add(when: 'CONFIG_ACPI_CPU_HOTPLUG', if_true: files('cpu.c', 'cpu_hotplug.c'))
>>   acpi_ss.add(when: 'CONFIG_ACPI_CPU_HOTPLUG', if_false: files('acpi-cpu-hotplug-stub.c'))
>> diff --git a/hw/acpi/trace-events b/hw/acpi/trace-events
>> index 974d770..2250126 100644
>> --- a/hw/acpi/trace-events
>> +++ b/hw/acpi/trace-events
>> @@ -55,3 +55,18 @@ piix4_gpe_writeb(uint64_t addr, unsigned width, uint64_t val) "addr: 0x%" PRIx64
>>   # tco.c
>>   tco_timer_reload(int ticks, int msec) "ticks=%d (%d ms)"
>>   tco_timer_expired(int timeouts_no, bool strap, bool no_reboot) "timeouts_no=%d no_reboot=%d/%d"
>> +
>> +# erst.c
>> +acpi_erst_reg_write(uint64_t addr, uint64_t val, unsigned size) "addr: 0x%04" PRIx64 " <== 0x%016" PRIx64 " (size: %u)"
>> +acpi_erst_reg_read(uint64_t addr, uint64_t val, unsigned size) " addr: 0x%04" PRIx64 " ==> 0x%016" PRIx64 " (size: %u)"
>> +acpi_erst_mem_write(uint64_t addr, uint64_t val, unsigned size) "addr: 0x%06" PRIx64 " <== 0x%016" PRIx64 " (size: %u)"
>> +acpi_erst_mem_read(uint64_t addr, uint64_t val, unsigned size) " addr: 0x%06" PRIx64 " ==> 0x%016" PRIx64 " (size: %u)"
>> +acpi_erst_pci_bar_0(uint64_t addr) "BAR0: 0x%016" PRIx64
>> +acpi_erst_pci_bar_1(uint64_t addr) "BAR1: 0x%016" PRIx64
>> +acpi_erst_realizefn_in(void)
>> +acpi_erst_realizefn_out(unsigned size) "total nvram size %u bytes"
>> +acpi_erst_reset_in(unsigned record_count) "record_count %u"
>> +acpi_erst_reset_out(unsigned record_count) "record_count %u"
>> +acpi_erst_post_load(void *header, unsigned slot_size) "header: 0x%p slot_size %u"
>> +acpi_erst_class_init_in(void)
>> +acpi_erst_class_init_out(void)
>> --
>> 1.8.3.1
>>
>>

