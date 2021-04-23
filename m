Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F207369887
	for <lists+qemu-devel@lfdr.de>; Fri, 23 Apr 2021 19:35:28 +0200 (CEST)
Received: from localhost ([::1]:35238 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lZziB-0007XH-7i
	for lists+qemu-devel@lfdr.de; Fri, 23 Apr 2021 13:35:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45910)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dongli.zhang@oracle.com>)
 id 1lZzfp-000736-L1
 for qemu-devel@nongnu.org; Fri, 23 Apr 2021 13:33:01 -0400
Received: from mx0a-00069f02.pphosted.com ([205.220.165.32]:36546)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dongli.zhang@oracle.com>)
 id 1lZzfj-0003Xh-GK
 for qemu-devel@nongnu.org; Fri, 23 Apr 2021 13:33:01 -0400
Received: from pps.filterd (m0246629.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 13NHW2mD008531; Fri, 23 Apr 2021 17:32:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=subject : to : cc :
 references : from : message-id : date : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=corp-2020-01-29;
 bh=BMd3UUm5r4BcMMGZ1PKkeHNG/a5510jHv0QEvsXtCvc=;
 b=KCk+MGlYD875u2CK6nmxfTH86I8ZtaeFBqANbtW0KfiLu+USmllooqXDrje2DbKIeIsE
 icUzfX+1qbp9M1gwiEIMcrG+9UuG/OyAJO+ZtdXCvD0e7p6H3QM9jSqMOA+LsKqygD1z
 bSxulxs3s/um762QI65obeQLBPclcfUlHU5Px+RVICgSmx88dPm6MiChksDQl3g8CYOh
 OFogBfX3pCMcOdFp56Ze9nqhXSpSq7JLWDNxq9I02uBpJ8Y6ulDxrKP+d2NZYLWx98lr
 WV/Ab/ETQCljH5ozSn5wwU+UMxbVKn+yPnCcRxfssLDgPbmAVeTRIBGis29nRg5UhZaf 6A== 
Received: from oracle.com (aserp3030.oracle.com [141.146.126.71])
 by mx0b-00069f02.pphosted.com with ESMTP id 383duh8db8-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 23 Apr 2021 17:32:52 +0000
Received: from aserp3030.oracle.com (aserp3030.oracle.com [127.0.0.1])
 by pps.podrdrct (8.16.0.36/8.16.0.36) with SMTP id 13NHWpNq113822;
 Fri, 23 Apr 2021 17:32:51 GMT
Received: from nam10-mw2-obe.outbound.protection.outlook.com
 (mail-mw2nam10lp2109.outbound.protection.outlook.com [104.47.55.109])
 by aserp3030.oracle.com with ESMTP id 383ccftckv-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 23 Apr 2021 17:32:51 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IDuWvrTJ8LnISSAXbwhwd/+0N9UxiMUrTGoODdURPeNlfFd4soFBuJO5rk3XQmv9nSsKQklHwX42qqnyQouPrKc0ttd9V+4ALehysfj/ZLH5K1duC0vljh3Y973TgWAll6M/U68+VDgbQsn7l8l7ak+WbS44C7VP7hfYdJtY5qsYNBEdeIEpwlAZYY65b1Fc6njXCSPPCi1equ6iJc7wGGxPLlgIaHpdT94uddZNw5tT4GW3EEuL9ZP69aEAu+CdlY3GgCCUhdMIiib+wxJP4dnDlaP1/K/0EnEkxtLHxEBXn6mgsEBbjy3usUP6wObap+HjfEZFb5vD/wD3x4uRXQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BMd3UUm5r4BcMMGZ1PKkeHNG/a5510jHv0QEvsXtCvc=;
 b=n8cjFSGkeKOcpqR4UwLDu4AzExwuWYV5SupFrbsRKIU73SaiAlfzaEsCdAwymzYuDI10qfNy4jOg9//5/JCuIdzdvc596FhYKz/Q1X7FN/aIW7Db8qy+C79Kiyhep122dPyfqNF5iJteJRRBr3DftkOj52SOkQ9R4zi59gjKdGVeepL81jeUc8S87FAxeVzdmIh5CtYshHWvYDvxjanjkfFSXLik7kHZ8xmB/L6OFBW8YCSNxv7NZbSA8IidVu9SO/YlkzIbp5NBzLgh6dbVng8BGkYWRvP6an24cKTQ7k9SYY4H49ETID7xndLDMQO792LWdF7adquzQe4XPfznjg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BMd3UUm5r4BcMMGZ1PKkeHNG/a5510jHv0QEvsXtCvc=;
 b=p/Wp2xkuys6HgOYl/pmGYAkE0NbjBfG/uWRspdH+0vglYQ3AlVj1blEMTW9zzm3QJXtvU6dish8t4bXFtjSRW8KfcGJNqf9eOZP92UMUDCjFoQXk+EDhQvORSFN7J5ph+jcGtSGJ9nL9jgDzN9nXg3Arzm/cAWkVq4ZUhPSOdZ0=
Authentication-Results: oracle.com; dkim=none (message not signed)
 header.d=none;oracle.com; dmarc=none action=none header.from=oracle.com;
Received: from BYAPR10MB2663.namprd10.prod.outlook.com (2603:10b6:a02:a9::20)
 by BYAPR10MB3159.namprd10.prod.outlook.com (2603:10b6:a03:153::25)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4065.22; Fri, 23 Apr
 2021 17:32:48 +0000
Received: from BYAPR10MB2663.namprd10.prod.outlook.com
 ([fe80::44f7:1d8f:cc50:48ad]) by BYAPR10MB2663.namprd10.prod.outlook.com
 ([fe80::44f7:1d8f:cc50:48ad%6]) with mapi id 15.20.4065.024; Fri, 23 Apr 2021
 17:32:48 +0000
Subject: Re: [PATCH RFC 1/1] msix: add hmp interface to dump MSI-X info
To: Jason Wang <jasowang@redhat.com>, qemu-devel@nongnu.org
References: <20210423044713.3403-1-dongli.zhang@oracle.com>
 <20210423044713.3403-2-dongli.zhang@oracle.com>
 <c4d7bc63-cb44-0795-a37c-dbe2cc9f6fb8@redhat.com>
From: Dongli Zhang <dongli.zhang@oracle.com>
Message-ID: <dd7ae079-ad91-dfc2-1ca6-04a0bdb89b78@oracle.com>
Date: Fri, 23 Apr 2021 10:32:44 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
In-Reply-To: <c4d7bc63-cb44-0795-a37c-dbe2cc9f6fb8@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Originating-IP: [2601:646:c303:6700::d22a]
X-ClientProxiedBy: SA0PR11CA0191.namprd11.prod.outlook.com
 (2603:10b6:806:1bc::16) To BYAPR10MB2663.namprd10.prod.outlook.com
 (2603:10b6:a02:a9::20)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2601:646:c303:6700::d22a] (2601:646:c303:6700::d22a) by
 SA0PR11CA0191.namprd11.prod.outlook.com (2603:10b6:806:1bc::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4065.20 via Frontend
 Transport; Fri, 23 Apr 2021 17:32:47 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 9fe5e534-e2ea-4d7b-16a6-08d9067dd005
X-MS-TrafficTypeDiagnostic: BYAPR10MB3159:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BYAPR10MB3159118655A48BDA3C912445F0459@BYAPR10MB3159.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:359;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: AHfU8HdexCzKXR7tIcsI7KPIsHF2CVNWtWFpa0TnL/0o+llHSW5t5kPzy0KPpff6UDF8VRgmLOnbB9/78Dt4OnBEBFiqu8YONYMUbwe6fd5s7KX4rsL1TDgvnyVsjCVayfsfQbZKCEoTe+Nfp+dMk5l1wk04CtCBhuZgvYFv6F6nNyTVSpDmGJVMH4FGZAvvs/TUhifwu8h4/UMo4RhO+S2n4rSVbDDnHU3/LK5ls2DkGcIy8oddC3y4PWeJxDFRv1H/YAZh8PxBkjW6hQHJQi+t6lflp+NXy8nWMb/3FwUk/lQcuxqlgun/CNTvcsQ+hGP4YLzcCjnEvA+QTXB6Zh1ZJmyHddIrf1z0mkTNJRFyLh7PN5kdTc7c9vev8RBUT6Xi0NwP0jyPKxUKzGSFiY3yCN75SUgBHy8y5yuR2x+BcxsqCSyXtM5IzAOf65oWmTI6TYsgtE+vtzxy7QZblFILpZtfsY7S1yOJfgxBMF+GyA1CHuMcIW67jI8U3XtPDT67n7JaOrz4CYGgR3zTFLOZm8lRm4jIkOHq+Czm+SSet+amGGqskzkbvXqbdc1TZaNSqstxWH95AFMvA/DnbFFWrjPTYKOfNzkcAwNZutt7D6Yt/x9rXWphBiTIj3dTynOrJIrhe/R8EebUqa3Bz/0etGpmzkpDTjtqTHn0oI8J7H5EFQEOERMoyu4hORu/5fBVHhdZ+VSQSI9KHpNi8A==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR10MB2663.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(346002)(136003)(39860400002)(396003)(376002)(2616005)(83380400001)(36756003)(478600001)(86362001)(4326008)(5660300002)(16526019)(107886003)(31696002)(66556008)(6486002)(316002)(186003)(2906002)(66476007)(66946007)(8676002)(31686004)(8936002)(6666004)(38100700002)(53546011)(44832011)(43740500002)(45980500001)(309714004);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?VUtscFhCYkRQK0JTVm13c0FqMTlqQWNwRitVRDVOMmg1Ym1MMDR0NHVJNHFh?=
 =?utf-8?B?aXdILzl4d2tncllNUHVQWEhXdng1UGpDQk5IeDBHckx3T3E3NG1tTEVROGwx?=
 =?utf-8?B?SW10NlpwZCs0WlU0VHd3Qm12cFBuUHl1dXpsKy8rd1l0RVNnV0VoQ1llT0cy?=
 =?utf-8?B?a0xhMlN6QnUzL1luKzBrNTMxVzFiSTFOTFArUFkxOVhETkw4SS9XSEhHUnBC?=
 =?utf-8?B?clJHV052SEtiTDBMcmdLZldkTDZFQ1c1b3pqSHd2TldGcVhGVlhPRTVXSEhK?=
 =?utf-8?B?SHZ2WUdrRDJhTU1rNXdDTE1US3lxbEhiVC9UNC9lbG9OMzVtbDRLQXp2bVBT?=
 =?utf-8?B?YjdTeDV4dk1GMjRTYXVJTDU0VXU4Wlp0Nnc0SUgxZHp4cFNOdzF2WXRzeGFy?=
 =?utf-8?B?cXRzU3BDYnNtNDJtRWF6dXBuOTBJNWZ0WkFxTGxmcEdocTVFT3crbjR2Vnpx?=
 =?utf-8?B?Nm53QzRZYUFQL01IYTlXU1BaYXFubVlMc2J4bDgvK1l6V2dLUkR6aGoxS3ZK?=
 =?utf-8?B?Q2loUmxSNEx1dXVFTFVJVlB2eGhxSFNsbzhDV0RWNFNFeTlzQ0ZJbGJiSlV0?=
 =?utf-8?B?OVVOay90bU1jWmtTZXVhcnNqVHhWVHpPQjdUaDZxV0FTQ2VDQlZVYUo1V0xw?=
 =?utf-8?B?WDNHd0R6WGhCSnk5T0p0a05lMUQzSjhSa3FCTWNnTTRiSWJZbklZN21wOG5T?=
 =?utf-8?B?SHFRbUg5NURZWUN1L29lRG9DMUN1K0ZhZW1qdmpqMmFtaW5wZWhXNllaMExX?=
 =?utf-8?B?UVUyR3JJMGY4OEdDT0E5QjZaOXhxTmpoYmQ1WkF4SjFubE9TRzFRaXRrYkM4?=
 =?utf-8?B?Ym1MMkpKSTB3VlNubXJLTldCQmllUGN5cnFzcktLVldEOXZpeXExaER5WSt2?=
 =?utf-8?B?akJBZ2JGVDFIRE9MRHhVZ0lhbFh0Y3h1WHJZOFdJakFnWmZZNDRpTStnZitp?=
 =?utf-8?B?cDg3YXhkb1Y2SlhONS9ZbDU5UWtYUlhxWXlzUFRJckZnTTdldGsyMkZUWW1m?=
 =?utf-8?B?VXMrVjdHZ21ZM2VOZk0rdEliMnRWbzJnSmxBdmtReWlGRW9JZ2srZTJxRVdU?=
 =?utf-8?B?ekRaNVB4QzRYNXh3dkdDeEdlZWJlN3NrQUlIWW1lV01GODRLMk4wRUFhNmpT?=
 =?utf-8?B?TnQ0MVNSWkNSajlickFlayt0THR6MVZmaXYvRXUzNFRVVzVxRjQ5V2lvaFl3?=
 =?utf-8?B?MDhCVWJFMUFsdHN0V3piT0I4cHJia3dLWTUzcEFuUE9Eak4yejlJYjJLdG9C?=
 =?utf-8?B?SlBVdGpYYnhyU05XS3lGK2xkQnZqUkM1VXNldlh1QS94T3Mza0dobjVqMmd3?=
 =?utf-8?B?V1BoNWFlZ2NwT1JPZDhPamkwTTBsdW9aR05rdDJkekdrSWMyMUVGS3hoTGhL?=
 =?utf-8?B?K1pWc1AvWEVTZUs4T0JuMnhuUThlT1dBOTZ2TTlVYUR1SjhLQlhSc05CNVRJ?=
 =?utf-8?B?TER5Wk9NTU5rVUNlYm5kQjh6cldUMGxMRFYwaERGZHh4RmFUeHRxMzgrU0pv?=
 =?utf-8?B?em5yQThiMFNrYmZqblBvR3JsQUVCUGxMMENLVGlseUFBVHZHaU1Qc1gyOWNt?=
 =?utf-8?B?Y1dpMndXNVpsaG1GK2V1SFZhSjloeVlyYzR2ZldzaDI0cDhyRE5aZFV6ZERT?=
 =?utf-8?B?c0ZZcTZiZFZJamFRTXFXOUpmc2htZi9zVlV2QTJvdThpOEdaT21ZaStrdzEv?=
 =?utf-8?B?ZkJYY2F3VTJ5MkJRZ0k4NXg2NW9jdnVrRkx5dDc2cnBVUWtXM2V4akE3UWNj?=
 =?utf-8?B?dmx0VmpHQXV2UmQ1SjBVekhScjBOTjFEam1rUTdKS092aFlHV2FlTGo0aG51?=
 =?utf-8?B?T1FQbWR2ODRZTktpdHZYZz09?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9fe5e534-e2ea-4d7b-16a6-08d9067dd005
X-MS-Exchange-CrossTenant-AuthSource: BYAPR10MB2663.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Apr 2021 17:32:48.1338 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: An/l4bpq7ZmyXxC49gRS1OnnVh33jq2HW01WcK1mh4dH+38/3xEqb8L+kHQEf1WLd84df5PfdWqdmkMJxM/Z1Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR10MB3159
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9963
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0
 spamscore=0 suspectscore=0
 mlxscore=0 phishscore=0 malwarescore=0 adultscore=0 mlxlogscore=999
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2104060000
 definitions=main-2104230113
X-Proofpoint-ORIG-GUID: fxFo5KSEcdr30wzgokApGqdbkJaPqqKt
X-Proofpoint-GUID: fxFo5KSEcdr30wzgokApGqdbkJaPqqKt
Received-SPF: pass client-ip=205.220.165.32;
 envelope-from=dongli.zhang@oracle.com; helo=mx0a-00069f02.pphosted.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, NICE_REPLY_A=-0.001, SPF_HELO_NONE=0.001,
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
 joe.jin@oracle.com, dgilbert@redhat.com, pbonzini@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On 4/23/21 12:59 AM, Jason Wang wrote:
> 
> 在 2021/4/23 下午12:47, Dongli Zhang 写道:
>> This patch is to add the HMP interface to dump MSI-X table and PBA, in
>> order to help diagnose the loss of IRQ issue in VM (e.g., if an MSI-X
>> vector is erroneously masked permanently). Here is the example with
>> vhost-scsi:
>>
>> (qemu) info msix /machine/peripheral/vscsi0
>> MSI-X Table
>> 0xfee01004 0x00000000 0x00000022 0x00000000
>> 0xfee02004 0x00000000 0x00000023 0x00000000
>> 0xfee01004 0x00000000 0x00000023 0x00000000
>> 0xfee01004 0x00000000 0x00000021 0x00000000
>> 0xfee02004 0x00000000 0x00000022 0x00000000
>> 0x00000000 0x00000000 0x00000000 0x00000001
>> 0x00000000 0x00000000 0x00000000 0x00000001
>> MSI-X PBA
>> 0 0 0 0 0 0 0
>>
>> Since the number of MSI-X entries is not determined and might be very
>> large, it is sometimes inappropriate to dump via QMP.
>>
>> Therefore, this patch dumps MSI-X information only via HMP, which is
>> similar to the implementation of hmp_info_mem().
> 
> 
> Besides PBA, I think it should be also useful to introduce device specifc
> callbacks for dump the MSI messages used by the device.
> 
> Thanks

Would you please help confirm if you meant MSI messages or MSI-X messages?

About about MSI-X, I assume we are able to derive the message from the MSI-X
table, as in msix_get_message().  Therefore, the user of "info msix <dev>"
should be able to parse the output and convert it to messages.

34 MSIMessage msix_get_message(PCIDevice *dev, unsigned vector)
35 {
36     uint8_t *table_entry = dev->msix_table + vector * PCI_MSIX_ENTRY_SIZE;
37     MSIMessage msg;
38
39     msg.address = pci_get_quad(table_entry + PCI_MSIX_ENTRY_LOWER_ADDR);
40     msg.data = pci_get_long(table_entry + PCI_MSIX_ENTRY_DATA);
41     return msg;
42 }


Perhaps I should remove the inner for-loop for MSI-X table in the patch, and
call pci_get_long() for 4 times, for PCI_MSIX_ENTRY_LOWER_ADDR,
PCI_MSIX_ENTRY_UPPER_ADDR, PCI_MSIX_ENTRY_DATA and PCI_MSIX_ENTRY_VECTOR_CTRL,
respectively.

Thank you very much!

Dongli Zhang

> 
> 
>>
>> Cc: Jason Wang <jasowang@redhat.com>
>> Cc: Joe Jin <joe.jin@oracle.com>
>> Signed-off-by: Dongli Zhang <dongli.zhang@oracle.com>
>> ---
>>   hmp-commands-info.hx   | 13 +++++++++++
>>   hw/pci/msix.c          | 49 ++++++++++++++++++++++++++++++++++++++++++
>>   include/hw/pci/msix.h  |  2 ++
>>   include/monitor/hmp.h  |  1 +
>>   softmmu/qdev-monitor.c | 25 +++++++++++++++++++++
>>   5 files changed, 90 insertions(+)
>>
>> diff --git a/hmp-commands-info.hx b/hmp-commands-info.hx
>> index ab0c7aa5ee..cbd056442b 100644
>> --- a/hmp-commands-info.hx
>> +++ b/hmp-commands-info.hx
>> @@ -221,6 +221,19 @@ SRST
>>       Show PCI information.
>>   ERST
>>   +    {
>> +        .name       = "msix",
>> +        .args_type  = "dev:s",
>> +        .params     = "dev",
>> +        .help       = "dump MSI-X information",
>> +        .cmd        = hmp_info_msix,
>> +    },
>> +
>> +SRST
>> +  ``info msix`` *dev*
>> +    Dump MSI-X information for device *dev*.
>> +ERST
>> +
>>   #if defined(TARGET_I386) || defined(TARGET_SH4) || defined(TARGET_SPARC) || \
>>       defined(TARGET_PPC) || defined(TARGET_XTENSA) || defined(TARGET_M68K)
>>       {
>> diff --git a/hw/pci/msix.c b/hw/pci/msix.c
>> index ae9331cd0b..a93d31da9f 100644
>> --- a/hw/pci/msix.c
>> +++ b/hw/pci/msix.c
>> @@ -22,6 +22,7 @@
>>   #include "sysemu/xen.h"
>>   #include "migration/qemu-file-types.h"
>>   #include "migration/vmstate.h"
>> +#include "monitor/monitor.h"
>>   #include "qemu/range.h"
>>   #include "qapi/error.h"
>>   #include "trace.h"
>> @@ -669,3 +670,51 @@ const VMStateDescription vmstate_msix = {
>>           VMSTATE_END_OF_LIST()
>>       }
>>   };
>> +
>> +static void msix_dump_table(Monitor *mon, PCIDevice *dev)
>> +{
>> +    int vector, i, offset;
>> +    uint32_t val;
>> +
>> +    monitor_printf(mon, "MSI-X Table\n");
>> +
>> +    for (vector = 0; vector < dev->msix_entries_nr; vector++) {
>> +        for (i = 0; i < 4; i++) {
>> +            offset = vector * PCI_MSIX_ENTRY_SIZE + i * 4;
>> +            val = pci_get_long(dev->msix_table + offset);
>> +
>> +            monitor_printf(mon, "0x%08x ", val);
>> +        }
>> +        monitor_printf(mon, "\n");
>> +    }
>> +}
>> +
>> +static void msix_dump_pba(Monitor *mon, PCIDevice *dev)
>> +{
>> +    int vector;
>> +
>> +    monitor_printf(mon, "MSI-X PBA\n");
>> +
>> +    for (vector = 0; vector < dev->msix_entries_nr; vector++) {
>> +        monitor_printf(mon, "%d ", !!msix_is_pending(dev, vector));
>> +
>> +        if (vector % 16 == 15) {
>> +            monitor_printf(mon, "\n");
>> +        }
>> +    }
>> +
>> +    if (vector % 16 != 15) {
>> +        monitor_printf(mon, "\n");
>> +    }
>> +}
>> +
>> +void msix_dump_info(Monitor *mon, PCIDevice *dev, Error **errp)
>> +{
>> +    if (!msix_present(dev)) {
>> +        error_setg(errp, "MSI-X not available");
>> +        return;
>> +    }
>> +
>> +    msix_dump_table(mon, dev);
>> +    msix_dump_pba(mon, dev);
>> +}
>> diff --git a/include/hw/pci/msix.h b/include/hw/pci/msix.h
>> index 4c4a60c739..10a4500295 100644
>> --- a/include/hw/pci/msix.h
>> +++ b/include/hw/pci/msix.h
>> @@ -47,6 +47,8 @@ int msix_set_vector_notifiers(PCIDevice *dev,
>>                                 MSIVectorPollNotifier poll_notifier);
>>   void msix_unset_vector_notifiers(PCIDevice *dev);
>>   +void msix_dump_info(Monitor *mon, PCIDevice *dev, Error **errp);
>> +
>>   extern const VMStateDescription vmstate_msix;
>>     #define VMSTATE_MSIX_TEST(_field, _state, _test) {                   \
>> diff --git a/include/monitor/hmp.h b/include/monitor/hmp.h
>> index 605d57287a..46e0efc213 100644
>> --- a/include/monitor/hmp.h
>> +++ b/include/monitor/hmp.h
>> @@ -36,6 +36,7 @@ void hmp_info_irq(Monitor *mon, const QDict *qdict);
>>   void hmp_info_pic(Monitor *mon, const QDict *qdict);
>>   void hmp_info_rdma(Monitor *mon, const QDict *qdict);
>>   void hmp_info_pci(Monitor *mon, const QDict *qdict);
>> +void hmp_info_msix(Monitor *mon, const QDict *qdict);
>>   void hmp_info_tpm(Monitor *mon, const QDict *qdict);
>>   void hmp_info_iothreads(Monitor *mon, const QDict *qdict);
>>   void hmp_quit(Monitor *mon, const QDict *qdict);
>> diff --git a/softmmu/qdev-monitor.c b/softmmu/qdev-monitor.c
>> index a9955b97a0..2a37d03fb7 100644
>> --- a/softmmu/qdev-monitor.c
>> +++ b/softmmu/qdev-monitor.c
>> @@ -19,6 +19,7 @@
>>     #include "qemu/osdep.h"
>>   #include "hw/sysbus.h"
>> +#include "hw/pci/msix.h"
>>   #include "monitor/hmp.h"
>>   #include "monitor/monitor.h"
>>   #include "monitor/qdev.h"
>> @@ -1006,3 +1007,27 @@ bool qmp_command_available(const QmpCommand *cmd, Error
>> **errp)
>>       }
>>       return true;
>>   }
>> +
>> +void hmp_info_msix(Monitor *mon, const QDict *qdict)
>> +{
>> +    const char *name = qdict_get_str(qdict, "dev");
>> +    DeviceState *dev = find_device_state(name, NULL);
>> +    PCIDevice *pci_dev;
>> +    Error *err = NULL;
>> +
>> +    if (!dev) {
>> +        error_setg(&err, "Device %s not found", name);
>> +        goto exit;
>> +    }
>> +
>> +    if (!object_dynamic_cast(OBJECT(dev), TYPE_PCI_DEVICE)) {
>> +        error_setg(&err, "Not a PCI device");
>> +        goto exit;
>> +    }
>> +
>> +    pci_dev = PCI_DEVICE(dev);
>> +    msix_dump_info(mon, pci_dev, &err);
>> +
>> +exit:
>> +    hmp_handle_error(mon, err);
>> +}
> 

