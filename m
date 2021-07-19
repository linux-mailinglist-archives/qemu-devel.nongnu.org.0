Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E622F3CEB91
	for <lists+qemu-devel@lfdr.de>; Mon, 19 Jul 2021 22:03:42 +0200 (CEST)
Received: from localhost ([::1]:34776 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m5ZUL-0001ds-Te
	for lists+qemu-devel@lfdr.de; Mon, 19 Jul 2021 16:03:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47698)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jag.raman@oracle.com>)
 id 1m5ZRP-0005ri-KL
 for qemu-devel@nongnu.org; Mon, 19 Jul 2021 16:00:40 -0400
Received: from mx0a-00069f02.pphosted.com ([205.220.165.32]:33152)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jag.raman@oracle.com>)
 id 1m5ZRM-0005TM-UU
 for qemu-devel@nongnu.org; Mon, 19 Jul 2021 16:00:39 -0400
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 16JJubNU002464; Mon, 19 Jul 2021 20:00:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : content-type :
 mime-version; s=corp-2021-07-09;
 bh=ZhMA06ReX6eFP2Y6fGK8Tjmg4wulVd+ZwemZA5aU0T0=;
 b=Zxyaqn6eYCcbYzk5CiLKami5P4RtC0MfjfY44ctyIKZpCyJn8HjSdLbJA5qMOCfh4khW
 C63NQyrMHccOQmWuCOrtNIQbph0uwA/yxkwcZJ7cb8LTT+qGibbUG/9HqBeXiyjv42ug
 oXAVWk0bAImX7L5x89HV4NJmwnwH45XD3S3Y5YQyGeXx4bmK53ZsOkFRNNFFcXVVIFP3
 O4OzA8FzP64VlUwp9l0+2SnpG2tfRPGClgw/Z9hxt1hJem1Jvpm5/JgNLOwXi5szvNSJ
 T+hjvtWzqgZMfXR+4kvxGAPlm8eilG93jamycUCwbjzL7ljknc+HbJIso07mJvSdzYer 8A== 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : content-type :
 mime-version; s=corp-2020-01-29;
 bh=ZhMA06ReX6eFP2Y6fGK8Tjmg4wulVd+ZwemZA5aU0T0=;
 b=oOkb2ldkphtJ7vnCiQvKPm+ItPMZiDgqgEwrQc8nVTbzI5tz5Y0xsPgKl2JESyxNApSI
 IR4u6ojMcCdMt0tateM+/iawccKqu0jese0s1RT7m75Pi/IhZCP44ZEdj/5abFNx+JGP
 dTKATrJgyiBUnjhhburJYE9br6uxvmOxmjDiBjedvVqMp07sygkOf8wLVYSoeBEPYYwx
 tv5BH2mT1WHMXo2WDhE0V2n7ojwFINv0STwBUYU3fkSsmn4u9ena9rBw3m4z3LLJ8OXQ
 mPOcDcpfu8ujwmP6+oam9Kekvw0Sglbf0gQFUhQHNRdgex9NQBK7rpM3JX1XUk+Qfep4 Aw== 
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
 by mx0b-00069f02.pphosted.com with ESMTP id 39vrn5j9xy-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 19 Jul 2021 20:00:35 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
 by aserp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 16JJf5Iw033120;
 Mon, 19 Jul 2021 20:00:34 GMT
Received: from nam10-mw2-obe.outbound.protection.outlook.com
 (mail-mw2nam10lp2103.outbound.protection.outlook.com [104.47.55.103])
 by aserp3020.oracle.com with ESMTP id 39uq15b6up-4
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 19 Jul 2021 20:00:33 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Fu9a254D5fZJjCP+gCqX6OhisNM6YV2vCZXT0ELxmU/uBOd/IYhC+k+yLiolJNQgvM86nDFPU+xUccMBg/KmzmBinmU5cnRao/cpjm3rw9iYTLMx67iNu33z30S+bbK39RRVPDXXPdhmZwEtLXLvGjH1SPuIzGOQ4q6BnVt68Z7qxgt0X0fIehYasHOqzb0xYmLQOE2jQU2gI3Jvm/Q9UeliB22nJXFWY7NO9o7qXLkEKVBXKG1nDsxtF3plCVqR8glUApktj1Dahl14m7SbFYcKUenxSGUjeIIaKuY4z05q2ycKAmHsCAPaVQ4fJBYWiC1uCbovDt0xmza3Rd7FNg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZhMA06ReX6eFP2Y6fGK8Tjmg4wulVd+ZwemZA5aU0T0=;
 b=eqjeh/O1MZ0ac1L9Iw9Z8c2LtbWXaC4SsGPi3SP88uM4q33YrVa92jIr3nbJfTu7Qwu+eL1Gabk54N2Bv55zSwpm3S3U9xDGjxh1dtVUmvrn3NfkYhIBVjKS859AgoHR/MVRIJmKTf2V7QW/G4mGSKN6tUu2bAco3vZOfCYaDGYL42BZxRG78A0ywqxmqTQKEkAC7BEPMgjuULb0aZuRB589p5lsoQFv/vMiLxRlDB6Px9Wp8bm1dPjaKpdb5vkkDLvuuFGJ+khC5ijkf99bY+t41CrlKseWO/ii1cwOPmHA1GY31cb5IaLRzXgoVFsTmAeN+t6HkGYEERELhXZvIA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZhMA06ReX6eFP2Y6fGK8Tjmg4wulVd+ZwemZA5aU0T0=;
 b=V3wMqgoGVwbADbC2v59g1wrwZS2Iwiaw3GAHIrjz6TUFqQCLBY76W8FEd+APkz7CW2RLkapxNiHi3xdlEmz2XPahMjlqMFbrKLarlLsvq9xtp/gh5qTgXSZpL+uvX3lD6ctoziZ83KEFz8vbOJ2AvKU80btweklW07tNkZe9HUI=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=oracle.com;
Received: from MN2PR10MB4013.namprd10.prod.outlook.com (2603:10b6:208:185::25)
 by MN2PR10MB3853.namprd10.prod.outlook.com (2603:10b6:208:180::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4331.26; Mon, 19 Jul
 2021 20:00:30 +0000
Received: from MN2PR10MB4013.namprd10.prod.outlook.com
 ([fe80::e935:82a8:3c37:8aa4]) by MN2PR10MB4013.namprd10.prod.outlook.com
 ([fe80::e935:82a8:3c37:8aa4%4]) with mapi id 15.20.4331.033; Mon, 19 Jul 2021
 20:00:30 +0000
From: Jagannathan Raman <jag.raman@oracle.com>
To: qemu-devel@nongnu.org
Subject: [PATCH RFC server 10/11] vfio-user: register handlers to facilitate
 migration
Date: Mon, 19 Jul 2021 16:00:12 -0400
Message-Id: <2b9b94e7b5e1bcf77c0b900bc0a5488db4910833.1626722742.git.jag.raman@oracle.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <cover.1626722742.git.jag.raman@oracle.com>
References: <cover.1626675354.git.elena.ufimtseva@oracle.com>
 <cover.1626722742.git.jag.raman@oracle.com>
Content-Type: text/plain
X-ClientProxiedBy: SA0PR11CA0040.namprd11.prod.outlook.com
 (2603:10b6:806:d0::15) To MN2PR10MB4013.namprd10.prod.outlook.com
 (2603:10b6:208:185::25)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from jaraman-bur-1.us.oracle.com (209.17.40.44) by
 SA0PR11CA0040.namprd11.prod.outlook.com (2603:10b6:806:d0::15) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4331.21 via Frontend Transport; Mon, 19 Jul 2021 20:00:29 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 517014c9-e38c-411d-582e-08d94aefdc76
X-MS-TrafficTypeDiagnostic: MN2PR10MB3853:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <MN2PR10MB3853E3C8A23CD321CB59CD6B90E19@MN2PR10MB3853.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2150;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: BshJVpo3rTkkMWQ+0Y4qpf4bz+rFbl7yb44t1G7U3ov+6VTywnrPR97j/R0zq8wCqs+V7i89xPYMbPtfEahvWq3IxKjbQzpMr5c2DI7e74rX8vxRckdarEq7wFasQk3DYjqAjYYLSdBFOBoYnH+fdLr6jTczqiCjMqpFVDNbX815zcWLGFEkfdGWhL/7OnG1YFwAlMb1/bhb7bPJkXOeKTp9Zdvso0IodPtu63XsEtvZn/hVeX6cBe/GiOiy6rL6irAdY2g3oQ7ivn2bf88rqPm/e1zGtsBwcG48jvZTX6DjHhyNT0SjM4JPezseDpU+ATPvyJOnwg3a5BwamoV7saMhbJSVimIhxqIihu5kLkbsQqJxcSnvHQffff/3lbQWv7ZXWzUb8l75mXUWIyvSFh156ioY1W7GXFrE4fCFnuAA56ucfOANa0/o6aDphxVwz2xcadKAYtyAg/WWCmKw4AXTLhHnp5/NDy2m/4HPAWxytWXgr7kjUnoZ9tPO0C1f49ONu870MNo9JKXg9nOfqWBL3dqz3v2pd3QsXnXUwS88jf3T6gTWxDA329llHtwrYDZ57D2PA0jR9wTk+VADt1kd+/sxnsSn7nCceeRUUYT5mdUShVXNL9AX3HpESeA8ZXfcTaa5U9ljZmHOdnHkuOHWz4okcenuQ03lpBFFjd3RVKaHWCaK8ZdcRJ9OP8KxIFqlR4v/oNm7lPFMbDR+rw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR10MB4013.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(30864003)(316002)(5660300002)(956004)(2616005)(107886003)(7696005)(26005)(6666004)(508600001)(38350700002)(38100700002)(52116002)(36756003)(86362001)(186003)(6486002)(4326008)(66556008)(66476007)(6916009)(66946007)(83380400001)(8676002)(2906002)(8936002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: soS9eVxHFydHoOOrDhQ8glFtRJdEmOs71TPSyZMm0hNGEw4sLDEP0euYRGaBfR8UlB8+g3Xacvf9oI5lY6ZQTEh66DELdgGqXJZWXYZxJTdxa6LaICxd3owphEHvdaWnrj8ryrzLZ4b4yb8ekK/283YI3+fiPNCL0/s+PM3shNzUjIVRtQoV2VPO95Si9KLpxWci5SwqNCgBN4tubtrJX1hiEGA0F1Z5HslShatAPJ7HIehYhsOciQfnrPD9jG3QBbPQbBtsfdC6j6K8sZ3YPPq/ZOG9V45YY6O9IJPff2g4xZ1xCltwgCAdzyo0k0fH2f8CJX1BxQmPHw3lGFX1L3u2+8pDUS44xwh5iJpJdhg0PZG5tA1OXfnYgxPwfN6CphY29Tj1VeDBwkkvcJR4XZUKarS8npUo60kjVPOJHQhihDclGwHdZ1W1FyPD/NRZTt0l8ZRlHE+bViC2iP2MofcH/l7yNleGhDy9fIRZH1vLVqlshFELKAZ4ntmpqtimY2lvS+xkSRtGtS6jV/UpCkTgxtLOcs7brtsWL8OL2TZZCSDYQp9aPYhhgZPGzPgtvjmlayX5tA4layOp0N6JKjnCk0poHWl0liztrL1JiplokKm+oq5I1JfISMX7T1WLSUlaI4ucBAIgSlk8drHTwf/6Fn2BoglsQU7i0G7EZSh2Uf03F2UQgt+1mo0RuVMth8EgLIQOcydFXszU7q0m8NUSpkkOsE6Ify8i8az5nm2P+x00LVg/xMHYEA4aQatf
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 517014c9-e38c-411d-582e-08d94aefdc76
X-MS-Exchange-CrossTenant-AuthSource: MN2PR10MB4013.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jul 2021 20:00:30.7647 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: eJz5f2xn9EKpp6oWqB6ThDZ7xtsNNbyCo7bYs45npgIEfnk2BzNDO1cIT4pQ+SGVN8zOWcXDoSJY0/Q5t6PjBg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR10MB3853
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=10050
 signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0
 malwarescore=0
 mlxlogscore=999 suspectscore=0 bulkscore=0 spamscore=0 phishscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104190000 definitions=main-2107190112
X-Proofpoint-GUID: hM4ZWnflXbxRw1Cb9HA_jXB46AM-Aww1
X-Proofpoint-ORIG-GUID: hM4ZWnflXbxRw1Cb9HA_jXB46AM-Aww1
Received-SPF: pass client-ip=205.220.165.32; envelope-from=jag.raman@oracle.com;
 helo=mx0a-00069f02.pphosted.com
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
Cc: elena.ufimtseva@oracle.com, john.g.johnson@oracle.com, jag.raman@oracle.com,
 swapnil.ingle@nutanix.com, john.levon@nutanix.com, alex.williamson@redhat.com,
 stefanha@redhat.com, thanos.makatos@nutanix.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Store and load the device's state using handlers for live migration

Signed-off-by: Elena Ufimtseva <elena.ufimtseva@oracle.com>
Signed-off-by: John G Johnson <john.g.johnson@oracle.com>
Signed-off-by: Jagannathan Raman <jag.raman@oracle.com>
---
 migration/savevm.h        |   2 +
 hw/remote/vfio-user-obj.c | 287 ++++++++++++++++++++++++++++++++++++++++++++++
 migration/savevm.c        |  63 ++++++++++
 3 files changed, 352 insertions(+)

diff --git a/migration/savevm.h b/migration/savevm.h
index 6461342..71d1733 100644
--- a/migration/savevm.h
+++ b/migration/savevm.h
@@ -67,5 +67,7 @@ int qemu_loadvm_state_main(QEMUFile *f, MigrationIncomingState *mis);
 int qemu_load_device_state(QEMUFile *f);
 int qemu_savevm_state_complete_precopy_non_iterable(QEMUFile *f,
         bool in_postcopy, bool inactivate_disks);
+int qemu_remote_savevm(QEMUFile *f);
+int qemu_remote_loadvm(QEMUFile *f);
 
 #endif
diff --git a/hw/remote/vfio-user-obj.c b/hw/remote/vfio-user-obj.c
index d2a2e51..5948576 100644
--- a/hw/remote/vfio-user-obj.c
+++ b/hw/remote/vfio-user-obj.c
@@ -44,6 +44,10 @@
 #include "hw/boards.h"
 #include "hw/remote/iohub.h"
 #include "hw/remote/machine.h"
+#include "migration/qemu-file.h"
+#include "migration/savevm.h"
+#include "migration/global_state.h"
+#include "block/block.h"
 
 #include "libvfio-user/include/libvfio-user.h"
 
@@ -73,6 +77,31 @@ struct VfuObject {
     PCIDevice *pci_dev;
 
     QemuThread vfu_ctx_thread;
+
+    /*
+     * vfu_mig_buf holds the migration data. In the remote process, this
+     * buffer replaces the role of an IO channel which links the source
+     * and the destination.
+     *
+     * Whenever the client QEMU process initiates migration, the libvfio-user
+     * library notifies that to this server. The remote/server QEMU sets up a
+     * QEMUFile object using this buffer as backend. The remote passes this
+     * object to its migration subsystem, and it slirps the VMSDs of all its
+     * devices and stores them in this buffer.
+     *
+     * libvfio-user library subsequetly asks the remote for any data that needs
+     * to be moved over to the destination using its vfu_migration_callbacks_t
+     * APIs. The remote hands over this buffer as data at this time.
+     *
+     * A reverse of this process happens at the destination.
+     */
+    uint8_t *vfu_mig_buf;
+
+    uint64_t vfu_mig_buf_size;
+
+    uint64_t vfu_mig_buf_pending;
+
+    QEMUFile *vfu_mig_file;
 };
 
 static void vfu_object_set_socket(Object *obj, const char *str, Error **errp)
@@ -97,6 +126,226 @@ static void vfu_object_set_devid(Object *obj, const char *str, Error **errp)
     trace_vfu_prop("devid", str);
 }
 
+/**
+ * Migration helper functions
+ *
+ * vfu_mig_buf_read & vfu_mig_buf_write are used by QEMU's migration
+ * subsystem - qemu_remote_savevm & qemu_remote_loadvm. savevm/loadvm
+ * call these functions via QEMUFileOps to save/load the VMSD of all
+ * the devices into vfu_mig_buf
+ *
+ */
+static ssize_t vfu_mig_buf_read(void *opaque, uint8_t *buf, int64_t pos,
+                                size_t size, Error **errp)
+{
+    VfuObject *o = opaque;
+
+    if (pos > o->vfu_mig_buf_size) {
+        size = 0;
+    } else if ((pos + size) > o->vfu_mig_buf_size) {
+        size = o->vfu_mig_buf_size;
+    }
+
+    memcpy(buf, (o->vfu_mig_buf + pos), size);
+
+    o->vfu_mig_buf_size -= size;
+
+    return size;
+}
+
+static ssize_t vfu_mig_buf_write(void *opaque, struct iovec *iov, int iovcnt,
+                                 int64_t pos, Error **errp)
+{
+    VfuObject *o = opaque;
+    uint64_t end = pos + iov_size(iov, iovcnt);
+    int i;
+
+    if (end > o->vfu_mig_buf_size) {
+        o->vfu_mig_buf = g_realloc(o->vfu_mig_buf, end);
+    }
+
+    for (i = 0; i < iovcnt; i++) {
+        memcpy((o->vfu_mig_buf + o->vfu_mig_buf_size), iov[i].iov_base,
+               iov[i].iov_len);
+        o->vfu_mig_buf_size += iov[i].iov_len;
+        o->vfu_mig_buf_pending += iov[i].iov_len;
+    }
+
+    return iov_size(iov, iovcnt);
+}
+
+static int vfu_mig_buf_shutdown(void *opaque, bool rd, bool wr, Error **errp)
+{
+    VfuObject *o = opaque;
+
+    o->vfu_mig_buf_size = 0;
+
+    g_free(o->vfu_mig_buf);
+
+    return 0;
+}
+
+static const QEMUFileOps vfu_mig_fops_save = {
+    .writev_buffer  = vfu_mig_buf_write,
+    .shut_down      = vfu_mig_buf_shutdown,
+};
+
+static const QEMUFileOps vfu_mig_fops_load = {
+    .get_buffer     = vfu_mig_buf_read,
+    .shut_down      = vfu_mig_buf_shutdown,
+};
+
+/**
+ * handlers for vfu_migration_callbacks_t
+ *
+ * The libvfio-user library accesses these handlers to drive the migration
+ * at the remote end, and also to transport the data stored in vfu_mig_buf
+ *
+ */
+static void vfu_mig_state_precopy(vfu_ctx_t *vfu_ctx)
+{
+    VfuObject *o = vfu_get_private(vfu_ctx);
+    int ret;
+
+    if (!o->vfu_mig_file) {
+        o->vfu_mig_file = qemu_fopen_ops(o, &vfu_mig_fops_save);
+    }
+
+    global_state_store();
+
+    ret = qemu_remote_savevm(o->vfu_mig_file);
+    if (ret) {
+        qemu_file_shutdown(o->vfu_mig_file);
+        return;
+    }
+
+    qemu_fflush(o->vfu_mig_file);
+
+    bdrv_inactivate_all();
+}
+
+static void vfu_mig_state_running(vfu_ctx_t *vfu_ctx)
+{
+    VfuObject *o = vfu_get_private(vfu_ctx);
+    Error *local_err = NULL;
+    int ret;
+
+    ret = qemu_remote_loadvm(o->vfu_mig_file);
+    if (ret) {
+        error_setg(&error_abort, "vfu: failed to restore device state");
+        return;
+    }
+
+    bdrv_invalidate_cache_all(&local_err);
+    if (local_err) {
+        error_report_err(local_err);
+        return;
+    }
+
+    vm_start();
+}
+
+static int vfu_mig_transition(vfu_ctx_t *vfu_ctx, vfu_migr_state_t state)
+{
+    switch (state) {
+    case VFU_MIGR_STATE_RESUME:
+    case VFU_MIGR_STATE_STOP_AND_COPY:
+    case VFU_MIGR_STATE_STOP:
+        break;
+    case VFU_MIGR_STATE_PRE_COPY:
+        vfu_mig_state_precopy(vfu_ctx);
+        break;
+    case VFU_MIGR_STATE_RUNNING:
+        if (!runstate_is_running()) {
+            vfu_mig_state_running(vfu_ctx);
+        }
+        break;
+    default:
+        warn_report("vfu: Unknown migration state %d", state);
+    }
+
+    return 0;
+}
+
+static uint64_t vfu_mig_get_pending_bytes(vfu_ctx_t *vfu_ctx)
+{
+    VfuObject *o = vfu_get_private(vfu_ctx);
+
+    return o->vfu_mig_buf_pending;
+}
+
+static int vfu_mig_prepare_data(vfu_ctx_t *vfu_ctx, uint64_t *offset,
+                                uint64_t *size)
+{
+    VfuObject *o = vfu_get_private(vfu_ctx);
+
+    if (offset) {
+        *offset = 0;
+    }
+
+    if (size) {
+        *size = o->vfu_mig_buf_size;
+    }
+
+    return 0;
+}
+
+static ssize_t vfu_mig_read_data(vfu_ctx_t *vfu_ctx, void *buf,
+                                 uint64_t size, uint64_t offset)
+{
+    VfuObject *o = vfu_get_private(vfu_ctx);
+
+    if (offset > o->vfu_mig_buf_size) {
+        return -1;
+    }
+
+    if ((offset + size) > o->vfu_mig_buf_size) {
+        warn_report("vfu: buffer overflow - check pending_bytes");
+        size = o->vfu_mig_buf_size - offset;
+    }
+
+    memcpy(buf, (o->vfu_mig_buf + offset), size);
+
+    o->vfu_mig_buf_pending -= size;
+
+    return size;
+}
+
+static ssize_t vfu_mig_write_data(vfu_ctx_t *vfu_ctx, void *data,
+                                  uint64_t size, uint64_t offset)
+{
+    VfuObject *o = vfu_get_private(vfu_ctx);
+    uint64_t end = offset + size;
+
+    if (end > o->vfu_mig_buf_size) {
+        o->vfu_mig_buf = g_realloc(o->vfu_mig_buf, end);
+        o->vfu_mig_buf_size = end;
+    }
+
+    memcpy((o->vfu_mig_buf + offset), data, size);
+
+    if (!o->vfu_mig_file) {
+        o->vfu_mig_file = qemu_fopen_ops(o, &vfu_mig_fops_load);
+    }
+
+    return size;
+}
+
+static int vfu_mig_data_written(vfu_ctx_t *vfu_ctx, uint64_t count)
+{
+    return 0;
+}
+
+static const vfu_migration_callbacks_t vfu_mig_cbs = {
+    .version = VFU_MIGR_CALLBACKS_VERS,
+    .transition = &vfu_mig_transition,
+    .get_pending_bytes = &vfu_mig_get_pending_bytes,
+    .prepare_data = &vfu_mig_prepare_data,
+    .read_data = &vfu_mig_read_data,
+    .data_written = &vfu_mig_data_written,
+    .write_data = &vfu_mig_write_data,
+};
+
 static void *vfu_object_ctx_run(void *opaque)
 {
     VfuObject *o = opaque;
@@ -332,6 +581,7 @@ static void vfu_object_machine_done(Notifier *notifier, void *data)
 {
     VfuObject *o = container_of(notifier, VfuObject, machine_done);
     DeviceState *dev = NULL;
+    size_t migr_area_size;
     int ret;
 
     o->vfu_ctx = vfu_create_ctx(VFU_TRANS_SOCK, o->socket, 0,
@@ -391,6 +641,35 @@ static void vfu_object_machine_done(Notifier *notifier, void *data)
         return;
     }
 
+    /*
+     * TODO: The 0x20000 number used below is a temporary. We are working on
+     *     a cleaner fix for this.
+     *
+     *     The libvfio-user library assumes that the remote knows the size of
+     *     the data to be migrated at boot time, but that is not the case with
+     *     VMSDs, as it can contain a variable-size buffer. 0x20000 is used
+     *     as a sufficiently large buffer to demonstrate migration, but that
+     *     cannot be used as a solution.
+     *
+     */
+    ret = vfu_setup_region(o->vfu_ctx, VFU_PCI_DEV_MIGR_REGION_IDX,
+                           0x20000, NULL,
+                           VFU_REGION_FLAG_RW, NULL, 0, -1, 0);
+    if (ret < 0) {
+        error_setg(&error_abort, "vfu: Failed to register migration BAR %s- %s",
+                   o->devid, strerror(errno));
+        return;
+    }
+
+    migr_area_size = vfu_get_migr_register_area_size();
+    ret = vfu_setup_device_migration_callbacks(o->vfu_ctx, &vfu_mig_cbs,
+                                               migr_area_size);
+    if (ret < 0) {
+        error_setg(&error_abort, "vfu: Failed to setup migration %s- %s",
+                   o->devid, strerror(errno));
+        return;
+    }
+
     qemu_thread_create(&o->vfu_ctx_thread, "VFU ctx runner", vfu_object_ctx_run,
                        o, QEMU_THREAD_JOINABLE);
 }
@@ -412,6 +691,14 @@ static void vfu_object_init(Object *obj)
 
     o->machine_done.notify = vfu_object_machine_done;
     qemu_add_machine_init_done_notifier(&o->machine_done);
+
+    o->vfu_mig_file = NULL;
+
+    o->vfu_mig_buf = NULL;
+
+    o->vfu_mig_buf_size = 0;
+
+    o->vfu_mig_buf_pending = 0;
 }
 
 static void vfu_object_finalize(Object *obj)
diff --git a/migration/savevm.c b/migration/savevm.c
index 72848b9..c2279af 100644
--- a/migration/savevm.c
+++ b/migration/savevm.c
@@ -1603,6 +1603,33 @@ static int qemu_savevm_state(QEMUFile *f, Error **errp)
     return ret;
 }
 
+int qemu_remote_savevm(QEMUFile *f)
+{
+    SaveStateEntry *se;
+    int ret;
+
+    QTAILQ_FOREACH(se, &savevm_state.handlers, entry) {
+        if (!se->vmsd || !vmstate_save_needed(se->vmsd, se->opaque)) {
+            continue;
+        }
+
+        save_section_header(f, se, QEMU_VM_SECTION_FULL);
+
+        ret = vmstate_save(f, se, NULL);
+        if (ret) {
+            qemu_file_set_error(f, ret);
+            return ret;
+        }
+
+        save_section_footer(f, se);
+    }
+
+    qemu_put_byte(f, QEMU_VM_EOF);
+    qemu_fflush(f);
+
+    return 0;
+}
+
 void qemu_savevm_live_state(QEMUFile *f)
 {
     /* save QEMU_VM_SECTION_END section */
@@ -2443,6 +2470,42 @@ qemu_loadvm_section_start_full(QEMUFile *f, MigrationIncomingState *mis)
     return 0;
 }
 
+int qemu_remote_loadvm(QEMUFile *f)
+{
+    uint8_t section_type;
+    int ret = 0;
+
+    qemu_mutex_lock_iothread();
+
+    while (true) {
+        section_type = qemu_get_byte(f);
+
+        if (qemu_file_get_error(f)) {
+            ret = qemu_file_get_error(f);
+            break;
+        }
+
+        switch (section_type) {
+        case QEMU_VM_SECTION_FULL:
+            ret = qemu_loadvm_section_start_full(f, NULL);
+            if (ret < 0) {
+                break;
+            }
+            break;
+        case QEMU_VM_EOF:
+            goto out;
+        default:
+            ret = -EINVAL;
+            goto out;
+        }
+    }
+
+out:
+    qemu_mutex_unlock_iothread();
+
+    return ret;
+}
+
 static int
 qemu_loadvm_section_part_end(QEMUFile *f, MigrationIncomingState *mis)
 {
-- 
1.8.3.1


