Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C2906436670
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Oct 2021 17:39:53 +0200 (CEST)
Received: from localhost ([::1]:34404 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mdaAa-0001I5-Ro
	for lists+qemu-devel@lfdr.de; Thu, 21 Oct 2021 11:39:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56664)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mdZx3-000097-QO
 for qemu-devel@nongnu.org; Thu, 21 Oct 2021 11:25:53 -0400
Received: from mail-pg1-x535.google.com ([2607:f8b0:4864:20::535]:34386)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mdZwy-0002PL-Tg
 for qemu-devel@nongnu.org; Thu, 21 Oct 2021 11:25:53 -0400
Received: by mail-pg1-x535.google.com with SMTP id h193so656705pgc.1
 for <qemu-devel@nongnu.org>; Thu, 21 Oct 2021 08:25:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=gwDCMsSCc9wL1Hr2zvm6dizELl6LEePS1y9rxyoipeg=;
 b=nEfzbXPYthWNsKHGKZgbnSMPkgV3wukroYxAecHKAqOcDz0TwLTrOaS/im8oIOjfYI
 6iMsKeLRZtC8zQFUt3DSQktrcLMZuZFv+3fYr3IHsDuAaqq04cIhU1sWfDr8Q8OfXH3M
 vejnL3wq39jZpeSDWJ6H5PQS9Kiu10a45jnFwv+vmGjF1MTna7hN1cTSh2/m6zPCT8fZ
 93NObPG8D3TRc0mhJUySWT2IijwDT681487aLlpZ99OXgIjrDljZIbZmxJNYCzyRpOeq
 DR86/nij6/bAPq7VyAH0a7LtEjY83NC1AKqm83RtXlCa6FAPgc+8lLCjeJXxx7K/utds
 mz3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=gwDCMsSCc9wL1Hr2zvm6dizELl6LEePS1y9rxyoipeg=;
 b=PRaNNYmDWrfyKnaLk0bGvLmw5srVqt4E43tduXWLC/kAsL3TypOVnCAxUyTRCoXirR
 htItvPA7qX4aowOkWsajcUPAKYGg1fXXh/DTSz8pSBWRWtJVxHuKgyPzaPg0fonLE52N
 feVwV6hnoHwoqyziG+4llkwMftsBFmVjBbG59rTmZU0M3PVw4wiTPYKzbbov3hZmoAeP
 uW5atcSSUP0HxYpbEgxjfFQU2LEIrZ1tVzxJjJp/ZDz2hC5oVLINB6fIHb5lcI8URLRu
 ainlJabA39vldOHDBi6xzcrsS+NpNQu34CRmcyYGNaVuN2Ph29Bfs1i55kdFRPp8Rc0r
 WIXQ==
X-Gm-Message-State: AOAM532LICaegFexouh7kuVKqFNzE8UCbfInistNYn9skCeUeFh0LCsM
 /FXPm4ZwuvTiOb7J2lWHHLOwdD+hlmxvrg==
X-Google-Smtp-Source: ABdhPJwyjkagnNxMjq7lAaMcsecaO3n9f8HAqZwCkhyJPLlcz3oTUtWPLlgdz0s/tBBjv7Kn+FWi6g==
X-Received: by 2002:a05:6a00:a10:b0:412:448c:89c7 with SMTP id
 p16-20020a056a000a1000b00412448c89c7mr6126501pfh.83.1634829947449; 
 Thu, 21 Oct 2021 08:25:47 -0700 (PDT)
Received: from localhost.localdomain ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id y3sm5676257pge.44.2021.10.21.08.25.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 21 Oct 2021 08:25:47 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 07/19] hw/arm/sbsa-ref: Fixed cpu type error message typo.
Date: Thu, 21 Oct 2021 08:25:29 -0700
Message-Id: <20211021152541.781175-8-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211021152541.781175-1-richard.henderson@linaro.org>
References: <20211021152541.781175-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::535;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x535.google.com
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
Cc: Yanan Wang <wangyanan55@huawei.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Shuuichirou Ishii <ishii.shuuichir@fujitsu.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Shuuichirou Ishii <ishii.shuuichir@fujitsu.com>

Signed-off-by: Shuuichirou Ishii <ishii.shuuichir@fujitsu.com>
Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Yanan Wang <wangyanan55@huawei.com>
Message-Id: <20211008063604.670699-1-ishii.shuuichir@fujitsu.com>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 hw/arm/sbsa-ref.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/arm/sbsa-ref.c b/hw/arm/sbsa-ref.c
index 509c5f09b4..358714bd3e 100644
--- a/hw/arm/sbsa-ref.c
+++ b/hw/arm/sbsa-ref.c
@@ -670,7 +670,7 @@ static void sbsa_ref_init(MachineState *machine)
     int n, sbsa_max_cpus;
 
     if (!cpu_type_valid(machine->cpu_type)) {
-        error_report("mach-virt: CPU type %s not supported", machine->cpu_type);
+        error_report("sbsa-ref: CPU type %s not supported", machine->cpu_type);
         exit(1);
     }
 
-- 
2.25.1


