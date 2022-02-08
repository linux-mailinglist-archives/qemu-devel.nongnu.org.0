Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 669C14ADE70
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Feb 2022 17:37:28 +0100 (CET)
Received: from localhost ([::1]:32994 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nHTUd-000714-As
	for lists+qemu-devel@lfdr.de; Tue, 08 Feb 2022 11:37:27 -0500
Received: from eggs.gnu.org ([209.51.188.92]:42994)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nHSLM-0000x5-88
 for qemu-devel@nongnu.org; Tue, 08 Feb 2022 10:23:48 -0500
Received: from [2607:f8b0:4864:20::102b] (port=53961
 helo=mail-pj1-x102b.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nHSL6-0000Ky-UT
 for qemu-devel@nongnu.org; Tue, 08 Feb 2022 10:23:47 -0500
Received: by mail-pj1-x102b.google.com with SMTP id qe15so7122621pjb.3
 for <qemu-devel@nongnu.org>; Tue, 08 Feb 2022 07:23:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=mdQ+eAovLxYRPvUl2EjaoonJuaKHKGu/H15gTuYJ1gQ=;
 b=lWc5eMnX+dY8dVUKrVcFdDh42nBTDiNDaR35VB/NqKt1vD04dO5fSg6QB1abRWzkQ+
 HwO+co+BymDCdyVtQgRdG7ydpXrVDGDUgeCagPagsmX50uBO5y1gnHueNAZ+8KGt09ol
 nt0g9IqOnVeNtKEWUvx+7nXdoM+CpR727zb6ZmTuwXb0URHZzRCX8tFyt24E+XFWD2s/
 lAVFK7KWIBjoImzr8ECOOX74ddVQQHvMchdBTgaaMX0wxdB4yfWjI8+me0uw/GzXmZgZ
 TdDhYpEc552D1grQbtZkTrs0VPNrFGKZFZyjehQF0NG3dsGl7kbTo8OVHcqMfasq6hxE
 9zlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=mdQ+eAovLxYRPvUl2EjaoonJuaKHKGu/H15gTuYJ1gQ=;
 b=SsjcdkZq/pZ2WSVpNN4Pg12/63VAZer1K2wkhVkZ5rmqNWkHV9Gxo4gkWpbK5E3oZm
 jNo1jfxqbV6z9FjAtOBifZmUyQ+vVUGZq/q+n02DXg3nwbFnHrhv3jkc6DV5kzdzH4Yn
 mr/SB02atnuq1iXVG7XpZnxOf3FNGqnvDAgEbMC7wEk2l8IwEzhlyHyuMUW4YSJLTlOw
 ciDX7EJv1WPE2Y9Cz7xYiNe/9Ki35ogoKO3UESi+JTqBcfeXwjhVOQD7ZgFAqyQEjQs6
 5UG0jFtytjWBOb1euF0dc/H89QpuMJB0U1vxa3to5QesNBTU5IYJvyAGZPPeIuxBbPBV
 dakw==
X-Gm-Message-State: AOAM531VjF/BxhjCs1s8LX4G+HmHH2OhviRJT/EjuQnV/LvnG7tzr246
 1oT6eCTQk45uBaygYHyrXlyAK9GsNgY=
X-Google-Smtp-Source: ABdhPJzpDegwghltUe07uEbVzk146eR152FN8DWzIMRu1sPPUSo5B+EiFK/RR7hgQEM+luoE8vhU9A==
X-Received: by 2002:a17:902:bf0a:: with SMTP id
 bi10mr4841444plb.164.1644333802080; 
 Tue, 08 Feb 2022 07:23:22 -0800 (PST)
Received: from localhost.localdomain (154.red-83-50-83.dynamicip.rima-tde.net.
 [83.50.83.154])
 by smtp.gmail.com with ESMTPSA id i3sm2127112pgq.65.2022.02.08.07.23.20
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 08 Feb 2022 07:23:21 -0800 (PST)
To: qemu-devel@nongnu.org
Cc: Thomas Huth <thuth@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: [PATCH 04/13] target/i386/cpu: Ensure accelerators set CPU addressble
 physical bits
Date: Tue,  8 Feb 2022 16:22:34 +0100
Message-Id: <20220208152243.16452-5-f4bug@amsat.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220208152243.16452-1-f4bug@amsat.org>
References: <20220208152243.16452-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::102b
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::102b;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-pj1-x102b.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.248,
 PDS_HP_HELO_NORDNS=0.001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 T_SCC_BODY_TEXT_LINE=-0.01,
 T_SPF_TEMPERROR=0.01 autolearn=no autolearn_force=no
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

The only accelerator allowed to use zero as default value is TCG.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 target/i386/cpu.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/target/i386/cpu.c b/target/i386/cpu.c
index aa9e636800..16523a78d9 100644
--- a/target/i386/cpu.c
+++ b/target/i386/cpu.c
@@ -6384,6 +6384,7 @@ static void x86_cpu_realizefn(DeviceState *dev, Error **errp)
          * In this case, the default is the value used by TCG (40).
          */
         if (cpu->phys_bits == 0) {
+            assert(tcg_enabled());
             cpu->phys_bits = TCG_PHYS_ADDR_BITS;
         }
     } else {
-- 
2.34.1


