Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C19B848FF9D
	for <lists+qemu-devel@lfdr.de>; Mon, 17 Jan 2022 00:20:57 +0100 (CET)
Received: from localhost ([::1]:52528 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n9EpU-0002pE-Ca
	for lists+qemu-devel@lfdr.de; Sun, 16 Jan 2022 18:20:56 -0500
Received: from eggs.gnu.org ([209.51.188.92]:34982)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.kanda@oracle.com>)
 id 1n9Elt-0000dW-AP
 for qemu-devel@nongnu.org; Sun, 16 Jan 2022 18:17:13 -0500
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32]:51466)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.kanda@oracle.com>)
 id 1n9Elq-00013y-Ls
 for qemu-devel@nongnu.org; Sun, 16 Jan 2022 18:17:12 -0500
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 20GBJFAf023002; 
 Sun, 16 Jan 2022 23:17:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=content-type :
 message-id : date : subject : to : references : cc : from : in-reply-to :
 mime-version; s=corp-2021-07-09;
 bh=BJTqwIGtc+tmnFBh3cBtd6WZBAIjImJ+IqqrAbC9+VI=;
 b=b0WMENn2VBtHsd0Gpbga9fmcCNBJT3hjdCYzCJaXJawlVOlcP3ZHigzBuST3kT59X1YT
 X+DPEZdXt5i+CcKbOVYS/xYwX28YLJdeXo/f9s9vZ+Qq5dGU8BIR0mdRoE2dvalWQEoI
 3eaKGSNrgVA8H86ZXERgaldj5g9YP81EqU7i3IzN3WEYOvYmMEUHhKInRAy8PYNZUMm5
 koOhqniF/w39+zVTYLRxvm4/D0R6pBzLBBnuu9cmqePCaa6O48i0wMky0FAd3GDfjHK6
 B+DUhd5xAje969veyg/Fwf9goS0eiyt206rrO30LGm1HF8g8VproEIOF44TXnmRDWa6N 1Q== 
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
 by mx0b-00069f02.pphosted.com with ESMTP id 3dkn22t75f-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Sun, 16 Jan 2022 23:17:07 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
 by userp3020.oracle.com (8.16.1.2/8.16.1.2) with SMTP id 20GNFtmc121107;
 Sun, 16 Jan 2022 23:17:06 GMT
Received: from nam12-bn8-obe.outbound.protection.outlook.com
 (mail-bn8nam12lp2177.outbound.protection.outlook.com [104.47.55.177])
 by userp3020.oracle.com with ESMTP id 3dkqqjxsfj-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Sun, 16 Jan 2022 23:17:05 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cSJGeH08Cxw/SGEPFuvfp4kY0HQjPtQ48sECnOXUydw2Dvunhe0iaZsunxFVH+5AICmvIIGL67oBXujMytumDauQZ5OMkf8VswnCOW/2aOS5XOp43JPpRJ1aAshhvz/O45/9QRyQESl25wlj5XEt2K2v/6d7YBAtG8Fcliyj5NXz9NIxUZTb7SXJpUbC6M/8Wfb5g7JIaP9hku2/Z0JgMpkuXxgOg7Z+NmMT8cHpajt85dHx1+EV3+kPlc7vPfwQotB6+6RGSfMlhAiYYnCHI5/Hg8+SDxOwaa/hPVVkqjbZmUvdXrVCBX2O7toyCEGT8ptqh7mbEQBPHaLD1TZ8eA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BJTqwIGtc+tmnFBh3cBtd6WZBAIjImJ+IqqrAbC9+VI=;
 b=akByLwUHaxcIGY3oscxe3iyDZvQ/bwN1MS3s6Nnw6fkjXd/DO9XBUbXB6DPuMTS31Rt+PTD6tuI/DQD0iD1eCBQDR/9zjzFcDasVE3HMhtkShUeSRO/3cYNrGByjJsBxX/7ETa5v5EfEJrhqFlI3NVPttg80TxUJtyxghMkqpxt7s23JhNOhoqGic7wGQBTXIGk7ceIzAsKmw6fz26W2OKsBZ1/b46I8S4v4Me1oG4Lf5Oj6bmpSFEdmSCsIeEBI+9QuBq+ex8ClLlTJdtl/w3cEyD6XLKjO65Sm4151FAjrSe4xAs3sMHz+J1skh2Qu8QgzYdK6W48yfWxPbOzAhQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BJTqwIGtc+tmnFBh3cBtd6WZBAIjImJ+IqqrAbC9+VI=;
 b=ARXwaVY8oHGTYBnRJFY4xXPKoKfQKBV7QG0l+u2WkO3xL1CIiUERmCcPIO+s8zJfWCuCLnEppYQXmKeNVJaQviYxNchdMYblqvDOz0/UKiBWLbTCf+lYYh/UEDlAJpyu/uqsPoPa9G/65LHXi6I49hlPFlz/e5jstm5KIQN3vck=
Received: from SA1PR10MB5841.namprd10.prod.outlook.com (2603:10b6:806:22b::16)
 by CY4PR10MB1413.namprd10.prod.outlook.com (2603:10b6:903:27::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4888.11; Sun, 16 Jan
 2022 23:17:02 +0000
Received: from SA1PR10MB5841.namprd10.prod.outlook.com
 ([fe80::2511:c3af:9db2:6ba0]) by SA1PR10MB5841.namprd10.prod.outlook.com
 ([fe80::2511:c3af:9db2:6ba0%7]) with mapi id 15.20.4888.013; Sun, 16 Jan 2022
 23:17:02 +0000
Content-Type: multipart/alternative;
 boundary="------------5iye4tHJ3GNF0wlhipbfBAoR"
Message-ID: <9ec3ab32-123f-9076-e0bc-eea5f8e79de9@oracle.com>
Date: Sun, 16 Jan 2022 17:17:00 -0600
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v2 0/3] Support fd-based KVM stats
Content-Language: en-US
To: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel <qemu-devel@nongnu.org>
References: <20211119195153.11815-1-mark.kanda@oracle.com>
 <4f7c1039-a602-fdc1-e5ad-0fab7100a917@redhat.com>
From: Mark Kanda <mark.kanda@oracle.com>
In-Reply-To: <4f7c1039-a602-fdc1-e5ad-0fab7100a917@redhat.com>
X-ClientProxiedBy: SA9PR13CA0161.namprd13.prod.outlook.com
 (2603:10b6:806:28::16) To SA1PR10MB5841.namprd10.prod.outlook.com
 (2603:10b6:806:22b::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e8e53c54-881f-400e-a2b4-08d9d9464db8
X-MS-TrafficTypeDiagnostic: CY4PR10MB1413:EE_
X-Microsoft-Antispam-PRVS: <CY4PR10MB1413DB249DE21E17D8A1BFF7F9569@CY4PR10MB1413.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: HFGE3okzMtF+qm2nniYXowPt8DFRR8P7uiDmhiQXP7ZepjDyqm8N0wixLZI8nR1HhWB0/f1oTu51CX/zMOCktldtcUtfZ6E+AYueUTGeJBX8ugfgdEe89O0Ud2V18EmYQwxI5SKbAmTezlIfxJsbh3Dqq6k3C0MlLLGst6Pcm7iM3pUadb748s4C6MpjckQJwaDWhYulVfAzePDfcKPotjeqMpDLoVhV9JUwdee02V8iAHCrIzqEEr1GCBG7pbDmPvnOIyDgJ+ly7ymC2w2r+44iL9lFebasxBsKwVRva67vQWt03Q6XH4kP2ylZicVqcl37kq3WI9RN7RcgUfWawtiBZtAxZRIiCegDUsL83v/Ye+o3+bbktvJUskm7jt6zerZcgBAUHHgtfGz7SqMWiXmnzvDppCbh3QH5GXAFn4hihUM67p69zWpNOlE8QM45iEbaAW14q69cVYLs9vhmQk5bjn3q6fM6pd60iLPMC/u5tRgzN//u6cBOzWhTfS1TjLq82mM39UkKw3WIqKoqdDdKze8vGmrapyHJtbTsW0YwREFi575TxViXbpxAIJjNL7/KCgR07capFAcbH6GDmUVu4jBYEVJvjGX5VAMSinkWcP9H60TctRTQXFR2DgaHWPWz967BA1Uzbum7gIpwMrhWSmL1jECafl1ypcjPietXV9xj5TwkUqLSC5VMuGagbQtaZMxH4VVaL/htC7xmnBk6mPoU8KYh1jd/kc1zfvsOk/klmsUvB68xsCumfN5BVB+N1Z9t4Wrj4cwllfAxGbVDXbEKPWfj6EuqMqnXtq0fUY7ZIj6DONaW+XxnrBSbGPOKPxbQQThnYJcsFADXE+hrl7nn1jvXuxOJEa9XCXo=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA1PR10MB5841.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(5660300002)(2616005)(316002)(31686004)(83380400001)(44832011)(2906002)(31696002)(53546011)(110136005)(966005)(508600001)(66946007)(66476007)(66556008)(38100700002)(8936002)(36756003)(4326008)(6506007)(8676002)(6512007)(166002)(6486002)(186003)(26005)(33964004)(86362001)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZmFqSlFUTVNZR3FiQlR6SktOTGt3UVNObXdLb1Byc2dTcmVHbmVNeThVTEdV?=
 =?utf-8?B?MFpsYmFEWUJjdFd2YllPa09rOEhlVFRuWVc4R2hzVHp4eHA3RFlncGlVblNT?=
 =?utf-8?B?R2E0U3l3K2lEQi9zblgyMTl1ekk5aDFhbzRDQS9vL0NYUjhHdzlPekNCaHFU?=
 =?utf-8?B?R2FJMFFBSUI5MGVPY3RVRFErMW1wUzMzTFk5MFZXZUd6WWcwK1pYWXhDNXd3?=
 =?utf-8?B?MFVxZlJnYUZJckI5UEhscTRqL212OTJVZ21qQ3F3aUltcWRpRUdHUUxMTFZR?=
 =?utf-8?B?WjcrQXlEVlpjcko2bDlBTVh1Vm9hZHYwT0tKYmVhVTZFTXM4cFE0K2FwZHhI?=
 =?utf-8?B?MGF0MFkvRXJTREZKK1hvbzVkbkk5UGJmS3BBR2hiRXptZmNnMkxGaC83ZUE2?=
 =?utf-8?B?Kyt3R3IrK3QyanpIR3l5aS9aRkZtbXRDUGVORFl2TmRHK3FRV0c2R28rM1Bw?=
 =?utf-8?B?dFJuK09aOGhuVVpJeUl6dTFYRzdMUkIza1NPQ29BbmdYdDBhMm9BMTB4dnNQ?=
 =?utf-8?B?MHlJeStCZWhWLzAvRk5BaG9xWk5BUXBkZ0JYcmFKaHNvbG90UEJLRU5sZFlF?=
 =?utf-8?B?WDhPYkVOTzl1ampEQ0VzRVNOV0ZCVjk1elBmSzlRMmxoTzIrVGxTejN4Wm9r?=
 =?utf-8?B?QXlUeHQxNC9LYTlYYzFtRy94VlcrY2hqTjYxR1YvZk4wVGFKUW1HWlNXK1Ja?=
 =?utf-8?B?UnovT3g3RXlQbTdRcHE0VjdLSE5TRU5zR0YxdjBOMXU1dFJBb3JtV2UvOXB4?=
 =?utf-8?B?c2ZyZjVFUm9KalF3bEYvNDRYNmVLbWJZQ3ovL0N2TWRrM3p5bVNndTlic0wz?=
 =?utf-8?B?VmFBYmMrSXIrN0o5UlNGT1kxRUhQY2dwTWNER1ZUTFBxWGVweGRmbmZxM0ZB?=
 =?utf-8?B?bkRmSWVlaXd5RGQxMWhpcU1BUWRxN2d0SVEyOWFsdCtXMVZrL1o2MjRmbktY?=
 =?utf-8?B?dlBBOXo5RFl1RmtYVFU2WVpObmV5MlZGZEl0Wlp5ZUFjcFB1dmtvWUJVSHFS?=
 =?utf-8?B?Ukptb0lTOU1PK3ZvWGZZZ2R3T1Mrdi9oM29kNVVKbHJ2VUx3ZUdPUnYxRlNE?=
 =?utf-8?B?SUZYbXZXV0ZwK0hQVzZIVjFKT09vcm82U0N3dG4rbS93U3J2WFhhNVUwK1kz?=
 =?utf-8?B?L1NFNWszZGVUWVJuWFlNNUFUbHVUd2FTbDU0b1M3dEVFcDZaM2tQMzZVL3BC?=
 =?utf-8?B?MkI5UURUV1I4WmF3YitnN1lsUHh1ZmlhOUtyellxd2UyR2hmekNpVWF0U0pu?=
 =?utf-8?B?RkdrSlkxb2pwYWdLTUZSR1d6dVlHS0FlR002VTRiRHlKaDNybDByLzVqNk4r?=
 =?utf-8?B?UjVqd1FmcExnMlZHYWNRYTRhSUVaVDM5bGhJR2NSQkhhNEptNm16Qk4wc05n?=
 =?utf-8?B?eGtFMlNlcFpDV0tBRzJmVzBHcHVFSTJiQm5nclhzYUFtaHM2LzZWSU5keUlx?=
 =?utf-8?B?ZjJ3bkFIUytWcEFsVnVvR2tYTnZvd2wreWRWSlZzV0NHRndYdkh0aFo5ODgw?=
 =?utf-8?B?N2lYRjBwb0h3V3JRSm40dUpscFNQVmxXZ0pQais1ZkpmRmwwbTEzcGpOVWUw?=
 =?utf-8?B?djJ1YUpSWXEyTXVtSWRVZlc3M2UwT2dsYmsxTnhaN21Sb2N2Znh1REJBazZM?=
 =?utf-8?B?eHk2MzNGRmlwUEkzTWk5OGJFMzhHTUszSUE2aUNHM2N2T1J5RFpYb0ZUWDN2?=
 =?utf-8?B?L1hnZXFtT1prNEVUOGpkdEdhRnpyUTZnbEdaNlMwd0RmMEJyY3JvaXRWS3hD?=
 =?utf-8?B?amExY1ZRaW5FZnA5Q1lvemo0aCtXd21jaVQwRnc3bDdWZ3dwTTFsdDdHdmZV?=
 =?utf-8?B?WHlYVXozSUc2V21vUzRHdVpwY1lZdHZhK2tEdkY4Rk9ONVhUUVhWYlg1VUxE?=
 =?utf-8?B?R2IyaFVWZHRiZFppVHRpVHlYRmVzUFhVTEV0SmVtVzJ0MTlvVVNZNFVVdnkr?=
 =?utf-8?B?RE00Ri9FKzBXWnlRa1dvdjRsSVFVYXZPdnJnL2FucDhoTHQ1d1FMajZod2ww?=
 =?utf-8?B?Qk1SNFNxK3U0aHdrVmc1aUJwa0RxbWI2NGxrd1NSOTJ3RVlMY2pKMzNYVzZV?=
 =?utf-8?B?TzFINWJHY0tHNmFoUUZkbDRqck56RzVvaWRSWlVEK3M1MGNKVGplNFRVbEtH?=
 =?utf-8?B?YjNpa2xBZ0UxUVVOV0psbjVheVZuOGsvRUhyb0U4enVIcHlFbnkzWXdOM3gr?=
 =?utf-8?Q?QHGuZSuBEQ6kibuCdPiwqiY=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e8e53c54-881f-400e-a2b4-08d9d9464db8
X-MS-Exchange-CrossTenant-AuthSource: SA1PR10MB5841.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jan 2022 23:17:02.5457 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: F7elVuX3k8HCl4iG8U4+HRhMCoKM3ROmnvFSVUK70yGWNPp17pG+2xxCAxYmReRHhc0/jgm801K87D5vN6ZatA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR10MB1413
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10229
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0
 phishscore=0
 mlxlogscore=999 malwarescore=0 bulkscore=0 suspectscore=0 spamscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2110150000 definitions=main-2201160154
X-Proofpoint-GUID: FbfIjz99ba1P65hHZnFwNxBCOT9p0Y44
X-Proofpoint-ORIG-GUID: FbfIjz99ba1P65hHZnFwNxBCOT9p0Y44
Received-SPF: pass client-ip=205.220.177.32;
 envelope-from=mark.kanda@oracle.com; helo=mx0b-00069f02.pphosted.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, HTML_MESSAGE=0.001,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: berrange@redhat.com, armbru@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--------------5iye4tHJ3GNF0wlhipbfBAoR
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

(+ Daniel and Markus)

Thank you Paolo,

I'm in the midst of implementing various API changes as requested by Daniel [1] 
and was planning to send out v3 this week. Could you please take a look at his 
response and comment on the proposal? Or, perhaps I should publish v3 (based on 
Daniel's proposal) and you could review that? Please let me know your preference.

Thanks/regards,
-Mark

[1] https://lore.kernel.org/qemu-devel/Ya+rLex1djU%2F1Wc1@redhat.com/ 
<https://lore.kernel.org/qemu-devel/Ya+rLex1djU%2F1Wc1@redhat.com/>

On 1/15/2022 10:22 AM, Paolo Bonzini wrote:
> On 11/19/21 20:51, Mark Kanda wrote:
>> v2: [Paolo]
>> - generalize the interface
>> - add support for querying stat schema and instances
>> - add additional HMP semantic processing for a few exponent/unit
>>    combinations (related to seconds and bytes)
>>
>> This patchset adds QEMU support for querying fd-based KVM stats. The
>> kernel support was introduced by:
>>
>> cb082bfab59a ("KVM: stats: Add fd-based API to read binary stats data")
>
> Hi Mark,
>
> sorry for the late review.  Fortunately there's very little that I'd change.
>
> In particular:
>
> * please change the callbacks to accept a NULL name and type, instead of 
> having the "bool"/"const char *" pair.  You can probably benefit from a 
> function to cutils.c like
>
>     bool qemu_match_string(const char *value, const char *request) {
>         return !request || g_str_equal(value, request);
>     }
>
> * please pass a single const struct to add_stats_callbacks, using GList so 
> that the struct can be const.
>
> Putting both together it would be something like:
>
> typedef struct StatsCallbacks {
>     char *name;
>     StatsList *(*get_values)(StatsList *list, const char *name,
>                            const char *type, Error **errp);
>     StatsSchemaList *(*get_schemas)(StatsSchemaList *list,
>                                     const char *name, Error **errp);
>     StatsInstanceList *(*get_instances)(StatsInstanceList *list,
>                                         Error **errp);
> } StatsCallbacks;
>
> Finally, please put everything in a new header include/monitor/stats.h, so 
> that we can document everything and please it in docs/devel.  I can take care 
> of that though.
>
> Thanks,
>
> Paolo
>
>>
>> Mark Kanda (3):
>>    qmp: Support for querying stats
>>    hmp: Support for querying stats
>>    kvm: Support for querying fd-based stats
>>
>>   accel/kvm/kvm-all.c       | 399 ++++++++++++++++++++++++++++++++++++++
>>   hmp-commands-info.hx      |  40 ++++
>>   include/monitor/hmp.h     |   3 +
>>   include/monitor/monitor.h |  27 +++
>>   monitor/hmp-cmds.c        | 125 ++++++++++++
>>   monitor/qmp-cmds.c        |  71 +++++++
>>   qapi/misc.json            | 142 ++++++++++++++
>>   7 files changed, 807 insertions(+)
>>
>

--------------5iye4tHJ3GNF0wlhipbfBAoR
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 8bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    (+ Daniel and Markus)<br>
    <br>
    <span style="color: rgb(34, 34, 34); font-family: Arial, Helvetica,
      sans-serif; font-size: small; font-style: normal;
      font-variant-ligatures: normal; font-variant-caps: normal;
      font-weight: 400; letter-spacing: normal; orphans: 2; text-align:
      start; text-indent: 0px; text-transform: none; white-space:
      normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width:
      0px; background-color: rgb(255, 255, 255);
      text-decoration-thickness: initial; text-decoration-style:
      initial; text-decoration-color: initial; display: inline
      !important; float: none;">Thank you Paolo,</span>
    <div style="color: rgb(34, 34, 34); font-family: Arial, Helvetica,
      sans-serif; font-size: small; font-style: normal;
      font-variant-ligatures: normal; font-variant-caps: normal;
      font-weight: 400; letter-spacing: normal; orphans: 2; text-align:
      start; text-indent: 0px; text-transform: none; white-space:
      normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width:
      0px; text-decoration-thickness: initial; text-decoration-style:
      initial; text-decoration-color: initial;"><br>
    </div>
    <div style="color: rgb(34, 34, 34); font-family: Arial, Helvetica,
      sans-serif; font-size: small; font-style: normal;
      font-variant-ligatures: normal; font-variant-caps: normal;
      font-weight: 400; letter-spacing: normal; orphans: 2; text-align:
      start; text-indent: 0px; text-transform: none; white-space:
      normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width:
      0px; text-decoration-thickness: initial; text-decoration-style:
      initial; text-decoration-color: initial;">I'm in the midst of
      implementing various API changes as requested by Daniel [1] and
      was planning to send out v3 this week. Could you please take a
      look at his response and comment on the proposal? Or, perhaps I
      should publish v3 (based on Daniel's proposal) and you could
      review that? Please let me know your preference.</div>
    <div style="color: rgb(34, 34, 34); font-family: Arial, Helvetica,
      sans-serif; font-size: small; font-style: normal;
      font-variant-ligatures: normal; font-variant-caps: normal;
      font-weight: 400; letter-spacing: normal; orphans: 2; text-align:
      start; text-indent: 0px; text-transform: none; white-space:
      normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width:
      0px; text-decoration-thickness: initial; text-decoration-style:
      initial; text-decoration-color: initial;"><br>
    </div>
    <div style="color: rgb(34, 34, 34); font-family: Arial, Helvetica,
      sans-serif; font-size: small; font-style: normal;
      font-variant-ligatures: normal; font-variant-caps: normal;
      font-weight: 400; letter-spacing: normal; orphans: 2; text-align:
      start; text-indent: 0px; text-transform: none; white-space:
      normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width:
      0px; text-decoration-thickness: initial; text-decoration-style:
      initial; text-decoration-color: initial;">Thanks/regards,</div>
    <div style="color: rgb(34, 34, 34); font-family: Arial, Helvetica,
      sans-serif; font-size: small; font-style: normal;
      font-variant-ligatures: normal; font-variant-caps: normal;
      font-weight: 400; letter-spacing: normal; orphans: 2; text-align:
      start; text-indent: 0px; text-transform: none; white-space:
      normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width:
      0px; text-decoration-thickness: initial; text-decoration-style:
      initial; text-decoration-color: initial;">-Mark</div>
    <div style="color: rgb(34, 34, 34); font-family: Arial, Helvetica,
      sans-serif; font-size: small; font-style: normal;
      font-variant-ligatures: normal; font-variant-caps: normal;
      font-weight: 400; letter-spacing: normal; orphans: 2; text-align:
      start; text-indent: 0px; text-transform: none; white-space:
      normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width:
      0px; text-decoration-thickness: initial; text-decoration-style:
      initial; text-decoration-color: initial;"><br>
    </div>
    <div style="color: rgb(34, 34, 34); font-family: Arial, Helvetica,
      sans-serif; font-size: small; font-style: normal;
      font-variant-ligatures: normal; font-variant-caps: normal;
      font-weight: 400; letter-spacing: normal; orphans: 2; text-align:
      start; text-indent: 0px; text-transform: none; white-space:
      normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width:
      0px; text-decoration-thickness: initial; text-decoration-style:
      initial; text-decoration-color: initial;">[1]&nbsp;<a href="https://lore.kernel.org/qemu-devel/Ya+rLex1djU%2F1Wc1@redhat.com/" target="_blank" data-saferedirecturl="https://www.google.com/url?q=https://lore.kernel.org/qemu-devel/Ya%2BrLex1djU%252F1Wc1@redhat.com/&amp;source=gmail&amp;ust=1642460896463000&amp;usg=AOvVaw0D2LwOvmQYkFvuqDwz50sQ" style="color: rgb(17, 85, 204);" moz-do-not-send="true">https://lore.kernel.org/<wbr>qemu-devel/Ya+rLex1djU%2F1Wc1@<wbr>redhat.com/</a></div>
    <br>
    <div class="moz-cite-prefix">On 1/15/2022 10:22 AM, Paolo Bonzini
      wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:4f7c1039-a602-fdc1-e5ad-0fab7100a917@redhat.com">On
      11/19/21 20:51, Mark Kanda wrote:
      <br>
      <blockquote type="cite">v2: [Paolo]
        <br>
        - generalize the interface
        <br>
        - add support for querying stat schema and instances
        <br>
        - add additional HMP semantic processing for a few exponent/unit
        <br>
        &nbsp;&nbsp; combinations (related to seconds and bytes)
        <br>
        <br>
        This patchset adds QEMU support for querying fd-based KVM stats.
        The
        <br>
        kernel support was introduced by:
        <br>
        <br>
        cb082bfab59a (&quot;KVM: stats: Add fd-based API to read binary stats
        data&quot;)
        <br>
      </blockquote>
      <br>
      Hi Mark,
      <br>
      <br>
      sorry for the late review.&nbsp; Fortunately there's very little that
      I'd change.
      <br>
      <br>
      In particular:
      <br>
      <br>
      * please change the callbacks to accept a NULL name and type,
      instead of having the &quot;bool&quot;/&quot;const char *&quot; pair.&nbsp; You can
      probably benefit from a function to cutils.c like
      <br>
      <br>
      &nbsp;&nbsp;&nbsp; bool qemu_match_string(const char *value, const char *request)
      {
      <br>
      &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return !request || g_str_equal(value, request);
      <br>
      &nbsp;&nbsp;&nbsp; }
      <br>
      <br>
      * please pass a single const struct to add_stats_callbacks, using
      GList so that the struct can be const.
      <br>
      <br>
      Putting both together it would be something like:
      <br>
      <br>
      typedef struct StatsCallbacks {
      <br>
      &nbsp;&nbsp;&nbsp; char *name;
      <br>
      &nbsp;&nbsp;&nbsp; StatsList *(*get_values)(StatsList *list, const char *name,
      <br>
      &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; const char *type, Error **errp);
      <br>
      &nbsp;&nbsp;&nbsp; StatsSchemaList *(*get_schemas)(StatsSchemaList *list,
      <br>
      &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; const char *name, Error
      **errp);
      <br>
      &nbsp;&nbsp;&nbsp; StatsInstanceList *(*get_instances)(StatsInstanceList *list,
      <br>
      &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Error **errp);
      <br>
      } StatsCallbacks;
      <br>
      <br>
      Finally, please put everything in a new header
      include/monitor/stats.h, so that we can document everything and
      please it in docs/devel.&nbsp; I can take care of that though.
      <br>
      <br>
      Thanks,
      <br>
      <br>
      Paolo
      <br>
      <br>
      <blockquote type="cite">
        <br>
        Mark Kanda (3):
        <br>
        &nbsp;&nbsp; qmp: Support for querying stats
        <br>
        &nbsp;&nbsp; hmp: Support for querying stats
        <br>
        &nbsp;&nbsp; kvm: Support for querying fd-based stats
        <br>
        <br>
        &nbsp; accel/kvm/kvm-all.c&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | 399
        ++++++++++++++++++++++++++++++++++++++
        <br>
        &nbsp; hmp-commands-info.hx&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |&nbsp; 40 ++++
        <br>
        &nbsp; include/monitor/hmp.h&nbsp;&nbsp;&nbsp;&nbsp; |&nbsp;&nbsp; 3 +
        <br>
        &nbsp; include/monitor/monitor.h |&nbsp; 27 +++
        <br>
        &nbsp; monitor/hmp-cmds.c&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | 125 ++++++++++++
        <br>
        &nbsp; monitor/qmp-cmds.c&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |&nbsp; 71 +++++++
        <br>
        &nbsp; qapi/misc.json&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | 142 ++++++++++++++
        <br>
        &nbsp; 7 files changed, 807 insertions(+)
        <br>
        <br>
      </blockquote>
      <br>
    </blockquote>
    <br>
  </body>
</html>

--------------5iye4tHJ3GNF0wlhipbfBAoR--

