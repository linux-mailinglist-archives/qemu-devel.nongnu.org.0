Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E4C7A33C90B
	for <lists+qemu-devel@lfdr.de>; Mon, 15 Mar 2021 23:07:30 +0100 (CET)
Received: from localhost ([::1]:37370 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lLvN3-0008CJ-VR
	for lists+qemu-devel@lfdr.de; Mon, 15 Mar 2021 18:07:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44224)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <isaku.yamahata@gmail.com>)
 id 1lLvLA-0007Cb-VF
 for qemu-devel@nongnu.org; Mon, 15 Mar 2021 18:05:32 -0400
Received: from mail-pf1-x42f.google.com ([2607:f8b0:4864:20::42f]:37273)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <isaku.yamahata@gmail.com>)
 id 1lLvL8-0006PS-5w
 for qemu-devel@nongnu.org; Mon, 15 Mar 2021 18:05:32 -0400
Received: by mail-pf1-x42f.google.com with SMTP id a188so7472709pfb.4
 for <qemu-devel@nongnu.org>; Mon, 15 Mar 2021 15:05:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=KcHv6DShfyCFlk0CXc029CgnbMkiSGwyWK/yeoLvvbI=;
 b=L3XkSxO5JG04fF3MZGDrg+MDoTWKQkLph2G8nxy68R5AoV45nv/MRIVJe6zsrveBP9
 Opwi+kD/EsGV/87wi41P1oH+8iUtNX7A65VpghFXXkwMKoTei5n5bmhPeIdiyzL9fnh/
 xl57rCDOIo9y5njUlVH4k/SavsQ3OgGNv6BMjfypQSJ7T2OTQpfzN3kI3LO90xLDS/1E
 ahXFVVZ4HtU3TyY8xmxc1ygPkrkM2co5uft0E+r0ZRZdU7suFC9kV5dKgGlUzc02Pa0z
 FqrcZnKppHDItLT68ul9wYPXg18+nh6uOT2ofQfcwbLGsdC2tLnvMLj5WM+2zhg3iQLS
 qhXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=KcHv6DShfyCFlk0CXc029CgnbMkiSGwyWK/yeoLvvbI=;
 b=MlsdCm5JeUq3RQo395azRIiFYruex5F04Qt1AHHANThrk0w+XLu0At6sCCqekZOUi0
 YKaUzUOllgrHDXsM8mn5uV+eD0CpV9HVEYtL+sMTEOTZYoVEIF7uSKnClu9y1MM/qU5i
 OAMPylTBVRmvX0OWr/Jxu2pxpqhe3+tFkR9XS7V1f0Fqv30Ex1qqPMQqfT0qwGD25T42
 pwbOhWiVt1NSCyRWLdybsTG034IlCsF7hdJc6GGIWz20M5YN6WComECc+MAVIuYZuWvn
 kEmLcdjwmXBtEyTXjODpjV659wljqL6YOLWJQ2Ps0lLNskc71DwMPILOHsb9arou1LMQ
 poDA==
X-Gm-Message-State: AOAM530qButWsI1ELKTJ5c6f8pOP66QroYHlPXm5V2fay2eFz7piz1Mz
 mhRVrCaqB2ZyiQuXJbRi5YI=
X-Google-Smtp-Source: ABdhPJx9UVWl2QATjr14Rzm7ffphM7ov0jemL+A3lI8EdFT13kdZ4LTVJA4QnrU5JsRNxDzlWN+MVw==
X-Received: by 2002:a63:2948:: with SMTP id p69mr1014929pgp.15.1615845928470; 
 Mon, 15 Mar 2021 15:05:28 -0700 (PDT)
Received: from localhost ([2601:647:4600:11e1:d2fd:ba5d:619c:c25d])
 by smtp.gmail.com with ESMTPSA id m5sm14586097pfd.96.2021.03.15.15.05.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 15 Mar 2021 15:05:28 -0700 (PDT)
Date: Mon, 15 Mar 2021 15:05:26 -0700
From: Isaku Yamahata <isaku.yamahata@gmail.com>
To: Reinoud Zandijk <reinoud@NetBSD.org>
Subject: Re: Windows 10 won't run on default x86_64 machine anymore
Message-ID: <20210315220526.GB1004959@private.email.ne.jp>
References: <YE+SHIG8qQFMsEJl@diablo.13thmonkey.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YE+SHIG8qQFMsEJl@diablo.13thmonkey.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Received-SPF: pass client-ip=2607:f8b0:4864:20::42f;
 envelope-from=isaku.yamahata@gmail.com; helo=mail-pf1-x42f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Cc: qemu-devel@nongnu.org, isaku.yamahata@gmail.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Mar 15, 2021 at 05:58:04PM +0100,
Reinoud Zandijk <reinoud@NetBSD.org> wrote:

> I think its better to revert this and fix Linux ;) or make it a selectable
> feature as a workaround that's by default OFF :)

Anyway here is a patch to flip the default.
At the moment, this is compile-only tested to provide the change quickly
and make discussion progress.

From 50deeed38832ceccfb68f78dd66de5a1741b2897 Mon Sep 17 00:00:00 2001
Message-Id: <50deeed38832ceccfb68f78dd66de5a1741b2897.1615845421.git.isaku.yamahata@intel.com>
From: Isaku Yamahata <isaku.yamahata@intel.com>
Date: Mon, 15 Mar 2021 14:42:33 -0700
Subject: [PATCH] ich9, piix4: flip default value for smm-compat

Make default value for smm-compat of ich9, piix4 true to keep old
behavior.
To get new (and more conformance to ACPI spec) behavior, explicitly
set "-global ICH9-LPC.smm-compat=off" or
"-global PIIX4_PM.smm-compat=off".

Reported-by: Reinoud Zandijk <reinoud@NetBSD.org>
Fixes: 24cd04fce0 ("ich9, piix4: add property, smm-compat, to keep compatibility of SMM")
Signed-off-by: Isaku Yamahata <isaku.yamahata@intel.com>
---
 hw/acpi/piix4.c   | 2 +-
 hw/core/machine.c | 2 --
 hw/isa/lpc_ich9.c | 2 +-
 3 files changed, 2 insertions(+), 4 deletions(-)

diff --git a/hw/acpi/piix4.c b/hw/acpi/piix4.c
index 1efc0ded9f..34ade2c9bb 100644
--- a/hw/acpi/piix4.c
+++ b/hw/acpi/piix4.c
@@ -644,7 +644,7 @@ static Property piix4_pm_properties[] = {
                      use_acpi_root_pci_hotplug, true),
     DEFINE_PROP_BOOL("memory-hotplug-support", PIIX4PMState,
                      acpi_memory_hotplug.is_enabled, true),
-    DEFINE_PROP_BOOL("smm-compat", PIIX4PMState, smm_compat, false),
+    DEFINE_PROP_BOOL("smm-compat", PIIX4PMState, smm_compat, true),
     DEFINE_PROP_END_OF_LIST(),
 };
 
diff --git a/hw/core/machine.c b/hw/core/machine.c
index 4386f57b5c..e644c4e07d 100644
--- a/hw/core/machine.c
+++ b/hw/core/machine.c
@@ -37,8 +37,6 @@
 #include "hw/virtio/virtio-pci.h"
 
 GlobalProperty hw_compat_5_2[] = {
-    { "ICH9-LPC", "smm-compat", "on"},
-    { "PIIX4_PM", "smm-compat", "on"},
 };
 const size_t hw_compat_5_2_len = G_N_ELEMENTS(hw_compat_5_2);
 
diff --git a/hw/isa/lpc_ich9.c b/hw/isa/lpc_ich9.c
index 3963b73520..b7ff3a9747 100644
--- a/hw/isa/lpc_ich9.c
+++ b/hw/isa/lpc_ich9.c
@@ -775,7 +775,7 @@ static const VMStateDescription vmstate_ich9_lpc = {
 
 static Property ich9_lpc_properties[] = {
     DEFINE_PROP_BOOL("noreboot", ICH9LPCState, pin_strap.spkr_hi, true),
-    DEFINE_PROP_BOOL("smm-compat", ICH9LPCState, pm.smm_compat, false),
+    DEFINE_PROP_BOOL("smm-compat", ICH9LPCState, pm.smm_compat, true),
     DEFINE_PROP_BIT64("x-smi-broadcast", ICH9LPCState, smi_host_features,
                       ICH9_LPC_SMI_F_BROADCAST_BIT, true),
     DEFINE_PROP_BIT64("x-smi-cpu-hotplug", ICH9LPCState, smi_host_features,
-- 
2.25.1



-- 
Isaku Yamahata <isaku.yamahata@gmail.com>

