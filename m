Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 501DF2E8E5C
	for <lists+qemu-devel@lfdr.de>; Sun,  3 Jan 2021 22:19:20 +0100 (CET)
Received: from localhost ([::1]:60730 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kwAmV-0002r8-DK
	for lists+qemu-devel@lfdr.de; Sun, 03 Jan 2021 16:19:19 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38028)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kwAN7-0005Do-Ka
 for qemu-devel@nongnu.org; Sun, 03 Jan 2021 15:53:05 -0500
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433]:35355)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kwAN6-0006UP-3S
 for qemu-devel@nongnu.org; Sun, 03 Jan 2021 15:53:05 -0500
Received: by mail-wr1-x433.google.com with SMTP id r3so29502809wrt.2
 for <qemu-devel@nongnu.org>; Sun, 03 Jan 2021 12:53:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=++A8QyhfHVVuAMN0I1H2zT5i0vv1msO5pWbKg3DeMDU=;
 b=FzFGZdNuOmkJFlKA0l9YAjyciBxkviGWNJQh1CPRQWGNf4p4dFJvyILC6Wg6d9eMIN
 ioiNpqATX3GanV0pmlva9aBYP9KOABg/UZ9z2Qa7/Q19SisBnLWRhLjC1EuXzL5ZhoMi
 ALvTOxQjyvNdzuplFpo8FlgDT1Tm2n+Q0TMPzVTapJPjqyPKyP95jikOHMyapXJ31AJW
 nbIPLllcSgkhcW6VqTXjUnlzE36EpFMJIxNSVlzkSeOcWYDv+4agm4sLVxBOj7LO5/io
 4xX+o/ih+pCX/HgbaZmreN2Zgs1MVyTREaQO18WWYIer8Hgy5ITJek2Q89PZOriiuVT1
 sQkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=++A8QyhfHVVuAMN0I1H2zT5i0vv1msO5pWbKg3DeMDU=;
 b=Vskt/osemtJJlXRSkBL/Jw2yjT33tlO9xePudFGk02epYt1kfWlAtkZUic2G/RoHPv
 qklbG5VVDWwdDHPVRkL7gs8x4uNbxBNpL9VfFtMn7btBwEfwyklg0Ouv/6zrBgd7zu9d
 Kt506BIzZuNaBsg5sWLLUMP2XzXLK5wEiLTkCIkGjTfwV0tOK3Q2mjSi5g6Kk0PezMrP
 DNloOfwWFcuHc7j05vxmoW605PBaMa5r4906C2k7BR8FkrJ/JGljuKW/cWIY/7NWXQSJ
 pohAvieEZIcAvP8psZp8kFhT5iJ+LFRcHRrskoGRNN81GA4NX3gIV2XlZ/gCZq4gPFD5
 6nmA==
X-Gm-Message-State: AOAM531qvW8SK7Aknd3PLOWo661gqEPlPt1dI/SN1QvRMR0V5FdYgnm5
 p4wNit6Wb2mro8Lc9lXIIvdAdzCLThE=
X-Google-Smtp-Source: ABdhPJyveFCP6Kq6mbet3u8jM6XyXnPuio7ul5XovpieKNJgTl1uRfQ2swTdTWswyg16q8HHzr+8FQ==
X-Received: by 2002:a5d:65ca:: with SMTP id e10mr77323545wrw.42.1609707182747; 
 Sun, 03 Jan 2021 12:53:02 -0800 (PST)
Received: from localhost.localdomain
 (194.red-83-57-172.dynamicip.rima-tde.net. [83.57.172.194])
 by smtp.gmail.com with ESMTPSA id i18sm88713927wrp.74.2021.01.03.12.53.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 03 Jan 2021 12:53:02 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PULL 33/35] hw/mips/fuloong2e: Remove unused env entry
Date: Sun,  3 Jan 2021 21:50:19 +0100
Message-Id: <20210103205021.2837760-34-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210103205021.2837760-1-f4bug@amsat.org>
References: <20210103205021.2837760-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::433;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x433.google.com
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
Cc: Huacai Chen <chenhuacai@kernel.org>, Aurelien Jarno <aurelien@aurel32.net>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Jiaxun Yang <jiaxun.yang@flygoat.com>

modetty is not handled by kernel and the parameter
here seems unreasonable.

Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
Message-Id: <20201224031750.52146-6-jiaxun.yang@flygoat.com>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
[PMD: Do not remove busclock]
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/mips/fuloong2e.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/hw/mips/fuloong2e.c b/hw/mips/fuloong2e.c
index 09169a9aa99..9b44ac6cf97 100644
--- a/hw/mips/fuloong2e.c
+++ b/hw/mips/fuloong2e.c
@@ -161,7 +161,6 @@ static uint64_t load_kernel(CPUMIPSState *env)
     prom_set(prom_buf, index++, "busclock=33000000");
     prom_set(prom_buf, index++, "cpuclock=100000000");
     prom_set(prom_buf, index++, "memsize=%"PRIi64, loaderparams.ram_size / MiB);
-    prom_set(prom_buf, index++, "modetty0=38400n8r");
     prom_set(prom_buf, index++, NULL);
 
     rom_add_blob_fixed("prom", prom_buf, prom_size, ENVP_PADDR);
-- 
2.26.2


