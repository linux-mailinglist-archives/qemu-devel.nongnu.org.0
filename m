Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BFA47442CA1
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Nov 2021 12:32:42 +0100 (CET)
Received: from localhost ([::1]:58372 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mhs1x-0000oW-Tt
	for lists+qemu-devel@lfdr.de; Tue, 02 Nov 2021 07:32:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43524)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mhreG-0003rz-7Z
 for qemu-devel@nongnu.org; Tue, 02 Nov 2021 07:08:12 -0400
Received: from mail-qt1-x832.google.com ([2607:f8b0:4864:20::832]:45787)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mhre7-0000uL-Mi
 for qemu-devel@nongnu.org; Tue, 02 Nov 2021 07:08:11 -0400
Received: by mail-qt1-x832.google.com with SMTP id r2so17167972qtw.12
 for <qemu-devel@nongnu.org>; Tue, 02 Nov 2021 04:07:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=gSr02Sd1ztBN32tTKGrZscSunLegESBnCl09IIG3Qgg=;
 b=VJ2ke1kzAkaxTS6xs2wraGABWordnhsqftp9GzImfyUYZN4tTTSfOf1XcZps4TKSWq
 PhMkNy9o1u9Ghhx2Fqkx+Msn9J0nh9sApO83ftl/wmvhPfLELB9mTVH6tjVOxxIRwGw8
 4SzDmuq3VWvUAd2hlMwFQ/COcG6J07YLcgpMkeG1tP10VQCvLJn4rc5wu93hwcaAIijZ
 6fblbHbE2S0dqOX2crCZ73rQR3vNu3abaQ7qeQh1GbpZNbqN1zO/4Rr+hdPdKo1dv57a
 NRCfVp19rJvQW4AJRwKZZ5v8+7a28pcbk9iXnMNeTkZdzPb3abH4L0VX3GBaAsm+jgvI
 S5bA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=gSr02Sd1ztBN32tTKGrZscSunLegESBnCl09IIG3Qgg=;
 b=p0Wnd85U2TatbVqf1fwaHp8Ood0Ut/jvdNZZ41mUhsd1oabN6L32hRUnlE/2qyuOkB
 h8WZ8rhxZ3fG/S/Ln7SYUEaa+mHp2BrHq8VOVls0TOgwIOhfvn6sYL99gHZctfs/Hjov
 do4WxedB+gX5ujm82f/vmSriQ2wIws3o1rsJyewfSAQx7/R0NUI2QLC6JcbwCWtrW53M
 n9qKn7BD7NZ38h3UD7JsV9cw+TR2VnHFECC2J3M5zwwL0Oo3moQrubbOrmTppVjcRJCh
 NlHmBfR6Tb1vSrgsCTQkzcoT9aPDvn5UkBypeBWv21/J0XAXN4Gyy6kqnXPYSbLdoTS0
 O/oA==
X-Gm-Message-State: AOAM531MdGRLYc85JBzWk34HPx5/JbE88jo1NKW5mf57zgJiJsaIOgXa
 Y830U2AWOU/IjtbpsWITbGx9l1YLcs6A5Q==
X-Google-Smtp-Source: ABdhPJyrDRoK5DkUAhcei9ESdmItjl3ibww2MkFut4UBA8tOnDKAYtnWv9I8G4aAP/nEZG+HNOM6Jw==
X-Received: by 2002:a05:622a:1301:: with SMTP id
 v1mr12236710qtk.119.1635851271204; 
 Tue, 02 Nov 2021 04:07:51 -0700 (PDT)
Received: from localhost.localdomain (rrcs-172-254-253-57.nyc.biz.rr.com.
 [172.254.253.57])
 by smtp.gmail.com with ESMTPSA id bm7sm3568612qkb.86.2021.11.02.04.07.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Nov 2021 04:07:50 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 16/60] target/arm: Fixup comment re handle_cpu_signal
Date: Tue,  2 Nov 2021 07:06:56 -0400
Message-Id: <20211102110740.215699-17-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211102110740.215699-1-richard.henderson@linaro.org>
References: <20211102110740.215699-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::832;
 envelope-from=richard.henderson@linaro.org; helo=mail-qt1-x832.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Warner Losh <imp@bsdimp.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The named function no longer exists.
Refer to host_signal_handler instead.

Reviewed-by: Warner Losh <imp@bsdimp.com>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/sve_helper.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/target/arm/sve_helper.c b/target/arm/sve_helper.c
index dab5f1d1cd..07be55b7e1 100644
--- a/target/arm/sve_helper.c
+++ b/target/arm/sve_helper.c
@@ -6118,7 +6118,7 @@ DO_LDN_2(4, dd, MO_64)
  * linux-user/ in its get_user/put_user macros.
  *
  * TODO: Construct some helpers, written in assembly, that interact with
- * handle_cpu_signal to produce memory ops which can properly report errors
+ * host_signal_handler to produce memory ops which can properly report errors
  * without racing.
  */
 
-- 
2.25.1


