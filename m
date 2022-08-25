Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A7F845A1CD5
	for <lists+qemu-devel@lfdr.de>; Fri, 26 Aug 2022 00:57:52 +0200 (CEST)
Received: from localhost ([::1]:44794 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oRLnK-00086W-0z
	for lists+qemu-devel@lfdr.de; Thu, 25 Aug 2022 18:57:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37024)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oRLKn-0003AE-Hw
 for qemu-devel@nongnu.org; Thu, 25 Aug 2022 18:28:21 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:24046)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oRLKk-0004ge-Qf
 for qemu-devel@nongnu.org; Thu, 25 Aug 2022 18:28:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1661466498;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=XOKxYYPBSkloAcuTQPuQImfWnjQdArRssDAfhNfGFcQ=;
 b=b0qNHONEGiIi0Bd2UFjMLU/9gvpMevB7PIAuBw0vqV30UnZC0pilLzAe0KXTDSoOR4snlp
 iH3ZMOdeR+/KqZl5yaXrHTocpzFmOgD8WKDx/UN7CNDOSEGstat9RfePjkytKMS+OHFMjy
 5qtJAi/J9rV0pGYnpmaUMBjWUWtTcEk=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-658-h2qHtah9OvGr0hPUzFtjtQ-1; Thu, 25 Aug 2022 18:28:17 -0400
X-MC-Unique: h2qHtah9OvGr0hPUzFtjtQ-1
Received: by mail-wm1-f70.google.com with SMTP id
 j3-20020a05600c1c0300b003a5e72421c2so2995095wms.1
 for <qemu-devel@nongnu.org>; Thu, 25 Aug 2022 15:28:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=XOKxYYPBSkloAcuTQPuQImfWnjQdArRssDAfhNfGFcQ=;
 b=Zi8BdxbyTIg+CaupzNyp6cTHKZZWz9vYMvhkZ8eyHS8xqK/gzoSnPkvDy6Lbnvu5fV
 XKiJF74ucCFEFqgOklhuL/tphmLgQkifCJai68XQlef0zYFpadvy98oWKKJq8RT61Ije
 4oYbyaYBW8nvOHV1KkvQHOpGnHMeGpaQT9jZVwKqk5lBzgBe04EK0eRi5tzhYRshmBzW
 dbkdBONNgqQvM94CeNFV4vTLQAm42iI1kL6mXrX/3npkVjAIez4mmbLJxjWfzvlejD1J
 0NCshCqpeAmFkwaYnxh9hxn4XYD1fI+/wI/s4aimin2C6Wvcwc3/0F3duSZlLo9lW8li
 YavA==
X-Gm-Message-State: ACgBeo0ISMgydByfyua0/6Qs7Ko/ODxnqkm/mbRq0K36BUr2pRNEWQR2
 3EzEqV9DuYaytw/4ozHxK/WbHOeoXsakJx5trk6+3SvIUmBbzBnNlh7YXoGuz8UtLsB4gEJhN42
 mKs7CSL1C472bwSR45TfCftGpmakovdWxMi4R7yV20WkBdgOb42E5/15okjua9mVi2QM=
X-Received: by 2002:a5d:64cf:0:b0:220:6d8e:1db0 with SMTP id
 f15-20020a5d64cf000000b002206d8e1db0mr3233067wri.564.1661466495632; 
 Thu, 25 Aug 2022 15:28:15 -0700 (PDT)
X-Google-Smtp-Source: AA6agR4soURnkOMfr89v7Vw103ABOVDThyq+KvZXHrq4pcJE0PW0BbtthKfAPwVXiOgmVIlKFgL6SA==
X-Received: by 2002:a5d:64cf:0:b0:220:6d8e:1db0 with SMTP id
 f15-20020a5d64cf000000b002206d8e1db0mr3233055wri.564.1661466495232; 
 Thu, 25 Aug 2022 15:28:15 -0700 (PDT)
Received: from goa-sendmail ([93.56.160.208]) by smtp.gmail.com with ESMTPSA id
 c7-20020a05600c0ac700b003a5ee64cc98sm6880888wmr.33.2022.08.25.15.28.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 25 Aug 2022 15:28:14 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: alex.bennee@linaro.org
Subject: [PATCH 19/20] pc-bios/s390-ccw: Adopt meson style Make output
Date: Fri, 26 Aug 2022 00:27:44 +0200
Message-Id: <20220825222745.38779-20-pbonzini@redhat.com>
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

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 pc-bios/s390-ccw/Makefile    | 12 ++++++------
 pc-bios/s390-ccw/netboot.mak | 20 ++++++++++----------
 2 files changed, 16 insertions(+), 16 deletions(-)

diff --git a/pc-bios/s390-ccw/Makefile b/pc-bios/s390-ccw/Makefile
index 965e633f43..10e8f5cb63 100644
--- a/pc-bios/s390-ccw/Makefile
+++ b/pc-bios/s390-ccw/Makefile
@@ -10,8 +10,8 @@ NULL :=
 SPACE := $(NULL) #
 TARGET_PREFIX := $(patsubst %/,%:$(SPACE),$(TARGET_DIR))
 
-quiet-@ = $(if $(V),,@)
-quiet-command = $(if $(V),$1,$(if $(2),@printf "  %-7s %s\n" $2 $3 && $1, @$1))
+quiet-@ = $(if $(V),,@$(if $1,printf "%s\n" "$(TARGET_PREFIX)$1" && ))
+quiet-command = $(call quiet-@,$2 $@)$1
 
 VPATH_SUFFIXES = %.c %.h %.S %.m %.mak %.sh %.rc Kconfig% %.json.in
 set-vpath = $(if $1,$(foreach PATTERN,$(VPATH_SUFFIXES),$(eval vpath $(PATTERN) $1)))
@@ -22,11 +22,11 @@ QEMU_DGFLAGS = -MMD -MP -MT $@ -MF $(@D)/$(*F).d
 
 %.o: %.c
 	$(call quiet-command,$(CC) $(EXTRA_CFLAGS) $(QEMU_DGFLAGS) $(CFLAGS) \
-	       -c -o $@ $<,"CC","$(TARGET_DIR)$@")
+	       -c -o $@ $<,Compiling)
 
 %.o: %.S
 	$(call quiet-command,$(CCAS) $(EXTRA_CFLAGS) $(QEMU_DGFLAGS) $(CFLAGS) \
-	       -c -o $@ $<,"CCAS","$(TARGET_DIR)$@")
+	       -c -o $@ $<,Assembling)
 
 .PHONY : all clean build-all distclean
 
@@ -58,10 +58,10 @@ LDFLAGS += -Wl,-pie -nostdlib
 build-all: s390-ccw.img s390-netboot.img
 
 s390-ccw.elf: $(OBJECTS)
-	$(call quiet-command,$(CC) $(LDFLAGS) -o $@ $(OBJECTS),"BUILD","$(TARGET_DIR)$@")
+	$(call quiet-command,$(CC) $(LDFLAGS) -o $@ $(OBJECTS),Linking)
 
 s390-ccw.img: s390-ccw.elf
-	$(call quiet-command,$(STRIP) --strip-unneeded $< -o $@,"STRIP","$(TARGET_DIR)$@")
+	$(call quiet-command,$(STRIP) --strip-unneeded $< -o $@,Stripping $< into)
 
 $(OBJECTS): Makefile
 
diff --git a/pc-bios/s390-ccw/netboot.mak b/pc-bios/s390-ccw/netboot.mak
index ee59a5f4de..046aa35587 100644
--- a/pc-bios/s390-ccw/netboot.mak
+++ b/pc-bios/s390-ccw/netboot.mak
@@ -11,10 +11,10 @@ NETLDFLAGS := $(LDFLAGS) -Wl,-Ttext=0x7800000
 $(NETOBJS): EXTRA_CFLAGS += $(LIBC_INC) $(LIBNET_INC)
 
 s390-netboot.elf: $(NETOBJS) libnet.a libc.a
-	$(call quiet-command,$(CC) $(NETLDFLAGS) -o $@ $^,"BUILD","$(TARGET_DIR)$@")
+	$(call quiet-command,$(CC) $(NETLDFLAGS) -o $@ $^,Linking)
 
 s390-netboot.img: s390-netboot.elf
-	$(call quiet-command,$(STRIP) --strip-unneeded $< -o $@,"STRIP","$(TARGET_DIR)$@")
+	$(call quiet-command,$(STRIP) --strip-unneeded $< -o $@,Stripping $< into)
 
 # libc files:
 
@@ -23,30 +23,30 @@ LIBC_CFLAGS = $(EXTRA_CFLAGS) $(CFLAGS) $(LIBC_INC) $(LIBNET_INC) \
 
 CTYPE_OBJS = isdigit.o isxdigit.o toupper.o
 %.o : $(SLOF_DIR)/lib/libc/ctype/%.c
-	$(call quiet-command,$(CC) $(LIBC_CFLAGS) -c -o $@ $<,"CC","$(TARGET_DIR)$@")
+	$(call quiet-command,$(CC) $(LIBC_CFLAGS) -c -o $@ $<,Compiling)
 
 STRING_OBJS = strcat.o strchr.o strrchr.o strcpy.o strlen.o strncpy.o \
 	      strcmp.o strncmp.o strcasecmp.o strncasecmp.o strstr.o \
 	      memset.o memcpy.o memmove.o memcmp.o
 %.o : $(SLOF_DIR)/lib/libc/string/%.c
-	$(call quiet-command,$(CC) $(LIBC_CFLAGS) -c -o $@ $<,"CC","$(TARGET_DIR)$@")
+	$(call quiet-command,$(CC) $(LIBC_CFLAGS) -c -o $@ $<,Compiling)
 
 STDLIB_OBJS = atoi.o atol.o strtoul.o strtol.o rand.o malloc.o free.o
 %.o : $(SLOF_DIR)/lib/libc/stdlib/%.c
-	$(call quiet-command,$(CC) $(LIBC_CFLAGS) -c -o $@ $<,"CC","$(TARGET_DIR)$@")
+	$(call quiet-command,$(CC) $(LIBC_CFLAGS) -c -o $@ $<,Compiling)
 
 STDIO_OBJS = sprintf.o snprintf.o vfprintf.o vsnprintf.o vsprintf.o fprintf.o \
 	     printf.o putc.o puts.o putchar.o stdchnls.o fileno.o
 %.o : $(SLOF_DIR)/lib/libc/stdio/%.c
-	$(call quiet-command,$(CC) $(LIBC_CFLAGS) -c -o $@ $<,"CC","$(TARGET_DIR)$@")
+	$(call quiet-command,$(CC) $(LIBC_CFLAGS) -c -o $@ $<,Compiling)
 
 sbrk.o: $(SLOF_DIR)/slof/sbrk.c
-	$(call quiet-command,$(CC) $(LIBC_CFLAGS) -c -o $@ $<,"CC","$(TARGET_DIR)$@")
+	$(call quiet-command,$(CC) $(LIBC_CFLAGS) -c -o $@ $<,Compiling)
 
 LIBCOBJS := $(STRING_OBJS) $(CTYPE_OBJS) $(STDLIB_OBJS) $(STDIO_OBJS) sbrk.o
 
 libc.a: $(LIBCOBJS)
-	$(call quiet-command,$(AR) -rc $@ $^,"AR","$(TARGET_DIR)$@")
+	$(call quiet-command,$(AR) -rc $@ $^,Creating static library)
 
 # libnet files:
 
@@ -56,7 +56,7 @@ LIBNETCFLAGS = $(EXTRA_CFLAGS) $(CFLAGS) $(LIBC_INC) $(LIBNET_INC) \
 	       -DDHCPARCH=0x1F -MMD -MP -MT $@ -MF $(@:%.o=%.d)
 
 %.o : $(SLOF_DIR)/lib/libnet/%.c
-	$(call quiet-command,$(CC) $(LIBNETCFLAGS) -c -o $@ $<,"CC","$(TARGET_DIR)$@")
+	$(call quiet-command,$(CC) $(LIBNETCFLAGS) -c -o $@ $<,Compiling)
 
 libnet.a: $(LIBNETOBJS)
-	$(call quiet-command,$(AR) -rc $@ $^,"AR","$(TARGET_DIR)$@")
+	$(call quiet-command,$(AR) -rc $@ $^,Creating static library)
-- 
2.37.1



