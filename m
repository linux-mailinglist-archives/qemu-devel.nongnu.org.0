Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 92BAA549F0D
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Jun 2022 22:29:48 +0200 (CEST)
Received: from localhost ([::1]:40614 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o0qh1-0001yf-3r
	for lists+qemu-devel@lfdr.de; Mon, 13 Jun 2022 16:29:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37564)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jag.raman@oracle.com>)
 id 1o0qeq-0007SN-Rg
 for qemu-devel@nongnu.org; Mon, 13 Jun 2022 16:27:34 -0400
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32]:22386)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jag.raman@oracle.com>)
 id 1o0qej-0001q3-Iy
 for qemu-devel@nongnu.org; Mon, 13 Jun 2022 16:27:32 -0400
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 25DJdaXa017692;
 Mon, 13 Jun 2022 20:26:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references :
 content-transfer-encoding : content-type : mime-version;
 s=corp-2021-07-09; bh=wTG0AnFKpw9o0Sk/u5S0O8hM0u+ZhYo5tYnbm+PFelE=;
 b=cxCxaFANpVq/b0sIuOmlJYrTKGfYQTQj7nf3JavxMwTwtTNa1GPiJzmUll1PFeerxKH+
 RYsIY5+HlPIS77bgCRaiuVdkq6vuEyTrpfp0Yn4Q8cYOstzd0ZVMpJ0JBla+OH6h2QIS
 HTJ0qvvNtSNVw44N1rEEd4kZC1aJHagR8t6u6GSTLl6jGUg3oG71syPC6QRpIfEHSGvL
 LYd7dgKrM9ZL1LZDTYOgtF9ZvUYANlW7VF4HfFkH4QIug8zjXoUv/1ExbANwZnyji2eN
 LvDo3ix86c5tTOW/ApoVDbtCaCzbXmVdM4F2rsiILrwcU4OWDvjt1TwGPfi0F4ygu31s xA== 
Received: from phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com
 (phxpaimrmta01.appoci.oracle.com [138.1.114.2])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3gmhfcm3as-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 13 Jun 2022 20:26:50 +0000
Received: from pps.filterd
 (phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
 by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (8.16.1.2/8.16.1.2)
 with SMTP id 25DKQoF7026251; Mon, 13 Jun 2022 20:26:50 GMT
Received: from nam12-mw2-obe.outbound.protection.outlook.com
 (mail-mw2nam12lp2040.outbound.protection.outlook.com [104.47.66.40])
 by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com with ESMTP id
 3gpc9c807k-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 13 Jun 2022 20:26:49 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aoxHowK3xV+7gp/Mq37wUKjQXGOf1jAwSOxAzNhnkucvXGSSszwieWrLYYTsw2TxXYNibFHrwyYpFAS5ylxPLVdBtrcQ971UhlhNNJRBhp1XzBxsnYu3HoV6pZnl8auSAFuSZVRp8CFbG/Iqds8rEtCdmrdNuNERC+uPXZlWNK0RWtbtoKwy3mVIckIEs0DxgJqCH5wUn7UDLH04IHNmat8yoV5XDs4N3lAOEvwgmy2obbxKh1sadvB96S9q4vkBoFLS+p7Hmm1KBYwNaWkNI0zTcXabSdgrDhy4mc3chiZzcSQO5h6LJUZw15ByT/MIpfNu4ixx+U2jUvs23fiK7A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wTG0AnFKpw9o0Sk/u5S0O8hM0u+ZhYo5tYnbm+PFelE=;
 b=lMnuXHzggRi/aEkUVnVKhKsPyoOqU0sRK0Ii/IO+2sUE7am9k4XFaOHKzUQJnk8d3JDvsjS5TZQ5JRk29OFLHxHOJXGZCrnxYcpUXl7dFtUETs1buWxOxfJiz6wxba0+slN/TWbEY/+kC+VldcIAczakwn+8+1P4zwFHzc1lKzxvimuSjLCgySVC3V2HMhPD0470GciWJsogAvR/WZ1oAYf7WfFaJmBt4Q+eNgN0jXcL9SninpdDp4SiWc1QRvruBiNUpfx9S6Z2AmzXwK+krwHufiSsGzUaywLjzomW+H03MXGnPJ6XUfQeYTyTuqEd0KZQi/8AVIuEHobxKChY7g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wTG0AnFKpw9o0Sk/u5S0O8hM0u+ZhYo5tYnbm+PFelE=;
 b=qlwYi2jkBmeUDubzV05ZoKWFFUszl3FwDd8rkIWdd2ACcjjieYXuViGhBqjurhO81FBvlknhYlsCmBSWtg9G9DItM3K+noLU/RGRwalKNTdBUdeClIzXsVvE+QzNsKFGdsSfdgcoelaicN7gJsAiEGDu81Z+SkMk67sGMGUzDRQ=
Received: from MN2PR10MB4013.namprd10.prod.outlook.com (2603:10b6:208:185::25)
 by PH7PR10MB5723.namprd10.prod.outlook.com (2603:10b6:510:127::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5332.12; Mon, 13 Jun
 2022 20:26:48 +0000
Received: from MN2PR10MB4013.namprd10.prod.outlook.com
 ([fe80::e9cb:e1ca:8189:f191]) by MN2PR10MB4013.namprd10.prod.outlook.com
 ([fe80::e9cb:e1ca:8189:f191%7]) with mapi id 15.20.5332.020; Mon, 13 Jun 2022
 20:26:48 +0000
From: Jagannathan Raman <jag.raman@oracle.com>
To: qemu-devel@nongnu.org
Cc: stefanha@redhat.com, mst@redhat.com, alex.williamson@redhat.com,
 f4bug@amsat.org, pbonzini@redhat.com, marcandre.lureau@redhat.com,
 thuth@redhat.com, bleal@redhat.com, berrange@redhat.com,
 peter.maydell@linaro.org, eduardo@habkost.net,
 marcel.apfelbaum@gmail.com, eblake@redhat.com, armbru@redhat.com,
 quintela@redhat.com, dgilbert@redhat.com, imammedo@redhat.com,
 peterx@redhat.com, john.levon@nutanix.com, thanos.makatos@nutanix.com,
 elena.ufimtseva@oracle.com, john.g.johnson@oracle.com,
 kanth.ghatraju@oracle.com, jag.raman@oracle.com
Subject: [PATCH v12 01/14] qdev: unplug blocker for devices
Date: Mon, 13 Jun 2022 16:26:21 -0400
Message-Id: <c41ef80b7cc063314d629737bed2159e5713f2e0.1655151679.git.jag.raman@oracle.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <cover.1655151679.git.jag.raman@oracle.com>
References: <cover.1655151679.git.jag.raman@oracle.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR13CA0018.namprd13.prod.outlook.com
 (2603:10b6:a03:2c0::23) To MN2PR10MB4013.namprd10.prod.outlook.com
 (2603:10b6:208:185::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 2c06809d-84bf-475b-0dab-08da4d7b0a6c
X-MS-TrafficTypeDiagnostic: PH7PR10MB5723:EE_
X-Microsoft-Antispam-PRVS: <PH7PR10MB5723B156B9AE1006C4D7F94790AB9@PH7PR10MB5723.namprd10.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: vUFULP7TQnU8GqUnmhpY3V5ZIiX2nCIbdnOu/jGbytjgUIvU8gE4vEcdWo2RynS+PKoA54HCnY50O778FabypvcQxaqv5aQAKvOw6/LdEwUfBrAA3nGUVOgw0xtuaUqz9Pcq+w+gSLg1yRMCsLk1KUDD6mJ/ry8Ok0MStdijx33UM5UZxMKWovVoTxpFa9wCOGtFS9lh6kORJoK6ymZJm71liSqh7Dyho1VssGK/98jJXo6BG+1R2tFAE6MtrS2IDPPwjulq1Bb8K7TfTk1KgcdT/BI5bJ+mQChZsqumPNqLyaDRl5IbfRtzKMUVUNC1I6DMX2I0CaRs7hf6zYTi+HZR0DmW4uXhzkg7/g6RulAUdNlOiNzTVSOXUCWiNhAX3g/QvKujbQkHsSFqwutzZ35MqxprL2WFs013T+NcGLoDuT7rb0CUfaVFauIKK78kvOOimQ0TfiLj2JfPUGuEGq7XkdHRgFPTuvSSC6tM1b7zSWR1X9CXTBGgmSkCp8WUxfbqyzB6nHQH/qNLBgx4DmS482sTBbwsOVMnGKGUsGiPZcG7ieiIMtJcaCahX2B6DSrvNZGMpuA9nWqvtapIiXKSybdI6zo2+i+EFmsEN5yCh/WIIEMU0FUrjNNFumgElN44/hNllUjl3CIH1Gfu2FEIWHWUImB4eARofwNQDCImsjcqWhJgIJQFLkUpe0YHlJCXiaJLvoB9VgZtuPVZeQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR10MB4013.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(366004)(8676002)(36756003)(6486002)(4326008)(6506007)(6666004)(8936002)(5660300002)(38100700002)(508600001)(86362001)(316002)(7416002)(2906002)(107886003)(2616005)(38350700002)(83380400001)(52116002)(66476007)(6512007)(66946007)(186003)(26005)(66556008)(6916009);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?RVhyg6pELOuohMAx0c0sFsEZ9/2/KAzAiKvD5d9RURLIMUCBiFfroDuo5vYG?=
 =?us-ascii?Q?YBirD2cdi1bOhEuxj29pnc7Zrtma2zDrUijC1RAQpqVWFUcx+phmlQcK90ie?=
 =?us-ascii?Q?f64k7vLEb8IG0lNDMr+V/P5Rsgcs5Km1Dv/Xz7uuUSs/7h2oNANnWftG8gGW?=
 =?us-ascii?Q?vVg4VbauL2/moi6GfMTJVeEJdmvF7Cyxsbwd5FTbaKH/yy+MhueWjEJa6BDI?=
 =?us-ascii?Q?NtMkz7A8m+QmK0/1Z0+/sjd0NiV23b4jrP3em6y3Ud3XPmr+2Xj3cFcM6Gua?=
 =?us-ascii?Q?dv/Y6YBlXzPp8t0m/0BF44cYixj5g7ol0SLmAqWcfz68kCAWlBydOVy6xe/+?=
 =?us-ascii?Q?dCX0Ns58+9D3BHwvRQdZ5hbCJ6Cm/I/4PHDvpyzOCvPxuYv9NMQUakWSShVY?=
 =?us-ascii?Q?S5chSSSv4SPzNnLVVFs6bh4roo9af72hVlVmbWe4sOvLQTV9LfkzE6/WV2dV?=
 =?us-ascii?Q?3kXL55xDKO/9BfDrmJrR9L5cIP0O0RvZlvh164DySMXmCWLNuStZtzmuFlI/?=
 =?us-ascii?Q?ApSnveKe4X40ko0rsDAu/CBCQG19WpNgnIkT7JluFI1+B74kBwfFKfg0xM19?=
 =?us-ascii?Q?O6Y4bEm2d5j8HqFC7pZ3iMDtoWddr9zTocSraih7lywVhMIxYjO2JnIrGhCz?=
 =?us-ascii?Q?SCTF+u6zm3Q3lPcV5zYKMZnKtCnJCEpOTOMQGJWOIcls2V+1XG0QLEK1/KHB?=
 =?us-ascii?Q?5AFNNf1I7RjHDBGIQIXVjlfgMEesh6Yd1awL3fTpQCrwQAOQKQuNiviGbz/d?=
 =?us-ascii?Q?xLCCFaa2YC2xiEM8US2Yyi2XSl5TWhC69hPR9rGonEM8rYNR/rC/fkXMWgIK?=
 =?us-ascii?Q?DSYWo++1AhuN8sP/cH31dhukXOpsaXrqniHn6/C5CjrPgt7JyKljXzNjPiPs?=
 =?us-ascii?Q?6g/S0rRxyV0HlfOqgsUJUdVEICvd9Oyhsm1JtMyd2xnphklvfRC1+EvuckU7?=
 =?us-ascii?Q?rszrr2JOoByCwc3h7onxEu3XwGj4ZW9xJWRnnnCdG3LvjpOErF84th646H5k?=
 =?us-ascii?Q?tyiyQZJ5K6SNMlvhrkCkWhDEj7o8Jwv2gMV8JUsK82KbtNV8W9nEE3pS6f0r?=
 =?us-ascii?Q?71JIfTZlX5UvXxTseus8bqIMWEUPWEibxgDntBIsEVKA7cLdJQNef/2OIUMz?=
 =?us-ascii?Q?4BGkrwBJ8dfdEBP2tlDd6JJ8OQsJHipIs6SYCGjal5+jVwJrsORvGBYDKmHk?=
 =?us-ascii?Q?3TzKLDe3p8REZzppy1oGaFi/LpRDQUzPp8hTnDBQSjzA3Osf03fQ4bNodVhT?=
 =?us-ascii?Q?+pXgYL4l+kbbyf5HakOnmk90y/522w6Dn7pv+0HsDvQr+wvJEdFBYw6k9HKi?=
 =?us-ascii?Q?INWDVNsv/2MlCAgpmKh17KG3o4Njqg2473tKCGNSDswuksQIsKOHJOeBAXh3?=
 =?us-ascii?Q?RhAh3JNZ5Xd8Qb920B/arrQGX+uHeElxQDMNDJI1+7XZKKY6aYyidiS4V3pe?=
 =?us-ascii?Q?HzM/meTXMLGzLRZdNQTTfvBFFuru2ZhYGgMSlA29jZ2pMWLb3qlXsO1XXKfo?=
 =?us-ascii?Q?Ox09gm9D82GZILs7HsQ+mMZrVMlSzbO51wGGpE+Y+l0aBN453Uv1NjV98VJW?=
 =?us-ascii?Q?r0/2jYyrzgTIJJ5j//YxahNQfqVkNP5wXMwsWfuApKbjf762WMvWeB7R4HAB?=
 =?us-ascii?Q?aPO5v25JTW31+rzI015mMuP2mk2QA+u95p+KnjeVO4aU7s3hCjgnk798HOtI?=
 =?us-ascii?Q?n6szU3f5MDTp0+mKt0I6+3a4t5ZhqQiwf66vtIbGbNP0vrtaBT5rhC3IaHU4?=
 =?us-ascii?Q?w46v7PpZqQ=3D=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2c06809d-84bf-475b-0dab-08da4d7b0a6c
X-MS-Exchange-CrossTenant-AuthSource: MN2PR10MB4013.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jun 2022 20:26:47.9547 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: oYRICriH3fs9IErVHO6xBr6ROUXkFPa+XGpCgOdNL0RzHCyq/YtbmmKpYWwIUYetjl7Y1+JSbJfermXFB/UVIg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR10MB5723
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.517, 18.0.874
 definitions=2022-06-13_08:2022-06-13,
 2022-06-13 signatures=0
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999
 malwarescore=0
 adultscore=0 spamscore=0 phishscore=0 mlxscore=0 bulkscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2204290000 definitions=main-2206130082
X-Proofpoint-ORIG-GUID: 7WaRbXrZXT-VVuehfEyCAOJwcd4FCQnk
X-Proofpoint-GUID: 7WaRbXrZXT-VVuehfEyCAOJwcd4FCQnk
Received-SPF: pass client-ip=205.220.177.32; envelope-from=jag.raman@oracle.com;
 helo=mx0b-00069f02.pphosted.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 T_SCC_BODY_TEXT_LINE=-0.01,
 T_SPF_TEMPERROR=0.01 autolearn=ham autolearn_force=no
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

Add blocker to prevent hot-unplug of devices

TYPE_VFIO_USER_SERVER, which is introduced shortly, attaches itself to a
PCIDevice on which it depends. If the attached PCIDevice gets removed
while the server in use, it could cause it crash. To prevent this,
TYPE_VFIO_USER_SERVER adds an unplug blocker for the PCIDevice.

Signed-off-by: Elena Ufimtseva <elena.ufimtseva@oracle.com>
Signed-off-by: John G Johnson <john.g.johnson@oracle.com>
Signed-off-by: Jagannathan Raman <jag.raman@oracle.com>
Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
---
 include/hw/qdev-core.h | 29 +++++++++++++++++++++++++++++
 hw/core/qdev.c         | 24 ++++++++++++++++++++++++
 softmmu/qdev-monitor.c |  4 ++++
 3 files changed, 57 insertions(+)

diff --git a/include/hw/qdev-core.h b/include/hw/qdev-core.h
index 92c3d65208..98774e2835 100644
--- a/include/hw/qdev-core.h
+++ b/include/hw/qdev-core.h
@@ -193,6 +193,7 @@ struct DeviceState {
     int instance_id_alias;
     int alias_required_for_version;
     ResettableState reset;
+    GSList *unplug_blockers;
 };
 
 struct DeviceListener {
@@ -419,6 +420,34 @@ void qdev_simple_device_unplug_cb(HotplugHandler *hotplug_dev,
 void qdev_machine_creation_done(void);
 bool qdev_machine_modified(void);
 
+/**
+ * qdev_add_unplug_blocker: Add an unplug blocker to a device
+ *
+ * @dev: Device to be blocked from unplug
+ * @reason: Reason for blocking
+ */
+void qdev_add_unplug_blocker(DeviceState *dev, Error *reason);
+
+/**
+ * qdev_del_unplug_blocker: Remove an unplug blocker from a device
+ *
+ * @dev: Device to be unblocked
+ * @reason: Pointer to the Error used with qdev_add_unplug_blocker.
+ *          Used as a handle to lookup the blocker for deletion.
+ */
+void qdev_del_unplug_blocker(DeviceState *dev, Error *reason);
+
+/**
+ * qdev_unplug_blocked: Confirm if a device is blocked from unplug
+ *
+ * @dev: Device to be tested
+ * @reason: Returns one of the reasons why the device is blocked,
+ *          if any
+ *
+ * Returns: true if device is blocked from unplug, false otherwise
+ */
+bool qdev_unplug_blocked(DeviceState *dev, Error **errp);
+
 /**
  * GpioPolarity: Polarity of a GPIO line
  *
diff --git a/hw/core/qdev.c b/hw/core/qdev.c
index 84f3019440..0806d8fcaa 100644
--- a/hw/core/qdev.c
+++ b/hw/core/qdev.c
@@ -468,6 +468,28 @@ char *qdev_get_dev_path(DeviceState *dev)
     return NULL;
 }
 
+void qdev_add_unplug_blocker(DeviceState *dev, Error *reason)
+{
+    dev->unplug_blockers = g_slist_prepend(dev->unplug_blockers, reason);
+}
+
+void qdev_del_unplug_blocker(DeviceState *dev, Error *reason)
+{
+    dev->unplug_blockers = g_slist_remove(dev->unplug_blockers, reason);
+}
+
+bool qdev_unplug_blocked(DeviceState *dev, Error **errp)
+{
+    ERRP_GUARD();
+
+    if (dev->unplug_blockers) {
+        error_propagate(errp, error_copy(dev->unplug_blockers->data));
+        return true;
+    }
+
+    return false;
+}
+
 static bool device_get_realized(Object *obj, Error **errp)
 {
     DeviceState *dev = DEVICE(obj);
@@ -704,6 +726,8 @@ static void device_finalize(Object *obj)
 
     DeviceState *dev = DEVICE(obj);
 
+    g_assert(!dev->unplug_blockers);
+
     QLIST_FOREACH_SAFE(ngl, &dev->gpios, node, next) {
         QLIST_REMOVE(ngl, node);
         qemu_free_irqs(ngl->in, ngl->num_in);
diff --git a/softmmu/qdev-monitor.c b/softmmu/qdev-monitor.c
index bb5897fc76..4b0ef65780 100644
--- a/softmmu/qdev-monitor.c
+++ b/softmmu/qdev-monitor.c
@@ -899,6 +899,10 @@ void qdev_unplug(DeviceState *dev, Error **errp)
     HotplugHandlerClass *hdc;
     Error *local_err = NULL;
 
+    if (qdev_unplug_blocked(dev, errp)) {
+        return;
+    }
+
     if (dev->parent_bus && !qbus_is_hotpluggable(dev->parent_bus)) {
         error_setg(errp, QERR_BUS_NO_HOTPLUG, dev->parent_bus->name);
         return;
-- 
2.20.1


