Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E45255BD4AC
	for <lists+qemu-devel@lfdr.de>; Mon, 19 Sep 2022 20:16:37 +0200 (CEST)
Received: from localhost ([::1]:47146 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oaLJs-0005pO-Ur
	for lists+qemu-devel@lfdr.de; Mon, 19 Sep 2022 14:16:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39368)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oaKg7-0003Ip-PJ
 for qemu-devel@nongnu.org; Mon, 19 Sep 2022 13:35:32 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:50469)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oaKfu-00037J-Lp
 for qemu-devel@nongnu.org; Mon, 19 Sep 2022 13:35:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1663608918;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=YBFJC4GsVk5U+mTF4QZd85zy3mdtZbBJHBFi0S5+/GY=;
 b=eRqaBpXjAVx5Dh4pv2SN/H4VlpCEmcqdCt5LmyOsyJuWTpg5F7T2999jkY+iMoZpkpm6Pj
 QjVphAStMbYMhsl6Mt2e44zjXimldu29AAeGqmI+kQDvatqQnqs8LOp85pq+qc3iZbEm+w
 sBlpeItTfkjpx/oaTecz4w59qhC0fL8=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-121-l8sjgnoLMpes2wzdkebgYg-1; Mon, 19 Sep 2022 13:35:16 -0400
X-MC-Unique: l8sjgnoLMpes2wzdkebgYg-1
Received: by mail-wm1-f72.google.com with SMTP id
 h4-20020a1c2104000000b003b334af7d50so4964508wmh.3
 for <qemu-devel@nongnu.org>; Mon, 19 Sep 2022 10:35:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=YBFJC4GsVk5U+mTF4QZd85zy3mdtZbBJHBFi0S5+/GY=;
 b=LnBXfSJoSFgvdAenrH7qJOXA/JhHZ9d+DOg+NQM7m8DCvMI03GdMc33vAe/W4hf0MZ
 aNDDjyCkEPqzDvW5Vxsuih5klRJDbu+/LHMKZE27eVie/L9q9IXcs/AJLtOeMFaD0INh
 +6+WDOXnYkI0hAL1eW2HtGHKE+lQUGv78IAteHIBKzf5dzCKvyOUAK6yk5EPdU6Xt14X
 L+puAnmzGcH98HqN67v4xoERVoSlo6P74ooxEUNvE0p0SgyI3T5dm+aBr+H8GNJhEPHC
 wJTnbAw1SZfdXF1X0EbIyeJtE2eNJKuP1VGaF092CdmPCLTUaut6IkaMA1tmrXg9DaYG
 FmBQ==
X-Gm-Message-State: ACrzQf1lprzEbmZoYcKurZO+eR5gbDEjTX4A8r/XX9N96n1VwkIG59ul
 0ytM9IwABly9Tok8U9O2E00yyXCVCOtwBIYq51T5MDdPojVbQYsPhvQpzg81M3O44F4cEsARxZO
 EopZhfk8gBj3zWCjKbOfmciCBSKTVl6Hgr8kTn7TexvyBR15kLmSJj8vTG8rJGAXTT9A=
X-Received: by 2002:adf:fa81:0:b0:224:f260:2523 with SMTP id
 h1-20020adffa81000000b00224f2602523mr11306269wrr.26.1663608915126; 
 Mon, 19 Sep 2022 10:35:15 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM4gjJ/xGHFbDh/CrnlqPl3ShjYoh06fmrc1jbBbycGSXz1leXbu9BHIhqXf+k+v+WRtwyGTHg==
X-Received: by 2002:adf:fa81:0:b0:224:f260:2523 with SMTP id
 h1-20020adffa81000000b00224f2602523mr11306254wrr.26.1663608914741; 
 Mon, 19 Sep 2022 10:35:14 -0700 (PDT)
Received: from [192.168.10.118] ([2001:b07:6468:f312:1c09:f536:3de6:228c])
 by smtp.gmail.com with ESMTPSA id
 e7-20020adfa747000000b0022878c0cc5esm14170554wrd.69.2022.09.19.10.35.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 Sep 2022 10:35:14 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: Claudio Fontana <cfontana@suse.de>
Subject: [PULL 15/21] audio: add help option for -audio and -audiodev
Date: Mon, 19 Sep 2022 19:34:43 +0200
Message-Id: <20220919173449.5864-16-pbonzini@redhat.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20220919173449.5864-1-pbonzini@redhat.com>
References: <20220919173449.5864-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

From: Claudio Fontana <cfontana@suse.de>

add a simple help option for -audio and -audiodev
to show the list of available drivers, and document them.

Signed-off-by: Claudio Fontana <cfontana@suse.de>
Message-Id: <20220908081441.7111-1-cfontana@suse.de>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 audio/audio.c   | 19 +++++++++++++++++++
 audio/audio.h   |  1 +
 qemu-options.hx | 10 ++++++----
 softmmu/vl.c    |  9 +++++++--
 4 files changed, 33 insertions(+), 6 deletions(-)

diff --git a/audio/audio.c b/audio/audio.c
index 76b8735b44..cfa4119c05 100644
--- a/audio/audio.c
+++ b/audio/audio.c
@@ -32,6 +32,7 @@
 #include "qapi/qapi-visit-audio.h"
 #include "qemu/cutils.h"
 #include "qemu/module.h"
+#include "qemu/help_option.h"
 #include "sysemu/sysemu.h"
 #include "sysemu/replay.h"
 #include "sysemu/runstate.h"
@@ -2101,10 +2102,28 @@ static void audio_validate_opts(Audiodev *dev, Error **errp)
     }
 }
 
+void audio_help(void)
+{
+    int i;
+
+    printf("Available audio drivers:\n");
+
+    for (i = 0; i < AUDIODEV_DRIVER__MAX; i++) {
+        audio_driver *driver = audio_driver_lookup(AudiodevDriver_str(i));
+        if (driver) {
+            printf("%s\n", driver->name);
+        }
+    }
+}
+
 void audio_parse_option(const char *opt)
 {
     Audiodev *dev = NULL;
 
+    if (is_help_option(opt)) {
+        audio_help();
+        exit(EXIT_SUCCESS);
+    }
     Visitor *v = qobject_input_visitor_new_str(opt, "driver", &error_fatal);
     visit_type_Audiodev(v, NULL, &dev, &error_fatal);
     visit_free(v);
diff --git a/audio/audio.h b/audio/audio.h
index 27e67079a0..01bdc567fb 100644
--- a/audio/audio.h
+++ b/audio/audio.h
@@ -171,6 +171,7 @@ void audio_sample_from_uint64(void *samples, int pos,
 void audio_define(Audiodev *audio);
 void audio_parse_option(const char *opt);
 bool audio_init_audiodevs(void);
+void audio_help(void);
 void audio_legacy_help(void);
 
 AudioState *audio_state_by_name(const char *name);
diff --git a/qemu-options.hx b/qemu-options.hx
index 1bb02363ab..d8b5ce5b43 100644
--- a/qemu-options.hx
+++ b/qemu-options.hx
@@ -704,10 +704,11 @@ SRST
 ``-audio [driver=]driver,model=value[,prop[=value][,...]]``
     This option is a shortcut for configuring both the guest audio
     hardware and the host audio backend in one go.
-    The host backend options are the same as with the corresponding
-    ``-audiodev`` options below. The guest hardware model can be set with
-    ``model=modelname``. Use ``model=help`` to list the available device
-    types.
+    The driver option is the same as with the corresponding ``-audiodev`` option below.
+    The guest hardware model can be set with ``model=modelname``.
+
+    Use ``driver=help`` to list the available drivers,
+    and ``model=help`` to list the available device types.
 
     The following two example do exactly the same, to show how ``-audio``
     can be used to shorten the command line length:
@@ -721,6 +722,7 @@ ERST
 DEF("audiodev", HAS_ARG, QEMU_OPTION_audiodev,
     "-audiodev [driver=]driver,id=id[,prop[=value][,...]]\n"
     "                specifies the audio backend to use\n"
+    "                Use ``-audiodev help`` to list the available drivers\n"
     "                id= identifier of the backend\n"
     "                timer-period= timer period in microseconds\n"
     "                in|out.mixing-engine= use mixing engine to mix streams inside QEMU\n"
diff --git a/softmmu/vl.c b/softmmu/vl.c
index 263f029a8e..e62b9cc35d 100644
--- a/softmmu/vl.c
+++ b/softmmu/vl.c
@@ -2842,11 +2842,16 @@ void qemu_init(int argc, char **argv, char **envp)
                 audio_parse_option(optarg);
                 break;
             case QEMU_OPTION_audio: {
-                QDict *dict = keyval_parse(optarg, "driver", NULL, &error_fatal);
+                bool help;
                 char *model;
                 Audiodev *dev = NULL;
                 Visitor *v;
-
+                QDict *dict = keyval_parse(optarg, "driver", &help, &error_fatal);
+                if (help || (qdict_haskey(dict, "driver") &&
+                             is_help_option(qdict_get_str(dict, "driver")))) {
+                    audio_help();
+                    exit(EXIT_SUCCESS);
+                }
                 if (!qdict_haskey(dict, "id")) {
                     qdict_put_str(dict, "id", "audiodev0");
                 }
-- 
2.37.2


