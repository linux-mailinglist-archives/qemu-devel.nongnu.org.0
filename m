Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AC112DDE03
	for <lists+qemu-devel@lfdr.de>; Fri, 18 Dec 2020 06:25:51 +0100 (CET)
Received: from localhost ([::1]:34328 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kq8H0-0002Es-7q
	for lists+qemu-devel@lfdr.de; Fri, 18 Dec 2020 00:25:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:45670)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <elena.ufimtseva@oracle.com>)
 id 1kq8Ez-0001Qg-68
 for qemu-devel@nongnu.org; Fri, 18 Dec 2020 00:23:45 -0500
Received: from userp2130.oracle.com ([156.151.31.86]:49788)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <elena.ufimtseva@oracle.com>)
 id 1kq8Et-0005Pw-0j
 for qemu-devel@nongnu.org; Fri, 18 Dec 2020 00:23:43 -0500
Received: from pps.filterd (userp2130.oracle.com [127.0.0.1])
 by userp2130.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 0BI5KVqG130100;
 Fri, 18 Dec 2020 05:23:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=corp-2020-01-29;
 bh=Nb7cPWfxobkDv/wfuJIw4Z3aNgO7kD0GOAU0aHKRgd4=;
 b=YFGJjpYbycRzUXbwW+sguybqDNb4azq2TByWUUs2FaNPzl98kxcAluwox2WrqZnShY+U
 +RHt7Y2xZDDaqv1EAbbd8Q/68ujRfQOLyshm+AA9KUDEnOeboNjKarFmoOIbL4GJo4dc
 2U2qa/ex0GJ3Ys4Diae9frjKfXwibaMklCUaX1fxWpMBLOlPdmL67g8DT7wvPwenm2Qz
 1mMmKnyQcptnZEKhK3+rrpqLavjxWBhuPAqtBNgAO9fXuuq5GY4xvls9sq8JsnGBFnoH
 qJ9kdDBYe7YfE93paQ5PNiWgvYe0Z/RGkXeW1YJMLeUd8gPZ7Fr74AUlWoWElKfFjp5z hA== 
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
 by userp2130.oracle.com with ESMTP id 35cn9rrpn9-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
 Fri, 18 Dec 2020 05:23:32 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
 by aserp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 0BI5LLJH009987;
 Fri, 18 Dec 2020 05:21:31 GMT
Received: from userv0121.oracle.com (userv0121.oracle.com [156.151.31.72])
 by aserp3020.oracle.com with ESMTP id 35e6eu9b5y-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 18 Dec 2020 05:21:31 +0000
Received: from abhmp0011.oracle.com (abhmp0011.oracle.com [141.146.116.17])
 by userv0121.oracle.com (8.14.4/8.13.8) with ESMTP id 0BI5LTKQ000831;
 Fri, 18 Dec 2020 05:21:29 GMT
Received: from flaka.hsd1.ca.comcast.net (/10.159.131.68)
 by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Thu, 17 Dec 2020 21:21:28 -0800
From: elena.ufimtseva@oracle.com
To: qemu-devel@nongnu.org
Subject: [PATCH v14 RESEND 02/21] multi-process: add configure and usage
 information
Date: Thu, 17 Dec 2020 21:20:55 -0800
Message-Id: <440d33d0add2c9aadbc75416d6c084c2bca0a240.1608263018.git.elena.ufimtseva@oracle.com>
X-Mailer: git-send-email 2.25.GIT
In-Reply-To: <cover.1608263017.git.elena.ufimtseva@oracle.com>
References: <cover.1608263017.git.elena.ufimtseva@oracle.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9838
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0
 mlxscore=0 phishscore=0
 bulkscore=0 suspectscore=0 malwarescore=0 mlxlogscore=999 spamscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2012180038
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9838
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0
 mlxlogscore=999
 impostorscore=0 lowpriorityscore=0 clxscore=1015 spamscore=0
 malwarescore=0 priorityscore=1501 phishscore=0 mlxscore=0 bulkscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2012180038
Received-SPF: pass client-ip=156.151.31.86;
 envelope-from=elena.ufimtseva@oracle.com; helo=userp2130.oracle.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001,
 T_SPF_TEMPERROR=0.01, UNPARSEABLE_RELAY=0.001 autolearn=ham autolearn_force=no
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
 docs/multi-process.rst | 64 ++++++++++++++++++++++++++++++++++++++++++
 MAINTAINERS            |  1 +
 2 files changed, 65 insertions(+)
 create mode 100644 docs/multi-process.rst

diff --git a/docs/multi-process.rst b/docs/multi-process.rst
new file mode 100644
index 0000000000..46bb0cafc2
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
index c8c29a2814..398973ca91 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -3168,6 +3168,7 @@ M: Jagannathan Raman <jag.raman@oracle.com>
 M: John G Johnson <john.g.johnson@oracle.com>
 S: Maintained
 F: docs/devel/multi-process.rst
+F: docs/multi-process.rst
 
 Build and test automation
 -------------------------
-- 
2.25.GIT


