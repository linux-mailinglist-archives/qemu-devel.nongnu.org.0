Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DDA4354B7A1
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Jun 2022 19:27:34 +0200 (CEST)
Received: from localhost ([::1]:55268 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o1AKC-000764-Ka
	for lists+qemu-devel@lfdr.de; Tue, 14 Jun 2022 13:27:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57956)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <joao.m.martins@oracle.com>)
 id 1o1AHS-0006Ga-MZ
 for qemu-devel@nongnu.org; Tue, 14 Jun 2022 13:24:42 -0400
Received: from mx0a-00069f02.pphosted.com ([205.220.165.32]:61898)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <joao.m.martins@oracle.com>)
 id 1o1AHO-0007fK-9h
 for qemu-devel@nongnu.org; Tue, 14 Jun 2022 13:24:42 -0400
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 25EEfY18014876;
 Tue, 14 Jun 2022 17:24:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=message-id : date :
 subject : to : cc : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=corp-2021-07-09;
 bh=wFSPGFqE0/1W8uwSwDv0wC4b7Zl94zXUXTaDFUlkou8=;
 b=SFpHxq4aiKGRmehRQK6ulVilzDLiI7sFEGYEkgwGM+lfTMZtPe2TxYZFDcKpYJEnoKkp
 Opo9LnOjxC6yC8Db++wLuRsm12MB67apwRDNPnqIGngYPrNt6BcRb9Fl5HLrc+Y3WPHY
 CsjrTKRGI9Rvw//AVlFMSM6ljYUYdZScXjQSlrQQC/sZNn0AUvRaIUhj6cM31N+UPJr1
 FF/CXD8N3wnGNnYZUDGNqLa/QMRXEZyGPLWvDpGhpHb3jE+wzccCgKCPqWJoBFs2W0qR
 C4uUMsRDJOBoICDTJNthwWlKTFxp3oAsTCg4qeK20o4oJfkdCL9w3KJ8NPfwEGcYQQaq bA== 
Received: from phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com
 (phxpaimrmta01.appoci.oracle.com [138.1.114.2])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3gmkkteet9-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 14 Jun 2022 17:24:32 +0000
Received: from pps.filterd
 (phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
 by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (8.16.1.2/8.16.1.2)
 with SMTP id 25EHA9Hs003152; Tue, 14 Jun 2022 17:24:32 GMT
Received: from nam04-mw2-obe.outbound.protection.outlook.com
 (mail-mw2nam04lp2171.outbound.protection.outlook.com [104.47.73.171])
 by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com with ESMTP id
 3gpqq0d07j-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 14 Jun 2022 17:24:31 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YkpqxkZ4yhinuUzGk49F7OkNprNuLaxaXSklaFMHU1kJawpwWBsEhTdd8B2bxp+g8pFRuyw8gttfIsFkR+9rxkC7jgEKF9FxHbi17CXYMr3MYmnNyFj0hXGQAoC/ZgMJ31nvdl/hKolL817XfEGa5tvGE7Mu75rHuJmjv/TFTQybvsjN/3ekz8zmFvAnR5qmulXBycjMqMz69yYbQ9VpBLiJAXrIdj55O0BkGa0tuP16sOOE+vbmf4gWFKwxa/FdB5K/wPECHcN/EOfY3t/kPPgbPTUEpORsS2RDZU8u6ssMUP8TMuEVjN156FEGXYBgVAw7iY5tdOtE8/JemQxvCw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wFSPGFqE0/1W8uwSwDv0wC4b7Zl94zXUXTaDFUlkou8=;
 b=kJQDkDJZeBI6bMgiIisB7Gjof5s4pnABTYki1Jn4ZDSpBuZyI9nDTlHoawx35zcS/zsVlTDqrsyVxyl5vdgaXczMXMnQANSKVGXEDFtx7RzqHN509n28riCPg/BTlKQfsg0p3Eu9IObzK5LJG3eDzC9+3SdEVlNBEeHNTqtONMQJfoycGVES35CviQ32LcZpY4z4NBpsk6DwMN/6AX9+SHp7B/0va1kK7A/Ozb1W5ouh40EYmncB5VM2cGsBAExW6ZrUfcGJfIjE2+DxnW02WVHL4PwZN83o2PSkKMeiG8H6gQEePEiI/Yqq5sTrNN6Fex7S/ZVSD22xuCamc8zVjQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wFSPGFqE0/1W8uwSwDv0wC4b7Zl94zXUXTaDFUlkou8=;
 b=I8nUuXgmQdnTx18VaAwO2fUccR2t42dT0npmGfw442cLoeC9WJvlm7yBdOOwKAkYv7SaE3DBOtI6joIEpFMdldn5C1MSOcawYAktMMwePu7NisKsg+51Y5adDE1kQv9mYaPl7MfLdFs1ZlQq2VGDHxV9KMogNiUNDfKr/IgYtIA=
Received: from BLAPR10MB4835.namprd10.prod.outlook.com (2603:10b6:208:331::11)
 by CO1PR10MB4419.namprd10.prod.outlook.com (2603:10b6:303:95::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5332.12; Tue, 14 Jun
 2022 17:24:29 +0000
Received: from BLAPR10MB4835.namprd10.prod.outlook.com
 ([fe80::b842:a301:806d:231e]) by BLAPR10MB4835.namprd10.prod.outlook.com
 ([fe80::b842:a301:806d:231e%7]) with mapi id 15.20.5332.022; Tue, 14 Jun 2022
 17:24:29 +0000
Message-ID: <3d064847-f69a-66e5-ab3e-bcc5eb566ebe@oracle.com>
Date: Tue, 14 Jun 2022 18:24:23 +0100
Subject: Re: [PATCH v2 07/11] vfio/migration: Implement VFIO migration
 protocol v2
Content-Language: en-US
To: Avihai Horon <avihaih@nvidia.com>
Cc: Yishai Hadas <yishaih@nvidia.com>, Jason Gunthorpe <jgg@nvidia.com>,
 Mark Bloch <mbloch@nvidia.com>, Maor Gottlieb <maorg@nvidia.com>,
 Kirti Wankhede <kwankhede@nvidia.com>,
 Tarun Gupta <targupta@nvidia.com>, Cornelia Huck <cohuck@redhat.com>,
 qemu-devel@nongnu.org, Alex Williamson <alex.williamson@redhat.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 Juan Quintela <quintela@redhat.com>
References: <20220530170739.19072-1-avihaih@nvidia.com>
 <20220530170739.19072-8-avihaih@nvidia.com>
 <7186d27f-16b8-8d6d-2c37-902f97526244@oracle.com>
 <d090f3e9-2dad-f133-cd57-db84d9e08691@nvidia.com>
From: Joao Martins <joao.m.martins@oracle.com>
In-Reply-To: <d090f3e9-2dad-f133-cd57-db84d9e08691@nvidia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO4P123CA0310.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:197::9) To BLAPR10MB4835.namprd10.prod.outlook.com
 (2603:10b6:208:331::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: de516258-dac6-472f-c6a5-08da4e2abd1a
X-MS-TrafficTypeDiagnostic: CO1PR10MB4419:EE_
X-Microsoft-Antispam-PRVS: <CO1PR10MB4419521A48D4A9BCBA898E9CBBAA9@CO1PR10MB4419.namprd10.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: kAxe79tey1q9kPUsn21P2AsFKSbPUpoxZ8Ldfl5y+Oo/xks8hCZHQjoeipw41+H4OV2CESKZ76+55z5etDK44Kl5QfqQr+PiMnB88oVb/HTC89KgU5Og2QaW54ddEvG7FyFumgK8C3V0zii3exD2g2rU6x4Ak7sSaKqy934P9Ke5NHciWMEgSAhl2npzrXYx/eiLxRP0YpIdbRrtvyjk340dbNJN2JqKDoU5rozpJaWGa6s8nOWzf8Vf4gVJvB2MjZB55lm9uEg8TmgEmHFW2Zri5QEBVEG2HMS3N+iTua5wwGDnCzyb8NZ8DSp66Oj4a022oatfPdTHYer2XoK07LyZJOzubyyW7ddx0eVZteTw9/yNOOkQbkCWjMe+F1oL5y3SD0SKvOxihokRX3l2xMy82GNWOWKgEZaMwGGQPEg/PJbqqtkZq8z+37r6/47oUYwQYbfDr9JZ750bXlHniXcPw357c0oeyO1iRnlVkxaItMluSNL/n7TtdusObT1hwtC1HJjk/m0JCRLAF/2vBCh3qHUE8Ux0deV2A3W4yqsNQyLYVDM/ncwMoVgEXztzI5WJrl8zO0wZ1N+TIJQv45DOn+ADS9ReIiqsrHzUedeFEU30bMSqXu0nUflDMpSqB4vKnh/h+yKKVd/5yYpKWBTBUA4+6ESX/r/7x5CV8FrzPY/orYGlJuGRhS64geVOIZbkXPtOGr1MzwRf68zSgQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BLAPR10MB4835.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(366004)(66556008)(66946007)(66476007)(31696002)(4326008)(8676002)(86362001)(508600001)(5660300002)(8936002)(6486002)(2616005)(53546011)(54906003)(6506007)(36756003)(6916009)(26005)(2906002)(6512007)(186003)(316002)(83380400001)(7416002)(6666004)(38100700002)(31686004)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cVBEOVlKRTlRSm1wWlRPSzhCNHU3Q3djZHFLZlUrMmViNWthcElSMWJxdXho?=
 =?utf-8?B?a1dJMzB5M2dxVmVmdUZSOHlTUi9RQzMrN2F4WEJ4MEdqandnWnpaQkcwTSta?=
 =?utf-8?B?bDJhZGxpYUsxUE1jSmFmS1RHOUdVNDk1bUczZEZ3NmI0Z1c1c3ROS2NWMi9s?=
 =?utf-8?B?Q0RlRDlNd1didEZYT1FJcmpPYXMwZDEvTnk1TUpwUVVKR08rN3FBY0srRVF3?=
 =?utf-8?B?bHZvR2YvQTBRL0lLYVJSVVg5NS9rbXBock52NTh3VTh5M3ord3htNFlkTjFS?=
 =?utf-8?B?YUlsRWttNGlLQlBaRzljUEowVjlGZUFNQVVOMEpOeVFGYmtkZFcya2p6Q05u?=
 =?utf-8?B?UU1PbjRPM3pTVFR6TXEwY0doUXBqbVNFR2V4RlJENExKL2JublBZc2dYTnpN?=
 =?utf-8?B?RVh3amNOTVZkeHVoNkp5UG9mYXcxbkt0TUlPS0lSWlNHNWVGRzEwZVFnYUhp?=
 =?utf-8?B?NVZxaDRzVEhEanpPbVIwRHBoU0dMMjBxd05oc2Noa3l1M2xoaEE1aEZQUmd2?=
 =?utf-8?B?TmJ2cW80U3VXOGVaeitMM2VUemM2NEludEpTYzJCOXlsUFdTeGZqL1NZbWZX?=
 =?utf-8?B?a25zLzdUWEZjK1piMnZNa3ZjVERaMlZMQTVDTU5qYkNMNVpiajhnSDFmdTMy?=
 =?utf-8?B?dUtRWUlnektNeDNScGVzZC9VamJpY2JaSXdJeFYrUnZvZnpqZDFtOGs5cmZI?=
 =?utf-8?B?ekNqZ2c1aGZWMjBrcUZteU1MTmxuck9CVjQ0OThMWm1DTFFQSVl3WE0vdENw?=
 =?utf-8?B?Nm16RTExSkN3VXJQUGkyRG9TdTZEUE1nS3NqcnkvMlF3eWdrclkwR1Zjc3Ax?=
 =?utf-8?B?bEdwME0zYWJIQThKMlpzL2src0RLazVkbzl5SXA2K2ZLdXpIb1RQY1A2TDd6?=
 =?utf-8?B?ZWJPOTZEN0dkTC84QkdiSmpMc1owejBMZkhGZGtQMTNVbkFqV3EwaTAwalN6?=
 =?utf-8?B?VWQwY3U5MjhOVzR0WU9kYUdlZjJSN3MvVXBBSlAzK09wYU1OdlZad3JiQjdl?=
 =?utf-8?B?RmcrR1N2UTc5SCtRRURKam1aSnBUeHJBYlRrUklRcGs2VWpTNGl4OHkvbE1h?=
 =?utf-8?B?KzZ0dFZMdmU1bHo0a1JXeFRsWi81RS9RYUFjLzE5SG52bDU3SVlaNEtPR1Ns?=
 =?utf-8?B?SkZRbjZ0MjdqZ01MK1dsci9TNGgzWXdXOEt6M0FEVkJaZ1cweHh1ZlNQYzVJ?=
 =?utf-8?B?eE1CdzUxaGU1Qkc3bUVpcC9VUlR2c2NFeFRGRFhJcFltdWdWRnZFTmtHYWtT?=
 =?utf-8?B?dmpQQ1NzZWMxeWZjdWZtd2M4YWlka1ZlaS8wcXBXc1d0U2hzL0ROL3RreXlO?=
 =?utf-8?B?QUx1R29UNjE3VFhvR1BpNmNwM2x2K0p1SFZoN3dWeUQzVWNiL1hlUXNRU2pK?=
 =?utf-8?B?SkxJd1F3LzRlbjU0Tm03RnkxSEZIQngvdEV0ZEkrdWRoZUtndXQ5am15ZG51?=
 =?utf-8?B?UDhOR01zYitqek9TSG5TMDJqeCtvZkV2Wjg0dndvMzdlaW1waDA3RGhwWHJu?=
 =?utf-8?B?WmhDYm0zY3h2TTBvaHFWL0NFbmlmWXAydklwTnQ4amxPWHQzdHk1c2JZRWU3?=
 =?utf-8?B?UW02dzlzL3VXdVBXdCtjUnRQVm9mVDBRS01lRkhzTWM4RDVCbWxBbUdqajlv?=
 =?utf-8?B?MlVhQmljSXA4ODUvUUllamovckJ1Z3RXc0dhV0dXMDZvcTdZTndiQTB1VVFT?=
 =?utf-8?B?VXBUY2QyQ29KZWpkOWo4RGZKcDdjT1R0UnNVdUl2OHhsTjV5R0NZWWoxeGl3?=
 =?utf-8?B?dGs0ZzVQWlBiMUptQkpnSDY1NXFvNVdoa3JsbUVMaGwrWVhiQS9LWmJkSWR2?=
 =?utf-8?B?Unp2KzRBY2tDY3hTczFtWjl0Ui85UGlXdnk4cmpncUtwbmVoMVpzSGZzRWpO?=
 =?utf-8?B?SFh0SVpQbTRIMVRLNHNTU1R2alhjeHo3OGRvejJsdTN2NzFkRFZjazZzcko1?=
 =?utf-8?B?a1Q4QW5adG9xKzB1SW9UelVpQ3c4L0dCL2FRbFU4ZWszY0pDUS9ZdkJsc1pp?=
 =?utf-8?B?VDYyRjR5Nld4LzBRODBNcmpHNFdhKy9ZbVpxZGpKTk9UeFpkSGpGRjBFTjE0?=
 =?utf-8?B?R3lFM2dKRUIyQ0VhRThLeHFyam9PK2tqZ0U1UkRKZ0t4a0FMMCtoK2lWaTZN?=
 =?utf-8?B?bUZzRUprSU9TbHZLVS9zbGRHNkEydWtEWTJUak5wZGFSQnpYbjBVUy94WHdy?=
 =?utf-8?B?NmZlRS9rZ3ljY1lTOXlJVmw1d2hxTlVjZjhmWi9nbThET1Vkd0xrSE5DanMy?=
 =?utf-8?B?bndaZnduSWFSVS9ReWtFZXVkU2NMVkxQamRRZk9PRjcxMW5McUNoSDRTUDd6?=
 =?utf-8?B?Ri9yQmdQQkFoS29wVDg4KzhVL2U5VlBEMmNab0JTcnJaZjBlY0psQmxhKytQ?=
 =?utf-8?Q?32FQGDvdSZ5U9zW8=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: de516258-dac6-472f-c6a5-08da4e2abd1a
X-MS-Exchange-CrossTenant-AuthSource: BLAPR10MB4835.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jun 2022 17:24:29.7087 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fz9UrvATNbYJpVOwldmMFSgTWiHOB36qEKFzKc1ZQP40CQWTNKLXNPVS/T3u7X9skYKp+zWsxe54awla/z8iyYHz850HV/jPBbUHdeVcQLE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR10MB4419
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.517, 18.0.874
 definitions=2022-06-14_06:2022-06-13,
 2022-06-14 signatures=0
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0
 mlxlogscore=999
 bulkscore=0 spamscore=0 phishscore=0 adultscore=0 suspectscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2204290000 definitions=main-2206140064
X-Proofpoint-GUID: Tz0P5bU19kxIlILIFij4NfLKgD8KlJmZ
X-Proofpoint-ORIG-GUID: Tz0P5bU19kxIlILIFij4NfLKgD8KlJmZ
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



On 6/14/22 17:34, Avihai Horon wrote:
> 
> On 6/14/2022 2:08 PM, Joao Martins wrote:
>> External email: Use caution opening links or attachments
>>
>>
>> On 5/30/22 18:07, Avihai Horon wrote:
>>> +static int vfio_save_complete_precopy(QEMUFile *f, void *opaque)
>>> +{
>>> +    VFIODevice *vbasedev = opaque;
>>> +    enum vfio_device_mig_state recover_state;
>>> +    int ret;
>>> +
>>> +    /* We reach here with device state STOP or STOP_COPY only */
>>> +    recover_state = VFIO_DEVICE_STATE_STOP;
>>> +    ret = vfio_migration_set_state(vbasedev, VFIO_DEVICE_STATE_STOP_COPY,
>>> +                                   recover_state);
>>> +    if (ret) {
>>> +        return ret;
>>> +    }
>>> +
>>> +    do {
>>> +        ret = vfio_save_block(f, vbasedev->migration);
>>> +        if (ret < 0) {
>>> +            return ret;
>>> +        }
>>> +    } while (!ret);
>>> +
>>> +    qemu_put_be64(f, VFIO_MIG_FLAG_END_OF_STATE);
>>> +    ret = qemu_file_get_error(f);
>>> +    if (ret) {
>>> +        return ret;
>>> +    }
>>> +
>>> +    ret = vfio_migration_set_state(vbasedev, VFIO_DEVICE_STATE_STOP,
>>> +                                   recover_state);
>> Is it expected that you are setting VFIO_DEVICE_STATE_STOP while
>> @recover_state is the same value (VFIO_DEVICE_STATE_STOP) ?
> 
> 
> Yes.
> Transitioning to any other state from STOP_COPY will first go through 
> STOP state (this is done internally by kernel).
> So there is no better option for the recover state but STOP.
> 
I was think about ERROR state given that you can transition there
from any state, but wasn't quite sure if it's appropriate to make that arc
while in stop copy migration phase.

>>> +    if (ret) {
>>> +        return ret;
>>> +    }
>>> +
>>> +    trace_vfio_save_complete_precopy(vbasedev->name);
>>> +
>>> +    return 0;

just a cosmetic nit: you could probably rewrite these last couple of lines as:

	if (!ret) {
	    trace_vfio_save_complete_precopy(vbasedev->name);
	}

	return ret;

Let's you avoid the double return path.

>>> +}
>>> +
>>>   static int vfio_v1_save_complete_precopy(QEMUFile *f, void *opaque)
>>>   {
>>>       VFIODevice *vbasedev = opaque;
>>> @@ -593,6 +775,14 @@ static void vfio_save_state(QEMUFile *f, void *opaque)
>>>       }
>>>   }
>>>
>>> +static int vfio_load_setup(QEMUFile *f, void *opaque)
>>> +{
>>> +    VFIODevice *vbasedev = opaque;
>>> +
>>> +    return vfio_migration_set_state(vbasedev, VFIO_DEVICE_STATE_RESUMING,
>>> +                                   vbasedev->migration->device_state);
>>> +}
>>> +
>>>   static int vfio_v1_load_setup(QEMUFile *f, void *opaque)
>>>   {
>>>       VFIODevice *vbasedev = opaque;
>>> @@ -620,6 +810,15 @@ static int vfio_v1_load_setup(QEMUFile *f, void *opaque)
>>>       return ret;
>>>   }
>>>
>>> +static int vfio_load_cleanup(void *opaque)
>>> +{
>>> +    VFIODevice *vbasedev = opaque;
>>> +
>>> +    vfio_migration_cleanup(vbasedev);
>>> +    trace_vfio_load_cleanup(vbasedev->name);
>>> +    return 0;
>>> +}
>>> +
>>>   static int vfio_v1_load_cleanup(void *opaque)
>>>   {
>>>       VFIODevice *vbasedev = opaque;
>>> @@ -662,7 +861,11 @@ static int vfio_load_state(QEMUFile *f, void *opaque, int version_id)
>>>               uint64_t data_size = qemu_get_be64(f);
>>>
>>>               if (data_size) {
>>> -                ret = vfio_v1_load_buffer(f, vbasedev, data_size);
>>> +                if (vbasedev->migration->v2) {
>>> +                    ret = vfio_load_buffer(f, vbasedev, data_size);
>>> +                } else {
>>> +                    ret = vfio_v1_load_buffer(f, vbasedev, data_size);
>>> +                }
>>>                   if (ret < 0) {
>>>                       return ret;
>>>                   }
>>> @@ -683,6 +886,16 @@ static int vfio_load_state(QEMUFile *f, void *opaque, int version_id)
>>>       return ret;
>>>   }
>>>
>>> +static SaveVMHandlers savevm_vfio_handlers = {
>>> +    .save_setup = vfio_save_setup,
>>> +    .save_cleanup = vfio_save_cleanup,
>>> +    .save_live_complete_precopy = vfio_save_complete_precopy,
>>> +    .save_state = vfio_save_state,
>>> +    .load_setup = vfio_load_setup,
>>> +    .load_cleanup = vfio_load_cleanup,
>>> +    .load_state = vfio_load_state,
>>> +};
>>> +
>>>   static SaveVMHandlers savevm_vfio_v1_handlers = {
>>>       .save_setup = vfio_v1_save_setup,
>>>       .save_cleanup = vfio_v1_save_cleanup,
>>> @@ -697,6 +910,34 @@ static SaveVMHandlers savevm_vfio_v1_handlers = {
>>>
>>>   /* ---------------------------------------------------------------------- */
>>>
>>> +static void vfio_vmstate_change(void *opaque, bool running, RunState state)
>>> +{
>>> +    VFIODevice *vbasedev = opaque;
>>> +    enum vfio_device_mig_state new_state;
>>> +    int ret;
>>> +
>>> +    if (running) {
>>> +        new_state = VFIO_DEVICE_STATE_RUNNING;
>>> +    } else {
>>> +        new_state = VFIO_DEVICE_STATE_STOP;
>>> +    }
>>> +
>>> +    ret = vfio_migration_set_state(vbasedev, new_state,
>>> +                                   VFIO_DEVICE_STATE_ERROR);
>>> +    if (ret) {
>>> +        /*
>>> +         * Migration should be aborted in this case, but vm_state_notify()
>>> +         * currently does not support reporting failures.
>>> +         */
>>> +        if (migrate_get_current()->to_dst_file) {
>>> +            qemu_file_set_error(migrate_get_current()->to_dst_file, ret);
>>> +        }
>>> +    }
>>> +
>>> +    trace_vfio_vmstate_change(vbasedev->name, running, RunState_str(state),
>>> +                              new_state);
>>> +}
>>> +
>>>   static void vfio_v1_vmstate_change(void *opaque, bool running, RunState state)
>>>   {
>>>       VFIODevice *vbasedev = opaque;
>>> @@ -770,12 +1011,17 @@ static void vfio_migration_state_notifier(Notifier *notifier, void *data)
>>>       case MIGRATION_STATUS_CANCELLED:
>>>       case MIGRATION_STATUS_FAILED:
>>>           bytes_transferred = 0;
>>> -        ret = vfio_migration_v1_set_state(vbasedev,
>>> -                                          ~(VFIO_DEVICE_STATE_V1_SAVING |
>>> -                                            VFIO_DEVICE_STATE_V1_RESUMING),
>>> -                                          VFIO_DEVICE_STATE_V1_RUNNING);
>>> -        if (ret) {
>>> -            error_report("%s: Failed to set state RUNNING", vbasedev->name);
>>> +        if (migration->v2) {
>>> +            vfio_migration_set_state(vbasedev, VFIO_DEVICE_STATE_RUNNING,
>>> +                                     VFIO_DEVICE_STATE_ERROR);
>> Perhaps you are discarding the error?
>>
>> Shouldn't it be:
>>
>>          err =  vfio_migration_set_state(vbasedev, VFIO_DEVICE_STATE_RUNNING,
>>                                          VFIO_DEVICE_STATE_ERROR);
>>
>>> +        } else {
>>> +            ret = vfio_migration_v1_set_state(vbasedev,
>>> +                                              ~(VFIO_DEVICE_STATE_V1_SAVING |
>>> +                                                VFIO_DEVICE_STATE_V1_RESUMING),
>>> +                                              VFIO_DEVICE_STATE_V1_RUNNING);
>>> +            if (ret) {
>>> +                error_report("%s: Failed to set state RUNNING", vbasedev->name);
>>> +            }
>> Perhaps this error_report and condition is in the wrong scope?
>>
>> Shouldn't it be more like this:
>>
>> if (migration->v2) {
>>          ret = vfio_migration_set_state(vbasedev, VFIO_DEVICE_STATE_RUNNING,
>>                                   VFIO_DEVICE_STATE_ERROR);
>> } else {
>>          ret = vfio_migration_v1_set_state(vbasedev,
>>                                            ~(VFIO_DEVICE_STATE_V1_SAVING |
>>                                              VFIO_DEVICE_STATE_V1_RESUMING),
>>                                            VFIO_DEVICE_STATE_V1_RUNNING);
>> }
>>
>>
>> if (ret) {
>>      error_report("%s: Failed to set state RUNNING", vbasedev->name);
>> }
> 
> 
> It was intentionally discarded.
> The return value is used by v1 code to determine whether to print an 
> error message or not.
> In v2 code the error message print is done inside 
> vfio_migration_set_state(), so there is no
> need for the return value here.
> 
Oh yes, I forgot that other print.

