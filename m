Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E752B59779A
	for <lists+qemu-devel@lfdr.de>; Wed, 17 Aug 2022 22:15:03 +0200 (CEST)
Received: from localhost ([::1]:57122 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oOPRP-0001Lp-1O
	for lists+qemu-devel@lfdr.de; Wed, 17 Aug 2022 16:15:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50168)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1oOPIt-000311-2X
 for qemu-devel@nongnu.org; Wed, 17 Aug 2022 16:06:15 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:47479)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1oOPIr-0000Ft-A5
 for qemu-devel@nongnu.org; Wed, 17 Aug 2022 16:06:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1660766772;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=4g8+3u7lQYsLQR7nRpbfTo7Ux1+U1muOR3lP40MDZH0=;
 b=MfrJLwsHPCoDJgxQLV8iZE4hpIGGSX2T4Whg12+/mLDi5TlGXhVKeyyt218SHWqXxJDtG1
 27MrpAyWCkRu0ESCcMoApMZk1aX2TB66U4Xaz0dCxalB/cvl2tVP/s+LEAQY1R1JblgkNS
 5huVt0bfDWiYRZC6Od/KAVvVB8p79eE=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-518-lyOhGUlYP1-jY8XqomZ3kg-1; Wed, 17 Aug 2022 16:06:11 -0400
X-MC-Unique: lyOhGUlYP1-jY8XqomZ3kg-1
Received: by mail-wr1-f69.google.com with SMTP id
 t12-20020adfba4c000000b0021e7440666bso2705627wrg.22
 for <qemu-devel@nongnu.org>; Wed, 17 Aug 2022 13:06:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc;
 bh=4g8+3u7lQYsLQR7nRpbfTo7Ux1+U1muOR3lP40MDZH0=;
 b=y1DSt/5liE8BxKCioYhwnMqza/Zp5n+pKs2R7vc86NaLiVMnLXBTAugglwhYLIlohD
 y2i4y9foNXkGRw7izOpnLA34ydYzDkdNT0ii99ue+NUrIJXU89MFzfPIjZv9TZADW6SH
 zBaiUJuWZElx7UAnMS++nZwv1WdWSoDrzlkEK91ygwWtMHvT6ZDgQ/2h5Jaa5ja5H1Ff
 kGU+XtFL+OWUdQYxSFaW3JW/YqSPFnc6zXuZAbV6a530w0lDGytl9KdUPbtr2fmh/NCf
 Zi1CIkhe3asD/99YzZ6/loR5yi08lsi1aiZOsNlUeB+us5Gsni+QwgxRLyu3xnepwMTR
 vLCA==
X-Gm-Message-State: ACgBeo1V3OaEQD3B++hCWHjZn7qcwadf1dveheLmZ/urPvPVtfs7Yga4
 HWzKO6wC9imhDNGm/01Jq/9Ky/71kXZdHtQ6w5BZREZtj0YYKpGQMvriXyf5v95jnxKNTa32Bn3
 Z0NZUBohN84WM61/XMK3amJqRei/Pyn0v+YX2hHkkZI7piXQLZuLq9zpQd4Z8
X-Received: by 2002:adf:c007:0:b0:220:76fc:eacc with SMTP id
 z7-20020adfc007000000b0022076fceaccmr14595614wre.101.1660766770174; 
 Wed, 17 Aug 2022 13:06:10 -0700 (PDT)
X-Google-Smtp-Source: AA6agR6HyIuriooZ8P343nbADBDK+NHwBltdLZDCvkxbj4fGF68FkjSTgbU4isT5kdB8v3QQfvME1g==
X-Received: by 2002:adf:c007:0:b0:220:76fc:eacc with SMTP id
 z7-20020adfc007000000b0022076fceaccmr14595596wre.101.1660766769730; 
 Wed, 17 Aug 2022 13:06:09 -0700 (PDT)
Received: from redhat.com ([2.55.4.37]) by smtp.gmail.com with ESMTPSA id
 j20-20020a05600c191400b003a5c1e916c8sm9919988wmq.1.2022.08.17.13.06.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 17 Aug 2022 13:06:09 -0700 (PDT)
Date: Wed, 17 Aug 2022 16:06:05 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Gerd Hoffmann <kraxel@redhat.com>, "Jason A . Donenfeld" <Jason@zx2c4.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Laurent Vivier <laurent@vivier.eu>, Sergio Lopez <slp@redhat.com>
Subject: [PULL 05/12] x86: disable rng seeding via setup_data
Message-ID: <20220817200536.350795-6-mst@redhat.com>
References: <20220817200536.350795-1-mst@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220817200536.350795-1-mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
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

From: Gerd Hoffmann <kraxel@redhat.com>

Causes regressions when doing direct kernel boots with OVMF.

At this point in the release cycle the only sensible action
is to just disable this for 7.1 and sort it properly in the
7.2 devel cycle.

Cc: Jason A. Donenfeld <Jason@zx2c4.com>
Cc: Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>
Cc: Richard Henderson <richard.henderson@linaro.org>
Cc: Eduardo Habkost <eduardo@habkost.net>
Cc: Peter Maydell <peter.maydell@linaro.org>
Cc: Philippe Mathieu-Daudé <f4bug@amsat.org>
Cc: Laurent Vivier <laurent@vivier.eu>
Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
Message-Id: <20220817083940.3174933-1-kraxel@redhat.com>
Cc: Jason A. Donenfeld <Jason@zx2c4.com>
Cc: Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>
Cc: Richard Henderson <richard.henderson@linaro.org>
Cc: Eduardo Habkost <eduardo@habkost.net>
Cc: Peter Maydell <peter.maydell@linaro.org>
Cc: Philippe Mathieu-Daudé <f4bug@amsat.org>
Cc: Laurent Vivier <laurent@vivier.eu>
Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
---
 hw/i386/microvm.c | 2 +-
 hw/i386/pc_piix.c | 2 +-
 hw/i386/pc_q35.c  | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/hw/i386/microvm.c b/hw/i386/microvm.c
index 7fe8cce03e..52cafa003d 100644
--- a/hw/i386/microvm.c
+++ b/hw/i386/microvm.c
@@ -332,7 +332,7 @@ static void microvm_memory_init(MicrovmMachineState *mms)
     rom_set_fw(fw_cfg);
 
     if (machine->kernel_filename != NULL) {
-        x86_load_linux(x86ms, fw_cfg, 0, true, false);
+        x86_load_linux(x86ms, fw_cfg, 0, true, true);
     }
 
     if (mms->option_roms) {
diff --git a/hw/i386/pc_piix.c b/hw/i386/pc_piix.c
index a5c65c1c35..20962c34e7 100644
--- a/hw/i386/pc_piix.c
+++ b/hw/i386/pc_piix.c
@@ -439,6 +439,7 @@ static void pc_i440fx_7_1_machine_options(MachineClass *m)
     m->alias = "pc";
     m->is_default = true;
     pcmc->default_cpu_version = 1;
+    pcmc->legacy_no_rng_seed = true;
 }
 
 DEFINE_I440FX_MACHINE(v7_1, "pc-i440fx-7.1", NULL,
@@ -450,7 +451,6 @@ static void pc_i440fx_7_0_machine_options(MachineClass *m)
     pc_i440fx_7_1_machine_options(m);
     m->alias = NULL;
     m->is_default = false;
-    pcmc->legacy_no_rng_seed = true;
     pcmc->enforce_amd_1tb_hole = false;
     compat_props_add(m->compat_props, hw_compat_7_0, hw_compat_7_0_len);
     compat_props_add(m->compat_props, pc_compat_7_0, pc_compat_7_0_len);
diff --git a/hw/i386/pc_q35.c b/hw/i386/pc_q35.c
index 3a35193ff7..2e5dae9a89 100644
--- a/hw/i386/pc_q35.c
+++ b/hw/i386/pc_q35.c
@@ -376,6 +376,7 @@ static void pc_q35_7_1_machine_options(MachineClass *m)
     pc_q35_machine_options(m);
     m->alias = "q35";
     pcmc->default_cpu_version = 1;
+    pcmc->legacy_no_rng_seed = true;
 }
 
 DEFINE_Q35_MACHINE(v7_1, "pc-q35-7.1", NULL,
@@ -386,7 +387,6 @@ static void pc_q35_7_0_machine_options(MachineClass *m)
     PCMachineClass *pcmc = PC_MACHINE_CLASS(m);
     pc_q35_7_1_machine_options(m);
     m->alias = NULL;
-    pcmc->legacy_no_rng_seed = true;
     pcmc->enforce_amd_1tb_hole = false;
     compat_props_add(m->compat_props, hw_compat_7_0, hw_compat_7_0_len);
     compat_props_add(m->compat_props, pc_compat_7_0, pc_compat_7_0_len);
-- 
MST


