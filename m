Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BDAF6228008
	for <lists+qemu-devel@lfdr.de>; Tue, 21 Jul 2020 14:35:34 +0200 (CEST)
Received: from localhost ([::1]:57168 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jxrUb-0003gh-R4
	for lists+qemu-devel@lfdr.de; Tue, 21 Jul 2020 08:35:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60726)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1jxrRC-0007B2-Nf
 for qemu-devel@nongnu.org; Tue, 21 Jul 2020 08:32:02 -0400
Received: from mail-wr1-x443.google.com ([2a00:1450:4864:20::443]:41628)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1jxrRB-0003T1-0M
 for qemu-devel@nongnu.org; Tue, 21 Jul 2020 08:32:02 -0400
Received: by mail-wr1-x443.google.com with SMTP id z15so20999723wrl.8
 for <qemu-devel@nongnu.org>; Tue, 21 Jul 2020 05:32:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=1LYxaK4R3HUEmGLUbGgn11bqBUGERs5MJcjFZdKr0NE=;
 b=O9RO54sVGIGU6ILYXz2UtHQZ2yyrRB+XtanaHNQoaApgdexOCpt2IuCqjSlYJpzZg8
 0X4ZjAsOj7F9DDZybZlRSXEFaWlfyI4FCCcNC9Hpb34riN6RRsMtdzhqLhk3dpmCR74a
 HKlIIt+atL9Z1Ph735k0T8Xy7Jj0Fbrlghk2fpn4Zoc7zjqhbqkg3r1XDGAOKQVR/JLo
 KAEg7obNDp+hGv0DzS4ZrvyyI0fzyhEJmakLfEhRSfyyuDs8X66cysrrMbW4mYoIIvfN
 YXGjnbb8JXPv8yMtr1siu7T95ybWCrldNy6T7xW3JbedlboD7YtVcycEOTxCqARTPvoy
 qWgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=1LYxaK4R3HUEmGLUbGgn11bqBUGERs5MJcjFZdKr0NE=;
 b=UXhf4xPC1Mg9QgG9flXbE8ipj6Oz/nziD84Hj+4/2JwZxYCianvPKqUP8Qv7zUzbNL
 +VriRHy0fzGeuG24480XdC8x8LPYFEvZN2W4SIa1zQhLsSQ6d7UoNK0WXm6FGXfrxh4a
 JmV07N+FciBw8jQ0nNEPZVIj03EKxCyyGyJ6z0sJoKZNluc4L5QA06NAgJMKxpsrXf7L
 8jyQobYkT8SJZSYgYr5kavY3S1TYaIiQ8XYmtjJ6mLMx7usG2zanzrjIUcrMbJPP6BZ3
 tkvppUn2vqqzRPAKxdaqxyP1zYPY7Dgi5j6YW1OJxY6Z8EUxw7tO2qWnk7RgyE6onZF9
 Su9Q==
X-Gm-Message-State: AOAM530pM3CNuIXZVsDSRhGN5m1GAYciiHkthqrg31uZdv8xtPNIdfkr
 4tLwpw5mfEF4UycRTUyych/ZSXbYgSc=
X-Google-Smtp-Source: ABdhPJxlaFePuxnI96FbVRNPb+OmM5KORsKJ0vlkSUHhQ64ImaH6ii5AirbyW7to55P7LcNPO8qFzA==
X-Received: by 2002:adf:f289:: with SMTP id k9mr9547049wro.203.1595334719012; 
 Tue, 21 Jul 2020 05:31:59 -0700 (PDT)
Received: from localhost.localdomain
 (138.red-83-57-170.dynamicip.rima-tde.net. [83.57.170.138])
 by smtp.gmail.com with ESMTPSA id s15sm3523323wmj.41.2020.07.21.05.31.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Jul 2020 05:31:58 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH-for-5.1? v3 2/2] hw/isa/isa-bus: Ensure ISA I/O regions
 are 8/16/32-bit accessible
Date: Tue, 21 Jul 2020 14:31:54 +0200
Message-Id: <20200721123154.5302-3-f4bug@amsat.org>
X-Mailer: git-send-email 2.21.3
In-Reply-To: <20200721123154.5302-1-f4bug@amsat.org>
References: <20200721123154.5302-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::443;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x443.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: 0
X-Spam_score: 0.0
X-Spam_bar: /
X-Spam_report: (0.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=1, FREEMAIL_FROM=0.001,
 HEADER_FROM_DIFFERENT_DOMAINS=1, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 "Daniel P . Berrange" <berrange@redhat.com>,
 "Michael S . Tsirkin" <mst@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Michael Tokarev <mjt@tls.msk.ru>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Anthony Perard <anthony.perard@citrix.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Since commit 5d971f9e67 we don't accept mismatching sizes
in memory_region_access_valid(). This gives troubles when
a device is on an ISA bus, because the CPU is free to use
8/16-bit accesses on the bus (or up to 32-bit on EISA bus),
regardless what range is valid for the device.

Monkey-patch the ISA device MemoryRegionOps to force it
to accepts 8/16/32-bit accesses. This should be reverted
after the release and fixed in a more elegant manner.

Related bug reports:

- https://lore.kernel.org/xen-devel/20200630170913.123646-1-anthony.perard@citrix.com/T/
- https://bugs.debian.org/964793
- https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=964247
- https://bugs.launchpad.net/bugs/1886318

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/isa/isa-bus.c | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/hw/isa/isa-bus.c b/hw/isa/isa-bus.c
index 58fde178f9..c8aed2f55f 100644
--- a/hw/isa/isa-bus.c
+++ b/hw/isa/isa-bus.c
@@ -132,6 +132,20 @@ static inline void isa_init_ioport(ISADevice *dev, uint16_t ioport)
 
 void isa_register_ioport(ISADevice *dev, MemoryRegion *io, uint16_t start)
 {
+    if (io->ops->valid.min_access_size > 1 ||
+        io->ops->valid.max_access_size < 4) {
+        warn_report_once("Monkey-patching ISA I/O access sizes "
+                         "(side effect of CVE-2020-13754, only for QEMU v5.1)");
+        /*
+         * To be backward compatible with IBM-PC bus, ISA bus must accept
+         * 8-bit accesses.
+         */
+        io->ops->valid.min_access_size = 1;
+        /*
+         * EISA bus must accept 32-bit accesses.
+         */
+        io->ops->valid.max_access_size = 4;
+    }
     memory_region_add_subregion(isabus->address_space_io, start, io);
     isa_init_ioport(dev, start);
 }
-- 
2.21.3


