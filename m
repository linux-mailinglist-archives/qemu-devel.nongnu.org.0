Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E398B3D67DE
	for <lists+qemu-devel@lfdr.de>; Mon, 26 Jul 2021 22:06:15 +0200 (CEST)
Received: from localhost ([::1]:33318 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m86re-00057H-UZ
	for lists+qemu-devel@lfdr.de; Mon, 26 Jul 2021 16:06:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50330)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.devolder@oracle.com>)
 id 1m86od-0001LE-9O
 for qemu-devel@nongnu.org; Mon, 26 Jul 2021 16:03:07 -0400
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32]:16732)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.devolder@oracle.com>)
 id 1m86oa-0003Bd-JC
 for qemu-devel@nongnu.org; Mon, 26 Jul 2021 16:03:07 -0400
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 16QK0dga010719; Mon, 26 Jul 2021 20:03:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=subject : to : cc :
 references : from : message-id : date : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=corp-2021-07-09;
 bh=thACCulENYBqavsbZfLe4zYjGr84JlLw4yfmYw54v44=;
 b=QGPdKvVDYJDmaO7G4Wm7mTq8QEdicQK6rbylgg0OAwoOEHhVtcw5Qgi/sq/kD31Cf6BC
 AuMh8jSr6Q5vS0svtgKIS79f3/wJhg+f3a9cwlZ8XeiJ0NE5hdvRgrUS7XQrzRHZG3px
 EFQYhiHv0AV3P/uTKYeJqw2RBaBbtxjYJTYSBrOSsjSW+iH3QMGUlyxchsNn5UUx16Rr
 xYx1D76hZn8LWaRPpkVCMuQ7rWTlSkrOt3NLelwKh+61IvNaqiI70JoqviRx1LM3PgG0
 Jum8XHRGd/+wVNKfwR1jK5tPxCn7bHf0+Xxkzx4pnTbnES7fGhUQs+HNWzdI7zisvsIP IQ== 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=subject : to : cc :
 references : from : message-id : date : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=corp-2020-01-29;
 bh=thACCulENYBqavsbZfLe4zYjGr84JlLw4yfmYw54v44=;
 b=Vc9Zq+a2O80o5pGuWzdvCcY95QBNluy5xsTsFA6wA1Gj2j5+A0nn5GHDxdr3/rQ50KzR
 O7BqCUb5NpCtqIQzZBMRYmI8EG0bJewDvv8fFiX1+Guq64lqbB0L4kzvZt53AdwSun7G
 KcH7V4GuZrqrNYc0cJ0Tt6iXJ+d0WfcXDeaboIQNdXlvJ/CMS6h3WCG3JecYQvd5pcFi
 KbCpdozBIiF2dUKTTo9PZw9qViA7lymcdoMGdHGydTtc4x6WMSq6MfgbYsPByRp5PLLu
 vmekh+GFrdQ+zbZIewppj5XO0KZOclC9L68eSL7+OjcNA8KhwtEz+T1EdWWz7Eefj6iE nQ== 
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
 by mx0b-00069f02.pphosted.com with ESMTP id 3a234n02xb-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 26 Jul 2021 20:03:02 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
 by aserp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 16QK1PbP195259;
 Mon, 26 Jul 2021 20:03:01 GMT
Received: from nam11-co1-obe.outbound.protection.outlook.com
 (mail-co1nam11lp2176.outbound.protection.outlook.com [104.47.56.176])
 by aserp3020.oracle.com with ESMTP id 3a2346ssy8-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 26 Jul 2021 20:03:01 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=InEVCO1NkfhBtGNu2w6Zqmfq5g0cFSdTIveqfIPJesRA49oBOz1lNdZTVQnWdPX6kGdU72+gL5ee20KCTLQpbxo88C4oq1E13N48RL/gCFqc2kU/UeZoXQJs4XKII05jvF4CqrJI7TI/0IowPhEt2UuNBltYOgAs+gYSKRpQacbgYJbW/QFwVW/MTryhcZiZTCFeL1r87xgz52k5YoWCKxK/QriHiPl2q200kn4q0T4hp1r+V0N3PeZyAxvj02lDGGBUzh0Fayz4ZnMqcXXZQU0EHgbKEyFUVKLT52Aq3epU6hl4+4aV0viOOy4Afhh9w4zYjw7sPMWzO4mbAQAGug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=thACCulENYBqavsbZfLe4zYjGr84JlLw4yfmYw54v44=;
 b=F+GjgBDYLl6Dkw7fppIHqdk2kPrpsFPM1Wif/DhzKxwNzFbpzktM49zHknZyrTu0zWOzjn4vmclrml4mfouYr3SLb7+rswUyq5B/QmX6Hum8af8lMEqBfIMsq1uBo7BNWK4/KyNbFONVTVDARe8zob03fE6sBbPIX9U3TsOmFjpa0wXRto5J5l5dUyYjGznqQZx73lom+cPpckorlPqES+GoX/oyc2wlzHC13RUzJz/h6Gqdl/tM4hBBbLYJe92iBtnq+Rf5KEuKl1NKM23fDAOe6KuBXRcRn9p2QtDKvuNjRDa7milrmWqFbJkQ7/1Xz2/g5Fh02NtGR+t5+EIpHA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=thACCulENYBqavsbZfLe4zYjGr84JlLw4yfmYw54v44=;
 b=ylavYe1D6HnioWUqMmKgc8UfPPhkhtE26lUoencVYteA+j+m8IYDA9M/thTzV/WF8DsJwBRWEFHQ7YAEPuuusoymfMKGMFIJ6ZEhCrne0W31U3R5kaq6GnusGBIbV/BjHWc9JxazwMl8lFwbyDnmlvywoCuC6XR5KS3ySoPRS78=
Authentication-Results: oracle.com; dkim=none (message not signed)
 header.d=none;oracle.com; dmarc=none action=none header.from=oracle.com;
Received: from CO1PR10MB4531.namprd10.prod.outlook.com (2603:10b6:303:6c::22)
 by MWHPR1001MB2304.namprd10.prod.outlook.com (2603:10b6:301:2e::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4352.29; Mon, 26 Jul
 2021 20:02:58 +0000
Received: from CO1PR10MB4531.namprd10.prod.outlook.com
 ([fe80::cd0a:e210:15eb:dc5]) by CO1PR10MB4531.namprd10.prod.outlook.com
 ([fe80::cd0a:e210:15eb:dc5%4]) with mapi id 15.20.4352.031; Mon, 26 Jul 2021
 20:02:58 +0000
Subject: Re: [PATCH v5 06/10] ACPI ERST: build the ACPI ERST table
To: Igor Mammedov <imammedo@redhat.com>
References: <1625080041-29010-1-git-send-email-eric.devolder@oracle.com>
 <1625080041-29010-7-git-send-email-eric.devolder@oracle.com>
 <20210720151640.2d682f57@redhat.com>
 <b6e963a3-a5d0-5029-6059-b89d7e16482b@oracle.com>
 <20210726130040.2cb8f717@redhat.com>
From: Eric DeVolder <eric.devolder@oracle.com>
Message-ID: <078e48aa-e6eb-44a8-c60f-7bc5a64c5e1c@oracle.com>
Date: Mon, 26 Jul 2021 15:02:55 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
In-Reply-To: <20210726130040.2cb8f717@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SA0PR11CA0030.namprd11.prod.outlook.com
 (2603:10b6:806:d3::35) To CO1PR10MB4531.namprd10.prod.outlook.com
 (2603:10b6:303:6c::22)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2606:b400:414:8061:221:28ff:fea5:27c8]
 (2606:b400:8024:1010::112a) by SA0PR11CA0030.namprd11.prod.outlook.com
 (2603:10b6:806:d3::35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4352.26 via Frontend
 Transport; Mon, 26 Jul 2021 20:02:57 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: dad116d2-9222-4e41-3e03-08d950705d70
X-MS-TrafficTypeDiagnostic: MWHPR1001MB2304:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <MWHPR1001MB2304AE304B788EAD303F7E7197E89@MWHPR1001MB2304.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:741;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 0x6sO28JBcJ+dFLhd2/1tpS0Fg/6tT1Myp5sZnlliJmU+KlSX1YatGs9scaFTACvmarZgBf9V1Skg7+90IO/L6+M6Pg0uadkxdgZ7xjyVaBAzTSGQecv3OPE8cvuZIdwe1iNSaonB4y+aJuQRHh3bwXFj/r0183KOUdtcF3vd4huaADtaHPwKfnsgMvp0MYBwjoHHsYZrMg3zmGU4pbKPmU6gpzipSWDKnpeVkeD2MECUGO/B7XVJ8Rg8GGiNZbY9Yoj8U/8wD2aQXNIDTHIDqv971dfscXajLUdxA0iNINYu1VuMqZ56Zsx9B+EecbkwqPakYewSpAiRE8rMHrgxcHdzFLElZfkZJ8s3NYk0Qs+TFEr4T5Uv21lIonJKhpLRTMhPCMlTbZwDlJiKnkLH13bDtyv0V6WfxOFcfJMQSbb9TC9eght5wWd1SvF/lKDbbYRRRRv30R3Zr8ESzwtLHeOG0GG2W8fQjrYDBDObg8wwKHHbuCX8RqJ/+eUirqgkkwZopj2dJqDXdWGbtTp1t+zj/y5iB67VWR53dDI/cCV6cDq675NuJfL4AkiMaO0AgnVHuByhKrzQuvQPnYmnjAQsowodzkq4VCfPleHdlH8+2lNrQRMjib0LOlvA4NYSknckSx+erXgMpqKZyTR8RIImri1QFX4cwrVTIofVOPy4Yl0M7i+jSQIxjhHnuyvzXiMUKkmVP9P5rzq70rfc38jswgL5Lw5QI1B/Fi1IVA=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO1PR10MB4531.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(396003)(366004)(376002)(346002)(39860400002)(136003)(478600001)(186003)(31686004)(66556008)(66476007)(66946007)(2616005)(107886003)(5660300002)(53546011)(36756003)(86362001)(8676002)(38100700002)(2906002)(316002)(8936002)(30864003)(83380400001)(6916009)(4326008)(6486002)(31696002)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Z0V5WjZ1QmkySFpBL0RNSWZPY2l5UmhIVlJPUm4rQi9ZTFJCUWFkczE5OGl5?=
 =?utf-8?B?RUMwOWFlV1p6b3BzYWVXM0kzM3FTNmxZaStUc1MxOWhTd2JpYVpKUGQvYjBM?=
 =?utf-8?B?d0Z5ODVhUFVHMW5EM3BrUWZaWXJudzNaalVtYlhtWjcrWmQySG9wS090SWRF?=
 =?utf-8?B?Wk9vTEpVNzd2S1FvQytEZVNuQnFEd0hKbEZlOUEwYmMxUEsrMGJ5Nm0vVTFU?=
 =?utf-8?B?dWNSNnBCaGRiTEVNeTU0TUZxZCtjSGVaS1BPbjJDU1R5UDBEeUFac1dYOENa?=
 =?utf-8?B?TTQ0ZEdkMStQVENoeXI0VHM4NVIvM0xDVFFXSVI5NCtMVWkva09rcW5DaXZq?=
 =?utf-8?B?QUlwVXVrcGxpVW5EaXBuU3VNMkJUbjVBQUE2eUM3Q0xieTd1VjYvRVNtb25G?=
 =?utf-8?B?aVlNcGwwMTNwQTFkUkYxbVpIdzByeEtoNGt5ckt5cE9FaHd1UXpuVk80TE5v?=
 =?utf-8?B?c1k4bCswRDlTb1RwdFo1THRTUDFLa3NjbEsyeVJGR2MrTHBSSWRoNFBXaXlD?=
 =?utf-8?B?aDBIanFZQXQ0RTI5cXVHVXhaNjM1RjBTZFlGWU1YN3pEQW1EazlEaFNWNUNC?=
 =?utf-8?B?bUJkUDJMN1hxSnROdnJIRHhabys1RXllVmN0VWxHTmh0ZnlGTGJXTmQ3YkJV?=
 =?utf-8?B?NHZRejl1QUhMbTF1aTlpaG1FQ3h3U3hpOGVOcnpWYlZoN1UyZjltR09zb2gz?=
 =?utf-8?B?TU1VZWVLK1I4K3kxbW9odE9FVS9RY2JVV3paWG8yUU56Y2JlY2lJM056amZC?=
 =?utf-8?B?STFzWWpjWkF3alpiRGxJZFhJOVIrL2lXcHA4QkxXaWU4T0wreW4wVGlHSHhO?=
 =?utf-8?B?eW1UNE1VZk1LdXBhdCs1MG4zNUtKVTA4enkvbituRDBUdW1uaHpOS1k2ZEpR?=
 =?utf-8?B?M2V1cHFvNDh2R25CMFFJTFhrMTkyRkI0enhTWTJYaGVuTzZVaGgwcFFvMEJU?=
 =?utf-8?B?WktyZktSb3J2dFBGMEpPNkVCN3JRc2FjTEp0V3VqcnpWZjliclUzanlLY2VB?=
 =?utf-8?B?ditsVXNaczdSUzhuYVh0MmtiN1h6Z2llQmhUeGtvTTBQbHV6a1J6WkdqMFR6?=
 =?utf-8?B?VFRNR0tNeUpoSVpVVFptWGhOclFPVUFNeDVEWkZnM3NNbmJROEJHL3RlNWc0?=
 =?utf-8?B?Qno3VDRVcWg5TVRuYTZKbERMYmFRVVEvbHFwZEp0SGpRQ3FQMXZDSUZ3RmYr?=
 =?utf-8?B?WnhkQXFueDFqR1VCckdYT29LZythK1F5TmQxL2hveHFHNWxrNnVJMjY2Z01T?=
 =?utf-8?B?VVBUd1F3c0J6eUlDZVNCdXprai82RUtjNXhJWmxkWlVqZnVsYTV4LzY2OWZi?=
 =?utf-8?B?R2haYUFxdktzTXdMS3ZwdTRQZkNDNWNMekxjRnZmSTVYUnF1U1Q1bXR1eEJv?=
 =?utf-8?B?ekFsT0lUL3MxT1hKb0ppSjVoS2VkVWsxcUpQVHJjcGhraU45dFpqbzRJVWxw?=
 =?utf-8?B?RzU0aklnNVQ4RDB4V0wxVlkzM0NNWUd5eWtDV2lNWXhuV01wV2VkMWNtdHFw?=
 =?utf-8?B?YUVvcm0xNzBwS0NkWGN1MFRHRGp5TXR1UzkrWlpmODRHSVdHdmtUbEZ1V3JS?=
 =?utf-8?B?eFdlTmM1WE1kRlhoSnVTYU9CK01lWU9tR2dBektreDJyRS9Na2YxM0tSazdZ?=
 =?utf-8?B?N1ltZlBCbngycXA0WTZ6S2ZYQ2FkeHV1RVVaczhRdml3NVBRdDNuVkdBYUp4?=
 =?utf-8?B?UXVXbjVCaTR2c2pSMTA0MmhCcmc4Y2lUY3VZd1h3ajNsV2l3WC9YcGtFTWN2?=
 =?utf-8?B?NENoakZkelNqL1RXVEJiVlkwWkdSV0NyZUJhaEphMTdtWlBKZXd4MVEzbGxG?=
 =?utf-8?B?dDdsYnlDS3RKa0d1Y0hoZz09?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dad116d2-9222-4e41-3e03-08d950705d70
X-MS-Exchange-CrossTenant-AuthSource: CO1PR10MB4531.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jul 2021 20:02:58.5644 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8qcOKjLqwNjx+v9Yn6xvYDifnyvC7Xd8UWlGlbaJe3YDTN5S1XJc8AMTTVXs+Ekb9CIi09hjwIkT2Foy3mGF+Ty30HONNiPL2cKOwxNtHMQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR1001MB2304
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=10057
 signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0
 adultscore=0 suspectscore=0
 malwarescore=0 spamscore=0 mlxlogscore=999 phishscore=0 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2107140000
 definitions=main-2107260118
X-Proofpoint-ORIG-GUID: 0BWQPfGnZmYU6ygKiErtrX2yO5DVH8V_
X-Proofpoint-GUID: 0BWQPfGnZmYU6ygKiErtrX2yO5DVH8V_
Received-SPF: pass client-ip=205.220.177.32;
 envelope-from=eric.devolder@oracle.com; helo=mx0b-00069f02.pphosted.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, NICE_REPLY_A=-0.438, RCVD_IN_DNSWL_LOW=-0.7,
 RCVD_IN_MSPIKE_BL=0.001, RCVD_IN_MSPIKE_L3=0.001, SPF_HELO_NONE=0.001,
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



On 7/26/21 6:00 AM, Igor Mammedov wrote:
> On Wed, 21 Jul 2021 11:12:41 -0500
> Eric DeVolder <eric.devolder@oracle.com> wrote:
> 
>> On 7/20/21 8:16 AM, Igor Mammedov wrote:
>>> On Wed, 30 Jun 2021 15:07:17 -0400
>>> Eric DeVolder <eric.devolder@oracle.com> wrote:
>>>    
>>>> This code is called from the machine code (if ACPI supported)
>>>> to generate the ACPI ERST table.
>>> should be along lines:
>>> This builds ACPI ERST table /spec ref/ to inform OSMP
>>> how to communicate with ... device.
>>
>> Like this?
>> This builds the ACPI ERST table to inform OSMP how to communicate
>                                   ^ [1]
>> with the acpi-erst device.
>>
> 
> 1) ACPI spec vX.Y, chapter foo
done

> 
>>
>>>    
>>>>
>>>> Signed-off-by: Eric DeVolder <eric.devolder@oracle.com>
>>>> ---
>>>>    hw/acpi/erst.c | 214 +++++++++++++++++++++++++++++++++++++++++++++++++++++++++
>>>>    1 file changed, 214 insertions(+)
>>>>
>>>> diff --git a/hw/acpi/erst.c b/hw/acpi/erst.c
>>>> index 6e9bd2e..1f1dbbc 100644
>>>> --- a/hw/acpi/erst.c
>>>> +++ b/hw/acpi/erst.c
>>>> @@ -555,6 +555,220 @@ static const MemoryRegionOps erst_mem_ops = {
>>>>    /*******************************************************************/
>>>>    /*******************************************************************/
>>>>    
>>>> +/* ACPI 4.0: 17.4.1.2 Serialization Instruction Entries */
>>>> +static void build_serialization_instruction_entry(GArray *table_data,
>>>> +    uint8_t serialization_action,
>>>> +    uint8_t instruction,
>>>> +    uint8_t flags,
>>>> +    uint8_t register_bit_width,
>>>> +    uint64_t register_address,
>>>> +    uint64_t value,
>>>> +    uint64_t mask)
>>> like I mentioned in previous patch, It could be simplified
>>> a lot if it's possible to use fixed 64-bit access with every
>>> action and the same width mask.
>> See previous response.
> lets see if it's a guest OS issue first, and then decide what to do with it.
> 
>>
>>>    
>>>> +{
>>>> +    /* ACPI 4.0: Table 17-18 Serialization Instruction Entry */
>>>> +    struct AcpiGenericAddress gas;
>>>> +
>>>> +    /* Serialization Action */
>>>> +    build_append_int_noprefix(table_data, serialization_action, 1);
>>>> +    /* Instruction */
>>>> +    build_append_int_noprefix(table_data, instruction         , 1);
>>>> +    /* Flags */
>>>> +    build_append_int_noprefix(table_data, flags               , 1);
>>>> +    /* Reserved */
>>>> +    build_append_int_noprefix(table_data, 0                   , 1);
>>>> +    /* Register Region */
>>>> +    gas.space_id = AML_SYSTEM_MEMORY;
>>>> +    gas.bit_width = register_bit_width;
>>>> +    gas.bit_offset = 0;
>>>> +    switch (register_bit_width) {
>>>> +    case 8:
>>>> +        gas.access_width = 1;
>>>> +        break;
>>>> +    case 16:
>>>> +        gas.access_width = 2;
>>>> +        break;
>>>> +    case 32:
>>>> +        gas.access_width = 3;
>>>> +        break;
>>>> +    case 64:
>>>> +        gas.access_width = 4;
>>>> +        break;
>>>> +    default:
>>>> +        gas.access_width = 0;
>>>> +        break;
>>>> +    }
>>>> +    gas.address = register_address;
>>>> +    build_append_gas_from_struct(table_data, &gas);
>>>> +    /* Value */
>>>> +    build_append_int_noprefix(table_data, value  , 8);
>>>> +    /* Mask */
>>>> +    build_append_int_noprefix(table_data, mask   , 8);
>>>> +}
>>>> +
>>>> +/* ACPI 4.0: 17.4.1 Serialization Action Table */
>>>> +void build_erst(GArray *table_data, BIOSLinker *linker, Object *erst_dev,
>>>> +    const char *oem_id, const char *oem_table_id)
>>>> +{
>>>> +    ERSTDeviceState *s = ACPIERST(erst_dev);
>>>
>>> globals are not welcomed in new code,
>>> pass erst_dev as argument here (ex: find_vmgenid_dev)
>>>    
>>>> +    unsigned action;
>>>> +    unsigned erst_start = table_data->len;
>>>> +
>>>    
>>>> +    s->bar0 = (hwaddr)pci_get_bar_addr(PCI_DEVICE(erst_dev), 0);
>>>> +    trace_acpi_erst_pci_bar_0(s->bar0);
>>>> +    s->bar1 = (hwaddr)pci_get_bar_addr(PCI_DEVICE(erst_dev), 1);
>>>
>>> just store pci_get_bar_addr(PCI_DEVICE(erst_dev), 0) in local variable,
>>> Bar 1 is not used in this function so you don't need it here.
>> Corrected
>>
>>>
>>>    
>>>> +    trace_acpi_erst_pci_bar_1(s->bar1);
>>>> +
>>>> +    acpi_data_push(table_data, sizeof(AcpiTableHeader));
>>>> +    /* serialization_header_length */
>>> comments documenting table entries should be verbatim copy from spec,
>>> see build_amd_iommu() as example of preferred style.
>> Corrected
>>
>>>    
>>>> +    build_append_int_noprefix(table_data, 48, 4);
>>>> +    /* reserved */
>>>> +    build_append_int_noprefix(table_data,  0, 4);
>>>> +    /*
>>>> +     * instruction_entry_count - changes to the number of serialization
>>>> +     * instructions in the ACTIONs below must be reflected in this
>>>> +     * pre-computed value.
>>>> +     */
>>>> +    build_append_int_noprefix(table_data, 29, 4);
>>> a bit fragile as it can easily diverge from actual number later on.
>>> maybe instead of building instruction entries in place, build it
>>> in separate array and when done, use actual count to fill instruction_entry_count.
>>> pseudo code could look like:
>>>
>>>        /* prepare instructions in advance because ... */
>>>        GArray table_instruction_data;
>>>        build_serialization_instruction_entry(table_instruction_data,...);;
>>>        ...
>>>        build_serialization_instruction_entry(table_instruction_data,...);
>>>        /* instructions count */
>>>        build_append_int_noprefix(table_data, table_instruction_data.len/entry_size, 4);
>>>        /* copy prepared in advance instructions */
>>>        g_array_append_vals(table_data, table_instruction_data.data, table_instruction_data.len);
>> Corrected
>>
>>>      
>>>    
>>>> +
>>>> +#define MASK8  0x00000000000000FFUL
>>>> +#define MASK16 0x000000000000FFFFUL
>>>> +#define MASK32 0x00000000FFFFFFFFUL
>>>> +#define MASK64 0xFFFFFFFFFFFFFFFFUL
>>>> +
>>>> +    for (action = 0; action < ACPI_ERST_MAX_ACTIONS; ++action) {
>>> I'd unroll this loop and just directly code entries in required order.
>>> also drop reserved and nop actions/instructions or explain why they are necessary.
>> Unrolled. Dropped the NOP.
> 
> What about 'reserved"?
I dropped Reserved as it was composed of a NOP, and isn't needed either.

> 
>>
>>>    
>>>> +        switch (action) {
>>>> +        case ACPI_ERST_ACTION_BEGIN_WRITE_OPERATION:
>>> given these names will/should never be exposed outside of hw/acpi/erst.c
>>> I'd drop ACPI_ERST_ACTION_/ACPI_ERST_INST_ prefixes (i.e. use names as defined in spec)
>>> if it doesn't cause build issues.
>> These are in include/hw/acpi/erst.h which is included by hw/i386/acpi-build.c,
>> which includes many other hardware files.
>> Removing the prefix leaves a rather generic name.
>> I'd prefer to leave them as it uniquely differentiates.
> is there a reason to put them into erst.h and expose to outside world?
> If not then it might be better to move them into erst.c
I've moved them into erst.c

> 
>>
>>
>>>    
>>>> +            build_serialization_instruction_entry(table_data, action,
>>>> +                ACPI_ERST_INST_WRITE_REGISTER_VALUE, 0, 32,
>>>> +                s->bar0 + ERST_CSR_ACTION, action, MASK8);
>>>> +            break;
>>>> +        case ACPI_ERST_ACTION_BEGIN_READ_OPERATION:
>>>> +            build_serialization_instruction_entry(table_data, action,
>>>> +                ACPI_ERST_INST_WRITE_REGISTER_VALUE, 0, 32,
>>>> +                s->bar0 + ERST_CSR_ACTION, action, MASK8);
>>>> +            break;
>>>> +        case ACPI_ERST_ACTION_BEGIN_CLEAR_OPERATION:
>>>> +            build_serialization_instruction_entry(table_data, action,
>>>> +                ACPI_ERST_INST_WRITE_REGISTER_VALUE, 0, 32,
>>>> +                s->bar0 + ERST_CSR_ACTION, action, MASK8);
>>>> +            break;
>>>> +        case ACPI_ERST_ACTION_END_OPERATION:
>>>> +            build_serialization_instruction_entry(table_data, action,
>>>> +                ACPI_ERST_INST_WRITE_REGISTER_VALUE, 0, 32,
>>>> +                s->bar0 + ERST_CSR_ACTION, action, MASK8);
>>>> +            break;
>>>> +        case ACPI_ERST_ACTION_SET_RECORD_OFFSET:
>>>> +            build_serialization_instruction_entry(table_data, action,
>>>> +                ACPI_ERST_INST_WRITE_REGISTER      , 0, 32,
>>>> +                s->bar0 + ERST_CSR_VALUE , 0, MASK32);
>>>> +            build_serialization_instruction_entry(table_data, action,
>>>> +                ACPI_ERST_INST_WRITE_REGISTER_VALUE, 0, 32,
>>>> +                s->bar0 + ERST_CSR_ACTION, action, MASK8);
>>>> +            break;
>>>> +        case ACPI_ERST_ACTION_EXECUTE_OPERATION:
>>>> +            build_serialization_instruction_entry(table_data, action,
>>>> +                ACPI_ERST_INST_WRITE_REGISTER_VALUE, 0, 32,
>>>> +                s->bar0 + ERST_CSR_VALUE , ERST_EXECUTE_OPERATION_MAGIC, MASK8);
>>>> +            build_serialization_instruction_entry(table_data, action,
>>>> +                ACPI_ERST_INST_WRITE_REGISTER_VALUE, 0, 32,
>>>> +                s->bar0 + ERST_CSR_ACTION, action, MASK8);
>>>> +            break;
>>>> +        case ACPI_ERST_ACTION_CHECK_BUSY_STATUS:
>>>> +            build_serialization_instruction_entry(table_data, action,
>>>> +                ACPI_ERST_INST_WRITE_REGISTER_VALUE, 0, 32,
>>>> +                s->bar0 + ERST_CSR_ACTION, action, MASK8);
>>>> +            build_serialization_instruction_entry(table_data, action,
>>>> +                ACPI_ERST_INST_READ_REGISTER_VALUE , 0, 32,
>>>> +                s->bar0 + ERST_CSR_VALUE, 0x01, MASK8);
>>>> +            break;
>>>> +        case ACPI_ERST_ACTION_GET_COMMAND_STATUS:
>>>> +            build_serialization_instruction_entry(table_data, action,
>>>> +                ACPI_ERST_INST_WRITE_REGISTER_VALUE, 0, 32,
>>>> +                s->bar0 + ERST_CSR_ACTION, action, MASK8);
>>>> +            build_serialization_instruction_entry(table_data, action,
>>>> +                ACPI_ERST_INST_READ_REGISTER       , 0, 32,
>>>> +                s->bar0 + ERST_CSR_VALUE, 0, MASK8);
>>>> +            break;
>>>> +        case ACPI_ERST_ACTION_GET_RECORD_IDENTIFIER:
>>>> +            build_serialization_instruction_entry(table_data, action,
>>>> +                ACPI_ERST_INST_WRITE_REGISTER_VALUE, 0, 32,
>>>> +                s->bar0 + ERST_CSR_ACTION, action, MASK8);
>>>> +            build_serialization_instruction_entry(table_data, action,
>>>> +                ACPI_ERST_INST_READ_REGISTER       , 0, 64,
>>>> +                s->bar0 + ERST_CSR_VALUE, 0, MASK64);
>>>> +            break;
>>>> +        case ACPI_ERST_ACTION_SET_RECORD_IDENTIFIER:
>>>> +            build_serialization_instruction_entry(table_data, action,
>>>> +                ACPI_ERST_INST_WRITE_REGISTER      , 0, 64,
>>>> +                s->bar0 + ERST_CSR_VALUE , 0, MASK64);
>>>> +            build_serialization_instruction_entry(table_data, action,
>>>> +                ACPI_ERST_INST_WRITE_REGISTER_VALUE, 0, 32,
>>>> +                s->bar0 + ERST_CSR_ACTION, action, MASK8);
>>>> +            break;
>>>> +        case ACPI_ERST_ACTION_GET_RECORD_COUNT:
>>>> +            build_serialization_instruction_entry(table_data, action,
>>>> +                ACPI_ERST_INST_WRITE_REGISTER_VALUE, 0, 32,
>>>> +                s->bar0 + ERST_CSR_ACTION, action, MASK8);
>>>> +            build_serialization_instruction_entry(table_data, action,
>>>> +                ACPI_ERST_INST_READ_REGISTER       , 0, 32,
>>>> +                s->bar0 + ERST_CSR_VALUE, 0, MASK32);
>>>> +            break;
>>>> +        case ACPI_ERST_ACTION_BEGIN_DUMMY_WRITE_OPERATION:
>>>> +            build_serialization_instruction_entry(table_data, action,
>>>> +                ACPI_ERST_INST_WRITE_REGISTER_VALUE, 0, 32,
>>>> +                s->bar0 + ERST_CSR_ACTION, action, MASK8);
>>>> +            break;
>>>> +        case ACPI_ERST_ACTION_RESERVED:
>>>> +            build_serialization_instruction_entry(table_data, action,
>>>> +                ACPI_ERST_INST_WRITE_REGISTER_VALUE, 0, 32,
>>>> +                s->bar0 + ERST_CSR_ACTION, action, MASK8);
>>>> +            break;
>>>> +        case ACPI_ERST_ACTION_GET_ERROR_LOG_ADDRESS_RANGE:
>>>> +            build_serialization_instruction_entry(table_data, action,
>>>> +                ACPI_ERST_INST_WRITE_REGISTER_VALUE, 0, 32,
>>>> +                s->bar0 + ERST_CSR_ACTION, action, MASK8);
>>>> +            build_serialization_instruction_entry(table_data, action,
>>>> +                ACPI_ERST_INST_READ_REGISTER       , 0, 64,
>>>> +                s->bar0 + ERST_CSR_VALUE, 0, MASK64);
>>>> +            break;
>>>> +        case ACPI_ERST_ACTION_GET_ERROR_LOG_ADDRESS_LENGTH:
>>>> +            build_serialization_instruction_entry(table_data, action,
>>>> +                ACPI_ERST_INST_WRITE_REGISTER_VALUE, 0, 32,
>>>> +                s->bar0 + ERST_CSR_ACTION, action, MASK8);
>>>> +            build_serialization_instruction_entry(table_data, action,
>>>> +                ACPI_ERST_INST_READ_REGISTER       , 0, 64,
>>>> +                s->bar0 + ERST_CSR_VALUE, 0, MASK32);
>>>> +            break;
>>>> +        case ACPI_ERST_ACTION_GET_ERROR_LOG_ADDRESS_RANGE_ATTRIBUTES:
>>>> +            build_serialization_instruction_entry(table_data, action,
>>>> +                ACPI_ERST_INST_WRITE_REGISTER_VALUE, 0, 32,
>>>> +                s->bar0 + ERST_CSR_ACTION, action, MASK8);
>>>> +            build_serialization_instruction_entry(table_data, action,
>>>> +                ACPI_ERST_INST_READ_REGISTER       , 0, 32,
>>>> +                s->bar0 + ERST_CSR_VALUE, 0, MASK32);
>>>> +            break;
>>>> +        case ACPI_ERST_ACTION_GET_EXECUTE_OPERATION_TIMINGS:
>>>> +            build_serialization_instruction_entry(table_data, action,
>>>> +                ACPI_ERST_INST_WRITE_REGISTER_VALUE, 0, 32,
>>>> +                s->bar0 + ERST_CSR_ACTION, action, MASK8);
>>>> +            build_serialization_instruction_entry(table_data, action,
>>>> +                ACPI_ERST_INST_READ_REGISTER       , 0, 64,
>>>> +                s->bar0 + ERST_CSR_VALUE, 0, MASK64);
>>>> +        default:
>>>> +            build_serialization_instruction_entry(table_data, action,
>>>> +                ACPI_ERST_INST_NOOP, 0, 0, 0, action, 0);
>>>> +            break;
>>>> +        }
>>>> +    }
>>>> +    build_header(linker, table_data,
>>>> +                 (void *)(table_data->data + erst_start),
>>>> +                 "ERST", table_data->len - erst_start,
>>>> +                 1, oem_id, oem_table_id);
>>>> +}
>>>> +
>>>> +/*******************************************************************/
>>>> +/*******************************************************************/
>>>> +
>>>>    static const VMStateDescription erst_vmstate  = {
>>>>        .name = "acpi-erst",
>>>>        .version_id = 1,
>>>    
>>
> 

