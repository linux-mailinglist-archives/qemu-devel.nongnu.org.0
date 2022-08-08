Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EAA1B58C8E4
	for <lists+qemu-devel@lfdr.de>; Mon,  8 Aug 2022 14:59:34 +0200 (CEST)
Received: from localhost ([::1]:35238 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oL2M2-0005Ay-0r
	for lists+qemu-devel@lfdr.de; Mon, 08 Aug 2022 08:59:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52524)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oL2Jq-0007ou-ER
 for qemu-devel@nongnu.org; Mon, 08 Aug 2022 08:57:18 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:27064)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oL2Jo-0001fv-Pu
 for qemu-devel@nongnu.org; Mon, 08 Aug 2022 08:57:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1659963435;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=THIwJaCekNLy/BZoWOKoQ+/b0DlzgUSt+fJQ+kqHo50=;
 b=XDkPjvd4uu6hdd9h5Gv9yfHqBfN2W+JHf9N+CFF/XfA41I34Zt5PZtmmxBAYffWZqYpfoY
 mbBcFSMfWZ1FVc5TJYD4xnpEztWD7tsQbgexFMylURvMP9JOniJHELektuHQk24NTQE8hF
 x4+KtFGVwJZa3nt7NVnA8sWwcHrPitM=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-647-_knzFyw8OmadiXQKp4-4gA-1; Mon, 08 Aug 2022 08:57:14 -0400
X-MC-Unique: _knzFyw8OmadiXQKp4-4gA-1
Received: by mail-ed1-f69.google.com with SMTP id
 m18-20020a056402511200b0043d601a8035so5710500edd.20
 for <qemu-devel@nongnu.org>; Mon, 08 Aug 2022 05:57:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=THIwJaCekNLy/BZoWOKoQ+/b0DlzgUSt+fJQ+kqHo50=;
 b=gM0Af/5+Q9XpjhimjnjHzgr7/8u4fLw07WyIjfFSkInOJUWVhvauvpn75Qc3guz6uv
 wAW2I6SXgh0gHn3vs2ownqZ79xPMsraWXvPt+XWr2WlvFOCgTrNLRl0ZYBvErMkIlq81
 CGKmDYyF2v+UR44E4/G8YhQDZgMkYlQq5DBW6G2W5Fi6IxJluGlnxZ5AQ86FgjiKJzcw
 pwgpHOwOUhfkTQGAg/XY8RnOV52NKk0jaLrGQb+y2HfWaWeYE0DWOWMmzvmK6dORUEa0
 McYGCPj6KvHX+CRC9vqXczbl0756mZv5eVjBjuDas9kXoa/4ntP888+Zrtc6vAzW7a4N
 PMlQ==
X-Gm-Message-State: ACgBeo2EPVwMJeld+9lyfi84H+W2skSpNiSLOLZAVPeQTzXzZEtC8Q4H
 dckQI1fDvM791O0F6ry1QMbydpnaNVJUBPEZ7162PNncdCq/cTGZRB6AC2z889EZIAyU0J9FXWe
 jyZBG85hNt/P/aBXH0AWGMHcYXdAzF5e+sq6g6ZWwHG4CCHXxafVbrp99HxbxF9011q4=
X-Received: by 2002:a17:907:3111:b0:730:6535:b3fb with SMTP id
 wl17-20020a170907311100b007306535b3fbmr13121930ejb.490.1659963433341; 
 Mon, 08 Aug 2022 05:57:13 -0700 (PDT)
X-Google-Smtp-Source: AA6agR4lu3GtP9fccDjRxASg/M+c5GgAOmtG7yFd/QGgrlIj9inJ4/i5aDb6JGNv8sQ26p4V4ApJLw==
X-Received: by 2002:a17:907:3111:b0:730:6535:b3fb with SMTP id
 wl17-20020a170907311100b007306535b3fbmr13121914ejb.490.1659963433109; 
 Mon, 08 Aug 2022 05:57:13 -0700 (PDT)
Received: from goa-sendmail ([2001:b07:6468:f312:5e2c:eb9a:a8b6:fd3e])
 by smtp.gmail.com with ESMTPSA id
 bo7-20020a0564020b2700b0043bdc47803csm4601912edb.30.2022.08.08.05.57.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 08 Aug 2022 05:57:12 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: Markus Armbruster <armbru@redhat.com>
Subject: [PULL 3/5] vl: fix [memory] section with -readconfig
Date: Mon,  8 Aug 2022 14:57:04 +0200
Message-Id: <20220808125706.60511-4-pbonzini@redhat.com>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20220808125706.60511-1-pbonzini@redhat.com>
References: <20220808125706.60511-1-pbonzini@redhat.com>
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

The -M memory.* options do not have magic applied to them like the -m
option, namely no "M" (for mebibytes) is tacked at the end of a suffixless
value for "-M memory.size".

This magic is performed by parse_memory_options, and we have to do it for
both "-m" and the [memory] section of a config file.  Storing [memory]
sections directly to machine_opts_dict changed the meaning of

    [memory]
      size = "1024"

in a -readconfig file from 1024MiB to 8KiB (1024 Bytes rounded up to
8KiB silently).  To avoid this, the [memory] section has to be changed
back to QemuOpts (combining [memory] and "-m" will work fine thanks to
.merge_lists being true).

Change parse_memory_options() so that, similar to the older function
set_memory_options(), it operates after command line parsing is done;
and also call it where set_memory_options() used to be.

Note, the parsing code uses exit(1) instead of exit(EXIT_FAILURE) to
match neighboring code.

Reported-by: Markus Armbruster <armbru@redhat.com>
Reviewed-by: Markus Armbruster <armbru@redhat.com>
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



