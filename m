Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F47F2FC1BC
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Jan 2021 22:01:13 +0100 (CET)
Received: from localhost ([::1]:33188 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l1y7k-0001ir-Az
	for lists+qemu-devel@lfdr.de; Tue, 19 Jan 2021 16:01:12 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:54632)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jag.raman@oracle.com>)
 id 1l1xfQ-0003lz-Dm
 for qemu-devel@nongnu.org; Tue, 19 Jan 2021 15:31:58 -0500
Received: from aserp2130.oracle.com ([141.146.126.79]:39744)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jag.raman@oracle.com>)
 id 1l1xfM-0000hA-JM
 for qemu-devel@nongnu.org; Tue, 19 Jan 2021 15:31:56 -0500
Received: from pps.filterd (aserp2130.oracle.com [127.0.0.1])
 by aserp2130.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 10JKOoaI146183;
 Tue, 19 Jan 2021 20:31:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : content-type :
 mime-version; s=corp-2020-01-29;
 bh=avhCUAWKFINROFhFn9XLD6ifdtWA62J3LcL6MBR+IHI=;
 b=n4doiIOXVQNuijAnrdH6mL6Q7ei5Od6MfpzyAyPV+aJUtIwVZ8OOD7Q+b4a8Sq0QT4bu
 gDTDxL9VQ2gxkEqbXJGcbgC7fDD+6Bn8FyMKSv1VCdHLSB3bKhrk9AZ1yq6ykrQH5m3R
 cf9w7cCDAvGyE3cdmy6uVhZUrQV9NlJKBL0LCMf/l1emfYElaYy7xnmTtanS8IzLcWTx
 N1TGWEwNiinNCM6gRF+XNCupnIQrnVfvKyha2s/dZnxpG28V9fihhccLbi4EdToezPr+
 fx0brcyjrAXock1osQaid1JOKECfyLrMBSt2ae9qYE82A9QDT6ooTb5JGOONNFso+25U 0w== 
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
 by aserp2130.oracle.com with ESMTP id 363nnak56r-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 19 Jan 2021 20:31:46 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
 by aserp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 10JKPjRi175932;
 Tue, 19 Jan 2021 20:29:46 GMT
Received: from nam02-sn1-obe.outbound.protection.outlook.com
 (mail-sn1nam02lp2055.outbound.protection.outlook.com [104.47.36.55])
 by aserp3020.oracle.com with ESMTP id 3661er95bb-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 19 Jan 2021 20:29:45 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Gt1EfhbQo94zIIQN2DFdKjcmr5ZKTc9e2TAp5UMzM675rGXUvDpugZSbMCccuh0JUmxJ/RKMkDS5fYG2U0lqld6Hu6ncyNob27nNFh9Yx41k8zKk+q0rBpAf6Xqppa71JwiOPmxOVrdFifOsMJleAQfBwgslf7Q0fWMnUYTgtEG+2IQSghpnLCzs4RR/nbNeuYT6aD07kUf7nVEAiU2/CY9IBaZ1jZ13mS7727+IOJG+kM7UjD3ctjMh7qSUjiDo1lxD1ms82cP60nZ7GbK38R+WZ/Ns6XsaHE4WO23yZDqH7r2laycJVQ5CdC9BvQDzRtg8xeoFWl8pYTGVInsJBw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=avhCUAWKFINROFhFn9XLD6ifdtWA62J3LcL6MBR+IHI=;
 b=Tj8s9Pb9sYQrbAlBV5cwInm84Z/kLjXIK4O3tiXaVNSbEXqsKYBDzmkdr9rC8wARJNI9P0oG3K1wRre24yGKwYNOHmqLhrnb8HH8rpyTpVkKiqATdEN8Cb88LJfz7biV3fWewuJAXiQDtfFThZBT6KG0QeOKlexdBOt6v+lmhKU/236QmwFCj8+4/mDfBSk/5IOVwAbpOLjnGK1T0C+rJg7WVoT7PcL89M/R+rW3J2XKENOOL4o+TQ7vpvJQn+VvZInpvNV7YHp032Kx5aduPcJkBXYvEx89PGoaPn5UES284ZUYidaL8MLBIk9rbJqP90VeVuL2+O4OKJpEIRhCtg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=avhCUAWKFINROFhFn9XLD6ifdtWA62J3LcL6MBR+IHI=;
 b=eNrBLTBsLRmJpCD2+zXUxESB4ThQurwH/ma0euVYRPOzjGEueTHwDu1CPPnMNZ3eMZq8dHf48Xmum4y4jmZHfxcIrGBYj5wLs8kNw9B5r4mSWI0VOYtAe4Luz/EmPUsQqzsq49nnaCixurB3i/9FlmM9Cmw46o7L5QAANhK4ICc=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=oracle.com;
Received: from BYAPR10MB2744.namprd10.prod.outlook.com (2603:10b6:a02:ae::18)
 by BYAPR10MB3351.namprd10.prod.outlook.com (2603:10b6:a03:14d::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3763.9; Tue, 19 Jan
 2021 20:29:43 +0000
Received: from BYAPR10MB2744.namprd10.prod.outlook.com
 ([fe80::5cf0:3e26:c005:341b]) by BYAPR10MB2744.namprd10.prod.outlook.com
 ([fe80::5cf0:3e26:c005:341b%7]) with mapi id 15.20.3763.014; Tue, 19 Jan 2021
 20:29:43 +0000
From: Jagannathan Raman <jag.raman@oracle.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v20 20/20] multi-process: perform device reset in the remote
 process
Date: Tue, 19 Jan 2021 15:28:37 -0500
Message-Id: <2163ccd87119eaaef550a06748908f23420ea67b.1611081587.git.jag.raman@oracle.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <cover.1611081587.git.jag.raman@oracle.com>
References: <cover.1611081587.git.jag.raman@oracle.com>
Content-Type: text/plain
X-Originating-IP: [209.17.40.38]
X-ClientProxiedBy: DM6PR01CA0007.prod.exchangelabs.com (2603:10b6:5:296::12)
 To BYAPR10MB2744.namprd10.prod.outlook.com (2603:10b6:a02:ae::18)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from jaraman-bur-1.us.oracle.com (209.17.40.38) by
 DM6PR01CA0007.prod.exchangelabs.com (2603:10b6:5:296::12) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3784.11 via Frontend Transport; Tue, 19 Jan 2021 20:29:40 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 5a998a45-8fcb-4923-8bc3-08d8bcb8f46c
X-MS-TrafficTypeDiagnostic: BYAPR10MB3351:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BYAPR10MB335120F046B01045F80FB83C90A30@BYAPR10MB3351.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:279;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ctbPPMcPnRibN8xGJJRqg6NAlZfDBw9G1TUMd4O77CEU53t7CwMhBj05n+7JobtKp1T7cmX2rxzZfxMDAcSjWTSLdu+KQS+lYHAFGqVlzKTTR8Qf3Ei3OklNyt1cIV8fBx1keJxTowkY61AQrs4qM88NG7h8Mu7ts/lbSsSrY9HFBT4GpjoSEMMJmVcEXdtjAwrhm2Zq9d0a2Ex8b9xBwpAYTxOtQqgBDZc0qPvFDShK9Qgv5nHHt1Z1Aina9brh0INN0segNrw5U+WkvOijQRu87O38FAIMdqvq0qDOyUbY6yk8pkWEBAjrettTVT3GhAglAEyC6tLGHYn7eiQ/Ay1kCs94siQl7rkAcsWANtuMelGVVnwZJFsw3nkWdkm8bk8QuJIursGB5zo4tTAcSbqNPyrMTU/Yj9W4XVkrbtqNdIB07t81qBFlll3Ip5LyqFevex/OiDj2gua/YUP3dtfA7GQw2iIEurNkQzNLSqR9WwlPWsoc8RFOHxdps1oJiS2uZBXnmPPUXneZzPUtrA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR10MB2744.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(396003)(39860400002)(366004)(136003)(376002)(346002)(86362001)(2906002)(6666004)(6916009)(36756003)(4326008)(8676002)(52116002)(66476007)(66556008)(316002)(8936002)(66946007)(6486002)(107886003)(956004)(5660300002)(478600001)(7696005)(16526019)(26005)(186003)(7416002)(2616005)(83380400001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?IaaXTdUfcePfTaUkDRai4Qy8p8PRR4+ESv9WNxPYik+J8JN1K9FeyeJpbcMz?=
 =?us-ascii?Q?dYEpNcSGTQc/9dIoUCXC9IR4MsABqw0apvIqaM/diu+m7PKKEnUfbBx2gKFm?=
 =?us-ascii?Q?j03nq+ovIgW568xm9tVWi8nKvFlPue8kOLYhLOitWWGuHSjiDVf3xNT2Zkpq?=
 =?us-ascii?Q?DCKgORRdle1Tidk346/qHL0jTbh4//rIFUIlRd+nv0G6QJw1a80muGgNS/SC?=
 =?us-ascii?Q?0gwsvydoPeIE1Z187QTJDnZXppYGPOMA2K/+Tr0XxKrrd121GR2p7NGmLdGK?=
 =?us-ascii?Q?+eGJ0Ijr3CxNNIMXo1BCZpLpqSVTfqwbCw4r7NJnJ2RkG9OJt/oJVPnxQNLo?=
 =?us-ascii?Q?yL0o2Cm8W8braIyRRGDaRxGhZ7X+fkHmHvKZ4WLMA9b3xnXQTceoWrVfYt66?=
 =?us-ascii?Q?p7CLr3/nn04A5aDTMbrTYvZ+LZhY6eNIlVmgq/Xb9miNweeqkXT78w9fg7IP?=
 =?us-ascii?Q?GtmJ1toXhXTdNew2IePWF2umdvxCP622MgtH5wacIsT/ZOyy1TgMO9gysfjp?=
 =?us-ascii?Q?UpInAGBB3jt4MCSP8NTwmHKj1mWqHc/+G1+sTAJAuT7m3QUEmNwJEWU4xYg+?=
 =?us-ascii?Q?mppVFSgf9zmxs2FKruurkUcVTQFfjsytkGoIT1NcLSy9zMczGLMrlljkszNk?=
 =?us-ascii?Q?OnqcKT/axPVnytooOZDlytZQnN1mcUjYMKt52q3nTuLAv4rykQbv0ssyiKGf?=
 =?us-ascii?Q?HxkkLOtiSJpljfTehDx3i5nxvxS0d4ghx8DHVDdSAvcu3kh4quoT4ESdAy+0?=
 =?us-ascii?Q?IwaGVrUnITxJSxiOEya8V9WeqS40BSq/rxniLEzPp2JP/SLuJfChwLvzYAyo?=
 =?us-ascii?Q?X7DRIOur+NpQrWVqsO6y8xKkRJZrI02bQT0gurmCN0PaVgUALpKd21ynhmcg?=
 =?us-ascii?Q?5AqQiI/WM7oTzezekG9chC3AEhdy4MofMtiKdCsF+CzTVlnTMIj4ZsRVP6b6?=
 =?us-ascii?Q?dFyi/BxqUqGAW3f3kDvUCWBrespRhD9mlLoqvUjmM2E=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5a998a45-8fcb-4923-8bc3-08d8bcb8f46c
X-MS-Exchange-CrossTenant-AuthSource: BYAPR10MB2744.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jan 2021 20:29:43.6242 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bilKR7pTrFGjUPOrOc8aSAb2oQcLjgAZZ9SpRMFzKRVzHneVhVldbpty2a3RUtOBdk8SPOCF0JUzGBnV71Rzug==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR10MB3351
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9869
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0
 phishscore=0 mlxscore=0
 mlxlogscore=999 adultscore=0 suspectscore=0 malwarescore=0 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2101190113
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9869
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 impostorscore=0
 spamscore=0
 mlxlogscore=999 clxscore=1015 bulkscore=0 adultscore=0 lowpriorityscore=0
 suspectscore=0 phishscore=0 mlxscore=0 malwarescore=0 priorityscore=1501
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2101190113
Received-SPF: pass client-ip=141.146.126.79; envelope-from=jag.raman@oracle.com;
 helo=aserp2130.oracle.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, RCVD_IN_DNSWL_MED=-2.3, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: elena.ufimtseva@oracle.com, fam@euphon.net, swapnil.ingle@nutanix.com,
 john.g.johnson@oracle.com, kraxel@redhat.com, jag.raman@oracle.com,
 quintela@redhat.com, mst@redhat.com, armbru@redhat.com,
 kanth.ghatraju@oracle.com, felipe@nutanix.com, thuth@redhat.com,
 ehabkost@redhat.com, konrad.wilk@oracle.com, dgilbert@redhat.com,
 alex.williamson@redhat.com, stefanha@redhat.com, thanos.makatos@nutanix.com,
 kwolf@redhat.com, berrange@redhat.com, mreitz@redhat.com,
 ross.lagerwall@citrix.com, marcandre.lureau@gmail.com, pbonzini@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Elena Ufimtseva <elena.ufimtseva@oracle.com>

Perform device reset in the remote process when QEMU performs
device reset. This is required to reset the internal state
(like registers, etc...) of emulated devices

Signed-off-by: Elena Ufimtseva <elena.ufimtseva@oracle.com>
Signed-off-by: John G Johnson <john.g.johnson@oracle.com>
Signed-off-by: Jagannathan Raman <jag.raman@oracle.com>
Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
---
 include/hw/remote/mpqemu-link.h |  1 +
 hw/remote/message.c             | 22 ++++++++++++++++++++++
 hw/remote/proxy.c               | 19 +++++++++++++++++++
 3 files changed, 42 insertions(+)

diff --git a/include/hw/remote/mpqemu-link.h b/include/hw/remote/mpqemu-link.h
index 71d206f..4ec0915 100644
--- a/include/hw/remote/mpqemu-link.h
+++ b/include/hw/remote/mpqemu-link.h
@@ -40,6 +40,7 @@ typedef enum {
     MPQEMU_CMD_BAR_WRITE,
     MPQEMU_CMD_BAR_READ,
     MPQEMU_CMD_SET_IRQFD,
+    MPQEMU_CMD_DEVICE_RESET,
     MPQEMU_CMD_MAX,
 } MPQemuCmd;
 
diff --git a/hw/remote/message.c b/hw/remote/message.c
index adab040..11d7298 100644
--- a/hw/remote/message.c
+++ b/hw/remote/message.c
@@ -19,6 +19,7 @@
 #include "exec/memattrs.h"
 #include "hw/remote/memory.h"
 #include "hw/remote/iohub.h"
+#include "sysemu/reset.h"
 
 static void process_config_write(QIOChannel *ioc, PCIDevice *dev,
                                  MPQemuMsg *msg, Error **errp);
@@ -26,6 +27,8 @@ static void process_config_read(QIOChannel *ioc, PCIDevice *dev,
                                 MPQemuMsg *msg, Error **errp);
 static void process_bar_write(QIOChannel *ioc, MPQemuMsg *msg, Error **errp);
 static void process_bar_read(QIOChannel *ioc, MPQemuMsg *msg, Error **errp);
+static void process_device_reset_msg(QIOChannel *ioc, PCIDevice *dev,
+                                     Error **errp);
 
 void coroutine_fn mpqemu_remote_msg_loop_co(void *data)
 {
@@ -69,6 +72,9 @@ void coroutine_fn mpqemu_remote_msg_loop_co(void *data)
         case MPQEMU_CMD_SET_IRQFD:
             process_set_irqfd_msg(pci_dev, &msg);
             break;
+        case MPQEMU_CMD_DEVICE_RESET:
+            process_device_reset_msg(com->ioc, pci_dev, &local_err);
+            break;
         default:
             error_setg(&local_err,
                        "Unknown command (%d) received for device %s"
@@ -206,3 +212,19 @@ fail:
                       getpid());
     }
 }
+
+static void process_device_reset_msg(QIOChannel *ioc, PCIDevice *dev,
+                                     Error **errp)
+{
+    DeviceClass *dc = DEVICE_GET_CLASS(dev);
+    DeviceState *s = DEVICE(dev);
+    MPQemuMsg ret = { 0 };
+
+    if (dc->reset) {
+        dc->reset(s);
+    }
+
+    ret.cmd = MPQEMU_CMD_RET;
+
+    mpqemu_msg_send(&ret, ioc, errp);
+}
diff --git a/hw/remote/proxy.c b/hw/remote/proxy.c
index a082709..4fa4be0 100644
--- a/hw/remote/proxy.c
+++ b/hw/remote/proxy.c
@@ -26,6 +26,7 @@
 #include "util/event_notifier-posix.c"
 
 static void probe_pci_info(PCIDevice *dev, Error **errp);
+static void proxy_device_reset(DeviceState *dev);
 
 static void proxy_intx_update(PCIDevice *pci_dev)
 {
@@ -202,6 +203,8 @@ static void pci_proxy_dev_class_init(ObjectClass *klass, void *data)
     k->config_read = pci_proxy_read_config;
     k->config_write = pci_proxy_write_config;
 
+    dc->reset = proxy_device_reset;
+
     device_class_set_props(dc, proxy_properties);
 }
 
@@ -358,3 +361,19 @@ static void probe_pci_info(PCIDevice *dev, Error **errp)
         }
     }
 }
+
+static void proxy_device_reset(DeviceState *dev)
+{
+    PCIProxyDev *pdev = PCI_PROXY_DEV(dev);
+    MPQemuMsg msg = { 0 };
+    Error *local_err = NULL;
+
+    msg.cmd = MPQEMU_CMD_DEVICE_RESET;
+    msg.size = 0;
+
+    mpqemu_msg_send_and_await_reply(&msg, pdev, &local_err);
+    if (local_err) {
+        error_report_err(local_err);
+    }
+
+}
-- 
1.8.3.1


