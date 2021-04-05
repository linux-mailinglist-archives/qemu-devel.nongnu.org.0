Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DFC1C35474E
	for <lists+qemu-devel@lfdr.de>; Mon,  5 Apr 2021 22:03:15 +0200 (CEST)
Received: from localhost ([::1]:36030 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lTVRK-000832-WD
	for lists+qemu-devel@lfdr.de; Mon, 05 Apr 2021 16:03:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60344)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dongli.zhang@oracle.com>)
 id 1lTVPK-0007Mc-HO; Mon, 05 Apr 2021 16:01:10 -0400
Received: from aserp2120.oracle.com ([141.146.126.78]:50588)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dongli.zhang@oracle.com>)
 id 1lTVPG-0005k1-LL; Mon, 05 Apr 2021 16:01:10 -0400
Received: from pps.filterd (aserp2120.oracle.com [127.0.0.1])
 by aserp2120.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 135Js2Z3058749;
 Mon, 5 Apr 2021 20:00:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=subject : to : cc :
 references : from : message-id : date : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=corp-2020-01-29;
 bh=0rFNH9BxQ5ZyF4rBNdVWOPjYUBMMb14b0F+YzGDbMYA=;
 b=zJhD0xfzRIw5a5oQd5aTsLe6pS/h/lSk/cpEJ2WAKfDW0xMG0QgCynoGpHVHMs/3hlDd
 nkqh8QV1nf+sjLHvRCn1VgdBTlkqd5JW/mBwKcFEeoF8h8ifWlrXwdTYsmSEwP9hI76f
 Wzqp0ihwccTYp5seOyY4v3OkNdVne123+EuKve8LPA31qhWrxdLtn20e/iZH7EqZbfuY
 EKLLzYijGUtLg2OwOW0zL1qu4bE452FlNeTchKYESks3nkwltuQ6KiHN7ZjZdxebnoja
 yVPcyCSsC8BKbigudI2YL1sbFLYDbgs/VJFxKj6wwYrpZJ3RFdY5B871g75ETUIDk29T XQ== 
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
 by aserp2120.oracle.com with ESMTP id 37q3bwk79p-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 05 Apr 2021 20:00:46 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
 by aserp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 135JtBaP047092;
 Mon, 5 Apr 2021 20:00:46 GMT
Received: from nam11-bn8-obe.outbound.protection.outlook.com
 (mail-bn8nam11lp2174.outbound.protection.outlook.com [104.47.58.174])
 by aserp3020.oracle.com with ESMTP id 37q2pwnayu-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 05 Apr 2021 20:00:45 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ljB+gdHwMHu4UyyJlCnHpO9vSnLvPkvZ3fLyGz6FzaBVHechX7jklobc6KG7lsd5mAFKsLLeGvPbsd0+0Iq/an0Vqa/Xd4WcRoyqA3MsMvOaRm7hea8fiRRvnsdEBshld8s31mYoTyMljwdHjF3iZEc2jPx9TQMN7Sa031Pbzz23Nqwf2TzKf3PzhIwPyBdcXWLT+YkkXxAcCJSdnHb5L6H2mrqPjsAfWXcgrp6JbVfiKyS7XvW8uWIts2CyOsu50Gnd9b06U27LCkt97jfIVgnURGE1VnGinAou9oFGMb0lNCW0Z4Nlwgz8CHT3sUuwvYFuqoEYDFsNeSyx+xcCqg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0rFNH9BxQ5ZyF4rBNdVWOPjYUBMMb14b0F+YzGDbMYA=;
 b=jpOaAcQdivBDU/XPVZAvDt6JRcpApuo6CqCv5YRh1BYQuIdU29WMpvt9A7lKKsdaOvRBudjkGlYGtjE5gfkzrqZ21PmsO+QQsEkYNtBFfj5Eofo6Ta7iI4V5fykpMJjFgipFT/l38NEUE9ckpWfHsjrMDgwC0cgDCdhkPlHJoDdvLHNwxcilJqeZ2mr6GPnqNo8S6yNMdmh5J9mKga3gbMVywk1lH6hN/BpOxFlUhjZhicNVOcr5EMH/mEq8SIDtrvKMG4iNq/bvkvNdtXGi5YZxJbtRxqk4BUY2IfNdd5911oXpqzLkTyiKqNlmBlCwRuX+zgK7ARMF8LJSm1+guw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0rFNH9BxQ5ZyF4rBNdVWOPjYUBMMb14b0F+YzGDbMYA=;
 b=N+0KdJFfchoMm6RydbOkbjY0tQ73259qXRVpuiXeW0M4q63ge9WidyZC4Hvl8lDOX4TOc5dzP6SSqhZnIJ1M6KHTtJl0Am0L4i0BekNzcXaMlgWemq63kHmxLK7PgLEqSwaYlDnudLm7y2yVFaVU4C1ahYZJJMRK6qZsyWKjGyk=
Authentication-Results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=oracle.com;
Received: from BYAPR10MB2663.namprd10.prod.outlook.com (2603:10b6:a02:a9::20)
 by BY5PR10MB4371.namprd10.prod.outlook.com (2603:10b6:a03:210::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3999.27; Mon, 5 Apr
 2021 20:00:43 +0000
Received: from BYAPR10MB2663.namprd10.prod.outlook.com
 ([fe80::44f7:1d8f:cc50:48ad]) by BYAPR10MB2663.namprd10.prod.outlook.com
 ([fe80::44f7:1d8f:cc50:48ad%6]) with mapi id 15.20.3999.032; Mon, 5 Apr 2021
 20:00:43 +0000
Subject: Re: [PATCH 0/6] Add debug interface to kick/call on purpose
To: Jason Wang <jasowang@redhat.com>, qemu-block@nongnu.org,
 qemu-devel@nongnu.org
References: <20210326054433.11762-1-dongli.zhang@oracle.com>
 <440216a8-821f-92dd-bc8b-fb2427bdc0e6@redhat.com>
 <d5549b12-d269-a04d-01d2-2dbd1ee7fca0@oracle.com>
 <ceb1f31a-e353-2542-a516-68b49735672c@redhat.com>
 <9248ae00-9a7d-c960-a673-9b3a3ede0452@oracle.com>
 <da0ae46e-da09-5894-21d4-732e5e20d070@redhat.com>
From: Dongli Zhang <dongli.zhang@oracle.com>
Message-ID: <2e48f463-0a17-4ffd-c3a6-4a847e0e34c6@oracle.com>
Date: Mon, 5 Apr 2021 13:00:40 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
In-Reply-To: <da0ae46e-da09-5894-21d4-732e5e20d070@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Originating-IP: [2601:646:c303:6700::d22a]
X-ClientProxiedBy: SJ0PR13CA0231.namprd13.prod.outlook.com
 (2603:10b6:a03:2c1::26) To BYAPR10MB2663.namprd10.prod.outlook.com
 (2603:10b6:a02:a9::20)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2601:646:c303:6700::d22a] (2601:646:c303:6700::d22a) by
 SJ0PR13CA0231.namprd13.prod.outlook.com (2603:10b6:a03:2c1::26) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4020.9 via Frontend
 Transport; Mon, 5 Apr 2021 20:00:41 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 9a8a1f64-726d-435e-6c6c-08d8f86d7e24
X-MS-TrafficTypeDiagnostic: BY5PR10MB4371:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BY5PR10MB43718B086F7C103F86F2CB8CF0779@BY5PR10MB4371.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: hz1G6giMm2LK4gEyHxn7j5b3amxWaKfTh0G19qGsagivVAPFwss7E9J26wQGdohQyA2dWXTCPGKOmK3bvpgS4K7Q9lc2dQTFe6uOQhFDCIDDr2Ut/jDkM/cawKynLFfkOMm6FYz+3ParXaX3WMwXX/EkzF0lYlYExGuXZrXjXgJGRqmrw1R1e/mtmEz7jIMUHbu7OpNhiikOMZu4KpJii62UouTKWfnFiY8FJFtqiMSXsSqCiatbaoS+CpcxnRnqzfRnKyzNKCiD4xg4rYN37k5RH/hDTtEjKLwFjdyViVuWGwTDpyrq25rSevofhDTxUYcc35U61lhJ5/3AhO9CF3Eer4xzPUcfIf3cktBEG+yrIYHIuu1FOBRhH3u0bAEPYlGQr8L3MbEDtYLwMWtB/W7Lko6qLWesC/Ly5NpgkuUgHdRssniMwW2bl1ffDDmwBE9zObSrj8e4ojJO5GeL5oXR+9gMwrAusGnze/yhhMwCOhiAwXqbReIfOEGknXmXCfJf2Y3qtDeotA/eKIduZ+578JCfcGJi2pzvMQF2AyXkVR17ZsVSLWbbU0m/NzgB9ohoSnFVOi1MWtiVCmjhAmO+9bddGTdyJTGoky+XBR5PY5bOiECQMbB80tJQ3JR0e9SKO4Eow8tfFrf7aot2B4AtvaRnVCv9U/UqgjtnkPe+olUadKjhEOvp506Xk4XFnlNjN8+V1WpsDdcWBL7TYNafhSy15itlzdApn6xnbLXBfeTbZsC3CelzaqsyufIphCMEWIqvWT6xwY3MbLHMdP6PL3sgxwL2TmpWujEIJJVLr7KcvFUSMKMXtMv5C30q
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR10MB2663.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(346002)(396003)(136003)(376002)(39860400002)(478600001)(83380400001)(966005)(6486002)(38100700001)(86362001)(31686004)(7416002)(8676002)(2616005)(44832011)(4326008)(31696002)(16526019)(186003)(30864003)(5660300002)(53546011)(66946007)(36756003)(8936002)(66556008)(66476007)(316002)(2906002)(21314003)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?WTkrYWVDSXN1K1BJSHpBS2dMYXBVNG1ac3hZTzUyMUNjT1lXVWJjMS9VUXU0?=
 =?utf-8?B?MEVDeUJyRmZKa2E3azNnSkt2S0dWeGFBWVZKd0t5U0UyTTBVZFhaek5VWXBX?=
 =?utf-8?B?c1RHUzVhMEFaeHlqODBsd2QySnNyOXVMSjd4cXMyd2c5R1VQSGlqZ0FkUFM5?=
 =?utf-8?B?c1hXNHdsdkF4UjNhSzZBRWdvSGRVcjdQNnVLd3B2Kytib0tWTVkwY2hHa0xz?=
 =?utf-8?B?dXpVOXlid3FEWEVKT01MK08vSEN3OGw3WlpwM2ZFeDd2dUFZNWw0NGFxa2da?=
 =?utf-8?B?UVhHTkQwSVdwemI2QVFBbGxJLzJFOGhYZzNIQml5S3NVdjl2cGZ2OVVZWUpZ?=
 =?utf-8?B?bWIwT0x4Y1EwK1Y4QW5KZGxLR1NSRFErTUNzeTJRYUhpcDJpb2oxYTB2Qk1B?=
 =?utf-8?B?K2dUMXArVDdvdGlHTitqSVNGU3dlUWFjSjlhcVZQZi9oWnhYbDdoRUVObTNu?=
 =?utf-8?B?UmpIMGJpTkZ5QUV0MDN1RFZrSWdCS1RXcEdaZFVHa1p5cnlobEFsYXpDQ3lp?=
 =?utf-8?B?MzB2R2tFdVVVWnBULzJ1UkMzVzBJUjN3RVp4WmRaaW1WTTNFNnNhMFJMcVVS?=
 =?utf-8?B?ZHA5NEplS0Vrc1ZhbGZxNW5UWUpkZXdVV1lKZDRNOTRieUdrVEs4NTlyQ0lV?=
 =?utf-8?B?YjMzWHQ1ZGZSdHRJSXJGcEVIbkZGcnd2TU9WbDg1S204MVltQ0lPMHcrMHY4?=
 =?utf-8?B?TkphcTVVVjY2c1F3a3hqMzB0aHBnTTYzL0RQRVpscnU1SnU4NDl4YVZhZVk5?=
 =?utf-8?B?L1pDcVNMNlhZdm0rSVc3RTc1YmxrbkpZMGdHYXN6ejcxSmcvTUZacWFlS1Rz?=
 =?utf-8?B?Y1EwZUhnV1dWWUpPeE52YkROaXdWeUdHQWM5ZGRocnRKWkJTL2JFRXFlTWdh?=
 =?utf-8?B?N204TExzWHNndExrWDJsZUFLQnZLRlJ1MXptYXBLeEprTEc4UE1wSFVxTHR4?=
 =?utf-8?B?K3ZqYURVcjZTcVRnZFkrNi9aamk3dTFUaWkxZ3ZOZG5CRlZSeVNZSnZTSjBO?=
 =?utf-8?B?dGdCT3MrWHVQME5aQ1pRSVJJSDZxamlxc1Fqd2dYS0RMM1dHYllFTGpwUXVP?=
 =?utf-8?B?b2FkYURDNXdHdzlLTGxrOUw1SVU4YXJ0cE9rUkJ4NWVPekNUVWFjRHZTNFlo?=
 =?utf-8?B?VnVsWWxSQXAwb0VmRzl4c2kybVVZbWptR2sxVzJFMUYzQkZpREp6U3ByT01K?=
 =?utf-8?B?clNISDZDVmtSVlpzMm43bkFPRXJ3YWdBOEFnN0FYRC83WUplNklOMktzZmNy?=
 =?utf-8?B?VzBFa0xLbVdPV3dadFJwd2gvN0FKRHRZNFZjUmdVRGFkalBqRU92MnhHN3Z6?=
 =?utf-8?B?RzAyV1BFREZWOHdsUURQZ2dMS0dLR0d1ckxTU3daS2JYUWRqRnJkNjhTb1lL?=
 =?utf-8?B?REZwYS9LNWtGOUtRR3NCaDZMZmZ4cjdZanlLaCtCRUhiTmdqRFAyRHhtd2Vs?=
 =?utf-8?B?TjFnb3dLcENDYTlPRUZXdTdXbERsdUZPeDlTWDBUbHdCSE5jRlpwWUdYa0Z0?=
 =?utf-8?B?Y0lDMFZuN0ovU1JIQkQrUS9tbGJzSmVZU0ZqVFVIZ25SSzczSDRNNUJLZDk4?=
 =?utf-8?B?eHFXMEpKQ3JLekRlUWwvWXlQYzc3dVNxcEZZNlRlZytjRW5YZDZhdDNtb0sz?=
 =?utf-8?B?ZDNsL3JIYVdxUXJxNzYrbVNrNldrUFlXZ1VWWWJjZHMrbEZmTThPSU9hUThW?=
 =?utf-8?B?YndRWnB4TERkY0c5QVJsL29RelI1Z0ZRMmVxUjlhRU5xZWhnZnUzTXZMT1Mw?=
 =?utf-8?B?WEVhWXEvNTBZSmJ3dzVJeG1JVEZZWk85UHhHUUpWUE4yUkt1SDJVQjRUQjdB?=
 =?utf-8?B?UU53TGJCand0a1ZocHVhUT09?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9a8a1f64-726d-435e-6c6c-08d8f86d7e24
X-MS-Exchange-CrossTenant-AuthSource: BYAPR10MB2663.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Apr 2021 20:00:43.1810 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Tf1RVOQB1pc0GHknePlwBfIJm1c3bQkK4r6Cir7C+OgeeIClayYPTwXOU/E0mLerGxH4aCYE8aI6YeSfqKD/yA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR10MB4371
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9945
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0
 suspectscore=0
 adultscore=0 spamscore=0 bulkscore=0 mlxlogscore=999 phishscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104030000 definitions=main-2104050129
X-Proofpoint-GUID: 5dxDiejs7IKz9R0xPFheYhglQ9nj0X4a
X-Proofpoint-ORIG-GUID: 5dxDiejs7IKz9R0xPFheYhglQ9nj0X4a
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9945
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999
 spamscore=0
 lowpriorityscore=0 suspectscore=0 adultscore=0 phishscore=0 mlxscore=0
 priorityscore=1501 clxscore=1015 impostorscore=0 bulkscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104030000 definitions=main-2104050129
Received-SPF: pass client-ip=141.146.126.78;
 envelope-from=dongli.zhang@oracle.com; helo=aserp2120.oracle.com
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
Cc: kwolf@redhat.com, fam@euphon.net, berrange@redhat.com, ehabkost@redhat.com,
 mst@redhat.com, joe.jin@oracle.com, armbru@redhat.com, dgilbert@redhat.com,
 stefanha@redhat.com, pbonzini@redhat.com, mreitz@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On 4/1/21 8:47 PM, Jason Wang wrote:
> 
> 在 2021/3/30 下午3:29, Dongli Zhang 写道:
>>
>> On 3/28/21 8:56 PM, Jason Wang wrote:
>>> 在 2021/3/27 上午5:16, Dongli Zhang 写道:
>>>> Hi Jason,
>>>>
>>>> On 3/26/21 12:24 AM, Jason Wang wrote:
>>>>> 在 2021/3/26 下午1:44, Dongli Zhang 写道:
>>>>>> The virtio device/driver (e.g., vhost-scsi or vhost-net) may hang due to
>>>>>> the loss of doorbell kick, e.g.,
>>>>>>
>>>>>> https://urldefense.com/v3/__https://lists.gnu.org/archive/html/qemu-devel/2018-12/msg01711.html__;!!GqivPVa7Brio!KS3pAU2cKjz4wgI4QSlE-YsJPhPG71nkE5_tGhaOf7mi_xvNxbvKkfn03rk5BNDLSEU$
>>>>>>
>>>>>>
>>>>>>
>>>>>> ... or due to the loss of IRQ, e.g., as fixed by linux kernel commit
>>>>>> fe200ae48ef5 ("genirq: Mark polled irqs and defer the real handler").
>>>>>>
>>>>>> This patch introduces a new debug interface 'DeviceEvent' to DeviceClass
>>>>>> to help narrow down if the issue is due to loss of irq/kick. So far the new
>>>>>> interface handles only two events: 'call' and 'kick'. Any device (e.g.,
>>>>>> virtio/vhost or VFIO) may implement the interface (e.g., via eventfd, MSI-X
>>>>>> or legacy IRQ).
>>>>>>
>>>>>> The 'call' is to inject irq on purpose by admin for a specific device (e.g.,
>>>>>> vhost-scsi) from QEMU/host to VM, while the 'kick' is to kick the doorbell
>>>>>> on purpose by admin at QEMU/host side for a specific device.
>>>>>>
>>>>>>
>>>>>> This device can be used as a workaround if call/kick is lost due to
>>>>>> virtualization software (e.g., kernel or QEMU) issue.
>>>>>>
>>>>>> We may also implement the interface for VFIO PCI, e.g., to write to
>>>>>> VFIOPCIDevice->msi_vectors[i].interrupt will be able to inject IRQ to VM
>>>>>> on purpose. This is considered future work once the virtio part is done.
>>>>>>
>>>>>>
>>>>>> Below is from live crash analysis. Initially, the queue=2 has count=15 for
>>>>>> 'kick' eventfd_ctx. Suppose there is data in vring avail while there is no
>>>>>> used available. We suspect this is because vhost-scsi was not notified by
>>>>>> VM. In order to narrow down and analyze the issue, we use live crash to
>>>>>> dump the current counter of eventfd for queue=2.
>>>>>>
>>>>>> crash> eventfd_ctx ffff8f67f6bbe700
>>>>>> struct eventfd_ctx {
>>>>>>      kref = {
>>>>>>        refcount = {
>>>>>>          refs = {
>>>>>>            counter = 4
>>>>>>          }
>>>>>>        }
>>>>>>      },
>>>>>>      wqh = {
>>>>>>        lock = {
>>>>>>          {
>>>>>>            rlock = {
>>>>>>              raw_lock = {
>>>>>>                val = {
>>>>>>                  counter = 0
>>>>>>                }
>>>>>>              }
>>>>>>            }
>>>>>>          }
>>>>>>        },
>>>>>>        head = {
>>>>>>          next = 0xffff8f841dc08e18,
>>>>>>          prev = 0xffff8f841dc08e18
>>>>>>        }
>>>>>>      },
>>>>>>      count = 15, ---> eventfd is 15 !!!
>>>>>>      flags = 526336
>>>>>> }
>>>>>>
>>>>>> Now we kick the doorbell for vhost-scsi queue=2 on purpose for diagnostic
>>>>>> with this interface.
>>>>>>
>>>>>> { "execute": "x-debug-device-event",
>>>>>>      "arguments": { "dev": "/machine/peripheral/vscsi0",
>>>>>>                     "event": "kick", "queue": 2 } }
>>>>>>
>>>>>> The counter is increased to 16. Suppose the hang issue is resolved, it
>>>>>> indicates something bad is in software that the 'kick' is lost.
>>>>> What do you mean by "software" here? And it looks to me you're testing whether
>>>>> event_notifier_set() is called by virtio_queue_notify() here. If so, I'm not
>>>>> sure how much value could we gain from a dedicated debug interface like this
>>>>> consider there're a lot of exisinting general purpose debugging method like
>>>>> tracing or gdb. I'd say the path from virtio_queue_notify() to
>>>>> event_notifier_set() is only a very small fraction of the process of virtqueue
>>>>> kick which is unlikey to be buggy. Consider usually the ioeventfd will be
>>>>> offloaded to KVM, it's more a chance that something is wrong in setuping
>>>>> ioeventfd instead of here. Irq is even more complicated.
>>>> Thank you very much!
>>>>
>>>> I am not testing whether event_notifier_set() is called by
>>>> virtio_queue_notify().
>>>>
>>>> The 'software' indicates the data processing and event notification mechanism
>>>> involved with virtio/vhost PV driver frontend. E.g., while VM is waiting for an
>>>> extra IRQ, vhost side did not trigger IRQ, suppose vring_need_event()
>>>> erroneously returns false due to corrupted ring buffer status.
>>>
>>> So there could be several factors that may block the notification:
>>>
>>> 1) eventfd bug (ioeventfd vs irqfd)
>>> 2) wrong virtqueue state (either driver or device)
>>> 3) missing barriers (either driver or device)
>>> 4) Qemu bug (irqchip and routing)
>>> ...
>> This is not only about whether notification is blocked.
>>
>> It can also be used to help narrow down and understand if there is any
>> suspicious issue in blk-mq/scsi/netdev/napi code. The PV drivers are not only
>> drivers following virtio spec. It is closely related to many of other kernel
>> components.
>>
>> Suppose IO was recovered after we inject an IRQ to vhost-scsi on purpose, we
>> will be able to analyze what may happen along the IO completion path starting
>> from when /where the IRQ is injected ... perhaps the root cause is not with
>> virtio but blk-mq/scsi (this is just an example).
>>
>>
>> In addition, this idea should help for vfio-pci. Suppose the developer for a
>> specific device driver suspects IO/networking hangs because of loss if IRQ, we
>> will be able to verify if that assumption is correct by injecting an IRQ on
>> purpose.
>>
>> Therefore, this is not only about virtio PV driver (frontend/backend), but also
>> used to help analyze the issue related to entire IO/networking/passthrough
>> virtualization stacks, especially in production env where the issue can only be
>> reproduced randomly.
> 
> 
> So it looks to me you'd better having things like this in the EventNotifier
> layer and introduce qmp commands to write/read that instead of starting with a
> virtio specific commands. Or it might be even helpful to start from some
> counters for event notifiers which could be accessed via monitor to help to for
> debugging to start with which is much more safe in the environment of
> production. Having artifical events are always dangerous.


The EventNotifier is just fd used by different QEMU components. There is not a
way to track each EventNotifier used by a QEMU process so that I do not think we
are able to track at EventNotifier layer, unless we add extra code to track the
init/uninit of each eventfd, or modify kernel.

That's try I introduced "DeviceEvent event" to "struct DeviceClass" so that each
device type will be able to customize its own way to track its eventfd list.


Would you prefer "write to a specific eventfd for a specific QEMU device",
instead of "kick/call for a specific device"?


> 
> 
>>
>>> Consider we want to debug virtio issue, only 2) or 3) is what we really cared>
>>> So for kick you did (assume vhost is on):
>>>
>>> virtio_device_event_kick()
>>>      virtio_queue_notify()
>>>          event_notifier_set()
>>>
>>> It looks to me you're actaully testing if ioeventfd is correctly set by Qemu.
>>>
>>> For call you did:
>>>
>>> virtio_device_event_call()
>>>      event_notifier_set()
>>>
>>> A test of irqfd is correctly set by Qemu. So all of those are not virtio
>>> specific stuffs but you introduce virtio specific command to do debug non virtio
>>> functions.
>>>
>>> In the case of what you mentioned for vring_need_event(), what we really want is
>>> to dump the virtqueue state from the guest. This might requries some work of
>>> extending virtio spec (e.g to dump device status like indices, event, wrap
>>> counters).
>> Suppose the issue is only randomly reproducible in production env, we should
>> always take 4) into consideration because we will not be able to know where is
>> the root cause at the very beginning of bug analysis.
> 
> 
> So if it truns out to be an issue of irqchip, how will you do the debugging
> then? I guess what's really helpful is a qmp command to dump irqchip
> status/information.

Thank you very much for suggestion. That will be a different problem and we may
consider as future work.

This patchset is about to do introduce change/events to help narrow down where
may be the root case in order to facilitate diagnostic (especially for prod env
issue and when it is not easy to reproduce).

> 
> 
>>
>>>
>>>> This was initially proposed for vhost only and I was going to export
>>>> ioeventfd/irqfd from vhost to admin via sysfs. Finally, I realized I would
>>>> better implement this at QEMU.
>>>>
>>>> The QEMU inits the eventfd (ioeventfd and irqfd), and offloads them to
>>>> KVM/vhost. The VM side sends requests to ring buffer and kicks the doorbell
>>>> (via
>>>> ioeventfd), while the backend vhost side sends responses back and calls the IRQ
>>>> (via ioeventfd).
>>>>
>>>> Unfortunately, sometimes there is issue with virtio/vhost so that kick/call was
>>>> missed/ignored, or even never triggered. The example mentioned in the patchset
>>>> cover letter is with virtio-net (I assume vhost=on), where a kick to ioventfd
>>>> was ignored, due to pci-bridge/hotplug issue.
>>>
>>> So this is not a good example since it was a chipset bug. You need to use other
>>> tool to debug chipset code isn't it?
>> As this issue is reproducible only randomly, we will not be able to realize it
>> is a chipset bug at the very beginning.
>>
>> While the link is about vhost-net, it is applicable to vhost-scsi as well.
>> Suppose DEBUG_UNASSIGNED is not enabled, the developer will need to investigate
>> all of blk-mq, scsi, virtio-scsi (ioeventfd), vhost-scsi (target), pci-bridge
>> and pci-hotplug, in order to identify the root case.
>>
>> The "call/kick" interface is used to narrow down and verify the analysis,
>> especially when many kernel components are involved.
>>
>>>
>>>> The hotplug is with a very small window but the IO hangs permanently. I did
>>>> test
>>>> that kicking the doorbell again will help recover the IO, so that I would be
>>>> able to conclude this was due to lost of kick.
>>>>
>>>> The loss of irq/doorbell is painful especially in production environment where
>>>> we are not able to attach to QEMU via gdb. While the patchset is only for QEMU,
>>>> Xen PV driver used to experience loss of IRQ issue as well, e.g., linux kernel
>>>> commit 4704fe4f03a5 ("xen/events: mask events when changing their VCPU
>>>> binding").
>>>
>>> So looking at the git history we can see it has little possibility that the
>>> missing is due to virtio/vhost itself. So the commit you mention here is not
>>> good as well since it's not a netfront/netbackend bug.
>> I mentioned the xen issue just to explain that the loss of event/irq issue may
>> happen and is very painful. Another xen example is (equivalent to KVM VFIO):
>>
>> https://urldefense.com/v3/__https://xenbits.xen.org/gitweb/?p=xen.git;a=commit;h=56348df32bbc782e63b6e3fb978b80e015ae76e7__;!!GqivPVa7Brio!JY2OqmcXAmza_G2gR-dQwV2Oa0hGG_6trVkxSUMocoYi4A_VXwZbzVn_VA9yx10i7Hk$
> 
> 
> 
> Sorry, I can't figure out how is this related to VFIO or virtio. It should be
> reproducible for devices without using eventfd?
> 

Yes, although not involving eventfd, other drivers/virtualization may encounter
the loss of irq/kick as well. There is no relation between xen and vfio/virtio.

That's why a diagnostic interface is appreciated.

In my opinion, the 'diagnostic' is not only to collect data, but also to
introduce event/change (e.g., inject IRQ) and then monitor/observe what will
happen to the stalled VM.

> 
>>
>> That's why I mentioned this idea helps for VFIO (not only VFIO, but actually
>> blk-mq+nvme+pci+kvm+vfio, assuming it is for nvme passthrough) as well.
>>
>>> So for the case of event call, what you did is:
>>>
>>> satic void virtio_device_event_call(VirtQueue *vq, bool eventfd,
>>>                                       Error **errp)
>>> {
>>> #ifdef DEBUG_VIRTIO_EVENT
>>>      printf("The 'call' event is triggered for path=%s, queue=%d, irqfd=%d.\n",
>>>             object_get_canonical_path(OBJECT(vq->vdev)),
>>>             vq->queue_index, eventfd);
>>> #endif
>>>
>>>      if (eventfd) {
>>>          virtio_set_isr(vq->vdev, 0x1);
>>>          event_notifier_set(&vq->guest_notifier);
>>>      } else {
>>>          virtio_irq(vq);
>>>      }
>>> }
>>>
>>> This means, when eventfd is set, you bypasses the MSI mask which is very
>>> dangerous to make it used in the case of production environment. And if you
>>> check masking, it won't help a lot if the MSI is masked wrongly.
>> You are right.
>>
>> Only the vhost-net is dangerous because it masks a vector by registering an
>> alternative masked_notifier to KVM, while virtio-blk/vhost-scsi/virtio-scsi will
>> un-register the guest notifier.
>>
>>>
>>>> This can help "narrow down" if the IO/networking hang is due to loss of
>>>> IRQ/doorbell issue (or VM MSI-x is erroneously masked), especially in
>>>> production
>>>> env. This can also be used as a workaround so that VM owner will not need to
>>>> reboot VM.
>>>
>>> So having such extra workaround is pretty dangerous in production environemnt
>>> where I think we need to be conservative which means we need to collect
>>> information instead of generating artificial event.
>>>
>>> And it doesn't help if the wrokaround can be triggered through management API.
>> I agree with this.
>>
>> This depends on the administrator. This workaround should only be used in very
>> limited and special case.
>>
>>>
>>>> In addition, the VFIO will benefit from it. We will be able to test if to
>>>> inject
>>>> IRQ on purpose helps when the driver (e.g., PCI, NVMe, Ethernet) developers
>>>> blame the hang is caused by loss of IRQ with KVM/VFIO.(It seems there is more
>>>> chance to loose IRQ during CPU hotplug or changing IRQ affinity).
>>>>
>>>>> I think we could not gain much for introducing an dedicated mechanism for
>>>>> such a
>>>>> corner case.
>>>> As replied by Dave for prior RFC, the QEMU already supports hmp_ioport_write to
>>>> trigger an ioport write on purpose.
>>>
>>> If that applies. I would rather have a hmp_mem_write then we can test both MSI
>>> and doorbell. But again, they are very dangerous to be used in production
>>> envronment.
>> This is just not convenient for production env administrator. We will need to
>> first obtain the virtio pci info (e.g., via "lspci -vv"), and then prepare for
>> the command after calculating the address of doorbell.
>>
>> Something bad may happen if the developer did not calculate the address
>> correctly.
> 
> 
> It won't be worse than hmp_ioport_write I think?

I always believe it is worth adding hmp_mem_write().

While it won't be worse than hmp_ioport_write(), in my opinion, it is not as
easy/convenient as to write to eventfd.

> 
> 
>>
>> It should be much more easier for developer to just ask administrator to "call"
>> queue X for a specific virtio device.
> 
> 
> We can have the commands like "info virtio" which can show all the MSI/doorbell
> information for user to use. Or limit its use for virtio and vfio device only to
> avoid unexpected result.

So far the method by this patchset is to introduce "DeviceEvent event" to
"struct DeviceClass".

Only virtio-pci-xxx and vfio (future work) will implement this interface.


> 
> 
>>
>>>
>>>> The linux block layer also supports the below to kick the IO queue on purpose.
>>>>
>>>> echo "kick" > /sys/kernel/debug/block/sda/state
>>>
>>> This might be fine for hardware device but not virtio. The device can choose to
>>> poll the virtqueue instead of depending of the doorbell to work. And for
>>> networking subsystem, we don't have such stuffs, instead ethtool support to dump
>>> ring and vendor specific stuffs which could be used for dumping virtqueue state
>>> in this case.
>> This is just another example to help explain the philosophy behind the
>> "kick/call" idea: sometimes to trigger the event on purpose will help us narrow
>> down and verify our analysis of a kernel bug, especially a bug that is only
>> randomly reproducible in production environment.
>>
>>
>> I understand it is possibly not proper to introduce such interface to QEMU.
>> That's why I used to send out the RFC.
>>
>> https://urldefense.com/v3/__https://lists.nongnu.org/archive/html/qemu-devel/2021-01/msg03441.html__;!!GqivPVa7Brio!JY2OqmcXAmza_G2gR-dQwV2Oa0hGG_6trVkxSUMocoYi4A_VXwZbzVn_VA9yu-n97gA$
>>
>> In my opinion, this interface is pretty useful when the diagnostic invokes many
>> kernel components, or when developers from different components are working on
>> the same bug, no matter whether the root cause is at virtio or not.
> 
> 
> So for virtio, it's not hard to events without those interface. E.g for
> networking you can generate some traffic and trace on where-ever you suspect
> that could block the event (kick/call).

Suppose the vhost-net backend is TUN. Once virtio-net RX path is stuck and its
vring is full, the ring used by tun_net_xmit()-->ptr_ring_produce() will be full
as well. I do not have a way to generate traffic for RX path in such situation.

> 
> I still prefer hmp_mem_write()/read() which looks more generic, in the same
> time, we can add more debug informaiton likes:
> 
> 1) satistics like eventfd counters
> 2) device information, register layout, doorbell/MSI-X information
> 3) irqchip infromation

Would you mind help for below questions?

1. Regardless about kick/call or hmp_mem_write(), is it safe to add such
interfaces? I think it is safe because:

(1) This affects only specific VM (QEMU), not all/others.

(2) It is dangerous only when sysadmin triggers the events on purpose. If this
interface is dangerous, both "(qemu) mce 0 1 0xb200000000000000 0x0 0x0 0x0" (to
inject uncorrected error) and "echo c > /proc/sysrq-trigger" (to crash kernel)
will be dangerous as well.

(3) While this is implemented for only vhost-scsi-pci and vhost-vhost-pci, I do
not see issue for host kernel. It will be security bug if to read/write eventfd
from userspace crashes kernel space.

(4) We primarily use this interface when VM is running into issue (unless we use
it as workaround).


2. Is it fine to add such interface to QEMU software upstream, or such interface
is not good for software upstream so that the interface should be added only
when QEMU is customized for specific products' usage?


We may discuss how, e.g., hmp_mem_write() vs. kick/call if it is fine to add
such interfaces.

Thank you very much!

Dongli Zhang

