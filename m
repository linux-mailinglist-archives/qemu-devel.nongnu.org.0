Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D53F559D42
	for <lists+qemu-devel@lfdr.de>; Fri, 24 Jun 2022 17:28:04 +0200 (CEST)
Received: from localhost ([::1]:36982 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o4lE3-000498-2Z
	for lists+qemu-devel@lfdr.de; Fri, 24 Jun 2022 11:28:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60238)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shnusongshaobo@gmail.com>)
 id 1o4krl-0002yO-Jt
 for qemu-devel@nongnu.org; Fri, 24 Jun 2022 11:05:01 -0400
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a]:42652)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shnusongshaobo@gmail.com>)
 id 1o4krk-0002f0-3e
 for qemu-devel@nongnu.org; Fri, 24 Jun 2022 11:05:01 -0400
Received: by mail-pl1-x62a.google.com with SMTP id jb13so2346311plb.9
 for <qemu-devel@nongnu.org>; Fri, 24 Jun 2022 08:04:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=RuXEFKGu+IvP8WBaKfeHy5hcr+avx7dIecUIVYdVqiY=;
 b=gYO1d0JN10SS2Ej3PVuC4ybRsUzZ1fZifozyeHDHC58bSHUgpjB5kBawHJPYgf/pwN
 qGERTMrMZjeQLsqcqAPD8AH7ajZZ2m3pAUsnxCwsPax1sdtDp4dTixjhmErnVQrwfmg7
 qqWMZcqjt/IZhk+lDUpaVt7PLNflDeumRgZS6AJOwmye0UdYmd27g+Odp3jg1ozciKLP
 K/67rrJiEtMi5Ub1UgxqOGQaKYAig9Ykf7/q3CchHxa6+8wWQ0r2gHcg/cTpG0/4GNLc
 oT3Epfis7qbCr4MNueg1Lc8PZfaGvMfGacVqRJBtT6OTEJbUrTpdGhk/B00EMoIcOLpJ
 bELQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=RuXEFKGu+IvP8WBaKfeHy5hcr+avx7dIecUIVYdVqiY=;
 b=c3NTySmfD/CaIuB0NxY92vItduy0BWUDB0DXk/080aMCStPeA17tiShMHMKPsquFlO
 PRFCbISw7f0CHAd3nESJU3RUN06QgBvXF5NXXabdEQnCrTSCQ7nBS+JNDRvB5sbTYW0B
 Ww5pAVTNdNQPTacdGj1WQVOKt6B9uovgT9R8oC/fz5ufCTxia4vzEW05ytczIp1tDpvh
 7hWe07PaqSnZLmEFEKvnx+BzDEytedkFLseu0Uk0KZ6XVsA0mBSFHPiDoaK/XwDjKs8f
 j9RYXGbU79ri8636Jy8tFvvfFY1EsEATXpJJkBVrwkoiftsLdqTo3FvH2qu7Y4lJ03b7
 Ea1A==
X-Gm-Message-State: AJIora/6RCDCqs37AQQFRBJyCGKNv8h6f95qAC6J131Rl5IYYmi8NX8B
 cU9VqRVjNYLPglJvVGnhva00KAz0hSnUyQ==
X-Google-Smtp-Source: AGRyM1sq4MBB9RFGFm7T4mF3OAXkMPyc4rqHmTd5ADGQFOwSm7rIH2lHCo5W47ib20f7ZgMiNbBA5Q==
X-Received: by 2002:a17:902:cf10:b0:168:ef35:5bee with SMTP id
 i16-20020a170902cf1000b00168ef355beemr44546698plg.99.1656083098504; 
 Fri, 24 Jun 2022 08:04:58 -0700 (PDT)
Received: from DESKTOP-VGAJ4S3.localdomain ([111.3.43.17])
 by smtp.gmail.com with ESMTPSA id
 f1-20020a654001000000b0040d22243295sm1746191pgp.79.2022.06.24.08.04.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 Jun 2022 08:04:58 -0700 (PDT)
From: Shaobo Song <shnusongshaobo@gmail.com>
To: qemu-devel@nongnu.org
Cc: richard.henderson@linaro.org,
	Shaobo Song <shnusongshaobo@gmail.com>
Subject: [PATCH] tcg: Fix returned type in
 alloc_code_gen_buffer_splitwx_memfd()
Date: Fri, 24 Jun 2022 23:02:17 +0800
Message-Id: <20220624150216.3627-1-shnusongshaobo@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62a;
 envelope-from=shnusongshaobo@gmail.com; helo=mail-pl1-x62a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Fri, 24 Jun 2022 11:26:20 -0400
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

 This fixes a bug in POSIX-compliant environments. Since we had allocated 
 a buffer named 'tcg-jit' with read-write access protections we need a int 
 type to combine these access flags and return it, whereas we had inexplicably 
 return a bool type. It may cause an unnecessary protection change in 
 tcg_region_init().

Signed-off-by: Shaobo Song <shnusongshaobo@gmail.com>
---
 tcg/region.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tcg/region.c b/tcg/region.c
index 71ea81d671..88d6bb273f 100644
--- a/tcg/region.c
+++ b/tcg/region.c
@@ -548,7 +548,7 @@ static int alloc_code_gen_buffer_anon(size_t size, int prot,
 #ifdef CONFIG_POSIX
 #include "qemu/memfd.h"
 
-static bool alloc_code_gen_buffer_splitwx_memfd(size_t size, Error **errp)
+static int alloc_code_gen_buffer_splitwx_memfd(size_t size, Error **errp)
 {
     void *buf_rw = NULL, *buf_rx = MAP_FAILED;
     int fd = -1;
-- 
2.25.1


