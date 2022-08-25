Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 779BD5A1CDD
	for <lists+qemu-devel@lfdr.de>; Fri, 26 Aug 2022 00:58:42 +0200 (CEST)
Received: from localhost ([::1]:53414 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oRLo9-0000Ym-K5
	for lists+qemu-devel@lfdr.de; Thu, 25 Aug 2022 18:58:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37026)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oRLKo-0003DV-B4
 for qemu-devel@nongnu.org; Thu, 25 Aug 2022 18:28:22 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:60788)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oRLKm-0004hC-SD
 for qemu-devel@nongnu.org; Thu, 25 Aug 2022 18:28:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1661466500;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=O7kfGuOp357+5FIV6vi8fic2iY8g4Ppu6HMYCsOxjpo=;
 b=id/UmcavOioWceT9Io1rUAWymXv/pw6FrYoiYQ9vHWxNXnWQEw2S6g4JyH6jiGvu3H57e0
 uKundKpBSNp1NNrju0wq4VYlC54izdxlYNYM9LZUcU3b7dKwhpU2M99J434l1aWx0PeJ9d
 waYyHLKDMDz6BY2jRGwwAUKVQNX8Jyg=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-669-TmaoGKegPxakJKsr6uK7lA-1; Thu, 25 Aug 2022 18:28:19 -0400
X-MC-Unique: TmaoGKegPxakJKsr6uK7lA-1
Received: by mail-wm1-f70.google.com with SMTP id
 203-20020a1c02d4000000b003a5f5bce876so3064836wmc.2
 for <qemu-devel@nongnu.org>; Thu, 25 Aug 2022 15:28:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=O7kfGuOp357+5FIV6vi8fic2iY8g4Ppu6HMYCsOxjpo=;
 b=TEN1bonsWtZPT1d0qdkMfp2doDr6LT2CwwpzSAfHeCqp5UTdTexIZxG26lgi2F3VtS
 Vg8iCCwMSWy3hIGJx2svk7wiJUb/aiH8hIxZz4NusoL2kZuDy+u+Jy7APBsEbrprO4Vn
 oSqRrLavXgXiT9wEIQLx6qV+czI4JL5cLM4pUjoaarPuK9gQhmUShTiLlQsdnl15JhOm
 9EnAqrpipzJGgZxCoUqrSbdg1pf5r5bg+JYXREg91YINfB7c9Tr6BrNplCSOMwaolCnT
 l+WqOrlHUGYSMfPwGuHNJnHWDXOJB+wR/nHO7qSGLLzRS80FaQ328n2nq50JYHjEksMk
 tuBA==
X-Gm-Message-State: ACgBeo3Acr16u0+bO/V/QDhOz98JqDEyMk8dqmgE6CvvIKxwE28lpSDd
 fjJyc0L3kaWF9DeGeGtRh8QHqj5gyGgX99gxWHBAnQ9weIdUhvfOTcZBlYLGEFq0c8zCq66aU6+
 Iue+HCfiQRTVtZ/xrwVY9XpavcTh/0I5QMqUegp7FdLzE9O5MAAXWLI9OPoNV0OtK+bY=
X-Received: by 2002:a05:600c:3d91:b0:3a5:4132:b6a0 with SMTP id
 bi17-20020a05600c3d9100b003a54132b6a0mr3299957wmb.126.1661466497896; 
 Thu, 25 Aug 2022 15:28:17 -0700 (PDT)
X-Google-Smtp-Source: AA6agR4c/oPF1kLJArnFNvkGiSTKlyncsKAURUcclrlsyv0V/+GmL442+Hk1XEwYbgSIFP5p/vsddg==
X-Received: by 2002:a05:600c:3d91:b0:3a5:4132:b6a0 with SMTP id
 bi17-20020a05600c3d9100b003a54132b6a0mr3299949wmb.126.1661466497562; 
 Thu, 25 Aug 2022 15:28:17 -0700 (PDT)
Received: from goa-sendmail ([2001:b07:6468:f312:9af8:e5f5:7516:fa89])
 by smtp.gmail.com with ESMTPSA id
 f6-20020a056000128600b0021d7b41255esm290853wrx.98.2022.08.25.15.28.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 25 Aug 2022 15:28:17 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: alex.bennee@linaro.org
Subject: [PATCH 20/20] pc-bios/vof: Adopt meson style Make output
Date: Fri, 26 Aug 2022 00:27:45 +0200
Message-Id: <20220825222745.38779-21-pbonzini@redhat.com>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20220825222745.38779-1-pbonzini@redhat.com>
References: <20220825222745.38779-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 pc-bios/vof/Makefile | 15 +++++++++++----
 1 file changed, 11 insertions(+), 4 deletions(-)

diff --git a/pc-bios/vof/Makefile b/pc-bios/vof/Makefile
index 990f26af31..be8bd96294 100644
--- a/pc-bios/vof/Makefile
+++ b/pc-bios/vof/Makefile
@@ -2,19 +2,26 @@ include config.mak
 VPATH=$(SRC_DIR)
 all: vof.bin
 
+NULL :=
+SPACE := $(NULL) #
+TARGET_PREFIX := $(patsubst %/,%:$(SPACE),$(TARGET_DIR))
+
+quiet-@ = $(if $(V),,@$(if $1,,printf "%s\n" "$(TARGET_PREFIX)$1" && ))
+quiet-command = $(call quiet-@,$2 $@)$1
+
 EXTRA_CFLAGS += -mcpu=power4
 
 %.o: %.S
-	$(CC) $(EXTRA_CFLAGS) -c -o $@ $<
+	$(call quiet-command, $(CC) $(EXTRA_CFLAGS) -c -o $@ $<,Assembling)
 
 %.o: %.c
-	$(CC) $(EXTRA_CFLAGS) -c -fno-stack-protector -o $@ $<
+	$(call quiet-command, $(CC) $(EXTRA_CFLAGS) -c -fno-stack-protector -o $@ $<,Compiling)
 
 vof.elf: entry.o main.o ci.o bootmem.o libc.o
-	$(LD) -nostdlib -e_start -T$(SRC_DIR)/vof.lds -EB -o $@ $^
+	$(call quiet-command, $(LD) -nostdlib -e_start -T$(SRC_DIR)/vof.lds -EB -o $@ $^,Linking)
 
 %.bin: %.elf
-	$(OBJCOPY) -O binary -j .text -j .data -j .toc -j .got2 $^ $@
+	$(call quiet-command, $(OBJCOPY) -O binary -j .text -j .data -j .toc -j .got2 $^ $@,Extracting raw object)
 
 clean:
 	rm -f *.o vof.bin vof.elf *~
-- 
2.37.1


