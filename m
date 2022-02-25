Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 279304C450B
	for <lists+qemu-devel@lfdr.de>; Fri, 25 Feb 2022 13:56:29 +0100 (CET)
Received: from localhost ([::1]:52022 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nNa95-0000Hx-Tm
	for lists+qemu-devel@lfdr.de; Fri, 25 Feb 2022 07:56:27 -0500
Received: from eggs.gnu.org ([209.51.188.92]:56956)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <joao.m.martins@oracle.com>)
 id 1nNZu0-0005Kz-KQ
 for qemu-devel@nongnu.org; Fri, 25 Feb 2022 07:40:55 -0500
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32]:11780)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <joao.m.martins@oracle.com>)
 id 1nNZtx-0002uQ-F2
 for qemu-devel@nongnu.org; Fri, 25 Feb 2022 07:40:51 -0500
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 21PCIZ5G028608; 
 Fri, 25 Feb 2022 12:40:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=message-id : date :
 subject : to : cc : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=corp-2021-07-09;
 bh=1WBqr0ARFtAhEJkIIUNK/MM+kHM9im2dzvIZqfFfbK0=;
 b=AcFIGOOgeDOxIfIo3sTe6zHg/fkR1VQ7CDYlKulm0vEj9fx09NOyj8tm6TIctbB2N8jl
 ax7TnCzytSnt77CZ4xaJBLDuH3tUZZSAPhAoTGQ84NluYLSetitcv+3h5fgRwwV/LBNe
 kPuAGK1lV5N/DOpGlSf7I67pkQ5xncCD57pJR9PpyiAqmsLw4Z9ZuA4PowajfoIUPQES
 3STVOqKDyYnCioLcvmz4+ySj0WdrpYrNkLvqvZbKx8TpKPeu3ddzCeUf5xvv9Xl67MB5
 PZ2oVFJ4upRLKzwYqqIOZymP1UXAR4SAqVwWBRDRPMmVWBMUeLv9Uc3K7FH1a2L6bwSt 2Q== 
Received: from userp3030.oracle.com (userp3030.oracle.com [156.151.31.80])
 by mx0b-00069f02.pphosted.com with ESMTP id 3ecvaracem-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 25 Feb 2022 12:40:44 +0000
Received: from pps.filterd (userp3030.oracle.com [127.0.0.1])
 by userp3030.oracle.com (8.16.1.2/8.16.1.2) with SMTP id 21PCViGu149752;
 Fri, 25 Feb 2022 12:37:05 GMT
Received: from nam10-mw2-obe.outbound.protection.outlook.com
 (mail-mw2nam10lp2108.outbound.protection.outlook.com [104.47.55.108])
 by userp3030.oracle.com with ESMTP id 3eanp0596a-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 25 Feb 2022 12:37:05 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FBzWhNY6zKU/vyCUfkm43h7diUG+LD1iz3Nc7I1XVL5tk1NMJGgvRVrO49IkTOZwQSldlHPBmexJKuvQiZS3aLsuOxLPPGp/NPhN2iNsGARZRYQzBV4RK/25s3k9XHZXnFFjsY7rEU3DQke9j5XM9Gr3qcYCs8Rdtn4s6BQj2HLgkYA68PzwgPezRvEglioWP+a+fPBRErUjxRlpR/xFS4FlN/ULpjucaT521QzhAG9aGn/RVPCspGGAddhKq4L2NvgrTqmyQda2CYDOeI+hzqn0Y16gCvcsHT4VhbNga8ATWetbe17J0N5kmbGKWIZE+GyjzqIhAVi0EsYHWdBj/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1WBqr0ARFtAhEJkIIUNK/MM+kHM9im2dzvIZqfFfbK0=;
 b=ZY3Wv/Pjj2dK/hZ5+NWt3TuOyWowRr7v7iKkO0LYEHVR80I/ymoTLCgIA1kgQm/Ywz7KyTuiBV0DbEpdEsl1kWv7kJo3xnivRTns7XiI3wCyUzzEYrNNhgjRa4umCixodcV1R5P+T6EiPb1U8wPXhJuK0OoQY2hY72qCpaHZKjGrXfBLCUc7R+5ZEzZDANpuZd8ultTOKt3t83cY3WSpo5yJ1P79Bmyd1U1tBlhXVG5+oiqrX9EyDvAdLF+IDeGoq5yKQD8E3nNADaFKGbrlOoG0ltKoLStwERnsG+hVM595KnU33onJP+2ZUSxNUBwM8bfgxvQo54jVtjoYLxuSuA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1WBqr0ARFtAhEJkIIUNK/MM+kHM9im2dzvIZqfFfbK0=;
 b=ATycjmqO/gq4mcgs+UNZx7iIIFtiBND2l89c/mJ2UsaS3q8RVXY0GoMJg78S/OvbcOu+AHgYYAzILT01UGe73jBtsB806H5qY+AwFDlDbpWexd3+4ZSGVrANozV91TOIc4tdnDJcpwTcA4oIxcQwopB7HzdapF6MqnlCIu1LT94=
Received: from BLAPR10MB4835.namprd10.prod.outlook.com (2603:10b6:208:331::11)
 by CY4PR1001MB2216.namprd10.prod.outlook.com (2603:10b6:910:43::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5017.21; Fri, 25 Feb
 2022 12:37:01 +0000
Received: from BLAPR10MB4835.namprd10.prod.outlook.com
 ([fe80::750f:bf1d:1599:3406]) by BLAPR10MB4835.namprd10.prod.outlook.com
 ([fe80::750f:bf1d:1599:3406%6]) with mapi id 15.20.5017.026; Fri, 25 Feb 2022
 12:37:01 +0000
Message-ID: <16ac8c6a-1b47-d590-eeef-b7a28b0b471d@oracle.com>
Date: Fri, 25 Feb 2022 12:36:55 +0000
Subject: Re: [PATCH v3 4/6] i386/pc: relocate 4g start to 1T where applicable
Content-Language: en-US
To: "Michael S. Tsirkin" <mst@redhat.com>
References: <5fee0e05-e4d1-712b-9ad1-f009aba431ea@oracle.com>
 <c28ade30-fbea-4d3a-3b11-356c02abaabb@oracle.com>
 <20220224122146-mutt-send-email-mst@kernel.org>
 <7afb8caf-5c98-d6db-d3e5-6e08b2832d57@oracle.com>
 <20220224131607-mutt-send-email-mst@kernel.org>
 <f19dd8be-f923-fd7d-c54d-a54fd775dcc5@oracle.com>
 <20220224144800-mutt-send-email-mst@kernel.org>
 <37df5f3a-283a-a016-311f-8281bbacda19@oracle.com>
 <20220224150626-mutt-send-email-mst@kernel.org>
 <5cae0afc-df3e-5dc6-d11b-2f7d931ba5e6@oracle.com>
 <20220225001353-mutt-send-email-mst@kernel.org>
From: Joao Martins <joao.m.martins@oracle.com>
In-Reply-To: <20220225001353-mutt-send-email-mst@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM9P192CA0014.EURP192.PROD.OUTLOOK.COM
 (2603:10a6:20b:21d::19) To BLAPR10MB4835.namprd10.prod.outlook.com
 (2603:10b6:208:331::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a2f5242c-a7bd-4a7d-9e26-08d9f85b853f
X-MS-TrafficTypeDiagnostic: CY4PR1001MB2216:EE_
X-Microsoft-Antispam-PRVS: <CY4PR1001MB2216C8F36FF76337720DE11BBB3E9@CY4PR1001MB2216.namprd10.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: lvyGsFvIEBvmX2TSBABHZS37TdGUlZfHsoaekbi2UBbc3Gl8AQwzZaTHBrAgDCOvtKdNNfJyA3r5mgLWBuIs+r+9D2EMH8p/2zHsjiPQOtrlXR27ZNMVBJPmessFiRiUx6R8pwZs0jENps3ZbDJ6MjSY5JSHuqyYzbLyD/HzMkAvziTXrszvBiFxQECuc5dvEq2FWIpv9fQu412PQJ80yKA8ATRnce9mDLquYd7Do1NlgXHuvfqVD+7IisFLbKo8d9ljz6SRLMkY/zFvSpccjjKRZOycldmqJLGA4pGTi/9DwkrKb3gR5NsvlE8ZF5gaLsg0BoViuBhNZyiTLCZjnhrSD6s2a1/J/8DZpTgBxJIP101UkgS7fQVd8gMfY/yaxemyM6iYG8CoiFjem2reEna4cs/sk1knNL1IkPWVAfyfRRKYTUWSYWcTCv8Pafm9HsHapIfhrr5pmDDESPJNWVCt8LIMqu7ywTsP7riSXI7oeaWr4L/VPVynG/cQZ0ABRDI8HexgdLDPo05ABV4Yo44CMz2Q2L4KtYU0f0QA4ieK0cwI5wxkgUl2t1g9E+Ghe520EHM3UQ5nV/KySPSsC9N16IN3Xisb6j1ezqmVr/nfKxrLfVwcfzD+9imT1TzxPAWK3qWDAJTTwxFXs7Y6W1YDas5XhyYd5+n//f+wl5zDmMqs4AR5DjaFkSjCH44V+8xnC9cJ30ga5/ClkV69kw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BLAPR10MB4835.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(316002)(8676002)(6666004)(31686004)(6916009)(36756003)(2616005)(54906003)(26005)(66476007)(83380400001)(66556008)(6512007)(4326008)(6486002)(38100700002)(186003)(53546011)(2906002)(66946007)(31696002)(508600001)(8936002)(5660300002)(86362001)(7416002)(6506007)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?eWdZaFFOTTI4N0tLMlJ2TktZOXRiaTNyTkVQMm01SEFRYVB6Z2hwbUhDVW9l?=
 =?utf-8?B?NWlkam9oSTdOYWdTcGcyL3lGVSsxMEliL1RCdzgzY3F1V2s5Sk5oVjZhMU9E?=
 =?utf-8?B?L3gzRHVWeXJtMmVqMkZmallWdWl4ODFUaUptd1hPUkMvZ0tXY2xLYkRVNlhV?=
 =?utf-8?B?anJjclFaeDBPemNnUFhOcDdMMHlpR2IzTXNkRmJ2U0NRdUlvK3ZhMjZhWHds?=
 =?utf-8?B?bkladGNJKzY1d1lHTHM5VjZlL1dMTnJvbnBBdGVuc2FaRkFYOFEyYVN6T0lI?=
 =?utf-8?B?N1F4YTVvb2FPQXpPK0J4YWRvcTJaUzU3Q1lKU3NBM3pPZ0pGcnlSTGFHUURt?=
 =?utf-8?B?N2NxSTBRa1BwaFh3S1c4d3RLUGg5MHNtaDk1R2ExNzRmYWlGOG1wNHRxT2pX?=
 =?utf-8?B?eENHbmdRazNZM2ZpczRjSlhaaS81N3ZpVkxuQzB1TE5aYzRuUDNlUm05c25H?=
 =?utf-8?B?dmV6dmgyeFBadDAycHY5U0lLQm9TQVdLOHh3WkVVMis1YThRQWlmUTAwTUIy?=
 =?utf-8?B?R3Y2UmFMam9Bb21UYmtuVzN2a1lwbm9ZRkZOSnVwOTl1bExzUTZPZy9CQXNP?=
 =?utf-8?B?LzBYZmF0RVRJUTNhU09tVmFqQSt3TWV3RDhMQkQ0R1NURG9PcjZKeEVjYnJz?=
 =?utf-8?B?ZU1peFNrb1VFR2QxNkFwN1NHM3E3dzZPazkrWTh3WlFBZEQzclVOamplS0Z1?=
 =?utf-8?B?TGUxZUhSUTNyc2dzZnJndFRYZndNZVVBWUcxOTJLWGtsNjlSeWtWQzlCSlZ4?=
 =?utf-8?B?QjV5VEszdUkrckMxYVNMaHpMTE9mYk9uYkRrTlhUSUxhbDZnd3d6STdOMWtM?=
 =?utf-8?B?TDBKM0tXTHhBdUhqTVRZZU9na0RKSzI1UVJ2M3hFVGpGdWVuUk81SmZ0b28y?=
 =?utf-8?B?RGpTOU5VSHo1a0d6bVAzODF1NS9Pc2FlNVUxQXlCSkx1ZEVNRG5oYUMxUlFF?=
 =?utf-8?B?TDhLeHpUVWRRUE9yeHhVSGVMVVlrSmpwQk8rc1orZTJtN1hreWVVOUlHTUpI?=
 =?utf-8?B?bHd1bUlGU2RHS3ZrdS9PNHVKOTJYeGZra3R4K0x6ZlZiMXlZbCtJdkdRaVc0?=
 =?utf-8?B?RmtqZVg0UXkwWU1GRWhHK3BLWlk1c0p2a3RteGpqckFTNzY0Q1dHYndsTnNy?=
 =?utf-8?B?SkhHeVo3M3FoOVhDUGlZdGlTQm1qSG1Ed2p5ZmpURHordG9jWlJBZEhaNG5M?=
 =?utf-8?B?amo1dnk4ak96bFBySE1qMUJoTjY2aWxEK2RKN0MvZGJFL2FwZnFzNU5LRmEr?=
 =?utf-8?B?RlZKZUZmeWM4ZUFObjVDbng4cCtwLy8yMWJpcTBXUFFhRGFtYTlJZ0JURXRk?=
 =?utf-8?B?eGJPNDZCZkNRMFJkM2tJVkMyRjBDdzZLbVE1a2t6Zmdhall4dGxjTGVuN0tl?=
 =?utf-8?B?QlVuUWhNR1ZZUGNObHhjRVlPVkhkdS83ZlQvSFhiRUNUWCtrbDBFWmNJUEg5?=
 =?utf-8?B?SGVRd3pYUzl2WHVCS1lmb0ZsaWpaRXNtLzNxczVHZXE1UzBpTmhxMGl6c1Yw?=
 =?utf-8?B?VUZ6V0pQY2Rtdm9mZUZWYUUrMFpPMklaNWg0K0UrWmtUMHZnT0dmaGF0MVAx?=
 =?utf-8?B?bjRPOGU2RGtYNHd5YjZ5VUsrSU9wMWpUZmtzOU9HZ0t5eUVVazVKbFgzWU1B?=
 =?utf-8?B?WVd4aWxTYjZhNXdPdVlXWWlia2M5dmZxdGU0dkMvSWNmVEFucVlUWDJ5ZmlW?=
 =?utf-8?B?MGpxc3dzT3dtMitkRmJZYUtRcTAvSVJFbkNIUU9MSHM4dm4weFFnVDBmY24y?=
 =?utf-8?B?TzRiUDlVTmtBbEZGYUZMMG1HdVllWm9LQ0ZCVGFja0gyWHBTUEE0RnFWYzBx?=
 =?utf-8?B?RXRRTmZPczREcjlRL0Y1Tno0a0RzQXAzQThzdnB4Zy9ZY0hvMFhFb3U0UEdV?=
 =?utf-8?B?cjZGL25STHpzQU1GbUEzUmFoK0FpSGRGb3NZZlBhTXU4U2Nyby8zWWRtRE52?=
 =?utf-8?B?MjhmSEVvS3BmNitkeHNJUGk0ck13Y2s3ZnMrOE5LSzFRT2g4cVFOTHR4dk4y?=
 =?utf-8?B?VFJmZldTNFljUVlmSlFLSnV5NFVxd2gwZStCRGx2bWZpS3dvMWFwa3N6TDRp?=
 =?utf-8?B?UUdnQ2xrVEEyYTVEa2xUSXBNWTcrS1BOZ3k3SDY4Mnd2em4wRjlyeUhSVklp?=
 =?utf-8?B?dStSNk5kS3Byd2dFRGFYK3hzK0dMNjRRdG5sOEhNbUdnSFRXamZOcDQ0OTZN?=
 =?utf-8?B?Zi9TcWdlZzhKNFUrRjJESEJQWW43MWUzeVcvaTY2VzdXajFlVm15SzluVHpZ?=
 =?utf-8?Q?ydlzgss3xwpH7d56SP+hwuMqCVTbHgun/UQOhqDs2I=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a2f5242c-a7bd-4a7d-9e26-08d9f85b853f
X-MS-Exchange-CrossTenant-AuthSource: BLAPR10MB4835.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Feb 2022 12:37:01.1980 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7FdXbGOLDYwDdUD+0LNxyVvoxjv2tU2vgOCLBGouY0APmRsgn7g8kw9WaBInon3s6jnHHrgRxis/ksQxqosGPHkwdFIKHXF5pybRJBTrThI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR1001MB2216
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10268
 signatures=684655
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0
 suspectscore=0 adultscore=0
 malwarescore=0 phishscore=0 mlxlogscore=999 mlxscore=0 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2201110000
 definitions=main-2202250070
X-Proofpoint-GUID: F6QGTvdTTnOQr3f2LNp7udcHm7OT21Oe
X-Proofpoint-ORIG-GUID: F6QGTvdTTnOQr3f2LNp7udcHm7OT21Oe
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

On 2/25/22 05:22, Michael S. Tsirkin wrote:
> On Thu, Feb 24, 2022 at 08:34:40PM +0000, Joao Martins wrote:
>> On 2/24/22 20:12, Michael S. Tsirkin wrote:
>>> On Thu, Feb 24, 2022 at 08:04:48PM +0000, Joao Martins wrote:
>>>> On 2/24/22 19:54, Michael S. Tsirkin wrote:
>>>>> On Thu, Feb 24, 2022 at 07:44:26PM +0000, Joao Martins wrote:
>>>>>> On 2/24/22 18:30, Michael S. Tsirkin wrote:
>>>>>>> On Thu, Feb 24, 2022 at 05:54:58PM +0000, Joao Martins wrote:
>>>>>>>> On 2/24/22 17:23, Michael S. Tsirkin wrote:
>>>>>>>>> On Thu, Feb 24, 2022 at 04:07:22PM +0000, Joao Martins wrote:
>>>>>>>>>> On 2/23/22 23:35, Joao Martins wrote:
>>>>>>>>>>> On 2/23/22 21:22, Michael S. Tsirkin wrote:
>>>>>>>>>>>>> +static void x86_update_above_4g_mem_start(PCMachineState *pcms,
>>>>>>>>>>>>> +                                          uint64_t pci_hole64_size)
>>>>>>>>>>>>> +{
>>>>>>>>>>>>> +    X86MachineState *x86ms = X86_MACHINE(pcms);
>>>>>>>>>>>>> +    uint32_t eax, vendor[3];
>>>>>>>>>>>>> +
>>>>>>>>>>>>> +    host_cpuid(0x0, 0, &eax, &vendor[0], &vendor[2], &vendor[1]);
>>>>>>>>>>>>> +    if (!IS_AMD_VENDOR(vendor)) {
>>>>>>>>>>>>> +        return;
>>>>>>>>>>>>> +    }
>>>>>>>>>>>>
>>>>>>>>>>>> Wait a sec, should this actually be tying things to the host CPU ID?
>>>>>>>>>>>> It's really about what we present to the guest though,
>>>>>>>>>>>> isn't it?
>>>>>>>>>>>
>>>>>>>>>>> It was the easier catch all to use cpuid without going into
>>>>>>>>>>> Linux UAPI specifics. But it doesn't have to tie in there, it is only
>>>>>>>>>>> for systems with an IOMMU present.
>>>>>>>>>>>
>>>>>>>>>>>> Also, can't we tie this to whether the AMD IOMMU is present?
>>>>>>>>>>>>
>>>>>>>>>>> I think so, I can add that. Something like a amd_iommu_exists() helper
>>>>>>>>>>> in util/vfio-helpers.c which checks if there's any sysfs child entries
>>>>>>>>>>> that start with ivhd in /sys/class/iommu/. Given that this HT region is
>>>>>>>>>>> hardcoded in iommu reserved regions since >=4.11 (to latest) I don't think it's
>>>>>>>>>>> even worth checking the range exists in:
>>>>>>>>>>>
>>>>>>>>>>> 	/sys/kernel/iommu_groups/0/reserved_regions
>>>>>>>>>>>
>>>>>>>>>>> (Also that sysfs ABI is >= 4.11 only)
>>>>>>>>>>
>>>>>>>>>> Here's what I have staged in local tree, to address your comment.
>>>>>>>>>>
>>>>>>>>>> Naturally the first chunk is what's affected by this patch the rest is a
>>>>>>>>>> precedessor patch to introduce qemu_amd_iommu_is_present(). Seems to pass
>>>>>>>>>> all the tests and what not.
>>>>>>>>>>
>>>>>>>>>> I am not entirely sure this is the right place to put such a helper, open
>>>>>>>>>> to suggestions. wrt to the naming of the helper, I tried to follow the rest
>>>>>>>>>> of the file's style.
>>>>>>>>>>

[snip]

>>>>>>>>>
>>>>>>>>> why are we checking whether an AMD IOMMU is present
>>>>>>>>> on the host? 
>>>>>>>>> Isn't what we care about whether it's
>>>>>>>>> present in the VM? What we are reserving after all
>>>>>>>>> is a range of GPAs, not actual host PA's ...
>>>>>>>>>
>>>>>>>> Right.
>>>>>>>>
>>>>>>>> But any DMA map done by VFIO/IOMMU using those GPA ranges will fail,
>>>>>>>> and so we need to not map that portion of address space entirely
>>>>>>>> and use some other portion of the GPA-space. This has to
>>>>>>>> do with host IOMMU which is where the DMA mapping of guest PA takes
>>>>>>>> place. So, if you do not have an host IOMMU, you can't
>>>>>>>> service guest DMA/PCIe services via VFIO through the host IOMMU, therefore you
>>>>>>>> don't need this problem.
>>>>>>>>
>>>>>>>> Whether one uses a guest IOMMU or not does not affect the result,
>>>>>>>> it would be more of a case of mimicking real hardware not fixing
>>>>>>>> the issue of this series.
>>>>>>>
>>>>>>>
>>>>>>> Hmm okay ... my first reaction was to say let's put it under VFIO then.
>>>>>>> And ideally move the logic reporting reserved ranges there too.
>>>>>>> However, I think vdpa has the same issue too.
>>>>>>> CC Jason for an opinion.
>>>>>>
>>>>>> It does have the same problem.
>>>>>>
>>>>>> This is not specific to VFIO, it's to anything that uses the iommu.
>>>>>
>>>>> Right. Most VMs don't use the host IOMMU though ;) It's unfortunate
>>>>> that we don't have a global "enable-vfio" flag since vfio devices
>>>>> can be hot-plugged. I think this is not the first time we wanted
>>>>> something like this, right Alex?
>>>>>
>>>>>> It's
>>>>>> just that VFIO doesn't let you shoot in the foot :)
>>>>>>
>>>>>> vDPA would need to validate iova ranges as well to prevent mapping on
>>>>>> reserved IOVAs similar to commit 9b77e5c7984 ("vfio/type1: check dma
>>>>>> map request is within a valid iova range"). Now you could argue that
>>>>>> it's an IOMMU core problem, maybe.
>>>>>>
>>>>>> But I this as a separate problem,
>>>>>> because regardless of said validation, your guest provisioning
>>>>>> is still going to fail for guests with >=1010G of max GPA and even if
>>>>>> it doesn't fail you shouldn't be letting it DMA map those in the first
>>>>>> place (e.g. you could see spurious INVALID_DEVICE_REQUEST fault events
>>>>>> from IOMMU if DMA is attempted over the first megabyte of that 1T hole).
>>>>>
>>>>> I wonder what's the status on a system without an IOMMU.
>>>>>
>>>> In theory you should be OK. Also it's worth keeping in mind that AMD machines
>>>> with >=1T have this 12G hole marked as Reserved, so even DMA at last when CPU
>>>> is the initiator should be fine on worst case scenario.
>>>
>>> Not sure I understand this last sentence.
>>>
>> I was trying to say that the E820 from hardware is marked as Reserved and any DMA
>> from/to endpoints from kernel-supplied CPU addresses will use those reserved ranges.
> 
> meaning "will *not* use" I guess?
> 
Yes, correct.

Sorry, I missed a word there. Happened quite a lot these days to me :(

>>>>>>> Also, some concerns
>>>>>>> - I think this changes memory layout for working VMs not using VFIO.
>>>>>>>   Better preserve the old layout for old machine types?
>>>>>>>
>>>>>> Oh definitely, and I do that in this series. See the last commit, and
>>>>>> in the past it was also a machine-property exposed to userspace.
>>>>>> Otherwise I would be breaking (badly) compat/migration.
>>>>>>
>>>>>> I would like to emphasize that these memory layout changes are *exclusive* and
>>>>>> *only* for hosts on AMD with guests memory being bigger than ~950G-~1010G.
>>>>>> It's not every guest, but a fairly limited subset of big-memory guests that
>>>>>> are not the norm.
>>>>>>
>>>>>> Albeit the phys-bits property errors might gives us a bit more trouble, so
>>>>>> it might help being more conservative.
>>>>>>
>>>>>>> - You mention the phys bits issue very briefly, and it's pretty
>>>>>>>   concerning.  Do we maybe want to also disable the work around if phys
>>>>>>>   bits is too small? 
>>>>>>
>>>>>> We are doing that here (well, v4), as suggested by Igor. Note that in this series
>>>>>> it's a warning, but v4 I have it as an error and with the 32-bit issues that
>>>>>> I found through qtest.
>>>>>>
>>>>>> I share the same concern as you over making this an error because of compatibility.
>>>>>> Perhaps, we could go back to the previous version and turn back into a warning and
>>>>>> additionally even disabling the relocation all together. Or if desired even
>>>>>> depending on a machine-property to enable it.
>>>>>
>>>>> I would be inclined to disable the relocation. And maybe block vfio? I'm
>>>>> not 100% sure about that last one, but this can be a vfio decision to
>>>>> make.
>>>>>
>>>> I don't see this as a VFIO problem (VFIO is actually being a good citizen and doing the
>>>> right thing :)). From my perspective this fix is also useful to vDPA (which we also care),
>>>> and thus will also let us avoid DMA mapping in these GPA ranges.
>>>>
>>>> The reason I mention VFIO in cover letter is that it's one visible UAPI change that
>>>> users will notice that suddenly their 1TB+ VMs break.
>>>
>>> What I mean is that most VMs don't use either VFIO or VDPA.
>>> If we had VFIO,VDPA as an accelerator that needs to be listed
>>> upfront when qemu is started, we could solve this with
>>> a bit less risk by not changing anything for VMs without these two.
>>>
>> That wouldn't work for the vfio/vdpa hotplug case (which we do use),
>> and part of the reason I picked to always avoid the 1TB hole. VFIO even tells
>> you what are those allowed IOVA ranges when you create the container.
>>
>> The machine property, though, could communicate /the intent/ to add
>> any VFIO or vDPA devices in the future and maybe cover for that. That
>> let's one avoid any 'accelerator-only' problems and restrict the issues
>> of this series to VMs with VFIO/VDPA if the risk is a concern.
> 
> Well Alex nacked that idea (and I certainly trust him where VFIO is
> concerned), I guess for now we'll just live with the risk.
> 

My reading was that he nacked a 'VFIO-only' global property not necessarily
the machine property for valid-iova. Hmm, I might be misreading it as at the
end of the day the result will lead to the same thing.

