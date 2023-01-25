Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 929BD67B5B0
	for <lists+qemu-devel@lfdr.de>; Wed, 25 Jan 2023 16:17:29 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pKhVK-0000SB-5j; Wed, 25 Jan 2023 10:16:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david.edmondson@oracle.com>)
 id 1pKgvD-0007ij-RL
 for qemu-devel@nongnu.org; Wed, 25 Jan 2023 09:38:44 -0500
Received: from mx0a-00069f02.pphosted.com ([205.220.165.32])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david.edmondson@oracle.com>)
 id 1pKgv8-0000e0-7b
 for qemu-devel@nongnu.org; Wed, 25 Jan 2023 09:38:42 -0500
Received: from pps.filterd (m0246629.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 30PDjZnf005896; Wed, 25 Jan 2023 14:38:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : in-reply-to : references : date : message-id : content-type :
 content-transfer-encoding : mime-version; s=corp-2022-7-12;
 bh=Y+5PlQX6KCmv6/dUBg7qF7incHQWVk1gZUBb6JFKEAw=;
 b=nZodep/IBgfkrctbDHH3Z8f3Da5GWuh3Uf/IaRqRa4c9VRwe8I9LXNeuLZvKe0y4+Kp0
 pZP+5D8oiy7YKLE6U/5JUyednALXkMb63Um5+S8m2GZSd1WjJkgIukvdJdbnWioGOoSg
 Hq3RejAG3+lYL1u4TDTFK9Sw7IX9eyp+NvkhDKvys5M2fvjkuT33/I0BUVqKgpAiVvPv
 IqJLATAqVCXRovWp1Vs2KRzkxItq7W/IfSV8+lHM3n6+CP51H/pnVzN07EQE34rpHI4D
 cUdg3y811ln6j8o3qhKSvgyshQxBCGo/wnxJkHL81LwFzneKFClVlCTYAk3EMufE+2Wc OQ== 
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com
 (iadpaimrmta03.appoci.oracle.com [130.35.103.27])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3n87xa81er-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 25 Jan 2023 14:38:31 +0000
Received: from pps.filterd
 (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
 by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (8.17.1.5/8.17.1.5)
 with ESMTP id 30PD08q7009131; Wed, 25 Jan 2023 14:38:30 GMT
Received: from nam02-bn1-obe.outbound.protection.outlook.com
 (mail-bn1nam02lp2042.outbound.protection.outlook.com [104.47.51.42])
 by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id
 3n86g6wv26-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 25 Jan 2023 14:38:30 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fo3j/8X58hIeWoK89MZBXUP43rQAoThjqQPtk4BXuY8g5uLqvBmf0gZgjkGLZ5MN3biVaeESxbYISTS0ikYOxFwZQDdeJExI3yZ6Odr34llvzugfdB2DoI0O4Ep76g1ZO4TWk5zhfAmSGh3OxV2ZfMfXIUu/uIgZGG7nYJSKT0ow5B2bbOUvb8M64S/w6MSYXM4GYUYzAI6sfnabOQ7hAtnSINwH7VDyDD2xLv1zQ9indAwsaOzmUw1Brn2YUdiaijostSnJowktLD+iEtYg2K6YSy+X9GFA63aAEBux9J7wCVuK6+zwqBLkmgd52m8BOGhdhTcW3bu7fvC+7relWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Y+5PlQX6KCmv6/dUBg7qF7incHQWVk1gZUBb6JFKEAw=;
 b=XFUvKbd54RXutLimbSVtXwd0mxVd1kj6rJvQaeJLzQV8a2Beomso9Pi93klHtC2YmZk4DBoa2r1Z1z/PBHyfnsOgRVYP86P7voroIEaDezqvHKRifvqOmviHMoQgYyuH0wglv1msqU2duOIqKZKG/fZ1op+XNu9EHMEYbBwczvZHWVbNuVRrSRtmKHVAzEcBMhC7lVyT2QFQXA6ym37YCX7Lm7FbdtUVq+TMDH4QBUGbMPMs1QmIwVX5eceoeJKpJ265p7GLyalhIWSUsqwtu6P5cyudMKsRtS5QzuPfSPiSVgC2az50OWdyuOwmZ1Sur/sdPpcnl4cSdR+/dxz1Pw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Y+5PlQX6KCmv6/dUBg7qF7incHQWVk1gZUBb6JFKEAw=;
 b=mefL5v8N3VQJ7lWLPkednSlhgSQteDmTxf9gPW2qXxcimZIaFVG61dtMcbpvJlxF2ZoqgJ+z0p3+qQl0yVuzMwJdRvA2E4dW9Naws57ouhJd90Louk+VPSfgCxuag96Nw1KFSNfUXJh+aSCCpuTWzxUVUYJJtBX61xWNgwaj00A=
Received: from DS7PR10MB4926.namprd10.prod.outlook.com (2603:10b6:5:3ac::20)
 by BY5PR10MB4275.namprd10.prod.outlook.com (2603:10b6:a03:210::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6043.20; Wed, 25 Jan
 2023 14:38:28 +0000
Received: from DS7PR10MB4926.namprd10.prod.outlook.com
 ([fe80::e85c:890f:6b09:556b]) by DS7PR10MB4926.namprd10.prod.outlook.com
 ([fe80::e85c:890f:6b09:556b%5]) with mapi id 15.20.6043.020; Wed, 25 Jan 2023
 14:38:28 +0000
From: David Edmondson <david.edmondson@oracle.com>
To: Eugenio =?utf-8?Q?P=C3=A9rez?= <eperezma@redhat.com>
Cc: qemu-devel@nongnu.org, leiyang@redhat.com, "Michael S. Tsirkin"
 <mst@redhat.com>, gautam.dawar@amd.com, Jason Wang
 <jasowang@redhat.com>, Laurent Vivier <lvivier@redhat.com>
Subject: Re: [PATCH] virtio-net: clear guest_announce feature if no cvq backend
In-Reply-To: <20230124161159.2182117-1-eperezma@redhat.com> ("Eugenio
 =?utf-8?Q?P=C3=A9rez=22's?=
 message of "Tue, 24 Jan 2023 17:11:59 +0100")
References: <20230124161159.2182117-1-eperezma@redhat.com>
Date: Wed, 25 Jan 2023 14:38:22 +0000
Message-ID: <m2y1pq1xy9.fsf@oracle.com>
User-Agent: Gnus/5.13 (Gnus v5.13)
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: AM4PR0101CA0076.eurprd01.prod.exchangelabs.com
 (2603:10a6:200:41::44) To DS7PR10MB4926.namprd10.prod.outlook.com
 (2603:10b6:5:3ac::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR10MB4926:EE_|BY5PR10MB4275:EE_
X-MS-Office365-Filtering-Correlation-Id: 4760c169-d963-4fbc-21cb-08dafee1d20d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: hbep2XCLG6PDLainx4VNep4TEopHY5KEGhNQ9UiUW4LyXL3/kWaWs8juR5OvmHWtZkpB9GF6zlgjnQJ2zfwRywdTsPvifDx1IEyVyLS4LJa/DlWuEB8580Q4t/ah3T1Qz1N5vb3lJiNoi1BDLNSJhIwk2oZCJ6zjpVi76phYL4vQeOy4VlVhHSMHqFFbTHut/NhoHU2EyMnbh6q+sUSj/gCSCymHt5ISB4dq0n6PcC6Uy1jLmjpjMkMS9JJfJG/Yi3nGsky4eWraVKUp1qiuftbYj0/XPN2BaznI4OmX86+XUvf6BDeiGmw9YL7fpG8GTWSWKjJpwyGsmgmEuO2L82zqkYKiJPFyOlg6a8Dx6VqDkoIGossB/VOR6NQESF4mICE36aaHysHAIDDbSUAlxLCjEpOCWdVRF4PGEJDbWY3ZXJ9/7EYTC5YccZXjt1w5GyKApw+CE0T9CbMJ8F47Sju1f4wsnHFBFscEzy8EjrFwzrv2DVL1AGRdJjQ8qV4b4ZMXBVwR6PsJGqW42iFNA17nxOr6+B1nN/AZAHl/jWQDrQUMAjayTYhJZy/0QLNNc7P2e4+rh9BYDhZu8Famx1q3cbd5wo/LGk44nhjyr6j+P1MuoMx7ecwXq+9aDUJ6Ai/USNL73Xwd86JOIr7Bog==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS7PR10MB4926.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(136003)(396003)(366004)(376002)(346002)(39860400002)(451199018)(5660300002)(8936002)(6916009)(4326008)(8676002)(41300700001)(36756003)(86362001)(38100700002)(2906002)(44832011)(66476007)(478600001)(6486002)(2616005)(6506007)(26005)(186003)(6512007)(6666004)(316002)(66574015)(54906003)(66556008)(66946007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RXhUTjJmd0g2ckVTVzVZTmY1clFCc1g1ZHNhOWRRaCtBV3NUcVI5eTdPM2FC?=
 =?utf-8?B?UGxvTmRsTm9JOGlqUTVhMDlxVDlVZ21yVld5RDZUa2NpNWhEd0lGU0VQTkJj?=
 =?utf-8?B?UktPSmVxazBrYUpBL2JJMzYzQko0akhFZlFWazVYdUUxT0w4ZzNZbjFxN2o1?=
 =?utf-8?B?dnB0azl6S2JBZHFBZTNFd1BMdktuNGRoSVRuaEZKa1R6dVlHV2RORG5rQzV2?=
 =?utf-8?B?SXE5Z2FyaDZpcTl1Y0gwYUtxbktZSjA5cVJTUjgxc2FGejNSZ1ZhSjMvc2l4?=
 =?utf-8?B?NGlNaTdVREJDRlBPSE5UZVZjNklYbWIvQnp4ZVhYNkZQNnYxa0c5NWVQOFVO?=
 =?utf-8?B?ektPNjFqVVBWRjVaanlKZFNxQVU5MTRVTXNpdzMvYWJ2QjJ2bkd3dWhYekdZ?=
 =?utf-8?B?bG53Tk1lOGtTUzZocUwvRXVJNERpUmZ5V3ZiRENkUm5QOTlHQm5FblJabmh3?=
 =?utf-8?B?ZFk4T2JoeHNKaWxBWWs2YWtRU3ZZTy9zK0VBZ0Uvam1saFRiUXg0Ymxiby9N?=
 =?utf-8?B?UDRUQ3kxdktURngvc3l2d3JHTVY3VVFZNkowb0dvSXJiVEFZSjk1YkMrTEJu?=
 =?utf-8?B?M3RoQXRlblhHK3FXdE9hWFhYOVdlZURxdTJpb2hVeXRFUHVXcHlxdW9RQit4?=
 =?utf-8?B?ZWx5ckd2dCtaenNESlpzUkZPdkxWOCtJZXJEVGJ4YmpueFA1QkNhVkZJMXYx?=
 =?utf-8?B?T0llMVNxU3IyY0l6SW9HTWFXTXY5Q3FjbnIwSWlCdzFSSVNhV3AvZWoyWGJh?=
 =?utf-8?B?VnVaMmloWUcvZmVjV1haQXdTUWRINC9EeWlHTnlvaFY2VitjdnMwZWtjSHFi?=
 =?utf-8?B?MEN2d3BON3FuZFNlcWFiOFEyRFZLTDNDRVBITnpFVkZpMEhYVTMvaVZkM1o0?=
 =?utf-8?B?OHBibXFJQlVFRWhQT1FIVllCZU83blBUOC9XZDBnaWsxZWh3TWpOVDlmc09u?=
 =?utf-8?B?KzAxT09hM0FiL0wrRit3REUzWWtaMmx3dk5QYVhHNkk3LzZhbmlQRXNKUmFF?=
 =?utf-8?B?TEVEbWtSQy85czRnY1lpYWoxQy83d3dtajdkMWxDdVNoMnhBQjdibFEwbkRW?=
 =?utf-8?B?a1pIc0x3ZHAwL1VWaDRaVkJzd2UvRmhUazhabHV5MmpoNG5jcmlBZ0JhTmxr?=
 =?utf-8?B?d09LWmtyaVNpcU12bEJlY0dhdUNEUkdPVzVhUGFrQWxJVFJUZVRpaG13Z0RG?=
 =?utf-8?B?aGljclo5eVNML3FKUndnUGFiZE1GcUNxeTRLL2w4azBEOVFYK2VqK0xBeGZK?=
 =?utf-8?B?OXZZNnp5V2RrQ1FuQXNQb3k1SkNVNFpPYnlMNHFqQ0VXRkZhTWVIdDlUcklR?=
 =?utf-8?B?YWNKUXlTMVhIVDZrVjhiMzdqWlhjN3dxQWdKL3RXeS9pZTdVWnFKcndOUlVW?=
 =?utf-8?B?T2lqN0RWYjZjRHpQTitGeEo3aWdHQWNuSTNWcE9EMDVTRGJraXpZejRJb3Rz?=
 =?utf-8?B?UXBaVlo1VFkyNmhBeTNvcjkzT0V5OWRWTDFTU0t4UUdoa2dIN2RER0p2NWlR?=
 =?utf-8?B?MXJacXFabU52YVd6Yll5SmxVR3NZUG52cGJjRFlCNTRJaGZhaUluTEpjM2c5?=
 =?utf-8?B?Wm9YdG5ieHN5OXN0cjZ3MFVtTXlPcVJsYWRZVTkxMVVzc1VhRmtjdVdFT2l6?=
 =?utf-8?B?QTZpcmR6a2s1RHdGVnpMMENxbnNIQXc0TXhqOHZmY3JaZ085aXp3T2pRemND?=
 =?utf-8?B?UkozTnM2MVpKVDhNRE1hZ2huQ09yL0N5OG94bWZiRGQrN1RNeWIyWmQxa2dW?=
 =?utf-8?B?aVNsMW9DOGI3SGsrQU5Ic2kvdnN6WXBydDdDWDlHeCtXTGJWRVFPOFRPVnN5?=
 =?utf-8?B?LytwQmtvOGRxZjF4aUhuWmNadlBxTGVCRXFRK0VrR3h4eUFDWXJUU1pIb2Fl?=
 =?utf-8?B?S3d1OGhnNm9LZnpQSmwzMHFFSGVzekd5aVAzRWpkRXJ4NWtKMDZFdDJTZUpk?=
 =?utf-8?B?VEgwaWRRNHJlaVZLWVJMRmFMbVpUaktobER3R0dnYmVQSzk0Y3JPRitoNFdi?=
 =?utf-8?B?SU94ZHY4cWV3dFFOVksxVzdpMks0VlRNV09aOUxFMkVScHVvVGI0cXJiL0Fs?=
 =?utf-8?B?RThKWmgrSTJqajNMSTVhQlBaWGI2bkt4Q0thMEV3c3ZxSW9WSUt4MkszU09x?=
 =?utf-8?B?bnNJQlRvQVNxTUR1L2lzdXZmY2pVRnc2Y0lQSTlEREMyTWdZbFc4dlhQM3A5?=
 =?utf-8?B?VHc9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 0NNMx9f+wShkBeIuUpI5jIYPxvPIhP62uD51DxCrZYuzKTFQKvJWJUmzZlDViAgxiVC38K+nOtIlfVQIvkTkCjYR91TKjgAJ5vK/2/DrVDKOhl0MJ3S84ZfEhz0FjhZI8WSxPWm9DaHuN/p6T5DxDmL01ZeEfFIPOffbJ0NkivDQYiaHqL0r3rnQ/pXaLZNpQUCTfaj+VWZwv5gedTbN6hmmHa5Fcj35v3evjwzyhWX9yvOog/2tOkuqP1uo5OVei/YOAThwJvUqUBZL2glPoodi6OmHO0eAeKbj896+LqMF0bYtBaHtA6NJNad7NPzj82o4VPqTLOW8X9/zIj4r0c8TxcN0fW0KzWfZ2pSy0zK/RM1I5ELjSCyXhRUONdHaei5DkkbUuUye9F7BmvUv/sGzX0B4AoP2p53CoUzZg9AajpS8zVlbg/0078P8yO4yOVotLaCaasjWZJNEVj6KGvRBci+NzYDPR7iu1Wr4tEUkNtH90CKOtS2ReWmt+NL8DnkmCzTrVYYECslXOili7UY5QCHIV7b4H3as19yGudtnRaQGbOKndkrEoC8rNWCOdF7KmBqA0zk8op+trB7EJROkqRdREG4bIdufcCJ/HPm84ItlQKtKZmOy+E2ecv6WkeHaimq5h1q4HtPefkThkCQuwaK4x3lvWq6aF3AE5rYK4YYhM9+/Sxjn6CKA9MbqSYY1x3V3wtGe1d6rghs08WBnMfh7edczEX4dHNboAMhbMNQ0E+Hjg+wo2nBUQOtbtt/Cz1VlnIWApDYeFb61nq3hBjMKwxxVKKkb7JPYMqU=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4760c169-d963-4fbc-21cb-08dafee1d20d
X-MS-Exchange-CrossTenant-AuthSource: DS7PR10MB4926.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jan 2023 14:38:27.9477 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Ej1AZScKeSzpLoif4hc6fM9q1Bz5187g/8p8HG17MJ0MEjGTjo/gG3gNcF8gdijPnHH5aNfptpbFoVNT5/Zwgj3TLqkDi8Tpbo38J1E38nA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR10MB4275
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.122.1
 definitions=2023-01-25_08,2023-01-25_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0
 spamscore=0 phishscore=0
 suspectscore=0 malwarescore=0 adultscore=0 mlxlogscore=999 mlxscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2212070000
 definitions=main-2301250130
X-Proofpoint-GUID: 6ClDWOAH-FHnwmChTKW6IzNVXg6-2QyK
X-Proofpoint-ORIG-GUID: 6ClDWOAH-FHnwmChTKW6IzNVXg6-2QyK
Received-SPF: pass client-ip=205.220.165.32;
 envelope-from=david.edmondson@oracle.com; helo=mx0a-00069f02.pphosted.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Wed, 25 Jan 2023 10:15:50 -0500
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Tuesday, 2023-01-24 at 17:11:59 +01, Eugenio P=C3=A9rez wrote:
> Since GUEST_ANNOUNCE is emulated the feature bit could be set without
> backend support.  This happens in the vDPA case.
>
> However, backend vDPA parent may not have CVQ support.  This causes an
> incoherent feature set, and the driver may refuse to start.  This
> happens in virtio-net Linux driver.

Could you now simplify the tests in virtio_net_announce() and
virtio_net_post_load_device() to look only for the presence of
GUEST_ANNOUNCE, given that you can now presume that it implies CTRL_VQ?

But anyway:

Reviewed-by: David Edmondson <david.edmondson@oracle.com>

> This may be solved differently in the future.  Qemu is able to emulate a
> CVQ just for guest_announce purposes, helping guest to notify the new
> location with vDPA devices that does not support it.  However, this is
> left as a TODO as it is way more complex to backport.
>
> Tested with vdpa_net_sim, toggling manually VIRTIO_NET_F_CTRL_VQ in the
> driver and migrating it with x-svq=3Don.
>
> Fixes: 980003debddd ("vdpa: do not handle VIRTIO_NET_F_GUEST_ANNOUNCE in =
vhost-vdpa")
> Reported-by: Dawar, Gautam <gautam.dawar@amd.com>
> Signed-off-by: Eugenio P=C3=A9rez <eperezma@redhat.com>
> ---
>  hw/net/virtio-net.c | 15 +++++++++++++++
>  1 file changed, 15 insertions(+)
>
> diff --git a/hw/net/virtio-net.c b/hw/net/virtio-net.c
> index 3ae909041a..09d5c7a664 100644
> --- a/hw/net/virtio-net.c
> +++ b/hw/net/virtio-net.c
> @@ -820,6 +820,21 @@ static uint64_t virtio_net_get_features(VirtIODevice=
 *vdev, uint64_t features,
>          features |=3D (1ULL << VIRTIO_NET_F_MTU);
>      }
>
> +    /*
> +     * Since GUEST_ANNOUNCE is emulated the feature bit could be set wit=
hout
> +     * enabled. This happens in the vDPA case.
> +     *
> +     * Make sure the feature set is not incoherent, as the driver could =
refuse
> +     * to start.
> +     *
> +     * TODO: QEMU is able to emulate a CVQ just for guest_announce purpo=
ses,
> +     * helping guest to notify the new location with vDPA devices that d=
oes not
> +     * support it.
> +     */
> +    if (!virtio_has_feature(vdev->backend_features, VIRTIO_NET_F_CTRL_VQ=
)) {
> +        virtio_clear_feature(&features, VIRTIO_NET_F_GUEST_ANNOUNCE);
> +    }
> +
>      return features;
>  }
--=20
Why stay in college? Why go to night school?

