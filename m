Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 38653475C05
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Dec 2021 16:43:37 +0100 (CET)
Received: from localhost ([::1]:53180 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mxWRM-00064W-19
	for lists+qemu-devel@lfdr.de; Wed, 15 Dec 2021 10:43:36 -0500
Received: from eggs.gnu.org ([209.51.188.92]:43008)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jag.raman@oracle.com>)
 id 1mxWKI-0005d4-Rt
 for qemu-devel@nongnu.org; Wed, 15 Dec 2021 10:36:18 -0500
Received: from mx0a-00069f02.pphosted.com ([205.220.165.32]:23970)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jag.raman@oracle.com>)
 id 1mxWKF-0008UK-PI
 for qemu-devel@nongnu.org; Wed, 15 Dec 2021 10:36:17 -0500
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 1BFEWeMk023139; 
 Wed, 15 Dec 2021 15:36:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references :
 content-transfer-encoding : content-type : mime-version;
 s=corp-2021-07-09; bh=YGx4Go3VGehYmW1KalcuxWiAmbNP9Ygla7Mfg/QIVxc=;
 b=1N//bwECAjLJ5UCGeGf7Ack0SW6fhQDSgy1hUVjvYWCiP4ORw+ytz0eKlpf+g8BWsFqL
 a9fS07PAl2jJAUvQ8lwASg1ckkAbBGw99bdTVKTqIJ7J73BE/P9eUCF3FBA9zYozgxit
 3VH95yrIRyR5wsUl+i8q1AQxBW2XPK1u3uTVo7rDiutgeJRbuvtffSVvqyEzlb8LbPyO
 NPnBVaOZA0szst7hbOSdIQX1MDuKQ2VbFZcg0591FnycI9Rh0H6R4HfVYfuo7IeE05Dg
 zFz3rT3jNHfML8ce5gP75mKU+FYgIAH17NaICKsm0YZ5cPJqXKmgWKl5epwsO/unjueQ 3g== 
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
 by mx0b-00069f02.pphosted.com with ESMTP id 3cx3py7782-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 15 Dec 2021 15:36:12 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
 by aserp3020.oracle.com (8.16.1.2/8.16.1.2) with SMTP id 1BFFUXsp094439;
 Wed, 15 Dec 2021 15:36:11 GMT
Received: from nam12-bn8-obe.outbound.protection.outlook.com
 (mail-bn8nam12lp2169.outbound.protection.outlook.com [104.47.55.169])
 by aserp3020.oracle.com with ESMTP id 3cxmrc0tyb-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 15 Dec 2021 15:36:11 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=h2/yvLnVoyFn44YQio8DTVRgpaoQZIP2aY9G/8uawWb+I+kw8CrGsJjVFpQQ/L5m0YIfdwDyajg3KGeiaKJjvm+0ZNb5T3QJGJB3qhiKTrqhZs40Fg8KAcPrMrSnDYTPUWmVzes6dT9d7BUGxRKxNy8MyHGuOtMOUz8rXngwXsQD+qFr5zIAYpypX/lM2VyKa/2e9VL1x9HF1k6KyIlszFjzB9tISkBvDtmRkqSYmWgMcZtOxphfqBxoXW+rJzdYQ0cNN7f7zQrhDgtunBouF+MqY2jMcUzvA80iO6TZQGi3AlE1QF4gxcBEgCyMIhea4n3Yj1+RVI9MRemoxNxsqA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YGx4Go3VGehYmW1KalcuxWiAmbNP9Ygla7Mfg/QIVxc=;
 b=DZ5YHld6iiR7KEdAaoeg12WnVLSCOQE+ODsws6hvqoUoMknHYlQ9N+iNsiGp0dvm4Dpw0rBweK+X2cELYXBzMaHQ15x0fPjRbJxfycQdoupHAgLc6msg+pO69RC3H1DwvG8/BDgTV4eb7TRTDHh3ywqYceXi4H6qk/eURrlz9a0WLt68cuj8UPU8xGebZWAcGbrPVLwX3UUst/Sxqxvww0kf9M9XorcCr9wQTGPWXYkqGtvf5hxtyz2GLR18+el6pd431xcSBOOwQMLubEqUVvYYYxSjw2JJ/wBGtatrL7bSy1cK8rv4hhtDhYwYnRrEqehUV5SbiHVqfMQMG9vmCg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YGx4Go3VGehYmW1KalcuxWiAmbNP9Ygla7Mfg/QIVxc=;
 b=kcdWvWiHIXzZqrzq8XM/LH+kEQmRVYIoMr32xzhscLFdPItPRCpVCCSbOO1T4GRdz3+GPb0Y5xAbkdVJH0a71oW2y6719DBmbvQmBzEvKgc3NQlcwzobIrDsE7g7C02lvLTYtjPop34rqyLm+CWny6h070NO03A6r0W4H0tayu8=
Received: from MN2PR10MB4013.namprd10.prod.outlook.com (2603:10b6:208:185::25)
 by BLAPR10MB5282.namprd10.prod.outlook.com (2603:10b6:208:30e::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4778.17; Wed, 15 Dec
 2021 15:36:09 +0000
Received: from MN2PR10MB4013.namprd10.prod.outlook.com
 ([fe80::b911:b919:6383:970d]) by MN2PR10MB4013.namprd10.prod.outlook.com
 ([fe80::b911:b919:6383:970d%5]) with mapi id 15.20.4778.018; Wed, 15 Dec 2021
 15:36:09 +0000
From: Jagannathan Raman <jag.raman@oracle.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 07/14] vfio-user: run vfio-user context
Date: Wed, 15 Dec 2021 10:35:31 -0500
Message-Id: <f7fdee9b5cde0f8ee8e99702f113ab22dc4167ea.1639549843.git.jag.raman@oracle.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <cover.1639549843.git.jag.raman@oracle.com>
References: <cover.1639549843.git.jag.raman@oracle.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BYAPR11CA0105.namprd11.prod.outlook.com
 (2603:10b6:a03:f4::46) To MN2PR10MB4013.namprd10.prod.outlook.com
 (2603:10b6:208:185::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 4b58e9bb-9c40-4b7e-d62e-08d9bfe09dde
X-MS-TrafficTypeDiagnostic: BLAPR10MB5282:EE_
X-Microsoft-Antispam-PRVS: <BLAPR10MB52827966466D1957708DE15990769@BLAPR10MB5282.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:428;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: MKuB80HYrfSXFtguxJZMNTnoj4CocnPyKrLJR2Kohq/3cr7lomWkhPiw9xQev97xySh6MjBThXwy4VNvxxSKL67LAd9gHjufQtXXqS6kgHKyTO/tJlNZQBrhpaI3H7HQoSD47ycyaYqXN4fY+dMcoWbmwXqIFbsyJ0AILckFLLVcLdnRsGoWzfIPtEygo5ZJyxqlzAcdXMm7rYU9FycE+xTyI0Wnq3shh6x2FFiRbP9PQ/xLg4prNTXeAZ1sE4wCJcrnSquBYs1iU2CbySNrHX2W9SwdYJnEu/sL7+SYge9C09ZC5WrCNyTPQO6FOwgkNFd3JCSQAhXUxMPh4OsQlj+TIG3CTXM+C6Aw16g35cGFw+OCyDEugjYo1TBsJx6e7S/WOF/7puLPZogPjezmnltrRzZronuaDf2qTQu+KTn27V+e6vdcK31dXsZuNSaf6d/ej5EWHGQ61lgb1aIEwfobPKX0dU86svkG9VItOMZbs/dp+myIcvrfLDpLqeZUD1fxLW7vr6fbspnqw+NLphSUq53U8ElVR0zsJ88OCrf5PJqb7VABy8qSg4WAALkXgN1JFcXnY8J8UA/RcdVzJ7hxdtIUSVTUgTOJ5gUXtYHaHZMcwNG7EQcKUM95wmrmCgGF2qyX6k5x+Jbm1FgPEppdppC1QXEYrl9H/vsWetPrnc/VGDr2552snQHLQ9wXOBwl6P981ll5NPhkDGR4pg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR10MB4013.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(2906002)(86362001)(36756003)(316002)(52116002)(6512007)(508600001)(2616005)(6506007)(4326008)(6666004)(6916009)(6486002)(7416002)(107886003)(83380400001)(8676002)(26005)(8936002)(38100700002)(38350700002)(66946007)(5660300002)(66556008)(66476007)(186003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?vsGQOgaKt2SEvNkDmCMUTeOpDjw4cBJn9n0YNF9APJaVkjrRFKVjfwAKatnc?=
 =?us-ascii?Q?B1Hcf67jW6SM8jlszwwN/LXs+iqpqYUymiV4E7Ag8TIvSYrX8RkJOYOH1RBA?=
 =?us-ascii?Q?Ha2IH/2TDygKQbmqUc6zRSmw+UNwzNGvSsc49pQ6inLGXVFsVvijfpqbxWmW?=
 =?us-ascii?Q?PomqLuVt4l0ZJZ8wK0ep34tQsBk0DmuPQxUEwXlmLvGWSCU3X/7C+vqRSbya?=
 =?us-ascii?Q?uzsF1kXGA6iwpp+8nWCNrEb8nubkp2b6HmKQ6lpeGaAjMpGxR4Usf1hwTXv6?=
 =?us-ascii?Q?mOOCuit2bnVjNmQGOVf99h/YH4ALwYm5AtzTn6dIJGpmaqiw7X9MUGpAwFaY?=
 =?us-ascii?Q?dilXpOJwJn5vGRtQbxuKpv0lkPp8cDLGBaa14U8+PvTPsF5pSW3LgLJGTwNp?=
 =?us-ascii?Q?CgW5BvtCe15WDXU0Oh50iWplSefF8w0sJE14tWn+6VO/YUK3nTGhfdTaou7s?=
 =?us-ascii?Q?kRmRPL9o0vaXAYWUcLr0PH9gdLLJa1me1j09pnWmtqBo4zm6PKHoJvcvS8Bk?=
 =?us-ascii?Q?oEKaAh4of73GdsSm+V03EyycbtLes/sg+E7CqTXGkiXA3DOZJgzOPa46wnuM?=
 =?us-ascii?Q?m1oXKKwsVH2+llPBY2omf4CwlgkirXzj7cfc+ASOCh/1ao9D7AUzp2yIZuGP?=
 =?us-ascii?Q?1EVs+aukjQdEqPwEgBxZbKUmDNKtdPQ6ecrRCElFhlOdcpXkA6vFqZZl+O+N?=
 =?us-ascii?Q?PZLa2HMDMwbSMIrbmZiMFOEvZoY7Gcw7D1MMtoMnGeSqNL6nwkulsK/0v+AX?=
 =?us-ascii?Q?1TPNASWmkYaPv7fQgAT88PeaqPLMEYfTh4rDs3fnfbk8hSHYHcv1mDnO/h3a?=
 =?us-ascii?Q?ouHuOWv742NVuyhFFTsD7Qo6upMy3PJbzoM02zVTmfAUKvSzkoYbb96zE/Z8?=
 =?us-ascii?Q?R20cRdfkagk1Wz/3YrihyKlrtZNkVqjUoOin/nqaS3O1iLDCV4Qfbi20VlJ6?=
 =?us-ascii?Q?r2EIF8aVxkO6zbNUTHMaefSyvooQ8lmXWqDIhNrn0rf/qOlsOu/tLFJmEu8K?=
 =?us-ascii?Q?2pN78JLlGIfjvPQSi7wWdzCuUhNwDxDsyT7NjG9gybKuWaFxdE8kwa3n/56+?=
 =?us-ascii?Q?FVuHW8rRTyfxBAHnGycyfIj3xUuFqeKhVqN+QR3PRwDwO2KHFLp6Kud1qCkd?=
 =?us-ascii?Q?K+FzlZfhEjdAKUAGwF44m6Zj/n57FXVUtWch92N0lSKGRlDEarmwv/ZamLXc?=
 =?us-ascii?Q?wjp4C46Aba/ViRHK+MpB0mU4/Idf8OmBvi5ymNK3ylG0phTOpxEXCuaxZkRO?=
 =?us-ascii?Q?6jESCJiBK+96JQYWHRf2WXaZraGVg9Et4cRoPhrRJbwUwOYL6x7+PL4BFg0D?=
 =?us-ascii?Q?yao5NcwV3jv9xtWlcfBpIXRhylPnUvj1EfloGn06WlspaxXDy0ZW2dV6rLIa?=
 =?us-ascii?Q?IY3HFX7gqPiDk+j2GwwRzB/+qf5aSyYOkicLQICD1m2dZYJTGJGsWBq4njsZ?=
 =?us-ascii?Q?Q3GaIH3Zwtz7W7sS7gchimRp3QiiX0T5XWtXSiRN27PYsA/C0fOgTqMwQ9Uc?=
 =?us-ascii?Q?LBqHmMiE6+T7RCoUbOdpJtXikik31tbFOoUv7FFCplXDmQUYj8eI6yXUom8h?=
 =?us-ascii?Q?4kXiPXbkyzuDVY21ZaBTTJfgHclVec0nK29sb0VTseqF2r7NKAkpvmUzLjih?=
 =?us-ascii?Q?HIgjhsWdZ8D7CQv3J5ks8Zk=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4b58e9bb-9c40-4b7e-d62e-08d9bfe09dde
X-MS-Exchange-CrossTenant-AuthSource: MN2PR10MB4013.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Dec 2021 15:36:09.3716 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fzLcLeP3TpidvzCUyWgc9Oct+EHsBrJr94SnpSKC8nLTtI6IplyVQwTMG/xcYC37lhmQSnHbLeonji+8hR7+Ug==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BLAPR10MB5282
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10198
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0
 bulkscore=0 spamscore=0
 mlxlogscore=999 suspectscore=0 adultscore=0 malwarescore=0 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2110150000
 definitions=main-2112150088
X-Proofpoint-ORIG-GUID: sGKuAL_-AK43UTZLYkTN839lOJNiBTwk
X-Proofpoint-GUID: sGKuAL_-AK43UTZLYkTN839lOJNiBTwk
Received-SPF: pass client-ip=205.220.165.32; envelope-from=jag.raman@oracle.com;
 helo=mx0a-00069f02.pphosted.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: elena.ufimtseva@oracle.com, john.g.johnson@oracle.com, thuth@redhat.com,
 jag.raman@oracle.com, bleal@redhat.com, swapnil.ingle@nutanix.com,
 john.levon@nutanix.com, philmd@redhat.com, wainersm@redhat.com,
 alex.williamson@redhat.com, thanos.makatos@nutanix.com,
 marcandre.lureau@gmail.com, stefanha@redhat.com, crosa@redhat.com,
 pbonzini@redhat.com, alex.bennee@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Setup a handler to run vfio-user context. The context is driven by
messages to the file descriptor associated with it - get the fd for
the context and hook up the handler with it

Signed-off-by: Elena Ufimtseva <elena.ufimtseva@oracle.com>
Signed-off-by: John G Johnson <john.g.johnson@oracle.com>
Signed-off-by: Jagannathan Raman <jag.raman@oracle.com>
---
 hw/remote/vfio-user-obj.c | 80 ++++++++++++++++++++++++++++++++++++++-
 1 file changed, 79 insertions(+), 1 deletion(-)

diff --git a/hw/remote/vfio-user-obj.c b/hw/remote/vfio-user-obj.c
index bcbea59bf1..a01a0ad185 100644
--- a/hw/remote/vfio-user-obj.c
+++ b/hw/remote/vfio-user-obj.c
@@ -42,10 +42,12 @@
 #include "qapi/error.h"
 #include "qapi/qapi-visit-sockets.h"
 #include "qemu/notify.h"
+#include "qemu/thread.h"
 #include "sysemu/sysemu.h"
 #include "libvfio-user.h"
 #include "hw/qdev-core.h"
 #include "hw/pci/pci.h"
+#include "qemu/timer.h"
 
 #define TYPE_VFU_OBJECT "x-vfio-user-server"
 OBJECT_DECLARE_TYPE(VfuObject, VfuObjectClass, VFU_OBJECT)
@@ -73,6 +75,8 @@ struct VfuObject {
     vfu_ctx_t *vfu_ctx;
 
     PCIDevice *pci_dev;
+
+    int vfu_poll_fd;
 };
 
 static void vfu_object_init_ctx(VfuObject *o, Error **errp);
@@ -114,6 +118,62 @@ static void vfu_object_set_device(Object *obj, const char *str, Error **errp)
     vfu_object_init_ctx(o, errp);
 }
 
+static void vfu_object_ctx_run(void *opaque)
+{
+    VfuObject *o = opaque;
+    int ret = -1;
+
+    while (ret != 0) {
+        ret = vfu_run_ctx(o->vfu_ctx);
+        if (ret < 0) {
+            if (errno == EINTR) {
+                continue;
+            } else if (errno == ENOTCONN) {
+                qemu_set_fd_handler(o->vfu_poll_fd, NULL, NULL, NULL);
+                o->vfu_poll_fd = -1;
+                object_unparent(OBJECT(o));
+                break;
+            } else {
+                error_setg(&error_abort, "vfu: Failed to run device %s - %s",
+                           o->device, strerror(errno));
+                 break;
+            }
+        }
+    }
+}
+
+static void vfu_object_attach_ctx(void *opaque)
+{
+    VfuObject *o = opaque;
+    GPollFD pfds[1];
+    int ret;
+
+    qemu_set_fd_handler(o->vfu_poll_fd, NULL, NULL, NULL);
+
+    pfds[0].fd = o->vfu_poll_fd;
+    pfds[0].events = G_IO_IN | G_IO_HUP | G_IO_ERR;
+
+retry_attach:
+    ret = vfu_attach_ctx(o->vfu_ctx);
+    if (ret < 0 && (errno == EAGAIN || errno == EWOULDBLOCK)) {
+        qemu_poll_ns(pfds, 1, 500 * (int64_t)SCALE_MS);
+        goto retry_attach;
+    } else if (ret < 0) {
+        error_setg(&error_abort,
+                   "vfu: Failed to attach device %s to context - %s",
+                   o->device, strerror(errno));
+        return;
+    }
+
+    o->vfu_poll_fd = vfu_get_poll_fd(o->vfu_ctx);
+    if (o->vfu_poll_fd < 0) {
+        error_setg(&error_abort, "vfu: Failed to get poll fd %s", o->device);
+        return;
+    }
+
+    qemu_set_fd_handler(o->vfu_poll_fd, vfu_object_ctx_run, NULL, o);
+}
+
 /*
  * TYPE_VFU_OBJECT depends on the availability of the 'socket' and 'device'
  * properties. It also depends on devices instantiated in QEMU. These
@@ -151,7 +211,8 @@ static void vfu_object_init_ctx(VfuObject *o, Error **errp)
         return;
     }
 
-    o->vfu_ctx = vfu_create_ctx(VFU_TRANS_SOCK, o->socket->u.q_unix.path, 0,
+    o->vfu_ctx = vfu_create_ctx(VFU_TRANS_SOCK, o->socket->u.q_unix.path,
+                                LIBVFIO_USER_FLAG_ATTACH_NB,
                                 o, VFU_DEV_TYPE_PCI);
     if (o->vfu_ctx == NULL) {
         error_setg(errp, "vfu: Failed to create context - %s", strerror(errno));
@@ -183,6 +244,21 @@ static void vfu_object_init_ctx(VfuObject *o, Error **errp)
         goto fail;
     }
 
+    ret = vfu_realize_ctx(o->vfu_ctx);
+    if (ret < 0) {
+        error_setg(errp, "vfu: Failed to realize device %s- %s",
+                   o->device, strerror(errno));
+        goto fail;
+    }
+
+    o->vfu_poll_fd = vfu_get_poll_fd(o->vfu_ctx);
+    if (o->vfu_poll_fd < 0) {
+        error_setg(errp, "vfu: Failed to get poll fd %s", o->device);
+        goto fail;
+    }
+
+    qemu_set_fd_handler(o->vfu_poll_fd, vfu_object_attach_ctx, NULL, o);
+
     return;
 
 fail:
@@ -208,6 +284,8 @@ static void vfu_object_init(Object *obj)
                    TYPE_VFU_OBJECT, TYPE_REMOTE_MACHINE);
         return;
     }
+
+    o->vfu_poll_fd = -1;
 }
 
 static void vfu_object_finalize(Object *obj)
-- 
2.20.1


