Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E09B4325F34
	for <lists+qemu-devel@lfdr.de>; Fri, 26 Feb 2021 09:38:41 +0100 (CET)
Received: from localhost ([::1]:35850 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lFYe0-0003nd-UX
	for lists+qemu-devel@lfdr.de; Fri, 26 Feb 2021 03:38:40 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41890)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1lFY8A-0001sC-7S
 for qemu-devel@nongnu.org; Fri, 26 Feb 2021 03:05:47 -0500
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f]:46152)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1lFY88-0004Bg-Dt
 for qemu-devel@nongnu.org; Fri, 26 Feb 2021 03:05:46 -0500
Received: by mail-wr1-x42f.google.com with SMTP id t15so7645553wrx.13
 for <qemu-devel@nongnu.org>; Fri, 26 Feb 2021 00:05:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=E0L8Sq6KiLJWfXw/sUSLMMArs29XR5X2eO596viPvco=;
 b=ssecy2zMBX+LcJoCeLe8Nv84U8VffItyE0aStBHywt1YhAw84fA9bj029bzPlkfEKx
 D/rO9MWDIQizpmqRw8Hloh9AKamCvSKVhI9o0S0tId6SldK9T7zzRzW9JwO1rvJLYiiT
 5/NOdNxM9x7vrKR71eyZE1eYpEPJ9WsjUAMKlH5WEkrOlUWPQxlAqYQOLTiV6DZmeS3R
 viB43g04+FUAoYkRMSU3tIsaRrTfjLUsX53RCOEG/przGYXaNHHwo2u4schpeZamc8JC
 qyMf7+XF6vg0el7Yiw0Yu8w5wDf8JsbJ8zzsM2h9P6nIrMcNX8mB6dxj2iBUaUnEsi/j
 1gLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=E0L8Sq6KiLJWfXw/sUSLMMArs29XR5X2eO596viPvco=;
 b=DuEt0EAeLeSncdN+l60lPBWI3mXxxFU04PO0PZiCrBiy0JrBG1L/uhw5b1qgBnBWwZ
 s0xyqU25LKWseIYnPruBDHD+eW7bMhjDRbIWi/dt+lA6NSPFymyK1pTvD7w5CMlg9fwM
 NlkFxxO3Qjernc3DTGG41/9bDSh3Y+hFWeEN6K3BPaLDnEt1k1wx6vX9A7GHmFVOZuA5
 6aXlpZEnyV54P/+7xwmK8t8pxDEG/FajN28vVVNYKfh33Dnq2ASut7DF1j9uH7hlK3jJ
 on94D3s01MxI1DzHBQxEVhYq4Et5tzVcHpbTUWA06SjdeZMAnmLciG8t+BLcDix97fid
 ZCaQ==
X-Gm-Message-State: AOAM533NuYTE34zW1u+B7JOI0VtxFZ+peL3N9n3/x3Z9OcuqPpP/erGT
 uaPJ19e/tpkQ/l1i4nh5JWRorZH4s5A=
X-Google-Smtp-Source: ABdhPJzkxdOA/Okw4Q2Eo9ozEYiMvHCUbM/AW1IfQj0ThqanKaYtoqTo/QNCks2z7W55kH1KgBm8AQ==
X-Received: by 2002:a5d:6b47:: with SMTP id x7mr1902684wrw.170.1614326742721; 
 Fri, 26 Feb 2021 00:05:42 -0800 (PST)
Received: from avogadro.lan ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id n66sm10700830wmn.25.2021.02.26.00.05.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 26 Feb 2021 00:05:42 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 23/29] docs: update to show preferred boolean syntax for -cpu
Date: Fri, 26 Feb 2021 09:05:20 +0100
Message-Id: <20210226080526.651705-24-pbonzini@redhat.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210226080526.651705-1-pbonzini@redhat.com>
References: <20210226080526.651705-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42f;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-wr1-x42f.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Daniel P. Berrangé <berrange@redhat.com>

The preferred syntax is to use "foo=on|off", rather than a bare
"+foo" or "-foo"

Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
Message-Id: <20210216191027.595031-10-berrange@redhat.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 docs/COLO-FT.txt                   | 4 ++--
 docs/interop/firmware.json         | 2 +-
 docs/system/cpu-models-x86.rst.inc | 4 ++--
 3 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/docs/COLO-FT.txt b/docs/COLO-FT.txt
index 8874690e83..8d6d53a5a2 100644
--- a/docs/COLO-FT.txt
+++ b/docs/COLO-FT.txt
@@ -158,7 +158,7 @@ instance.
 
 # imagefolder="/mnt/vms/colo-test-primary"
 
-# qemu-system-x86_64 -enable-kvm -cpu qemu64,+kvmclock -m 512 -smp 1 -qmp stdio \
+# qemu-system-x86_64 -enable-kvm -cpu qemu64,kvmclock=on -m 512 -smp 1 -qmp stdio \
    -device piix3-usb-uhci -device usb-tablet -name primary \
    -netdev tap,id=hn0,vhost=off,helper=/usr/lib/qemu/qemu-bridge-helper \
    -device rtl8139,id=e0,netdev=hn0 \
@@ -189,7 +189,7 @@ any IP's here, except for the $primary_ip variable.
 
 # qemu-img create -f qcow2 $imagefolder/secondary-hidden.qcow2 10G
 
-# qemu-system-x86_64 -enable-kvm -cpu qemu64,+kvmclock -m 512 -smp 1 -qmp stdio \
+# qemu-system-x86_64 -enable-kvm -cpu qemu64,kvmclock=on -m 512 -smp 1 -qmp stdio \
    -device piix3-usb-uhci -device usb-tablet -name secondary \
    -netdev tap,id=hn0,vhost=off,helper=/usr/lib/qemu/qemu-bridge-helper \
    -device rtl8139,id=e0,netdev=hn0 \
diff --git a/docs/interop/firmware.json b/docs/interop/firmware.json
index 989f10b626..9d94ccafa9 100644
--- a/docs/interop/firmware.json
+++ b/docs/interop/firmware.json
@@ -129,7 +129,7 @@
 #                "-machine smm=on". (On the "pc-q35-*" machine types of
 #                the @i386 emulation target, @requires-smm presents
 #                further CPU requirements; one combination known to work
-#                is "-cpu coreduo,-nx".) If the firmware is marked as
+#                is "-cpu coreduo,nx=off".) If the firmware is marked as
 #                both @secure-boot and @requires-smm, then write
 #                accesses to the pflash chip (NVRAM) that holds the UEFI
 #                variable store must be restricted to code that executes
diff --git a/docs/system/cpu-models-x86.rst.inc b/docs/system/cpu-models-x86.rst.inc
index 9a2327828e..867c8216b5 100644
--- a/docs/system/cpu-models-x86.rst.inc
+++ b/docs/system/cpu-models-x86.rst.inc
@@ -364,7 +364,7 @@ Host passthrough with feature customization:
 
 .. parsed-literal::
 
-  |qemu_system| -cpu host,-vmx,...
+  |qemu_system| -cpu host,vmx=off,...
 
 Named CPU models:
 
@@ -376,7 +376,7 @@ Named CPU models with feature customization:
 
 .. parsed-literal::
 
-  |qemu_system| -cpu Westmere,+pcid,...
+  |qemu_system| -cpu Westmere,pcid=on,...
 
 Libvirt guest XML
 ^^^^^^^^^^^^^^^^^
-- 
2.29.2



