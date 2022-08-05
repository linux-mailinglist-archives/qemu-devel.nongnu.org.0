Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3096958AECD
	for <lists+qemu-devel@lfdr.de>; Fri,  5 Aug 2022 19:24:49 +0200 (CEST)
Received: from localhost ([::1]:52784 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oK144-0001TF-B6
	for lists+qemu-devel@lfdr.de; Fri, 05 Aug 2022 13:24:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53484)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oK12U-0007Jn-Sh
 for qemu-devel@nongnu.org; Fri, 05 Aug 2022 13:23:11 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:29660)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oK12R-00038w-CQ
 for qemu-devel@nongnu.org; Fri, 05 Aug 2022 13:23:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1659720186;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=fjhhL83zzKByJvAm4mHAV7fz+4xtJCt//jFnMBUp0w8=;
 b=VvqytlKMhUoTsNdmwnw0qCqjrlCRY/d9Q82eK3g4asI4dhdYSFKwzZsj2R5U2ZPFJF1xvQ
 bbE65RdbDXG73+p2O7UxIfJXLFA7g+DyYXIWvI58ddSwhgQofOFoe/hiqZy9NVUWNCucza
 tMOoyBwGnSM1HV684+9t9DUZiWm1mH8=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-491-q4hrs5LWO0Citua_dpF3Ig-1; Fri, 05 Aug 2022 13:23:04 -0400
X-MC-Unique: q4hrs5LWO0Citua_dpF3Ig-1
Received: by mail-ej1-f72.google.com with SMTP id
 qa39-20020a17090786a700b007309910696fso1392276ejc.4
 for <qemu-devel@nongnu.org>; Fri, 05 Aug 2022 10:23:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc;
 bh=fjhhL83zzKByJvAm4mHAV7fz+4xtJCt//jFnMBUp0w8=;
 b=bdahMzWG0SOuqIq/3suprBoLVh1LdAeRS+Jes0hyKK+lmaVtMb/yGw1OTZJi3bpEFR
 paQ05hdNl5gY6z4Z+SzO0eBjPsahngh87jl3szABH00BPoZFtY/tdTUAlkNb8545uKb9
 8x9Zv0fKdRYXCpD0FqOT54AlNSXmIRtMv7GCzCs/LuT/VTVUnS7q02fZwfu2fiKneTbl
 weGNrH1sXF4SnaHiB3PQx1U5a39FpaNBm+nZr+5kMTaNuUOs/MfHMfbA+BsDinT2gZVB
 jQeVTjOSjvBM6dTAO8idFBdWxx3sT5dtbvJueEI7FKZz7iRPlJSTEz1Oadhd1Za5bibu
 g5vw==
X-Gm-Message-State: ACgBeo390QKh0+GXCUk+4O457nFxSyKWuThVSt2HX18QhXzUw8YNMALK
 3Nwz/8XF1HQhNIpNpitRuKg07qntrV+pXKQz4iPkU2xX9AuFEBWmd7W6tK3XhLQ16W6Xz7HzohC
 5L1h276RKhiDscAAh0z/ZKxlTEmBbX16UG6KAOMkdjxfFFTWujPxYZVDNHeAWLkQ570w=
X-Received: by 2002:aa7:cac4:0:b0:43b:ddac:aa79 with SMTP id
 l4-20020aa7cac4000000b0043bddacaa79mr7542621edt.202.1659720183095; 
 Fri, 05 Aug 2022 10:23:03 -0700 (PDT)
X-Google-Smtp-Source: AA6agR4h25IQ2avh30RYpNz7vmm3itXdnUlVUZFTrH50juFpWe825M9dsWLabTuarLgq/1mwb+e46A==
X-Received: by 2002:aa7:cac4:0:b0:43b:ddac:aa79 with SMTP id
 l4-20020aa7cac4000000b0043bddacaa79mr7542595edt.202.1659720182826; 
 Fri, 05 Aug 2022 10:23:02 -0700 (PDT)
Received: from goa-sendmail ([2001:b07:6468:f312:9af8:e5f5:7516:fa89])
 by smtp.gmail.com with ESMTPSA id
 j4-20020a17090686c400b0070e238ff66fsm1786336ejy.96.2022.08.05.10.23.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 05 Aug 2022 10:23:02 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: Markus Armbruster <armbru@redhat.com>
Subject: [PATCH v2] vl: fix [memory] section with -readconfig
Date: Fri,  5 Aug 2022 19:23:01 +0200
Message-Id: <20220805172301.553081-1-pbonzini@redhat.com>
X-Mailer: git-send-email 2.37.1
MIME-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
 softmmu/vl.c | 25 ++++++++++++++-----------
 1 file changed, 14 insertions(+), 11 deletions(-)

diff --git a/softmmu/vl.c b/softmmu/vl.c
index aabd82e09a..45e919de9f 100644
--- a/softmmu/vl.c
+++ b/softmmu/vl.c
@@ -1947,16 +1947,15 @@ static void qemu_resolve_machine_memdev(void)
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
-    if (!opts) {
-        exit(EXIT_FAILURE);
-    }
+    loc_push_none(&loc);
+    qemu_opts_loc_restore(opts);
 
     prop = qdict_new();
 
@@ -1987,6 +1986,7 @@ static void parse_memory_options(const char *arg)
     qdict_put(dict, "memory", prop);
     keyval_merge(machine_opts_dict, dict, &error_fatal);
     qobject_unref(dict);
+    loc_pop(&loc);
 }
 
 static void qemu_create_machine(QDict *qdict)
@@ -2053,8 +2053,7 @@ static bool is_qemuopts_group(const char *group)
     if (g_str_equal(group, "object") ||
         g_str_equal(group, "machine") ||
         g_str_equal(group, "smp-opts") ||
-        g_str_equal(group, "boot-opts") ||
-        g_str_equal(group, "memory")) {
+        g_str_equal(group, "boot-opts")) {
         return false;
     }
     return true;
@@ -2078,8 +2077,6 @@ static void qemu_record_config_group(const char *group, QDict *dict,
         machine_merge_property("smp", dict, &error_fatal);
     } else if (g_str_equal(group, "boot-opts")) {
         machine_merge_property("boot", dict, &error_fatal);
-    } else if (g_str_equal(group, "memory")) {
-        machine_merge_property("memory", dict, &error_fatal);
     } else {
         abort();
     }
@@ -2882,7 +2879,10 @@ void qemu_init(int argc, char **argv, char **envp)
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
@@ -3515,6 +3515,9 @@ void qemu_init(int argc, char **argv, char **envp)
 
     configure_rtc(qemu_find_opts_singleton("rtc"));
 
+    /* Transfer QemuOpts options into machine options */
+    parse_memory_options();
+
     qemu_create_machine(machine_opts_dict);
 
     suspend_mux_open();
-- 
2.37.1


