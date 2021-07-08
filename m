Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BFDF3C15F2
	for <lists+qemu-devel@lfdr.de>; Thu,  8 Jul 2021 17:28:22 +0200 (CEST)
Received: from localhost ([::1]:46590 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m1Vwr-000842-LK
	for lists+qemu-devel@lfdr.de; Thu, 08 Jul 2021 11:28:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53646)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1m1Vmw-0000Kk-80
 for qemu-devel@nongnu.org; Thu, 08 Jul 2021 11:18:06 -0400
Received: from mail-ej1-x635.google.com ([2a00:1450:4864:20::635]:34719)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1m1Vmt-0008Bk-6w
 for qemu-devel@nongnu.org; Thu, 08 Jul 2021 11:18:05 -0400
Received: by mail-ej1-x635.google.com with SMTP id hr1so10293692ejc.1
 for <qemu-devel@nongnu.org>; Thu, 08 Jul 2021 08:18:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=tnawKxczy3+M4NBMjlJytHV6KpxTEefhRxB8tlORao4=;
 b=K5Fn5iipEj/MDp9mQDjvWKzqDfTcQvYtx4oFB+0EdP4FJrDLdBIfVvrcHUVPyrv/Mx
 +TLdUwqvhpPU81tCwfvRF+9r3aoHZmDf5suo6mu5/EAxTVhuHnLYipY9vfY7diqL6yAz
 rQ6CS0DccNkEXQNNmFkhqKvufmDAxDeMLMb5ZsnqgTluxOm37DZHnTviSD0kFBSVnhp3
 rVsNlbPynBum2ZMZ8jF/Be65gtl52ZoLU+UO08YOBHUY9IvHGfp4xuyjxotD3E6xqJXP
 fRCwq3T9SEpaIoPsKbDLKemcWNcdBWBg3AwULUk83AhEaOqVpFoXw6RgPTmlqpsIRWNA
 M/qA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=tnawKxczy3+M4NBMjlJytHV6KpxTEefhRxB8tlORao4=;
 b=GYbFVXmNgBlJMOdVe4puLg1rjy7RZuLUea4gQaxxqo1C2Lu7GzN5wIVuj8juhObIJb
 1SGux0rY2q/roXWBbLoe9USq5pUHknmjuHhaULNIm5Imf0xpLqlCIjbxmJPl1WBtb7Lg
 4MknUjXWfMYc0U0YfOaJQbe1zqgtnblQ7nNvRi0T4qCEAYQB68AzDEw1OcePF9/xFzdM
 Z++6YEWQpFGNYQJfXn760RNOx3Z28FT7uyd6pyL4nGr2OYhNetVvkd4/cLWZ79WLCUym
 QS/mr2PJuVZZciJL9CxLmK57Ilse6LFEn7hTHoTaM34szgbqQRCtvJXlKzXVVfadpeUz
 B+RA==
X-Gm-Message-State: AOAM532wSmc/kcJfkprsdaYxncUHlwf7IBw4O9jutHUgfpRXyeR9BRTV
 FKOcPEpTax4HgMqofvTt2FqViArWTpM=
X-Google-Smtp-Source: ABdhPJzwC+mNENBIZm4dEtdHLI78Sxk8x4om+AIXxfHqnNV2KOUt5khF4xkOXrho7EMK3TVnP67meQ==
X-Received: by 2002:a17:906:3555:: with SMTP id
 s21mr12429393eja.394.1625757481149; 
 Thu, 08 Jul 2021 08:18:01 -0700 (PDT)
Received: from avogadro.lan ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id ak16sm1103694ejc.17.2021.07.08.08.18.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 08 Jul 2021 08:18:00 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 16/48] modules: add s390x module annotations
Date: Thu,  8 Jul 2021 17:17:16 +0200
Message-Id: <20210708151748.408754-17-pbonzini@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210708151748.408754-1-pbonzini@redhat.com>
References: <20210708151748.408754-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::635;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ej1-x635.google.com
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Gerd Hoffmann <kraxel@redhat.com>, "Jose R . Ziviani" <jziviani@suse.de>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Gerd Hoffmann <kraxel@redhat.com>

Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
Reviewed-by: Jose R. Ziviani <jziviani@suse.de>
Message-Id: <20210624103836.2382472-13-kraxel@redhat.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 hw/s390x/virtio-ccw-gpu.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/hw/s390x/virtio-ccw-gpu.c b/hw/s390x/virtio-ccw-gpu.c
index 75a9e4bb39..5868a2a070 100644
--- a/hw/s390x/virtio-ccw-gpu.c
+++ b/hw/s390x/virtio-ccw-gpu.c
@@ -59,6 +59,7 @@ static const TypeInfo virtio_ccw_gpu = {
     .instance_init = virtio_ccw_gpu_instance_init,
     .class_init    = virtio_ccw_gpu_class_init,
 };
+module_obj(TYPE_VIRTIO_GPU_CCW);
 
 static void virtio_ccw_gpu_register(void)
 {
@@ -68,3 +69,5 @@ static void virtio_ccw_gpu_register(void)
 }
 
 type_init(virtio_ccw_gpu_register)
+
+module_arch("s390x");
-- 
2.31.1



