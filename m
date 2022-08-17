Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F58559743E
	for <lists+qemu-devel@lfdr.de>; Wed, 17 Aug 2022 18:35:39 +0200 (CEST)
Received: from localhost ([::1]:49962 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oOM13-0000Kw-7Y
	for lists+qemu-devel@lfdr.de; Wed, 17 Aug 2022 12:35:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42154)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1oOLmx-0006Me-04
 for qemu-devel@nongnu.org; Wed, 17 Aug 2022 12:21:04 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:52175)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1oOLmt-0005T6-Gn
 for qemu-devel@nongnu.org; Wed, 17 Aug 2022 12:21:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1660753258;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=4g8+3u7lQYsLQR7nRpbfTo7Ux1+U1muOR3lP40MDZH0=;
 b=F6Zfmkha4Aehsu2aJFfFDjPtRuTHU32AgZKxT6I886O/xv8iUjJSkJBVYGb+NybJXNTY91
 LgCajJzPjdSHoMJtC55RgTAZ1ajNyzEOftiCW29SZdcT6/ju2gUtD4Sb7yoryh2HrT+oTC
 nuVNEggcsd7BrK+81TfaedAfxBGHh0E=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-235-GvMo0QXSOJ-6emTAnaU9uw-1; Wed, 17 Aug 2022 12:14:51 -0400
X-MC-Unique: GvMo0QXSOJ-6emTAnaU9uw-1
Received: by mail-wm1-f70.google.com with SMTP id
 v64-20020a1cac43000000b003a4bea31b4dso1275464wme.3
 for <qemu-devel@nongnu.org>; Wed, 17 Aug 2022 09:14:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc;
 bh=4g8+3u7lQYsLQR7nRpbfTo7Ux1+U1muOR3lP40MDZH0=;
 b=duhSp6eLzPG4XVyFIaqTbXW7CL3Ko8QjGD8tW7tzuungmzrPHVuoz36xim9iqqquHp
 QZ19nrSL32txf4iDqhsB97U/5nE9lXPXmg26rtSbjCNGa2qsU+lyISQKzE1B2xDZsfq7
 5Rnap9cYWVmbP44ZkBy6h9Q62+BkADd4bHfpEOCVgPRd1539Jqr5XXFfbbFIX0GfvamB
 jeDjO6w6xXNYRHQARAaX4qmV2ByAKeaic6LCKMsptoWdJ9N4vDuwaF2rz+nzz0EOeQ97
 1we1b4Ty2xEJQAOryrq/qLpCOv+ozDmw++NZzshMXn12ZybuN/t5Z4p32IoLlhWN4BsJ
 TsUw==
X-Gm-Message-State: ACgBeo2hD+UCtCdAb38fWT/QCaO7STRdBkcTqWfdPdJaxGUCLn4VchQ3
 gAGutgo+FGrXAuohPOJXV+eYJtGVt7bqBDUlWPuEIZXS2odqrReDT1DlKUsYXBriO42PHVQROSU
 //V2JoUM/XwhacUtNtk6fld4uCCHYtKJFwKvSAEbv8rXbLuA6GHsZKs9/lj/C
X-Received: by 2002:a05:6000:60e:b0:225:1d44:51c9 with SMTP id
 bn14-20020a056000060e00b002251d4451c9mr4379460wrb.0.1660752889886; 
 Wed, 17 Aug 2022 09:14:49 -0700 (PDT)
X-Google-Smtp-Source: AA6agR6emVFN39zuy+dDn+GORmLFQEKBuNOvxdd98hE1lx8C2Rs2m2CIJCyEDwIltJWoBz62BE7WOw==
X-Received: by 2002:a05:6000:60e:b0:225:1d44:51c9 with SMTP id
 bn14-20020a056000060e00b002251d4451c9mr4379444wrb.0.1660752889631; 
 Wed, 17 Aug 2022 09:14:49 -0700 (PDT)
Received: from redhat.com ([2.55.4.37]) by smtp.gmail.com with ESMTPSA id
 j33-20020a05600c48a100b003a5bd5ea215sm2410335wmp.37.2022.08.17.09.14.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 17 Aug 2022 09:14:48 -0700 (PDT)
Date: Wed, 17 Aug 2022 12:14:45 -0400
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
Subject: [PULL 05/10] x86: disable rng seeding via setup_data
Message-ID: <20220817161342.240674-6-mst@redhat.com>
References: <20220817161342.240674-1-mst@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220817161342.240674-1-mst@redhat.com>
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


