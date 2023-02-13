Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FA66694858
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Feb 2023 15:42:54 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pRa2T-000376-5P; Mon, 13 Feb 2023 09:42:41 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <darren.kenny@oracle.com>)
 id 1pRa2I-0002mS-H5
 for qemu-devel@nongnu.org; Mon, 13 Feb 2023 09:42:33 -0500
Received: from mx0a-00069f02.pphosted.com ([205.220.165.32])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <darren.kenny@oracle.com>)
 id 1pRa2E-0005jK-Sm
 for qemu-devel@nongnu.org; Mon, 13 Feb 2023 09:42:29 -0500
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 31DAV7QZ023732; Mon, 13 Feb 2023 14:42:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : in-reply-to : references : date : message-id : content-type :
 mime-version; s=corp-2022-7-12;
 bh=coIMZIkxHbYRw5UJg4QhI6BuGIEzuNURFl9EfQYhxWY=;
 b=YM/unuPrTenfQBr5y4OOEpg1LIbj4ZUR6Ina5iGGqhXmmP32lmgO7GJSm0s5rcQ2RZmW
 sSAwAbpQPPipwz7G43WvrDfTTkQqzySwV28JXjtpahq2JRby7YBJisr9ljzQB17VMt66
 42voyUBxeANpKjDfh8YSPBVVuppKMy0+lbzfperhMHHbzLBHV1Dl9XQzaWg80RIKGLaF
 QpoNbA2fifRonlKUOXW4RKbs5PkbH99eTJaMn+k7B9as7tghExm9X6EwPGM/fMi7Ivc/
 8DL+PNuxXDObO6YOy/dPknWZWJyCdL0lsVL6Hk31fyHmdzdNUiWjHqzg9KIkJeaJYS0T XQ== 
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com
 (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3np1m0tybw-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 13 Feb 2023 14:42:24 +0000
Received: from pps.filterd
 (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
 by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.17.1.5/8.17.1.5)
 with ESMTP id 31DDmg15028208; Mon, 13 Feb 2023 14:42:22 GMT
Received: from nam10-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam10lp2100.outbound.protection.outlook.com [104.47.58.100])
 by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id
 3np1f46jhx-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 13 Feb 2023 14:42:22 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hjK/MOAfsR2+o0ktaY257kMeSm7NOgfq0qqrh5rSRfmjYkrWHb9cDrLGzLIfJAPc9/UyvpM801/f6DwuQW7n20qP9mR5Ax2ve109lZiDFynJUn3Y16BqffTpBzqu2DqTQ0KdnXuPU1WIgesC2lttreOyHVwSRvmzm6Cwe2+NFOH7O1aBU6ZBtznri6vExjRsZMPLATVlAhRIp1r+y7jqTlGP8Li2t+hNvVbuu0DW96YJaBFArgw6E5ahHywBQkhlx0ifbsGrcJEjt+x6NGrpud7LyJ2y34gNwZ8gl0UM64eAv6bdvNeLGlNKs7IJBtCefBNV5trA/hNG/wAlmn639g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=coIMZIkxHbYRw5UJg4QhI6BuGIEzuNURFl9EfQYhxWY=;
 b=aK8mKjgKaL5/1/LWvUT25Ij34Ac54Vq8SSYg3lfS89tQayRxKwUChFGE4uyR1cYEPyd8zPCjTO2wP04x96Bl1suRorxa+j7r2YdAFA+XXu+T+7YyiVBhHdL4OekOIkcO9cYff5lTWxvMMux9Yn1uwDrXOPx6dglwuKJF0Pt22igcJ2YDihjrES7/FtI714SFeu5aVRQ74eJbhlGLnimQkCvdl/OJRXcFLXjRfVUR7DzFjBN35vhtG7NYXsZu7S8n4p10i5FplH1iJ5kInpctmHC/sonKDLVCnqWtfiYtkTAy9nt5xx6bHxbh2CAYrh2KRKKSN1fmYLQF2eDLA5gvnw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=coIMZIkxHbYRw5UJg4QhI6BuGIEzuNURFl9EfQYhxWY=;
 b=E8MloKUtWXBS8aW/v1z7zexJRfgqE2Z9cBdLlVlmn3zL3ld/GO/xigEQGG/gZ/zOsOVCWLA3H9Ks3rvXyczYlgOXDsDMrHafrFrASeqR3qpPRAapPVO2vKrui5yThTe/DowYigLT8Pl8Fav4lRxtACU8JAqyUNNxEwPVmpUyKSM=
Received: from BLAPR10MB5138.namprd10.prod.outlook.com (2603:10b6:208:322::8)
 by CH3PR10MB6860.namprd10.prod.outlook.com (2603:10b6:610:14d::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6111.10; Mon, 13 Feb
 2023 14:42:21 +0000
Received: from BLAPR10MB5138.namprd10.prod.outlook.com
 ([fe80::8a7d:60c:7965:98c3]) by BLAPR10MB5138.namprd10.prod.outlook.com
 ([fe80::8a7d:60c:7965:98c3%7]) with mapi id 15.20.6111.010; Mon, 13 Feb 2023
 14:42:21 +0000
From: Darren Kenny <darren.kenny@oracle.com>
To: Alexander Bulekov <alxndr@bu.edu>, qemu-devel@nongnu.org
Cc: Alexander Bulekov <alxndr@bu.edu>, Stefan Hajnoczi <stefanha@redhat.com>,
 Bandan Das <bsd@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Thomas Huth <thuth@redhat.com>, Qiuhao Li <Qiuhao.Li@outlook.com>,
 Laurent Vivier <lvivier@redhat.com>
Subject: Re: [PATCH 05/10] fuzz/virtio-scsi: remove fork-based fuzzer
In-Reply-To: <20230205042951.3570008-6-alxndr@bu.edu>
References: <20230205042951.3570008-1-alxndr@bu.edu>
 <20230205042951.3570008-6-alxndr@bu.edu>
Date: Mon, 13 Feb 2023 14:42:15 +0000
Message-ID: <m2ilg5r5iw.fsf@oracle.com>
Content-Type: text/plain
X-ClientProxiedBy: DB7PR03CA0086.eurprd03.prod.outlook.com
 (2603:10a6:10:72::27) To BLAPR10MB5138.namprd10.prod.outlook.com
 (2603:10b6:208:322::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BLAPR10MB5138:EE_|CH3PR10MB6860:EE_
X-MS-Office365-Filtering-Correlation-Id: 9d9d0236-d500-4166-6b2f-08db0dd082f9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: YawpKjDTUUyoHs50QTdl9zpe6EwH/X5MCyehj7hgXc6fv6VUmBAkL2G6GI+T/gXgVidih97coNYmtMFl8ALy5sit2I+cER3LrLcMpNqyn1xzR4mrRg+Z+N1HlhjMnM6cP4d+Jo+NoWqRRExn2lI1zG696BBt5jZ8agbcuwHkToBPZ2bUQ4lBnHkYuVMRjvdlJ3fnGpWuaO1yiYE7QJtA8QbCGJDzsuNn/3Cr/8fklNaO3ZJ0BwXGhZoHiIwhdXSO/kRu3sCKQwP0EtNdx3Nbin14667Kf7Xf1wvM3c1vJPb98/UZSJLhgTZ/iSFUd/ZMoqf6WKQpcJPnSp3W0QKjQUEp2aKx0AoqBBNMOz/0YoiMdJCaRHGhrzYpVgEHQZghclgqNbJaUZ8eTmvPvbdTEFlLsE9Vxr6qYY3ZHdWlHly/VK3wkwrITSjCHI84RCC8hgogI/eTSoR4vh8yLinQuUgIEDi+dUdzbU5UzXevDsQAMF7hLXHXuxcLqIG7YDmfdvAGaOocJHoGpe1c8vutipfTwlxgnko+AF/frJd0R6+g/ivrGEuxEzpT69IAhdXhgeLOuOE1BUUP17WJMxsw8Ebd/dvnEBHSaCnXHuB8Cl5toNXg9JDHJ4CEGoE5h3/XIxEK1JrBok84Scfxle2UQg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BLAPR10MB5138.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(39860400002)(346002)(396003)(136003)(366004)(376002)(451199018)(86362001)(36756003)(2906002)(5660300002)(4326008)(8936002)(41300700001)(44832011)(38100700002)(83380400001)(8676002)(6486002)(478600001)(26005)(186003)(6512007)(2616005)(316002)(54906003)(66946007)(66476007)(66556008)(6666004)(6506007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?/r8yjkYWtTynDXWS/zWYn8F0SaL4/mzIdXituvkHsVkl+v7mKrqQN9owEhzg?=
 =?us-ascii?Q?9yuSKjrW8aYx2VzTZyzE+suiXs7DEJueCvXewB3F4shUkczQKCAtxWCxMAZ6?=
 =?us-ascii?Q?WnTBk4b0s+obg0Y8RN+nr+uSqR2EgmABogF1VEEF5kRcIjPGC+b0YY2qowjt?=
 =?us-ascii?Q?UgQdmOQ9Qc/DhYlWols7cD0ABPswcqFnc8024xU1k2K8Mm3mtntn9zC3TXP1?=
 =?us-ascii?Q?/BB1w23n62NY9pYXJpxfyGAIbjlFTNCdVby5ixwYuqWAiB3Mm+GimOXR8W2v?=
 =?us-ascii?Q?ZOdmqsQ4ckOSfh3baTRuXiXJt/7BuV28E9FFv2jTrGeUObEQsPTvRNyU70Pu?=
 =?us-ascii?Q?1U98AiAiZwmVV3B+hjEiaigIqTb35WyU0LRPGHjtAC0UbgDzsDE3spB7NhRU?=
 =?us-ascii?Q?g6fb/nHtSOKYPjAi3P1ECUp4Dm1H3oIqPIQLn1CPE1dfBErGUVbaqAQL/mQ7?=
 =?us-ascii?Q?lBWL9a3aqf0cNqnYimBywrYDG80GAwudBuHPrui4vNNZ4soGCOLxwleAJ1KK?=
 =?us-ascii?Q?iJU6iIvcBamTsjOWWBuN6T/0/GnRoM6HZgRJoZExamn3D3yr/Jsr13rvIDln?=
 =?us-ascii?Q?4Njg4bF9cBbfzVhRnilcu2+QFcU1QjkMIuR3Idr6lH+F+h1D/BR6UXmPFWZv?=
 =?us-ascii?Q?pxLQ7PT50tHQSFjWPfnVXAn1N/lNJSIYS3a1StWMSMk9h5vWD8qZlE2u5FXw?=
 =?us-ascii?Q?Fq7eazvoggW+Tx9Ygk2IhSx/WWqVx66X6Sel3ayTVgYgvTenciiQIuz8vUYS?=
 =?us-ascii?Q?wlNZdBsiiVc+lW237LXyHk1vgf/42M7bqMrKLLNkAdDUIcynqnTb77MWffJe?=
 =?us-ascii?Q?e6w0tWDBNX8hhEa9iWIMh8NBLjAjIMIlT7RwknkQ1e7zQIZhbjbpnntVo2ZP?=
 =?us-ascii?Q?GCYhHILVfmPQFc1MNbER3gfqZuuz5UO3vnF1jSzhj8WO37tALMQyYAxUsXqf?=
 =?us-ascii?Q?+vKt1YNo2Yo/iL7WF/DP248yzx1VOFVg8pBV9beN77zom1KPwJiLe8Henw7n?=
 =?us-ascii?Q?NfuzIsiOTvSZ5zJDRpyQr5m323Dxs1BxY1T3QLupGHkd/AEwHicshPkHhLEC?=
 =?us-ascii?Q?e+wd64iQsK/cND0ZtXDnxn5uvoGfyyfIj9c/3S87KbTepCjQrMV44LJGSARb?=
 =?us-ascii?Q?EdpElLmmP9Z1bJm77U5lWioGXG/E/3tF909eE29UpzhpVwB3Uncm4VBmn3D5?=
 =?us-ascii?Q?prHVzvv87fawZSLwHpcXM8+m0a3zQ3X77G+QNoawQ3/mYlXbo09V3GhzduFR?=
 =?us-ascii?Q?G8Qpqb9wXuCwKgjf6iRZzhysB/jyS9HFWzO8uPBm6tMzGnn4AK5RISo5W/Z6?=
 =?us-ascii?Q?/sTs1Jl4Y0cnHmnjS6aRmex8e40Gb6h8nXzohNVn+2lhgHf7Ollk/RnnaLAK?=
 =?us-ascii?Q?7LOnnoRL82tZjUUlRpdDM832PsIKXvJIcitOUBsb43MTy43L24nL58Wk9Vw9?=
 =?us-ascii?Q?uMKtvPPgp18kd//vb89+JTGIras0GErJkUm/ZSXJxcfvpDVr90WdDFQlYKjG?=
 =?us-ascii?Q?K230ly0y+r+rUPigCnQMdzgCe3aaw70RLh7ciP16pSim07Z8hiv3r+fTpAtA?=
 =?us-ascii?Q?6ASL3MTR2I1CPp2aLQARWIoSpeBGBVPLfR/i3xJFa6JZJrnYIdbiowOXvIpn?=
 =?us-ascii?Q?hw=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: zxR7Ge5JKXlCmRqLKjs9u8AikC+xMludoeVgoScbq0WpTzAAi09YsxyNIkl0iYR0RBQh48gl8CHyYC34bBhNzUav23jVCCojmrqKDHpPfPYTvN+2GBro+SeOs5na0dtMbzXjug7yPNAiALSVU/kKh3E+Sn+XuRgUtDZHg2rwyWscJU5nNesYKQwDd9zve9koWeHtiTfSQ968kGdES4Sv2ALHtxKnkHucFbN036BDXOxpXisw2EPUbbD27lRs9NAgDGIj6UvP20uJsvB0ywHxuovlHAj0WOJvCicu9+7WjLJhdA7BeGWp7A1ayFkqIeyOrG9srVucTdLD0/9Fnb3MDR18lENOexQlq5qxZ9OQlobC7/cluaBnCivfxMihY0jrc2euyYR3sgriU/dkloNDA+NWiBh45Bj/jIQIlWlbLxfydxoDE4kDRXbvPDRkueo0x0XqjwKNsVgW0Sa2Atin2GHeeHxTx6KDQH75aGjeUOrp3MRiGNjnbej5POLLRwzqES41RnKTYQBTfyUSdH0PaueXARGi63AB31LuVjEvokh6aT1QCw5hiYED440zFK2B+8cMtt228vMsP+6Z3tj5pV8KuDpzZVQqr3M84nNqv7kYYyDavdCeTbDC94umUv+jKnmwaHJZokfQJPk+zchgxzvdYUesJ1S4hjvuLCgCAzDTxulnuM8kvP9Amzij/G+6HYDZFC9AtHZQsVsetrGEfFwbJaim/jcDfek7aMHoc+II0ONHcAqHURJhb2ysUe1bKpaTCoLp4+uzeLVvh0cE/dUU9hxXN6mhBkagM0v6ochn6bnuOZzm9Ob4qPxJKCfotM+15Mo57KInO/C4QCgDzQ==
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9d9d0236-d500-4166-6b2f-08db0dd082f9
X-MS-Exchange-CrossTenant-AuthSource: BLAPR10MB5138.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Feb 2023 14:42:21.0714 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QR2JS2XYGSgrd4cIbM1TsCJxqdZ1VQJa/go/ycQwHfHcxE0WBtaFhIlgZUyZlh8FXFuWXJ3675hVuF2Z89CVBA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR10MB6860
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.170.22
 definitions=2023-02-13_09,2023-02-13_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0
 bulkscore=0 adultscore=0
 mlxlogscore=999 phishscore=0 spamscore=0 mlxscore=0 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2212070000
 definitions=main-2302130132
X-Proofpoint-GUID: hZL8wPosYAm_6JsikxqHwkNTu59Xd5zk
X-Proofpoint-ORIG-GUID: hZL8wPosYAm_6JsikxqHwkNTu59Xd5zk
Received-SPF: pass client-ip=205.220.165.32;
 envelope-from=darren.kenny@oracle.com; helo=mx0a-00069f02.pphosted.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Saturday, 2023-02-04 at 23:29:46 -05, Alexander Bulekov wrote:
> Signed-off-by: Alexander Bulekov <alxndr@bu.edu>

Reviewed-by: Darren Kenny <darren.kenny@oracle.com>

Thanks,

Darren.

> ---
>  tests/qtest/fuzz/virtio_scsi_fuzz.c | 51 ++++-------------------------
>  1 file changed, 7 insertions(+), 44 deletions(-)
>
> diff --git a/tests/qtest/fuzz/virtio_scsi_fuzz.c b/tests/qtest/fuzz/virtio_scsi_fuzz.c
> index b3220ef6cb..8b26e951ae 100644
> --- a/tests/qtest/fuzz/virtio_scsi_fuzz.c
> +++ b/tests/qtest/fuzz/virtio_scsi_fuzz.c
> @@ -20,7 +20,6 @@
>  #include "standard-headers/linux/virtio_pci.h"
>  #include "standard-headers/linux/virtio_scsi.h"
>  #include "fuzz.h"
> -#include "fork_fuzz.h"
>  #include "qos_fuzz.h"
>  
>  #define PCI_SLOT                0x02
> @@ -132,48 +131,24 @@ static void virtio_scsi_fuzz(QTestState *s, QVirtioSCSIQueues* queues,
>      }
>  }
>  
> -static void virtio_scsi_fork_fuzz(QTestState *s,
> -        const unsigned char *Data, size_t Size)
> -{
> -    QVirtioSCSI *scsi = fuzz_qos_obj;
> -    static QVirtioSCSIQueues *queues;
> -    if (!queues) {
> -        queues = qvirtio_scsi_init(scsi->vdev, 0);
> -    }
> -    if (fork() == 0) {
> -        virtio_scsi_fuzz(s, queues, Data, Size);
> -        flush_events(s);
> -        _Exit(0);
> -    } else {
> -        flush_events(s);
> -        wait(NULL);
> -    }
> -}
> -
>  static void virtio_scsi_with_flag_fuzz(QTestState *s,
>          const unsigned char *Data, size_t Size)
>  {
>      QVirtioSCSI *scsi = fuzz_qos_obj;
>      static QVirtioSCSIQueues *queues;
>  
> -    if (fork() == 0) {
> -        if (Size >= sizeof(uint64_t)) {
> -            queues = qvirtio_scsi_init(scsi->vdev, *(uint64_t *)Data);
> -            virtio_scsi_fuzz(s, queues,
> -                             Data + sizeof(uint64_t), Size - sizeof(uint64_t));
> -            flush_events(s);
> -        }
> -        _Exit(0);
> -    } else {
> +    if (Size >= sizeof(uint64_t)) {
> +        queues = qvirtio_scsi_init(scsi->vdev, *(uint64_t *)Data);
> +        virtio_scsi_fuzz(s, queues,
> +                Data + sizeof(uint64_t), Size - sizeof(uint64_t));
>          flush_events(s);
> -        wait(NULL);
>      }
> +    fuzz_reboot(s);
>  }
>  
>  static void virtio_scsi_pre_fuzz(QTestState *s)
>  {
>      qos_init_path(s);
> -    counter_shm_init();
>  }
>  
>  static void *virtio_scsi_test_setup(GString *cmd_line, void *arg)
> @@ -189,22 +164,10 @@ static void *virtio_scsi_test_setup(GString *cmd_line, void *arg)
>  
>  static void register_virtio_scsi_fuzz_targets(void)
>  {
> -    fuzz_add_qos_target(&(FuzzTarget){
> -                .name = "virtio-scsi-fuzz",
> -                .description = "Fuzz the virtio-scsi virtual queues, forking "
> -                                "for each fuzz run",
> -                .pre_vm_init = &counter_shm_init,
> -                .pre_fuzz = &virtio_scsi_pre_fuzz,
> -                .fuzz = virtio_scsi_fork_fuzz,},
> -                "virtio-scsi",
> -                &(QOSGraphTestOptions){.before = virtio_scsi_test_setup}
> -                );
> -
>      fuzz_add_qos_target(&(FuzzTarget){
>                  .name = "virtio-scsi-flags-fuzz",
> -                .description = "Fuzz the virtio-scsi virtual queues, forking "
> -                "for each fuzz run (also fuzzes the virtio flags)",
> -                .pre_vm_init = &counter_shm_init,
> +                .description = "Fuzz the virtio-scsi virtual queues. "
> +                "Also fuzzes the virtio flags",
>                  .pre_fuzz = &virtio_scsi_pre_fuzz,
>                  .fuzz = virtio_scsi_with_flag_fuzz,},
>                  "virtio-scsi",
> -- 
> 2.39.0

