Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B3D23B982E
	for <lists+qemu-devel@lfdr.de>; Thu,  1 Jul 2021 23:31:48 +0200 (CEST)
Received: from localhost ([::1]:55484 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lz4Hj-0002cN-Hn
	for lists+qemu-devel@lfdr.de; Thu, 01 Jul 2021 17:31:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49994)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dongli.zhang@oracle.com>)
 id 1lz4Fe-0001as-71
 for qemu-devel@nongnu.org; Thu, 01 Jul 2021 17:29:38 -0400
Received: from mx0a-00069f02.pphosted.com ([205.220.165.32]:51132)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dongli.zhang@oracle.com>)
 id 1lz4Fc-0006D6-6B
 for qemu-devel@nongnu.org; Thu, 01 Jul 2021 17:29:37 -0400
Received: from pps.filterd (m0246629.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 161LQTJR016638; Thu, 1 Jul 2021 21:29:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=subject : from : to :
 cc : references : message-id : date : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=corp-2020-01-29;
 bh=E6ZL4nyOOwUxpJ6Lwkc4KHMDkcy2JF9vNTww8gQMIrA=;
 b=OJkM+EXCymA3HU8mj9GqHqnnTKq9ZGqFNorJ72zK104tSdr+y7KNvKNmVpsLSuVwxaw2
 i4PevthJDRWgwUp4u8knhbYRwN7BIVvtkuqy8RrarCCZeXiabw98gk6GFUYSKeGqhfvJ
 JNLU0EJSsdpIDOC9PzahSpRW86dM8KwChs2AaabydNuk90/LH8i8in5cGIqZRq79YyVV
 9qs2FUoqJ6T+0eIhmPTNyvjl852X76dhpi05ijs+KzsF/z/C5dPTLU6n6yIOZjchh/5L
 sddwLrufmsR+01wOR/cl5cO9y68P2oxEaxIGinbw14iSl5ewlF5amjnHXsD2ntPyCHT/ Tw== 
Received: from aserp3030.oracle.com (aserp3030.oracle.com [141.146.126.71])
 by mx0b-00069f02.pphosted.com with ESMTP id 39gjrwm37c-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 01 Jul 2021 21:29:31 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
 by aserp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 161LG9nA093906;
 Thu, 1 Jul 2021 21:29:30 GMT
Received: from nam11-bn8-obe.outbound.protection.outlook.com
 (mail-bn8nam11lp2176.outbound.protection.outlook.com [104.47.58.176])
 by aserp3030.oracle.com with ESMTP id 39dt9mdn7j-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 01 Jul 2021 21:29:30 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=e9+TNmdxAHS2ascTMzrCIEz2F6V6Rr6QyZ0qwSknyUuW8WsriWTC5fQmcAKO2sAaq6HcZT9pW0zcCVA30xexr5flNIuzpWesdcIMx56hL7hW+mthI0HOm/Fb9H0ikWhIbWhySuceNthusl/1HuBfWYvpNvPI12VRpiBWyh9Lugvty8gEBUXubB87W8wlvcn4nCRzfV5aE3JTsHEcyONwnUbl3LUnHckMltagR4g/FrSHUP+shT6qF+rt1/fcg6gwpI6c/eMy59rbG0GnRmhWEoPzcO8I6MApJKN7jr7BW6TF/LLiAyORqEbY6+PM5y07YZ+OQ6KKnjrJOovEr3Rq8g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=E6ZL4nyOOwUxpJ6Lwkc4KHMDkcy2JF9vNTww8gQMIrA=;
 b=QgCCQEi2xXX+CgmRYqiRQGvAYJN4s+GFOLnIjRNtlJiV4fdMUlHcHEbRzEefIPCaYPwJHIQ3GRQmpEvcnp7c319vfZwoYgACUNI+YlK13NuecWzl2WiV1BJ6wD6KV1A+sUErhea/4mS45ZxnXdb4wDFnXp1pL53YOhyIxxW9Fkobw6HRcdo/u+8vnkoFkSbSP2gaBhOwGHxF/iU+tDm6xkdFf0wpt+LrB6BfUgRLHcdwlhG4q6Yw/MsxhVgelF50qqErGbHewSUQnZXde6Af9khedXkKs/shdUfw8+fvUnagqGLXsE7QHyJ396FNt+FGK8XokaEUofgaPPlvG6ZjNA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=E6ZL4nyOOwUxpJ6Lwkc4KHMDkcy2JF9vNTww8gQMIrA=;
 b=U4aiyRXdHaN6fmHzcmRnR7XUq3I5l5M1/H0ToBzXqC6BK2mwlbV58sxAR40kuSRcsXBkwwwn9Hahv8fIsnvz8Kv3rkTRu2ntu9ArDO3R9Fpmphaa9KiomvaFdN2NVOOus6iL1E0Mj/2mUWkG3xZSHDVqrNU+iTQlaVagWahbXbk=
Authentication-Results: oracle.com; dkim=none (message not signed)
 header.d=none;oracle.com; dmarc=none action=none header.from=oracle.com;
Received: from BYAPR10MB2663.namprd10.prod.outlook.com (2603:10b6:a02:a9::20)
 by SJ0PR10MB4574.namprd10.prod.outlook.com (2603:10b6:a03:2dd::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4264.19; Thu, 1 Jul
 2021 21:29:27 +0000
Received: from BYAPR10MB2663.namprd10.prod.outlook.com
 ([fe80::18a:7c1f:bf20:ba6c]) by BYAPR10MB2663.namprd10.prod.outlook.com
 ([fe80::18a:7c1f:bf20:ba6c%3]) with mapi id 15.20.4287.022; Thu, 1 Jul 2021
 21:29:27 +0000
Subject: Re: [PATCH 1/1] hmp: synchronize cpu state for lapic info
From: Dongli Zhang <dongli.zhang@oracle.com>
To: qemu-devel@nongnu.org
References: <20210701212639.1318-1-dongli.zhang@oracle.com>
Message-ID: <4574311f-c6c5-a456-e85f-cc3c8ad16365@oracle.com>
Date: Thu, 1 Jul 2021 14:29:26 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
In-Reply-To: <20210701212639.1318-1-dongli.zhang@oracle.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [2601:646:c303:6700::7d72]
X-ClientProxiedBy: SJ0PR05CA0209.namprd05.prod.outlook.com
 (2603:10b6:a03:330::34) To BYAPR10MB2663.namprd10.prod.outlook.com
 (2603:10b6:a02:a9::20)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2601:646:c303:6700::7d72] (2601:646:c303:6700::7d72) by
 SJ0PR05CA0209.namprd05.prod.outlook.com (2603:10b6:a03:330::34) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4308.8 via Frontend
 Transport; Thu, 1 Jul 2021 21:29:27 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ad1e832d-a66f-4e90-523f-08d93cd74e21
X-MS-TrafficTypeDiagnostic: SJ0PR10MB4574:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <SJ0PR10MB45746E910CD02F25B1417837F0009@SJ0PR10MB4574.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3968;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: oTJd8Ti5Xi8saBlMUln+vHHfuzP9tyo/Z+zs5/PdklF2/U+eiV36fC7xVWVEqjLMKmx0xyWr4sHNI4IJzJRmiNnk7Zf6uIWs8AWbuRreQ77oBdjWvP3w6JEJyo+LTrIs+wJmNRE4CGH6nnj/KRmZFCXkD/aV/EZR+sC708xOUrHooWkNaA56shnF7wYXKGSAdI83EAaWSiMWLaWGJ0RpZtNgJ95t6z/LswVs2YhReH6Ipf6xYlcFiko3G6QcT7ulGUT6LEEUO2o/QJy+5C37jyAs8THGdFqfRSieFs4oegVrL08MAIzzg2v6zkuvgM/z4Z/YcOM+gG5vntzBvnfU897drWeC7J2O8neFm5wGC+k6UPuCK75mZzCCj2NK8IxUgO2mldk+EjD3bQIpW+6yRVbvLfKqY6PWk61I5hmLu+fiT7rYGBjtRfc/keHqs/IDHVRh0vjdV/OqjQKazUi25U7CJPAUwFpvqk9Q/toFyG6qxgLQcXeZKJTk8fSjRHkJzthrR0DJrXNpxFaO6Nh+pd9+KEnTN+g5KSyw6JHLL6N6jDBmNRAMPAV7v1RhduKPz7dOobyns2eP7heQk9cNAh79MxQU8SiVGWSzve5mO4Z3ZItiv4k3RHLTL6bqSSIauo8AoPyik+nZYfKARdj3lrWZh+D5LNMJZZ1mQPajFIUqM1gWoTlUv1lQFnFCaPuLOJe8WR34kzh8C7A9a04m08gPIANC+OJqXHHj5hqubdw=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR10MB2663.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(396003)(376002)(366004)(39860400002)(346002)(136003)(31696002)(66556008)(36756003)(66476007)(5660300002)(86362001)(2906002)(53546011)(38100700002)(6916009)(66946007)(478600001)(2616005)(6486002)(16526019)(186003)(8676002)(44832011)(107886003)(31686004)(8936002)(4326008)(316002)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VkQ4eUFST1Q1NG9WMDR1RDdkUURINUdRRC80SmphR1NlaTJMS3dabHFUVUM4?=
 =?utf-8?B?Z1h1UTNZWUxLeTg5QmNYNkJYZ01QbVJ1S0pGTWEzT0J3eVdteEczdkprbHZz?=
 =?utf-8?B?S2dTQlEyZ3FPRFNzWXpCQUZTNUtRNjJXQXg5Qk1oTGFBUFRkZDJRaUw0UkRF?=
 =?utf-8?B?QXRMVm96TmZlZjRXUWtDMEZ0OG1ScjlmQWVrQ29PUTNjV01HRjRJQnIzZFRG?=
 =?utf-8?B?ZkhGNnV6Z09QY2pxZEN3a28vNnpxbnlFZ2J5a1p2QlhIUXVOYkRmTE13Sm1I?=
 =?utf-8?B?NXVMcmdUQ1ZzWEdRK2hwZEtjYmlCTnBjOUVXbUpkNnBnd1pVM1NPRnZERkds?=
 =?utf-8?B?N1dMN3JzS1V6VjdqbGMyRlg0WGtUSzllNmVpSnU4dDQyLzJlcThNcTloSjhP?=
 =?utf-8?B?VEpjakhQY1ZZUFNxZE0zemloeHAvVXUzd0x4eWFTdGFCVzBSZGtzQ2EvTGJu?=
 =?utf-8?B?bWhxaUlMSXFOSzFYYmdHc2hlKzUwOHpJcHF5WXcxOHJNVHFXTkt2aHoyVEVY?=
 =?utf-8?B?a2NhOGJ0RWhBL0pFN2pjaUVvRlN1anhIcmNZVXNQeVJlTmtoa1g5cUZqUXZy?=
 =?utf-8?B?NXJQVHhQYVlVNjJrVTRrMDZGWmFOb1U3L0krSTEyb1Y2bWVJSFBLRStOZ1FR?=
 =?utf-8?B?KzlOMEhRVklWWnpLbEZTb29GVHVKUGZNc0MwVENZaWxvbDJiUzdBYXh3YjFE?=
 =?utf-8?B?aXpObEV2M1Z3TXFpY0hwS091MGJscm9zejFXQXVyQVRYekpNRU9WQk0wWncx?=
 =?utf-8?B?UHkwcUJnelk4bDVoVS92RUEzdUtTR0hDcS8rOTBHdXZXTzdMenNPSE1nR1pQ?=
 =?utf-8?B?L084a3lOUnBMbGhDdW5HUFQ3SThCd0JIbCtLeDYrbzF4cjBvZzBvTTY4WjZC?=
 =?utf-8?B?Wk1EbjhlaUdzSVZ6M2tpSGZjU1M0bUtDN0lMemgzeTEzQzc2MDlKbWVGU3By?=
 =?utf-8?B?TmhQNjIzMzRRUEJENWR5OHBRdk5FbWNBSjZIcnl1dVoxVGZsSlVwWFhqR25M?=
 =?utf-8?B?RTZ1eDhjNEJOdGVJTmdMMk9HdUhiQUR2L2ZOQVBLblBjUnRSOCtHUDNzTXpI?=
 =?utf-8?B?Z0NPTytVT3dkWlpTU0JEWTJNUDNRMnl4NUZJVE1xQXRVNzlaVUVvZkM2cjNQ?=
 =?utf-8?B?R2VYandCbys2VDVWUEN4SnBwZFVmczkzeWRDb2FTN1pTdDJsQktDcG1ld1FU?=
 =?utf-8?B?cUhsekJYb09QQk5KUHpFSmRwLzFuamtJMEx4NDhNdkI0dEZ2WUZWUzU4VG41?=
 =?utf-8?B?emlVSzN2b2xiRm1zVVFuOVU5TEVrL2tKUEtwNjBlZGI2SXZRcW1uWXErckMw?=
 =?utf-8?B?WnVQNXg3NmlQRi9Rc2gwVktWYlM0NGdmQ1FaOURIUXMwQjd1STBCZlFFbU80?=
 =?utf-8?B?Q2dvTzBQa0xFT0pBUnlNOGNLd2pERXI4bUhQNDdmT0pRaTJKWmxuWWVVcEdu?=
 =?utf-8?B?eTNOZE5tYmJsRU13Z1VQMkY4eGkxbU5KaG9TMTV5b1JTNFE3dmhPY1Zad0o4?=
 =?utf-8?B?clJkaDc0cklMZDArbFE4dWlBTDQwOGFVUmxsS1lZQUc5aVlRaXBkdWlNYXRT?=
 =?utf-8?B?UnZEaGNMc0FLeGc2RW82NFdpay9DdFpPRDFHQ0RYNmk0OUIvZFdKaS9LT2xv?=
 =?utf-8?B?MjJyZDFGN1BzQ25HRjhqRGRjUmU2QWhSbFVDaDNNV3p6TTRURFVWbzZhZXN6?=
 =?utf-8?B?dElabEkxOEdEY1lmM1lTd3M0OHg4TFZrZFpFeWNqU3dtQjdubkRyZG9RQktW?=
 =?utf-8?B?c1k1TlJ1YUtqZkczUVhaVlNWK1NvYUprYmhXMHpHNkd6L3I1MkdsZUxaVTFS?=
 =?utf-8?B?Uzl3aWhtUnVLN1ByV1FQUT09?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ad1e832d-a66f-4e90-523f-08d93cd74e21
X-MS-Exchange-CrossTenant-AuthSource: BYAPR10MB2663.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jul 2021 21:29:27.7416 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dYrfWNwfXSm0qnKGjiaFKywz4DWLWHDXBNlXl4W3TvxmWtoYX4Pi0s2s1vmYDRjd0RiGU0P9qg099KASnbmI9Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR10MB4574
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=10032
 signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0
 bulkscore=0
 mlxlogscore=999 phishscore=0 spamscore=0 malwarescore=0 mlxscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104190000 definitions=main-2107010124
X-Proofpoint-ORIG-GUID: 4XCvWVylqBC2XalerQ2NMTKhmvfF8v36
X-Proofpoint-GUID: 4XCvWVylqBC2XalerQ2NMTKhmvfF8v36
Received-SPF: pass client-ip=205.220.165.32;
 envelope-from=dongli.zhang@oracle.com; helo=mx0a-00069f02.pphosted.com
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
Cc: kwolf@redhat.com, brijesh.singh@amd.com, ehabkost@redhat.com,
 jejb@linux.ibm.com, joe.jin@oracle.com, dgilbert@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Please ignore this patch. I sent out the wrong version without memory check.

I will re-send again.

Thank you very much!

Dongli Zhang

On 7/1/21 2:26 PM, Dongli Zhang wrote:
> While the default "info lapic" always synchronizes cpu state ...
> 
> mon_get_cpu()
> -> mon_get_cpu_sync(mon, true)
>    -> cpu_synchronize_state(cpu)
>       -> ioctl KVM_GET_LAPIC (taking KVM as example)
> 
> ... the cpu state is not synchronized when the apic-id is available as
> argument.
> 
> The cpu state should be synchronized when apic-id is available. Otherwise
> the "info lapic <apic-id>" always returns stale data.
> 
> Cc: Joe Jin <joe.jin@oracle.com>
> Signed-off-by: Dongli Zhang <dongli.zhang@oracle.com>
> ---
>  target/i386/monitor.c | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/target/i386/monitor.c b/target/i386/monitor.c
> index 119211f0b0..09b3b73955 100644
> --- a/target/i386/monitor.c
> +++ b/target/i386/monitor.c
> @@ -28,6 +28,7 @@
>  #include "monitor/hmp-target.h"
>  #include "monitor/hmp.h"
>  #include "qapi/qmp/qdict.h"
> +#include "sysemu/hw_accel.h"
>  #include "sysemu/kvm.h"
>  #include "sysemu/sev.h"
>  #include "qapi/error.h"
> @@ -656,7 +657,9 @@ void hmp_info_local_apic(Monitor *mon, const QDict *qdict)
>  
>      if (qdict_haskey(qdict, "apic-id")) {
>          int id = qdict_get_try_int(qdict, "apic-id", 0);
> +
>          cs = cpu_by_arch_id(id);
> +        cpu_synchronize_state(cs);
>      } else {
>          cs = mon_get_cpu(mon);
>      }
> 

