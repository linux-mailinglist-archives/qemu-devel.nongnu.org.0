Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D4B55EFCBA
	for <lists+qemu-devel@lfdr.de>; Thu, 29 Sep 2022 20:11:06 +0200 (CEST)
Received: from localhost ([::1]:38264 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1odxzz-0005hI-Uj
	for lists+qemu-devel@lfdr.de; Thu, 29 Sep 2022 14:11:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33806)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1odwQr-0003hT-Rz
 for qemu-devel@nongnu.org; Thu, 29 Sep 2022 12:30:48 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:49097)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1odwQo-00036V-Kn
 for qemu-devel@nongnu.org; Thu, 29 Sep 2022 12:30:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1664469037;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ziq4VGpS8d35Ri8KEGR9TwGMwDkZruBUJpKoLFh+vSQ=;
 b=KM7uuv758jjad8LKVtaK2Pa8yWlMmFTQnQjPIjoFruuXqeGt6Tcj9EPI4rU537rqCRWKBF
 N46eND6fMCTKoQA4jqgbPNMLKMph34NaCVh8lzZUSAium7wZ0tQXaBm+WvOm58J1G+eZIy
 KLRams+rwn5aSx1dvc1wSYZSF3VqNJk=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-593-6tjRe2UrMY2BquPbk2nYJw-1; Thu, 29 Sep 2022 12:30:36 -0400
X-MC-Unique: 6tjRe2UrMY2BquPbk2nYJw-1
Received: by mail-ed1-f71.google.com with SMTP id
 w17-20020a056402269100b0045249bc17a9so1648348edd.9
 for <qemu-devel@nongnu.org>; Thu, 29 Sep 2022 09:30:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=ziq4VGpS8d35Ri8KEGR9TwGMwDkZruBUJpKoLFh+vSQ=;
 b=UrL6oYVvaJTakuAqg7uVNTeBkhLzhgmfU1Lei/mLY/Evpg9NGx7vI2Fr9Aqnn5R/00
 +dR55fwuU9B239jbRtLlScSZwA228ycFdJJQi46xjSgFzlfpzsoWmlwROIT5GRUkzptv
 r/achZ9Fwr2HPiPzyAUhuGrImWfrzpQcyVSVT+Qy2V3Jb7odQVZTlMmg+4P7aLE1W1RX
 oYdfp0HZZ0NITmOKPUq7k4Wd0N8cLqEvZAl1luC9rZvuS3yO70I6IY7dtRHVsyC3NTcM
 usZckFXGDyjYhlvgVsIKACMVsspl9oCYP526Ls7jRyYDoHcl9+r3MHph+5x/bTzLR04I
 iJeQ==
X-Gm-Message-State: ACrzQf0f0Ce9NwVFImk9zeWKQUiVjkQ5kCkpQ540YysMBPRB0RZy8RLM
 nqdvW+hvDUrSvPjb5MDkYOvyOhVP4HJqxpbDGsjlFKzjFOfTit7A0aAfCBybFyTIRCdUrHf6xpw
 QAor9KrtjMEfU698YU9sC2HQeWknhqQrCI6aCKuaZdeOeIvE3MZsCvnwYrN2/1O8e4Ho=
X-Received: by 2002:a05:6402:d49:b0:458:27b3:4d1b with SMTP id
 ec9-20020a0564020d4900b0045827b34d1bmr3601650edb.201.1664469034327; 
 Thu, 29 Sep 2022 09:30:34 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM6rKwxy8HJCUj4U9jJb23CqlAqHlnSvQSEx/4uOF/8cOIQPG7pmLXFMH2rTfO6ElfHkEs1M8w==
X-Received: by 2002:a05:6402:d49:b0:458:27b3:4d1b with SMTP id
 ec9-20020a0564020d4900b0045827b34d1bmr3601620edb.201.1664469033906; 
 Thu, 29 Sep 2022 09:30:33 -0700 (PDT)
Received: from avogadro.local ([2001:b07:6468:f312:1c09:f536:3de6:228c])
 by smtp.gmail.com with ESMTPSA id
 s3-20020a056402520300b00453d8dee355sm5835151edd.60.2022.09.29.09.30.33
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 29 Sep 2022 09:30:33 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 06/14] configure: do not invoke as/ld directly for
 pc-bios/optionrom
Date: Thu, 29 Sep 2022 18:30:06 +0200
Message-Id: <20220929163014.16950-7-pbonzini@redhat.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20220929163014.16950-1-pbonzini@redhat.com>
References: <20220929163014.16950-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.08,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
index cc4ecd6008..894e37310f 100755
--- a/configure
+++ b/configure
@@ -2320,23 +2320,11 @@ probe_target_compiler i386-softmmu
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
2.37.3


