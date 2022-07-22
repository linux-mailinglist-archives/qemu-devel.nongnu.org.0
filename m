Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A27A057E510
	for <lists+qemu-devel@lfdr.de>; Fri, 22 Jul 2022 19:08:08 +0200 (CEST)
Received: from localhost ([::1]:34270 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oEw8F-00082o-P0
	for lists+qemu-devel@lfdr.de; Fri, 22 Jul 2022 13:08:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39738)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oEw5S-0002Rp-VP
 for qemu-devel@nongnu.org; Fri, 22 Jul 2022 13:05:16 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:41643)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oEw5Q-0000sQ-3G
 for qemu-devel@nongnu.org; Fri, 22 Jul 2022 13:05:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1658509511;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version: content-type:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=PD1btTBpC+qgQ2KTNV4mkb/zSVhV+xxH1LBouvq89cE=;
 b=Khcvzuf5sa3YO4or91YDAv74xo+DmuKEjlO70lva4tnnLNXp56dNkDFWfb00hQv5wDwPHh
 zldhZ9WCll/F22WLGu6o0jJkNBoj0Jrb7XjEcnCohbqoaovwgYrBChwJk9NhV87hzvvaUG
 fW7Qua0acZfnhh/8dYRNYs6yx/G7BHM=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-626-XbaSrozzNG67ZUBlfeck0w-1; Fri, 22 Jul 2022 13:05:07 -0400
X-MC-Unique: XbaSrozzNG67ZUBlfeck0w-1
Received: by mail-ed1-f70.google.com with SMTP id
 b15-20020a056402278f00b0043acaf76f8dso3246887ede.21
 for <qemu-devel@nongnu.org>; Fri, 22 Jul 2022 10:05:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=PD1btTBpC+qgQ2KTNV4mkb/zSVhV+xxH1LBouvq89cE=;
 b=27M/7kWXhLDcMEb81b7cj5L7AmtCslKv3nMZF4lkeS6dNCTxMqJFJUH2x3B1DerIfq
 IWgp5XtRRrAN1qmgjgeik0TKzIi+pTzWFD+H/wiO2pmhrTryNHnHi/VVd9Azjy7/DsUK
 jDmgmnctBTKi2cV2rg0vIzHxBYHrsh3X+VsQtYEZNdBCj26fvatPgCnnI+TEh3DybIOf
 rBSlJEL4BXmOvna5Oc8Y7KUPLD3sbeNQDojwRw3CR77h/uVZDDA4wKYp8nugqDDs5GxF
 sIcoa78uNiucphU2ZGxAtvFB6OF1LdENGXEDRgIlm4wxMVPDy+3XWub0lIJxoOAgTa6S
 TyQw==
X-Gm-Message-State: AJIora+NOWira8TG6xVdv+OO75x/zYl+v6fXqjAd8PIX+/RUQeYXxdPI
 Ik8+xLuq/2Wl28KQfqv0wjZj0CYdF3TTHZhSEvAiJrMkbY7BoskCFbqTn8tXHCyhW2UYlyXC/yN
 Uv7MdTdGY1g8HxnLbhUG6yfZ5XIHh/gERqCEwI76XBnBwBySvvk3/096kVFydMV7Nv1Q=
X-Received: by 2002:a17:907:a042:b0:72b:4fac:1ddf with SMTP id
 gz2-20020a170907a04200b0072b4fac1ddfmr660182ejc.285.1658509505318; 
 Fri, 22 Jul 2022 10:05:05 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1uYa9NTEbbaLl5zmu2VIvZ57j5Ex1bsuLWci2EeBr6EclpRiTDLBpGYVNx+VoXZoqkqw5yQwg==
X-Received: by 2002:a17:907:a042:b0:72b:4fac:1ddf with SMTP id
 gz2-20020a170907a04200b0072b4fac1ddfmr660159ejc.285.1658509505003; 
 Fri, 22 Jul 2022 10:05:05 -0700 (PDT)
Received: from goa-sendmail ([2001:b07:6468:f312:9af8:e5f5:7516:fa89])
 by smtp.gmail.com with ESMTPSA id
 q6-20020a056402032600b0043574d27ddasm2741818edw.16.2022.07.22.10.05.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 22 Jul 2022 10:05:04 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: "Jason A. Donenfeld" <Jason@zx2c4.com>,
 Paul Burton <paulburton@kernel.org>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: [PULL 6/8] hw/mips: boston: pass random seed to fdt
Date: Fri, 22 Jul 2022 19:04:47 +0200
Message-Id: <20220722170449.853222-7-pbonzini@redhat.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220722170449.853222-1-pbonzini@redhat.com>
References: <20220722170449.853222-1-pbonzini@redhat.com>
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



