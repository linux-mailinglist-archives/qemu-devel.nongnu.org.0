Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 48A5F64FB4E
	for <lists+qemu-devel@lfdr.de>; Sat, 17 Dec 2022 18:32:55 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p6b0U-00029p-LC; Sat, 17 Dec 2022 12:29:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p6b0S-00028s-BJ
 for qemu-devel@nongnu.org; Sat, 17 Dec 2022 12:29:52 -0500
Received: from mail-ej1-x632.google.com ([2a00:1450:4864:20::632])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p6b0Q-0002R3-8A
 for qemu-devel@nongnu.org; Sat, 17 Dec 2022 12:29:52 -0500
Received: by mail-ej1-x632.google.com with SMTP id qk9so12970405ejc.3
 for <qemu-devel@nongnu.org>; Sat, 17 Dec 2022 09:29:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ZJBMjUuWi5LDeqCkrRIBhFSAN2qMGyBc5fH/hW07Wew=;
 b=Ce3aVdizpJjs3ywka/oZyIGX96iCyGdZ0PTh+5EV+KuosLgV+76u2Rj8tAWqH613JD
 Wy871aO87+6usyV36L9I5EO6nTmKOEv70NRgpMr2W53yqYgjK+bHsqe2AmNCki3JU3GQ
 h5bzXGd3AMRlIRwaKaPz/t0jPRVFqAvLdGKpPJll83EGbn2NWCtGFScFWlXFiWsN5x5b
 Yr3utM1/w9WTcWse2NFhi5Fn6ZHYSxO8W5tS65QBKWQw7ton4dKiPmF90D9LG9xCf9D5
 lxvvXbtrm+9wjVZas9PwqvJ1ggX1iUfYayTHUkkNRMFutCMsTC/VrjJfr/fG0rM+FeS4
 peqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ZJBMjUuWi5LDeqCkrRIBhFSAN2qMGyBc5fH/hW07Wew=;
 b=iEMGjFsbTxnGBv03uXgPQKriWx7UqAhsZN8dIaRJF86cds7EgDoEKA5ZtxT7aBdDH3
 xsFPRYErn3+pLYgqGfEETPDJLsmVICU2NvAWHWy4a2AIe4SubY0Eq+kXyKBgUIwElYi6
 aNNdetqj8lkXP9JCes1FSagdnPtgBZclcAWe3rm9jyZ8bGrSvyWM1zKnc/MMZK2xAFxm
 C7MNHLSCzVakCXVvfCTbC/biGCzn7Lt2UeYqCALWEWQEnuT3h4Ha2p4ik3MQtpHSuV0K
 pBjBcMyDaA9ijbs2hBuh24Dmp+FKqQ9rAL4al/h4HK8lObxMJUU9BsA/cr8fCLQ0bjNK
 LhGg==
X-Gm-Message-State: AFqh2kpDd5Ju6SOrT/mfWxLcArweUCMRuxqfYCAOf+ze1orv1l5D2QhC
 NCG2gOOITjhe3I2Aq+EMa2e/jddzune9+PjnkbU=
X-Google-Smtp-Source: AMrXdXujsqEG4u9fTuNgJiBiJD+KD1h++fJ35JztdqeJ9EpX2ZGquGN4RZ/riwO3nHDjMsMYoxpMWg==
X-Received: by 2002:a17:906:c0d3:b0:7fc:4242:fa1d with SMTP id
 bn19-20020a170906c0d300b007fc4242fa1dmr2754845ejb.54.1671298188829; 
 Sat, 17 Dec 2022 09:29:48 -0800 (PST)
Received: from localhost.localdomain ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 op1-20020a170906bce100b007bfacaea851sm2171205ejb.88.2022.12.17.09.29.45
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Sat, 17 Dec 2022 09:29:48 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Max Filippov <jcmvbkbc@gmail.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Bin Meng <bin.meng@windriver.com>, kvm@vger.kernel.org,
 qemu-ppc@nongnu.org, Greg Kurz <groug@kaod.org>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 Bernhard Beschow <shentey@gmail.com>, qemu-riscv@nongnu.org,
 Song Gao <gaosong@loongson.cn>, Artyom Tarasenko <atar4qemu@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Laurent Vivier <laurent@vivier.eu>,
 Alistair Francis <alistair.francis@wdc.com>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 David Gibson <david@gibson.dropbear.id.au>,
 Xiaojuan Yang <yangxiaojuan@loongson.cn>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH v2 4/9] target/ppc/internal: Restrict MMU declarations to
 sysemu
Date: Sat, 17 Dec 2022 18:29:02 +0100
Message-Id: <20221217172907.8364-5-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221217172907.8364-1-philmd@linaro.org>
References: <20221217172907.8364-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::632;
 envelope-from=philmd@linaro.org; helo=mail-ej1-x632.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

The 'hwaddr' type is only available / meaningful on system emulation.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 target/ppc/internal.h | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/target/ppc/internal.h b/target/ppc/internal.h
index 337a362205..901bae6d39 100644
--- a/target/ppc/internal.h
+++ b/target/ppc/internal.h
@@ -242,9 +242,12 @@ static inline int prot_for_access_type(MMUAccessType access_type)
     g_assert_not_reached();
 }
 
+#ifndef CONFIG_USER_ONLY
+
 /* PowerPC MMU emulation */
 
 typedef struct mmu_ctx_t mmu_ctx_t;
+
 bool ppc_xlate(PowerPCCPU *cpu, vaddr eaddr, MMUAccessType access_type,
                       hwaddr *raddrp, int *psizep, int *protp,
                       int mmu_idx, bool guest_visible);
@@ -266,6 +269,8 @@ struct mmu_ctx_t {
     int nx;                        /* Non-execute area          */
 };
 
+#endif /* !CONFIG_USER_ONLY */
+
 /* Common routines used by software and hardware TLBs emulation */
 static inline int pte_is_valid(target_ulong pte0)
 {
-- 
2.38.1


