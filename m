Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 204395A1C5E
	for <lists+qemu-devel@lfdr.de>; Fri, 26 Aug 2022 00:30:59 +0200 (CEST)
Received: from localhost ([::1]:41902 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oRLNK-0007aR-5H
	for lists+qemu-devel@lfdr.de; Thu, 25 Aug 2022 18:30:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33578)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oRLKR-00024l-V6
 for qemu-devel@nongnu.org; Thu, 25 Aug 2022 18:28:00 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:32644)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oRLKP-0004XH-B3
 for qemu-devel@nongnu.org; Thu, 25 Aug 2022 18:27:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1661466474;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=gksUC/gkDfiOjlSSok1BuR6jt70jvD0KIu7FJtpNiMg=;
 b=NjhIYAYd1F1A9MfhOtetGWI8AVHyqL6ZZARHtMjH6jFYCbXAH62VVFWmPCfgDq0wFDwnwb
 HgWFxa4iPZs2872mWrCLAbfuhsKH5LEBbfQNPlKkt6p6NgOOrAt+DFF/9mkT85NPr1Qfpm
 axkPYCd1aMHOo/B4dxQKgWAYnHTdRpQ=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-219-wg7dqJ5EM6eXeorY3q3b6w-1; Thu, 25 Aug 2022 18:27:53 -0400
X-MC-Unique: wg7dqJ5EM6eXeorY3q3b6w-1
Received: by mail-wr1-f70.google.com with SMTP id
 i24-20020adfaad8000000b002251cb5e812so3708254wrc.14
 for <qemu-devel@nongnu.org>; Thu, 25 Aug 2022 15:27:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=gksUC/gkDfiOjlSSok1BuR6jt70jvD0KIu7FJtpNiMg=;
 b=E075eLzKZzrYUI7MImiwC/OG9xUep+e8KbRtWIaI20VlsR0yFZHABJjGD95K42OeDX
 IEJHTI4bsTdUuptHgC3Oea97RJEatkZJQchn+xxwNdPuk22GYwvuX084vcQDThT+3BzJ
 hPek4oRG6BWFeJcf5PcOk6hh4HNZaNDayLW9R1QXc1GcYc99P2j6EQsYDRaTfsNCj8C/
 oRk3RNWFAkRGEBPUUYwXhXj0AzJCKCDBPgPkNryTwnoCf5oYgtSEpRgCBPFFZU3eHnTm
 k3NbBa6pVvAxY1acVKYqZKfF6FyhR/9ESNirbmPqSTnjT8E/vseeIogdcSh7O+/E+qnR
 nVgw==
X-Gm-Message-State: ACgBeo0W7UcPRkNnLRUhe/BSy24/iFnvZgw5jARAksM+zqi8s2Sg65ch
 UsOkCWfjtgi261ngg/Xlgk7bEA8r4fPKJDAgGx9RiLdAUZpHRcVV5HnutRsz8LM1fbR2aV5CoGZ
 JPstJv5KBLIJSTI4LvzBHuX3BWYwfhvDlyer6ijSeKaExKpb2epjsR4Luh0Aa2PNn4/w=
X-Received: by 2002:a05:600c:1d14:b0:3a5:e8ba:f394 with SMTP id
 l20-20020a05600c1d1400b003a5e8baf394mr3427481wms.137.1661466471485; 
 Thu, 25 Aug 2022 15:27:51 -0700 (PDT)
X-Google-Smtp-Source: AA6agR56Zof3xFday1UoNrxd1aJhFqi/8Z9m5CynETb4jvNfSpRV1D1Y9lSpVi6xC+/C6QOUVnZaBw==
X-Received: by 2002:a05:600c:1d14:b0:3a5:e8ba:f394 with SMTP id
 l20-20020a05600c1d1400b003a5e8baf394mr3427469wms.137.1661466471136; 
 Thu, 25 Aug 2022 15:27:51 -0700 (PDT)
Received: from goa-sendmail ([2001:b07:6468:f312:9af8:e5f5:7516:fa89])
 by smtp.gmail.com with ESMTPSA id
 c132-20020a1c358a000000b003a5260b8392sm556531wma.23.2022.08.25.15.27.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 25 Aug 2022 15:27:50 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: alex.bennee@linaro.org
Subject: [PATCH 03/20] pc-bios/s390-ccw: detect CC options just once
Date: Fri, 26 Aug 2022 00:27:28 +0200
Message-Id: <20220825222745.38779-4-pbonzini@redhat.com>
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

In preparation for adding Docker container support, detect compiler options
just once rather than once per Make run; container startup overhead is
substantial and doing the detection just once makes things faster.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 pc-bios/s390-ccw/Makefile    | 33 +++++++++++++++++++++++++--------
 pc-bios/s390-ccw/netboot.mak |  7 ++-----
 2 files changed, 27 insertions(+), 13 deletions(-)

diff --git a/pc-bios/s390-ccw/Makefile b/pc-bios/s390-ccw/Makefile
index c8784c2a08..965e633f43 100644
--- a/pc-bios/s390-ccw/Makefile
+++ b/pc-bios/s390-ccw/Makefile
@@ -6,9 +6,12 @@ include config-host.mak
 CFLAGS = -O2 -g
 MAKEFLAGS += -rR
 
+NULL :=
+SPACE := $(NULL) #
+TARGET_PREFIX := $(patsubst %/,%:$(SPACE),$(TARGET_DIR))
+
+quiet-@ = $(if $(V),,@)
 quiet-command = $(if $(V),$1,$(if $(2),@printf "  %-7s %s\n" $2 $3 && $1, @$1))
-cc-option = $(if $(shell $(CC) $1 $2 -S -o /dev/null -xc /dev/null \
-			 >/dev/null 2>&1 && echo OK),$2,$3)
 
 VPATH_SUFFIXES = %.c %.h %.S %.m %.mak %.sh %.rc Kconfig% %.json.in
 set-vpath = $(if $1,$(foreach PATTERN,$(VPATH_SUFFIXES),$(eval vpath $(PATTERN) $1)))
@@ -25,22 +28,33 @@ QEMU_DGFLAGS = -MMD -MP -MT $@ -MF $(@D)/$(*F).d
 	$(call quiet-command,$(CCAS) $(EXTRA_CFLAGS) $(QEMU_DGFLAGS) $(CFLAGS) \
 	       -c -o $@ $<,"CCAS","$(TARGET_DIR)$@")
 
-.PHONY : all clean build-all
+.PHONY : all clean build-all distclean
 
 OBJECTS = start.o main.o bootmap.o jump2ipl.o sclp.o menu.o \
 	  virtio.o virtio-scsi.o virtio-blkdev.o libc.o cio.o dasd-ipl.o
 
-EXTRA_CFLAGS := $(EXTRA_CFLAGS) -Wall
-EXTRA_CFLAGS += $(call cc-option,-Werror $(EXTRA_CFLAGS),-Wno-stringop-overflow)
+EXTRA_CFLAGS += -Wall
 EXTRA_CFLAGS += -ffreestanding -fno-delete-null-pointer-checks -fno-common -fPIE
 EXTRA_CFLAGS += -fwrapv -fno-strict-aliasing -fno-asynchronous-unwind-tables
-EXTRA_CFLAGS += $(call cc-option, $(EXTRA_CFLAGS), -fno-stack-protector)
-EXTRA_CFLAGS += $(call cc-option, $(EXTRA_CFLAGS), -Wno-array-bounds)
 EXTRA_CFLAGS += -msoft-float
-EXTRA_CFLAGS += $(call cc-option, $(EXTRA_CFLAGS),-march=z900,-march=z10)
 EXTRA_CFLAGS += -std=gnu99
 LDFLAGS += -Wl,-pie -nostdlib
 
+cc-test = $(CC) -Werror $1 -c -o /dev/null -xc /dev/null >/dev/null 2>/dev/null
+cc-option = if $(call cc-test, $1); then \
+    echo "$(TARGET_PREFIX)$1 detected" && echo "EXTRA_CFLAGS += $1" >&3; else \
+    echo "$(TARGET_PREFIX)$1 not detected" $(if $2,&& echo "EXTRA_CFLAGS += $2" >&3); fi
+
+config-cc.mak: Makefile
+	$(quiet-@)($(call cc-option,-Wno-stringop-overflow); \
+	    $(call cc-option,-fno-stack-protector); \
+	    $(call cc-option,-Wno-array-bounds); \
+	    $(call cc-option,-Wno-gnu); \
+	    $(call cc-option,-march=z900,-march=z10)) 3> config-cc.mak
+-include config-cc.mak
+
+LDFLAGS += -Wl,-pie -nostdlib
+
 build-all: s390-ccw.img s390-netboot.img
 
 s390-ccw.elf: $(OBJECTS)
@@ -63,3 +77,6 @@ ALL_OBJS = $(sort $(OBJECTS) $(NETOBJS) $(LIBCOBJS) $(LIBNETOBJS))
 
 clean:
 	rm -f *.o *.d *.img *.elf *~ *.a
+
+distclean:
+	rm -f config-cc.mak
diff --git a/pc-bios/s390-ccw/netboot.mak b/pc-bios/s390-ccw/netboot.mak
index 7639da194c..ee59a5f4de 100644
--- a/pc-bios/s390-ccw/netboot.mak
+++ b/pc-bios/s390-ccw/netboot.mak
@@ -16,12 +16,9 @@ s390-netboot.elf: $(NETOBJS) libnet.a libc.a
 s390-netboot.img: s390-netboot.elf
 	$(call quiet-command,$(STRIP) --strip-unneeded $< -o $@,"STRIP","$(TARGET_DIR)$@")
 
-# SLOF is GCC-only, so ignore warnings about GNU extensions with Clang here
-NO_GNU_WARN := $(call cc-option,-Werror $(QEMU_CFLAGS),-Wno-gnu)
-
 # libc files:
 
-LIBC_CFLAGS = $(EXTRA_CFLAGS) $(CFLAGS) $(NO_GNU_WARN) $(LIBC_INC) $(LIBNET_INC) \
+LIBC_CFLAGS = $(EXTRA_CFLAGS) $(CFLAGS) $(LIBC_INC) $(LIBNET_INC) \
 	      -MMD -MP -MT $@ -MF $(@:%.o=%.d)
 
 CTYPE_OBJS = isdigit.o isxdigit.o toupper.o
@@ -55,7 +52,7 @@ libc.a: $(LIBCOBJS)
 
 LIBNETOBJS := args.o dhcp.o dns.o icmpv6.o ipv6.o tcp.o udp.o bootp.o \
 	      dhcpv6.o ethernet.o ipv4.o ndp.o tftp.o pxelinux.o
-LIBNETCFLAGS = $(EXTRA_CFLAGS) $(CFLAGS) $(NO_GNU_WARN) $(LIBC_INC) $(LIBNET_INC) \
+LIBNETCFLAGS = $(EXTRA_CFLAGS) $(CFLAGS) $(LIBC_INC) $(LIBNET_INC) \
 	       -DDHCPARCH=0x1F -MMD -MP -MT $@ -MF $(@:%.o=%.d)
 
 %.o : $(SLOF_DIR)/lib/libnet/%.c
-- 
2.37.1



