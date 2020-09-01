Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D2B3258B3B
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Sep 2020 11:16:30 +0200 (CEST)
Received: from localhost ([::1]:39730 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kD2Oz-0003KK-Ad
	for lists+qemu-devel@lfdr.de; Tue, 01 Sep 2020 05:16:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33652)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kD2KN-0003HI-Nh
 for qemu-devel@nongnu.org; Tue, 01 Sep 2020 05:11:43 -0400
Received: from us-smtp-2.mimecast.com ([207.211.31.81]:44366
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kD2KK-0006pK-Bd
 for qemu-devel@nongnu.org; Tue, 01 Sep 2020 05:11:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1598951499;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=JPdka2ufkdaeXPcfDmLHvJN3beVzyIA2duedhvs1E38=;
 b=jG+mucSx/Mbvk50fGClxr2GIdZIi+rAD9kHLnSvQ558tnAiZMGK44k9Vlects8UchNkpAF
 XG6tCs5AdQiQaphFrfX5tB0jZ9LX4R/vdegvNsB9oAcpDmeRJUrWFjIBCiqfSTB6QTGYl3
 p1kVNBONFqNT4DsIvVb2opeuA1yKybM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-243-bSvNzuGZM-a0Bx6q06CE-g-1; Tue, 01 Sep 2020 05:11:38 -0400
X-MC-Unique: bSvNzuGZM-a0Bx6q06CE-g-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6038D18A2243
 for <qemu-devel@nongnu.org>; Tue,  1 Sep 2020 09:11:37 +0000 (UTC)
Received: from virtlab701.virt.lab.eng.bos.redhat.com
 (virtlab701.virt.lab.eng.bos.redhat.com [10.19.152.228])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 5234861177;
 Tue,  1 Sep 2020 09:11:34 +0000 (UTC)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 04/24] meson: install pc-bios blobs
Date: Tue,  1 Sep 2020 05:11:12 -0400
Message-Id: <20200901091132.29601-5-pbonzini@redhat.com>
In-Reply-To: <20200901091132.29601-1-pbonzini@redhat.com>
References: <20200901091132.29601-1-pbonzini@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0.002
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=207.211.31.81; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/09/01 02:08:15
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Marc-André Lureau <marcandre.lureau@redhat.com>

Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Message-Id: <20200826130622.553318-2-marcandre.lureau@redhat.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 Makefile            | 31 ----------------------
 pc-bios/meson.build | 63 +++++++++++++++++++++++++++++++++++++++++++++
 2 files changed, 63 insertions(+), 31 deletions(-)

diff --git a/Makefile b/Makefile
index 81794d5c34..16b2ffa7fe 100644
--- a/Makefile
+++ b/Makefile
@@ -229,32 +229,6 @@ distclean: clean ninja-distclean
 	rm -f linux-headers/asm
 	rm -Rf .sdk
 
-ifdef INSTALL_BLOBS
-BLOBS=bios.bin bios-256k.bin bios-microvm.bin sgabios.bin vgabios.bin vgabios-cirrus.bin \
-vgabios-stdvga.bin vgabios-vmware.bin vgabios-qxl.bin vgabios-virtio.bin \
-vgabios-ramfb.bin vgabios-bochs-display.bin vgabios-ati.bin \
-openbios-sparc32 openbios-sparc64 openbios-ppc QEMU,tcx.bin QEMU,cgthree.bin \
-pxe-e1000.rom pxe-eepro100.rom pxe-ne2k_pci.rom \
-pxe-pcnet.rom pxe-rtl8139.rom pxe-virtio.rom \
-efi-e1000.rom efi-eepro100.rom efi-ne2k_pci.rom \
-efi-pcnet.rom efi-rtl8139.rom efi-virtio.rom \
-efi-e1000e.rom efi-vmxnet3.rom \
-qemu-nsis.bmp \
-bamboo.dtb canyonlands.dtb petalogix-s3adsp1800.dtb petalogix-ml605.dtb \
-multiboot.bin linuxboot.bin linuxboot_dma.bin kvmvapic.bin pvh.bin \
-s390-ccw.img s390-netboot.img \
-slof.bin skiboot.lid \
-palcode-clipper \
-u-boot.e500 u-boot-sam460-20100605.bin \
-qemu_vga.ndrv \
-edk2-licenses.txt \
-hppa-firmware.img \
-opensbi-riscv32-generic-fw_dynamic.bin opensbi-riscv64-generic-fw_dynamic.bin \
-opensbi-riscv32-generic-fw_dynamic.elf opensbi-riscv64-generic-fw_dynamic.elf
-else
-BLOBS=
-endif
-
 install-datadir:
 	$(INSTALL_DIR) "$(DESTDIR)$(qemu_datadir)"
 
@@ -272,11 +246,6 @@ export DESTDIR
 install: all install-datadir install-localstatedir
 ifdef CONFIG_TRACE_SYSTEMTAP
 	$(INSTALL_PROG) "scripts/qemu-trace-stap" $(DESTDIR)$(bindir)
-endif
-ifneq ($(BLOBS),)
-	set -e; for x in $(BLOBS); do \
-		$(INSTALL_DATA) $(SRC_PATH)/pc-bios/$$x "$(DESTDIR)$(qemu_datadir)"; \
-	done
 endif
 	for s in $(ICON_SIZES); do \
 		mkdir -p "$(DESTDIR)$(qemu_icondir)/hicolor/$${s}/apps"; \
diff --git a/pc-bios/meson.build b/pc-bios/meson.build
index b6389f5148..f608c2cdba 100644
--- a/pc-bios/meson.build
+++ b/pc-bios/meson.build
@@ -24,5 +24,68 @@ if 'DECOMPRESS_EDK2_BLOBS' in config_host
   endforeach
 endif
 
+blobs = files(
+  'bios.bin',
+  'bios-256k.bin',
+  'bios-microvm.bin',
+  'sgabios.bin',
+  'vgabios.bin',
+  'vgabios-cirrus.bin',
+  'vgabios-stdvga.bin',
+  'vgabios-vmware.bin',
+  'vgabios-qxl.bin',
+  'vgabios-virtio.bin',
+  'vgabios-ramfb.bin',
+  'vgabios-bochs-display.bin',
+  'vgabios-ati.bin',
+  'openbios-sparc32',
+  'openbios-sparc64',
+  'openbios-ppc',
+  'QEMU,tcx.bin',
+  'QEMU,cgthree.bin',
+  'pxe-e1000.rom',
+  'pxe-eepro100.rom',
+  'pxe-ne2k_pci.rom',
+  'pxe-pcnet.rom',
+  'pxe-rtl8139.rom',
+  'pxe-virtio.rom',
+  'efi-e1000.rom',
+  'efi-eepro100.rom',
+  'efi-ne2k_pci.rom',
+  'efi-pcnet.rom',
+  'efi-rtl8139.rom',
+  'efi-virtio.rom',
+  'efi-e1000e.rom',
+  'efi-vmxnet3.rom',
+  'qemu-nsis.bmp',
+  'bamboo.dtb',
+  'canyonlands.dtb',
+  'petalogix-s3adsp1800.dtb',
+  'petalogix-ml605.dtb',
+  'multiboot.bin',
+  'linuxboot.bin',
+  'linuxboot_dma.bin',
+  'kvmvapic.bin',
+  'pvh.bin',
+  's390-ccw.img',
+  's390-netboot.img',
+  'slof.bin',
+  'skiboot.lid',
+  'palcode-clipper',
+  'u-boot.e500',
+  'u-boot-sam460-20100605.bin',
+  'qemu_vga.ndrv',
+  'edk2-licenses.txt',
+  'hppa-firmware.img',
+  'opensbi-riscv32-generic-fw_dynamic.bin',
+  'opensbi-riscv64-generic-fw_dynamic.bin',
+  'opensbi-riscv32-generic-fw_dynamic.elf',
+  'opensbi-riscv64-generic-fw_dynamic.elf',
+)
+
+if install_blobs
+  install_data(blobs, install_dir: config_host['qemu_datadir'])
+endif
+
 subdir('descriptors')
 subdir('keymaps')
-- 
2.26.2



