Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A4AA485AEC
	for <lists+qemu-devel@lfdr.de>; Wed,  5 Jan 2022 22:46:18 +0100 (CET)
Received: from localhost ([::1]:44134 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n5E6r-0003Hp-7B
	for lists+qemu-devel@lfdr.de; Wed, 05 Jan 2022 16:46:17 -0500
Received: from eggs.gnu.org ([209.51.188.92]:36988)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <steven.sistare@oracle.com>)
 id 1n5E1r-0007mK-Hb
 for qemu-devel@nongnu.org; Wed, 05 Jan 2022 16:41:09 -0500
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32]:60006)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <steven.sistare@oracle.com>)
 id 1n5E1m-00047h-R8
 for qemu-devel@nongnu.org; Wed, 05 Jan 2022 16:41:06 -0500
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 205KNv1C018944; 
 Wed, 5 Jan 2022 21:40:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=message-id : date :
 subject : to : cc : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=corp-2021-07-09;
 bh=iymLcx98kTttKMvqAYJBz76IxwqVvKAhZm30lTuUhwY=;
 b=Cjs+cJtC4l1GyAzkvYbO4YoRx1xYZlWjPKfvfBzLI3Etii5E4aWE/qccitzjdgHWm9iu
 g9Cyw+uzWqZK3ts6ysJuf0McFYstjcDfVKQLL8KeYroRceLHjj92jABbNYJrYTnpsIo4
 23psM8buuLPVhTY9IohcP74ZFDjSrKr/rr30hvrU7R3bdtFOSFDVZEoJsVZmYpF0tGYX
 ql6L6kj2dfjAZPkB2RDsw9g7Gj9mAsuSdzzUGTIXZJnKaB/2GOzbyqWoVvuU3wqqa2+m
 H+mO5VKunlSu4LV6vZlOtKHc/41M3H812oimZntcF4wvFqNl2AldsXdUfJVZFM/9RlHc UQ== 
Received: from userp3030.oracle.com (userp3030.oracle.com [156.151.31.80])
 by mx0b-00069f02.pphosted.com with ESMTP id 3dc43ge0nh-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 05 Jan 2022 21:40:51 +0000
Received: from pps.filterd (userp3030.oracle.com [127.0.0.1])
 by userp3030.oracle.com (8.16.1.2/8.16.1.2) with SMTP id 205LVmE9158737;
 Wed, 5 Jan 2022 21:40:50 GMT
Received: from nam12-bn8-obe.outbound.protection.outlook.com
 (mail-bn8nam12lp2170.outbound.protection.outlook.com [104.47.55.170])
 by userp3030.oracle.com with ESMTP id 3dac302qkc-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 05 Jan 2022 21:40:50 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LNVLyZxjjiFInjvCwccvy4WTlIsPnMJGku9DtdwfVf4mhTAq8SdkwyMMpGes3vvLlf6bFmWuP7zcHDj2nJZVcJZW5IV6eEOCHpPzZ4gptqAkqolT8oR8ZADih0n7/MUJ4rZCpJmE4nAISrbp2qwRG92GAxlwIoBi02l3aVx+iKvTuIaycrCmyKJ/w0fNPm7+V3nQAe3aLIj2VA9cXsfA7yWS/r1AAGBfogxspyzv+Z6PoPQzYIY2J8AMmJhcVgiDsdJcldvEYyRs4LpOllYcfNRV6mTQMsdpuVk+XX7b4arICSJH4B6c5ukBCV3ccZZCtCHdPdb0x7HisAuKqSD+bg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iymLcx98kTttKMvqAYJBz76IxwqVvKAhZm30lTuUhwY=;
 b=ebMkT4QsAmY/gRLCt7UoZCDGv6W+2Mki1xQeqyEsAmxcHtjwSptMb0jeAUlxi/4G6lHo5EzN+fXJs2ebjrnhMTatk9rlUvNc5JjJHZc5RlvNmPAY3YVSy2aP3pMOJnJiVjkaSl5Ge89YmwBnpyEKUfbiRG1LMzVibQfmypZL+feAKSATUCtQHmcvWg/lSvrt1hOzNZxaGByDb4AY3vy4FpLHYt157zVp2RDAKXJclnLvUuXpOBgxPUxwlH38rMBKoMLrGD/MQ5l5ACFwENDxaoDhCe7Y+wZkEBREFjGHlCK+P4bV5abf2TZBtMah0M7CpzNWSTX/tFvZeV319fvfFA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iymLcx98kTttKMvqAYJBz76IxwqVvKAhZm30lTuUhwY=;
 b=hlFa3LDgX6+hU+wh+idYSGeTS8zYrWwBiA7CITgXhg14dzZljQJ/naFamMMEYCo58UWZm7zL0KslfbXRWW0XNkh5Au4KWMrA3Qz+85uiIz6XI+Pl/JTUgDFYI2mQOXlvcn7SEz0QThG+eGqEQYULgeel2LI+bh6nzrSA7zN+9l4=
Received: from BYAPR10MB3240.namprd10.prod.outlook.com (2603:10b6:a03:155::17)
 by SJ0PR10MB5440.namprd10.prod.outlook.com (2603:10b6:a03:3bb::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4844.16; Wed, 5 Jan
 2022 21:40:48 +0000
Received: from BYAPR10MB3240.namprd10.prod.outlook.com
 ([fe80::d91d:1a8b:56bd:6623]) by BYAPR10MB3240.namprd10.prod.outlook.com
 ([fe80::d91d:1a8b:56bd:6623%5]) with mapi id 15.20.4844.016; Wed, 5 Jan 2022
 21:40:48 +0000
Message-ID: <e95009cf-aea2-7fc7-c049-687c1badc471@oracle.com>
Date: Wed, 5 Jan 2022 16:40:43 -0500
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.1
Subject: Re: [PATCH V7 19/29] vfio-pci: cpr part 1 (fd and dma)
Content-Language: en-US
To: "Michael S. Tsirkin" <mst@redhat.com>
References: <1640199934-455149-1-git-send-email-steven.sistare@oracle.com>
 <1640199934-455149-20-git-send-email-steven.sistare@oracle.com>
 <20211222181003-mutt-send-email-mst@kernel.org>
 <f1cadf51-795b-200c-8abb-f8f97b34c228@oracle.com>
 <20220105161046-mutt-send-email-mst@kernel.org>
From: Steven Sistare <steven.sistare@oracle.com>
Organization: Oracle Corporation
In-Reply-To: <20220105161046-mutt-send-email-mst@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BYAPR21CA0018.namprd21.prod.outlook.com
 (2603:10b6:a03:114::28) To BYAPR10MB3240.namprd10.prod.outlook.com
 (2603:10b6:a03:155::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e4e136c6-b1dc-4614-ce51-08d9d094098a
X-MS-TrafficTypeDiagnostic: SJ0PR10MB5440:EE_
X-Microsoft-Antispam-PRVS: <SJ0PR10MB5440EA9F051C1742A8ED71B6F94B9@SJ0PR10MB5440.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: G9cXUACJmuTw7JubS6ZtWceiX8+l8LXaw6MaRW/OOUmIFoHOMSXtUGRRXbwPrJkvXbmoXb/Sxg/dnLsdzcyntABuC5cS5C6j4y3zBuK30wHIvSt4EZg+F4NOsQS+0zl1a++7iQMeNfJjXIIdtEGAXdWn93hu09Wbs1neWDNTnVxGSzkpiFOdHxg65fx0t2Ns7u1zmzciD3pUHvEnpWssHschpYr60VfatzpretFnfN7T4WXmVhdM77+FOCORmMmAaDg+8Vqhd6wp3YMYQ1qj/FLAVY5PLZpsTKt9YyHYkAae770eNZOFmk6AnSXP3bRY+nJRhGyj5/OCL8/OOYW8lSYVy/mV6pOSVHJRWrq6smLQX/y5/t0csTOepxBN3aFx0GhzpQ1yQbT0Pf0n8yujiZGPSrYEL/0afUHrqrGIqad7N7QGo4+hpxi7TYcM3vEPNcMYFLoHJR2cVz87xsaqE8rr+N1vaSXdSU2cP8FEHLvfB8DccW6UFVfEAwb9WpkyHFYtAyE1aMjex/YY/nser6hwSDZZk1KNUJYmryez/1vaoz/q0P1Ix6UF1fo2DeupfcLv7KfTvXmttop5SdkOuXFUTysulrncnIAegNsZB9Z7kKtta4ni608pLLjT0n0j/EiG0ciXkKqmTZMOQNPGNFCWKDCfNa1qwRly9YPIhA9fGYrPIqPS4Q8bAYsP7T232nvLcWTJtWm100kK9S82cXXsw2nGkTziACLw10G3a1w=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR10MB3240.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(83380400001)(36916002)(2906002)(6486002)(6666004)(6506007)(36756003)(316002)(66476007)(66556008)(66946007)(31686004)(7416002)(8936002)(31696002)(6916009)(54906003)(86362001)(38100700002)(44832011)(186003)(8676002)(107886003)(6512007)(53546011)(508600001)(4326008)(5660300002)(26005)(2616005)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Z1dPRHF2dGZmQlgzaXovbS9lV0hQSndhK0NPWkIzYk13TCtnN25Hc1FFUnIy?=
 =?utf-8?B?MkJncjVyOHNNa25LY0NISWNOSUY2RUNma3JjZ0t6U3RvTWVzYnZWL3pSdmx1?=
 =?utf-8?B?dEc4QTFqdm9NVFd6bW4xWWNra2pKZWVsSzFsRmgyWlFERVpSbnVYazF3UFhp?=
 =?utf-8?B?cjRwWXZtdWJvQWtFbll4bGlIV1BhSkdTQ25IK0NrNXRxK0JlZ2Z2SXJIM1pJ?=
 =?utf-8?B?L2pocFRHQnROU3o5djNEcEpRQjB4Y1pGbnUzV2dsdkxuSXhpSVlKbmpOZ3Zu?=
 =?utf-8?B?cERFQzgrY0hHLzBibGIwTmQ1d2NXTG9ORDF4Q0Z1cTA3ZGMzREJwWUt1NC9i?=
 =?utf-8?B?bUJCbFZaeGhmSTNsWWxIMHZ2K3dwbTJJdkRIYVBZTGtlT0U0MGdtRjNxT3I4?=
 =?utf-8?B?OEZzc2VZY3NFNmxKMkFJTzZZNndrVXJLVFVGWk5aUEVOSDlXSVZhSGhNT0Rl?=
 =?utf-8?B?VEx5L3hIOTFNQ0lQL0FQM3dFaDFjUDhHYWpGRGNYc2R3dGtZOHB1aUJMSDQv?=
 =?utf-8?B?cFZJVmNTT2w0RUJ5MW13dUFhVDB0ZlNHQm1JeTd5UFJvTUVZa1JpbkdkOWgw?=
 =?utf-8?B?blhuR2xhcnRQQjlXSnc5TDZMWmgxbkxBT0ZTWXoxZXJaNU9Rb3FqMTdISWxU?=
 =?utf-8?B?WU9qVzJJek90YktocWh4NEtmYUZWcHVBTyswcGs3ay9LTWJBQnF6NTZDU1Rp?=
 =?utf-8?B?Z00zY1NSdVNrYzVWazFrS2g3SXNFa0RuSGwrYmFNRTBoKzJEL0l6bHRpSEE5?=
 =?utf-8?B?Y3hZcWk2WmFqK1ZjQW1UcTVCWUdkNG1WR1dqaHhya2NvUXpER0xhd3dJT3R0?=
 =?utf-8?B?Y2pGaEhlSXBLbUlIcVJGMVorQ2dBMkhCRjhSKzhNWFFmaGMyLzNaZnplYmVk?=
 =?utf-8?B?bmRNZEtwVk4xZlUveXRpN2VKWHkxWHVlZ3JYTHF5dHNCamgwV0pkbTI2QkJW?=
 =?utf-8?B?dDBsYXpocDVrOW9XU3ZQek9tUHdvM25JUER5b1BXajRGYUM4NThMNTNQR2sr?=
 =?utf-8?B?ZkxVWC9jakRJV3JWeHI2dWw0NDhmSkt2d2JXVGVpU1UxL0VYT0t2M0FmVzNz?=
 =?utf-8?B?MGVMWjEvS1F3SmtSdFB4YWh6eGNRc3duT1R1QjNja01YcWZQY3BJM2hFdEFS?=
 =?utf-8?B?Q2JVZVdJRVhkRExGVDRrMW1YNE9SRDBFaVdpaExGMjBPNHJnbzFhY25Gd2hQ?=
 =?utf-8?B?RDFlVytPOVdsaWZEV2NFazU5eXZ5S3VFQ3JnUWpyakJBU2ZRSXZCc3VFWHdJ?=
 =?utf-8?B?NHJUcmNHanFGeG5uc0RHbjVSK1Q5Tmp1Z2VBWjVsU1RBRXV0Wk9hZmhtdDM4?=
 =?utf-8?B?cHA4aUJFWkN3ZWEvbDdrNTN2bFJnVFhzUElMNUpQeDl3RXpNeWZDbFNlZGll?=
 =?utf-8?B?NHJQV29oTnVrVmp6dGNVS21KMENHY3k5NnAwc2dOM2paR1lndTlHSHh2RmRC?=
 =?utf-8?B?Zmg2RFlpSjB3RGtjQWdQbytieitFZFdFR092TFFqb1pxRjA4ZDByalRnOFB1?=
 =?utf-8?B?T1l3bCs4QWF4YndDSThOczRLSXRMeldtMmw0eEUvRTBXTHAvU3kvTVFyVFBV?=
 =?utf-8?B?WEw4WGZvY2gvZ2d4dWdSMXBkSjhTVGw0TUlPT1g2MHVpMEJXK3NOK3FieG5O?=
 =?utf-8?B?alY5UmN1bzdaT2RSa1dRKzUxNGlXTWRRbnJDbUFxd0NQdHpaVy9zUkV3VS81?=
 =?utf-8?B?d2Q5RnlVMWdXakxPeHdWZktvYnFYR1duV3Z5cTZDYzgvU1hRVm12MXpZZ2No?=
 =?utf-8?B?RUNzaGw1N3JDc3hzZDhOd3hMRDE4a1lvOURWZVN2Slp5OHJoWDVzM21QeFpH?=
 =?utf-8?B?TTJaeHJTRXJ0UnJrM3pUYUZSUXhoTHJDclN1K1VYTHNsalY2aHJrVkcxYUJK?=
 =?utf-8?B?OEJFNVVuMXJzU3NhMGhabnhlMDdCaUhqODBVVFUvMHdOZEROWDlId1hkd2cy?=
 =?utf-8?B?UjUxRHpxU0psdDdBNmVqeHFNRWZ3MjlSWVpBMEx5TW9yL0FUTWF6L2lZTXh1?=
 =?utf-8?B?enhTM0VPZUYxUTEzRWI2RzREc3NwSDlnaTJuNWN6RmJTVThqMGp2UFRmV0hO?=
 =?utf-8?B?MlFrUmcwbHNQOU92aklWUXYreDVUaGJPQVVtd28wOTIxQzh1MEVEN2IrTW1D?=
 =?utf-8?B?bXg0L25CM0RZMTJkMkhDMDNiL0Q1bXpYNG9pdE1WZ0pzUzZCdW9XcUtzMWlJ?=
 =?utf-8?B?ZjR5L3ZMMnBEdG44OC82dml0UUlrVXFBaXlPbzZLRUw1NzU5ODU5T0VmeWM5?=
 =?utf-8?B?eUY2dHlWekhpZzFqN3J2RVNjOFp3PT0=?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e4e136c6-b1dc-4614-ce51-08d9d094098a
X-MS-Exchange-CrossTenant-AuthSource: BYAPR10MB3240.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jan 2022 21:40:48.5339 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Q7END5oB44CgebMtrVM76aiCq8vS0dquUldbIdzYwWtzShA6VG86zR8S/AMpaArz+/xh2QX0u06UPpmBw3pyy1BuwGiABb3S8OJyXWfkurs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR10MB5440
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10218
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0
 mlxlogscore=999 mlxscore=0
 suspectscore=0 spamscore=0 phishscore=0 malwarescore=0 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2110150000
 definitions=main-2201050139
X-Proofpoint-GUID: MOJBfpOr7LlMwVA3wkR9Uup--XUwigKU
X-Proofpoint-ORIG-GUID: MOJBfpOr7LlMwVA3wkR9Uup--XUwigKU
Received-SPF: pass client-ip=205.220.177.32;
 envelope-from=steven.sistare@oracle.com; helo=mx0b-00069f02.pphosted.com
X-Spam_score_int: -38
X-Spam_score: -3.9
X-Spam_bar: ---
X-Spam_report: (-3.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.057,
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
Cc: "Daniel P. Berrange" <berrange@redhat.com>,
 Juan Quintela <quintela@redhat.com>, Jason Zeng <jason.zeng@linux.intel.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>, qemu-devel@nongnu.org,
 Eric Blake <eblake@redhat.com>, "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Zheng Chuan <zhengchuan@huawei.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 Markus Armbruster <armbru@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 1/5/2022 4:14 PM, Michael S. Tsirkin wrote:
> On Wed, Jan 05, 2022 at 12:24:21PM -0500, Steven Sistare wrote:
>> On 12/22/2021 6:15 PM, Michael S. Tsirkin wrote:
>>> On Wed, Dec 22, 2021 at 11:05:24AM -0800, Steve Sistare wrote:
>>>> Enable vfio-pci devices to be saved and restored across an exec restart
>>>> of qemu.
>>>>
>>>> At vfio creation time, save the value of vfio container, group, and device
>>>> descriptors in cpr state.
>>>>
>>>> In cpr-save and cpr-exec, suspend the use of virtual addresses in DMA
>>>> mappings with VFIO_DMA_UNMAP_FLAG_VADDR, because guest ram will be remapped
>>>> at a different VA after exec.  DMA to already-mapped pages continues.  Save
>>>> the msi message area as part of vfio-pci vmstate, save the interrupt and
>>>> notifier eventfd's in cpr state, and clear the close-on-exec flag for the
>>>> vfio descriptors.  The flag is not cleared earlier because the descriptors
>>>> should not persist across miscellaneous fork and exec calls that may be
>>>> performed during normal operation.
>>>>
>>>> On qemu restart, vfio_realize() finds the saved descriptors, uses
>>>> the descriptors, and notes that the device is being reused.  Device and
>>>> iommu state is already configured, so operations in vfio_realize that
>>>> would modify the configuration are skipped for a reused device, including
>>>> vfio ioctl's and writes to PCI configuration space.  The result is that
>>>> vfio_realize constructs qemu data structures that reflect the current
>>>> state of the device.  However, the reconstruction is not complete until
>>>> cpr-load is called. cpr-load loads the msi data and finds eventfds in cpr
>>>> state.  It rebuilds vector data structures and attaches the interrupts to
>>>> the new KVM instance.  cpr-load then invokes the main vfio listener callback,
>>>> which walks the flattened ranges of the vfio_address_spaces and calls
>>>> VFIO_DMA_MAP_FLAG_VADDR to inform the kernel of the new VA's.  Lastly, it
>>>> starts the VM and suppresses vfio pci device reset.
>>>>
>>>> This functionality is delivered by 3 patches for clarity.  Part 1 handles
>>>> device file descriptors and DMA.  Part 2 adds eventfd and MSI/MSI-X vector
>>>> support.  Part 3 adds INTX support.
>>>>
>>>> Signed-off-by: Steve Sistare <steven.sistare@oracle.com>
>>>> ---
>>>>  MAINTAINERS                   |   1 +
>>>>  hw/pci/pci.c                  |  10 ++++
>>>>  hw/vfio/common.c              | 115 ++++++++++++++++++++++++++++++++++++++----
>>>>  hw/vfio/cpr.c                 |  94 ++++++++++++++++++++++++++++++++++
>>>>  hw/vfio/meson.build           |   1 +
>>>>  hw/vfio/pci.c                 |  77 ++++++++++++++++++++++++++++
>>>>  hw/vfio/trace-events          |   1 +
>>>>  include/hw/pci/pci.h          |   1 +
>>>>  include/hw/vfio/vfio-common.h |   8 +++
>>>>  include/migration/cpr.h       |   3 ++
>>>>  migration/cpr.c               |  10 +++-
>>>>  migration/target.c            |  14 +++++
>>>>  12 files changed, 324 insertions(+), 11 deletions(-)
>>>>  create mode 100644 hw/vfio/cpr.c
>>>>
>>>> diff --git a/MAINTAINERS b/MAINTAINERS
>>>> index cfe7480..feed239 100644
>>>> --- a/MAINTAINERS
>>>> +++ b/MAINTAINERS
>>>> @@ -2992,6 +2992,7 @@ CPR
>>>>  M: Steve Sistare <steven.sistare@oracle.com>
>>>>  M: Mark Kanda <mark.kanda@oracle.com>
>>>>  S: Maintained
>>>> +F: hw/vfio/cpr.c
>>>>  F: include/migration/cpr.h
>>>>  F: migration/cpr.c
>>>>  F: qapi/cpr.json
>>>> diff --git a/hw/pci/pci.c b/hw/pci/pci.c
>>>> index 0fd21e1..e35df4f 100644
>>>> --- a/hw/pci/pci.c
>>>> +++ b/hw/pci/pci.c
>>>> @@ -307,6 +307,16 @@ static void pci_do_device_reset(PCIDevice *dev)
>>>>  {
>>>>      int r;
>>>>  
>>>> +    /*
>>>> +     * A reused vfio-pci device is already configured, so do not reset it
>>>> +     * during qemu_system_reset prior to cpr-load, else interrupts may be
>>>> +     * lost.  By contrast, pure-virtual pci devices may be reset here and
>>>> +     * updated with new state in cpr-load with no ill effects.
>>>> +     */
>>>> +    if (dev->reused) {
>>>> +        return;
>>>> +    }
>>>> +
>>>>      pci_device_deassert_intx(dev);
>>>>      assert(dev->irq_state == 0);
>>>>  
>>>
>>>
>>> Hmm that's a weird thing to do. I suspect this works because
>>> "reused" means something like "in the process of being restored"?
>>> Because clearly, we do not want to skip this part e.g. when
>>> guest resets the device.
>>
>> Exactly.  vfio_realize sets the flag if it detects the device is reused during
>> a restart, and vfio_pci_post_load clears the reused flag.
>>
>>> So a better name could be called for, but really I don't
>>> love how vfio gets to poke at internal PCI state.
>>> I'd rather we found a way just not to call this function.
>>> If we can't, maybe an explicit API, and make it
>>> actually say what it's doing?
>>
>> How about:
>>
>> pci_set_restore(PCIDevice *dev) { dev->restore = true; }
>> pci_clr_restore(PCIDevice *dev) { dev->restore = false; }
>>
>> vfio_realize()
>>   pci_set_restore(pdev)
>>
>> vfio_pci_post_load()
>>   pci_clr_restore(pdev)
>>
>> pci_do_device_reset()
>>     if (dev->restore)
>>         return;
>>
>> - Steve
> 
> 
> Not too bad. I'd like a better definition of what dev->restore is
> exactly and to add them in comments near where it
> is defined and used.

Will do.

> E.g. does this mean "device is being restored because of qemu restart"?
> 
> Do we need a per device flag for this thing or would a global
> "qemu restart in progress" flag be enough?

A global flag (or function, which already exists) would suppress reset for all
PCI devices, not just vfio-pci.  I am concerned that for some devices, vmstate 
load may implicitly depend on the device having been reset for correctness, by 
virtue of some fields being initialized in the reset function.

- Steve

