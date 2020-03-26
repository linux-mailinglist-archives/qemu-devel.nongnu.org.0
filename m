Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 87789194883
	for <lists+qemu-devel@lfdr.de>; Thu, 26 Mar 2020 21:16:18 +0100 (CET)
Received: from localhost ([::1]:59688 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jHYvJ-0006DK-Kl
	for lists+qemu-devel@lfdr.de; Thu, 26 Mar 2020 16:16:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59256)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <robert.foley@linaro.org>) id 1jHYLB-00086R-O6
 for qemu-devel@nongnu.org; Thu, 26 Mar 2020 15:38:58 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <robert.foley@linaro.org>) id 1jHYLA-000274-NC
 for qemu-devel@nongnu.org; Thu, 26 Mar 2020 15:38:57 -0400
Received: from mail-qv1-xf41.google.com ([2607:f8b0:4864:20::f41]:40827)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <robert.foley@linaro.org>)
 id 1jHYLA-00026l-J3
 for qemu-devel@nongnu.org; Thu, 26 Mar 2020 15:38:56 -0400
Received: by mail-qv1-xf41.google.com with SMTP id cy12so3696154qvb.7
 for <qemu-devel@nongnu.org>; Thu, 26 Mar 2020 12:38:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=YLdWPlJvL5kdzN20NeH795EO1wLm2tjo2zF8M6BgqIo=;
 b=dyPcCQG3sc6xoUXIurf4Hap44sJRPCagIoQ1SbQH26fBIADdRX/wVKBlUqSI+aD1QJ
 MQQRSzYnKuXNQ8OD10K8yTHeyRB2y6do+LDx4yw4UjRY05Z2Eu59z2qTsP2cWrnsq3to
 rtXLySD/9PjjxHuoSdsi+C/gQbxfS4wL8a7t2h6TFCpW3sgAuz2SxBc6kgnbzAmknSfr
 dOXe+Pb+OGLL6sMbXq2+vNGJUk6xOZyxC2D6N6eV0/XyxvNtklzzhn5G0kzmxR+vE5OH
 ItGaNo9mvBQUHXNahThcmcqrXGsiVFmw8EDMc2i/Guvqvg4qMAQOwreRaYseVlcyEcAL
 jYpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=YLdWPlJvL5kdzN20NeH795EO1wLm2tjo2zF8M6BgqIo=;
 b=KqJ0gGA9RGWLRdbFCeczS+z5YZljeNIlOrocxL5+gMZgahn4pK/GCi4/P/tIV+CjGo
 3yaOvFMFv2ypCcf0AqmqfgRFbqP5iCoHEuOGAM9i79tENcUUas5Tort8kmLLt+/paOVR
 XXmENrBq0O9sQqZHuc6WLWQrFojFzr998OyMaSpAD8HvbGjTETIWnZZAnDuf8jdoe7eS
 h/qnzcj1i5hK4v0ns+UlMXy4WtNcQrYxa15KF7atJUMx8ixru42XD9HIfIHJI6vpZe0C
 aQk2stUCV7sXGrlbZ0IHxD9+/6ihbvM2tF0D1XEsJfy0Z8hlYiNyW+qk/BAyL85Zc7Vr
 /QRQ==
X-Gm-Message-State: ANhLgQ3P9cQtEA2ypj0/DDDEsXyN2ziOkNuUoUBnaDRplBQMDoXGQw1S
 Rey4NLUXSTXW0MUcelK6KsbMmWtG0iPEFg==
X-Google-Smtp-Source: ADFU+vulRYJqxFzbsyL9/oildndtX7342fCVlMYNBUlRR0N2LN3iQidTpWj9EeYj2YJVU+dbfyOSlA==
X-Received: by 2002:a0c:e644:: with SMTP id c4mr9845727qvn.170.1585251535680; 
 Thu, 26 Mar 2020 12:38:55 -0700 (PDT)
Received: from Rfoley-MA01.hsd1.ma.comcast.net
 ([2601:199:4480:60c0:fd55:4e67:1038:8302])
 by smtp.gmail.com with ESMTPSA id u51sm2161916qth.46.2020.03.26.12.38.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 26 Mar 2020 12:38:55 -0700 (PDT)
From: Robert Foley <robert.foley@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v8 59/74] microblaze: convert to cpu_interrupt_request
Date: Thu, 26 Mar 2020 15:31:41 -0400
Message-Id: <20200326193156.4322-60-robert.foley@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200326193156.4322-1-robert.foley@linaro.org>
References: <20200326193156.4322-1-robert.foley@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::f41
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
Cc: robert.foley@linaro.org, richard.henderson@linaro.org,
 "Emilio G. Cota" <cota@braap.org>, peter.puhov@linaro.org,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>, alex.bennee@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: "Emilio G. Cota" <cota@braap.org>

Cc: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Signed-off-by: Emilio G. Cota <cota@braap.org>
Signed-off-by: Robert Foley <robert.foley@linaro.org>
---
 target/microblaze/cpu.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/target/microblaze/cpu.c b/target/microblaze/cpu.c
index a2c2f271df..71e3a51161 100644
--- a/target/microblaze/cpu.c
+++ b/target/microblaze/cpu.c
@@ -84,7 +84,7 @@ static void mb_cpu_set_pc(CPUState *cs, vaddr value)
 
 static bool mb_cpu_has_work(CPUState *cs)
 {
-    return cs->interrupt_request & (CPU_INTERRUPT_HARD | CPU_INTERRUPT_NMI);
+    return cpu_interrupt_request(cs) & (CPU_INTERRUPT_HARD | CPU_INTERRUPT_NMI);
 }
 
 #ifndef CONFIG_USER_ONLY
-- 
2.17.1


