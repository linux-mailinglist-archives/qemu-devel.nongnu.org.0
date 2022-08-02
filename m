Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 18D8558750E
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Aug 2022 03:29:38 +0200 (CEST)
Received: from localhost ([::1]:49228 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oIgit-0007ts-7M
	for lists+qemu-devel@lfdr.de; Mon, 01 Aug 2022 21:29:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47616)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jag.raman@oracle.com>)
 id 1oIgdx-0002z2-Ax
 for qemu-devel@nongnu.org; Mon, 01 Aug 2022 21:24:23 -0400
Received: from mx0a-00069f02.pphosted.com ([205.220.165.32]:11050)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jag.raman@oracle.com>)
 id 1oIgdu-0006H2-VR
 for qemu-devel@nongnu.org; Mon, 01 Aug 2022 21:24:21 -0400
Received: from pps.filterd (m0246629.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 271NwrNw016286;
 Tue, 2 Aug 2022 01:24:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : content-transfer-encoding : content-type :
 mime-version; s=corp-2022-7-12;
 bh=ccIaczTI7lQ/Pvo55vaRt8GzuKP9Yxu3BanL72Ocwp0=;
 b=ewJTk90JEvs/CwjjIx7jB3RMXuDaoFx9SfYc7jbR4f7oTMlYQ83Lgorr3A9Z5oZYkXcy
 cwBjCMNe8pWDFH8UD3Z2XFYczVAHKAlIeR2Znx3o9mUr+9IiFJeDiX/5ezLJ71HMET7c
 GA1MHHGqLJcwd98picIRxDTMKoKbaOV3BmVM2niifCu69Io8hiKIZhRpv2ECMSJEH9Mp
 O2SlKvFzGHUTG9JLbd7zl37A2n/awSC32VGuaP52nQnCEUFR894DQL1Uc/bnhV+5ed1P
 HtuOqP/VOZLsQz9nxJxuamtxvQthTU92TamWYHACd4wSHj4cqvp9/A9bohSnjNYHLEAV fg== 
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com
 (phxpaimrmta02.appoci.oracle.com [147.154.114.232])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3hmvh9n7cj-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 02 Aug 2022 01:24:12 +0000
Received: from pps.filterd
 (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
 by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (8.17.1.5/8.17.1.5)
 with ESMTP id 271MbwYk007447; Tue, 2 Aug 2022 01:24:11 GMT
Received: from nam04-mw2-obe.outbound.protection.outlook.com
 (mail-mw2nam04lp2170.outbound.protection.outlook.com [104.47.73.170])
 by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id
 3hmu31kayd-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 02 Aug 2022 01:24:11 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FuKFOBfWjI20slyoGkVaKmnsWlBgQRvo346ts8dA9HXkkOAsIJbZVUPOr58dtUNNbLapzP0U+5RjMyWismIo7LIo+imkY2tG3ckJTlWn9y9+9sQz/4RN0QPZCqXACwUUng9Hn1+1XzpzA+V7WCCvuPSoYktwzleHE59FmQHz2kQc6Xdxuk7RJn+li8mEYD3F7a8XJWsDnE4wkvgMov8HmcBSVBTEDZf/eytzpaBXw1XTFHtOHGAcCGEui9OIAFcobvlfFTAak/A0Kn+JHsLmhPiThi3SJmMoyXXq9CtuiNJzac2EeZlgAycvpm/0zcffsQ5QUbT6xvHqbqZ1U+pyMA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ccIaczTI7lQ/Pvo55vaRt8GzuKP9Yxu3BanL72Ocwp0=;
 b=V6nHr1mDQsWyJYvXNyuD8GjgsyqBE2wsxdyEl4gTRTkRQutoP8hzi6OBDRD7cpUSyDsd5P6Xn0tTgAKl0dR2ItIuF5ceHxq01AkJd6flZmjAgFPo8LzBPRo9eAePEGXyQs9zz8Sb9PWF+pqAPVy4ISVn6Sq4teCiautvI8dKhv2XAWCfGD4HxQTkMLBbd32kFR9oyRknGX7oD74coZhQAS6CTFvCqh9JCULzXaBxdUeI3jEiJVO9dB7ZMlBSTjAbmiGi/G8TwI9ox8ED8EauJuS48YaeY7lY4LsvNPRCdFDNBGk8+fagVOQ2tzlap9PQAMHzHnjCjLe7jMDYu0wEag==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ccIaczTI7lQ/Pvo55vaRt8GzuKP9Yxu3BanL72Ocwp0=;
 b=b6pq7mNMejMLdybSAXdmoLfPDseuDkF0wC433Xz11TpgMmvsVI9C3F/wdcmfG4Uv8MBJt/71zgmbidEPoNM76gxuF2hBQKL9y80cSx23YPtE2xTcYt9g/Viw/Pkvk877HiPh5+iDmtxizYJbM8Pj0ywkifrqJxM8i99Lh4hnRrg=
Received: from MN2PR10MB4013.namprd10.prod.outlook.com (2603:10b6:208:185::25)
 by MN2PR10MB3487.namprd10.prod.outlook.com (2603:10b6:208:119::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5482.12; Tue, 2 Aug
 2022 01:24:10 +0000
Received: from MN2PR10MB4013.namprd10.prod.outlook.com
 ([fe80::b5fb:1a47:c4b:a83f]) by MN2PR10MB4013.namprd10.prod.outlook.com
 ([fe80::b5fb:1a47:c4b:a83f%6]) with mapi id 15.20.5482.016; Tue, 2 Aug 2022
 01:24:09 +0000
From: Jagannathan Raman <jag.raman@oracle.com>
To: qemu-devel@nongnu.org
Cc: stefanha@gmail.com, berrange@redhat.com
Subject: [PATCH 0/1] Update vfio-user module to the latest
Date: Mon,  1 Aug 2022 21:24:03 -0400
Message-Id: <cover.1659403195.git.jag.raman@oracle.com>
X-Mailer: git-send-email 2.20.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BYAPR06CA0002.namprd06.prod.outlook.com
 (2603:10b6:a03:d4::15) To MN2PR10MB4013.namprd10.prod.outlook.com
 (2603:10b6:208:185::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 2a514d69-c6a9-47e2-a541-08da7425b30c
X-MS-TrafficTypeDiagnostic: MN2PR10MB3487:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: TmDXdC0X2ppc4NAa5lRJyDkutJ1mxIsKKAJ1t7O64TNQQZUJVByHlh03qdTn7gaL/+ZNT0/Q1p/V/g+4LMt1A/t0ipYgBBQ4Zn7Du0K8m8J95fzR2IwAuUY78vzvQxc+HC1LXoi/3cHGo7HjjCo104Cm81jHrEm4+lkNjoyJZYyXokxJfYsMEu+e/nOLZOu31QZGmJSjwEjpV5LG+ut1sI/7VbLj+V+CvMIfFi8WFP88xXAdkyY+qYWfSPwaJ45pup5EtuM+znT4bN/vg/j4CAq0agrBaNwH+p4YPHlcN2DwxERQj9uAq+Dm5CYuPqNlb0+3/sFXeIPPLmDssC9Pr8Sak9qgoZul+Vp9B+2lJglTgztSxv5Gk1/0Ki2vLUHXRuw2RlahT6flK6dT8qi3o09+z8+WmTgoOCWiSA670Jq5FDM9r4E503n2sdAhRLf81wG4lKYG2XeEQ5QTe++TVvxr04zw/npmBB86/sIG/RkCp3MxZwJjhQx65aKJtPyxSj/XgKehoMWNFzAACQu6IofV3MbgBmX3vXNQSYMo3Qr7ibv6PvSQUAlq2O8Fzth9q2qYMaB5YEA74Slwl/8v4xGvpS95mMe2j4dXIB/wwyk5AkmzQlQzyxXgLELVjO+D+lfoM3GlXmvUsXhd+p94E0A45avhPrk1V03hq3lnVQTSoRIXuL4zbbZiV+4ng+5+i7U4Orqzwa85pvl5TOk0uZCEToWCag3J5icJwWWz5510ie1+NinzTifevgAbU0044F1ir7mXfZrD5SME9mX5UR6Uzc5/ExgIquYaf7+aAQNuiN5g9I70gONbF2q6TqeO
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR10MB4013.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(376002)(39860400002)(396003)(366004)(136003)(346002)(2906002)(38100700002)(38350700002)(6916009)(6666004)(6506007)(26005)(36756003)(558084003)(316002)(41300700001)(6512007)(15650500001)(86362001)(6486002)(478600001)(5660300002)(66556008)(8936002)(66476007)(66946007)(83380400001)(186003)(52116002)(4326008)(2616005)(8676002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?a71HqTGLqveMYazleCQw/WwPqnDxB/c7VTzhY1lxSeKABgZf0U8/vpBliqTH?=
 =?us-ascii?Q?s/p9VR6wXom9IzH5mfa9xd6hSLlnCmGPAVGbH1LxARq3dko+i0lBiwlWtvgP?=
 =?us-ascii?Q?OBKtLgJgDa4+6y3+lBi/AULcglrzVY14aoNXa/O9yV8a3plUQp70FmJXHuvD?=
 =?us-ascii?Q?bNYvUcoZRrquDoRm8eEzgMHvAZHkloP9xmWPVmn/IMADKZEpf6dMAef+J7SY?=
 =?us-ascii?Q?UiimH9dugGEOhApBW2+GrIyDFFu3eDOlED4jo+GtF76Jn1HtgnHefdRIfbIW?=
 =?us-ascii?Q?r2r1p91UnDQwfuES+CLbFyOtjGQuNCvFZ7DzW8VHdZmKrL7bR1DDTEMFOUCl?=
 =?us-ascii?Q?Flxmgt9NQLWnhV9Xdk/dbfkHbiHp7bc10NqdZysr4Vw+56Nzv2JPnwAoyZ8T?=
 =?us-ascii?Q?H3NAXP+R7uFZYhAQWvR2l4ph3O2q0F9nsdpUcKdtbL1Tfa1MRdWn1e5BGzIc?=
 =?us-ascii?Q?OfT2CXFbIDJZorM4xAl8td3WPt65aaBPTwicXPIusrARQILm0cnwmksLM3jg?=
 =?us-ascii?Q?4o8ZAvjpQU5QqPK7eh+eDdYa4iOYjUEPIwivljuZfcGxX4srw8kPX3VjSyZp?=
 =?us-ascii?Q?5RRNko2q1s43PHIhOku1dW2G6nwo/T4SmNFBW1SrLL6R18sXUWRrxjnnH0hY?=
 =?us-ascii?Q?W4v78Rp8xJXhs0YvfZIxmBsIYhPWj27F2mQBtnTSSq2cd9yf9bdG7GaU7WoQ?=
 =?us-ascii?Q?baHuRBUTKM2ZnPieBCeg53KsQsJsnm/XrlcBwVrxSHVS/+akD7uiEh8Wbt7G?=
 =?us-ascii?Q?nzpWxTlFF5GKR4gw72J0FHEuedlSUtHLJ5qum7SW62O5TCxBeVHYvd0rPpRe?=
 =?us-ascii?Q?+bLrQN+e0MBOwXawhDSOd3fOa093jMLbcxbuZAiy3KKKVrlnijTULT23EZC3?=
 =?us-ascii?Q?vHusG9644cvPJM4DCJMgoLMacfhPyhUd7I05hhA/NrqVRbLSzfTm/1vE6kf6?=
 =?us-ascii?Q?XSgaS0aQQdDFPZN/i/RMcBVfxdeWj3QZedRmIK3v61wo3hpIh2YEoBAfr8tl?=
 =?us-ascii?Q?W3rz/jAD44UdlxMUohiWLXs3ywGQ++XbvFFJQow107VU0FPoTg73aniaPZHZ?=
 =?us-ascii?Q?XcJ6S1JJepGxJiAsJj6YxRaTXowlSUtp1qW2Ra67/foMWwQS3gDzAi8V7b+n?=
 =?us-ascii?Q?aZ+nrLRtqdShKoPH8UWp6VI810nhNv4tzyxJ8TlkI0KvpQp8GVYYPV2CPrPT?=
 =?us-ascii?Q?b8PcNkirt89XdGy0NEl90cTFp+V87EXa+K2mpQxOBMZVkIJRWlmsvj/uVqsQ?=
 =?us-ascii?Q?KSK7jLB605nY7pULz0FB6PUaZ1zwjVF8N5CwwQ2ia64qRKGqzBeSak/piCJ/?=
 =?us-ascii?Q?aut+JgT9DALSJRj4kIBG4vpW/WNEMaudN3UVlNDL9L/CcyeJoFxjfblPRbUP?=
 =?us-ascii?Q?v3ihCkAQ/E88x8+vxhkHPzn4fLabOulkyqcjQQjbEKIwD64mxJed7ZJYv0WH?=
 =?us-ascii?Q?RNRLYrpEsG7MdCIfGOmQzdXilTsF/xRi4XTHN0rq+VTymiQqhY0oFC5tYfRa?=
 =?us-ascii?Q?cv+XN3fV1fvDOc374xHS697HO9K+U+jGp0QlNAVt/wIMjAbKgqmwFJE8EiTJ?=
 =?us-ascii?Q?S8nVO3smSjDHb/w8R9mdHViO/ojwNlaH7DaZyDu0?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2a514d69-c6a9-47e2-a541-08da7425b30c
X-MS-Exchange-CrossTenant-AuthSource: MN2PR10MB4013.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Aug 2022 01:24:09.5721 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zRzkdA83VJkziFTZrLar0YBihQbqtWwtnz5DIyty26YChceoUjuMd0BvQ0AJp1e7jaUWxDYHyGE68Cd68B+Vyw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR10MB3487
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-08-01_12,2022-08-01_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0
 mlxscore=0 suspectscore=0
 adultscore=0 bulkscore=0 malwarescore=0 mlxlogscore=820 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2206140000
 definitions=main-2208020004
X-Proofpoint-ORIG-GUID: 7nIm9fnznzkHHmzFDuaLiUt7B49j-zJ9
X-Proofpoint-GUID: 7nIm9fnznzkHHmzFDuaLiUt7B49j-zJ9
Received-SPF: pass client-ip=205.220.165.32; envelope-from=jag.raman@oracle.com;
 helo=mx0a-00069f02.pphosted.com
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

Hi,

This patch updates the libvfio-user submodule to the latest.

Passed 'make check' & GitLab CI.

Thank you!
--
Jag

Jagannathan Raman (1):
  vfio-user: update submodule to latest

 subprojects/libvfio-user | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

-- 
2.20.1


