Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CFF0848D06
	for <lists+qemu-devel@lfdr.de>; Mon, 17 Jun 2019 20:54:08 +0200 (CEST)
Received: from localhost ([::1]:51134 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hcwlc-00074K-17
	for lists+qemu-devel@lfdr.de; Mon, 17 Jun 2019 14:54:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59258)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <elena.ufimtseva@oracle.com>) id 1hcwC0-00060L-PE
 for qemu-devel@nongnu.org; Mon, 17 Jun 2019 14:17:21 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <elena.ufimtseva@oracle.com>) id 1hcwBz-0002Qt-9g
 for qemu-devel@nongnu.org; Mon, 17 Jun 2019 14:17:20 -0400
Received: from userp2120.oracle.com ([156.151.31.85]:56636)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <elena.ufimtseva@oracle.com>)
 id 1hcwBx-0002Nq-5t
 for qemu-devel@nongnu.org; Mon, 17 Jun 2019 14:17:18 -0400
Received: from pps.filterd (userp2120.oracle.com [127.0.0.1])
 by userp2120.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x5HI8uog159142;
 Mon, 17 Jun 2019 18:17:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id; s=corp-2018-07-02;
 bh=YO8N8nOS0K9k+My27NffQ5m9MVn76qfiiCp83Mmd+2E=;
 b=fKTjME7VOEau9vlnkNK3ybs2QATOoAjc0teN/Ml/i4/1GENRZqJcUTRULEmyYPvl4TVy
 QNTqxHn7X4t5+NOlY4kupCSHyaWegovHTmnPhfeAWue4pCm6Ge/aqrS5ur+tT/HS7xKC
 OClMa3P2vmx7ewpqZKNuQmi1NthQS5R9NHjZ1Wibeqyxkk7vQnPlo7IYgr3Ennu/vgXf
 ITXaDzYiRMFMEJDvKB8yCydMWzxZ8FMzzcupkApQz5vo2+j1s3JQnr+gxRlJWZSNEcY3
 NXiB1XAPaQBAGqR+iIWIAz/ULCpc5gwzI2IfqoLtwtZSqIqLB/IflEj555lCaQOi6IVU SQ== 
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
 by userp2120.oracle.com with ESMTP id 2t4saq7yme-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 17 Jun 2019 18:17:10 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
 by aserp3020.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x5HIGPpe181142;
 Mon, 17 Jun 2019 18:17:10 GMT
Received: from userv0122.oracle.com (userv0122.oracle.com [156.151.31.75])
 by aserp3020.oracle.com with ESMTP id 2t5mgbgben-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 17 Jun 2019 18:17:10 +0000
Received: from abhmp0007.oracle.com (abhmp0007.oracle.com [141.146.116.13])
 by userv0122.oracle.com (8.14.4/8.14.4) with ESMTP id x5HIH8PJ025578;
 Mon, 17 Jun 2019 18:17:09 GMT
Received: from heatpipe.hsd1.ca.comcast.net (/73.170.27.202)
 by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Mon, 17 Jun 2019 11:17:08 -0700
From: elena.ufimtseva@oracle.com
To: qemu-devel@nongnu.org
Date: Mon, 17 Jun 2019 11:17:06 -0700
Message-Id: <20190617181706.30796-1-elena.ufimtseva@oracle.com>
X-Mailer: git-send-email 2.17.1
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9291
 signatures=668687
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=1
 malwarescore=0
 phishscore=0 bulkscore=0 spamscore=0 mlxscore=0 mlxlogscore=999
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.0.1-1810050000 definitions=main-1906170162
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9291
 signatures=668687
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0
 priorityscore=1501 malwarescore=0
 suspectscore=1 phishscore=0 bulkscore=0 spamscore=0 clxscore=1015
 lowpriorityscore=0 mlxscore=0 impostorscore=0 mlxlogscore=999 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1810050000
 definitions=main-1906170162
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [generic]
X-Received-From: 156.151.31.85
Subject: [Qemu-devel] [RFC PATCH v2 35/35] multi-process: add configure and
 usage information
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
 konrad.wilk@oracle.com, ross.lagerwall@citrix.com, liran.alon@oracle.com,
 stefanha@redhat.com, kanth.ghatraju@oracle.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Elena Ufimtseva <elena.ufimtseva@oracle.com>

Signed-off-by: Elena Ufimtseva <elena.ufimtseva@oracle.com>
Signed-off-by: Jagannathan Raman <jag.raman@oracle.com>
Signed-off-by: John G Johnson <john.g.johnson@oracle.com>
---
 Changes in v2:
 - since the changes were made to use existing device/drive options,
 the document was modified to reflect this.
---
 docs/qemu-multiprocess.txt | 59 ++++++++++++++++++++++++++++++++++++++
 1 file changed, 59 insertions(+)
 create mode 100644 docs/qemu-multiprocess.txt

diff --git a/docs/qemu-multiprocess.txt b/docs/qemu-multiprocess.txt
new file mode 100644
index 0000000000..3b11ca9cc2
--- /dev/null
+++ b/docs/qemu-multiprocess.txt
@@ -0,0 +1,59 @@
+Multi-process QEMU
+
+This document describes how to configure and use multi-process qemu.
+For the design document refer to docs/devel/qemu-multiprocess.
+
+Configure
+
+To enable support for multi-process add --enable-mpqemu
+to the list of options for configure.
+
+Usage
+
+Command line
+
+To start qemu with devices intended to run in the separate emulation
+process, the following suboptions are used:
+
+ remote, [socket=[socket_number],|command="command to run",] rid="remote process id" 
+For exmaple, for non multi-process qemu:
+    -device lsi53c895a,id=scsi0 device
+    -device scsi-hd,drive=drive0,bus=scsi0.0,scsi-id=0
+    -drive id=drive0,file=data-disk.img
+
+and for multi-process qemu and no libvirt support (i.e. QEMU forks child processes):
+    -device lsi53c895a,id=scsi0,remote,rid=0,command="qemu-scsi-dev"
+    -device scsi-hd,drive=drive0,bus=scsi0.0,scsi-id=0,remote,rid="0",command="qemu-scsi-dev"
+    -drive id=drive0,file=data-disk.img,remote,rid=0,command="qemu-scsi-dev"
+
+
+The memorybackend object has to be specified on the command line:
+-object memory-backend-file,id=mem,mem-path=/dev/shm/,size=4096M,share=on
+
+
+Example of running scsi drive in the guest in separate qemu
+process:
+
+qemu-system-x86_64 -enable-kvm -machine q35 -smp 4 -m 4096M -vnc :0 \
+-net nic -net user,hostfwd=tcp::5022-:22 -hda os.qcow2 \
+-device lsi53c895a,id=scsi0,remote,rid=0,command="qemu-scsi-dev" \
+-device scsi-hd,drive=drive0,bus=scsi0.0,scsi-id=0,remote,rid="0",command="qemu-scsi-dev" \
+-drive id=drive0,file=data-disk.img,remote,rid=0,command="qemu-scsi-dev" \
+-object memory-backend-file,id=mem,mem-path=/dev/shm/,size=4096M,share=on -numa node,memdev=mem
+
+HMP commands
+
+For hotplugging in multi-process qemu the following commands
+can be used:
+
+- rdevice_add;
+- rdevice_del;
+- rdrive_add;
+- rdrive_del;
+- remote_proc_list
+
+After running rescan_scsi_bus.sh -a, guest will be able to identify newly
+added devices.
+
+
+
-- 
2.17.1


