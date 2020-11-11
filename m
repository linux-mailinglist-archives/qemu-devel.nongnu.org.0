Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DA04F2AF2C0
	for <lists+qemu-devel@lfdr.de>; Wed, 11 Nov 2020 14:58:42 +0100 (CET)
Received: from localhost ([::1]:36998 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kcqe1-0001SK-E0
	for lists+qemu-devel@lfdr.de; Wed, 11 Nov 2020 08:58:41 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:54214)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kcqco-0000f8-QR
 for qemu-devel@nongnu.org; Wed, 11 Nov 2020 08:57:26 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:32206)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kcqck-0000HX-Ov
 for qemu-devel@nongnu.org; Wed, 11 Nov 2020 08:57:26 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1605103041;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=Yc7x+zRb/vexxW1Dv6j+LOV3Cb1YMwojk2csVfb/M0s=;
 b=JIhPUCoiLEwo06rCzY45ZsU4YNEp3BTPTIaKk7bDK1sfn0dmKofY1k3eAEaxIoddHKthTR
 Bv0JAzVEqD5B55bnA0mcOaN8zKiNtFdJAfWexfFXspyogMSVWp8ipy7WAI9Ar5y7vhLLc/
 ohYtbN8lK9/QI2TifGNaiJQtslwjo3Y=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-122-iZ9laTgpP0yc4AqDS7d8Aw-1; Wed, 11 Nov 2020 08:57:19 -0500
X-MC-Unique: iZ9laTgpP0yc4AqDS7d8Aw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8D2471087D67
 for <qemu-devel@nongnu.org>; Wed, 11 Nov 2020 13:57:18 +0000 (UTC)
Received: from virtlab701.virt.lab.eng.bos.redhat.com
 (virtlab701.virt.lab.eng.bos.redhat.com [10.19.152.228])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 4B6D360CD0;
 Wed, 11 Nov 2020 13:57:17 +0000 (UTC)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH] vl, qemu-config: remove -set
Date: Wed, 11 Nov 2020 08:57:16 -0500
Message-Id: <20201111135716.1209421-1-pbonzini@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=63.128.21.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/11 01:42:46
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: berrange@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

-set as far as I can see has basically no use.  It was intended as an override
mechanism for configuration files, but even configuration files themselves
are hardly used.  Drop it with prejudice.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 docs/system/deprecated.rst |  6 ++++++
 include/qemu/config-file.h |  1 -
 qemu-options.hx            |  9 ---------
 softmmu/vl.c               |  4 ----
 util/qemu-config.c         | 33 ---------------------------------
 5 files changed, 6 insertions(+), 47 deletions(-)

diff --git a/docs/system/deprecated.rst b/docs/system/deprecated.rst
index 9aa1ab268b..f7eede1b68 100644
--- a/docs/system/deprecated.rst
+++ b/docs/system/deprecated.rst
@@ -719,6 +719,12 @@ topologies described with -smp include all possible cpus, i.e.
 The ``enforce-config-section`` property was replaced by the
 ``-global migration.send-configuration={on|off}`` option.
 
+``-set`` (removed 6.0)
+''''''''''''''''''''''
+
+The ``-set`` option was removed with no replacement and no prior
+deprecation period.
+
 Block devices
 -------------
 
diff --git a/include/qemu/config-file.h b/include/qemu/config-file.h
index d74f920152..29226107bd 100644
--- a/include/qemu/config-file.h
+++ b/include/qemu/config-file.h
@@ -8,7 +8,6 @@ QemuOpts *qemu_find_opts_singleton(const char *group);
 
 void qemu_add_opts(QemuOptsList *list);
 void qemu_add_drive_opts(QemuOptsList *list);
-int qemu_set_option(const char *str);
 int qemu_global_option(const char *str);
 
 void qemu_config_write(FILE *fp);
diff --git a/qemu-options.hx b/qemu-options.hx
index 2c83390504..45c503cb8f 100644
--- a/qemu-options.hx
+++ b/qemu-options.hx
@@ -371,15 +371,6 @@ SRST
          -drive file=/dev/fdset/2,index=0,media=disk
 ERST
 
-DEF("set", HAS_ARG, QEMU_OPTION_set,
-    "-set group.id.arg=value\n"
-    "                set <arg> parameter for item <id> of type <group>\n"
-    "                i.e. -set drive.$id.file=/path/to/image\n", QEMU_ARCH_ALL)
-SRST
-``-set group.id.arg=value``
-    Set parameter arg for item id of type group
-ERST
-
 DEF("global", HAS_ARG, QEMU_OPTION_global,
     "-global driver.property=value\n"
     "-global driver=driver,property=property,value=value\n"
diff --git a/softmmu/vl.c b/softmmu/vl.c
index 50c4850064..f66a4eb9c2 100644
--- a/softmmu/vl.c
+++ b/softmmu/vl.c
@@ -2652,10 +2652,6 @@ void qemu_init(int argc, char **argv, char **envp)
                     exit(1);
                 }
                 break;
-            case QEMU_OPTION_set:
-                if (qemu_set_option(optarg) != 0)
-                    exit(1);
-                break;
             case QEMU_OPTION_global:
                 if (qemu_global_option(optarg) != 0)
                     exit(1);
diff --git a/util/qemu-config.c b/util/qemu-config.c
index bcae298b71..1a7b7e951c 100644
--- a/util/qemu-config.c
+++ b/util/qemu-config.c
@@ -313,39 +313,6 @@ void qemu_add_opts(QemuOptsList *list)
     abort();
 }
 
-int qemu_set_option(const char *str)
-{
-    Error *local_err = NULL;
-    char group[64], id[64], arg[64];
-    QemuOptsList *list;
-    QemuOpts *opts;
-    int rc, offset;
-
-    rc = sscanf(str, "%63[^.].%63[^.].%63[^=]%n", group, id, arg, &offset);
-    if (rc < 3 || str[offset] != '=') {
-        error_report("can't parse: \"%s\"", str);
-        return -1;
-    }
-
-    list = qemu_find_opts(group);
-    if (list == NULL) {
-        return -1;
-    }
-
-    opts = qemu_opts_find(list, id);
-    if (!opts) {
-        error_report("there is no %s \"%s\" defined",
-                     list->name, id);
-        return -1;
-    }
-
-    if (!qemu_opt_set(opts, arg, str + offset + 1, &local_err)) {
-        error_report_err(local_err);
-        return -1;
-    }
-    return 0;
-}
-
 struct ConfigWriteData {
     QemuOptsList *list;
     FILE *fp;
-- 
2.26.2


