Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E9A1528AD0
	for <lists+qemu-devel@lfdr.de>; Mon, 16 May 2022 18:46:59 +0200 (CEST)
Received: from localhost ([::1]:59742 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nqds2-0006zv-8R
	for lists+qemu-devel@lfdr.de; Mon, 16 May 2022 12:46:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40484)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1nqd5U-0002vm-Nd
 for qemu-devel@nongnu.org; Mon, 16 May 2022 11:56:50 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:55206)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1nqd5S-0003QV-C2
 for qemu-devel@nongnu.org; Mon, 16 May 2022 11:56:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1652716605;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=m+AfIsdFVD+/iBurPs3xn/ZLPSLYXq3YYCbUnmehnD0=;
 b=GokDfFoj1xILJ8ft3Nyt5n048BKGWGoRzZKt4Z2g+TlG7E9muNMFqLVHBmkCfqHcQRb+9i
 Nt4ZAupK5+P0icLqjEIB+GvJE/v2op3i25YM18raJvw+0SFhLQYtjH8YzfJsUApjS9GRmd
 ZIHaETEKX/R2urKwMea+ESInnfJVT4Y=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-591-35CYaIr8Ofq-aebLR03IQw-1; Mon, 16 May 2022 11:56:44 -0400
X-MC-Unique: 35CYaIr8Ofq-aebLR03IQw-1
Received: by mail-ej1-f70.google.com with SMTP id
 bk16-20020a170906b0d000b006fe34a2e598so1077247ejb.0
 for <qemu-devel@nongnu.org>; Mon, 16 May 2022 08:56:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=m+AfIsdFVD+/iBurPs3xn/ZLPSLYXq3YYCbUnmehnD0=;
 b=fqnCJ+z5yi2I2Ye8x7gCs/a1i3za+7MybN1KWrFZU723UlMee9x6RxRj0n3DN7rkPp
 HlqeAoHJ/aySBcTXF3Wey2muMh0mueFDdi+YpeZtpJpf6EKKG+lSbtXWs3knEHUqek4u
 pEHXvFxIP1XVulYLvcXpbCcxxgAKOVNvZotmW30VBvgQlGxhQKitzW9L9x1pXxH4bw/y
 0/NLSQ+rHnCoQ50J055WgP/dQswKBDwdEFQ8d3EmE1lPR8i/2TnXpcZcymGn5Vab6IMs
 f6upKHoGpe5VrcCzSrMNk/TLcZgG/t++mmHg+E/+ajXn7/j8P0HqJVWBITKcyzKv0y+B
 qDcQ==
X-Gm-Message-State: AOAM530eaK8aK3an94mU47yp4W/HKC0NA/yl9R3aFAWQVioio88G2xB7
 L3TcWNa1kmeTnIO+s0/+VsC40SRyss/UkJ8TMlBh+/tTlLXB093i9Z+Vb9C6ZGdDfklyQKu+hZ5
 OKQaqM7OOhPlZWF21SRhNHvkJwIiHJiyNs5+JUk58nuV24IopOd1qUE1T+BijDL+JQ1k=
X-Received: by 2002:a17:906:cb90:b0:6f4:d91b:1025 with SMTP id
 mf16-20020a170906cb9000b006f4d91b1025mr16204390ejb.177.1652716602585; 
 Mon, 16 May 2022 08:56:42 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxlHOvSd5555V2EQlP7pe0Zzeoj9lx78yNy61+W7AFawwvufF1cRBTJbdtU2eY9qmweFVB06A==
X-Received: by 2002:a17:906:cb90:b0:6f4:d91b:1025 with SMTP id
 mf16-20020a170906cb9000b006f4d91b1025mr16204367ejb.177.1652716602134; 
 Mon, 16 May 2022 08:56:42 -0700 (PDT)
Received: from [192.168.10.118] ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id
 ze15-20020a170906ef8f00b006f3ef214da5sm62168ejb.11.2022.05.16.08.56.41
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 May 2022 08:56:41 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 20/23] introduce -audio as a replacement for -soundhw
Date: Mon, 16 May 2022 17:56:00 +0200
Message-Id: <20220516155603.1234712-21-pbonzini@redhat.com>
X-Mailer: git-send-email 2.36.0
In-Reply-To: <20220516155603.1234712-1-pbonzini@redhat.com>
References: <20220516155603.1234712-1-pbonzini@redhat.com>
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

-audio is used like "-audio pa,model=sb16".  It is almost as simple as
-soundhw, but it reuses the -audiodev parsing machinery and attaches an
audiodev to the newly-created device.  The main 'feature' is that
it knows about adding the codec device for model=intel-hda, and adding
the audiodev to the codec device.

In the future, it could be extended to support default models or
builtin devices, just like -nic, or even a default backend.  For now,
keep it simple.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 audio/audio.c                   |  8 +++++-
 audio/audio.h                   |  1 +
 docs/about/deprecated.rst       |  9 ------
 docs/about/removed-features.rst |  7 +++++
 hw/audio/intel-hda.c            |  5 ++--
 hw/audio/soundhw.c              | 12 +++++---
 include/hw/audio/soundhw.h      |  4 +--
 qemu-options.hx                 | 51 ++++++++++++++++-----------------
 softmmu/vl.c                    | 28 ++++++++++++++++--
 9 files changed, 76 insertions(+), 49 deletions(-)

diff --git a/audio/audio.c b/audio/audio.c
index 9e91a5a4f2..a02f3ce5c6 100644
--- a/audio/audio.c
+++ b/audio/audio.c
@@ -2099,13 +2099,19 @@ static void audio_validate_opts(Audiodev *dev, Error **errp)
 
 void audio_parse_option(const char *opt)
 {
-    AudiodevListEntry *e;
     Audiodev *dev = NULL;
 
     Visitor *v = qobject_input_visitor_new_str(opt, "driver", &error_fatal);
     visit_type_Audiodev(v, NULL, &dev, &error_fatal);
     visit_free(v);
 
+    audio_define(dev);
+}
+
+void audio_define(Audiodev *dev)
+{
+    AudiodevListEntry *e;
+
     audio_validate_opts(dev, &error_fatal);
 
     e = g_new0(AudiodevListEntry, 1);
diff --git a/audio/audio.h b/audio/audio.h
index 3d5ecdecd5..b5e17cd218 100644
--- a/audio/audio.h
+++ b/audio/audio.h
@@ -168,6 +168,7 @@ void audio_sample_to_uint64(const void *samples, int pos,
 void audio_sample_from_uint64(void *samples, int pos,
                             uint64_t left, uint64_t right);
 
+void audio_define(Audiodev *audio);
 void audio_parse_option(const char *opt);
 void audio_init_audiodevs(void);
 void audio_legacy_help(void);
diff --git a/docs/about/deprecated.rst b/docs/about/deprecated.rst
index 1f961b9e6e..a92ae0f162 100644
--- a/docs/about/deprecated.rst
+++ b/docs/about/deprecated.rst
@@ -39,15 +39,6 @@ should specify an ``audiodev=`` property.  Additionally, when using
 vnc, you should specify an ``audiodev=`` property if you plan to
 transmit audio through the VNC protocol.
 
-Creating sound card devices using ``-soundhw`` (since 5.1)
-''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
-
-Sound card devices should be created using ``-device`` instead.  The
-names are the same for most devices.  The exceptions are ``hda`` which
-needs two devices (``-device intel-hda -device hda-duplex``) and
-``pcspk`` which can be activated using ``-machine
-pcspk-audiodev=<name>``.
-
 ``-chardev`` backend aliases ``tty`` and ``parport`` (since 6.0)
 ''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
 
diff --git a/docs/about/removed-features.rst b/docs/about/removed-features.rst
index 69498efd51..eb76974347 100644
--- a/docs/about/removed-features.rst
+++ b/docs/about/removed-features.rst
@@ -654,6 +654,13 @@ tripped up the CI testing and was suspected to be quite broken. For that
 reason the maintainers strongly suspected no one actually used it.
 
 
+Creating sound card devices using ``-soundhw`` (removed in 7.1)
+'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
+
+Sound card devices should be created using ``-device`` or ``-audio``.
+The exception is ``pcspk`` which can be activated using ``-machine
+pcspk-audiodev=<name>``.
+
 TCG introspection features
 --------------------------
 
diff --git a/hw/audio/intel-hda.c b/hw/audio/intel-hda.c
index bc77e3d8c9..f38117057b 100644
--- a/hw/audio/intel-hda.c
+++ b/hw/audio/intel-hda.c
@@ -1311,17 +1311,16 @@ static const TypeInfo hda_codec_device_type_info = {
  * create intel hda controller with codec attached to it,
  * so '-soundhw hda' works.
  */
-static int intel_hda_and_codec_init(PCIBus *bus)
+static int intel_hda_and_codec_init(PCIBus *bus, const char *audiodev)
 {
     DeviceState *controller;
     BusState *hdabus;
     DeviceState *codec;
 
-    warn_report("'-soundhw hda' is deprecated, "
-                "please use '-device intel-hda -device hda-duplex' instead");
     controller = DEVICE(pci_create_simple(bus, -1, "intel-hda"));
     hdabus = QLIST_FIRST(&controller->child_bus);
     codec = qdev_new("hda-duplex");
+    qdev_prop_set_string(codec, "audiodev", audiodev);
     qdev_realize_and_unref(codec, hdabus, &error_fatal);
     return 0;
 }
diff --git a/hw/audio/soundhw.c b/hw/audio/soundhw.c
index ebbd0958ba..94d9463e42 100644
--- a/hw/audio/soundhw.c
+++ b/hw/audio/soundhw.c
@@ -27,6 +27,7 @@
 #include "qemu/error-report.h"
 #include "qapi/error.h"
 #include "qom/object.h"
+#include "hw/qdev-properties.h"
 #include "hw/isa/isa.h"
 #include "hw/pci/pci.h"
 #include "hw/audio/soundhw.h"
@@ -36,14 +37,14 @@ struct soundhw {
     const char *descr;
     const char *typename;
     int isa;
-    int (*init_pci) (PCIBus *bus);
+    int (*init_pci) (PCIBus *bus, const char *audiodev);
 };
 
 static struct soundhw soundhw[9];
 static int soundhw_count;
 
 void pci_register_soundhw(const char *name, const char *descr,
-                          int (*init_pci)(PCIBus *bus))
+                          int (*init_pci)(PCIBus *bus, const char *audiodev))
 {
     assert(soundhw_count < ARRAY_SIZE(soundhw) - 1);
     soundhw[soundhw_count].name = name;
@@ -80,8 +81,9 @@ void show_valid_soundhw(void)
 }
 
 static struct soundhw *selected = NULL;
+static const char *audiodev_id;
 
-void select_soundhw(const char *optarg)
+void select_soundhw(const char *optarg, const char *audiodev)
 {
     struct soundhw *c;
 
@@ -92,6 +94,7 @@ void select_soundhw(const char *optarg)
     for (c = soundhw; c->name; ++c) {
         if (g_str_equal(c->name, optarg)) {
             selected = c;
+            audiodev_id = audiodev;
             break;
         }
     }
@@ -129,10 +132,11 @@ void soundhw_init(void)
 
     if (c->typename) {
         DeviceState *dev = qdev_new(c->typename);
+        qdev_prop_set_string(dev, "audiodev", audiodev_id);
         qdev_realize_and_unref(dev, bus, &error_fatal);
     } else {
         assert(!c->isa);
-        c->init_pci(pci_bus);
+        c->init_pci(pci_bus, audiodev_id);
     }
 }
 
diff --git a/include/hw/audio/soundhw.h b/include/hw/audio/soundhw.h
index dec5c0cdca..270717a06a 100644
--- a/include/hw/audio/soundhw.h
+++ b/include/hw/audio/soundhw.h
@@ -2,12 +2,12 @@
 #define HW_SOUNDHW_H
 
 void pci_register_soundhw(const char *name, const char *descr,
-                          int (*init_pci)(PCIBus *bus));
+                          int (*init_pci)(PCIBus *bus, const char *audiodev));
 void deprecated_register_soundhw(const char *name, const char *descr,
                                  int isa, const char *typename);
 
 void soundhw_init(void);
 void show_valid_soundhw(void);
-void select_soundhw(const char *optarg);
+void select_soundhw(const char *optarg, const char *audiodev);
 
 #endif
diff --git a/qemu-options.hx b/qemu-options.hx
index 796229c433..60d2d728d6 100644
--- a/qemu-options.hx
+++ b/qemu-options.hx
@@ -661,6 +661,30 @@ SRST
     (deprecated) environment variables.
 ERST
 
+DEF("audio", HAS_ARG, QEMU_OPTION_audio,
+    "-audio [driver=]driver,model=value[,prop[=value][,...]]\n"
+    "                specifies the audio backend and device to use;\n"
+    "                apart from 'model', options are the same as for -audiodev.\n"
+    "                use '-audio model=help' to show possible devices.\n",
+    QEMU_ARCH_ALL)
+SRST
+``-audio [driver=]driver,model=value[,prop[=value][,...]]``
+    This option is a shortcut for configuring both the guest audio
+    hardware and the host audio backend in one go.
+    The host backend options are the same as with the corresponding
+    ``-audiodev`` options below. The guest hardware model can be set with
+    ``model=modelname``. Use ``model=help`` to list the available device
+    types.
+
+    The following two example do exactly the same, to show how ``-audio``
+    can be used to shorten the command line length:
+
+    .. parsed-literal::
+
+        |qemu_system| -audiodev pa,id=pa -device sb16,audiodev=pa
+        |qemu_system| -audio pa,model=sb16
+ERST
+
 DEF("audiodev", HAS_ARG, QEMU_OPTION_audiodev,
     "-audiodev [driver=]driver,id=id[,prop[=value][,...]]\n"
     "                specifies the audio backend to use\n"
@@ -892,33 +916,6 @@ SRST
         ``qemu.wav``.
 ERST
 
-DEF("soundhw", HAS_ARG, QEMU_OPTION_soundhw,
-    "-soundhw c1,... enable audio support\n"
-    "                and only specified sound cards (comma separated list)\n"
-    "                use '-soundhw help' to get the list of supported cards\n"
-    "                use '-soundhw all' to enable all of them\n", QEMU_ARCH_ALL)
-SRST
-``-soundhw card1[,card2,...] or -soundhw all``
-    Enable audio and selected sound hardware. Use 'help' to print all
-    available sound hardware. For example:
-
-    .. parsed-literal::
-
-        |qemu_system_x86| -soundhw sb16,adlib disk.img
-        |qemu_system_x86| -soundhw es1370 disk.img
-        |qemu_system_x86| -soundhw ac97 disk.img
-        |qemu_system_x86| -soundhw hda disk.img
-        |qemu_system_x86| -soundhw all disk.img
-        |qemu_system_x86| -soundhw help
-
-    Note that Linux's i810\_audio OSS kernel (for AC97) module might
-    require manually specifying clocking.
-
-    ::
-
-        modprobe i810_audio clocking=48000
-ERST
-
 DEF("device", HAS_ARG, QEMU_OPTION_device,
     "-device driver[,prop[=value][,...]]\n"
     "                add device (based on driver)\n"
diff --git a/softmmu/vl.c b/softmmu/vl.c
index 0363cbd9b4..219b23a573 100644
--- a/softmmu/vl.c
+++ b/softmmu/vl.c
@@ -116,6 +116,8 @@
 #include "crypto/init.h"
 #include "sysemu/replay.h"
 #include "qapi/qapi-events-run-state.h"
+#include "qapi/qapi-types-audio.h"
+#include "qapi/qapi-visit-audio.h"
 #include "qapi/qapi-visit-block-core.h"
 #include "qapi/qapi-visit-compat.h"
 #include "qapi/qapi-visit-ui.h"
@@ -2930,13 +2932,33 @@ void qemu_init(int argc, char **argv, char **envp)
             case QEMU_OPTION_audiodev:
                 audio_parse_option(optarg);
                 break;
-            case QEMU_OPTION_soundhw:
-                if (is_help_option(optarg)) {
+            case QEMU_OPTION_audio: {
+                QDict *dict = keyval_parse(optarg, "driver", NULL, &error_fatal);
+                char *model;
+                Audiodev *dev = NULL;
+                Visitor *v;
+
+                if (!qdict_haskey(dict, "id")) {
+                    qdict_put_str(dict, "id", "audiodev0");
+                }
+                if (!qdict_haskey(dict, "model")) {
+                    error_setg(&error_fatal, "Parameter 'model' is missing");
+                }
+                model = g_strdup(qdict_get_str(dict, "model"));
+                qdict_del(dict, "model");
+                if (is_help_option(model)) {
                     show_valid_soundhw();
                     exit(0);
                 }
-                select_soundhw (optarg);
+                v = qobject_input_visitor_new_keyval(QOBJECT(dict));
+                qobject_unref(dict);
+                visit_type_Audiodev(v, NULL, &dev, &error_fatal);
+                visit_free(v);
+                audio_define(dev);
+                select_soundhw(model, dev->id);
+                g_free(model);
                 break;
+            }
             case QEMU_OPTION_h:
                 help(0);
                 break;
-- 
2.36.0


