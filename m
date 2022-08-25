Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 18D875A1C7A
	for <lists+qemu-devel@lfdr.de>; Fri, 26 Aug 2022 00:35:58 +0200 (CEST)
Received: from localhost ([::1]:35284 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oRLS9-0004y4-77
	for lists+qemu-devel@lfdr.de; Thu, 25 Aug 2022 18:35:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45808)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oRLKO-0001y8-2y
 for qemu-devel@nongnu.org; Thu, 25 Aug 2022 18:27:56 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:56183)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oRLKJ-0004Wq-JO
 for qemu-devel@nongnu.org; Thu, 25 Aug 2022 18:27:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1661466470;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=we00pl6uFI6s6KErAO9rShYmGsZikrFFkAM/zaFcpS0=;
 b=JU4MuieoxJ46nSCP7CqVYv6z5hknAsHI+QVQVVOkCs0Cpjshb1NJXWP1ip077S7BmTvJVj
 dbUzNPbPd3xyg2JdddZT05Y08s3wblw7eA/5RhYmy+DHkMPtQPWfxiU0iZ2618guhgT6xQ
 vyxD6DjaJ2RcsYCF0BbASU9reAowYj8=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-648-bdPjPdz2PrOgQhP1UqA-lA-1; Thu, 25 Aug 2022 18:27:49 -0400
X-MC-Unique: bdPjPdz2PrOgQhP1UqA-lA-1
Received: by mail-wm1-f72.google.com with SMTP id
 j3-20020a05600c1c0300b003a5e72421c2so2994831wms.1
 for <qemu-devel@nongnu.org>; Thu, 25 Aug 2022 15:27:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=we00pl6uFI6s6KErAO9rShYmGsZikrFFkAM/zaFcpS0=;
 b=WmlCtS5152cYqvxHGR1x6ueCA1i25KjjXKIToYJi3FGGRom4Cr9wHcqZNafBVl+GvM
 GFy19aiXQRtF9q24/4gLirvkGDhBUpcw+RkB/nzZ3zXNfQ9WMhU+oZRJzReJEDJZcXWU
 x+HGdYGbcizkWRZB7dOEhyZgIjGUPT1wu4zV/bcuCPJ3MWf0/E0AKosLjyuiQo5DlDDk
 2/coaFUjeiZJFYNlaF6nKYcekGlBTcrEh9twu768pVq0GIXgfcOYquKfCEf8crlx20GI
 gCAZABG4llWK0HqM8crfn5J+xUhFHl/vc0tuQkl14FQibWpcMD3H4PVabe1HSpmV6Sqc
 ei6Q==
X-Gm-Message-State: ACgBeo1BxKuBpiwKa/WGnfKuO9nve67Ifqr3cF5jF4mEWQSaLiLNN7Lo
 qwSPn8d0+ZHeI+9V6A17osXwPM93avmKwq36bjsyzspP4w5ThlRuwPxmlWEbMj4+ywCYD5Pe6MK
 g4QNNm1XftIpupMFj0MO6cFA7YwzCv/Co2uzsHTT3qaDlGlIa9HC/FCpX0hAmsQ+z0g4=
X-Received: by 2002:a05:600c:34d2:b0:3a5:afe5:3eb5 with SMTP id
 d18-20020a05600c34d200b003a5afe53eb5mr9519269wmq.122.1661466468003; 
 Thu, 25 Aug 2022 15:27:48 -0700 (PDT)
X-Google-Smtp-Source: AA6agR7GhkNzPj5xtL7SqFv3XPxH3DatqMkz45H2nnOLrFDhfy9rFJN+YwM3+hooqRwsayDLNREjpw==
X-Received: by 2002:a05:600c:34d2:b0:3a5:afe5:3eb5 with SMTP id
 d18-20020a05600c34d200b003a5afe53eb5mr9519259wmq.122.1661466467646; 
 Thu, 25 Aug 2022 15:27:47 -0700 (PDT)
Received: from goa-sendmail ([2001:b07:6468:f312:9af8:e5f5:7516:fa89])
 by smtp.gmail.com with ESMTPSA id
 q3-20020adff943000000b0022377df817fsm333657wrr.58.2022.08.25.15.27.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 25 Aug 2022 15:27:47 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: alex.bennee@linaro.org
Subject: [PATCH 01/20] configure: do not invoke as/ld directly for
 pc-bios/optionrom
Date: Fri, 26 Aug 2022 00:27:26 +0200
Message-Id: <20220825222745.38779-2-pbonzini@redhat.com>
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

Just use using the compiler binary, with -nostdlib in the case of the
linker; the compiler driver (whether i686-*-gcc, or x86_64-*-gcc with
the -m32 option) will then pick the right magic option to as and ld.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 configure                  | 22 +++++-----------------
 pc-bios/optionrom/Makefile | 12 ++++--------
 2 files changed, 9 insertions(+), 25 deletions(-)

diff --git a/configure b/configure
index 72ab03f11a..c533eaada0 100755
--- a/configure
+++ b/configure
@@ -2332,23 +2332,11 @@ probe_target_compiler i386-softmmu
 if test -n "$target_cc" &&
         test "$targetos" != "darwin" && test "$targetos" != "sunos" && \
         test "$targetos" != "haiku" && test "$softmmu" = yes ; then
-    # Different host OS linkers have different ideas about the name of the ELF
-    # emulation. Linux and OpenBSD/amd64 use 'elf_i386'; FreeBSD uses the _fbsd
-    # variant; OpenBSD/i386 uses the _obsd variant; and Windows uses i386pe.
-    for emu in elf_i386 elf_i386_fbsd elf_i386_obsd i386pe; do
-        if "$target_ld" -verbose 2>&1 | grep -q "^[[:space:]]*${emu}[[:space:]]*$"; then
-            ld_i386_emulation="$emu"
-            break
-        fi
-    done
-    if test -n "$ld_i386_emulation"; then
-        roms="pc-bios/optionrom"
-        config_mak=pc-bios/optionrom/config.mak
-        echo "# Automatically generated by configure - do not modify" > $config_mak
-        echo "TOPSRC_DIR=$source_path" >> $config_mak
-        echo "LD_I386_EMULATION=$ld_i386_emulation" >> $config_mak
-        write_target_makefile >> $config_mak
-    fi
+    roms="pc-bios/optionrom"
+    config_mak=pc-bios/optionrom/config.mak
+    echo "# Automatically generated by configure - do not modify" > $config_mak
+    echo "TOPSRC_DIR=$source_path" >> $config_mak
+    write_target_makefile >> $config_mak
 fi
 
 probe_target_compiler ppc-softmmu
diff --git a/pc-bios/optionrom/Makefile b/pc-bios/optionrom/Makefile
index e90ca2e1c6..3e06c11dea 100644
--- a/pc-bios/optionrom/Makefile
+++ b/pc-bios/optionrom/Makefile
@@ -20,28 +20,24 @@ override CFLAGS += $(call cc-option, -fcf-protection=none)
 # Flags for dependency generation
 override CPPFLAGS += -MMD -MP -MT $@ -MF $(@D)/$(*F).d
 
-override CFLAGS += $(filter -W%, $(QEMU_CFLAGS))
 override CFLAGS += $(call cc-option, -fno-pie)
+override CFLAGS += $(call cc-option, -no-pie)
 override CFLAGS += -ffreestanding -I$(TOPSRC_DIR)/include
 override CFLAGS += $(call cc-option, -fno-stack-protector)
 override CFLAGS += $(call cc-option, -Wno-array-bounds)
 
-Wa = -Wa,
-override ASFLAGS += -32
-override CFLAGS += $(call cc-option, $(Wa)-32)
-
-override LDFLAGS = -m $(LD_I386_EMULATION) -T $(SRC_DIR)/flat.lds
+override LDFLAGS = -nostdlib -Wl,-T,$(SRC_DIR)/flat.lds
 
 pvh.img: pvh.o pvh_main.o
 
 %.o: %.S
-	$(call quiet-command,$(CC) $(CPPFLAGS) -E -o - $< | $(AS) $(ASFLAGS) -o $@,"AS","$@")
+	$(call quiet-command,$(CC) $(CPPFLAGS) $(CFLAGS) -c -o $@ $<,"AS","$@")
 
 %.o: %.c
 	$(call quiet-command,$(CC) $(CPPFLAGS) $(CFLAGS) -c $< -o $@,"CC","$@")
 
 %.img: %.o
-	$(call quiet-command,$(LD) $(LDFLAGS) -s -o $@ $^,"BUILD","$@")
+	$(call quiet-command,$(CC) $(CFLAGS) $(LDFLAGS) -s -o $@ $^,"BUILD","$@")
 
 %.raw: %.img
 	$(call quiet-command,$(OBJCOPY) -O binary -j .text $< $@,"BUILD","$@")
-- 
2.37.1



