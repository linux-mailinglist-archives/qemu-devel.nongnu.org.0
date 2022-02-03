Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A05B4A7CA1
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Feb 2022 01:17:50 +0100 (CET)
Received: from localhost ([::1]:33032 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nFPoq-000737-Of
	for lists+qemu-devel@lfdr.de; Wed, 02 Feb 2022 19:17:48 -0500
Received: from eggs.gnu.org ([209.51.188.92]:59414)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nFPkF-0004yb-3k; Wed, 02 Feb 2022 19:13:06 -0500
Received: from [2607:f8b0:4864:20::42f] (port=45708
 helo=mail-pf1-x42f.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nFPkC-0002mY-Uu; Wed, 02 Feb 2022 19:13:02 -0500
Received: by mail-pf1-x42f.google.com with SMTP id c194so704102pfb.12;
 Wed, 02 Feb 2022 16:12:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=EjzXuL3y2YoFIdi+KNk9WA9Cbvp6HbkIQojwuARtcZY=;
 b=Rnw8kAV7fS457bvEtFHJGY/pj0sD4JfYo0akvQ/voL4DnR/WtggIo9qYKj4xMimk2o
 JQmRMobRb6E7MmdrjdQrgFX2e6pPUDObPq41zHt9NVJNocpZWb+I8lLqdWUmQUmtJBT1
 Ea4tV9bVwkhBUL6LbROh5PFYgVhx/cSLKPJZWDzAGQ4LAAURnqjDKd8EHoGIc+euW3t9
 lxTF/xG4d0ap14lZM97033olj1nwCzo6Mgb6y07bnPzFO2Ae0tw9o8jNLhiJ/WUowBE8
 9thyUBUfk5sXIfY2+9qP233c8LeBvYZLaY1uObznVxAXZnSH2IvnCcNrb1oOOP+xTYPK
 u4aQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=EjzXuL3y2YoFIdi+KNk9WA9Cbvp6HbkIQojwuARtcZY=;
 b=wjFPf+msoG4xqNBH/USgmP1nnMSoaD5ny7TGZK/TC89zDiM9limlepuDYdUftjmmNz
 gJkJc1yTJM9E97BY/Bs+ZntpeeoZGDDST0WbWUlFTuiMuTweZti9wxcIqsS5nCvj+N4r
 NDeQOqKvlUjyLpBeMECgXLNObxsNDPDvh7H1SUMhGQ75OlJL0+KRe4RWjO+OFgFlk6xI
 hRX50I9kNvzbFhJmJ+dNB9hyMSjPPG0BIivrtXal2Q4SUwoN9SUh2X6HRaH+H8pnqBdp
 S4VB44zxSQPyBkD61aD+LKk69B7Iqre3bO3MZPXinimVsEPMSZNCrtClqTbcwVxEgCRk
 I0Vw==
X-Gm-Message-State: AOAM533Pn0UCT89LRVhHL/WAM5BHR46BIyXYFibXz71kSdR7oI9kxT1O
 GU/uY+LJW+AfAgYkPijAUpYgnoXHnIg=
X-Google-Smtp-Source: ABdhPJxaKL5sVV0N1voNLJORX0I67VEojtfSgBitPzO9AHbRlTBH00t5XD/DfUoTNxjZg5QKWMsFaA==
X-Received: by 2002:a05:6a00:1914:: with SMTP id
 y20mr22852252pfi.41.1643847178306; 
 Wed, 02 Feb 2022 16:12:58 -0800 (PST)
Received: from localhost.localdomain (154.red-83-50-83.dynamicip.rima-tde.net.
 [83.50.83.154])
 by smtp.gmail.com with ESMTPSA id mp22sm7381028pjb.28.2022.02.02.16.12.56
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Wed, 02 Feb 2022 16:12:58 -0800 (PST)
To: qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org, Yoshinori Sato <ysato@users.sourceforge.jp>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Richard Henderson <richard.henderson@linaro.org>
Subject: [PATCH v2] target/rx: Remove unused ENV_OFFSET definition
Date: Thu,  3 Feb 2022 01:12:52 +0100
Message-Id: <20220203001252.37982-1-f4bug@amsat.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::42f
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::42f;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-pf1-x42f.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Reply-to:  =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
From:  =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= via <qemu-devel@nongnu.org>

The last use of ENV_OFFSET was removed in 5e1401969b
("cpu: Move icount_decr to CPUNegativeOffsetState");
the commit of target/rx came in just afterward.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Yoshinori Sato <ysato@users.sourceforge.jp>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 target/rx/cpu.h | 2 --
 1 file changed, 2 deletions(-)

diff --git a/target/rx/cpu.h b/target/rx/cpu.h
index 657db84ef0..58adf9edf6 100644
--- a/target/rx/cpu.h
+++ b/target/rx/cpu.h
@@ -116,8 +116,6 @@ struct RXCPU {
 
 typedef RXCPU ArchCPU;
 
-#define ENV_OFFSET offsetof(RXCPU, env)
-
 #define RX_CPU_TYPE_SUFFIX "-" TYPE_RX_CPU
 #define RX_CPU_TYPE_NAME(model) model RX_CPU_TYPE_SUFFIX
 #define CPU_RESOLVING_TYPE TYPE_RX_CPU
-- 
2.34.1


