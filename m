Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CC9F9250CE6
	for <lists+qemu-devel@lfdr.de>; Tue, 25 Aug 2020 02:24:20 +0200 (CEST)
Received: from localhost ([::1]:52292 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kAMl9-0007Hk-Sy
	for lists+qemu-devel@lfdr.de; Mon, 24 Aug 2020 20:24:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45268)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <3nVhEXwsKCmAFQIGLLCKMCLEMMEJC.AMKOCKS-BCTCJLMLELS.MPE@flex--hskinnemoen.bounces.google.com>)
 id 1kAMef-00049q-ME
 for qemu-devel@nongnu.org; Mon, 24 Aug 2020 20:17:37 -0400
Received: from mail-pf1-x449.google.com ([2607:f8b0:4864:20::449]:50142)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from
 <3nVhEXwsKCmAFQIGLLCKMCLEMMEJC.AMKOCKS-BCTCJLMLELS.MPE@flex--hskinnemoen.bounces.google.com>)
 id 1kAMed-00067x-Ma
 for qemu-devel@nongnu.org; Mon, 24 Aug 2020 20:17:37 -0400
Received: by mail-pf1-x449.google.com with SMTP id b189so2794082pfa.16
 for <qemu-devel@nongnu.org>; Mon, 24 Aug 2020 17:17:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=sender:date:in-reply-to:message-id:mime-version:references:subject
 :from:to:cc; bh=uYevUGfZIkhvqGlY6GhgrWEQ7RdmB99+oEnNEV3tBGs=;
 b=rTFujelO8n3UIY+fUEawiRZWIni7QZwK/68yUCs56OA02Ge16a0PWpDtVpM+gdt/Xy
 vxFQAMZNKmIyz0RzHj8AJsk47zhuTPZxgP15Rq54jp4sZpj1xUXpkgdYghhe7kNPlQ7o
 zhpD777cTeDpKMIgFU+MixeiHDTExLzHU4IjXlA7u+LANgQlndc61VovXP0V1g4q0Zqo
 gYSKVutTrsjaFGhbwhfK2RAipXxFPZry9v73SkbrKWpLg42gzr+GgcMxCD/l1yaq7SgE
 RYJ5cnMMHFiT9AyFdcDHIJ0j8UYvTye4ymnMU8GkI2SraUCqFGucFwVP5izAfqXCMg7+
 9EfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:in-reply-to:message-id:mime-version
 :references:subject:from:to:cc;
 bh=uYevUGfZIkhvqGlY6GhgrWEQ7RdmB99+oEnNEV3tBGs=;
 b=aj8hEiIwzp7S9X5VRFo69vUPDT2I4by0pc6UhNMStTAJpzqoGiGzWkeEZNp+prBgBl
 JRWAGXd3d7YAVQE5siOw7Zlus+0e0D+/2oMGgF3X5e1n7S2AWufkfQCvqObTXApVcNKi
 NG2IKPV4Pi9cVu7aHDx0RHUxFhxqXGdYScv14hgAqOKZCpiKL5DqxMauiJRaoSlnOqhJ
 ASMJCSr7dDvBYU86Tkz6wny3DkPCr1I3eDd94h0sWtDhhZziY4PiaCoZlk9z9yb1Zbrv
 /W77jy1D39uOYx8MImZ3VeV1UxSqdZqbmC7xxnd90yMd4htU6xG4tZKwXwRADHeMvw+w
 dEWw==
X-Gm-Message-State: AOAM532XTtWw29XIocEzsrGNNEai2rw4mhiicd5grqEHeR1INMPJmPI2
 bmr0tXzvgL3prAWnxS2sRdjGRJa6eq3D0iy4Zw==
X-Google-Smtp-Source: ABdhPJw/PYp83jZjxZfJ3FNnuKF5SAp3AawKv4/q/UG0YbAt9ixPoIiS2uTSEBR/Q2aG3F42gnouWNfycBaOxFzTVg==
X-Received: from skybert.c.googlers.com ([fda3:e722:ac3:10:24:72f4:c0a8:3107])
 (user=hskinnemoen job=sendgmr) by 2002:a17:902:d905:: with SMTP id
 c5mr5493386plz.34.1598314653278;
 Mon, 24 Aug 2020 17:17:33 -0700 (PDT)
Date: Mon, 24 Aug 2020 17:17:03 -0700
In-Reply-To: <20200825001711.1340443-1-hskinnemoen@google.com>
Message-Id: <20200825001711.1340443-7-hskinnemoen@google.com>
Mime-Version: 1.0
References: <20200825001711.1340443-1-hskinnemoen@google.com>
X-Mailer: git-send-email 2.28.0.297.g1956fa8f8d-goog
Subject: [PATCH v8 06/14] roms: Add virtual Boot ROM for NPCM7xx SoCs
To: peter.maydell@linaro.org, f4bug@amsat.org
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, Avi.Fishman@nuvoton.com, 
 kfting@nuvoton.com, Havard Skinnemoen <hskinnemoen@google.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::449;
 envelope-from=3nVhEXwsKCmAFQIGLLCKMCLEMMEJC.AMKOCKS-BCTCJLMLELS.MPE@flex--hskinnemoen.bounces.google.com;
 helo=mail-pf1-x449.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -95
X-Spam_score: -9.6
X-Spam_bar: ---------
X-Spam_report: (-9.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 USER_IN_DEF_DKIM_WL=-7.5 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
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
Reply-to: Havard Skinnemoen <hskinnemoen@google.com>
From: Havard Skinnemoen via <qemu-devel@nongnu.org>

This is a minimalistic boot ROM written specifically for use with QEMU.
It supports loading the second-stage loader from SPI flash into RAM, SMP
boot, and not much else.

Signed-off-by: Havard Skinnemoen <hskinnemoen@google.com>
---
 Makefile                    |   1 +
 .gitmodules                 |   3 +++
 MAINTAINERS                 |   2 ++
 pc-bios/README              |   6 ++++++
 pc-bios/npcm7xx_bootrom.bin | Bin 0 -> 768 bytes
 roms/Makefile               |   7 +++++++
 roms/vbootrom               |   1 +
 7 files changed, 20 insertions(+)
 create mode 100644 pc-bios/npcm7xx_bootrom.bin
 create mode 160000 roms/vbootrom

diff --git a/Makefile b/Makefile
index 81794d5c34..08e9af3793 100644
--- a/Makefile
+++ b/Makefile
@@ -246,6 +246,7 @@ s390-ccw.img s390-netboot.img \
 slof.bin skiboot.lid \
 palcode-clipper \
 u-boot.e500 u-boot-sam460-20100605.bin \
+npcm7xx_bootrom.bin \
 qemu_vga.ndrv \
 edk2-licenses.txt \
 hppa-firmware.img \
diff --git a/.gitmodules b/.gitmodules
index ce979398a8..9ffb9f3f4f 100644
--- a/.gitmodules
+++ b/.gitmodules
@@ -61,3 +61,6 @@
 [submodule "meson"]
 	path = meson
 	url = https://github.com/mesonbuild/meson/
+[submodule "roms/vbootrom"]
+	path = roms/vbootrom
+	url = https://github.com/google/vbootrom.git
diff --git a/MAINTAINERS b/MAINTAINERS
index 3f72250630..d71afedc20 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -756,6 +756,8 @@ L: qemu-arm@nongnu.org
 S: Supported
 F: hw/*/npcm7xx*
 F: include/hw/*/npcm7xx*
+F: pc-bios/npcm7xx_bootrom.bin
+F: roms/vbootrom
 
 nSeries
 M: Andrzej Zaborowski <balrogg@gmail.com>
diff --git a/pc-bios/README b/pc-bios/README
index fa8b58b797..4d6297fca7 100644
--- a/pc-bios/README
+++ b/pc-bios/README
@@ -71,3 +71,9 @@
   ("Simplified BSD License" or "FreeBSD License", SPDX: BSD-2-Clause). OpenSBI
   source code also contains code reused from other projects desribed here:
   https://github.com/riscv/opensbi/blob/master/ThirdPartyNotices.md.
+
+- npcm7xx_bootrom.bin is a simplified, free (Apache 2.0) boot ROM for Nuvoton
+  NPCM7xx BMC devices. It currently implements the bare minimum to load, parse,
+  initialize and run boot images stored in SPI flash, but may grow more
+  features over time as needed. The source code is available at:
+  https://github.com/google/vbootrom
diff --git a/pc-bios/npcm7xx_bootrom.bin b/pc-bios/npcm7xx_bootrom.bin
new file mode 100644
index 0000000000000000000000000000000000000000..38f89d1b97b0c2e133af2a9fbed0521be132065b
GIT binary patch
literal 768
zcmd5)JxClu6n-<aczPbVhZYusb8wKx;7TklHfmuZdYT9pDRLwd1p_t-DFpWpyA+8(
zwKtZg3J4a0aCM3_X(ZL&4g;46VVk5e$K;z;L99|b@aE%v^S$rQ8)h(Vm@cB9IYc+2
z2SHd4^NwTIGE%w>9S05p1#kf90Sj5Z(jG8}+)IZIp~iXK=T&)dL`%d-q*8aR#mq{7
z9`=6;Dr(H0ACe72R5x?!)^86Qj-X%{+!K9iZNA@*wkBAV&iZ(l^I9?!Gz=S2I_*1d
zr+tTQDHjvyzKnw(hu00yX`u!Fv<!~XVcX?@kr#<B0(gGU?$W{gSsQa}CF^8Cfzp2X
z@P}yDV-bci(K9XL$FU!som2C`c)?Uc&294s^}Wzumap{hg1X^jN|V25M5tQZ=<9lN
z%(zKz#t-qCwHKb;HygOCpvCNL_4@1tXV1YGf^XUE_$zr{g8zWh-6gz-teI(eibtxo
z?0OZI4%rU0741PgUD`2xq@H|*4=+Rs?%N)Ox5G+q>C;DilBe_YlkeSUVHA-crNk+k
jtiF_MudA<CB(}8|fqYwCf3re&=&@_s761P#-ID$TwgmBa

literal 0
HcmV?d00001

diff --git a/roms/Makefile b/roms/Makefile
index 5d9f15b677..7405d67326 100644
--- a/roms/Makefile
+++ b/roms/Makefile
@@ -34,6 +34,7 @@ find-cross-gcc = $(firstword $(wildcard $(patsubst %ld,%gcc,$(call find-cross-ld
 # finally strip off path + toolname so we get the prefix
 find-cross-prefix = $(subst gcc,,$(notdir $(call find-cross-gcc,$(1))))
 
+arm_cross_prefix := $(call find-cross-prefix,arm)
 powerpc64_cross_prefix := $(call find-cross-prefix,powerpc64)
 powerpc_cross_prefix := $(call find-cross-prefix,powerpc)
 x86_64_cross_prefix := $(call find-cross-prefix,x86_64)
@@ -63,6 +64,7 @@ default help:
 	@echo "  skiboot            -- update skiboot.lid"
 	@echo "  u-boot.e500        -- update u-boot.e500"
 	@echo "  u-boot.sam460      -- update u-boot.sam460"
+	@echo "  npcm7xx_bootrom    -- update vbootrom for npcm7xx"
 	@echo "  efi                -- update UEFI (edk2) platform firmware"
 	@echo "  opensbi32-generic  -- update OpenSBI for 32-bit generic machine"
 	@echo "  opensbi64-generic  -- update OpenSBI for 64-bit generic machine"
@@ -186,6 +188,10 @@ bios-microvm:
 	$(MAKE) -C qboot
 	cp qboot/bios.bin ../pc-bios/bios-microvm.bin
 
+npcm7xx_bootrom:
+	$(MAKE) -C vbootrom CROSS_COMPILE=$(arm_cross_prefix)
+	cp vbootrom/npcm7xx_bootrom.bin ../pc-bios/npcm7xx_bootrom.bin
+
 clean:
 	rm -rf seabios/.config seabios/out seabios/builds
 	$(MAKE) -C sgabios clean
@@ -199,3 +205,4 @@ clean:
 	$(MAKE) -f Makefile.edk2 clean
 	$(MAKE) -C opensbi clean
 	$(MAKE) -C qboot clean
+	$(MAKE) -C vbootrom clean
diff --git a/roms/vbootrom b/roms/vbootrom
new file mode 160000
index 0000000000..0c37a43527
--- /dev/null
+++ b/roms/vbootrom
@@ -0,0 +1 @@
+Subproject commit 0c37a43527f0ee2b9584e7fb2fdc805e902635ac
-- 
2.28.0.297.g1956fa8f8d-goog


