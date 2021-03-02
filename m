Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 712F132AC0D
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Mar 2021 22:07:12 +0100 (CET)
Received: from localhost ([::1]:49144 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lHCEZ-0004eW-G5
	for lists+qemu-devel@lfdr.de; Tue, 02 Mar 2021 16:07:11 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:45940)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dovmurik@linux.vnet.ibm.com>)
 id 1lHBx1-0001yt-Fj
 for qemu-devel@nongnu.org; Tue, 02 Mar 2021 15:49:03 -0500
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:26374)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dovmurik@linux.vnet.ibm.com>)
 id 1lHBwp-000879-4Q
 for qemu-devel@nongnu.org; Tue, 02 Mar 2021 15:48:56 -0500
Received: from pps.filterd (m0098399.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 122KiCZM092135; Tue, 2 Mar 2021 15:48:37 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=u7CCu3RoiU0rv7aH0pLqzRk11ep6jKjG3kUDpdwQ/1o=;
 b=H1wXrZk4hLr5Dh0X+ucZLT4hvghJV9ig7Aii1wBfI4bTr7jVFmfnC3QSH48g0wXsyMo+
 6KGFbMRf/QZA/QxAr/TxHjfHWYbK95jJT9LUwRPL2xNLPA00Yma8PC1q3utE1/UG0XNN
 ng9WL0OrqbKnq6E1TofHnVQsPWGiaI8dt97AU4IUAE8ivPASve8gGNQNMf02176Mzr0+
 zEY9nzbTWJq3afEA31lFnCaA+HtrGEVzowQfQ69ZmFHFOVpdUWSJeBpkkm2Z8ekO2ZvR
 6I9iq9yxItnATGjOnPw9Gg4P9lu8gbPpM+tAmokI6pFQQiyM7CklY/O2qfBbASi/6H1M 2A== 
Received: from ppma01dal.us.ibm.com (83.d6.3fa9.ip4.static.sl-reverse.com
 [169.63.214.131])
 by mx0a-001b2d01.pphosted.com with ESMTP id 371vnf0678-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 02 Mar 2021 15:48:37 -0500
Received: from pps.filterd (ppma01dal.us.ibm.com [127.0.0.1])
 by ppma01dal.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 122Kkp3P028076;
 Tue, 2 Mar 2021 20:48:36 GMT
Received: from b01cxnp23032.gho.pok.ibm.com (b01cxnp23032.gho.pok.ibm.com
 [9.57.198.27]) by ppma01dal.us.ibm.com with ESMTP id 371qmuagux-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 02 Mar 2021 20:48:36 +0000
Received: from b01ledav001.gho.pok.ibm.com (b01ledav001.gho.pok.ibm.com
 [9.57.199.106])
 by b01cxnp23032.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 122KmZU626280304
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 2 Mar 2021 20:48:35 GMT
Received: from b01ledav001.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 5D8A428059;
 Tue,  2 Mar 2021 20:48:35 +0000 (GMT)
Received: from b01ledav001.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 2FCD22805A;
 Tue,  2 Mar 2021 20:48:35 +0000 (GMT)
Received: from amdrome1.watson.ibm.com (unknown [9.2.130.16])
 by b01ledav001.gho.pok.ibm.com (Postfix) with ESMTP;
 Tue,  2 Mar 2021 20:48:35 +0000 (GMT)
From: Dov Murik <dovmurik@linux.vnet.ibm.com>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH 26/26] docs: Add confidential guest live migration
 documentation
Date: Tue,  2 Mar 2021 15:48:22 -0500
Message-Id: <20210302204822.81901-27-dovmurik@linux.vnet.ibm.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210302204822.81901-1-dovmurik@linux.vnet.ibm.com>
References: <20210302204822.81901-1-dovmurik@linux.vnet.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.369, 18.0.761
 definitions=2021-03-02_08:2021-03-01,
 2021-03-02 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 mlxlogscore=999
 malwarescore=0 impostorscore=0 phishscore=0 bulkscore=0 lowpriorityscore=0
 mlxscore=0 suspectscore=0 priorityscore=1501 spamscore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2103020156
Received-SPF: none client-ip=148.163.156.1;
 envelope-from=dovmurik@linux.vnet.ibm.com; helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -26
X-Spam_score: -2.7
X-Spam_bar: --
X-Spam_report: (-2.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_LOW=-0.7,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Cc: Tom Lendacky <thomas.lendacky@amd.com>, Ashish Kalra <ashish.kalra@amd.com>,
 Brijesh Singh <brijesh.singh@amd.com>, James Bottomley <jejb@linux.ibm.com>,
 Jon Grimm <jon.grimm@amd.com>, Tobin Feldman-Fitzthum <tobin@ibm.com>,
 Dov Murik <dovmurik@linux.vnet.ibm.com>, Hubertus Franke <frankeh@us.ibm.com>,
 Tobin Feldman-Fitzthum <tobin@linux.ibm.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The new page is linked from the main index, otherwise sphinx complains
that "document isn't included in any toctree"; I assume there would be a
better place for it in the documentation tree.

Signed-off-by: Dov Murik <dovmurik@linux.vnet.ibm.com>
---
 docs/confidential-guest-live-migration.rst | 142 +++++++++++++++++++++
 docs/confidential-guest-support.txt        |   5 +
 docs/index.rst                             |   1 +
 3 files changed, 148 insertions(+)
 create mode 100644 docs/confidential-guest-live-migration.rst

diff --git a/docs/confidential-guest-live-migration.rst b/docs/confidential-guest-live-migration.rst
new file mode 100644
index 0000000000..dc59df8f9c
--- /dev/null
+++ b/docs/confidential-guest-live-migration.rst
@@ -0,0 +1,142 @@
+=================================
+Confidential Guest Live Migration
+=================================
+
+When migrating regular QEMU guests, QEMU reads the guest's RAM and sends it
+over to the migration target host, where QEMU there writes it into the target
+guest's RAM and starts the VM.  This mechanism doesn't work when the guest
+memory is encrypted or QEMU is prevented from reading it in another way.
+
+In order to support live migration in such scenarios, QEMU relies on an
+in-guest migration helper which can securely extract RAM content from the
+guest in order to send it to the target.  The migration helper is implemented as
+part of the VM's firmware in OVMF.
+
+
+Migration flow
+==============
+
+Source VM
+---------
+
+The source VM is started with an extra auxiliary vcpu which is not listed in the
+ACPI tables.  OVMF uses this vcpu and starts a dedicated migration helper on it;
+the migration helper simply waits for commands from QEMU.  When migration starts
+using the ``migrate`` command, QEMU starts saving the state of the different
+devices.  When it reaches saving RAM pages, it'll check for each page whether it
+is encrypted or not; for encrypted pages, it'll send a command to the migration
+helper to extract the given page.  The migration helper receives this command,
+reads the page content, encrypts it with a transport key, and returns the
+newly-encrypted page to QEMU.  QEMU saves those pages to the outgoing migration
+stream using a new page flag ``RAM_SAVE_FLAG_GUEST_ENCRYPTED_PAGE``.
+
+When QEMU reaches the last stage of RAM migration, it stops the source VM to
+avoid dirtying the last pages of RAM.  However, the auxiliary vcpu must be kept
+running so the migration helper can still extract pages from the guest memory.
+
+Target VM
+---------
+
+Usually QEMU migration target VMs are started with the ``-incoming``
+command-line option which starts the VM paused.  However, in order to migrate
+confidential guests we must have the migration helper running inside the guest;
+in such a case, we start the target with a special ``-fw_cfg`` value that tells
+OVMF to enter a CPU dead loop on all vcpus except the auxiliary vcpu, which runs
+the migration helper.  After this short "boot" completes, QEMU can switch to the
+"migration incoming" mode; we do that with the new ``start-migrate-incoming``
+QMP command that makes the target VM listen for incoming migration connections.
+
+QEMU will load the state of VM devices as it arrives from the incoming migration
+stream.  When it encounters a RAM page with the
+``RAM_SAVE_FLAG_GUEST_ENCRYPTED_PAGE`` flag, it will send its
+transport-encrypted content and guest physical address to the migration helper.
+The migration helper running inside the guest will decrypt the page using the
+transport key and place the content in memory (again, that memory page is not
+accessible to host due to the confidential guest properties; for example, in SEV
+it is hardware-encrypted with a VM-specific key).
+
+
+Usage
+=====
+
+In order to start the source and target VMs with auxiliary CPUs, the auxcpus=
+option must be passed to ``-smp`` . For example::
+
+    # ${QEMU} -smp 5,auxcpus=1 ...
+
+This command starts a VM with 5 vcpus of which 4 are main vcpus (available for
+the guest OS) and 1 is auxliary vcpu.
+
+Moreover, in both the source and target we need to instruct OVMF to start the
+migration helper running in the auxiliary vcpu.  This is achieved using the
+following command-line option::
+
+    # ${QEMU} -fw_cfg name=opt/ovmf/PcdSevIsMigrationHelper,string=0 ...
+
+In the target VM we need to add another ``-fw_cfg`` entry to instruct OVMF to
+start only the migration helepr, which will wait for incoming pages (the target
+cannot be started with ``-incoming`` because that option completely pauses the
+VM, not allowing the migration helper to run). Because the migration helper must
+be running when the incoming RAM pages are received, starting the target VM with
+the ``-incoming`` option doesn't work (with that option, the VM doesn't start
+executing).  Instead, start the target VM without ``-incoming`` but with the
+following option::
+
+    # ${QEMU} -fw_cfg name=opt/ovmf/PcdSevIsMigrationTarget,string=1 ...
+
+After the VM boots into the migration helper, we instruct QEMU to listen for
+incoming migration connections by sending the following QMP command::
+
+    { "execute": "start-migrate-incoming",
+      "arguments": { "uri": "tcp:0.0.0.0:6666" } }
+
+Now that the target is ready, we instruct the source VM to start migrating its
+state using the regular ``migrate`` QMP command, supplying the target VMs
+listening address::
+
+    { "execute": "migrate",
+      "arguments": { "uri": "tcp:192.168.111.222:6666" } }
+
+
+Implementation details
+======================
+
+Migration helper <-> QEMU communication
+---------------------------------------
+
+The migration helper is running inside the guest (implemented as part of OVMF).
+QEMU communicates with it using a mailbox protocol over two shared (unencrypted)
+4K RAM pages.
+
+The first page contains a ``SevMigHelperCmdParams`` struct at offset 0x0
+(``cmd_params``) and a ``MigrationHelperHeader`` struct at offset 0x800
+(``io_hdr``).  The second page (``io_page``) is dedicated for encrypted page
+content.
+
+In order to save a confidential RAM page, QEMU will fill the ``cmd_params``
+struct to indicate the SEV_MIG_HELPER_CMD_ENCRYPT command and the requested gpa
+(guest physical address), and then set the ``go`` field to 1.  Meanwhile the
+migration helper waits for the ``go`` field to become non-zero; after it notices
+``go`` is 1 it'll read the gpa, read the content of the relevant page from the
+guest's memory, encrypt it with the transport key, and store the
+transport-encrypted page in the the ``io_page``.  Additional envelope data like
+encryption IV and other fields are stored in ``io_hdr``.  After the migration is
+done writing to ``io_page`` and ``io_hdr``, it sets the ``done`` field to 1.  At
+this point QEMU notices that the migration helper is done and can continue its
+part, which is saving the header and page to the outgoing migration stream.
+
+Similar process is used when loading a confidential RAM from the incoming
+migration stream.  QEMU reads the header and the encrypted page from the stream,
+and copies them into the shared areas ``io_hdr`` and ``io_page`` respectably.
+It then fills the ``cmd_params`` struct to indicate the
+SEV_MIG_HELPER_CMD_DECRYPT command and the gpa, and sets ``go`` to 1.  The
+migration helper will notice the command, will decrypt the page using the
+transport key and will place the decrypted content in the requetsed gpa, and set
+``done`` to 1 to allow QEMU to continue processing the next item in the incoming
+migration stream.
+
+Shared pages address discovery
+------------------------------
+In the current implementation the address of the two shared pages is hard-coded
+in both OVMF and QEMU.  We plan for OVMF to expose this address via its GUIDed
+table and let QEMU discover it using ``pc_system_ovmf_table_find()``.
diff --git a/docs/confidential-guest-support.txt b/docs/confidential-guest-support.txt
index 71d07ba57a..bed1601fbb 100644
--- a/docs/confidential-guest-support.txt
+++ b/docs/confidential-guest-support.txt
@@ -47,3 +47,8 @@ s390x Protected Virtualization (PV)
     docs/system/s390x/protvirt.rst
 
 Other mechanisms may be supported in future.
+
+Live migration support
+----------------------
+Details regarding confidential guest live migration are in:
+    docs/confidential-guest-live-migration.rst
diff --git a/docs/index.rst b/docs/index.rst
index 763e3d0426..6f797d050a 100644
--- a/docs/index.rst
+++ b/docs/index.rst
@@ -16,3 +16,4 @@ Welcome to QEMU's documentation!
    interop/index
    specs/index
    devel/index
+   confidential-guest-live-migration
-- 
2.20.1


