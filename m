Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 40CC95718B2
	for <lists+qemu-devel@lfdr.de>; Tue, 12 Jul 2022 13:38:54 +0200 (CEST)
Received: from localhost ([::1]:45352 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oBEE8-0003o6-SU
	for lists+qemu-devel@lfdr.de; Tue, 12 Jul 2022 07:38:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34296)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <joao.m.martins@oracle.com>)
 id 1oBEBZ-0001lD-LB
 for qemu-devel@nongnu.org; Tue, 12 Jul 2022 07:36:13 -0400
Received: from mx0a-00069f02.pphosted.com ([205.220.165.32]:14838)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <joao.m.martins@oracle.com>)
 id 1oBEBV-0001jG-Qh
 for qemu-devel@nongnu.org; Tue, 12 Jul 2022 07:36:12 -0400
Received: from pps.filterd (m0246629.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 26CAs3kn030514;
 Tue, 12 Jul 2022 11:36:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=message-id : date :
 subject : from : to : cc : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=corp-2021-07-09;
 bh=Nho6yf8ZVDS8pUcl4RL8pyyYf4NTY9I1zW4Sq1/5RiI=;
 b=kiFr2ktQHtzTDAr9nLnGbKozxf7Qw8y7Yi7BrIGabmtZT7TgG4en3lL8+FcVZAu8XFEE
 5IYCgYZD57QwV9JsVioYTeOQISTF8ogkl9GMVgZ5Tq8VOX04+BdOPJq62XKlNEefA8Za
 962SiuD8Yp8XfDZVwsMGI3hE91krxfTjvJJjEKuMCnVp47MgVC+uFoZ11CdnH/QhIAe3
 yTv4qOa0u9FK/Aau8d2pOMPSFn+iXk/EdPcj44pmMGeTuGCpQIBmcrnChpXxEZaceEyt
 RvdmUqdwbOQ2TEvQ+52Cu5sA97TNvq+3cjijcouSiu2ZX4zYyyKycqLm+QiissulpI5R ug== 
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com
 (iadpaimrmta03.appoci.oracle.com [130.35.103.27])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3h71sgp7g6-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 12 Jul 2022 11:36:00 +0000
Received: from pps.filterd
 (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
 by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (8.16.1.2/8.16.1.2)
 with SMTP id 26CBAkel036839; Tue, 12 Jul 2022 11:35:59 GMT
Received: from nam12-mw2-obe.outbound.protection.outlook.com
 (mail-mw2nam12lp2042.outbound.protection.outlook.com [104.47.66.42])
 by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com with ESMTP id
 3h7043435q-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 12 Jul 2022 11:35:59 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XvKoL12/00IXtsYNmZ5SoiWG8iufwfrjI672QRQuBSFyZdAImHipfrxzGivKiCQSZgdnLfiWYUA9rUJ+hxH74lNDmI41IBGo7waVHj/W3H7X2Sa9LdPL5yQXYQ+wrp5oK59aoRDhMEix89QvtNvQIeVCYbgxJkSYF5zlvQR6po3iSsjJdU+u9y7NqnkC4qIMrquotaY+W3DeFqlDZkvjBJNd0xmv02M3p6qGBdfuDwar5sZ3BIjZsX05oYwk+libjcNEA3gCCxYPeqebf4Unk0ZFX7RG9rgLEmx3zbvqBzuh0spblwzRLdWgbrIxP4E8a1gWhfNoXj0nULZPLCxVxA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Nho6yf8ZVDS8pUcl4RL8pyyYf4NTY9I1zW4Sq1/5RiI=;
 b=WN/Z6qckxLVVHYDZxvPz0wZFN86Xj4UQikgrttommSzWdURqdjgtnHePOhXPtF/5uAU00kHiqYNXKaKT4LqwcDLNETWmcibr2aYRH7osorXp/y1mP3N3PXcua/jCOmxTmj/PNp9Hc4UBGVCfrBY61qhDdq/t5ShOVsXyVO4tLJHt/vW+sYAIseNnYLOSXi8qx5rgIiFP8kgNVmPukZOhEhlFCQFeRiNIvQG/prG1rvjFyGhUViykyURhAoez3yUugSpAVcx7wLoTG1VkR4KBe7SIQbpJ+mvUrRDlfPRozZXdyND6tqXFhdrgIC+CRdHKPn4gtEBnzHHCU5oAHvWfnw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Nho6yf8ZVDS8pUcl4RL8pyyYf4NTY9I1zW4Sq1/5RiI=;
 b=ebMHlD1M2n5VjfeSWMV+IAEPpnncQqNz3tRA5ffr1cazTDfyu4rbZJlJOynud2hGZ/mxsbm1ljhm2wUCMfhDVImsDeekJMOo9BSYmCO6Q1LXuY22uvlweAa31WEFHXxqAE8Zs6IrbLG9b/uBfbJKDt4XnnK6psfsGYv3GPlV2xo=
Received: from BLAPR10MB4835.namprd10.prod.outlook.com (2603:10b6:208:331::11)
 by BN0PR10MB4920.namprd10.prod.outlook.com (2603:10b6:408:128::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5417.16; Tue, 12 Jul
 2022 11:35:56 +0000
Received: from BLAPR10MB4835.namprd10.prod.outlook.com
 ([fe80::b842:a301:806d:231e]) by BLAPR10MB4835.namprd10.prod.outlook.com
 ([fe80::b842:a301:806d:231e%9]) with mapi id 15.20.5417.026; Tue, 12 Jul 2022
 11:35:56 +0000
Message-ID: <addb6d9f-5d04-0280-a0b4-79edd888faeb@oracle.com>
Date: Tue, 12 Jul 2022 12:35:49 +0100
Subject: Re: [PATCH v6 09/10] i386/pc: relocate 4g start to 1T where applicable
Content-Language: en-US
From: Joao Martins <joao.m.martins@oracle.com>
To: Igor Mammedov <imammedo@redhat.com>
Cc: qemu-devel@nongnu.org, Eduardo Habkost <eduardo@habkost.net>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Alex Williamson <alex.williamson@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Ani Sinha <ani@anisinha.ca>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>
References: <20220701161014.3850-1-joao.m.martins@oracle.com>
 <20220701161014.3850-10-joao.m.martins@oracle.com>
 <20220711145627.2c318ba6@redhat.com>
 <5179013f-a2b6-b5a4-a509-42657dbde25a@oracle.com>
 <65ea8b7f-37cb-55dc-3306-fd32880aa0fb@oracle.com>
 <a731592c-4e42-ea23-6fe3-550b8a07af11@oracle.com>
 <20220712110615.09c3e303@redhat.com>
 <2228436c-2271-ec27-96ee-67825ac1b13f@oracle.com>
In-Reply-To: <2228436c-2271-ec27-96ee-67825ac1b13f@oracle.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LNXP265CA0033.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:5c::21) To BLAPR10MB4835.namprd10.prod.outlook.com
 (2603:10b6:208:331::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d7e67abb-ca99-4555-aafa-08da63faaf75
X-MS-TrafficTypeDiagnostic: BN0PR10MB4920:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: l4dCeuOnms2g1QJoe0BNbnnFyEViflKeCfRNRj4QvniDQJnRQZ61dSghFinOrJVtyLuvbfsAhg5rdbkNiRwZNmNz6HUAnKGZ2yqKEinY06e4dqcCyX8QCQeDJ5ldRDWC+9HHLdLOwGosePTyCgWyAIdL62RmGo3QZpvUOCWvtCU6sYrAKnnADPLFfap1FjGGPHYODv4PMwK4r15XuRyfEJAhZzGjoLz9ST4bHDhgDiEsYPtPlWphAVXXHa3KSgOF96qgLgLKpZCmYYUeEsR85PcbbCsLAOMXZitp/5J61L0tZNWMDZPhpl8bD8rKM9GdAsNERMmUGf+Q+hzkk4IX3kpRH6XEsHqeyL3m3P1QKS0gMCP9Eq3v1fvf0xP0J0AsNzUA16HqZQmAH9YqulURA3slOk4UJtO8WLNLQJ43cPRt/S3YuSL4bipd2+90vghmqesLAAShu9FYpwt7ZkoF/+TCjEp38r9GNUzA73aPoEkhp6B3pfGfidBxVdZgy2annkzE8oR+35HBvVgExpTeA3w3Os9LBIwCmrqiZUW8QobQ+aiMknDwui4EQddo2xU48widHhxSjNt59wqbmYVLG/wrMe9sj2SPZK5tOzwQfbvjDsIglN8fYTVExjFhPrmoqKdkVm7V1ajOyOhgorQ1PPick8cmjvoZv5MI5GyuEqWpwZlzR+VsQxM9jaoaraiMyi4cBCpM4UIx3r4qpCwskpozcJ1jn8iHn5QucAC6AxYKxjadaq/qjwGyfuUasxCU+Gchvu1T5Md+NMnOBfsIwy5mDq+dYRJfZlLd/oJpKGDz06G/3TzgOXzsUkEP8Pl/aKeQAdEai/pAQNlEXmmch4Df6Zo4zZCtbCDGdhqfCqn8fnTq6t+srRV9XVEDfNfq
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BLAPR10MB4835.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(396003)(136003)(39860400002)(346002)(366004)(376002)(36756003)(31686004)(2616005)(38100700002)(86362001)(186003)(83380400001)(31696002)(6512007)(26005)(8676002)(7416002)(54906003)(6666004)(2906002)(478600001)(6916009)(316002)(41300700001)(6506007)(966005)(53546011)(6486002)(4326008)(8936002)(66556008)(66946007)(66476007)(5660300002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?clFuTThUYXIwYkxzOWlXYUNhZFl0YWc1MlNpYmhnSVVsQ1FTOWc3NGhRZVEr?=
 =?utf-8?B?YjA5d2RRTkZKZlNwaXdBckJMa0IyVlBLQjVDSk1iQjk3RlZIdXVqYWJxblo1?=
 =?utf-8?B?ZGdPWXRKM2VCU2swT2p0ZTM4blYzY0Q4L3hHV3hoT1QxaGZPMUxiTThwa3Zi?=
 =?utf-8?B?TVNzR0pCTlFkdDZKNjJodU1FZGVneHJkbWUyeU8wdUc0WXcvOWVEZC9mbHA3?=
 =?utf-8?B?MldQbGJOTmRmRnpVa0tmYmkydHBUcXBGWVFoRHJWOVRvK0pGU2lKV0xCZG1X?=
 =?utf-8?B?NE43R1V0RDFtMjZucE5DVURaWHQ4OGdnck5TWGsxNUlVdSsycGUrajUzUEt0?=
 =?utf-8?B?VGZBeVpNMXBaUkgwZmYzWmtsR1dBUlFLNDVndSs4aGhwT0RtTG9xS2ZUZEFs?=
 =?utf-8?B?OUZoTXN1UlNHL0JaRHZQV1pnNEV4TmQzbk5kRCtlN2FtU2U1dG44MXdUa2xz?=
 =?utf-8?B?SVdpUWVKZzhZbFY0elc4TUVxQnZhcHVtZHBqQnBLdW42R3JQTko3L1AyVlho?=
 =?utf-8?B?RGF3Z1pZcnpHTkFubGxLMy8yTk5nK3VDakdTVHVlc040Q01IWVpYMkVxYVZx?=
 =?utf-8?B?Tnh6bHQ3MmlWSWRGbDMzNUw1emlIR29qbjBUcjdaazBFdE5JRThpVit2TnV5?=
 =?utf-8?B?czZJc1FUd2kvZVJ1cTh6NkJHQU9qQmloam5tRzJFRFJ2QWFmR1NWcUdxU2lh?=
 =?utf-8?B?NGN6OHhnZDlHUk9FQWpWS3psV2puSWxnaHpSd1ozVjBZTThWL1NBYjJWeUZ5?=
 =?utf-8?B?dVhsYTdhelo1RmRyNldHc3hLU0RMa1FEZUtBcWF5aHF1UnN1N2Vrenc3QW9o?=
 =?utf-8?B?dTJDQjBNQ2UzcEhuZ3ZnOUNFSzBoU1lkd2hHZHRVYThJdEd2cldBUCtzRllm?=
 =?utf-8?B?WXpLWGRiczgvZmNzZlZuNDVHUUhBczFEakhGcDA0UFkxcU9lRzdLV09xWkxV?=
 =?utf-8?B?TFlTRnVadTY0ZVY4Y2VqNkhJNlNidzhoTXRLbUN3TU1oN1Y5K0svNWdNSXNV?=
 =?utf-8?B?THFFb0JOVFJENGQwazJQQ0luVVJJdkNIL3kzMzJ2eDIxd1FhcWFoWldscmNv?=
 =?utf-8?B?S3daRlFmWjFPaUlqNS9Ha1Q5YlhrbzV6WjhGc290T2NCczlTWmFXMGZTcHFG?=
 =?utf-8?B?SkNnRnl6SERTeGRYTmVPQklKNURUYXdDdmd2dFJadCs4dkhCb1ZMRUl0LzBL?=
 =?utf-8?B?N08reGFvdWZjNGhOUGdJK3kvOHJxNVVsS1IxY0w0aVdGQjgxcEtIM1QveEpR?=
 =?utf-8?B?YklUYm40emFUaFR4RkVadXd3WXFJY2JIWDFzT3N3QTUyRk5WcnNXNHVOSzJR?=
 =?utf-8?B?UHhzRFhHQmgyQjhzMS9QcGRSU1ljbE1oL2ZkV0phV0gvZDh4Vkw3dDVEdXpE?=
 =?utf-8?B?RHovZUZOWUx6VGpILzFNZUlkelljcmxtVHJ2TWo5d09FYVZUa0JoOXJpNVh4?=
 =?utf-8?B?OTc4bzlqbys3bDlFRnRlM09lQWZHR28ycTlHSnU2RHR5Vk1DN3RrNUIwd0l2?=
 =?utf-8?B?Yk85YlNoSjdLTlhGZVRVSXNOcWxkS3dkSURuV0dZOEFVcWlDQ3daZytiNkZr?=
 =?utf-8?B?dmsrVlNwOEZac3dLY21QTWpLV0NaTFRRaHRrcmZZMkdTZEdkOUg4Z3lHZWxK?=
 =?utf-8?B?akd1RThueTQ3Rzc4TFZJU20rdzhKMTBjYS9oMElIQ2RmWnVTUVIrdUNsbHJm?=
 =?utf-8?B?N3F2SUd5Q2xRelJ3dmh0M1JicHNPd09qQjlYUkV2ak92WGMzLzJKTUdZR1do?=
 =?utf-8?B?SVJ4T3NSYVZMdUhIS09Ia2pmb1djMVJQeGhvM3FacmdUb0hyaVBzT0dFcXlq?=
 =?utf-8?B?bkdHYnkwY3hGSXRvOUMzbWYwOTJZdWdpSXd2Mmt5UkhqYW8ybVhWaG9OTE5D?=
 =?utf-8?B?eDJUVE5mZFFGaG5zUHM3LzR2M21pb3J0aWtiUE5qQlNqOTR5VUJQTVJqZTZY?=
 =?utf-8?B?NWlUN1J0dFlYTU1OQ25rNVVYL0lQYjE0MWNid0ZkdlppQ21OMFFqdHlDczVY?=
 =?utf-8?B?NWxlYWdWQ2ZHWEV0Y21OMEpkVWYycU9PNGhybzRvMVJyOGdVNGxRVldUR3pw?=
 =?utf-8?B?K3BseUY3MXp4Z1BtQUhtSHNIVnRIWE1uL2EwU0J6STRISUxvODhpSHg0NHlJ?=
 =?utf-8?B?ZVRRQmVROC9vYlgxQlgwLy9UZDAxZEpQdU5VNzBHNmp6NVgyOXVBTHI0Syta?=
 =?utf-8?B?TVE9PQ==?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d7e67abb-ca99-4555-aafa-08da63faaf75
X-MS-Exchange-CrossTenant-AuthSource: BLAPR10MB4835.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jul 2022 11:35:56.4606 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4GY2t9Qz1Lob4rQw4QAX2Rh0VtBM0RSTEM1XrTgR+o3454jPNKicTbMDs0gk5AkGebC7jC5y0PFzGCvoXGLdT8Uqelwqe0y2+Q/wx4gthYk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN0PR10MB4920
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.517, 18.0.883
 definitions=2022-07-12_08:2022-07-12,
 2022-07-12 signatures=0
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0
 mlxlogscore=999 mlxscore=0
 suspectscore=0 phishscore=0 spamscore=0 malwarescore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2206140000
 definitions=main-2207120043
X-Proofpoint-GUID: tjo1fv9NCW-PERaFaIq6c0DA0ste7KcL
X-Proofpoint-ORIG-GUID: tjo1fv9NCW-PERaFaIq6c0DA0ste7KcL
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

On 7/12/22 11:01, Joao Martins wrote:
> On 7/12/22 10:06, Igor Mammedov wrote:
>> On Mon, 11 Jul 2022 21:03:28 +0100
>> Joao Martins <joao.m.martins@oracle.com> wrote:
>>> On 7/11/22 16:31, Joao Martins wrote:
>>>> On 7/11/22 15:52, Joao Martins wrote:  
>>>>> On 7/11/22 13:56, Igor Mammedov wrote:  
>>>>>> On Fri,  1 Jul 2022 17:10:13 +0100
>>>>>> Joao Martins <joao.m.martins@oracle.com> wrote:
>>>  void pc_memory_init(PCMachineState *pcms,
>>>                      MemoryRegion *system_memory,
>>>                      MemoryRegion *rom_memory,
>>> @@ -897,6 +953,7 @@ void pc_memory_init(PCMachineState *pcms,
>>>      PCMachineClass *pcmc = PC_MACHINE_GET_CLASS(pcms);
>>>      X86MachineState *x86ms = X86_MACHINE(pcms);
>>>      hwaddr cxl_base, cxl_resv_end = 0;
>>> +    X86CPU *cpu = X86_CPU(first_cpu);
>>>
>>>      assert(machine->ram_size == x86ms->below_4g_mem_size +
>>>                                  x86ms->above_4g_mem_size);
>>> @@ -904,6 +961,29 @@ void pc_memory_init(PCMachineState *pcms,
>>>      linux_boot = (machine->kernel_filename != NULL);
>>>
>>>      /*
>>> +     * The HyperTransport range close to the 1T boundary is unique to AMD
>>> +     * hosts with IOMMUs enabled. Restrict the ram-above-4g relocation
>>> +     * to above 1T to AMD vCPUs only.
>>> +     */
>>> +    if (IS_AMD_CPU(&cpu->env) && x86ms->above_4g_mem_size) {
>>
>> it has the same issue as pc_max_used_gpa(), i.e.
>>   x86ms->above_4g_mem_size != 0
>> doesn't mean that there isn't any memory above 4Gb nor that there aren't
>> any MMIO (sgx/cxl/pci64hole), that's was the reason we were are considering
>> max_used_gpa
>> I'd prefer to keep pc_max_used_gpa(),
>> idea but make it work for above cases and be more generic (i.e. not to be
>> tied to AMD only) since 'pc_max_used_gpa() < physbits'
>> applies to equally
>> to AMD and Intel (and to trip it, one just have to configure small enough
>> physbits or large enough hotpluggable RAM/CXL/PCI64HOLE)
>>
> I can reproduce the issue you're thinking with basic memory hotplug. 

I was mislead by a bug that only existed in v6. Which I fixed now.
So any bug possibility with hotplug, SGX and CXL, or pcihole64 is simply covered with:

	pc_pci_hole64_start() + pci_hole64_size;

which is what pc_max_used_gpa() does. This works fine /without/ above_4g_mem_size != 0
check even without above_4g_mem_size (e.g. mem=2G,maxmem=1024G).

And as a reminder: SGX, hotplug, CXL and pci-hole64 *require* memory above 4G[*]. And part
of the point of us moving to pc_pci_hole64_start() was to make these all work in a generic
way.

So I've removed the x86ms->above_4g_mem_size != 0 check. Current patch diff pasted at the end.

[*] As reiterated here:

> Let me see
> what I can come up in pc_max_used_gpa() to cover this one. I'll respond here with a proposal.
> 

I was over-complicating things here. It turns out nothing else is needed aside in the
context of 1T hole.

This is because I only need to check address space limits (as consequence of
pc_set_amd_above_4g_mem_start()) when pc_max_used_gpa() surprasses HT_START. Which
requires fundamentally a value closer to 1T well beyond what 32-bit can cover. So on
32-bit guests this is never true and thus it things don't change behaviour from current
default for these guests. And thus I won't break qtests and things fail correctly in the
right places.

Now I should say that pc_max_used_gpa() is still not returning the accurate 32-bit guest
max used GPA value, given that I return pci hole64 end (essentially). Do you still that
addressed out of correctness even if it doesn't matter much for the 64-bit 1T case?

If so, our only option seems to be to check phys_bits <= 32 and return max CPU
boundary there? Unless you have something enterily different in mind?

> I would really love to have v7.1.0 with this issue fixed but I am not very
> confident it is going to make it :(
> 
> Meanwhile, let me know if you have thoughts on this one:
> 
> https://lore.kernel.org/qemu-devel/1b2fa957-74f6-b5a9-3fc1-65c5d68300ce@oracle.com/
> 
> I am going to assume that if no comments on the above that I'll keep things as is.
> 
> And also, whether I can retain your ack with Bernhard's suggestion here:
> 
> https://lore.kernel.org/qemu-devel/0eefb382-4ac6-4335-ca61-035babb95a88@oracle.com/
> 


diff --git a/hw/i386/pc.c b/hw/i386/pc.c
index 668e15c8f2a6..45433cc53b5b 100644
--- a/hw/i386/pc.c
+++ b/hw/i386/pc.c
@@ -881,6 +881,67 @@ static uint64_t pc_get_cxl_range_end(PCMachineState *pcms)
     return start;
 }

+static hwaddr pc_max_used_gpa(PCMachineState *pcms, uint64_t pci_hole64_size)
+{
+    return pc_pci_hole64_start() + pci_hole64_size;
+}
+
+/*
+ * AMD systems with an IOMMU have an additional hole close to the
+ * 1Tb, which are special GPAs that cannot be DMA mapped. Depending
+ * on kernel version, VFIO may or may not let you DMA map those ranges.
+ * Starting Linux v5.4 we validate it, and can't create guests on AMD machines
+ * with certain memory sizes. It's also wrong to use those IOVA ranges
+ * in detriment of leading to IOMMU INVALID_DEVICE_REQUEST or worse.
+ * The ranges reserved for Hyper-Transport are:
+ *
+ * FD_0000_0000h - FF_FFFF_FFFFh
+ *
+ * The ranges represent the following:
+ *
+ * Base Address   Top Address  Use
+ *
+ * FD_0000_0000h FD_F7FF_FFFFh Reserved interrupt address space
+ * FD_F800_0000h FD_F8FF_FFFFh Interrupt/EOI IntCtl
+ * FD_F900_0000h FD_F90F_FFFFh Legacy PIC IACK
+ * FD_F910_0000h FD_F91F_FFFFh System Management
+ * FD_F920_0000h FD_FAFF_FFFFh Reserved Page Tables
+ * FD_FB00_0000h FD_FBFF_FFFFh Address Translation
+ * FD_FC00_0000h FD_FDFF_FFFFh I/O Space
+ * FD_FE00_0000h FD_FFFF_FFFFh Configuration
+ * FE_0000_0000h FE_1FFF_FFFFh Extended Configuration/Device Messages
+ * FE_2000_0000h FF_FFFF_FFFFh Reserved
+ *
+ * See AMD IOMMU spec, section 2.1.2 "IOMMU Logical Topology",
+ * Table 3: Special Address Controls (GPA) for more information.
+ */
+#define AMD_HT_START         0xfd00000000UL
+#define AMD_HT_END           0xffffffffffUL
+#define AMD_ABOVE_1TB_START  (AMD_HT_END + 1)
+#define AMD_HT_SIZE          (AMD_ABOVE_1TB_START - AMD_HT_START)
+
+static void pc_set_amd_above_4g_mem_start(PCMachineState *pcms,
+                                          uint64_t pci_hole64_size)
+{
+    X86MachineState *x86ms = X86_MACHINE(pcms);
+    hwaddr maxphysaddr, maxusedaddr;
+
+    /*
+     * Relocating ram-above-4G requires more than TCG_PHYS_ADDR_BITS (40).
+     * So make sure phys-bits is required to be appropriately sized in order
+     * to proceed with the above-4g-region relocation and thus boot.
+     */
+    x86ms->above_4g_mem_start = AMD_ABOVE_1TB_START;
+    maxusedaddr = pc_max_used_gpa(pcms, pci_hole64_size);
+    maxphysaddr = ((hwaddr)1 << X86_CPU(first_cpu)->phys_bits) - 1;
+    if (maxphysaddr < maxusedaddr) {
+        error_report("Address space limit 0x%"PRIx64" < 0x%"PRIx64
+                     " phys-bits too low (%u) cannot avoid AMD HT range",
+                     maxphysaddr, maxusedaddr, X86_CPU(first_cpu)->phys_bits);
+        exit(EXIT_FAILURE);
+    }
+}
+
 void pc_memory_init(PCMachineState *pcms,
                     MemoryRegion *system_memory,
                     MemoryRegion *rom_memory,
@@ -896,6 +957,7 @@ void pc_memory_init(PCMachineState *pcms,
     PCMachineClass *pcmc = PC_MACHINE_GET_CLASS(pcms);
     X86MachineState *x86ms = X86_MACHINE(pcms);
     hwaddr cxl_base, cxl_resv_end = 0;
+    X86CPU *cpu = X86_CPU(first_cpu);

     assert(machine->ram_size == x86ms->below_4g_mem_size +
                                 x86ms->above_4g_mem_size);
@@ -903,6 +965,27 @@ void pc_memory_init(PCMachineState *pcms,
     linux_boot = (machine->kernel_filename != NULL);

     /*
+     * The HyperTransport range close to the 1T boundary is unique to AMD
+     * hosts with IOMMUs enabled. Restrict the ram-above-4g relocation
+     * to above 1T to AMD vCPUs only.
+     */
+    if (IS_AMD_CPU(&cpu->env)) {
+        /* Bail out if max possible address does not cross HT range */
+        if (pc_max_used_gpa(pcms, pci_hole64_size) >= AMD_HT_START) {
+            pc_set_amd_above_4g_mem_start(pcms, pci_hole64_size);
+        }
+
+        /*
+         * Advertise the HT region if address space covers the reserved
+         * region or if we relocate.
+         */
+        if (x86ms->above_4g_mem_start == AMD_ABOVE_1TB_START ||
+            cpu->phys_bits >= 40) {
+            e820_add_entry(AMD_HT_START, AMD_HT_SIZE, E820_RESERVED);
+        }
+    }
+
+    /*
      * Split single memory region and use aliases to address portions of it,
      * done for backwards compatibility with older qemus.
      */

