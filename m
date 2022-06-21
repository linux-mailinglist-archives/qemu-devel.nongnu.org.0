Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DCADE552C6F
	for <lists+qemu-devel@lfdr.de>; Tue, 21 Jun 2022 09:56:37 +0200 (CEST)
Received: from localhost ([::1]:47586 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o3YkW-0006WM-Fa
	for lists+qemu-devel@lfdr.de; Tue, 21 Jun 2022 03:56:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44802)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1o3Yg5-0002xu-He
 for qemu-devel@nongnu.org; Tue, 21 Jun 2022 03:52:01 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:41641)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1o3Yg1-0005uh-9K
 for qemu-devel@nongnu.org; Tue, 21 Jun 2022 03:51:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1655797916;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=pzgSh6cNqQezBQchzISreqJQeT0hS1LppnZmWHHdUlI=;
 b=jIjdYEhHG8j/0EsZNjCJvWF4tqg8c9iYs8m0EzVo50YN6PGbkyTH0S4EgSWaDFnCZr9GrT
 y8HOblJfxwAwZYsB5VRWqA36h60FYuXINWfNRe8XqaOHMnOcmkjQmnnQ1pSASno/Zy4m/Y
 fbxyFHEEwMIReU5YdkF0xgJjuGaj80E=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-624-2r6C2iX8O9WfAmYOjiU5WA-1; Tue, 21 Jun 2022 03:51:53 -0400
X-MC-Unique: 2r6C2iX8O9WfAmYOjiU5WA-1
Received: by mail-ej1-f72.google.com with SMTP id
 hy20-20020a1709068a7400b00703779e6f2fso4455345ejc.1
 for <qemu-devel@nongnu.org>; Tue, 21 Jun 2022 00:51:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=pzgSh6cNqQezBQchzISreqJQeT0hS1LppnZmWHHdUlI=;
 b=XXUtAHTC4RZgzVYR0ft3iuiXfVXKkkAI+H70wLq8OuVUums7Y/YtknPOX7HaBqNcUk
 fFoNE+vGsS2JLjIXGLB98bPSSlC1FRiogiPVQTXgAZD43gBLom4HcXyZlWUcw6KxHKqn
 QrTsOnYb8izyJGvn4hFO/HW0Alts81ONyeda3lQM/wskDL/TPfENill+6K0iovbNSBoo
 DrEEkymVgdeb8mO9oNDylnlqzRUiRK5EH009BdK6AOdW9HHKytDu+Ua1QT4uIOxJk6kJ
 rjviOtCOHwTebfNWtHRKwHLDRph73v/hCKWkHBW+mjB5Xb+HPTjcuB0/zemtW2h8TlIJ
 xd1Q==
X-Gm-Message-State: AJIora+szOiR+AaNeNJ/DNu+hmGW358VhT13gupGevbBzugDpHnuUiBf
 YCisLe4axciobecNapGCSPe6LpmLXoLVgCu6zoYeRdUkqQqBAaywG9JgXdMl9YxkvkqRvZYLhjG
 E1hqGgMUQdCaAmof5S39ubJkla+wPKqQg9zby7lb4KDYoqROQ/PvgsoZrTTakpzr6bKk=
X-Received: by 2002:aa7:cf87:0:b0:435:65c0:f59b with SMTP id
 z7-20020aa7cf87000000b0043565c0f59bmr23402596edx.214.1655797912262; 
 Tue, 21 Jun 2022 00:51:52 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1sdVwgECOHfxX3fYdKLqikmHAwqIOa3mcT0puLMuzxghP6Hdjq/YMGFUzy4RBvxePdoKezUUQ==
X-Received: by 2002:aa7:cf87:0:b0:435:65c0:f59b with SMTP id
 z7-20020aa7cf87000000b0043565c0f59bmr23402572edx.214.1655797911908; 
 Tue, 21 Jun 2022 00:51:51 -0700 (PDT)
Received: from goa-sendmail ([93.56.169.184]) by smtp.gmail.com with ESMTPSA id
 h5-20020a17090634c500b007041e969a8asm7050405ejb.97.2022.06.21.00.51.50
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Jun 2022 00:51:50 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 1/6] pc-bios/optionrom: use -m16 unconditionally
Date: Tue, 21 Jun 2022 09:51:42 +0200
Message-Id: <20220621075147.36297-2-pbonzini@redhat.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220621075147.36297-1-pbonzini@redhat.com>
References: <20220621075147.36297-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
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

Remove support for .code16gcc, all supported platforms have -m16.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 pc-bios/optionrom/Makefile    | 15 +--------------
 pc-bios/optionrom/code16gcc.h |  3 ---
 2 files changed, 1 insertion(+), 17 deletions(-)
 delete mode 100644 pc-bios/optionrom/code16gcc.h

diff --git a/pc-bios/optionrom/Makefile b/pc-bios/optionrom/Makefile
index f639915b4f..ea89ce9d59 100644
--- a/pc-bios/optionrom/Makefile
+++ b/pc-bios/optionrom/Makefile
@@ -11,7 +11,7 @@ CFLAGS = -O2 -g
 quiet-command = $(if $(V),$1,$(if $(2),@printf "  %-7s %s\n" $2 $3 && $1, @$1))
 cc-option = $(if $(shell $(CC) $1 -c -o /dev/null -xc /dev/null >/dev/null 2>&1 && echo OK), $1, $2)
 
-override CFLAGS += -march=i486 -Wall
+override CFLAGS += -march=i486 -Wall -m16
 
 # If -fcf-protection is enabled in flags or compiler defaults that will
 # conflict with -march=i486
@@ -24,21 +24,8 @@ override CFLAGS += $(filter -W%, $(QEMU_CFLAGS))
 override CFLAGS += $(call cc-option, -fno-pie)
 override CFLAGS += -ffreestanding -I$(TOPSRC_DIR)/include
 override CFLAGS += $(call cc-option, -fno-stack-protector)
-override CFLAGS += $(call cc-option, -m16)
 override CFLAGS += $(call cc-option, -Wno-array-bounds)
 
-ifeq ($(filter -m16, $(CFLAGS)),)
-# Attempt to work around compilers that lack -m16 (GCC <= 4.8, clang <= ??)
-# On GCC we add -fno-toplevel-reorder to keep the order of asm blocks with
-# respect to the rest of the code.  clang does not have -fno-toplevel-reorder,
-# but it places all asm blocks at the beginning and we're relying on it for
-# the option ROM header.  So just force clang not to use the integrated
-# assembler, which doesn't support .code16gcc.
-override CFLAGS += $(call cc-option, -fno-toplevel-reorder)
-override CFLAGS += $(call cc-option, -no-integrated-as)
-override CFLAGS += -m32 -include $(SRC_DIR)/code16gcc.h
-endif
-
 Wa = -Wa,
 override ASFLAGS += -32
 override CFLAGS += $(call cc-option, $(Wa)-32)
diff --git a/pc-bios/optionrom/code16gcc.h b/pc-bios/optionrom/code16gcc.h
deleted file mode 100644
index 9c8d25d508..0000000000
--- a/pc-bios/optionrom/code16gcc.h
+++ /dev/null
@@ -1,3 +0,0 @@
-asm(
-".code16gcc\n"
-);
-- 
2.36.1



