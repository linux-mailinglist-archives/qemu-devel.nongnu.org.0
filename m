Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1781F4942B6
	for <lists+qemu-devel@lfdr.de>; Wed, 19 Jan 2022 23:01:46 +0100 (CET)
Received: from localhost ([::1]:52050 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nAJ1V-0006uY-6I
	for lists+qemu-devel@lfdr.de; Wed, 19 Jan 2022 17:01:45 -0500
Received: from eggs.gnu.org ([209.51.188.92]:58350)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jag.raman@oracle.com>)
 id 1nAIjQ-00083I-Or
 for qemu-devel@nongnu.org; Wed, 19 Jan 2022 16:43:07 -0500
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32]:17258)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jag.raman@oracle.com>)
 id 1nAIjJ-0007LM-2V
 for qemu-devel@nongnu.org; Wed, 19 Jan 2022 16:43:02 -0500
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 20JJPAPf032601; 
 Wed, 19 Jan 2022 21:42:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references :
 content-transfer-encoding : content-type : mime-version;
 s=corp-2021-07-09; bh=hcAm8Ou2NGwtdnTeIh2r4xjRA/UjBUC9LZPE1HxivcM=;
 b=p39sTncQJC6LxJnFSxtwGLtbxvQ11Dgy7RqYzxv7z3oq1QIpJLGEkZ1GSgyy/pG+3I0R
 FfEMEkhrtakPDccoiVUGzwq0nPQHPpQVhsg0tkoIxS51yT+gpxJcQzRSJu1XnlNLepJr
 5cN6eqPo0gsIxwpyNdvVDr+XtDSON8ViQ6HQ4uWfiV5SDH1mHKrrRWUuDM1f9kqkNXML
 t2opeebusjghz7QV3x8+QRAPXFXpXUB8IpNur3TGF5MuWig663wmnMBG+5touZeXkGAF
 Cyn0eH6ZXjilf7LTZw5RKaeXWBf+CcmV2XjAPFvnbnQdBFfEJihzZaj5eUDdSnYi2oZq XA== 
Received: from aserp3030.oracle.com (aserp3030.oracle.com [141.146.126.71])
 by mx0b-00069f02.pphosted.com with ESMTP id 3dnc4q6hxp-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 19 Jan 2022 21:42:54 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
 by aserp3030.oracle.com (8.16.1.2/8.16.1.2) with SMTP id 20JLautH147107;
 Wed, 19 Jan 2022 21:42:54 GMT
Received: from nam12-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam12lp2177.outbound.protection.outlook.com [104.47.59.177])
 by aserp3030.oracle.com with ESMTP id 3dkmaeb6v5-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 19 Jan 2022 21:42:53 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lVmVLJy4fQiZx/GALP94wniXVWnIPbqkz8T9ZbfgoFMpUuhDBmeTLGzmb1dIDoFixG/QEO/St8vU8K6lejlT62w/S0a0Ufh/S2ntaiP7kG1s0BWAF+4kCXFM3jONzGeFtGmD4yemdTceN2a+jLS1vuTP1RhW19rmehAIkIO9Q9L0eEKDfnToEzuVkV3Uq2TgJXu5vH1pArHP7W8Z7bUbdbIN10aeHVfeBZ4ReBJgJgwnKPiz/uYKACiNBIsimnmiuwysIrkqka/1AgSOnZlZ4nJ2hQDeG8luJ11srVhUsqFvVHdZE5m/JwkA0vun4SCSe580wB69JYJM7N/Wldve2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hcAm8Ou2NGwtdnTeIh2r4xjRA/UjBUC9LZPE1HxivcM=;
 b=b+KSH2GzPKkKahNSCg9pc1WO+qHBF6gjLLSR7DYQl5w88xqXdGjJKCzB62hlOd7QsIdDsh6MoZlRgoScEVdna9fGdmbi7lMJr8iQ/NIk9GIrY+6DW8SPDVyChYDzW7NRY1jRncMX6RSR2GJTDblCqBmuhG5u5poiL40W2AFY6LRWbEnszK/j5yXyNjIqlYNfeicIvERjejbeH2N/kYkvDx7yGQfANlYje+8qhs/vMSRINCcSxfiqz6RnpEni7PvSZRIn/oAGY56b/dYAlyCBzvWClpxcdIm1uSuNt2jN/Up/tjc2gULcibdotg34pbrb9q7j/NFlaUB6rzy1p+PtNQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hcAm8Ou2NGwtdnTeIh2r4xjRA/UjBUC9LZPE1HxivcM=;
 b=BORxLFyig4nMUUjZs1uHfScqMMR3BBgfS5MiuMDPBpI+eh51JBiW3PgPST937cMfw32UPa51W9AB0L2M7X2nKbs6EAK0wVwwJdKDhN8vImctuFT1l/mQ5UqBDWy3xH4W8DhZ+PRxdxriskerDs/9FLCIDozKn5IZHcJM4fUKw7c=
Received: from MN2PR10MB4013.namprd10.prod.outlook.com (2603:10b6:208:185::25)
 by SA1PR10MB5887.namprd10.prod.outlook.com (2603:10b6:806:22b::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4909.7; Wed, 19 Jan
 2022 21:42:52 +0000
Received: from MN2PR10MB4013.namprd10.prod.outlook.com
 ([fe80::98b1:4348:5117:5fc]) by MN2PR10MB4013.namprd10.prod.outlook.com
 ([fe80::98b1:4348:5117:5fc%7]) with mapi id 15.20.4888.014; Wed, 19 Jan 2022
 21:42:52 +0000
From: Jagannathan Raman <jag.raman@oracle.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 10/18] vfio-user: instantiate vfio-user context
Date: Wed, 19 Jan 2022 16:41:59 -0500
Message-Id: <66bb8c18bb5372f72aaa66d62f09258ec7775100.1642626515.git.jag.raman@oracle.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <cover.1642626515.git.jag.raman@oracle.com>
References: <cover.1642626515.git.jag.raman@oracle.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BYAPR08CA0043.namprd08.prod.outlook.com
 (2603:10b6:a03:117::20) To MN2PR10MB4013.namprd10.prod.outlook.com
 (2603:10b6:208:185::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 9d7daa0f-1e26-4d0f-5241-08d9db94a4f0
X-MS-TrafficTypeDiagnostic: SA1PR10MB5887:EE_
X-Microsoft-Antispam-PRVS: <SA1PR10MB58877B9C674D0B7D1D61529490599@SA1PR10MB5887.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:179;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: m9Nq7x5OE8K9QcgXbJ2fxhLCO4Dm92LlpDrwWEPu7AbuUveOq+D0XE7NmjggwdXEJxLPeYtOXA3+kV7wfE24lBEwM+3nBr2yvbnJvQbDJCfuX0BV9q9rnQwisMBfb8ShmhRYzq0E/EPTBrdWCBwXY/IIWkxlQu0as+KVHmnFajXX2PHLqKFWGq03KSN+J5qzqu7TOPIX0Goy81doKkAFzm4NCVZtyieaCC8/4jXAgCSwywmSJkPW3lLCm7OhR71WjpaHev9FeJEpDB1mas5MeByJNQw+qtEUCsy5mCYG6lWfJsMLDkTM4No5ttAo2iks3Rz5y0zPFikMUsF4Vb9guLHjupxbB4KbbJLTXjuBG01MKDFofjxwB1Bs/fbJz7OeihedfmtX1iUjaiU3wBa1Yi3BF8DYFpXzugYkqW5cuX3rLRO9XW075h/B12XXqRlXt6zIQk9ffZri60AjWz3SzJlWLHZL6/qXjigSpsMf3eP8Ei5eGhlFh8l7lBVD4205bViD2jnp2z+IYWZjpucNsFhKhGMs8X0HRRxgCWen05+cmtZR3z0ZTOlr6Rc97IQ1MRPG//VxzxdmOoGFHNMfKJKWce9gwTkiK4NouwMTfhpAaDANb0kC7d6AYNMSqDKbReL2ff1o62eT0EDejh+GJqI7zrvFa1Qri8diVOUkqFaEqVpnwlzpOLCAYd/po2+5qQTry1OeQvDt5ZN8CSKJXQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR10MB4013.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(5660300002)(186003)(6916009)(508600001)(66946007)(66556008)(26005)(7416002)(4326008)(66476007)(86362001)(107886003)(8936002)(38100700002)(38350700002)(8676002)(36756003)(83380400001)(6486002)(2616005)(6512007)(2906002)(6506007)(316002)(52116002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?v9vwbkLHFUMexE61toApt/NvM7SkHhJMF7slK/NwoUJsp565uN3yJkSRk4xD?=
 =?us-ascii?Q?gMXcrxQSfr0aVIXOghNagpgTfnca0syq/6ycBiIXneqzn8n1qTlFDr7QwzhS?=
 =?us-ascii?Q?BSIL5cQ8uKHbvIcTQrJgSUUU76mLnmmIngHY4VkweDN8xa2RyssxVO7SLZ+8?=
 =?us-ascii?Q?iv7EosBo6GgbNq1BH+rB7+skkkvdYZdWMYtj+2zlCQ5makb8m54Vo6mN+wUK?=
 =?us-ascii?Q?WC+v+HYrxnkuv72+Sez0E2bP/q5QiJgEFKzIRpD/n8s+ctbdwP7O6dwXt73H?=
 =?us-ascii?Q?2yjyIgoxd2QT+OWXFCJyC+VrEJA6M0YX30ItNPdodnGAUB7K8gxd8dPtEP9F?=
 =?us-ascii?Q?dSDrtkpUO084lM623NkmxlJ5sF+xU/sR92+4n8+tGtP0BviXs/5nURMdAdny?=
 =?us-ascii?Q?+tWMZmXMUnh9O5bMc0gLd4BjieJ7wvpk+6hqlsqzpb8StwyLcevGwew6/nwl?=
 =?us-ascii?Q?jq9C1HSTxDsdiDonNE2Ols8DZscJ1bo2ZW9btAps3+2op6a6ycLXOQhbdn/F?=
 =?us-ascii?Q?7R/5Tm7Ghx0mhePEAU6kDr9A+bwpDasXma5UDQ+1KQb0Ewh7NvknNyl9Scby?=
 =?us-ascii?Q?dGdUsoSLM+inuKtUICXAUCtdmBY4hWgfq70wW2CK8sES+tU+LiQkUxlEbUI0?=
 =?us-ascii?Q?nH0dwheIFnsYKFNDWH7/aKXVBFPBJ7Au5jpgBsv1OASoaxkw41LGldFy0LG1?=
 =?us-ascii?Q?MgPNGoJkIDdu8EQ8lnKLZjdG+Imrl/JoupnKDx8KvGeiHLemMvVAOtdRGIha?=
 =?us-ascii?Q?n0zM9hHW7y9axaGqIUi6ZFLpltvLpyj5SsCRpZTKvrr8ICAh1AiLv2rtKIQ2?=
 =?us-ascii?Q?psi2T7gZRdE8zZdQr7YEqNXUM56MHIoEKSbpoV7khSvnmTm3WxyjuSI1JNJI?=
 =?us-ascii?Q?tqjO0Nsv5/Ua2SphefvmqgSqJ7CZQ3que13qzMBmhzG6SYut6ThdDPwNFLMt?=
 =?us-ascii?Q?34CXcQtEgfL6UNDTOGOyMBVU1t65wP5uoIQ25HHL2Q5EtPETvvH0jBqTs7YQ?=
 =?us-ascii?Q?U3EDUBUW2dKk0xe4QvCahhLK/BL5mCXKrsiOPALrYzGo3gBhmz8HLf40KVt3?=
 =?us-ascii?Q?oWiZZhi9wrjmBpIdLSiBLev+ToqLITEtcNi5Fnk4SFeaUHPrGJ8XZrCuOdBS?=
 =?us-ascii?Q?Z5mcn9X2nzI1kzgqXgLDme7TzqhrURFU2vSoIe1cSZLT3vsy0+f4jfUN2PhB?=
 =?us-ascii?Q?1Kdu79uRLRXvSJjuedstL2nsPxvj9763lOrj4X5GWIG6kgCT6rhvMlEp1J0I?=
 =?us-ascii?Q?Al6JRyx5U5nj3hXQJJdvTFlcdNIQcvWH5ripV6pLP/jdyU8Efvx7X7WZk9FS?=
 =?us-ascii?Q?axS69vwF9oZXWJ3eWUbQSVV+66ePk5oUusl77dJ7ACZZZBXgscoPPfwQDtDg?=
 =?us-ascii?Q?kPuyCzSPx+ty4Lq4qOT4oMabHqUPT5LVSX6zHhThXzJFRYAAkXQwIKJ62R1H?=
 =?us-ascii?Q?ETsiY++DZ0QSw7gMmGJOEOXuEu29U51wuNj66QBfNjTzHvb3yQUuITahfCuM?=
 =?us-ascii?Q?Tif2aAMOn3GFUqmEqsy6X++Jpl4wab0AVYVlf+NWgK+sDoSlqNI9tUnr3/6+?=
 =?us-ascii?Q?oNp0/mJuskhdP1O2JrLQiWNT0G3xCw+T60J/OyiuUy5szU+2MohB2xDIbD7l?=
 =?us-ascii?Q?3tEspB546FHHG4OuJkg3x2U=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9d7daa0f-1e26-4d0f-5241-08d9db94a4f0
X-MS-Exchange-CrossTenant-AuthSource: MN2PR10MB4013.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jan 2022 21:42:51.9897 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xXzQiDx9QYJ5Y1kG4Qb/Bu1oF6F3bpSn5HOEEZ1IrLzwh08L3n0Or3eJ1Cum2VWqeetYJo5hPNcb6f0TKA8hlg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR10MB5887
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10232
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0
 mlxscore=0 suspectscore=0
 phishscore=0 malwarescore=0 mlxlogscore=999 spamscore=0 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2110150000
 definitions=main-2201190117
X-Proofpoint-GUID: _LP2CEu6Z8rrBLVbx2JLdQhpo8Sjw1X1
X-Proofpoint-ORIG-GUID: _LP2CEu6Z8rrBLVbx2JLdQhpo8Sjw1X1
Received-SPF: pass client-ip=205.220.177.32; envelope-from=jag.raman@oracle.com;
 helo=mx0b-00069f02.pphosted.com
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
Cc: eduardo@habkost.net, elena.ufimtseva@oracle.com, john.g.johnson@oracle.com,
 berrange@redhat.com, bleal@redhat.com, john.levon@nutanix.com, mst@redhat.com,
 armbru@redhat.com, quintela@redhat.com, f4bug@amsat.org,
 marcandre.lureau@gmail.com, stefanha@redhat.com, thanos.makatos@nutanix.com,
 pbonzini@redhat.com, jag.raman@oracle.com, eblake@redhat.com,
 dgilbert@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

create a context with the vfio-user library to run a PCI device

Signed-off-by: Elena Ufimtseva <elena.ufimtseva@oracle.com>
Signed-off-by: John G Johnson <john.g.johnson@oracle.com>
Signed-off-by: Jagannathan Raman <jag.raman@oracle.com>
---
 hw/remote/vfio-user-obj.c | 78 +++++++++++++++++++++++++++++++++++++++
 1 file changed, 78 insertions(+)

diff --git a/hw/remote/vfio-user-obj.c b/hw/remote/vfio-user-obj.c
index 80757b0029..810a7c3943 100644
--- a/hw/remote/vfio-user-obj.c
+++ b/hw/remote/vfio-user-obj.c
@@ -41,6 +41,9 @@
 #include "hw/remote/machine.h"
 #include "qapi/error.h"
 #include "qapi/qapi-visit-sockets.h"
+#include "qemu/notify.h"
+#include "sysemu/sysemu.h"
+#include "libvfio-user.h"
 
 #define TYPE_VFU_OBJECT "x-vfio-user-server"
 OBJECT_DECLARE_TYPE(VfuObject, VfuObjectClass, VFU_OBJECT)
@@ -82,13 +85,23 @@ struct VfuObject {
     char *device;
 
     Error *err;
+
+    Notifier machine_done;
+
+    vfu_ctx_t *vfu_ctx;
 };
 
+static void vfu_object_init_ctx(VfuObject *o, Error **errp);
+
 static void vfu_object_set_socket(Object *obj, Visitor *v, const char *name,
                                   void *opaque, Error **errp)
 {
     VfuObject *o = VFU_OBJECT(obj);
 
+    if (o->vfu_ctx) {
+        return;
+    }
+
     qapi_free_SocketAddress(o->socket);
 
     o->socket = NULL;
@@ -104,17 +117,68 @@ static void vfu_object_set_socket(Object *obj, Visitor *v, const char *name,
     }
 
     trace_vfu_prop("socket", o->socket->u.q_unix.path);
+
+    vfu_object_init_ctx(o, errp);
 }
 
 static void vfu_object_set_device(Object *obj, const char *str, Error **errp)
 {
     VfuObject *o = VFU_OBJECT(obj);
 
+    if (o->vfu_ctx) {
+        return;
+    }
+
     g_free(o->device);
 
     o->device = g_strdup(str);
 
     trace_vfu_prop("device", str);
+
+    vfu_object_init_ctx(o, errp);
+}
+
+/*
+ * TYPE_VFU_OBJECT depends on the availability of the 'socket' and 'device'
+ * properties. It also depends on devices instantiated in QEMU. These
+ * dependencies are not available during the instance_init phase of this
+ * object's life-cycle. As such, the server is initialized after the
+ * machine is setup. machine_init_done_notifier notifies TYPE_VFU_OBJECT
+ * when the machine is setup, and the dependencies are available.
+ */
+static void vfu_object_machine_done(Notifier *notifier, void *data)
+{
+    VfuObject *o = container_of(notifier, VfuObject, machine_done);
+    Error *err = NULL;
+
+    vfu_object_init_ctx(o, &err);
+
+    if (err) {
+        error_propagate(&error_abort, err);
+    }
+}
+
+static void vfu_object_init_ctx(VfuObject *o, Error **errp)
+{
+    ERRP_GUARD();
+
+    if (o->vfu_ctx || !o->socket || !o->device ||
+            !phase_check(PHASE_MACHINE_READY)) {
+        return;
+    }
+
+    if (o->err) {
+        error_propagate(errp, o->err);
+        o->err = NULL;
+        return;
+    }
+
+    o->vfu_ctx = vfu_create_ctx(VFU_TRANS_SOCK, o->socket->u.q_unix.path, 0,
+                                o, VFU_DEV_TYPE_PCI);
+    if (o->vfu_ctx == NULL) {
+        error_setg(errp, "vfu: Failed to create context - %s", strerror(errno));
+        return;
+    }
 }
 
 static void vfu_object_init(Object *obj)
@@ -124,6 +188,11 @@ static void vfu_object_init(Object *obj)
 
     k->nr_devs++;
 
+    if (!phase_check(PHASE_MACHINE_READY)) {
+        o->machine_done.notify = vfu_object_machine_done;
+        qemu_add_machine_init_done_notifier(&o->machine_done);
+    }
+
     if (!object_dynamic_cast(OBJECT(current_machine), TYPE_REMOTE_MACHINE)) {
         error_setg(&o->err, "vfu: %s only compatible with %s machine",
                    TYPE_VFU_OBJECT, TYPE_REMOTE_MACHINE);
@@ -142,6 +211,10 @@ static void vfu_object_finalize(Object *obj)
 
     o->socket = NULL;
 
+    if (o->vfu_ctx) {
+        vfu_destroy_ctx(o->vfu_ctx);
+    }
+
     g_free(o->device);
 
     o->device = NULL;
@@ -149,6 +222,11 @@ static void vfu_object_finalize(Object *obj)
     if (!k->nr_devs && k->auto_shutdown) {
         qemu_system_shutdown_request(SHUTDOWN_CAUSE_GUEST_SHUTDOWN);
     }
+
+    if (o->machine_done.notify) {
+        qemu_remove_machine_init_done_notifier(&o->machine_done);
+        o->machine_done.notify = NULL;
+    }
 }
 
 static void vfu_object_class_init(ObjectClass *klass, void *data)
-- 
2.20.1


