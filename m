Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C913A4953D5
	for <lists+qemu-devel@lfdr.de>; Thu, 20 Jan 2022 19:03:23 +0100 (CET)
Received: from localhost ([::1]:40290 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nAbmM-0005rS-Tv
	for lists+qemu-devel@lfdr.de; Thu, 20 Jan 2022 13:03:22 -0500
Received: from eggs.gnu.org ([209.51.188.92]:42544)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nAWgD-00045T-49
 for qemu-devel@nongnu.org; Thu, 20 Jan 2022 07:36:43 -0500
Received: from [2a00:1450:4864:20::330] (port=53889
 helo=mail-wm1-x330.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nAWgA-00036x-6o
 for qemu-devel@nongnu.org; Thu, 20 Jan 2022 07:36:40 -0500
Received: by mail-wm1-x330.google.com with SMTP id n8so11772861wmk.3
 for <qemu-devel@nongnu.org>; Thu, 20 Jan 2022 04:36:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=UNg+/lW+5h0MGsa47O6k0t0qB785eeAWvlGLgRNXpvM=;
 b=fLYn83uz9oO9Z3bBa6N6bTCdyiXGVWrHWfdsPIF/i8w26NvOzido8G0XoCpO0nfTNb
 oGskTaS0bbC5Aj2Oz7pTUUB/B/ZRH1MR8H2eECDdGZ1At6dYOm/T3nGibOLt+vnOc+dZ
 4XRENfVJrM+8ozg2x84upDlNL73ceQfNvhEoLG359toDtG/ZtoTZEk09Tl+v+1yay3DC
 lYK4wW610+rw8qAZ0dNrO5fLpAgzPxNNnjo9B1amttHtplhn+o6vEjtLBJcUsbBPKyS0
 USitaxV9kMpEX0GoshTRiEVpcXCrUgy5LPgk7FEcuMMbPEJg/fT41nM7ceukKyFEhDsv
 GqBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=UNg+/lW+5h0MGsa47O6k0t0qB785eeAWvlGLgRNXpvM=;
 b=glIxZYZE7qsDRgEKcwXKe/buvbDTX0zj7HlJxkls81lZAEuxIPjDG6MEzgPccPB/VS
 lg/OvU09cdkLWzRPRq1VlGYitiwitHSIp4nQhQVCMdgb40h2K9QB8pk9fDaYEwUrNqo/
 nGdyh7LSmHeAb+ncJ3vjLuxG23arvaRDKkqzSdyXDG9TrBVMp5N1mktVNFJJ7UU7JaTB
 LirbBbvkHljxrXMf6cxim+z/h/OcO2QPUoe9Sw666SPPbKejDRSH8nGM+dPh74hvi/Lv
 SGRAZhUm3WY9qN4afaeUmJSBvccgvsX1fcqajedgi7Tkow5ruXueWbiByxHg1zMmPRbM
 i3lw==
X-Gm-Message-State: AOAM532MvgRQSzZgSdzGnypjtjiNS3M/Yye1hUG6YFQBolktU0w6vAjf
 ClpohBiCrOrLFHD5O+RywEKaEqwLRB6BLw==
X-Google-Smtp-Source: ABdhPJyltj//iOKOjpkenYL/DJp5deuQUQIl79hVbKVQx5OT2KK74rQgf501tVcCDnYfEt/Pz0FjpA==
X-Received: by 2002:a05:600c:6020:: with SMTP id
 az32mr8527686wmb.149.1642682194495; 
 Thu, 20 Jan 2022 04:36:34 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id t8sm7993324wmq.43.2022.01.20.04.36.33
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 Jan 2022 04:36:33 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 02/38] hw: Move MARVELL_88W8618 Kconfig from audio/ to arm/
Date: Thu, 20 Jan 2022 12:35:54 +0000
Message-Id: <20220120123630.267975-3-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220120123630.267975-1-peter.maydell@linaro.org>
References: <20220120123630.267975-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::330
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::330;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x330.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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

From: Philippe Mathieu-Daudé <f4bug@amsat.org>

The Marvell 88W8618 is a system-on-chip with an ARM core.
We implement its audio codecs and network interface.
Homogeneous SoC Kconfig are usually defined in the hw/$ARCH
directory. Move it there.

Suggested-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Message-id: 20220107184429.423572-2-f4bug@amsat.org
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/arm/Kconfig   | 3 +++
 hw/audio/Kconfig | 3 ---
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/hw/arm/Kconfig b/hw/arm/Kconfig
index e6525909438..c459c897cc7 100644
--- a/hw/arm/Kconfig
+++ b/hw/arm/Kconfig
@@ -94,6 +94,9 @@ config MUSCA
     select SPLIT_IRQ
     select UNIMP
 
+config MARVELL_88W8618
+    bool
+
 config MUSICPAL
     bool
     select OR_IRQ
diff --git a/hw/audio/Kconfig b/hw/audio/Kconfig
index e9c6fed8261..e76c69ca7e7 100644
--- a/hw/audio/Kconfig
+++ b/hw/audio/Kconfig
@@ -47,6 +47,3 @@ config PL041
 
 config CS4231
     bool
-
-config MARVELL_88W8618
-    bool
-- 
2.25.1


