Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3999B4942B5
	for <lists+qemu-devel@lfdr.de>; Wed, 19 Jan 2022 23:01:44 +0100 (CET)
Received: from localhost ([::1]:52004 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nAJ1T-0006sc-An
	for lists+qemu-devel@lfdr.de; Wed, 19 Jan 2022 17:01:43 -0500
Received: from eggs.gnu.org ([209.51.188.92]:58480)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jag.raman@oracle.com>)
 id 1nAIjc-0008Ke-MA
 for qemu-devel@nongnu.org; Wed, 19 Jan 2022 16:43:16 -0500
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32]:33886)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jag.raman@oracle.com>)
 id 1nAIjY-0007MO-Jw
 for qemu-devel@nongnu.org; Wed, 19 Jan 2022 16:43:16 -0500
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 20JJUwwt031225; 
 Wed, 19 Jan 2022 21:43:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references :
 content-transfer-encoding : content-type : mime-version;
 s=corp-2021-07-09; bh=wf13OJ+joRxQPg8Kyii0Li6FPpFwrBd0jtT1nh9fAaM=;
 b=dXi5gdjfUQT9s1bmjH11PcsbcGPjhpGEejeoY5ylqDIT8pEjL/cMNgBfX9HOkkrBJNXm
 tnczweI1/5mDjMGyMbYdwHQrnJZ64TQIx4RCR5VRaTDJY3djeBHjT6n7GVmNDVjZkp8A
 QSdcmmSt6kXty2HrgwPIxFS2CysiMHXIiupkMAOiQkpP5TT7hM++sIigR71frPakYFP5
 j154ZsUFuSosCDEXHDKaupB+Cw2Kb9kpqZQBWcRWMG1jTMy5X+B+kEO0eGewqaEPD4Bk
 X4g6n6ywwZ6MLGKRsBBfLCZHibP3jZ5Vs23Md2YZ2l1oKq0/suCFJAUalaUBPZGpflUL aA== 
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
 by mx0b-00069f02.pphosted.com with ESMTP id 3dnc4vpgq2-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 19 Jan 2022 21:43:05 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
 by aserp3020.oracle.com (8.16.1.2/8.16.1.2) with SMTP id 20JLaTrw030943;
 Wed, 19 Jan 2022 21:43:04 GMT
Received: from nam02-sn1-obe.outbound.protection.outlook.com
 (mail-sn1anam02lp2045.outbound.protection.outlook.com [104.47.57.45])
 by aserp3020.oracle.com with ESMTP id 3dkp36kft9-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 19 Jan 2022 21:43:04 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LkNuJjuVr9EQPUb4FGoHo+R2tQnTlyPssm/cH/lbO16rtACaxv+4jar5zlN2TytnB4CV9o3eh2nMKjkfnnr2tTDQx0Hr5FdI4sl9dLPYcoI1JMM57zpRjwSzWT435RRdJqUjxRPoHHpgsodJvp5zGYdYSGFztXhP3gE1Nw8AYLbB01rp8jXGVEqCL8YO/oNChDUEJUjNNp1pXO/mcPRHOY5Z8r0rvS6ZN5vIT1ylbLZ+gCECcLfaLqwgfSPtn/b9qrUUXpzgQBesPOvQy9DULQvBPIzjf6NVIDD7kmcBYRMRKulmqguTfA1nDAPBnV4dPttXzzC1/hiMy+pjPmg1FQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wf13OJ+joRxQPg8Kyii0Li6FPpFwrBd0jtT1nh9fAaM=;
 b=iEPgdTY2u7rsfVc1NXd7tf+yklk/gOvKrIBftcyuFRmMXrymKw/n3tUCFKqecZU1sUwp+tGcWq4UAIszaugyBuFHzygU+VTbY+pURauwk39CBy9mJU6oRtilDdaHE4Z2LNqDXitK2qqMSQ9xAoCFT02gw7CaFtS2ZWPwDWyn3kRi/trIqR1/Hu4VKBryxZR/UpShGI8lwOKcfFnsNt2tIcXBzkbD4jkgOpxOhFthsMP8Y9lpItpZwzLKLibJQGvwpS5qK+NROXGyBslJgFqKbOHqQmkdOaeHrnffm3EjK/WD2mCAkv+AxrBTIGsyw80i6iuAzeswTHWBDsHbRMWHfw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wf13OJ+joRxQPg8Kyii0Li6FPpFwrBd0jtT1nh9fAaM=;
 b=B173MSGc2f3f1rXj7HKV5KIWkXebZz5WCgck1yBNSjuM/oZuunhQT3Pp0TV3OgoXKns18NrDS8VRCxR0C98CQWFa3BwiHj7aPQx10Z9lY6uiyopyvlUO2Ay2h1AgDa8ZeoBJGwr0Yk+8459fVoj6PzLnyTkBLsTKF/jYoeYxjL0=
Received: from MN2PR10MB4013.namprd10.prod.outlook.com (2603:10b6:208:185::25)
 by DM5PR10MB1497.namprd10.prod.outlook.com (2603:10b6:3:13::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4888.12; Wed, 19 Jan
 2022 21:43:02 +0000
Received: from MN2PR10MB4013.namprd10.prod.outlook.com
 ([fe80::98b1:4348:5117:5fc]) by MN2PR10MB4013.namprd10.prod.outlook.com
 ([fe80::98b1:4348:5117:5fc%7]) with mapi id 15.20.4888.014; Wed, 19 Jan 2022
 21:43:02 +0000
From: Jagannathan Raman <jag.raman@oracle.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 13/18] vfio-user: handle PCI config space accesses
Date: Wed, 19 Jan 2022 16:42:02 -0500
Message-Id: <173c5b40a781d2b1b604bbd169c0989a8e35753b.1642626515.git.jag.raman@oracle.com>
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
X-MS-Office365-Filtering-Correlation-Id: 9cc33b85-e733-44ee-9bc9-08d9db94ab2d
X-MS-TrafficTypeDiagnostic: DM5PR10MB1497:EE_
X-Microsoft-Antispam-PRVS: <DM5PR10MB14970F2BB8C42A7B462CB09F90599@DM5PR10MB1497.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:409;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: RqNkrbTNZVV1bMg/T9zC70WTxfuywBU3jYTW/CSOExPOKHsY9OrDIC3sQYHB341tTkra3/GYZE4JZpdIsPY3eKAzPPjEcB+b/wlMuDSxCkQa9S7Ix7mWQCBv5mhOCBDQQbmJZIA0yQLn1P7mKBwQWIxkGTKbAot1MYmDanNm5fXRY+Yl0uTvfOfa1CiyYzr3POH9qNotcQRTUuddQcdOfPiQfNenRREPVi6heuLrHtD+QryE+PdlbqOoJHmA8A0WLn3kI8YtNCCGBquiMIS+6/iP7qCr/IUJUfRkSg1iG16ndK9wtK76mKW4OmWkfiwKjfZNDMRoDWBW3B1IL2o0TQfs+blAs+8gII5Fh2m5+CU4wQBHqkq2cWMYPdLQHxBQsuL/UNfCUTciFUs/jdIWOZPK/SQGIp5aBsXJzbdqJHYrBl/ra7iIvNwApPBh34dRksBdKYEt7dk8qjUTcP05Cpn9aRHNaEWXrzIZl2giycQ+FzBzvxcnQepo4EKx6XtWPPhbhbKXckAMp+34zpGTniHrajTlgwyz4l9v7MXT5fPo/625/0AzZbXnILmoHJenPUN/eZ0xJ3XSGqWLGEgtIyUveEtpS/KteDv4ZZ4aTnxKoF5vp+rov6uwIsw8NjM27Rp2LerR5gmMyw+SbDEsrYdyytDp2BW2bWkaWPzLB3F6ZdksIxPaIBA6en8E3JuOsYHtVeK9Zd06WDHdjzmSeA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR10MB4013.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(6506007)(26005)(5660300002)(2906002)(6916009)(8676002)(86362001)(4326008)(36756003)(508600001)(2616005)(6512007)(83380400001)(186003)(8936002)(107886003)(316002)(66556008)(66946007)(66476007)(38100700002)(7416002)(6486002)(52116002)(38350700002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?eauoqzMcG0k0v1+DFXK5eaBHpMmKdh62CKXwlsOFDAyaNYfhuPI6ETDQIz2R?=
 =?us-ascii?Q?Dd+FebsVkJvT3u1AWreJj92V0o0O1VY18J43jPEbbL3/+V6nq62GpY9Byp4k?=
 =?us-ascii?Q?H3muo6wNfSgworr8auOsVMj/gx7Z1nXkIDRUNpC41bQIT6ePPqn80fLg1KVS?=
 =?us-ascii?Q?f4yyd7lCfLvhmpOPqHKlimNPTljuXO3SVpDvGAD8w2J81ZFztHCwerEyRxqU?=
 =?us-ascii?Q?Gng/1S7R/Q3YRFqaN0NEYjuVH+PJ3mIFBExYfX200A2gtYh7mQ7bxR6Dvt5I?=
 =?us-ascii?Q?ha1MO6HQivmW9I7TLg4mw1zCQXG3xGmy26kUiiMtAPyUtcVia3BH6IHFQ5CZ?=
 =?us-ascii?Q?bpNsXz9yI029TOppXwdLS8aKmJFoFqx/juCtYMNlJpe0Q6ART44ShvHjU0oj?=
 =?us-ascii?Q?/TiVne0m42C57fu0+bbhjy36L4xEM/sYwCsadCd2T0s0ZPHEX6m0TQ4aT03E?=
 =?us-ascii?Q?JFTNAfZK2oaYFBiBF7yJ/EJD1fLvrUc5zKhWNOdVQ+rUMTz9vffBoS3XF4ro?=
 =?us-ascii?Q?iz4I4NJTdh8OeV1qyIOtpKq7zEKpr6g/Ucu5bpeyh+uGn5RU1udOff4WH1eo?=
 =?us-ascii?Q?cBl40X7PE0kqcsxGRCvaTkuw9vewmZ4kxbsw8JwZtx/ph0QK+UbRsqzhTq/V?=
 =?us-ascii?Q?aoKWjOLZslvzzWRGE5m4y5cGsH7XXVOvxbJvWdO0g/sP+G02pwQ7T289TI1W?=
 =?us-ascii?Q?CUn4tIwnDxddVXAgr3uiAheby1zOF69/yHmJ6HVWXo9LAkaUZ/nt1TQZMZIS?=
 =?us-ascii?Q?8pDF8aQ1jrHKNlZqQ6LllI5ejImlBWJkfXIIA2W3OqNDuf8OYVbFsITByAEG?=
 =?us-ascii?Q?wZDLVZnxOqky/UwOXh8rNhYgaVfNJEFBv/cN5t6Rjix8PN+FmBwEGDlkZBti?=
 =?us-ascii?Q?RMs8OdaRd4asuojHGa7FOQJ1V7/iGwQEEJEo2648lLEYU67lnMpVv6XB74y2?=
 =?us-ascii?Q?Awgq3LOIVOqSPQiBdOmsK6rVWIcnexIl/uSUxiDw0fQFK4ap/D61juR4fWm2?=
 =?us-ascii?Q?y2RlWJyzPoM0pxdQDY+UaJYTwfDvi2S3/N/1sZsbspmwUsK+kNz4MqiqZAl+?=
 =?us-ascii?Q?jgpJUcf3ZdChaGwzCB5Er2fCyrsy+62xdiha5a5SA2XBqp6GUJnYr7Hi6e7Y?=
 =?us-ascii?Q?6Xpm6g68d5zMHB4f9uR0CXY2QvcvDUpdrjHnsNUGgoNtHVvRn131Ht6DjYuQ?=
 =?us-ascii?Q?3bi1TL1Sx0WyCEQrfY/qi4wKWw6sH8zo7AX8HH0+jPeysFYi5EsCeWaEvvsa?=
 =?us-ascii?Q?x3s3lT/3WB2XUZlkP5b3sy+1P42aqQgFUMzQfZdhMO+bypqEv4idhg+joYis?=
 =?us-ascii?Q?0yTiFvBOjF8QWRNzrrwgt2CwzYx8V78TgchhOcWbeEy7vs8gzrxzy1vBwEih?=
 =?us-ascii?Q?/IjBPP6D8AE6zzjAChbpWrilFTrcpb24jZdfZwAkl92bD6/sBNZoAPbkIOzY?=
 =?us-ascii?Q?zidSyjQJZ+0dcs6mr+aw7NZG4C0gRSqm8Cyq6iw9WB+XkxsPHoPDGRrqiItB?=
 =?us-ascii?Q?I1DhevdJ785+p1umYcA3hv/kUCnb3Z+qDtECOMWxRsDAJ8kTME3eDXTdMFeB?=
 =?us-ascii?Q?Q+vZdfJgZnGqBTg6dStDtIXylFR512AYGuJrlsDb51+VldlE4uaOdSxSRXly?=
 =?us-ascii?Q?4YAFSLA6+mCEqC0NYlsnvpk=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9cc33b85-e733-44ee-9bc9-08d9db94ab2d
X-MS-Exchange-CrossTenant-AuthSource: MN2PR10MB4013.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jan 2022 21:43:02.4577 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 043IvPCdDQO3EWrLYO6oN2FldVkeXrBZgG0jwCZa69O9LaZDZ13LpK9mbDzXkPsM14x9cZcoX6/fW9cdGgNfEw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR10MB1497
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10232
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0
 bulkscore=0
 mlxlogscore=999 adultscore=0 suspectscore=0 malwarescore=0 mlxscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2110150000 definitions=main-2201190117
X-Proofpoint-GUID: 9WJaAccfAzgXSyj8WEbQ2EeVn0HUAOoC
X-Proofpoint-ORIG-GUID: 9WJaAccfAzgXSyj8WEbQ2EeVn0HUAOoC
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

Define and register handlers for PCI config space accesses

Signed-off-by: Elena Ufimtseva <elena.ufimtseva@oracle.com>
Signed-off-by: John G Johnson <john.g.johnson@oracle.com>
Signed-off-by: Jagannathan Raman <jag.raman@oracle.com>
---
 hw/remote/vfio-user-obj.c | 45 +++++++++++++++++++++++++++++++++++++++
 hw/remote/trace-events    |  2 ++
 2 files changed, 47 insertions(+)

diff --git a/hw/remote/vfio-user-obj.c b/hw/remote/vfio-user-obj.c
index 91d49a221f..8951617545 100644
--- a/hw/remote/vfio-user-obj.c
+++ b/hw/remote/vfio-user-obj.c
@@ -47,6 +47,7 @@
 #include "qapi/qapi-events-misc.h"
 #include "qemu/notify.h"
 #include "qemu/thread.h"
+#include "qemu/main-loop.h"
 #include "sysemu/sysemu.h"
 #include "libvfio-user.h"
 #include "hw/qdev-core.h"
@@ -214,6 +215,39 @@ retry_attach:
     qemu_set_fd_handler(o->vfu_poll_fd, vfu_object_ctx_run, NULL, o);
 }
 
+static ssize_t vfu_object_cfg_access(vfu_ctx_t *vfu_ctx, char * const buf,
+                                     size_t count, loff_t offset,
+                                     const bool is_write)
+{
+    VfuObject *o = vfu_get_private(vfu_ctx);
+    uint32_t pci_access_width = sizeof(uint32_t);
+    size_t bytes = count;
+    uint32_t val = 0;
+    char *ptr = buf;
+    int len;
+
+    while (bytes > 0) {
+        len = (bytes > pci_access_width) ? pci_access_width : bytes;
+        if (is_write) {
+            memcpy(&val, ptr, len);
+            pci_host_config_write_common(o->pci_dev, offset,
+                                         pci_config_size(o->pci_dev),
+                                         val, len);
+            trace_vfu_cfg_write(offset, val);
+        } else {
+            val = pci_host_config_read_common(o->pci_dev, offset,
+                                              pci_config_size(o->pci_dev), len);
+            memcpy(ptr, &val, len);
+            trace_vfu_cfg_read(offset, val);
+        }
+        offset += len;
+        ptr += len;
+        bytes -= len;
+    }
+
+    return count;
+}
+
 /*
  * TYPE_VFU_OBJECT depends on the availability of the 'socket' and 'device'
  * properties. It also depends on devices instantiated in QEMU. These
@@ -291,6 +325,17 @@ static void vfu_object_init_ctx(VfuObject *o, Error **errp)
         goto fail;
     }
 
+    ret = vfu_setup_region(o->vfu_ctx, VFU_PCI_DEV_CFG_REGION_IDX,
+                           pci_config_size(o->pci_dev), &vfu_object_cfg_access,
+                           VFU_REGION_FLAG_RW | VFU_REGION_FLAG_ALWAYS_CB,
+                           NULL, 0, -1, 0);
+    if (ret < 0) {
+        error_setg(errp,
+                   "vfu: Failed to setup config space handlers for %s- %s",
+                   o->device, strerror(errno));
+        goto fail;
+    }
+
     ret = vfu_realize_ctx(o->vfu_ctx);
     if (ret < 0) {
         error_setg(errp, "vfu: Failed to realize device %s- %s",
diff --git a/hw/remote/trace-events b/hw/remote/trace-events
index 7da12f0d96..2ef7884346 100644
--- a/hw/remote/trace-events
+++ b/hw/remote/trace-events
@@ -5,3 +5,5 @@ mpqemu_recv_io_error(int cmd, int size, int nfds) "failed to receive %d size %d,
 
 # vfio-user-obj.c
 vfu_prop(const char *prop, const char *val) "vfu: setting %s as %s"
+vfu_cfg_read(uint32_t offset, uint32_t val) "vfu: cfg: 0x%u -> 0x%x"
+vfu_cfg_write(uint32_t offset, uint32_t val) "vfu: cfg: 0x%u <- 0x%x"
-- 
2.20.1


