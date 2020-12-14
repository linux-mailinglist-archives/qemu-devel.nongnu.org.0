Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FA652D9F9C
	for <lists+qemu-devel@lfdr.de>; Mon, 14 Dec 2020 19:52:53 +0100 (CET)
Received: from localhost ([::1]:44984 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kosxn-0003E1-3k
	for lists+qemu-devel@lfdr.de; Mon, 14 Dec 2020 13:52:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34482)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kosju-00004q-TV
 for qemu-devel@nongnu.org; Mon, 14 Dec 2020 13:38:30 -0500
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b]:53505)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kosjt-0007SO-G2
 for qemu-devel@nongnu.org; Mon, 14 Dec 2020 13:38:30 -0500
Received: by mail-wm1-x32b.google.com with SMTP id k10so14690020wmi.3
 for <qemu-devel@nongnu.org>; Mon, 14 Dec 2020 10:38:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=klGFn3hgbo3GHDfsgMyJiiPYSrCAsjHYiV/EbjhfoW8=;
 b=CfuHL44otRpfSJlVrA7fEOVv4k4CUkmVu9LTTPz4deOlBK0C1oHElDzWpSNIEhhUyK
 wzOP+WTWzwTB673iXjSOqxnHXT5Za5YADguwGPDlnRZuNDxhPz6YzoDGFFSFj0Owt37P
 2qvgbzypxffE7Gj6OKAb3NPTTfJf/zU+ndpApB+teYdeN/erVCGlN2FwyPB7mIxodBTq
 2qsUk9KbW3SHhfyB87dKQwU8YTsYnhC7DL6xMTpQ4Dv1i34VYT/5MUBa2j1ntNmxJSCW
 diR5/uSlHzp7lrKTC4xMbZj7tlhrFaBv22Vt8Ju1RiPxLVHWFElxIddUZI7flxOWocEt
 HSTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=klGFn3hgbo3GHDfsgMyJiiPYSrCAsjHYiV/EbjhfoW8=;
 b=B9InZmV/W4qiWIIzrZIi20mNyBFYJ9fN0xIfHTx9orbbEKOaOyxs3KGFx9K8WnsvLM
 Z09Lr5kUpMaZRyTzhwUKtv99VyBsb/XxS07bdK2wUX0aBBQqCHUjlGmaJGOyM4NT9/E+
 eGssXuPX0xf+us+hLqrc0ll2Xa9duNR58RToBRPqpiQogYiYV51+OSncEcqrexy+EOXw
 +7dkaAdemU17cxMR1TjRXQCprAYf05qyhRW28hPyidGacyi3IJHXCejCUFQnHivieAMl
 UcDHu5H5Tl2342/h5C6oP+IagLWBLpAdOPvqOpAVOI2HnTIlupwK4Ee+BWVvAa2q1hkn
 fh1w==
X-Gm-Message-State: AOAM531yEoQDSl/KCTMEP8mPHcEFwGBtsTLf6b0zG+EV6HCOk6OzkRXt
 D413gouF+HKm6CtCbUI+AZknd5Jmj5o=
X-Google-Smtp-Source: ABdhPJwTylQrlnQiAcKtSTABN0Cyubl7ydCIKMOBhBiDuRoYFl1iO9R9G02tB86I99Zq8ufgPtmWqg==
X-Received: by 2002:a7b:c208:: with SMTP id x8mr29319888wmi.179.1607971107920; 
 Mon, 14 Dec 2020 10:38:27 -0800 (PST)
Received: from localhost.localdomain (101.red-88-21-206.staticip.rima-tde.net.
 [88.21.206.101])
 by smtp.gmail.com with ESMTPSA id i7sm20396778wrv.12.2020.12.14.10.38.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 14 Dec 2020 10:38:27 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 09/16] target/mips: Rename translate_init.c as cpu-defs.c
Date: Mon, 14 Dec 2020 19:37:32 +0100
Message-Id: <20201214183739.500368-10-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201214183739.500368-1-f4bug@amsat.org>
References: <20201214183739.500368-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32b;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x32b.google.com
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
Cc: Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>, kvm@vger.kernel.org,
 Huacai Chen <chenhuacai@kernel.org>, Laurent Vivier <laurent@vivier.eu>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This file is not TCG specific, contains CPU definitions
and is consumed by cpu.c. Rename it as such.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 target/mips/cpu.c                                    | 2 +-
 target/mips/{translate_init.c.inc => cpu-defs.c.inc} | 0
 2 files changed, 1 insertion(+), 1 deletion(-)
 rename target/mips/{translate_init.c.inc => cpu-defs.c.inc} (100%)

diff --git a/target/mips/cpu.c b/target/mips/cpu.c
index a54be034a2b..4191c0741f4 100644
--- a/target/mips/cpu.c
+++ b/target/mips/cpu.c
@@ -311,7 +311,7 @@ static bool mips_cpu_has_work(CPUState *cs)
     return has_work;
 }
 
-#include "translate_init.c.inc"
+#include "cpu-defs.c.inc"
 
 static void mips_cpu_reset(DeviceState *dev)
 {
diff --git a/target/mips/translate_init.c.inc b/target/mips/cpu-defs.c.inc
similarity index 100%
rename from target/mips/translate_init.c.inc
rename to target/mips/cpu-defs.c.inc
-- 
2.26.2


