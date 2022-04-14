Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 56599501169
	for <lists+qemu-devel@lfdr.de>; Thu, 14 Apr 2022 16:58:47 +0200 (CEST)
Received: from localhost ([::1]:59314 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nf0vm-0007Go-72
	for lists+qemu-devel@lfdr.de; Thu, 14 Apr 2022 10:58:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56112)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1nf0ui-0005ts-0N
 for qemu-devel@nongnu.org; Thu, 14 Apr 2022 10:57:40 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:57392)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1nf0ue-0008L6-6A
 for qemu-devel@nongnu.org; Thu, 14 Apr 2022 10:57:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1649948242;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=fmmSNYkUJBDACNp9fqMqg9ewebaGDJCVNRLIFq/GDwU=;
 b=SUdCn7y9CLYEJ2qrkr33EHCcHNBz3e5PKiLTo+sIVewMwcwPsmqiU3cvRf1/0gRfhKjUG6
 Ysht/SPrFbErHG7NkC6u8gxhK5lCelsJKWUPesEoMjJbmPm0mrpxb0yEysOIkN7CVQ8ktQ
 xTwOrF9oVhWXqEBvXstyzZQ6IxRZ4Xc=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-551-uVq4oxrHNmOo5cwJKmCSxQ-1; Thu, 14 Apr 2022 10:57:21 -0400
X-MC-Unique: uVq4oxrHNmOo5cwJKmCSxQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 78C3E3C16187
 for <qemu-devel@nongnu.org>; Thu, 14 Apr 2022 14:57:21 +0000 (UTC)
Received: from virtlab701.virt.lab.eng.bos.redhat.com
 (virtlab701.virt.lab.eng.bos.redhat.com [10.19.152.228])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 663B820296A5
 for <qemu-devel@nongnu.org>; Thu, 14 Apr 2022 14:57:21 +0000 (UTC)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH] remove -writeconfig
Date: Thu, 14 Apr 2022 10:57:21 -0400
Message-Id: <20220414145721.326866-1-pbonzini@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-type: text/plain
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Like -set and -readconfig, it would not really be too hard to
extend -writeconfig to parsing mechanisms other than QemuOpts.
However, the uses of -writeconfig are substantially more
limited, as it is generally easier to write the configuration
by hand in the first place.  In addition, -writeconfig does
not even try to detect cases where it prints incorrect
syntax (for example if values have a quote in them, since
qemu_config_parse does not support any kind of escaping.
Just remove it.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 docs/about/deprecated.rst       |  7 ------
 docs/about/removed-features.rst |  6 +++++
 include/qemu/config-file.h      |  1 -
 qemu-options.hx                 |  8 ++-----
 softmmu/climain.c               | 20 ----------------
 util/qemu-config.c              | 42 ---------------------------------
 6 files changed, 8 insertions(+), 76 deletions(-)

diff --git a/docs/about/deprecated.rst b/docs/about/deprecated.rst
index 3fb330116d..bd1163eed1 100644
--- a/docs/about/deprecated.rst
+++ b/docs/about/deprecated.rst
@@ -79,13 +79,6 @@ library enabled as a cryptography provider.
 Neither the ``nettle`` library, or the built-in cryptography provider are
 supported on FIPS enabled hosts.
 
-``-writeconfig`` (since 6.0)
-'''''''''''''''''''''''''''''
-
-The ``-writeconfig`` option is not able to serialize the entire contents
-of the QEMU command line.  It is thus considered a failed experiment
-and deprecated, with no current replacement.
-
 Userspace local APIC with KVM (x86, since 6.0)
 ''''''''''''''''''''''''''''''''''''''''''''''
 
diff --git a/docs/about/removed-features.rst b/docs/about/removed-features.rst
index 4b831ea291..c313a22fd0 100644
--- a/docs/about/removed-features.rst
+++ b/docs/about/removed-features.rst
@@ -336,6 +336,12 @@ for the RISC-V ``virt`` machine and ``sifive_u`` machine.
 The ``-no-quit`` was a synonym for ``-display ...,window-close=off`` which
 should be used instead.
 
+``-writeconfig`` (removed in 7.1)
+'''''''''''''''''''''''''''''''''
+
+The ``-writeconfig`` option was not able to serialize the entire contents
+of the QEMU command line.  It is thus considered a failed experiment
+and removed without a replacement.
 
 QEMU Machine Protocol (QMP) commands
 ------------------------------------
diff --git a/include/qemu/config-file.h b/include/qemu/config-file.h
index f605423321..321e7c7c03 100644
--- a/include/qemu/config-file.h
+++ b/include/qemu/config-file.h
@@ -12,7 +12,6 @@ void qemu_add_opts(QemuOptsList *list);
 void qemu_add_drive_opts(QemuOptsList *list);
 int qemu_global_option(const char *str);
 
-void qemu_config_write(FILE *fp);
 int qemu_config_parse(FILE *fp, QemuOptsList **lists, const char *fname,
                       Error **errp);
 
diff --git a/qemu-options.hx b/qemu-options.hx
index 34e9b32a5c..4c8e47a73c 100644
--- a/qemu-options.hx
+++ b/qemu-options.hx
@@ -4622,18 +4622,14 @@ SRST
 ERST
 
 DEF("readconfig", HAS_ARG, QEMU_OPTION_readconfig,
-    "-readconfig <file>\n", QEMU_ARCH_ALL)
+    "-readconfig <file>\n"
+    "                read config file\n", QEMU_ARCH_ALL)
 SRST
 ``-readconfig file``
     Read device configuration from file. This approach is useful when
     you want to spawn QEMU process with many command line options but
     you don't want to exceed the command line character limit.
 ERST
-DEF("writeconfig", HAS_ARG, QEMU_OPTION_writeconfig,
-    "-writeconfig <file>\n"
-    "                read/write config file (deprecated)\n", QEMU_ARCH_ALL)
-SRST
-ERST
 
 DEF("no-user-config", 0, QEMU_OPTION_nouserconfig,
     "-no-user-config\n"
diff --git a/softmmu/climain.c b/softmmu/climain.c
index 92307b2bbd..160e4c201c 100644
--- a/softmmu/climain.c
+++ b/softmmu/climain.c
@@ -3534,26 +3534,6 @@ void qemu_init(int argc, char **argv, char **envp)
                 display_remote++;
                 break;
 #endif
-            case QEMU_OPTION_writeconfig:
-                {
-                    FILE *fp;
-                    warn_report("-writeconfig is deprecated and will go away without a replacement");
-                    if (strcmp(optarg, "-") == 0) {
-                        fp = stdout;
-                    } else {
-                        fp = fopen(optarg, "w");
-                        if (fp == NULL) {
-                            error_report("open %s: %s", optarg,
-                                         strerror(errno));
-                            exit(1);
-                        }
-                    }
-                    qemu_config_write(fp);
-                    if (fp != stdout) {
-                        fclose(fp);
-                    }
-                    break;
-                }
             case QEMU_OPTION_qtest:
                 qtest_chrdev = optarg;
                 break;
diff --git a/util/qemu-config.c b/util/qemu-config.c
index 436ab63b16..433488aa56 100644
--- a/util/qemu-config.c
+++ b/util/qemu-config.c
@@ -314,48 +314,6 @@ void qemu_add_opts(QemuOptsList *list)
     abort();
 }
 
-struct ConfigWriteData {
-    QemuOptsList *list;
-    FILE *fp;
-};
-
-static int config_write_opt(void *opaque, const char *name, const char *value,
-                            Error **errp)
-{
-    struct ConfigWriteData *data = opaque;
-
-    fprintf(data->fp, "  %s = \"%s\"\n", name, value);
-    return 0;
-}
-
-static int config_write_opts(void *opaque, QemuOpts *opts, Error **errp)
-{
-    struct ConfigWriteData *data = opaque;
-    const char *id = qemu_opts_id(opts);
-
-    if (id) {
-        fprintf(data->fp, "[%s \"%s\"]\n", data->list->name, id);
-    } else {
-        fprintf(data->fp, "[%s]\n", data->list->name);
-    }
-    qemu_opt_foreach(opts, config_write_opt, data, NULL);
-    fprintf(data->fp, "\n");
-    return 0;
-}
-
-void qemu_config_write(FILE *fp)
-{
-    struct ConfigWriteData data = { .fp = fp };
-    QemuOptsList **lists = vm_config_groups;
-    int i;
-
-    fprintf(fp, "# qemu config file\n\n");
-    for (i = 0; lists[i] != NULL; i++) {
-        data.list = lists[i];
-        qemu_opts_foreach(data.list, config_write_opts, &data, NULL);
-    }
-}
-
 /* Returns number of config groups on success, -errno on error */
 static int qemu_config_foreach(FILE *fp, QEMUConfigCB *cb, void *opaque,
                                const char *fname, Error **errp)
-- 
2.31.1


