Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BF7914C36EE
	for <lists+qemu-devel@lfdr.de>; Thu, 24 Feb 2022 21:36:42 +0100 (CET)
Received: from localhost ([::1]:45022 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nNKqv-0003fu-DX
	for lists+qemu-devel@lfdr.de; Thu, 24 Feb 2022 15:36:41 -0500
Received: from eggs.gnu.org ([209.51.188.92]:49274)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <joao.m.martins@oracle.com>)
 id 1nNKpP-0002Ox-J4
 for qemu-devel@nongnu.org; Thu, 24 Feb 2022 15:35:07 -0500
Received: from mx0a-00069f02.pphosted.com ([205.220.165.32]:33566)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <joao.m.martins@oracle.com>)
 id 1nNKpL-0005QY-No
 for qemu-devel@nongnu.org; Thu, 24 Feb 2022 15:35:07 -0500
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 21OKTRMc000507; 
 Thu, 24 Feb 2022 20:34:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=message-id : date :
 subject : to : cc : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=corp-2021-07-09;
 bh=30IkcNGzoW6g5o8KauHztwotJw2Fhd/MjRjNctm3e/A=;
 b=fbYuDPtVX/QUJu+Q/4Ap1ftrBZSguLohG/+eVW+mKZCOu3rhxY5oVHkzvNNvZrUvxTcP
 PjKHKx4FBAshfiCZ8d1Ank1yy1kcrNprXfulDFE3AAsRo6zXvR3iAo24+EZv85xSBUbp
 KXasnaVnjkSZgr6m+29xd100tgIMom1inaRy9BeOj43UUhnsxCJSJ0b3mpJ7FJCp0g1e
 AN+dKOBfm+r/ziQIsR6AbOJHYyTuG0Hr+rfxhwN0nIqU0XqJXgLDXnAMzeYA66ZYVSxa
 d7BIdnlfwL3iwNM+J/q8nlk36ClrRAAsE/RfHbYjDTVFATfezyIBZRSPPhrsLZ4sgD65 xg== 
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
 by mx0b-00069f02.pphosted.com with ESMTP id 3ect7arh7m-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 24 Feb 2022 20:34:54 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
 by aserp3020.oracle.com (8.16.1.2/8.16.1.2) with SMTP id 21OKGdJg050148;
 Thu, 24 Feb 2022 20:34:53 GMT
Received: from nam12-mw2-obe.outbound.protection.outlook.com
 (mail-mw2nam12lp2041.outbound.protection.outlook.com [104.47.66.41])
 by aserp3020.oracle.com with ESMTP id 3eb4843eka-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 24 Feb 2022 20:34:53 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TH0t4G6N6S8HJ8Ht6RNNCDTDIUhxyP3Ivzw/fbdOEJ48EnzUljlLG73hH231Noy6Jh+gMGuV8UlD/OuRVG/sDCFkyuX9pjYjQwFm+C04m5aSMERL59kDiQppsxIROd+JSejSQMnZjynnPtXb9F/6yRxmh5UzI1gd+3dUe6rkfKclfZDK8aTfxhqzVtSLMf/IaxtkdmQeU4JHqzDJWUHYpCSucRzCkqor1E+mZ3m7w8VmIV7eZaBtA180jBHZkWiofY5osqV9gyU3LB3EGcUyR1sBo6a3nG1R6NU2Tdu9xflnwB2mWlKCzmrWlmk8wFzvpYZAinY1In1uYgTzMO78Gg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=30IkcNGzoW6g5o8KauHztwotJw2Fhd/MjRjNctm3e/A=;
 b=CWi6fXxGYmKB9Qi+ru9uNHUx7p0VbvPf20TTsV2wAVBHfqRyewmKVTFJdfdJ2srGPzuJnIfJ28YbChwSrq28yFB4T8DYE2PTjG0fd5ymXE38j9pexEFB8YThk6urwwZvmKAOzd3BRhlzo9dlBU26imnme7DIJmxKBvhjcG7hzBrkglflbz5dIdWtlRZR4n/mEDcy6AIvoIx0gR8WMNH+Cc8+y8lIFV/gidLoSo8FeCkzY2szqLQi+x50RiIqrVB5t9hP2LE+/osslcYaysPaqsTRmEGZcflUu06NsMPicZknsOxO95B+nCnta2FhPKVY3TYZWS2OUapEvDxWCN59fg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=30IkcNGzoW6g5o8KauHztwotJw2Fhd/MjRjNctm3e/A=;
 b=C+ZFBcLswv+Mq01+8MBKVYBp+RMFOztHieQWPc+QZKdRw7JRzwn7AMqYJiKsf97m6JZkAvPyI6MZdjlWYOQtabbsT8L8sfhOJSpusm0inbT85GPQcPn490KOlWyFENScRjaJJN4s7WefFQY44wLnuRM72tPVWbos0NxiKwCM8Zc=
Received: from BLAPR10MB4835.namprd10.prod.outlook.com (2603:10b6:208:331::11)
 by BN6PR10MB1587.namprd10.prod.outlook.com (2603:10b6:404:47::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5017.21; Thu, 24 Feb
 2022 20:34:51 +0000
Received: from BLAPR10MB4835.namprd10.prod.outlook.com
 ([fe80::750f:bf1d:1599:3406]) by BLAPR10MB4835.namprd10.prod.outlook.com
 ([fe80::750f:bf1d:1599:3406%6]) with mapi id 15.20.5017.024; Thu, 24 Feb 2022
 20:34:50 +0000
Message-ID: <5cae0afc-df3e-5dc6-d11b-2f7d931ba5e6@oracle.com>
Date: Thu, 24 Feb 2022 20:34:40 +0000
Subject: Re: [PATCH v3 4/6] i386/pc: relocate 4g start to 1T where applicable
Content-Language: en-US
To: "Michael S. Tsirkin" <mst@redhat.com>
References: <20220223184455.9057-5-joao.m.martins@oracle.com>
 <20220223161744-mutt-send-email-mst@kernel.org>
 <5fee0e05-e4d1-712b-9ad1-f009aba431ea@oracle.com>
 <c28ade30-fbea-4d3a-3b11-356c02abaabb@oracle.com>
 <20220224122146-mutt-send-email-mst@kernel.org>
 <7afb8caf-5c98-d6db-d3e5-6e08b2832d57@oracle.com>
 <20220224131607-mutt-send-email-mst@kernel.org>
 <f19dd8be-f923-fd7d-c54d-a54fd775dcc5@oracle.com>
 <20220224144800-mutt-send-email-mst@kernel.org>
 <37df5f3a-283a-a016-311f-8281bbacda19@oracle.com>
 <20220224150626-mutt-send-email-mst@kernel.org>
From: Joao Martins <joao.m.martins@oracle.com>
In-Reply-To: <20220224150626-mutt-send-email-mst@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM0PR06CA0112.eurprd06.prod.outlook.com
 (2603:10a6:208:ab::17) To BLAPR10MB4835.namprd10.prod.outlook.com
 (2603:10b6:208:331::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 5ab90fb1-c462-4f54-b57e-08d9f7d51b4a
X-MS-TrafficTypeDiagnostic: BN6PR10MB1587:EE_
X-Microsoft-Antispam-PRVS: <BN6PR10MB1587D96F131D0C0D99FA9381BB3D9@BN6PR10MB1587.namprd10.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 668Hw/ELnHJ29dOxBopezm94ooMusc2bik9wZ9MQxAZGZH137gyetSTXr+5q3HK8stKOI1kkyC+WEArhQZtm0WVW1iQ96J+hkTAVECLfH+anwgQdCf/tyaZOxUAuOBGc6lFC8ggA5htfMGnrHCs5XW9pOLaiO6gPkVtb7D51f5E4Fv8PYwaAere/aq4vZbXl/FNqa9tPZfB4nN1JfjkBeSt7e+3Ylr8PFGQeUvd6ZwVGgOIDZqbHjmh5lNdCtYcM8yOaL5eWyZkASdbZwT+IEzIge4tmrZ7llSXqsQakudJ6uH8QtvXGTFgBSCHYssNrX4hRQ4TftvjYQsieS/Wxg+Coq+ZXnwqv4essymTpnSgT/+Joqaptg1Cw0f+o24+igfr6sQJpw/9mRlgUWSDf7lPRG4IXQbCk/6Bq0v9gWx0VT2cXQlpVPi/IBreSGiPO9ysdJ2Bhsdw0ZtvC/wS3Nircu7V3ODG31mG0fcIN+j2mbS4oelyXqZZRWOEK3qjECvANoOZHf62JWF6NAlvkTR4c1lKjukztcHQxfvLgsxbS6F0q5Dy7lTxEFRrGGgHdQtEUDmOqi1QR7AVGttvkB0CiIPPZvDS0fZS+xQrqHBY/UyxCNSK5cEWN+Eitzl2R0oYK0DCdGzhaFhCFCuzjV331eFIHRwjnTEoMiBES+tQqRym81FH2K6vqWcbf9v/mfDyR7bpPib0CV70g4j1cYA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BLAPR10MB4835.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(66476007)(66556008)(2906002)(66946007)(31686004)(8676002)(6486002)(36756003)(4326008)(30864003)(7416002)(8936002)(5660300002)(38100700002)(26005)(316002)(54906003)(186003)(31696002)(6512007)(6506007)(86362001)(508600001)(53546011)(2616005)(83380400001)(6916009)(6666004)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ODVhMm1LSkYvbk9OYlgvVENsOUVCQ3dOQmxNck1ZM3Z0TWxMbktUcmZhaTVM?=
 =?utf-8?B?YW5RWXdVOFloN01WZnVobkt3NTY3SlhUUVAvQVFLOG1KNUYwNUtPN1prSzhs?=
 =?utf-8?B?cE1GMG1aMXdSOEllUFg1MUpQaGE2bDgxRkMwV1BKbkMyY2JhV3FGR2kyL2Jq?=
 =?utf-8?B?ekZiT1NxRUNZSVN5dUNCTWNJeWdtN3RxQ0d3Q25wbGVqWnZsSGw2MVhwK0VU?=
 =?utf-8?B?OTlhN25yY2tYOGZyMXI3eHRHcTFWODQ3RjhvTWRodHdMYzgvVzQ3M1V4dC9J?=
 =?utf-8?B?VERnNmxUdUYrOGtkR1k2ZUFMemlHYUYxWEt1UCsrUEF4T052eTdSOGltS0ZK?=
 =?utf-8?B?bmxmUnl5OXlldkpQK1hGRyt6bkt2ejV1ZTRyZTlBcWczQ1ZSSU5sbXQ4cjlK?=
 =?utf-8?B?eWRqcEQxSk8vdkVqTGtRQ3l6QnR4ejNTWHRwQWY0OHVxMTBKcVJMWWJKZEtm?=
 =?utf-8?B?aUYycS9wTm5xaEsyREtoRGR4YmxTSnhFeVNtRzN5QmlRRkRKVU4zOVQ5blhy?=
 =?utf-8?B?VWw5dk5OSGw3OEtoOEZYZFlkbS9DTnFnNWVKY1lCdkFNQklrOWJkakZtTHZi?=
 =?utf-8?B?MGVRcWpXdUp1VEkxSkM0WGVuQ2hkUkFUb1VXNE9vNlU5NFJlNFR5a1AySFQy?=
 =?utf-8?B?ay91YklTcytGNEJ5YjFKR3JQOGJacUlFN3lVZ1FYaTdqUk5HQkdxNGtOY1ZK?=
 =?utf-8?B?QnBZbTNRbkw0T3dYUUliYkNYWTZXSU1GWEFiNHRlMU5VS0FwVkVodHk5VGQy?=
 =?utf-8?B?N1g0K0orWDYxL3lzZDhIKzAxZncrZUlrU3hRdG1kTjBUZHcyNFhRVU5yUE1J?=
 =?utf-8?B?cTJxaUJhRGdNN0NTUFk3NjBnenFTTmNpSExjdGZvV0FkQXd1RUNXdlBMOFJa?=
 =?utf-8?B?UmdTQkpMUFBua0VZMld5L1o5VXorUzlXQ2R3QTRPcVZPbFVuQ09zNy9DRDBr?=
 =?utf-8?B?QXNvUEc4bmd2cTBOUG1DSFlBL3ZMVitQcEo4MjM3RnZtZ05qZDFkMTYrVFJB?=
 =?utf-8?B?MDNTa3p6dWplMWFhcllaVFFQN3NIdzlOaDFqeTNmYVVQYmRySDJFdUF4N01i?=
 =?utf-8?B?ZzRFWUErYUhON2lVaDY4MDhpbGJ6dGFHN0htUE83N25pWm04RkpWVFFRM3g1?=
 =?utf-8?B?bUw4eHo0ZHYzczJkVFdwSXE1M0kweXdIRnpzc3pycTdrRkZTNk0xR1BSYXgv?=
 =?utf-8?B?SjlvS0lPcEJoRlZCMEo4RFJOL0U1VzVST2JTS1BmOXAvL3lSOGRjZWl3c2FJ?=
 =?utf-8?B?WVQxcE91dnYvRFByWkRGdjVuemtQd0hCWWRCSlFjME5ZUzFGYU5UdlBOaHpT?=
 =?utf-8?B?VGYrVk5nSU9vUUtGd0Y3OW55VmEzWmhEOUcyY29jcU5ES2JRZ3h0K0FKbllP?=
 =?utf-8?B?T1NDUTQwR0RVdzgyZXA0aWZGeGl1d0JiY3poRlRMRDM4NkdxY1RYaGdlUHhC?=
 =?utf-8?B?WElrblVyb1l5czZKRkFjYnJBY3ZGaVN0Q2tzWEd0UmQwM0UzS05kWTVHRXZl?=
 =?utf-8?B?dGF4YWw0ZCtHRFoyMWhHMlRUK0EzSlB3QXFaL2xvZGJvVkU4Yzh6TWh2QXdR?=
 =?utf-8?B?TjVMMG96L0RnbUhKUVBwWmpFMTIvdzdKQTByemlVTUM4bFY1V1Z1dFVwTGFC?=
 =?utf-8?B?Q2ZJazM3SzRSNFEweGZnb2lxRy9CUzlFRTBJcUhWai9IdDBmWlM1dmEvVWJ1?=
 =?utf-8?B?VmNwaFB3NllSRmNiN0o0Q2liTXVhc3lGZUhneDY4cUQvTFNNK0hCWk5NWlVq?=
 =?utf-8?B?V0dSOXREMDVzNm1MWkY3MitGN1lYUWdpV3gvdWsxL2tZOG8yZ0NoeXErSS92?=
 =?utf-8?B?a0NzaEZRM3dCMnE2YnJaY0prcVdDQjUvNEI3NE1ZbjhISlNnY1pTV1d6ZjB4?=
 =?utf-8?B?RFpLbE9FOC9rcXdJdm1NRy9QWE1DdnNoY09xcUVOMVUvL3pobStVeUJLckdO?=
 =?utf-8?B?ZTR2anNFVHdRbXRBTjRjYlhNM3ZvQlJ3MlpFVE4yL3Y0Qy9TT2VpcWIyU1hl?=
 =?utf-8?B?aFhvZTRPdDg0dlduUE1wUnhVYjNBVWR4QzM1c3RETnVnalRuSkdSdURoblpv?=
 =?utf-8?B?bjExaFp1SjdnWUV4R2NtT1VMZTZWZ211QkdoNldYSHI5b3hQcUQ4S05ERThq?=
 =?utf-8?B?STRrdlE5dkJmMnJlWU9lU1VzQmZQNnh5bXVhTVdkeGdhTVMwanJCWFoydzJx?=
 =?utf-8?B?OTlpVS80Q2VjdTBPeXNiSzVZWFU4VGUxVzFkbHhTWDBWRW9Ianh1YU9IeGZj?=
 =?utf-8?Q?gTeya2+eF//9yVPXm+hHREJ9qfrlfpAyjBa8OLvu2E=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5ab90fb1-c462-4f54-b57e-08d9f7d51b4a
X-MS-Exchange-CrossTenant-AuthSource: BLAPR10MB4835.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Feb 2022 20:34:50.8548 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5waNNHwAdB+hjDF/WOCirZo1hyJIH7+JyWtLn4zkyDjl8Nqv0EGvQsQHI7o0mHQPTio/Sf7IZKrQF6U/jcfgVdsheKrMaj19GM4adcfoA4U=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR10MB1587
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10268
 signatures=684655
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0
 malwarescore=0
 mlxlogscore=999 adultscore=0 bulkscore=0 phishscore=0 suspectscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2201110000 definitions=main-2202240112
X-Proofpoint-GUID: _ZSIv3LBJMzU-V0zP0yTdsVHVK99zLZk
X-Proofpoint-ORIG-GUID: _ZSIv3LBJMzU-V0zP0yTdsVHVK99zLZk
Received-SPF: pass client-ip=205.220.165.32;
 envelope-from=joao.m.martins@oracle.com; helo=mx0a-00069f02.pphosted.com
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
Cc: Eduardo Habkost <ehabkost@redhat.com>, Jason Wang <jasowang@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 Daniel Jordan <daniel.m.jordan@oracle.com>,
 David Edmondson <david.edmondson@oracle.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Ani Sinha <ani@anisinha.ca>,
 Igor Mammedov <imammedo@redhat.com>,
 Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/24/22 20:12, Michael S. Tsirkin wrote:
> On Thu, Feb 24, 2022 at 08:04:48PM +0000, Joao Martins wrote:
>> On 2/24/22 19:54, Michael S. Tsirkin wrote:
>>> On Thu, Feb 24, 2022 at 07:44:26PM +0000, Joao Martins wrote:
>>>> On 2/24/22 18:30, Michael S. Tsirkin wrote:
>>>>> On Thu, Feb 24, 2022 at 05:54:58PM +0000, Joao Martins wrote:
>>>>>> On 2/24/22 17:23, Michael S. Tsirkin wrote:
>>>>>>> On Thu, Feb 24, 2022 at 04:07:22PM +0000, Joao Martins wrote:
>>>>>>>> On 2/23/22 23:35, Joao Martins wrote:
>>>>>>>>> On 2/23/22 21:22, Michael S. Tsirkin wrote:
>>>>>>>>>>> +static void x86_update_above_4g_mem_start(PCMachineState *pcms,
>>>>>>>>>>> +                                          uint64_t pci_hole64_size)
>>>>>>>>>>> +{
>>>>>>>>>>> +    X86MachineState *x86ms = X86_MACHINE(pcms);
>>>>>>>>>>> +    uint32_t eax, vendor[3];
>>>>>>>>>>> +
>>>>>>>>>>> +    host_cpuid(0x0, 0, &eax, &vendor[0], &vendor[2], &vendor[1]);
>>>>>>>>>>> +    if (!IS_AMD_VENDOR(vendor)) {
>>>>>>>>>>> +        return;
>>>>>>>>>>> +    }
>>>>>>>>>>
>>>>>>>>>> Wait a sec, should this actually be tying things to the host CPU ID?
>>>>>>>>>> It's really about what we present to the guest though,
>>>>>>>>>> isn't it?
>>>>>>>>>
>>>>>>>>> It was the easier catch all to use cpuid without going into
>>>>>>>>> Linux UAPI specifics. But it doesn't have to tie in there, it is only
>>>>>>>>> for systems with an IOMMU present.
>>>>>>>>>
>>>>>>>>>> Also, can't we tie this to whether the AMD IOMMU is present?
>>>>>>>>>>
>>>>>>>>> I think so, I can add that. Something like a amd_iommu_exists() helper
>>>>>>>>> in util/vfio-helpers.c which checks if there's any sysfs child entries
>>>>>>>>> that start with ivhd in /sys/class/iommu/. Given that this HT region is
>>>>>>>>> hardcoded in iommu reserved regions since >=4.11 (to latest) I don't think it's
>>>>>>>>> even worth checking the range exists in:
>>>>>>>>>
>>>>>>>>> 	/sys/kernel/iommu_groups/0/reserved_regions
>>>>>>>>>
>>>>>>>>> (Also that sysfs ABI is >= 4.11 only)
>>>>>>>>
>>>>>>>> Here's what I have staged in local tree, to address your comment.
>>>>>>>>
>>>>>>>> Naturally the first chunk is what's affected by this patch the rest is a
>>>>>>>> precedessor patch to introduce qemu_amd_iommu_is_present(). Seems to pass
>>>>>>>> all the tests and what not.
>>>>>>>>
>>>>>>>> I am not entirely sure this is the right place to put such a helper, open
>>>>>>>> to suggestions. wrt to the naming of the helper, I tried to follow the rest
>>>>>>>> of the file's style.
>>>>>>>>
>>>>>>>> diff --git a/hw/i386/pc.c b/hw/i386/pc.c
>>>>>>>> index a9be5d33a291..2ea4430d5dcc 100644
>>>>>>>> --- a/hw/i386/pc.c
>>>>>>>> +++ b/hw/i386/pc.c
>>>>>>>> @@ -868,10 +868,8 @@ static void x86_update_above_4g_mem_start(PCMachineState *pcms,
>>>>>>>>                                            uint64_t pci_hole64_size)
>>>>>>>>  {
>>>>>>>>      X86MachineState *x86ms = X86_MACHINE(pcms);
>>>>>>>> -    uint32_t eax, vendor[3];
>>>>>>>>
>>>>>>>> -    host_cpuid(0x0, 0, &eax, &vendor[0], &vendor[2], &vendor[1]);
>>>>>>>> -    if (!IS_AMD_VENDOR(vendor)) {
>>>>>>>> +    if (!qemu_amd_iommu_is_present()) {
>>>>>>>>          return;
>>>>>>>>      }
>>>>>>>>
>>>>>>>> diff --git a/include/qemu/osdep.h b/include/qemu/osdep.h
>>>>>>>> index 7bcce3bceb0f..eb4ea071ecec 100644
>>>>>>>> --- a/include/qemu/osdep.h
>>>>>>>> +++ b/include/qemu/osdep.h
>>>>>>>> @@ -637,6 +637,15 @@ char *qemu_get_host_name(Error **errp);
>>>>>>>>   */
>>>>>>>>  size_t qemu_get_host_physmem(void);
>>>>>>>>
>>>>>>>> +/**
>>>>>>>> + * qemu_amd_iommu_is_present:
>>>>>>>> + *
>>>>>>>> + * Operating system agnostic way of querying if an AMD IOMMU
>>>>>>>> + * is present.
>>>>>>>> + *
>>>>>>>> + */
>>>>>>>> +bool qemu_amd_iommu_is_present(void);
>>>>>>>> +
>>>>>>>>  /*
>>>>>>>>   * Toggle write/execute on the pages marked MAP_JIT
>>>>>>>>   * for the current thread.
>>>>>>>> diff --git a/util/oslib-posix.c b/util/oslib-posix.c
>>>>>>>> index f2be7321c59f..54cef21217c4 100644
>>>>>>>> --- a/util/oslib-posix.c
>>>>>>>> +++ b/util/oslib-posix.c
>>>>>>>> @@ -982,3 +982,32 @@ size_t qemu_get_host_physmem(void)
>>>>>>>>  #endif
>>>>>>>>      return 0;
>>>>>>>>  }
>>>>>>>> +
>>>>>>>> +bool qemu_amd_iommu_is_present(void)
>>>>>>>> +{
>>>>>>>> +    bool found = false;
>>>>>>>> +#ifdef CONFIG_LINUX
>>>>>>>> +    struct dirent *entry;
>>>>>>>> +    char *path;
>>>>>>>> +    DIR *dir;
>>>>>>>> +
>>>>>>>> +    path = g_strdup_printf("/sys/class/iommu");
>>>>>>>> +    dir = opendir(path);
>>>>>>>> +    if (!dir) {
>>>>>>>> +        g_free(path);
>>>>>>>> +        return found;
>>>>>>>> +    }
>>>>>>>> +
>>>>>>>> +    do {
>>>>>>>> +            entry = readdir(dir);
>>>>>>>> +            if (entry && !strncmp(entry->d_name, "ivhd", 4)) {
>>>>>>>> +                found = true;
>>>>>>>> +                break;
>>>>>>>> +            }
>>>>>>>> +    } while (entry);
>>>>>>>> +
>>>>>>>> +    g_free(path);
>>>>>>>> +    closedir(dir);
>>>>>>>> +#endif
>>>>>>>> +    return found;
>>>>>>>> +}
>>>>>>>
>>>>>>> why are we checking whether an AMD IOMMU is present
>>>>>>> on the host? 
>>>>>>> Isn't what we care about whether it's
>>>>>>> present in the VM? What we are reserving after all
>>>>>>> is a range of GPAs, not actual host PA's ...
>>>>>>>
>>>>>> Right.
>>>>>>
>>>>>> But any DMA map done by VFIO/IOMMU using those GPA ranges will fail,
>>>>>> and so we need to not map that portion of address space entirely
>>>>>> and use some other portion of the GPA-space. This has to
>>>>>> do with host IOMMU which is where the DMA mapping of guest PA takes
>>>>>> place. So, if you do not have an host IOMMU, you can't
>>>>>> service guest DMA/PCIe services via VFIO through the host IOMMU, therefore you
>>>>>> don't need this problem.
>>>>>>
>>>>>> Whether one uses a guest IOMMU or not does not affect the result,
>>>>>> it would be more of a case of mimicking real hardware not fixing
>>>>>> the issue of this series.
>>>>>
>>>>>
>>>>> Hmm okay ... my first reaction was to say let's put it under VFIO then.
>>>>> And ideally move the logic reporting reserved ranges there too.
>>>>> However, I think vdpa has the same issue too.
>>>>> CC Jason for an opinion.
>>>>
>>>> It does have the same problem.
>>>>
>>>> This is not specific to VFIO, it's to anything that uses the iommu.
>>>
>>> Right. Most VMs don't use the host IOMMU though ;) It's unfortunate
>>> that we don't have a global "enable-vfio" flag since vfio devices
>>> can be hot-plugged. I think this is not the first time we wanted
>>> something like this, right Alex?
>>>
>>>> It's
>>>> just that VFIO doesn't let you shoot in the foot :)
>>>>
>>>> vDPA would need to validate iova ranges as well to prevent mapping on
>>>> reserved IOVAs similar to commit 9b77e5c7984 ("vfio/type1: check dma
>>>> map request is within a valid iova range"). Now you could argue that
>>>> it's an IOMMU core problem, maybe.
>>>>
>>>> But I this as a separate problem,
>>>> because regardless of said validation, your guest provisioning
>>>> is still going to fail for guests with >=1010G of max GPA and even if
>>>> it doesn't fail you shouldn't be letting it DMA map those in the first
>>>> place (e.g. you could see spurious INVALID_DEVICE_REQUEST fault events
>>>> from IOMMU if DMA is attempted over the first megabyte of that 1T hole).
>>>
>>> I wonder what's the status on a system without an IOMMU.
>>>
>> In theory you should be OK. Also it's worth keeping in mind that AMD machines
>> with >=1T have this 12G hole marked as Reserved, so even DMA at last when CPU
>> is the initiator should be fine on worst case scenario.
> 
> Not sure I understand this last sentence.
> 
I was trying to say that the E820 from hardware is marked as Reserved and any DMA
from/to endpoints from kernel-supplied CPU addresses will use those reserved ranges.

>>>>> Also, some concerns
>>>>> - I think this changes memory layout for working VMs not using VFIO.
>>>>>   Better preserve the old layout for old machine types?
>>>>>
>>>> Oh definitely, and I do that in this series. See the last commit, and
>>>> in the past it was also a machine-property exposed to userspace.
>>>> Otherwise I would be breaking (badly) compat/migration.
>>>>
>>>> I would like to emphasize that these memory layout changes are *exclusive* and
>>>> *only* for hosts on AMD with guests memory being bigger than ~950G-~1010G.
>>>> It's not every guest, but a fairly limited subset of big-memory guests that
>>>> are not the norm.
>>>>
>>>> Albeit the phys-bits property errors might gives us a bit more trouble, so
>>>> it might help being more conservative.
>>>>
>>>>> - You mention the phys bits issue very briefly, and it's pretty
>>>>>   concerning.  Do we maybe want to also disable the work around if phys
>>>>>   bits is too small? 
>>>>
>>>> We are doing that here (well, v4), as suggested by Igor. Note that in this series
>>>> it's a warning, but v4 I have it as an error and with the 32-bit issues that
>>>> I found through qtest.
>>>>
>>>> I share the same concern as you over making this an error because of compatibility.
>>>> Perhaps, we could go back to the previous version and turn back into a warning and
>>>> additionally even disabling the relocation all together. Or if desired even
>>>> depending on a machine-property to enable it.
>>>
>>> I would be inclined to disable the relocation. And maybe block vfio? I'm
>>> not 100% sure about that last one, but this can be a vfio decision to
>>> make.
>>>
>> I don't see this as a VFIO problem (VFIO is actually being a good citizen and doing the
>> right thing :)). From my perspective this fix is also useful to vDPA (which we also care),
>> and thus will also let us avoid DMA mapping in these GPA ranges.
>>
>> The reason I mention VFIO in cover letter is that it's one visible UAPI change that
>> users will notice that suddenly their 1TB+ VMs break.
> 
> What I mean is that most VMs don't use either VFIO or VDPA.
> If we had VFIO,VDPA as an accelerator that needs to be listed
> upfront when qemu is started, we could solve this with
> a bit less risk by not changing anything for VMs without these two.
> 
That wouldn't work for the vfio/vdpa hotplug case (which we do use),
and part of the reason I picked to always avoid the 1TB hole. VFIO even tells
you what are those allowed IOVA ranges when you create the container.

The machine property, though, could communicate /the intent/ to add
any VFIO or vDPA devices in the future and maybe cover for that. That
let's one avoid any 'accelerator-only' problems and restrict the issues
of this series to VMs with VFIO/VDPA if the risk is a concern.

> Alex what do you think about adding this?
> 
> Given we do not have such a thing right now, one can get
> into a situation where phys bits limit CPU, then
> more memory is supplied than would fit above reserved region, then
> we stick the memory over the reserved region, and finally
> then vfio device is added.
> 
The current code considers the maximum possible address considering
memory hotplug, PCI hole64 and etc. So we would need to worry about
whether VFIO or VDPA is going to be hotplugged at some point in the
future during guest lifecycle, do decide to alter the memory layout
at guest provisioning.

> In this last configuration, should vfio device add fail?
> Or just warn and try to continue? I think we can code this last
> decision as part of vfio code and then Alex will get to decide ;)
> And yes, a similar thing with vdpa.
> 

Of all those cases I would feel the machine-property is better,
and more flexible than having VFIO/VDPA deal with a bad memory-layout and
discovering late stage that the user is doing something wrong (and thus
fail the DMA_MAP operation for those who do check invalid iovas)

