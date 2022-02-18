Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E6464BBE0E
	for <lists+qemu-devel@lfdr.de>; Fri, 18 Feb 2022 18:14:39 +0100 (CET)
Received: from localhost ([::1]:38164 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nL6q5-0001vR-M5
	for lists+qemu-devel@lfdr.de; Fri, 18 Feb 2022 12:14:37 -0500
Received: from eggs.gnu.org ([209.51.188.92]:46710)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <joao.m.martins@oracle.com>)
 id 1nL6op-0001Ek-0k
 for qemu-devel@nongnu.org; Fri, 18 Feb 2022 12:13:19 -0500
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32]:16150)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <joao.m.martins@oracle.com>)
 id 1nL6oX-0002nc-6D
 for qemu-devel@nongnu.org; Fri, 18 Feb 2022 12:13:04 -0500
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 21IFx4oT023669; 
 Fri, 18 Feb 2022 17:12:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=message-id : date :
 subject : to : cc : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=corp-2021-07-09;
 bh=d+OnH7e2jHckkleOryDqDvDQjQ905a/yxbsQ+E2VPbQ=;
 b=CuFtSUyBjQvr4y+fDF00kzpwy+uFv4qKjC7Rbk7gah2ARKLcDCrAq/QyhHCx3p7PWhqD
 uKN5w06pWjpDz8M+8DWpXPowzwBE8r+uqx+wWwdBnhexyk72iDDu6Ol1RPqyY15j2BW5
 2p3ZrZuubOyIjuxfzJM1QZy2hW6e9ZYzZnbi/ybKUwPjjpJQjbQ4d/wBj5CnmApHThpD
 INGZR7y+a47ndg1TKf2WsbFIKa+90oOd7owF5ePhR/b0khMgc972dfErLT6rA9hj8zJl
 9Z5CtUTfxLFZ7CDsWEBcNDheI28oqD97LdUepoRwDzFYVl9/wZPdJW8nsd4wgfPerEoK Xg== 
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
 by mx0b-00069f02.pphosted.com with ESMTP id 3e8nb3spv6-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 18 Feb 2022 17:12:32 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
 by aserp3020.oracle.com (8.16.1.2/8.16.1.2) with SMTP id 21IHAGgp101802;
 Fri, 18 Feb 2022 17:12:32 GMT
Received: from nam02-dm3-obe.outbound.protection.outlook.com
 (mail-dm3nam07lp2044.outbound.protection.outlook.com [104.47.56.44])
 by aserp3020.oracle.com with ESMTP id 3e8nvvng1w-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 18 Feb 2022 17:12:31 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kpuPisd6666b7D6naszP0InX83NjEnC2cG2vVRC0Xjm2iZfMiPuuntGAN5R/T75M89yYIfaiakadiVUW8J/qXffOLSLSQcEztMJCKWaxXOzBRJsPMNIwz3w6qXygCjMQ33UEAQzjULeo1JZebk1WR2JmcxVbM5a+gKL5mJxVebF5LquU264uECNMJbyPiY201f+U+TjkNjWwRq5TNvRxxdbLjh8xsQpxhokNkhSOUMxNpIP+oCpKqkZGvQrU5o5xCnxxzh+2N9ZF7y9ZLRUPKRuavZ3Cs/yOtBHUF4YuWarXt89xsJbtqbzw4FU51AHmJgM6t5QS5CLj6uESbfoPQg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=d+OnH7e2jHckkleOryDqDvDQjQ905a/yxbsQ+E2VPbQ=;
 b=K6pMXhQqOe0ZEhtacR7iZRj/cLMZSaMxUY/anzER9e/OQjTb7HBo2jE9EflMEc+XmAG4rCAc/3RGuBzZdOR/cUTGY4KYfhRzelLk9T+QIBJElPGuc1PJAA9yY4XW79ZXHC8WLgNt0LwJOofh4Vjk2krLnlxAf8HVKSQB9ovvhqyuzeorSIjwp0epEShAcE6pJBSS2lm+E41dOGhflbbNJ6Io0+P55VPdcinoRNs3z/mi2ZEmEo8sUzorIdRDRdlXydSWrMB1CytFsLW2dsVFGvkfj9G+ftxswe97xJ08sIvytljS1clM3AlKVrqXpBbTxwTNGEIgpXAvh4G8FEoGYg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=d+OnH7e2jHckkleOryDqDvDQjQ905a/yxbsQ+E2VPbQ=;
 b=Scup+IW/T1I6fYwrq99H6ShuzmYjvEd7mIAOpBx0/IFP8uLFkAAzAQpjQDSstItNN4MXpdfel0iy8EpvWKr5PAeRSl1+AtOmqMZ+EhdIwEQ9gmGTZupOxihv6yju7XGzOUg8iFTwk/6STt1n5z5PNwxKK3wrCI+dExXz17/xesQ=
Received: from BLAPR10MB4835.namprd10.prod.outlook.com (2603:10b6:208:331::11)
 by DM6PR10MB3209.namprd10.prod.outlook.com (2603:10b6:5:1a2::27) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4995.24; Fri, 18 Feb
 2022 17:12:30 +0000
Received: from BLAPR10MB4835.namprd10.prod.outlook.com
 ([fe80::750f:bf1d:1599:3406]) by BLAPR10MB4835.namprd10.prod.outlook.com
 ([fe80::750f:bf1d:1599:3406%4]) with mapi id 15.20.4995.024; Fri, 18 Feb 2022
 17:12:30 +0000
Message-ID: <53b94f7a-a90b-3e9c-2e86-5d77410c46d2@oracle.com>
Date: Fri, 18 Feb 2022 17:12:21 +0000
Subject: Re: [PATCH RFCv2 2/4] i386/pc: relocate 4g start to 1T where
 applicable
Content-Language: en-US
To: Igor Mammedov <imammedo@redhat.com>
References: <20220207202422.31582-1-joao.m.martins@oracle.com>
 <20220207202422.31582-3-joao.m.martins@oracle.com>
 <20220214155318.3ce80da0@redhat.com>
 <fa172a19-5db6-a844-27d7-8497d306024e@oracle.com>
 <20220214163158.4c4b210b@redhat.com>
From: Joao Martins <joao.m.martins@oracle.com>
In-Reply-To: <20220214163158.4c4b210b@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM0PR02CA0114.eurprd02.prod.outlook.com
 (2603:10a6:20b:28c::11) To BLAPR10MB4835.namprd10.prod.outlook.com
 (2603:10b6:208:331::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 43070d6c-f1f5-446c-2752-08d9f301d848
X-MS-TrafficTypeDiagnostic: DM6PR10MB3209:EE_
X-Microsoft-Antispam-PRVS: <DM6PR10MB3209B541A2E55214745F91C0BB379@DM6PR10MB3209.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1060;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Qpb8237bEhujqTy8OhQusZrwwxPoAg8gjC8q3b11IXrQVcCANlI3nsdrmgOO8yEx3+SbNQ9xbgM2kyTYdvIhHn+J3CpH1D8LICwDsrtgXD1vXLcXTIJ4pAhtzv3RK/t5NN4Few44pPTnKBmIWM0DeEAcPIoVTRTdw6U1f8Gvu+A6zzBuWTddvKb9tf774Ahw9LhgK+3BgeTBrUiXu+iNveOlb9SsWJow+ECefzFnQ8klcTuJ4NgoXclcylBWsYtT8Lx1NIi8NYyYKIUb8b/q2Q0DUXNKKsj9rQHq3bNnd88xXmwxjabcInOD/+rx7bjxk+16D1G2u9AAmYZ4ds4WybsVfxXc1braugldpXWV5GL/KZvAMWhe9RPovLBs6DIbZW2rTgYkKJV7VX7nR/PeNceT4xdsdlG2OQoeHrETcfhhkX8MBPRYUi6yx5NbJJsMR2lS7lO9n2kk2dJO/x2+Tbx2NDxpk84M1uEurOmW/tvP/I7BCwTLplIZzr7muM7gU+lP4kFivN0v9IN1/zlijuBx+bjwX/RMUs/FGACUVVcISJrIfDxvMzd5meMlnPwpieEXmHc/JK602WZ1UJXSi4O5Xqzc/lkP4XQuJBkZHm+liTnO+DS23vrQMEejP5o3dKCyXEObocNi30a7x5u3Rm2NlAunqmCagagUGeCH26fT1x28Gyv2FyX/gznWJSXFP05ZcRvBctNAvKAoU8Qq7w==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BLAPR10MB4835.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(508600001)(6666004)(36756003)(8676002)(66556008)(66476007)(6506007)(66946007)(4326008)(53546011)(83380400001)(31686004)(2906002)(7416002)(186003)(5660300002)(8936002)(31696002)(6512007)(86362001)(6486002)(316002)(38100700002)(2616005)(54906003)(26005)(6916009)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?c2xhRUIzYWdYb2pHbExvd1VISFh5MlkwY0EvTFg1Y0xJL1VuY3hMNEtXcG5T?=
 =?utf-8?B?cFAzSElaTlVUQWpQWlFxRWJRSmpkbEcwSkIzeURJZXJXcHdVSkpJQnA4MzZO?=
 =?utf-8?B?Vk5OYmhlYWpaZmlJU3hMbnBVcC8yQnB4WUhQSWg1Qk8xYkdxKzJaTHRwNVQ0?=
 =?utf-8?B?RXNsSzlMNnpCMDJKV00zOHJBYU5GVUYwOU1xOWpONlB3bTdVaFNnVER4bHVY?=
 =?utf-8?B?M05ZME9ybk9rNGp1Mk9TVGh4ZXpLQzMzeCtsTjR2YnJBNzdteVplcWVyZGxO?=
 =?utf-8?B?b3FlcWIvNk9janBsYWFDOWdzcWEyeUs4NUdOMjFtbFF5ZDhHeWszWFlGRFJU?=
 =?utf-8?B?UGo2eFgxNGEvd0dMY3FpUnI2NGdBcFh0TnlnbmQ2cEpremVSdC9hQWhRaGFV?=
 =?utf-8?B?QnVCMTlwTHcrTXZhdmI3MURIdlJJNzc5KzVXTWVNZVNQTVNHU053Wm9rbzlQ?=
 =?utf-8?B?OVVMazNGTXlibG1tMWlKSUx6MldQd1QrZEQyeEZrbXZrdk5lSmM1bkJFRllq?=
 =?utf-8?B?QWpzMTlGRWZGOXFlcHpyMHBFcWdEZ1VPaFBsdlMzSGZneGh1c09rSFpkeXpU?=
 =?utf-8?B?UHR6eEJUOFFybmxzSmhSMndxYlVLVHA3K216SUZRcmMyVExuR2FoTlVWVzdp?=
 =?utf-8?B?TVhlZzRnajRpU083UnVWQXlYeUFqU0xIL2NPV0ZEZW5sV01kYlhRR09jUG9Q?=
 =?utf-8?B?RU91YnJ3RHJLYlNWSWlHSXBpRFNHM0pCNmV2b2JIbU00alFmcklJMXEyRktM?=
 =?utf-8?B?Q2txQzdwVjJWOHlXYnpqeGk5WlNCdStIK3h6V3ZvVnB3TldTNEd0eUlCT3Rl?=
 =?utf-8?B?aDkvektKelBKZVg2cDlQMHRtNnBVeU1idHY3S2J6c05MdzB1dDFIWEJVNEJC?=
 =?utf-8?B?T2IzWC9VWGRzaVhvRGl0UjZncjdBcmRZQ2cvbUc1d1ZwVnJDTEFaSHo2L0NM?=
 =?utf-8?B?a2NpRFNWaVg2cmkybWtwUFJjajEwTmszRjdaYVVlUkRtWktVU0hlR00yMGlP?=
 =?utf-8?B?QUlqVk5xZ3h6SXlSMUVrcExtMkpERm9xS1E0akR5RU0zT3VKTFIxU0RBU2g2?=
 =?utf-8?B?aTIrU1ZVQ1NaTFV6ZFlBYUlMbStXT2d2L2hhY3BiT1h0cEFCWXZBV1l3Mnpz?=
 =?utf-8?B?Yk9WcmZIZ3d2YVJROEd0OTIvWmhBM0RtT3hZb3l0c2lBcExoZ2ZuR0ZBdDYr?=
 =?utf-8?B?THZkb0xKS09tU2ViZldpQlBxdzR5V2dEdkF0d0R0eDZ1SElJYXVpUmlTSGor?=
 =?utf-8?B?SkZ3Q1BIU3hxNUpvTzJnYVYzcDNkNWpWMDhnYTlrclNyYWs2UElRaVJWK0tB?=
 =?utf-8?B?b0NHZm8wT1VKN0h1OWJjRWdpQ1RRU0p3NERBTlE2cllRTVc5ODlIbGJhdXl6?=
 =?utf-8?B?Rm1saC91SnA4emc4eGNtTTQxb2lVZEdqRjdwUHpOYTQ5Y0R3bzMyaExXT0FY?=
 =?utf-8?B?VGRqME1yVDlRQTFVYXlZSWhsOWtxbGcxL3dwMmRxakRCZlNjRzFUMDZBaGc2?=
 =?utf-8?B?bGg1MHR0WHV3eVRWM3BRdWtaZ3RtTTFSMmx6eUMrMkxCNWNKR1ZOR3A5OTgx?=
 =?utf-8?B?VDc1c3JWYXNiTlFxTkNnMWlSNFpCQS9JNC9rbG1LZ1VUejR0SlZSZjlFaDUv?=
 =?utf-8?B?VHFYbzk5ZVZGSmpYTFdzRDRqMGxCaFFkNmFhcHA3ZDh5SHNuVDdScXA3V3Fa?=
 =?utf-8?B?NVRKUHJzYWlSQkhucmlSTnEvUVUwMzNCeWxPWjUzR0RqSkdzcTNxb29CWkNi?=
 =?utf-8?B?cUZpN2hxc3dtcUkraGt5L2hwc2FSNWY5V0I3QXpNdU45WndKclA1UHNReGVL?=
 =?utf-8?B?a0w1U0tTVDBOL2svcWgvYk9tY0MraUs0VUdSTVNZWkNVbXlReUMxMmZKL1VM?=
 =?utf-8?B?eHdmTVlPM1ZtU0wwc1kvQ2RDeXh4NE5oVktxTmFBQWpPNEpmNmx5WklYdEZ2?=
 =?utf-8?B?S2RjaVFMaHg0YkhMZnIzSnZwcVljeDNmY21wNk9LOGJvcDRPOGs5YjNvRkRu?=
 =?utf-8?B?L1huZkY0RVNKczh2NVVrS3B3TTJyVVBFQ1ZMdm1wNysyT2pkRE5KQXNjZlRa?=
 =?utf-8?B?andUSy9CR3B2WkQ5TzlsRXduSHBZLzFRaStSanRpbHVEYkMzRTNzek1NSEdu?=
 =?utf-8?B?cGhYdlNlNllFZjhucUFtMzVHekRMUzFVdUVYb1JoUjVzNVQ1aW5ibmgwTFpo?=
 =?utf-8?B?NFh6MTJtVkd1R2NpMkxINzEyUlRhb2J3OTJqc2dvS0pCZ1lLR2Z3Nmp0YmRu?=
 =?utf-8?B?QTFGS2pYaDF0RmR6ZUNBdVRBeFhnPT0=?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 43070d6c-f1f5-446c-2752-08d9f301d848
X-MS-Exchange-CrossTenant-AuthSource: BLAPR10MB4835.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Feb 2022 17:12:30.1596 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: AwAxnb/XRfY/lWpF+N0rPQ8U8hB4aIl9SmLiKu20J/05PEksyZFFdqMZJ8vN1t84VHU7sbJx7EQvcVPeX2HdWr8KK9pQppcNIa+sks6bAHc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR10MB3209
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10262
 signatures=677614
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999
 spamscore=0
 phishscore=0 bulkscore=0 suspectscore=0 malwarescore=0 mlxscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2201110000 definitions=main-2202180110
X-Proofpoint-GUID: T-f_vWGSaXq8N9nTLNwAdQMixBtWtPsT
X-Proofpoint-ORIG-GUID: T-f_vWGSaXq8N9nTLNwAdQMixBtWtPsT
Received-SPF: pass client-ip=205.220.177.32;
 envelope-from=joao.m.martins@oracle.com; helo=mx0b-00069f02.pphosted.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Cc: Eduardo Habkost <ehabkost@redhat.com>,
 "Michael S . Tsirkin" <mst@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 Daniel Jordan <daniel.m.jordan@oracle.com>,
 David Edmondson <david.edmondson@oracle.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>,
 Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>,
 Ani Sinha <ani@anisinha.ca>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/14/22 15:31, Igor Mammedov wrote:
> On Mon, 14 Feb 2022 15:05:00 +0000
> Joao Martins <joao.m.martins@oracle.com> wrote:
>> On 2/14/22 14:53, Igor Mammedov wrote:
>>> On Mon,  7 Feb 2022 20:24:20 +0000
>>> Joao Martins <joao.m.martins@oracle.com> wrote:
>>>> +{
>>>> +    PCMachineClass *pcmc = PC_MACHINE_GET_CLASS(pcms);
>>>> +    X86MachineState *x86ms = X86_MACHINE(pcms);
>>>> +    ram_addr_t device_mem_size = 0;
>>>> +    uint32_t eax, vendor[3];
>>>> +
>>>> +    host_cpuid(0x0, 0, &eax, &vendor[0], &vendor[2], &vendor[1]);
>>>> +    if (!IS_AMD_VENDOR(vendor)) {
>>>> +        return;
>>>> +    }
>>>> +
>>>> +    if (pcmc->has_reserved_memory &&
>>>> +       (machine->ram_size < machine->maxram_size)) {
>>>> +        device_mem_size = machine->maxram_size - machine->ram_size;
>>>> +    }
>>>> +
>>>> +    if ((x86ms->above_4g_mem_start + x86ms->above_4g_mem_size +
>>>> +         device_mem_size) < AMD_HT_START) {  
>>>   
>> And I was at two minds on this one, whether to advertise *always*
>> the 1T hole, regardless of relocation. Or account the size
>> we advertise for the pci64 hole and make that part of the equation
>> above. Although that has the flaw that the firmware at admin request
>> may pick some ludricous number (limited by maxphysaddr).
> 
> it this point we have only pci64 hole size (machine property),
> so I'd include that in equation to make firmware assign
> pci64 aperture above HT range.
> 
> as for checking maxphysaddr, we can only check 'default' PCI hole
> range at this stage (i.e. 1Gb aligned hole size after all possible RAM)
> and hard error on it.
> 

Igor, in the context of your comment above, I'll be introducing another
preparatory patch that adds up pci_hole64_size to pc_memory_init() such
that all used/max physaddr space checks are consolidated in pc_memory_init().

To that end, the changes involve mainly moves the the pcihost qdev creation
to be before pc_memory_init(). Q35 just needs a 2-line order change. i440fx
needs slightly more of a dance to extract that from i440fx_init() and also
because most i440fx state is private (hence the new helper for size). But
the actual initialization of I440fx/q35 pci host is still after pc_memory_init(),
it is just to extra pci_hole64_size from the object + user passed args (-global etc).

Raw staging changes below the scissors mark so far.

-->8--

diff --git a/hw/i386/pc.c b/hw/i386/pc.c
index b2e43eba1106..902977081350 100644
--- a/hw/i386/pc.c
+++ b/hw/i386/pc.c
@@ -875,7 +875,8 @@ static void x86_update_above_4g_mem_start(PCMachineState *pcms)
 void pc_memory_init(PCMachineState *pcms,
                     MemoryRegion *system_memory,
                     MemoryRegion *rom_memory,
-                    MemoryRegion **ram_memory)
+                    MemoryRegion **ram_memory,
+                    uint64_t pci_hole64_size)
 {
     int linux_boot, i;
     MemoryRegion *option_rom_mr;
diff --git a/hw/i386/pc_piix.c b/hw/i386/pc_piix.c
index d9b344248dac..5a608e30e28f 100644
--- a/hw/i386/pc_piix.c
+++ b/hw/i386/pc_piix.c
@@ -91,6 +91,8 @@ static void pc_init1(MachineState *machine,
     MemoryRegion *pci_memory;
     MemoryRegion *rom_memory;
     ram_addr_t lowmem;
+    uint64_t hole64_size;
+    DeviceState *i440fx_dev;

     /*
      * Calculate ram split, for memory below and above 4G.  It's a bit
@@ -164,9 +166,13 @@ static void pc_init1(MachineState *machine,
         pci_memory = g_new(MemoryRegion, 1);
         memory_region_init(pci_memory, NULL, "pci", UINT64_MAX);
         rom_memory = pci_memory;
+        i440fx_dev = qdev_new(host_type);
+        hole64_size = i440fx_pci_hole64_size(i440fx_dev);
     } else {
         pci_memory = NULL;
         rom_memory = system_memory;
+        i440fx_dev = NULL;
+        hole64_size = 0;
     }

     pc_guest_info_init(pcms);
@@ -183,7 +189,7 @@ static void pc_init1(MachineState *machine,
     /* allocate ram and load rom/bios */
     if (!xen_enabled()) {
         pc_memory_init(pcms, system_memory,
-                       rom_memory, &ram_memory);
+                       rom_memory, &ram_memory, hole64_size);
     } else {
         pc_system_flash_cleanup_unused(pcms);
         if (machine->kernel_filename != NULL) {
@@ -199,7 +205,7 @@ static void pc_init1(MachineState *machine,

         pci_bus = i440fx_init(host_type,
                               pci_type,
-                              &i440fx_state,
+                              i440fx_dev, &i440fx_state,
                               system_memory, system_io, machine->ram_size,
                               x86ms->below_4g_mem_size,
                               x86ms->above_4g_mem_size,
diff --git a/hw/i386/pc_q35.c b/hw/i386/pc_q35.c
index 1780f79bc127..b7cf44d4755e 100644
--- a/hw/i386/pc_q35.c
+++ b/hw/i386/pc_q35.c
@@ -203,12 +203,13 @@ static void pc_q35_init(MachineState *machine)
                             pcms->smbios_entry_point_type);
     }

-    /* allocate ram and load rom/bios */
-    pc_memory_init(pcms, get_system_memory(), rom_memory, &ram_memory);
-
     /* create pci host bus */
     q35_host = Q35_HOST_DEVICE(qdev_new(TYPE_Q35_HOST_DEVICE));

+    /* allocate ram and load rom/bios */
+    pc_memory_init(pcms, get_system_memory(), rom_memory, &ram_memory,
+                   q35_host->mch.pci_hole64_size);
+
     object_property_add_child(qdev_get_machine(), "q35", OBJECT(q35_host));
     object_property_set_link(OBJECT(q35_host), MCH_HOST_PROP_RAM_MEM,
                              OBJECT(ram_memory), NULL);
diff --git a/hw/pci-host/i440fx.c b/hw/pci-host/i440fx.c
index e08716142b6e..c5cc28250d5c 100644
--- a/hw/pci-host/i440fx.c
+++ b/hw/pci-host/i440fx.c
@@ -237,7 +237,15 @@ static void i440fx_realize(PCIDevice *dev, Error **errp)
     }
 }

+uint64_t i440fx_pci_hole64_size(DeviceState *i440fx_dev)
+{
+        I440FXState *i440fx = I440FX_PCI_HOST_BRIDGE(i440fx_dev);
+
+        return i440fx->pci_hole64_size;
+}
+
 PCIBus *i440fx_init(const char *host_type, const char *pci_type,
+                    DeviceState *dev,
                     PCII440FXState **pi440fx_state,
                     MemoryRegion *address_space_mem,
                     MemoryRegion *address_space_io,
@@ -247,7 +255,6 @@ PCIBus *i440fx_init(const char *host_type, const char *pci_type,
                     MemoryRegion *pci_address_space,
                     MemoryRegion *ram_memory)
 {
-    DeviceState *dev;
     PCIBus *b;
     PCIDevice *d;
     PCIHostState *s;
@@ -255,7 +262,6 @@ PCIBus *i440fx_init(const char *host_type, const char *pci_type,
     unsigned i;
     I440FXState *i440fx;

-    dev = qdev_new(host_type);
     s = PCI_HOST_BRIDGE(dev);
     b = pci_root_bus_new(dev, NULL, pci_address_space,
                          address_space_io, 0, TYPE_PCI_BUS);
diff --git a/include/hw/i386/pc.h b/include/hw/i386/pc.h
index 9c9f4ac74810..d8b9c4ebd748 100644
--- a/include/hw/i386/pc.h
+++ b/include/hw/i386/pc.h
@@ -158,7 +158,8 @@ void xen_load_linux(PCMachineState *pcms);
 void pc_memory_init(PCMachineState *pcms,
                     MemoryRegion *system_memory,
                     MemoryRegion *rom_memory,
-                    MemoryRegion **ram_memory);
+                    MemoryRegion **ram_memory,
+                    uint64_t pci_hole64_size);
 uint64_t pc_pci_hole64_start(void);
 DeviceState *pc_vga_init(ISABus *isa_bus, PCIBus *pci_bus);
 void pc_basic_device_init(struct PCMachineState *pcms,
diff --git a/include/hw/pci-host/i440fx.h b/include/hw/pci-host/i440fx.h
index f068aaba8fda..1299d6a2b0e4 100644
--- a/include/hw/pci-host/i440fx.h
+++ b/include/hw/pci-host/i440fx.h
@@ -36,7 +36,7 @@ struct PCII440FXState {
 #define TYPE_IGD_PASSTHROUGH_I440FX_PCI_DEVICE "igd-passthrough-i440FX"

 PCIBus *i440fx_init(const char *host_type, const char *pci_type,
-                    PCII440FXState **pi440fx_state,
+                    DeviceState *dev, PCII440FXState **pi440fx_state,
                     MemoryRegion *address_space_mem,
                     MemoryRegion *address_space_io,
                     ram_addr_t ram_size,
@@ -45,5 +45,6 @@ PCIBus *i440fx_init(const char *host_type, const char *pci_type,
                     MemoryRegion *pci_memory,
                     MemoryRegion *ram_memory);

+uint64_t i440fx_pci_hole64_size(DeviceState *i440fx_dev);

 #endif

