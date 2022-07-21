Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EFA0C57D1ED
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Jul 2022 18:49:15 +0200 (CEST)
Received: from localhost ([::1]:55370 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oEZMR-00015R-18
	for lists+qemu-devel@lfdr.de; Thu, 21 Jul 2022 12:49:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48206)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oEZAF-00074u-Sy
 for qemu-devel@nongnu.org; Thu, 21 Jul 2022 12:36:41 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:56502)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oEZAE-0007gN-EO
 for qemu-devel@nongnu.org; Thu, 21 Jul 2022 12:36:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1658421397;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version: content-type:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=PD1btTBpC+qgQ2KTNV4mkb/zSVhV+xxH1LBouvq89cE=;
 b=QFKktT8PJyb96/eItcvaFSdVECxJAh9Q94mYAhyzkYLh2U+ldHdVcn2FOb8EgvJAO8fUgy
 Zp3CaL0FUqLCbtocRlEGx510w0WNXxp2NeSawCkX9yTadcpBhl4K3OZo2yYyE1KiodaZua
 gxfurJuvvMkz05QRcXIwU8Q9ralByd8=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-588-3sEdAX2EMGaz1zFmzZGQ-w-1; Thu, 21 Jul 2022 12:36:36 -0400
X-MC-Unique: 3sEdAX2EMGaz1zFmzZGQ-w-1
Received: by mail-ed1-f70.google.com with SMTP id
 x21-20020a05640226d500b0043abb7ac086so1427252edd.14
 for <qemu-devel@nongnu.org>; Thu, 21 Jul 2022 09:36:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=PD1btTBpC+qgQ2KTNV4mkb/zSVhV+xxH1LBouvq89cE=;
 b=HS5i2WVfqXfNxAlggVoXlMBJidrRXnKwmYV2SN4U3fjkZFbYq3eyQKDdv1fXeelu+V
 W5t34w5VNHHVvVF1Xb6zvg29xNW2KPZ5MpskI14WP7H7U6rUev5X8JDTH/Ma6GvTbK7Y
 hC2UCWrAlQoZ0cq1WgI+GWCqYfUZxV3KGPYkPYSsn2q/JeaevWBJEpdp1xIpBhYG8VTO
 YFYfFzn4Q5n+1kss7jBuyF9UjbYLdUb2FEBWZebjV1zNAYeoQwOO6S8Ae63lPQfFTO+u
 DgHAQjGs+Ob0XfN68Q//cih9miMEJg5rxM3/m+8UHAZISqXwfSjdxi+/X4mItAFvusLV
 90NA==
X-Gm-Message-State: AJIora8LfYn/A3REfJSIa61Wl0myxdGpwvm13L3zddgEO/DuRshwAofg
 u3qbB9qN1TiEwym5p2QL2Cv4OGc8li2AiXADkw6oGa6V3Ex0SnRbiG6YqyU98waK40L4RUP8J3B
 7Ot4LJVxSLg7HTtSQN+xIIEuo/nKuGnI22gw9VqmwA/S6Sxu1zqqZcP80gndabLPOQb4=
X-Received: by 2002:a17:907:87b0:b0:72b:9f0d:3f89 with SMTP id
 qv48-20020a17090787b000b0072b9f0d3f89mr39680778ejc.734.1658421394513; 
 Thu, 21 Jul 2022 09:36:34 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1tIlXFeb2wC+F0aGnfbaJEgU6PuQ+QzQuqhpqamSBfDnc7ipcibbNxwmqZD+ecSIjU98cpvkA==
X-Received: by 2002:a17:907:87b0:b0:72b:9f0d:3f89 with SMTP id
 qv48-20020a17090787b000b0072b9f0d3f89mr39680746ejc.734.1658421394164; 
 Thu, 21 Jul 2022 09:36:34 -0700 (PDT)
Received: from goa-sendmail ([2001:b07:6468:f312:9af8:e5f5:7516:fa89])
 by smtp.gmail.com with ESMTPSA id
 27-20020a170906329b00b007081282cbd8sm1015503ejw.76.2022.07.21.09.36.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 21 Jul 2022 09:36:33 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: "Jason A. Donenfeld" <Jason@zx2c4.com>,
 Paul Burton <paulburton@kernel.org>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: [PULL 6/9] hw/mips: boston: pass random seed to fdt
Date: Thu, 21 Jul 2022 18:36:18 +0200
Message-Id: <20220721163621.761513-7-pbonzini@redhat.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220721163621.761513-1-pbonzini@redhat.com>
References: <20220721163621.761513-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Type: text/plain
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -11
X-Spam_score: -1.2
X-Spam_bar: -
X-Spam_report: (-1.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PP_MIME_FAKE_ASCII_TEXT=0.999, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: "Jason A. Donenfeld" <Jason@zx2c4.com>

If the FDT contains /chosen/rng-seed, then the Linux RNG will use it to
initialize early. Set this using the usual guest random number
generation function. This FDT node is part of the DT specification.

I'd do the same for other MIPS platforms but boston is the only one that
seems to use FDT.

Cc: Paul Burton <paulburton@kernel.org>
Cc: Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>
Cc: Philippe Mathieu-Daudé <f4bug@amsat.org>
Signed-off-by: Jason A. Donenfeld <Jason@zx2c4.com>
Message-Id: <20220719120843.134392-1-Jason@zx2c4.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 hw/mips/boston.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/hw/mips/boston.c b/hw/mips/boston.c
index 1debca18ec..d2ab9da1a0 100644
--- a/hw/mips/boston.c
+++ b/hw/mips/boston.c
@@ -34,6 +34,7 @@
 #include "hw/qdev-properties.h"
 #include "qapi/error.h"
 #include "qemu/error-report.h"
+#include "qemu/guest-random.h"
 #include "qemu/log.h"
 #include "chardev/char.h"
 #include "sysemu/device_tree.h"
@@ -363,6 +364,7 @@ static const void *boston_fdt_filter(void *opaque, const void *fdt_orig,
     size_t ram_low_sz, ram_high_sz;
     size_t fdt_sz = fdt_totalsize(fdt_orig) * 2;
     g_autofree void *fdt = g_malloc0(fdt_sz);
+    uint8_t rng_seed[32];
 
     err = fdt_open_into(fdt_orig, fdt, fdt_sz);
     if (err) {
@@ -370,6 +372,9 @@ static const void *boston_fdt_filter(void *opaque, const void *fdt_orig,
         return NULL;
     }
 
+    qemu_guest_getrandom_nofail(rng_seed, sizeof(rng_seed));
+    qemu_fdt_setprop(fdt, "/chosen", "rng-seed", rng_seed, sizeof(rng_seed));
+
     cmdline = (machine->kernel_cmdline && machine->kernel_cmdline[0])
             ? machine->kernel_cmdline : " ";
     err = qemu_fdt_setprop_string(fdt, "/chosen", "bootargs", cmdline);
-- 
2.36.1



