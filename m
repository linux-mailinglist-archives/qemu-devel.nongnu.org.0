Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BAD9D5A1C87
	for <lists+qemu-devel@lfdr.de>; Fri, 26 Aug 2022 00:39:53 +0200 (CEST)
Received: from localhost ([::1]:60492 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oRLVt-000478-Lw
	for lists+qemu-devel@lfdr.de; Thu, 25 Aug 2022 18:39:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33576)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oRLKQ-00021C-4l
 for qemu-devel@nongnu.org; Thu, 25 Aug 2022 18:27:58 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:25528)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oRLKL-0004X0-Cv
 for qemu-devel@nongnu.org; Thu, 25 Aug 2022 18:27:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1661466472;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Xw29Iw/1yauPJXfMBpQZGneGqDe7WWUiCyxRRpeaqI4=;
 b=DwIuIucppAuFzs8bPN4hDkqI9nQEf7FQpNuW0Xtd6flUP8AID5u451Tw1Af4EOxaNHVk1G
 FQ619iuh66B1Tjk4xjnL9ASqx44r3UjvN3wxh336KOorTnU0/68SuqmYOdM+2ou0fXC81a
 Cd/VEhYd/3a3MbZ0+hLAbqO569q7NTA=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-612-fG2trGyjOYCsIKMGGjL6xA-1; Thu, 25 Aug 2022 18:27:51 -0400
X-MC-Unique: fG2trGyjOYCsIKMGGjL6xA-1
Received: by mail-wr1-f69.google.com with SMTP id
 v17-20020adfa1d1000000b0022574d4574aso1087404wrv.22
 for <qemu-devel@nongnu.org>; Thu, 25 Aug 2022 15:27:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=Xw29Iw/1yauPJXfMBpQZGneGqDe7WWUiCyxRRpeaqI4=;
 b=w8IDlkzvZseedk7v6HW3Ew7pAs4bpIbXDxGSUXvaSrYEey+UB92QaSjKcnj06VSBCV
 1Ja/fTw58/cunULXeITrU85dT8e7Y/I00au9Jb1J08TLgMKMHgjdTMdMGYOEY0ZPOUIS
 NhSCsfhHIFJPp33JlyQWm49thIFzK20NeZ6LB/4u7oQ7vho/xyEqLtucMiwYBCRQvPu4
 cLdQy/uSe3OAPDxEJPs9EnZl/TXj1sVdTfTU4n9EGqk+uwCl+pqyM9ytoqQlIvvSFmRl
 7IPQo0Vjvk9pXX/sNnhr9oTpYLvSunMaWUlnfpb+kR4Kgs1SgCiQdFddISz1ctWC7rpS
 jqyQ==
X-Gm-Message-State: ACgBeo1BFUC21Jy5cEPzY4xEl26aH5tkQoi+n5BEuiD7mwEZjm0oq+Hj
 NErMc3lchgv4KKzkIdoy4BpEKhnokPxjgBjlmwqzRPqLVT5m6J20W89cUXIJNpU7kUTKJvqDHQL
 JBor4HaoStBvjszmqYB5VupChvGbKH+bEfQnlRcTAVP++BRV/AfKoNX6SRdGELSUw7Lc=
X-Received: by 2002:a5d:595f:0:b0:225:84b4:787f with SMTP id
 e31-20020a5d595f000000b0022584b4787fmr2143758wri.535.1661466469947; 
 Thu, 25 Aug 2022 15:27:49 -0700 (PDT)
X-Google-Smtp-Source: AA6agR4P9DbymYBVpqHTQXU4/fCCMcqfPEaYK6VUafoMP/2hvVflYr3jxHwKXy0Wz2EQpMk/dKC39A==
X-Received: by 2002:a5d:595f:0:b0:225:84b4:787f with SMTP id
 e31-20020a5d595f000000b0022584b4787fmr2143750wri.535.1661466469672; 
 Thu, 25 Aug 2022 15:27:49 -0700 (PDT)
Received: from goa-sendmail ([2001:b07:6468:f312:9af8:e5f5:7516:fa89])
 by smtp.gmail.com with ESMTPSA id
 v8-20020a05600c214800b003a540fef440sm7128540wml.1.2022.08.25.15.27.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 25 Aug 2022 15:27:49 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: alex.bennee@linaro.org
Subject: [PATCH 02/20] pc-bios/optionrom: detect CC options just once
Date: Fri, 26 Aug 2022 00:27:27 +0200
Message-Id: <20220825222745.38779-3-pbonzini@redhat.com>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20220825222745.38779-1-pbonzini@redhat.com>
References: <20220825222745.38779-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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

In preparation for adding Docker container support, detect compiler options
just once rather than once per Make run; container startup overhead is
substantial and doing the detection just once makes things faster.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 pc-bios/optionrom/Makefile | 37 +++++++++++++++++++++++++------------
 1 file changed, 25 insertions(+), 12 deletions(-)

diff --git a/pc-bios/optionrom/Makefile b/pc-bios/optionrom/Makefile
index 3e06c11dea..f514e4f84b 100644
--- a/pc-bios/optionrom/Makefile
+++ b/pc-bios/optionrom/Makefile
@@ -8,23 +8,33 @@ all: multiboot.bin multiboot_dma.bin linuxboot.bin linuxboot_dma.bin kvmvapic.bi
 
 CFLAGS = -O2 -g
 
+NULL :=
+SPACE := $(NULL) #
+TARGET_PREFIX := $(patsubst %/,%:$(SPACE),$(TARGET_DIR))
+
+quiet-@ = $(if $(V),,@)
 quiet-command = $(if $(V),$1,$(if $(2),@printf "  %-7s %s\n" $2 $3 && $1, @$1))
-cc-option = $(if $(shell $(CC) $1 -c -o /dev/null -xc /dev/null >/dev/null 2>&1 && echo OK), $1, $2)
-
-override CFLAGS += -march=i486 -Wall $(EXTRA_CFLAGS) -m16
-
-# If -fcf-protection is enabled in flags or compiler defaults that will
-# conflict with -march=i486
-override CFLAGS += $(call cc-option, -fcf-protection=none)
 
 # Flags for dependency generation
 override CPPFLAGS += -MMD -MP -MT $@ -MF $(@D)/$(*F).d
 
-override CFLAGS += $(call cc-option, -fno-pie)
-override CFLAGS += $(call cc-option, -no-pie)
+override CFLAGS += -march=i486 -Wall $(EXTRA_CFLAGS) -m16
 override CFLAGS += -ffreestanding -I$(TOPSRC_DIR)/include
-override CFLAGS += $(call cc-option, -fno-stack-protector)
-override CFLAGS += $(call cc-option, -Wno-array-bounds)
+
+cc-test = $(CC) -Werror $1 -c -o /dev/null -xc /dev/null >/dev/null 2>/dev/null
+cc-option = if $(call cc-test, $1); then \
+    echo "$(TARGET_PREFIX)$1 detected" && echo "override CFLAGS += $1" >&3; else \
+    echo "$(TARGET_PREFIX)$1 not detected" $(if $2,&& echo "override CFLAGS += $2" >&3); fi
+
+# If -fcf-protection is enabled in flags or compiler defaults that will
+# conflict with -march=i486
+config-cc.mak: Makefile
+	$(quiet-@)($(call cc-option,-fcf-protection=none); \
+	    $(call cc-option,-fno-pie); \
+	    $(call cc-option,-no-pie); \
+	    $(call cc-option,-fno-stack-protector); \
+	    $(call cc-option,-Wno-array-bounds)) 3> config-cc.mak
+-include config-cc.mak
 
 override LDFLAGS = -nostdlib -Wl,-T,$(SRC_DIR)/flat.lds
 
@@ -50,7 +60,10 @@ include $(wildcard *.d)
 clean:
 	rm -f *.o *.d *.raw *.img *.bin *~
 
+distclean:
+	rm -f config-cc.mak
+
 # suppress auto-removal of intermediate files
 .SECONDARY:
 
-.PHONY: all clean
+.PHONY: all clean distclean
-- 
2.37.1



