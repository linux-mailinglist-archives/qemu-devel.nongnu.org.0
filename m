Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 464D12F5468
	for <lists+qemu-devel@lfdr.de>; Wed, 13 Jan 2021 22:03:39 +0100 (CET)
Received: from localhost ([::1]:42004 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kznIo-0000XE-Ae
	for lists+qemu-devel@lfdr.de; Wed, 13 Jan 2021 16:03:38 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58734)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jag.raman@oracle.com>)
 id 1kznBS-0008MA-1S
 for qemu-devel@nongnu.org; Wed, 13 Jan 2021 15:56:02 -0500
Received: from aserp2120.oracle.com ([141.146.126.78]:48026)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jag.raman@oracle.com>)
 id 1kznBQ-0001NO-22
 for qemu-devel@nongnu.org; Wed, 13 Jan 2021 15:56:01 -0500
Received: from pps.filterd (aserp2120.oracle.com [127.0.0.1])
 by aserp2120.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 10DKs6CP045266;
 Wed, 13 Jan 2021 20:55:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : in-reply-to :
 references; s=corp-2020-01-29;
 bh=j7I8jZTG7V173tpLSTR6UGQVSY1F/Dn5gw7Y/52gOrA=;
 b=REaQ1zAKZK2hGjgvWp5De9GiK0hQVhT8UDycTAk8zrF9MV72t/8vNVSnXPD2m5XO7eaf
 PaH0lpH5IS8xs4jdAIV3bVOFqRfBz44DrdYU3lo/+gt3O5wdSS1Ms235e8Ma8zpRjZQN
 yImnHlTb3LHdDVmSNKjqPCauxnY2hCK1tMopGMQb77GX9LEMboj0S0vx3ij4RHgty2Qt
 zy3ML8UD+d6fzkfU5rzLHGj8EnhJfUzT502ZW5NOEZEFq745S90SEZIU96NwvUwHOLbH
 ipQlVSB5huqcQlCgT4dR4amjQZyP7YxJ9ddzZyCLc5M1+r3QJX3UZvtUUS+5/PAt9YZT LQ== 
Received: from userp3030.oracle.com (userp3030.oracle.com [156.151.31.80])
 by aserp2120.oracle.com with ESMTP id 360kcywgpq-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 13 Jan 2021 20:55:54 +0000
Received: from pps.filterd (userp3030.oracle.com [127.0.0.1])
 by userp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 10DKklFL038454;
 Wed, 13 Jan 2021 20:53:54 GMT
Received: from aserv0121.oracle.com (aserv0121.oracle.com [141.146.126.235])
 by userp3030.oracle.com with ESMTP id 360keky5vb-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 13 Jan 2021 20:53:53 +0000
Received: from abhmp0014.oracle.com (abhmp0014.oracle.com [141.146.116.20])
 by aserv0121.oracle.com (8.14.4/8.13.8) with ESMTP id 10DKrpE9022108;
 Wed, 13 Jan 2021 20:53:52 GMT
Received: from jaraman-bur-1.us.oracle.com (/10.152.33.39)
 by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Wed, 13 Jan 2021 12:53:51 -0800
From: Jagannathan Raman <jag.raman@oracle.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v18 02/20] multi-process: add configure and usage information
Date: Wed, 13 Jan 2021 15:53:21 -0500
Message-Id: <a521966a8e98ead282236fcb50fe38de63f307b6.1610570756.git.jag.raman@oracle.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <cover.1610570756.git.jag.raman@oracle.com>
References: <cover.1610570756.git.jag.raman@oracle.com>
In-Reply-To: <cover.1610570756.git.jag.raman@oracle.com>
References: <cover.1610570756.git.jag.raman@oracle.com>
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9863
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0
 phishscore=0 spamscore=0
 malwarescore=0 suspectscore=0 mlxlogscore=999 adultscore=0 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2101130126
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9863
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0
 phishscore=0
 impostorscore=0 bulkscore=0 adultscore=0 suspectscore=0 malwarescore=0
 lowpriorityscore=0 clxscore=1015 mlxlogscore=999 mlxscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2101130127
Received-SPF: pass client-ip=141.146.126.78; envelope-from=jag.raman@oracle.com;
 helo=aserp2120.oracle.com
X-Spam_score_int: -46
X-Spam_score: -4.7
X-Spam_bar: ----
X-Spam_report: (-4.7 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.25,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001, UNPARSEABLE_RELAY=0.001 autolearn=ham autolearn_force=no
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

Adds documentation explaining the command-line arguments needed
to use multi-process.

Signed-off-by: Elena Ufimtseva <elena.ufimtseva@oracle.com>
Signed-off-by: Jagannathan Raman <jag.raman@oracle.com>
Signed-off-by: John G Johnson <john.g.johnson@oracle.com>
Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
---
 docs/multi-process.rst | 64 ++++++++++++++++++++++++++++++++++++++++++++++++++
 MAINTAINERS            |  1 +
 2 files changed, 65 insertions(+)
 create mode 100644 docs/multi-process.rst

diff --git a/docs/multi-process.rst b/docs/multi-process.rst
new file mode 100644
index 0000000..46bb0ca
--- /dev/null
+++ b/docs/multi-process.rst
@@ -0,0 +1,64 @@
+Multi-process QEMU
+==================
+
+This document describes how to configure and use multi-process qemu.
+For the design document refer to docs/devel/qemu-multiprocess.
+
+1) Configuration
+----------------
+
+multi-process is enabled by default for targets that enable KVM
+
+
+2) Usage
+--------
+
+Multi-process QEMU requires an orchestrator to launch.
+
+Following is a description of command-line used to launch mpqemu.
+
+* Orchestrator:
+
+  - The Orchestrator creates a unix socketpair
+
+  - It launches the remote process and passes one of the
+    sockets to it via command-line.
+
+  - It then launches QEMU and specifies the other socket as an option
+    to the Proxy device object
+
+* Remote Process:
+
+  - QEMU can enter remote process mode by using the "remote" machine
+    option.
+
+  - The orchestrator creates a "remote-object" with details about
+    the device and the file descriptor for the device
+
+  - The remaining options are no different from how one launches QEMU with
+    devices.
+
+  - Example command-line for the remote process is as follows:
+
+      /usr/bin/qemu-system-x86_64                                        \
+      -machine x-remote                                                  \
+      -device lsi53c895a,id=lsi0                                         \
+      -drive id=drive_image2,file=/build/ol7-nvme-test-1.qcow2           \
+      -device scsi-hd,id=drive2,drive=drive_image2,bus=lsi0.0,scsi-id=0  \
+      -object x-remote-object,id=robj1,devid=lsi1,fd=4,
+
+* QEMU:
+
+  - Since parts of the RAM are shared between QEMU & remote process, a
+    memory-backend-memfd is required to facilitate this, as follows:
+
+    -object memory-backend-memfd,id=mem,size=2G
+
+  - A "x-pci-proxy-dev" device is created for each of the PCI devices emulated
+    in the remote process. A "socket" sub-option specifies the other end of
+    unix channel created by orchestrator. The "id" sub-option must be specified
+    and should be the same as the "id" specified for the remote PCI device
+
+  - Example commandline for QEMU is as follows:
+
+      -device x-pci-proxy-dev,id=lsi0,socket=3
diff --git a/MAINTAINERS b/MAINTAINERS
index 1accf97..fa14d8d 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -3186,6 +3186,7 @@ M: Jagannathan Raman <jag.raman@oracle.com>
 M: John G Johnson <john.g.johnson@oracle.com>
 S: Maintained
 F: docs/devel/multi-process.rst
+F: docs/multi-process.rst
 
 Build and test automation
 -------------------------
-- 
1.8.3.1


