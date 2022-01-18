Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AD2E4925C1
	for <lists+qemu-devel@lfdr.de>; Tue, 18 Jan 2022 13:34:52 +0100 (CET)
Received: from localhost ([::1]:47540 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n9nhL-0000tV-GI
	for lists+qemu-devel@lfdr.de; Tue, 18 Jan 2022 07:34:51 -0500
Received: from eggs.gnu.org ([209.51.188.92]:51644)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1n9nEN-0006CM-CP; Tue, 18 Jan 2022 07:05:03 -0500
Received: from [2a00:1450:4864:20::32e] (port=56305
 helo=mail-wm1-x32e.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1n9nED-0005rF-0w; Tue, 18 Jan 2022 07:04:51 -0500
Received: by mail-wm1-x32e.google.com with SMTP id c66so27129951wma.5;
 Tue, 18 Jan 2022 04:03:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=yWsVPs9o1V93WUmz88EzV+Be2X5TrPFA2W+WEyPYUY4=;
 b=K7baPdwK/uLtcEBZbURq+yANLrqK3J4jKGPq/PEVcGVwO7szUUOCAnV8ftb4RWiC54
 4u0vHcXO6NnXvaUoZ0aBIVq4s0b5VKuE2G1ZxBvIfdO7pUPUONz4H6VZyvNmkPpU/ghT
 Lj3YNaU33+yLqFI4+r3azJoS0EQ3fhOEplutIy6xVdkHEKVMj8DcNqa4njWshHsLBAla
 CeY+ViPmdcSbG33lAvMrecaVqjtZNb/yPY4Qqx636d5naHeUUNCsuf90lOtEsc+Eo432
 isXGt2TFzEIZ0pcsdKsFj1XISlaZ1cp3dEL8FPuqXuTrFw6yX0MXl3silD6mjp0wWxhW
 JuBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=yWsVPs9o1V93WUmz88EzV+Be2X5TrPFA2W+WEyPYUY4=;
 b=l1uAi0oOoUBOujrJYGuK7pz3TEPjZ2zDI2zYxwQY3DhuRrIbc6mj4OBvBoXj4ElPRs
 /DrLuLTWSxVGEdjShe0l4F2+QaJ74EA2gH8yiCIGTK2y+WezIVm1zYwfQE2CSMs/+Vzn
 b02tYeFVUXzpGBI8tyKy0fi7HGqYGn5WB8L1nybOu5hGPgMa1V/l9qoCNWGMnOxlNUax
 RqSEHk5DYb4lZLJ0xYo0bZIet0H+I8pPKjcW+40gunpvcf6gdct+DJmXCbhGI6ImXeLf
 u5ZgHLBd+ooCDpSRU19duL6AbGU5YqAAN5QHNDdcqXdsV1Z1fId7J0beNzCI1EiXk77i
 9/dQ==
X-Gm-Message-State: AOAM532FVKaCaxYyte2eMhZzAzgHXaut0FRaZslCmqCQKq0RZYXCkCVA
 z5kq5BaHrzmyGZamSWF/W7NNtEcMJPY=
X-Google-Smtp-Source: ABdhPJxik7H45qDkTRHgq7dUPWL+3eD+CiHk+ncpBfdnGMpAPw2KtafpqC/qhYuVR0oy2N7rxByyGA==
X-Received: by 2002:a05:600c:3d86:: with SMTP id
 bi6mr2277505wmb.1.1642507389916; 
 Tue, 18 Jan 2022 04:03:09 -0800 (PST)
Received: from nuc.. (154.red-83-50-83.dynamicip.rima-tde.net. [83.50.83.154])
 by smtp.gmail.com with ESMTPSA id
 o10sm2106556wmr.38.2022.01.18.04.03.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 Jan 2022 04:03:09 -0800 (PST)
To: qemu-devel@nongnu.org
Cc: Peter Xu <peterx@redhat.com>, David Hildenbrand <david@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, qemu-block@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: [PULL 08/19] stubs: Restrict fw_cfg to system emulation
Date: Tue, 18 Jan 2022 13:02:18 +0100
Message-Id: <20220118120229.196337-9-f4bug@amsat.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220118120229.196337-1-f4bug@amsat.org>
References: <20220118120229.196337-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::32e
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::32e;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x32e.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.248,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Reply-to:  =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
From:  =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= via <qemu-devel@nongnu.org>

fw_cfg_arch_key_name() stub is only required for sysemu.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: David Hildenbrand <david@redhat.com>
Message-Id: <20220111184309.28637-2-f4bug@amsat.org>
---
 stubs/meson.build | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/stubs/meson.build b/stubs/meson.build
index 71469c1d50a..363f6fa785d 100644
--- a/stubs/meson.build
+++ b/stubs/meson.build
@@ -11,7 +11,6 @@
 stub_ss.add(files('dump.c'))
 stub_ss.add(files('error-printf.c'))
 stub_ss.add(files('fdset.c'))
-stub_ss.add(files('fw_cfg.c'))
 stub_ss.add(files('gdbstub.c'))
 stub_ss.add(files('get-vm-name.c'))
 if linux_io_uring.found()
@@ -51,6 +50,7 @@
   stub_ss.add(files('replay-tools.c'))
 endif
 if have_system
+  stub_ss.add(files('fw_cfg.c'))
   stub_ss.add(files('semihost.c'))
   stub_ss.add(files('usb-dev-stub.c'))
   stub_ss.add(files('xen-hw-stub.c'))
-- 
2.34.1


