Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 26BF74B306F
	for <lists+qemu-devel@lfdr.de>; Fri, 11 Feb 2022 23:29:00 +0100 (CET)
Received: from localhost ([::1]:35176 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nIePT-0007bS-7n
	for lists+qemu-devel@lfdr.de; Fri, 11 Feb 2022 17:28:59 -0500
Received: from eggs.gnu.org ([209.51.188.92]:42160)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chouhan.shreyansh2702@gmail.com>)
 id 1nIeCU-0006CF-KN
 for qemu-devel@nongnu.org; Fri, 11 Feb 2022 17:15:34 -0500
Received: from [2607:f8b0:4864:20::42b] (port=46889
 helo=mail-pf1-x42b.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <chouhan.shreyansh2702@gmail.com>)
 id 1nIeCS-0003Ct-Lf
 for qemu-devel@nongnu.org; Fri, 11 Feb 2022 17:15:34 -0500
Received: by mail-pf1-x42b.google.com with SMTP id i21so17124064pfd.13
 for <qemu-devel@nongnu.org>; Fri, 11 Feb 2022 14:15:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=/uWUv1eupKx5wHlbkeEWQZ9uHP33Krw7Pt1rcv//zR4=;
 b=hurCi/aKTMp0jOo7KnfpjEFPHjqDFlp2FL3JZFLotBLo3Hw5ehF63kJIQ9cn2BWjx7
 0RDjQa1IkVqRKnUS81MnMQEGVKy0YemNcnEcZwCnut+l3FKYrOevKszZGcVB6qddQZu1
 4bDC4xV6N9wcBWg1JCJ89kGY34A9VE0DMkkrY3kKi3vnm34+wO5cx43XFJiClwfNxE4i
 i+LeqMkPcfRljzZw6ymRSSgGACiCjf4+GurU8hMcCd7ULiWd9RYKNdHHaxy1EPuUnTny
 qJk2jxC8BK/eFwvKaIZ1VBdGUed3jtUxTmBOrlxNgusa++sCGX9zpQKm/njjQ0N9QjSH
 bqgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=/uWUv1eupKx5wHlbkeEWQZ9uHP33Krw7Pt1rcv//zR4=;
 b=WKy1xyUTGe8WOLAo3lvqXLosX+7WJpLobebQ7qO8FBmKhgPwcZtqGB6OCz4fEzfcU8
 m8tx6W8pzl5WOM1s7zaS47uGtsva6dETVmFs9qNmuawotCcjhJRmkfvDT6vtRz8FyKJN
 Z7ReMknU3aB9aKvh67nYR67q5fbmhxP1R2mBWnYttjw7FadePmgpwTxF/xba1Qzg0XyA
 eLHmvR2XR37OAYFmRL74xqKXNRo4r4s1oaGUG6W6eyFcR8GkrKxdtVBX1kmlzfy1eqfP
 8lHsrlJLSaPxxRMGjt1zCiaTZRATih8v/yk7irWT6zLqdH+F0bYfM5sx6zrXQtj6BRMK
 e4og==
X-Gm-Message-State: AOAM533ccDqR2K83P6UlHsWhaWRw03Hs/Y2JVIJIV8Ql++htTMT0w2Zo
 y2mp9BckUg9fdil60Y7DA5U=
X-Google-Smtp-Source: ABdhPJwlyrISXPJrJ5WxCDLKhNrThbmoZteNY4K0DRkwN7axIeIb3BNfDl7DxriokaBRl5JfluLG7Q==
X-Received: by 2002:a63:6c46:: with SMTP id h67mr2993053pgc.493.1644617731416; 
 Fri, 11 Feb 2022 14:15:31 -0800 (PST)
Received: from fedora.. ([2405:201:6008:6f15:d26f:133e:cd11:90dd])
 by smtp.googlemail.com with ESMTPSA id j23sm20623576pgb.75.2022.02.11.14.15.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 11 Feb 2022 14:15:30 -0800 (PST)
From: Shreyansh Chouhan <chouhan.shreyansh2702@gmail.com>
To: kraxel@redhat.com,
	mst@redhat.com,
	laurent@vivier.eu
Subject: [RFC PATCH 10/25] virtio-snd: Add macros for logging
Date: Sat, 12 Feb 2022 03:43:04 +0530
Message-Id: <20220211221319.193404-11-chouhan.shreyansh2702@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210429120445.694420-1-chouhan.shreyansh2702@gmail.com>
References: <20210429120445.694420-1-chouhan.shreyansh2702@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::42b
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::42b;
 envelope-from=chouhan.shreyansh2702@gmail.com; helo=mail-pf1-x42b.google.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, PDS_HP_HELO_NORDNS=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: Shreyansh Chouhan <chouhan.shreyansh2702@gmail.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Shreyansh Chouhan <chouhan.shreyansh2702@gmail.com>
---
 hw/audio/virtio-snd.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/hw/audio/virtio-snd.c b/hw/audio/virtio-snd.c
index b51f6c7523..40829fa329 100644
--- a/hw/audio/virtio-snd.c
+++ b/hw/audio/virtio-snd.c
@@ -39,6 +39,10 @@
 #define VIRTIO_SOUND_HDA_FN_NID_OUT 0
 #define VIRTIO_SOUND_HDA_FN_NID_IN 1
 
+#define virtio_snd_log(...) AUD_log("virtio sound info", __VA_ARGS__)
+#define virtio_snd_warn(...) AUD_log("virtio sound warn", __VA_ARGS__)
+#define virtio_snd_err(...) AUD_log("virtio sound err", __VA_ARGS__)
+
 static void virtio_snd_get_config(VirtIODevice *vdev, uint8_t *config)
 {
     VirtIOSound *s = VIRTIO_SOUND(vdev);
@@ -167,4 +171,8 @@ static void virtio_register_types(void)
     type_register_static(&virtio_snd_dev_info);
 }
 
+#undef virtio_snd_log
+#undef virtio_snd_warn
+#undef virtio_snd_err
+
 type_init(virtio_register_types)
-- 
2.31.1


