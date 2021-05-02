Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3894B370DFD
	for <lists+qemu-devel@lfdr.de>; Sun,  2 May 2021 18:35:05 +0200 (CEST)
Received: from localhost ([::1]:59134 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ldF3g-0005w3-9m
	for lists+qemu-devel@lfdr.de; Sun, 02 May 2021 12:35:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36318)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1ldEmQ-00064I-Ga
 for qemu-devel@nongnu.org; Sun, 02 May 2021 12:17:15 -0400
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d]:45750)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1ldEmN-0007h6-P9
 for qemu-devel@nongnu.org; Sun, 02 May 2021 12:17:12 -0400
Received: by mail-wm1-x32d.google.com with SMTP id
 s5-20020a7bc0c50000b0290147d0c21c51so2116260wmh.4
 for <qemu-devel@nongnu.org>; Sun, 02 May 2021 09:17:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=J/y1ixRwBU6yKoocpZNA8qfYNVL0ZltPQY4AVdwAq4I=;
 b=noUWPLgKsVjTTgmEy8LgLDNOM1xdGOCzVGH8yThHmdZIIRLC5Ay1hL0m0aMytyGobE
 qPAgsgbZsAFacM4t5LgUdl9EbkVrsoSvciTii17Lq/bWps8sZPJ9wgK5NCssMcr/VglP
 CyPky/DlXB4lbDBNyn/Akx/E/0nMbeNEmWYhjSY+sZ2Vgn/LqSkR73bMBt2DZv55kgx1
 sMjs46lEVYm4MRx3e7nwcXtvosDSafxiDpEGwz3+5dLGSXKU3tExkgI+cqzpDoQJ9AFD
 8CRDsuVErzbmRpwLEwMmU+kKqMsYIQcK5at+oJFkz8A0LW7LJCPDM2QDp+MMggsgnEKA
 5RVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=J/y1ixRwBU6yKoocpZNA8qfYNVL0ZltPQY4AVdwAq4I=;
 b=X8g1n//5CMBL+psq+jum2Xy8H1a8fKjg9sOSVnaIQOrk+wPywLCKZC1wfEanm83gt8
 0AIJLFg43ac982Gm3D6AndGHroTZNjJP6Jr6gkdGOzAKBpFxEm3OuNr4ECf73W57Cjdr
 rW8g8bmpOGPrAKBUF8+dwJsfzDPUZU3ZxI2m/JznBi3HlVTOkchx20R9EYIky8wur5GZ
 xa8JdMsU/Rgoq980C4jtkwzyWVOiAvT2eBmMcFSjMp7r9y9kcne/BHTmwOcyJTEWq+SJ
 myrjg13o4vxINErpiFxlptGruvGJcx2cQ6PorF8triJrcCrXm5iawnYPPXuMaSm+KZHX
 kHQw==
X-Gm-Message-State: AOAM532rZRuZZj4GSwcaLKmn/nhctnBwglAjlbaD2yicw6if4Iq1RhEt
 BgsC/cbZLP1qTi3hNDgN7lM++QGtHt9RirGV
X-Google-Smtp-Source: ABdhPJzTD3jA62IrOJjyg97VIgSkW25mLucuZExZdOfY8Mg1nNsaJaYNYsmYdCY4FeLzIilh+oD3rA==
X-Received: by 2002:a7b:c047:: with SMTP id u7mr27849375wmc.98.1619972230294; 
 Sun, 02 May 2021 09:17:10 -0700 (PDT)
Received: from localhost.localdomain
 (anancy-651-1-208-144.w109-217.abo.wanadoo.fr. [109.217.237.144])
 by smtp.gmail.com with ESMTPSA id m13sm8825049wrw.86.2021.05.02.09.17.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 02 May 2021 09:17:09 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PULL 17/36] meson: Introduce meson_user_arch source set for
 arch-specific user-mode
Date: Sun,  2 May 2021 18:15:19 +0200
Message-Id: <20210502161538.534038-18-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20210502161538.534038-1-f4bug@amsat.org>
References: <20210502161538.534038-1-f4bug@amsat.org>
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
Cc: Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Huacai Chen <chenhuacai@kernel.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Similarly to the 'target_softmmu_arch' source set which allows
to restrict target-specific sources to system emulation, add
the equivalent 'target_user_arch' set for user emulation.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Message-Id: <20210428170410.479308-12-f4bug@amsat.org>
---
 meson.build | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/meson.build b/meson.build
index d8bb1ec5aa9..1ffdc9e6c4e 100644
--- a/meson.build
+++ b/meson.build
@@ -1751,6 +1751,7 @@
 hw_arch = {}
 target_arch = {}
 target_softmmu_arch = {}
+target_user_arch = {}
 
 ###############
 # Trace files #
@@ -2168,6 +2169,11 @@
     abi = config_target['TARGET_ABI_DIR']
     target_type='user'
     qemu_target_name = 'qemu-' + target_name
+    if arch in target_user_arch
+      t = target_user_arch[arch].apply(config_target, strict: false)
+      arch_srcs += t.sources()
+      arch_deps += t.dependencies()
+    endif
     if 'CONFIG_LINUX_USER' in config_target
       base_dir = 'linux-user'
       target_inc += include_directories('linux-user/host/' / config_host['ARCH'])
-- 
2.26.3


