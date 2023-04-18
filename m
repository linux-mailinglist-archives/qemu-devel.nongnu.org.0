Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EBC16E6A3F
	for <lists+qemu-devel@lfdr.de>; Tue, 18 Apr 2023 18:54:28 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pooZa-0004cL-8J; Tue, 18 Apr 2023 12:52:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.devolder@oracle.com>)
 id 1pooZT-0004b4-TE; Tue, 18 Apr 2023 12:52:51 -0400
Received: from mx0a-00069f02.pphosted.com ([205.220.165.32])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.devolder@oracle.com>)
 id 1pooZR-0007HD-Tn; Tue, 18 Apr 2023 12:52:47 -0400
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 33IExNWb015315; Tue, 18 Apr 2023 16:52:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references :
 content-transfer-encoding : content-type : mime-version;
 s=corp-2023-03-30; bh=veIQtdOaHS8IBCSNljGxdtwg9VF7GwcX6aEOCfPovl8=;
 b=cS3m0tCf4t3CEUNboMMUtVRP7hVXBHLZ6NUN0PvK+whuCxBcS4PouWND1kmvrKN4Gpm4
 ZHg//TYyWcA2wC4rBDjOsFzrZvNNLzFwO9JYeWMZj65lQbpl4H13p3hHiRtNkIJ7yKxK
 dtZxp6g59oTY2N+suRJQ15duPXK+a6gk4lKlcIvcbz7y3velhIFnED7o6j8exxR9k/xh
 oP2+MYlOrpLpQT8rJuy/vpvuAuJg8DgKSCkfk8TMH0sUKGMoBc2Gvab/UI2rIwEbiVvm
 J/6FF+vC1twavRYRhzCX8RqsqxJz0yenOBU9tqI9e5FzmQstKUrZo/LTvKKRBBGvPtff Sg== 
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com
 (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3pyjh1p944-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 18 Apr 2023 16:52:41 +0000
Received: from pps.filterd
 (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
 by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.17.1.19/8.17.1.19)
 with ESMTP id 33IFYMP3037932; Tue, 18 Apr 2023 16:52:40 GMT
Received: from nam12-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam12lp2176.outbound.protection.outlook.com [104.47.59.176])
 by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id
 3pyjc5snyg-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 18 Apr 2023 16:52:40 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DsDf8pGMAzfTfcB+IKB/sQX6nGGl3euHEkivk4AiSIg0rAZIr6eqlk/7DCef3977a3csbAfQ+wrdCPcQ9xScx/QirKmC4PsND6VY9xifEW3pIdxuQAHSeQlwYIPFiGuP1Q/FASOkzwPBLhT943jIVbdT9zQ1PZjt6AnW4AJCdj8FuB/f0JMlRRpICZtY9tF50dv3DUpBKJYXJ9cVv0CmRZDQnz7MTrQal+0lUwlPPkI0kDtTZwIjqXvE0T2Z8tqqIwFs2enbsUSeJ7twMwpCCuzr0WZ2+UL0qPwRHzZq3QGpWXH7AHTUOOM3sO+DKGHa+gJuqM125m0Oh4qid9NcDw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=veIQtdOaHS8IBCSNljGxdtwg9VF7GwcX6aEOCfPovl8=;
 b=MVTB4M1b4mJI0nn5ZN6Rpll7SqniINwoFiwmyuitIPXHLHQEMvK5n30/SE9rp6KHiVFS6ySdwRi/lvgOnJBs1OtqjcyuKmEl0/OQ6WtcaTW2SstFMcttCZQ88AaPqlxi/cYTrYIM2oxRV6f9BPq5LfvXJptuDHz+wAMQEfeKb7lkzHggnAcF5oomjrJnfhRV1zE+38X3KO0j10NGGu6DdDz2Hu0nKEmuY5ATlvQhPTaLLNPw6grxr0jnEsyvhNEE/wgYbC+pHpEyBwNMNjMQBOSr45b7FDwqphj+hn8IANtfudjNCe01n/dCIYfSCBloNNcetL6yHUEsN7Xzi1qCyw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=veIQtdOaHS8IBCSNljGxdtwg9VF7GwcX6aEOCfPovl8=;
 b=VLLlWf5c2KcVFQ77razFPTysEnUZVphNLtaHnvJLip3RFlk5n2ap2OSfYSQtFfuwhNXG9PwFexIT2tWEGK3odiQ2adoPgAWtYPCXofEOzHjmAG/H9cGI2GwWDBBZdjPy6WdIpj58UtDdzJsvZPLh1vQBjcKaCsHy8X4bFZ+ybdQ=
Received: from SJ0PR10MB4542.namprd10.prod.outlook.com (2603:10b6:a03:2da::19)
 by CY8PR10MB7314.namprd10.prod.outlook.com (2603:10b6:930:7b::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6298.45; Tue, 18 Apr
 2023 16:52:38 +0000
Received: from SJ0PR10MB4542.namprd10.prod.outlook.com
 ([fe80::ad42:b11a:662:9466]) by SJ0PR10MB4542.namprd10.prod.outlook.com
 ([fe80::ad42:b11a:662:9466%6]) with mapi id 15.20.6298.045; Tue, 18 Apr 2023
 16:52:38 +0000
From: Eric DeVolder <eric.devolder@oracle.com>
To: shannon.zhaosl@gmail.com, mst@redhat.com, imammedo@redhat.com,
 ani@anisinha.ca, peter.maydell@linaro.org, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org, marcel.apfelbaum@gmail.com, pbonzini@redhat.com,
 richard.henderson@linaro.org, eduardo@habkost.net
Cc: boris.ostrovsky@oracle.com, eric.devolder@oracle.com
Subject: [PATCH v2 2/4] hw/acpi: arm: bump MADT to revision 5
Date: Tue, 18 Apr 2023 12:52:17 -0400
Message-Id: <20230418165219.2036-3-eric.devolder@oracle.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20230418165219.2036-1-eric.devolder@oracle.com>
References: <20230418165219.2036-1-eric.devolder@oracle.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: DM6PR08CA0037.namprd08.prod.outlook.com
 (2603:10b6:5:1e0::11) To SJ0PR10MB4542.namprd10.prod.outlook.com
 (2603:10b6:a03:2da::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR10MB4542:EE_|CY8PR10MB7314:EE_
X-MS-Office365-Filtering-Correlation-Id: f70015df-6444-4a97-2b16-08db402d50f6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: DF+KNjIKZ71BoCsYz+z1OZ4ry1yE0RQQDp4l4OhpfzBcfYkMsbh1B19thsnBko6B4G55MmonLHrjxBYraI1gKk55MpjIz8BWndFh+Njt64DzXoeZZ6qvgcaGC1yPJv1pLw5Xr/+wP175d7kkzVuxCoq790eBObeRE7DJN+bN1r9l0sDZBZQiYP+qpmtsHWFoh66SW2jW4U9jUJ0IWw4WNPdCMaIVcVgx9/QgtZRPCpaCLd19DY9D05Mm8B4n4z7fHqa9weq/PRaHGlXEQxhd4DePeuylz03nhKAvMQiTC3tF6+G2JCKBkByQpUZwY7Ar5RmjN6dAe2eeB7dA/q6GTtWXCPbVHFH0x7JNyJkM9k575jJBQC+rLPfu9ZXp/484R6rfUBX8s74sWTjT0SgP2TCX1baeSUbKC9XFVrUr4DpvrTAiYXyG5xfA0yoNJ31gNVL7R4yTWXKCMGrfJeG3pcq8cMyOEdznbqR+z7sKFrC9rFvLM4E/hYzPirrRZtKdgASDIhTAG3ayLH93qMTBKpzO3cBrY7Bu/aEsPl19GE65XBbunO1CjiGW9fX0e1Z/DaTB17bKAk5Vube+k0kwDqeMQO/VJYeslJOQPu3WaVc=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ0PR10MB4542.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(346002)(39860400002)(376002)(366004)(396003)(136003)(451199021)(41300700001)(5660300002)(7416002)(8676002)(8936002)(2906002)(66476007)(66946007)(316002)(66556008)(4326008)(478600001)(6486002)(107886003)(1076003)(26005)(6506007)(6666004)(6512007)(186003)(2616005)(83380400001)(921005)(38100700002)(36756003)(86362001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?WYaBEmwYG8Rg7W8eQfyaF8GEdYCNAdhz0025p5BS/BU/JUEImWkJyg8derav?=
 =?us-ascii?Q?An9zrtMd9X1cRInMRVOCc6D+otbGrhDcDsmxiNO2Tfsjfo15wC762CQC/Zfc?=
 =?us-ascii?Q?Wx3LkqqwhlgHvFIFE1lSW2ClSAzPdzyHsDIlvXBO95hFUL7jnr2wpVfilSHx?=
 =?us-ascii?Q?plrKHCmd9VkHJQ+IOfz5bWi8Gmieg2jK7WjXLGXuXHW69ntgmZiTDtFCPaIz?=
 =?us-ascii?Q?/e7oEAUxPhS1wLyEgRvn/4qe9+S3Bh8ELjALK1695OTgLi+GQ/fDY7SnnBCh?=
 =?us-ascii?Q?53LBUMG363QaFHgyci/BX/FBMlJQOYkYiQfe6u6rROrDsBzUSU3c2jqiDWzI?=
 =?us-ascii?Q?yZTeRWWJ9jGxZjW1O3ICYtkvRQDuHfuD7D8eozvodSmJIOy75wntRq3tTAna?=
 =?us-ascii?Q?SjPVDVh8C+iZ5Xwv2AhqBa0jax3Edxe7TOiWQnO5cH/sU9RHO2Zqxvtq8zsK?=
 =?us-ascii?Q?CgUcvr2rZomaaquqqbJOax9OS+EPVwFcwJckyEbUelibdx9WcAfrR1wIsDO5?=
 =?us-ascii?Q?okgSaS8uXiNsIJQWi9NcVlNMWyScC+qcUjJfONLlvsWQL2nAppxnjtMs3MSJ?=
 =?us-ascii?Q?9T76o9I2wF+6J7TwqefR6O2cIUgi0PF3E5a2VeqAxmpHTt9fEKawITcvRDu9?=
 =?us-ascii?Q?boWmLX18+RT7cgQKUvP08OM1cXl7e4jOk+0cXFsyxnc8w9Bs8540LT+do0aA?=
 =?us-ascii?Q?kUKmN0KB7GjDDg/6BsUF4f80CxNPPvBzkmwtyF1QjD1BXp3gJQ9xvcU3GmpY?=
 =?us-ascii?Q?Klo6iD6mcz4XdzOsFMiw7kvN5IjVg3xrsUEodI0SooMbL7xGyzO/quPqLo09?=
 =?us-ascii?Q?uG4pFfwwgU3BWyl40BofDrep7X5bPOQj1dSn4BHvTk73/NRanBp2PO1D8Jlj?=
 =?us-ascii?Q?tnjWdc+4epwYc480xYE2g3x0ZOrn4zTcGOFzkQoVjfqSqDu5eVTSNdRojVsQ?=
 =?us-ascii?Q?qHMjqkenWQAD5i1UnoB7heqQvJXosxshVFpZI2oPSVJ+vpD3ygFpaGKrS1oS?=
 =?us-ascii?Q?4NzxVcPqCmFhyHBICCu+7C5gGMNlSEnnUZtulj/2Lfm0rq2e2yIu7gY2yZAx?=
 =?us-ascii?Q?KpQl8NZLisF+Ws3RjCrRGZlKZQNekovgEc6lHmEUfsHLc8nrztGqYdXT14Q6?=
 =?us-ascii?Q?SLdN5UEwdQgfJFU0NNwnJ47Jhemu3G5qq4UF+rj1STLsRI1edGCkqa/AEQPG?=
 =?us-ascii?Q?xhcFVSNGtIMv/BvGMQ6Zl3H5gBl9A9gYkE8O4ycQPyUM7HBOtejDmzYyYDUE?=
 =?us-ascii?Q?hvHWC2+KdtwC6g/C5jFlIayoY7A4/QZpuk/0jLiJyNtDu7/oieJU/5uQn/0F?=
 =?us-ascii?Q?+0POpnDvtUWN2kZOaIxvEtDUW6awl30KnF8GsILTqIPz+53WqPQlwtGCTMZK?=
 =?us-ascii?Q?D5Mwcpzwr/mQ5EVu73xP+MPQaeL6YA3Q1+J88vppGTa9cwZNMkCI8LINaWhc?=
 =?us-ascii?Q?mEWws2yJFFEgncCGehXZ1EhxWijLsOMxPEQQDPphiOu2E0gLtd9riyaOqb6T?=
 =?us-ascii?Q?fzkfeL0hp91cWcvyLThL1FDMiG8BVu0OpTwxAVtstzDt3OkKrD7PkIPJkiwA?=
 =?us-ascii?Q?A2C7wb15PnOelsBunY1Z2WEHXs1S0H6yLl1Ms9cyBY5MXXRIebESeRIHnSRz?=
 =?us-ascii?Q?4A=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: Wdkj22Z6i4BnPXzNEhbxEbUN3HONiuz2Y7z9uw5iAczE8KCS2M3dMdhHPvrE4MaCwj2OsTZ6SY+dR/lVOeA7wdtOS0w9ejTSMTABjF+lCATrsRe3/zr63OZYqxcXKrhRj+tdTTESvZ2cqVvNZs10MSoo/MtJcpWsp8hT2KIgPoQIVvXIEG9IpYgMHv29I9aal14k9FDUE5y7CrvNkVNb4yLviTkrePliXZ9d01DWxh21mwrutUEmUskkn7OakCQgAe2Eq5BlgwFBrkqpNr+2m4cxBXzUaOjCTU5bp7MNAOu6vGSjJVOcpFJg/uWhF4dKiFJtp1BZRPBju4uMUkO5pUSkIChAFaEsYQ3x4jFtDS5FLnzKpgI/BnMeuN1x24LZyyx6f2g/UU/NAWyiduqhQqbbsUioy2xCPqW2m/TSYZJtsNwkASlp0gaoK/+TwUj8IQYnBFFGUyxe67PDFQw0sRURiJPGkmWWhSX06wcxM11u+f3LNCQwjQyMLtkU5GhKSTOVipkyvspW4fVM0Gm4K/QPdbxDYzLERkh20HFOlz0KxPRpOBEKB8yl0RoIlBOcRZh0n032FCrsFUWncxWztYQUXt0D6OwG57Y/8Icr8K0otUavElxgfTRaRt0x7bRITXlbOyJ9qj06zJQIYmYfKTtAYuJYY2sI8RkpkM/um/GbzUV7V0luAorOr3uEgFHDJemWNW3gcVTignGdbftKf1FuAD0uIKfQaIszXWrRYB9oceLJ/HfGx5WSVX30IoXgtspsqCnP7lwRyWpPUFprr+OaR+SxZA2yEmoAh0qetM4iv7E06jzaP/NnV3SD0p6FePqvQx7Jn0lgJRde2c5uEwNRtSKor1QGmAxPPsQFYkzbRjykegbndSShxzKMNxhKumr9+Jbbun9wDspLLhP4Yg==
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f70015df-6444-4a97-2b16-08db402d50f6
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR10MB4542.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Apr 2023 16:52:38.0526 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZtzuDKngAmnVxwpcB+FUvT43LOOBXC/IbCNyNtciMiz+o38qPEmRkp9VJU05ivPmsisAtm7fPddv76WE+fI7iBan8QfUlBw8FUle3QrtyLo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR10MB7314
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-04-18_12,2023-04-18_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999
 adultscore=0
 spamscore=0 malwarescore=0 suspectscore=0 mlxscore=0 phishscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2303200000 definitions=main-2304180141
X-Proofpoint-GUID: IjyRufGBvKUHOXF4Fjj-gazPcoGtK4q6
X-Proofpoint-ORIG-GUID: IjyRufGBvKUHOXF4Fjj-gazPcoGtK4q6
Received-SPF: pass client-ip=205.220.165.32;
 envelope-from=eric.devolder@oracle.com; helo=mx0a-00069f02.pphosted.com
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Currently ARM QEMU generates, and reports, MADT revision 4. ACPI 6.3
introduces MADT revision 5.

For MADT revision 5, the GICC structure adds an SPE Overflow Interrupt
field. This new 2-byte field is created from the existing 3-byte
Reserved field. The spec indicates if the SPE overflow interrupt is
not supported, to zero the field.

Signed-off-by: Eric DeVolder <eric.devolder@oracle.com>
---
 hw/arm/virt-acpi-build.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/hw/arm/virt-acpi-build.c b/hw/arm/virt-acpi-build.c
index 4156111d49..23268dd981 100644
--- a/hw/arm/virt-acpi-build.c
+++ b/hw/arm/virt-acpi-build.c
@@ -705,7 +705,7 @@ build_madt(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
     int i;
     VirtMachineClass *vmc = VIRT_MACHINE_GET_CLASS(vms);
     const MemMapEntry *memmap = vms->memmap;
-    AcpiTable table = { .sig = "APIC", .rev = 4, .oem_id = vms->oem_id,
+    AcpiTable table = { .sig = "APIC", .rev = 5, .oem_id = vms->oem_id,
                         .oem_table_id = vms->oem_table_id };
 
     acpi_table_begin(&table, table_data);
@@ -763,7 +763,9 @@ build_madt(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
         /* Processor Power Efficiency Class */
         build_append_int_noprefix(table_data, 0, 1);
         /* Reserved */
-        build_append_int_noprefix(table_data, 0, 3);
+        build_append_int_noprefix(table_data, 0, 1);
+        /* SPE overflow Interrupt */
+        build_append_int_noprefix(table_data, 0, 2);
     }
 
     if (vms->gic_version != VIRT_GIC_VERSION_2) {
-- 
2.31.1


