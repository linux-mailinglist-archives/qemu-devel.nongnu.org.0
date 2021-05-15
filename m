Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ACD28381A47
	for <lists+qemu-devel@lfdr.de>; Sat, 15 May 2021 19:49:32 +0200 (CEST)
Received: from localhost ([::1]:57966 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lhyPr-0003EQ-Pr
	for lists+qemu-devel@lfdr.de; Sat, 15 May 2021 13:49:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48312)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lhyEj-0000tF-PE
 for qemu-devel@nongnu.org; Sat, 15 May 2021 13:38:01 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:35801)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lhyEh-0006M8-4p
 for qemu-devel@nongnu.org; Sat, 15 May 2021 13:38:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1621100276;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=j4+TVOwKdNAqEwx0iSQEx6F6DQNpYYiD4MSDoIPJ8ns=;
 b=C1y5DnAt2Jit4pcFE1rQFAK+D5SmsB7CrEXGZZKR3Nta2vx0NBsM1G75YArD+G/FOk4d1u
 Jqyh7LmZ9E3r66s+OqL4ERQiIKAmxusqEpAXt95tj4CbV+83WLdHu9BJDCEcm313D5v1l2
 ngX/jHGdXiPk5eN3QhhsbDzr0IbQBM0=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-304-QnWAhKcJO1GlEgc15OY56Q-1; Sat, 15 May 2021 13:37:55 -0400
X-MC-Unique: QnWAhKcJO1GlEgc15OY56Q-1
Received: by mail-wm1-f71.google.com with SMTP id
 b128-20020a1c1b860000b029015b52bdb65aso1656087wmb.5
 for <qemu-devel@nongnu.org>; Sat, 15 May 2021 10:37:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=j4+TVOwKdNAqEwx0iSQEx6F6DQNpYYiD4MSDoIPJ8ns=;
 b=kmiALSLVYmP42beoFA3ZoAAN+eEH2oS1V3HMKLB1ZtdszErJTi31dWVYplCbUprY7r
 nupZqh2KgGZHXOWBbwg5kLwU04I9X+9dU0kR0E81Xm0kd85MBBACUylmNhsRXwdSX84f
 QwM374jHCOQ+8GmBgqb50iLVtlWG9/1XHxysjR0Im79GMUMZpgSKN8r1QMuvHy8NhfWb
 hSX+Ej6k3kXkQfl2sJPSEweUxL7CFe2XgND6dawB0J4m3XgyM5NACHsASBLdLCn7OZoX
 Lze9FR/I4rCBsm+DP2mLzK0vj//bIfEXJdIIlBKuVBWyjvCk2uJV4XP6MJT1f2wxIpa8
 Oz3Q==
X-Gm-Message-State: AOAM5306xEn4xnNRfs4czs69w0oZ4gvI2I5wa3oagbMVP78bqoOjzDvD
 Uhyqbf25khiozSGqW+J+8azy+mc8lb39U+R6NZOJM0T0o7kaqAgYjhyRafCcHyzJxyd3gNoWD7m
 dsxB2ZOO5dd4RZr0NLUBHb8LT4SYgSI4DCkrmvqMzypmFKbhYYkkhypRmDcGxd/eu
X-Received: by 2002:a05:6000:508:: with SMTP id
 a8mr65107218wrf.315.1621100272374; 
 Sat, 15 May 2021 10:37:52 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxoFnLeRbk63Gsa5dVBOmEyZbu2HTopi5mLBkLvvTphYvDhVQD1hqnm/7wQOXQ6OyOFZn0rTw==
X-Received: by 2002:a05:6000:508:: with SMTP id
 a8mr65107196wrf.315.1621100272196; 
 Sat, 15 May 2021 10:37:52 -0700 (PDT)
Received: from localhost.localdomain (31.red-83-51-215.dynamicip.rima-tde.net.
 [83.51.215.31])
 by smtp.gmail.com with ESMTPSA id x16sm10269543wrp.6.2021.05.15.10.37.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 15 May 2021 10:37:51 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 07/12] hw/riscv/Kconfig: Restrict NUMA to Virt & Spike
 machines
Date: Sat, 15 May 2021 19:37:11 +0200
Message-Id: <20210515173716.358295-8-philmd@redhat.com>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20210515173716.358295-1-philmd@redhat.com>
References: <20210515173716.358295-1-philmd@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.701,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Alistair Francis <alistair.francis@wdc.com>, qemu-riscv@nongnu.org,
 Bin Meng <bin.meng@windriver.com>, qemu-arm@nongnu.org, qemu-ppc@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>, Bin Meng <bmeng.cn@gmail.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Only the Virt and Spike machines use NUMA. Add a RISCV_NUMA Kconfig
symbol and only have these machines select it. Adapt the Meson file
to only built it if required.

Acked-by: Paolo Bonzini <pbonzini@redhat.com>
Reviewed-by: Bin Meng <bmeng.cn@gmail.com>
Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 hw/riscv/Kconfig     | 5 +++++
 hw/riscv/meson.build | 2 +-
 2 files changed, 6 insertions(+), 1 deletion(-)

diff --git a/hw/riscv/Kconfig b/hw/riscv/Kconfig
index 86957ec7b06..0590f443fdf 100644
--- a/hw/riscv/Kconfig
+++ b/hw/riscv/Kconfig
@@ -1,3 +1,6 @@
+config RISCV_NUMA
+    bool
+
 config IBEX
     bool
 
@@ -34,6 +37,7 @@ config RISCV_VIRT
     imply PCI_DEVICES
     imply VIRTIO_VGA
     imply TEST_DEVICES
+    select RISCV_NUMA
     select GOLDFISH_RTC
     select MSI_NONBROKEN
     select PCI
@@ -74,6 +78,7 @@ config SIFIVE_U
 
 config SPIKE
     bool
+    select RISCV_NUMA
     select HTIF
     select MSI_NONBROKEN
     select SIFIVE_CLINT
diff --git a/hw/riscv/meson.build b/hw/riscv/meson.build
index a97454661c0..ab6cae57eae 100644
--- a/hw/riscv/meson.build
+++ b/hw/riscv/meson.build
@@ -1,6 +1,6 @@
 riscv_ss = ss.source_set()
 riscv_ss.add(files('boot.c'), fdt)
-riscv_ss.add(files('numa.c'))
+riscv_ss.add(when: 'CONFIG_RISCV_NUMA', if_true: files('numa.c'))
 riscv_ss.add(files('riscv_hart.c'))
 riscv_ss.add(when: 'CONFIG_OPENTITAN', if_true: files('opentitan.c'))
 riscv_ss.add(when: 'CONFIG_RISCV_VIRT', if_true: files('virt.c'))
-- 
2.26.3


