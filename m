Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D549552C71
	for <lists+qemu-devel@lfdr.de>; Tue, 21 Jun 2022 09:56:40 +0200 (CEST)
Received: from localhost ([::1]:47770 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o3YkY-0006dW-T0
	for lists+qemu-devel@lfdr.de; Tue, 21 Jun 2022 03:56:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44836)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1o3Yg6-00030T-Ud
 for qemu-devel@nongnu.org; Tue, 21 Jun 2022 03:52:02 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:37432)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1o3Yg3-0005v3-9T
 for qemu-devel@nongnu.org; Tue, 21 Jun 2022 03:52:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1655797918;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Pm+OaO7P0DHdX0xOLqNO9AxjhVX2HalJiFlLI/sz0ao=;
 b=Q+d0e3NdLZIqCYcjnS/zPgXVHjCRhoe7a2dVo9HHZ9yO5pquWOJuKDHWKUwhlsMpmDYcAM
 5cIadmJbZX8BL/cU6ZqZo6t9JwjCeKMGKlzOgUVJKh3i/RWEFDKvSMfQ2+sZZkli8/gH7t
 4R86Cp7G4SWDp78uo9eEWesYcBXWVDY=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-483-LDI5SDTTPfWZvtjvgFLv5g-1; Tue, 21 Jun 2022 03:51:57 -0400
X-MC-Unique: LDI5SDTTPfWZvtjvgFLv5g-1
Received: by mail-ed1-f69.google.com with SMTP id
 z4-20020a05640240c400b004358a7d5a1dso3000629edb.2
 for <qemu-devel@nongnu.org>; Tue, 21 Jun 2022 00:51:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Pm+OaO7P0DHdX0xOLqNO9AxjhVX2HalJiFlLI/sz0ao=;
 b=LeNPcyq49okWNDrvw2XY2tn3LAhoiHDaAePPCV1T6cOHr1/ktluTY/TS5iA9YnabZL
 brNUhlSy45L+6ldfUEN2JfVlXSWf3OWr1jd+5YDjTVsDLWsUU3o6f/Vg9Y3LKlwAruYl
 9vM11kN6dwV3nWaY39yS//1bnVInnh9L+26KO5a781nEjiEquD7V3+qflJviDOmeKco9
 +dTtVgWm+uKRQxFdCBuYxt3m8gfo0ORjWTT5rf0rrh++cGD3dFurm3LxkxAiVK9xZKPE
 Qeg4SvzHrwFpoQHjid5dw0jIRgBLoPshb/xiojIJpKj8PwEhqbGd5qDQ4jxwQDb4QkvQ
 Z3JA==
X-Gm-Message-State: AJIora+3FSIvFpdIVTg/VgMeVM/+KrFL3K3zV3cGw/ztMBbCaY0WwYWt
 jefdQRBr8SCPXcXKCc1pwIo/MPW2CeFrV+xksFoZJdMq+1oLxRnOIo6NmJMYjsamZYbQSi51QUy
 EthwZ5X1/uVGfLfIjEJCWh+Ff1VgX+j6Q/IpsJDO5EF/IxipbF0K923NfeKSm0j+TCT4=
X-Received: by 2002:a50:c8cd:0:b0:435:688d:6c59 with SMTP id
 k13-20020a50c8cd000000b00435688d6c59mr21626344edh.271.1655797915607; 
 Tue, 21 Jun 2022 00:51:55 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1tTEfcldqdZEdc4rHqxC74zriSUsEhWCC32/RfdH3TfwEEg9zPpu8OJCJdu8/aOBx6c75iFpg==
X-Received: by 2002:a50:c8cd:0:b0:435:688d:6c59 with SMTP id
 k13-20020a50c8cd000000b00435688d6c59mr21626315edh.271.1655797915238; 
 Tue, 21 Jun 2022 00:51:55 -0700 (PDT)
Received: from goa-sendmail ([93.56.169.184]) by smtp.gmail.com with ESMTPSA id
 w13-20020a056402268d00b004359202969esm1601924edd.4.2022.06.21.00.51.54
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Jun 2022 00:51:54 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 3/6] configure, pc-bios/s390-ccw: pass cross CFLAGS correctly
Date: Tue, 21 Jun 2022 09:51:44 +0200
Message-Id: <20220621075147.36297-4-pbonzini@redhat.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220621075147.36297-1-pbonzini@redhat.com>
References: <20220621075147.36297-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=pbonzini@redhat.com;
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

QEMU_CFLAGS is not available in pc-bios/s390-ccw/netboot.mak, but the Makefile
needs to access the flags passed to the configure script for the s390x
cross compiler.  Fix everything and rename QEMU_CFLAGS to EXTRA_CFLAGS for
consistency with tests/tcg.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 configure                    |  1 +
 pc-bios/s390-ccw/Makefile    | 20 ++++++++++----------
 pc-bios/s390-ccw/netboot.mak |  6 +++---
 3 files changed, 14 insertions(+), 13 deletions(-)

diff --git a/configure b/configure
index 3d00b361d7..bf9282e2a1 100755
--- a/configure
+++ b/configure
@@ -2290,6 +2290,7 @@ if test -n "$target_cc" && test "$softmmu" = yes; then
     config_mak=pc-bios/s390-ccw/config-host.mak
     echo "# Automatically generated by configure - do not modify" > $config_mak
     echo "SRC_PATH=$source_path/pc-bios/s390-ccw" >> $config_mak
+    echo "EXTRA_CFLAGS=$target_cflags" >> $config_mak
     write_target_makefile >> $config_mak
     # SLOF is required for building the s390-ccw firmware on s390x,
     # since it is using the libnet code from SLOF for network booting.
diff --git a/pc-bios/s390-ccw/Makefile b/pc-bios/s390-ccw/Makefile
index 6eb713bf37..26ad40f94e 100644
--- a/pc-bios/s390-ccw/Makefile
+++ b/pc-bios/s390-ccw/Makefile
@@ -18,11 +18,11 @@ $(call set-vpath, $(SRC_PATH))
 QEMU_DGFLAGS = -MMD -MP -MT $@ -MF $(@D)/$(*F).d
 
 %.o: %.c
-	$(call quiet-command,$(CC) $(QEMU_CFLAGS) $(QEMU_DGFLAGS) $(CFLAGS) \
+	$(call quiet-command,$(CC) $(EXTRA_CFLAGS) $(QEMU_DGFLAGS) $(CFLAGS) \
 	       -c -o $@ $<,"CC","$(TARGET_DIR)$@")
 
 %.o: %.S
-	$(call quiet-command,$(CCAS) $(QEMU_CFLAGS) $(QEMU_DGFLAGS) $(CFLAGS) \
+	$(call quiet-command,$(CCAS) $(EXTRA_CFLAGS) $(QEMU_DGFLAGS) $(CFLAGS) \
 	       -c -o $@ $<,"CCAS","$(TARGET_DIR)$@")
 
 .PHONY : all clean build-all
@@ -30,14 +30,14 @@ QEMU_DGFLAGS = -MMD -MP -MT $@ -MF $(@D)/$(*F).d
 OBJECTS = start.o main.o bootmap.o jump2ipl.o sclp.o menu.o \
 	  virtio.o virtio-scsi.o virtio-blkdev.o libc.o cio.o dasd-ipl.o
 
-QEMU_CFLAGS := -Wall $(filter -W%, $(QEMU_CFLAGS))
-QEMU_CFLAGS += $(call cc-option,-Werror $(QEMU_CFLAGS),-Wno-stringop-overflow)
-QEMU_CFLAGS += -ffreestanding -fno-delete-null-pointer-checks -fno-common -fPIE
-QEMU_CFLAGS += -fwrapv -fno-strict-aliasing -fno-asynchronous-unwind-tables
-QEMU_CFLAGS += $(call cc-option, $(QEMU_CFLAGS), -fno-stack-protector)
-QEMU_CFLAGS += -msoft-float
-QEMU_CFLAGS += $(call cc-option, $(QEMU_CFLAGS),-march=z900,-march=z10)
-QEMU_CFLAGS += -std=gnu99
+EXTRA_CFLAGS := $(EXTRA_CFLAGS) -Wall
+EXTRA_CFLAGS += $(call cc-option,-Werror $(EXTRA_CFLAGS),-Wno-stringop-overflow)
+EXTRA_CFLAGS += -ffreestanding -fno-delete-null-pointer-checks -fno-common -fPIE
+EXTRA_CFLAGS += -fwrapv -fno-strict-aliasing -fno-asynchronous-unwind-tables
+EXTRA_CFLAGS += $(call cc-option, $(EXTRA_CFLAGS), -fno-stack-protector)
+EXTRA_CFLAGS += -msoft-float
+EXTRA_CFLAGS += $(call cc-option, $(EXTRA_CFLAGS),-march=z900,-march=z10)
+EXTRA_CFLAGS += -std=gnu99
 LDFLAGS += -Wl,-pie -nostdlib
 
 build-all: s390-ccw.img s390-netboot.img
diff --git a/pc-bios/s390-ccw/netboot.mak b/pc-bios/s390-ccw/netboot.mak
index 1a06befa4b..ee59a5f4de 100644
--- a/pc-bios/s390-ccw/netboot.mak
+++ b/pc-bios/s390-ccw/netboot.mak
@@ -8,7 +8,7 @@ LIBNET_INC := -I$(SLOF_DIR)/lib/libnet
 
 NETLDFLAGS := $(LDFLAGS) -Wl,-Ttext=0x7800000
 
-$(NETOBJS): QEMU_CFLAGS += $(LIBC_INC) $(LIBNET_INC)
+$(NETOBJS): EXTRA_CFLAGS += $(LIBC_INC) $(LIBNET_INC)
 
 s390-netboot.elf: $(NETOBJS) libnet.a libc.a
 	$(call quiet-command,$(CC) $(NETLDFLAGS) -o $@ $^,"BUILD","$(TARGET_DIR)$@")
@@ -18,7 +18,7 @@ s390-netboot.img: s390-netboot.elf
 
 # libc files:
 
-LIBC_CFLAGS = $(QEMU_CFLAGS) $(CFLAGS) $(LIBC_INC) $(LIBNET_INC) \
+LIBC_CFLAGS = $(EXTRA_CFLAGS) $(CFLAGS) $(LIBC_INC) $(LIBNET_INC) \
 	      -MMD -MP -MT $@ -MF $(@:%.o=%.d)
 
 CTYPE_OBJS = isdigit.o isxdigit.o toupper.o
@@ -52,7 +52,7 @@ libc.a: $(LIBCOBJS)
 
 LIBNETOBJS := args.o dhcp.o dns.o icmpv6.o ipv6.o tcp.o udp.o bootp.o \
 	      dhcpv6.o ethernet.o ipv4.o ndp.o tftp.o pxelinux.o
-LIBNETCFLAGS = $(QEMU_CFLAGS) $(CFLAGS) $(LIBC_INC) $(LIBNET_INC) \
+LIBNETCFLAGS = $(EXTRA_CFLAGS) $(CFLAGS) $(LIBC_INC) $(LIBNET_INC) \
 	       -DDHCPARCH=0x1F -MMD -MP -MT $@ -MF $(@:%.o=%.d)
 
 %.o : $(SLOF_DIR)/lib/libnet/%.c
-- 
2.36.1



