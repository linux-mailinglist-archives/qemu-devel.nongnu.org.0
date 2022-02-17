Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5490B4B9AAB
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Feb 2022 09:12:58 +0100 (CET)
Received: from localhost ([::1]:51740 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nKbuJ-0004aE-QR
	for lists+qemu-devel@lfdr.de; Thu, 17 Feb 2022 03:12:57 -0500
Received: from eggs.gnu.org ([209.51.188.92]:42864)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jag.raman@oracle.com>)
 id 1nKbXq-0003nP-3N
 for qemu-devel@nongnu.org; Thu, 17 Feb 2022 02:49:42 -0500
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32]:6230)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jag.raman@oracle.com>)
 id 1nKbXk-0004S0-3q
 for qemu-devel@nongnu.org; Thu, 17 Feb 2022 02:49:41 -0500
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 21H5WxbF009086; 
 Thu, 17 Feb 2022 07:49:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references :
 content-transfer-encoding : content-type : mime-version;
 s=corp-2021-07-09; bh=MuKtwV7QfwaDxGzR3anOvz62SddgjVoSqiVi7p7VYbw=;
 b=r2z/IgGoQ0QAJ0JOWymVz2WtkqztKyqOIqmkPXnX1CTgH9bha5tKb9wfaiwHlshPFgbl
 0MNLfZ5U3zCoTlwmdwmgEXtwiErPJZUEeSK6pyL6BF8a/3nt9sdPwaVoiTZcXToAUNdE
 XRPOlqg3lpvWJn97o6q09eJQK55kiJcVySvdxwlEFJL5xbs6FD9zRv3ay6G/uo7wdmsW
 j3iXeIL+liqejNDu7ainzp/PNDwU6z39VV9gC7eZNyK+cpnCq761EDjub5xe1lRbCbDg
 FrQ6n8zi78NHJifvuHKMma5TLYTppjU5lFK/pXZd1caGcQzCCwGuPUi0kQeEbvu6UbW/ eQ== 
Received: from aserp3030.oracle.com (aserp3030.oracle.com [141.146.126.71])
 by mx0b-00069f02.pphosted.com with ESMTP id 3e8nb3mhr4-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 17 Feb 2022 07:49:33 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
 by aserp3030.oracle.com (8.16.1.2/8.16.1.2) with SMTP id 21H7gaTb088416;
 Thu, 17 Feb 2022 07:49:32 GMT
Received: from nam11-co1-obe.outbound.protection.outlook.com
 (mail-co1nam11lp2173.outbound.protection.outlook.com [104.47.56.173])
 by aserp3030.oracle.com with ESMTP id 3e9brc0r8u-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 17 Feb 2022 07:49:31 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GBei6jqUVRJDT3RBteHQdYt7c+MyOWDwsEBJ6kb/hW3IQx69gmtQC4Ct910ieED6BWnDKIpqX+GQ12zcxJSVJnsGrPlLnhzYRGjStwtFpNgoPIqcAuqiYm/PrXYvv4VBPqhki8SNpV4GBia72mBuOP4wCbSbj1O1Ud2fOJm2SCjyrN9jtHy7zjo+kUZLqgYBXatHYuVKOj2PCd2QGpkcFm+hMqj3cJG6osMDyxO/a9xnd6juGm9Mf3PoWwFMQcchfuTYT3xVGFmzKDUKr9Xodtwviy2gh5IXtP5Ei5g4LZI+GxuCtzm7Xj0VpoX0EvvlmcgzxTec5jyXIXsDdCINGQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MuKtwV7QfwaDxGzR3anOvz62SddgjVoSqiVi7p7VYbw=;
 b=Vgi5IYV4YiYHKoMJovXodSgSqwIGkTH5/2nfHvwoMK/31g8MouswNXsGLuAgdi4Z9oXGJes4BVzeAV2u/qiO9I4Bv6XOMPVG6LjeN4p+e18T/E5QR0yHpNo/O6PrcMZ3FN90jyAxX9H5srFSwO08/7xiZWiFon6azvsLDgkcGddk3FpxG5BQn8BY0VuaJb9Qt6FX7GP4tw0LU9/LBX2FvPirG9D10za5PiBZAL1f0RqO3QieOxZDAn0uOzPpZE7zQCJ7UPlNe0BSjTsSQLrYuHg8vlFRq8jWBVx2+w6dEp91gGmCRPcapbyS1xBf3TC3VmEfNGfUL87ahMmYefmTLQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MuKtwV7QfwaDxGzR3anOvz62SddgjVoSqiVi7p7VYbw=;
 b=NO2cTHTfpX1vgGo/wrtETl7HVYHtcNT2Brg7gepAQkvegp6iHRSNFMWx7kKXSk+VpCdl+ueZQmZnyeMMBf1ziCCDZh9TutgDqzZ5U2ya4q2L/7zgYIPeEY+VPzMntWsq2s8r7PA4B9ZxLY3K6qsuUAUrnTEKnz1M7mkl+o2UmrE=
Received: from CH2PR10MB4008.namprd10.prod.outlook.com (2603:10b6:610:c::22)
 by DM6PR10MB3211.namprd10.prod.outlook.com (2603:10b6:5:1a6::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4975.17; Thu, 17 Feb
 2022 07:49:29 +0000
Received: from CH2PR10MB4008.namprd10.prod.outlook.com
 ([fe80::8062:cb07:e437:1bfe]) by CH2PR10MB4008.namprd10.prod.outlook.com
 ([fe80::8062:cb07:e437:1bfe%6]) with mapi id 15.20.4995.016; Thu, 17 Feb 2022
 07:49:29 +0000
From: Jagannathan Raman <jag.raman@oracle.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v6 08/19] vfio-user: instantiate vfio-user context
Date: Thu, 17 Feb 2022 02:48:55 -0500
Message-Id: <f299f4ceb5b3c49ee95176a7206bc1e63e190bc1.1645079934.git.jag.raman@oracle.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <cover.1645079934.git.jag.raman@oracle.com>
References: <cover.1645079934.git.jag.raman@oracle.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SA9PR10CA0002.namprd10.prod.outlook.com
 (2603:10b6:806:a7::7) To CH2PR10MB4008.namprd10.prod.outlook.com
 (2603:10b6:610:c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: df5250a6-1857-4452-8b78-08d9f1ea072e
X-MS-TrafficTypeDiagnostic: DM6PR10MB3211:EE_
X-Microsoft-Antispam-PRVS: <DM6PR10MB32115CD44B9B96DF8CE781F190369@DM6PR10MB3211.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:179;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ErhQMZDf37zo98657vUqDxUFei4hxYDFA2cUQQJwhIPIW7itEA8PoL3E829mtVa7Bqe1EusRWiWsQuvAF/YAWv90W80vtn9lIxitw3VdKOS9xeNdVAY92eZuPdttrQznIY0g1jmAfho0snMK3Ix0enqhNmwXtUG5iGGan3t5HfIV0Ge8Fe/56ERBK28H2+5Y6s91iSKD1lmo24fpVu7TBB0IT6wNhpwTTeGO6SlfP3hqTGATkyz2NmWjU0hyRCN6lmqM03PWD6txeDVkuaSXEkSIauxDUj7lKQLQQC+pxs9eOJk9dHjxrGd+dtVTnoiRHiffBWZ509qmw/ERzQ2DpzQUHhsZ2JYgnjw5Rt1iT27Wd2/Kwgv2nSz0jna7xzd+jUcyMby0QIbw/3gx4SZXHi4Gj4ZrDyYrYK2q3czLbWGwCSpoO9pHPyV2t1Yzi5rQa0Vl+yvBV+Srr4eYafjlVafosird3w0rYergs+aiJC/OqaBSyoFQlTASeWFZyNA8UXPFNGErM1iVzWsrcB1BxxfHjoKylDGTClcGtoyFELbwWcgpw/LspKJY+ZzZGMMiGdarZyA5lyVI0FLBM3UF/eN/59AykBnajXrPDhBFQEEvJd6Dogor9RMbosGYQkDIo4SlMr+G5BGivSdmANDBN2KypD2F3A36ymXJS5J8ETfomycjRs0WinH99BpzEfUSAFlNMtrHy0pFOBSOneT98A==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR10MB4008.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(83380400001)(186003)(66946007)(38350700002)(7416002)(4326008)(107886003)(26005)(66556008)(6916009)(8676002)(5660300002)(2616005)(8936002)(86362001)(38100700002)(66476007)(36756003)(316002)(508600001)(52116002)(6512007)(6506007)(2906002)(6666004)(6486002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?B+SigWyY1jCb4sxdSoc45kgOXUcnk2Yb6L0JaS+r/ZOK79qdij4/vYewakQ2?=
 =?us-ascii?Q?SAzMV50oNW2qZ1/OK8bd+UskV0fdz3+PM1r79AUkOKDwAxpJNL4QKw40ln4O?=
 =?us-ascii?Q?Rb8bpImhD7EHXYOHbsQSoO0VVQHNB6PLlbTv0w/2yNgielW7M6u0Kp7fQsyg?=
 =?us-ascii?Q?yj95D4m5cRugMC/92aSZcJXTRZEuvfr//c3Y7hTp5KvtRWbzQ22p27k3esdi?=
 =?us-ascii?Q?b0Ur8v9dmu+5+R09eOCcYfUsGqFzUXrjRb8s/k1pVZ4JCy/6+HHb8ywkndgi?=
 =?us-ascii?Q?9P2MShKEitwOmSxIbhSP6ytHzykmXcz3kaHsnRCy99pXma01yqn8C8LrzaL8?=
 =?us-ascii?Q?TdIoLZlxlUjRqT34u6Lme5AO+HhfoLahsrHvcrDsbtB6rg7FuOgolTuD77Uh?=
 =?us-ascii?Q?5/ONqU3cJrhD/NWVV7k7u209o1PuadUVcWTF7oo1mkwfZ97/xvClZMFv18Eu?=
 =?us-ascii?Q?5v4bunfE9Dg52k2WhGkGrO46XeBj1jgBOYQYLD+f/z1ZuiET+GX7WZJLA70t?=
 =?us-ascii?Q?6DXfsrR+jgLWiqKtL0PQtzBSrQUELoEFI68WZooY86x1+8tQ0gOzUWOVwbzp?=
 =?us-ascii?Q?JhNgoOa9gDJRe0BzoAyAfQrmG+vY3sziZRPXqTnBpFFsiFwJQ0I4ExyoWQvs?=
 =?us-ascii?Q?DWpg0ywAL/htJ5Ka9yJMqEWG3oqJ9KygBQeGsDzBf1MJNMZ5YuuNPlvoIYSz?=
 =?us-ascii?Q?Mild97womQ1d1cL67aLGwCua4YMr8nOzqY0SFKClTR2s/R8Sb/w1p3iEH9fz?=
 =?us-ascii?Q?d/yoIsuA+Ho90W6sdgX3TTDlmthIKIX8huo42bbVMa+5fujKjuNpkiJkX/Sj?=
 =?us-ascii?Q?ZmVmaTYElUbfoc5K+zYRvX7xeqbxJ1SQq3ukmWnxAKKM+yxB6f6e/wXkkLxT?=
 =?us-ascii?Q?80Yh0bLXxR990Uw/Lg5QsdMElZa3TdehFnzESesq1pkrYIh29tvDNFmpCDuL?=
 =?us-ascii?Q?nfPK8yk77dkrigNUKpolHhliz6szwD2Mv8LlJJlRO1jT4BJK5gxHu+ZHAm+S?=
 =?us-ascii?Q?Pm+x08sd7wjDQ4fzm/uGYNSEFyvTCYBSlbR+nyOm5Sg40WQM5vvSVvFlEpfY?=
 =?us-ascii?Q?Fbyitwko+jvezR4rUQgOH06lOZ81LgPvZIM9fiZmuwdlvvohy+1broj/2z3B?=
 =?us-ascii?Q?j7yoUrWpJHIeHvBdOmRFmgHmjLw7QeRp5Hgsa/TwUSSGH/12jw6Aue0MCbV6?=
 =?us-ascii?Q?LvB1jIHL30fBp0xsA7AqC9RXWD/g0Gj5xJ4UTaTewAn9KiHEqakllArXFvs6?=
 =?us-ascii?Q?slftU6BrIzZh86kI7Ku/sWE3uMgYTsmNtdpi9or7kkcXaLYjqtt4SVMPQ4YV?=
 =?us-ascii?Q?7d/uPodCjr62iXMazZSzSe+Si9ASN2KxMZAOvgIQpmeAoK+mk9iy6JSwrwEA?=
 =?us-ascii?Q?8Rj08cly2GaijZxTeqoUnL4Jhp0EPGa8H4goIE7MoXV3oxrpJ33sAkra+5A9?=
 =?us-ascii?Q?98PL5HJzRzvJmO+9AV1Qmk699y9LDSOb/f1z8p6ITaBZocBiUdx/Nhj/AjuV?=
 =?us-ascii?Q?Qk+9w+YenjW8f12u95QkdeN1qGDEzG/kAGtJrq0vYH/5ldlGThiYidMXvrtn?=
 =?us-ascii?Q?4AzRSH19P5fMS8BZGI1DhKxTDvtrn1g2yTgQsMWHdjFnuTzPCYL+L84QcCAW?=
 =?us-ascii?Q?thm/+Zbr4muf/xYwSUM803Y=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: df5250a6-1857-4452-8b78-08d9f1ea072e
X-MS-Exchange-CrossTenant-AuthSource: CH2PR10MB4008.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Feb 2022 07:49:29.5861 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Crp+ahbDTuHvhaojKL5h6Yhm37iqzz6iQGA/8MpUFftLerai7WcXSPVZ5/AGesWqBch2aBqycs78Sar9+sS2qg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR10MB3211
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10260
 signatures=675971
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0
 spamscore=0 phishscore=0
 suspectscore=0 mlxscore=0 mlxlogscore=999 malwarescore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2201110000
 definitions=main-2202170034
X-Proofpoint-GUID: CAHdcLMhoz96dBX7ktDdTDtsG2kjp4KQ
X-Proofpoint-ORIG-GUID: CAHdcLMhoz96dBX7ktDdTDtsG2kjp4KQ
Received-SPF: pass client-ip=205.220.177.32; envelope-from=jag.raman@oracle.com;
 helo=mx0b-00069f02.pphosted.com
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
Cc: eduardo@habkost.net, elena.ufimtseva@oracle.com, john.g.johnson@oracle.com,
 berrange@redhat.com, bleal@redhat.com, john.levon@nutanix.com, mst@redhat.com,
 armbru@redhat.com, quintela@redhat.com, f4bug@amsat.org,
 alex.williamson@redhat.com, kanth.ghatraju@oracle.com, stefanha@redhat.com,
 thanos.makatos@nutanix.com, pbonzini@redhat.com, jag.raman@oracle.com,
 eblake@redhat.com, dgilbert@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

create a context with the vfio-user library to run a PCI device

Signed-off-by: Elena Ufimtseva <elena.ufimtseva@oracle.com>
Signed-off-by: John G Johnson <john.g.johnson@oracle.com>
Signed-off-by: Jagannathan Raman <jag.raman@oracle.com>
---
 hw/remote/vfio-user-obj.c | 80 +++++++++++++++++++++++++++++++++++++++
 1 file changed, 80 insertions(+)

diff --git a/hw/remote/vfio-user-obj.c b/hw/remote/vfio-user-obj.c
index 84cd16c4ad..496e6c8038 100644
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
@@ -82,13 +85,24 @@ struct VfuObject {
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
+        error_setg(errp, "vfu: Unable to set socket property - server busy");
+        return;
+    }
+
     qapi_free_SocketAddress(o->socket);
 
     o->socket = NULL;
@@ -104,17 +118,69 @@ static void vfu_object_set_socket(Object *obj, Visitor *v, const char *name,
     }
 
     trace_vfu_prop("socket", o->socket->u.q_unix.path);
+
+    vfu_object_init_ctx(o, errp);
 }
 
 static void vfu_object_set_device(Object *obj, const char *str, Error **errp)
 {
     VfuObject *o = VFU_OBJECT(obj);
 
+    if (o->vfu_ctx) {
+        error_setg(errp, "vfu: Unable to set device property - server busy");
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
@@ -124,6 +190,11 @@ static void vfu_object_init(Object *obj)
 
     k->nr_devs++;
 
+    if (!phase_check(PHASE_MACHINE_READY)) {
+        o->machine_done.notify = vfu_object_machine_done;
+        qemu_add_machine_init_done_notifier(&o->machine_done);
+    }
+
     if (!object_dynamic_cast(OBJECT(current_machine), TYPE_REMOTE_MACHINE)) {
         error_setg(&o->err, "vfu: %s only compatible with %s machine",
                    TYPE_VFU_OBJECT, TYPE_REMOTE_MACHINE);
@@ -142,6 +213,10 @@ static void vfu_object_finalize(Object *obj)
 
     o->socket = NULL;
 
+    if (o->vfu_ctx) {
+        vfu_destroy_ctx(o->vfu_ctx);
+    }
+
     g_free(o->device);
 
     o->device = NULL;
@@ -149,6 +224,11 @@ static void vfu_object_finalize(Object *obj)
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


