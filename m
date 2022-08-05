Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 26DB758A96E
	for <lists+qemu-devel@lfdr.de>; Fri,  5 Aug 2022 12:24:33 +0200 (CEST)
Received: from localhost ([::1]:44392 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oJuVM-00070A-6y
	for lists+qemu-devel@lfdr.de; Fri, 05 Aug 2022 06:24:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54264)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oJuE9-0005up-2r
 for qemu-devel@nongnu.org; Fri, 05 Aug 2022 06:06:56 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:41698)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oJuE6-0005td-1z
 for qemu-devel@nongnu.org; Fri, 05 Aug 2022 06:06:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1659694001;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=ISoLksDUePbFndvi/34uIim8xuuUc/NaEER9GufN9wM=;
 b=aPlHFBu0S+QXokp/OYRzWQdpC46jSRZ6W1tp1k5dCfmRQ8fBgFEprkAZlPI1DbeUXur0Jt
 3ASJ/OGA0SUg/LsvlZIvV1tDQiOWXMSQbRb10QQwnlxVyIYmEVzVQYbPXSaxU5rvm7Chei
 lpAoqQHzXl19LDsZMa1I0sFUwqW3kHM=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-550-8HFHl9I8MVeNBWzwTP7xUw-1; Fri, 05 Aug 2022 06:06:40 -0400
X-MC-Unique: 8HFHl9I8MVeNBWzwTP7xUw-1
Received: by mail-ej1-f71.google.com with SMTP id
 hp22-20020a1709073e1600b007309edc4089so1045941ejc.9
 for <qemu-devel@nongnu.org>; Fri, 05 Aug 2022 03:06:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc;
 bh=ISoLksDUePbFndvi/34uIim8xuuUc/NaEER9GufN9wM=;
 b=x7HNbw1pgF8WnnDa400S2Hd3UXiOo7imIjyGD2+JV1ujfty0D9yt5l7mhaNunSffLj
 lC9m2kwZ85kDDL1ugPA9rfpKIVCo4rLvBe+FV4t4qPfalAcxe3E6kRA29MchntxxwrL+
 uuDLR2ZUwmK+W/BvZZ7tqcRUXJ2kISOJwt9oV1YDODoyI2vfcu9RmgSQHvY6s7yx7IFB
 L3YUzSClLr5KhyxiT5kvY6fj/BQbBnNieZ7Og4IYho3WZUFbsvfdNIzfpPTqFb5ufdT9
 J/8RuwqsLGYqdKXC3A9dBSlnp09tu7OEs3glC6flLdRfi3r7HNwFvfhp3NLP/R1XY28m
 xoGQ==
X-Gm-Message-State: ACgBeo11qMOAkaj9/zllvcgFSdQm3VP2JrNaDG/NATaAP5uIObNB5LfC
 eWKEfWwuXokxuO+oJtps2G9D2blzTi7zBEI64vkVqZ8h5pr7l9FHNrDuKmuj/WRoB7mC5w4xcVv
 wZAl9DKFRVwzP+Lw2wxXanLG/RW/rAcz9ZpdBoyzhbVvRISfPmfVWNnOYXxxynu15hQc=
X-Received: by 2002:a05:6402:280f:b0:43d:f946:a895 with SMTP id
 h15-20020a056402280f00b0043df946a895mr6013240ede.229.1659693998701; 
 Fri, 05 Aug 2022 03:06:38 -0700 (PDT)
X-Google-Smtp-Source: AA6agR7+u3Hn3Un1VthyjryAI/GrLfwDUsuf9fTJL7XzT1eVHrCSLYhedfWnnEIRdZel5NWCSV5uow==
X-Received: by 2002:a05:6402:280f:b0:43d:f946:a895 with SMTP id
 h15-20020a056402280f00b0043df946a895mr6013166ede.229.1659693997368; 
 Fri, 05 Aug 2022 03:06:37 -0700 (PDT)
Received: from goa-sendmail ([93.56.169.144]) by smtp.gmail.com with ESMTPSA id
 b13-20020aa7c6cd000000b0043d3e06519fsm1809033eds.57.2022.08.05.03.06.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 05 Aug 2022 03:06:36 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: Markus Armbruster <armbru@redhat.com>
Subject: [PATCH for-7.1] vl: fix [memory] section with -readconfig
Date: Fri,  5 Aug 2022 12:06:35 +0200
Message-Id: <20220805100635.493961-1-pbonzini@redhat.com>
X-Mailer: git-send-email 2.37.1
MIME-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

The -M memory.* options do not have magic applied to them than the -m
option, namely no "M" (for mebibytes) is tacked at the end of a
suffixless value for "-M memory.size".

This magic is performed by parse_memory_options, and we have to
do it for both "-m" and the [memory] section of a config file.
Storing [memory] sections directly to machine_opts_dict changed
the meaning of

    [memory]
      size = "1024"

in a -readconfig file from 1024MiB to 8KiB (1024 Bytes rounded up to
8KiB silently).  To avoid this, the [memory] section has to be
changed back to QemuOpts (combining [memory] and "-m" will work fine
thanks to .merge_lists being true).

Change parse_memory_options() so that, similar to the older function
set_memory_options(), it operates after command line parsing is done;
and also call it where set_memory_options() used to be.

Note, the parsing code uses exit(1) instead of exit(EXIT_FAILURE) to
match neighboring code.

Reported-by: Markus Armbruster <armbru@redhat.com>
Fixes: ce9d03fb3f ("machine: add mem compound property", 2022-05-12)
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 softmmu/vl.c | 25 ++++++++++++++++---------
 1 file changed, 16 insertions(+), 9 deletions(-)

diff --git a/softmmu/vl.c b/softmmu/vl.c
index aabd82e09a..3c23f266e9 100644
--- a/softmmu/vl.c
+++ b/softmmu/vl.c
@@ -1947,17 +1947,20 @@ static void qemu_resolve_machine_memdev(void)
     }
 }
 
-static void parse_memory_options(const char *arg)
+static void parse_memory_options(void)
 {
-    QemuOpts *opts;
+    QemuOpts *opts = qemu_find_opts_singleton("memory");
     QDict *dict, *prop;
     const char *mem_str;
+    Location loc;
 
-    opts = qemu_opts_parse_noisily(qemu_find_opts("memory"), arg, true);
     if (!opts) {
-        exit(EXIT_FAILURE);
+        return;
     }
 
+    loc_push_none(&loc);
+    qemu_opts_loc_restore(opts);
+
     prop = qdict_new();
 
     if (qemu_opt_get_size(opts, "size", 0) != 0) {
@@ -1987,6 +1990,7 @@ static void parse_memory_options(const char *arg)
     qdict_put(dict, "memory", prop);
     keyval_merge(machine_opts_dict, dict, &error_fatal);
     qobject_unref(dict);
+    loc_pop(&loc);
 }
 
 static void qemu_create_machine(QDict *qdict)
@@ -2053,8 +2057,7 @@ static bool is_qemuopts_group(const char *group)
     if (g_str_equal(group, "object") ||
         g_str_equal(group, "machine") ||
         g_str_equal(group, "smp-opts") ||
-        g_str_equal(group, "boot-opts") ||
-        g_str_equal(group, "memory")) {
+        g_str_equal(group, "boot-opts")) {
         return false;
     }
     return true;
@@ -2078,8 +2081,6 @@ static void qemu_record_config_group(const char *group, QDict *dict,
         machine_merge_property("smp", dict, &error_fatal);
     } else if (g_str_equal(group, "boot-opts")) {
         machine_merge_property("boot", dict, &error_fatal);
-    } else if (g_str_equal(group, "memory")) {
-        machine_merge_property("memory", dict, &error_fatal);
     } else {
         abort();
     }
@@ -2882,7 +2883,10 @@ void qemu_init(int argc, char **argv, char **envp)
                 exit(0);
                 break;
             case QEMU_OPTION_m:
-                parse_memory_options(optarg);
+                opts = qemu_opts_parse_noisily(qemu_find_opts("memory"), optarg, true);
+                if (opts == NULL) {
+                    exit(1);
+                }
                 break;
 #ifdef CONFIG_TPM
             case QEMU_OPTION_tpmdev:
@@ -3515,6 +3519,9 @@ void qemu_init(int argc, char **argv, char **envp)
 
     configure_rtc(qemu_find_opts_singleton("rtc"));
 
+    /* Transfer QemuOpts options into machine options */
+    parse_memory_options();
+
     qemu_create_machine(machine_opts_dict);
 
     suspend_mux_open();
-- 
2.37.1


