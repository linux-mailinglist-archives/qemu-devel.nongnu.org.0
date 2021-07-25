Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 084243D4D5D
	for <lists+qemu-devel@lfdr.de>; Sun, 25 Jul 2021 14:27:57 +0200 (CEST)
Received: from localhost ([::1]:47176 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m7dEa-0008WK-2X
	for lists+qemu-devel@lfdr.de; Sun, 25 Jul 2021 08:27:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51566)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m7dBE-0000WH-9h
 for qemu-devel@nongnu.org; Sun, 25 Jul 2021 08:24:28 -0400
Received: from mail-pj1-x102c.google.com ([2607:f8b0:4864:20::102c]:34649)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m7dBC-0003nb-RX
 for qemu-devel@nongnu.org; Sun, 25 Jul 2021 08:24:28 -0400
Received: by mail-pj1-x102c.google.com with SMTP id
 p5-20020a17090a8685b029015d1a9a6f1aso10504553pjn.1
 for <qemu-devel@nongnu.org>; Sun, 25 Jul 2021 05:24:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Ly+uNiRWWBds9bI73JKaYiysd+Nki6elWV6GA/Pshqw=;
 b=ip0LH2P42J2M8tOAjH37YMhgr+3bFIGD2fcdr8RIeEYQeIqkFP3Vu97nIG9U2gO7Q1
 EkjPbZknW+BcZsq5MmhEnTi/j7KnIgkjte1wt9B+gBAQNBXzyo5Pk/azVzaRLYlvRRJG
 vlGXSS24r+k3PiOiuIzUFb3z8h7X+DykmWBksAgEcNzikESbCsA6eYdc5k3+dJqcST62
 Tk5EE79qKQeVkNxO/FT7VGyiaAc3mvsWzESnhQU0BviLZq+cn7HlIoqb/MYLjmOnKLrO
 cFwImpV91ngqsj9JjBVxnSxq6xHIQoZdJtBfw72JmbaC0a3FHz8r6VBXZm5eumc0E1cx
 QkGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Ly+uNiRWWBds9bI73JKaYiysd+Nki6elWV6GA/Pshqw=;
 b=TtWkE3Pc8kiawhRd5cXHea+e5pODTgQMrfFPh6CHWnHL60Sgnb4hgfpxLaHpDlWnED
 5iUTD9Sbdva7egdCpcpgBzRVRO26PtFXM7GP2+plmpPNPpL8bH1iOErmYKz8OLwCQJRi
 M/Xj46YAS34NtpePBj0E422h3IbhT8LYdwrMq+i/syzQDsElYwKhm6cnyFY9c4oLqXDg
 OeqHPwcWBhMtuSUyGP5HX1drrMLuA6kgRoCAzl3aa8Oh0/3F6ZcCoejmofkmefAM3a45
 +qwHunOZGQR5TjMTtzBIftjPeyCk4YDACzU6rFbgBAw50cgoa7U08XkkXXG6iEFBThuD
 dl8A==
X-Gm-Message-State: AOAM531bSgdUn/FHwT2Qe9mKLkrEnpV5jk4PMY3hhGVBfu7APw6J/jYa
 QZgp1+tOt0Nj7uOR3VjCqAU8LetVLAOAYw==
X-Google-Smtp-Source: ABdhPJz7iJkM4sxUewN5L8WisUwOudKnxHYRtjmZ7aDV/jgAMEwIhr3KjMXJTJHlVYoyjIoXDR7Fbw==
X-Received: by 2002:a63:550c:: with SMTP id j12mr13470278pgb.31.1627215865635; 
 Sun, 25 Jul 2021 05:24:25 -0700 (PDT)
Received: from cloudburst.home
 (2603-800c-3202-ffa7-497b-6ae4-953c-7ad1.res6.spectrum.com.
 [2603:800c:3202:ffa7:497b:6ae4:953c:7ad1])
 by smtp.gmail.com with ESMTPSA id k37sm15005093pgm.84.2021.07.25.05.24.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 25 Jul 2021 05:24:25 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH for-6.1? v2 6/9] hw/ppc/spapr_events: Remove unused variable
 from check_exception
Date: Sun, 25 Jul 2021 02:24:13 -1000
Message-Id: <20210725122416.1391332-7-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210725122416.1391332-1-richard.henderson@linaro.org>
References: <20210725122416.1391332-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From clang-13:
hw/ppc/spapr_events.c:937:14: error: variable 'xinfo' set but not used \
    [-Werror,-Wunused-but-set-variable]

Acked-by: David Gibson <david@gibson.dropbear.id.au>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 hw/ppc/spapr_events.c | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/hw/ppc/spapr_events.c b/hw/ppc/spapr_events.c
index 0cfc19be19..23e2e2fff1 100644
--- a/hw/ppc/spapr_events.c
+++ b/hw/ppc/spapr_events.c
@@ -934,7 +934,6 @@ static void check_exception(PowerPCCPU *cpu, SpaprMachineState *spapr,
                             uint32_t nret, target_ulong rets)
 {
     uint32_t mask, buf, len, event_len;
-    uint64_t xinfo;
     SpaprEventLogEntry *event;
     struct rtas_error_log header;
     int i;
@@ -944,13 +943,9 @@ static void check_exception(PowerPCCPU *cpu, SpaprMachineState *spapr,
         return;
     }
 
-    xinfo = rtas_ld(args, 1);
     mask = rtas_ld(args, 2);
     buf = rtas_ld(args, 4);
     len = rtas_ld(args, 5);
-    if (nargs == 7) {
-        xinfo |= (uint64_t)rtas_ld(args, 6) << 32;
-    }
 
     event = rtas_event_log_dequeue(spapr, mask);
     if (!event) {
-- 
2.25.1


