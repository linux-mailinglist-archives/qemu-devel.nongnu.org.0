Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CDDFC1CDA2E
	for <lists+qemu-devel@lfdr.de>; Mon, 11 May 2020 14:39:23 +0200 (CEST)
Received: from localhost ([::1]:52098 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jY7iM-00043i-G2
	for lists+qemu-devel@lfdr.de; Mon, 11 May 2020 08:39:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37682)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lukasstraub2@web.de>)
 id 1jY7Wr-0006Cm-IA
 for qemu-devel@nongnu.org; Mon, 11 May 2020 08:27:29 -0400
Received: from mout.web.de ([212.227.15.4]:55515)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <lukasstraub2@web.de>)
 id 1jY7Wo-0005yR-2B
 for qemu-devel@nongnu.org; Mon, 11 May 2020 08:27:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=web.de;
 s=dbaedf251592; t=1589200021;
 bh=lTo/JhFEDXuaNPIN05x18j+fNnceZj6xEwdn8WEqPAw=;
 h=X-UI-Sender-Class:Date:From:To:Cc:Subject:In-Reply-To:References;
 b=GUXFlATa8ommnNtWM7CGrbCBwipX8X5m2kyb6/eElw7Y0TGA5P/je++dlYzr+OAd0
 ptIANqKfruguxBsfBSKG8KC8DPZLD4+6N0v39NrkPnx6klJ9oH8ITF9mkdmn8h7LdT
 xZOyPFchplpODPyX/WUlCLGK4DIOdzlRCIzXptt0=
X-UI-Sender-Class: c548c8c5-30a9-4db5-a2e7-cb6cb037b8f9
Received: from luklap ([89.247.255.192]) by smtp.web.de (mrweb003
 [213.165.67.108]) with ESMTPSA (Nemesis) id 0MCZfe-1jPuKM2IWg-009SMB; Mon, 11
 May 2020 14:27:00 +0200
Date: Mon, 11 May 2020 14:26:59 +0200
From: Lukas Straub <lukasstraub2@web.de>
To: qemu-devel <qemu-devel@nongnu.org>
Subject: [PATCH 2/5] colo: Introduce resource agent
Message-ID: <de79d173649d447080fb7a16ca58577b47135e19.1589199922.git.lukasstraub2@web.de>
In-Reply-To: <cover.1589199922.git.lukasstraub2@web.de>
References: <cover.1589199922.git.lukasstraub2@web.de>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/5n6P0EL_SzrpOrGjqvGWcRK";
 protocol="application/pgp-signature"; micalg=pgp-sha512
X-Provags-ID: V03:K1:YPEVo7+1CZztij583vqrkWMCJHFMxR/TCg8LguO2E7ugsHVKDIp
 vR1PbhLr0gzCWzln2sEB4Hs5dqzhT01XphsC8xcRkWuxdi2AAYMPgNXwYVdI7VMCBLW0xix
 lXXgNbOUeJM6/pgwyBrVdcBN+UU4psdfcX6pX0G/0jtkO8nK0IKhetFAoaNvRFr/1iO2egN
 jZ1jrgI94Rw2QF1N199Tg==
X-UI-Out-Filterresults: notjunk:1;V03:K0:LXUoRgrMmNo=:5Xyc2ZMIydu9WPWEIFpXYl
 Nf/OIdy35fqHyIjp0BovuDn67NTyUPN1wrYWy/u7A8U6ECroPFSz6vck1jN/06Jd4eKj6r+yP
 hsVlLR9ENF0eABUfIscQkpRta9P+rBQtITAWwBvJdbslYnBsNg6RkFcBMUFUs8fJfqdXykjrH
 /UUx9vouRwHF5WmPm0TSlM1uhK4ivAHSRYUf9HLcvEV2UFg0TOjO7MWyF6Ml6KDfmwlZOE8TL
 LnDi45aTuXEcSNjQdRE9jwjOwv51TKkgUHZBf6pAxfF0IZ3s8+5JBbqWQwPoXNEoBLe0avfEm
 PmsSuCLtJP5dCeWGfmTbvEXkitaZYEfLWd9YifE0TJY2XoiOEaet5JGMO986sPRn1h87OOmuT
 rIM+W70/3VIKXPPwj320Hweh8HJoMhPP3bGLhp/ZnP4Rv5ZC6yAFfMFjeeHXIs0vZlJnGfkBD
 VuI4kFRALeKVXYyuJbgQLCahrYc5eZZor0pHWpn1/m77UqhUAmBHxHrDfd8pWVkJiLbl3u2N1
 gunpAXZXSGm+e6e8T9D/2+q+75V9/4bjF19Au/furX/36Uke5/nXwPkqvcn5mnz58Icn1yBvk
 dtj4Wk5vWFEIahG6s929ffIN/yhEKWkRFY0eIf9AmWYMixIKpHcFvIzSj5ofdu0JRn/7Me14g
 2PernnHt0yloa9PyIv2QCNXJsV+zepv9Zb+tTTImt726tPARfei+qxp4TQL5dgEEKsQlKZyrW
 eVrrSSVbtuX23iE+BONC5zaH9bHRtMUHWSspPNyRrGehxWEByLu4NJGL6T8+cA6vsMC2NpyNN
 tL55JoDDnZQhosx7GMIFQpZJGUKkiW+dsBJEa9gh2OuTMvxzjWpFUyA/8n2msr2Sb7uiBKZ15
 P13qSe20SsWZH4aqz/+WL8SFJV9kgSZIM+L5ti84L8OIyRuEBkRh3StCnnb57kvqHrwVPHV+b
 mvghXmpXdJN92fVOOGhvfadx9Ra1GnykvxBloTEZwtt4a6qsnQuZCRNOKQ2mT0S3qdKzpM7vq
 N0RrwS59X5RsKs3mLpmk/SxmJ/J1+DlcbVFSw0YlBODAhNmIVtotiRAR8zuA5Ysil2Tv8XPb7
 igRLbDrqN1iy3a0+HiU2jYJxhrbHFP+pkjM5iFjR5+exhcYkFPmy1khR5Rrd1r8r0lxJIhOro
 gp6MHE0nnBFdDeZfZir1QrVJd2zF2nbytcZ2l2tLFwaEpMTT4LodEG951G8/lbrkLf8ES5i2r
 xWxcTBM2j0dP466dl
Received-SPF: pass client-ip=212.227.15.4; envelope-from=lukasstraub2@web.de;
 helo=mout.web.de
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/05/11 07:14:42
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic]
X-Spam_score_int: -24
X-Spam_score: -2.5
X-Spam_bar: --
X-Spam_report: (-2.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, RCVD_IN_DNSWL_LOW=-0.7,
 RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_PASS=-0.001,
 URIBL_BLOCKED=0.001, WEIRD_QUOTING=0.001 autolearn=_AUTOLEARN
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
Cc: Zhang Chen <chen.zhang@intel.com>, Alberto Garcia <berto@igalia.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--Sig_/5n6P0EL_SzrpOrGjqvGWcRK
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Introduce a resource agent which can be used to manage qemu COLO
in a pacemaker cluster.

Signed-off-by: Lukas Straub <lukasstraub2@web.de>
---
 scripts/colo-resource-agent/colo | 1429 ++++++++++++++++++++++++++++++
 1 file changed, 1429 insertions(+)
 create mode 100755 scripts/colo-resource-agent/colo

diff --git a/scripts/colo-resource-agent/colo b/scripts/colo-resource-agent=
/colo
new file mode 100755
index 0000000000..fbc5dc2c13
--- /dev/null
+++ b/scripts/colo-resource-agent/colo
@@ -0,0 +1,1429 @@
+#!/usr/bin/env python3
+
+# Resource agent for qemu COLO for use with Pacemaker CRM
+#
+# Copyright (c) Lukas Straub <lukasstraub2@web.de>
+#
+# This work is licensed under the terms of the GNU GPL, version 2 or
+# later.  See the COPYING file in the top-level directory.
+
+from __future__ import print_function
+import subprocess
+import sys
+import os
+import os.path
+import signal
+import socket
+import select
+import json
+import re
+import time
+import logging
+import logging.handlers
+
+# Constants
+OCF_SUCCESS =3D 0
+OCF_ERR_GENERIC =3D 1
+OCF_ERR_ARGS =3D 2
+OCF_ERR_UNIMPLEMENTED =3D 3
+OCF_ERR_PERM =3D 4
+OCF_ERR_INSTALLED =3D 5
+OCF_ERR_CONFIGURED =3D 6
+OCF_NOT_RUNNING =3D 7
+OCF_RUNNING_MASTER =3D 8
+OCF_FAILED_MASTER =3D 9
+
+# Get environment variables
+OCF_RESKEY_CRM_meta_notify_type \
+    =3D os.getenv("OCF_RESKEY_CRM_meta_notify_type")
+OCF_RESKEY_CRM_meta_notify_operation \
+    =3D os.getenv("OCF_RESKEY_CRM_meta_notify_operation")
+OCF_RESKEY_CRM_meta_notify_key_operation \
+    =3D os.getenv("OCF_RESKEY_CRM_meta_notify_key_operation")
+OCF_RESKEY_CRM_meta_notify_start_uname \
+    =3D os.getenv("OCF_RESKEY_CRM_meta_notify_start_uname", "")
+OCF_RESKEY_CRM_meta_notify_stop_uname \
+    =3D os.getenv("OCF_RESKEY_CRM_meta_notify_stop_uname", "")
+OCF_RESKEY_CRM_meta_notify_active_uname \
+    =3D os.getenv("OCF_RESKEY_CRM_meta_notify_active_uname", "")
+OCF_RESKEY_CRM_meta_notify_promote_uname \
+    =3D os.getenv("OCF_RESKEY_CRM_meta_notify_promote_uname", "")
+OCF_RESKEY_CRM_meta_notify_demote_uname \
+    =3D os.getenv("OCF_RESKEY_CRM_meta_notify_demote_uname", "")
+OCF_RESKEY_CRM_meta_notify_master_uname \
+    =3D os.getenv("OCF_RESKEY_CRM_meta_notify_master_uname", "")
+OCF_RESKEY_CRM_meta_notify_slave_uname \
+    =3D os.getenv("OCF_RESKEY_CRM_meta_notify_slave_uname", "")
+
+HA_RSCTMP =3D os.getenv("HA_RSCTMP", "/run/resource-agents")
+HA_LOGFACILITY =3D os.getenv("HA_LOGFACILITY")
+HA_LOGFILE =3D os.getenv("HA_LOGFILE")
+HA_DEBUG =3D os.getenv("HA_debug", "0")
+HA_DEBUGLOG =3D os.getenv("HA_DEBUGLOG")
+OCF_RESOURCE_INSTANCE =3D os.getenv("OCF_RESOURCE_INSTANCE", "default-inst=
ance")
+OCF_RESKEY_CRM_meta_timeout \
+    =3D os.getenv("OCF_RESKEY_CRM_meta_timeout", "60000")
+OCF_RESKEY_CRM_meta_interval \
+    =3D int(os.getenv("OCF_RESKEY_CRM_meta_interval", "1"))
+OCF_RESKEY_CRM_meta_clone_max \
+    =3D int(os.getenv("OCF_RESKEY_CRM_meta_clone_max", "1"))
+OCF_RESKEY_CRM_meta_clone_node_max \
+    =3D int(os.getenv("OCF_RESKEY_CRM_meta_clone_node_max", "1"))
+OCF_RESKEY_CRM_meta_master_max \
+    =3D int(os.getenv("OCF_RESKEY_CRM_meta_master_max", "1"))
+OCF_RESKEY_CRM_meta_master_node_max \
+    =3D int(os.getenv("OCF_RESKEY_CRM_meta_master_node_max", "1"))
+OCF_RESKEY_CRM_meta_notify \
+    =3D os.getenv("OCF_RESKEY_CRM_meta_notify")
+OCF_RESKEY_CRM_meta_globally_unique \
+    =3D os.getenv("OCF_RESKEY_CRM_meta_globally_unique")
+
+HOSTNAME =3D os.getenv("OCF_RESKEY_CRM_meta_on_node", socket.gethostname())
+
+OCF_ACTION =3D os.getenv("__OCF_ACTION")
+if not OCF_ACTION and len(sys.argv) =3D=3D 2:
+    OCF_ACTION =3D sys.argv[1]
+
+# Resource parameters
+OCF_RESKEY_qemu_binary_default =3D "qemu-system-x86_64"
+OCF_RESKEY_qemu_img_binary_default =3D "qemu-img"
+OCF_RESKEY_log_dir_default =3D HA_RSCTMP
+OCF_RESKEY_options_default =3D ""
+OCF_RESKEY_disk_size_default =3D ""
+OCF_RESKEY_active_hidden_dir_default =3D ""
+OCF_RESKEY_listen_address_default =3D "0.0.0.0"
+OCF_RESKEY_base_port_default =3D "9000"
+OCF_RESKEY_checkpoint_interval_default =3D "20000"
+OCF_RESKEY_compare_timeout_default =3D "3000"
+OCF_RESKEY_expired_scan_cycle_default =3D "3000"
+OCF_RESKEY_use_filter_rewriter_default =3D "true"
+OCF_RESKEY_vnet_hdr_default =3D "false"
+OCF_RESKEY_max_disk_errors_default =3D "1"
+OCF_RESKEY_monitor_timeout_default =3D "20000"
+OCF_RESKEY_yank_timeout_default =3D "10000"
+OCF_RESKEY_fail_fast_timeout_default =3D "5000"
+OCF_RESKEY_debug_default =3D "0"
+
+OCF_RESKEY_qemu_binary \
+    =3D os.getenv("OCF_RESKEY_qemu_binary", OCF_RESKEY_qemu_binary_default)
+OCF_RESKEY_qemu_img_binary \
+    =3D os.getenv("OCF_RESKEY_qemu_img_binary", OCF_RESKEY_qemu_img_binary=
_default)
+OCF_RESKEY_log_dir \
+    =3D os.getenv("OCF_RESKEY_log_dir", OCF_RESKEY_log_dir_default)
+OCF_RESKEY_options \
+    =3D os.getenv("OCF_RESKEY_options", OCF_RESKEY_options_default)
+OCF_RESKEY_disk_size \
+    =3D os.getenv("OCF_RESKEY_disk_size", OCF_RESKEY_disk_size_default)
+OCF_RESKEY_active_hidden_dir \
+    =3D os.getenv("OCF_RESKEY_active_hidden_dir", OCF_RESKEY_active_hidden=
_dir_default)
+OCF_RESKEY_listen_address \
+    =3D os.getenv("OCF_RESKEY_listen_address", OCF_RESKEY_listen_address_d=
efault)
+OCF_RESKEY_base_port \
+    =3D os.getenv("OCF_RESKEY_base_port", OCF_RESKEY_base_port_default)
+OCF_RESKEY_checkpoint_interval \
+    =3D os.getenv("OCF_RESKEY_checkpoint_interval", OCF_RESKEY_checkpoint_=
interval_default)
+OCF_RESKEY_compare_timeout \
+    =3D os.getenv("OCF_RESKEY_compare_timeout", OCF_RESKEY_compare_timeout=
_default)
+OCF_RESKEY_expired_scan_cycle \
+    =3D os.getenv("OCF_RESKEY_expired_scan_cycle", OCF_RESKEY_expired_scan=
_cycle_default)
+OCF_RESKEY_use_filter_rewriter \
+    =3D os.getenv("OCF_RESKEY_use_filter_rewriter", OCF_RESKEY_use_filter_=
rewriter_default)
+OCF_RESKEY_vnet_hdr \
+    =3D os.getenv("OCF_RESKEY_vnet_hdr", OCF_RESKEY_vnet_hdr_default)
+OCF_RESKEY_max_disk_errors \
+    =3D os.getenv("OCF_RESKEY_max_disk_errors", OCF_RESKEY_max_disk_errors=
_default)
+OCF_RESKEY_monitor_timeout \
+    =3D os.getenv("OCF_RESKEY_monitor_timeout", OCF_RESKEY_monitor_timeout=
_default)
+OCF_RESKEY_yank_timeout \
+    =3D os.getenv("OCF_RESKEY_yank_timeout", OCF_RESKEY_yank_timeout_defau=
lt)
+OCF_RESKEY_fail_fast_timeout \
+    =3D os.getenv("OCF_RESKEY_fail_fast_timeout", OCF_RESKEY_fail_fast_tim=
eout_default)
+OCF_RESKEY_debug \
+    =3D os.getenv("OCF_RESKEY_debug", OCF_RESKEY_debug_default)
+
+ACTIVE_IMAGE =3D os.path.join(OCF_RESKEY_active_hidden_dir, \
+                            OCF_RESOURCE_INSTANCE + "-active.qcow2")
+HIDDEN_IMAGE =3D os.path.join(OCF_RESKEY_active_hidden_dir, \
+                            OCF_RESOURCE_INSTANCE + "-hidden.qcow2")
+
+QMP_SOCK =3D os.path.join(HA_RSCTMP, OCF_RESOURCE_INSTANCE + "-qmp.sock")
+HELPER_SOCK =3D os.path.join(HA_RSCTMP, OCF_RESOURCE_INSTANCE + "-helper.s=
ock")
+COMP_SOCK =3D os.path.join(HA_RSCTMP, OCF_RESOURCE_INSTANCE + "-compare.so=
ck")
+COMP_OUT_SOCK =3D os.path.join(HA_RSCTMP, OCF_RESOURCE_INSTANCE \
+                                        + "-comp_out.sock")
+
+PID_FILE =3D os.path.join(HA_RSCTMP, OCF_RESOURCE_INSTANCE + "-qemu.pid")
+
+QMP_LOG =3D os.path.join(OCF_RESKEY_log_dir, OCF_RESOURCE_INSTANCE + "-qmp=
.log")
+QEMU_LOG =3D os.path.join(OCF_RESKEY_log_dir, OCF_RESOURCE_INSTANCE + "-qe=
mu.log")
+HELPER_LOG =3D os.path.join(OCF_RESKEY_log_dir, OCF_RESOURCE_INSTANCE \
+                                                                + "-helper=
.log")
+
+START_TIME =3D time.time()
+did_yank =3D False
+
+# Exception only raised by ourself
+class Error(Exception):
+    pass
+
+def setup_constants():
+    # This function is called after the parameters where validated
+    global OCF_RESKEY_CRM_meta_timeout
+    if OCF_ACTION =3D=3D "monitor":
+        OCF_RESKEY_CRM_meta_timeout =3D OCF_RESKEY_monitor_timeout
+
+    global MIGRATE_PORT, MIRROR_PORT, COMPARE_IN_PORT, NBD_PORT
+    MIGRATE_PORT =3D int(OCF_RESKEY_base_port)
+    MIRROR_PORT =3D int(OCF_RESKEY_base_port) + 1
+    COMPARE_IN_PORT =3D int(OCF_RESKEY_base_port) + 2
+    NBD_PORT =3D int(OCF_RESKEY_base_port) + 3
+
+    global QEMU_PRIMARY_CMDLINE
+    QEMU_PRIMARY_CMDLINE =3D \
+        ("'%(OCF_RESKEY_qemu_binary)s' %(OCF_RESKEY_options)s"
+        " -drive if=3Dnone,node-name=3Dcolo-disk0,driver=3Dquorum,read-pat=
tern=3Dfifo,"
+        "vote-threshold=3D1,children.0=3Dparent0"
+        " -qmp unix:'%(QMP_SOCK)s',server,nowait"
+        " -daemonize -D '%(QEMU_LOG)s' -pidfile '%(PID_FILE)s'") % globals=
()
+
+    global QEMU_SECONDARY_CMDLINE
+    QEMU_SECONDARY_CMDLINE =3D \
+        ("'%(OCF_RESKEY_qemu_binary)s' %(OCF_RESKEY_options)s"
+        " -chardev socket,id=3Dred0,host=3D'%(OCF_RESKEY_listen_address)s'=
,"
+        "port=3D%(MIRROR_PORT)s,server,nowait,nodelay,yank"
+        " -chardev socket,id=3Dred1,host=3D'%(OCF_RESKEY_listen_address)s'=
,"
+        "port=3D%(COMPARE_IN_PORT)s,server,nowait,nodelay,yank"
+        " -object filter-redirector,id=3Df1,netdev=3Dhn0,queue=3Dtx,indev=
=3Dred0"
+        " -object filter-redirector,id=3Df2,netdev=3Dhn0,queue=3Drx,outdev=
=3Dred1") \
+        % globals()
+
+    if is_true(OCF_RESKEY_use_filter_rewriter):
+        QEMU_SECONDARY_CMDLINE +=3D \
+            " -object filter-rewriter,id=3Drew0,netdev=3Dhn0,queue=3Dall"
+
+    QEMU_SECONDARY_CMDLINE +=3D \
+        (" -drive if=3Dnone,node-name=3Dchilds0,top-id=3Dcolo-disk0,"
+        "driver=3Dreplication,mode=3Dsecondary,file.driver=3Dqcow2,"
+        "file.file.filename=3D'%(ACTIVE_IMAGE)s',file.backing.driver=3Dqco=
w2,"
+        "file.backing.file.filename=3D'%(HIDDEN_IMAGE)s',"
+        "file.backing.backing=3Dparent0"
+        " -drive if=3Dnone,node-name=3Dcolo-disk0,driver=3Dquorum,read-pat=
tern=3Dfifo,"
+        "vote-threshold=3D1,children.0=3Dchilds0"
+        " -incoming tcp:'%(OCF_RESKEY_listen_address)s':%(MIGRATE_PORT)s"
+        " -global migration.yank=3Dtrue"
+        " -qmp unix:'%(QMP_SOCK)s',server,nowait"
+        " -daemonize -D '%(QEMU_LOG)s' -pidfile '%(PID_FILE)s'") % globals=
()
+
+def qemu_colo_meta_data():
+    print("""\
+<?xml version=3D"1.0"?>
+<!DOCTYPE resource-agent SYSTEM "ra-api-1.dtd">
+<resource-agent name=3D"colo">
+
+    <version>1.0</version>
+    <longdesc lang=3D"en">
+Resource agent for qemu COLO. (https://wiki.qemu.org/Features/COLO)
+
+After defining the master/slave instance, the master score has to be
+manually set to show which node has up-to-date data. So you copy your
+image to one host (and create empty images the other host(s)) and then
+run "crm_master -r name_of_your_primitive -v 10" on that host.
+Also, you have to set 'notify=3Dtrue' in the metadata attributes when
+defining the master/slave instance.
+
+Note:
+-If the instance is stopped cluster-wide, the resource agent will do a
+clean shutdown. Set the demote timeout to the time it takes for your
+guest to shutdown.
+-Colo replication is started from the monitor action. Set the monitor
+timeout to at least the time it takes for replication to start. You can
+set the monitor_timeout parameter for a soft timeout, which the resource
+agent tries to satisfy.
+-The resource agent may notify pacemaker about peer failure,
+these failures will show up with exitreason=3D"Simulated failure".
+    </longdesc>
+    <shortdesc lang=3D"en">Qemu COLO</shortdesc>
+
+    <parameters>
+
+    <parameter name=3D"qemu_binary" unique=3D"0" required=3D"0">
+        <longdesc lang=3D"en">qemu binary to use</longdesc>
+        <shortdesc lang=3D"en">qemu binary</shortdesc>
+        <content type=3D"string" default=3D\"""" \
+            + OCF_RESKEY_qemu_binary_default + """\"/>
+    </parameter>
+
+    <parameter name=3D"qemu_img_binary" unique=3D"0" required=3D"0">
+        <longdesc lang=3D"en">qemu-img binary to use</longdesc>
+        <shortdesc lang=3D"en">qemu-img binary</shortdesc>
+        <content type=3D"string" default=3D\"""" \
+            + OCF_RESKEY_qemu_img_binary_default + """\"/>
+    </parameter>
+
+    <parameter name=3D"log_dir" unique=3D"0" required=3D"0">
+        <longdesc lang=3D"en">Directory to place logs in</longdesc>
+        <shortdesc lang=3D"en">Log directory</shortdesc>
+        <content type=3D"string" default=3D\"""" \
+            + OCF_RESKEY_log_dir_default + """\"/>
+    </parameter>
+
+    <parameter name=3D"options" unique=3D"0" required=3D"1">
+        <longdesc lang=3D"en">
+Options to pass to qemu. These will be passed alongside COLO specific
+options, so you need to follow these conventions: The netdev should have
+id=3Dhn0 and the disk controller drive=3Dcolo-disk0. The image node should
+have id/node-name=3Dparent0, but should not be connected to the guest.
+Example:
+-vnc :0 -enable-kvm -cpu qemu64,+kvmclock -m 512 -netdev bridge,id=3Dhn0
+-device e1000,netdev=3Dhn0 -device virtio-blk,drive=3Dcolo-disk0
+-drive if=3Dnone,id=3Dparent0,format=3Dqcow2,file=3D/mnt/vms/vm01.qcow2
+        </longdesc>
+        <shortdesc lang=3D"en">Options to pass to qemu.</shortdesc>
+    </parameter>
+
+    <parameter name=3D"disk_size" unique=3D"0" required=3D"1">
+        <longdesc lang=3D"en">Disk size of the image</longdesc>
+        <shortdesc lang=3D"en">Disk size of the image</shortdesc>
+        <content type=3D"string" default=3D\"""" \
+            + OCF_RESKEY_disk_size_default + """\"/>
+    </parameter>
+
+    <parameter name=3D"active_hidden_dir" unique=3D"0" required=3D"1">
+        <longdesc lang=3D"en">
+Directory where the active and hidden images will be stored. It is
+recommended to put this on a ramdisk.
+        </longdesc>
+        <shortdesc lang=3D"en">Path to active and hidden images</shortdesc>
+        <content type=3D"string" default=3D\"""" \
+            + OCF_RESKEY_active_hidden_dir_default + """\"/>
+    </parameter>
+
+    <parameter name=3D"listen_address" unique=3D"0" required=3D"0">
+        <longdesc lang=3D"en">Address to listen on.</longdesc>
+        <shortdesc lang=3D"en">Listen address</shortdesc>
+        <content type=3D"string" default=3D\"""" \
+            + OCF_RESKEY_listen_address_default + """\"/>
+    </parameter>
+
+    <parameter name=3D"base_port" unique=3D"1" required=3D"0">
+        <longdesc lang=3D"en">
+4 tcp ports that are unique for each instance. (base_port to base_port + 3)
+        </longdesc>
+        <shortdesc lang=3D"en">Ports to use</shortdesc>
+        <content type=3D"integer" default=3D\"""" \
+            + OCF_RESKEY_base_port_default + """\"/>
+    </parameter>
+
+    <parameter name=3D"checkpoint_interval" unique=3D"0" required=3D"0">
+        <longdesc lang=3D"en">
+Interval for regular checkpoints in milliseconds.
+        </longdesc>
+        <shortdesc lang=3D"en">Interval for regular checkpoints</shortdesc>
+        <content type=3D"integer" default=3D\"""" \
+            + OCF_RESKEY_checkpoint_interval_default + """\"/>
+    </parameter>
+
+    <parameter name=3D"compare_timeout" unique=3D"0" required=3D"0">
+        <longdesc lang=3D"en">
+Maximum time to hold a primary packet if secondary hasn't sent it yet,
+in milliseconds.
+You should also adjust "expired_scan_cycle" accordingly.
+        </longdesc>
+        <shortdesc lang=3D"en">Compare timeout</shortdesc>
+        <content type=3D"integer" default=3D\"""" \
+            + OCF_RESKEY_compare_timeout_default + """\"/>
+    </parameter>
+
+    <parameter name=3D"expired_scan_cycle" unique=3D"0" required=3D"0">
+        <longdesc lang=3D"en">
+Interval for checking for expired primary packets in milliseconds.
+        </longdesc>
+        <shortdesc lang=3D"en">Expired packet check interval</shortdesc>
+        <content type=3D"integer" default=3D\"""" \
+            + OCF_RESKEY_expired_scan_cycle_default + """\"/>
+    </parameter>
+
+    <parameter name=3D"use_filter_rewriter" unique=3D"0" required=3D"0">
+        <longdesc lang=3D"en">
+Use filter-rewriter to increase similarity between the VMs.
+        </longdesc>
+        <shortdesc lang=3D"en">Use filter-rewriter</shortdesc>
+        <content type=3D"string" default=3D\"""" \
+            + OCF_RESKEY_use_filter_rewriter_default + """\"/>
+    </parameter>
+
+    <parameter name=3D"vnet_hdr" unique=3D"0" required=3D"0">
+        <longdesc lang=3D"en">
+Set this to true if your system supports vnet_hdr and you enabled
+it on the tap netdev.
+        </longdesc>
+        <shortdesc lang=3D"en">vnet_hdr support</shortdesc>
+        <content type=3D"string" default=3D\"""" \
+            + OCF_RESKEY_vnet_hdr_default + """\"/>
+    </parameter>
+
+    <parameter name=3D"max_disk_errors" unique=3D"0" required=3D"0">
+        <longdesc lang=3D"en">
+Maximum disk read errors per monitor interval before marking the resource
+as failed. A write error is always fatal except if the value is 0.
+A value of 0 will disable disk error handling.
+Primary disk errors are only handled if there is a healthy secondary.
+        </longdesc>
+        <shortdesc lang=3D"en">Maximum disk errors</shortdesc>
+        <content type=3D"integer" default=3D\"""" \
+            + OCF_RESKEY_max_disk_errors_default + """\"/>
+    </parameter>
+
+    <parameter name=3D"monitor_timeout" unique=3D"0" required=3D"0">
+        <longdesc lang=3D"en">
+Soft timeout for monitor, in milliseconds.
+Must be lower than the monitor action timeout.
+        </longdesc>
+        <shortdesc lang=3D"en">Monitor timeout</shortdesc>
+        <content type=3D"integer" default=3D\"""" \
+            + OCF_RESKEY_monitor_timeout_default + """\"/>
+    </parameter>
+
+    <parameter name=3D"yank_timeout" unique=3D"0" required=3D"0">
+        <longdesc lang=3D"en">
+Timeout for QMP commands after which to execute the "yank" command,
+in milliseconds.
+Must be lower than any of the action timeouts.
+        </longdesc>
+        <shortdesc lang=3D"en">Yank timeout</shortdesc>
+        <content type=3D"integer" default=3D\"""" \
+            + OCF_RESKEY_yank_timeout_default + """\"/>
+    </parameter>
+
+    <parameter name=3D"fail_fast_timeout" unique=3D"0" required=3D"0">
+        <longdesc lang=3D"en">
+Timeout for QMP commands used in the stop and demote actions to speed
+up recovery from a hanging qemu, in milliseconds.
+Must be lower than any of the action timeouts.
+        </longdesc>
+        <shortdesc lang=3D"en">Timeout for fast paths</shortdesc>
+        <content type=3D"integer" default=3D\"""" \
+            + OCF_RESKEY_fail_fast_timeout_default + """\"/>
+    </parameter>
+
+    <parameter name=3D"debug" unique=3D"0" required=3D"0">
+        <longdesc lang=3D"en">
+Control debugging:
+0: disable debugging
+1: log debug messages and qmp commands
+2: + dump core of hanging qemu
+        </longdesc>
+        <shortdesc lang=3D"en">Control debugging</shortdesc>
+        <content type=3D"integer" default=3D\"""" \
+            + OCF_RESKEY_debug_default + """\"/>
+    </parameter>
+
+    </parameters>
+
+    <actions>
+        <action name=3D"start"        timeout=3D"30s" />
+        <action name=3D"stop"         timeout=3D"10s" />
+        <action name=3D"monitor"      timeout=3D"30s" \
+            interval=3D"1000ms" depth=3D"0" role=3D"Slave" />
+        <action name=3D"monitor"      timeout=3D"30s" \
+            interval=3D"1001ms" depth=3D"0" role=3D"Master" />
+        <action name=3D"notify"       timeout=3D"30s" />
+        <action name=3D"promote"      timeout=3D"30s" />
+        <action name=3D"demote"       timeout=3D"120s" />
+        <action name=3D"meta-data"    timeout=3D"5s" />
+        <action name=3D"validate-all" timeout=3D"20s" />
+    </actions>
+
+</resource-agent>
+""")
+
+def logs_open():
+    global log
+    log =3D logging.getLogger(OCF_RESOURCE_INSTANCE)
+    if int(OCF_RESKEY_debug) >=3D 1 or HA_DEBUG !=3D "0":
+        log.setLevel(logging.DEBUG)
+    else:
+        log.setLevel(logging.INFO)
+
+    formater =3D logging.Formatter("(%(name)s) %(levelname)s: %(message)s")
+
+    if sys.stdout.isatty():
+        handler =3D logging.StreamHandler(stream=3Dsys.stderr)
+        handler.setFormatter(formater)
+        log.addHandler(handler)
+
+    if HA_LOGFACILITY:
+        handler =3D logging.handlers.SysLogHandler("/dev/log")
+        handler.setFormatter(formater)
+        log.addHandler(handler)
+
+    if HA_LOGFILE:
+        handler =3D logging.FileHandler(HA_LOGFILE)
+        handler.setFormatter(formater)
+        log.addHandler(handler)
+
+    if HA_DEBUGLOG and HA_DEBUGLOG !=3D HA_LOGFILE:
+        handler =3D logging.FileHandler(HA_DEBUGLOG)
+        handler.setFormatter(formater)
+        log.addHandler(handler)
+
+    global qmp_log
+    qmp_log =3D logging.getLogger("qmp_log")
+    qmp_log.setLevel(logging.DEBUG)
+    formater =3D logging.Formatter("%(message)s")
+
+    if int(OCF_RESKEY_debug) >=3D 1:
+        handler =3D logging.handlers.WatchedFileHandler(QMP_LOG)
+        handler.setFormatter(formater)
+        qmp_log.addHandler(handler)
+    else:
+        handler =3D logging.NullHandler()
+        qmp_log.addHandler(handler)
+
+def rotate_logfile(logfile, numlogs):
+    numlogs -=3D 1
+    for n in range(numlogs, -1, -1):
+        file =3D logfile
+        if n !=3D 0:
+            file =3D "%s.%s" % (file, n)
+        if os.path.exists(file):
+            if n =3D=3D numlogs:
+                os.remove(file)
+            else:
+                newname =3D "%s.%s" % (logfile, n + 1)
+                os.rename(file, newname)
+
+def is_writable(file):
+    return os.access(file, os.W_OK)
+
+def is_executable_file(file):
+    return os.path.isfile(file) and os.access(file, os.X_OK)
+
+def is_true(var):
+    return re.match("yes|true|1|YES|TRUE|True|ja|on|ON", str(var)) !=3D No=
ne
+
+# Check if the binary exists and is executable
+def check_binary(binary):
+    if is_executable_file(binary):
+        return True
+    PATH =3D os.getenv("PATH", os.defpath)
+    for dir in PATH.split(os.pathsep):
+        if is_executable_file(os.path.join(dir, binary)):
+            return True
+    log.error("binary \"%s\" doesn't exist or not executable" % binary)
+    return False
+
+def run_command(commandline):
+    proc =3D subprocess.Popen(commandline, shell=3DTrue, stdout=3Dsubproce=
ss.PIPE,
+                          stderr=3Dsubprocess.STDOUT, universal_newlines=
=3DTrue)
+    stdout, stderr =3D proc.communicate()
+    if proc.returncode !=3D 0:
+        log.error("command \"%s\" failed with code %s:\n%s" \
+                    % (commandline, proc.returncode, stdout))
+        raise Error()
+
+# Functions for setting and getting the master score to tell Pacemaker whi=
ch
+# host has the most recent data
+def set_master_score(score):
+    if score =3D=3D 0:
+        run_command("crm_master -q -l forever -D")
+    else:
+        run_command("crm_master -q -l forever -v %s" % score)
+
+def set_remote_master_score(remote, score):
+    if score =3D=3D 0:
+        run_command("crm_master -q -l forever -N '%s' -D" % remote)
+    else:
+        run_command("crm_master -q -l forever -N '%s' -v %s" % (remote, sc=
ore))
+
+def get_master_score():
+    proc =3D subprocess.Popen("crm_master -q -G", shell=3DTrue,
+                            stdout=3Dsubprocess.PIPE, stderr=3Dsubprocess.=
DEVNULL,
+                            universal_newlines=3DTrue)
+    stdout, stderr =3D proc.communicate()
+    if proc.returncode !=3D 0:
+        return 0
+    else:
+        return int(str.strip(stdout))
+
+def get_remote_master_score(remote):
+    proc =3D subprocess.Popen("crm_master -q -N '%s' -G" % remote, shell=
=3DTrue,
+                            stdout=3Dsubprocess.PIPE, stderr=3Dsubprocess.=
DEVNULL,
+                            universal_newlines=3DTrue)
+    stdout, stderr =3D proc.communicate()
+    if proc.returncode !=3D 0:
+        return 0
+    else:
+        return int(str.strip(stdout))
+
+# Tell Pacemaker that the remote resource failed
+def report_remote_failure(remote):
+    run_command("crm_resource --resource '%s' --fail --node '%s'"
+                % (OCF_RESOURCE_INSTANCE, remote))
+
+def recv_line(fd):
+    line =3D ""
+    while True:
+        tmp =3D fd.recv(1).decode()
+        line +=3D tmp
+        if tmp =3D=3D "\n" or len(tmp) =3D=3D 0:
+            break
+    return line
+
+# Filter out events
+def read_answer(fd):
+    while True:
+        line =3D recv_line(fd)
+        qmp_log.debug(str.strip(line))
+
+        if len(line) =3D=3D 0:
+            log.error("qmp connection closed")
+            raise Error()
+
+        answer =3D json.loads(line)
+        # Ignore everything else
+        if "return" in answer or "error" in answer:
+            break
+    return answer
+
+# Execute one or more qmp commands
+def qmp_execute(fd, commands, ignore_error =3D False, do_yank =3D True):
+    for command in commands:
+        if not command:
+            continue
+
+        try:
+            to_send =3D json.dumps(command)
+            fd.sendall(str.encode(to_send + "\n"))
+            qmp_log.debug(to_send)
+
+            answer =3D read_answer(fd)
+        except Exception as e:
+            if isinstance(e, socket.timeout) and do_yank:
+                log.warning("Command timed out, trying to unfreeze qemu")
+                new_timeout =3D max(2, (int(OCF_RESKEY_CRM_meta_timeout)/1=
000) \
+                                    - (time.time() - START_TIME) - 2)
+                fd.settimeout(new_timeout)
+                answer =3D yank(fd)
+                # Read answer of timed-out command
+                try:
+                    if "id" in answer:
+                        answer =3D read_answer(fd)
+                    else:
+                        read_answer(fd)
+                except socket.error as e:
+                    log.error("while reading answer of timed out command: "
+                              "%s\n%s" % (json.dumps(command), e))
+                    raise Error()
+            elif isinstance(e, socket.timeout) or isinstance(e, socket.err=
or):
+                log.error("while executing qmp command: %s\n%s" \
+                            % (json.dumps(command), e))
+                raise Error()
+            else:
+                raise
+
+        if not ignore_error and ("error" in answer):
+            log.error("qmp command returned error:\n%s\n%s" \
+                        % (json.dumps(command), json.dumps(answer)))
+            raise Error()
+
+    return answer
+
+# Open qemu qmp connection
+def qmp_open(fail_fast =3D False):
+    if fail_fast:
+        timeout =3D int(OCF_RESKEY_fail_fast_timeout)/1000
+    else:
+        timeout =3D int(OCF_RESKEY_yank_timeout)/1000
+
+    try:
+        fd =3D socket.socket(socket.AF_UNIX, socket.SOCK_STREAM)
+        fd.settimeout(timeout)
+        fd.connect(HELPER_SOCK)
+    except socket.error as e:
+        log.error("while connecting to helper socket: %s" % e)
+        raise Error()
+
+    return fd
+
+def yank(fd):
+    global did_yank
+    did_yank =3D True
+    answer =3D qmp_execute(fd, [{"exec-oob": "yank", "id": "yank0"}], \
+                            do_yank =3D False, ignore_error =3D True)
+    return answer
+
+def oob_helper_exec(client, cmd, events):
+    if cmd["exec-helper"] =3D=3D "get-events":
+        event =3D cmd["arguments"]["event"]
+        if (event in events):
+            to_send =3D json.dumps({"return": events[event]})
+            client.sendall(str.encode(to_send + "\n"))
+        else:
+            client.sendall(str.encode("{\"return\": []}\n"))
+    elif cmd["exec-helper"] =3D=3D "clear-events":
+        events.clear()
+        client.sendall(str.encode("{\"return\": {}}\n"))
+    else:
+        client.sendall(str.encode("{\"error\": \"Unknown helper command\"}=
\n"))
+
+def oob_helper(qmp, server):
+    max_events =3D max(100, int(OCF_RESKEY_max_disk_errors))
+    events =3D {}
+    try:
+        os.close(0)
+        os.close(1)
+        os.close(2)
+        logging.shutdown()
+
+        client =3D None
+        while True:
+            if client:
+                watch =3D [client, qmp]
+            else:
+                watch =3D [server, qmp]
+            sel =3D select.select(watch, [], [])
+            try:
+                if client in sel[0]:
+                    cmd =3D recv_line(client)
+                    if len(cmd) =3D=3D 0:
+                        # client socket was closed: wait for new client
+                        client.close()
+                        client =3D None
+                        continue
+                    else:
+                        parsed =3D json.loads(cmd)
+                        if ("exec-helper" in parsed):
+                            oob_helper_exec(client, parsed, events)
+                        else:
+                            qmp.sendall(str.encode(cmd))
+                if qmp in sel[0]:
+                    answer =3D recv_line(qmp)
+                    if len(answer) =3D=3D 0:
+                        # qmp socket was closed: qemu died, exit
+                        os._exit(0)
+                    else:
+                        parsed =3D json.loads(answer)
+                        if ("event" in parsed):
+                            event =3D parsed["event"]
+                            if (event not in events):
+                                events[event] =3D []
+                            if len(events[event]) < max_events:
+                                events[event].append(parsed)
+                        elif client:
+                            client.sendall(str.encode(answer))
+                if server in sel[0]:
+                    client, client_addr =3D server.accept()
+            except socket.error as e:
+                pass
+    except Exception as e:
+        with open(HELPER_LOG, 'a') as f:
+            f.write(str(e) + "\n")
+    os._exit(0)
+
+# Fork off helper to keep the oob qmp connection open and to catch events
+def oob_helper_open():
+    try:
+        qmp =3D socket.socket(socket.AF_UNIX, socket.SOCK_STREAM)
+        qmp.connect(QMP_SOCK)
+        qmp_execute(qmp, [{"execute": "qmp_capabilities", "arguments": {"e=
nable": ["oob"]}}])
+    except socket.error as e:
+        log.error("while connecting to qmp socket: %s" % e)
+        raise Error()
+
+    try:
+        if os.path.exists(HELPER_SOCK):
+            os.unlink(HELPER_SOCK)
+        server =3D socket.socket(socket.AF_UNIX, socket.SOCK_STREAM)
+        server.bind(HELPER_SOCK)
+        server.listen(1)
+    except socket.error as e:
+        log.error("while opening helper socket: %s" % e)
+        raise Error()
+
+    qmp.set_inheritable(True)
+    server.set_inheritable(True)
+
+    try:
+        pid =3D os.fork()
+    except OSError as e:
+        log.error("while forking off oob helper: %s" % e)
+        raise Error()
+
+    if pid =3D=3D 0:
+        # child 1: Exits after forking off child 2, so pid 1 will become
+        # responsible for the child
+        os.setsid()
+
+        pid =3D os.fork()
+
+        if pid =3D=3D 0:
+            # child 2: here the actual work is being done
+            oob_helper(qmp, server)
+        else:
+            os._exit(0)
+
+    qmp.close()
+    server.close()
+
+# Get the host of the nbd node
+def qmp_get_nbd_remote(fd):
+    block_nodes =3D qmp_execute(fd, [{"execute": "query-named-block-nodes"=
, "arguments": {"flat": True}}])
+    for node in block_nodes["return"]:
+        if node["node-name"] =3D=3D "nbd0":
+            url =3D str(node["image"]["filename"])
+            return str.split(url, "//")[1].split("/")[0].split(":")[0]
+    return None
+
+# Check if we are currently resyncing
+def qmp_check_resync(fd):
+    answer =3D qmp_execute(fd, [{"execute": "query-block-jobs"}])
+    for job in answer["return"]:
+        if job["device"] =3D=3D "resync":
+            return job
+    return None
+
+def qmp_start_resync(fd, remote):
+    answer =3D qmp_execute(fd, [{"execute": "blockdev-add", "arguments": {=
"driver": "nbd", "node-name": "nbd0", "server": {"type": "inet", "host": st=
r(remote), "port": str(NBD_PORT)}, "export": "parent0", "detect-zeroes": "o=
n", "yank": True}}], ignore_error =3D True)
+    if "error" in answer:
+        log.warning("Failed to add nbd node: %s" % json.dumps(answer))
+        log.warning("Assuming peer failure")
+        report_remote_failure(remote)
+    else:
+        qmp_execute(fd, [{"execute": "blockdev-mirror", "arguments": {"dev=
ice": "colo-disk0", "job-id": "resync", "target": "nbd0", "sync": "full", "=
on-target-error": "report", "on-source-error": "ignore", "auto-dismiss": Fa=
lse}}])
+
+def qmp_cancel_resync(fd):
+    timeout =3D START_TIME + (int(OCF_RESKEY_yank_timeout)/1000)
+
+    if qmp_check_resync(fd)["status"] !=3D "concluded":
+        qmp_execute(fd, [{"execute": "block-job-cancel", "arguments": {"de=
vice": "resync", "force": True}}], ignore_error =3D True)
+        # Wait for the block-job to finish
+        while time.time() < timeout:
+            if qmp_check_resync(fd)["status"] =3D=3D "concluded":
+                break
+            log.debug("Waiting for block-job to finish in qmp_cancel_resyn=
c()")
+            time.sleep(1)
+        else:
+            log.warning("Timed out, trying to unfreeze qemu")
+            yank(fd)
+            while qmp_check_resync(fd)["status"] !=3D "concluded":
+                log.debug("Waiting for block-job to finish")
+                time.sleep(1)
+
+    qmp_execute(fd, [
+        {"execute": "block-job-dismiss", "arguments": {"id": "resync"}},
+        {"execute": "blockdev-del", "arguments": {"node-name": "nbd0"}}
+        ])
+
+def qmp_start_colo(fd, remote):
+    # Check if we have a filter-rewriter
+    answer =3D qmp_execute(fd, [{"execute": "qom-list", "arguments": {"pat=
h": "/objects/rew0"}}], ignore_error =3D True)
+    if "error" in answer:
+        if answer["error"]["class"] =3D=3D "DeviceNotFound":
+            have_filter_rewriter =3D False
+        else:
+            log.error("while checking for filter-rewriter:\n%s" \
+                        % json.dumps(answer))
+            raise Error()
+    else:
+        have_filter_rewriter =3D True
+
+    # Pause VM and cancel resync
+    qmp_execute(fd, [
+        {"execute": "stop"},
+        {"execute": "block-job-cancel", "arguments": {"device": "resync"}}
+        ])
+
+    # Wait for the block-job to finish
+    while qmp_check_resync(fd)["status"] !=3D "concluded":
+        log.debug("Waiting for block-job to finish in qmp_start_colo()")
+        time.sleep(1)
+
+    # Add nbd to the quorum node
+    qmp_execute(fd, [
+        {"execute": "block-job-dismiss", "arguments": {"id": "resync"}},
+        {"execute": "x-blockdev-change", "arguments": {"parent": "colo-dis=
k0", "node": "nbd0"}}
+        ])
+
+    # Connect mirror and compare_in to secondary
+    qmp_execute(fd, [
+        {"execute": "chardev-add", "arguments": {"id": "comp_pri_in0<", "b=
ackend": {"type": "socket", "data": {"addr": {"type": "unix", "data": {"pat=
h": str(COMP_SOCK)}}, "server": True}}}},
+        {"execute": "chardev-add", "arguments": {"id": "comp_pri_in0>", "b=
ackend": {"type": "socket", "data": {"addr": {"type": "unix", "data": {"pat=
h": str(COMP_SOCK)}}, "server": False}}}},
+        {"execute": "chardev-add", "arguments": {"id": "comp_out0<", "back=
end": {"type": "socket", "data": {"addr": {"type": "unix", "data": {"path":=
 str(COMP_OUT_SOCK)}}, "server": True}}}},
+        {"execute": "chardev-add", "arguments": {"id": "comp_out0>", "back=
end": {"type": "socket", "data": {"addr": {"type": "unix", "data": {"path":=
 str(COMP_OUT_SOCK)}}, "server": False}}}},
+        {"execute": "chardev-add", "arguments": {"id": "mirror0", "backend=
": {"type": "socket", "data": {"addr": {"type": "inet", "data": {"host": st=
r(remote), "port": str(MIRROR_PORT)}}, "server": False, "nodelay": True, "y=
ank": True}}}},
+        {"execute": "chardev-add", "arguments": {"id": "comp_sec_in0", "ba=
ckend": {"type": "socket", "data": {"addr": {"type": "inet", "data": {"host=
": str(remote), "port": str(COMPARE_IN_PORT)}}, "server": False, "nodelay":=
 True, "yank": True}}}}
+        ])
+
+    # Add the COLO filters
+    vnet_hdr_support =3D is_true(OCF_RESKEY_vnet_hdr)
+    if have_filter_rewriter:
+        qmp_execute(fd, [
+            {"execute": "object-add", "arguments": {"qom-type": "filter-mi=
rror", "id": "m0", "props": {"insert": "before", "position": "id=3Drew0", "=
netdev": "hn0", "queue": "tx", "outdev": "mirror0", "vnet_hdr_support": vne=
t_hdr_support}}},
+            {"execute": "object-add", "arguments": {"qom-type": "filter-re=
director", "id": "redire0", "props": {"insert": "before", "position": "id=
=3Drew0", "netdev": "hn0", "queue": "rx", "indev": "comp_out0<", "vnet_hdr_=
support": vnet_hdr_support}}},
+            {"execute": "object-add", "arguments": {"qom-type": "filter-re=
director", "id": "redire1", "props": {"insert": "before", "position": "id=
=3Drew0", "netdev": "hn0", "queue": "rx", "outdev": "comp_pri_in0<", "vnet_=
hdr_support": vnet_hdr_support}}},
+            {"execute": "object-add", "arguments": {"qom-type": "iothread"=
, "id": "iothread1"}},
+            {"execute": "object-add", "arguments": {"qom-type": "colo-comp=
are", "id": "comp0", "props": {"primary_in": "comp_pri_in0>", "secondary_in=
": "comp_sec_in0", "outdev": "comp_out0>", "iothread": "iothread1", "compar=
e_timeout": int(OCF_RESKEY_compare_timeout), "expired_scan_cycle": int(OCF_=
RESKEY_expired_scan_cycle), "vnet_hdr_support": vnet_hdr_support}}}
+            ])
+    else:
+        qmp_execute(fd, [
+            {"execute": "object-add", "arguments": {"qom-type": "filter-mi=
rror", "id": "m0", "props": {"netdev": "hn0", "queue": "tx", "outdev": "mir=
ror0", "vnet_hdr_support": vnet_hdr_support}}},
+            {"execute": "object-add", "arguments": {"qom-type": "filter-re=
director", "id": "redire0", "props": {"netdev": "hn0", "queue": "rx", "inde=
v": "comp_out0<", "vnet_hdr_support": vnet_hdr_support}}},
+            {"execute": "object-add", "arguments": {"qom-type": "filter-re=
director", "id": "redire1", "props": {"netdev": "hn0", "queue": "rx", "outd=
ev": "comp_pri_in0<", "vnet_hdr_support": vnet_hdr_support}}},
+            {"execute": "object-add", "arguments": {"qom-type": "iothread"=
, "id": "iothread1"}},
+            {"execute": "object-add", "arguments": {"qom-type": "colo-comp=
are", "id": "comp0", "props": {"primary_in": "comp_pri_in0>", "secondary_in=
": "comp_sec_in0", "outdev": "comp_out0>", "iothread": "iothread1", "compar=
e_timeout": int(OCF_RESKEY_compare_timeout), "expired_scan_cycle": int(OCF_=
RESKEY_expired_scan_cycle), "vnet_hdr_support": vnet_hdr_support}}}
+            ])
+
+    # Start COLO
+    qmp_execute(fd, [
+        {"execute": "migrate-set-capabilities", "arguments": {"capabilitie=
s": [{"capability": "x-colo", "state": True }] }},
+        {"execute": "migrate-set-parameters" , "arguments": {"x-checkpoint=
-delay": int(OCF_RESKEY_checkpoint_interval), "yank": True}},
+        {"execute": "migrate", "arguments": {"uri": "tcp:%s:%s" % (remote,=
 MIGRATE_PORT)}}
+        ])
+
+    # Wait for COLO to start
+    while qmp_execute(fd, [{"execute": "query-status"}])["return"]["status=
"] \
+            =3D=3D "paused" \
+            or qmp_execute(fd, [{"execute": "query-colo-status"}])["return=
"]["mode"] \
+            !=3D "primary" :
+        log.debug("Waiting for colo replication to start")
+        time.sleep(1)
+
+def qmp_primary_failover(fd):
+    qmp_execute(fd, [
+        {"execute": "object-del", "arguments": {"id": "m0"}},
+        {"execute": "object-del", "arguments": {"id": "redire0"}},
+        {"execute": "object-del", "arguments": {"id": "redire1"}},
+        {"execute": "x-colo-lost-heartbeat"},
+        {"execute": "object-del", "arguments": {"id": "comp0"}},
+        {"execute": "object-del", "arguments": {"id": "iothread1"}},
+        {"execute": "x-blockdev-change", "arguments": {"parent": "colo-dis=
k0", "child": "children.1"}},
+        {"execute": "blockdev-del", "arguments": {"node-name": "nbd0"}},
+        {"execute": "chardev-remove", "arguments": {"id": "mirror0"}},
+        {"execute": "chardev-remove", "arguments": {"id": "comp_sec_in0"}},
+        {"execute": "chardev-remove", "arguments": {"id": "comp_pri_in0>"}=
},
+        {"execute": "chardev-remove", "arguments": {"id": "comp_pri_in0<"}=
},
+        {"execute": "chardev-remove", "arguments": {"id": "comp_out0>"}},
+        {"execute": "chardev-remove", "arguments": {"id": "comp_out0<"}}
+        ])
+
+def qmp_secondary_failover(fd):
+    qmp_execute(fd, [
+        {"execute": "nbd-server-stop"},
+        {"execute": "object-del", "arguments": {"id": "f2"}},
+        {"execute": "object-del", "arguments": {"id": "f1"}},
+        {"execute": "x-colo-lost-heartbeat"},
+        {"execute": "chardev-remove", "arguments": {"id": "red1"}},
+        {"execute": "chardev-remove", "arguments": {"id": "red0"}},
+        ])
+
+# Check qemu health and colo role
+def qmp_check_state(fd, fail_fast =3D False):
+    answer =3D qmp_execute(fd, [{"execute": "query-status"}], \
+                            do_yank =3D not fail_fast)
+    vm_status =3D answer["return"]
+
+    answer =3D qmp_execute(fd, [{"execute": "query-colo-status"}], \
+                            do_yank =3D not fail_fast)
+    colo_status =3D answer["return"]
+
+    if vm_status["status"] =3D=3D "inmigrate":
+        role =3D OCF_SUCCESS
+        replication =3D OCF_NOT_RUNNING
+
+    elif (vm_status["status"] =3D=3D "running" \
+          or vm_status["status"] =3D=3D "colo" \
+          or vm_status["status"] =3D=3D "finish-migrate") \
+         and colo_status["mode"] =3D=3D "none" \
+         and (colo_status["reason"] =3D=3D "request" \
+              or colo_status["reason"] =3D=3D "none"):
+        role =3D OCF_RUNNING_MASTER
+        replication =3D OCF_NOT_RUNNING
+
+    elif (vm_status["status"] =3D=3D "running" \
+          or vm_status["status"] =3D=3D "colo" \
+          or vm_status["status"] =3D=3D "finish-migrate") \
+         and colo_status["mode"] =3D=3D "secondary":
+        role =3D OCF_SUCCESS
+        replication =3D OCF_SUCCESS
+
+    elif (vm_status["status"] =3D=3D "running" \
+          or vm_status["status"] =3D=3D "colo" \
+          or vm_status["status"] =3D=3D "finish-migrate") \
+         and colo_status["mode"] =3D=3D "primary":
+        role =3D OCF_RUNNING_MASTER
+        replication =3D OCF_SUCCESS
+
+    else:
+        log.error("Invalid qemu status:\nvm status: %s\ncolo status: %s" \
+                    % (vm_status, colo_status))
+        role =3D OCF_ERR_GENERIC
+        replication =3D OCF_ERR_GENERIC
+
+    return role, replication
+
+# Sanity checks: check parameters, files, binaries, etc.
+def qemu_colo_validate_all():
+    # Check resource parameters
+    if not str.isdigit(OCF_RESKEY_base_port):
+        log.error("base_port needs to be a number")
+        return OCF_ERR_CONFIGURED
+
+    if not str.isdigit(OCF_RESKEY_checkpoint_interval):
+        log.error("checkpoint_interval needs to be a number")
+        return OCF_ERR_CONFIGURED
+
+    if not str.isdigit(OCF_RESKEY_compare_timeout):
+        log.error("compare_timeout needs to be a number")
+        return OCF_ERR_CONFIGURED
+
+    if not str.isdigit(OCF_RESKEY_expired_scan_cycle):
+        log.error("expired_scan_cycle needs to be a number")
+        return OCF_ERR_CONFIGURED
+
+    if not str.isdigit(OCF_RESKEY_max_disk_errors):
+        log.error("max_disk_errors needs to be a number")
+        return OCF_ERR_CONFIGURED
+
+    if not str.isdigit(OCF_RESKEY_monitor_timeout):
+        log.error("monitor_timeout needs to be a number")
+        return OCF_ERR_CONFIGURED
+
+    if not str.isdigit(OCF_RESKEY_yank_timeout):
+        log.error("yank_timeout needs to be a number")
+        return OCF_ERR_CONFIGURED
+
+    if not str.isdigit(OCF_RESKEY_fail_fast_timeout):
+        log.error("fail_fast_timeout needs to be a number")
+        return OCF_ERR_CONFIGURED
+
+    if not str.isdigit(OCF_RESKEY_debug):
+        log.error("debug needs to be a number")
+        return OCF_ERR_CONFIGURED
+
+    if not OCF_RESKEY_active_hidden_dir:
+        log.error("active_hidden_dir needs to be specified")
+        return OCF_ERR_CONFIGURED
+
+    if not OCF_RESKEY_disk_size:
+        log.error("disk_size needs to be specified")
+        return OCF_ERR_CONFIGURED
+
+    # Check resource meta configuration
+    if OCF_ACTION !=3D "stop":
+        if OCF_RESKEY_CRM_meta_master_max !=3D 1:
+            log.error("only one master allowed")
+            return OCF_ERR_CONFIGURED
+
+        if OCF_RESKEY_CRM_meta_clone_max > 2:
+            log.error("maximum 2 clones allowed")
+            return OCF_ERR_CONFIGURED
+
+        if OCF_RESKEY_CRM_meta_master_node_max !=3D 1:
+            log.error("only one master per node allowed")
+            return OCF_ERR_CONFIGURED
+
+        if OCF_RESKEY_CRM_meta_clone_node_max !=3D 1:
+            log.error("only one clone per node allowed")
+            return OCF_ERR_CONFIGURED
+
+    # Check if notify is enabled
+    if OCF_ACTION !=3D "stop" and OCF_ACTION !=3D "monitor":
+        if not is_true(OCF_RESKEY_CRM_meta_notify) \
+           and not OCF_RESKEY_CRM_meta_notify_start_uname:
+            log.error("notify needs to be enabled")
+            return OCF_ERR_CONFIGURED
+
+    # Check that globally-unique is disabled
+    if is_true(OCF_RESKEY_CRM_meta_globally_unique):
+        log.error("globally-unique needs to be disabled")
+        return OCF_ERR_CONFIGURED
+
+    # Check binaries
+    if not check_binary(OCF_RESKEY_qemu_binary):
+        return OCF_ERR_INSTALLED
+
+    if not check_binary(OCF_RESKEY_qemu_img_binary):
+        return OCF_ERR_INSTALLED
+
+    # Check paths and files
+    if not is_writable(OCF_RESKEY_active_hidden_dir) \
+        or not os.path.isdir(OCF_RESKEY_active_hidden_dir):
+        log.error("active and hidden image directory missing or not writab=
le")
+        return OCF_ERR_PERM
+
+    return OCF_SUCCESS
+
+# Check if qemu is running
+def check_pid():
+    if not os.path.exists(PID_FILE):
+        return OCF_NOT_RUNNING, None
+
+    fd =3D open(PID_FILE, "r")
+    pid =3D int(str.strip(fd.readline()))
+    fd.close()
+    try:
+        os.kill(pid, 0)
+    except OSError:
+        log.info("qemu is not running")
+        return OCF_NOT_RUNNING, pid
+    else:
+        return OCF_SUCCESS, pid
+
+def qemu_colo_monitor(fail_fast =3D False):
+    status, pid =3D check_pid()
+    if status !=3D OCF_SUCCESS:
+        return status, OCF_NOT_RUNNING
+
+    fd =3D qmp_open(fail_fast)
+
+    role, replication =3D qmp_check_state(fd, fail_fast)
+    if role !=3D OCF_SUCCESS and role !=3D OCF_RUNNING_MASTER:
+        return role, replication
+
+    colo_events =3D qmp_execute(fd, [{"exec-helper": "get-events", "argume=
nts": {"event": "COLO_EXIT"}}], do_yank =3D False)
+    for event in colo_events["return"]:
+        if event["data"]["reason"] =3D=3D "error":
+            if replication =3D=3D OCF_SUCCESS:
+                replication =3D OCF_ERR_GENERIC
+
+    if did_yank and replication =3D=3D OCF_SUCCESS:
+        replication =3D OCF_ERR_GENERIC
+
+    peer_disk_errors =3D 0
+    local_disk_errors =3D 0
+    quorum_events =3D qmp_execute(fd, [{"exec-helper": "get-events", "argu=
ments": {"event": "QUORUM_REPORT_BAD"}}], do_yank =3D False)
+    for event in quorum_events["return"]:
+        if event["data"]["node-name"] =3D=3D "nbd0":
+            if event["data"]["type"] =3D=3D "read":
+                peer_disk_errors +=3D 1
+            else:
+                peer_disk_errors +=3D int(OCF_RESKEY_max_disk_errors)
+        else:
+            if event["data"]["type"] =3D=3D "read":
+                local_disk_errors +=3D 1
+            else:
+                local_disk_errors +=3D int(OCF_RESKEY_max_disk_errors)
+
+    if int(OCF_RESKEY_max_disk_errors) !=3D 0:
+        if peer_disk_errors >=3D int(OCF_RESKEY_max_disk_errors):
+            log.error("Peer disk error")
+            if replication =3D=3D OCF_SUCCESS:
+                replication =3D OCF_ERR_GENERIC
+
+        if local_disk_errors >=3D int(OCF_RESKEY_max_disk_errors):
+            if replication =3D=3D OCF_SUCCESS:
+                log.error("Local disk error")
+                role =3D OCF_ERR_GENERIC
+            else:
+                log.warning("Local disk error")
+
+    if not fail_fast and OCF_RESKEY_CRM_meta_interval !=3D 0:
+        # This isn't a probe monitor
+        block_job =3D qmp_check_resync(fd)
+        if block_job:
+            if "error" in block_job:
+                log.error("resync error: %s" % block_job["error"])
+                peer =3D qmp_get_nbd_remote(fd)
+                qmp_cancel_resync(fd)
+                report_remote_failure(peer)
+            elif block_job["ready"] =3D=3D True:
+                log.info("resync done, starting colo")
+                peer =3D qmp_get_nbd_remote(fd)
+                qmp_start_colo(fd, peer)
+                # COLO started, our secondary now can be promoted if the
+                # primary fails
+                set_remote_master_score(peer, 100)
+            else:
+                pct_done =3D (float(block_job["offset"]) \
+                            / float(block_job["len"])) * 100
+                log.info("resync %.1f%% done" % pct_done)
+        else:
+            if replication =3D=3D OCF_ERR_GENERIC:
+                if role =3D=3D OCF_RUNNING_MASTER:
+                    log.error("Replication error")
+                    peer =3D qmp_get_nbd_remote(fd)
+                    if peer:
+                        report_remote_failure(peer)
+                else:
+                    log.warning("Replication error")
+        qmp_execute(fd, [{"exec-helper": "clear-events"}], do_yank =3D Fal=
se)
+
+    fd.close()
+
+    return role, replication
+
+def qemu_colo_start():
+    if check_pid()[0] =3D=3D OCF_SUCCESS:
+        log.info("qemu is already running")
+        return OCF_SUCCESS
+
+    run_command("'%s' create -q -f qcow2 %s %s" \
+            % (OCF_RESKEY_qemu_img_binary, ACTIVE_IMAGE, OCF_RESKEY_disk_s=
ize))
+    run_command("'%s' create -q -f qcow2 %s %s" \
+            % (OCF_RESKEY_qemu_img_binary, HIDDEN_IMAGE, OCF_RESKEY_disk_s=
ize))
+
+    rotate_logfile(QMP_LOG, 8)
+    rotate_logfile(QEMU_LOG, 8)
+    run_command(QEMU_SECONDARY_CMDLINE)
+    oob_helper_open()
+
+    fd =3D qmp_open()
+    qmp_execute(fd, [
+        {"execute": "nbd-server-start", "arguments": {"addr": {"type": "in=
et", "data": {"host": str(OCF_RESKEY_listen_address), "port": str(NBD_PORT)=
}}}},
+        {"execute": "nbd-server-add", "arguments": {"device": "parent0", "=
writable": True}}
+        ])
+    fd.close()
+
+    return OCF_SUCCESS
+
+def env_do_shutdown_guest():
+    return OCF_RESKEY_CRM_meta_notify_active_uname \
+           and OCF_RESKEY_CRM_meta_notify_stop_uname \
+           and str.strip(OCF_RESKEY_CRM_meta_notify_active_uname) \
+               =3D=3D str.strip(OCF_RESKEY_CRM_meta_notify_stop_uname)
+
+def env_find_secondary():
+    # slave(s) =3D
+    # OCF_RESKEY_CRM_meta_notify_slave_uname
+    # - OCF_RESKEY_CRM_meta_notify_stop_uname
+    # + OCF_RESKEY_CRM_meta_notify_start_uname
+    # Filter out hosts that are stopping and ourselves
+    for host in str.split(OCF_RESKEY_CRM_meta_notify_slave_uname, " "):
+        if host:
+            for stopping_host \
+                in str.split(OCF_RESKEY_CRM_meta_notify_stop_uname, " "):
+                if host =3D=3D stopping_host:
+                    break
+            else:
+                if host !=3D HOSTNAME:
+                    # we found a valid secondary
+                    return host
+
+    for host in str.split(OCF_RESKEY_CRM_meta_notify_start_uname, " "):
+        if host !=3D HOSTNAME:
+            # we found a valid secondary
+            return host
+
+    # we found no secondary
+    return None
+
+def _qemu_colo_stop(monstatus, shutdown_guest):
+    # stop action must do everything possible to stop the resource
+    try:
+        timeout =3D START_TIME + (int(OCF_RESKEY_CRM_meta_timeout)/1000) -=
 5
+        force_stop =3D False
+
+        if monstatus =3D=3D OCF_NOT_RUNNING:
+            log.info("resource is already stopped")
+            return OCF_SUCCESS
+        elif monstatus =3D=3D OCF_RUNNING_MASTER or monstatus =3D=3D OCF_S=
UCCESS:
+            force_stop =3D False
+        else:
+            force_stop =3D True
+
+        if not force_stop:
+            fd =3D qmp_open(True)
+            if shutdown_guest:
+                if monstatus =3D=3D OCF_RUNNING_MASTER:
+                    qmp_execute(fd, [{"execute": "system_powerdown"}], \
+                                    do_yank =3D False)
+            else:
+                qmp_execute(fd, [{"execute": "quit"}], do_yank =3D False)
+            fd.close()
+
+            # wait for qemu to stop
+            while time.time() < timeout:
+                status, pid =3D check_pid()
+                if status =3D=3D OCF_NOT_RUNNING:
+                    # qemu stopped
+                    return OCF_SUCCESS
+                elif status =3D=3D OCF_SUCCESS:
+                    # wait
+                    log.debug("Waiting for qemu to stop")
+                    time.sleep(1)
+                else:
+                    # something went wrong, force stop instead
+                    break
+
+            log.warning("clean stop timeout reached")
+    except Exception as e:
+        log.warning("error while stopping: %s" % e)
+
+    log.info("force stopping qemu")
+
+    status, pid =3D check_pid()
+    if status =3D=3D OCF_NOT_RUNNING:
+        return OCF_SUCCESS
+    try:
+        if int(OCF_RESKEY_debug) >=3D 2:
+            os.kill(pid, signal.SIGSEGV)
+        else:
+            os.kill(pid, signal.SIGTERM)
+            time.sleep(2)
+            os.kill(pid, signal.SIGKILL)
+    except Exception:
+        pass
+
+    while check_pid()[0] !=3D OCF_NOT_RUNNING:
+        time.sleep(1)
+
+    return OCF_SUCCESS
+
+def qemu_colo_stop():
+    shutdown_guest =3D env_do_shutdown_guest()
+    try:
+        role, replication =3D qemu_colo_monitor(True)
+    except Exception:
+        role, replication =3D OCF_ERR_GENERIC, OCF_ERR_GENERIC
+
+    status =3D _qemu_colo_stop(role, shutdown_guest)
+
+    if HOSTNAME =3D=3D str.strip(OCF_RESKEY_CRM_meta_notify_master_uname):
+        if str.strip(OCF_RESKEY_CRM_meta_notify_promote_uname) !=3D HOSTNA=
ME:
+            # We where primary and the secondary is to be promoted.
+            # We are going to be out of date.
+            set_master_score(0)
+        else:
+            if role =3D=3D OCF_RUNNING_MASTER:
+                # We where a healthy primary but had no healty secondary o=
r it
+                # was stopped as well. So we have up-to-date data.
+                set_master_score(10)
+            else:
+                # We where a unhealthy primary but also had no healty seco=
ndary.
+                # So we still should have up-to-date data.
+                set_master_score(5)
+    else:
+        if get_master_score() > 10:
+            if role =3D=3D OCF_SUCCESS:
+                if shutdown_guest:
+                    # We where a healthy secondary and (probably) had a he=
althy
+                    # primary and both where stopped. So we have up-to-dat=
e data
+                    # too.
+                    set_master_score(10)
+                else:
+                    # We where a healthy secondary and (probably) had a he=
althy
+                    # primary still running. So we are now out of date.
+                    set_master_score(0)
+            else:
+                # We where a unhealthy secondary. So we are now out of dat=
e.
+                set_master_score(0)
+
+    return status
+
+def qemu_colo_notify():
+    action =3D "%s-%s" % (OCF_RESKEY_CRM_meta_notify_type, \
+                        OCF_RESKEY_CRM_meta_notify_operation)
+
+    if action =3D=3D "post-start":
+        if HOSTNAME =3D=3D str.strip(OCF_RESKEY_CRM_meta_notify_master_una=
me):
+            peer =3D str.strip(OCF_RESKEY_CRM_meta_notify_start_uname)
+            fd =3D qmp_open()
+            qmp_start_resync(fd, peer)
+            # The secondary has inconsistent data until resync is finished
+            set_remote_master_score(peer, 0)
+            fd.close()
+
+    elif action =3D=3D "pre-stop":
+        if not env_do_shutdown_guest() \
+           and HOSTNAME =3D=3D str.strip(OCF_RESKEY_CRM_meta_notify_master=
_uname) \
+           and HOSTNAME !=3D str.strip(OCF_RESKEY_CRM_meta_notify_stop_una=
me):
+            fd =3D qmp_open()
+            peer =3D qmp_get_nbd_remote(fd)
+            log.debug("our peer: %s" % peer)
+            if peer =3D=3D str.strip(OCF_RESKEY_CRM_meta_notify_stop_uname=
):
+                if qmp_check_resync(fd):
+                    qmp_cancel_resync(fd)
+                elif get_remote_master_score(peer) > 10:
+                    qmp_primary_failover(fd)
+                qmp_execute(fd, [{"exec-helper": "clear-events"}],do_yank=
=3DFalse)
+            fd.close()
+
+    elif action =3D=3D "post-stop" \
+         and OCF_RESKEY_CRM_meta_notify_key_operation =3D=3D "stonith" \
+         and (HOSTNAME =3D=3D str.strip(OCF_RESKEY_CRM_meta_notify_master_=
uname)
+            or str.strip(OCF_RESKEY_CRM_meta_notify_promote_uname)):
+        peer =3D str.strip(OCF_RESKEY_CRM_meta_notify_stop_uname)
+        set_remote_master_score(peer, 0)
+
+    return OCF_SUCCESS
+
+def qemu_colo_promote():
+    role, replication =3D qemu_colo_monitor()
+
+    if role =3D=3D OCF_SUCCESS and replication =3D=3D OCF_NOT_RUNNING:
+        status =3D _qemu_colo_stop(role, False)
+        if status !=3D OCF_SUCCESS:
+            return status
+
+        rotate_logfile(QMP_LOG, 8)
+        rotate_logfile(QEMU_LOG, 8)
+        run_command(QEMU_PRIMARY_CMDLINE)
+        oob_helper_open()
+        set_master_score(101)
+
+        peer =3D env_find_secondary()
+        if peer:
+            fd =3D qmp_open()
+            qmp_start_resync(fd, peer)
+            # The secondary has inconsistent data until resync is finished
+            set_remote_master_score(peer, 0)
+            fd.close()
+        return OCF_SUCCESS
+    elif role =3D=3D OCF_SUCCESS and replication !=3D OCF_NOT_RUNNING:
+        fd =3D qmp_open()
+        qmp_secondary_failover(fd)
+        set_master_score(101)
+
+        peer =3D env_find_secondary()
+        if peer:
+            qmp_start_resync(fd, peer)
+            # The secondary has inconsistent data until resync is finished
+            set_remote_master_score(peer, 0)
+        qmp_execute(fd, [{"exec-helper": "clear-events"}], do_yank=3DFalse)
+        fd.close()
+        return OCF_SUCCESS
+    else:
+        return OCF_ERR_GENERIC
+
+def qemu_colo_demote():
+    status =3D qemu_colo_stop()
+    if status !=3D OCF_SUCCESS:
+        return status
+    return qemu_colo_start()
+
+
+if OCF_ACTION =3D=3D "meta-data":
+    qemu_colo_meta_data()
+    exit(OCF_SUCCESS)
+
+logs_open()
+
+status =3D qemu_colo_validate_all()
+# Exit here if our sanity checks fail, but try to continue if we need to s=
top
+if status !=3D OCF_SUCCESS and OCF_ACTION !=3D "stop":
+    exit(status)
+
+setup_constants()
+
+try:
+    if OCF_ACTION =3D=3D "start":
+        status =3D qemu_colo_start()
+    elif OCF_ACTION =3D=3D "stop":
+        status =3D qemu_colo_stop()
+    elif OCF_ACTION =3D=3D "monitor":
+        status =3D qemu_colo_monitor()[0]
+    elif OCF_ACTION =3D=3D "notify":
+        status =3D qemu_colo_notify()
+    elif OCF_ACTION =3D=3D "promote":
+        status =3D qemu_colo_promote()
+    elif OCF_ACTION =3D=3D "demote":
+        status =3D qemu_colo_demote()
+    elif OCF_ACTION =3D=3D "validate-all":
+        status =3D qemu_colo_validate_all()
+    else:
+        status =3D OCF_ERR_UNIMPLEMENTED
+except Error:
+    exit(OCF_ERR_GENERIC)
+else:
+    exit(status)
--=20
2.20.1


--Sig_/5n6P0EL_SzrpOrGjqvGWcRK
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEEg/qxWKDZuPtyYo+kNasLKJxdslgFAl65RJMACgkQNasLKJxd
slhoZA/+KGhIvEU3t/A/+Vi4yxPfTBaLdGAkqAXt7cNw+4kSwzUU2wLNIaxvGl9p
ufUF0/k6N5dzPaRQ5DGIV6psR9wZQacZdlkHrWGdGD/UGtnR5uieVlNJBD+yVDy2
TYPiEwgmo6ZcB6PWSqqetdeXsd5HST6w8d+aFJJftp+ab/yWT72Nk33BWKnPOufk
I6O9XmGz4VBhGKzJfSKfXtBpxi+vjod8YjuC3LAZo+KvwxxGbOYabXn73+sDjF6I
mBvaWOy4keaVCJZy/UnRMM2E9n0ddUa4T0OQ65xRuUj/YZnyRu66txa278HXG7RB
4ikygTzcEy7VDKKLd5KRlOPWKw6zXuwZZ1r3hBY18rd1NZPAhnjj3QPiqCrh/rQv
A+6ccR4HVoo+srnDVmaGWfDdsCOz+i5kQxrFWbZT9cgwVC3vpJkYbut0YILjWIJA
jrZpZAjOVPTsf28CWDHBYsFonpSDo8edMuzMATbSvSTzICk4ob2ggaAumB7ePat9
xuqa0/5qlcb2+h6TBzrFGhZis5fPr9qbZkQcK+s9q33r7jLJ4thFv/Mfrr4IPTIQ
DvGzp/LDgsVJ1x5osdbq3Vk6xPZ0RsVYaNjRstdz8ns/IP106KpoK4G5GHenwpA1
VxMoKM1qxvahkMXa8VvLuI+T218hLJq0Ca4z1iglpYFduKkMdb4=
=5T2s
-----END PGP SIGNATURE-----

--Sig_/5n6P0EL_SzrpOrGjqvGWcRK--

