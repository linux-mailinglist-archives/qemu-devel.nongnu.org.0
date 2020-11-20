Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D249A2BAED5
	for <lists+qemu-devel@lfdr.de>; Fri, 20 Nov 2020 16:29:05 +0100 (CET)
Received: from localhost ([::1]:52870 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kg8LQ-0004rF-Tu
	for lists+qemu-devel@lfdr.de; Fri, 20 Nov 2020 10:29:04 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46290)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1kg8Gn-0007sz-5o
 for qemu-devel@nongnu.org; Fri, 20 Nov 2020 10:24:17 -0500
Received: from mail-ej1-x642.google.com ([2a00:1450:4864:20::642]:43380)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1kg8Gj-0002ks-UN
 for qemu-devel@nongnu.org; Fri, 20 Nov 2020 10:24:16 -0500
Received: by mail-ej1-x642.google.com with SMTP id k27so13360879ejs.10
 for <qemu-devel@nongnu.org>; Fri, 20 Nov 2020 07:24:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ylIr29R3jDajrJrDPGKLagbuxePY8civuoeaH37JqUY=;
 b=BvzgoaEHGKanQHWFFIDrcIZrIBKhFxZmxoZAmsyngiFd9GhpB3hVovM+EyYBLBnImC
 Wh+rOjtHZhT/upbWqDWtmnYprdCCtJSbJaHT/WQVcKtee08Pq5RJh0eIWW1ZQhCCuRTo
 QX+KXCBaPY3Cav/aC/EoYVR/mbRGfBfwCr00sqjLL4qqWhGptlCKUaww6m1oK2cnLeZ2
 oIhr35nEsZFZnzL1cM0kz/EiJLXeoxOo2P7cJYLe+ejw9PKeUbXJcfzLSwSX+j75JRJB
 ani2IwTXlMEp7CeIWWaL7oLEz48D1ZCCEFnCnnqoH13qQDfCPUPBxkKajA5qrbkEMnab
 y9oA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=ylIr29R3jDajrJrDPGKLagbuxePY8civuoeaH37JqUY=;
 b=PtSa2EVrjQ0wlhdgGBYdqSV/qRb2DF98ftc3x1hJhfQDMJB4UxxTxoMVCyQbyv4jT0
 Ptgp+ixw9rjcuz3y/WSNrDQWiym7CRcxK+bxmbNqPCObmGN7LOS2otD0d7urdXd/D7qS
 OaC6h8a568phod5abDqFxtyAVkJLZ6l4DNmFG0yfAjmZtrDPn+QPDqEIHxpWlUBo08Wf
 DMJ075fcW0gbdh++DyWRiIQoKFeExF04wBCpfRU6AeTSps/evrYDFIV+09k6TQ8K62ve
 TQEYYd3SB4kCbvA0LVpDn1ttX1aa9SYFC+9Qn/ArKKwryURVEE8MMg58IX+nl5uNb2Hb
 IxHg==
X-Gm-Message-State: AOAM532YsuBcx9M/3jd/kLkyz8LUF46ALa02g61s/0gtf8Sr9Vp79xq9
 AVARHfarIo9LtR9hus7ZJqZ9Wy3Bh0c=
X-Google-Smtp-Source: ABdhPJzIjnvRTNv6ji0bHIBKEcAO29zVKtksZ002ETQGzkVzk3rNssmUNEEGzEcpOIxYLhX+32tsqA==
X-Received: by 2002:a17:906:cd0f:: with SMTP id
 oz15mr33709674ejb.200.1605885850709; 
 Fri, 20 Nov 2020 07:24:10 -0800 (PST)
Received: from avogadro.lan ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id l25sm1217961edj.94.2020.11.20.07.24.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 20 Nov 2020 07:24:09 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH] qboot: update to latest upstream
Date: Fri, 20 Nov 2020 16:24:08 +0100
Message-Id: <20201120152408.164346-1-pbonzini@redhat.com>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::642;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ej1-x642.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
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
Cc: Michael Tokarev <mjt@tls.msk.ru>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This also brings in two patches that Debian had to include,
qboot_stop_using_inttypes.patch and qboot_no_jump_tables.diff.

Reported-by: Michael Tokarev <mjt@tls.msk.ru>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 pc-bios/qboot.rom | Bin 65536 -> 65536 bytes
 roms/Makefile     |   8 ++++++--
 roms/qboot        |   2 +-
 3 files changed, 7 insertions(+), 3 deletions(-)

diff --git a/pc-bios/qboot.rom b/pc-bios/qboot.rom
index 45eabc516692e2d134bbb630d133c7c2dcc9a9b6..7634106a0766913077e88dfcb1021c1168dcad3c 100644
GIT binary patch
literal 65536
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
X`|Pw&J6CI`ke0qCGuV>*U(5dkX~JAw

literal 65536
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

diff --git a/roms/Makefile b/roms/Makefile
index 7045e374d3..5ffe3317ac 100644
--- a/roms/Makefile
+++ b/roms/Makefile
@@ -186,9 +186,13 @@ opensbi64-generic:
 	cp opensbi/build/platform/generic/firmware/fw_dynamic.bin ../pc-bios/opensbi-riscv64-generic-fw_dynamic.bin
 	cp opensbi/build/platform/generic/firmware/fw_dynamic.elf ../pc-bios/opensbi-riscv64-generic-fw_dynamic.elf
 
+MESON = meson
+NINJA = ninja
 qboot:
-	$(MAKE) -C qboot
-	cp qboot/bios.bin ../pc-bios/qboot.rom
+	mkdir -p qboot/build
+	$(MESON) setup $(if $(wildcard qboot/build/meson-private),--wipe,) qboot qboot/build
+	$(NINJA) -C qboot/build
+	cp qboot/build/bios.bin ../pc-bios/qboot.rom
 
 npcm7xx_bootrom:
 	$(MAKE) -C vbootrom CROSS_COMPILE=$(arm_cross_prefix)
diff --git a/roms/qboot b/roms/qboot
index cb1c49e0cf..a5300c4949 160000
--- a/roms/qboot
+++ b/roms/qboot
@@ -1 +1 @@
-Subproject commit cb1c49e0cfac99b9961d136ac0194da62c28cf64
+Subproject commit a5300c4949b8d4de2d34bedfaed66793f48ec948
-- 
2.28.0


