Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 645DD57D1D2
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Jul 2022 18:43:57 +0200 (CEST)
Received: from localhost ([::1]:44382 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oEZHG-0001nD-DY
	for lists+qemu-devel@lfdr.de; Thu, 21 Jul 2022 12:43:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48216)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oEZAH-00075M-9a
 for qemu-devel@nongnu.org; Thu, 21 Jul 2022 12:36:41 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:42954)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oEZAF-0007ge-Nx
 for qemu-devel@nongnu.org; Thu, 21 Jul 2022 12:36:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1658421399;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version: content-type:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Vxh38mWSPh8489SXhYvyAkZTxocGKTqcmPB6SFN787s=;
 b=J8EGjoXtMuv/MivIqKHxvhCuoBv2h9GzKP9MjV43T5LFgbjQo62dEQs+YvCZyM2tHZrRNm
 xkme9g5P09kaoXMEiBXgdSIAg3jM/GedBB2w3Q3jlzOzzkds3fRAPk+u+XmyST0uxqI0TR
 sR8ry2tIYkJeFwXh1C+H36R8W5LmAC8=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-327-bjgSAPARPXC4GxTrRDs8Lg-1; Thu, 21 Jul 2022 12:36:38 -0400
X-MC-Unique: bjgSAPARPXC4GxTrRDs8Lg-1
Received: by mail-ed1-f69.google.com with SMTP id
 b15-20020a056402278f00b0043acaf76f8dso1441615ede.21
 for <qemu-devel@nongnu.org>; Thu, 21 Jul 2022 09:36:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Vxh38mWSPh8489SXhYvyAkZTxocGKTqcmPB6SFN787s=;
 b=dVbfsDWtUP3A0S3MJMHBHM6N3rxa+viXQum3yeTjLFafnR540d4qm69mFAKm5Ztz5x
 8GHJA3T0xxGm68QimnCUPfFQrUq2AAjxj5V0wsoQKVds9DN4927K6vqi+bFfOMti8TGa
 EMeiNSREWhiVfTu74WNcEDf+tGw0bsc9URyvRau5mgUYT8aeUYy/eA2PbtuQoOVSlkGX
 S9aKiJFhU8+l/+8IOJ6E2Ms5UVqrq2xjoRhtW+3K5tvXitktcg1ozlNqvoFanAOW6jsT
 7xC5Io9PKf98SAcX+5u2Ts5RPB5o6FsgW7Hhm3Uy5NwDFXrilDM69cBG3/oGKfZHrjy7
 hvIQ==
X-Gm-Message-State: AJIora/Z5+5mC4tc5EAjIpdUgleGpK36RfLC/xzmY91cLC1WvYwiqMa4
 z/NTce9d8HbJpdypGJoKiHFiIkRx1oJnqiNEdfqieSlVv2MdKqSdTgu2btoZ5s5SUcQ8rrY7/hX
 n4uiiAvLB0+/uaQC6Pn3kPuXjopHiJhGqFNdZ9Bc48SDzvVV6vCndTCAUJkR7+ZKd8D4=
X-Received: by 2002:a17:907:1c8a:b0:6e9:2a0d:d7b7 with SMTP id
 nb10-20020a1709071c8a00b006e92a0dd7b7mr40351848ejc.572.1658421396492; 
 Thu, 21 Jul 2022 09:36:36 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1vrXIbl+jW1U03b+BUadHWSYRerU2f5vdIcTdSypfRZN0lGS7LUvOuVLvugMMPLdYWZm4ktkw==
X-Received: by 2002:a17:907:1c8a:b0:6e9:2a0d:d7b7 with SMTP id
 nb10-20020a1709071c8a00b006e92a0dd7b7mr40351827ejc.572.1658421396260; 
 Thu, 21 Jul 2022 09:36:36 -0700 (PDT)
Received: from goa-sendmail ([2001:b07:6468:f312:9af8:e5f5:7516:fa89])
 by smtp.gmail.com with ESMTPSA id
 c16-20020a170906695000b0072b40cb28a8sm1021475ejs.29.2022.07.21.09.36.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 21 Jul 2022 09:36:35 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: "Jason A. Donenfeld" <Jason@zx2c4.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [PULL 7/9] hw/guest-loader: pass random seed to fdt
Date: Thu, 21 Jul 2022 18:36:19 +0200
Message-Id: <20220721163621.761513-8-pbonzini@redhat.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220721163621.761513-1-pbonzini@redhat.com>
References: <20220721163621.761513-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Type: text/plain
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PP_MIME_FAKE_ASCII_TEXT=0.999, RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

If the FDT contains /chosen/rng-seed, then the Linux RNG will use it to
initialize early. Set this using the usual guest random number
generation function. This FDT node is part of the DT specification.

Cc: Alex Bennée <alex.bennee@linaro.org>
Signed-off-by: Jason A. Donenfeld <Jason@zx2c4.com>
Message-Id: <20220719121559.135355-1-Jason@zx2c4.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 hw/core/guest-loader.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/hw/core/guest-loader.c b/hw/core/guest-loader.c
index 391c875a29..4f8572693c 100644
--- a/hw/core/guest-loader.c
+++ b/hw/core/guest-loader.c
@@ -31,6 +31,7 @@
 #include "hw/qdev-properties.h"
 #include "qapi/error.h"
 #include "qemu/module.h"
+#include "qemu/guest-random.h"
 #include "guest-loader.h"
 #include "sysemu/device_tree.h"
 #include "hw/boards.h"
@@ -46,6 +47,7 @@ static void loader_insert_platform_data(GuestLoaderState *s, int size,
     g_autofree char *node = g_strdup_printf("/chosen/module@0x%08" PRIx64,
                                             s->addr);
     uint64_t reg_attr[2] = {cpu_to_be64(s->addr), cpu_to_be64(size)};
+    uint8_t rng_seed[32];
 
     if (!fdt) {
         error_setg(errp, "Cannot modify FDT fields if the machine has none");
@@ -55,6 +57,9 @@ static void loader_insert_platform_data(GuestLoaderState *s, int size,
     qemu_fdt_add_subnode(fdt, node);
     qemu_fdt_setprop(fdt, node, "reg", &reg_attr, sizeof(reg_attr));
 
+    qemu_guest_getrandom_nofail(rng_seed, sizeof(rng_seed));
+    qemu_fdt_setprop(fdt, node, "rng-seed", rng_seed, sizeof(rng_seed));
+
     if (s->kernel) {
         const char *compat[2] = { "multiboot,module", "multiboot,kernel" };
         if (qemu_fdt_setprop_string_array(fdt, node, "compatible",
-- 
2.36.1



