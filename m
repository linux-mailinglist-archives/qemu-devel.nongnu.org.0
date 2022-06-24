Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 46AB2559D43
	for <lists+qemu-devel@lfdr.de>; Fri, 24 Jun 2022 17:28:09 +0200 (CEST)
Received: from localhost ([::1]:37012 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o4lE8-0004AP-Ba
	for lists+qemu-devel@lfdr.de; Fri, 24 Jun 2022 11:28:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58214)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shnusongshaobo@gmail.com>)
 id 1o4klJ-0004Xi-VD
 for qemu-devel@nongnu.org; Fri, 24 Jun 2022 10:58:21 -0400
Received: from mail-pf1-x42a.google.com ([2607:f8b0:4864:20::42a]:42537)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shnusongshaobo@gmail.com>)
 id 1o4klI-0001fL-HL
 for qemu-devel@nongnu.org; Fri, 24 Jun 2022 10:58:21 -0400
Received: by mail-pf1-x42a.google.com with SMTP id d17so2767047pfq.9
 for <qemu-devel@nongnu.org>; Fri, 24 Jun 2022 07:58:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=/jnw38i1BoankCAH24/WXvBWutYsgoIh/Gv+pel2Flg=;
 b=fD8gkDi0OU2/dLRD1F9MM8+cyIzoDBX/ckjNEKG6hMhs2k2JZPFn1ex4sakttGEwss
 LeJ1CLgFBwaErFMD6H8pM0lLN/vc0JbDi2xDXh8KklBC6rpQJHsEk9Dwa/dGOmX33KGU
 TrtRvzxGICpDLKrcrogmfe13sg26ACAiNde+11hC98xnlmV689C0HilWsmj7J9kWnRdG
 S3SbdA/sPvJ50i/nCqyZXrUrF/b+n2iGdSXJWGLRjekhdHicDyJCKutoHmkrGq+MxXjX
 jLnR/xjZRounFGmD/wxFaXtr9plQKwK5i83Jkf2Wpt6OmYFftEa0qJRB7bweoVkzeKdb
 Co3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=/jnw38i1BoankCAH24/WXvBWutYsgoIh/Gv+pel2Flg=;
 b=Ey1+COBiojy7fC/Bhc5qaXOcg8KEK3K2wPBKYSGtpGQTMjH3dVTDBpvb4Uq8F9IGfD
 7RDXuZgAL6loyfEdoP7x3kIvATm9bqzUX56SfHOLoNSh3FVJZHAEfG0m/vfr/keZ1hrd
 90J7BYLBsKTV/j8niu/eSk6hW/jt2WwAXKlWnOKtYjuM2O3MUiS3hU9A/T8wVZrdWLE1
 JvbcqLrVgXSIrAQ1WFyw/zoTP0VSHBNvq0Vyqu8/HYsLoT26hrpxeFxkMfdffhsJPFUg
 kMQab8j854HNJwNejKFFGWDp9Q5+UIks2EkOrfttQ2kJyPL2N+78L0BTcmrBHypDBKTt
 AMRw==
X-Gm-Message-State: AJIora8P/OUXbRyq1d9FwMig3WD496O11xg8qd1cgSMHAZ5a1mQtDeg7
 ORki6o0Qe5QdHCs5ZPEcHsT0FVfrsBSYSQ==
X-Google-Smtp-Source: AGRyM1sBxzY+VNpUodnfG46UJ41VkuycCQY6aBaW0fhNfnNCNnbsCofMdvWaeK1o0e86d9FZM87yiA==
X-Received: by 2002:aa7:870b:0:b0:522:c223:5c5e with SMTP id
 b11-20020aa7870b000000b00522c2235c5emr46298494pfo.6.1656082698525; 
 Fri, 24 Jun 2022 07:58:18 -0700 (PDT)
Received: from DESKTOP-VGAJ4S3.localdomain ([111.3.43.17])
 by smtp.gmail.com with ESMTPSA id
 g2-20020a170902934200b001624965d83bsm1896652plp.228.2022.06.24.07.58.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 Jun 2022 07:58:18 -0700 (PDT)
From: Shaobo Song <shnusongshaobo@gmail.com>
To: qemu-devel@nongnu.org
Cc: richard.henderson@linaro.org,
	Shaobo Song <shnusongshaobo@gmail.com>
Subject: [PATCH] This fixes a bug in POSIX-compliant environments. Since we
 had allocated a buffer named 'tcg-jit' with read-write access protections we
 need a int type to combine these access flags and return it,
 whereas we had inexplicably return a bool type. It may cause an unnecessary
 protection change in tcg_region_init().
Date: Fri, 24 Jun 2022 22:57:05 +0800
Message-Id: <20220624145705.3575-1-shnusongshaobo@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42a;
 envelope-from=shnusongshaobo@gmail.com; helo=mail-pf1-x42a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Fri, 24 Jun 2022 11:26:19 -0400
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


