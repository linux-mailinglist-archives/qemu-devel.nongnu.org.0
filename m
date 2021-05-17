Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EB2653839D1
	for <lists+qemu-devel@lfdr.de>; Mon, 17 May 2021 18:29:06 +0200 (CEST)
Received: from localhost ([::1]:52712 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lig77-0008FF-HS
	for lists+qemu-devel@lfdr.de; Mon, 17 May 2021 12:29:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60108)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lifyX-0001bR-As
 for qemu-devel@nongnu.org; Mon, 17 May 2021 12:20:14 -0400
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332]:42601)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lifyU-00024p-O0
 for qemu-devel@nongnu.org; Mon, 17 May 2021 12:20:13 -0400
Received: by mail-wm1-x332.google.com with SMTP id
 f75-20020a1c1f4e0000b0290171001e7329so3952254wmf.1
 for <qemu-devel@nongnu.org>; Mon, 17 May 2021 09:20:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=mkstvpf+hN6bSILMqqRSGrxtXoo4HBUUCL7fU3xWKkM=;
 b=yOJPNrGdzr/a24hKdf+de5oH4elbtkWcgAPmgavcxNuVS5eNMna4l2m2zt96hgwQjp
 0AXssebE5HaCLJ1VipzHJyZWEv+ZClIsLTat/jzAKAJZWy3vwbLdcaH/XNE8/H/72L1k
 OB5JeDNYw1ngeFOX8OovrMi7ABPc8FRWuYs3y/I98NodHopup+S4wolIt9nWI1MnxSWK
 bOy2nVfbajBmq9q+7+KQaeow09d/XgrJZohJtBK8CQLm7gwwMwzGgP72oxQX+3DJ7W7c
 1Pnd1Yag0ujrYXEiiMY59MlaOd/+eyDC/F0TYZ8ekIrfWVF6BRZejy20/Y642M+PUX0u
 pagw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=mkstvpf+hN6bSILMqqRSGrxtXoo4HBUUCL7fU3xWKkM=;
 b=b8DQZAGX5uujixu+iKsh2qaJSFKiNh9vDhELofRozLBO5UzQzoLKKb7nlyl6RdO6KX
 qv2d+WF/r/aDXQsDMKMwZP+7DQ2jYTLonXmRgofzh5uNxHXV2Br+IIAOoR1iUZlZA5Fv
 ft4nPxe5vlPxEuQ0PR4BW/TlVAlASYGGt2u828EdyMB5s3Log0BHD0SQpx0A+IKXJdgC
 6WW7/4NiSyN0TPowaNpPKvHyb6cd269+Rs58MP13gJEoFEw6gqjDYsonEYeVOZhWaHqd
 adlcr9tg2TrGSgr0YKpazG4uKlsXpmxjnAhDVkIh/U+tiqP+/90e3OBMXIIa3+blcZ6K
 643w==
X-Gm-Message-State: AOAM532n8/e//OdX9o+yghZykjWy2lSCtMTVzKlVeKahrF5ngzy2pdLr
 6/RW9fikWBJAqXLBOhOlvkiDdw==
X-Google-Smtp-Source: ABdhPJwcphuzfJJNNKEdXswEnU+EADD890BlqHHXfs7Na8BAcETjnBq0yB5NY2FJLf5nufC03cPF+A==
X-Received: by 2002:a05:600c:3388:: with SMTP id
 o8mr675433wmp.101.1621268409041; 
 Mon, 17 May 2021 09:20:09 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id f6sm20754175wru.72.2021.05.17.09.20.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 May 2021 09:20:07 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 61C871FFAC;
 Mon, 17 May 2021 17:10:25 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: peter.maydell@linaro.org
Subject: [PULL 23/29] tests/tcg: fix missing return
Date: Mon, 17 May 2021 17:10:16 +0100
Message-Id: <20210517161022.13984-24-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210517161022.13984-1-alex.bennee@linaro.org>
References: <20210517161022.13984-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::332;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x332.google.com
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
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This was picked up when clang built the test.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Message-Id: <20210512102051.12134-30-alex.bennee@linaro.org>

diff --git a/tests/tcg/multiarch/system/memory.c b/tests/tcg/multiarch/system/memory.c
index eb0ec6f8eb..41c7f66e2e 100644
--- a/tests/tcg/multiarch/system/memory.c
+++ b/tests/tcg/multiarch/system/memory.c
@@ -326,6 +326,7 @@ static bool do_unsigned_test(init_ufn fn)
         fn(i);
         ok = do_unsigned_reads(i);
     }
+    return ok;
 #else
     fn(0);
     return do_unsigned_reads(0);
-- 
2.20.1


