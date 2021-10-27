Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F67E43C13F
	for <lists+qemu-devel@lfdr.de>; Wed, 27 Oct 2021 06:19:51 +0200 (CEST)
Received: from localhost ([::1]:44446 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mfaPm-0003Df-13
	for lists+qemu-devel@lfdr.de; Wed, 27 Oct 2021 00:19:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46488)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mfaKn-0004pZ-JV
 for qemu-devel@nongnu.org; Wed, 27 Oct 2021 00:14:41 -0400
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431]:40492)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mfaKl-0003iE-Vx
 for qemu-devel@nongnu.org; Wed, 27 Oct 2021 00:14:41 -0400
Received: by mail-wr1-x431.google.com with SMTP id e4so1764201wrc.7
 for <qemu-devel@nongnu.org>; Tue, 26 Oct 2021 21:14:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=XMnK6GnkZ+UJPLdU7DkwFrpeJ1L9HDlUCWqeiwF9GZU=;
 b=Xn+ncPE8lCfALd/637jNMOzaFIoZrE2ZxBKfCj5SynshdMWNsCsyBRRGprQzyMr/Vn
 QrstSA/zhGVZNokX4e7mLoGKvGmqSb6WTJdECK6LNS7azz67KOpzEcMiVSot62XMN5dG
 FJ6MZfsieDIKCpWcY1OOgZ2NL89748MIcqSQhCiAfRCOencGN+ZyZ2Yt/jzsCSI3kS9X
 lLlHuSg+QA9lLRimbDKWIHESRWeruooB8FWDaT/69+03czBd3E0hPzI+xeHkHeF7j7Rj
 dDeam6ugb0AKjhII8CDpOXHKLDMjggOQx2HG3m/I3eF/DvYkaJMjK758/MSoSRjgwd4h
 v33Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=XMnK6GnkZ+UJPLdU7DkwFrpeJ1L9HDlUCWqeiwF9GZU=;
 b=RH19RzgZR24r96Px0JUuGVUr8ileQBhWb9HjqLVagZ8/1gQy9y8/pS+iIlPdzyUHBq
 zMLeB5vWscTB8NWX92fvyF+1gSusa8ryzqZvVmP6vCTCgiTau+bzB6JueSUmhym4AyTD
 PBJIWx88GG8NbVsmnW2Z3jd8+3/WIliUIjQ3uiURzJvJMsy48L6M6/QD6TBel9I+7Y1T
 2AD8MOArBOQj47zo3TuNW0ZAo49N3zo+1Rpo+AOeOG+1e7uiKD6c+bxOXm7jnyJ5AH5c
 RLaO6TzzC9mK7d+tzsl0tgi6vQwGJXV3GkYTBR+UxxeGZPpKwLWJeAqFB5zr+ToE0dCH
 hyRg==
X-Gm-Message-State: AOAM533qs8IwnHsrXJFYhwSIo3Xgc/0vsv5rtkk+DNVSNwZ5MhQTkPiz
 qi6CJMPKEcvKgonJrZBct7ASPkC3Ujo=
X-Google-Smtp-Source: ABdhPJxf7absQzPxx1fSqc5nBNOAWonbTSdw34nqvHT3G3oNX8WxfQQ13qzKmr7OlmOUXjH3nLQNQw==
X-Received: by 2002:a05:6000:1689:: with SMTP id
 y9mr36987377wrd.52.1635308078604; 
 Tue, 26 Oct 2021 21:14:38 -0700 (PDT)
Received: from x1w.redhat.com (62.red-83-57-168.dynamicip.rima-tde.net.
 [83.57.168.62])
 by smtp.gmail.com with ESMTPSA id n10sm497499wmq.24.2021.10.26.21.14.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 26 Oct 2021 21:14:38 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 4/4] MAINTAINERS: Agree to maintain nanoMIPS TCG frontend
Date: Wed, 27 Oct 2021 06:14:16 +0200
Message-Id: <20211027041416.1237433-5-f4bug@amsat.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211027041416.1237433-1-f4bug@amsat.org>
References: <20211027041416.1237433-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::431;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x431.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
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
Cc: Paul Burton <paulburton@kernel.org>, libvir-list@redhat.com,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Petar Jovanovic <petar.jovanovic@syrmia.com>,
 Vince Del Vecchio <Vince.DelVecchio@mediatek.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

As of this commit, the nanoMIPS toolchains haven't been merged
in mainstream projects. However MediaTek provides a toolchain:
https://github.com/MediaTek-Labs/nanomips-gnu-toolchain/releases/tag/nanoMIPS-2021.02-01

QEMU deprecation policy schedules code for removal. If we don't
need / want to remove, we should un-deprecated [*].

Since I now have spent more time with the ISA, I agree to maintain
it along with the other MIPS ISA. Therefore remove its deprecation
notice.

For historical notes, see commit a60442eb8 ("Deprecate nanoMIPS ISA").

[*] https://lore.kernel.org/qemu-devel/YVx7YGqUENP83vNF@redhat.com/

Cc: Vince Del Vecchio <Vince.DelVecchio@mediatek.com>
Cc: Petar Jovanovic <petar.jovanovic@syrmia.com>
Reviewed-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
v2: un-deprecate (danpb)
---
 docs/about/deprecated.rst | 23 -----------------------
 MAINTAINERS               |  6 +-----
 2 files changed, 1 insertion(+), 28 deletions(-)

diff --git a/docs/about/deprecated.rst b/docs/about/deprecated.rst
index 0bed6ecb1da..5f4e4eeb2b0 100644
--- a/docs/about/deprecated.rst
+++ b/docs/about/deprecated.rst
@@ -246,13 +246,6 @@ System emulator CPUS
 ``Icelake-Client`` CPU Models are deprecated. Use ``Icelake-Server`` CPU
 Models instead.
 
-MIPS ``I7200`` CPU Model (since 5.2)
-''''''''''''''''''''''''''''''''''''
-
-The ``I7200`` guest CPU relies on the nanoMIPS ISA, which is deprecated
-(the ISA has never been upstreamed to a compiler toolchain). Therefore
-this CPU is also deprecated.
-
 
 QEMU API (QAPI) events
 ----------------------
@@ -342,13 +335,6 @@ The ``ppc64abi32`` architecture has a number of issues which regularly
 trip up our CI testing and is suspected to be quite broken. For that
 reason the maintainers strongly suspect no one actually uses it.
 
-MIPS ``I7200`` CPU (since 5.2)
-''''''''''''''''''''''''''''''
-
-The ``I7200`` guest CPU relies on the nanoMIPS ISA, which is deprecated
-(the ISA has never been upstreamed to a compiler toolchain). Therefore
-this CPU is also deprecated.
-
 Related binaries
 ----------------
 
@@ -380,12 +366,3 @@ point to a version that doesn't break runnability guarantees
 versions, aliases will point to newer CPU model versions
 depending on the machine type, so management software must
 resolve CPU model aliases before starting a virtual machine.
-
-Guest Emulator ISAs
--------------------
-
-nanoMIPS ISA
-''''''''''''
-
-The ``nanoMIPS`` ISA has never been upstreamed to any compiler toolchain.
-As it is hard to generate binaries for it, declare it deprecated.
diff --git a/MAINTAINERS b/MAINTAINERS
index efcfa57cd6a..71b198139c8 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -237,14 +237,10 @@ R: Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>
 S: Odd Fixes
 F: target/mips/
 F: disas/mips.c
+X: disas/nanomips.*
 F: docs/system/cpu-models-mips.rst.inc
 F: tests/tcg/mips/
 
-MIPS TCG CPUs (nanoMIPS ISA)
-S: Orphan
-F: disas/nanomips.*
-F: target/mips/tcg/*nanomips*
-
 NiosII TCG CPUs
 M: Chris Wulff <crwulff@gmail.com>
 M: Marek Vasut <marex@denx.de>
-- 
2.31.1


