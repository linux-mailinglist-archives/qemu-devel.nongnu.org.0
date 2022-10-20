Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BEEE606481
	for <lists+qemu-devel@lfdr.de>; Thu, 20 Oct 2022 17:29:45 +0200 (CEST)
Received: from localhost ([::1]:55072 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1olXUG-0000Z1-GB
	for lists+qemu-devel@lfdr.de; Thu, 20 Oct 2022 11:29:43 -0400
Received: from [::1] (helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1olXN8-0002mU-Iy
	for lists+qemu-devel@lfdr.de; Thu, 20 Oct 2022 11:22:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59208)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1olUDc-0000en-AN
 for qemu-devel@nongnu.org; Thu, 20 Oct 2022 08:00:19 -0400
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334]:51817)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1olUDP-00051e-8J
 for qemu-devel@nongnu.org; Thu, 20 Oct 2022 08:00:06 -0400
Received: by mail-wm1-x334.google.com with SMTP id v11so4746022wmd.1
 for <qemu-devel@nongnu.org>; Thu, 20 Oct 2022 04:59:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=KbOoYrird1nsW/pAmizRbF6VSzex5qKXgg6ypuV+afo=;
 b=YPp4HJP/I/GfcRzoVGIlfVG5vyddKmNdirxW1UnYMrzpvCtWDGXIZweKLSR4uomCCH
 eiZwvaNUbLTz/EOe1Jt8ZLTvxQaFb00AbCAwjjVGQnLOVAr41TGn5mKD1HWuHQVQ6qtV
 Qo03NAF0QJ8THzjXS7qIkSg/AcEG9yyX1w8NuKUvqnRqVBWnBmB5L4iOepsjzeiaNSWq
 RSuKHan83Y4phTPR9otKVWkm1px7wb43+5QRBGYos8YqrIWLBolUogpOH8wpuJuzcWMG
 KaLfezoxN/6nGWLmYITs6pA2/xOtXxQt0byxsYWnbuy54Ho7mQDPNLOdbrAr3xfzdk1R
 YwTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=KbOoYrird1nsW/pAmizRbF6VSzex5qKXgg6ypuV+afo=;
 b=KNRv+4frn4j9COfnTrv1q3nxtrZLKea6DlZkQ9I+6GuEXTzDkx6kgKBsxGR0ZVnYvn
 uVfwkx42ZQdgbczmHPVd0RN9yZ+BpRN7nvlmiYzzifm0RS2yMxBLTAlTQrExi8CNJa40
 lzveZcUGMVYbb74AH1ysoDKy5dLXmt6tDxloOpXMMo+gN14g2Ag2rzb9pfnvDz2LOqRe
 rFS9BPl9hDhPWiiw3iUQ+VK1ZkqGNeqSx/hVBkZ6VeGfQYzQt7Wj2pUYSzIpQmiTtUGn
 RRDcT+cMHbAuXGbOZKwe82U9DXaK1DmMShHn2a9kl0axF4MwaQMqdKIoLRDNunhFJbAP
 J3eg==
X-Gm-Message-State: ACrzQf1E0MHg/32fS6yb9QHcnVcVbhHR4Z6v6j5hFvGI3Gjmv0FE21lg
 0O/0CHLX6vNhqvCwd6EvrBw7Eg==
X-Google-Smtp-Source: AMsMyM5KHIUpO5PzE1Ji5h6SYXjJo70NTfp//x2sBBQFJ5AS7WJCSSVmqS8x7V/pXDHidVgKgtAwiw==
X-Received: by 2002:a05:600c:474a:b0:3c6:ff33:9a38 with SMTP id
 w10-20020a05600c474a00b003c6ff339a38mr8427419wmo.92.1666267197753; 
 Thu, 20 Oct 2022 04:59:57 -0700 (PDT)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 p9-20020adfba89000000b0022a3a887ceasm16133788wrg.49.2022.10.20.04.59.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 Oct 2022 04:59:54 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 2F4171FFCD;
 Thu, 20 Oct 2022 12:52:12 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: fam@euphon.net, berrange@redhat.com, f4bug@amsat.org, aurelien@aurel32.net,
 pbonzini@redhat.com, stefanha@redhat.com, crosa@redhat.com,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 David Hildenbrand <david@redhat.com>, Cornelia Huck <cohuck@redhat.com>,
 Thomas Huth <thuth@redhat.com>,
 qemu-s390x@nongnu.org (open list:S390 TCG CPUs)
Subject: [PATCH  v3 23/26] target/s390x: don't use ld_code2 to probe next pc
Date: Thu, 20 Oct 2022 12:52:06 +0100
Message-Id: <20221020115209.1761864-24-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221020115209.1761864-1-alex.bennee@linaro.org>
References: <20221020115209.1761864-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::334;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x334.google.com
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This isn't an translator picking up an instruction so we shouldn't use
the translator_lduw function which has side effects for plugins.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 target/s390x/tcg/translate.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/target/s390x/tcg/translate.c b/target/s390x/tcg/translate.c
index 1d2dddab1c..f4de8efe3a 100644
--- a/target/s390x/tcg/translate.c
+++ b/target/s390x/tcg/translate.c
@@ -6612,7 +6612,7 @@ static void s390x_tr_insn_start(DisasContextBase *dcbase, CPUState *cs)
 static target_ulong get_next_pc(CPUS390XState *env, DisasContext *s,
                                 uint64_t pc)
 {
-    uint64_t insn = ld_code2(env, s, pc);
+    uint64_t insn = cpu_lduw_code(env, pc);
 
     return pc + get_ilen((insn >> 8) & 0xff);
 }
-- 
2.34.1


