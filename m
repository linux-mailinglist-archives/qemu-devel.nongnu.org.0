Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D088A3907A6
	for <lists+qemu-devel@lfdr.de>; Tue, 25 May 2021 19:28:46 +0200 (CEST)
Received: from localhost ([::1]:40378 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1llarF-0003Zm-Tz
	for lists+qemu-devel@lfdr.de; Tue, 25 May 2021 13:28:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53682)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1llaBr-0007mM-4W
 for qemu-devel@nongnu.org; Tue, 25 May 2021 12:45:59 -0400
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d]:35441)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1llaBo-0002Ac-7C
 for qemu-devel@nongnu.org; Tue, 25 May 2021 12:45:58 -0400
Received: by mail-wm1-x32d.google.com with SMTP id
 z19-20020a7bc7d30000b029017521c1fb75so3884464wmk.0
 for <qemu-devel@nongnu.org>; Tue, 25 May 2021 09:45:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ZCZkSawTq/K1ESwNlFiwj94hkyAoVe2OoqNjqGGhrSA=;
 b=SV5wPCzKYfHZKJGnW/fTtNc+lUw8WRXKBcAOGtYCvIDnX7bB9z4pAPs1oVMyYzJ8eO
 6qQ2bF1Hqmb2gzfv/w6668c4WweomosDl5DeSXa+vw6Bn0lY37NXOYcdwcYRBEDbdIhg
 0JEBsDU+uWjQm6o0/xjucL6XgJL7fA+g4QW1htiHVRWNWtEaLZ70TPj+AA9pF8WKZuos
 pgqxPmR/cIM96pv2+GVP5xdVMsTB80dFNL/kKcLgdqfpCiuf7m08PauOxDZOlon1SiB8
 rGmc3plPk0CVY4LtvqWoQv/cQ383AQWbKO91rSS82m88kTM3gZTyNaQkH/ROCIHw213W
 1IBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ZCZkSawTq/K1ESwNlFiwj94hkyAoVe2OoqNjqGGhrSA=;
 b=Ob3ee/m+fovZPv/1rNIFaQ+Ufbf7nTpXnqaADFL2+mLGrpHSWRHu0XrC2QILWkThVW
 3RvghGPQFp0nDT6h6gs3XOllnGKeuGBZ1ccWBaI74Hnx9TeDW/Suguc7jtqW1QTrXkQj
 xTHF8GpFzkUnp9V9eba1t84K7/OzCc3Fz6S+6TlPq9QZ3QwdWV0LZGWZNRxc0vEfFZZu
 oCvyXTRh8lFrdW7DCRmUPIAb3Vz1tmr7AdoTAf3q7G1eWbCaxjlGKLHXYYz1QLZtPU+e
 yK9+QBfTzmcUoAHMXKLqVu7anELouYkw+NEGmOF/wivwT/JWs4WHYaGy7EpSbFp+mWsX
 92PA==
X-Gm-Message-State: AOAM531hnYPMl93B7U8hOqqBR6NH5tAokGmSveR9TLdnfYnKhhuFV4vp
 F05zOvhhdexSu0G8uiWYtw2VHw==
X-Google-Smtp-Source: ABdhPJwLBYPOTTATl/2YGNi+sKle5LSkD8mMxbiFdOhioCstCtQihmF748dKNDePOmjVH3PHmB1/8g==
X-Received: by 2002:a1c:7c03:: with SMTP id x3mr24838782wmc.122.1621961154424; 
 Tue, 25 May 2021 09:45:54 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id h9sm11621706wmb.35.2021.05.25.09.45.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 May 2021 09:45:53 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id AC4101FF7E;
 Tue, 25 May 2021 17:45:52 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH] accel/tcg: change default codegen buffer size for
 i386-softmmu
Date: Tue, 25 May 2021 17:45:41 +0100
Message-Id: <20210525164541.17985-1-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32d;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x32d.google.com
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
Cc: Richard Henderson <richard.henderson@linaro.org>,
 Thomas Huth <thuth@redhat.com>, 1896298@bugs.launchpad.net,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

There are two justifications for making this change. The first is that
i386 emulation is typically for smaller machines where having a 1gb of
generated code is overkill for basic emulation. The second is the
propensity of self-modifying code (c.f. Doom/edit) utilised on i386
systems can trigger a rapid growth in invalidated and re-translated
buffers. This is seen in bug #283. Execution is still inefficient but
at least the host memory isn't so aggressively used up.

That said it's still really just a sticking plaster for user
convenience.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Cc: Thomas Huth <thuth@redhat.com>
Cc: 1896298@bugs.launchpad.net
---
 accel/tcg/translate-all.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/accel/tcg/translate-all.c b/accel/tcg/translate-all.c
index 640ff6e3e7..f442165674 100644
--- a/accel/tcg/translate-all.c
+++ b/accel/tcg/translate-all.c
@@ -951,9 +951,13 @@ static void page_lock_pair(PageDesc **ret_p1, tb_page_addr_t phys1,
  * Users running large scale system emulation may want to tweak their
  * runtime setup via the tb-size control on the command line.
  */
+#ifdef TARGET_I386
+#define DEFAULT_CODE_GEN_BUFFER_SIZE_1 (32 * MiB)
+#else
 #define DEFAULT_CODE_GEN_BUFFER_SIZE_1 (1 * GiB)
 #endif
 #endif
+#endif
 
 #define DEFAULT_CODE_GEN_BUFFER_SIZE \
   (DEFAULT_CODE_GEN_BUFFER_SIZE_1 < MAX_CODE_GEN_BUFFER_SIZE \
-- 
2.20.1


