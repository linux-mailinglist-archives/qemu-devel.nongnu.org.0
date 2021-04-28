Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D4FED36DE8A
	for <lists+qemu-devel@lfdr.de>; Wed, 28 Apr 2021 19:40:41 +0200 (CEST)
Received: from localhost ([::1]:43640 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lboAy-0006FE-Tm
	for lists+qemu-devel@lfdr.de; Wed, 28 Apr 2021 13:40:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41152)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lbneY-0001px-3s
 for qemu-devel@nongnu.org; Wed, 28 Apr 2021 13:07:11 -0400
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a]:45645)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lbneW-0006xI-Lg
 for qemu-devel@nongnu.org; Wed, 28 Apr 2021 13:07:09 -0400
Received: by mail-wm1-x32a.google.com with SMTP id
 n4-20020a05600c4f84b029013151278decso9226759wmq.4
 for <qemu-devel@nongnu.org>; Wed, 28 Apr 2021 10:07:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=oEwKjogwzqew9LHnVJfSpLxM+9Yj6ci2FrJpneJ2XN0=;
 b=ArylLzrIM9lnlqIstH7+c8mUL6VJY0VjX8GiWI63FADxS66pFMLVCMHrwBt8FVdqg+
 Yk2f35MRzky9eBekfLwZlHRiy0WUJ4rpLObTvW80LlgfVXmoDMWuXzwVHjCUKRFixt4r
 On589R5hoH2rI5XeZ7uBbQ3B5TmbNluHV+8UxaiVyn1QioABw+v8CXlNzhxz3aW32cf4
 Qbfai0ZAYWjdFy4gJzEkKiS8jf9M4CxtZ5773Kc1V8PszBpJ9suyTXrw/Pi4CoGp1ttT
 oxAmnmoKPl6pWcrPToDiy3md5kpx7aQqkLjYldO4uJ6T5i1Gbl9FF1kBt1Xm1myd+oJM
 pIUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=oEwKjogwzqew9LHnVJfSpLxM+9Yj6ci2FrJpneJ2XN0=;
 b=ubBEuLX8VlYAFeFTs5xhubDcVOEAzUyJRXxCu4HR9PEosKUyZ60QXvRg+07wGARfv1
 fCVSbDRc2c+yOk15zmSLvXYqiUju8T5XTxpEVjTsGoFYYHQnij3tKg/66Shbq8mLkuv2
 hJiNQiQxAVhVkDcTv2T3cHqJORFbO6CH9KVegfbyKb/pgoeYUPZwccobqTPOgHOaxr/1
 yTOk0gQCGoKeskBtG1Fsifdxvllr5J7McXX+qoWSCzdzaXrYE4ZsEVufMEMvn7fc/62J
 JHnoWVcRt09Aoi7LgmZrlaWpE5chjB6AIotwI5sWkgTOLKii6aJd6ecakVZ6mllPEwGT
 ouiA==
X-Gm-Message-State: AOAM532f0vNaGC7aGFsti9tMXoWP8bQJQVVc6++vYXeE8gIJVq75a5Bq
 YQa2kcx3FJ2PPtY08Tc0hn13Iqdvt/5V1Q==
X-Google-Smtp-Source: ABdhPJzzD8OR34I7i2Uj1kDqt/Llg83loh4vTNVDLOESYtDSEEF07aD7t8vlyLLgD1yIk0e2FP2Cdw==
X-Received: by 2002:a1c:750b:: with SMTP id o11mr5761258wmc.188.1619629627086; 
 Wed, 28 Apr 2021 10:07:07 -0700 (PDT)
Received: from localhost.localdomain (39.red-81-40-121.staticip.rima-tde.net.
 [81.40.121.39])
 by smtp.gmail.com with ESMTPSA id z7sm482903wrl.11.2021.04.28.10.07.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 28 Apr 2021 10:07:06 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 29/30] hw/mips: Restrict non-virtualized machines to TCG
Date: Wed, 28 Apr 2021 19:04:09 +0200
Message-Id: <20210428170410.479308-30-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20210428170410.479308-1-f4bug@amsat.org>
References: <20210428170410.479308-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32a;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x32a.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
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
Cc: Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Huacai Chen <chenhuacai@kernel.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Only the malta and loongson3-virt machines support KVM.

Restrict the other machines to TCG:

 - mipssim
 - magnum
 - pica61
 - fuloong2e
 - boston

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/mips/meson.build | 11 +++++++----
 1 file changed, 7 insertions(+), 4 deletions(-)

diff --git a/hw/mips/meson.build b/hw/mips/meson.build
index 1195716dc73..dd0101ad4d8 100644
--- a/hw/mips/meson.build
+++ b/hw/mips/meson.build
@@ -1,12 +1,15 @@
 mips_ss = ss.source_set()
 mips_ss.add(files('bootloader.c', 'mips_int.c'))
 mips_ss.add(when: 'CONFIG_FW_CFG_MIPS', if_true: files('fw_cfg.c'))
-mips_ss.add(when: 'CONFIG_FULOONG', if_true: files('fuloong2e.c'))
 mips_ss.add(when: 'CONFIG_LOONGSON3V', if_true: files('loongson3_bootp.c', 'loongson3_virt.c'))
-mips_ss.add(when: 'CONFIG_JAZZ', if_true: files('jazz.c'))
 mips_ss.add(when: 'CONFIG_MALTA', if_true: files('gt64xxx_pci.c', 'malta.c'))
-mips_ss.add(when: 'CONFIG_MIPSSIM', if_true: files('mipssim.c'))
-mips_ss.add(when: 'CONFIG_MIPS_BOSTON', if_true: [files('boston.c'), fdt])
 mips_ss.add(when: 'CONFIG_MIPS_CPS', if_true: files('cps.c'))
 
+if 'CONFIG_TCG' in config_all
+mips_ss.add(when: 'CONFIG_JAZZ', if_true: files('jazz.c'))
+mips_ss.add(when: 'CONFIG_MIPSSIM', if_true: files('mipssim.c'))
+mips_ss.add(when: 'CONFIG_FULOONG', if_true: files('fuloong2e.c'))
+mips_ss.add(when: 'CONFIG_MIPS_BOSTON', if_true: [files('boston.c'), fdt])
+endif
+
 hw_arch += {'mips': mips_ss}
-- 
2.26.3


