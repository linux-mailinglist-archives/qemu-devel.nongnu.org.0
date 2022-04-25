Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 944B650DB96
	for <lists+qemu-devel@lfdr.de>; Mon, 25 Apr 2022 10:48:31 +0200 (CEST)
Received: from localhost ([::1]:44754 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1niuOU-00021b-NZ
	for lists+qemu-devel@lfdr.de; Mon, 25 Apr 2022 04:48:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40182)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mkletzan@redhat.com>)
 id 1niu07-0006V1-Hh
 for qemu-devel@nongnu.org; Mon, 25 Apr 2022 04:23:19 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:40872)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mkletzan@redhat.com>)
 id 1niu01-0002f8-R2
 for qemu-devel@nongnu.org; Mon, 25 Apr 2022 04:23:19 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1650874992;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=O++t1zATSSDRwugsXR7Q5IVUhnhLz0oadJiOZXGBQI8=;
 b=gxCq92NdSZCVw3Kj9Xxakla3B+v/m6rod9eq5YJsQCnloG3WylVNRefh8211wryzZMAVYz
 10ktplgcipIN9lHH9VjJNIuTNPEb5D45/JiwzKrkgMPeHpGmv4fYcdVTUbH9zE13t9ca4B
 pLEqq1yKHgo9gAB1FzBwLyirwgKGuno=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-262--F27XBhVMRWAv_Uy1Bpo_Q-1; Mon, 25 Apr 2022 04:22:05 -0400
X-MC-Unique: -F27XBhVMRWAv_Uy1Bpo_Q-1
Received: by mail-wr1-f70.google.com with SMTP id
 h61-20020adf9043000000b002079bbaa5d3so3076404wrh.16
 for <qemu-devel@nongnu.org>; Mon, 25 Apr 2022 01:22:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=O++t1zATSSDRwugsXR7Q5IVUhnhLz0oadJiOZXGBQI8=;
 b=PSQyiO3w3IApHtf0WI43vNnNw/ck+AShYIf6xdFbsRlKdBoxZyS95TPbwMzKsIUyp4
 QRHBCsvsPCZiP/+XFIhOgtci8Et+m6vwG7S5sCihtzC6TFXp7FmCJhdc4a27iX8j4QIF
 cvpLW4xlysCTmqzkpnXnqRMHDM9K6P7LGtCHkQAdhx5vBk6VOL/RuNqsUyLXVwfsWYZz
 4JyQNn2fpkuBQ09sbhSRqkeKrgCrAYTeKltZF/iH+vfknh2O4tFuj/CnVsoVEgi+LjwP
 8H7ehbpNp8yT0McN+PB9ZebQCj6zpn6e9IZGxM+keaMRUSp+qz1JIwBahGeUlKZsiv3J
 PT+Q==
X-Gm-Message-State: AOAM532bo1Y0HZuOAOc55gAqL+JrbCzh/koQjvZfbWaTBdZLpvoUC1z9
 87+DSQWi65rrsCEK4wd0N2f2Zk7x86tg3Z6NIDsUIb+DjcUBi7ZLCFaxZ15wOa3bBtxeIaXCFkj
 RJtkAxz2gZUlINf8=
X-Received: by 2002:a05:600c:34c4:b0:38e:b628:da95 with SMTP id
 d4-20020a05600c34c400b0038eb628da95mr15717853wmq.150.1650874924305; 
 Mon, 25 Apr 2022 01:22:04 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw6ppccZBgA9uskRcnwRbeAZSUgXdhxq0J4Qj9y/UaMbfOl3mTT83uTPV77spRbZYTUOCkj3g==
X-Received: by 2002:a05:600c:34c4:b0:38e:b628:da95 with SMTP id
 d4-20020a05600c34c400b0038eb628da95mr15717824wmq.150.1650874924044; 
 Mon, 25 Apr 2022 01:22:04 -0700 (PDT)
Received: from wheatley.localdomain (nat-pool-brq-t.redhat.com.
 [213.175.37.10]) by smtp.gmail.com with ESMTPSA id
 g5-20020adfd1e5000000b0020a97e7ba9fsm9606190wrd.92.2022.04.25.01.22.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 25 Apr 2022 01:22:02 -0700 (PDT)
Received: from wheatley.redhat.com (wheatley.k8r.cz [127.0.0.1])
 by wheatley.localdomain (Postfix) with ESMTP id 17F0967B1B58;
 Mon, 25 Apr 2022 10:22:02 +0200 (CEST)
From: Martin Kletzander <mkletzan@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 03/18] hw/audio: Simplify hda audio init
Date: Mon, 25 Apr 2022 10:21:46 +0200
Message-Id: <cd1df4ad2a6fae969c4a02a77955c4a8c0d430b6.1650874791.git.mkletzan@redhat.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <cover.1650874791.git.mkletzan@redhat.com>
References: <cover.1650874791.git.mkletzan@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mkletzan@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Stefan Hajnoczi <stefanha@redhat.com>, libvir-list@redhat.com,
 Christian Schoenebeck <qemu_oss@crudebyte.com>,
 Yanan Wang <wangyanan55@huawei.com>, Gerd Hoffmann <kraxel@redhat.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Qiuhao Li <Qiuhao.Li@outlook.com>,
 =?UTF-8?q?Herv=C3=A9=20Poussineau?= <hpoussin@reactos.org>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Alistair Francis <alistair@alistair23.me>, Alexander Bulekov <alxndr@bu.edu>,
 Bandan Das <bsd@redhat.com>, qemu-arm@nongnu.org,
 Jan Kiszka <jan.kiszka@web.de>, Pavel Dovgalyuk <pavel.dovgaluk@ispras.ru>,
 Eduardo Habkost <eduardo@habkost.net>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Darren Kenny <darren.kenny@oracle.com>, Thomas Huth <huth@tuxfamily.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 qemu-ppc@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

No return values are used anywhere, so switch the functions to be void
and add support for error reporting using errp for use in next patches.

Signed-off-by: Martin Kletzander <mkletzan@redhat.com>
---
 hw/audio/hda-codec.c | 32 ++++++++++++++++++--------------
 hw/audio/intel-hda.c |  4 +---
 hw/audio/intel-hda.h |  2 +-
 3 files changed, 20 insertions(+), 18 deletions(-)

diff --git a/hw/audio/hda-codec.c b/hw/audio/hda-codec.c
index feb8f9e2bb7a..e86a2adf31a0 100644
--- a/hw/audio/hda-codec.c
+++ b/hw/audio/hda-codec.c
@@ -676,7 +676,9 @@ static void hda_audio_stream(HDACodecDevice *hda, uint32_t stnr, bool running, b
     }
 }
 
-static int hda_audio_init(HDACodecDevice *hda, const struct desc_codec *desc)
+static void hda_audio_init(HDACodecDevice *hda,
+                           const struct desc_codec *desc,
+                           Error **errp)
 {
     HDAAudioState *a = HDA_AUDIO(hda);
     HDAAudioStream *st;
@@ -719,7 +721,6 @@ static int hda_audio_init(HDACodecDevice *hda, const struct desc_codec *desc)
             break;
         }
     }
-    return 0;
 }
 
 static void hda_audio_exit(HDACodecDevice *hda)
@@ -849,37 +850,40 @@ static Property hda_audio_properties[] = {
     DEFINE_PROP_END_OF_LIST(),
 };
 
-static int hda_audio_init_output(HDACodecDevice *hda)
+static void hda_audio_init_output(HDACodecDevice *hda, Error **errp)
 {
     HDAAudioState *a = HDA_AUDIO(hda);
+    const struct desc_codec *desc = &output_nomixemu;
 
     if (!a->mixer) {
-        return hda_audio_init(hda, &output_nomixemu);
-    } else {
-        return hda_audio_init(hda, &output_mixemu);
+        desc = &output_mixemu;
     }
+
+    hda_audio_init(hda, desc, errp);
 }
 
-static int hda_audio_init_duplex(HDACodecDevice *hda)
+static void hda_audio_init_duplex(HDACodecDevice *hda, Error **errp)
 {
     HDAAudioState *a = HDA_AUDIO(hda);
+    const struct desc_codec *desc = &duplex_nomixemu;
 
     if (!a->mixer) {
-        return hda_audio_init(hda, &duplex_nomixemu);
-    } else {
-        return hda_audio_init(hda, &duplex_mixemu);
+        desc = &duplex_mixemu;
     }
+
+    hda_audio_init(hda, desc, errp);
 }
 
-static int hda_audio_init_micro(HDACodecDevice *hda)
+static void hda_audio_init_micro(HDACodecDevice *hda, Error **errp)
 {
     HDAAudioState *a = HDA_AUDIO(hda);
+    const struct desc_codec *desc = &micro_nomixemu;
 
     if (!a->mixer) {
-        return hda_audio_init(hda, &micro_nomixemu);
-    } else {
-        return hda_audio_init(hda, &micro_mixemu);
+        desc = &micro_mixemu;
     }
+
+    hda_audio_init(hda, desc, errp);
 }
 
 static void hda_audio_base_class_init(ObjectClass *klass, void *data)
diff --git a/hw/audio/intel-hda.c b/hw/audio/intel-hda.c
index e77552363a4c..a17002812240 100644
--- a/hw/audio/intel-hda.c
+++ b/hw/audio/intel-hda.c
@@ -70,9 +70,7 @@ static void hda_codec_dev_realize(DeviceState *qdev, Error **errp)
         return;
     }
     bus->next_cad = dev->cad + 1;
-    if (cdc->init(dev) != 0) {
-        error_setg(errp, "HDA audio init failed");
-    }
+    cdc->init(dev, errp);
 }
 
 static void hda_codec_dev_unrealize(DeviceState *qdev)
diff --git a/hw/audio/intel-hda.h b/hw/audio/intel-hda.h
index f78c1833e341..8d710eee5d66 100644
--- a/hw/audio/intel-hda.h
+++ b/hw/audio/intel-hda.h
@@ -31,7 +31,7 @@ struct HDACodecBus {
 struct HDACodecDeviceClass {
     DeviceClass parent_class;
 
-    int (*init)(HDACodecDevice *dev);
+    void (*init)(HDACodecDevice *dev, Error **errp);
     void (*exit)(HDACodecDevice *dev);
     void (*command)(HDACodecDevice *dev, uint32_t nid, uint32_t data);
     void (*stream)(HDACodecDevice *dev, uint32_t stnr, bool running, bool output);
-- 
2.35.1


