Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D1624AB790
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Feb 2022 10:38:33 +0100 (CET)
Received: from localhost ([::1]:34602 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nH0Tf-0004xW-F9
	for lists+qemu-devel@lfdr.de; Mon, 07 Feb 2022 04:38:31 -0500
Received: from eggs.gnu.org ([209.51.188.92]:59738)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nGzNt-0006N9-PO
 for qemu-devel@nongnu.org; Mon, 07 Feb 2022 03:28:41 -0500
Received: from [2a00:1450:4864:20::430] (port=43683
 helo=mail-wr1-x430.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nGzNs-0007CJ-0p
 for qemu-devel@nongnu.org; Mon, 07 Feb 2022 03:28:29 -0500
Received: by mail-wr1-x430.google.com with SMTP id c19so8522126wrb.10
 for <qemu-devel@nongnu.org>; Mon, 07 Feb 2022 00:28:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=93FjjxDTGL2GVAyvoBWTn0etspyUcV6AnQz0JCENEBs=;
 b=Yi0kNBPevuhks0I+b2AV6kpAlR324bCehcX9+ppAgunxQax8VOcnfavOfpoNH/3p0b
 BfS4K5XMgMUHOee7mQguaf1zstrny3np/GVr8dconV/tXQe1l7NiDRGU3fk+++chaooK
 k9ikgxjMiub6VYV0XuLEZnLoU80AppR11gWAkttboXBo5w2Ck+2RocozUo+35lfABqoy
 19P7luMF5EhzgTDLYvshRVIDE+n419WKNjJYNQq/75uVuyrcyioswfyKrhOBFKCgJGl+
 pp7ApEBYwFFWjvfoi0RanDmS+3ojO2EMMV9vAS+1E50QVMKwWEJuO/iGO2mGbwxh+fxk
 FL5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=93FjjxDTGL2GVAyvoBWTn0etspyUcV6AnQz0JCENEBs=;
 b=35tfmFnTBgH42oyWDjhL0rpTQNe0wcWX/MUGj4+ciT8HHg8ca2w2o81WJKtgyo9YfN
 EeQ3Ap7Z3spe0rCZRt86aeibV0H/pfuFhKLg6hiu0BtWbaGXSQ9iDR/Mw7UHSVshgGYv
 nJcP0DEjXgkYfUY8g4Qu+ThV9azqxcqYwUQRPlKGoQMFvAFWJL5kwlpqM6ZGSU+QF2Ls
 izYxoT5lyuMzi4Rb3QMz5Nbymjq22mqvTQVyTmjZknGMAY5hv8NqDMpDDJl3objxhks3
 s+s1Pr3glOUBTU0cDnA+lYDzqNhycMm3V1prGTzYYgNFIKqdqb20yN8tROJzmhFYOSzb
 Rc9A==
X-Gm-Message-State: AOAM530iSpqzCr2kpdQp2levpy/VLIHeP21ejU5RQv6OaJP92SwLmXx3
 xTTxBtljeM+8G6Ws91ZHSOzIMQx1HoQ=
X-Google-Smtp-Source: ABdhPJzAFp1FyT5avoua4SpxW5AXytgoSp/IeRoBd6xAii8UbaF/HNwoIrAg8orcuAFcWQa20OoTzQ==
X-Received: by 2002:a5d:518c:: with SMTP id k12mr8843186wrv.169.1644222505853; 
 Mon, 07 Feb 2022 00:28:25 -0800 (PST)
Received: from localhost.localdomain (154.red-83-50-83.dynamicip.rima-tde.net.
 [83.50.83.154])
 by smtp.gmail.com with ESMTPSA id l26sm3455269wmp.31.2022.02.07.00.28.25
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 07 Feb 2022 00:28:25 -0800 (PST)
To: qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Thomas Huth <thuth@redhat.com>
Subject: [PATCH v2 6/9] core/ptimers: Remove unnecessary 'sysemu/cpus.h'
 include
Date: Mon,  7 Feb 2022 09:27:53 +0100
Message-Id: <20220207082756.82600-7-f4bug@amsat.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220207082756.82600-1-f4bug@amsat.org>
References: <20220207082756.82600-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::430
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::430;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x430.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Reply-to:  =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
From:  =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= via <qemu-devel@nongnu.org>

Reviewed-by: Thomas Huth <thuth@redhat.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/core/ptimer.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/hw/core/ptimer.c b/hw/core/ptimer.c
index 6ba19fd965..eb5ba1aff7 100644
--- a/hw/core/ptimer.c
+++ b/hw/core/ptimer.c
@@ -14,7 +14,6 @@
 #include "sysemu/cpu-timers.h"
 #include "sysemu/qtest.h"
 #include "block/aio.h"
-#include "sysemu/cpus.h"
 #include "hw/clock.h"
 
 #define DELTA_ADJUST     1
-- 
2.34.1


