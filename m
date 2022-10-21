Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C3476072D8
	for <lists+qemu-devel@lfdr.de>; Fri, 21 Oct 2022 10:48:37 +0200 (CEST)
Received: from localhost ([::1] helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1olnhk-0006Dl-1d
	for lists+qemu-devel@lfdr.de; Fri, 21 Oct 2022 04:48:36 -0400
Received: from [::1] (helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1olnAo-00088W-Q8
	for lists+qemu-devel@lfdr.de; Fri, 21 Oct 2022 04:14:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <manish.mishra@nutanix.com>)
 id 1oln9x-0007at-Ee
 for qemu-devel@nongnu.org; Fri, 21 Oct 2022 04:13:42 -0400
Received: from mx0b-002c1b01.pphosted.com ([148.163.155.12])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <manish.mishra@nutanix.com>)
 id 1oln9v-0002QI-3V
 for qemu-devel@nongnu.org; Fri, 21 Oct 2022 04:13:40 -0400
Received: from pps.filterd (m0127841.ppops.net [127.0.0.1])
 by mx0b-002c1b01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 29L57TZQ017640; Fri, 21 Oct 2022 01:13:37 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nutanix.com;
 h=message-id : date :
 subject : to : cc : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=proofpoint20171006;
 bh=abWXhmTR8nLJDJHt+bBtSls0FJhgEuXXWd4eguOG3D0=;
 b=fw8DyjMbqcdEfoehLOFzYWNwHikzXL4BDfv67g7xyKHzQNoGrjx7nFKhGT9NacUDV4N3
 w/DGHZ1XrdjUAaqXRUCgpIkZrQ7eKc3qQ9HRfyLlsKZ11fMOF/JOCvhLOqlgVP1G2hNH
 Rjak6Y9nnSi20spucjPYLZTi1a0I5R2zjQzJ+IMGdzZupLX1FmUff0IzT6h/6GQrAguS
 hV4eIxjq7/NE6W/ZaUq5BKU+cMporBmKEag5DtA6BOMsXcC2cHc1ZQiJ2/Xh5lAioZ9h
 lliN0xKOYEmQ8BeWqJuNjUDS1EJ/k8yhM4gjkDuyVl+f18LAIGuB+ZtSvZD3/CdCDbbt yQ== 
Received: from nam10-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam10lp2103.outbound.protection.outlook.com [104.47.58.103])
 by mx0b-002c1b01.pphosted.com (PPS) with ESMTPS id 3kbbbh9cs7-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 21 Oct 2022 01:13:36 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Je16cpcBjD5VakURt9L9GhznFkR0b9uAaJPKstuM1u1iYDIufi1swNS4kPBVh32B0LJuVIipWP1bk3a8zF5x7kVd/f4eDbfYzpYvna5IKneKFzdh4srOuOI1W6B3HSIh+JpEscd1gD8U062dke5Pi86D8TFqZtxKDzheU/sRBhI+bcMc2TZRUjDH+D/pQlROYcFD1bVwSxmNM3+FTkcEZNJ4ApLft/WkWqvTo53uLFsuMeSzYkj0CYdWw6f4L8bwJl76GvsuTkDmo68SEAemqXKIarq5jZcSFki55C6OzwTC9TeIg9bikM7mIW9UE43jeNX6x9pcCJfkgua7at/ozQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=abWXhmTR8nLJDJHt+bBtSls0FJhgEuXXWd4eguOG3D0=;
 b=EafINuDnJumMRgGFotSPENs6KG7BBxTRiVH+XK0Emqhnpw5kxRn/xM/fAL9MvWFVIwTeStgnvkF7DzLgb8TluK98WgZGVmeBvVtwIEW9cMWSSPqL1J1suokCLG/H3xgDUDLpb0V4k3il8ikojwMjaTHyNbDQjR3pIeqzInvHxPoMhbhYhTLnt1cqPUpH9o9KKrOXuhHKizkqpbrRaw5lhlKL+3qD8T2tRBo454LxofHLRwtfhEySVb15JIP9L9gWi8ChtZdHGW5VSw+9STQIvCce5qhAG8D9lovi58ftiRlbgVvNt9EW9UHGkjRP18y4duJMOZSjfDQmP0JIYy+OKg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nutanix.com; dmarc=pass action=none header.from=nutanix.com;
 dkim=pass header.d=nutanix.com; arc=none
Received: from PH0PR02MB7384.namprd02.prod.outlook.com (2603:10b6:510:12::12)
 by SA0PR02MB7339.namprd02.prod.outlook.com (2603:10b6:806:e6::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5723.34; Fri, 21 Oct
 2022 08:13:33 +0000
Received: from PH0PR02MB7384.namprd02.prod.outlook.com
 ([fe80::a88:8114:7d28:5834]) by PH0PR02MB7384.namprd02.prod.outlook.com
 ([fe80::a88:8114:7d28:5834%8]) with mapi id 15.20.5723.034; Fri, 21 Oct 2022
 08:13:33 +0000
Message-ID: <9114980b-596a-4119-dfa9-4e29b6d69cd4@nutanix.com>
Date: Fri, 21 Oct 2022 13:43:24 +0530
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.3.3
Subject: Re: MultiFD and default channel out of order mapping on receive side.
To: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Peter Xu <peterx@redhat.com>
Cc: qemu-devel <qemu-devel@nongnu.org>, Juan Quintela <quintela@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Prerna Saxena <prerna.saxena@nutanix.com>
References: <9f02255a-ceb9-9ca6-2606-b91c5e9e6459@nutanix.com>
 <Y0fJFcj9+wcnKYqd@redhat.com>
 <a4f67b8d-21ec-4261-6ffb-3162c854ce8f@nutanix.com>
 <Y00+tsrBs2m2CH6R@redhat.com> <Y03F97gmi7N4cyMM@x1n>
 <Y05hVC7AXdc0Ak4z@redhat.com> <Y069YMtwwOrmI6lM@x1n> <Y08T+DZQXh/89O/g@x1n>
 <4c1e4137-a686-427c-df3e-22f299a39478@nutanix.com> <Y1F4BgFskXizW2za@x1n>
 <Y1HGgwe/tcJ80pM/@redhat.com>
From: "manish.mishra" <manish.mishra@nutanix.com>
In-Reply-To: <Y1HGgwe/tcJ80pM/@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PN2PR01CA0219.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:ea::13) To PH0PR02MB7384.namprd02.prod.outlook.com
 (2603:10b6:510:12::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR02MB7384:EE_|SA0PR02MB7339:EE_
X-MS-Office365-Filtering-Correlation-Id: 3665253a-9232-4936-e88f-08dab33c2550
x-proofpoint-crosstenant: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Du6gQOWOk589OeSMIGb5S8Ze7Ql/drpZ8s4f8G7njoRufYuH5uNEVm4mp31xdXEdXLpZW+dq251c0aIler+P05IOkiKUBY6KArzsaKn4HoHmUyL5gXVj84fF0ATYl0GDdRe0y+uAwmX+ldAoX6FXaYWni1sQWk8jVdl/2wMzSxdgW/6mrGsggjdfb9U9h9nkPqnsU5pALYKqxcIGSx7DVCjHroAyT88i0OabfJVEtPD2Ny0TLoTG/NbNhCGK4BHRSHR6V6IviZR74fOncIw87Tj0YFtliiEUAhNNuTBjQlm+O60HyH47GugtldEknTRU9QF5WjIdFfCDzYsSH5HithH6McOelR6bOcKVZNIhoLahWSz33xtKQGM7wnQ+7zzj2diqnv3sBK4qEV8snae6ZO6PZMYqKtzoKVNKDFs4cMKDjlnaG6A6n0LjEAkB6YskQuyaVHF5q/E1rRYVNvXaJdWJKwbm0uaUqANXq524AJQsp4kId33a3rC5/gReLtPyJic1RfqGVo/uhfRMCT80E00ezUXA5TVFwSdFfx8ERuBCMMMmNvwVI6ghDAKy/z2ZBCspy0rdl6+sWOeJvtIcy8babONdAnfpHj0HYFvc5YNvzywpBVOF7TWQIQKTf/IMcniMRGeOniDsOxfIfkWyP77XR+f2KScd2UrQIFSbWWZGCtq3PsJGus3/c/+aGcH8aobfPxFnIrFJeyTxvbmPmKPJr9XSikRkadIjVR4Xnm1PUXXYQl+evlJpfEjopv4owYiV4UMjyZNbYBVFtqUKahNvnQCIQndH3Ch6UyC1HVqT3AyGE3PuNB7UwDFJG41D
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR02MB7384.namprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(366004)(39860400002)(136003)(396003)(376002)(346002)(451199015)(66899015)(8936002)(5660300002)(2616005)(186003)(8676002)(110136005)(26005)(66556008)(66476007)(54906003)(66946007)(6506007)(53546011)(31686004)(6512007)(107886003)(83380400001)(6666004)(41300700001)(316002)(31696002)(478600001)(4326008)(86362001)(38100700002)(36756003)(966005)(2906002)(6486002)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZDBPK25BRGg3Q1hlTGR5MEwrMlpRbG1KVG5VaTVqVWZpRmRJUXhWRkdiSzUy?=
 =?utf-8?B?c0hFeERRd0xvTiszbXdFTGJVQkVJUStQRTk5R29Ud2JCWHBpY1hxY2F5cC9G?=
 =?utf-8?B?b2hQb0t5anNFZzgwYy82R1B4a1NDVWNZZm1pZEQvN3FUU0JVQ2lnNE9tb1Vu?=
 =?utf-8?B?QmpnMStLRlVUdVFLMEZXbUgyQTBIdnFnWDY1alJtZlpIaGFRUFIrd2taV25X?=
 =?utf-8?B?RzV6QnJsajhGUzFuMlpSNDl6SDlUMU1EVy9Bc1FnNG5tMnVBd0tKdTlpRWRk?=
 =?utf-8?B?dGo0cElrOE03OWFLNUFYcFlkTGR1RUxNdExpVFZnODB6Nk5oazV0TWZtR1Yr?=
 =?utf-8?B?eTlvZnF6NVVYTS9PbUh5a09CRHZvSFNUdVZ3THg0dTgzMmF0NkllQlVFd09z?=
 =?utf-8?B?SjAvSHFsR2NSNnNYakZydlF5VnhKSEJVL08wbVd6RGx4V0t3OERiMWdlYlhX?=
 =?utf-8?B?N0pVRTZKRCs3UE5sNTJVSkx0bGRaMFE1SkcvNDJDdE1UOUk4dE1vU2hpVUhs?=
 =?utf-8?B?QzBGc2NjbFNpemV5UnlHSVQ5bWUrb08rbXhwc1I3YURlY0lwOUU3Nkkwd0sy?=
 =?utf-8?B?QWxyQStCL0RreTYvS3VQRTJyL0lFTlVZRGZMWnRUbkM4Vml0enk0dzZuc01h?=
 =?utf-8?B?VmFNeGRaYWcxbHp4em9VbWpKYSswR0VWUDFoSTVSdWRtdEpmeFBHbjc1b3oy?=
 =?utf-8?B?d2daKytsODdtZk5BRkdBQzlVSE1KY3ltNVkybFJRQWQwbjJnTlMyQ2pHWlEz?=
 =?utf-8?B?SEZuS3huSzlsSVkwT3FINnB4VFNicU8xZnB0WFlmbVFYVXJGMmNac2xVTmNu?=
 =?utf-8?B?NTFmL3gwbDJPTWpMdk4zSVFlcVJBQ2l2a2luQTgxYWNDNk00MG1JbFJMNjNY?=
 =?utf-8?B?aDVGcXI4dzJqWk1GbElXbDIyN1RONWJzNnl4N3kxZDI1VkxvVlNxelNRRlBU?=
 =?utf-8?B?bDRkUHZtL2libmZmem9ZZU41ajV0a2Fmdmg3Smw1amtDMmxmY01mRHdDaWpS?=
 =?utf-8?B?ZmliSHovdmszNkY1c0FCaXBZT2tPMzdCejVXaVNhbnpMNE0yUWxhMHlIS1Zl?=
 =?utf-8?B?UkQyS01mL1JXUDY4aGVGeFBJMHorcmFqdFI2MUZXK3phUzlJUG9QczREN3dm?=
 =?utf-8?B?NWZFcWxOdVNJVFhVNXVDZERsUXdWL0dBUkxDRVd4SVZtTEcwRkZ6aVZBTGNL?=
 =?utf-8?B?Z1E5RzY4dng0citOQXdXTmZ4QzEzNXU5YnFPM1JZc0ZTTlFzdS9OREhJdTc4?=
 =?utf-8?B?ME1SazF5SC9UZ1BXVUFjNzRIaFdFTlVVeEk3aGJ3MElqb2ZpdHRReXBHUmo3?=
 =?utf-8?B?U2RHWXZRNzdtRkIwUFRGQi9KeHA1YVJRdnFYK0NETnFCdjAzcTVjS2N0UDMr?=
 =?utf-8?B?UG4vS3hreE5DSVVuMkJlZktCcFlUeEFoSEhDc1p1OFZJWlpWZXowaDNRUE83?=
 =?utf-8?B?UzJWbXBmcUpieFhYZDVTd3EwWlIxSEF4TFFkNk1RTGtVd0hlYlljaDdpV1l0?=
 =?utf-8?B?TGVycC8wTVRaRTc5T1p5eDFSc20zaHZLcWtPUFJoZ2ptRFJ4d084MEpFNEl3?=
 =?utf-8?B?aUk0ZEl4cEpmRkQxRVl5NTVUazJmcWVmRzQrS0p6cDlTemtXRWdYamo0clJD?=
 =?utf-8?B?OUxhY21GdjVhVU1XVzRlVGNqZUNjZnpIQlJkWGZmbS81R1JoZjlreGVKLy80?=
 =?utf-8?B?ZGwrbEZ0L1dSKzRXZm9ydUMxYjdaVGZNbDBtMUoxL1dZak02RldTVEpac1BK?=
 =?utf-8?B?ck0vWGM3SmhOMFBhVXo2WnppM0tueUZzVWFMUHJad2Z1TDJ1MERFZGlXMU5R?=
 =?utf-8?B?cWVQUm9IamlRdUFrQlJzbENXSTd1NnU0d0x4MmNieEN5N2ZKZ2Y3elcyYnRI?=
 =?utf-8?B?N2VGNVpBbUV3K2NmZitrQWhsZmYvT2g5bXJGTHE4N2U1aTh4ZmlyOTZrT0V3?=
 =?utf-8?B?U3lrM3BTUmNNRWhsRHJuUHc5aEx3TldrdDcvK2FJb203K3g5N0ZwTS90QnF3?=
 =?utf-8?B?ZmdadjVvaVJWSFk2anFLU0xTWjNXTG9nR0dhQ01UdVF6NDR3eEh1cWZLRDlD?=
 =?utf-8?B?NkZVUUN5Z2xGTWpzRC9xTU1xQ3BkVDJmRFQ3a0R1cEYrRkxrOTNUQXdnTVlP?=
 =?utf-8?B?R2ZPb0x5N1NyTDdOcStiTS9jcjlFUXlPU1dQTU1PVEExa3h3UCs1Wi9xSnVy?=
 =?utf-8?B?N2c9PQ==?=
X-OriginatorOrg: nutanix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3665253a-9232-4936-e88f-08dab33c2550
X-MS-Exchange-CrossTenant-AuthSource: PH0PR02MB7384.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Oct 2022 08:13:33.5583 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bb047546-786f-4de1-bd75-24e5b6f79043
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MIO8ToUkemfEFxPmKeVbuUPhRc6dw6PvFvfs3C0JMEOtMSc+ph5OI1ekdLWNamzVkdDpVyNkUZz2Yu9iYxhAT3GmbLntNKeLDsZ+VNycAmw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR02MB7339
X-Proofpoint-GUID: e7_cxO5_E-MmHz2Kx2QHVwKb04PSZ4Ii
X-Proofpoint-ORIG-GUID: e7_cxO5_E-MmHz2Kx2QHVwKb04PSZ4Ii
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-10-21_03,2022-10-20_01,2022-06-22_01
X-Proofpoint-Spam-Reason: safe
Received-SPF: pass client-ip=148.163.155.12;
 envelope-from=manish.mishra@nutanix.com; helo=mx0b-002c1b01.pphosted.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.251,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, SPF_HELO_NONE=0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


On 21/10/22 3:37 am, Daniel P. Berrangé wrote:
> On Thu, Oct 20, 2022 at 12:32:06PM -0400, Peter Xu wrote:
>> On Thu, Oct 20, 2022 at 08:14:19PM +0530, manish.mishra wrote:
>>> I had one concern, during recover we do not send any magic. As of now we
>>    do not support multifd with postcopy so it should be fine, we can do
>>    explict checking for non-recovery case. But i remember from some
>>    discussion in future there may be support for multiFD with postcopy or
>>    have multiple postcopy preempt channels too, then proper handshake will
>>    be required? So at some point we want to take that path? For now i agree
>>    approach 1 will be good as suggested by Daniel it can be backported
>>    easily to older qemu's too.
>>
>> Yes for the long run I think we should provide a generic solution for all
>> the channels to be established for migration purpose.
>>
>> Not to mention that as I replied previously to my original email, the trick
>> won't easily work with dest QEMU where we need further change to allow qemu
>> to accept new channels during loading of the VM.
>>
>> Considering the complexity that it'll take just to resolve the prempt
>> channel ordering, I think maybe it's cleaner we just look for the long term
>> goal.
> I think we should just ignore the preempt channel. Lets just do the
> easy bit and fix the main vs multifd channel mixup, as that's the one
> that is definitely actively hitting people today. We can solve that as
> a quick win in a way that is easy to backport to existing releases of
> QEMU for those affected.
Yes, that works for now Daniel. I can send a patch as per your earlier suggestions on this, early next week if it fine?
> Separately from that, lets define a clean slate migration protocol to
> solve many of our historic problems and mistakes that can't be dealt
> with through retrofitting, not limited to just this ordering mistake.
>
> We had a significant discussion about it at the start of the year
> in this thread, which I think we should take forward and write into
> a formal protocol spec.
>
>    https://urldefense.proofpoint.com/v2/url?u=https-3A__lists.gnu.org_archive_html_qemu-2Ddevel_2022-2D03_msg03655.html&d=DwIBaQ&c=s883GpUCOChKOHiocYtGcg&r=c4KON2DiMd-szjwjggQcuUvTsPWblztAL0gVzaHnNmc&m=vjRKUpojJeAWFcJNi7YETWaLjjOcLWIcdk8KO-HMu8_A3veG2aaGmZoLxFVHgLt0&s=uv5cKdIMcT8Wo3erYQZJqnMXvRCbda4gNtxsy9EXrC8&e=
This was a good read for me. :)
>
> With regards,
> Daniel

Thanks

Manish Mishra


