Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9681254F76F
	for <lists+qemu-devel@lfdr.de>; Fri, 17 Jun 2022 14:24:12 +0200 (CEST)
Received: from localhost ([::1]:38918 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o2B1H-0003hC-4X
	for lists+qemu-devel@lfdr.de; Fri, 17 Jun 2022 08:24:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46656)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <joao.m.martins@oracle.com>)
 id 1o2AwE-0000p0-QJ
 for qemu-devel@nongnu.org; Fri, 17 Jun 2022 08:18:58 -0400
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32]:48604)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <joao.m.martins@oracle.com>)
 id 1o2AwA-0004rt-6p
 for qemu-devel@nongnu.org; Fri, 17 Jun 2022 08:18:58 -0400
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 25H8XIie022342;
 Fri, 17 Jun 2022 12:18:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=message-id : date :
 subject : to : cc : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=corp-2021-07-09;
 bh=TkGB3W5h6euxnMRfBv7YFbwFjY5ChJxTPeP0dVW6erY=;
 b=SAhQd5OKMHCwtyxadEN7yxOY/kI74fnZ3kDSgzqJyFrnJRoXydZ4wo/teoDqbTro54yf
 WvMwpuSCgIffxsrqxrOrSip5vxEjuCQ8uWDMHHQ3sNJjvs1ClOFT8VNp0W+IqNZJWmKQ
 FxQjKOmmZNDcbNUAZDfVTHnJTW2QRJIUVTkctE0In4X1KEHsMLGJ4pPZ/tKZHBVkm0ao
 qxGesUTR+RIm96GQJDfUSWMH3CA7uQX5fo5JsV+3Zlp1gq+FQKJArkUOkUK5nHKhAoVV
 mx3Qcm3bfwdvqt1evysGZdKjCyH+j3YTc+6XWUkRoz0IR6Om5MLwBp/lKx0im9xPXSJy gg== 
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com
 (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3gmhfcwjt9-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 17 Jun 2022 12:18:47 +0000
Received: from pps.filterd
 (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
 by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.16.1.2/8.16.1.2)
 with SMTP id 25HCA8vX011769; Fri, 17 Jun 2022 12:18:46 GMT
Received: from nam10-bn7-obe.outbound.protection.outlook.com
 (mail-bn7nam10lp2105.outbound.protection.outlook.com [104.47.70.105])
 by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com with ESMTP id
 3gpr281bnn-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 17 Jun 2022 12:18:46 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=O8Fk+9Qv1wdq4PjPw4YEe/isCQsBHCyHdUAftITxvlLLdQBmLVyaun6MDQJF7nR6Yv7lMZKn99ePFU7Fwu0Y1QaZke33uo3i3V4blAbjjH9sT3CJQzv2q9pyPobQH7peNKhhlB0yCC0QmAAxxC06b6pBfpoMKEftNjtzEv9UdmH4WHCS2YOyKD3jEpCOG4mzJw8Y6r4yUa7cQQp/YPA2qzoDITg4/dBlBbWdZS9kkaSiJEmCHdk2G6kRlHOrO9FAGEuaM0GF+OHXKvIQhaulBdEPcXyXSgqhFhW0/yt1B86WU17/aT8YlAqCX6+K7UvTwnmdFjarbEHwCxPp2sBj4Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TkGB3W5h6euxnMRfBv7YFbwFjY5ChJxTPeP0dVW6erY=;
 b=lBg1gq6AhF/OVG4C2tdpWdnIIptklwMYnBJJsjd4vQSy7WpYyrbL1zJ+rYKU5d+yG1WbZ/jUQif2hWq1UslyqN2iaN8k2Ttt/MEnbciVdmhS6KyWo9iqkw/MsndS/rd3kiMbSTHKEBN6xCIY6WAGjhid62x+bgsl8CaN8Ri4SAGCTnMMGYwa8vq2KuJ67Wds3YspcXZwZwsBYS9ZkOKFTyM/9N2t4GXYL9Tcf3lxtJU0muOimbatlEu465//L1y4h5cihdZlRefeWQaGCjOLg8Uhw5Ljpg1Rik+o0k77BySYAhw9k848IorETLRDPsHdyifBi6zQtIC/PbPa9irRnA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TkGB3W5h6euxnMRfBv7YFbwFjY5ChJxTPeP0dVW6erY=;
 b=NGhdtplIY76Hy32QNV71+Qe/TeSGmiDLmWLRzOEiR4vy+8UIvN9nmSrmmIFPO/MnwCDcexDmO1AVDZndNjehgp8V2erPgAH+IqfDJu16Jddf9QdrcCiLbSuR2z5tBHDDETyG4NjqJ4T8OFnXj1OCx3dKe+3apl6ytdLcCfQNDhk=
Received: from BLAPR10MB4835.namprd10.prod.outlook.com (2603:10b6:208:331::11)
 by PH0PR10MB5706.namprd10.prod.outlook.com (2603:10b6:510:148::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5353.15; Fri, 17 Jun
 2022 12:18:44 +0000
Received: from BLAPR10MB4835.namprd10.prod.outlook.com
 ([fe80::b842:a301:806d:231e]) by BLAPR10MB4835.namprd10.prod.outlook.com
 ([fe80::b842:a301:806d:231e%9]) with mapi id 15.20.5353.015; Fri, 17 Jun 2022
 12:18:44 +0000
Message-ID: <bc50bb88-5330-a839-bd50-ca49b0edec9d@oracle.com>
Date: Fri, 17 Jun 2022 13:18:38 +0100
Subject: Re: [PATCH v5 4/5] i386/pc: relocate 4g start to 1T where applicable
Content-Language: en-US
To: Igor Mammedov <imammedo@redhat.com>
Cc: qemu-devel@nongnu.org, Eduardo Habkost <eduardo@habkost.net>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Daniel Jordan <daniel.m.jordan@oracle.com>,
 David Edmondson <david.edmondson@oracle.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Ani Sinha <ani@anisinha.ca>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>
References: <20220520104532.9816-1-joao.m.martins@oracle.com>
 <20220520104532.9816-5-joao.m.martins@oracle.com>
 <20220616162328.64138d4f@redhat.com>
From: Joao Martins <joao.m.martins@oracle.com>
In-Reply-To: <20220616162328.64138d4f@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO4P123CA0360.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:18d::23) To BLAPR10MB4835.namprd10.prod.outlook.com
 (2603:10b6:208:331::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f3be9225-28bc-4f8d-0aed-08da505b85b6
X-MS-TrafficTypeDiagnostic: PH0PR10MB5706:EE_
X-Microsoft-Antispam-PRVS: <PH0PR10MB5706D80736A7E9D5134EEBA8BBAF9@PH0PR10MB5706.namprd10.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: +2rnLoYuYersiKdX0BSUUz4UDnKZ00AHdF6cGn+ttRHAncVPyAj9oPGz35MGyd1sQ5h+OpPzjXFQqzKX9/C07zvoqn6m1YaS4quOKY2ZsATPLQ1vIBabtRsx0tXjdSFVola7yr7LB4Hzy8plz1pjip+ezq+PU0Jw3KJHhL+cvRwgEsLLi1eo+3f0RSZx4afEkUkbOm1YXvW2rCrmcgOY6htU74XYraelS2SCFkF39DLuCX93/2Y+ATX4oqvLYZogQQawD6sMNXf2N+6TG6Hanrd+IhxFDudNwEvl2ixpmqK7nFKhz8/5+h3Zt/Tv6b0dWqqx5HFaqNwLZejNbjyK7LmVcRe43AH5Hvb26uhY3vUp8YUuvTr90oZ/39tLdn4/OFULcLlRMIsbIBz1R/N6yAGkwPQJPGPpxIolkRN9eDsB25mgv0WslI+t1rcjd5f6/84dtmAUM3HPI4e44fSG1kFAuNh+emaz84nEdEZXIsjHGx665JJgJxY1eBLOwXbm+SHR22bAhFfdzR67jw526DhWiv71eWXoc2zx07NEW4KhgIaZQH7x+UbhQB4GrJSJkwYkNGmTK8YRW6NwGW4gg/Vzf4ZVokuowmq+i5gh4iaUvhU6IBNsOy50PiJDFlYMzLgYHpMWWVGJ2CyNKzERU0Yl6/HtymTu1gKlcdhcsHA+WmNP+JNDBLTVgyhYWeIZhm8WGVvyor3EFB3acjLFZQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BLAPR10MB4835.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(366004)(66556008)(2616005)(53546011)(31696002)(66946007)(54906003)(86362001)(8676002)(6916009)(6666004)(26005)(38100700002)(4326008)(6512007)(66476007)(6506007)(8936002)(316002)(498600001)(6486002)(2906002)(186003)(31686004)(83380400001)(7416002)(5660300002)(36756003)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UXhPZDBHOFJ0a1J2VDBtOXZMUFFyK3YzOUhHTk5PQmRuR1NoRktWcUpvNVlF?=
 =?utf-8?B?bnZrNkJ3SkJJSjcvY3JRWlRxeHZSVEp4WWR1Q1Ura2plWGtzZmhCVmpTRUU3?=
 =?utf-8?B?SmlUUklJRFU5ZnJSdFZZUUVsV3NNSmZaY2R2bVgrd2hpcVQxL2RIZnFlMFY3?=
 =?utf-8?B?R1dvblVCYWI1TzR3V1hhZEM1ZzlaajNreS9wZHJHYVZjNUNYaGlKSWUza3gw?=
 =?utf-8?B?RXBZelA5eU1NWXZiQmlnTW8wNnJXcm5tWExMVmM1cWdVeTNXRFl5RXJwRE1G?=
 =?utf-8?B?RG1ZL01xQmgrK2JEek5iQXdPcEx1REx4OENtaGJ1TjRXaFRrRTFQTHNOZFB5?=
 =?utf-8?B?YWN4OWh5ZTZSK0FkbUVaTWlod0ZKWDlMVThGWGF0NUkySFFrZmMxTGIxNzlV?=
 =?utf-8?B?MDc0dU45Q29jcU5aQlo5T1hyRXRwVEpkYlUxdGo5OFJkV2YxTTl1bFhPUFhk?=
 =?utf-8?B?L0RiNnI2Z2QrbjZUQ2sxV1g0VWVrTEhncGlTSm5jNStiN1BTUlFvNEVtWlNK?=
 =?utf-8?B?VnZwQ3NKUHBDMWhBcCtjcUdNWTUrL0JkR1p3UXhBMkhhZG5uclo3dHJxQkow?=
 =?utf-8?B?cHEvS0hwNE5VWUtPSlBqemFmc25oc215dll1eGQwK3VOaHB2RzhrWU8ybjJV?=
 =?utf-8?B?K0JDN25zNFREZmVhVXkwbjBIbHFTSkY4K2NFMzJzbjV3bGtxdjE1aC9OSHh1?=
 =?utf-8?B?SE1kTU53ZWRQRG5zd1lDN2hyb1dPZ2oreXJMa0tpMXMrVis3UUg5aG40NVRp?=
 =?utf-8?B?bU9oVWhEbkNENzFLV1BlaGYzVXJDRFJkbmVJZmF1TVpWV1c2eDBRcWRNQ1Fy?=
 =?utf-8?B?R0ErSVgrRCs1dEdWZXNTVkRHejRZZUhWcC9nZ1MxbTBEeG9sMy90N3NOQkE1?=
 =?utf-8?B?Zk9SYWdITkVZZkpsV2c3Ti9sQXJ1WlhCTzZjOEtWWVc5V1VhVTd4N3RTUks5?=
 =?utf-8?B?WFQyaCsvWkF0U21QVDlNeUI3T0JMeEZXbWNncEhxbVp1MmNHSmo1YUMvOGlL?=
 =?utf-8?B?NkVuQ01kaGFaTFMyOHFyekRDOWkyN0VzdmpUQ2RvT0JaSDFIc25uWjY1ZDF1?=
 =?utf-8?B?NHl0RXRCTFdMSm4xRXp1dUszVkRBT21pS1FGKzI5d3FScE9rQy9HNE12NFp2?=
 =?utf-8?B?Szg0YTZMVExaaE9SNnJNNUF3OGhEMEFqUnViWGFsbERXRnRpd0xUY0JQaXY5?=
 =?utf-8?B?eW43YmJXZzZJQkUzajdGTVF4OGRYcm91ZkFPNHhYaVc1aGpBREZMbTk5bzFX?=
 =?utf-8?B?dDhRWkYxNFN5Y09lVDVzdUVKczcrTVZpRFVDNEUwRzJsaXNkRjIyWTFuOGpU?=
 =?utf-8?B?ZXU0Mzc4WGhZaWZ6UWR0ZWRKd3NsVkcwejErN0VCZHdBQTA2M2hDY0o4UkRU?=
 =?utf-8?B?Q0h0WFc4UU9wVjRncEhhWjhZTG5nc1NlVWNjK2dWTW94UllPODREU0V3Y2xZ?=
 =?utf-8?B?K1A2bElNdXB4cklkNXNSanlsL2ZMWTlOa1VMMFN3c2Q1aEQ2Q1luMk5DTlVG?=
 =?utf-8?B?QUp2enJGenZVVzJqMlpiTFhxUmNkWDhoVE01azVQcm1KS1kyRGppelRBU1ps?=
 =?utf-8?B?c0d0ZVhrTjJ1bFJxN015eDFTd1Q2RldMSEJMNnRjWWh5SHVqdFB5VHNQZDQv?=
 =?utf-8?B?aEJFNGErVGJ6bVVDY1ZzY0JEb2h6WEk0a3c5MTRGS0VoZVVWenNXbGNjZzls?=
 =?utf-8?B?djhlL2F5MHNMV0FWRHNPZ2x0anpkM3ZOejNJZ0VrQ24vbGFQQysyOUc5WTBE?=
 =?utf-8?B?Q2tNODJRajFSemFBZ0xtNHFkdjdaZlMvZTk2UlpKTmwwS0Zxc0w5VWM4Zy9k?=
 =?utf-8?B?OXgxQy9nMkN4enRmVWJNZDg4WE1UMGYrZHk0OTNGc3llRXNpcEE5d0tzbDQw?=
 =?utf-8?B?emp6RHVyNEd3RVhhZ0l3R083Nm1SVmZub29KLzI3bWtQcSt2RDZoYi9SMzlY?=
 =?utf-8?B?YkJCdGEvODg0VWlvMjFkcXJObGpmcDdkNkV3VWYyeG9tSmxZamM3bXl2UVA4?=
 =?utf-8?B?NWZ4azZkNVpvZkpFem5OS21FQTMvaERhTW9idjRUOTl3ZThWaDl3amk5TkZx?=
 =?utf-8?B?UjdHUzFOUWRVMGg2b2hScitraDFkVVppV1hPYlFhaDkzQWtMQWFnMjBSZkdM?=
 =?utf-8?B?bUJGL0V5emdGamNod2NDWmVMdWJoSHlhZXBlNmgxWDZndG5tck9SeXNqYnFY?=
 =?utf-8?B?aVZxc041U1F2b1pSSm5TMzl5ZWlaaktnUmt0R1h5YW8wRzNSU1ZiWWxWWTFi?=
 =?utf-8?B?Y0JuT2dOelJpUzZiK3cvajY2dko0L2pyaTdhV0YydGc2bVJ6emdVMUY1b0pj?=
 =?utf-8?B?QisxQUI0ZWp1YmFYTVd0ZGRVdDBkMlNzdzNpMGkzVnNQZjBxd3ptQkY5VWJi?=
 =?utf-8?Q?LMB5f/20U3IPC1fE=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f3be9225-28bc-4f8d-0aed-08da505b85b6
X-MS-Exchange-CrossTenant-AuthSource: BLAPR10MB4835.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jun 2022 12:18:44.3611 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hU2ulwHCyki0v33US6O/mUQZFf5Gz2PHsi3+gPdo0LNwectp9DP8xlWwrcTBlKluAEXMyMzS/JW4sSJYwGKVEtNfqgP8nz8bNq1GdZ3UM8k=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR10MB5706
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.517, 18.0.883
 definitions=2022-06-17_07:2022-06-16,
 2022-06-17 signatures=0
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0
 malwarescore=0
 suspectscore=0 spamscore=0 mlxscore=0 phishscore=0 bulkscore=0
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2204290000 definitions=main-2206170055
X-Proofpoint-ORIG-GUID: kyDAf6cTT8gIJ0VxAgKeyMRgdBfZ3o4y
X-Proofpoint-GUID: kyDAf6cTT8gIJ0VxAgKeyMRgdBfZ3o4y
Received-SPF: pass client-ip=205.220.177.32;
 envelope-from=joao.m.martins@oracle.com; helo=mx0b-00069f02.pphosted.com
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



On 6/16/22 15:23, Igor Mammedov wrote:
> On Fri, 20 May 2022 11:45:31 +0100
> Joao Martins <joao.m.martins@oracle.com> wrote:
> 
>> It is assumed that the whole GPA space is available to be DMA
>> addressable, within a given address space limit, expect for a
>                                                    ^^^ typo?
> 
Yes, it should have been 'except'.

>> tiny region before the 4G. Since Linux v5.4, VFIO validates
>> whether the selected GPA is indeed valid i.e. not reserved by
>> IOMMU on behalf of some specific devices or platform-defined
>> restrictions, and thus failing the ioctl(VFIO_DMA_MAP) with
>>  -EINVAL.
>>
>> AMD systems with an IOMMU are examples of such platforms and
>> particularly may only have these ranges as allowed:
>>
>> 	0000000000000000 - 00000000fedfffff (0      .. 3.982G)
>> 	00000000fef00000 - 000000fcffffffff (3.983G .. 1011.9G)
>> 	0000010000000000 - ffffffffffffffff (1Tb    .. 16Pb[*])
>>
>> We already account for the 4G hole, albeit if the guest is big
>> enough we will fail to allocate a guest with  >1010G due to the
>> ~12G hole at the 1Tb boundary, reserved for HyperTransport (HT).
>>
>> [*] there is another reserved region unrelated to HT that exists
>> in the 256T boundaru in Fam 17h according to Errata #1286,
>               ^ ditto
> 
Fixed.

>> documeted also in "Open-Source Register Reference for AMD Family
>> 17h Processors (PUB)"
>>
>> When creating the region above 4G, take into account that on AMD
>> platforms the HyperTransport range is reserved and hence it
>> cannot be used either as GPAs. On those cases rather than
>> establishing the start of ram-above-4g to be 4G, relocate instead
>> to 1Tb. See AMD IOMMU spec, section 2.1.2 "IOMMU Logical
>> Topology", for more information on the underlying restriction of
>> IOVAs.
>>
>> After accounting for the 1Tb hole on AMD hosts, mtree should
>> look like:
>>
>> 0000000000000000-000000007fffffff (prio 0, i/o):
>> 	 alias ram-below-4g @pc.ram 0000000000000000-000000007fffffff
>> 0000010000000000-000001ff7fffffff (prio 0, i/o):
>> 	alias ram-above-4g @pc.ram 0000000080000000-000000ffffffffff
>>
>> If the relocation is done, we also add the the reserved HT
>> e820 range as reserved.
>>
>> Default phys-bits on Qemu is TCG_PHYS_ADDR_BITS (40) which is enough
>> to address 1Tb (0xff ffff ffff). On AMD platforms, if a
>> ram-above-4g relocation may be desired and the CPU wasn't configured
>> with a big enough phys-bits, print an error message to the user
>> and do not make the relocation of the above-4g-region if phys-bits
>> is too low.
>>
>> Suggested-by: Igor Mammedov <imammedo@redhat.com>
>> Signed-off-by: Joao Martins <joao.m.martins@oracle.com>
>> ---
>>  hw/i386/pc.c | 111 +++++++++++++++++++++++++++++++++++++++++++++++++++
>>  1 file changed, 111 insertions(+)
>>
>> diff --git a/hw/i386/pc.c b/hw/i386/pc.c
>> index af52d4ff89ef..652ae8ff9ccf 100644
>> --- a/hw/i386/pc.c
>> +++ b/hw/i386/pc.c
>> @@ -796,6 +796,110 @@ void xen_load_linux(PCMachineState *pcms)
>>  #define PC_ROM_ALIGN       0x800
>>  #define PC_ROM_SIZE        (PC_ROM_MAX - PC_ROM_MIN_VGA)
>>  
>> +/*
>> + * AMD systems with an IOMMU have an additional hole close to the
>> + * 1Tb, which are special GPAs that cannot be DMA mapped. Depending
>> + * on kernel version, VFIO may or may not let you DMA map those ranges.
>> + * Starting Linux v5.4 we validate it, and can't create guests on AMD machines
>> + * with certain memory sizes. It's also wrong to use those IOVA ranges
>> + * in detriment of leading to IOMMU INVALID_DEVICE_REQUEST or worse.
>> + * The ranges reserved for Hyper-Transport are:
>> + *
>> + * FD_0000_0000h - FF_FFFF_FFFFh
>> + *
>> + * The ranges represent the following:
>> + *
>> + * Base Address   Top Address  Use
>> + *
>> + * FD_0000_0000h FD_F7FF_FFFFh Reserved interrupt address space
>> + * FD_F800_0000h FD_F8FF_FFFFh Interrupt/EOI IntCtl
>> + * FD_F900_0000h FD_F90F_FFFFh Legacy PIC IACK
>> + * FD_F910_0000h FD_F91F_FFFFh System Management
>> + * FD_F920_0000h FD_FAFF_FFFFh Reserved Page Tables
>> + * FD_FB00_0000h FD_FBFF_FFFFh Address Translation
>> + * FD_FC00_0000h FD_FDFF_FFFFh I/O Space
>> + * FD_FE00_0000h FD_FFFF_FFFFh Configuration
>> + * FE_0000_0000h FE_1FFF_FFFFh Extended Configuration/Device Messages
>> + * FE_2000_0000h FF_FFFF_FFFFh Reserved
>> + *
>> + * See AMD IOMMU spec, section 2.1.2 "IOMMU Logical Topology",
>> + * Table 3: Special Address Controls (GPA) for more information.
>> + */
>> +#define AMD_HT_START         0xfd00000000UL
>> +#define AMD_HT_END           0xffffffffffUL
>> +#define AMD_ABOVE_1TB_START  (AMD_HT_END + 1)
>> +#define AMD_HT_SIZE          (AMD_ABOVE_1TB_START - AMD_HT_START)
>> +
>> +static hwaddr x86_max_phys_addr(PCMachineState *pcms,
> 
> s/x86_max_phys_addr/pc_max_used_gpa/
> 
Fixed.

>> +                                hwaddr above_4g_mem_start,
>> +                                uint64_t pci_hole64_size)
>> +{
>> +    PCMachineClass *pcmc = PC_MACHINE_GET_CLASS(pcms);
>> +    X86MachineState *x86ms = X86_MACHINE(pcms);
>> +    MachineState *machine = MACHINE(pcms);
>> +    ram_addr_t device_mem_size = 0;
>> +    hwaddr base;
>> +
>> +    if (!x86ms->above_4g_mem_size) {
>> +       /*
>> +        * 32-bit pci hole goes from
>> +        * end-of-low-ram (@below_4g_mem_size) to IOAPIC.
>> +        */
>> +        return IO_APIC_DEFAULT_ADDRESS - 1;
> 
> lack of above_4g_mem, doesn't mean absence of device_mem_size or anything else
> that's located above it.
> 

True. But the intent is to fix 32-bit boundaries as one of the qtests was failing
otherwise. We won't hit the 1T hole, hence a nop. Unless we plan on using
pc_max_used_gpa() for something else other than this.

The alternative would be to just early bail out of pc_set_amd_above_4g_mem_start() if
!above_4g_mem_size. And I guess in that case we can just remove pc_max_used_gpa()
and replace with a:

	max_used_gpa = pc_pci_hole64_start() + pci_hole64_size

Which makes this even simpler. thoughts?

>> +    }
>> +
>> +    if (pcmc->has_reserved_memory &&
>> +       (machine->ram_size < machine->maxram_size)) {
>> +        device_mem_size = machine->maxram_size - machine->ram_size;
>> +    }
>> +
>> +    base = ROUND_UP(above_4g_mem_start + x86ms->above_4g_mem_size +
>> +                    pcms->sgx_epc.size, 1 * GiB);
>> +
>> +    return base + device_mem_size + pci_hole64_size;
> 
> it's not guarantied that pci64 hole starts right away device_mem,
> but you are not 1st doing this assumption in code, maybe instead of
> all above use existing 
>    pc_pci_hole64_start() + pci_hole64_size
> to gestimate max address 
> 
I've switched the block above to that instead.

>> +}
>> +
>> +static void x86_update_above_4g_mem_start(PCMachineState *pcms,
>> +                                          uint64_t pci_hole64_size)
> 
> s/x86_update_above_4g_mem_start/pc_set_amd_above_4g_mem_start/
> 
Fixed.

>> +{
>> +    X86MachineState *x86ms = X86_MACHINE(pcms);
>> +    CPUX86State *env = &X86_CPU(first_cpu)->env;
>> +    hwaddr start = x86ms->above_4g_mem_start;
>> +    hwaddr maxphysaddr, maxusedaddr;
> 
> 
>> +    /*
>> +     * The HyperTransport range close to the 1T boundary is unique to AMD
>> +     * hosts with IOMMUs enabled. Restrict the ram-above-4g relocation
>> +     * to above 1T to AMD vCPUs only.
>> +     */
>> +    if (!IS_AMD_CPU(env)) {
>> +        return;
>> +    }
> 
> move this to caller
> 
Done (same for the patch after this one):

-    x86_update_above_4g_mem_start(pcms, pci_hole64_size);
+    /*
+     * The HyperTransport range close to the 1T boundary is unique to AMD
+     * hosts with IOMMUs enabled. Restrict the ram-above-4g relocation
+     * to above 1T to AMD vCPUs only.
+     */
+    if (IS_AMD_CPU(env)) {
+        pc_set_amd_above_4g_mem_start(pcms, pci_hole64_size);
+    }


>> +    /* Bail out if max possible address does not cross HT range */
>> +    if (x86_max_phys_addr(pcms, start, pci_hole64_size) < AMD_HT_START) {
>> +        return;
>> +    }
>> +
>> +    /*
>> +     * Relocating ram-above-4G requires more than TCG_PHYS_ADDR_BITS (40).
>> +     * So make sure phys-bits is required to be appropriately sized in order
>> +     * to proceed with the above-4g-region relocation and thus boot.
>> +     */
>> +    start = AMD_ABOVE_1TB_START;
>> +    maxphysaddr = ((hwaddr)1 << X86_CPU(first_cpu)->phys_bits) - 1;
>> +    maxusedaddr = x86_max_phys_addr(pcms, start, pci_hole64_size);
>> +    if (maxphysaddr < maxusedaddr) {
>> +        error_report("Address space limit 0x%"PRIx64" < 0x%"PRIx64
>> +                     " phys-bits too low (%u) cannot avoid AMD HT range",
>> +                     maxphysaddr, maxusedaddr, X86_CPU(first_cpu)->phys_bits);
>> +        exit(EXIT_FAILURE);
>> +    }
>> +
>> +
>> +    x86ms->above_4g_mem_start = start;
>> +}
>> +
>>  void pc_memory_init(PCMachineState *pcms,
>>                      MemoryRegion *system_memory,
>>                      MemoryRegion *rom_memory,
>> @@ -817,6 +921,8 @@ void pc_memory_init(PCMachineState *pcms,
>>  
>>      linux_boot = (machine->kernel_filename != NULL);
>>  
>> +    x86_update_above_4g_mem_start(pcms, pci_hole64_size);
>> +
>>      /*
>>       * Split single memory region and use aliases to address portions of it,
>>       * done for backwards compatibility with older qemus.
>> @@ -827,6 +933,11 @@ void pc_memory_init(PCMachineState *pcms,
>>                               0, x86ms->below_4g_mem_size);
>>      memory_region_add_subregion(system_memory, 0, ram_below_4g);
>>      e820_add_entry(0, x86ms->below_4g_mem_size, E820_RAM);
>> +
>> +    if (x86ms->above_4g_mem_start == AMD_ABOVE_1TB_START) {
>> +        e820_add_entry(AMD_HT_START, AMD_HT_SIZE, E820_RESERVED);
>> +    }
> probably it is not necessary, but it doesn't hurt
> 

virtual firmware can make better decisions to avoid reserved ranges.

I was actually thinking that if phys_bits was >= 40 that we would
anyways add it.

>>      if (x86ms->above_4g_mem_size > 0) {
>>          ram_above_4g = g_malloc(sizeof(*ram_above_4g));
>>          memory_region_init_alias(ram_above_4g, NULL, "ram-above-4g",
> 

