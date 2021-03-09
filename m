Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 90B743329F1
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Mar 2021 16:15:09 +0100 (CET)
Received: from localhost ([::1]:51914 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lJe4i-0006t3-II
	for lists+qemu-devel@lfdr.de; Tue, 09 Mar 2021 10:15:08 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:49906)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lJdnP-0004ZC-GG
 for qemu-devel@nongnu.org; Tue, 09 Mar 2021 09:57:15 -0500
Received: from mail-ej1-x62b.google.com ([2a00:1450:4864:20::62b]:38235)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lJdnM-0002Qz-9P
 for qemu-devel@nongnu.org; Tue, 09 Mar 2021 09:57:15 -0500
Received: by mail-ej1-x62b.google.com with SMTP id mj10so28476495ejb.5
 for <qemu-devel@nongnu.org>; Tue, 09 Mar 2021 06:57:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=uKIJKMsw/r7XvCdaVtLJUnBMuj2jf66I2sYgK8saVig=;
 b=ambdDhCmaF9SKSTnhDkc/e82xNQxRCkiEDD4rg9X8TqmoyFRcrjzzamqGOUs6oPvW4
 pHNGwwAZswnHQIsBmw1scES9d7TWf5MFTdvRej680pQWYz4Uz3XzbSKrxpeSPr3/6Hzb
 CFdfSuq02nY4CYhL+Fbi475h50MBq9Z7Yxae9MxUZSfPSeUu4RkOl5G5okqWSlestOQU
 bVKln8fdXyz9WMB5wPufLFX+FQkGm18j8b3WbqOXkBTS7boOHoPYE+Oh47pzxdEBjOVm
 3vncbTEo+RLu7ZhzHCm7EO747eq5WUr8ypZhhgfqBaIKNvW3Kw/KFFIqI/WRBipIUdlq
 xxnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=uKIJKMsw/r7XvCdaVtLJUnBMuj2jf66I2sYgK8saVig=;
 b=K6TKG3xC35iPxPVPmWe1mEH0boQbSzCu16ks3DhjzdkDU9KqeDs3qckQ3tz/gfasDj
 s0UKshcnDTzEclzDcfvXEv62ydoVOC8KxJL8hUJADAn+9UvxmlzIb/p6eMBdhazv2BE8
 95DGsmt0qStsmuMLLgjD9ak1eOpSPy/cjmEA84AsP6N2kF5UX8ht6OH3JEB4UX35xQum
 JJUx8/ztnTofHVDuaW5SkIYMSXNC8mncr2fl4CY6h/kUOmfJ0egqws37RDYsY1M8UzB+
 QUgn7SzHdUyQ3ll0Xd9OvHRRG4SYweUixloDXsNwXECp0dFbg6GJOj/t1Hs3eG1Tc9CM
 oAzQ==
X-Gm-Message-State: AOAM5304jkHOV6Xg7iFpd/W48msfeCM5hQpP1mZIpaSWvZCHIA4W7w9N
 wkONQghxVxdRWGIcK2D905QTP+kRXWI=
X-Google-Smtp-Source: ABdhPJwpMLJ9r+LHtiDQ+eqJZSi1Atr++SL02vWSIEuRc8Qj1M3JFxs7VqBVlQXp03IsFZu57SdqmQ==
X-Received: by 2002:a17:906:cd05:: with SMTP id
 oz5mr21149057ejb.345.1615301830755; 
 Tue, 09 Mar 2021 06:57:10 -0800 (PST)
Received: from x1w.redhat.com (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id p19sm9424103edr.57.2021.03.09.06.57.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 Mar 2021 06:57:10 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH v2 03/22] target/mips/translate: Make gen_rdhwr() public
Date: Tue,  9 Mar 2021 15:56:34 +0100
Message-Id: <20210309145653.743937-4-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210309145653.743937-1-f4bug@amsat.org>
References: <20210309145653.743937-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::62b;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-ej1-x62b.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Fredrik Noring <noring@nocrew.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

We will use gen_rdhwr() outside of translate.c, make it public.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20210214175912.732946-28-f4bug@amsat.org>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 target/mips/translate.h | 2 ++
 target/mips/translate.c | 2 +-
 2 files changed, 3 insertions(+), 1 deletion(-)

diff --git a/target/mips/translate.h b/target/mips/translate.h
index e4f2f26de89..2b3c7a69ec6 100644
--- a/target/mips/translate.h
+++ b/target/mips/translate.h
@@ -148,6 +148,8 @@ void gen_op_addr_add(DisasContext *ctx, TCGv ret, TCGv arg0, TCGv arg1);
 bool gen_lsa(DisasContext *ctx, int rd, int rt, int rs, int sa);
 bool gen_dlsa(DisasContext *ctx, int rd, int rt, int rs, int sa);
 
+void gen_rdhwr(DisasContext *ctx, int rt, int rd, int sel);
+
 extern TCGv cpu_gpr[32], cpu_PC;
 #if defined(TARGET_MIPS64)
 extern TCGv_i64 cpu_gpr_hi[32];
diff --git a/target/mips/translate.c b/target/mips/translate.c
index 0131affce70..0f77c0ebc57 100644
--- a/target/mips/translate.c
+++ b/target/mips/translate.c
@@ -12349,7 +12349,7 @@ static void gen_flt3_arith(DisasContext *ctx, uint32_t opc,
     }
 }
 
-static void gen_rdhwr(DisasContext *ctx, int rt, int rd, int sel)
+void gen_rdhwr(DisasContext *ctx, int rt, int rd, int sel)
 {
     TCGv t0;
 
-- 
2.26.2


