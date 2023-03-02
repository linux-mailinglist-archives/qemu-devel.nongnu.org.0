Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DD00B6A7C84
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Mar 2023 09:25:43 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pXeFa-00027w-7W; Thu, 02 Mar 2023 03:25:22 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1pXeF7-000274-9I
 for qemu-devel@nongnu.org; Thu, 02 Mar 2023 03:24:49 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1pXeF4-0001xR-Rv
 for qemu-devel@nongnu.org; Thu, 02 Mar 2023 03:24:48 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1677745486;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=oRF1a+d0ww1PZsoSqWCORzl39PgabxYGdz1wRV2D1qo=;
 b=jNMyqB+R/Xb5hhPmz8ll1X4XZali7iw2WbuyCwY7z1cHUH70OywTQrTUQwcucjTAwruJMs
 5VXCsVBew02G6GEKyV6ZYOP6pflY1RtmK/aS2pqdVcQcVRVXfGpN1OcytdWR+rMQPfznF/
 V/e0gVvBS5lQ7ww/L42qh+3N0tEgHtU=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-582-G_w4AkFNPWW01zXfPwRwIw-1; Thu, 02 Mar 2023 03:24:45 -0500
X-MC-Unique: G_w4AkFNPWW01zXfPwRwIw-1
Received: by mail-wm1-f70.google.com with SMTP id
 bi21-20020a05600c3d9500b003e836e354e0so742306wmb.5
 for <qemu-devel@nongnu.org>; Thu, 02 Mar 2023 00:24:45 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1677745483;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=oRF1a+d0ww1PZsoSqWCORzl39PgabxYGdz1wRV2D1qo=;
 b=axbKIZE9hySFU55T1QqK9lEeK0KbWkIk8cEXoSMTFBcrXJJw1P2wrKXRlzaR7+npgg
 S1BBJyyXeEf2CFEFRaEaL3xHffzjZEx9DcCZDUaci8kmoFAHdk7+WRyUu/jFFuf0oYuB
 D9aJYjtoQNz4SED3hN8Guspc5bkQQyoYzu4f7pKeYciT4YEiMGacRaYJVG7aIkNiUAJM
 YOGqa92ZYe0XlirbGCFeveJqSyjctLh5c+rfa6I+8tscA10QNLjlu60IiGT0TlLexPLW
 vt+eoq/COAYwf6TEJtuZRSdKgBVumGjj/ItkcilMyg/uqY1Fp4SfPgk3YOiA/j338Rnb
 doMw==
X-Gm-Message-State: AO0yUKWbVJF89yRynspH7IpQ+ABBJqYqBuAqKSHZ4n4tuc6KhveuI5hQ
 8ZoDSjLwht7igh/VzNFC58bhw9yoVx4Y2lHkD5C2H/uuqG+QkVqcWcsKh6fW3NyRwISOo5ehPZr
 uPZ1yVpwLf9q/D0MPf83beIbqT+xm+LOtbScqDvPcBKQoWimWSPdE5OpOQaGP1l9PbQ==
X-Received: by 2002:adf:f304:0:b0:2ca:f680:cbf4 with SMTP id
 i4-20020adff304000000b002caf680cbf4mr7322608wro.39.1677745483739; 
 Thu, 02 Mar 2023 00:24:43 -0800 (PST)
X-Google-Smtp-Source: AK7set+qc1/sKdOafIP+7xGDz6vS4Sfj8CWTcqd1rIp4kN8hDIM+x+Hp0RZca51p+aaXDKRtyZVOjg==
X-Received: by 2002:adf:f304:0:b0:2ca:f680:cbf4 with SMTP id
 i4-20020adff304000000b002caf680cbf4mr7322585wro.39.1677745483479; 
 Thu, 02 Mar 2023 00:24:43 -0800 (PST)
Received: from redhat.com ([2.52.141.194]) by smtp.gmail.com with ESMTPSA id
 n2-20020a1c7202000000b003e21f20b646sm2092526wmc.21.2023.03.02.00.24.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Mar 2023 00:24:43 -0800 (PST)
Date: Thu, 2 Mar 2023 03:24:40 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Nathan Chancellor <nathan@kernel.org>, Dov Murik <dovmurik@linux.ibm.com>,
 Daniel P =?utf-8?B?LiBCZXJyYW5nw6k=?= <berrange@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
Subject: [PULL 04/53] Revert "x86: re-initialize RNG seed when selecting
 kernel"
Message-ID: <20230302082343.560446-5-mst@redhat.com>
References: <20230302082343.560446-1-mst@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230302082343.560446-1-mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

This reverts commit cc63374a5a7c240b7d3be734ef589dabbefc7527.

Fixes: cc63374a5a ("x86: re-initialize RNG seed when selecting kernel")
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
Tested-by: Nathan Chancellor <nathan@kernel.org>
Tested-by: Dov Murik <dovmurik@linux.ibm.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>
---
 hw/i386/x86.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/hw/i386/x86.c b/hw/i386/x86.c
index 7a128a2899..ec9c343cdb 100644
--- a/hw/i386/x86.c
+++ b/hw/i386/x86.c
@@ -1117,14 +1117,11 @@ void x86_load_linux(X86MachineState *x86ms,
         setup_data->len = cpu_to_le32(RNG_SEED_LENGTH);
         qemu_guest_getrandom_nofail(setup_data->data, RNG_SEED_LENGTH);
         qemu_register_reset(reset_rng_seed, setup_data);
-        fw_cfg_add_bytes_callback(fw_cfg, FW_CFG_KERNEL_DATA, reset_rng_seed, NULL,
-                                  setup_data, kernel, kernel_size, true);
-    } else {
-        fw_cfg_add_bytes(fw_cfg, FW_CFG_KERNEL_DATA, kernel, kernel_size);
     }
 
     fw_cfg_add_i32(fw_cfg, FW_CFG_KERNEL_ADDR, prot_addr);
     fw_cfg_add_i32(fw_cfg, FW_CFG_KERNEL_SIZE, kernel_size);
+    fw_cfg_add_bytes(fw_cfg, FW_CFG_KERNEL_DATA, kernel, kernel_size);
     sev_load_ctx.kernel_data = (char *)kernel;
     sev_load_ctx.kernel_size = kernel_size;
 
-- 
MST


