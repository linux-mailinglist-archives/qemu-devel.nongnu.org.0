Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B39836DDBC9
	for <lists+qemu-devel@lfdr.de>; Tue, 11 Apr 2023 15:12:06 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pmDly-0006TS-Az; Tue, 11 Apr 2023 09:10:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <steven.sistare@oracle.com>)
 id 1pmDlr-0006Sz-SI
 for qemu-devel@nongnu.org; Tue, 11 Apr 2023 09:10:55 -0400
Received: from mx0a-00069f02.pphosted.com ([205.220.165.32])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <steven.sistare@oracle.com>)
 id 1pmDlo-0001nc-8r
 for qemu-devel@nongnu.org; Tue, 11 Apr 2023 09:10:51 -0400
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 33BBOG0c029968; Tue, 11 Apr 2023 13:10:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=message-id : date :
 subject : to : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=corp-2023-03-30;
 bh=JdXWYm4RcpFZrOfaS31ZLk1v6MEGnrQeAHh7iduyamA=;
 b=HvpuwxjViGlgz6DBOxA3gJ/cZ6qCJ9Kge81U221HRRMvHnvbcI1b+J3rHcroR5CfNfOV
 f8gq0xhwao2jtunidF3ba6gxd4EIp4AlFIZTmSPoz5Q86TgHiemWKtUlrcVAmKXjY+xE
 FCczJRQbesrpRcNAtdnnV3f9OU9QWFrrhOmcP9545XkM+HiOARSDYxgFdzYF55266gQL
 F3AOrD/znDZGjMttEcpGbBzFCJAMgBXUgpjGUcYSY36RxYS1RG0qmDgK/hX3VJz/DWBb
 PnUNW6ktTs8k0ZnJxTal2WqU1NOac8EqC3fwbfR9A1nQA0BqwAjfWYuWTQ3Q0ykYFMJp eA== 
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com
 (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3pu0hc5c6a-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 11 Apr 2023 13:10:44 +0000
Received: from pps.filterd
 (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
 by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.17.1.19/8.17.1.19)
 with ESMTP id 33BD4SrV008150; Tue, 11 Apr 2023 13:10:43 GMT
Received: from nam02-bn1-obe.outbound.protection.outlook.com
 (mail-bn1nam02lp2040.outbound.protection.outlook.com [104.47.51.40])
 by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id
 3puwc420vh-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 11 Apr 2023 13:10:43 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AQjV6ZSnOhigp5NjM8l4degrdBLuPMxvm3ZTLHvM+jA6EB8yCz8o7qAHetbEj9UI5yruULHh02jjwqksRg1hT7GSmi0frDtPGGbug5zqILUbYg/yeb7ANVVSrqeemkGLsbO8c2og/1uI3f1KcUuq42wU9x8ry9bJFLoI9rOMMMgOJylQr4YpHYcBkplj6sWIYCpgyfUqUeR2RgO7JFkfCWFTk0n21E5LaHajostx16V9R4WZ4zNsMccruS7z0v6MIHzVu1XwmJEFR43goXYbpBaLuJ5u/7bjhtAKG01hBQiUzkNnYRTXQNuf0P5R2JUdeQ84QZTqYlhsIcrPfK09Tw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JdXWYm4RcpFZrOfaS31ZLk1v6MEGnrQeAHh7iduyamA=;
 b=i4qCEEKpKkMBzlVjU4KE5djArPcrIrga4J5GJcipPmlJgWT1ldNIE+Dmu3YGGd4y786QxpJrXy7XiXtQ+ctazRl3V5JhoEb5lTKbIz9WGZjLovZMAdBIf1YWXiCEkKijQUeMTjUVm6sPgKim6CGfuFqae/dHsxHObHjAfNEC0frRkjRC1MxG8EhwnG4tGDDyKAlE8QwFwOFVJwIk1sf7Vl6vgKOYJn4kXbln7g7FvqGvsoUmC6mPXw8mEKyJpWRXqR6giFu6y5L2vMnyX1xaraYkCobQ73gEe380+anH6PpIp9P0CPpNmdkDIyiN62t0eu7iY3NssNvlNkrvdlYw0A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JdXWYm4RcpFZrOfaS31ZLk1v6MEGnrQeAHh7iduyamA=;
 b=Csrt0B6qed6QX1Ng4XJ8xqEike7MRp+itGmP3JupXy7+ksvwct0xK6tLm4m+2wHK+TqCRnszVfHDqzUBiWB2ha6oQS+IemTKZmrv4khGbTPQ1kxMcSse0I96aTS6Z5Ck3cgdc+FN+At12rUZiKVt88HKJQp7pA42P3WQw6Ep3+A=
Received: from SA2PR10MB4684.namprd10.prod.outlook.com (2603:10b6:806:119::14)
 by SA0PR10MB6425.namprd10.prod.outlook.com (2603:10b6:806:2c0::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6277.38; Tue, 11 Apr
 2023 13:10:42 +0000
Received: from SA2PR10MB4684.namprd10.prod.outlook.com
 ([fe80::7361:8416:8d4c:7733]) by SA2PR10MB4684.namprd10.prod.outlook.com
 ([fe80::7361:8416:8d4c:7733%8]) with mapi id 15.20.6277.038; Tue, 11 Apr 2023
 13:10:41 +0000
Message-ID: <91cc68cc-e1a6-28f8-fcbb-9a6ddf132fb8@oracle.com>
Date: Tue, 11 Apr 2023 09:10:36 -0400
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
Subject: Re: [PATCH] tap: fix net_init_tap() return code
Content-Language: en-US
To: Jason Wang <jasowang@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
References: <1680624004-154390-1-git-send-email-steven.sistare@oracle.com>
 <9da71dfa-52b7-5b65-3160-6f236440add4@linaro.org>
 <4be85e27-0990-7ba9-60a1-45d53d63004e@oracle.com>
 <268c8128-d1cf-3103-b990-e92a2e69465f@redhat.com>
From: Steven Sistare <steven.sistare@oracle.com>
Organization: Oracle Corporation
In-Reply-To: <268c8128-d1cf-3103-b990-e92a2e69465f@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P123CA0206.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:1a5::13) To SA2PR10MB4684.namprd10.prod.outlook.com
 (2603:10b6:806:119::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA2PR10MB4684:EE_|SA0PR10MB6425:EE_
X-MS-Office365-Filtering-Correlation-Id: 8ea411de-601b-4d6e-a599-08db3a8e26e2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ZscXkDjsnL7rLnf7Sc4WkTa1tm8PHuJKQm4/d0xzubsVQHIFo23ou/mdIIRKTq3OebI9OnjWuNmy1uqQaIsCAcCMvzwAU5587MxyDW90l0B2ZMXlzVeoTYa82qaYPqmJ8NVZ3Jfd6ENHtOx3qILS0bQdxK2FYpQNvcSfQMQE1HwtTmgO2wIaP4/R/jsRaf+0wZpPc+YEeedZV52E6Og1vVR4DVN0DdLqoXyiJsQ5WtJbgILRH0BLlArS5vbVBcRYctnkClE+Yupwa9kLMZCa9y0oipEFuiSzybWQ1CkVLdxAIIo1XxGvpldiIuJLXGSsT5BULBNRxTZ++95fpQlGDwiWB7P5doJwGg54tfzLOn1+YaSIF7dvyyuY2Pt6ulus/v+RMuRT4nbF7gWD7fzNACRA/wAIR9m6O4oNy14Uf3wXmvEwPPEoclAmbUo4s/ufqlTIL+1mvXpjb5Z7aUcpP5iBlT+WGO8m9oKh43JZVM7rQ7L7HNi9967NSOcvKQQUeNBpePpq7SK7Z6nuXaeTel1CENPdPCxwf4vqtKxIbi+9AqZZwna5LWEoxkSEqAHroZTsf2qogePa2v9bXDTbRQVFVfnXe8ljDa883U8xXvr8qGok36fVGMBbmPxkamVb/pKJFPqpRwvhe9eLmZxj2A==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA2PR10MB4684.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(136003)(39860400002)(346002)(376002)(396003)(366004)(451199021)(31686004)(478600001)(36916002)(86362001)(83380400001)(31696002)(36756003)(2616005)(38100700002)(6486002)(2906002)(53546011)(6512007)(316002)(110136005)(26005)(6506007)(186003)(44832011)(66476007)(41300700001)(8676002)(6666004)(66556008)(8936002)(5660300002)(66946007)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?M2JDREI4bkZpMHQzc29pUWtjUUY5RDlmNXpFOHhhUEVnZTFoYUVBbHJDbGZ2?=
 =?utf-8?B?NmUzYlBpZUlZZ2pLMEhGZTZBbFA4ZThyeUlGOG9aU0lEMzFrSVJRR0Q0d1R1?=
 =?utf-8?B?eVVJbW53T3dLVEE5MWFZUEJLSFBBUjMzUkQ0eDlVenVrcU40V2xqM2N1RURD?=
 =?utf-8?B?TVdLbDRzcGxRMjFYMWVETFlBNHhrZm1FamdqNUIxOGxla2xiaEdDTTVSS2hh?=
 =?utf-8?B?aFBtNWlwN2JPOVdKRWE5WUxaZk9hSm5hYnk2TnFFbkkyek50WEVoZWNXRjIw?=
 =?utf-8?B?bmlqNHpUVmZEQlVSQ2kzbUFYeG5VWW1Vd0xOQjV4dDZMS1pwa25TdGJ6enQ0?=
 =?utf-8?B?Rkl0dmVXVDJZUHJ3Y1JUaGVsZHFDend1UGxNZEtlRldEVTEvTmFnQUlzV1R0?=
 =?utf-8?B?Vjk2TEhweEl3RUV1bTVEMkJpT3NhUmEzQ1RmNEk0SjdpT3ZrVWdRVTdWdlo1?=
 =?utf-8?B?VVcxWkgwZGVUaitUYnlZS2xSczVhTDIyM2xvKy80NzJVUTYrWU1QbnBxZ0dY?=
 =?utf-8?B?OXhXOXV0ZHMyRmIzVy84enA5aDFNTktOTG9wVzg3L3NxczNEUFE3cE1BVUtm?=
 =?utf-8?B?U2F0OTdYT0orbWlKT2tYNU1FNnJOcTNMWFM1UHBZYW10Y0xKNFdyUjNtMFQv?=
 =?utf-8?B?alE3alFVV2pYMXlON2FWUS8vMDYzdmxDWEFydldRV1JEcFAxcE5KQ253VGM0?=
 =?utf-8?B?QUQ3ZUhPU2FrdHFnMHB0VnRVTXV2QmFGNlphTVJ3UFY5S2V3SFZQZzBiVnhJ?=
 =?utf-8?B?VWU4VnhabE11NXY0OVpVODlrK0oyQTVYcjNNazFhcEpuK2gwWjhmZ2M4MUhW?=
 =?utf-8?B?ZiszUXNoMExyeWdhcWpZSzhxZzBoK0hxcmQ4dzZNWXF4NWl1R3VKTDNrR1hL?=
 =?utf-8?B?eUFoSTRIR2QrVFN2b3VaVVQ4Y1NVWHZSYmlzL1JSdG92UzRzNlByRnRpcVdL?=
 =?utf-8?B?U1pXQzFNeXJNZE4vREVQWEpKeHlzQUlJUE1zWFFzeTcwdllOMHZXbFFtZ0dF?=
 =?utf-8?B?Nkp3OGJNMmJSWGgzbWdaUm1qT0JHOVVDQU51UDhSR2Y5aThhVlVYdk9PaXBK?=
 =?utf-8?B?bFZBck9oOG9laHd6VkVrL0RoU0N3QUxjUVZNelNlclFIelZxeHc2MWh2L2NT?=
 =?utf-8?B?T1pkVjQ4a29lYXVtOVEvS1ErK1p2aXJsUWgyV3AwM0FzUXlHM0ZsSGpBT2pL?=
 =?utf-8?B?M1FOK1pGUmxVOVd2a3cydWkxRXBUUTFwVVRtdExwNTN3U0JMRjFLSHFCVm1l?=
 =?utf-8?B?dlVadHdvMlpjdGpYVVFIcERNd0RFVU5ydzQvV29vNkRCMkpCbjlHVjhqNUh1?=
 =?utf-8?B?TkY2MXBQSFQrd0llbEttcnJMQ0xQSW02S1RFNXg1Nzd0WW1sV01PdnVWUjBX?=
 =?utf-8?B?RkpxWlJTYmxnaCsxWndBcXZRMmZvTVNrRldiZHk5WUxJdTNsQldSRGxvcVp5?=
 =?utf-8?B?QkdyOWhKMWw3TldsZmdMeDFiRzYwdmdKR1IwRGozT1J5REIzTkc2aXNnMWZ2?=
 =?utf-8?B?WkFkdUlaOFFOTWsxYUZtaVhNV1dpWFNDUkdjNVIxOEFnS1ZkdEZlczh3M1BX?=
 =?utf-8?B?NU9RNVh4NlZ4UGs0VVFKWm9yZnN1Mm02RWZWQUc2bzRpR3dlMExmTmYxeHRZ?=
 =?utf-8?B?b2RZdk5QOFZIbVBrcHJaVGg3cFdneHdTUUNjLzhqcVVxd3c5SjhqSVFiMDQr?=
 =?utf-8?B?cVVsZXI3V2VHSDVreCs5OEhnQ0FiWWpDZ1NvZjBuMGZrQXdybmpYVjVKaG1V?=
 =?utf-8?B?VE5NVTFBTHF1QXZSSWtjMWdVM09DQ0FaQmwyM1IybWllaEFPUFhEV2gzY2pq?=
 =?utf-8?B?WnlocS9Md0dQTHZHYndFZExlT29ENk50ZGN5UDErTFpFY3JJQW1DWnZJQjRr?=
 =?utf-8?B?OHdSWVVDOW15K3dsbmVjVkVGY2ZRTjk3Y3VYUHhTb2tRT2RXUzBMZ2VCMHIx?=
 =?utf-8?B?MU0wU1lvMjV1c043UWg1SjAwY0RZNHMvLzZhRHFDRDZvOHhvL3YwdXoyR2Rh?=
 =?utf-8?B?NFc1UTA4aXFXeDIwV21DSkRKRTFQUmNlVW1jVVM4NlMvRFpqbWV6RklMN0tR?=
 =?utf-8?B?Zk5Wa3h1ZFkyVTcwZjlRWGxDUEZ4MU9wWlp6RFJzUytrOGRVRUZIOUNQSzhv?=
 =?utf-8?B?dEtJWHV0Z2JFL0Q2WmtuWXZkcmxwcC8wTHZSYVEzQzNWd1F6TWhUQVdrRHAz?=
 =?utf-8?B?VkE9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: D+KNNc0N1EAJDIbTX4S9EwNRplU9hq0Y8H2GLqWfTNKV0Kv8eMe6jtpSsMUWDkeFK0d602+Aw/jdKsJqLDikUORNCTBtcYioDO96qHdpBQnAlxQvBByGDIITQDVwiarL17E76XhbhBQZAWrHqtIcUIRdkgbvsHfa5lj2Rm6JV0TW4Tn5+fI/GBhS9RRK/YGjt9gIet2lcBGtad1i/kg8eFkvs6PgLjbs+w/+Sg+DQCcvEO0TloeOIWPl3TqCaygaFS8XMJYCHJ0dMk30UVg92GBFP35oKC3QXRj7NGUxdGOldK3TgogxmFkQOAojfY6Fcx4gwJmhko3ZWDKPzwajkIk8Qq4XGCtuzdfkhqAsGENDdXcE2Kd7M4DV+/65Kp8xMZSD/BeCUc5RPHWtY+o46Qlav26I2isvBgT9Bg+tuHkuzSzK1LlhtDSeTBmiefshbtq1fh3o4QsMK3MXQJEu0W3nisScTXDJ+ZlWNvrbXde8ZUhdtx9rRg1GSCoDmMEXBFv5GVqZyDlfZMYJheg+AoMlizXd9GwRmRbaljI0ubFDD0Bm5g32AIJN7BAFspqnyc8Byz+AncEmpw7aMEErY2mN1g5RgudXdzlimlsCdTPlZii0pA6XH++FxJDP50IpRZyHf7drJrQbes6ff1byxTfrXXwiqqThkp4vHulofoeNlAjOhKu153JhvnKiE6TtSvy6XYsk5HruLVy+ozHL7hkiE4bpc74LJVjfgfKURHoJObebIrsaZU1YYjo464P1ilOgsaCl7d7n5ZduMJfi0FfmFQ+9tXjPEA39EZWMB/gHnXz1Wfhreko8Dc8Ez+hi
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8ea411de-601b-4d6e-a599-08db3a8e26e2
X-MS-Exchange-CrossTenant-AuthSource: SA2PR10MB4684.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Apr 2023 13:10:41.7765 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: sunfawTa0gJQ8iU1FnMwpoiz/4V2YDHxyEYZW1NOLWVUoTsSLDYHE/pxseunJskVFrQacyRL1wwNP3OaC7X7t4Bgg90RqFS4FLJTMiC6YoE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR10MB6425
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-04-11_08,2023-04-11_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0
 malwarescore=0 adultscore=0
 suspectscore=0 phishscore=0 mlxlogscore=999 mlxscore=0 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2303200000
 definitions=main-2304110122
X-Proofpoint-GUID: GberF1XbMCAVevc2_0DoKr7dt8BWPC9B
X-Proofpoint-ORIG-GUID: GberF1XbMCAVevc2_0DoKr7dt8BWPC9B
Received-SPF: pass client-ip=205.220.165.32;
 envelope-from=steven.sistare@oracle.com; helo=mx0a-00069f02.pphosted.com
X-Spam_score_int: -49
X-Spam_score: -5.0
X-Spam_bar: -----
X-Spam_report: (-5.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.17,
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

On 4/11/2023 2:32 AM, Jason Wang wrote:
> 在 2023/4/5 23:38, Steven Sistare 写道:
>> On 4/4/2023 6:00 PM, Philippe Mathieu-Daudé wrote:
>>> On 4/4/23 18:00, Steve Sistare wrote:
>>>> When net_init_tap() succeeds for a multi-queue device, it returns a
>>>> non-zero ret=1 code to its caller, because of this code where ret becomes
>>> Indeed g_unix_set_fd_nonblocking() returns TRUE on success.
>>>
>>> Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
>>>
>>>> 1 when g_unix_set_fd_nonblocking succeeds.  Luckily, the only current call
>>>> site checks for negative, rather than non-zero.
>>>>
>>>>       ret = g_unix_set_fd_nonblocking(fd, true, NULL);
>>>>       if (!ret) {
>>>>           ...
>>>>           goto free_fail;
>>>>
>>>> Also, if g_unix_set_fd_nonblocking fails (though unlikely), ret=0 is returned,
>>>> and the caller will use a broken interface.
>>> We should return -1 from free_fail, not trying to propagate 'ret':
>> Thanks for the review.  I will add your "return -1" changes if Jason agrees.
> 
> Note that the "free_fail" label is kind of ambiguous. It is used even if we succeed if I was not wrong.

Yes, good catch.  We must return 0 from free_fail on success.
I could delete all uses of ret, test errp in free_fail, and return either -1 or 0.
Or, you could accept my initial small patch.

What do you prefer?

- Steve

>>> -- >8 --
>>> diff --git a/net/tap.c b/net/tap.c
>>> index 1bf085d422..e59238bda0 100644
>>> --- a/net/tap.c
>>> +++ b/net/tap.c
>>> @@ -821,3 +821,2 @@ int net_init_tap(const Netdev *netdev, const char *name,
>>>       char ifname[128];
>>> -    int ret = 0;
>>>
>>> @@ -896,3 +895,2 @@ int net_init_tap(const Netdev *netdev, const char *name,
>>>                              "the number of vhostfds passed");
>>> -                ret = -1;
>>>                   goto free_fail;
>>> @@ -904,3 +902,2 @@ int net_init_tap(const Netdev *netdev, const char *name,
>>>               if (fd == -1) {
>>> -                ret = -1;
>>>                   goto free_fail;
>>> @@ -908,4 +905,3 @@ int net_init_tap(const Netdev *netdev, const char *name,
>>>
>>> -            ret = g_unix_set_fd_nonblocking(fd, true, NULL);
>>> -            if (!ret) {
>>> +            if (!g_unix_set_fd_nonblocking(fd, true, NULL)) {
>>>                   error_setg_errno(errp, errno, "%s: Can't use file descriptor %d",
>>> @@ -918,3 +914,2 @@ int net_init_tap(const Netdev *netdev, const char *name,
>>>                   if (vnet_hdr < 0) {
>>> -                    ret = -1;
>>>                       goto free_fail;
>>> @@ -924,3 +919,2 @@ int net_init_tap(const Netdev *netdev, const char *name,
>>>                              "vnet_hdr not consistent across given tap fds");
>>> -                ret = -1;
>>>                   goto free_fail;
>>> @@ -934,3 +928,2 @@ int net_init_tap(const Netdev *netdev, const char *name,
>>>                   error_propagate(errp, err);
>>> -                ret = -1;
>>>                   goto free_fail;
>>> @@ -948,3 +941,3 @@ free_fail:
>>>           g_free(vhost_fds);
>>> -        return ret;
>>> +        return -1;
>>>       } else if (tap->helper) {
>>> ---
>>>
>>>> Fixes: a8208626ba89.. ("net: replace qemu_set_nonblock()")
>>>> Signed-off-by: Steve Sistare <steven.sistare@oracle.com>
>>>> ---
>>>>    net/tap.c | 4 ++--
>>>>    1 file changed, 2 insertions(+), 2 deletions(-)
> 

