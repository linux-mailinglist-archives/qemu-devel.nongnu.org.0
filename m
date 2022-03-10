Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DD4F4D50B9
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Mar 2022 18:38:35 +0100 (CET)
Received: from localhost ([::1]:59810 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nSMkE-00023J-Nx
	for lists+qemu-devel@lfdr.de; Thu, 10 Mar 2022 12:38:34 -0500
Received: from eggs.gnu.org ([209.51.188.92]:34832)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <steven.sistare@oracle.com>)
 id 1nSMbF-000707-IP
 for qemu-devel@nongnu.org; Thu, 10 Mar 2022 12:29:17 -0500
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32]:18996)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <steven.sistare@oracle.com>)
 id 1nSMbB-0005DH-UK
 for qemu-devel@nongnu.org; Thu, 10 Mar 2022 12:29:16 -0500
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 22AFd3sN010868; 
 Thu, 10 Mar 2022 17:29:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=message-id : date :
 subject : to : cc : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=corp-2021-07-09;
 bh=EJ/qFnrDqL/xBeQTys6S4eW1X/aeqMHOmQsabTlwd6A=;
 b=Apw5OtsgzGV95r1wSNiCUzb+J58+zwyIq4if/lSp04iq4Wf772IIomZEGrYyfCoH8ReC
 yWk5JX32fLyRmUUBltQMrWvcHGVz5W/UNXebayihBCmRHIhtvGEGsskNwvVI0iOaT7FR
 CIOk6VulajlExLAIJXShXfmI6YvSA2ffM2/ZxXN7Kvt6B50iQ7aHOoVvrjkrGI623UJJ
 C33ixV579P0OvXiHW442ZCghr2UnWNe6h2QUL03bPYB/Jpko8gEpgboKffnLCTcLl6gm
 XLNC9xBoLbn07pELldp+4ZZVGTl+bjBLDMuvmR3oSyhlsHPTF5nuuGsHmWneI7QFi5r8 5g== 
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
 by mx0b-00069f02.pphosted.com with ESMTP id 3ekxn2p6tk-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 10 Mar 2022 17:29:03 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
 by aserp3020.oracle.com (8.16.1.2/8.16.1.2) with SMTP id 22AHBHA0043141;
 Thu, 10 Mar 2022 17:29:00 GMT
Received: from nam10-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam10lp2104.outbound.protection.outlook.com [104.47.58.104])
 by aserp3020.oracle.com with ESMTP id 3ekyp3q6rk-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 10 Mar 2022 17:29:00 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ht420ApDDlnTmwQh+ZrVLjKTF7j9csG1Vw/K82UC7yO8Sjehc2Ry9gCrwGzuwDoJ48lxj8hvjb6GlovsJc6lR9yU+DOs61tacsHLDDNVi6uxCHP+Np36TonU14rY4Bcole8AN7+NK/yhBieQhGFhBv2YZS5FJjcU0z3etA0xf8nSqin/gtS/7Hg3zrFQpgg0GhbUQ4tfwdXrX0zZlwn+rxsrRqrfQqQoODT5KyXDukPtljvuWJ9o/Ul0oHXU71wrLHxtUP6OTUriTWtVj52rm+iWx1D3n0BB/78DLH1ZzlPEsYgm9lijH5iRKdodH8GJMUoBqkYPMiivqeGikTjUSQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EJ/qFnrDqL/xBeQTys6S4eW1X/aeqMHOmQsabTlwd6A=;
 b=hBBnWnE7jl7AvGsNZzEvGLK+me6m8/QHTOLIVhLFlzfpSYLp8bz4+HRGWtqwYx1Y7IHqo1Z7XP7aCakf64LCThs48GZtmcn6Qjrnd7RdQsF1xKGb/Syio8BD1fN2f0SgBNdtGde7B9+dBWNBYgwvLQr0gENbTOw7dRxdtpEseQrfLu64gXakGNsVOqzpvLgL4bEQYkTQ6LGEJRJK5mQGzN8cNQ3i7kdHHOl3ujMBT4Bh54PBiLCXNSOShXAsPMM4ybTqhI1r1ycerVeu3husrBktBbK58YYPeAXuZPaNnkvgq4cgkcVIVvxSjIijcG3UFozDzuZaKydLt/DMpB712w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EJ/qFnrDqL/xBeQTys6S4eW1X/aeqMHOmQsabTlwd6A=;
 b=J+364cTHsoJmjJ4JX6aeplJZcDBv+HaaYuyqiUQqpddWpEeRXTVaN2MINGVM4qqRwvvlEXYRY9dFfz9+At2GPGisv2iCqzX/mVYCcN/fFNcf9ihHvO1viwKqleKyKpyk0UeY/zTB3WdxqWxayQ9NxeaKbeY4myYtXXu7vGTgwZc=
Received: from BYAPR10MB3240.namprd10.prod.outlook.com (2603:10b6:a03:155::17)
 by SN6PR10MB3455.namprd10.prod.outlook.com (2603:10b6:805:cd::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5038.29; Thu, 10 Mar
 2022 17:28:58 +0000
Received: from BYAPR10MB3240.namprd10.prod.outlook.com
 ([fe80::6005:8b9:1b00:b0da]) by BYAPR10MB3240.namprd10.prod.outlook.com
 ([fe80::6005:8b9:1b00:b0da%6]) with mapi id 15.20.5038.026; Thu, 10 Mar 2022
 17:28:57 +0000
Message-ID: <d62b16fc-f01a-586d-9fcf-d44abc100cb2@oracle.com>
Date: Thu, 10 Mar 2022 12:28:54 -0500
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.2
Subject: Re: [PATCH V7 10/29] machine: memfd-alloc option
Content-Language: en-US
To: Igor Mammedov <imammedo@redhat.com>
References: <1640199934-455149-1-git-send-email-steven.sistare@oracle.com>
 <1640199934-455149-11-git-send-email-steven.sistare@oracle.com>
 <20220303121534-mutt-send-email-mst@kernel.org>
 <20220304114124.6fe97646@redhat.com>
 <c42748ca-3e06-d57e-dcfb-a2a97006d2fc@oracle.com>
 <20220307184045-mutt-send-email-mst@kernel.org>
 <20220308082048.1783adbc@redhat.com>
 <3e0803ef-392a-b863-3474-3f76dcd27ae1@oracle.com>
 <20220310170025.33b9f6f0@redhat.com>
From: Steven Sistare <steven.sistare@oracle.com>
Organization: Oracle Corporation
In-Reply-To: <20220310170025.33b9f6f0@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BY5PR20CA0015.namprd20.prod.outlook.com
 (2603:10b6:a03:1f4::28) To BYAPR10MB3240.namprd10.prod.outlook.com
 (2603:10b6:a03:155::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 5e5663f8-e9bf-4984-b419-08da02bb7529
X-MS-TrafficTypeDiagnostic: SN6PR10MB3455:EE_
X-Microsoft-Antispam-PRVS: <SN6PR10MB34556A4ED4090EBC9B4548BEF90B9@SN6PR10MB3455.namprd10.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 1hTiOMoPOs0usdm8abYEUgfhG5X7jlkSKaIS57LjvRATbCM7V7mGgvpF4P7KjqUqCZeR+t564mM3sO9qlZUbXjDTJ03BMguXGMlt8YltMH8ISGO8Jwe+uvkc32Hfe9bGHW9kNZyMg0j7ktTnHKHetV+jMX6mRBh8Ohj65/H0CEDFxL9dLU7NMKyCNVW8RS+KDIJR4M7SQqweiT3e6fBROOWMpz5+RMVHiRZ3HTFbBQJyEBWHbqoppphfASQB22HjZ1SnoRemtmqLrfQlTEEZJMctp5m0NN6ZVspPi7jZ9fWOTqpeVitocWeZkMVUbt6jSb9MnnLHxea/EyOowDgP1XzzMzZGdrnKLi34jEcpwXqi+/tnRBiuOPQJSqcEfUYJVDqNJYFXqd8mgVJBToSpirI6HceCQH6Lbxi/IrSRouqYAm9YeJqY3c6M2NO9Osh0OjzXDFpX/DwZrkE2gts0GfX8+xppZbl/lx47sR9NJOVsAA9v8w3Od1MnQ5wIwDjiWg0UP029IjY5bchxwWkI5irK9lI+UGCSO03ehq0Px2wP65vam7+cW9pb+u4w22pWmTZkZewwhAj4VaS96QM4Tj6VpPcu3Xi2gZvOqbkbmo+ZEgRFvVEX6f8pcdWNHyKxj4QN2uTIyzFJZeasiSH2SkVIDeUvJ6EWi/w0Tkks9+32Hc3nyLztUBpzR/llhP9mXcflD3ayJvBHS2/hpGU8EyS8DzdZQ4tgwi9Q0Q6DXkc=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR10MB3240.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(66946007)(66476007)(66556008)(8936002)(30864003)(8676002)(6916009)(4326008)(7416002)(54906003)(316002)(2906002)(6486002)(53546011)(36756003)(508600001)(6506007)(6512007)(6666004)(31686004)(5660300002)(44832011)(36916002)(2616005)(26005)(186003)(83380400001)(31696002)(38100700002)(86362001)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?V2U0N1cvVmsyVXpWVjZjMVMvKy9ERmpZZ0lKU2FwSVVUVi90RVVrTEZLMVpB?=
 =?utf-8?B?MDcwWkhFdHFWYkhROHdXYWVEVTdwcTVjSXBOQkhPdVdrZGNPcHQ0NkdxZ1FQ?=
 =?utf-8?B?MnlaMmJJR1pWcGxqK1RpN0sxT0NQTEdqa1dzL1RKOE54RFdJVkdmRFhiTkZr?=
 =?utf-8?B?eXBSZTl5cmlza0xyTzhRUXBxMEVzSHZLbks1QUl2dGpsWDRQeWp4NEdNaFBG?=
 =?utf-8?B?dm0wU04vWFZjdU1jN2g3cmJ5WWFZMDFwS2ZOdzRROHV6RzUxeThuK1J5VjFD?=
 =?utf-8?B?M3k2a0NVS2VGbVdLaVN2TDJUaTIxY1VqdGxVVGN1WkFGQk9Db1FzbDVzZU1H?=
 =?utf-8?B?THJCZ0JNK3hoQXJaUXFCNHhSMFRWa1hKVk5yZ1NiMG1VNWd5LzJGUnBzWkRF?=
 =?utf-8?B?eVVubGYwUEJ3WXpyalNPVkVwajM2K3hTd2c2aWllVWRHYWNXUjcyUHpsYVhQ?=
 =?utf-8?B?Tzk0eWZldU9rSlFXbDJqUkhpL3FEa0hCRm1Gem9OZUxTbzZPeTYzMjk4VUt3?=
 =?utf-8?B?N1Y2Q2lwUTdPTS92RXZzcjFzNWpRWTM1U1VoRi9TZ2M0RWVJaTlHRHIwU2FY?=
 =?utf-8?B?YUVlNGk5c0F6WUIzOGxUbDVZd2h3WVI4cEJLRmIwMG03dWhrZ3cvRFVOclZx?=
 =?utf-8?B?TkVQSndBN2t0QzZHOEk5TER5cmFxQnhHbVBkeVlPOGkvTi92R21IZXhVNytF?=
 =?utf-8?B?eEZqZzJIdFl2SWg3VUtGV1gyVG45UUxUL2JGZDZacktpNytxVE44eXZFcENu?=
 =?utf-8?B?TXJocEZUTmNSeDYxYzJHRGd0V0pWK2t0UmNmTUhLQTZmdFRZS2dRdVdTa0Zl?=
 =?utf-8?B?K0NuVnlSTkhiVUhINzB4cTIyUVFSTW5GbVQ0ZGV0NTFZN0FwcHVmVDgydEor?=
 =?utf-8?B?c1RxRDQ2bG9UV29CWXc1VGhMQkpOWm5HRzVmM1lpV0haaEtMUUxWSitjcTRR?=
 =?utf-8?B?R0NKamNKa0p0WEJneHlTSFpNM01RR2ZoWktTZW5ESk5qeVBRZTRBRHR5eTc5?=
 =?utf-8?B?WkZ2QkdwZ2I3cnpISHBrb29rQ0ZDWjdmYmJzTk9hOWJ5emZMODdNWUZuWUpt?=
 =?utf-8?B?M1lzNjRsR1Z0Z2FjV0VYeTlGb1E1bWE4OGNFSE55WGxIbXoyNlJnT2VIbUkx?=
 =?utf-8?B?SS84elVocUpCZ1JvWlBsdk16dTI3NFdqRUFpNFB6RnJ0VzEzcllQckNoOEpT?=
 =?utf-8?B?eSt3NXdvMzg2MStUMEdxaE1sRTNSQytBMXFEdU1wUU9Ud2ExVk5aMXlhN1dH?=
 =?utf-8?B?NjVjZmkySWJtRkpvRWkxby9SYTQ4QVpSbXpyREIzM0thVDlrQlk1d1E4NnBF?=
 =?utf-8?B?WEFUSkdveFhJckJsWkNLelNiVzZ0V3llWW1MSmdMRnNyNVNUZHZVL1ljOEt4?=
 =?utf-8?B?azZkbktDaU8raVY3MVdIWFFqSHJTb2FGcE0waEVxeXJJakZuaDB0bFJmOVVq?=
 =?utf-8?B?SWJpMkF0KzJFelVza2FZTGRGeFY3ZjhzVldsaWorMGNPUE0yWTRKN2hmMnZ4?=
 =?utf-8?B?U0lJaHVwcm9ycmRnVUtxWGxOMjBLTmcwWFdEWXN1SmhqazJUUll5VkM0VTdm?=
 =?utf-8?B?Y211dnNlV0c3Wlh0VktlZDRjWnNNQzMybEZKaVc4bU9MWnBqczJVL05CMkg3?=
 =?utf-8?B?elUyVmlHeHVSeXVLUW10eHJyS0tlVEJiNmF4UDZxSmNnRm1DU2xsTWZHb3ox?=
 =?utf-8?B?aU1BU3lGc2lqVmxGMmcwZTBTK2JSd2hodk1iNnBvb3Q0NjEwU1RjK0hXWmdP?=
 =?utf-8?B?c0o3QjErV285dTJLWHRVcE5rcTVpQXNDSE5MRHlpSExGbkZYMFgyWFdDbnlM?=
 =?utf-8?B?QXZ0YWRhNEl2dXVIVHdzS2pXcVBxNkxkc0NHVVZoSXBlOEliRjRPUXd4MFdj?=
 =?utf-8?B?OGgrMmVQNGNuTnJLN0Z6UXRkeml2bVVqK3Z0d3psNTJMb1lBV1hVWkw1S3JB?=
 =?utf-8?B?MkxRRWVERlU0RHhhWnZVYnpCcWtQdVBkOVdKaXBIZmZmUEdjdDdncXhNMzhm?=
 =?utf-8?B?RWFacG1pdm45K2Y3MGFXZWhWRkEyYWh1R3BuUTFKS2J3Wk9IYVpyYVVibm9h?=
 =?utf-8?B?SFQySzBMaHB6ZjhSeFVRcEZTVDF0RC9XVmxNTVZ3ejFFbG5LUGlLS3l0VW00?=
 =?utf-8?B?cEJaL1ZORDZ0ZWt0dGhHTjFDeUt0OEZic2RsNDVORHRjc1VjNEZxM2kwamR6?=
 =?utf-8?B?Wm5HU2NZa0l0NTNUZnJ1YUJQdlhTOUNmbStxWVlIbGtObHovcXVZQ3crSGdU?=
 =?utf-8?B?QytrbjhqaVJISnNUbzJnQmMrYnVRPT0=?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5e5663f8-e9bf-4984-b419-08da02bb7529
X-MS-Exchange-CrossTenant-AuthSource: BYAPR10MB3240.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Mar 2022 17:28:57.8216 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZOd8JNMFMO0o7wPwo3WaULvBLLIczkjXYrHB0a8zBp0YWA2Hzox21pXu5zjYElvNPEnWfoJsWJ8Eh8vfYPgfDrEX7vgNHvz0VACH6aAY+V0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR10MB3455
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10282
 signatures=692556
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 phishscore=0 mlxscore=0
 bulkscore=0 mlxlogscore=999 spamscore=0 adultscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2202240000
 definitions=main-2203100092
X-Proofpoint-ORIG-GUID: LahwNcxxOUN28KEyiJ5ea1bG5sckX11l
X-Proofpoint-GUID: LahwNcxxOUN28KEyiJ5ea1bG5sckX11l
Received-SPF: pass client-ip=205.220.177.32;
 envelope-from=steven.sistare@oracle.com; helo=mx0b-00069f02.pphosted.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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
Cc: Jason Zeng <jason.zeng@linux.intel.com>,
 Juan Quintela <quintela@redhat.com>, Eric Blake <eblake@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, David Hildenbrand <david@redhat.com>,
 qemu-devel@nongnu.org, "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Zheng Chuan <zhengchuan@huawei.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
 "Daniel P. Berrange" <berrange@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Markus Armbruster <armbru@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/10/2022 11:00 AM, Igor Mammedov wrote:
> On Thu, 10 Mar 2022 10:36:08 -0500
> Steven Sistare <steven.sistare@oracle.com> wrote:
> 
>> On 3/8/2022 2:20 AM, Igor Mammedov wrote:
>>> On Tue, 8 Mar 2022 01:50:11 -0500
>>> "Michael S. Tsirkin" <mst@redhat.com> wrote:
>>>   
>>>> On Mon, Mar 07, 2022 at 09:41:44AM -0500, Steven Sistare wrote:  
>>>>> On 3/4/2022 5:41 AM, Igor Mammedov wrote:    
>>>>>> On Thu, 3 Mar 2022 12:21:15 -0500
>>>>>> "Michael S. Tsirkin" <mst@redhat.com> wrote:
>>>>>>     
>>>>>>> On Wed, Dec 22, 2021 at 11:05:15AM -0800, Steve Sistare wrote:    
>>>>>>>> Allocate anonymous memory using memfd_create if the memfd-alloc machine
>>>>>>>> option is set.
>>>>>>>>
>>>>>>>> Signed-off-by: Steve Sistare <steven.sistare@oracle.com>
>>>>>>>> ---
>>>>>>>>  hw/core/machine.c   | 19 +++++++++++++++++++
>>>>>>>>  include/hw/boards.h |  1 +
>>>>>>>>  qemu-options.hx     |  6 ++++++
>>>>>>>>  softmmu/physmem.c   | 47 ++++++++++++++++++++++++++++++++++++++---------
>>>>>>>>  softmmu/vl.c        |  1 +
>>>>>>>>  trace-events        |  1 +
>>>>>>>>  util/qemu-config.c  |  4 ++++
>>>>>>>>  7 files changed, 70 insertions(+), 9 deletions(-)
>>>>>>>>
>>>>>>>> diff --git a/hw/core/machine.c b/hw/core/machine.c
>>>>>>>> index 53a99ab..7739d88 100644
>>>>>>>> --- a/hw/core/machine.c
>>>>>>>> +++ b/hw/core/machine.c
>>>>>>>> @@ -392,6 +392,20 @@ static void machine_set_mem_merge(Object *obj, bool value, Error **errp)
>>>>>>>>      ms->mem_merge = value;
>>>>>>>>  }
>>>>>>>>  
>>>>>>>> +static bool machine_get_memfd_alloc(Object *obj, Error **errp)
>>>>>>>> +{
>>>>>>>> +    MachineState *ms = MACHINE(obj);
>>>>>>>> +
>>>>>>>> +    return ms->memfd_alloc;
>>>>>>>> +}
>>>>>>>> +
>>>>>>>> +static void machine_set_memfd_alloc(Object *obj, bool value, Error **errp)
>>>>>>>> +{
>>>>>>>> +    MachineState *ms = MACHINE(obj);
>>>>>>>> +
>>>>>>>> +    ms->memfd_alloc = value;
>>>>>>>> +}
>>>>>>>> +
>>>>>>>>  static bool machine_get_usb(Object *obj, Error **errp)
>>>>>>>>  {
>>>>>>>>      MachineState *ms = MACHINE(obj);
>>>>>>>> @@ -829,6 +843,11 @@ static void machine_class_init(ObjectClass *oc, void *data)
>>>>>>>>      object_class_property_set_description(oc, "mem-merge",
>>>>>>>>          "Enable/disable memory merge support");
>>>>>>>>  
>>>>>>>> +    object_class_property_add_bool(oc, "memfd-alloc",
>>>>>>>> +        machine_get_memfd_alloc, machine_set_memfd_alloc);
>>>>>>>> +    object_class_property_set_description(oc, "memfd-alloc",
>>>>>>>> +        "Enable/disable allocating anonymous memory using memfd_create");
>>>>>>>> +
>>>>>>>>      object_class_property_add_bool(oc, "usb",
>>>>>>>>          machine_get_usb, machine_set_usb);
>>>>>>>>      object_class_property_set_description(oc, "usb",
>>>>>>>> diff --git a/include/hw/boards.h b/include/hw/boards.h
>>>>>>>> index 9c1c190..a57d7a0 100644
>>>>>>>> --- a/include/hw/boards.h
>>>>>>>> +++ b/include/hw/boards.h
>>>>>>>> @@ -327,6 +327,7 @@ struct MachineState {
>>>>>>>>      char *dt_compatible;
>>>>>>>>      bool dump_guest_core;
>>>>>>>>      bool mem_merge;
>>>>>>>> +    bool memfd_alloc;
>>>>>>>>      bool usb;
>>>>>>>>      bool usb_disabled;
>>>>>>>>      char *firmware;
>>>>>>>> diff --git a/qemu-options.hx b/qemu-options.hx
>>>>>>>> index 7d47510..33c8173 100644
>>>>>>>> --- a/qemu-options.hx
>>>>>>>> +++ b/qemu-options.hx
>>>>>>>> @@ -30,6 +30,7 @@ DEF("machine", HAS_ARG, QEMU_OPTION_machine, \
>>>>>>>>      "                vmport=on|off|auto controls emulation of vmport (default: auto)\n"
>>>>>>>>      "                dump-guest-core=on|off include guest memory in a core dump (default=on)\n"
>>>>>>>>      "                mem-merge=on|off controls memory merge support (default: on)\n"
>>>>>>>> +    "                memfd-alloc=on|off controls allocating anonymous guest RAM using memfd_create (default: off)\n"      
>>>>>>>
>>>>>>> Question: are there any disadvantages associated with using
>>>>>>> memfd_create? I guess we are using up an fd, but that seems minor.  Any
>>>>>>> reason not to set to on by default? maybe with a fallback option to
>>>>>>> disable that?    
>>>>>
>>>>> Old Linux host kernels, circa 4.1, do not support huge pages for shared memory.
>>>>> Also, the tunable to enable huge pages for share memory is different than for
>>>>> anon memory, so there could be performance loss if it is not set correctly.
>>>>>     /sys/kernel/mm/transparent_hugepage/enabled
>>>>>     vs
>>>>>     /sys/kernel/mm/transparent_hugepage/shmem_enabled    
>>>>
>>>> I guess we can test this when launching the VM, and select
>>>> a good default.
>>>>  
>>>>> It might make sense to use memfd_create by default for the secondary segments.    
>>>>
>>>> Well there's also KSM now you mention it.  
>>>
>>> then another quest, is there downside to always using memfd_create
>>> without any knobs being involved?  
>>
>> Lower performance if small pages are used (but Michael suggests qemu could 
>> automatically check the tunable and use anon memory instead)
>>
>> KSM (same page merging) is not supported for shared memory, so ram_block_add ->
>> memory_try_enable_merging will not enable it.
>>
>> In both cases, I expect the degradation would be negligible if memfd_create is
>> only automatically applied to the secondary segments, which are typically small.
>> But, someone's secondary segment could be larger, and it is time consuming to
>> prove innocence when someone claims your change caused their performance regression.
> 
> Adding David as memory subsystem maintainer, maybe he will a better
> idea instead of introducing global knob that would also magically alter 
> backends' behavior despite of its their configured settings.

OK, in ram_block_add I can set the RAM_SHARED flag based on the memory-backend object's
shared flag.  I already set the latter in create_default_memdev when memfd-alloc is
specified.  With that change, we do not override configured settings.  Users can no longer
use memory-backend-ram for CPR, and must change all memory-backend-ram to memory-backend-memfd
in the command-line arguments.  That is fine.

With that change, are you OK with this patch?

- Steve

>>>>>>> I am concerned that it's actually a kind of memory backend, this flag
>>>>>>> seems to instead be closer to the deprecated mem-prealloc. E.g.
>>>>>>> it does not work with a mem path, does it?    
>>>>>
>>>>> One can still define a memory backend with mempath to create the main ram segment,
>>>>> though it must be some form of shared to work with live update.  Indeed, I would 
>>>>> expect most users to specify an explicit memory backend for it.  The secondary
>>>>> segments would still use memfd_create.
>>>>>     
>>>>>> (mem path and mem-prealloc are transparently aliased to used memory backend
>>>>>> if I recall it right.)
>>>>>>
>>>>>> Steve,
>>>>>>
>>>>>> For allocating guest RAM, we switched exclusively to using memory-backends
>>>>>> including initial guest RAM (-m size option) and we have hostmem-memfd
>>>>>> that uses memfd_create() and I'd rather avoid adding random knobs to machine
>>>>>> for tweaking how RAM should be allocated, we have memory backends for this,
>>>>>> so this patch begs the question: why hostmem-memfd is not sufficient?
>>>>>> (patch description is rather lacking on rationale behind the patch)    
>>>>>
>>>>> There is currently no way to specify memory backends for the secondary memory
>>>>> segments (vram, roms, etc), and IMO it would be onerous to specify a backend for
>>>>> each of them.  On x86_64, these include pc.bios, vga.vram, pc.rom, vga.rom,
>>>>> /rom@etc/acpi/tables, /rom@etc/table-loader, /rom@etc/acpi/rsdp.
> 
> MemoryRegion is not the only place where state is stored.
> If we only talk about fwcfg entries state, it can also reference
> plain malloced memory allocated elsewhere or make a deep copy internally.
> Similarly devices also may store state outside of RamBlock framework.
> 
> How are you dealing with that?
> 
>>>>>
>>>>> - Steve
>>>>>     
>>>>>>>>      "                aes-key-wrap=on|off controls support for AES key wrapping (default=on)\n"
>>>>>>>>      "                dea-key-wrap=on|off controls support for DEA key wrapping (default=on)\n"
>>>>>>>>      "                suppress-vmdesc=on|off disables self-describing migration (default=off)\n"
>>>>>>>> @@ -76,6 +77,11 @@ SRST
>>>>>>>>          supported by the host, de-duplicates identical memory pages
>>>>>>>>          among VMs instances (enabled by default).
>>>>>>>>  
>>>>>>>> +    ``memfd-alloc=on|off``
>>>>>>>> +        Enables or disables allocation of anonymous guest RAM using
>>>>>>>> +        memfd_create.  Any associated memory-backend objects are created with
>>>>>>>> +        share=on.  The memfd-alloc default is off.
>>>>>>>> +
>>>>>>>>      ``aes-key-wrap=on|off``
>>>>>>>>          Enables or disables AES key wrapping support on s390-ccw hosts.
>>>>>>>>          This feature controls whether AES wrapping keys will be created
>>>>>>>> diff --git a/softmmu/physmem.c b/softmmu/physmem.c
>>>>>>>> index 3524c04..95e2b49 100644
>>>>>>>> --- a/softmmu/physmem.c
>>>>>>>> +++ b/softmmu/physmem.c
>>>>>>>> @@ -41,6 +41,7 @@
>>>>>>>>  #include "qemu/config-file.h"
>>>>>>>>  #include "qemu/error-report.h"
>>>>>>>>  #include "qemu/qemu-print.h"
>>>>>>>> +#include "qemu/memfd.h"
>>>>>>>>  #include "exec/memory.h"
>>>>>>>>  #include "exec/ioport.h"
>>>>>>>>  #include "sysemu/dma.h"
>>>>>>>> @@ -1964,35 +1965,63 @@ static void ram_block_add(RAMBlock *new_block, Error **errp)
>>>>>>>>      const bool shared = qemu_ram_is_shared(new_block);
>>>>>>>>      RAMBlock *block;
>>>>>>>>      RAMBlock *last_block = NULL;
>>>>>>>> +    struct MemoryRegion *mr = new_block->mr;
>>>>>>>>      ram_addr_t old_ram_size, new_ram_size;
>>>>>>>>      Error *err = NULL;
>>>>>>>> +    const char *name;
>>>>>>>> +    void *addr = 0;
>>>>>>>> +    size_t maxlen;
>>>>>>>> +    MachineState *ms = MACHINE(qdev_get_machine());
>>>>>>>>  
>>>>>>>>      old_ram_size = last_ram_page();
>>>>>>>>  
>>>>>>>>      qemu_mutex_lock_ramlist();
>>>>>>>> -    new_block->offset = find_ram_offset(new_block->max_length);
>>>>>>>> +    maxlen = new_block->max_length;
>>>>>>>> +    new_block->offset = find_ram_offset(maxlen);
>>>>>>>>  
>>>>>>>>      if (!new_block->host) {
>>>>>>>>          if (xen_enabled()) {
>>>>>>>> -            xen_ram_alloc(new_block->offset, new_block->max_length,
>>>>>>>> -                          new_block->mr, &err);
>>>>>>>> +            xen_ram_alloc(new_block->offset, maxlen, new_block->mr, &err);
>>>>>>>>              if (err) {
>>>>>>>>                  error_propagate(errp, err);
>>>>>>>>                  qemu_mutex_unlock_ramlist();
>>>>>>>>                  return;
>>>>>>>>              }
>>>>>>>>          } else {
>>>>>>>> -            new_block->host = qemu_anon_ram_alloc(new_block->max_length,
>>>>>>>> -                                                  &new_block->mr->align,
>>>>>>>> -                                                  shared, noreserve);
>>>>>>>> -            if (!new_block->host) {
>>>>>>>> +            name = memory_region_name(mr);
>>>>>>>> +            if (ms->memfd_alloc) {
>>>>>>>> +                Object *parent = &mr->parent_obj;
>>>>>>>> +                int mfd = -1;          /* placeholder until next patch */
>>>>>>>> +                mr->align = QEMU_VMALLOC_ALIGN;
>>>>>>>> +                if (mfd < 0) {
>>>>>>>> +                    mfd = qemu_memfd_create(name, maxlen + mr->align,
>>>>>>>> +                                            0, 0, 0, &err);
>>>>>>>> +                    if (mfd < 0) {
>>>>>>>> +                        return;
>>>>>>>> +                    }
>>>>>>>> +                }
>>>>>>>> +                qemu_set_cloexec(mfd);
>>>>>>>> +                /* The memory backend already set its desired flags. */
>>>>>>>> +                if (!object_dynamic_cast(parent, TYPE_MEMORY_BACKEND)) {
>>>>>>>> +                    new_block->flags |= RAM_SHARED;
>>>>>>>> +                }
>>>>>>>> +                addr = file_ram_alloc(new_block, maxlen, mfd,
>>>>>>>> +                                      false, false, 0, errp);
>>>>>>>> +                trace_anon_memfd_alloc(name, maxlen, addr, mfd);
>>>>>>>> +            } else {
>>>>>>>> +                addr = qemu_anon_ram_alloc(maxlen, &mr->align,
>>>>>>>> +                                           shared, noreserve);
>>>>>>>> +            }
>>>>>>>> +
>>>>>>>> +            if (!addr) {
>>>>>>>>                  error_setg_errno(errp, errno,
>>>>>>>>                                   "cannot set up guest memory '%s'",
>>>>>>>> -                                 memory_region_name(new_block->mr));
>>>>>>>> +                                 name);
>>>>>>>>                  qemu_mutex_unlock_ramlist();
>>>>>>>>                  return;
>>>>>>>>              }
>>>>>>>> -            memory_try_enable_merging(new_block->host, new_block->max_length);
>>>>>>>> +            memory_try_enable_merging(addr, maxlen);
>>>>>>>> +            new_block->host = addr;
>>>>>>>>          }
>>>>>>>>      }
>>>>>>>>  
>>>>>>>> diff --git a/softmmu/vl.c b/softmmu/vl.c
>>>>>>>> index 620a1f1..ab3648a 100644
>>>>>>>> --- a/softmmu/vl.c
>>>>>>>> +++ b/softmmu/vl.c
>>>>>>>> @@ -2440,6 +2440,7 @@ static void create_default_memdev(MachineState *ms, const char *path)
>>>>>>>>          object_property_set_str(obj, "mem-path", path, &error_fatal);
>>>>>>>>      }
>>>>>>>>      object_property_set_int(obj, "size", ms->ram_size, &error_fatal);
>>>>>>>> +    object_property_set_bool(obj, "share", ms->memfd_alloc, &error_fatal);
>>>>>>>>      object_property_add_child(object_get_objects_root(), mc->default_ram_id,
>>>>>>>>                                obj);
>>>>>>>>      /* Ensure backend's memory region name is equal to mc->default_ram_id */
>>>>>>>> diff --git a/trace-events b/trace-events
>>>>>>>> index a637a61..770a9ac 100644
>>>>>>>> --- a/trace-events
>>>>>>>> +++ b/trace-events
>>>>>>>> @@ -45,6 +45,7 @@ ram_block_discard_range(const char *rbname, void *hva, size_t length, bool need_
>>>>>>>>  # accel/tcg/cputlb.c
>>>>>>>>  memory_notdirty_write_access(uint64_t vaddr, uint64_t ram_addr, unsigned size) "0x%" PRIx64 " ram_addr 0x%" PRIx64 " size %u"
>>>>>>>>  memory_notdirty_set_dirty(uint64_t vaddr) "0x%" PRIx64
>>>>>>>> +anon_memfd_alloc(const char *name, size_t size, void *ptr, int fd) "%s size %zu ptr %p fd %d"
>>>>>>>>  
>>>>>>>>  # gdbstub.c
>>>>>>>>  gdbstub_op_start(const char *device) "Starting gdbstub using device %s"
>>>>>>>> diff --git a/util/qemu-config.c b/util/qemu-config.c
>>>>>>>> index 436ab63..3606e5c 100644
>>>>>>>> --- a/util/qemu-config.c
>>>>>>>> +++ b/util/qemu-config.c
>>>>>>>> @@ -207,6 +207,10 @@ static QemuOptsList machine_opts = {
>>>>>>>>              .type = QEMU_OPT_BOOL,
>>>>>>>>              .help = "enable/disable memory merge support",
>>>>>>>>          },{
>>>>>>>> +            .name = "memfd-alloc",
>>>>>>>> +            .type = QEMU_OPT_BOOL,
>>>>>>>> +            .help = "enable/disable memfd_create for anonymous memory",
>>>>>>>> +        },{
>>>>>>>>              .name = "usb",
>>>>>>>>              .type = QEMU_OPT_BOOL,
>>>>>>>>              .help = "Set on/off to enable/disable usb",
>>>>>>>> -- 
>>>>>>>> 1.8.3.1      
>>>>>>>
>>>>>>>    
>>>>>>     
>>>>  
>>>   
>>
> 

