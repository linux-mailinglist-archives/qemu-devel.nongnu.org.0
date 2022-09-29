Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A26175EFCCD
	for <lists+qemu-devel@lfdr.de>; Thu, 29 Sep 2022 20:15:17 +0200 (CEST)
Received: from localhost ([::1]:34950 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ody44-0003Sy-Pj
	for lists+qemu-devel@lfdr.de; Thu, 29 Sep 2022 14:15:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41322)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1odwRB-0003vM-IW
 for qemu-devel@nongnu.org; Thu, 29 Sep 2022 12:31:01 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:30830)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1odwR9-00038l-VP
 for qemu-devel@nongnu.org; Thu, 29 Sep 2022 12:31:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1664469059;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Blv0482qqGw+iiQWg7x334l3dt4qxtymalbZQfpg5Dg=;
 b=PYICEBp5RJKZ01nfd/TfOoSzGhSIlftwCrjrWvMDhUTUYMBqVi9xn7GsoNYeh+xaeoRHy4
 OEaUuePkA2W5iMdn4qRJm9P58FOgfCxF+Pompt0q7ehnr6URY7Y1P+IuaSFberO3bo62pe
 wWFpAoKYrvYBmqJ9If58FVCDVmp5P0E=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-574-zz-30kF-NT6-9umGUqOpUA-1; Thu, 29 Sep 2022 12:30:57 -0400
X-MC-Unique: zz-30kF-NT6-9umGUqOpUA-1
Received: by mail-ej1-f70.google.com with SMTP id
 he8-20020a1709073d8800b007838dd153f4so955691ejc.12
 for <qemu-devel@nongnu.org>; Thu, 29 Sep 2022 09:30:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=Blv0482qqGw+iiQWg7x334l3dt4qxtymalbZQfpg5Dg=;
 b=c4YhbUPrkYEF9GUG2y9jQCtS0I3goewQGDq9ae4svPcc+ClRfzGhSRlHAOJYzsseiI
 RuGAi2w2gggIcX9xin3guSGyETeRUoqSqZA9h4hMjnCEfsuyw3whAlLeRv6+8zGGW9z2
 YL2JsMdQPBkVRrND7iYVzIgFmKm6xNy2PMrTnPwkJmOh9MvDgsewSreGkLLVivEsWJxl
 zJZJYPI+8KyCpt+G5ycgZZnqrEN77HIqd3sgGXyZf0CawqBJhovSHdza7nvZgNsZ0wCA
 YA7WzCZ3KNxRlD3MjsML2k1Rvl3w4oV7yTIjA1c8n8TbMb9kGyjvrLffJyDSLhVi5wDt
 vKSQ==
X-Gm-Message-State: ACrzQf2GlDZ2TUuuBfxXDrvVAfVSmZ3zExroxUAsBl1P2DepCQC57DT+
 dSNewrvXS9Cyq4CEGYi9xU9aWR5iiG66VEWcub8OZF9k3oaPbVwu0VeEa2XmF/Gm9Z12k9rv9k5
 9XYo8Yr1joAcp/a4rTs+J9iesbRWWVRVkxj1XpSUzLw/fR6/C0zKmA10wDlS0rVZD97o=
X-Received: by 2002:a17:907:7284:b0:783:ca4d:1c49 with SMTP id
 dt4-20020a170907728400b00783ca4d1c49mr3388763ejc.618.1664469056165; 
 Thu, 29 Sep 2022 09:30:56 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM5bTVFSZMEnfDMwHT5hA4kF5AQdBwS/GhB35bFllOVjE8Hixvz4HFlQCAVOG6HtRbGYlEFadw==
X-Received: by 2002:a17:907:7284:b0:783:ca4d:1c49 with SMTP id
 dt4-20020a170907728400b00783ca4d1c49mr3388742ejc.618.1664469055893; 
 Thu, 29 Sep 2022 09:30:55 -0700 (PDT)
Received: from avogadro.local ([2001:b07:6468:f312:1c09:f536:3de6:228c])
 by smtp.gmail.com with ESMTPSA id
 cn25-20020a0564020cb900b00443d657d8a4sm5666506edb.61.2022.09.29.09.30.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 29 Sep 2022 09:30:55 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: "Jason A. Donenfeld" <Jason@zx2c4.com>
Subject: [PULL 14/14] x86: re-initialize RNG seed when selecting kernel
Date: Thu, 29 Sep 2022 18:30:14 +0200
Message-Id: <20220929163014.16950-15-pbonzini@redhat.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20220929163014.16950-1-pbonzini@redhat.com>
References: <20220929163014.16950-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.08,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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

From: "Jason A. Donenfeld" <Jason@zx2c4.com>

We don't want it to be possible to re-read the RNG seed after ingesting
it, because this ruins forward secrecy. Currently, however, the setup
data section can just be re-read. Since the kernel is always read after
the setup data, use the selection of the kernel as a trigger to
re-initialize the RNG seed, just like we do on reboot, to preserve
forward secrecy.

Cc: Paolo Bonzini <pbonzini@redhat.com>
Signed-off-by: Jason A. Donenfeld <Jason@zx2c4.com>
Message-Id: <20220922152847.3670513-1-Jason@zx2c4.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 hw/i386/x86.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/hw/i386/x86.c b/hw/i386/x86.c
index f9a4ddaa4a..1148f70c03 100644
--- a/hw/i386/x86.c
+++ b/hw/i386/x86.c
@@ -1112,11 +1112,14 @@ void x86_load_linux(X86MachineState *x86ms,
         setup_data->len = cpu_to_le32(RNG_SEED_LENGTH);
         qemu_guest_getrandom_nofail(setup_data->data, RNG_SEED_LENGTH);
         qemu_register_reset(reset_rng_seed, setup_data);
+        fw_cfg_add_bytes_callback(fw_cfg, FW_CFG_KERNEL_DATA, reset_rng_seed, NULL,
+                                  setup_data, kernel, kernel_size, true);
+    } else {
+        fw_cfg_add_bytes(fw_cfg, FW_CFG_KERNEL_DATA, kernel, kernel_size);
     }
 
     fw_cfg_add_i32(fw_cfg, FW_CFG_KERNEL_ADDR, prot_addr);
     fw_cfg_add_i32(fw_cfg, FW_CFG_KERNEL_SIZE, kernel_size);
-    fw_cfg_add_bytes(fw_cfg, FW_CFG_KERNEL_DATA, kernel, kernel_size);
     sev_load_ctx.kernel_data = (char *)kernel;
     sev_load_ctx.kernel_size = kernel_size;
 
-- 
2.37.3


