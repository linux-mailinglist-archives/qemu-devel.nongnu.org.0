Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 175C937FB83
	for <lists+qemu-devel@lfdr.de>; Thu, 13 May 2021 18:32:16 +0200 (CEST)
Received: from localhost ([::1]:52506 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lhEFx-0004vg-Fs
	for lists+qemu-devel@lfdr.de; Thu, 13 May 2021 12:32:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40468)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lhED2-0002H7-J3
 for qemu-devel@nongnu.org; Thu, 13 May 2021 12:29:12 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:49587)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lhECx-0003QW-Hg
 for qemu-devel@nongnu.org; Thu, 13 May 2021 12:29:12 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620923346;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=wjlhzWTTlvRzXm4f0NDH6/Mp9uL080ScOYiGJuLVlIU=;
 b=VFwx93EMPXD0jYnIzZPEBPKD62p2nvBoiUtm0t1Oc55q3ze4iBm0VEi4XOT0dTAkJ9Xtmc
 J8PTY/mPOf8nakRsee495ecPzoPQaJiT0IzLBFFTgqq6kJtv5rmC/yMK9CRSeOVAyO9c5x
 Sik728LrLSPrJPgLZnffAwX5z9S0SnU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-533-Z7Vw7dNGP2GMEVHOWlB4tQ-1; Thu, 13 May 2021 12:29:04 -0400
X-MC-Unique: Z7Vw7dNGP2GMEVHOWlB4tQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9AADF1922035;
 Thu, 13 May 2021 16:29:03 +0000 (UTC)
Received: from virtlab701.virt.lab.eng.bos.redhat.com
 (virtlab701.virt.lab.eng.bos.redhat.com [10.19.152.228])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 2EDAF687D7;
 Thu, 13 May 2021 16:29:03 +0000 (UTC)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 01/14] remove -writeconfig
Date: Thu, 13 May 2021 12:28:48 -0400
Message-Id: <20210513162901.1310239-2-pbonzini@redhat.com>
In-Reply-To: <20210513162901.1310239-1-pbonzini@redhat.com>
References: <20210513162901.1310239-1-pbonzini@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.699,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: yang.zhong@intel.com, berrange@redhat.com, ehabkost@redhat.com,
 armbru@redhat.com
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
 docs/system/deprecated.rst       |  7 ------
 docs/system/removed-features.rst |  6 +++++
 include/qemu/config-file.h       |  1 -
 qemu-options.hx                  |  8 ++----
 softmmu/vl.c                     | 20 ---------------
 util/qemu-config.c               | 42 --------------------------------
 6 files changed, 8 insertions(+), 76 deletions(-)

diff --git a/docs/system/deprecated.rst b/docs/system/deprecated.rst
index f9169077ae..36d0b24633 100644
--- a/docs/system/deprecated.rst
+++ b/docs/system/deprecated.rst
@@ -96,13 +96,6 @@ library enabled as a cryptography provider.
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
 
diff --git a/docs/system/removed-features.rst b/docs/system/removed-features.rst
index c21e6fa5ee..85a988ce2d 100644
--- a/docs/system/removed-features.rst
+++ b/docs/system/removed-features.rst
@@ -126,6 +126,12 @@ devices.  Drives the board doesn't pick up can no longer be used with
 This option was undocumented and not used in the field.
 Use `-device usb-ccid`` instead.
 
+``-writeconfig`` (since 6.1)
+'''''''''''''''''''''''''''''
+
+The ``-writeconfig`` option was not able to serialize the entire contents
+of the QEMU command line.  It is thus considered a failed experiment
+and removed without a replacement.
 
 QEMU Machine Protocol (QMP) commands
 ------------------------------------
diff --git a/include/qemu/config-file.h b/include/qemu/config-file.h
index 8d3e53ae4d..9a44d2a77b 100644
--- a/include/qemu/config-file.h
+++ b/include/qemu/config-file.h
@@ -10,7 +10,6 @@ void qemu_add_opts(QemuOptsList *list);
 void qemu_add_drive_opts(QemuOptsList *list);
 int qemu_global_option(const char *str);
 
-void qemu_config_write(FILE *fp);
 int qemu_config_parse(FILE *fp, QemuOptsList **lists, const char *fname,
                       Error **errp);
 
diff --git a/qemu-options.hx b/qemu-options.hx
index acd8b4f6f9..317d33ea11 100644
--- a/qemu-options.hx
+++ b/qemu-options.hx
@@ -4395,18 +4395,14 @@ SRST
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
diff --git a/softmmu/vl.c b/softmmu/vl.c
index 11ac3750d8..c7653fe788 100644
--- a/softmmu/vl.c
+++ b/softmmu/vl.c
@@ -3388,26 +3388,6 @@ void qemu_init(int argc, char **argv, char **envp)
                 }
                 display_remote++;
                 break;
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
index 670bd6ebca..9bd86aab1b 100644
--- a/util/qemu-config.c
+++ b/util/qemu-config.c
@@ -307,48 +307,6 @@ void qemu_add_opts(QemuOptsList *list)
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
 int qemu_config_parse(FILE *fp, QemuOptsList **lists, const char *fname, Error **errp)
 {
-- 
2.26.2



