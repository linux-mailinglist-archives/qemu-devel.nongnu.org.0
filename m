Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8639B4D8AD2
	for <lists+qemu-devel@lfdr.de>; Mon, 14 Mar 2022 18:29:27 +0100 (CET)
Received: from localhost ([::1]:46220 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nToVa-0003i5-Kn
	for lists+qemu-devel@lfdr.de; Mon, 14 Mar 2022 13:29:26 -0400
Received: from eggs.gnu.org ([209.51.188.92]:37534)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.kanda@oracle.com>)
 id 1nToUT-0002zR-5d
 for qemu-devel@nongnu.org; Mon, 14 Mar 2022 13:28:17 -0400
Received: from mx0a-00069f02.pphosted.com ([205.220.165.32]:38844)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.kanda@oracle.com>)
 id 1nToUP-0006dl-Pd
 for qemu-devel@nongnu.org; Mon, 14 Mar 2022 13:28:16 -0400
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 22EFSqgK001444; 
 Mon, 14 Mar 2022 17:28:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=message-id : date :
 subject : to : cc : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=corp-2021-07-09;
 bh=OeIkX39YS+3jYLkqGyu55ZTASETM6SETc2SVw/hmeYY=;
 b=tD5rsrmqUrGpBCbu+u1oE8dv7dgZzKa0u1eV/kHzOGt0ApTyXSpIUrSg7abIvByQdySv
 RrQM3U2PmSD4LdQrAHrxCbn++20v17UYLcmik2BHU107x/ldkMNNt6/yedRF+O26aY+O
 cVBOejhO86eQLBySkxlI+ztZRJI0q3ugRReyB14nnemq/EAz6Rzzpp1kFUdFTW4bWw95
 Jowj5xCwWalahDs5aq/yLet+6MaJLgS2Ls/K995FVsKaeYQEY5YpzhJxjUS1PO+KqOUW
 gEbZAJpbiyJL21mPjoGUU7X5oZSKUDKADzUN5nTpPh9dmWd6Zo5GXh8aRY6GbYH0EBs2 Kw== 
Received: from aserp3030.oracle.com (aserp3030.oracle.com [141.146.126.71])
 by mx0b-00069f02.pphosted.com with ESMTP id 3et5fu1103-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 14 Mar 2022 17:28:08 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
 by aserp3030.oracle.com (8.16.1.2/8.16.1.2) with SMTP id 22EHBurX033543;
 Mon, 14 Mar 2022 17:28:07 GMT
Received: from nam02-bn1-obe.outbound.protection.outlook.com
 (mail-bn1nam07lp2041.outbound.protection.outlook.com [104.47.51.41])
 by aserp3030.oracle.com with ESMTP id 3et64t4q28-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 14 Mar 2022 17:28:06 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KbJkXwq1BHIMFHI7MYcPlmFzqrVE6CdlGXlR3wSI0jSFhnR/hCQOabAedN9Ub4fbsQMqaUfOPIpaypeCf3MQkYHhGF6Yy5iGiWrPUfMP9JH5nOkaXL5uYUTngomGd7QEt8/8CEpI1q++9VYFrEHVC+HaENVy95SvevibqtSEh8tKo9TRqZybk0drywE9wzq8eLu996Pl3vunr3lZWLAwn4UyEL/LwzMPjj/JAUxPnufA8MX9L/ssr6W+TP8JCwVfffW3o5OMR2Blt2mxVNj/HA823pq5PicstmxmT2YH8HTL8iv/rAm+yD47W0or2CcnKJjjOIJOJN1x0eX2DCPwug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OeIkX39YS+3jYLkqGyu55ZTASETM6SETc2SVw/hmeYY=;
 b=EShqt+d38JeZiGMQS8ObXZRaq0afcZOSn34dMuV3EAfj6xV8oVhDlpeayk0GtyrIRaMKNf3HVdoCBkqnlK+94NpN0+CLJzcWkiSJ//sNgBQac4QDmOSh0oXr+EEMFs+wqmusEKjPirf5Jrp4VePU8vkc9aKCiU2Z2YgQo4zwXxK7fpb/ewKUY5ryP8ekzWJqlJmTcASiMOVcvRRJL2iLHQslPjL/otivTdtb+AJItCVyy/ntvI4q0aDIyAqiQXgWl5olbvjNjDcbSctsax6SFuLD28LMSMHxD5+dC/acR+ClaNZiEOjItuX7j0ikqdBqVZbnQ+jL/daPvxqNmC8IMA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OeIkX39YS+3jYLkqGyu55ZTASETM6SETc2SVw/hmeYY=;
 b=dL5GVDnr+J/PoAXe985tT04VrnhxzbcGDAuZmaFlp1Y6kTu4fs3BJzQbQeJmmwqkzBV9cCMwK1zM52k2rtJ99mDTTAIAobJAqRiGKzxaancUkIbVf2eSu2E5SICKkzI/n1+UztfRKOOjABBgDO+DOTEN/pORbyK7H0u7JSVorhY=
Received: from SA1PR10MB5841.namprd10.prod.outlook.com (2603:10b6:806:22b::16)
 by MN2PR10MB4368.namprd10.prod.outlook.com (2603:10b6:208:1d6::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5061.25; Mon, 14 Mar
 2022 17:28:04 +0000
Received: from SA1PR10MB5841.namprd10.prod.outlook.com
 ([fe80::58ef:3181:b9d4:b716]) by SA1PR10MB5841.namprd10.prod.outlook.com
 ([fe80::58ef:3181:b9d4:b716%8]) with mapi id 15.20.5061.028; Mon, 14 Mar 2022
 17:28:04 +0000
Message-ID: <efd0b85b-beb1-feeb-6c38-510f8bc36af9@oracle.com>
Date: Mon, 14 Mar 2022 12:28:02 -0500
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.1
Subject: Re: [PATCH v4 1/3] qmp: Support for querying stats
Content-Language: en-US
To: Markus Armbruster <armbru@redhat.com>
References: <20220215150433.2310711-1-mark.kanda@oracle.com>
 <20220215150433.2310711-2-mark.kanda@oracle.com>
 <87a6dw7i55.fsf@pond.sub.org>
From: Mark Kanda <mark.kanda@oracle.com>
In-Reply-To: <87a6dw7i55.fsf@pond.sub.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SA1P222CA0017.NAMP222.PROD.OUTLOOK.COM
 (2603:10b6:806:22c::17) To SA1PR10MB5841.namprd10.prod.outlook.com
 (2603:10b6:806:22b::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: eec891bd-d784-4b07-c9f8-08da05dfff5d
X-MS-TrafficTypeDiagnostic: MN2PR10MB4368:EE_
X-Microsoft-Antispam-PRVS: <MN2PR10MB4368A7C9E79CDF71B62B5F37F90F9@MN2PR10MB4368.namprd10.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ooT4H/FyPf2Cm0yO6CL4s+Rhv2vPsgKJqH3hSG5vDs9KtKUx2SVsw73QZPHgB957LoaJf+fFl29q3zl3cWmWUpIlnn4VCgSprfFpiQuoQSLGibqEs0uZYLKnSMCJLGZblc/9rjH0I/0932devDYY06IuX1EPwl+Nu/Dosa2/yPC6qONos9oW8s6ATnSKpG75BO/S18saP+RDawcjsa3W0d/OACjCYUQDKU7IRq7aq63LAAfhqYlmvoIeOo6KgkAaNiAd/HzixAkmMBc6tV6BTPuWBnKOgSUYTHAT7FyJ6//oxAu2LIfwjLq/D4sEVaDgTKGyZeRFdb/nLqYYEA5mRYPrkjquXIltlsCWXWaBATrKs0Sq+YTevIeAC5UBSOhgys6a1Hmk1ncxj2CgMnOpS6UvUOgFUu3eUDqAIAg9IRh59+Tv9Mpd6TeCDBE2wciqpl7FT9f6D8Ev9TPqoTlqMuOmVsHi0f9/X2J7cGKwaLg+vh51yQruvtkc0o7DfrZWlpjlFO8k5yoh6uOFjKfdvlUbiYwBIPAXwsFa6HzeW0DTZv6pDhZfNbzitY3qzJbPodACQ+OLp0+obj/+CiWd7iaQaAlEXy5yD8Qfdp5zGKpV8pDXw2lmGBCd0TqSxtOtXfvUHcb9E/6+7sQ5MYcoANFOPL6pPoRDhZUZny9XmfglmhD2qdWzI/N0aZWaAisVp7TQKwkkRdTHrjfkDF5AB0Bx6EmaKHI5b8kxGQNh44A=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA1PR10MB5841.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(36756003)(31686004)(6512007)(508600001)(53546011)(83380400001)(6506007)(6486002)(316002)(38100700002)(30864003)(44832011)(2906002)(6916009)(2616005)(5660300002)(26005)(4326008)(186003)(31696002)(8936002)(86362001)(66946007)(8676002)(66476007)(66556008)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?N3JSVENFMjBCai9waStoR1RiY2NHdk9PMENldUJlODloZGpUMWdUNUJ0ekNP?=
 =?utf-8?B?Q2gzQVkxaWx1SGEzVTR4TFlyWUR0SWpCMGZuNTFsdDYzdmFBWlBRSHFBS29q?=
 =?utf-8?B?WFBCUE5hdk9QNEZXWFBPZHBUaWdMSGxaeGRKTExMTFEwNmFiMmQ1UjVvNU9j?=
 =?utf-8?B?dHZwVHhIZytrbyswUlJXMjkzaFFCdUthUS9VeTY1bnNKYTR3NC9JYXNZNXVR?=
 =?utf-8?B?YmZTY0ZaMk9ubUtiaEpqeXVmWkp2bVF0b0xzQ2VWZjlKN0tOQVVQZ01GU1NN?=
 =?utf-8?B?OE9SRXgxUWNkUUpYQkVPU0dPVUtyWCtUdlNLcnlSN0k0K000bTQ5Y1NPRzA1?=
 =?utf-8?B?b0tNSUc2KzY3WE1EakpFajlwQ2svN3dKN2M0RkVpbG56bXBVbnljQXY4OFNK?=
 =?utf-8?B?dys0NzBGZDE4VG1KUXFwQ0xUdmdTVGF3dzR2R05VQk5ZN1lIVVRTTWpUbFpO?=
 =?utf-8?B?SVVHSnFXUHplYUs3SUpBTk1wWDBPblFGWDllVU5VeU1VRGluNTlWK283azJj?=
 =?utf-8?B?R1k4NTJGaFlZTnlrSE45ZHlHekVwUVQxTk00RTdnTXNSaGdDOFVMc3JXS24y?=
 =?utf-8?B?bU1NRkp2WGYrQUp1OGJlZnBEaE5qRVh3UU4wcTBpRVpHUEtxakVFWXhmUXVu?=
 =?utf-8?B?V2NWUW1iVTc4ZHJ0OC9kZlQ4ZjFGemxVd2RWSmhJNTRmcjA2cG5NZU9GTnJN?=
 =?utf-8?B?R2ZvWTIrUHArQ1ZwVUphSnZjY3p3ZmdhZ2ZGWks2NEZ2UmcwWFRrcHBiRkJ0?=
 =?utf-8?B?cWo5RVEwaTNJRzQwa2piNXZVSml1NzJNL3I0T2o0MGVWalFFcS8zWk9leHVp?=
 =?utf-8?B?d3g5ZmpsN1g5R2hHdjg0YlFUMWUyRFhISlNEenI4Q0l3U3JJZjR4OUN1UU43?=
 =?utf-8?B?bVdOQ3hKWmNEYkhWNi9GOUlOK1FFc2VWTWpBOUwrSDR0VTNCK3NLMVhacis3?=
 =?utf-8?B?QzJ5VDkwTGtwV0E3YkxUNUNuQmx0RTc1VVdmYUtMQ0JWOTJVM1NVVFdMd29l?=
 =?utf-8?B?S0ZFWU95K0ZVcndsS2NuM3o0MUFNeVJSNjljNytxaTdLOExDTTNWMVdrblhB?=
 =?utf-8?B?aXYvdjFtbG9VL1lpOE4vV09kWnc5Z0VGSzYzRTRZTmFnMjhWRVQwSTF5b2k1?=
 =?utf-8?B?UUV4Mm42YjJkU2ZjTC9FcklWbjlNWnRZUE9JblVyYjhBcXM2T2QwRlZTNUJl?=
 =?utf-8?B?ekxpNjJKVjZWUWNTWUVkUWg3eW1rV2k2TUFmR0hBSEVPQWVaNzEwTHBrYmZY?=
 =?utf-8?B?ZUp2RGhIL1FMc3dYTFBYV1ZMSyt4QkxPZUt4SC9wYUxYSWw0VFBkTFRpelI2?=
 =?utf-8?B?TWRwb1hqTCt0cVVCNk5wREdEejVEbmE2cUpOUTZ0UVFIVlRwb3FtZDZiNmxD?=
 =?utf-8?B?ZjZHMkJBYmo0V210T1NBWXV1bEFzc0h4eDlJTitkUFJXYjgzNXVIakZ5RUhl?=
 =?utf-8?B?YmU1Vy9XUkZpTXEwRGxTK3JuZ0V2Y0tOVXFHSlY3WHBNY21pZEFxNUxhWW11?=
 =?utf-8?B?N1JHTmY1dnRKc21TaEhRWEVLME02SHBJb0xSTitpRDQvb1lUaHdSUzhQRGV0?=
 =?utf-8?B?Q3NTUUhyeEQwKzIyYTUwdkl6VUNSbkk2V0hJTis5dDBHb2dFZWFpVUVqREk0?=
 =?utf-8?B?U0NDUG1SZE9ublNsRUltV2RCQ1NLQURuYVh2ZGxyclI0OXNlRU5MUnRTUXlu?=
 =?utf-8?B?REZVdjlTYnpTdDJBMExTMlVXSHVWSWxtVWRSWG1LMWxvWXh1dmJ2bERqdkt5?=
 =?utf-8?B?WWVuajl3QktBWDBsWGQ5cDErZTZnTnJNQ1lGbWlESUlNRmlkc2puNkVtcmJu?=
 =?utf-8?B?ZC94clBGOU1vR1dmQ1BZR1ViVi8veitCTG5WZ0tYbG1kRk5pTjVZTDFJQXg2?=
 =?utf-8?B?ZHM2bi9kdjN5dXE3OVBDclRjdnpQWnRtWTJiaFpZWjRJVW9Cd0JPTXFEdEVr?=
 =?utf-8?Q?qWHfqkJVFJGBF40nHCp/d0XVYTFTL2nd?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: eec891bd-d784-4b07-c9f8-08da05dfff5d
X-MS-Exchange-CrossTenant-AuthSource: SA1PR10MB5841.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Mar 2022 17:28:04.8091 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QuoTbsatDfRHs+7eNeWANDflLS8aFYa0GPxWldwfeRjFJKIbnfYGNamoPJPSlJg9XJm3blvVCTNmLi/7lV9h3A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR10MB4368
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10285
 signatures=693139
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0
 bulkscore=0 phishscore=0
 suspectscore=0 mlxscore=0 adultscore=0 spamscore=0 mlxlogscore=999
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2202240000
 definitions=main-2203140105
X-Proofpoint-GUID: rhW_-Q_LL1MErvtmtflnypfS6eBYdKpt
X-Proofpoint-ORIG-GUID: rhW_-Q_LL1MErvtmtflnypfS6eBYdKpt
Received-SPF: pass client-ip=205.220.165.32;
 envelope-from=mark.kanda@oracle.com; helo=mx0a-00069f02.pphosted.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: pbonzini@redhat.com, berrange@redhat.com, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Thank you Markus.

On 3/11/2022 7:06 AM, Markus Armbruster wrote:
> Mark Kanda <mark.kanda@oracle.com> writes:
>
>> Introduce QMP support for querying stats. Provide a framework for adding new
>> stats and support for the following commands:
>>
>> - query-stats
>> Returns a list of all stats per target type (only VM and vCPU to start), with
>> additional options for specifying stat names, vCPU qom paths, and providers.
>>
>> - query-stats-schemas
>> Returns a list of stats included in each target type, with an option for
>> specifying the provider.
>>
>> The framework provides a method to register callbacks for these QMP commands.
>>
>> The first use-case will be for fd-based KVM stats (in an upcoming patch).
>>
>> Examples (with fd-based KVM stats):
>>
>> - Query all VM stats:
>>
>> { "execute": "query-stats", "arguments" : { "target": "vm" } }
>>
>> { "return": {
>>    "vm": [
>>       { "provider": "kvm",
>>         "stats": [
>>            { "name": "max_mmu_page_hash_collisions", "value": 0 },
>>            { "name": "max_mmu_rmap_size", "value": 0 },
>>            { "name": "nx_lpage_splits", "value": 148 },
>>            ...
>>       { "provider": "xyz",
>>         "stats": [ ...
>>       ...
>> ] } }
>>
>> - Query all vCPU stats:
>>
>> { "execute": "query-stats", "arguments" : { "target": "vcpu" } }
>>
>> { "return": {
>>      "vcpus": [
>>        { "path": "/machine/unattached/device[0]"
>>          "providers": [
>>            { "provider": "kvm",
>>              "stats": [
>>                { "name": "guest_mode", "value": 0 },
>>                { "name": "directed_yield_successful", "value": 0 },
>>                { "name": "directed_yield_attempted", "value": 106 },
>>                ...
>>            { "provider": "xyz",
>>              "stats": [ ...
>>             ...
>>        { "path": "/machine/unattached/device[1]"
>>          "providers": [
>>            { "provider": "kvm",
>>              "stats": [...
>>            ...
>> } ] } }
>>
>> - Query 'exits' and 'l1d_flush' KVM stats, and 'somestat' from provider 'xyz'
>> for vCPUs '/machine/unattached/device[2]' and '/machine/unattached/device[4]':
>>
>> { "execute": "query-stats",
>>    "arguments": {
>>      "target": "vcpu",
>>      "vcpus": [ "/machine/unattached/device[2]",
>>                 "/machine/unattached/device[4]" ],
>>      "filters": [
>>        { "provider": "kvm",
>>          "fields": [ "l1d_flush", "exits" ] },
>>        { "provider": "xyz",
>>          "fields": [ "somestat" ] } ] } }
> Are the stats bulky enough to justfify the extra complexity of
> filtering?

If this was only for KVM, the complexity probably isn't worth it. However, the 
framework is intended to support future stats with new providers and targets 
(there has also been mention of moving existing stats to this framework). 
Without some sort of filtering, I think the payload could become unmanageable.

>
>> { "return": {
>>      "vcpus": [
>>        { "path": "/machine/unattached/device[2]"
>>          "providers": [
>>            { "provider": "kvm",
>>              "stats": [ { "name": "l1d_flush", "value": 41213 },
>>                         { "name": "exits", "value": 74291 } ] },
>>            { "provider": "xyz",
>>              "stats": [ ... ] } ] },
>>        { "path": "/machine/unattached/device[4]"
>>          "providers": [
>>            { "provider": "kvm",
>>              "stats": [ { "name": "l1d_flush", "value": 16132 },
>>                         { "name": "exits", "value": 57922 } ] },
>>            { "provider": "xyz",
>>              "stats": [ ... ] } ] } ] } }
>>
>> - Query stats schemas:
>>
>> { "execute": "query-stats-schemas" }
>>
>> { "return": {
>>      "vcpu": [
>>        { "provider": "kvm",
>>          "stats": [
>>             { "name": "guest_mode",
>>               "unit": "none",
>>               "base": 10,
>>               "exponent": 0,
>>               "type": "instant" },
>>            { "name": "directed_yield_successful",
>>               "unit": "none",
>>               "base": 10,
>>               "exponent": 0,
>>               "type": "cumulative" },
>>               ...
>>        { "provider": "xyz",
>>          ...
>>     "vm": [
>>        { "provider": "kvm",
>>          "stats": [
>>             { "name": "max_mmu_page_hash_collisions",
>>               "unit": "none",
>>               "base": 10,
>>               "exponent": 0,
>>               "type": "peak" },
>>        { "provider": "xyz",
>>        ...
> Can you give a use case for query-stats-schemas?

'query-stats-schemas' provide the the type details about each stat; such as the 
unit, base, etc. These details are not reported by 'query-stats' (only the stat 
name and raw values are returned).

>
>> Signed-off-by: Mark Kanda <mark.kanda@oracle.com>
>> ---
>>   include/monitor/stats.h |  51 ++++++++
>>   monitor/qmp-cmds.c      | 219 +++++++++++++++++++++++++++++++++
>>   qapi/meson.build        |   1 +
>>   qapi/qapi-schema.json   |   1 +
>>   qapi/stats.json         | 259 ++++++++++++++++++++++++++++++++++++++++
> That's a lot of schema code.
>
> How much of it is for query-stats, and how much for query-stats-schemas?
It's roughly 60% query-stats, 40% query-stats-schemas.
> How much of the query-stats part is for filtering?
I think filtering is about 40% of query-stats.
>
>>   5 files changed, 531 insertions(+)
>>   create mode 100644 include/monitor/stats.h
>>   create mode 100644 qapi/stats.json
> [...]
>
>> diff --git a/qapi/stats.json b/qapi/stats.json
>> new file mode 100644
>> index 0000000000..ae5dc3ee2c
>> --- /dev/null
>> +++ b/qapi/stats.json
>> @@ -0,0 +1,259 @@
>> +# -*- Mode: Python -*-
>> +# vim: filetype=python
>> +#
>> +# Copyright (c) 2022 Oracle and/or its affiliates.
>> +#
>> +# This work is licensed under the terms of the GNU GPL, version 2 or later.
>> +# See the COPYING file in the top-level directory.
>> +#
>> +# SPDX-License-Identifier: GPL-2.0-or-later
>> +
>> +##
>> +# = Stats
>> +##
>> +
>> +##
>> +# @StatsType:
>> +#
>> +# Enumeration of stats types
> We commonly put a blank line between overview and arguments.
Will fix.
>> +# @cumulative: stat is cumulative; value can only increase.
>> +# @instant: stat is instantaneous; value can increase or decrease.
>> +# @peak: stat is the peak value; value can only increase.
>> +# @linear-hist: stat is a linear histogram.
>> +# @log-hist: stat is a logarithmic histogram.
>> +#
>> +# Since: 7.0
>> +##
>> +{ 'enum' : 'StatsType',
>> +  'data' : [ 'cumulative', 'instant', 'peak', 'linear-hist', 'log-hist' ] }
>> +
>> +##
>> +# @StatsUnit:
>> +#
>> +# Enumeration of stats units
>> +# @bytes: stat reported in bytes.
>> +# @seconds: stat reported in seconds.
>> +# @cycles: stat reported in clock cycles.
>> +# @none: no unit for this stat.
>> +#
>> +# Since: 7.0
>> +##
>> +{ 'enum' : 'StatsUnit',
>> +  'data' : [ 'bytes', 'seconds', 'cycles', 'none' ] }
>> +
>> +##
>> +# @StatsBase:
>> +#
>> +# Enumeration of stats base
>> +# @pow10: scale is based on power of 10.
>> +# @pow2: scale is based on power of 2.
>> +#
>> +# Since: 7.0
>> +##
>> +{ 'enum' : 'StatsBase',
>> +  'data' : [ 'pow10', 'pow2' ] }
>> +
>> +##
>> +# @StatsProvider:
>> +#
>> +# Enumeration of stats providers.
>> +#
>> +# Since: 7.0
>> +##
>> +{ 'enum': 'StatsProvider',
>> +  'data': [ ] }
>> +
>> +##
>> +# @StatsTarget:
>> +#
>> +# Enumeration of stats targets.
>> +# @vm: stat is per vm.
>> +# @vcpu: stat is per vcpu.
>> +#
>> +# Since: 7.0
>> +##
>> +{ 'enum': 'StatsTarget',
>> +  'data': [ 'vm', 'vcpu' ] }
>> +
>> +##
>> +# @StatsRequest:
>> +#
>> +# Stats filter element.
>> +# @provider: stat provider.
>> +# @fields: list of stat names.
>> +#
>> +# Since: 7.0
>> +##
>> +{ 'struct': 'StatsRequest',
>> +  'data': { '*provider': 'StatsProvider',
>> +            '*fields': [ 'str' ] } }
>> +
>> +##
>> +# @StatsRequestArray:
>> +#
>> +# @filters: filters for this request.
>> +##
>> +{ 'struct': 'StatsRequestArray',
>> +  'data': { '*filters': [ 'StatsRequest' ] } }
>> +
>> +##
>> +# @StatsVCPURequestArray:
>> +#
>> +# @vcpus: list of qom paths.
>> +##
>> +{ 'struct': 'StatsVCPURequestArray',
>> +  'base': 'StatsRequestArray',
>> +  'data': { '*vcpus': [ 'str' ] } }
>> +
>> +##
>> +# @StatsFilter:
>> +#
>> +# Target specific filter.
>> +#
>> +# Since: 7.0
>> +##
>> +{ 'union': 'StatsFilter',
>> +  'base': { 'target': 'StatsTarget' },
>> +  'discriminator': 'target',
>> +  'data': { 'vcpu': 'StatsVCPURequestArray',
>> +            'vm': 'StatsRequestArray' } }
>> +
>> +##
>> +# @StatsValueArray:
>> +#
>> +# @values: uint64 list.
>> +#
>> +# Since: 7.0
>> +##
>> +{ 'struct': 'StatsValueArray',
>> +  'data': { 'values' : [ 'uint64' ] } }
>> +
>> +##
>> +# @StatsValue:
>> +#
>> +# @scalar: single uint64.
>> +# @list: list of uint64.
>> +#
>> +# Since: 7.0
>> +##
>> +{ 'alternate': 'StatsValue',
>> +  'data': { 'scalar': 'uint64',
>> +            'list': 'StatsValueArray' } }
> Any particular reason for wrapping the array in a struct?
Due to the limitation in the QAPI framework, I hit:
../qapi/stats.json:139: 'data' member 'list' cannot be an array

I can look at adding support...

Thanks/regards,
-Mark
>> +
>> +##
>> +# @Stats:
>> +#
>> +# @name: name of stat.
>> +# @value: stat value.
>> +#
>> +# Since: 7.0
>> +##
>> +{ 'struct': 'Stats',
>> +  'data': { 'name': 'str',
>> +            'value' : 'StatsValue' } }
>> +
>> +##
>> +# @StatsResultsEntry:
>> +#
>> +# @provider: stat provider.
>> +# @stats: list of stats.
>> +#
>> +# Since: 7.0
>> +##
>> +{ 'struct': 'StatsResultsEntry',
>> +  'data': { 'provider': 'StatsProvider',
>> +            'stats': [ 'Stats' ] } }
>> +
>> +##
>> +# @StatsResultsVCPUEntry:
>> +#
>> +# @path: vCPU qom path.
>> +# @providers: per provider results.
>> +#
>> +# Since: 7.0
>> +##
>> +{ 'struct': 'StatsResultsVCPUEntry',
>> +  'data': { 'path': 'str',
>> +            'providers': [ 'StatsResultsEntry' ] } }
>> +
>> +##
>> +# @StatsResults:
>> +#
>> +# Target specific results.
>> +#
>> +# Since: 7.0
>> +##
>> +{ 'struct': 'StatsResults',
>> +  'data': {
>> +      '*vcpus': [ 'StatsResultsVCPUEntry' ],
>> +      '*vm': [ 'StatsResultsEntry' ] } }
>> +
>> +##
>> +# @query-stats:
>> +#
>> +# data: @StatsFilter.
>> +# Returns: @StatsResults.
>> +#
>> +# Since: 7.0
>> +##
>> +{ 'command': 'query-stats',
>> +  'data': 'StatsFilter',
>> +  'boxed': true,
>> +  'returns': 'StatsResults' }
>> +
>> +##
>> +# @StatsSchemaValue:
>> +#
>> +# Individual stat schema.
>> +# @name: stat name.
>> +# @type: @StatType.
>> +# @unit: @StatUnit.
>> +# @base: @StatBase.
>> +# @exponent: Used together with @base.
>> +# @bucket-size: Used with linear-hist to report bucket size
>> +#
>> +# Since: 7.0
>> +##
>> +{ 'struct': 'StatsSchemaValue',
>> +  'data': { 'name': 'str',
>> +            'type': 'StatsType',
>> +            'unit': 'StatsUnit',
>> +            'base': 'StatsBase',
>> +            'exponent': 'int16',
>> +            '*bucket-size': 'uint32' } }
>> +
>> +##
>> +# @StatsSchemaProvider:
>> +#
>> +# @provider: @StatsProvider.
>> +# @stats: list of stats.
>> +#
>> +# Since: 7.0
>> +##
>> +{ 'struct': 'StatsSchemaProvider',
>> +  'data': { 'provider': 'StatsProvider',
>> +            'stats': [ 'StatsSchemaValue' ] } }
>> +
>> +##
>> +# @StatsSchemaResults:
>> +#
>> +# @vm: vm stats schemas.
>> +# @vcpu: vcpu stats schemas.
>> +#
>> +# Since: 7.0
>> +##
>> +{ 'struct': 'StatsSchemaResults',
>> +  'data': { '*vm': [ 'StatsSchemaProvider' ],
>> +            '*vcpu': [ 'StatsSchemaProvider' ] } }
>> +
>> +##
>> +# @query-stats-schemas:
>> +#
>> +# Query Stats schemas.
>> +# Returns @StatsSchemaResult.
>> +#
>> +# Since: 7.0
>> +##
>> +{ 'command': 'query-stats-schemas',
>> +  'data': { '*provider': 'StatsProvider' },
>> +  'returns': 'StatsSchemaResults' }


