Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8153D529E3E
	for <lists+qemu-devel@lfdr.de>; Tue, 17 May 2022 11:41:00 +0200 (CEST)
Received: from localhost ([::1]:34900 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nqthJ-0000ZU-V2
	for lists+qemu-devel@lfdr.de; Tue, 17 May 2022 05:40:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37394)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1nqtTS-000871-1j
 for qemu-devel@nongnu.org; Tue, 17 May 2022 05:26:38 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:40375)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1nqtTQ-0003Yn-3H
 for qemu-devel@nongnu.org; Tue, 17 May 2022 05:26:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1652779595;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=gvcZMn5z0pl093XdtM8Z4Dmk4AG8hlklHqSILBtef6c=;
 b=Xt6QyBXbvMWIAdITedSKqa1OuoLICVs6Ll+wmK4F3Lj8U1usaC5qe1pF9fOaYvBzbX4HBW
 AbszR0WMxYPUYQ4XhKNYLq2G5YiCP/LYSR1j1q+BQGM1NCE1jNaihEw2hBwRmimoi/Xk8B
 0ItRXbltTRVTWvDIyLzpbpZgxlqCeKQ=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-240-Bt1upC9CMPiVzaJfvG2Mdw-1; Tue, 17 May 2022 05:26:32 -0400
X-MC-Unique: Bt1upC9CMPiVzaJfvG2Mdw-1
Received: by mail-ed1-f70.google.com with SMTP id
 n9-20020aa7d049000000b0042aab725949so4367882edo.23
 for <qemu-devel@nongnu.org>; Tue, 17 May 2022 02:26:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=gvcZMn5z0pl093XdtM8Z4Dmk4AG8hlklHqSILBtef6c=;
 b=iXNSespXZMd+orhgYASWySeiFH8gHMbjPivbHNfsurThSwlfSvoKMWtnNt71CYD0UL
 Pbr/NVKyqCfzH/ULM3Ssn0B3ig95RJqhR3qC/cvwtfSdh+OdTU+qNrscENyTw4PAojfI
 IkKzsWwyYe0BqlsHHqRUv3bGa05vw34qzytHrl+fRYRZK/GthfisC0bpCNDfnvKc2QQX
 6obuMyxfToT46G90PL5AleaFJstScNdhIBolL/G6XEe9zuiZVRpyleLWzhbyLjowqMjo
 f2pmFbMDeCby5/paal8YTTbmN8xxWtN0BN9eVhlO3hBLPXr7RjM7tE6BoYPGoVK1DcO5
 /vng==
X-Gm-Message-State: AOAM533gq4eyIp/4SAGKov6KjDTnB0b4Uo0ujZqLda6VTJzFp1wJ7h98
 wckf/m+y/nNeDsVeKo2Q2uA7JllZuYciB+R11HlQMWzicFXf5aE/jyl5rQ9pgEdnq2cp3+7Z51y
 +xU0q5erlEoIYCmU0l0IgURxU+QYV1cwc8gH5o8TBjKgu1owXC90KR1thtPlBymjSLBo=
X-Received: by 2002:a17:907:2cc4:b0:6fe:1c72:7888 with SMTP id
 hg4-20020a1709072cc400b006fe1c727888mr13068464ejc.373.1652779590873; 
 Tue, 17 May 2022 02:26:30 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwSn7TMugjc+ECsWZRDzFsaTswti2Hpdq4rzLhgZluU2PRtDsra+C2zvrSE7rQmes3ZygPQHw==
X-Received: by 2002:a17:907:2cc4:b0:6fe:1c72:7888 with SMTP id
 hg4-20020a1709072cc400b006fe1c727888mr13068447ejc.373.1652779590604; 
 Tue, 17 May 2022 02:26:30 -0700 (PDT)
Received: from [192.168.10.118] ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id
 if20-20020a170906df5400b006f3ef214dc7sm798680ejc.45.2022.05.17.02.26.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 17 May 2022 02:26:30 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: alex.bennee@linaro.org,
	richard.henderson@linaro.org
Subject: [PATCH 05/16] configure, meson: move symlinking of ROMs to meson
Date: Tue, 17 May 2022 11:26:05 +0200
Message-Id: <20220517092616.1272238-6-pbonzini@redhat.com>
X-Mailer: git-send-email 2.36.0
In-Reply-To: <20220517092616.1272238-1-pbonzini@redhat.com>
References: <20220517092616.1272238-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
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

This is useful because pc-bios/meson.build already has a list of all ROM
files, and thus does not need to use wildcards.  The problems with
wildcards are mentioned above the definition of the LINKS variable,
but then the recommendation is disattended.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 configure           | 15 ---------------
 pc-bios/meson.build | 18 +++++++++++++-----
 2 files changed, 13 insertions(+), 20 deletions(-)

diff --git a/configure b/configure
index 4c8954feea..d87b110aa2 100755
--- a/configure
+++ b/configure
@@ -2115,21 +2115,6 @@ LINKS="$LINKS tests/avocado tests/data"
 LINKS="$LINKS tests/qemu-iotests/check"
 LINKS="$LINKS python"
 LINKS="$LINKS contrib/plugins/Makefile "
-for bios_file in \
-    $source_path/pc-bios/*.bin \
-    $source_path/pc-bios/*.elf \
-    $source_path/pc-bios/*.lid \
-    $source_path/pc-bios/*.rom \
-    $source_path/pc-bios/*.dtb \
-    $source_path/pc-bios/*.img \
-    $source_path/pc-bios/openbios-* \
-    $source_path/pc-bios/u-boot.* \
-    $source_path/pc-bios/palcode-* \
-    $source_path/pc-bios/qemu_vga.ndrv
-
-do
-    LINKS="$LINKS pc-bios/$(basename $bios_file)"
-done
 for f in $LINKS ; do
     if [ -e "$source_path/$f" ]; then
         mkdir -p `dirname ./$f`
diff --git a/pc-bios/meson.build b/pc-bios/meson.build
index c86dedf7df..8ba81f5518 100644
--- a/pc-bios/meson.build
+++ b/pc-bios/meson.build
@@ -23,7 +23,7 @@ if unpack_edk2_blobs
   endforeach
 endif
 
-blobs = files(
+blobs = [
   'bios.bin',
   'bios-256k.bin',
   'bios-microvm.bin',
@@ -83,11 +83,18 @@ blobs = files(
   'npcm7xx_bootrom.bin',
   'vof.bin',
   'vof-nvram.bin',
-)
+]
 
-if get_option('install_blobs')
-  install_data(blobs, install_dir: qemu_datadir)
-endif
+ln_s = [find_program('ln', required: true), '-sf']
+foreach f : blobs
+  roms += custom_target(f,
+                build_by_default: have_system,
+                output: f,
+                input: files('meson.build'),            # dummy input
+                install: get_option('install_blobs'),
+                install_dir: qemu_datadir,
+                command: [ ln_s, meson.project_source_root() / 'pc-bios' / f, '@OUTPUT@' ])
+endforeach
 
 subdir('descriptors')
 subdir('keymaps')
-- 
2.36.0


