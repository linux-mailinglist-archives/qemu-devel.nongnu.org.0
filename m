Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C29148EFDD
	for <lists+qemu-devel@lfdr.de>; Fri, 14 Jan 2022 19:27:31 +0100 (CET)
Received: from localhost ([::1]:40160 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n8RIQ-0004zJ-Oq
	for lists+qemu-devel@lfdr.de; Fri, 14 Jan 2022 13:27:30 -0500
Received: from eggs.gnu.org ([209.51.188.92]:54130)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1n8RHL-0003Us-OA
 for qemu-devel@nongnu.org; Fri, 14 Jan 2022 13:26:23 -0500
Received: from [2a00:1450:4864:20::32b] (port=43601
 helo=mail-wm1-x32b.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1n8RHK-000362-4R
 for qemu-devel@nongnu.org; Fri, 14 Jan 2022 13:26:23 -0500
Received: by mail-wm1-x32b.google.com with SMTP id
 s6-20020a7bc386000000b0034a89445406so5045386wmj.2
 for <qemu-devel@nongnu.org>; Fri, 14 Jan 2022 10:25:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=YERtVpDpL7zHj2q7lYFWm8WBusJYG8tprvEusgzBPLw=;
 b=LZdLJqCf5u10NEPGaSmj+Hmal1s2yQhKARMG3t8G0/sSFn7361i7EcEdlftLMkX8do
 RYXedGrw4PfmiZeqwhAwvArYvDE4fEy3Y+9+zqpq45TlWG1zeIEz3Ym7CG0qC6kV6+ID
 PUp7vj7CdmXVEO+1whNS1+DnqSLiVW8bbIzJ9g2vFxzDxlG956ZV6T+2TH2X6o/r+Jp5
 L+L8heyNa+qrUJ5JjCX6AkZG18kxfvBjA380PHudDUAixzJGb9AhuOiV/C1wObZoyz67
 Bs89NkocdptT/3cc768px78fEciuuZlbSPn/KAsDvsLDi14n9pqL/LK3iZWpQ05xGOlk
 gHWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=YERtVpDpL7zHj2q7lYFWm8WBusJYG8tprvEusgzBPLw=;
 b=sqyaAE3mktwwukdgG3on1EgNm4fKPru8euqf6VjRZCtsgRQR7Xrv2mvu8VUep8ukge
 GqspmW20214wpnfxwm9IgG98gH/5KB9kX5qYnKaKhUWf5uoudmMo1bLvi0HW8ClV5yUG
 YjNk8IaSPrOJsiyrp2Vy7vJbWeLjRo0lej3hGwbGCTpeB+Ssq2Ky75fM4yC7m72SRnVm
 4DAhmgtjU8TDkDyn/D4rUYUF7/e9pdlkW0q7ksb94/ofb5G3VyGg8wVPnyKDxufRDCL0
 XLds8z78U+M1DqmiEiJuBL06tOWfLd0IN14/c7KIsb3kl4BC+UnIbfgD7Q9+9AnK8oGO
 ZKhg==
X-Gm-Message-State: AOAM532NTdfJF+Hx+v5TJiF8sCg3B3LHjA7LBL+ajOJTO6fLeh8PY96Q
 SLmBUw94zvVId2dASG7ob5TLm5nmPUsQqg==
X-Google-Smtp-Source: ABdhPJwTr09a5WOse0kroJrgtAUt01eNaIxSw8Eebcetn0yrmJnpx/jCEpSpKin6dV7v9Gjz0UKp+w==
X-Received: by 2002:adf:e989:: with SMTP id h9mr9383574wrm.163.1642184737532; 
 Fri, 14 Jan 2022 10:25:37 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id r7sm14331499wmq.18.2022.01.14.10.25.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 14 Jan 2022 10:25:37 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH] linux-user: Fix comment typo in arm cpu_loop code
Date: Fri, 14 Jan 2022 18:25:35 +0000
Message-Id: <20220114182535.3804783-1-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::32b
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::32b;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32b.google.com
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
Cc: Richard Henderson <richard.henderson@linaro.org>,
 Laurent Vivier <laurent@vivier.eu>, Warner Losh <imp@bsdimp.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Fix a typo in a comment in the arm cpu_loop code.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 linux-user/arm/cpu_loop.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/linux-user/arm/cpu_loop.c b/linux-user/arm/cpu_loop.c
index f153ab503a8..032e1ffddfb 100644
--- a/linux-user/arm/cpu_loop.c
+++ b/linux-user/arm/cpu_loop.c
@@ -434,8 +434,8 @@ void cpu_loop(CPUARMState *env)
             case 0x6: /* Access flag fault, level 2 */
             case 0x9: /* Domain fault, level 1 */
             case 0xb: /* Domain fault, level 2 */
-            case 0xd: /* Permision fault, level 1 */
-            case 0xf: /* Permision fault, level 2 */
+            case 0xd: /* Permission fault, level 1 */
+            case 0xf: /* Permission fault, level 2 */
                 si_signo = TARGET_SIGSEGV;
                 si_code = TARGET_SEGV_ACCERR;
                 break;
-- 
2.25.1


