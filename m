Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C2939529E97
	for <lists+qemu-devel@lfdr.de>; Tue, 17 May 2022 11:59:03 +0200 (CEST)
Received: from localhost ([::1]:38114 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nqtyo-00064X-Kq
	for lists+qemu-devel@lfdr.de; Tue, 17 May 2022 05:59:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37570)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1nqtTt-0000QR-OA
 for qemu-devel@nongnu.org; Tue, 17 May 2022 05:27:05 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:49581)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1nqtTq-0003gx-40
 for qemu-devel@nongnu.org; Tue, 17 May 2022 05:27:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1652779620;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=JrXD//V5I3q5ZpCcSAAEzk/phgDCwoYvKRUuM1qPtFw=;
 b=JN2dKDlI9quTc06Pi+Xsp1sNisL7UqGEOoAlVXNfhuYUor7KIGwtgY2vHTGWPLkYpzpRIi
 NiGzshwfD/A95buxz0JNDg/rMTQvZYIO59kkxUDBZvN2/ZJsPKJdKtIb1K5bpNxwVF82YP
 Lq3FKi9TNfvmtI745nYPoZ9nzvrIN1Q=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-241-P_oT4FKZNBSPmo_Lh2tRtw-1; Tue, 17 May 2022 05:26:56 -0400
X-MC-Unique: P_oT4FKZNBSPmo_Lh2tRtw-1
Received: by mail-ej1-f70.google.com with SMTP id
 ga27-20020a1709070c1b00b006f43c161da4so7064994ejc.7
 for <qemu-devel@nongnu.org>; Tue, 17 May 2022 02:26:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=JrXD//V5I3q5ZpCcSAAEzk/phgDCwoYvKRUuM1qPtFw=;
 b=CeTKfgm+qP/SOcl+MBqLTA+ohLZhrwxQ+Cpy8bFiWqfQofLqGgYQW+yBRMicY9ZaLZ
 zaNpLQVtkGNyjI42eSi/nAZy6BQd/ZRkngzlVBqi32NHbq6G7qjmZ/vb0YR7GUcLp0Yo
 Fi6QgdWZSRQCIlwIYfO5YKh3aZjy8BNsRVzm43yjrnVRC8AoNHJenNZGIDqg0c16DfCN
 ZYCNq3gh3Y86g2zz0lESNQGZ9vlYdWDRIKCSUlMWpwQZxcie33HDwo6xBSU+01FyjOrV
 6GHUkauROu4DPMahirCtX5T9pqCpIf+OdfOwKCO1xDmlzd4hwcPD+/7c1rf5AOTdy3CX
 S5KQ==
X-Gm-Message-State: AOAM533SCLmwzOO2iMh9fPYmB96dhSe3bvRDmVQlbltsyuZukptHZ8CP
 wQTF3sWJJjS4fntgJJq9A3azHc914mKH+L8+Ye8zZO73qPtV6KT14AJpRPckh2sLFU4KEQvBcbo
 nSf8ykBtneBqBzzRPTJEyE2Hrlc7FWrY/idTffA+f9zFJqaR0whAchLFrmJbTML8dIX4=
X-Received: by 2002:a05:6402:908:b0:428:11f5:509d with SMTP id
 g8-20020a056402090800b0042811f5509dmr17883335edz.253.1652779615363; 
 Tue, 17 May 2022 02:26:55 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyjCRhfh1oZMj5ErVfR8Qy7akRVLbkqkrbHG1mZNY5VBIbXvcxdj/VPlho/6eBKyikwQBR6/A==
X-Received: by 2002:a05:6402:908:b0:428:11f5:509d with SMTP id
 g8-20020a056402090800b0042811f5509dmr17883312edz.253.1652779615072; 
 Tue, 17 May 2022 02:26:55 -0700 (PDT)
Received: from [192.168.10.118] ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id
 hf15-20020a1709072c4f00b006f3ef214e76sm769286ejc.220.2022.05.17.02.26.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 17 May 2022 02:26:54 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: alex.bennee@linaro.org,
	richard.henderson@linaro.org
Subject: [PATCH 15/16] configure: enable cross compilation of vof
Date: Tue, 17 May 2022 11:26:15 +0200
Message-Id: <20220517092616.1272238-16-pbonzini@redhat.com>
X-Mailer: git-send-email 2.36.0
In-Reply-To: <20220517092616.1272238-1-pbonzini@redhat.com>
References: <20220517092616.1272238-1-pbonzini@redhat.com>
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

While container-based cross compilers are not supported, this already
makes it possible to build vof on any machine that has an installation
of GCC and binutils for 32- or 64-bit PowerPC.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 configure            | 10 ++++++++++
 pc-bios/vof/Makefile | 17 +++++++++--------
 2 files changed, 19 insertions(+), 8 deletions(-)

diff --git a/configure b/configure
index a6363f3331..5b7b4e2cca 100755
--- a/configure
+++ b/configure
@@ -2227,6 +2227,7 @@ LINKS="Makefile"
 LINKS="$LINKS tests/tcg/Makefile.target"
 LINKS="$LINKS pc-bios/optionrom/Makefile"
 LINKS="$LINKS pc-bios/s390-ccw/Makefile"
+LINKS="$LINKS pc-bios/vof/Makefile"
 LINKS="$LINKS .gdbinit scripts" # scripts needed by relative path in .gdbinit
 LINKS="$LINKS tests/avocado tests/data"
 LINKS="$LINKS tests/qemu-iotests/check"
@@ -2264,6 +2265,15 @@ if test -n "$target_cc" &&
     fi
 fi
 
+probe_target_compilers ppc ppc64
+if test -n "$target_cc" && test "$softmmu" = yes; then
+    roms="$roms vof"
+    config_mak=pc-bios/vof/config.mak
+    echo "# Automatically generated by configure - do not modify" > $config_mak
+    echo "SRC_DIR=$source_path/pc-bios/vof" >> $config_mak
+    write_target_makefile >> $config_mak
+fi
+
 # Only build s390-ccw bios if the compiler has -march=z900 or -march=z10
 # (which is the lowest architecture level that Clang supports)
 probe_target_compiler s390x
diff --git a/pc-bios/vof/Makefile b/pc-bios/vof/Makefile
index aa1678c4d8..391ac0d600 100644
--- a/pc-bios/vof/Makefile
+++ b/pc-bios/vof/Makefile
@@ -1,11 +1,10 @@
-all: build-all
+include config.mak
+VPATH=$(SRC_DIR)
+all: vof.bin
 
-build-all: vof.bin
-
-CROSS ?=
-CC = $(CROSS)gcc
-LD = $(CROSS)ld
-OBJCOPY = $(CROSS)objcopy
+CC ?= $(CROSS)gcc
+LD ?= $(CROSS)ld
+OBJCOPY ?= $(CROSS)objcopy
 
 %.o: %.S
 	$(CC) -m32 -mbig-endian -mcpu=power4 -c -o $@ $<
@@ -14,10 +13,12 @@ OBJCOPY = $(CROSS)objcopy
 	$(CC) -m32 -mbig-endian -mcpu=power4 -c -fno-stack-protector -o $@ $<
 
 vof.elf: entry.o main.o ci.o bootmem.o libc.o
-	$(LD) -nostdlib -e_start -Tvof.lds -EB -o $@ $^
+	$(LD) -nostdlib -e_start -T$(SRC_DIR)/vof.lds -EB -o $@ $^
 
 %.bin: %.elf
 	$(OBJCOPY) -O binary -j .text -j .data -j .toc -j .got2 $^ $@
 
 clean:
 	rm -f *.o vof.bin vof.elf *~
+
+.PHONY: all clean
-- 
2.36.0


