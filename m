Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5444A3E0A43
	for <lists+qemu-devel@lfdr.de>; Thu,  5 Aug 2021 00:16:12 +0200 (CEST)
Received: from localhost ([::1]:60488 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mBPBK-0002bk-HA
	for lists+qemu-devel@lfdr.de; Wed, 04 Aug 2021 18:16:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42340)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.devolder@oracle.com>)
 id 1mBP9A-0001Qc-Kk
 for qemu-devel@nongnu.org; Wed, 04 Aug 2021 18:13:56 -0400
Received: from mx0a-00069f02.pphosted.com ([205.220.165.32]:1264)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.devolder@oracle.com>)
 id 1mBP96-0006uR-RL
 for qemu-devel@nongnu.org; Wed, 04 Aug 2021 18:13:56 -0400
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 174MClxu003855; Wed, 4 Aug 2021 22:13:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=subject : to : cc :
 references : from : message-id : date : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=corp-2021-07-09;
 bh=1JCadcWq//pOZPVG/Q3v1nRoClknpSzA5DioKsJ/q7M=;
 b=xJ4L9zbz8b7eL/mWENlhvztKvvF6htFBXfZeq4UDxWc7nsv2D4oOWRJ/0DKxNTNCeTRi
 jGsJKBAhGMZElJ1fkgg5CbKU5Ujp0h/VA4vdm4B+PqgrEhS7wVI869ryz24DV80QUbVt
 m89vDVw8iQkFdCLQHOb++bhPcofnv74dHZ+ANepW9P4BdmuV09VUio6Gu2MVpNyegwdN
 A7moZZ8Q4jFx0ujGWaE+aU7KDNsJxjcwWiBjY94l7Gszkd2szKSucVtY3Hybg0qh6Ezs
 nshgnwr4NQ1IHaiFNfjPsXs9tBWwvHHctNwY7OIP0qqk/pJHIwNQkWxc5qrjnatB537W EA== 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=subject : to : cc :
 references : from : message-id : date : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=corp-2020-01-29;
 bh=1JCadcWq//pOZPVG/Q3v1nRoClknpSzA5DioKsJ/q7M=;
 b=jftpwS6wlQRkqbpW3yaoC2paWHqWHoqXobijwg8Xu/dNRY7YuAWJRSwKsGPcJr/a0cY6
 XcVANK2a22j205sHBnWv8UK9IhPst1Hb9TKmv7XiqdJ7tUqEpHjnuLNehETYmdD6j97Z
 ZhFKggIDuBn/OcXK2FxF8dlMBBPnQpiis51tYWoMVOajm4jaH0+WQc6lLc2sujD/hP7W
 2kS234yeCGWvkL6Zcv2xaCZgdTN0+QeDPlj9m7W25mtczIrvBj/jT/Ja9f6fJtUSJYCz
 YNip+70egeqbcfYlrPnfX+fB88ezBEH+cyBD8n5+YDnAorPLUPjtTzuH3BfzPrc9wdoC ig== 
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
 by mx0b-00069f02.pphosted.com with ESMTP id 3a7hxpjj3y-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 04 Aug 2021 22:13:47 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
 by aserp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 174MA5LL054098;
 Wed, 4 Aug 2021 22:13:46 GMT
Received: from nam10-bn7-obe.outbound.protection.outlook.com
 (mail-bn7nam10lp2106.outbound.protection.outlook.com [104.47.70.106])
 by aserp3020.oracle.com with ESMTP id 3a7r48jt7a-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 04 Aug 2021 22:13:46 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NxJ97r4SoT7soJjm11OHFqQgUov5ylFROUxV9/S39/04VeDD9gyVQgFWRaZgGz01jWEwSQR2OSjhVrHZBANRR+TtF0JHJYAVQur+vbvYjry7RqjfU4lULIIx91egsTn9aVUDPOsKdeYHlpzsm2GWvhSry40GKp8oVLjcPiVoSrtf2VU5dCg8RkrAQV+BxExsGYPq/XI0ATFQOTfhlk+9D7bwU/+KWIxUcwR2fhDnbe1UkYA8IFcGEeMM4Bj5s00c9XIMeLqctgfnB+/CFAQOfOY5JT0bgw8XXW07NA0yCJ6U+UW+NdY6dls+aOYbY0Dln31jJnwgt004suSssuZL4Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1JCadcWq//pOZPVG/Q3v1nRoClknpSzA5DioKsJ/q7M=;
 b=KYMfm63HO12SMI5XomZhDPb+KO0T3cqqCIKfKAhxwBqsNYQoK3kToFTxMtTauZqKXBY/W1LuK7f+ly0uNKnGIMoiE98X63bFAyY+5kRNa46FNKS2EuC29b2cB8Sl4C5Y6TDYqhuevfvAVXUbPDkXii1/gK6D3ZFfax+caeomf3Aovqfkm85MqKMX35hjSeKFD8TMlJDzV3hMUqqj5w7LLKVXImbXqJrJbOk0zuIT/rD2f7x1pcOsGhGf3McgbjMPoWVChVrGuPB4A0m8/nWVNhH9zFJB5RrxAAIoK8UEYLfsKxWZHGDMRLUDXuveF1cfzg13Jyu83wkr7eZEFE55kQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1JCadcWq//pOZPVG/Q3v1nRoClknpSzA5DioKsJ/q7M=;
 b=z30O55gyXI8NTIlhVK+lLtsgXX88I32AEjNlCfP0yUjPJQTVvrmFIFUEg7alIRQpu/QATBZwRGfsNo4U3acHSiVHBa9lJ+TXd3d5SYi/0xyb+IB9YTVSw00lEhA3CvPJEhD88z8QI8U4Ak++0ycr9Vw2iBunS5fe2vssT6SA+hM=
Authentication-Results: oracle.com; dkim=none (message not signed)
 header.d=none;oracle.com; dmarc=none action=none header.from=oracle.com;
Received: from CO1PR10MB4531.namprd10.prod.outlook.com (2603:10b6:303:6c::22)
 by CO1PR10MB4612.namprd10.prod.outlook.com (2603:10b6:303:9b::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4394.15; Wed, 4 Aug
 2021 22:13:44 +0000
Received: from CO1PR10MB4531.namprd10.prod.outlook.com
 ([fe80::d23:ea44:5df6:2bbb]) by CO1PR10MB4531.namprd10.prod.outlook.com
 ([fe80::d23:ea44:5df6:2bbb%2]) with mapi id 15.20.4394.017; Wed, 4 Aug 2021
 22:13:44 +0000
Subject: Re: [PATCH v5 05/10] ACPI ERST: support for ACPI ERST feature
To: Igor Mammedov <imammedo@redhat.com>
References: <1625080041-29010-1-git-send-email-eric.devolder@oracle.com>
 <1625080041-29010-6-git-send-email-eric.devolder@oracle.com>
 <20210720141704.381734cc@redhat.com>
 <0a09250e-4347-0ad6-d95c-0bfd2094b98b@oracle.com>
 <20210726124213.58b0e557@redhat.com>
 <6d450e75-3355-1552-7b27-0966f3a18b9a@oracle.com>
 <20210727145247.0174f401@redhat.com>
From: Eric DeVolder <eric.devolder@oracle.com>
Message-ID: <e4b777fe-4146-95aa-da5e-5805e863e86e@oracle.com>
Date: Wed, 4 Aug 2021 17:13:40 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
In-Reply-To: <20210727145247.0174f401@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BYAPR05CA0053.namprd05.prod.outlook.com
 (2603:10b6:a03:74::30) To CO1PR10MB4531.namprd10.prod.outlook.com
 (2603:10b6:303:6c::22)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2606:b400:414:8061:221:28ff:fea5:27c8]
 (2606:b400:8024:1010::112a) by BYAPR05CA0053.namprd05.prod.outlook.com
 (2603:10b6:a03:74::30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4394.10 via Frontend
 Transport; Wed, 4 Aug 2021 22:13:43 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 2c68d068-e359-436d-536a-08d957951fab
X-MS-TrafficTypeDiagnostic: CO1PR10MB4612:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <CO1PR10MB46126F26E9E7C81646EBF0A097F19@CO1PR10MB4612.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7219;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 9YED0vn7jK/nbsSLhcobmCepCqHIT6BZtbRBaQUY2DtcijcIBYMW3rqDRFp9gFiKfaWePblG/BPMmB+B0OZGyP3m7PA35CSXL7xw/4sweKVVQn1NlKgdd1YUfIJKwwNngyrNhsdWwcAMGdPHR1kzfRWBya0u2215CpGpsZMXtFNvxWJ6dT4LENkH49W9nLbdDGyq6RP4EqaOvDYzO/xTlHnV/SD3uEML7gBOye984vDnW9IpE1BfzI5Se248E3BmCmj+YjAwQMQVHSJZ3moWXo7fNAaQND+TB8Q9ScvkPCLrpUeqFoLZMSlbHtR8zW57yJ1sikrVUu6g/Soi0k8E8lsnL3i7Gm9B08faKs5YvjtmVb0adPrbagcl9bFGyxX33TYrMex4gkQFut9VEDQI7+HOTgeLLm07y7vAmiFUBquUD9RB1IV754ZVIIXEK8MqwNRD49jgsdIWM4ALrClmNVIU3Qm3qEJkvKgCet2rZi5TuYfDRCU6Jrh9qvmHxEa1t4K5FeuTNgPxzhUVkT1z1488pr4JHTO/fRxkiM0c5BWj6TXNivIrFkb4Ty26Ma2vu1cF5P2tktSmCjTRzkv7GsBfO3Wh3TeEAJePwb9Pje/o0xkxzQIqXwAIWr7Nh5FRoaj/zcQA/IsiEiLEhMyWl6SXcUoJNZg7PdcDNHyidTYBzGDKITX+aV8imJ3rbc9mxQXKyXlSPmUOVqQU0S5K+XE6QtgfpmzyjFseo2VAIJE=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO1PR10MB4531.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(39860400002)(366004)(346002)(396003)(136003)(376002)(36756003)(4326008)(6916009)(31686004)(2906002)(5660300002)(316002)(107886003)(186003)(53546011)(83380400001)(2616005)(30864003)(66476007)(66556008)(86362001)(38100700002)(8676002)(478600001)(6486002)(66946007)(8936002)(31696002)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WG1EbGFvSk1VRlRrSmNDTlZqVUVob3BYWENyZE9EbVBVRk43NytBa1BiSi8v?=
 =?utf-8?B?R1d4Y2w4ajBLOFlzWTlpME9CSDhhQzRLa0ZRZlNDSWVLaUFMUkVrQnVRTXVL?=
 =?utf-8?B?YkN3eVdJQWR5RlJYa25hYmlEMG5idTUySkVzSXp1dnNkM1FGb3ExSHg4T21k?=
 =?utf-8?B?ZW16K3QvUDh5NWUrMkpVd2o1bE90NUxsanZGdVkwaExuaC81QmsrQmxOQjJs?=
 =?utf-8?B?Uld2eTd3MlQ4UERVNGtQa2JqM2tlNXYyVlFKLzFpN2IvWUNSV21KbDhDM3RX?=
 =?utf-8?B?NVB1TFhvc0tCTXZWemZRY1Bva0tlektmVSt6aDZ1dVJHZDlhRThLSkFUSCtn?=
 =?utf-8?B?VkJKUlVPQ1h5RjVURVkxalpvaDVVVFR0Ym5kVkY5aDRsWURPd0RTaVlNUGZE?=
 =?utf-8?B?eGlsZzBQQ3ZXWDRkT00wZWlPTjlWWURlY2pvTjVKbDlXOVV3UVBYUkVNOGdr?=
 =?utf-8?B?U0M4UGhnUXUrelh3YWVLQ1o3Y0U2VUViTUFJNUIxckpQTUtpWEpzRTRFdDIr?=
 =?utf-8?B?N2NyRHNyYVZsNzlqeGRDUFgyd2NzWk5VWGEySW1pNHhFTExnbDQxdWtiQTQ1?=
 =?utf-8?B?MWs0UzJpV1RLR1R0WFU5Vm1BdTdpQjRWNkdEOCtIazJHL0RZd2E5dUtFa0dx?=
 =?utf-8?B?Y2ZXZjU2MkFYeFJmZlBQdW9VVStGdmdEUHpmZGZ3cXpWaVlYTXkzc1BGTTdn?=
 =?utf-8?B?bTBycWdWU2lEVlZibEtDTFpKRTRwSWRmcUxIVVpxbWZSRzhuTlNjaURwK1Nl?=
 =?utf-8?B?NzgzcDQzZUxJOVAvNFJYb1ZlTUFzZDk3TzM3dC84QXdGenpEemlXRjdrUmVN?=
 =?utf-8?B?MXozNkxXTjlielMrU2I0L0VzNUI5cDh2YWZ1enZaWXU4a1ZqbFdyMVkrMEly?=
 =?utf-8?B?VzU2Tkw1dnJ3bnFiVlJ2c0tlZEJwZWlzYVJCSlhaWlErWjl4d2ZCKzBON3pO?=
 =?utf-8?B?bjA4Znk2bVJTQ1B5aUoyRkQ2TWtGbjNHcjNKVUVPcEw1Q2Z6RGxpei8vL0xH?=
 =?utf-8?B?K1pmQ05aUm0vaENLMWhqYkQzam4ydzUvRndsQmt5eTBlNEMvdjdGbjBUZG9R?=
 =?utf-8?B?VTFVdWpIL29id2Z6dzBtSEl4d2JwSWZYOUdrZ0poNUc4emg2MjlNZlh3czJr?=
 =?utf-8?B?OU1OMXJnR1ZnVVRNbmFUQjh4cEFxZzNuL2krRE1QS1lBRmJ2Nks3ZW1KVXJV?=
 =?utf-8?B?a1dneUZ5YXJSbWJBVW9XdDZHK2lqZWFPSkNPMVFYYlV5RHhsM3h2cU1sbjZl?=
 =?utf-8?B?NWdKaUl3OUt5c3ZHeEFhZ0F0bi8yMm9tVjBUengyUEl5TmpyRnBKeUx6WTE0?=
 =?utf-8?B?a25JVnBsa1NxSU80cFp3TzEyL0dXMm1nK2ZpU0tTV05NVUNyY3pud1J4bkta?=
 =?utf-8?B?VFJQUmJzVnBteUtGaG9uN3VBUEUrMkNjVEpCd0JUMDlnWi9ONzZtUzlEU1lv?=
 =?utf-8?B?N0RIMkV3ZDA5dnlOWUMzYVpiVVdRaGtjY01NM2JURWhjcnJqNWY0Tk92QlNE?=
 =?utf-8?B?RmRHb3A3bnVFQThhbUhnOWJKSTZmU0w0Y0JMbEpKdkdQK1cwd1BWNk5XMXpQ?=
 =?utf-8?B?elpBcU0zT1ZVb1FTM01rYzQvZ2hEbXJMVHhBYS83MnRnZzNFdUdHaTRWMFBl?=
 =?utf-8?B?NmExU3B6VUxkUlo3ZzdQcHBsTWVVOFVqMlZBSk5USlNDbC9MMFprMXVMM0Vp?=
 =?utf-8?B?NFNOWGJCc0JtUnlCM0FURUM3ZzNmdFNKRmtPbkRGZjZNcXk0WlZRTUV1Z0xX?=
 =?utf-8?B?bldUMWYyQ081aXFHdGRWZDA2SnJCTW5sek5yRCtIRUY5eEoxNnd5ajNYNmtC?=
 =?utf-8?B?Uyt1eGl4cDVUdHhkdmhmdz09?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2c68d068-e359-436d-536a-08d957951fab
X-MS-Exchange-CrossTenant-AuthSource: CO1PR10MB4531.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Aug 2021 22:13:44.5468 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cERPSI1L14BayojwvyIZI5vPIJeAg/BRSmy4jcsLJBS2hUQYceLiOakDy0UpOXmQZrTA5KHDMWeG2Y7mmJxPkdMcldBK8VyJxIuwMKHbB2c=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR10MB4612
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=10066
 signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0
 malwarescore=0 adultscore=0
 suspectscore=0 mlxlogscore=999 phishscore=0 spamscore=0 mlxscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2107140000
 definitions=main-2108040137
X-Proofpoint-GUID: 6YmT5c661ZzhbuaYHHXzUYtNc6TJ_IBk
X-Proofpoint-ORIG-GUID: 6YmT5c661ZzhbuaYHHXzUYtNc6TJ_IBk
Received-SPF: pass client-ip=205.220.165.32;
 envelope-from=eric.devolder@oracle.com; helo=mx0a-00069f02.pphosted.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, NICE_REPLY_A=-0.132, RCVD_IN_DNSWL_LOW=-0.7,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: ehabkost@redhat.com, mst@redhat.com, konrad.wilk@oracle.com,
 qemu-devel@nongnu.org, pbonzini@redhat.com, boris.ostrovsky@oracle.com,
 rth@twiddle.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On 7/27/21 7:52 AM, Igor Mammedov wrote:
> On Mon, 26 Jul 2021 15:01:05 -0500
> Eric DeVolder <eric.devolder@oracle.com> wrote:
> 
>> On 7/26/21 5:42 AM, Igor Mammedov wrote:
>>> On Wed, 21 Jul 2021 11:07:40 -0500
>>> Eric DeVolder <eric.devolder@oracle.com> wrote:
>>>    
>>>> On 7/20/21 7:17 AM, Igor Mammedov wrote:
>>>>> On Wed, 30 Jun 2021 15:07:16 -0400
>>>>> Eric DeVolder <eric.devolder@oracle.com> wrote:
>>>>>       
> [..]
>>>>>> +
>>>>>> +static uint64_t erst_rd_reg64(hwaddr addr,
>>>>>> +    uint64_t reg, unsigned size)
>>>>>> +{
>>>>>> +    uint64_t rdval;
>>>>>> +    uint64_t mask;
>>>>>> +    unsigned shift;
>>>>>> +
>>>>>> +    if (size == sizeof(uint64_t)) {
>>>>>> +        /* 64b access */
>>>>>> +        mask = 0xFFFFFFFFFFFFFFFFUL;
>>>>>> +        shift = 0;
>>>>>> +    } else {
>>>>>> +        /* 32b access */
>>>>>> +        mask = 0x00000000FFFFFFFFUL;
>>>>>> +        shift = ((addr & 0x4) == 0x4) ? 32 : 0;
>>>>>> +    }
>>>>>> +
>>>>>> +    rdval = reg;
>>>>>> +    rdval >>= shift;
>>>>>> +    rdval &= mask;
>>>>>> +
>>>>>> +    return rdval;
>>>>>> +}
>>>>>> +
>>>>>> +static uint64_t erst_wr_reg64(hwaddr addr,
>>>>>> +    uint64_t reg, uint64_t val, unsigned size)
>>>>>> +{
>>>>>> +    uint64_t wrval;
>>>>>> +    uint64_t mask;
>>>>>> +    unsigned shift;
>>>>>> +
>>>>>> +    if (size == sizeof(uint64_t)) {
>>>>>> +        /* 64b access */
>>>>>> +        mask = 0xFFFFFFFFFFFFFFFFUL;
>>>>>> +        shift = 0;
>>>>>> +    } else {
>>>>>> +        /* 32b access */
>>>>>> +        mask = 0x00000000FFFFFFFFUL;
>>>>>> +        shift = ((addr & 0x4) == 0x4) ? 32 : 0;
>>>>>> +    }
>>>>>> +
>>>>>> +    val &= mask;
>>>>>> +    val <<= shift;
>>>>>> +    mask <<= shift;
>>>>>> +    wrval = reg;
>>>>>> +    wrval &= ~mask;
>>>>>> +    wrval |= val;
>>>>>> +
>>>>>> +    return wrval;
>>>>>> +}
>>>>> (I see in next patch it's us defining access width in the ACPI tables)
>>>>> so question is: do we have to have mixed register width access?
>>>>> can't all register accesses be 64-bit?
>>>>
>>>> Initially I attempted to just use 64-bit exclusively. The problem is that,
>>>> for reasons I don't understand, the OSPM on Linux, even x86_64, breaks a 64b
>>>> register access into two. Here's an example of reading the exchange buffer
>>>> address, which is coded as a 64b access:
>>>>
>>>> acpi_erst_reg_write addr: 0x0000 <== 0x000000000000000d (size: 4)
>>>> acpi_erst_reg_read  addr: 0x0008 ==> 0x00000000c1010000 (size: 4)
>>>> acpi_erst_reg_read  addr: 0x000c ==> 0x0000000000000000 (size: 4)
>>>>
>>>> So I went ahead and made ACTION register accesses 32b, else there would
>>>> be two reads of 32-bts, of which the second is useless.
>>>
>>> could you post here decompiled ERST table?
>> As it is long, I posted it to the end of this message.
> 
> RHEL8 or Fedora 34 says that erst is invalid table,
> so I can't help tracing what's going on there.
> 
> You'll have to figure out why access is not 64 bit on your own.

Today I downloaded Fedora 34 Server and created a guest. Using my
qemu-6 branch with ERST, it appears to work just fine. I was able to
create entries into it.


[    0.010215] ACPI: ERST 0x000000007F9F3000 000390 (v01 BOCHS  BXPC     00000001 BXPC 00000001)
[    0.010250] ACPI: Reserving ERST table memory at [mem 0x7f9f3000-0x7f9f338f]
[    1.056244] ERST: Error Record Serialization Table (ERST) support is initialized.
[    1.056279] pstore: Registered erst as persistent store backend

total 0
drwxr-x---.  2 root root     0 Aug  4 18:05 .
drwxr-xr-x. 10 root root     0 Aug  4 18:05 ..
-r--r--r--.  1 root root 17700 Aug  4 17:54 dmesg-erst-6992696633267847169
-r--r--r--.  1 root root 17714 Aug  4 17:54 dmesg-erst-6992696633267847170


It appears to Linux OSPM is taking the 64-bit register access and breaking it
into two 32-bit accesses. If this is the case, then the fix would be in
Linux and not this code.

Pending your response to this finding, I have v6 ready to go.
Thanks
eric


> 
> [...]
> 
>> Obtained via a running guest with:
>> iasl -d -vt /sys/firmware/acpi/tables/ERST
>>
>> /*
>>    * Intel ACPI Component Architecture
>>    * AML/ASL+ Disassembler version 20180105 (64-bit version)
>>    * Copyright (c) 2000 - 2018 Intel Corporation
>>    *
>>    * Disassembly of ERST.blob, Mon Jul 26 14:31:21 2021
>>    *
>>    * ACPI Data Table [ERST]
>>    *
>>    * Format: [HexOffset DecimalOffset ByteLength]  FieldName : FieldValue
>>    */
>>
>> [000h 0000   4]                    Signature : "ERST"    [Error Record Serialization Table]
>> [004h 0004   4]                 Table Length : 00000390
>> [008h 0008   1]                     Revision : 01
>> [009h 0009   1]                     Checksum : C8
>> [00Ah 0010   6]                       Oem ID : "BOCHS "
>> [010h 0016   8]                 Oem Table ID : "BXPC    "
>> [018h 0024   4]                 Oem Revision : 00000001
>> [01Ch 0028   4]              Asl Compiler ID : "BXPC"
>> [020h 0032   4]        Asl Compiler Revision : 00000001
>>
>> [024h 0036   4]  Serialization Header Length : 00000030
>> [028h 0040   4]                     Reserved : 00000000
>> [02Ch 0044   4]      Instruction Entry Count : 0000001B
>>
>> [030h 0048   1]                       Action : 00 [Begin Write Operation]
>> [031h 0049   1]                  Instruction : 03 [Write Register Value]
>> [032h 0050   1]        Flags (decoded below) : 00
>>                         Preserve Register Bits : 0
>> [033h 0051   1]                     Reserved : 00
>>
>> [034h 0052  12]              Register Region : [Generic Address Structure]
>> [034h 0052   1]                     Space ID : 00 [SystemMemory]
>> [035h 0053   1]                    Bit Width : 20
>> [036h 0054   1]                   Bit Offset : 00
>> [037h 0055   1]         Encoded Access Width : 03 [DWord Access:32]
>> [038h 0056   8]                      Address : 00000000C1063000
>>
>> [040h 0064   8]                        Value : 0000000000000000
>> [048h 0072   8]                         Mask : 00000000000000FF
>>
>> [050h 0080   1]                       Action : 01 [Begin Read Operation]
>> [051h 0081   1]                  Instruction : 03 [Write Register Value]
>> [052h 0082   1]        Flags (decoded below) : 00
>>                         Preserve Register Bits : 0
>> [053h 0083   1]                     Reserved : 00
>>
>> [054h 0084  12]              Register Region : [Generic Address Structure]
>> [054h 0084   1]                     Space ID : 00 [SystemMemory]
>> [055h 0085   1]                    Bit Width : 20
>> [056h 0086   1]                   Bit Offset : 00
>> [057h 0087   1]         Encoded Access Width : 03 [DWord Access:32]
>> [058h 0088   8]                      Address : 00000000C1063000
>>
>> [060h 0096   8]                        Value : 0000000000000001
>> [068h 0104   8]                         Mask : 00000000000000FF
>>
>> [070h 0112   1]                       Action : 02 [Begin Clear Operation]
>> [071h 0113   1]                  Instruction : 03 [Write Register Value]
>> [072h 0114   1]        Flags (decoded below) : 00
>>                         Preserve Register Bits : 0
>> [073h 0115   1]                     Reserved : 00
>>
>> [074h 0116  12]              Register Region : [Generic Address Structure]
>> [074h 0116   1]                     Space ID : 00 [SystemMemory]
>> [075h 0117   1]                    Bit Width : 20
>> [076h 0118   1]                   Bit Offset : 00
>> [077h 0119   1]         Encoded Access Width : 03 [DWord Access:32]
>> [078h 0120   8]                      Address : 00000000C1063000
>>
>> [080h 0128   8]                        Value : 0000000000000002
>> [088h 0136   8]                         Mask : 00000000000000FF
>>
>> [090h 0144   1]                       Action : 03 [End Operation]
>> [091h 0145   1]                  Instruction : 03 [Write Register Value]
>> [092h 0146   1]        Flags (decoded below) : 00
>>                         Preserve Register Bits : 0
>> [093h 0147   1]                     Reserved : 00
>>
>> [094h 0148  12]              Register Region : [Generic Address Structure]
>> [094h 0148   1]                     Space ID : 00 [SystemMemory]
>> [095h 0149   1]                    Bit Width : 20
>> [096h 0150   1]                   Bit Offset : 00
>> [097h 0151   1]         Encoded Access Width : 03 [DWord Access:32]
>> [098h 0152   8]                      Address : 00000000C1063000
>>
>> [0A0h 0160   8]                        Value : 0000000000000003
>> [0A8h 0168   8]                         Mask : 00000000000000FF
>>
>> [0B0h 0176   1]                       Action : 04 [Set Record Offset]
>> [0B1h 0177   1]                  Instruction : 02 [Write Register]
>> [0B2h 0178   1]        Flags (decoded below) : 00
>>                         Preserve Register Bits : 0
>> [0B3h 0179   1]                     Reserved : 00
>>
>> [0B4h 0180  12]              Register Region : [Generic Address Structure]
>> [0B4h 0180   1]                     Space ID : 00 [SystemMemory]
>> [0B5h 0181   1]                    Bit Width : 20
>> [0B6h 0182   1]                   Bit Offset : 00
>> [0B7h 0183   1]         Encoded Access Width : 03 [DWord Access:32]
>> [0B8h 0184   8]                      Address : 00000000C1063008
>>
>> [0C0h 0192   8]                        Value : 0000000000000000
>> [0C8h 0200   8]                         Mask : 00000000FFFFFFFF
>>
>> [0D0h 0208   1]                       Action : 04 [Set Record Offset]
>> [0D1h 0209   1]                  Instruction : 03 [Write Register Value]
>> [0D2h 0210   1]        Flags (decoded below) : 00
>>                         Preserve Register Bits : 0
>> [0D3h 0211   1]                     Reserved : 00
>>
>> [0D4h 0212  12]              Register Region : [Generic Address Structure]
>> [0D4h 0212   1]                     Space ID : 00 [SystemMemory]
>> [0D5h 0213   1]                    Bit Width : 20
>> [0D6h 0214   1]                   Bit Offset : 00
>> [0D7h 0215   1]         Encoded Access Width : 03 [DWord Access:32]
>> [0D8h 0216   8]                      Address : 00000000C1063000
>>
>> [0E0h 0224   8]                        Value : 0000000000000004
>> [0E8h 0232   8]                         Mask : 00000000000000FF
>>
>> [0F0h 0240   1]                       Action : 05 [Execute Operation]
>> [0F1h 0241   1]                  Instruction : 03 [Write Register Value]
>> [0F2h 0242   1]        Flags (decoded below) : 00
>>                         Preserve Register Bits : 0
>> [0F3h 0243   1]                     Reserved : 00
>>
>> [0F4h 0244  12]              Register Region : [Generic Address Structure]
>> [0F4h 0244   1]                     Space ID : 00 [SystemMemory]
>> [0F5h 0245   1]                    Bit Width : 20
>> [0F6h 0246   1]                   Bit Offset : 00
>> [0F7h 0247   1]         Encoded Access Width : 03 [DWord Access:32]
>> [0F8h 0248   8]                      Address : 00000000C1063008
>>
>> [100h 0256   8]                        Value : 000000000000009C
>> [108h 0264   8]                         Mask : 00000000000000FF
>>
>> [110h 0272   1]                       Action : 05 [Execute Operation]
>> [111h 0273   1]                  Instruction : 03 [Write Register Value]
>> [112h 0274   1]        Flags (decoded below) : 00
>>                         Preserve Register Bits : 0
>> [113h 0275   1]                     Reserved : 00
>>
>> [114h 0276  12]              Register Region : [Generic Address Structure]
>> [114h 0276   1]                     Space ID : 00 [SystemMemory]
>> [115h 0277   1]                    Bit Width : 20
>> [116h 0278   1]                   Bit Offset : 00
>> [117h 0279   1]         Encoded Access Width : 03 [DWord Access:32]
>> [118h 0280   8]                      Address : 00000000C1063000
>>
>> [120h 0288   8]                        Value : 0000000000000005
>> [128h 0296   8]                         Mask : 00000000000000FF
>>
>> [130h 0304   1]                       Action : 06 [Check Busy Status]
>> [131h 0305   1]                  Instruction : 03 [Write Register Value]
>> [132h 0306   1]        Flags (decoded below) : 00
>>                         Preserve Register Bits : 0
>> [133h 0307   1]                     Reserved : 00
>>
>> [134h 0308  12]              Register Region : [Generic Address Structure]
>> [134h 0308   1]                     Space ID : 00 [SystemMemory]
>> [135h 0309   1]                    Bit Width : 20
>> [136h 0310   1]                   Bit Offset : 00
>> [137h 0311   1]         Encoded Access Width : 03 [DWord Access:32]
>> [138h 0312   8]                      Address : 00000000C1063000
>>
>> [140h 0320   8]                        Value : 0000000000000006
>> [148h 0328   8]                         Mask : 00000000000000FF
>>
>> [150h 0336   1]                       Action : 06 [Check Busy Status]
>> [151h 0337   1]                  Instruction : 01 [Read Register Value]
>> [152h 0338   1]        Flags (decoded below) : 00
>>                         Preserve Register Bits : 0
>> [153h 0339   1]                     Reserved : 00
>>
>> [154h 0340  12]              Register Region : [Generic Address Structure]
>> [154h 0340   1]                     Space ID : 00 [SystemMemory]
>> [155h 0341   1]                    Bit Width : 20
>> [156h 0342   1]                   Bit Offset : 00
>> [157h 0343   1]         Encoded Access Width : 03 [DWord Access:32]
>> [158h 0344   8]                      Address : 00000000C1063008
>>
>> [160h 0352   8]                        Value : 0000000000000001
>> [168h 0360   8]                         Mask : 00000000000000FF
>>
>> [170h 0368   1]                       Action : 07 [Get Command Status]
>> [171h 0369   1]                  Instruction : 03 [Write Register Value]
>> [172h 0370   1]        Flags (decoded below) : 00
>>                         Preserve Register Bits : 0
>> [173h 0371   1]                     Reserved : 00
>>
>> [174h 0372  12]              Register Region : [Generic Address Structure]
>> [174h 0372   1]                     Space ID : 00 [SystemMemory]
>> [175h 0373   1]                    Bit Width : 20
>> [176h 0374   1]                   Bit Offset : 00
>> [177h 0375   1]         Encoded Access Width : 03 [DWord Access:32]
>> [178h 0376   8]                      Address : 00000000C1063000
>>
>> [180h 0384   8]                        Value : 0000000000000007
>> [188h 0392   8]                         Mask : 00000000000000FF
>>
>> [190h 0400   1]                       Action : 07 [Get Command Status]
>> [191h 0401   1]                  Instruction : 00 [Read Register]
>> [192h 0402   1]        Flags (decoded below) : 00
>>                         Preserve Register Bits : 0
>> [193h 0403   1]                     Reserved : 00
>>
>> [194h 0404  12]              Register Region : [Generic Address Structure]
>> [194h 0404   1]                     Space ID : 00 [SystemMemory]
>> [195h 0405   1]                    Bit Width : 20
>> [196h 0406   1]                   Bit Offset : 00
>> [197h 0407   1]         Encoded Access Width : 03 [DWord Access:32]
>> [198h 0408   8]                      Address : 00000000C1063008
>>
>> [1A0h 0416   8]                        Value : 0000000000000000
>> [1A8h 0424   8]                         Mask : 00000000000000FF
>>
>> [1B0h 0432   1]                       Action : 08 [Get Record Identifier]
>> [1B1h 0433   1]                  Instruction : 03 [Write Register Value]
>> [1B2h 0434   1]        Flags (decoded below) : 00
>>                         Preserve Register Bits : 0
>> [1B3h 0435   1]                     Reserved : 00
>>
>> [1B4h 0436  12]              Register Region : [Generic Address Structure]
>> [1B4h 0436   1]                     Space ID : 00 [SystemMemory]
>> [1B5h 0437   1]                    Bit Width : 20
>> [1B6h 0438   1]                   Bit Offset : 00
>> [1B7h 0439   1]         Encoded Access Width : 03 [DWord Access:32]
>> [1B8h 0440   8]                      Address : 00000000C1063000
>>
>> [1C0h 0448   8]                        Value : 0000000000000008
>> [1C8h 0456   8]                         Mask : 00000000000000FF
>>
>> [1D0h 0464   1]                       Action : 08 [Get Record Identifier]
>> [1D1h 0465   1]                  Instruction : 00 [Read Register]
>> [1D2h 0466   1]        Flags (decoded below) : 00
>>                         Preserve Register Bits : 0
>> [1D3h 0467   1]                     Reserved : 00
>>
>> [1D4h 0468  12]              Register Region : [Generic Address Structure]
>> [1D4h 0468   1]                     Space ID : 00 [SystemMemory]
>> [1D5h 0469   1]                    Bit Width : 40
>> [1D6h 0470   1]                   Bit Offset : 00
>> [1D7h 0471   1]         Encoded Access Width : 04 [QWord Access:64]
>> [1D8h 0472   8]                      Address : 00000000C1063008
>>
>> [1E0h 0480   8]                        Value : 0000000000000000
>> [1E8h 0488   8]                         Mask : FFFFFFFFFFFFFFFF
>>
>> [1F0h 0496   1]                       Action : 09 [Set Record Identifier]
>> [1F1h 0497   1]                  Instruction : 02 [Write Register]
>> [1F2h 0498   1]        Flags (decoded below) : 00
>>                         Preserve Register Bits : 0
>> [1F3h 0499   1]                     Reserved : 00
>>
>> [1F4h 0500  12]              Register Region : [Generic Address Structure]
>> [1F4h 0500   1]                     Space ID : 00 [SystemMemory]
>> [1F5h 0501   1]                    Bit Width : 40
>> [1F6h 0502   1]                   Bit Offset : 00
>> [1F7h 0503   1]         Encoded Access Width : 04 [QWord Access:64]
>> [1F8h 0504   8]                      Address : 00000000C1063008
>>
>> [200h 0512   8]                        Value : 0000000000000000
>> [208h 0520   8]                         Mask : FFFFFFFFFFFFFFFF
>>
>> [210h 0528   1]                       Action : 09 [Set Record Identifier]
>> [211h 0529   1]                  Instruction : 03 [Write Register Value]
>> [212h 0530   1]        Flags (decoded below) : 00
>>                         Preserve Register Bits : 0
>> [213h 0531   1]                     Reserved : 00
>>
>> [214h 0532  12]              Register Region : [Generic Address Structure]
>> [214h 0532   1]                     Space ID : 00 [SystemMemory]
>> [215h 0533   1]                    Bit Width : 20
>> [216h 0534   1]                   Bit Offset : 00
>> [217h 0535   1]         Encoded Access Width : 03 [DWord Access:32]
>> [218h 0536   8]                      Address : 00000000C1063000
>>
>> [220h 0544   8]                        Value : 0000000000000009
>> [228h 0552   8]                         Mask : 00000000000000FF
>>
>> [230h 0560   1]                       Action : 0A [Get Record Count]
>> [231h 0561   1]                  Instruction : 03 [Write Register Value]
>> [232h 0562   1]        Flags (decoded below) : 00
>>                         Preserve Register Bits : 0
>> [233h 0563   1]                     Reserved : 00
>>
>> [234h 0564  12]              Register Region : [Generic Address Structure]
>> [234h 0564   1]                     Space ID : 00 [SystemMemory]
>> [235h 0565   1]                    Bit Width : 20
>> [236h 0566   1]                   Bit Offset : 00
>> [237h 0567   1]         Encoded Access Width : 03 [DWord Access:32]
>> [238h 0568   8]                      Address : 00000000C1063000
>>
>> [240h 0576   8]                        Value : 000000000000000A
>> [248h 0584   8]                         Mask : 00000000000000FF
>>
>> [250h 0592   1]                       Action : 0A [Get Record Count]
>> [251h 0593   1]                  Instruction : 00 [Read Register]
>> [252h 0594   1]        Flags (decoded below) : 00
>>                         Preserve Register Bits : 0
>> [253h 0595   1]                     Reserved : 00
>>
>> [254h 0596  12]              Register Region : [Generic Address Structure]
>> [254h 0596   1]                     Space ID : 00 [SystemMemory]
>> [255h 0597   1]                    Bit Width : 20
>> [256h 0598   1]                   Bit Offset : 00
>> [257h 0599   1]         Encoded Access Width : 03 [DWord Access:32]
>> [258h 0600   8]                      Address : 00000000C1063008
>>
>> [260h 0608   8]                        Value : 0000000000000000
>> [268h 0616   8]                         Mask : 00000000FFFFFFFF
>>
>> [270h 0624   1]                       Action : 0B [Begin Dummy Write]
>> [271h 0625   1]                  Instruction : 03 [Write Register Value]
>> [272h 0626   1]        Flags (decoded below) : 00
>>                         Preserve Register Bits : 0
>> [273h 0627   1]                     Reserved : 00
>>
>> [274h 0628  12]              Register Region : [Generic Address Structure]
>> [274h 0628   1]                     Space ID : 00 [SystemMemory]
>> [275h 0629   1]                    Bit Width : 20
>> [276h 0630   1]                   Bit Offset : 00
>> [277h 0631   1]         Encoded Access Width : 03 [DWord Access:32]
>> [278h 0632   8]                      Address : 00000000C1063000
>>
>> [280h 0640   8]                        Value : 000000000000000B
>> [288h 0648   8]                         Mask : 00000000000000FF
>>
>> [290h 0656   1]                       Action : 0D [Get Error Address Range]
>> [291h 0657   1]                  Instruction : 03 [Write Register Value]
>> [292h 0658   1]        Flags (decoded below) : 00
>>                         Preserve Register Bits : 0
>> [293h 0659   1]                     Reserved : 00
>>
>> [294h 0660  12]              Register Region : [Generic Address Structure]
>> [294h 0660   1]                     Space ID : 00 [SystemMemory]
>> [295h 0661   1]                    Bit Width : 20
>> [296h 0662   1]                   Bit Offset : 00
>> [297h 0663   1]         Encoded Access Width : 03 [DWord Access:32]
>> [298h 0664   8]                      Address : 00000000C1063000
>>
>> [2A0h 0672   8]                        Value : 000000000000000D
>> [2A8h 0680   8]                         Mask : 00000000000000FF
>>
>> [2B0h 0688   1]                       Action : 0D [Get Error Address Range]
>> [2B1h 0689   1]                  Instruction : 00 [Read Register]
>> [2B2h 0690   1]        Flags (decoded below) : 00
>>                         Preserve Register Bits : 0
>> [2B3h 0691   1]                     Reserved : 00
>>
>> [2B4h 0692  12]              Register Region : [Generic Address Structure]
>> [2B4h 0692   1]                     Space ID : 00 [SystemMemory]
>> [2B5h 0693   1]                    Bit Width : 40
>> [2B6h 0694   1]                   Bit Offset : 00
>> [2B7h 0695   1]         Encoded Access Width : 04 [QWord Access:64]
>> [2B8h 0696   8]                      Address : 00000000C1063008
>>
>> [2C0h 0704   8]                        Value : 0000000000000000
>> [2C8h 0712   8]                         Mask : FFFFFFFFFFFFFFFF
>>
>> [2D0h 0720   1]                       Action : 0E [Get Error Address Length]
>> [2D1h 0721   1]                  Instruction : 03 [Write Register Value]
>> [2D2h 0722   1]        Flags (decoded below) : 00
>>                         Preserve Register Bits : 0
>> [2D3h 0723   1]                     Reserved : 00
>>
>> [2D4h 0724  12]              Register Region : [Generic Address Structure]
>> [2D4h 0724   1]                     Space ID : 00 [SystemMemory]
>> [2D5h 0725   1]                    Bit Width : 20
>> [2D6h 0726   1]                   Bit Offset : 00
>> [2D7h 0727   1]         Encoded Access Width : 03 [DWord Access:32]
>> [2D8h 0728   8]                      Address : 00000000C1063000
>>
>> [2E0h 0736   8]                        Value : 000000000000000E
>> [2E8h 0744   8]                         Mask : 00000000000000FF
>>
>> [2F0h 0752   1]                       Action : 0E [Get Error Address Length]
>> [2F1h 0753   1]                  Instruction : 00 [Read Register]
>> [2F2h 0754   1]        Flags (decoded below) : 00
>>                         Preserve Register Bits : 0
>> [2F3h 0755   1]                     Reserved : 00
>>
>> [2F4h 0756  12]              Register Region : [Generic Address Structure]
>> [2F4h 0756   1]                     Space ID : 00 [SystemMemory]
>> [2F5h 0757   1]                    Bit Width : 40
>> [2F6h 0758   1]                   Bit Offset : 00
>> [2F7h 0759   1]         Encoded Access Width : 04 [QWord Access:64]
>> [2F8h 0760   8]                      Address : 00000000C1063008
>>
>> [300h 0768   8]                        Value : 0000000000000000
>> [308h 0776   8]                         Mask : 00000000FFFFFFFF
>>
>> [310h 0784   1]                       Action : 0F [Get Error Attributes]
>> [311h 0785   1]                  Instruction : 03 [Write Register Value]
>> [312h 0786   1]        Flags (decoded below) : 00
>>                         Preserve Register Bits : 0
>> [313h 0787   1]                     Reserved : 00
>>
>> [314h 0788  12]              Register Region : [Generic Address Structure]
>> [314h 0788   1]                     Space ID : 00 [SystemMemory]
>> [315h 0789   1]                    Bit Width : 20
>> [316h 0790   1]                   Bit Offset : 00
>> [317h 0791   1]         Encoded Access Width : 03 [DWord Access:32]
>> [318h 0792   8]                      Address : 00000000C1063000
>>
>> [320h 0800   8]                        Value : 000000000000000F
>> [328h 0808   8]                         Mask : 00000000000000FF
>>
>> [330h 0816   1]                       Action : 0F [Get Error Attributes]
>> [331h 0817   1]                  Instruction : 00 [Read Register]
>> [332h 0818   1]        Flags (decoded below) : 00
>>                         Preserve Register Bits : 0
>> [333h 0819   1]                     Reserved : 00
>>
>> [334h 0820  12]              Register Region : [Generic Address Structure]
>> [334h 0820   1]                     Space ID : 00 [SystemMemory]
>> [335h 0821   1]                    Bit Width : 20
>> [336h 0822   1]                   Bit Offset : 00
>> [337h 0823   1]         Encoded Access Width : 03 [DWord Access:32]
>> [338h 0824   8]                      Address : 00000000C1063008
>>
>> [340h 0832   8]                        Value : 0000000000000000
>> [348h 0840   8]                         Mask : 00000000FFFFFFFF
>>
>> [350h 0848   1]                       Action : 10 [Execute Timings]
>> [351h 0849   1]                  Instruction : 03 [Write Register Value]
>> [352h 0850   1]        Flags (decoded below) : 00
>>                         Preserve Register Bits : 0
>> [353h 0851   1]                     Reserved : 00
>>
>> [354h 0852  12]              Register Region : [Generic Address Structure]
>> [354h 0852   1]                     Space ID : 00 [SystemMemory]
>> [355h 0853   1]                    Bit Width : 20
>> [356h 0854   1]                   Bit Offset : 00
>> [357h 0855   1]         Encoded Access Width : 03 [DWord Access:32]
>> [358h 0856   8]                      Address : 00000000C1063000
>>
>> [360h 0864   8]                        Value : 0000000000000010
>> [368h 0872   8]                         Mask : 00000000000000FF
>>
>> [370h 0880   1]                       Action : 10 [Execute Timings]
>> [371h 0881   1]                  Instruction : 00 [Read Register]
>> [372h 0882   1]        Flags (decoded below) : 00
>>                         Preserve Register Bits : 0
>> [373h 0883   1]                     Reserved : 00
>>
>> [374h 0884  12]              Register Region : [Generic Address Structure]
>> [374h 0884   1]                     Space ID : 00 [SystemMemory]
>> [375h 0885   1]                    Bit Width : 40
>> [376h 0886   1]                   Bit Offset : 00
>> [377h 0887   1]         Encoded Access Width : 04 [QWord Access:64]
>> [378h 0888   8]                      Address : 00000000C1063008
>>
>> [380h 0896   8]                        Value : 0000000000000000
>> [388h 0904   8]                         Mask : FFFFFFFFFFFFFFFF
>>
>> Raw Table Data: Length 912 (0x390)
>>
>>     0000: 45 52 53 54 90 03 00 00 01 C8 42 4F 43 48 53 20  // ERST......BOCHS
>>     0010: 42 58 50 43 20 20 20 20 01 00 00 00 42 58 50 43  // BXPC    ....BXPC
>>     0020: 01 00 00 00 30 00 00 00 00 00 00 00 1B 00 00 00  // ....0...........
>>     0030: 00 03 00 00 00 20 00 03 00 30 06 C1 00 00 00 00  // ..... ...0......
>>     0040: 00 00 00 00 00 00 00 00 FF 00 00 00 00 00 00 00  // ................
>>     0050: 01 03 00 00 00 20 00 03 00 30 06 C1 00 00 00 00  // ..... ...0......
>>     0060: 01 00 00 00 00 00 00 00 FF 00 00 00 00 00 00 00  // ................
>>     0070: 02 03 00 00 00 20 00 03 00 30 06 C1 00 00 00 00  // ..... ...0......
>>     0080: 02 00 00 00 00 00 00 00 FF 00 00 00 00 00 00 00  // ................
>>     0090: 03 03 00 00 00 20 00 03 00 30 06 C1 00 00 00 00  // ..... ...0......
>>     00A0: 03 00 00 00 00 00 00 00 FF 00 00 00 00 00 00 00  // ................
>>     00B0: 04 02 00 00 00 20 00 03 08 30 06 C1 00 00 00 00  // ..... ...0......
>>     00C0: 00 00 00 00 00 00 00 00 FF FF FF FF 00 00 00 00  // ................
>>     00D0: 04 03 00 00 00 20 00 03 00 30 06 C1 00 00 00 00  // ..... ...0......
>>     00E0: 04 00 00 00 00 00 00 00 FF 00 00 00 00 00 00 00  // ................
>>     00F0: 05 03 00 00 00 20 00 03 08 30 06 C1 00 00 00 00  // ..... ...0......
>>     0100: 9C 00 00 00 00 00 00 00 FF 00 00 00 00 00 00 00  // ................
>>     0110: 05 03 00 00 00 20 00 03 00 30 06 C1 00 00 00 00  // ..... ...0......
>>     0120: 05 00 00 00 00 00 00 00 FF 00 00 00 00 00 00 00  // ................
>>     0130: 06 03 00 00 00 20 00 03 00 30 06 C1 00 00 00 00  // ..... ...0......
>>     0140: 06 00 00 00 00 00 00 00 FF 00 00 00 00 00 00 00  // ................
>>     0150: 06 01 00 00 00 20 00 03 08 30 06 C1 00 00 00 00  // ..... ...0......
>>     0160: 01 00 00 00 00 00 00 00 FF 00 00 00 00 00 00 00  // ................
>>     0170: 07 03 00 00 00 20 00 03 00 30 06 C1 00 00 00 00  // ..... ...0......
>>     0180: 07 00 00 00 00 00 00 00 FF 00 00 00 00 00 00 00  // ................
>>     0190: 07 00 00 00 00 20 00 03 08 30 06 C1 00 00 00 00  // ..... ...0......
>>     01A0: 00 00 00 00 00 00 00 00 FF 00 00 00 00 00 00 00  // ................
>>     01B0: 08 03 00 00 00 20 00 03 00 30 06 C1 00 00 00 00  // ..... ...0......
>>     01C0: 08 00 00 00 00 00 00 00 FF 00 00 00 00 00 00 00  // ................
>>     01D0: 08 00 00 00 00 40 00 04 08 30 06 C1 00 00 00 00  // .....@...0......
>>     01E0: 00 00 00 00 00 00 00 00 FF FF FF FF FF FF FF FF  // ................
>>     01F0: 09 02 00 00 00 40 00 04 08 30 06 C1 00 00 00 00  // .....@...0......
>>     0200: 00 00 00 00 00 00 00 00 FF FF FF FF FF FF FF FF  // ................
>>     0210: 09 03 00 00 00 20 00 03 00 30 06 C1 00 00 00 00  // ..... ...0......
>>     0220: 09 00 00 00 00 00 00 00 FF 00 00 00 00 00 00 00  // ................
>>     0230: 0A 03 00 00 00 20 00 03 00 30 06 C1 00 00 00 00  // ..... ...0......
>>     0240: 0A 00 00 00 00 00 00 00 FF 00 00 00 00 00 00 00  // ................
>>     0250: 0A 00 00 00 00 20 00 03 08 30 06 C1 00 00 00 00  // ..... ...0......
>>     0260: 00 00 00 00 00 00 00 00 FF FF FF FF 00 00 00 00  // ................
>>     0270: 0B 03 00 00 00 20 00 03 00 30 06 C1 00 00 00 00  // ..... ...0......
>>     0280: 0B 00 00 00 00 00 00 00 FF 00 00 00 00 00 00 00  // ................
>>     0290: 0D 03 00 00 00 20 00 03 00 30 06 C1 00 00 00 00  // ..... ...0......
>>     02A0: 0D 00 00 00 00 00 00 00 FF 00 00 00 00 00 00 00  // ................
>>     02B0: 0D 00 00 00 00 40 00 04 08 30 06 C1 00 00 00 00  // .....@...0......
>>     02C0: 00 00 00 00 00 00 00 00 FF FF FF FF FF FF FF FF  // ................
>>     02D0: 0E 03 00 00 00 20 00 03 00 30 06 C1 00 00 00 00  // ..... ...0......
>>     02E0: 0E 00 00 00 00 00 00 00 FF 00 00 00 00 00 00 00  // ................
>>     02F0: 0E 00 00 00 00 40 00 04 08 30 06 C1 00 00 00 00  // .....@...0......
>>     0300: 00 00 00 00 00 00 00 00 FF FF FF FF 00 00 00 00  // ................
>>     0310: 0F 03 00 00 00 20 00 03 00 30 06 C1 00 00 00 00  // ..... ...0......
>>     0320: 0F 00 00 00 00 00 00 00 FF 00 00 00 00 00 00 00  // ................
>>     0330: 0F 00 00 00 00 20 00 03 08 30 06 C1 00 00 00 00  // ..... ...0......
>>     0340: 00 00 00 00 00 00 00 00 FF FF FF FF 00 00 00 00  // ................
>>     0350: 10 03 00 00 00 20 00 03 00 30 06 C1 00 00 00 00  // ..... ...0......
>>     0360: 10 00 00 00 00 00 00 00 FF 00 00 00 00 00 00 00  // ................
>>     0370: 10 00 00 00 00 40 00 04 08 30 06 C1 00 00 00 00  // .....@...0......
>>     0380: 00 00 00 00 00 00 00 00 FF FF FF FF FF FF FF FF  // ................
>>
> 

