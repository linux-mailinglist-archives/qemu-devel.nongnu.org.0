Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A02472EE998
	for <lists+qemu-devel@lfdr.de>; Fri,  8 Jan 2021 00:10:18 +0100 (CET)
Received: from localhost ([::1]:54412 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kxeQ5-00047V-NE
	for lists+qemu-devel@lfdr.de; Thu, 07 Jan 2021 18:10:17 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47890)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kxdlm-00069L-Iu
 for qemu-devel@nongnu.org; Thu, 07 Jan 2021 17:28:38 -0500
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335]:37609)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kxdll-0006jw-2y
 for qemu-devel@nongnu.org; Thu, 07 Jan 2021 17:28:38 -0500
Received: by mail-wm1-x335.google.com with SMTP id q75so6845256wme.2
 for <qemu-devel@nongnu.org>; Thu, 07 Jan 2021 14:28:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=D0ZV7Tyr2j4fG9lWfj8Aj9YT0gOWwwyKM8Utajfqaqw=;
 b=uL1azVrMrokowUnmYU/jXaVk+Ba4uvSXR1nKEuFGEOMYHVweWhLEPVOzvjfhinZhMx
 XS/XYqhbmlkJNGcyhrzTeVjtCdE7/On5B8TpkyPHPsqLipGsiNRl4GJ4uLTPXBX+IcTp
 DlfYYtsw3kFz5JSQSOeGUlQ+1XBVdgMSjWhgDA9P0Tr/jUlXbRJqBMuE9OT2i+D0xPvr
 BSFBLVE6NzguPiutbZJWNT7iNVekOdsrDrZ/Jlx3fDANLXV9gi5g628fmwrLounbePqi
 J5QK3FiCTobV5aIAA3UNr4+BtwCmQPW42xoZL+nVdv2uZ9FZ6AaMcPWAfVpj3rEkKjSn
 8+Gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=D0ZV7Tyr2j4fG9lWfj8Aj9YT0gOWwwyKM8Utajfqaqw=;
 b=Dn2WeZYrf9diEwHbyS/qlY3+xTaM5rnrnwPXz7ndXiajHcS6dOEcSdDfcFPTlHnf4u
 d8Z1wkjx+JRB/v0HmSxTM7vBfeoV+ljaCRFURI20iskGFHbccbDlG7w3vTdRxAot5Myd
 C+j5+KUSzhAnyup2yD3Z8GX8cWJJXTz6HCbJfSwkWDIjyCzUuPX0IKCsYCJ19qY8zfu3
 JkqXqPQxKRtmBbgBP21UHDdc1evllTMiOTdiBdr4aqh0+QP+7r6itoixgSDjOZTEgZKw
 /wnch7OFwnxvAZWNIfhRIua7WpBpgMk6VmEJyW2jBSJu0602XztKXN1zTzkQySqIwDcx
 PtPg==
X-Gm-Message-State: AOAM530vBXe8I6Q/+I/07NEh+QZ9WhIULp99AaFkeQ71uv8zadyRTdpc
 jl9+ndue5qLnyMdNLfJ0JmNClVtV79s=
X-Google-Smtp-Source: ABdhPJwTubkYm60fTqneKGYSwtRCJWkNzO9wICrkxUQL5Qd4H9Q/yF7YPiKn9A1Eda9+ks8qWYLV/A==
X-Received: by 2002:a7b:c208:: with SMTP id x8mr491314wmi.179.1610058515651;
 Thu, 07 Jan 2021 14:28:35 -0800 (PST)
Received: from x1w.redhat.com (241.red-88-10-103.dynamicip.rima-tde.net.
 [88.10.103.241])
 by smtp.gmail.com with ESMTPSA id s13sm10723025wra.53.2021.01.07.14.28.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 Jan 2021 14:28:35 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PULL 66/66] docs/system: Remove deprecated 'fulong2e' machine alias
Date: Thu,  7 Jan 2021 23:22:53 +0100
Message-Id: <20210107222253.20382-67-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210107222253.20382-1-f4bug@amsat.org>
References: <20210107222253.20382-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::335;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x335.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.248,
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
Cc: Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Paul Burton <paulburton@kernel.org>, kvm@vger.kernel.org,
 libvir-list@redhat.com, Huacai Chen <chenhuacai@kernel.org>,
 Laurent Vivier <laurent@vivier.eu>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Thomas Huth <huth@tuxfamily.org>, Paolo Bonzini <pbonzini@redhat.com>,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The 'fulong2e' machine alias has been marked as deprecated since
QEMU v5.1 (commit c3a09ff68dd, the machine is renamed 'fuloong2e').
Time to remove it now.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Huacai Chen <chenhuacai@kernel.org>
Reviewed-by: Thomas Huth <huth@tuxfamily.org>
Message-Id: <20210106184602.3771551-1-f4bug@amsat.org>
---
 docs/system/deprecated.rst       | 5 -----
 docs/system/removed-features.rst | 5 +++++
 hw/mips/fuloong2e.c              | 1 -
 3 files changed, 5 insertions(+), 6 deletions(-)

diff --git a/docs/system/deprecated.rst b/docs/system/deprecated.rst
index bacd76d7a58..e20bfcb17a4 100644
--- a/docs/system/deprecated.rst
+++ b/docs/system/deprecated.rst
@@ -309,11 +309,6 @@ The 'scsi-disk' device is deprecated. Users should use 'scsi-hd' or
 System emulator machines
 ------------------------
 
-mips ``fulong2e`` machine (since 5.1)
-'''''''''''''''''''''''''''''''''''''
-
-This machine has been renamed ``fuloong2e``.
-
 ``pc-1.0``, ``pc-1.1``, ``pc-1.2`` and ``pc-1.3`` (since 5.0)
 '''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
 
diff --git a/docs/system/removed-features.rst b/docs/system/removed-features.rst
index 8b20d78a4d0..430fc33ca18 100644
--- a/docs/system/removed-features.rst
+++ b/docs/system/removed-features.rst
@@ -120,6 +120,11 @@ mips ``r4k`` platform (removed in 5.2)
 This machine type was very old and unmaintained. Users should use the ``malta``
 machine type instead.
 
+mips ``fulong2e`` machine alias (removed in 6.0)
+''''''''''''''''''''''''''''''''''''''''''''''''
+
+This machine has been renamed ``fuloong2e``.
+
 Related binaries
 ----------------
 
diff --git a/hw/mips/fuloong2e.c b/hw/mips/fuloong2e.c
index 29805242caa..bac2adbd5ae 100644
--- a/hw/mips/fuloong2e.c
+++ b/hw/mips/fuloong2e.c
@@ -383,7 +383,6 @@ static void mips_fuloong2e_init(MachineState *machine)
 static void mips_fuloong2e_machine_init(MachineClass *mc)
 {
     mc->desc = "Fuloong 2e mini pc";
-    mc->alias = "fulong2e";             /* Incorrect name used up to QEMU 4.2 */
     mc->init = mips_fuloong2e_init;
     mc->block_default_type = IF_IDE;
     mc->default_cpu_type = MIPS_CPU_TYPE_NAME("Loongson-2E");
-- 
2.26.2


