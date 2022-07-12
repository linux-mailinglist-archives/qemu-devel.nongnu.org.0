Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CD557571A9D
	for <lists+qemu-devel@lfdr.de>; Tue, 12 Jul 2022 14:57:51 +0200 (CEST)
Received: from localhost ([::1]:42424 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oBFSY-0005qw-W7
	for lists+qemu-devel@lfdr.de; Tue, 12 Jul 2022 08:57:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51892)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oBFLF-00036z-Hb
 for qemu-devel@nongnu.org; Tue, 12 Jul 2022 08:50:18 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:52003)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oBFL9-0001RJ-Fe
 for qemu-devel@nongnu.org; Tue, 12 Jul 2022 08:50:12 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1657630210;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=UGi9+Bh2Lb6sfY2xhgQtU5dM27OLDajFSLGUA3UZW3Y=;
 b=By1kN52PnRGOkTpnMUrU2CaEDLWvdKhgGa7Il1gyWM2Ub3N/yqZSbTC+ngLjkfCpUyT34D
 iHqQmVvjW60x23L22yhPanTJY5XncQKgtFgdM7V5Kjz7lF3a8sZ1UK7O2KzHqAyov7hR+s
 vAn+ygJNo2MS0mc5/2oXtyI3z2swJQU=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-306-1OZJAQ9FNS6t136z5_qTjw-1; Tue, 12 Jul 2022 08:50:09 -0400
X-MC-Unique: 1OZJAQ9FNS6t136z5_qTjw-1
Received: by mail-ed1-f71.google.com with SMTP id
 b15-20020a056402278f00b0043acaf76f8dso4733575ede.21
 for <qemu-devel@nongnu.org>; Tue, 12 Jul 2022 05:50:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=UGi9+Bh2Lb6sfY2xhgQtU5dM27OLDajFSLGUA3UZW3Y=;
 b=mtFBDvdPsedr2MfUNrKF8Gx+cGNgSzdXKlFtmwUYP2cB445D56qxVcQfBmtwWL+Fdk
 QIR9slCFC4vpcDdTrtkJr3IQfKD1VQHPItF5/XMrmAI/9xKK1JtjPSQqcHmtor9N1JOV
 zlQ9FE5dco0gUENQ5VsNg/Y2bLoHSne8QEknZNjv55oD5UNyHAwLb9szzpKMw7OIW4qZ
 WUH8BoatsWy9oNBKNfE92iOo0/MB52b3lV5J9CNaoMX4Klon/EHgGwJEnbBHJ2tRw/6I
 tptt4juLsMXpj4Xla6OPf1K/6ModH0tN0tmURrW7fTYFtBZdKhdx0e0fnn50tAxEQm+C
 x4hg==
X-Gm-Message-State: AJIora+nZxXMPb/G8opckATQgjtkQxHzjyQsKF/ZO6JiMJYz+4tmGMk+
 w/8y1kLO0kS0v3PK/wfp8sD6EHVVKpRXdRIGoNEhUUwbx+Rr15lKDSKXGNHqmQZtrVuUCvYzjzN
 jdriCd0QMokT+hIy1+5tk7vE8dFlOq/Gfu7/nUX7CwOGzg5b/03Zu3gufUtXpvvzdNQE=
X-Received: by 2002:a05:6402:388e:b0:43a:d5ff:60f0 with SMTP id
 fd14-20020a056402388e00b0043ad5ff60f0mr13381330edb.152.1657630208307; 
 Tue, 12 Jul 2022 05:50:08 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1uysj8eeoQgZFTrqGdSM9dHtrDqtEKloGuVtw9cxYh5JdisTf6GB4puFjg9w7NptERi+Ws/PQ==
X-Received: by 2002:a05:6402:388e:b0:43a:d5ff:60f0 with SMTP id
 fd14-20020a056402388e00b0043ad5ff60f0mr13381290edb.152.1657630207928; 
 Tue, 12 Jul 2022 05:50:07 -0700 (PDT)
Received: from goa-sendmail ([93.56.169.184]) by smtp.gmail.com with ESMTPSA id
 u1-20020a1709061da100b006fe8c831632sm100271ejh.73.2022.07.12.05.50.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 12 Jul 2022 05:50:07 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: Thomas Huth <thuth@redhat.com>
Subject: [PULL 05/18] configure, pc-bios/s390-ccw: pass cross CFLAGS correctly
Date: Tue, 12 Jul 2022 14:49:43 +0200
Message-Id: <20220712124956.150451-6-pbonzini@redhat.com>
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

QEMU_CFLAGS is not available in pc-bios/s390-ccw/netboot.mak, but the Makefile
needs to access the flags passed to the configure script for the s390x
cross compiler.  Fix everything and rename QEMU_CFLAGS to EXTRA_CFLAGS for
consistency with tests/tcg.

Reviewed-by: Thomas Huth <thuth@redhat.com>
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



