Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B7468422F95
	for <lists+qemu-devel@lfdr.de>; Tue,  5 Oct 2021 20:03:38 +0200 (CEST)
Received: from localhost ([::1]:39862 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mXomv-0006CT-Lw
	for lists+qemu-devel@lfdr.de; Tue, 05 Oct 2021 14:03:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45892)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonah.palmer@oracle.com>)
 id 1mXnac-0002h3-3D; Tue, 05 Oct 2021 12:46:50 -0400
Received: from mx0a-00069f02.pphosted.com ([205.220.165.32]:22498)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonah.palmer@oracle.com>)
 id 1mXnaZ-0005j2-LZ; Tue, 05 Oct 2021 12:46:49 -0400
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 195FtZKh010252; 
 Tue, 5 Oct 2021 16:46:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : content-type :
 mime-version; s=corp-2021-07-09;
 bh=Gdk/VnNDViSfQE9aNjsJK60Cao/6ektcpzADR17CoJE=;
 b=HESWc/n2snPaliudYG8IJjupc2zc6xowBtjqpF0F90zosGIHerUQgi6VU1mosi9mHBBI
 nYfKLau2QdEi69ZpF9BLVs1hbmhhGvrWuyRYe1na4x2+9xghF4oq6Pm9f/ZCbIg2zrJa
 nZR/OgrWcKWcbxpeJb3MDyFTR5U0tnP3HPHGiCLOLb+fvQSHqc7lgILYQaGdvhsXDNBv
 193OvOKiXuZoVkasVhbsbctAUEjxi2WsJkw177qWrU4l4XpAaTl1Y+J77WN+zIPP/v6E
 PavPbC3ZsZZOEE8YCio7zU1Sx3oV74tRYnRh8MOEgBsm2jHLZ7KYxnPSyBcy4lm8CCAT Kg== 
Received: from aserp3030.oracle.com (aserp3030.oracle.com [141.146.126.71])
 by mx0b-00069f02.pphosted.com with ESMTP id 3bg3uq1c25-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 05 Oct 2021 16:46:39 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
 by aserp3030.oracle.com (8.16.1.2/8.16.1.2) with SMTP id 195GjvUm155254;
 Tue, 5 Oct 2021 16:46:37 GMT
Received: from nam02-sn1-obe.outbound.protection.outlook.com
 (mail-sn1anam02lp2049.outbound.protection.outlook.com [104.47.57.49])
 by aserp3030.oracle.com with ESMTP id 3bev7thd71-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 05 Oct 2021 16:46:37 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oVZqV4de7JD7tlLxx0P40HvuDUgwnm+AcaG1PHrbEkK+U7Ilnud06bGnYUPOmqaOOSqGi/y7COM9MHh0hK20zLUqx6IiYZv6h4OzikoL8ldoHQd4ec/CPGx8IBYUx1YpS3HneeHWCrCHtO79rY43E5PMdUaoc5i791Q0VVWqwFWHMVRXtiK1WatW/0EqGzSM99EnnKs4kV6fc0AdbjDULsIhURyMamNOncrQsP2MZBP9/XpbTmeZSOD8vmhAJ8Mt5B7aSLTwoD/mAkilZoyOppbuFWKqlkrK4m5CuRL8Qzk6T0giu/NID7GxmI/hyPivM6EVzYN9ltnP4E5ABD2JAg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Gdk/VnNDViSfQE9aNjsJK60Cao/6ektcpzADR17CoJE=;
 b=LaMHzf4mjNjRqg2N+T1/y5G4X/ndSaURxm0laFzxQUGJVKaOsRm2pRsjBN7927NCZMkywvtssWMLt4cyWCiBGaZSPNG2xWN2j+w/ZM054kd87Lu7kRKqT2sigiIUyDlswCDBpGC7Rc6s/dV0s9VdHdyrN6ahk5J4xd2Du2EZOl8SmJay9vV8f9phl0dEcAK0qFOug5fV7nowfm/LQPsrSpsgH+PQrwOmuykOKmsL3bYnViC5Y/OMzA3i2N66aopvJ9hdOnDj+3tRg4wCmlmLL7on29BsvVQfX0reCiQ56Hlo/pmX08BOF1N2+NnJoBCWG+W24qi3kDnKg2C3cDGSPA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Gdk/VnNDViSfQE9aNjsJK60Cao/6ektcpzADR17CoJE=;
 b=TdIDsYAkzOl7CaLsbndOJnWPCsVKVO/iYhMrOtfZA6R5/DvXdJbvRgwwvVBq4lcdJ39MumiVcCKryuexy5Z9u3CLV22bVzFPT3j132pmgD3jywKqKt3yMS7SR77DjieVDTi3VEHpYsZAMKM5YucJiQZA96ZW4aQooxOsAhBDaCo=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=oracle.com;
Received: from SA2PR10MB4667.namprd10.prod.outlook.com (2603:10b6:806:111::21)
 by SN6PR10MB2942.namprd10.prod.outlook.com (2603:10b6:805:d7::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4566.15; Tue, 5 Oct
 2021 16:46:35 +0000
Received: from SA2PR10MB4667.namprd10.prod.outlook.com
 ([fe80::95e7:72:edfe:3da9]) by SA2PR10MB4667.namprd10.prod.outlook.com
 ([fe80::95e7:72:edfe:3da9%8]) with mapi id 15.20.4566.022; Tue, 5 Oct 2021
 16:46:35 +0000
From: Jonah Palmer <jonah.palmer@oracle.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v7 4/8] qmp: add QMP command x-debug-virtio-status
Date: Tue,  5 Oct 2021 12:45:49 -0400
Message-Id: <1633452353-7169-5-git-send-email-jonah.palmer@oracle.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1633452353-7169-1-git-send-email-jonah.palmer@oracle.com>
References: <1633452353-7169-1-git-send-email-jonah.palmer@oracle.com>
Content-Type: text/plain
X-ClientProxiedBy: SN7PR04CA0095.namprd04.prod.outlook.com
 (2603:10b6:806:122::10) To SA2PR10MB4667.namprd10.prod.outlook.com
 (2603:10b6:806:111::21)
MIME-Version: 1.0
Received: from jonpalme-lnx.us.oracle.com (209.17.40.39) by
 SN7PR04CA0095.namprd04.prod.outlook.com (2603:10b6:806:122::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4587.18 via Frontend
 Transport; Tue, 5 Oct 2021 16:46:33 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f29d46ec-c72d-4f16-b826-08d9881fb1ae
X-MS-TrafficTypeDiagnostic: SN6PR10MB2942:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <SN6PR10MB29427B1BA058F3C6F523C271E8AF9@SN6PR10MB2942.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:386;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: xBEwCeBQAiLoO69IqoK8/u4Zxh252EUz/Wo1YaZUKzcI4zGgvhw5VRsrr4Ayg6TyHkD3GgVEtFCfgrDNXF0KAtLW70XxW/QYBXqmlVfa6Jto4xhefZEH6+NAibrZ18fD2TK60YWKZE5tkxSfEzICJznkGRJc0JEaN/UqLahAC7aP7bad5hcAWjTwt5XZBhRdx+yXmQHF8silYdxWKqxWN/wwczxCZF0Z5k3p36xsm/+n0gRvBnRUBQ6QR0csBoOZflApRSaTZ6mJ7EIDRuNJM2YDLKgZtPVYuaNHKN2REWEJgs9eeBYN5BcX+1S9BCE+jRatoaIUyV8X4ooJWgnfkYsm97QakoN8J5hnQpt713R4xFYbabA8BXeW1mnGBOylxwTzrLeSLIV1F6ZykquNQ8x3uqczIV/Ok2vtpuKR9QfaTgMkWARxrdGjEDxCFiGlKjNlSNEDBV/Q8rL1PvF2ax1siUhqZ8gkNWKmlnJpnC64WNShmLWXxUReHIeOxtpmVKrGhr0Qf+KNxQZYgAcIRONb1Mxuzg1GDww7y08Ra/NjnofNIJUeR04fwfYx+v2ka2NvIHCMpQCJGAM8e+flzjI/ZKrZCl2+LjSQrq8gnoV2rNtO/iEIFNmjhYqRhM+xuQYUE7AUaTZ8EpW+ebjhW+Mq6svlYfbxk3ZuaIw162uyJVe6wU1warIVnLsSjNqSPqq3JCraYXBUi6OK/QF7tQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA2PR10MB4667.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(6666004)(5660300002)(66476007)(66556008)(83380400001)(6486002)(508600001)(6916009)(4326008)(66946007)(8936002)(7416002)(86362001)(956004)(2616005)(26005)(316002)(7696005)(52116002)(44832011)(2906002)(8676002)(36756003)(38350700002)(38100700002)(186003)(30864003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?0BeEo2xBhToFonzCWxwAIQGuVuvjk3wPgxMAKMDNIXVUYoZh5tMCc61MqSqK?=
 =?us-ascii?Q?3MExWB5o6R6brxaW4MZRjJIE3VSOvEA3P602N0JmbzedtGDG07N0nt4A1ZE1?=
 =?us-ascii?Q?Lh0F5e+SWl2TN6lNlPWsFlfxRRR5odnzp89bSN5a+mjkvHp2wH9bdsNE0c+G?=
 =?us-ascii?Q?Z2OxHQ+hSVlJneB6tS48+ar3TufCxqxrUWbkUXkI3AGnq/mX4WD4dzvb9+DU?=
 =?us-ascii?Q?/Tjbh26AXIAuYDUAXYCIspEUvbDiXc2iXp8AC/YBksaSFiDPNLoZZ8H5NkaX?=
 =?us-ascii?Q?1SnoliuvpsxtQjA7UkGeUT/jYhXtG7VO8elmwz+azLpju6fCwyzeyLYx8tsL?=
 =?us-ascii?Q?j4ei4b3BDPpt1clc4hZPDErsZ19r6qQE+qgg2PwgrjKExrC+JmbdKtAxVT5I?=
 =?us-ascii?Q?cT2PJdS8tSeOCz5WLcO/t4IT2Fqb/b5ALmRriyONDAdlvABsKSdJB+BoGTws?=
 =?us-ascii?Q?Uj8u+PzSyNTpoIYBtdEW4JgUxN6rn49KTgbWbHeAoXdrIeE/nDwO5d2zgGTt?=
 =?us-ascii?Q?dE20kkUu0FchtsQcyIlCrvKPw16auSTkq43h7wOgZfWf86VwmWYnpdIDBpA2?=
 =?us-ascii?Q?OuZqmN8RozVxqClq54vfsEB7/M4DAuVStm8VjB7yIwftO1b3UhQ4LOuXMgVp?=
 =?us-ascii?Q?V0lyXCZmbV9WUqTHetyZ6X/euH4PkruXqN4YztgAK6yk1lHby+NwnZLK8KJm?=
 =?us-ascii?Q?0UwNzSSyymyC0w+kqusEXfvFEbMvTXF+NPNUS8ggi/lK0rftKv92Nq/0OF6J?=
 =?us-ascii?Q?fmfgRvaONCovqIm/WgvU3eYQUPEyuKqGg5d8wFRYUs/+rAQVlOZ8RJXGI3tF?=
 =?us-ascii?Q?476ra0PFBH+tpfbw1gXa/elJt1gXGLT0mhLAAffNj8jdQ3Kj+6Ckfg43gy7C?=
 =?us-ascii?Q?KRslq7EX6YrLT4d1NtWvBV3aaMVzIlk5FPu9GmN9oPDaCnOi1AksrrTbzhw+?=
 =?us-ascii?Q?/WSCW+3AnkZgInaFCHtC1vXydT0Qkq79+5DA2M52cxuOSHEoZx8WIPVb0v/t?=
 =?us-ascii?Q?6/gF/dWzYLsJQWsBdZ+8Az8WdEHQoJxbu7RtR4UjWzr2PxXbZjAI24UNdRTH?=
 =?us-ascii?Q?MGF0dWCz136EMDfZcRQ/8cvHhnif+0WcQtwTTUNqOEay89S+TZ4Q+Sfhhgt5?=
 =?us-ascii?Q?SiIUClO5KwZfAagHaCe6H59EPmkFqU//WnzD+RuPIu7pVKsmidhKw3md0fZZ?=
 =?us-ascii?Q?ea/xZwoR7ekB45QRjUbuljzUMS0nLX7qI57iuXk41PcUSIuSTgXM25hfMBXO?=
 =?us-ascii?Q?oYDn5xyHL7kv2puUs6pRdTHq4qNIWawIU1iDYU94TT309XS8yLFWE1WGVFaM?=
 =?us-ascii?Q?G88zsSqDNUh5z/y+1yXCZ89u?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f29d46ec-c72d-4f16-b826-08d9881fb1ae
X-MS-Exchange-CrossTenant-AuthSource: SA2PR10MB4667.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Oct 2021 16:46:35.8526 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xKyYcPuUWzErifiavzfMdSnbk3kw5kW05BhXWjwKIUGh6RtdjQIpXnYOj7LV9bgKeJBHEB9TtfLnwq9uRKuREw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR10MB2942
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10128
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0
 mlxlogscore=999 adultscore=0
 bulkscore=0 suspectscore=0 malwarescore=0 spamscore=0 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2109230001
 definitions=main-2110050100
X-Proofpoint-ORIG-GUID: ObUcWvxExESOkr3teWqlYxXi4B_L-Npd
X-Proofpoint-GUID: ObUcWvxExESOkr3teWqlYxXi4B_L-Npd
Received-SPF: pass client-ip=205.220.165.32;
 envelope-from=jonah.palmer@oracle.com; helo=mx0a-00069f02.pphosted.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: fam@euphon.net, mst@redhat.com, kraxel@redhat.com, si-wei.liu@oracle.com,
 joao.m.martins@oracle.com, raphael.norwitz@nutanix.com, qemu-block@nongnu.org,
 david@redhat.com, armbru@redhat.com, marcandre.lureau@redhat.com,
 thuth@redhat.com, amit@kernel.org, michael.roth@amd.com, dgilbert@redhat.com,
 eric.auger@redhat.com, dmitrii.stepanov@cloud.ionos.com, stefanha@redhat.com,
 boris.ostrovsky@oracle.com, kwolf@redhat.com, laurent@vivier.eu,
 mreitz@redhat.com, jasonwang@redhat.com, pbonzini@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Laurent Vivier <lvivier@redhat.com>

This new command shows the status of a VirtIODevice, including
its corresponding vhost device status (if active).

Next patch will improve output by decoding feature bits, including
vhost device's feature bits (backend, protocol, acked, and features).
Also will decode status bits of a VirtIODevice.

Next patch will also suppress the vhost device field from displaying
if no vhost device is active for a given VirtIODevice.

Signed-off-by: Jonah Palmer <jonah.palmer@oracle.com>
---
 hw/virtio/virtio-stub.c |   5 +
 hw/virtio/virtio.c      |  96 +++++++++++++++++++
 qapi/virtio.json        | 245 ++++++++++++++++++++++++++++++++++++++++++++++++
 3 files changed, 346 insertions(+)

 [Jonah: Added more fields of VirtIODevice to display including name,
  status, isr, queue_sel, vm_running, broken, disabled, used_started,
  started, start_on_kick, disable_legacy_check, bus_name, and
  use_guest_notifier_mask.

  Also added vhost support that displays the status of the
  VirtIODevice's corresponding vhost device if it's active.
  Vhost device fields include n_mem_sections, n_tmp_sections, nvqs,
  vq_index, features, acked_features, backend_features,
  protocol_features, max_queues, backend_cap, log_enabled and
  log_size.] 

diff --git a/hw/virtio/virtio-stub.c b/hw/virtio/virtio-stub.c
index d4a88f5..ddb592f 100644
--- a/hw/virtio/virtio-stub.c
+++ b/hw/virtio/virtio-stub.c
@@ -12,3 +12,8 @@ VirtioInfoList *qmp_x_debug_query_virtio(Error **errp)
 {
     return qmp_virtio_unsupported(errp);
 }
+
+VirtioStatus *qmp_x_debug_virtio_status(const char* path, Error **errp)
+{
+    return qmp_virtio_unsupported(errp);
+}
diff --git a/hw/virtio/virtio.c b/hw/virtio/virtio.c
index a454e2f..04a44e8 100644
--- a/hw/virtio/virtio.c
+++ b/hw/virtio/virtio.c
@@ -3933,6 +3933,102 @@ VirtioInfoList *qmp_x_debug_query_virtio(Error **errp)
     return list;
 }
 
+static VirtIODevice *virtio_device_find(const char *path)
+{
+    VirtIODevice *vdev;
+
+    QTAILQ_FOREACH(vdev, &virtio_list, next) {
+        DeviceState *dev = DEVICE(vdev);
+
+        if (strcmp(dev->canonical_path, path) != 0) {
+            continue;
+        }
+        return vdev;
+    }
+
+    return NULL;
+}
+
+VirtioStatus *qmp_x_debug_virtio_status(const char *path, Error **errp)
+{
+    VirtIODevice *vdev;
+    VirtioStatus *status;
+
+    vdev = virtio_device_find(path);
+    if (vdev == NULL) {
+        error_setg(errp, "Path %s is not a VirtIO device", path);
+        return NULL;
+    }
+
+    status = g_new0(VirtioStatus, 1);
+    status->vhost_dev = g_new0(VhostStatus, 1);
+    status->name = g_strdup(vdev->name);
+    status->device_id = vdev->device_id;
+    status->vhost_started = vdev->vhost_started;
+    status->guest_features = vdev->guest_features;
+    status->host_features = vdev->host_features;
+    status->backend_features = vdev->backend_features;
+
+    switch (vdev->device_endian) {
+    case VIRTIO_DEVICE_ENDIAN_LITTLE:
+        status->device_endian = VIRTIO_STATUS_ENDIANNESS_LITTLE;
+        break;
+    case VIRTIO_DEVICE_ENDIAN_BIG:
+        status->device_endian = VIRTIO_STATUS_ENDIANNESS_BIG;
+        break;
+    default:
+        status->device_endian = VIRTIO_STATUS_ENDIANNESS_UNKNOWN;
+        break;
+    }
+
+    status->num_vqs = virtio_get_num_queues(vdev);
+    status->status = vdev->status;
+    status->isr = vdev->isr;
+    status->queue_sel = vdev->queue_sel;
+    status->vm_running = vdev->vm_running;
+    status->broken = vdev->broken;
+    status->disabled = vdev->disabled;
+    status->use_started = vdev->use_started;
+    status->started = vdev->started;
+    status->start_on_kick = vdev->start_on_kick;
+    status->disable_legacy_check = vdev->disable_legacy_check;
+    status->bus_name = g_strdup(vdev->bus_name);
+    status->use_guest_notifier_mask = vdev->use_guest_notifier_mask;
+
+    if (vdev->vhost_started) {
+        VirtioDeviceClass *vdc = VIRTIO_DEVICE_GET_CLASS(vdev);
+        struct vhost_dev *hdev = vdc->get_vhost(vdev);
+
+        status->vhost_dev->n_mem_sections = hdev->n_mem_sections;
+        status->vhost_dev->n_tmp_sections = hdev->n_tmp_sections;
+        status->vhost_dev->nvqs = hdev->nvqs;
+        status->vhost_dev->vq_index = hdev->vq_index;
+        status->vhost_dev->features = hdev->features;
+        status->vhost_dev->acked_features = hdev->acked_features;
+        status->vhost_dev->backend_features = hdev->backend_features;
+        status->vhost_dev->protocol_features = hdev->protocol_features;
+        status->vhost_dev->max_queues = hdev->max_queues;
+        status->vhost_dev->backend_cap = hdev->backend_cap;
+        status->vhost_dev->log_enabled = hdev->log_enabled;
+        status->vhost_dev->log_size = hdev->log_size;
+    } else {
+        status->vhost_dev->n_mem_sections = 0;
+        status->vhost_dev->n_tmp_sections = 0;
+        status->vhost_dev->nvqs = 0;
+        status->vhost_dev->vq_index = 0;
+        status->vhost_dev->features = 0;
+        status->vhost_dev->acked_features = 0;
+        status->vhost_dev->backend_features = 0;
+        status->vhost_dev->protocol_features = 0;
+        status->vhost_dev->max_queues = 0;
+        status->vhost_dev->backend_cap = 0;
+        status->vhost_dev->log_enabled = false;
+        status->vhost_dev->log_size = 0;
+    }
+
+    return status;
+}
+
 static const TypeInfo virtio_device_info = {
     .name = TYPE_VIRTIO_DEVICE,
     .parent = TYPE_DEVICE,
diff --git a/qapi/virtio.json b/qapi/virtio.json
index e871690..c78c432 100644
--- a/qapi/virtio.json
+++ b/qapi/virtio.json
@@ -64,3 +64,248 @@
 ##
 
 { 'command': 'x-debug-query-virtio', 'returns': ['VirtioInfo'] }
+
+##
+# @VirtioStatusEndianness:
+#
+# Enumeration of endianness for VirtioDevice
+#
+# Since: 6.2
+##
+
+{ 'enum': 'VirtioStatusEndianness',
+  'data': [ 'unknown', 'little', 'big' ]
+}
+
+##
+# @VhostStatus:
+#
+# Information about a vhost device (if active)
+#
+# @n-mem-sections: vhost_dev n_mem_sections
+#
+# @n-tmp-sections: vhost_dev n_tmp_sections
+#
+# @nvqs: vhost_dev nvqs (number of virtqueues)
+#
+# @vq-index: vhost_dev vq_index
+#
+# @features: vhost_dev features
+#
+# @acked-features: vhost_dev acked_features
+#
+# @backend-features: vhost_dev backend_features
+#
+# @protocol-features: vhost_dev protocol_features
+#
+# @max-queues: vhost_dev max_queues
+#
+# @backend-cap: vhost_dev backend_cap
+#
+# @log-enabled: vhost_dev log_enabled flag
+#
+# @log-size: vhost_dev log_size
+#
+# Since: 6.2
+#
+##
+
+{ 'struct': 'VhostStatus',
+    'data': {
+        'n-mem-sections': 'int',
+        'n-tmp-sections': 'int',
+        'nvqs': 'uint32',
+        'vq-index': 'int',
+        'features': 'uint64',
+        'acked-features': 'uint64',
+        'backend-features': 'uint64',
+        'protocol-features': 'uint64',
+        'max-queues': 'uint64',
+        'backend-cap': 'uint64',
+        'log-enabled': 'bool',
+        'log-size': 'uint64'
+    }
+}
+
+##
+# @VirtioStatus:
+#
+# @name: VirtIODevice name
+#
+# @device-id: VirtIODevice ID
+#
+# @vhost-started: VirtIODevice vhost_started flag
+#
+# @guest-features: VirtIODevice guest_features
+#
+# @host-features: VirtIODevice host_features
+#
+# @backend-features: VirtIODevice backend_features
+#
+# @device-endian: VirtIODevice device_endian
+#
+# @num-vqs: VirtIODevice virtqueue count
+#
+# @status: VirtIODevice status
+#
+# @isr: VirtIODevice ISR
+#
+# @queue-sel: VirtIODevice queue_sel
+#
+# @vm-running: VirtIODevice vm_running flag
+#
+# @broken: VirtIODevice broken flag
+#
+# @disabled: VirtIODevice disabled flag
+#
+# @use-started: VirtIODevice use_started flag
+#
+# @started: VirtIODevice started flag
+#
+# @start-on-kick: VirtIODevice start_on_kick flag
+#
+# @disable-legacy-check: VirtIODevice disabled_legacy_check flag
+#
+# @bus-name: VirtIODevice bus_name
+#
+# @use-guest-notifier-mask: VirtIODevice use_guest_notifier_mask flag
+#
+# @vhost-dev: corresponding vhost device info for a given VirtIODevice
+#
+# Since: 6.2
+#
+##
+
+{ 'struct': 'VirtioStatus',
+    'data': {
+        'name': 'str',
+        'device-id': 'uint16',
+        'vhost-started': 'bool',
+        'guest-features': 'uint64',
+        'host-features': 'uint64',
+        'backend-features': 'uint64',
+        'device-endian': 'VirtioStatusEndianness',
+        'num-vqs': 'int',
+        'status': 'uint8',
+        'isr': 'uint8',
+        'queue-sel': 'uint16',
+        'vm-running': 'bool',
+        'broken': 'bool',
+        'disabled': 'bool',
+        'use-started': 'bool',
+        'started': 'bool',
+        'start-on-kick': 'bool',
+        'disable-legacy-check': 'bool',
+        'bus-name': 'str',
+        'use-guest-notifier-mask': 'bool',
+        'vhost-dev': 'VhostStatus'
+    }
+}
+
+##
+# @x-debug-virtio-status:
+#
+# Poll for a comprehensive status of a given virtio device
+#
+# @path: QOM path of the VirtIODevice
+#
+# Returns: status of the virtio device
+#
+# Since: 6.2
+#
+# Example:
+#
+# 1.
+# -> { "execute": "x-debug-virtio-status",
+#      "arguments": {
+#          "path": "/machine/peripheral/crypto0/virtio-backend"
+#      }
+#    }
+# <- { "return": {
+#          "device-endian": "little",
+#          "bus-name": "",
+#          "disable-legacy-check": false,
+#          "name": "virtio-crypto",
+#          "started": true,
+#          "device-id": 20,
+#          "vhost-dev": {
+#               "n-tmp-sections": 0,
+#               "n-mem-sections": 0,
+#               "max-queues": 0,
+#               "backend-cap": 0,
+#               "log-size": 0,
+#               "backend-features": 0,
+#               "nvqs": 0,
+#               "protocol-features": 0,
+#               "vq-index": 0,
+#               "log-enabled": false,
+#               "acked-features": 0,
+#               "features": 0
+#          },
+#          "backend-features": 0,
+#          "start-on-kick": false,
+#          "isr": 1,
+#          "broken": false,
+#          "status": 15,
+#          "num-vqs": 2,
+#          "guest-features": 5100273664,
+#          "host-features": 6325010432,
+#          "use-guest-notifier-mask": true,
+#          "vm-running": true,
+#          "queue-sel": 1,
+#          "disabled": false,
+#          "vhost-started": false,
+#          "use-started": true
+#      }
+#    }
+#
+# 2.
+# -> { "execute": "x-debug-virtio-status",
+#      "arguments": {
+#          "path": "/machine/peripheral-anon/device[1]/virtio-backend"
+#      }
+#    }
+# <- { "return": {
+#          "device-endian": "little",
+#          "bus-name": "",
+#          "disabled-legacy-check": false,
+#          "name": "virtio-net",
+#          "started": true,
+#          "device-id": 1,
+#          "vhost-dev": {
+#               "n-tmp-sections": 4,
+#               "n-mem-sections": 4,
+#               "max-queues": 1,
+#               "backend-cap": 2,
+#               "log-size": 0,
+#               "backend-features": 0,
+#               "nvqs": 2,
+#               "protocol-features": 0,
+#               "vq-index": 0,
+#               "log-enabled": false,
+#               "acked-features": 5100306432,
+#               "features": 13908344832
+#          },
+#          "backend-features": 6337593319,
+#          "start-on-kick": false,
+#          "isr": 1,
+#          "broken": false,
+#          "status": 15,
+#          "num-vqs": 3,
+#          "guest-features": 5111807911,
+#          "host-features": 6337593319,
+#          "use-guest-notifier-mask": true,
+#          "vm-running": true,
+#          "queue-sel": 2,
+#          "disabled": false,
+#          "vhost-started": true,
+#          "use-started": true
+#      }
+#    }
+#
+##
+
+{ 'command': 'x-debug-virtio-status',
+  'data': { 'path': 'str' },
+  'returns': 'VirtioStatus'
+}
-- 
1.8.3.1


