Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C416936EA87
	for <lists+qemu-devel@lfdr.de>; Thu, 29 Apr 2021 14:32:14 +0200 (CEST)
Received: from localhost ([::1]:48538 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lc5px-0001rf-OP
	for lists+qemu-devel@lfdr.de; Thu, 29 Apr 2021 08:32:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39718)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chouhan.shreyansh2702@gmail.com>)
 id 1lc5RD-0008Ju-HS
 for qemu-devel@nongnu.org; Thu, 29 Apr 2021 08:06:35 -0400
Received: from mail-pj1-x1035.google.com ([2607:f8b0:4864:20::1035]:41543)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <chouhan.shreyansh2702@gmail.com>)
 id 1lc5RA-0000le-Lo
 for qemu-devel@nongnu.org; Thu, 29 Apr 2021 08:06:35 -0400
Received: by mail-pj1-x1035.google.com with SMTP id
 y22-20020a17090a8b16b0290150ae1a6d2bso10850850pjn.0
 for <qemu-devel@nongnu.org>; Thu, 29 Apr 2021 05:06:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=p0H1z52TFHM4PStrPMY1R733kfAT2nGnpNFrALeyFAs=;
 b=XDP7OmPH5DWMmybEy9zBeVZH3y3elzM6Qo8wRadeBxoT1LI8OGXuNZP3FA20QMY4xr
 I/QH6zoIa/4LA6JKGBUkjeyRf7DUSrXOnVDCN6gzJTj6L4mW+Zq8dIjzWKVTI733xxm3
 Fa5vKjN6td2cwV8u5prRmsB1InzrItjLXm14mGWNDcKV4uzEly0BCl7d3twDcNq5CtFw
 WtLTUNvSh/krBHsT6uidLwtjsjn7+AJ6LgnNUHJcbQfmDmp+dAsMPw5bTxbKwbshGBBc
 jn68pq7SVVc8I2vJsvsxVdIeOpQqJSPj9d5Q/j1pAiOZKwjkP+/KdBvl3svQh69aGRby
 X/Cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=p0H1z52TFHM4PStrPMY1R733kfAT2nGnpNFrALeyFAs=;
 b=kjzgjMgmYXJ8KCImGmf5Grl8MuxVkQ+i+Sac7lm125qbLjaqA5PeIUTZILfgoUFlWp
 VBBCZ+Ea1+9ANqZPOYrn7qUSvaa52iqpor2mzfE6dcjLk+Srvz36gkImskR+aE7/v7YJ
 gpjSvrvCMwoMyoZxTC/RfZiaGGiUR7PwixEz9mvgptNlnk0wY+RCK9nsQ4GRal8fIAcQ
 rfC85dJCpTmNQPryx9lmlUIE9J+45YKpc8S2rd7g3TF4mo03+8jmQM4KJy7fMwKKKvOR
 u+2d+yVV7KvAofBkQ4sN1sna9eKCGY/4/qkTj9KScX0J1Yf/f8DnKhBaJTAomDpEJHow
 MlyA==
X-Gm-Message-State: AOAM530ptHBVkb8MFfarzD9dzRDd5Wei2bxVfT9Vqfdbvzs9XrlDWuY9
 I2eZuMhio+rMzz98BYv4tBc=
X-Google-Smtp-Source: ABdhPJxRS+OwYTBYnwYcT+bY2Y8HklcH5F6I79mHhVHm1CEivPZYS7z07HLA6cnW9wOSzUDKh2w1sw==
X-Received: by 2002:a17:902:d50c:b029:ed:1bda:a029 with SMTP id
 b12-20020a170902d50cb02900ed1bdaa029mr24575715plg.8.1619697991258; 
 Thu, 29 Apr 2021 05:06:31 -0700 (PDT)
Received: from localhost.localdomain ([2405:201:6008:61b4:c0b1:be0f:608e:9a45])
 by smtp.gmail.com with ESMTPSA id p6sm713643pjg.35.2021.04.29.05.06.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 29 Apr 2021 05:06:31 -0700 (PDT)
From: Shreyansh Chouhan <chouhan.shreyansh2702@gmail.com>
To: kraxel@redhat.com,
	mst@redhat.com
Subject: [RFC PATCH 24/27] virtio-snd: Add code to device unrealize function
Date: Thu, 29 Apr 2021 17:34:42 +0530
Message-Id: <20210429120445.694420-25-chouhan.shreyansh2702@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210429120445.694420-1-chouhan.shreyansh2702@gmail.com>
References: <20210429120445.694420-1-chouhan.shreyansh2702@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1035;
 envelope-from=chouhan.shreyansh2702@gmail.com; helo=mail-pj1-x1035.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Shreyansh Chouhan <chouhan.shreyansh2702@gmail.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Shreyansh Chouhan <chouhan.shreyansh2702@gmail.com>
---
 hw/audio/virtio-snd.c | 26 ++++++++++++++++++++++++++
 1 file changed, 26 insertions(+)

diff --git a/hw/audio/virtio-snd.c b/hw/audio/virtio-snd.c
index 5f12375d95..e2e47e9467 100644
--- a/hw/audio/virtio-snd.c
+++ b/hw/audio/virtio-snd.c
@@ -1006,8 +1006,34 @@ static void virtio_snd_device_realize(DeviceState *dev, Error **errp)
     }
 }
 
+/*
+ * Frees the resources allocated to the device and then frees the device
+ * itself.
+ *
+ * @dev: VirtIOSound card device
+ */
 static void virtio_snd_device_unrealize(DeviceState *dev)
 {
+    VirtIOSound *s = VIRTIO_SOUND(dev);
+
+    for (int i = 0; i < s->snd_conf.streams; i++) {
+        virtio_snd_pcm_release_impl(s, i);
+        g_free(s->pcm_params[i]);
+        s->pcm_params[i] = NULL;
+    }
+    g_free(s->streams);
+    s->streams = NULL;
+    g_free(s->pcm_params);
+    s->pcm_params = NULL;
+
+    for (int i = 0; i < s->snd_conf.jacks; i++) {
+        g_free(s->jacks[i]);
+        s->jacks[i] = NULL;
+    }
+    g_free(s->jacks);
+    s->jacks = NULL;
+
+    virtio_delete_queue(s->ctrl_vq);
 }
 
 static void virtio_snd_reset(VirtIODevice *vdev)
-- 
2.25.1


