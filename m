Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 25FE56063ED
	for <lists+qemu-devel@lfdr.de>; Thu, 20 Oct 2022 17:13:58 +0200 (CEST)
Received: from localhost ([::1]:57448 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1olXEz-0005Y1-TO
	for lists+qemu-devel@lfdr.de; Thu, 20 Oct 2022 11:13:50 -0400
Received: from [::1] (helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1olXAy-00016Q-RX
	for lists+qemu-devel@lfdr.de; Thu, 20 Oct 2022 11:09:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56706)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1olU67-0002e4-7m
 for qemu-devel@nongnu.org; Thu, 20 Oct 2022 07:52:30 -0400
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f]:40708)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1olU61-0000nW-2P
 for qemu-devel@nongnu.org; Thu, 20 Oct 2022 07:52:27 -0400
Received: by mail-wm1-x32f.google.com with SMTP id
 v130-20020a1cac88000000b003bcde03bd44so2108849wme.5
 for <qemu-devel@nongnu.org>; Thu, 20 Oct 2022 04:52:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=HYqxxXiV14D6A58Gw4d25+T/ktiHuabUrj5sliO8A0I=;
 b=sBJWsHdJAefeunO9qBfNgOyHyZCQdjFIbPX2fTZLhfiuL5AywXG3+TX2QnOOKvRtwl
 nJenMmgIe7gsSvcQta4/KN0SClxkggYuol8jxRtKecgazIemjE5lWZhK3cCEVlpcknMn
 NF/cfTsobj4ElmwgkmuA+fsVK4BEBNVS8VfBWcOcaXXrn+LLzvtqb+XG9T33rGBQ3+mb
 OTks9LFRi3tL88AmUeHtahBv+3+RBTPmSOospdoBLIXWqIVdd3+E6PSL1xaJNppoY46B
 FX/rBv8bTGUhcTnr1jmW1HoBGklv0u1tN2TS2GkmKSEo5J5yrOIPn3fKj85YIGU9Y4hY
 G8lA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=HYqxxXiV14D6A58Gw4d25+T/ktiHuabUrj5sliO8A0I=;
 b=EF3doexEsO87tzXy+tKc1U1JLvE2S+RSalaTeWTQIretIsGaW6kFkhaLLHq4mzgSI0
 b4BlR+VDK76+gi6MG/JCOyvB9sncATDgacG/j6ZiS54c69/g/9A5nHDxFDrF0sll/NjP
 y8hvEqURfQibQ+jVZwmKhiOYRTCXMyIDQube5OOfhSR3tqV0eRUhGE+f3EaK4Sc1V/PX
 xuZSadwBxhFJ6o9cGUvpiV+PiGHNr0D4EUbTxshwknwnzdZ8BAijgpTgVWRwXdAyjWpz
 QqUEtjFUgN9+gfviprML/9P4exZpTbtA53Ue/ldCbZA4uIRNq0tf3tfaAEWp/kWmohu2
 3+TA==
X-Gm-Message-State: ACrzQf0M/h66njtrVxeuKP0ITAqCcLU7tKnd79nhQSYp0MuM+6YY/Xvy
 7r1wG17aCJlEiFlAEnIvxcCRm2PoERiZhQ==
X-Google-Smtp-Source: AMsMyM6L8DBiob8NjvHaAc64eUyGMNwDoAFADE2/F9of6bV2D+nrmbhFXDQUsqGnJVq2dyU5EYVXVw==
X-Received: by 2002:a05:600c:1e87:b0:3c6:f1ff:40e4 with SMTP id
 be7-20020a05600c1e8700b003c6f1ff40e4mr17547693wmb.61.1666266738047; 
 Thu, 20 Oct 2022 04:52:18 -0700 (PDT)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 o18-20020adfcf12000000b0022a297950cesm16250422wrj.23.2022.10.20.04.52.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 Oct 2022 04:52:14 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id DD5C11FFB7;
 Thu, 20 Oct 2022 12:52:10 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: fam@euphon.net, berrange@redhat.com, f4bug@amsat.org, aurelien@aurel32.net,
 pbonzini@redhat.com, stefanha@redhat.com, crosa@redhat.com,
 Bin Meng <bin.meng@windriver.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [PATCH v3 09/26] semihosting/arm-compat-semi: Avoid using hardcoded
 /tmp
Date: Thu, 20 Oct 2022 12:51:52 +0100
Message-Id: <20221020115209.1761864-10-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221020115209.1761864-1-alex.bennee@linaro.org>
References: <20221020115209.1761864-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32f;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x32f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 T_SPF_TEMPERROR=0.01 autolearn=ham autolearn_force=no
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
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Message-Id: <20221006151927.2079583-2-bmeng.cn@gmail.com>
---
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


