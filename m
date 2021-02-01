Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 78F4730A69D
	for <lists+qemu-devel@lfdr.de>; Mon,  1 Feb 2021 12:33:47 +0100 (CET)
Received: from localhost ([::1]:33366 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l6XSk-0001ht-GY
	for lists+qemu-devel@lfdr.de; Mon, 01 Feb 2021 06:33:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47520)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1l6XOO-0006Ik-TA
 for qemu-devel@nongnu.org; Mon, 01 Feb 2021 06:29:18 -0500
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c]:40295)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1l6XON-0008Fq-C5
 for qemu-devel@nongnu.org; Mon, 01 Feb 2021 06:29:16 -0500
Received: by mail-wm1-x32c.google.com with SMTP id c127so12830581wmf.5
 for <qemu-devel@nongnu.org>; Mon, 01 Feb 2021 03:29:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=donqcXl7R+CymjCL8vc7v5IAilQU7H4mg0fNs68sCzA=;
 b=e5igdUOKRu+nuBY0Zu2Ohn5JfnspcW8pqSPyZT4CaQx7HCrrRF6/uOf16FFra0u+BJ
 Ip2eqn5lYrT8So/ZzTJBuOK58LV2uQ5OvMNgRK5m2cMRvTX/49GjhKxORVzEa4eJrH74
 C4rzdb13gibI6wNTUMXHZhK73uON9FKBUZnBJhiYzLyhWkCmOv7h2ZqS35nM2cwMg30D
 FH5wZcwae4yATnosrM5VXNPMx3HwFM9aanKYq4QURPzWTywVp1ERBuFqs6BnMYJqn7N5
 PcaTnrymB0a7DiW8jS1VFjqewxxHRSRqy9WA89Acn/1D/R6X3o5X5PvPGCkMXM1ctXvg
 FHgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=donqcXl7R+CymjCL8vc7v5IAilQU7H4mg0fNs68sCzA=;
 b=C0/+L2OWNEXRQJLrDBQeW6agIangXownkm9lyxofo2e1Pj2jLu7Qdr91g/lwmgtJOK
 riY7y/5UwN1bJ7+ZOuK6ZLZuzHpDy5cAjydgw4a4qzCM1Ek4XvW+ZUVqLIvbt6c6Kwdc
 i5fFlAssEa5Se95JOFyegGx+903Y++gic+jL50gFfZJz+M2T3NTobBHnBR4cu1iCZE8h
 6XDHvOMfadj9Sb5OeQjIjiww3zxu+g7bD94QZkEONl55Ty4nrEDjGuWswMnBeano7m4n
 dvEEoQv9zo8Nj8ZRW1NLMQRhiLih7XFBC9htYQXvli9XQisAyTH4y82dFZ0Q1YtpuWzt
 QuGg==
X-Gm-Message-State: AOAM532mV04DbG44ICvqbVXBTQATMLuKJBUAGDbG8lOx/Qjr76hJLaFL
 hW2CbEy+P9IYb+lu0PZLqqA=
X-Google-Smtp-Source: ABdhPJx1pElW3YJm/WsOQahhG2HH5xZse6fgcEBep2dVSJwz1qWS4aDb1550CqyGQkCPJFpsp90m2g==
X-Received: by 2002:a7b:c09a:: with SMTP id r26mr1225594wmh.60.1612178953873; 
 Mon, 01 Feb 2021 03:29:13 -0800 (PST)
Received: from localhost.localdomain (7.red-83-57-171.dynamicip.rima-tde.net.
 [83.57.171.7])
 by smtp.gmail.com with ESMTPSA id f4sm26998449wrs.34.2021.02.01.03.29.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 01 Feb 2021 03:29:13 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Subject: [PATCH v3 1/7] meson: Do not build Xen x86_64-softmmu on Aarch64
Date: Mon,  1 Feb 2021 12:28:59 +0100
Message-Id: <20210201112905.545144-2-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210201112905.545144-1-f4bug@amsat.org>
References: <20210201112905.545144-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32c;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x32c.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
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
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Eduardo Habkost <ehabkost@redhat.com>, Paul Durrant <paul@xen.org>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 xen-devel@lists.xenproject.org, Anthony Perard <anthony.perard@citrix.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The Xen on ARM documentation only mentions the i386-softmmu
target. As the x86_64-softmmu doesn't seem used, remove it
to avoid wasting cpu cycles building it.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 meson.build | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/meson.build b/meson.build
index f00b7754fd4..97a577a7743 100644
--- a/meson.build
+++ b/meson.build
@@ -74,10 +74,10 @@
 endif
 
 accelerator_targets = { 'CONFIG_KVM': kvm_targets }
-if cpu in ['x86', 'x86_64', 'arm', 'aarch64']
+if cpu in ['arm', 'aarch64']
   # i368 emulator provides xenpv machine type for multiple architectures
   accelerator_targets += {
-    'CONFIG_XEN': ['i386-softmmu', 'x86_64-softmmu'],
+    'CONFIG_XEN': ['i386-softmmu'],
   }
 endif
 if cpu in ['x86', 'x86_64']
@@ -85,6 +85,7 @@
     'CONFIG_HAX': ['i386-softmmu', 'x86_64-softmmu'],
     'CONFIG_HVF': ['x86_64-softmmu'],
     'CONFIG_WHPX': ['i386-softmmu', 'x86_64-softmmu'],
+    'CONFIG_XEN': ['i386-softmmu', 'x86_64-softmmu'],
   }
 endif
 
-- 
2.26.2


