Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EF3C856A6CD
	for <lists+qemu-devel@lfdr.de>; Thu,  7 Jul 2022 17:22:12 +0200 (CEST)
Received: from localhost ([::1]:54534 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o9TKW-0004Lc-3N
	for lists+qemu-devel@lfdr.de; Thu, 07 Jul 2022 11:22:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56652)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <joao.m.martins@oracle.com>)
 id 1o9THm-00031V-SG
 for qemu-devel@nongnu.org; Thu, 07 Jul 2022 11:19:22 -0400
Received: from mx0a-00069f02.pphosted.com ([205.220.165.32]:22558)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <joao.m.martins@oracle.com>)
 id 1o9THj-0006KN-T2
 for qemu-devel@nongnu.org; Thu, 07 Jul 2022 11:19:22 -0400
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 267Er5Ag023516;
 Thu, 7 Jul 2022 15:19:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=message-id : date :
 subject : to : cc : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=corp-2021-07-09;
 bh=GbXyqw1uDEd3ZNEYVp+9u3m2gok8j6NJhCvQVbInIhA=;
 b=EkQr1NYv4LvdihbZxnviSRz34tAaWCpBPtqc0mDTmS8+6Ne+XDM3qp7OR5M6LopOh6f4
 gKffiGN46Sgofp5TLhV+i0+MeqJLKBr4/Yq13DHVkSS0+k8rd3c9YHZ0srDIsZJ45Zpt
 psuMICRHPyDS1jw3MyAsjmZ18J7/A2Hls1RtOUv/DfDM6D2NBZ+z59Yse5prb0lRx+6G
 rNOyUyMfg90GHepMjT2phi1AEMSxz4FuUjHua/iNSdZYNkfbrILO2qMS/k88twZBS0h/
 cDbDOGVfsuh7i9aQybjVbWlVrWJrz4SbrZhzG8IhbzDfJOAFOsBqZApxqhbonSsxW6EA CQ== 
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com
 (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3h4ubynhab-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 07 Jul 2022 15:19:08 +0000
Received: from pps.filterd
 (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
 by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.16.1.2/8.16.1.2)
 with SMTP id 267FF4pe034431; Thu, 7 Jul 2022 15:19:06 GMT
Received: from nam04-mw2-obe.outbound.protection.outlook.com
 (mail-mw2nam04lp2171.outbound.protection.outlook.com [104.47.73.171])
 by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com with ESMTP id
 3h4ud1sgd6-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 07 Jul 2022 15:19:06 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ca7Utnoyt9Mv45LHSMLYYgxxmG4Z+0+2BuSPAH8tN/ka++WnGQHLUWbtDusvrABrXd/J9nzSwCnf0oY0OnvHIf58Uvw2gZg7qF9/6TaTO5jfOHlymrWX/czvYr91ly6R1wL2Flfc/FNoQoW3rLpFjlWkeHbKYqOq87cotatNa0isCGHLIxLenqZCeCVCdZKIf2V0bF3lK5mdWRI2stKrTbyZkHgzPT/Te0Xd8mF0xK4TSetKbsZ+hf4l7Y97ayL4aTuF5ZEyiOKfhmG5/3qJhOuMohz8jt2oXmBtLIELx+8LIsIyZ8Gvx6rqcaezw0f+o0S3hvJ6BSkjubIk23Hj0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GbXyqw1uDEd3ZNEYVp+9u3m2gok8j6NJhCvQVbInIhA=;
 b=DS3tVoso3CiHYRVJSSoyx98PLa76tWCtsXn6YZX+PP95wlO2GuQg1ROMPRPwv3g0B1aYj781APPh34y6OxLUZXoPqk1wzrq/RkRRcP94n4SzqGZT8QGbAXeME9hHYmSTVWBJRlBEfhoNrKqLYTEROOQ5Fgh70PtyaVaxpWEIHYFxFgcmagwuBJEzIcbSVOvgkqwO0GHwmva7T9QaTbwWQs3IJdqEjJT+R4YZXlIZjWUCG6UMrmfE8/iLXpmKnQT7eGi6PcJBlmAKI/lfzrZ/px6R2C5rDdYlwY7Tnt2/taV714PNn67xeb5y9Lj9/DvZiOrfLqu1+xQDWFQoMhBsfg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GbXyqw1uDEd3ZNEYVp+9u3m2gok8j6NJhCvQVbInIhA=;
 b=W6ETplVwLeuKVSdyHKDocZcB8WkaYPzWC1QrBcJavYNfeyHJ8LoZINpU9S3yOKYOSjq48PCodyQuRBUTobcbXBgyZI7pCwMAv6DWuVTvAdt4v/dvuCHBXvQSwFe7iPD6qgNKI9zBNyoT9xQwhPvidVTPBUsKBzqShe5xXC3gJh4=
Received: from BLAPR10MB4835.namprd10.prod.outlook.com (2603:10b6:208:331::11)
 by SJ0PR10MB5552.namprd10.prod.outlook.com (2603:10b6:a03:3da::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5417.16; Thu, 7 Jul
 2022 15:19:04 +0000
Received: from BLAPR10MB4835.namprd10.prod.outlook.com
 ([fe80::b842:a301:806d:231e]) by BLAPR10MB4835.namprd10.prod.outlook.com
 ([fe80::b842:a301:806d:231e%9]) with mapi id 15.20.5417.016; Thu, 7 Jul 2022
 15:19:04 +0000
Message-ID: <d2ded99f-91e7-53af-9dd0-07b974ee27af@oracle.com>
Date: Thu, 7 Jul 2022 16:18:43 +0100
Subject: Re: [PATCH v6 06/10] i386/pc: factor out cxl range start to helper
Content-Language: en-US
To: Igor Mammedov <imammedo@redhat.com>
Cc: qemu-devel@nongnu.org, Eduardo Habkost <eduardo@habkost.net>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Alex Williamson <alex.williamson@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Ani Sinha <ani@anisinha.ca>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>,
 Jonathan Cameron <jonathan.cameron@huawei.com>
References: <20220701161014.3850-1-joao.m.martins@oracle.com>
 <20220701161014.3850-7-joao.m.martins@oracle.com>
 <20220707150015.22b9d29e@redhat.com>
From: Joao Martins <joao.m.martins@oracle.com>
In-Reply-To: <20220707150015.22b9d29e@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SI2PR04CA0014.apcprd04.prod.outlook.com
 (2603:1096:4:197::18) To BLAPR10MB4835.namprd10.prod.outlook.com
 (2603:10b6:208:331::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 8608fabe-df5f-48a9-a49f-08da602c06e5
X-MS-TrafficTypeDiagnostic: SJ0PR10MB5552:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 4prPZUIiiwj3TN2ENeLtDF+H6dQCS82TX6BOzE9VGm2kKkGyrmqOS2TNCRSmIFXDt61avcFLmaBjmrkGz3uPaDcAciQKX/H68esldIeaiYY0pHvbqTT3/JWKFQ3KSa0+pDlyuz6gih4MGqcGWqKnpLdIA0mTdSB/t9ArTWzfqYii6KD5XFRWU+bTG7wUdYAHkE9aXQkQOvFC8gLgFPqZQImf1x23mamutfaMn7RaJ/ZjgzoC2g+GHUiVeXpH1ClSHR+VQhitu0+9ZKjGEdwPhF8OKluLKV3/Mdh4jVFezIRdYCx4TdkoWsfiSu04WkAnJa7S307sybWcPMt7iXPbe1Fs1XJHndeGnU2+CuE2AqqJ/RvIj6zAc6r0cddGpAmAXc/2q9LJIoLDk6SIy+RmN6eva1DdX9IU5gVzvZog+WAp9DaOmv07Jzo87Tinl6dHnz7yJZSu0sTAlDZjrwNNF1nDIhfxuf+LIOdHCyi2aX5JdD/1Z93b3u513pHqviwa8WCp824b1zgeU5pwOQpUdMbbjXv8MLSEQeOKzt2MmhPZhyTK3/RmxiAHUH3mIo+MmQuJNRAWPjjdZ0tQlUIMFquVAdSmufO/g/a4pYiFYD7RD2rgztz782W6H9uEc5PVZJHz03OXSV9gIskHp21vK2kj6snCCC87cN4CdR1HaKmRNBh+BiI5TKtY+oj4J3u+ffcx2YHNbjgZM7tqo82Puf1Y9MWaun2RcFSWEHnHh7798Ti2DAK4EQCoG0kDqOFiH82zMnw4FxBX1y131mRzlcBUf+REZNVesK/d28VIfF1fXydb4/xKLioTGu6y+wFe
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BLAPR10MB4835.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(136003)(376002)(39860400002)(346002)(396003)(366004)(66476007)(186003)(66556008)(8676002)(36756003)(2616005)(6916009)(66946007)(31686004)(6506007)(6512007)(53546011)(83380400001)(4326008)(26005)(6666004)(5660300002)(478600001)(31696002)(7416002)(41300700001)(54906003)(38100700002)(316002)(86362001)(2906002)(6486002)(8936002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bnQ2M0dyR2w4WEdibm1YV0tydC8zcnJnN0JGWEFKUi9wMFpXbmxxWjlKK1o4?=
 =?utf-8?B?N3RscW9abGE0RkgwNUtSR3NCSGVDakp1bVpXL3h1ZXZjUUlPSGNsbnhhZlVn?=
 =?utf-8?B?V3YwSXQyRG5jMFRZdTB3RGlEWjM5YzBQUU5Cbm40ek5lWm5xdHdxMVFtTHBv?=
 =?utf-8?B?RG5GQnc1c2dVenRzWS83b1Z6RjMzZ1NQeUsrQngzYUdzeE40RGgyZ2lsQTJK?=
 =?utf-8?B?N1ROb0JSYk4xYWgyaU5IbXc5TWNEdURRdy9YODluOTI0Z3FkQ05qNVVWMmkw?=
 =?utf-8?B?TGhObTRTMVNPTUNZS1g4MmxWTlpsTXFBKzRoTkx3WXhnVzZlVlh3aVRsR2xD?=
 =?utf-8?B?S0FZUS8vNEZTUFBwcjFMSkR1L3hCNlRBRThzY3NMODJlOUVEWWhCS0l2WUlm?=
 =?utf-8?B?UmpaNTl6RklDazZ6Tms5VmZpcWVXSUxYOHY4MXhCQXdxVk1TOVFuMTJPQWRr?=
 =?utf-8?B?N2QrYkJnZ0FsSlR4ZzhYUitJWWdBM1RkUmxaQUV2NHZnaGdXa3dCOGR3aitG?=
 =?utf-8?B?T0F3K2Q1ZjZINWYxd0VlRVBtVUUwNmJkdUd0WGxjaWdnYXlvMWQyMnpGOXRB?=
 =?utf-8?B?ajdNZ2tVYjlUUTNkdmJGUlVGazhsVU41TlJ3VE9oMk15OCsrUFRnN2tqVis1?=
 =?utf-8?B?WkNNY1NBdUR4WW1iY1VRLzVGWlllNkVhcWJsdVZvY254b0JLQks2eGdrK0tV?=
 =?utf-8?B?ZThkZGpNcEZnVnFPbE9pWU9aTmRWTW1qMWhNcDNxWEN5OWxHVnZ5dTRCZFVV?=
 =?utf-8?B?d2pDR3FKN1k4SUQ2MXN4elBES3puOWk0ZVBXUWZ4aWVEcU83UzFtYUl4K3RE?=
 =?utf-8?B?Z0dtQXRrNFF1QUFzbmdpTDFUYTcrbVRROUtuaUZZSVpMMng2azMwUjBxWTJU?=
 =?utf-8?B?RGJTKytXMUVKcjVKL3ExM2J2ZWpWZW1ueWdGRnRqbTQ2K0lUMU84RlE1V0N2?=
 =?utf-8?B?Q2xRUzZGdkRGRHgvMzdRWndLWHlpRHVOZjIyOUpUdWFqVmVsemVuL1p0NDE5?=
 =?utf-8?B?cEVpMmdvcGVqaWowM21QUlMzSmtHSlBUdVYwWHlUTHBUbi9nZ0hlYkFac0ha?=
 =?utf-8?B?YlZCWm1JRkZxTmcrc3ErQy9Fb0YzMzNhb1NSaUNmT1A2WE5tOS9QbWpiYTQr?=
 =?utf-8?B?V2YwY0x3WFhtVjRIVVJXQWhaNmthN3ZJSlR4aUtTbG9kcGl2L2IzeHdsWTdV?=
 =?utf-8?B?Q3RPclFCZGlTakZUMlZDbUFCeExRaFpCZXU5TE1EeFl0Z041blVnSnR3aTIw?=
 =?utf-8?B?U0Z0KzJta2xleXlrcDlyQ3NrajIwUlBuK2JqblpVVy9UcStObDdDcGR1NmZ2?=
 =?utf-8?B?NzRmNURxMGZzejVzY3E3V05QNGp6YTFVMjlaWmk1U0daeE9TNURFeU13aHF6?=
 =?utf-8?B?M3FwSTlscU11akczUTVrYyt2eDJWcVpCQUk4czhmSHBkd2xZUENYUFZKK1VJ?=
 =?utf-8?B?NFhOaHJSNVE5b2JzNkt4UnR2eFdUVjR5YjhyajZwUWJ3SFdCaTRGRkpNZnRV?=
 =?utf-8?B?Z21tZnVtdDM1bi9nOFgyS254bkJZMVdUbE55NzM2cjhTRVA2NkRwVjRNSVkz?=
 =?utf-8?B?bnlEaU9IWXdITm9RUG4wQ0Qza2x3KzVuazMvdC90NjNFa0xXKzFRRGNlMk80?=
 =?utf-8?B?d2VhSFlXTzF1L252L0pFQ1Byc3YxaWpHTHdyVWZPLzEycnFkNXhtNFkvMmYx?=
 =?utf-8?B?cUZ1TXkyTkhCL0ZoSzgwdXFyNzVGclY0eWNDZkUzRkticFFmTmI5M0ZGMW1L?=
 =?utf-8?B?amdBRzJMbDE3cmM4ZHBMeWRiZnBNbGIrSWdFUXE1eW9ld3FscTI4TXBaNmZS?=
 =?utf-8?B?ZXRCNUpvQ1dueG11TXZUeklHY1N1RXJoWjVRR3lrNmUwWUtHTWhaRU4vVnRv?=
 =?utf-8?B?NlQ3TWtFdXUvTTN5MCt1ZTVTVTU5cFNUSEVaaWNSaUdSQVFHS3BDZ0F4ZlJw?=
 =?utf-8?B?a0VhS2MycXhtT3orRVF5TXBYbGM5WVZDZFBtL3B1czBIUGNEQmU1Y2ZuWVZH?=
 =?utf-8?B?SGltTGk3azh1SE9ZU0pBdEpZZXdoelV1Q2dmNkRoK1hOY3MxVzU4aUEwV3JX?=
 =?utf-8?B?aVh3bnU2SnlMc0U0N1V5U1pMdnBwODlhRTJBc2JvbitYZkFlbGZpZy94VnZq?=
 =?utf-8?B?SGMzVFRQWnNVVW9BN2pPUXFOOWk3UjZ2dzREZkVCYzhXQ3JBcjJGZzFzcXh1?=
 =?utf-8?B?VVE9PQ==?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8608fabe-df5f-48a9-a49f-08da602c06e5
X-MS-Exchange-CrossTenant-AuthSource: BLAPR10MB4835.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jul 2022 15:19:04.1573 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tRpj3hNLHWU4cLAA30YJuUN7xo44zR79oLnqm68rE8f+lDjK7KO7Vc0YzttN/Nt22OwXByE2hskfSEp+Qre4bKxKyJiEyfTv+06xGijsz2Y=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR10MB5552
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.517, 18.0.883
 definitions=2022-07-07_12:2022-06-28,
 2022-07-07 signatures=0
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 adultscore=0 spamscore=0
 phishscore=0 malwarescore=0 mlxscore=0 mlxlogscore=999 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2206140000
 definitions=main-2207070061
X-Proofpoint-GUID: 7ZAeSG5w14C9lN0kG4TNR8qboqxjplL7
X-Proofpoint-ORIG-GUID: 7ZAeSG5w14C9lN0kG4TNR8qboqxjplL7
Received-SPF: pass client-ip=205.220.165.32;
 envelope-from=joao.m.martins@oracle.com; helo=mx0a-00069f02.pphosted.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On 7/7/22 14:00, Igor Mammedov wrote:
> On Fri,  1 Jul 2022 17:10:10 +0100
> Joao Martins <joao.m.martins@oracle.com> wrote:
> 
>> Factor out the calculation of the base address of the MR. It will be
>> used later on for the cxl range end counterpart calculation and as
>> well in pc_memory_init() CXL mr initialization, thus avoiding
>> duplication.
>>
>> Cc: Jonathan Cameron <jonathan.cameron@huawei.com>
>> Signed-off-by: Joao Martins <joao.m.martins@oracle.com>
> 
> needs to be rebased on top of 
> 
> 
> [PATCH 2/3] hw/i386/pc: Always place CXL Memory Regions after device_memory
> 
Is Michael merging these or should I just respin v7 with the assumption
that these patches are there?

I can't see anything in his tree yet.

>> ---
>>  hw/i386/pc.c | 28 +++++++++++++++++++---------
>>  1 file changed, 19 insertions(+), 9 deletions(-)
>>
>> diff --git a/hw/i386/pc.c b/hw/i386/pc.c
>> index 0abbf81841a9..8655cc3b8894 100644
>> --- a/hw/i386/pc.c
>> +++ b/hw/i386/pc.c
>> @@ -825,6 +825,24 @@ static hwaddr pc_above_4g_end(PCMachineState *pcms)
>>      return x86ms->above_4g_mem_start + x86ms->above_4g_mem_size;
>>  }
>>  
>> +static uint64_t pc_get_cxl_range_start(PCMachineState *pcms)
>> +{
>> +    PCMachineClass *pcmc = PC_MACHINE_GET_CLASS(pcms);
>> +    MachineState *machine = MACHINE(pcms);
>> +    hwaddr cxl_base;
>> +
>> +    if (pcmc->has_reserved_memory && machine->device_memory->base) {
>> +        cxl_base = machine->device_memory->base;
>> +        if (!pcmc->broken_reserved_end) {
>> +            cxl_base += memory_region_size(&machine->device_memory->mr);
>> +        }
>> +    } else {
>> +        cxl_base = pc_above_4g_end(pcms);
>> +    }
>> +
>> +    return cxl_base;
>> +}
>> +
>>  static uint64_t pc_get_cxl_range_end(PCMachineState *pcms)
>>  {
>>      uint64_t start = 0;
>> @@ -946,15 +964,7 @@ void pc_memory_init(PCMachineState *pcms,
>>          MemoryRegion *mr = &pcms->cxl_devices_state.host_mr;
>>          hwaddr cxl_size = MiB;
>>  
>> -        if (pcmc->has_reserved_memory && machine->device_memory->base) {
>> -            cxl_base = machine->device_memory->base;
>> -            if (!pcmc->broken_reserved_end) {
>> -                cxl_base += memory_region_size(&machine->device_memory->mr);
>> -            }
>> -        } else {
>> -            cxl_base = pc_above_4g_end(pcms);
>> -        }
>> -
>> +        cxl_base = pc_get_cxl_range_start(pcms);
>>          e820_add_entry(cxl_base, cxl_size, E820_RESERVED);
>>          memory_region_init(mr, OBJECT(machine), "cxl_host_reg", cxl_size);
>>          memory_region_add_subregion(system_memory, cxl_base, mr);
> 

