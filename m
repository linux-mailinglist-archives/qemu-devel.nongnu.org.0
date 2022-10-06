Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 58A3F5F6A5E
	for <lists+qemu-devel@lfdr.de>; Thu,  6 Oct 2022 17:15:17 +0200 (CEST)
Received: from localhost ([::1]:59422 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ogSai-0008Q9-5L
	for lists+qemu-devel@lfdr.de; Thu, 06 Oct 2022 11:15:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57836)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1ogSXP-0002jI-Mu
 for qemu-devel@nongnu.org; Thu, 06 Oct 2022 11:11:51 -0400
Received: from mail-pg1-x531.google.com ([2607:f8b0:4864:20::531]:43704)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1ogSXM-0004Yh-4b
 for qemu-devel@nongnu.org; Thu, 06 Oct 2022 11:11:50 -0400
Received: by mail-pg1-x531.google.com with SMTP id a23so2104454pgi.10
 for <qemu-devel@nongnu.org>; Thu, 06 Oct 2022 08:11:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=RLZhLFQlc54ZoIwBF61gB7xfiWSNWDubi3/EBtm1pD4=;
 b=h8TAhedq6QL7BV+UjYNB227gHjBflLULoL5RhbffiuipiNlDzpFqIgGJsgWUlz4NLT
 OhJgYg/REiJEi0GpDDslmxa7L9f85C8LmUUtqmvCL34QbxCuOrNeubxTEEJR5ebGZEF7
 re/RY3c0wkyW63NgVgVfl5TkAmiTyJP4H4AAufj17p766CnQ4bQFI5HeTP/7w92u70wX
 andbDq/kFCwvPCFZh8S2WeppugPyzCrHXpW6YU8vNXUl0qKpMpQ+fJB2wafDq5/0UTQm
 BNI53d1qZbekb/PKpl2/mPfmWCIb/Olr6qrdLR7k6qllM8R2uRKMDWTvEiyfgnfZIsPB
 Q6Uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=RLZhLFQlc54ZoIwBF61gB7xfiWSNWDubi3/EBtm1pD4=;
 b=36+x9AcFfueivZlePXR01yx+YcdcJ1ddJ4HVXBd5OykjipFpsBHcE6r76kUm3Ga/Gq
 CUvzOslOuJD0lQPNmXEEA3eQfwxasdBfP+1d6RtsOPvfmd8ps+/27JILwN+65I2f5mOf
 8/1SMefjaaLl3GwhpQt11VFwAn6l2EPQ5KLx5Z84gMtszjIlzxap7YIGlGkFypX5LpvB
 m5qCTBXU8OG1DNEg7OV+cmaGbFpSePB1MPh69jN+IdQDoGhP8HIAVlhc0N9bLoOCqy0t
 Hlf9TFTopEmWCzYaTd9bJKLQqSrG/C9t3ZP1p+qe3RKX7riZ7BNSWvTsIp+vpGR+Llzz
 dltQ==
X-Gm-Message-State: ACrzQf1rNsBaWONKu/adm14+oB548CKum7JbLdnaJZQMxiiTCdzVZJ90
 9r32oIV42wHZJ3Ouo2Q3ODjNcr/0c4w=
X-Google-Smtp-Source: AMsMyM7KdUGJL1u43GiQbVswha2ZDEF7XfJKXM0bpXbA6aUcXE+h2HtHFqA2DGjt9KLsZI9L7AsAlA==
X-Received: by 2002:a63:d613:0:b0:45a:654:cf16 with SMTP id
 q19-20020a63d613000000b0045a0654cf16mr284281pgg.611.1665069106338; 
 Thu, 06 Oct 2022 08:11:46 -0700 (PDT)
Received: from ubuntu.. (144.168.56.201.16clouds.com. [144.168.56.201])
 by smtp.gmail.com with ESMTPSA id
 135-20020a62148d000000b00540c8ed61ddsm8589067pfu.150.2022.10.06.08.11.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 06 Oct 2022 08:11:45 -0700 (PDT)
From: Bin Meng <bmeng.cn@gmail.com>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Bin Meng <bin.meng@windriver.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [PATCH 01/18] semihosting/arm-compat-semi: Avoid using hardcoded /tmp
Date: Thu,  6 Oct 2022 23:11:18 +0800
Message-Id: <20221006151135.2078908-2-bmeng.cn@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221006151135.2078908-1-bmeng.cn@gmail.com>
References: <20221006151135.2078908-1-bmeng.cn@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::531;
 envelope-from=bmeng.cn@gmail.com; helo=mail-pg1-x531.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

From: Bin Meng <bin.meng@windriver.com>

Use g_get_tmp_dir() to get the directory to use for temporary files.

Signed-off-by: Bin Meng <bin.meng@windriver.com>
Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
---

(no changes since v1)

 semihosting/arm-compat-semi.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/semihosting/arm-compat-semi.c b/semihosting/arm-compat-semi.c
index bfea9e9337..62d8bae97f 100644
--- a/semihosting/arm-compat-semi.c
+++ b/semihosting/arm-compat-semi.c
@@ -503,7 +503,8 @@ void do_common_semihosting(CPUState *cs)
         GET_ARG(0);
         GET_ARG(1);
         GET_ARG(2);
-        len = asprintf(&s, "/tmp/qemu-%x%02x", getpid(), (int)arg1 & 0xff);
+        len = asprintf(&s, "%s/qemu-%x%02x", g_get_tmp_dir(),
+                       getpid(), (int)arg1 & 0xff);
         if (len < 0) {
             common_semi_set_ret(cs, -1);
             break;
-- 
2.34.1


