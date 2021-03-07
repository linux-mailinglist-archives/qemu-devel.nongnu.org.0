Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A564532FE5D
	for <lists+qemu-devel@lfdr.de>; Sun,  7 Mar 2021 02:41:34 +0100 (CET)
Received: from localhost ([::1]:57808 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lIiQH-0004Nc-MD
	for lists+qemu-devel@lfdr.de; Sat, 06 Mar 2021 20:41:33 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:54828)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lIiO0-0002vq-FL
 for qemu-devel@nongnu.org; Sat, 06 Mar 2021 20:39:12 -0500
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632]:39272)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lIiNz-0005Oe-0I
 for qemu-devel@nongnu.org; Sat, 06 Mar 2021 20:39:12 -0500
Received: by mail-pl1-x632.google.com with SMTP id j6so3235075plx.6
 for <qemu-devel@nongnu.org>; Sat, 06 Mar 2021 17:39:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Sc7rk8ettr+S9MN89G8+BM9vNRym8SS0hmYWdOi7p4w=;
 b=jRdoDb5eBA4KuGwJhwmBPMQfPG3SWWnGdFbePc5IFDwgJAysraD9rby/uyJOIpCUx/
 VL1Ov6tVC1/gVNyDPAbsl9o0gKg20k+fOzS5WLfGwTcLePqos5iKEPQVfd/KLDhjDt0N
 XNlReiRiTj6QhabhNU+mGxeozhrUf555sVEQ6Wi2FTFTHHeEZhZFaftmW2RhcHTaeMM7
 E8RsuHVeCNNufFzKZ4P0NA7J4oOn3wDo8jUHJ1w1GGCFACwJxXNsJ67yS3HB2DltxLZx
 IsoLTIQmTMlbw+46v8e7b/Jqfk6YarrFYm1LH3ZZ53BVyH/5L2PMs5pjooqqyHoJ+bsg
 5UZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Sc7rk8ettr+S9MN89G8+BM9vNRym8SS0hmYWdOi7p4w=;
 b=Dmb2bDeIH5G31lk+Dt3GTYA0d960+Pp+G4vfXwlbCcVq8jAOXf7Dcv2/q8odXimQwP
 fPSuI0TeNXGDeRT3v3R8m7Dp8gJ13hb+7/7TOxJu5RL7fb1SDYaXZicfGlQvJtgmnH1X
 DiG8vXIkkA0eeDw5adfl3AyK3WbaMOHU9UOGlNnpI0tl1vhnj/eaT4NwDSfMB0HUVv0S
 Gz//nnppXPVUeObpsrfuFMmvLsxVJuLk8xU73BY9hnk+88fv0lZH8Oi/RYRrveV6Qs0M
 UoAUOpI7uuwxfc6IkICHzU9j03DEgbCiuMFXg8zo0xxi6nteAPxSwgdnjzWGdainhLIg
 WjOQ==
X-Gm-Message-State: AOAM5303PcB4LiKofChE3qgsfe0rlW7EWilwTYkkaYj5B//BjY0uIkpS
 dSTQ9fMtT8dQU1bNQhV4F+HIT8AhLcsIow==
X-Google-Smtp-Source: ABdhPJxqF0DdE19WoAyICplllrWUTmvjHU94qFEaKNTMW+zitri2PIA9TO6HABjOfOU1UWTeNbzNSQ==
X-Received: by 2002:a17:90a:5914:: with SMTP id
 k20mr17623358pji.199.1615081149688; 
 Sat, 06 Mar 2021 17:39:09 -0800 (PST)
Received: from localhost.localdomain ([71.212.131.83])
 by smtp.gmail.com with ESMTPSA id v14sm6518044pju.19.2021.03.06.17.39.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 06 Mar 2021 17:39:09 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 3/3] target/hexagon/opcodes: Add missing varargs cleanup
Date: Sat,  6 Mar 2021 17:39:05 -0800
Message-Id: <20210307013905.115019-4-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210307013905.115019-1-richard.henderson@linaro.org>
References: <20210307013905.115019-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::632;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x632.google.com
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
Cc: peter.maydell@linaro.org, Taylor Simpson <tsimpson@quicinc.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Philippe Mathieu-Daudé <f4bug@amsat.org>

Fix a trivial incorrect usage of variable argument macros detected
by Coverity (missing_va_end: va_end was not called for ap).

Fixes: Coverity CID 1446720 (VARARGS)
Fixes: e3c00c2ed75 ("Hexagon (target/hexagon) opcode data structures")
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Tested-by: Taylor Simpson <tsimpson@quicinc.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Taylor Simpson <tsimpson@quicinc.com>
Message-Id: <20210223111253.2831285-1-f4bug@amsat.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/hexagon/opcodes.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/target/hexagon/opcodes.c b/target/hexagon/opcodes.c
index 4eef5fc40f..35d790cdd5 100644
--- a/target/hexagon/opcodes.c
+++ b/target/hexagon/opcodes.c
@@ -82,6 +82,7 @@ static void init_attribs(int tag, ...)
     while ((attr = va_arg(ap, int)) != 0) {
         set_bit(attr, opcode_attribs[tag]);
     }
+    va_end(ap);
 }
 
 const OpcodeEncoding opcode_encodings[] = {
-- 
2.25.1


