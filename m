Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0349336EA3F
	for <lists+qemu-devel@lfdr.de>; Thu, 29 Apr 2021 14:24:03 +0200 (CEST)
Received: from localhost ([::1]:59252 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lc5i6-0002wK-0s
	for lists+qemu-devel@lfdr.de; Thu, 29 Apr 2021 08:24:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39446)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chouhan.shreyansh2702@gmail.com>)
 id 1lc5Qi-0007xP-6Z
 for qemu-devel@nongnu.org; Thu, 29 Apr 2021 08:06:04 -0400
Received: from mail-pg1-x535.google.com ([2607:f8b0:4864:20::535]:43006)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <chouhan.shreyansh2702@gmail.com>)
 id 1lc5Qf-0000Ve-08
 for qemu-devel@nongnu.org; Thu, 29 Apr 2021 08:06:03 -0400
Received: by mail-pg1-x535.google.com with SMTP id m12so6239118pgr.9
 for <qemu-devel@nongnu.org>; Thu, 29 Apr 2021 05:05:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=MY3Eyo8BOW5/bnFZwe0nuVTvNJ6IL5ISEGXVEww/96g=;
 b=UkX45I7m8OQG0Zgpqkw3uTIbRIt6ppKIqGmJALAW9u8+KIBGWSoHwEimdXdMNsbjKi
 Mlscm+LUBMLKzaKdyMAfWLJ0pBDS3I2BS3JJ2JJJAYPdBrr1CC7AahYJVhDGkCIUpfBm
 IWblxuzr1ymJL9F73RIlZZFwAQ2YRzR1bD9yRucQh/0ad+EfnIGYDa9AZCqNokVvZjJC
 3HuRrNN/RqfSdYqbWpfpOuRrF38AxV4f/QLewi7ENpvBO26eP+aE8AV4t6BI3nt3UDVy
 VnvDnZsmPuDUQYSrtQTPy6MuWNX+RcaNh1HNi+vliuHrTv8+CQouv7XL87UeB9B/wxWx
 Uayw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=MY3Eyo8BOW5/bnFZwe0nuVTvNJ6IL5ISEGXVEww/96g=;
 b=VxRjQGDYb+OHbJrahZD5hnDuqP24jKZqxdfGkTrzmBZ+B14pJ2Qoo1FavQjsdOlbE6
 SJSTaYktUikDTjfu+PydhUzACIs2OckkdV/QYHXLnDYzcCVwtRkm4ovCTcKCl7fYpyp7
 YNB4Gg2jjhrtHGOfvWEnAH1dpGKn9rl/UXBfhqiRe0uSU79l6Nko7Ams3ZYrqVhI/nPV
 S3QhPK7o1bSI4eBEWhSHCMM/cSUMoYm7Nxh/l0UuX7BpP+F8xWwadPqAmulXV/DWIzFE
 gZYusAOX0P0Q6VO4p5R6dRSdWXLCTMl5neE0lZUkPLAIq4IXz+EPRVWtn8pk+hkrIWlh
 FtCw==
X-Gm-Message-State: AOAM532V3Ky63Ji6cXS1nS6V8k8uRYnUCM/FZLPpuLpVJLdxnuXvtGiz
 rpZLlOq2hAAPwYbAc/GYnlGEluVmRNrAcHexYwA=
X-Google-Smtp-Source: ABdhPJwENxyHlbxOUo9JHKW4njQ0KSi8ChNyUHjf6BDzPKYqnC45161W9PN+p4SUe1WHHXPpUF64fg==
X-Received: by 2002:a65:4341:: with SMTP id k1mr8594477pgq.178.1619697958283; 
 Thu, 29 Apr 2021 05:05:58 -0700 (PDT)
Received: from localhost.localdomain ([2405:201:6008:61b4:c0b1:be0f:608e:9a45])
 by smtp.gmail.com with ESMTPSA id p6sm713643pjg.35.2021.04.29.05.05.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 29 Apr 2021 05:05:58 -0700 (PDT)
From: Shreyansh Chouhan <chouhan.shreyansh2702@gmail.com>
To: kraxel@redhat.com,
	mst@redhat.com
Subject: [RFC PATCH 11/27] virtio-snd: Add macros for logging
Date: Thu, 29 Apr 2021 17:34:29 +0530
Message-Id: <20210429120445.694420-12-chouhan.shreyansh2702@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210429120445.694420-1-chouhan.shreyansh2702@gmail.com>
References: <20210429120445.694420-1-chouhan.shreyansh2702@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::535;
 envelope-from=chouhan.shreyansh2702@gmail.com; helo=mail-pg1-x535.google.com
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
 hw/audio/virtio-snd.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/hw/audio/virtio-snd.c b/hw/audio/virtio-snd.c
index caad157705..a93674ea72 100644
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
@@ -175,4 +179,8 @@ static void virtio_register_types(void)
     type_register_static(&virtio_snd_dev_info);
 }
 
+#undef virtio_snd_log
+#undef virtio_snd_warn
+#undef virtio_snd_err
+
 type_init(virtio_register_types)
-- 
2.25.1


