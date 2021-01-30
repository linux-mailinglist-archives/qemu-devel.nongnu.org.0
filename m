Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C34A9309167
	for <lists+qemu-devel@lfdr.de>; Sat, 30 Jan 2021 02:58:58 +0100 (CET)
Received: from localhost ([::1]:54910 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l5fXN-0006U8-Gu
	for lists+qemu-devel@lfdr.de; Fri, 29 Jan 2021 20:58:57 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40446)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1l5fRM-0006g0-CJ; Fri, 29 Jan 2021 20:52:44 -0500
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d]:39535)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1l5fRK-0008Us-Op; Fri, 29 Jan 2021 20:52:43 -0500
Received: by mail-wm1-x32d.google.com with SMTP id u14so8523868wmq.4;
 Fri, 29 Jan 2021 17:52:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=G9dNmRIohMTgXAElzkQ+lpMLRmxhHG61au1rY6dJdIw=;
 b=PEjpazXUgk6kR6UqDmwU45UySoXQLcz5AUjh6P8ScUgFkBsPisn+Tm/qm9hBMUWlxU
 bXEcLJ8UugY9aEVPQbo6p4m/Hux6j9xRlGgX4nFBl3CdGdq2BBIrSjLEO86Z4aoFc8pO
 sOUDNxqSQ0sq11WskYH43JUY8ipQhlYj/w/bYvz/VXaBRpbw+O5FYEX3aiwba24dV37x
 eXoZz8Ukp5kBBqvvXXbiR7M0vIrCWLxvkVDzdRwwembHyYCl3SSmuG6HSoiE25+STMef
 fVEoHq1XKPD0QMR5koqBX/Yf7PEsrpn+QnhlP/GxxXqA9IDdom/mYPcwNcgu4Y2ATxaQ
 whbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=G9dNmRIohMTgXAElzkQ+lpMLRmxhHG61au1rY6dJdIw=;
 b=KbV4sAiA36R4qUDTgcCl/qrBAkfis1jFNh/rcAMjxgSB2nH1ReOVRal3BJ484zuABf
 rW3KYIbOO67KIdGxADr7lmms6QrAAdUbvXk79rx1mKxHZ4VcwyJhvF+drk/N0nz/Ad4N
 MXP0IUT4rghtoeQq7IoLGI82aHWwlNPSHB2AOsP0I0GD8TirX95MbMPnamf7dGqGknR+
 4T4s4FSvPc2GjGhgquqoF/dNjvGbHF54ftWtGYbolEXTZbzY682rHeLbMqpJ/pLTwy3M
 ys5xBhld1WMOIDVNdU/bfD+Z1Y6xGclyA7hGbkKCrwk6VWc9eelkbgR9al976KBM0Ah2
 tJVw==
X-Gm-Message-State: AOAM530yW2rUUON9tCFsHw9uuCqAMcQjKL+sTrCxgrki/kgCZwwRXfwv
 7dGvS2q8GhEEpNj8TdkiFWCDwrBN9M4=
X-Google-Smtp-Source: ABdhPJwskto+f53o9TCaynYuVK8iQ1uBoTdTN+CKWcrz2acq5nnSN55h/BCj1DXRiUJLZD6Cr+Hp6Q==
X-Received: by 2002:a1c:21c6:: with SMTP id h189mr5786718wmh.173.1611971560647; 
 Fri, 29 Jan 2021 17:52:40 -0800 (PST)
Received: from localhost.localdomain (13.red-83-57-169.dynamicip.rima-tde.net.
 [83.57.169.13])
 by smtp.gmail.com with ESMTPSA id w126sm12485133wma.43.2021.01.29.17.52.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 29 Jan 2021 17:52:40 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 02/11] default-configs: Remove unnecessary SEMIHOSTING
 selection
Date: Sat, 30 Jan 2021 02:52:18 +0100
Message-Id: <20210130015227.4071332-3-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210130015227.4071332-1-f4bug@amsat.org>
References: <20210130015227.4071332-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32d;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x32d.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
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
Cc: Fam Zheng <fam@euphon.net>, Peter Maydell <peter.maydell@linaro.org>,
 Thomas Huth <thuth@redhat.com>, kvm@vger.kernel.org,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 qemu-arm@nongnu.org, Claudio Fontana <cfontana@suse.de>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Richard Henderson <rth@twiddle.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Commit 56b5170c87e ("semihosting: Move ARM semihosting code to
shared directories") selected ARM_COMPATIBLE_SEMIHOSTING which
already selects SEMIHOSTING. No need to select it again.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 default-configs/devices/arm-softmmu.mak | 1 -
 1 file changed, 1 deletion(-)

diff --git a/default-configs/devices/arm-softmmu.mak b/default-configs/devices/arm-softmmu.mak
index 0500156a0c7..341d439de6f 100644
--- a/default-configs/devices/arm-softmmu.mak
+++ b/default-configs/devices/arm-softmmu.mak
@@ -41,6 +41,5 @@ CONFIG_MICROBIT=y
 CONFIG_FSL_IMX25=y
 CONFIG_FSL_IMX7=y
 CONFIG_FSL_IMX6UL=y
-CONFIG_SEMIHOSTING=y
 CONFIG_ARM_COMPATIBLE_SEMIHOSTING=y
 CONFIG_ALLWINNER_H3=y
-- 
2.26.2


