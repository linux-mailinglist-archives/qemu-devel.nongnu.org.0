Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 228F42CF6DB
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Dec 2020 23:36:48 +0100 (CET)
Received: from localhost ([::1]:42142 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1klJh0-0001WY-Tf
	for lists+qemu-devel@lfdr.de; Fri, 04 Dec 2020 17:36:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43678)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1klJXK-0002bR-UJ
 for qemu-devel@nongnu.org; Fri, 04 Dec 2020 17:26:48 -0500
Received: from mail-ej1-x642.google.com ([2a00:1450:4864:20::642]:36795)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1klJXG-0007yg-2k
 for qemu-devel@nongnu.org; Fri, 04 Dec 2020 17:26:43 -0500
Received: by mail-ej1-x642.google.com with SMTP id lt17so10937971ejb.3
 for <qemu-devel@nongnu.org>; Fri, 04 Dec 2020 14:26:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=0iMc1U7Wr361oFMAzFxSwxjYvRlBdQYyBbE2x1GpfLY=;
 b=cOJh4EpcQddvYd+em79PFhqU0Io2qESFHQBdQ8yxfP/tyRFNzED6DaGwchRPCMxBZi
 APM0Io94qqn7jnuD2SMX00YiQT/mDUSOv5wK0muE78vi3m9T0R/Rw+RcVOiNrAOzwx19
 B3z/SPNsijzb772pvf8CvRHOoOF2QJYtmFBIE5TBAZRDlMegEqm+s+YnP6AVz9ivAPWi
 9lr10aKIBFtGXiUTJz30YbaDfTT2/4G4jOUnBjmj9y2/wp9A6L4g826B4fDunHibYX7u
 SyKzPuD7dB2WqkXRZ8DDCpuBHLfkkytApuuCagNvynQbS/EVAqhilSEUdfT5Pm2H+cUV
 tgAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=0iMc1U7Wr361oFMAzFxSwxjYvRlBdQYyBbE2x1GpfLY=;
 b=ic++xDmK6OIypj17k6aYXq1SkXKfFpvi9gudhuJ6R6aDozrn3c/aJjH5G035yVlh3D
 l+637DBYTyOn9nRcSvGV9iBOaQYt1l3z1noH2RtfKHJwsdZ5OgtMXO5ay6ZheiYeA+6J
 U7vi0/jHxPil/Kf8dZ6FM/459FxchT4jTnKwq8DomPt//1s/Mx8i62/46v4HsXqKa4cT
 1oCJV9PjU3VAmH3tWDGQAnARD0a+FX3U3/P65nc939cSuVrvzVSSwumwJ25uw3OCv8BU
 FypCV/q0BLzebx6AGN0b7haFowd2HPHh44N05lckuiko6LJsaxRQz3/2xCwYgif3J6Fz
 bBYQ==
X-Gm-Message-State: AOAM530mJ5aBmL9KDo0tUDNhEMXL9zCAC4OKOcug1T8EwcCezpPWrsye
 RDNb/OWFpBzGntuqjRMjP+g=
X-Google-Smtp-Source: ABdhPJwig11YAraxAu9UTLlVDbDCJv8YRpFzxGkxBy7pWl080A5kCOLDwhymcIaWsk0+sFRmItMK6w==
X-Received: by 2002:a17:906:8c7:: with SMTP id
 o7mr9538671eje.413.1607120800813; 
 Fri, 04 Dec 2020 14:26:40 -0800 (PST)
Received: from x1w.redhat.com (111.red-88-21-205.staticip.rima-tde.net.
 [88.21.205.111])
 by smtp.gmail.com with ESMTPSA id lz17sm3989348ejb.19.2020.12.04.14.26.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Dec 2020 14:26:40 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: Jiaxun Yang <jiaxun.yang@flygoat.com>, Huacai Chen <chenhc@lemote.com>,
 qemu-devel@nongnu.org
Subject: [PATCH 3/5] target/mips: Do not initialize MT registers if MT ASE
 absent
Date: Fri,  4 Dec 2020 23:26:20 +0100
Message-Id: <20201204222622.2743175-4-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201204222622.2743175-1-f4bug@amsat.org>
References: <20201204222622.2743175-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::642;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-ej1-x642.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
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
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Do not initialize MT-related config registers if the MT ASE
is not present. As some functions access the 'mvp' structure,
we still zero-allocate it.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 target/mips/translate_init.c.inc | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/target/mips/translate_init.c.inc b/target/mips/translate_init.c.inc
index 5a926bc6df3..f72fee3b40a 100644
--- a/target/mips/translate_init.c.inc
+++ b/target/mips/translate_init.c.inc
@@ -993,6 +993,10 @@ static void mvp_init(CPUMIPSState *env)
 {
     env->mvp = g_malloc0(sizeof(CPUMIPSMVPContext));
 
+    if (!ase_mt_available(env)) {
+        return;
+    }
+
     /* MVPConf1 implemented, TLB sharable, no gating storage support,
        programmable cache partitioning implemented, number of allocatable
        and shareable TLB entries, MVP has allocatable TCs, 2 VPEs
-- 
2.26.2


