Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F6F2571A8C
	for <lists+qemu-devel@lfdr.de>; Tue, 12 Jul 2022 14:54:04 +0200 (CEST)
Received: from localhost ([::1]:34482 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oBFOt-0000K5-Fc
	for lists+qemu-devel@lfdr.de; Tue, 12 Jul 2022 08:54:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51890)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oBFLF-00036y-H0
 for qemu-devel@nongnu.org; Tue, 12 Jul 2022 08:50:18 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:45596)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oBFL9-0001RD-32
 for qemu-devel@nongnu.org; Tue, 12 Jul 2022 08:50:12 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1657630210;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=fWki7fDQXi5B/Xr/+5WLHFaR3k7nJmfyFC3RmETDRPc=;
 b=Y6lioF7dQ1WF/Q/1cUec6yOpaKiyRE716twJcKb1YVBH/CZqKemt4NQsv2aW50fF2BptzI
 ViFaXTDXTA9Aw+WCSYn4u6gYAy7FC1W7EigcSaNFoK9nxZ7zrcPw+0MewBmSDTwc7WRZby
 rxJkj9v1Td87tGb9H9ipcSMb5fzLY7c=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-408-BFMUlnftP1O1AEe1mkqOUw-1; Tue, 12 Jul 2022 08:50:06 -0400
X-MC-Unique: BFMUlnftP1O1AEe1mkqOUw-1
Received: by mail-ed1-f72.google.com with SMTP id
 w13-20020a05640234cd00b0043a991fb3f3so6126704edc.3
 for <qemu-devel@nongnu.org>; Tue, 12 Jul 2022 05:50:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=fWki7fDQXi5B/Xr/+5WLHFaR3k7nJmfyFC3RmETDRPc=;
 b=GTCQLF0oKOAI2G4C6Aj6pVcj0fnmbUOa1V8XNFUocHIskcKBgWlqlsJD/gWoYG3gxM
 vuI6SXPZzcMZXJ4VAoVNcDzGsLM5hb2NgVKIqtlDbCCOT0jGtHdaTA1c98UgFaeMbSHi
 UDAJcTaX82/BRA8zAlWMGx3ffC82HXaohiwLO+6E3xCn/Viz0nEik6jIk1Cb9d1WhkKS
 K6Z5h5nCY/qAKbpLiHMmxOdWZNrCBFTgzAXkB3swzVWm5jzkwVgQGtGZ4Q0X7bu7t4Ct
 fpdKp6W4ULvAhi8G0nJasNcgCdYJ3OUTPuSuQb+R+LzcCBNue4fx4PpTWJcFyqvDyeqh
 REMw==
X-Gm-Message-State: AJIora8j/vMhNKyB9CkLJkzAlTR0662H/I2mBOed/bE6yQa9CUCIpYnX
 wZweGS9xBw6ml/i0DM25Nir9q1FM7vw3LUSKB05NqBOp3UsD8rKxr0EfmKViPJz75A6/E0bTrTy
 iOp+8D0tHPrh/cacNpuXeTCmNimUgWWWPdTZMKah3VbwvV24MuStvXE+PE4h0CFQSgQA=
X-Received: by 2002:a05:6402:26c3:b0:43a:a846:b2c1 with SMTP id
 x3-20020a05640226c300b0043aa846b2c1mr31935719edd.133.1657630205363; 
 Tue, 12 Jul 2022 05:50:05 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1tccPR0rrV5Ys2UjHI81MzUmOAgvwgBetzt/w/jMkE9nk6OQZJrAQHI7YqxM4d3+2MWeIyXVw==
X-Received: by 2002:a05:6402:26c3:b0:43a:a846:b2c1 with SMTP id
 x3-20020a05640226c300b0043aa846b2c1mr31935693edd.133.1657630205100; 
 Tue, 12 Jul 2022 05:50:05 -0700 (PDT)
Received: from goa-sendmail ([2001:b07:6468:f312:9af8:e5f5:7516:fa89])
 by smtp.gmail.com with ESMTPSA id
 g12-20020aa7d1cc000000b00435726bd375sm5988114edp.57.2022.07.12.05.50.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 12 Jul 2022 05:50:04 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>
Subject: [PULL 03/18] pc-bios/optionrom: use -m16 unconditionally
Date: Tue, 12 Jul 2022 14:49:41 +0200
Message-Id: <20220712124956.150451-4-pbonzini@redhat.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220712124956.150451-1-pbonzini@redhat.com>
References: <20220712124956.150451-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
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



