Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5578E56A3F0
	for <lists+qemu-devel@lfdr.de>; Thu,  7 Jul 2022 15:42:00 +0200 (CEST)
Received: from localhost ([::1]:43922 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o9RlW-0000cP-2d
	for lists+qemu-devel@lfdr.de; Thu, 07 Jul 2022 09:41:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56280)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <darren.kenny@oracle.com>)
 id 1o9Rgy-0006hJ-KQ; Thu, 07 Jul 2022 09:37:16 -0400
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32]:36822)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <darren.kenny@oracle.com>)
 id 1o9Rgo-0003um-0G; Thu, 07 Jul 2022 09:37:14 -0400
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 267C9KDt026135;
 Thu, 7 Jul 2022 13:36:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : content-transfer-encoding : content-type :
 mime-version; s=corp-2021-07-09;
 bh=YBlR2EC1wCgG86M+3ZTzZ2OUkZwGduhT4XUjf5rBH2I=;
 b=tagzz69RZPAIIfnRUmLMT06OKuoBPuumd5jtN+tV+eemc7Wsh11UWAp+oYw8S8SszSsA
 qTc+gy/WGrq4ehmJ+YmfnRPVYZRiJbip1BgeOj1MktUj8Lcri3NPv1c3UaCxlmwDm2YQ
 olpgYfIWh4zr+bVEW55eGIlov5a1cZxcWHNwnxBGcZYdcq3GlsO6zHu8KOAN+Ib3EeT6
 jiqktzuFM8rDeQ+YGqLcW0V5jsxay5/1P1FNtv/OzI9LXvF269NuGSJWN2ALwDr9G5U2
 GUrT00+gITfmqLqaqvUqYdLH0Qp3n3J6Cemf1ynbC/fHHqKgBRZTs7z7RZ/WMTIHBxPn lA== 
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com
 (iadpaimrmta03.appoci.oracle.com [130.35.103.27])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3h4ubyw1x4-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 07 Jul 2022 13:36:34 +0000
Received: from pps.filterd
 (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
 by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (8.16.1.2/8.16.1.2)
 with SMTP id 267DLVbM019130; Thu, 7 Jul 2022 13:36:33 GMT
Received: from nam11-bn8-obe.outbound.protection.outlook.com
 (mail-bn8nam11lp2169.outbound.protection.outlook.com [104.47.58.169])
 by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com with ESMTP id
 3h4ud8xmtg-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 07 Jul 2022 13:36:33 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FLvPIBrpJWoONxMhU3thJ+Lp+6w7m691yFdArJ0oSLYTpeH+UEXEVOj2o4onSfaLi5QXOZVCQ1yt5xjr5p6a50JIjqei9rXAQfo7Ffm+/Zx6P5daIjYEM0WTXGO1zCJcC9iJeDBtmJU7y+gIzXsG/sP/8kFYwrDbKWwdnkgk17osUaPtDFugo5OBJmzZNbqKWlFM5yR8JaNfzVDQudi3RrjOZ6ftc0YOVgA73mRTmfDjuP2R4PXe59pZ8Rcgjuba6ify91au2LcM/AaC3H3hDfpbonoPNSIx8SQAQN77k8yIc11vHda8Rx2FaYVMFt+SW7gSh/qwwp5n4xeENkK3YQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YBlR2EC1wCgG86M+3ZTzZ2OUkZwGduhT4XUjf5rBH2I=;
 b=gjUEsaqi9s2z7cEL46W4lqzlRHmZc5O0vFvcQbQbbSye1ABBNNo0Cw/odOS4MqPVG1MrC+Fi2GA4wRgbp12wstb+LVtIs5tly7MR1eYDXqEouXi4rwEuo6pkgc+XKahhY4KhhbC+jRinzhLbVCsmqHwqwOgd5pZTlxEedUjs6PsCZx+uT6Bm+/Ss4f5xXfB07p2btxBtq/9C2qtP97rpuqNeybPw+gEvqvJ6df8HsWZw6fEv3a/opE1cT7fCLQNHCQTnluNI/PFGKCJTTXEPFBu72G56ZiYvP2hf3dkYn5M0LReVgdbifDXLP4XeqGrzOCxIPlmPDvxjkxfxXBQzFQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YBlR2EC1wCgG86M+3ZTzZ2OUkZwGduhT4XUjf5rBH2I=;
 b=Imp7ST9FYsmboDf3D7se1c2pMeg/lmqr7aGJlH+cyzn+DZYqMoid+5mitO8mNbUH/46EMonq9tUN05/O7h3cV0gcrWpWIcR5qAXBKORURemArvODfonlqowGjq4NsgKIPTRQLAVfQoltdToFeWsPFE4M2THLlB3JHgsfZs0YtAs=
Received: from BLAPR10MB5138.namprd10.prod.outlook.com (2603:10b6:208:322::8)
 by DM5PR1001MB2346.namprd10.prod.outlook.com (2603:10b6:4:30::33)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5417.15; Thu, 7 Jul
 2022 13:36:32 +0000
Received: from BLAPR10MB5138.namprd10.prod.outlook.com
 ([fe80::89fe:338:779d:6bb0]) by BLAPR10MB5138.namprd10.prod.outlook.com
 ([fe80::89fe:338:779d:6bb0%8]) with mapi id 15.20.5417.016; Thu, 7 Jul 2022
 13:36:32 +0000
From: Darren Kenny <darren.kenny@oracle.com>
To: qemu-block@nongnu.org, qemu-devel@nongnu.org
Cc: Hanna Reitz <hreitz@redhat.com>, Kevin Wolf <kwolf@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Fam Zheng <fam@euphon.net>, Stefan Hajnoczi <stefanha@redhat.com>,
 Klaus Jensen <its@irrelevant.dk>, Keith Busch <kbusch@kernel.org>,
 darren.kenny@oracle.com
Subject: [QEMU 1/1] nvme: Fix misleading macro when mixed with ternary operator
Date: Thu,  7 Jul 2022 13:36:21 +0000
Message-Id: <d3fc4a90ba74d4874c445480b48d45b67c9322ae.1657200900.git.darren.kenny@oracle.com>
X-Mailer: git-send-email 2.31.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: DS7PR05CA0010.namprd05.prod.outlook.com
 (2603:10b6:5:3b9::15) To BLAPR10MB5138.namprd10.prod.outlook.com
 (2603:10b6:208:322::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 22fda383-1107-451d-4060-08da601db427
X-MS-TrafficTypeDiagnostic: DM5PR1001MB2346:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 4K0E4boF/N9UI2L7NINlhfXIvAi4VOuPy0PSE9SVS+2sDY2Gya7sWfM72PNBLNQ3cj3LDNE8WKZFlxGj89Hf0AXWxuVNpo5TLcyeAO48FbtZzTFgwq5l/a30r8/0s4IscKYKBRI1cqc534r+G3UHkiWBGlGXS5O2Scr1e6TVwgTOVmmKkJUp6nZhzBtdFfQZJ0xlTjS21XnSDINI6mgaH8fUinl4ej3FyhdNwouUstwvBJ9VtsmYCGkaI3revryC8azrMfi61hWx51yUnt05tVlwcmcnfnI82DQc5VW259EQocUkIvoh7WiFfNskhi5nWz+HsczUuYEIushhFYqwW/lY15DBnDAjQWzvAQYaSuzCFnf10FIbcX1inHncnF/dSVQ9zfxzg+JmeKGDlRzSFAqvtLRSrN4VdVhtFJ7+5FBuezuAkPH4zMeH9AQ/wXkGeAdviutwrierK0Rrg/uuJhoiEaxbpF029Nk46xOx0Y2bXhdhH4Bs0BXym3z0YMvztMFIp+6fVvl14RpdGZOs33SIajK18GNG/TNmD148O5zlOF94YDyZGr6dIBH5PHehNXVLO9Sy3NxouWMICTt1PjvPpVVYrd9xAwjzYo+ra3NHR+i6erl4aowHDRepnSZvJJ/zYDEf0ZszWwX9qAaOOL2qQRsVPfrp3SYPnfzTIFOZSShMvAVjwiAlOE0odrqR9tMsirYwlFLEblSFKB3OjQ7LLzJhwEZ5GtLZSTEOVW3pyREPX5JS54WKdMAHsALlpDQyjAUJXB63tnv9c6ROZ5YeNwG6NNaYeaoiVhES4WxJYQom0UtAskbv0Zl3+C0e
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BLAPR10MB5138.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(136003)(346002)(39860400002)(396003)(376002)(366004)(8936002)(44832011)(5660300002)(38350700002)(38100700002)(54906003)(2616005)(186003)(6512007)(316002)(6506007)(478600001)(6486002)(52116002)(107886003)(6666004)(41300700001)(26005)(8676002)(4326008)(83380400001)(66556008)(2906002)(66476007)(36756003)(86362001)(66946007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?1cWktJ6mM3pSoxYu2mI67EciS5uidtQfEons75gOQU+GNtVPurd47PoamLcb?=
 =?us-ascii?Q?26BfeQ1AXIqaANAjbf9vu9T8GNjCiPUx1k1FP1a+XJWVoup3pnjUfwqLdtbK?=
 =?us-ascii?Q?IwWt9mQroVGH74lCGsPaDF1bwhH5m8s82UZ5Ygt/rUiFvrNf/OUXWqkZmrCe?=
 =?us-ascii?Q?Nmreb0MLskltoSS6EbW40C1h0jdyX9/enwpdB2vxlXiWWBl1C/WTAu0+1Hot?=
 =?us-ascii?Q?tzQOCFUZ7UNI4cQSMY9OlsjKqKuqB3v1QWgXp31ek20HwpdNNhUKeC2kNmQu?=
 =?us-ascii?Q?uaB7i9Ectr9AxmBfC55GWfOW+EB02jmq3DiM9x+5L2YwwGhHsXCqwd9xKJT7?=
 =?us-ascii?Q?7G6hZkpddLSd/O+IJY9QZrbYKB7Jy9esOmkaljACKbbM4GrEAkqtwvQZ95XT?=
 =?us-ascii?Q?z+HqtYHMd8jgor5vzwCQrSbqBVIOy0Cbo0V8RsxAcASK0p2zw+XjwzpStV8Q?=
 =?us-ascii?Q?fFWeMXJtqqndR361xOg34TvdyByOHWUCkCE07gmY3GzEMzxM0PcIOXwU7hfL?=
 =?us-ascii?Q?tUkrI4NlKGpLMQ1G9yaF4cbXtTL5PaD1Psx60TBl6wwTf69p9RtFcHld34wr?=
 =?us-ascii?Q?eG0VlEnebF9vaJN7HgWargofhnesWOFdoEU9j37oalo1w1wPDegF8SRZkJam?=
 =?us-ascii?Q?/zFLiHftHbVmf1IjxX+LJiN/EROW4+xWU5TEf4Hkuo8PYYsXVMDv5hnwQ/0B?=
 =?us-ascii?Q?BAuDsO2tMgiWz9tJOYmo8Z/HqBKWRifUUKtFB+IEBxGoHJcbijn5U9ws2vez?=
 =?us-ascii?Q?zpJu3IEp98RspkFZAUZ3KJrnXQKO7bwnzciWbMQfqzcZLcFvURRWA2aOdGnF?=
 =?us-ascii?Q?kn/GQ26TO8gdVyOtboL0C2wBX86Cs/cCbr3Xauj3L3Ch8CotYCn/GCdOHlne?=
 =?us-ascii?Q?vN21TaBrZvxzsgRtD5v2ahz/DTzK1R5TckL9y83u4XgDvckH+eCUmhA1dmQm?=
 =?us-ascii?Q?aGEMHwfx53U0QFe/9qN4TGZGxfdiU3zzaqM+0BU2HY0+lYrLt9UZRRzbuYqZ?=
 =?us-ascii?Q?qrhPK8xkwASsBCbb1dhlp7ghrKMW6xJpwbhozGQEn+j6jchYFSiur++Lg998?=
 =?us-ascii?Q?mnqnN0L2a7e7ZbTN1QuKc7zNLGOCqeAz4rxUBag+m35rNeAUip2a1kGRi5PZ?=
 =?us-ascii?Q?1m/9HFR+MoO6PGt0U6dmiONO1wfXwZEgTglMPfb81cY1SFiOL4duOfl5KyBS?=
 =?us-ascii?Q?tJbyC++wQylEAaVbO+8BGBhfwH7xs0117U3fDhLqILub0nWMSAlOoT2rApn7?=
 =?us-ascii?Q?q7AVrvgCCBe6rU6cCqtlkI7B8ePxKQTNXvYVDJqwjgJohLAVtDBASuT7KqBU?=
 =?us-ascii?Q?GdpOMcIZyNt5IsgD/R67quGNL0YdNKmV9vr9UJIcoXt2fwo+udEbDMLX2SIB?=
 =?us-ascii?Q?bUXBIqfxezCgWX00YN83HeopGHbsrbkGxqALcreWeF+QpVRE9JlRleEaDxDb?=
 =?us-ascii?Q?IsYVVC2RgfxPtglAZ8DZIoane34/nITtP4sW0x9qiNEghWauuE4Y7oWS+349?=
 =?us-ascii?Q?V4m3xilMqX7JXCebHzL/9GtTjX78EBPmaMA4UsA3da8OhNzkfhpZR75+e/x0?=
 =?us-ascii?Q?iPFXVX3N4aQ7J/BMaBT0Ufsf5Azb3NpUr9K2IHYDBvpRgqe4umi3eeY2ej93?=
 =?us-ascii?Q?HQ=3D=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 22fda383-1107-451d-4060-08da601db427
X-MS-Exchange-CrossTenant-AuthSource: BLAPR10MB5138.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jul 2022 13:36:32.0542 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DakdcrtQ8vOu8macpf6URxuaC4F5t2Ipbg9PYpYVcbFxUKdCye2hfD05yr6yp4hbdiqAR/FloV89gqzO4zqikg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR1001MB2346
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.517, 18.0.883
 definitions=2022-07-07_09:2022-06-28,
 2022-07-07 signatures=0
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0
 bulkscore=0 malwarescore=0
 mlxscore=0 spamscore=0 suspectscore=0 adultscore=0 mlxlogscore=999
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2206140000
 definitions=main-2207070053
X-Proofpoint-ORIG-GUID: XJABegfuzGg3PvFscURGNBZSLl0aAYG6
X-Proofpoint-GUID: XJABegfuzGg3PvFscURGNBZSLl0aAYG6
Received-SPF: pass client-ip=205.220.177.32;
 envelope-from=darren.kenny@oracle.com; helo=mx0b-00069f02.pphosted.com
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

Using the Parfait source code analyser and issue was found in
hw/nvme/ctrl.c where the macros NVME_CAP_SET_CMBS and NVME_CAP_SET_PMRS
are called with a ternary operatore in the second parameter, resulting
in a potentially unexpected expansion of the form:

  x ? a: b & FLAG_TEST

which will result in a different result to:

  (x ? a: b) & FLAG_TEST.

The macros should wrap each of the parameters in brackets to ensure the
correct result on expansion.

Signed-off-by: Darren Kenny <darren.kenny@oracle.com>
---
 include/block/nvme.h | 44 ++++++++++++++++++++++----------------------
 1 file changed, 22 insertions(+), 22 deletions(-)

diff --git a/include/block/nvme.h b/include/block/nvme.h
index 373c70b5ca7f..b35f31a9f958 100644
--- a/include/block/nvme.h
+++ b/include/block/nvme.h
@@ -98,28 +98,28 @@ enum NvmeCapMask {
 #define NVME_CAP_PMRS(cap)  (((cap) >> CAP_PMRS_SHIFT)   & CAP_PMRS_MASK)
 #define NVME_CAP_CMBS(cap)  (((cap) >> CAP_CMBS_SHIFT)   & CAP_CMBS_MASK)
 
-#define NVME_CAP_SET_MQES(cap, val)   (cap |= (uint64_t)(val & CAP_MQES_MASK)  \
-                                                           << CAP_MQES_SHIFT)
-#define NVME_CAP_SET_CQR(cap, val)    (cap |= (uint64_t)(val & CAP_CQR_MASK)   \
-                                                           << CAP_CQR_SHIFT)
-#define NVME_CAP_SET_AMS(cap, val)    (cap |= (uint64_t)(val & CAP_AMS_MASK)   \
-                                                           << CAP_AMS_SHIFT)
-#define NVME_CAP_SET_TO(cap, val)     (cap |= (uint64_t)(val & CAP_TO_MASK)    \
-                                                           << CAP_TO_SHIFT)
-#define NVME_CAP_SET_DSTRD(cap, val)  (cap |= (uint64_t)(val & CAP_DSTRD_MASK) \
-                                                           << CAP_DSTRD_SHIFT)
-#define NVME_CAP_SET_NSSRS(cap, val)  (cap |= (uint64_t)(val & CAP_NSSRS_MASK) \
-                                                           << CAP_NSSRS_SHIFT)
-#define NVME_CAP_SET_CSS(cap, val)    (cap |= (uint64_t)(val & CAP_CSS_MASK)   \
-                                                           << CAP_CSS_SHIFT)
-#define NVME_CAP_SET_MPSMIN(cap, val) (cap |= (uint64_t)(val & CAP_MPSMIN_MASK)\
-                                                           << CAP_MPSMIN_SHIFT)
-#define NVME_CAP_SET_MPSMAX(cap, val) (cap |= (uint64_t)(val & CAP_MPSMAX_MASK)\
-                                                           << CAP_MPSMAX_SHIFT)
-#define NVME_CAP_SET_PMRS(cap, val)   (cap |= (uint64_t)(val & CAP_PMRS_MASK)  \
-                                                           << CAP_PMRS_SHIFT)
-#define NVME_CAP_SET_CMBS(cap, val)   (cap |= (uint64_t)(val & CAP_CMBS_MASK)  \
-                                                           << CAP_CMBS_SHIFT)
+#define NVME_CAP_SET_MQES(cap, val)   \
+    ((cap) |= (uint64_t)((val) & CAP_MQES_MASK)   << CAP_MQES_SHIFT)
+#define NVME_CAP_SET_CQR(cap, val)    \
+    ((cap) |= (uint64_t)((val) & CAP_CQR_MASK)    << CAP_CQR_SHIFT)
+#define NVME_CAP_SET_AMS(cap, val)    \
+    ((cap) |= (uint64_t)((val) & CAP_AMS_MASK)    << CAP_AMS_SHIFT)
+#define NVME_CAP_SET_TO(cap, val)     \
+    ((cap) |= (uint64_t)((val) & CAP_TO_MASK)     << CAP_TO_SHIFT)
+#define NVME_CAP_SET_DSTRD(cap, val)  \
+    ((cap) |= (uint64_t)((val) & CAP_DSTRD_MASK)  << CAP_DSTRD_SHIFT)
+#define NVME_CAP_SET_NSSRS(cap, val)  \
+    ((cap) |= (uint64_t)((val) & CAP_NSSRS_MASK)  << CAP_NSSRS_SHIFT)
+#define NVME_CAP_SET_CSS(cap, val)    \
+    ((cap) |= (uint64_t)((val) & CAP_CSS_MASK)    << CAP_CSS_SHIFT)
+#define NVME_CAP_SET_MPSMIN(cap, val) \
+    ((cap) |= (uint64_t)((val) & CAP_MPSMIN_MASK) << CAP_MPSMIN_SHIFT)
+#define NVME_CAP_SET_MPSMAX(cap, val) \
+    ((cap) |= (uint64_t)((val) & CAP_MPSMAX_MASK) << CAP_MPSMAX_SHIFT)
+#define NVME_CAP_SET_PMRS(cap, val)   \
+    ((cap) |= (uint64_t)((val) & CAP_PMRS_MASK)   << CAP_PMRS_SHIFT)
+#define NVME_CAP_SET_CMBS(cap, val)   \
+    ((cap) |= (uint64_t)((val) & CAP_CMBS_MASK)   << CAP_CMBS_SHIFT)
 
 enum NvmeCapCss {
     NVME_CAP_CSS_NVM        = 1 << 0,
-- 
2.31.1


