Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B24C2DC461
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Dec 2020 17:37:35 +0100 (CET)
Received: from localhost ([::1]:58606 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kpZny-0004wn-Ar
	for lists+qemu-devel@lfdr.de; Wed, 16 Dec 2020 11:37:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:32910)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kpZej-0004Ov-P7
 for qemu-devel@nongnu.org; Wed, 16 Dec 2020 11:28:01 -0500
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c]:51448)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kpZeg-0007hT-QJ
 for qemu-devel@nongnu.org; Wed, 16 Dec 2020 11:28:00 -0500
Received: by mail-wm1-x32c.google.com with SMTP id v14so2942805wml.1
 for <qemu-devel@nongnu.org>; Wed, 16 Dec 2020 08:27:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=recdiB4XKQVk4l5Db0Se4FZc13AoQDQYCnHTZazhMBI=;
 b=UcN0ev8q3Hq5ePjuLrX2bZyjXp8IU5s0eXQ0H9oo1M3jBmheBiGfEwCicqIDb8Yneu
 cUDHbCjxh1WrTDvvX/IQNu02mGA0XzZT3682cfH+0xJBwt7U+B6h0Ndi/6Uu+Eh5YhGK
 QbylIr9MEi1ClVhag0pJTGUWmEXhvZznD3+4CgAy3Ilb07yolH4qBPMDqIKbYO0jK+Pv
 fyx12ww3IfM3ur45/21R/3Kv49YxkrCwZfObJIlXLEY8HxT52k0MS+edSgcgIpDWB9QH
 pZZYVZ42l4iLiXrozVOItFx8Q7NgHhunQbC61tmaDinHsX1mkUlHfYZbPmBGEUz8ucs8
 MdpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=recdiB4XKQVk4l5Db0Se4FZc13AoQDQYCnHTZazhMBI=;
 b=p2nPsHmsA2hGA6sWKZ3I4bGJERPpdVK/52ZHCG30GzTHyBW7UGWbajFpSwDg7Fe5yP
 iu3qj6XFW1kCm7jHrX6OAA6TdHUfJHJRy3P8X2PTm7Jo8BGpd7yIHQPnzjHJNeRbHybp
 7F+B8WidqLVSMFPsWYqBr6wgS6vXoOdzq2qatGeJWBnYgaEr9z2eTFtfX3gb2jLB0rlJ
 uFqOO071rnhfuL65oF2Hfps1scgGIBjFEURAahmRMVSKvxISXzZzqOPTGXTS9kz0TGY8
 PLYgAUZKKbBHjJPFyi7qy5G/qubBpcSRCees4E2uS8+0IT9wC0OJ+OsMIM+wJIcZcfwp
 SNug==
X-Gm-Message-State: AOAM530Eg7waeqZ4gkvdHZj2tAo7YsY4ztWXASsa6yi7c6QXMcAD4xE0
 cYDPAf+xtmOtN6EOGh3WhpTW6F8i7KM=
X-Google-Smtp-Source: ABdhPJykQZmVg07opBWnhfCK9pjX7iPVGhozzx01GfjTWAo3ytz9sQS2maY+wBcyVj9L7LiWy0nf1A==
X-Received: by 2002:a7b:cb46:: with SMTP id v6mr4089655wmj.19.1608136077181;
 Wed, 16 Dec 2020 08:27:57 -0800 (PST)
Received: from localhost.localdomain (101.red-88-21-206.staticip.rima-tde.net.
 [88.21.206.101])
 by smtp.gmail.com with ESMTPSA id j13sm3337149wmi.36.2020.12.16.08.27.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 16 Dec 2020 08:27:56 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 02/12] target/mips/mips-defs: Use ISA_MIPS3 for ISA_MIPS64
Date: Wed, 16 Dec 2020 17:27:34 +0100
Message-Id: <20201216162744.895920-3-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201216162744.895920-1-f4bug@amsat.org>
References: <20201216162744.895920-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32c;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x32c.google.com
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
Cc: Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Paul Burton <paulburton@kernel.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Laurent Vivier <laurent@vivier.eu>, Jiaxun Yang <jiaxun.yang@flygoat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

MIPS 64-bit ISA is introduced with MIPS3.
No need for another bit/definition to check for 64-bit.

Suggested-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 target/mips/mips-defs.h | 2 +-
 hw/mips/boston.c        | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/target/mips/mips-defs.h b/target/mips/mips-defs.h
index f4d76e562d1..ab621a750d5 100644
--- a/target/mips/mips-defs.h
+++ b/target/mips/mips-defs.h
@@ -19,7 +19,7 @@
  */
 #define ISA_MIPS1         0x0000000000000001ULL
 #define ISA_MIPS2         0x0000000000000002ULL
-#define ISA_MIPS3         0x0000000000000004ULL
+#define ISA_MIPS3         0x0000000000000004ULL /* 64-bit */
 #define ISA_MIPS4         0x0000000000000008ULL
 #define ISA_MIPS5         0x0000000000000010ULL
 #define ISA_MIPS32        0x0000000000000020ULL
diff --git a/hw/mips/boston.c b/hw/mips/boston.c
index c3b94c68e1b..f44f681fab5 100644
--- a/hw/mips/boston.c
+++ b/hw/mips/boston.c
@@ -463,7 +463,7 @@ static void boston_mach_init(MachineState *machine)
         exit(1);
     }
 
-    is_64b = cpu_type_supports_isa(machine->cpu_type, ISA_MIPS64);
+    is_64b = cpu_type_supports_isa(machine->cpu_type, ISA_MIPS3);
 
     object_initialize_child(OBJECT(machine), "cps", &s->cps, TYPE_MIPS_CPS);
     object_property_set_str(OBJECT(&s->cps), "cpu-type", machine->cpu_type,
-- 
2.26.2


