Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E3CB14854FB
	for <lists+qemu-devel@lfdr.de>; Wed,  5 Jan 2022 15:48:18 +0100 (CET)
Received: from localhost ([::1]:45060 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n57aM-0005Vq-0l
	for lists+qemu-devel@lfdr.de; Wed, 05 Jan 2022 09:48:18 -0500
Received: from eggs.gnu.org ([209.51.188.92]:56170)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1n574l-0001JE-CP
 for qemu-devel@nongnu.org; Wed, 05 Jan 2022 09:15:42 -0500
Received: from [2a00:1450:4864:20::435] (port=37820
 helo=mail-wr1-x435.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1n574a-00081y-6N
 for qemu-devel@nongnu.org; Wed, 05 Jan 2022 09:15:38 -0500
Received: by mail-wr1-x435.google.com with SMTP id t26so83298719wrb.4
 for <qemu-devel@nongnu.org>; Wed, 05 Jan 2022 06:15:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=9fEorODw0prngKGvWe8LjMgb7BbQnuD2gvb64lkzC/I=;
 b=atTKctJVxD4NIxljB55HWUPiYgQu3x80qGGIr6KfTrsV6EB50IJclAVkfqOXvMZnep
 n/XlTR4lo479PMgpuiUQw0Jdd5Ab+jAJbw4CEdJy9S5X82urDe4I8WoRoYb1TzXInlGG
 ArfJahz+11361T4y7kheFmvtRs3cPG/pGMVuaRpcRkCr0umcgALdiF9H9/9p9qJe9+2x
 75iRxbz8P1s9SqbuQ+PfJlOF5fzZfT9cQMjKpUmY/2EK/jd2bCvpYd4C2t/IFd5JvPMT
 JxIfypQ7r4cWht2mMxiTwtwTV1Cs/q8wjpirDqjSFsn0WYPqFFYRW3PvPAe5XesIF2JE
 +JXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=9fEorODw0prngKGvWe8LjMgb7BbQnuD2gvb64lkzC/I=;
 b=zBEcSv13OyfQ0ovvZnGrIgoVWygHUb061aMhBsGTMF5DTAiAJrf+Jq7xPCHpMOOHCw
 l78giCgaMtMpIivKTbzn7KFieTiyXrCbMjEj6dPdjnAhs3lmc22uPrMl6vwaGLJ5chHj
 wOW6k5smDMekAKuFaZFpcl6WCyFJjINRfMMcrnTf9guAk/LtnMsRLn6q/ivIExnJ7Wo9
 d3UZc4ZP6JpriVM5Nuli/XfWz0wOugxO7Q46Uff8BVdqZKUAdx06FfnCm/kwiS0b1uy/
 2BHI6Fzr1RI/k9dkdNYnUpDLM1tUw7d6O/nzM2bDzcXCYrl5FEuhJdFOUcSzKZ/Li7fz
 qzPg==
X-Gm-Message-State: AOAM530Af5OrdtFV3KFBcY0/+AEUs/Bwc+AwCscWQbhTHhSGaQpj7cAg
 Ut7w9DsNM+tKgp6L+L7I6JFEQg==
X-Google-Smtp-Source: ABdhPJxaalMo2c1dD3+QqhK+FebgtN510H3DeuIZpPH4KQLlP6gckf82C1qJsJ8sL/JHQDqNSe4eVQ==
X-Received: by 2002:a05:6000:389:: with SMTP id
 u9mr45304855wrf.22.1641392114578; 
 Wed, 05 Jan 2022 06:15:14 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id u3sm53205743wrs.0.2022.01.05.06.15.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 05 Jan 2022 06:15:13 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 7026C1FFD1;
 Wed,  5 Jan 2022 13:50:11 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH  v1 26/34] linux-user: don't adjust base of found hole
Date: Wed,  5 Jan 2022 13:50:01 +0000
Message-Id: <20220105135009.1584676-27-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220105135009.1584676-1-alex.bennee@linaro.org>
References: <20220105135009.1584676-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::435
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::435;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x435.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: fam@euphon.net, berrange@redhat.com,
 Richard Henderson <richard.henderson@linaro.org>, f4bug@amsat.org,
 Laurent Vivier <laurent@vivier.eu>, stefanha@redhat.com, crosa@redhat.com,
 pbonzini@redhat.com, =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 aurelien@aurel32.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The pgb_find_hole function goes to the trouble of taking account of
both mmap_min_addr and any offset we've applied to decide the starting
address of a potential hole. This is especially important for
emulating 32bit ARM in a 32bit build as we have applied the offset to
ensure there will be space to map the ARM_COMMPAGE bellow the main
guest map (using wrapped arithmetic).

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Resolves: https://gitlab.com/qemu-project/qemu/-/issues/690

---
v2
  - also make same adjustment to fallback
---
 linux-user/elfload.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/linux-user/elfload.c b/linux-user/elfload.c
index 238979b8b6..fa9dae5f3f 100644
--- a/linux-user/elfload.c
+++ b/linux-user/elfload.c
@@ -2293,8 +2293,7 @@ static uintptr_t pgb_find_hole(uintptr_t guest_loaddr, uintptr_t guest_size,
     brk = (uintptr_t)sbrk(0);
 
     if (!maps) {
-        ret = pgd_find_hole_fallback(guest_size, brk, align, offset);
-        return ret == -1 ? -1 : ret - guest_loaddr;
+        return pgd_find_hole_fallback(guest_size, brk, align, offset);
     }
 
     /* The first hole is before the first map entry. */
@@ -2334,7 +2333,7 @@ static uintptr_t pgb_find_hole(uintptr_t guest_loaddr, uintptr_t guest_size,
 
         /* Record the lowest successful match. */
         if (ret < 0) {
-            ret = align_start - guest_loaddr;
+            ret = align_start;
         }
         /* If this hole contains the identity map, select it. */
         if (align_start <= guest_loaddr &&
-- 
2.30.2


